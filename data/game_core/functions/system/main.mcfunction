# ==========================================
# 檔案: main.mcfunction
# 目的: 每秒執行20次的主路由器 (Router)
# ==========================================



# 狀態 1 (大逃殺): 執行大逃殺專屬邏輯 (目前為空，未來擴充)
execute if score #global game_state matches 1 run function game_core:gamemode/br_main_tick

# 狀態 2 (軍備競賽): 執行軍備競賽專屬邏輯
execute if score #global game_state matches 2 run function game_core:system/arms_race_tick

# 狀態 0 (大廳): 執行大廳待機邏輯
#強制將沒有隊伍的玩家加入孤狼
execute if score #global game_state matches 0 as @a[team=,sort=random,limit=1] run scoreboard players set @s join_team 5

#執行大廳待機邏輯
execute if score #global game_state matches 0 run function game_core:system/lobby_tick



execute if score #global game_state matches 0 as @a run function game_core:dev/dev_input_tick