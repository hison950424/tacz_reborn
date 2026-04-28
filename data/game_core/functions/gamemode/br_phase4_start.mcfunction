# Phase 4：停頓期
# map2/4/5=1.5分(1800) map1=2分(2400) map3=2.5分(3000)
scoreboard players set #br_phase dummy 4

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 1800
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 1800
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 1800
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 3000

scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

# 精確補正至 p4
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p4cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p4cz dummy
execute at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

scoreboard players operation #br_cxm dummy = #br_p4cx dummy
scoreboard players operation #br_cxm dummy *= #br_c1000 dummy
scoreboard players operation #br_czm dummy = #br_p4cz dummy
scoreboard players operation #br_czm dummy *= #br_c1000 dummy
scoreboard players operation #br_cx dummy = #br_p4cx dummy
scoreboard players operation #br_cz dummy = #br_p4cz dummy

# br_next 移到 p6
kill @e[type=minecraft:marker,tag=br_next]
summon minecraft:marker 0 64 0 {Tags:["br_next"]}
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p6cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p6cz dummy

title @a times 10 60 20
# title @a title {"text":"安全區已確定","color":"aqua","bold":true}
# title @a subtitle {"text":"停頓期，快速整頓，下一圈更小","color":"white"}
tellraw @a {"text":"[縮圈] 暫停縮圈。","color":"aqua"}
