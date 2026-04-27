
scoreboard players set map_4 dummy 0
scoreboard players set general_map_4 dummy 0
scoreboard players set medical_map_4 dummy 0
scoreboard players set attach_map_4 dummy 0
scoreboard players set high_map_4 dummy 0


execute as @e[type=marker,tag=map_4] run scoreboard players add map_4 dummy 1
execute as @e[type=marker,tag=map_4,tag=crate_general] run scoreboard players add general_map_4 dummy 1
execute as @e[type=marker,tag=map_4,tag=crate_medical] run scoreboard players add medical_map_4 dummy 1
execute as @e[type=marker,tag=map_4,tag=crate_attach] run scoreboard players add attach_map_4 dummy 1
execute as @e[type=marker,tag=map_4,tag=crate_high] run scoreboard players add high_map_4 dummy 1


tellraw @a [{"text":"[系統] map4共有","color":"green"},{"score":{"name":"map_4","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] general","color":"green"},{"score":{"name":"general_map_4","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] medical","color":"green"},{"score":{"name":"medical_map_4","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] attach","color":"green"},{"score":{"name":"attach_map_4","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] high","color":"green"},{"score":{"name":"high_map_4","objective":"dummy"},"color":"white","bold":true}]


forceload remove 4688 -400 5407 -321
forceload remove 4688 -320 5407 -241
forceload remove 4688 -240 5407 -161
forceload remove 4688 -160 5407 -81
forceload remove 4688 -80 5407 -1
forceload remove 4688 0 5407 79
forceload remove 4688 80 5407 159
forceload remove 4688 160 5407 239
forceload remove 4688 240 5407 319
forceload remove 4688 320 5407 351
