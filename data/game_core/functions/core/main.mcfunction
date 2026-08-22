# ==========================================
# 檔案: main.mcfunction
# 目的: 每秒執行20次的主路由器 (Router)
# ==========================================



# 狀態 1 (大逃殺): 執行大逃殺專屬邏輯
execute if score #global game_state matches 1 run function game_core:gamemode/br/main_tick
#大逃殺模式中途加入者轉為觀察者模式
execute if score #global game_state matches 1 unless entity @s[tag=br_setup] run gamemode spectator @s

# 狀態 2 (軍備競賽): 執行軍備競賽專屬邏輯
execute if score #global game_state matches 2 run function game_core:gamemode/arms_race/tick

# 管理員在 game_state=2 時可重啟遊戲（match_reset 後重新開始）
execute if score #global game_state matches 2 run scoreboard players enable @a[tag=admin] select_mode
execute as @a[scores={select_mode=5},tag=admin] if score #global game_state matches 2 run function game_core:core/match_reset
execute as @a[scores={select_mode=5},tag=admin] if score #global game_state matches 2 run function game_core:gamemode/arms_race/start
execute if score #global game_state matches 2 run scoreboard players set @a[scores={select_mode=5},tag=admin] select_mode 0

execute as @a[scores={select_mode=12},tag=admin] if score #global game_state matches 2 run function game_core:core/match_reset
execute as @a[scores={select_mode=12},tag=admin] if score #global game_state matches 2 run function game_core:gamemode/gk/start
execute if score #global game_state matches 2 run scoreboard players set @a[scores={select_mode=12},tag=admin] select_mode 0

# 狀態 0 (大廳): 執行大廳待機邏輯
#強制將沒有隊伍的玩家加入孤狼
execute if score #global game_state matches 0 as @a[team=,sort=random,limit=1] run scoreboard players set @s join_team 5
execute if score #global game_state matches 0 as @a[team=,sort=random,limit=1] run scoreboard players add @s rp_score 0

#執行大廳待機邏輯
execute if score #global game_state matches 0 run function game_core:lobby/tick





execute if score #global game_state matches 0 as @a run function game_core:dev/dev_input_tick