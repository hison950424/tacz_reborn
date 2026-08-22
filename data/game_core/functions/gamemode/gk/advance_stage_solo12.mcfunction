scoreboard players set #gk_kills_solo12 gk_config 0
scoreboard players add #gk_stage_solo12 gk_config 1
execute if score #gk_stage_solo12 gk_config matches 10.. run function game_core:gamemode/gk/win_solo12
execute if score #gk_stage_solo12 gk_config matches 1..9 run function game_core:gamemode/gk/resolve_stage_solo12
execute if score #gk_stage_solo12 gk_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"孤狼 ","color":"yellow"},{"selector":"@a[team=solo12]"},{"text":" 換武器！進入第 ","color":"yellow"},{"score":{"name":"#gk_stage_solo12","objective":"gk_config"},"color":"yellow"},{"text":" 階段。","color":"yellow"}]
execute if score #gk_stage_solo12 gk_config matches 1..9 as @a[team=solo12] run function game_core:gamemode/gk/give_weapon
execute if score #gk_stage_solo12 gk_config matches 1..9 as @a[team=solo12] run function game_core:gamemode/gk/give_attach_inventory
execute if score #gk_stage_solo12 gk_config matches 1..9 at @a[team=solo12,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
