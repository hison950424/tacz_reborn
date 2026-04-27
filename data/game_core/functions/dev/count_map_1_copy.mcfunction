
scoreboard players set map_1 dummy 0
scoreboard players set general_map_1 dummy 0
scoreboard players set medical_map_1 dummy 0
scoreboard players set attach_map_1 dummy 0
scoreboard players set high_map_1 dummy 0


execute as @e[type=marker,tag=map_1] run scoreboard players add map_1 dummy 1
execute as @e[type=marker,tag=map_1,tag=crate_general] run scoreboard players add general_map_1 dummy 1
execute as @e[type=marker,tag=map_1,tag=crate_medical] run scoreboard players add medical_map_1 dummy 1
execute as @e[type=marker,tag=map_1,tag=crate_attach] run scoreboard players add attach_map_1 dummy 1
execute as @e[type=marker,tag=map_1,tag=crate_high] run scoreboard players add high_map_1 dummy 1


tellraw @a [{"text":"[系統] map1共有","color":"green"},{"score":{"name":"map_1","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] general","color":"green"},{"score":{"name":"general_map_1","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] medical","color":"green"},{"score":{"name":"medical_map_1","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] attach","color":"green"},{"score":{"name":"attach_map_1","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] high","color":"green"},{"score":{"name":"high_map_1","objective":"dummy"},"color":"white","bold":true}]


forceload remove -512 -512 511 -449
forceload remove -512 -448 511 -385
forceload remove -512 -384 511 -321
forceload remove -512 -320 511 -257
forceload remove -512 -256 511 -193
forceload remove -512 -192 511 -129
forceload remove -512 -128 511 -65
forceload remove -512 -64 511 -1
forceload remove -512 0 511 63
forceload remove -512 64 511 127
forceload remove -512 128 511 191
forceload remove -512 192 511 255
forceload remove -512 256 511 319
forceload remove -512 320 511 383
forceload remove -512 384 511 447
forceload remove -512 448 511 511
