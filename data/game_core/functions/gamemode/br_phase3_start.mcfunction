# Phase 3：第二次縮圈
# map2/4/5=2.5分(3000) map1=3分(3600) map3=3.5分(4200)
scoreboard players set #br_phase dummy 3

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 3600
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 4200

execute if score #global br_map matches 1 run worldborder set 240 180
execute if score #global br_map matches 2 run worldborder set 180 150
execute if score #global br_map matches 3 run worldborder set 270 210
execute if score #global br_map matches 4 run worldborder set 180 150
execute if score #global br_map matches 5 run worldborder set 180 150

execute if score #global br_map matches 2 run scoreboard players set #br_pticks dummy 3000
execute if score #global br_map matches 4 run scoreboard players set #br_pticks dummy 3000
execute if score #global br_map matches 5 run scoreboard players set #br_pticks dummy 3000
execute if score #global br_map matches 1 run scoreboard players set #br_pticks dummy 3600
execute if score #global br_map matches 3 run scoreboard players set #br_pticks dummy 4200

# 步進 = (p4 - p2) × 1000 / pticks
scoreboard players operation #br_sx dummy = #br_p4cx dummy
scoreboard players operation #br_sx dummy -= #br_p2cx dummy
scoreboard players operation #br_sx dummy *= #br_c1000 dummy
scoreboard players operation #br_sx dummy /= #br_pticks dummy
scoreboard players operation #br_sz dummy = #br_p4cz dummy
scoreboard players operation #br_sz dummy -= #br_p2cz dummy
scoreboard players operation #br_sz dummy *= #br_c1000 dummy
scoreboard players operation #br_sz dummy /= #br_pticks dummy

kill @e[type=minecraft:marker,tag=br_next]
summon minecraft:marker 0 64 0 {Tags:["br_next"]}
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p4cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p4cz dummy

# ── 圈外傷害 ──
worldborder damage amount 0.5

# ── 公告（快速模式顯示「第一次」，一般模式顯示「第二次」）──
execute if score #global br_fast_mode matches 0 run tellraw @a ["",{"text":"[縮圈] ","color":"red"},{"text":"第二次縮圈開始！","color":"yellow"}]
execute if score #global br_fast_mode matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"red"},{"text":"第一次縮圈開始！","color":"yellow"}]
