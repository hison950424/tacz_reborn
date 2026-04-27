
scoreboard players set map_5 dummy 0
scoreboard players set general_map_5 dummy 0
scoreboard players set medical_map_5 dummy 0
scoreboard players set attach_map_5 dummy 0
scoreboard players set high_map_5 dummy 0


execute as @e[type=marker,tag=map_5] run scoreboard players add map_5 dummy 1
execute as @e[type=marker,tag=map_5,tag=crate_general] run scoreboard players add general_map_5 dummy 1
execute as @e[type=marker,tag=map_5,tag=crate_medical] run scoreboard players add medical_map_5 dummy 1
execute as @e[type=marker,tag=map_5,tag=crate_attach] run scoreboard players add attach_map_5 dummy 1
execute as @e[type=marker,tag=map_5,tag=crate_high] run scoreboard players add high_map_5 dummy 1


tellraw @a [{"text":"[系統] map5共有","color":"green"},{"score":{"name":"map_5","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] general","color":"green"},{"score":{"name":"general_map_5","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] medical","color":"green"},{"score":{"name":"medical_map_5","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] attach","color":"green"},{"score":{"name":"attach_map_5","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] high","color":"green"},{"score":{"name":"high_map_5","objective":"dummy"},"color":"white","bold":true}]


forceload remove -400 -5408 415 -5329
forceload remove -400 -5328 415 -5249
forceload remove -400 -5248 415 -5169
forceload remove -400 -5168 415 -5089
forceload remove -400 -5088 415 -5009
forceload remove -400 -5008 415 -4929
forceload remove -400 -4928 415 -4849
forceload remove -400 -4848 415 -4769
forceload remove -400 -4768 415 -4689
forceload remove -400 -4688 415 -4609
forceload remove -400 -4608 415 -4593
