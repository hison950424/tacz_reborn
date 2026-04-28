# Phase 6：停頓期
# map2/4/5=1分(1200) map1=1.5分(1800) map3=1.5分(1800)
scoreboard players set #br_phase dummy 6

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 1200
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 1200
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 1200
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 1800
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 1800

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

title @a times 10 60 20
# title @a title {"text":"決賽圈位置已確定","color":"dark_red","bold":true}
# title @a subtitle {"text":"最後的停頓期，做好準備！","color":"white"}
tellraw @a {"text":"[縮圈] 暫停縮圈。","color":"dark_red"}
