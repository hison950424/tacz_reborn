# 檔案: gamemode/gk/calc_stage_score.mcfunction
# 目的: 將每位玩家所屬隊伍的 #gk_stage 值寫入個人 gk_stage_score
#       供 calc_player.mcfunction 計算 GK 階段 RP 加成使用
# 說明: 勝者隊伍 stage=10 → stage_score=9（最高）；敗者依完成階段遞減
execute as @a[team=red] run scoreboard players operation @s gk_stage_score = #gk_stage_red gk_config
execute as @a[team=blue] run scoreboard players operation @s gk_stage_score = #gk_stage_blue gk_config
execute as @a[team=white] run scoreboard players operation @s gk_stage_score = #gk_stage_white gk_config
execute as @a[team=green] run scoreboard players operation @s gk_stage_score = #gk_stage_green gk_config
execute as @a[team=yellow] run scoreboard players operation @s gk_stage_score = #gk_stage_yellow gk_config
execute as @a[team=aqua] run scoreboard players operation @s gk_stage_score = #gk_stage_aqua gk_config
execute as @a[team=gold] run scoreboard players operation @s gk_stage_score = #gk_stage_gold gk_config
execute as @a[team=light_purple] run scoreboard players operation @s gk_stage_score = #gk_stage_light_purple gk_config
execute as @a[team=dark_red] run scoreboard players operation @s gk_stage_score = #gk_stage_dark_red gk_config
execute as @a[team=dark_blue] run scoreboard players operation @s gk_stage_score = #gk_stage_dark_blue gk_config
execute as @a[team=dark_green] run scoreboard players operation @s gk_stage_score = #gk_stage_dark_green gk_config
execute as @a[team=dark_aqua] run scoreboard players operation @s gk_stage_score = #gk_stage_dark_aqua gk_config
execute as @a[team=dark_purple] run scoreboard players operation @s gk_stage_score = #gk_stage_dark_purple gk_config
execute as @a[team=dark_gray] run scoreboard players operation @s gk_stage_score = #gk_stage_dark_gray gk_config
execute as @a[team=gray] run scoreboard players operation @s gk_stage_score = #gk_stage_gray gk_config
execute as @a[team=black] run scoreboard players operation @s gk_stage_score = #gk_stage_black gk_config
execute as @a[team=solo1] run scoreboard players operation @s gk_stage_score = #gk_stage_solo1 gk_config
execute as @a[team=solo2] run scoreboard players operation @s gk_stage_score = #gk_stage_solo2 gk_config
execute as @a[team=solo3] run scoreboard players operation @s gk_stage_score = #gk_stage_solo3 gk_config
execute as @a[team=solo4] run scoreboard players operation @s gk_stage_score = #gk_stage_solo4 gk_config
execute as @a[team=solo5] run scoreboard players operation @s gk_stage_score = #gk_stage_solo5 gk_config
execute as @a[team=solo6] run scoreboard players operation @s gk_stage_score = #gk_stage_solo6 gk_config
execute as @a[team=solo7] run scoreboard players operation @s gk_stage_score = #gk_stage_solo7 gk_config
execute as @a[team=solo8] run scoreboard players operation @s gk_stage_score = #gk_stage_solo8 gk_config
execute as @a[team=solo9] run scoreboard players operation @s gk_stage_score = #gk_stage_solo9 gk_config
execute as @a[team=solo10] run scoreboard players operation @s gk_stage_score = #gk_stage_solo10 gk_config
execute as @a[team=solo11] run scoreboard players operation @s gk_stage_score = #gk_stage_solo11 gk_config
execute as @a[team=solo12] run scoreboard players operation @s gk_stage_score = #gk_stage_solo12 gk_config
execute as @a[team=solo13] run scoreboard players operation @s gk_stage_score = #gk_stage_solo13 gk_config
execute as @a[team=solo14] run scoreboard players operation @s gk_stage_score = #gk_stage_solo14 gk_config
execute as @a[team=solo15] run scoreboard players operation @s gk_stage_score = #gk_stage_solo15 gk_config
execute as @a[team=solo16] run scoreboard players operation @s gk_stage_score = #gk_stage_solo16 gk_config
# 實際完成階段數 = stage - 1（因 stage 從 1 開始，完成後 +1 跳至下一階段）
scoreboard players remove @a gk_stage_score 1