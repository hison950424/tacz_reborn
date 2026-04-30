# ==========================================
# 檔案: init.mcfunction
# 目的: 初始化伺服器規則與商店變數
# ==========================================

# --- 新增常數與時間變數 ---
scoreboard objectives add dom_const dummy "常數"
scoreboard players set #20 dom_const 20
scoreboard players set #45 dom_const 45
scoreboard players set #60 dom_const 60
scoreboard players set #100 dom_const 100
scoreboard players set #-1 dom_const -1
scoreboard objectives add dom_math dummy "數學運算用"
scoreboard objectives add dummy dummy "運算用"
#殺一個人20元
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

#全體血量為100hp
execute at @a run attribute @s minecraft:generic.max_health base set 100
effect give @a minecraft:instant_health 1 125

# 1. 遊戲狀態
scoreboard objectives add game_state dummy "Game State"
scoreboard players set #global game_state 0
#團隊死鬥擊殺數
scoreboard players set #target_score tdm_config 100

scoreboard players set #time_limit_sec tdm_config 600

#佔點模式擊殺數
scoreboard players set #target_score dom_config 1000

scoreboard players set #time_limit_sec dom_config 600

# class_type: 職業種類 (0=未選擇, 1=突擊兵...)
scoreboard objectives add class_type dummy "Class"

# 2. 商店互動變數
# shop_buy: 接收玩家點擊書本的訊號
scoreboard objectives add shop_buy trigger "Shop Action"
# shop_balance: 後台計算機，用來在買東西瞬間暫存玩家的 GD656 分數以判斷餘額
scoreboard objectives add shop_balance dummy "Shop Balance"

# 3. 伺服器規則防護
gamerule commandBlockOutput false
#詳細指令(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)(記得改)
gamerule sendCommandFeedback true
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule keepInventory true

# 4. 隊伍系統初始化 (Team Setup)
team add red "紅隊"
team add blue "藍隊"
team add green "綠隊"
team add white "白隊"
team add solo1 "孤狼"
team add solo2 "孤狼"
team add solo3 "孤狼"
team add solo4 "孤狼"
team add solo5 "孤狼"
team add solo6 "孤狼"
team add solo7 "孤狼"
team add solo8 "孤狼"
team add solo9 "孤狼"
team add solo10 "孤狼"
team add solo11 "孤狼"
team add solo12 "孤狼"
team add solo13 "孤狼"
team add solo14 "孤狼"
team add solo15 "孤狼"
team add solo16 "孤狼"

team modify red color red
team modify blue color blue
team modify green color green
team modify white color white
team modify solo1 color gray
team modify solo2 color gray
team modify solo3 color gray
team modify solo4 color gray
team modify solo5 color gray
team modify solo6 color gray
team modify solo7 color gray
team modify solo8 color gray
team modify solo9 color gray
team modify solo10 color gray
team modify solo11 color gray
team modify solo12 color gray
team modify solo13 color gray
team modify solo14 color gray
team modify solo15 color gray
team modify solo16 color gray

team modify red friendlyFire false
team modify blue friendlyFire false
team modify green friendlyFire false
team modify white friendlyFire false
team modify solo1 friendlyFire true
team modify solo2 friendlyFire true
team modify solo3 friendlyFire true
team modify solo4 friendlyFire true
team modify solo5 friendlyFire true
team modify solo6 friendlyFire true
team modify solo7 friendlyFire true
team modify solo8 friendlyFire true
team modify solo9 friendlyFire true
team modify solo10 friendlyFire true
team modify solo11 friendlyFire true
team modify solo12 friendlyFire true
team modify solo13 friendlyFire true
team modify solo14 friendlyFire true
team modify solo15 friendlyFire true
team modify solo16 friendlyFire true

team modify red seeFriendlyInvisibles true
team modify blue seeFriendlyInvisibles true
team modify green seeFriendlyInvisibles true
team modify white seeFriendlyInvisibles true
team modify solo1 seeFriendlyInvisibles false
team modify solo2 seeFriendlyInvisibles false
team modify solo3 seeFriendlyInvisibles false
team modify solo4 seeFriendlyInvisibles false
team modify solo5 seeFriendlyInvisibles false
team modify solo6 seeFriendlyInvisibles false
team modify solo7 seeFriendlyInvisibles false
team modify solo8 seeFriendlyInvisibles false
team modify solo9 seeFriendlyInvisibles false
team modify solo10 seeFriendlyInvisibles false
team modify solo11 seeFriendlyInvisibles false
team modify solo12 seeFriendlyInvisibles false
team modify solo13 seeFriendlyInvisibles false
team modify solo14 seeFriendlyInvisibles false
team modify solo15 seeFriendlyInvisibles false
team modify solo16 seeFriendlyInvisibles false

team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams
team modify green nametagVisibility hideForOtherTeams
team modify white nametagVisibility hideForOtherTeams
team modify solo1 nametagVisibility never
team modify solo2 nametagVisibility never
team modify solo3 nametagVisibility never
team modify solo4 nametagVisibility never
team modify solo5 nametagVisibility never
team modify solo6 nametagVisibility never
team modify solo7 nametagVisibility never
team modify solo8 nametagVisibility never
team modify solo9 nametagVisibility never
team modify solo10 nametagVisibility never
team modify solo11 nametagVisibility never
team modify solo12 nametagVisibility never
team modify solo13 nametagVisibility never
team modify solo14 nametagVisibility never
team modify solo15 nametagVisibility never
team modify solo16 nametagVisibility never


# 5. 大廳控制台變數
# select_mode: 接收房主點擊指令書的訊號 (1=大逃殺, 2=軍備競賽)
scoreboard objectives add select_mode trigger "Select Mode"

# 6. 職業與觸發器變數
scoreboard objectives add class_type dummy "Class"
scoreboard objectives add select_mode trigger "Mode Selection"
# select_class: 給所有玩家點擊職業書本用的觸發器
scoreboard objectives add select_class trigger "Class Selection"

# --- 基地多層級 UI 變數  預選職業暫存 --- 
scoreboard objectives add base_menu trigger "Base Menu"
scoreboard objectives add transit_action trigger "Transit Action"
scoreboard objectives add switch_class trigger "Switch Class"
scoreboard objectives add pending_class dummy "Pending Class"

# --- 歷史偵測變數 ---
# 儲存上一秒的助攻數以計算差值
scoreboard objectives add assist_prev dummy "Assist Prev"
# 儲存上一秒的擊殺數以計算差值
scoreboard objectives add kill_prev dummy "Kill Prev"
# 儲存上一秒的死亡以計算差值
scoreboard objectives add death_prev dummy "Death Prev"
# 儲存上一秒的血量以計算差值 追蹤玩家的真實血量，用於判斷是否已經按下重生按鈕
scoreboard objectives add p_health health "Player Health"

# --- 重生緩衝計時器 ---
scoreboard objectives add respawn_timer dummy "Respawn Timer"

# 用於紀錄 TDM 隊伍總擊殺與勝利門檻
scoreboard objectives add team_score dummy "Team Score"

# --- 兵種設定 ---
# 1=自由人, 2=突擊兵, 3=支援兵, 4=哨兵
scoreboard objectives add class_type dummy "Class"

tellraw @a {"text":"[系統] 已初始化。","color":"green"}

# 讓 FTB Quests 判斷玩家現在有沒有站在基地裡
scoreboard objectives add in_base_score dummy "In Base Score"

# 補齊底層變數宣告
scoreboard objectives add arms_sub_mode dummy "子模式"

# 商店價格計算用變數
scoreboard objectives add shop_price dummy "商店計算用價格"

# 用於偵測哨兵蹲下的時間
scoreboard objectives add sneak_tracker minecraft.custom:minecraft.sneak_time

#計算槍枝數量
scoreboard objectives add gun_count dummy "玩家身上槍枝數量"

#隊伍系統
scoreboard objectives add join_team trigger "加入隊伍"
scoreboard objectives add admin_team_ctrl trigger "管理員隊伍控制"
scoreboard objectives add temp_score dummy "系統暫存"

#該死的商店左鍵系統
scoreboard objectives add shop_trigger dummy "商店觸發器"
scoreboard objectives add temp dummy "商店與系統用的暫存計分板"

# ==========================================
# 新增: TDM 動態設定變數與觸發器 (請加入 init.mcfunction)
# ==========================================

# 1. 建立儲存 TDM 設定值的記分板
scoreboard objectives add tdm_config dummy "TDM 設定值"
# execute unless score #target_score tdm_config matches 1.. run scoreboard players set #target_score tdm_config 100
# execute unless score #time_limit_sec tdm_config matches 1.. run scoreboard players set #time_limit_sec tdm_config 600


# 3. 建立點擊書本用的觸發器 (Trigger)
scoreboard objectives add btn_score_up trigger
scoreboard objectives add btn_score_dn trigger
scoreboard objectives add btn_time_up trigger
scoreboard objectives add btn_time_dn trigger

# ==========================================
# 檔案: init.mcfunction (或 load.mcfunction)
# 說明: 佔領模式 (Domination) 變數與 UI 初始化
# ==========================================

# 2. 建立儲存 DOM (佔點模式) 設定值的記分板
scoreboard objectives add dom_config dummy "DOM 設定值"
# execute unless score #target_score dom_config matches 1.. run scoreboard players set #dom_target_score dom_config 1000
# execute unless score #time_limit dom_config matches 1.. run scoreboard players set #dom_time_limit dom_config 600

# --- 1. 據點進度計分板 ---
# 用來記錄 +120 (紅方) 到 -120 (藍方) 的推動進度
scoreboard objectives add dom_prog_a dummy "A點進度"
scoreboard objectives add dom_prog_b dummy "B點進度"
scoreboard objectives add dom_prog_c dummy "C點進度"


# 1. 註冊休戰計時器
scoreboard objectives add dom_truce_timer dummy "休戰倒數(Ticks)"
# 2. 強制賦予初始值 (防止 operation 運算時因 null 報錯)
scoreboard players set #Point_a dom_truce_timer 0
scoreboard players set #Point_b dom_truce_timer 0
scoreboard players set #Point_c dom_truce_timer 0

# --- 2. 據點狀態計分板 ---
# 定義: 0=鎖定(未開放), 1=中立(金磚), 2=紅方佔領, 3=藍方佔領
scoreboard objectives add dom_state dummy "據點狀態"

# --- 3. 隊伍總分與遊戲計時器 ---
scoreboard objectives add dom_score dummy "佔領隊伍總分"
scoreboard objectives add dom_timer dummy "佔領模式計時(Tick)"
scoreboard objectives add dom_arms_timer dummy "佔領模式計時(s)"

# --- 4. Bossbar 初始化 (全域狀態條) ---
# --- 擴增 Bossbar ---
# bossbar remove game_core:dom_hud
bossbar add game_core:dom_hud_a {"text":"[A點] 🔒 尚未開放","color":"gray"}
bossbar add game_core:dom_hud_b {"text":"[B點] 🔒 尚未開放","color":"gray"}
bossbar add game_core:dom_hud_c {"text":"[C點] 🔒 尚未開放","color":"gray"}
bossbar set game_core:dom_hud_a max 45
bossbar set game_core:dom_hud_b max 45
bossbar set game_core:dom_hud_c max 45
bossbar set game_core:dom_hud_a visible false
bossbar set game_core:dom_hud_b visible false
bossbar set game_core:dom_hud_c visible false


# ==========================================
# 檔案: init.mcfunction (或 load.mcfunction)
# 說明: 大逃殺br (Battle Royale) 變數與 UI 初始化
# ==========================================
#清除玩家身上關於大逃殺的 Tag
tag @a remove br_setup
tag @a remove br_downed
tag @a remove has_slime
tag @a remove br_eliminated
# 復活標籤洗掉
tag @a remove br_used_altar
tag @a remove near_altar

#清除玩家身上關於大逃殺的記分板
scoreboard players set @a gd656killicon.death 0
scoreboard players set @a vanilla_death 0
scoreboard players set @a death_prev 0
scoreboard players reset @a br_id
scoreboard players reset @a team_id
#強制將全伺服器玩家的生死狀態洗白為 1 (存活)
scoreboard players set @a br_death_state 1

#清除關於大逃殺的實體
#玩家倒地位置追蹤器
kill @e[type=marker,tag=br_tracker]
#倒地標籤
kill @e[type=villager,tag=br_downed_mob]
#史萊姆
kill @e[type=marker,tag=br_soul_marker]
#玩家屍體
kill @e[type=corpse:corpse]
scoreboard objectives add br_death_state dummy "生死狀態機"
#存活計數器 (供勝利判定使用)
scoreboard objectives add br_sys dummy "大逃殺存活計數器"
#大逃殺全域計時器
scoreboard objectives add br_timer dummy "大逃殺全域計時器"
scoreboard objectives add br_id dummy "大逃殺玩家專屬ID"
scoreboard players set #global_id br_sys 0
scoreboard objectives add sneak_time minecraft.custom:minecraft.sneak_time "蹲下時間"
scoreboard objectives add revive_progress dummy "救援進度(Ticks)"
scoreboard objectives add revive_pct dummy "救援進度(%)"

# 設定常數 2，用於把 200 Ticks 換算成 100%
scoreboard players set #2 br_sys 2
scoreboard objectives add team_id dummy "隊伍數字ID"
scoreboard objectives add br_health health "玩家即時血量"
scoreboard objectives add br_slime_hp dummy "史萊姆血量暫存"
scoreboard objectives add vanilla_death deathCount "原版死亡偵測"
scoreboard objectives add br_max_hp dummy "血量上限暫存"

scoreboard objectives add br_map dummy "BR 地圖選擇"
scoreboard objectives add br_phase dummy "BR 子階段 (1=空投, 2=戰鬥)"
scoreboard objectives add br_map_pick trigger "BR 地圖選擇觸發器"
scoreboard players set #global br_map 1
scoreboard players set #global br_phase 0
scoreboard objectives add slime_alive dummy "史萊姆存活確認"
scoreboard objectives add is_reviving dummy "是否正在被救援"
scoreboard objectives add target_id dummy "正在救援的目標ID"
scoreboard objectives add rescuer_id dummy "救人者的流水號"

scoreboard objectives add altar_cd dummy "祭壇冷卻(Tick)"
scoreboard objectives add altar_cd_sec dummy "祭壇冷卻(秒)"
scoreboard objectives add altar_progress dummy "祭壇讀條"
scoreboard objectives add altar_pct dummy "祭壇進度百分比"
#觀戰系統
scoreboard objectives add spectate_idx dummy "當前觀看索引"
scoreboard objectives add sys_index dummy "系統分配流水號"
scoreboard objectives add watching_team dummy "復仇觀看隊伍"
scoreboard objectives add spectate_cd dummy "觀戰切換冷卻"
scoreboard objectives add jump_time dummy "跳傘寬限計時"

scoreboard objectives add rand_val dummy "隨機數暫存"

#背包系統
scoreboard objectives add backpack_level dummy
data modify storage backpack:temp item set value {}

#放置木桶
scoreboard objectives add drop_stick minecraft.dropped:minecraft.stick
scoreboard objectives add drop_eye minecraft.dropped:minecraft.ender_eye
scoreboard objectives add drop_barrier minecraft.dropped:minecraft.barrier

#=============================================
#=========         縮圈系統         ===========
#=============================================
# 全域狀態
scoreboard players set #br_phase dummy -1
scoreboard players set #br_timer dummy 0
scoreboard players set #br_tick20 dummy 0

# 地圖圓心座標
scoreboard players set #br_cx dummy 0
scoreboard players set #br_cz dummy 0

# 預算圓心（Phase 0 計算後填入）
scoreboard players set #br_p2cx dummy 0
scoreboard players set #br_p2cz dummy 0
scoreboard players set #br_p4cx dummy 0
scoreboard players set #br_p4cz dummy 0
scoreboard players set #br_p6cx dummy 0
scoreboard players set #br_p6cz dummy 0

# 平滑移動（毫格座標與步進）
scoreboard players set #br_cxm dummy 0
scoreboard players set #br_czm dummy 0
scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

# 常數
scoreboard players set #br_c1000 dummy 1000

# 動態縮圈 tick 數（供步進除法使用，每個縮圈 phase 開始時依地圖 set）
scoreboard players set #br_pticks dummy 0

# 空頭系統
scoreboard players set #br_airdrop_delay dummy -1
scoreboard players set #air_x dummy 0
scoreboard players set #air_z dummy 0


function game_core:system/match_reset
function game_core:system/game_end

