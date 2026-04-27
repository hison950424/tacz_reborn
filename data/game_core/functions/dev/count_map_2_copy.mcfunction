
scoreboard players set map_2 dummy 0
scoreboard players set general_map_2 dummy 0
scoreboard players set medical_map_2 dummy 0
scoreboard players set attach_map_2 dummy 0
scoreboard players set high_map_2 dummy 0


execute as @e[type=marker,tag=map_2] run scoreboard players add map_2 dummy 1
execute as @e[type=marker,tag=map_2,tag=crate_general] run scoreboard players add general_map_2 dummy 1
execute as @e[type=marker,tag=map_2,tag=crate_medical] run scoreboard players add medical_map_2 dummy 1
execute as @e[type=marker,tag=map_2,tag=crate_attach] run scoreboard players add attach_map_2 dummy 1
execute as @e[type=marker,tag=map_2,tag=crate_high] run scoreboard players add high_map_2 dummy 1


tellraw @a [{"text":"[系統] map2共有","color":"green"},{"score":{"name":"map_2","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] general","color":"green"},{"score":{"name":"general_map_2","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] medical","color":"green"},{"score":{"name":"medical_map_2","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] attach","color":"green"},{"score":{"name":"attach_map_2","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] high","color":"green"},{"score":{"name":"high_map_2","objective":"dummy"},"color":"white","bold":true}]


forceload remove -5712 -128 -4993 -49
forceload remove -5712 -48 -4993 31
forceload remove -5712 32 -4993 111
forceload remove -5712 112 -4993 191
forceload remove -5712 192 -4993 271
forceload remove -5712 272 -4993 351
forceload remove -5712 352 -4993 431
forceload remove -5712 432 -4993 511
forceload remove -5712 512 -4993 591
forceload remove -5712 592 -4993 655
