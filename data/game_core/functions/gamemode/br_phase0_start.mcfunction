# Phase 0：準備期
# map2/4/5=4分(4800) map1=5分(6000) map3=6分(7200)
scoreboard players set #br_phase dummy 0

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 4800
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 4800
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 4800
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 6000
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 7200

# 清理舊 marker
kill @e[type=minecraft:marker,tag=br_center]
kill @e[type=minecraft:marker,tag=br_calc]
kill @e[type=minecraft:marker,tag=br_next]

# ── 預算 p2：從地圖中心 spread ──
execute if score #global br_map matches 1 run summon minecraft:marker 0 64 0 {Tags:["br_calc","p2_calc"]}
execute if score #global br_map matches 1 run spreadplayers 0 0 0 172 false @e[type=minecraft:marker,tag=p2_calc]
execute if score #global br_map matches 2 run summon minecraft:marker -5306 64 308 {Tags:["br_calc","p2_calc"]}
execute if score #global br_map matches 2 run spreadplayers -5306 308 0 131 false @e[type=minecraft:marker,tag=p2_calc]
execute if score #global br_map matches 3 run summon minecraft:marker -86 64 5037 {Tags:["br_calc","p2_calc"]}
execute if score #global br_map matches 3 run spreadplayers -86 5037 0 195 false @e[type=minecraft:marker,tag=p2_calc]
execute if score #global br_map matches 4 run summon minecraft:marker 5002 64 4 {Tags:["br_calc","p2_calc"]}
execute if score #global br_map matches 4 run spreadplayers 5002 4 0 131 false @e[type=minecraft:marker,tag=p2_calc]
execute if score #global br_map matches 5 run summon minecraft:marker -4 64 -5001 {Tags:["br_calc","p2_calc"]}
execute if score #global br_map matches 5 run spreadplayers -4 -5001 0 131 false @e[type=minecraft:marker,tag=p2_calc]

execute as @e[type=minecraft:marker,tag=p2_calc,limit=1] store result score #br_p2cx dummy run data get entity @s Pos[0] 1
execute as @e[type=minecraft:marker,tag=p2_calc,limit=1] store result score #br_p2cz dummy run data get entity @s Pos[2] 1

# ── 預算 p4：從 p2 spread ──
execute at @e[type=minecraft:marker,tag=p2_calc,limit=1] run summon minecraft:marker ~ ~ ~ {Tags:["br_calc","p4_calc"]}
execute at @e[type=minecraft:marker,tag=p2_calc,limit=1] if score #global br_map matches 1 run spreadplayers ~ ~ 0 90 false @e[type=minecraft:marker,tag=p4_calc]
execute at @e[type=minecraft:marker,tag=p2_calc,limit=1] if score #global br_map matches 2 run spreadplayers ~ ~ 0 67 false @e[type=minecraft:marker,tag=p4_calc]
execute at @e[type=minecraft:marker,tag=p2_calc,limit=1] if score #global br_map matches 3 run spreadplayers ~ ~ 0 101 false @e[type=minecraft:marker,tag=p4_calc]
execute at @e[type=minecraft:marker,tag=p2_calc,limit=1] if score #global br_map matches 4 run spreadplayers ~ ~ 0 67 false @e[type=minecraft:marker,tag=p4_calc]
execute at @e[type=minecraft:marker,tag=p2_calc,limit=1] if score #global br_map matches 5 run spreadplayers ~ ~ 0 67 false @e[type=minecraft:marker,tag=p4_calc]

execute as @e[type=minecraft:marker,tag=p4_calc,limit=1] store result score #br_p4cx dummy run data get entity @s Pos[0] 1
execute as @e[type=minecraft:marker,tag=p4_calc,limit=1] store result score #br_p4cz dummy run data get entity @s Pos[2] 1

# ── 預算 p6：從 p4 spread ──
execute at @e[type=minecraft:marker,tag=p4_calc,limit=1] run summon minecraft:marker ~ ~ ~ {Tags:["br_calc","p6_calc"]}
execute at @e[type=minecraft:marker,tag=p4_calc,limit=1] if score #global br_map matches 1 run spreadplayers ~ ~ 0 37 false @e[type=minecraft:marker,tag=p6_calc]
execute at @e[type=minecraft:marker,tag=p4_calc,limit=1] if score #global br_map matches 2 run spreadplayers ~ ~ 0 30 false @e[type=minecraft:marker,tag=p6_calc]
execute at @e[type=minecraft:marker,tag=p4_calc,limit=1] if score #global br_map matches 3 run spreadplayers ~ ~ 0 42 false @e[type=minecraft:marker,tag=p6_calc]
execute at @e[type=minecraft:marker,tag=p4_calc,limit=1] if score #global br_map matches 4 run spreadplayers ~ ~ 0 30 false @e[type=minecraft:marker,tag=p6_calc]
execute at @e[type=minecraft:marker,tag=p4_calc,limit=1] if score #global br_map matches 5 run spreadplayers ~ ~ 0 30 false @e[type=minecraft:marker,tag=p6_calc]

execute as @e[type=minecraft:marker,tag=p6_calc,limit=1] store result score #br_p6cx dummy run data get entity @s Pos[0] 1
execute as @e[type=minecraft:marker,tag=p6_calc,limit=1] store result score #br_p6cz dummy run data get entity @s Pos[2] 1

kill @e[type=minecraft:marker,tag=br_calc]

# ── 生成 center marker ──
execute if score #global br_map matches 1 run summon minecraft:marker 0 64 0 {Tags:["br_center"]}
execute if score #global br_map matches 2 run summon minecraft:marker -5306 64 308 {Tags:["br_center"]}
execute if score #global br_map matches 3 run summon minecraft:marker -86 64 5037 {Tags:["br_center"]}
execute if score #global br_map matches 4 run summon minecraft:marker 5002 64 4 {Tags:["br_center"]}
execute if score #global br_map matches 5 run summon minecraft:marker -4 64 -5001 {Tags:["br_center"]}

# 初始化毫格座標
execute if score #global br_map matches 1 run scoreboard players set #br_cxm dummy 0
execute if score #global br_map matches 1 run scoreboard players set #br_czm dummy 0
execute if score #global br_map matches 2 run scoreboard players set #br_cxm dummy -5306000
execute if score #global br_map matches 2 run scoreboard players set #br_czm dummy 308000
execute if score #global br_map matches 3 run scoreboard players set #br_cxm dummy -86000
execute if score #global br_map matches 3 run scoreboard players set #br_czm dummy 5037000
execute if score #global br_map matches 4 run scoreboard players set #br_cxm dummy 5002000
execute if score #global br_map matches 4 run scoreboard players set #br_czm dummy 4000
execute if score #global br_map matches 5 run scoreboard players set #br_cxm dummy -4000
execute if score #global br_map matches 5 run scoreboard players set #br_czm dummy -5001000

scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

execute at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

title @a times 10 60 20
# title @a title {"text":"遊戲開始！","color":"gold","bold":true}
# title @a subtitle {"text":"自由探索，縮圈前請找好位置","color":"yellow"}
tellraw @a {"text":"[縮圈] 準備期開始。","color":"gold"}
