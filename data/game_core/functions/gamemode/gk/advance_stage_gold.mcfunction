scoreboard players set #gk_kills_gold gk_config 0
scoreboard players add #gk_stage_gold gk_config 1
execute if score #gk_stage_gold gk_config matches 10.. run function game_core:gamemode/gk/win_gold
execute if score #gk_stage_gold gk_config matches 1..9 run function game_core:gamemode/gk/resolve_stage_gold
execute if score #gk_stage_gold gk_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"金隊換武器！進入第 ","color":"gold"},{"score":{"name":"#gk_stage_gold","objective":"gk_config"},"color":"yellow"},{"text":" 階段。","color":"gold"}]
execute if score #gk_stage_gold gk_config matches 1..9 as @a[team=gold] run function game_core:gamemode/gk/give_weapon
execute if score #gk_stage_gold gk_config matches 1..9 as @a[team=gold] run function game_core:gamemode/gk/give_attach_inventory
execute if score #gk_stage_gold gk_config matches 1..9 at @a[team=gold,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
