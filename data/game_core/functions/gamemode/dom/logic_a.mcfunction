# --- [A-L1] 進度推移（僅戰鬥階段 + 點位開放中才推進）---
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #a_contested temp_score matches 0 if score #a_red_count temp_score matches 1.. run scoreboard players operation #Point_a dom_prog_a += #a_red_speed temp_score
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #a_contested temp_score matches 0 if score #a_blue_count temp_score matches 1.. run scoreboard players operation #Point_a dom_prog_a -= #a_blue_speed temp_score

# 限制進度邊界（-20 ~ 20，1 人 20 秒 / 2 人 10 秒）
execute if score #Point_a dom_prog_a matches 20.. run scoreboard players set #Point_a dom_prog_a 20
execute if score #Point_a dom_prog_a matches ..-20 run scoreboard players set #Point_a dom_prog_a -20

# --- [A-L2] 佔領判定：進度打滿即觸發回合結束 ---
# 紅隊佔領 A 點
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 20 run scoreboard players set #dom_round_winner dom_config 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 20 run scoreboard players set #dom_capture_point dom_config 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 20 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,team=red] run scoreboard players add @s stat_dom_flips_match 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 20 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,team=red] run scoreboard players add @s stat_dom_flips 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 20 run function game_core:gamemode/dom/round_end_capture

# 藍隊佔領 A 點
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-20 run scoreboard players set #dom_round_winner dom_config 2
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-20 run scoreboard players set #dom_capture_point dom_config 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-20 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,team=blue] run scoreboard players add @s stat_dom_flips_match 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-20 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,team=blue] run scoreboard players add @s stat_dom_flips 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-20 run function game_core:gamemode/dom/round_end_capture
