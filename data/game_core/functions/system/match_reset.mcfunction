# ==========================================
# 檔案: system/match_reset.mcfunction
# 說明: 結束遊戲，重置所有狀態與背包，返回大廳
# ==========================================

# ==========================================
# [BR 模式] 清理所有部署相關狀態
# ==========================================
tag @a remove soul_picked
tag @a remove check_wipe
tag @a remove cause_void
tag @a remove cause_wipe
tag @a remove cause_solo
tag @a remove br_deploying
tag @a remove br_on_cart
tag @a remove br_jumped
tag @a remove br_setup
tag @a remove br_downed
tag @a remove has_slime
tag @a remove br_eliminated
tag @a remove near_altar
tag @a remove has_used_altar_temp
# 復活標籤洗掉
tag @a remove br_used_altar
kill @e[type=marker,tag=br_tracker]
kill @e[type=marker,tag=br_soul_marker]
kill @e[type=villager,tag=br_downed_mob]
kill @e[type=marker,tag=br_dropship]
kill @e[type=corpse:corpse]
kill @e[type=item]
scoreboard players set #global br_phase 0
#強制將全伺服器玩家的生死狀態洗白為 1 (存活)
scoreboard players set @a br_death_state 1
scoreboard players set @a altar_progress 0
scoreboard players set @a revive_progress 0

#靈魂祭壇CD重置
execute as @e[type=text_display,tag=br_altar] run scoreboard players set @s altar_cd 0

# 1. 狀態機重置 (切換回大廳模式)
scoreboard players set #global game_state 0

# [團隊死鬥]關閉側邊欄顯示，並徹底移除該計分板
scoreboard objectives setdisplay sidebar
scoreboard objectives remove tdm_display

# [佔點模式] 重置據點進度
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_a dom_prog_a 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_b dom_prog_b 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_c dom_prog_c 0

# [佔點模式][初始化據點狀態] 全部設為 0 (鎖定/鐵磚)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_a dom_state 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_b dom_state 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #Point_c dom_state 0

# [佔點模式]2. 強制賦予初始值 (防止 operation 運算時因 null 報錯)
scoreboard players set #Point_a dom_truce_timer 0
scoreboard players set #Point_b dom_truce_timer 0
scoreboard players set #Point_c dom_truce_timer 0

# [佔點模式][重置隨機開放次數與計時器]
# execute if score #global arms_sub_mode matches 2 run scoreboard players set #global dom_arms_timer 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #100tick dom_timer 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #global dom_timer 0

# [佔點模式][鋪設初始地板] 全部刷成鐵磚
execute if score #global arms_sub_mode matches 2 run fill 196 24 -13 188 24 -21 minecraft:iron_block replace
execute if score #global arms_sub_mode matches 2 run fill 166 13 -53 156 13 -43 minecraft:iron_block replace
execute if score #global arms_sub_mode matches 2 run fill 130 13 -79 115 13 -94 minecraft:iron_block replace

# [佔點模式][關閉佔領模式 Bossbar]
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_a visible false
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_a players @a
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_b visible false
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_b players @a
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_c visible false
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_c players @a


# 2. 玩家狀態與背包清理
clear @a
experience set @a 0 levels
scoreboard players set @a class_type 0
scoreboard players set @a in_base_score 0

# # 3. 插件/個人分數重置 (清理 gd656killicon 紀錄)
# execute as @a run gd656killicon server statistics set score @s 0
# execute as @a run gd656killicon server statistics set assist @s 0
# execute as @a run gd656killicon server statistics set death @s 0
# execute as @a run gd656killicon server statistics set kill @s 0
# scoreboard players set @a gd656killicon.score 0
# scoreboard players set @a gd656killicon.assist 0
# scoreboard players set @a gd656killicon.death 0
# scoreboard players set @a gd656killicon.kill 0

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

# 共享箱重製 
data modify block 219 14 -2 Items set from block -1 14 20 Items
data modify block 219 14 -3 Items set from block -1 14 20 Items
data modify block 219 14 -6 Items set from block -1 14 20 Items
data modify block 219 14 -7 Items set from block -1 14 20 Items
data modify block 219 14 -10 Items set from block -1 14 20 Items
data modify block 219 14 -11 Items set from block -1 14 20 Items
data modify block 219 14 -16 Items set from block -1 14 20 Items
data modify block 219 14 -17 Items set from block -1 14 20 Items
data modify block 219 14 -20 Items set from block -1 14 20 Items
data modify block 219 14 -21 Items set from block -1 14 20 Items
data modify block 219 14 -24 Items set from block -1 14 20 Items
data modify block 219 14 -25 Items set from block -1 14 20 Items
data modify block 219 14 -31 Items set from block -1 14 20 Items
data modify block 219 14 -32 Items set from block -1 14 20 Items
data modify block 219 14 -35 Items set from block -1 14 20 Items
data modify block 219 14 -36 Items set from block -1 14 20 Items
data modify block 219 14 -39 Items set from block -1 14 20 Items
data modify block 219 14 -40 Items set from block -1 14 20 Items
data modify block 219 14 -46 Items set from block -1 14 20 Items
data modify block 219 14 -47 Items set from block -1 14 20 Items
data modify block 219 14 -50 Items set from block -1 14 20 Items
data modify block 219 14 -51 Items set from block -1 14 20 Items
data modify block 219 14 -54 Items set from block -1 14 20 Items
data modify block 219 14 -55 Items set from block -1 14 20 Items
data modify block 219 14 -61 Items set from block -1 14 20 Items
data modify block 219 14 -62 Items set from block -1 14 20 Items
data modify block 219 14 -65 Items set from block -1 14 20 Items
data modify block 219 14 -66 Items set from block -1 14 20 Items
data modify block 219 14 -69 Items set from block -1 14 20 Items
data modify block 219 14 -70 Items set from block -1 14 20 Items
data modify block 219 14 -76 Items set from block -1 14 20 Items
data modify block 219 14 -77 Items set from block -1 14 20 Items
data modify block 219 14 -80 Items set from block -1 14 20 Items
data modify block 219 14 -81 Items set from block -1 14 20 Items
data modify block 219 14 -84 Items set from block -1 14 20 Items
data modify block 219 14 -85 Items set from block -1 14 20 Items
data modify block 219 14 -91 Items set from block -1 14 20 Items
data modify block 219 14 -92 Items set from block -1 14 20 Items
data modify block 219 14 -95 Items set from block -1 14 20 Items
data modify block 219 14 -96 Items set from block -1 14 20 Items
data modify block 219 14 -99 Items set from block -1 14 20 Items
data modify block 219 14 -100 Items set from block -1 14 20 Items
data modify block 219 14 -106 Items set from block -1 14 20 Items
data modify block 219 14 -107 Items set from block -1 14 20 Items
data modify block 219 14 -110 Items set from block -1 14 20 Items
data modify block 219 14 -111 Items set from block -1 14 20 Items
data modify block 219 14 -114 Items set from block -1 14 20 Items
data modify block 219 14 -115 Items set from block -1 14 20 Items


# 5. 清理地圖掉落物
# ⚠️ 注意: 這裡使用了 tag=arena_center，你需要在大廳以外的戰鬥區域中心放置一個帶有此標籤的 Marker 實體
# execute at @e[type=marker,tag=arena_center] run kill @e[type=item,distance=..150]

# 強制清空所有木桶與視覺模型
# 1. 殺死所有視覺模型
kill @e[type=item_display,tag=loot_display]

# 2. 精準清理剛才那張地圖的木桶
execute as @e[type=marker,tag=active_loot] at @s run setblock ~ ~ ~ air replace
kill @e[type=item]

# 3. 撕掉啟動標籤，讓所有 marker 進入休眠狀態，等待下一局喚醒
tag @e[type=marker,tag=active_loot] remove active_loot

# 6. 傳送回大廳
# ⚠️ 注意: 這裡使用了 tag=lobby_spawn_point，請在大廳放置一個對應的 Marker，取代絕對座標
tp @a @e[type=marker,tag=lobby_spawn_point,limit=1]

# 7. 補滿血量、給予狀態
effect clear @a
execute as @a run attribute @s minecraft:generic.max_health base set 100
effect give @a minecraft:instant_health 3 50 true
# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true

# 1. 將所有管理員切換為創造模式
clear @a written_book
gamemode adventure @a
execute as @a[tag=admin] run gamemode creative @s

#重設所有玩家重生點在大廳
spawnpoint @a -4 32 -1

#隊伍名稱不可見
team modify blue nametagVisibility hideForOtherTeams
team modify red nametagVisibility hideForOtherTeams
team modify green nametagVisibility hideForOtherTeams
team modify white nametagVisibility hideForOtherTeams
team modify solo nametagVisibility never

# 2. 給予一般玩家「隊伍選擇書」
execute as @a[tag=!admin] run give @s written_book{title:"隊伍選擇",author:"系統",pages:['{"text":" ==== 選擇隊伍 ====\\n\\n","color":"dark_purple","bold":true,"extra":[{"text":"[▶ 加入 紅隊 ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 1"}},{"text":"[▶ 加入 藍隊 ]\\n\\n","color":"blue","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 2"}},{"text":"[▶ 加入 白隊 ]\\n\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 3"}},{"text":"[▶ 加入 綠隊 ]\\n\\n","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 4"}},{"text":"[▶ 成為 孤狼 ]\\n","color":"dark_gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 5"}}]}']} 1
# 3. 給予管理員模式選擇書、隊伍選擇書 Plus
execute as @a[tag=admin] run give @s written_book{title:"模式選擇書",author:"系統",pages:['{"text":" ==== 模式選擇 ====\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"[▶ 大逃殺模式]\\n\\n","color":"dark_gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 1"}},{"text":"[▶ 軍備競賽模式]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 2"}}]}']} 1

execute as @a[tag=admin] run give @s written_book{title:"隊伍選擇 Plus",author:"系統",pages:['{"text":" == 選擇隊伍 ==\\n","color":"dark_purple","bold":true,"extra":[{"text":"[紅] ","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 1"}},{"text":"[藍] ","color":"blue","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 2"}},{"text":"[白] ","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 3"}},{"text":"[綠] ","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 4"}},{"text":"[孤狼]\\n\\n","color":"dark_gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger join_team set 5"}},{"text":" == 管理員控制 ==\\n","color":"dark_red","bold":true},{"text":"[隨機雙分隊 (紅/藍)]\\n","color":"gold","bold":false,"clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 1"}},{"text":"[隨機三分隊 (紅/藍/白)]\\n","color":"gold","bold":false,"clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 2"}},{"text":"[隨機四分隊 (全)]\\n\\n","color":"gold","bold":false,"clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 3"}},{"text":"[沒收玩家隊伍書]\\n","color":"dark_gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 4"}}]}']} 1


#隱藏bossbar
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_a visible false
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_b visible false
execute if score #global arms_sub_mode matches 2 run bossbar set game_core:dom_hud_c visible false


scoreboard players set @a death_prev 0