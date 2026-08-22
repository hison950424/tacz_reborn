execute if entity @s[team=red] run scoreboard players add #gk_kills_red gk_config 1
execute if entity @s[team=blue] run scoreboard players add #gk_kills_blue gk_config 1
execute if entity @s[team=white] run scoreboard players add #gk_kills_white gk_config 1
execute if entity @s[team=green] run scoreboard players add #gk_kills_green gk_config 1
execute if entity @s[team=yellow] run scoreboard players add #gk_kills_yellow gk_config 1
execute if entity @s[team=aqua] run scoreboard players add #gk_kills_aqua gk_config 1
execute if entity @s[team=gold] run scoreboard players add #gk_kills_gold gk_config 1
execute if entity @s[team=light_purple] run scoreboard players add #gk_kills_light_purple gk_config 1
execute if entity @s[team=dark_red] run scoreboard players add #gk_kills_dark_red gk_config 1
execute if entity @s[team=dark_blue] run scoreboard players add #gk_kills_dark_blue gk_config 1
execute if entity @s[team=dark_green] run scoreboard players add #gk_kills_dark_green gk_config 1
execute if entity @s[team=dark_aqua] run scoreboard players add #gk_kills_dark_aqua gk_config 1
execute if entity @s[team=dark_purple] run scoreboard players add #gk_kills_dark_purple gk_config 1
execute if entity @s[team=dark_gray] run scoreboard players add #gk_kills_dark_gray gk_config 1
execute if entity @s[team=gray] run scoreboard players add #gk_kills_gray gk_config 1
execute if entity @s[team=black] run scoreboard players add #gk_kills_black gk_config 1
execute if entity @s[team=solo1] run scoreboard players add #gk_kills_solo1 gk_config 1
execute if entity @s[team=solo2] run scoreboard players add #gk_kills_solo2 gk_config 1
execute if entity @s[team=solo3] run scoreboard players add #gk_kills_solo3 gk_config 1
execute if entity @s[team=solo4] run scoreboard players add #gk_kills_solo4 gk_config 1
execute if entity @s[team=solo5] run scoreboard players add #gk_kills_solo5 gk_config 1
execute if entity @s[team=solo6] run scoreboard players add #gk_kills_solo6 gk_config 1
execute if entity @s[team=solo7] run scoreboard players add #gk_kills_solo7 gk_config 1
execute if entity @s[team=solo8] run scoreboard players add #gk_kills_solo8 gk_config 1
execute if entity @s[team=solo9] run scoreboard players add #gk_kills_solo9 gk_config 1
execute if entity @s[team=solo10] run scoreboard players add #gk_kills_solo10 gk_config 1
execute if entity @s[team=solo11] run scoreboard players add #gk_kills_solo11 gk_config 1
execute if entity @s[team=solo12] run scoreboard players add #gk_kills_solo12 gk_config 1
execute if entity @s[team=solo13] run scoreboard players add #gk_kills_solo13 gk_config 1
execute if entity @s[team=solo14] run scoreboard players add #gk_kills_solo14 gk_config 1
execute if entity @s[team=solo15] run scoreboard players add #gk_kills_solo15 gk_config 1
execute if entity @s[team=solo16] run scoreboard players add #gk_kills_solo16 gk_config 1
execute if entity @s[team=red] run title @a actionbar [{"text":"[紅] ","color":"red","bold":true},{"score":{"name":"#gk_kills_red","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_red","objective":"gk_config"}}]
execute if entity @s[team=blue] run title @a actionbar [{"text":"[藍] ","color":"blue","bold":true},{"score":{"name":"#gk_kills_blue","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_blue","objective":"gk_config"}}]
execute if entity @s[team=white] run title @a actionbar [{"text":"[白] ","color":"white","bold":true},{"score":{"name":"#gk_kills_white","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_white","objective":"gk_config"}}]
execute if entity @s[team=green] run title @a actionbar [{"text":"[綠] ","color":"green","bold":true},{"score":{"name":"#gk_kills_green","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_green","objective":"gk_config"}}]
execute if entity @s[team=yellow] run title @a actionbar [{"text":"[黃] ","color":"yellow","bold":true},{"score":{"name":"#gk_kills_yellow","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_yellow","objective":"gk_config"}}]
execute if entity @s[team=aqua] run title @a actionbar [{"text":"[水] ","color":"aqua","bold":true},{"score":{"name":"#gk_kills_aqua","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_aqua","objective":"gk_config"}}]
execute if entity @s[team=gold] run title @a actionbar [{"text":"[金] ","color":"gold","bold":true},{"score":{"name":"#gk_kills_gold","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_gold","objective":"gk_config"}}]
execute if entity @s[team=light_purple] run title @a actionbar [{"text":"[紫] ","color":"light_purple","bold":true},{"score":{"name":"#gk_kills_light_purple","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_light_purple","objective":"gk_config"}}]
execute if entity @s[team=dark_red] run title @a actionbar [{"text":"[暗紅] ","color":"dark_red","bold":true},{"score":{"name":"#gk_kills_dark_red","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_dark_red","objective":"gk_config"}}]
execute if entity @s[team=dark_blue] run title @a actionbar [{"text":"[暗藍] ","color":"dark_blue","bold":true},{"score":{"name":"#gk_kills_dark_blue","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_dark_blue","objective":"gk_config"}}]
execute if entity @s[team=dark_green] run title @a actionbar [{"text":"[暗綠] ","color":"dark_green","bold":true},{"score":{"name":"#gk_kills_dark_green","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_dark_green","objective":"gk_config"}}]
execute if entity @s[team=dark_aqua] run title @a actionbar [{"text":"[暗水] ","color":"dark_aqua","bold":true},{"score":{"name":"#gk_kills_dark_aqua","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_dark_aqua","objective":"gk_config"}}]
execute if entity @s[team=dark_purple] run title @a actionbar [{"text":"[暗紫] ","color":"dark_purple","bold":true},{"score":{"name":"#gk_kills_dark_purple","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_dark_purple","objective":"gk_config"}}]
execute if entity @s[team=dark_gray] run title @a actionbar [{"text":"[暗灰] ","color":"dark_gray","bold":true},{"score":{"name":"#gk_kills_dark_gray","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_dark_gray","objective":"gk_config"}}]
execute if entity @s[team=gray] run title @a actionbar [{"text":"[灰] ","color":"gray","bold":true},{"score":{"name":"#gk_kills_gray","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_gray","objective":"gk_config"}}]
execute if entity @s[team=solo1] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo1]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo1","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo1","objective":"gk_config"}}]
execute if entity @s[team=solo2] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo2]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo2","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo2","objective":"gk_config"}}]
execute if entity @s[team=solo3] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo3]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo3","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo3","objective":"gk_config"}}]
execute if entity @s[team=solo4] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo4]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo4","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo4","objective":"gk_config"}}]
execute if entity @s[team=solo5] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo5]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo5","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo5","objective":"gk_config"}}]
execute if entity @s[team=solo6] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo6]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo6","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo6","objective":"gk_config"}}]
execute if entity @s[team=solo7] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo7]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo7","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo7","objective":"gk_config"}}]
execute if entity @s[team=solo8] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo8]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo8","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo8","objective":"gk_config"}}]
execute if entity @s[team=solo9] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo9]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo9","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo9","objective":"gk_config"}}]
execute if entity @s[team=solo10] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo10]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo10","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo10","objective":"gk_config"}}]
execute if entity @s[team=solo11] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo11]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo11","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo11","objective":"gk_config"}}]
execute if entity @s[team=solo12] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo12]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo12","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo12","objective":"gk_config"}}]
execute if entity @s[team=solo13] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo13]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo13","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo13","objective":"gk_config"}}]
execute if entity @s[team=solo14] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo14]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo14","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo14","objective":"gk_config"}}]
execute if entity @s[team=solo15] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo15]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo15","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo15","objective":"gk_config"}}]
execute if entity @s[team=solo16] run title @a actionbar [{"text":"[孤狼] ","color":"yellow","bold":true},{"selector":"@a[team=solo16]"},{"text":" ","color":"white"},{"score":{"name":"#gk_kills_solo16","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_solo16","objective":"gk_config"}}]
execute if entity @s[team=black] run title @a actionbar [{"text":"[黑] ","color":"dark_gray","bold":true},{"score":{"name":"#gk_kills_black","objective":"gk_config"}},{"text":"/","color":"white"},{"score":{"name":"#gk_kills_needed_black","objective":"gk_config"}}]
execute if entity @s[team=red] if score #gk_kills_red gk_config >= #gk_kills_needed_red gk_config if score #gk_stage_red gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_red
execute if entity @s[team=blue] if score #gk_kills_blue gk_config >= #gk_kills_needed_blue gk_config if score #gk_stage_blue gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_blue
execute if entity @s[team=white] if score #gk_kills_white gk_config >= #gk_kills_needed_white gk_config if score #gk_stage_white gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_white
execute if entity @s[team=green] if score #gk_kills_green gk_config >= #gk_kills_needed_green gk_config if score #gk_stage_green gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_green
execute if entity @s[team=yellow] if score #gk_kills_yellow gk_config >= #gk_kills_needed_yellow gk_config if score #gk_stage_yellow gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_yellow
execute if entity @s[team=aqua] if score #gk_kills_aqua gk_config >= #gk_kills_needed_aqua gk_config if score #gk_stage_aqua gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_aqua
execute if entity @s[team=gold] if score #gk_kills_gold gk_config >= #gk_kills_needed_gold gk_config if score #gk_stage_gold gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_gold
execute if entity @s[team=light_purple] if score #gk_kills_light_purple gk_config >= #gk_kills_needed_light_purple gk_config if score #gk_stage_light_purple gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_light_purple
execute if entity @s[team=dark_red] if score #gk_kills_dark_red gk_config >= #gk_kills_needed_dark_red gk_config if score #gk_stage_dark_red gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_dark_red
execute if entity @s[team=dark_blue] if score #gk_kills_dark_blue gk_config >= #gk_kills_needed_dark_blue gk_config if score #gk_stage_dark_blue gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_dark_blue
execute if entity @s[team=dark_green] if score #gk_kills_dark_green gk_config >= #gk_kills_needed_dark_green gk_config if score #gk_stage_dark_green gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_dark_green
execute if entity @s[team=dark_aqua] if score #gk_kills_dark_aqua gk_config >= #gk_kills_needed_dark_aqua gk_config if score #gk_stage_dark_aqua gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_dark_aqua
execute if entity @s[team=dark_purple] if score #gk_kills_dark_purple gk_config >= #gk_kills_needed_dark_purple gk_config if score #gk_stage_dark_purple gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_dark_purple
execute if entity @s[team=dark_gray] if score #gk_kills_dark_gray gk_config >= #gk_kills_needed_dark_gray gk_config if score #gk_stage_dark_gray gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_dark_gray
execute if entity @s[team=gray] if score #gk_kills_gray gk_config >= #gk_kills_needed_gray gk_config if score #gk_stage_gray gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_gray
execute if entity @s[team=black] if score #gk_kills_black gk_config >= #gk_kills_needed_black gk_config if score #gk_stage_black gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_black
execute if entity @s[team=solo1] if score #gk_kills_solo1 gk_config >= #gk_kills_needed_solo1 gk_config if score #gk_stage_solo1 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo1
execute if entity @s[team=solo2] if score #gk_kills_solo2 gk_config >= #gk_kills_needed_solo2 gk_config if score #gk_stage_solo2 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo2
execute if entity @s[team=solo3] if score #gk_kills_solo3 gk_config >= #gk_kills_needed_solo3 gk_config if score #gk_stage_solo3 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo3
execute if entity @s[team=solo4] if score #gk_kills_solo4 gk_config >= #gk_kills_needed_solo4 gk_config if score #gk_stage_solo4 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo4
execute if entity @s[team=solo5] if score #gk_kills_solo5 gk_config >= #gk_kills_needed_solo5 gk_config if score #gk_stage_solo5 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo5
execute if entity @s[team=solo6] if score #gk_kills_solo6 gk_config >= #gk_kills_needed_solo6 gk_config if score #gk_stage_solo6 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo6
execute if entity @s[team=solo7] if score #gk_kills_solo7 gk_config >= #gk_kills_needed_solo7 gk_config if score #gk_stage_solo7 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo7
execute if entity @s[team=solo8] if score #gk_kills_solo8 gk_config >= #gk_kills_needed_solo8 gk_config if score #gk_stage_solo8 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo8
execute if entity @s[team=solo9] if score #gk_kills_solo9 gk_config >= #gk_kills_needed_solo9 gk_config if score #gk_stage_solo9 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo9
execute if entity @s[team=solo10] if score #gk_kills_solo10 gk_config >= #gk_kills_needed_solo10 gk_config if score #gk_stage_solo10 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo10
execute if entity @s[team=solo11] if score #gk_kills_solo11 gk_config >= #gk_kills_needed_solo11 gk_config if score #gk_stage_solo11 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo11
execute if entity @s[team=solo12] if score #gk_kills_solo12 gk_config >= #gk_kills_needed_solo12 gk_config if score #gk_stage_solo12 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo12
execute if entity @s[team=solo13] if score #gk_kills_solo13 gk_config >= #gk_kills_needed_solo13 gk_config if score #gk_stage_solo13 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo13
execute if entity @s[team=solo14] if score #gk_kills_solo14 gk_config >= #gk_kills_needed_solo14 gk_config if score #gk_stage_solo14 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo14
execute if entity @s[team=solo15] if score #gk_kills_solo15 gk_config >= #gk_kills_needed_solo15 gk_config if score #gk_stage_solo15 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo15
execute if entity @s[team=solo16] if score #gk_kills_solo16 gk_config >= #gk_kills_needed_solo16 gk_config if score #gk_stage_solo16 gk_config matches 1..9 run function game_core:gamemode/gk/advance_stage_solo16
