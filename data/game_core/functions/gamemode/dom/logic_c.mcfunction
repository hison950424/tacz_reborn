# --- [C-L1] 進度推移 ---
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #c_contested temp_score matches 0 if score #c_red_count temp_score matches 1.. run scoreboard players operation #Point_c dom_prog_c += #c_red_speed temp_score
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #c_contested temp_score matches 0 if score #c_blue_count temp_score matches 1.. run scoreboard players operation #Point_c dom_prog_c -= #c_blue_speed temp_score

# 限制進度邊界（-20 ~ 20）
execute if score #Point_c dom_prog_c matches 20.. run scoreboard players set #Point_c dom_prog_c 20
execute if score #Point_c dom_prog_c matches ..-20 run scoreboard players set #Point_c dom_prog_c -20

# --- [C-L2] 佔領判定 ---
# 紅隊佔領 C 點
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 20 run scoreboard players set #dom_round_winner dom_config 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 20 run scoreboard players set #dom_capture_point dom_config 3
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 20 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,team=red] run scoreboard players add @s stat_dom_flips_match 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 20 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,team=red] run scoreboard players add @s stat_dom_flips 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 20 run function game_core:gamemode/dom/round_end_capture

# 藍隊佔領 C 點
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-20 run scoreboard players set #dom_round_winner dom_config 2
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-20 run scoreboard players set #dom_capture_point dom_config 3
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-20 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,team=blue] run scoreboard players add @s stat_dom_flips_match 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-20 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,team=blue] run scoreboard players add @s stat_dom_flips 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-20 run function game_core:gamemode/dom/round_end_capture
