
scoreboard players set map_3 dummy 0
scoreboard players set general_map_3 dummy 0
scoreboard players set medical_map_3 dummy 0
scoreboard players set attach_map_3 dummy 0
scoreboard players set high_map_3 dummy 0


execute as @e[type=marker,tag=map_3] run scoreboard players add map_3 dummy 1
execute as @e[type=marker,tag=map_3,tag=crate_general] run scoreboard players add general_map_3 dummy 1
execute as @e[type=marker,tag=map_3,tag=crate_medical] run scoreboard players add medical_map_3 dummy 1
execute as @e[type=marker,tag=map_3,tag=crate_attach] run scoreboard players add attach_map_3 dummy 1
execute as @e[type=marker,tag=map_3,tag=crate_high] run scoreboard players add high_map_3 dummy 1


tellraw @a [{"text":"[系統] map3共有","color":"green"},{"score":{"name":"map_3","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] general","color":"green"},{"score":{"name":"general_map_3","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] medical","color":"green"},{"score":{"name":"medical_map_3","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] attach","color":"green"},{"score":{"name":"attach_map_3","objective":"dummy"},"color":"white","bold":true}]
tellraw @a [{"text":"[系統] high","color":"green"},{"score":{"name":"high_map_3","objective":"dummy"},"color":"white","bold":true}]


forceload remove -800 4496 415 4543
forceload remove -800 4544 415 4591
forceload remove -800 4592 415 4639
forceload remove -800 4640 415 4687
forceload remove -800 4688 415 4735
forceload remove -800 4736 415 4783
forceload remove -800 4784 415 4831
forceload remove -800 4832 415 4879
forceload remove -800 4880 415 4927
forceload remove -800 4928 415 4975
forceload remove -800 4976 415 5023
forceload remove -800 5024 415 5071
forceload remove -800 5072 415 5119
forceload remove -800 5120 415 5167
forceload remove -800 5168 415 5215
forceload remove -800 5216 415 5263
forceload remove -800 5264 415 5311
forceload remove -800 5312 415 5359
forceload remove -800 5360 415 5407
forceload remove -800 5408 415 5455
forceload remove -800 5456 415 5503
