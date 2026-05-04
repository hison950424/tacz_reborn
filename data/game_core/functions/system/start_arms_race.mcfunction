# ==========================================
# 檔案: start_arms_race.mcfunction
# 目的: 總控台 - 處理遊戲開局的所有初始化、分隊與傳送
# 觸發: 管理員在大廳點擊「強制開始遊戲」書本時
# ==========================================

# ------------------------------------------
# [步驟 1] 狀態防呆與廣播
# ------------------------------------------
# 說明: 確保只有在「大廳狀態 (0)」時才能執行，防止遊戲中途被誤觸重啟。
# 同時向全伺服器廣播遊戲即將開始的訊息。
execute if score #global game_state matches 0 run tellraw @a {"text":"[系統] 啟動軍備競賽，進行資料初始化與裝備發放...","color":"yellow"}

#把所有人改成冒險模式
gamemode adventure @a
#防噴
gamerule keepInventory true

# ------------------------------------------
# [步驟 2] 經濟與分數徹底重置 (初始化)
# ------------------------------------------

# 說明: 清空所有玩家上一局累積的金錢、擊殺與助攻數據，確保公平開局。
# 重置 GD656 模組的底層分數 (金錢) 為 1 
gd656killicon server statistics set score @a 0
gd656killicon server statistics set assist @a 0
gd656killicon server statistics set death @a 0
gd656killicon server statistics set kill @a 0

# gd656killicon server statistics set score @a 0
# gd656killicon server statistics set assist @a 0
# gd656killicon server statistics set death @a 0
# gd656killicon server statistics set kill @a 0

# 重置minecraft內建與GD656同步的分數與計時器
scoreboard players set @a gd656killicon.score 0
scoreboard players set @a gd656killicon.assist 0
scoreboard players set @a gd656killicon.death 0
scoreboard players set @a gd656killicon.kill 0
scoreboard players set #arms_race_score_debug dummy 0
scoreboard players set @a respawn_timer -1
scoreboard players set @a death_prev 0
scoreboard players set @a kill_prev 0
# [轉帳系統防呆] 強制關閉並清理所有轉帳狀態與金額
tag @a remove transfer_active
tag @a remove transfer_target
scoreboard players set @a transfer_val 0


# 不能設為 0，因為我們用 < shop_price 來判定餘額不足，所以必須保留一點初始值，剛好有BUG會讓自由人開局時多5元，那就讓不是自由人的玩家也加5元，確保平衡
gd656killicon server statistics add score @a 5

# 重置歷史偵測變數
execute if score #global game_state matches 0 run scoreboard players set @a assist_prev 0
execute if score #global game_state matches 0 run scoreboard players set @a kill_prev 0

# 清除所有人的基地標籤，確保傳送後能重新領書
execute if score #global game_state matches 0 run tag @a remove in_base

# ------------------------------------------
# [步驟 3] 隊伍清洗與發牌器自動平衡
# ------------------------------------------
# 說明: 將不在正規編制內(綠隊、白隊、孤狼隊)的玩家踢出隊伍，
# 然後呼叫我們寫好的自動平衡程式，把無隊伍玩家平均分發到紅藍兩隊。
execute if score #global game_state matches 0 as @a[team=green] run tag @s add solo
execute if score #global game_state matches 0 as @a[team=white] run tag @s add solo
execute if score #global game_state matches 0 run tellraw @a[sort=random,tag=solo] {"text":"[系統] 你已被強制分配隊伍！","color":"red"}
execute if score #global game_state matches 0 run execute store result score #team_turn temp_score run random value 1..2
execute if score #global game_state matches 0 run execute as @a[sort=random,tag=solo] run function game_core:system/random_team_2
execute if score #global game_state matches 0 run tag @a remove solo

# ------------------------------------------
# [步驟 4] 收回大廳選單與防呆機制
# ------------------------------------------
# 說明: 清空所有人的背包，把大廳用的「職業選擇書」收走，確保帶不進戰場。
execute if score #global game_state matches 0 run clear @a
# 說明: 如果有人在大廳掛機忘記選職業(class_type=0)，系統強制將他分配為「自由人(1)」。
execute if score #global game_state matches 0 as @a[scores={class_type=0}] run tellraw @s {"text":"[系統] 未選擇職業，強制分配為 自由人。","color":"red"}
execute if score #global game_state matches 0 as @a[scores={class_type=0}] run scoreboard players set @s class_type 1

# ------------------------------------------
# [步驟 5] 發放職業專屬屬性與裝備
# ------------------------------------------
# 說明: 讓全伺服器玩家各自執行一次 apply_class 腳本。
# 系統會根據他們的 class_type 自動賦予 80/100 血量、給予手槍與對應投擲物。
execute if score #global game_state matches 0 as @a run function game_core:class/apply_class
execute if score #global game_state matches 0 as @a run function game_core:class/give_starter_gear
execute if score #global game_state matches 0 as @a run function game_core:class/reset_throwables
execute if score #global game_state matches 0 as @a run function game_core:class/give_ammo_box

# --- 同步 TDM 與 DOM 的隊伍 ID (Team ID) ---
# 說明: BR 以外的模式原生缺乏 team_id，在此處強制同步，以利後續轉帳等同隊判定。
execute if score #global game_state matches 0 as @a[team=red] run scoreboard players set @s team_id 1
execute if score #global game_state matches 0 as @a[team=blue] run scoreboard players set @s team_id 2

# 1. 動態綁定死亡重生點 (讓玩家死亡後在 Marker 處復活)
execute if score #global game_state matches 0 at @e[type=marker,tag=red_spawn,limit=1] run spawnpoint @a[team=red] ~ ~ ~
execute if score #global game_state matches 0 at @e[type=marker,tag=blue_spawn,limit=1] run spawnpoint @a[team=blue] ~ ~ ~

# 2. 開局第一次傳送 (將玩家從大廳拉進戰場 Marker)
execute if score #global game_state matches 0 run tp @a[team=red] @e[type=marker,tag=red_spawn,limit=1]
execute if score #global game_state matches 0 run tp @a[team=blue] @e[type=marker,tag=blue_spawn,limit=1]
# 說明: 將全局狀態改為 2 (軍備競賽進行中)，正式啟動助攻監控與被動技能維持迴圈。
execute if score #global game_state matches 0 run scoreboard players set #global game_state 2
# 若當前模式為 TDM (arms_sub_mode = 1)，則啟動 TDM 專屬 UI
execute if score #global arms_sub_mode matches 1 run function game_core:gamemode/tdm_ui_init

# ==========================================
# TDM 計時器初始化與對與擊殺數初始化
# ==========================================
# 如果是 TDM 模式，則設定 20 Ticks = 1 秒的底層計數器
execute if score #global arms_sub_mode matches 1 run scoreboard players set #tick_counter tdm_config 20
# 將設定的總秒數，繼承給當前遊戲計時器
execute if score #global arms_sub_mode matches 1 run scoreboard players operation #current_time tdm_config = #time_limit_sec tdm_config
# 初始化雙方擊殺數為 0
execute if score #global arms_sub_mode matches 1 run scoreboard players set #red_team team_score 0
execute if score #global arms_sub_mode matches 1 run scoreboard players set #blue_team team_score 0


# ------------------------------------------
# 2. 據點佔領模式 (Domination) 專屬初始化
#    條件: 當 #global arms_sub_mode 為 2 時執行
# ------------------------------------------

#重製總得分
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Red dom_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Blue dom_score 0

# [重置據點進度] (全部小寫化)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_a dom_prog_a 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_b dom_prog_b 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_c dom_prog_c 0

# [初始化據點狀態] 全部設為 0 (鎖定/鐵磚)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_a dom_state 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_b dom_state 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_c dom_state 0

# 2. 強制賦予初始值 (防止 operation 運算時因 null 報錯)
scoreboard players set #Point_a dom_truce_timer 0
scoreboard players set #Point_b dom_truce_timer 0
scoreboard players set #Point_c dom_truce_timer 0

# [重置隨機開放次數與計時器]
# execute if score #global arms_sub_mode matches 2 run scoreboard players set #global dom_unlocked_count 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #global dom_arms_timer 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #100tick dom_timer 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #global dom_timer 0

# [鋪設初始地板] 全部刷成鐵磚
execute if score #global arms_sub_mode matches 2 run fill 196 24 -13 188 24 -21 minecraft:iron_block replace
execute if score #global arms_sub_mode matches 2 run fill 166 13 -53 156 13 -43 minecraft:iron_block replace
execute if score #global arms_sub_mode matches 2 run fill 130 13 -79 115 13 -94 minecraft:iron_block replace

# [啟動佔領模式 Bossbar]
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_a visible true
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_a players @a
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_b visible true
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_b players @a
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_c visible true
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_c players @a

#啟動佔領模式的側邊欄 UI 與初始化
execute if score #global arms_sub_mode matches 2 run function game_core:gamemode/dom_ui_init

# ------------------------------------------
# 4. 正式開啟遊戲 Tick 迴圈
# ------------------------------------------

# 設定遊戲執行標記為 1 (開始跑 arms_race_tick 或 dom_tick)
# scoreboard players set #global game_running 1
# 重置遊戲計時器
scoreboard players set #global dom_timer 0

# 全域廣播
execute if score #global arms_sub_mode matches 1 run tellraw @a {"text":"[系統] 團隊死鬥正式開始！","color":"red","bold":true}
execute if score #global arms_sub_mode matches 2 run tellraw @a {"text":"[系統] 佔點模式正式開始！30秒後搶奪地圖上的目標！","color":"gold","bold":true}
execute at @a run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 0.5


#調整分數倍率:
# #殺一個人10元
# gd656killicon server bonus edit ASSIST expression 0.1
# gd656killicon server bonus edit BRAVE_RETURN expression 5
# gd656killicon server bonus edit DESPERATE_COUNTERATTACK expression 5
# gd656killicon server bonus edit INTERRUPTED_STREAK expression 5
# gd656killicon server bonus edit KILL expression 0.1
# gd656killicon server bonus edit KILL_COMBO expression 1
# gd656killicon server bonus edit KILL_EXPLOSION expression 0.1
# gd656killicon server bonus edit KILL_HEADSHOT expression 0.1
# gd656killicon server bonus edit POTATO_AIM expression 5
# gd656killicon server bonus edit SLAY_THE_LEADER expression 10

# #使用軍備競賽專用擊殺旗幟(廢棄，無法使用mcfunction呼叫)
# gd656killicon client preset choose 00001

#[佔點]殺一個人15元 bug1
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit ASSIST expression 0.15
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit BRAVE_RETURN expression 7
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit DESPERATE_COUNTERATTACK expression 7
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit INTERRUPTED_STREAK expression 7
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL expression 0.15
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL_COMBO expression 1.5
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL_EXPLOSION expression 0.15
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL_HEADSHOT expression 0.15
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit POTATO_AIM expression 7
execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit SLAY_THE_LEADER expression 15

# #[佔點]殺一個人15元 bug2
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit ASSIST expression 0.15
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit BRAVE_RETURN expression 7
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit DESPERATE_COUNTERATTACK expression 7
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit INTERRUPTED_STREAK expression 7
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL expression 0.19
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL_COMBO expression 1.5
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL_EXPLOSION expression 0.19
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit KILL_HEADSHOT expression 0.19
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit POTATO_AIM expression 7
# execute if score #global arms_sub_mode matches 2 run gd656killicon server bonus edit SLAY_THE_LEADER expression 15

#[死鬥]殺一個人20元 bug1
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit ASSIST expression 0.2
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit BRAVE_RETURN expression 10
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit DESPERATE_COUNTERATTACK expression 10
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit INTERRUPTED_STREAK expression 10
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL expression 0.2
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL_COMBO expression 2
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL_EXPLOSION expression 0.2
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL_HEADSHOT expression 0.2
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit POTATO_AIM expression 10
execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit SLAY_THE_LEADER expression 20

# #[死鬥]殺一個人20元 bug2
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit ASSIST expression 0.2
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit BRAVE_RETURN expression 10
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit DESPERATE_COUNTERATTACK expression 10
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit INTERRUPTED_STREAK expression 10
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL expression 0.25
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL_COMBO expression 2
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL_EXPLOSION expression 0.25
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit KILL_HEADSHOT expression 0.25
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit POTATO_AIM expression 10
# execute if score #global arms_sub_mode matches 1 run gd656killicon server bonus edit SLAY_THE_LEADER expression 20

