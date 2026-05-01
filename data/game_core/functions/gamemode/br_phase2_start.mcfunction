# Phase 2：停頓期
# map2/4/5=2分(2400) map1=2.5分(3000) map3=3分(3600)
scoreboard players set #br_phase dummy 2

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 3600

scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

# 精確補正至 p2
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p2cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p2cz dummy
execute at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

scoreboard players operation #br_cxm dummy = #br_p2cx dummy
scoreboard players operation #br_cxm dummy *= #br_c1000 dummy
scoreboard players operation #br_czm dummy = #br_p2cz dummy
scoreboard players operation #br_czm dummy *= #br_c1000 dummy
scoreboard players operation #br_cx dummy = #br_p2cx dummy
scoreboard players operation #br_cz dummy = #br_p2cz dummy

# br_next 移到 p4
kill @e[type=minecraft:marker,tag=br_next]
summon minecraft:marker 0 64 0 {Tags:["br_next"]}
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p4cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p4cz dummy

# 空頭投放
execute store result score airdrop dummy run random value 1..100
execute if score airdrop dummy matches 1..50 run function game_core:gamemode/br_airdrop_spawn

# ── 公告 ──
execute if score #global br_map matches 2 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢，2 分鐘後第二次縮圈。","color":"white"}]
execute if score #global br_map matches 4 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢，2 分鐘後第二次縮圈。","color":"white"}]
execute if score #global br_map matches 5 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢，2 分鐘後第二次縮圈。","color":"white"}]
execute if score #global br_map matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢，2 分 30 秒後第二次縮圈。","color":"white"}]
execute if score #global br_map matches 3 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢，3 分鐘後第二次縮圈。","color":"white"}]
