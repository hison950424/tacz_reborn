scoreboard players set #gk_kills_solo1 gk_config 0
scoreboard players add #gk_stage_solo1 gk_config 1
execute if score #gk_stage_solo1 gk_config matches 10.. run function game_core:gamemode/gk/win_solo1
execute if score #gk_stage_solo1 gk_config matches 1..9 run function game_core:gamemode/gk/resolve_stage_solo1
execute if score #gk_stage_solo1 gk_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"孤狼 ","color":"yellow"},{"selector":"@a[team=solo1]"},{"text":" 換武器！進入第 ","color":"yellow"},{"score":{"name":"#gk_stage_solo1","objective":"gk_config"},"color":"yellow"},{"text":" 階段。","color":"yellow"}]
execute if score #gk_stage_solo1 gk_config matches 1..9 as @a[team=solo1] run function game_core:gamemode/gk/give_weapon
execute if score #gk_stage_solo1 gk_config matches 1..9 as @a[team=solo1] run function game_core:gamemode/gk/give_attach_inventory
execute if score #gk_stage_solo1 gk_config matches 1..9 at @a[team=solo1,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
