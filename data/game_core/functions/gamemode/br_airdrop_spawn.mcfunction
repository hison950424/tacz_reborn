# ==========================================
# game_core:gamemode/br_airdrop_spawn
# ==========================================

kill @e[type=minecraft:villager,tag=airdrop_bird]

summon minecraft:marker 0 64 0 {Tags:["br_calc","airdrop_calc"]}

execute store result entity @e[type=minecraft:marker,tag=airdrop_calc,limit=1] Pos[0] double 1.0 run scoreboard players get #br_cx dummy
execute store result entity @e[type=minecraft:marker,tag=airdrop_calc,limit=1] Pos[2] double 1.0 run scoreboard players get #br_cz dummy

execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 1 if score #br_phase dummy matches 2 run spreadplayers ~ ~ 0 138 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 2 if score #br_phase dummy matches 2 run spreadplayers ~ ~ 0 105 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 3 if score #br_phase dummy matches 2 run spreadplayers ~ ~ 0 156 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 4 if score #br_phase dummy matches 2 run spreadplayers ~ ~ 0 105 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 5 if score #br_phase dummy matches 2 run spreadplayers ~ ~ 0 105 false @e[type=minecraft:marker,tag=airdrop_calc]

execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 1 if score #br_phase dummy matches 4 run spreadplayers ~ ~ 0 72 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 2 if score #br_phase dummy matches 4 run spreadplayers ~ ~ 0 54 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 3 if score #br_phase dummy matches 4 run spreadplayers ~ ~ 0 81 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 4 if score #br_phase dummy matches 4 run spreadplayers ~ ~ 0 54 false @e[type=minecraft:marker,tag=airdrop_calc]
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] at @s if score #global br_map matches 5 if score #br_phase dummy matches 4 run spreadplayers ~ ~ 0 54 false @e[type=minecraft:marker,tag=airdrop_calc]

execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] store result score #air_x dummy run data get entity @s Pos[0] 1
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] store result score #air_z dummy run data get entity @s Pos[2] 1

# 召喚空投村民（名稱：空頭，緩降Id=28，隱形Id=14，緩速Id=2 Amp=99）
execute at @e[type=minecraft:marker,tag=airdrop_calc,limit=1] run summon minecraft:villager ~ 260 ~ {CustomName:'{"text":"空頭","color":"gold","bold":true}',CustomNameVisible:1b,Silent:1b,Invulnerable:1b,Glowing:1b,ActiveEffects:[{Id:28,Amplifier:1,Duration:600,ShowParticles:0b},{Id:14,Amplifier:0,Duration:600,ShowParticles:0b},{Id:2,Amplifier:99,Duration:600,ShowParticles:0b}],Tags:["airdrop_bird"]}

kill @e[type=minecraft:marker,tag=airdrop_calc]

scoreboard players set #br_airdrop_delay dummy 0

tellraw @a ["",{"text":"[空頭] ","color":"gold","bold":true},{"text":"空頭投下！座標：X=","color":"yellow"},{"score":{"name":"#air_x","objective":"dummy"}},{"text":"  Z=","color":"yellow"},{"score":{"name":"#air_z","objective":"dummy"}},{"text":"  正在掉落中...","color":"gray"}]
