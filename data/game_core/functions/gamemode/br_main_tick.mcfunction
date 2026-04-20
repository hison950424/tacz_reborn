# ==========================================
# 檔案: gamemode/br_main_tick.mcfunction
# 屬性: 大逃殺主路由 (每 Tick 執行)
# ==========================================

# ==========================================
# --- [全域實體清理防護網] ---
# ==========================================
# 瞬間銷毀所有被玩家丟出、掉在世界上的地圖集實體，徹底杜絕洗頻與伺服器卡頓！
kill @e[type=item,nbt={Item:{id:"map_atlases:atlas"}}]

# --- [A] 重置存活計數器 (供勝利判定使用) ---
# 每 Tick 歸零，交由底下的 player_tick 重新統計，避免 O(N) 效能炸裂
scoreboard players set #br_alive_red br_sys 0
scoreboard players set #br_alive_blue br_sys 0
scoreboard players set #br_alive_green br_sys 0
scoreboard players set #br_alive_white br_sys 0
scoreboard players set #br_alive_solo br_sys 0

# 站立戰力計數器 (排除倒地者)
scoreboard players set #br_stand_red br_sys 0
scoreboard players set #br_stand_blue br_sys 0
scoreboard players set #br_stand_green br_sys 0
scoreboard players set #br_stand_white br_sys 0

# --- [B] Phase 路由分發 ---
# Phase 0 (等待倒數)：5 秒倒數計時，結束後呼叫 br_deploy_start 啟動空投
execute if score #global br_phase matches 0 run function game_core:gamemode/br_countdown_tick

# Phase 1 (空投部署)：執行空投機移動、跟隨、著陸偵測等邏輯
execute if score #global br_phase matches 1 run function game_core:gamemode/br_deploy_tick

# Phase 1 & 2 (共通邏輯)：執行玩家生死判定、救援、旁觀切換等完整邏輯
# 先清除所有村民上一 Tick 的救援標記，保證所有玩家看到的狀態同步
execute if score #global br_phase matches 1..2 as @e[type=villager,tag=br_downed_mob] run tag @s remove being_revived

execute if score #global br_phase matches 1..2 as @a at @s run function game_core:gamemode/br_player_tick
execute if score #global br_phase matches 1..2 as @e[type=villager,tag=br_downed_mob] at @s run function game_core:gamemode/br_downed_tick

# 重置全體玩家的蹲下時間，確保只有「持續按住」才會增加
scoreboard players set @a sneak_time 0

# --- [C] 全域計時器 ---
# 維持 20 Ticks = 1 秒的循環，供祭壇、流血等系統使用
scoreboard players add #global br_timer 1
# 執行靈魂標籤的視覺特效
execute if score #global br_phase matches 1..2 if score #global br_timer matches 20 as @e[type=marker,tag=br_soul_marker] at @s run function game_core:gamemode/br_soul_tick
#靈魂祭壇
execute as @e[type=text_display,tag=br_altar] run function game_core:gamemode/br_altar_tick



execute if score #global br_timer matches 20.. run scoreboard players set #global br_timer 0


# ==========================================
# --- [D] 隊伍滅團與靈魂清空系統 ---
# ==========================================
# 1. 【滅團核心判定】只要隊伍中「狀態 1」人數為 0，強制將所有「狀態 2 與 3」轉入「狀態 4」！
execute if score #global br_phase matches 2 if score #br_stand_red br_sys matches 0 as @a[team=red,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4
execute if score #global br_phase matches 2 if score #br_stand_blue br_sys matches 0 as @a[team=blue,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4
execute if score #global br_phase matches 2 if score #br_stand_green br_sys matches 0 as @a[team=green,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4
execute if score #global br_phase matches 2 if score #br_stand_white br_sys matches 0 as @a[team=white,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4

# 2. 【靈魂大掃除】(防呆機制)
execute if score #global br_phase matches 2 if score #br_alive_red br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=1}]
execute if score #global br_phase matches 2 if score #br_alive_blue br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=2}]
execute if score #global br_phase matches 2 if score #br_alive_green br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=3}]
execute if score #global br_phase matches 2 if score #br_alive_white br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=4}]