# Phase 5：第三次縮圈
# map2/4/5=2.5分(3000) map1=3分(3600) map3=3分(3600)
scoreboard players set #br_phase dummy 5

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 3600
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 3600

execute if score #global br_map matches 1 run worldborder set 100 180
execute if score #global br_map matches 2 run worldborder set 80 150
execute if score #global br_map matches 3 run worldborder set 115 180
execute if score #global br_map matches 4 run worldborder set 80 150
execute if score #global br_map matches 5 run worldborder set 80 150

execute if score #global br_map matches 2 run scoreboard players set #br_pticks dummy 3000
execute if score #global br_map matches 4 run scoreboard players set #br_pticks dummy 3000
execute if score #global br_map matches 5 run scoreboard players set #br_pticks dummy 3000
execute if score #global br_map matches 1 run scoreboard players set #br_pticks dummy 3600
execute if score #global br_map matches 3 run scoreboard players set #br_pticks dummy 3600

# 步進 = (p6 - p4) × 1000 / pticks
scoreboard players operation #br_sx dummy = #br_p6cx dummy
scoreboard players operation #br_sx dummy -= #br_p4cx dummy
scoreboard players operation #br_sx dummy *= #br_c1000 dummy
scoreboard players operation #br_sx dummy /= #br_pticks dummy
scoreboard players operation #br_sz dummy = #br_p6cz dummy
scoreboard players operation #br_sz dummy -= #br_p4cz dummy
scoreboard players operation #br_sz dummy *= #br_c1000 dummy
scoreboard players operation #br_sz dummy /= #br_pticks dummy

kill @e[type=minecraft:marker,tag=br_next]
summon minecraft:marker 0 64 0 {Tags:["br_next"]}
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p6cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p6cz dummy

title @a times 10 60 20
# title @a title {"text":"⚠ 第三次縮圈！","color":"dark_red","bold":true}
# title @a subtitle {"text":"決賽圈即將到來！","color":"yellow"}
tellraw @a {"text":"[縮圈] 第三次縮圈開始！","color":"dark_red"}
