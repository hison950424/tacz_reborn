# 以擊殺者身份（@s）執行 - 累加對應隊伍擊殺數
execute if entity @s[team=red] run scoreboard players add #gg_kills_red gg_config 1
execute if entity @s[team=blue] run scoreboard players add #gg_kills_blue gg_config 1

# 廣播進度 actionbar
title @a actionbar [{"text":"【紅】","color":"red","bold":true},{"score":{"name":"#gg_kills_red","objective":"gg_config"},"color":"yellow"},{"text":"/","color":"white"},{"score":{"name":"#gg_kills_needed_red","objective":"gg_config"},"color":"white"},{"text":"  "},{"text":"【藍】","color":"aqua","bold":true},{"score":{"name":"#gg_kills_blue","objective":"gg_config"},"color":"yellow"},{"text":"/","color":"white"},{"score":{"name":"#gg_kills_needed_blue","objective":"gg_config"},"color":"white"}]

# 判斷是否達到推進條件（kills >= needed 且尚未完成全部階段）
execute if score #gg_kills_red gg_config >= #gg_kills_needed_red gg_config if score #gg_stage_red gg_config matches 1..6 run function game_core:gamemode/gg/advance_stage_red
execute if score #gg_kills_blue gg_config >= #gg_kills_needed_blue gg_config if score #gg_stage_blue gg_config matches 1..6 run function game_core:gamemode/gg/advance_stage_blue
