# Phase 4：第二次縮圈完畢
# 一般模式: map2/4/5=1.5分(1800) map1=2分(2400) map3=2.5分(3000)
# 快速模式: map2/4/5=0.75分(900) map1=1分(1200) map3=1.25分(1500)
scoreboard players set #br_phase dummy 4

execute if score #global br_fast_mode matches 0 if score #global br_map matches 2 run scoreboard players set #br_timer dummy 1800
execute if score #global br_fast_mode matches 0 if score #global br_map matches 4 run scoreboard players set #br_timer dummy 1800
execute if score #global br_fast_mode matches 0 if score #global br_map matches 5 run scoreboard players set #br_timer dummy 1800
execute if score #global br_fast_mode matches 0 if score #global br_map matches 1 run scoreboard players set #br_timer dummy 2400
execute if score #global br_fast_mode matches 0 if score #global br_map matches 3 run scoreboard players set #br_timer dummy 3000
execute if score #global br_fast_mode matches 1 if score #global br_map matches 2 run scoreboard players set #br_timer dummy 900
execute if score #global br_fast_mode matches 1 if score #global br_map matches 4 run scoreboard players set #br_timer dummy 900
execute if score #global br_fast_mode matches 1 if score #global br_map matches 5 run scoreboard players set #br_timer dummy 900
execute if score #global br_fast_mode matches 1 if score #global br_map matches 1 run scoreboard players set #br_timer dummy 1200
execute if score #global br_fast_mode matches 1 if score #global br_map matches 3 run scoreboard players set #br_timer dummy 1500

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

# 空頭投放（快速模式跳過：時機與圈大小不適合，且快速模式設計上不含空頭）
execute store result score airdrop dummy run random value 1..100
execute if score #global br_fast_mode matches 0 if score airdrop dummy matches 1..50 run function game_core:gamemode/br/airdrop/spawn

# ── 公告（快速模式顯示「第一次」，一般模式顯示「第二次」）──
execute if score #global br_fast_mode matches 0 if score #global br_map matches 2 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第二次縮圈完畢， 1 分 30 秒後第三次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 4 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第二次縮圈完畢， 1 分 30 秒後第三次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 5 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第二次縮圈完畢， 1 分 30 秒後第三次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第二次縮圈完畢， 2 分鐘後第三次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 0 if score #global br_map matches 3 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第二次縮圈完畢， 2 分 30 秒後第三次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 2 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢， 45 秒後第二次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 4 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢， 45 秒後第二次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 5 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢， 45 秒後第二次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢， 1 分鐘後第二次縮圈。","color":"white"}]
execute if score #global br_fast_mode matches 1 if score #global br_map matches 3 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":"第一次縮圈完畢， 1 分 15 秒後第二次縮圈。","color":"white"}]
