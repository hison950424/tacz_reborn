scoreboard players set #gk_kills_dark_red gk_config 0
scoreboard players add #gk_stage_dark_red gk_config 1
execute if score #gk_stage_dark_red gk_config matches 10.. run function game_core:gamemode/gk/win_dark_red
execute if score #gk_stage_dark_red gk_config matches 1..9 run function game_core:gamemode/gk/resolve_stage_dark_red
execute if score #gk_stage_dark_red gk_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"暗紅隊換武器！進入第 ","color":"dark_red"},{"score":{"name":"#gk_stage_dark_red","objective":"gk_config"},"color":"yellow"},{"text":" 階段。","color":"dark_red"}]
execute if score #gk_stage_dark_red gk_config matches 1..9 as @a[team=dark_red] run function game_core:gamemode/gk/give_weapon
execute if score #gk_stage_dark_red gk_config matches 1..9 as @a[team=dark_red] run function game_core:gamemode/gk/give_attach_inventory
execute if score #gk_stage_dark_red gk_config matches 1..9 at @a[team=dark_red,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
