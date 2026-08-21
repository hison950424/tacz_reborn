# 重置本隊擊殺數，推進階段
scoreboard players set #gg_kills_blue gg_config 0
scoreboard players add #gg_stage_blue gg_config 1

# 階段 7+ = 完成全部 6 類 → 藍隊獲勝
execute if score #gg_stage_blue gg_config matches 7.. run function game_core:gamemode/gg/win_blue

# 尚未完成 → 解析新階段、廣播、更換全隊武器
execute if score #gg_stage_blue gg_config matches 1..6 run function game_core:gamemode/gg/resolve_stage_blue
execute if score #gg_stage_blue gg_config matches 1..6 run tellraw @a [{"text":"[槍王] ","color":"gold","bold":true},{"text":"藍隊換武器！進入第 ","color":"blue"},{"score":{"name":"#gg_stage_blue","objective":"gg_config"},"color":"yellow"},{"text":" 階段。","color":"blue"}]
execute if score #gg_stage_blue gg_config matches 1..6 as @a[team=blue] run function game_core:gamemode/gg/give_weapon
execute if score #gg_stage_blue gg_config matches 1..6 at @a[team=blue,limit=1] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2
