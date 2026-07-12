# ==========================================
# 📍 A 點：Marker 偵測、倍速判定
# ==========================================
execute if score #global arms_sub_mode matches 2 run scoreboard players set #a_red_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #a_blue_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #a_contested temp_score 0

execute if score #global arms_sub_mode matches 2 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7] as @s run function game_core:gamemode/dom/detect_a

execute if score #global arms_sub_mode matches 2 if score #a_red_count temp_score matches 1.. if score #a_blue_count temp_score matches 1.. run scoreboard players set #a_contested temp_score 1

# 推進速度：人數即速度，上限 2（2 人 = 10 秒，1 人 = 20 秒）
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #a_red_speed temp_score = #a_red_count temp_score
execute if score #global arms_sub_mode matches 2 if score #a_red_speed temp_score matches 3.. run scoreboard players set #a_red_speed temp_score 2
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #a_blue_speed temp_score = #a_blue_count temp_score
execute if score #global arms_sub_mode matches 2 if score #a_blue_speed temp_score matches 3.. run scoreboard players set #a_blue_speed temp_score 2

execute if score #global arms_sub_mode matches 2 if score #global dom_timer matches 20 run function game_core:gamemode/dom/logic_a

# ==========================================
# 📍 B 點：Marker 偵測、倍速判定
# ==========================================
execute if score #global arms_sub_mode matches 2 run scoreboard players set #b_red_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #b_blue_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #b_contested temp_score 0

execute if score #global arms_sub_mode matches 2 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] as @s run function game_core:gamemode/dom/detect_b

execute if score #global arms_sub_mode matches 2 if score #b_red_count temp_score matches 1.. if score #b_blue_count temp_score matches 1.. run scoreboard players set #b_contested temp_score 1

execute if score #global arms_sub_mode matches 2 run scoreboard players operation #b_red_speed temp_score = #b_red_count temp_score
execute if score #global arms_sub_mode matches 2 if score #b_red_speed temp_score matches 3.. run scoreboard players set #b_red_speed temp_score 2
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #b_blue_speed temp_score = #b_blue_count temp_score
execute if score #global arms_sub_mode matches 2 if score #b_blue_speed temp_score matches 3.. run scoreboard players set #b_blue_speed temp_score 2

execute if score #global arms_sub_mode matches 2 if score #global dom_timer matches 20 run function game_core:gamemode/dom/logic_b

# ==========================================
# 📍 C 點：Marker 偵測、倍速判定
# ==========================================
execute if score #global arms_sub_mode matches 2 run scoreboard players set #c_red_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #c_blue_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #c_contested temp_score 0

execute if score #global arms_sub_mode matches 2 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] as @s run function game_core:gamemode/dom/detect_c

execute if score #global arms_sub_mode matches 2 if score #c_red_count temp_score matches 1.. if score #c_blue_count temp_score matches 1.. run scoreboard players set #c_contested temp_score 1

execute if score #global arms_sub_mode matches 2 run scoreboard players operation #c_red_speed temp_score = #c_red_count temp_score
execute if score #global arms_sub_mode matches 2 if score #c_red_speed temp_score matches 3.. run scoreboard players set #c_red_speed temp_score 2
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #c_blue_speed temp_score = #c_blue_count temp_score
execute if score #global arms_sub_mode matches 2 if score #c_blue_speed temp_score matches 3.. run scoreboard players set #c_blue_speed temp_score 2

execute if score #global arms_sub_mode matches 2 if score #global dom_timer matches 20 run function game_core:gamemode/dom/logic_c
