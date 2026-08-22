scoreboard players set #gk_kills_black gk_config 0
scoreboard players add #gk_stage_black gk_config 1
execute if score #gk_stage_black gk_config matches 10.. run function game_core:gamemode/gk/win_black
execute if score #gk_stage_black gk_config matches 1..9 run function game_core:gamemode/gk/resolve_stage_black
execute if score #gk_stage_black gk_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"黑隊換武器！進入第 ","color":"dark_gray"},{"score":{"name":"#gk_stage_black","objective":"gk_config"},"color":"yellow"},{"text":" 階段。","color":"dark_gray"}]
execute if score #gk_stage_black gk_config matches 1..9 as @a[team=black] run function game_core:gamemode/gk/give_weapon
execute if score #gk_stage_black gk_config matches 1..9 as @a[team=black] run function game_core:gamemode/gk/give_attach_inventory
execute if score #gk_stage_black gk_config matches 1..9 at @a[team=black,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
