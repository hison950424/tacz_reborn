# 重置本隊擊殺數，推進階段
scoreboard players set #gg_kills_red gg_config 0
scoreboard players add #gg_stage_red gg_config 1

# 階段 10+ = 完成全部 9 類 → 紅隊獲勝
execute if score #gg_stage_red gg_config matches 10.. run function game_core:gamemode/gg/win_red

# 尚未完成 → 解析新階段、廣播、更換全隊武器
execute if score #gg_stage_red gg_config matches 1..9 run function game_core:gamemode/gg/resolve_stage_red
execute if score #gg_stage_red gg_config matches 1..9 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"紅隊換武器！進入第 ","color":"red"},{"score":{"name":"#gg_stage_red","objective":"gg_config"},"color":"yellow"},{"text":" 階段。","color":"red"}]
execute if score #gg_stage_red gg_config matches 1..9 as @a[team=red] run function game_core:gamemode/gg/give_weapon
execute if score #gg_stage_red gg_config matches 1..9 at @a[team=red,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
