# Phase 1：第一次縮圈
# map2/4/5=3分(3600) map1=3.5分(4200) map3=4分(4800)
scoreboard players set #br_phase dummy 1

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 3600
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 3600
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 3600
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 4200
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 4800

# worldborder 縮圈（秒數對應各地圖 timer）
execute if score #global br_map matches 1 run worldborder set 460 210
execute if score #global br_map matches 2 run worldborder set 350 180
execute if score #global br_map matches 3 run worldborder set 520 240
execute if score #global br_map matches 4 run worldborder set 350 180
execute if score #global br_map matches 5 run worldborder set 350 180

# #br_pticks：供步進除法使用，與 timer 相同
execute if score #global br_map matches 2 run scoreboard players set #br_pticks dummy 3600
execute if score #global br_map matches 4 run scoreboard players set #br_pticks dummy 3600
execute if score #global br_map matches 5 run scoreboard players set #br_pticks dummy 3600
execute if score #global br_map matches 1 run scoreboard players set #br_pticks dummy 4200
execute if score #global br_map matches 3 run scoreboard players set #br_pticks dummy 4800

# 步進 = (p2 - 地圖中心) × 1000 / pticks
scoreboard players operation #br_sx dummy = #br_p2cx dummy
scoreboard players operation #br_sx dummy -= #br_cx dummy
scoreboard players operation #br_sx dummy *= #br_c1000 dummy
scoreboard players operation #br_sx dummy /= #br_pticks dummy
scoreboard players operation #br_sz dummy = #br_p2cz dummy
scoreboard players operation #br_sz dummy -= #br_cz dummy
scoreboard players operation #br_sz dummy *= #br_c1000 dummy
scoreboard players operation #br_sz dummy /= #br_pticks dummy

# br_next 顯示 p2
kill @e[type=minecraft:marker,tag=br_next]
summon minecraft:marker 0 64 0 {Tags:["br_next"]}
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p2cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p2cz dummy

title @a times 10 60 20
# title @a title {"text":"⚠ 縮圈開始！","color":"red","bold":true}
# title @a subtitle {"text":"邊界正在縮小，粒子標記為安全區中心","color":"yellow"}
tellraw @a {"text":"[縮圈] 第一次縮圈開始！前往安全區。","color":"red"}
