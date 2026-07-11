# Phase 6：停頓期
# 一般模式: map2/4/5=1分(1200) map1=1.5分(1800) map3=1.5分(1800)
# 快速模式: map2/4/5=0.5分(600) map1=0.75分(900) map3=0.75分(900)
scoreboard players set #br_phase dummy 6

execute if score #global br_fast_mode matches 0 if score #global br_map matches 2 run scoreboard players set #br_timer dummy 1200
execute if score #global br_fast_mode matches 0 if score #global br_map matches 4 run scoreboard players set #br_timer dummy 1200
execute if score #global br_fast_mode matches 0 if score #global br_map matches 5 run scoreboard players set #br_timer dummy 1200
execute if score #global br_fast_mode matches 0 if score #global br_map matches 1 run scoreboard players set #br_timer dummy 1800
execute if score #global br_fast_mode matches 0 if score #global br_map matches 3 run scoreboard players set #br_timer dummy 1800
execute if score #global br_fast_mode matches 1 if score #global br_map matches 2 run scoreboard players set #br_timer dummy 600
execute if score #global br_fast_mode matches 1 if score #global br_map matches 4 run scoreboard players set #br_timer dummy 600
execute if score #global br_fast_mode matches 1 if score #global br_map matches 5 run scoreboard players set #br_timer dummy 600
execute if score #global br_fast_mode matches 1 if score #global br_map matches 1 run scoreboard players set #br_timer dummy 900
execute if score #global br_fast_mode matches 1 if score #global br_map matches 3 run scoreboard players set #br_timer dummy 900

scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

# 精確補正至 p6
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p6cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p6cz dummy
execute at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

scoreboard players operation #br_cxm dummy = #br_p6cx dummy
scoreboard players operation #br_cxm dummy *= #br_c1000 dummy
scoreboard players operation #br_czm dummy = #br_p6cz dummy
scoreboard players operation #br_czm dummy *= #br_c1000 dummy
scoreboard players operation #br_cx dummy = #br_p6cx dummy
scoreboard players operation #br_cz dummy = #br_p6cz dummy

kill @e[type=minecraft:marker,tag=br_next]

# ── 公告（快速模式顯示「第二次」，一般模式顯示「第三次」）──
execute if score #global br_fast_mode matches 0 if score #global br_map matches 2 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第三次縮圈完畢， 1 分鐘後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 4 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第三次縮圈完畢， 1 分鐘後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 5 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第三次縮圈完畢， 1 分鐘後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第三次縮圈完畢， 1 分 30 秒後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 3 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第三次縮圈完畢， 1 分 30 秒後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 2 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第二次縮圈完畢， 30 秒後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 4 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第二次縮圈完畢， 30 秒後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 5 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第二次縮圈完畢， 30 秒後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第二次縮圈完畢， 45 秒後進入決賽縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 3 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"第二次縮圈完畢， 45 秒後進入決賽縮圈。","color":"white"}]
