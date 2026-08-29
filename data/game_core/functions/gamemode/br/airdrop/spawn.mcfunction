# ==========================================
# game_core:gamemode/br/airdrop/spawn
# ==========================================

kill @e[type=minecraft:villager,tag=airdrop_bird]

# 召喚計算用 Marker（位置由後續 spreadplayers 決定）
# 【修復】原版做法：summon 0 64 0 後用 execute store 寫 NBT Pos 試圖移位，
#         但 NBT 寫入在同一 tick 內 at @s 尚未更新，導致 spreadplayers 仍以
#         世界原點 (0,0) 為圓心，#air_x/#air_z 顯示 0,0 的 bug。
#         修復：直接 summon 在 0 64 0（位置無所謂），spreadplayers 改用
#         execute at @e[tag=br_center] 作為圓心，br_center 是縮圈系統
#         持續維護的正確圓心 Marker，位置可靠。
summon minecraft:marker 0 64 0 {Tags:["br_calc","airdrop_calc"]}

# 以縮圈圓心（br_center）為基準，依地圖大小散布
# 使用各地圖最大安全半徑（原 Phase 2 數值），無論觸發時的縮圈階段皆適用
execute at @e[type=minecraft:marker,tag=br_center,limit=1] if score #global br_map matches 1 run spreadplayers ~ ~ 0 138 false @e[type=minecraft:marker,tag=airdrop_calc]
execute at @e[type=minecraft:marker,tag=br_center,limit=1] if score #global br_map matches 2 run spreadplayers ~ ~ 0 105 false @e[type=minecraft:marker,tag=airdrop_calc]
execute at @e[type=minecraft:marker,tag=br_center,limit=1] if score #global br_map matches 3 run spreadplayers ~ ~ 0 156 false @e[type=minecraft:marker,tag=airdrop_calc]
execute at @e[type=minecraft:marker,tag=br_center,limit=1] if score #global br_map matches 4 run spreadplayers ~ ~ 0 105 false @e[type=minecraft:marker,tag=airdrop_calc]
execute at @e[type=minecraft:marker,tag=br_center,limit=1] if score #global br_map matches 5 run spreadplayers ~ ~ 0 105 false @e[type=minecraft:marker,tag=airdrop_calc]

execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] store result score #air_x dummy run data get entity @s Pos[0] 1
execute as @e[type=minecraft:marker,tag=airdrop_calc,limit=1] store result score #air_z dummy run data get entity @s Pos[2] 1

# 召喚空投村民（名稱：空頭，緩降Id=28，隱形Id=14，緩速Id=2 Amp=99）
execute at @e[type=minecraft:marker,tag=airdrop_calc,limit=1] run summon minecraft:villager ~ 260 ~ {CustomName:'{"text":"空頭","color":"gold","bold":true}',CustomNameVisible:1b,Silent:1b,Invulnerable:1b,Glowing:1b,ActiveEffects:[{Id:28,Amplifier:1,Duration:600,ShowParticles:0b},{Id:14,Amplifier:0,Duration:600,ShowParticles:0b},{Id:2,Amplifier:99,Duration:600,ShowParticles:0b}],Tags:["airdrop_bird"]}

kill @e[type=minecraft:marker,tag=airdrop_calc]

scoreboard players set #br_airdrop_delay dummy 0

tellraw @a ["",{"text":"[空頭] ","color":"gold","bold":true},{"text":"空頭投下！座標：X=","color":"yellow"},{"score":{"name":"#air_x","objective":"dummy"}},{"text":"  Z=","color":"yellow"},{"score":{"name":"#air_z","objective":"dummy"}},{"text":"  正在掉落中...","color":"gray"}]
