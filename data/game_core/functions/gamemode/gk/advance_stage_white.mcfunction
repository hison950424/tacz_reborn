scoreboard players set #gk_kills_white gk_config 0
scoreboard players add #gk_stage_white gk_config 1
execute if score #gk_stage_white gk_config matches 10.. run function game_core:gamemode/gk/win_white
execute if score #gk_stage_white gk_config matches 1..9 run function game_core:gamemode/gk/resolve_stage_white
execute if score #gk_stage_white gk_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"白隊換武器！進入第 ","color":"white"},{"score":{"name":"#gk_stage_white","objective":"gk_config"},"color":"yellow"},{"text":" 階段。","color":"white"}]
execute if score #gk_stage_white gk_config matches 1..9 as @a[team=white] run function game_core:gamemode/gk/give_weapon
execute if score #gk_stage_white gk_config matches 1..9 as @a[team=white] run function game_core:gamemode/gk/give_attach_inventory
execute if score #gk_stage_white gk_config matches 1..9 at @a[team=white,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
