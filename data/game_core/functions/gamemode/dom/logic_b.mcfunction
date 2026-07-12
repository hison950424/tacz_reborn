# --- [B-L1] 進度推移 ---
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #b_contested temp_score matches 0 if score #b_red_count temp_score matches 1.. run scoreboard players operation #Point_b dom_prog_b += #b_red_speed temp_score
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #b_contested temp_score matches 0 if score #b_blue_count temp_score matches 1.. run scoreboard players operation #Point_b dom_prog_b -= #b_blue_speed temp_score

# 限制進度邊界（-20 ~ 20）
execute if score #Point_b dom_prog_b matches 20.. run scoreboard players set #Point_b dom_prog_b 20
execute if score #Point_b dom_prog_b matches ..-20 run scoreboard players set #Point_b dom_prog_b -20

# --- [B-L2] 佔領判定 ---
# 紅隊佔領 B 點
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 20 run scoreboard players set #dom_round_winner dom_config 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 20 run scoreboard players set #dom_capture_point dom_config 2
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 20 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,team=red] run scoreboard players add @s stat_dom_flips_match 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 20 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,team=red] run scoreboard players add @s stat_dom_flips 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 20 run function game_core:gamemode/dom/round_end_capture

# 藍隊佔領 B 點
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-20 run scoreboard players set #dom_round_winner dom_config 2
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-20 run scoreboard players set #dom_capture_point dom_config 2
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-20 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,team=blue] run scoreboard players add @s stat_dom_flips_match 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-20 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,team=blue] run scoreboard players add @s stat_dom_flips 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-20 run function game_core:gamemode/dom/round_end_capture
