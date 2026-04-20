# ==========================================
# 📍 A 點：Marker 偵測、倍速判定與個人獎勵
# ==========================================
execute if score #global arms_sub_mode matches 2 run scoreboard players set #a_red_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #a_blue_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #a_contested temp_score 0

# 區域偵測 (188~196, 24~27, -21~-13)
execute if score #global arms_sub_mode matches 2 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7] as @s run function game_core:gamemode/dom_detect_a

# --- A點：判定衝突與推進速度 (1~3倍速) ---
execute if score #global arms_sub_mode matches 2 if score #a_red_count temp_score matches 1.. if score #a_blue_count temp_score matches 1.. run scoreboard players set #a_contested temp_score 1

# 提取紅隊人數為速度，最高限制為 3
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #a_red_speed temp_score = #a_red_count temp_score
execute if score #global arms_sub_mode matches 2 if score #a_red_speed temp_score matches 4.. run scoreboard players set #a_red_speed temp_score 3

# 提取藍隊人數為速度，最高限制為 3
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #a_blue_speed temp_score = #a_blue_count temp_score
execute if score #global arms_sub_mode matches 2 if score #a_blue_speed temp_score matches 4.. run scoreboard players set #a_blue_speed temp_score 3

# 執行核心與 UI 更新 (每秒 20 Tick 皆執行 UI 更新，核心邏輯維持原頻率)
execute if score #global arms_sub_mode matches 2 if score #global dom_timer matches 20 run function game_core:gamemode/dom_logic_a

# 團隊站點防守金錢獎勵
#紅隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_a dom_state matches 2 if score #a_contested temp_score matches 0 as @a[team=red] run gd656killicon server statistics add score @s 2
#藍隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_a dom_state matches 3 if score #a_contested temp_score matches 0 as @a[team=blue] run gd656killicon server statistics add score @s 2

# 個人站點防守金錢獎勵
#紅隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_a dom_state matches 2 if score #a_contested temp_score matches 0 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,team=red] run gd656killicon server statistics add score @s 2
#藍隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_a dom_state matches 3 if score #a_contested temp_score matches 0 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,team=blue] run gd656killicon server statistics add score @s 2

# ==========================================
# 📍 B 點：Marker 偵測、倍速判定與個人獎勵
# ==========================================
execute if score #global arms_sub_mode matches 2 run scoreboard players set #b_red_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #b_blue_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #b_contested temp_score 0

# 區域偵測 (Marker 置於 156 13 -53，範圍 11x4x11 -> dx=10, dy=3, dz=10)
execute if score #global arms_sub_mode matches 2 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] as @s run function game_core:gamemode/dom_detect_b

# --- B點：判定衝突與推進速度 (1~3倍速) ---
execute if score #global arms_sub_mode matches 2 if score #b_red_count temp_score matches 1.. if score #b_blue_count temp_score matches 1.. run scoreboard players set #b_contested temp_score 1

# 提取紅隊人數為速度，最高限制為 3
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #b_red_speed temp_score = #b_red_count temp_score
execute if score #global arms_sub_mode matches 2 if score #b_red_speed temp_score matches 4.. run scoreboard players set #b_red_speed temp_score 3

# 提取藍隊人數為速度，最高限制為 3
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #b_blue_speed temp_score = #b_blue_count temp_score
execute if score #global arms_sub_mode matches 2 if score #b_blue_speed temp_score matches 4.. run scoreboard players set #b_blue_speed temp_score 3

# 執行核心與 UI 更新 (每秒 20 Tick 皆執行 UI 更新，核心邏輯維持原頻率)
execute if score #global arms_sub_mode matches 2 if score #global dom_timer matches 20 run function game_core:gamemode/dom_logic_b

# 團隊站點防守金錢獎勵
#紅隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_b dom_state matches 2 if score #b_contested temp_score matches 0 as @a[team=red] run gd656killicon server statistics add score @s 2
#藍隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_b dom_state matches 3 if score #b_contested temp_score matches 0 as @a[team=blue] run gd656killicon server statistics add score @s 2

# 個人站點防守金錢獎勵
#紅隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_b dom_state matches 2 if score #b_contested temp_score matches 0 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,team=red] run gd656killicon server statistics add score @s 2
#藍隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_b dom_state matches 3 if score #b_contested temp_score matches 0 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,team=blue] run gd656killicon server statistics add score @s 2


# ==========================================
# 📍 C 點：Marker 偵測、倍速判定與個人獎勵
# ==========================================
execute if score #global arms_sub_mode matches 2 run scoreboard players set #c_red_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #c_blue_count temp_score 0
execute if score #global arms_sub_mode matches 2 run scoreboard players set #c_contested temp_score 0

# 區域偵測 (Marker 置於 115 13 -94，範圍 16x4x16 -> dx=15, dy=3, dz=15)
execute if score #global arms_sub_mode matches 2 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] as @s run function game_core:gamemode/dom_detect_c

# --- B點：判定衝突與推進速度 (1~3倍速) ---
execute if score #global arms_sub_mode matches 2 if score #c_red_count temp_score matches 1.. if score #c_blue_count temp_score matches 1.. run scoreboard players set #c_contested temp_score 1

# 提取紅隊人數為速度，最高限制為 3
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #c_red_speed temp_score = #c_red_count temp_score
execute if score #global arms_sub_mode matches 2 if score #c_red_speed temp_score matches 4.. run scoreboard players set #c_red_speed temp_score 3

# 提取藍隊人數為速度，最高限制為 3
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #c_blue_speed temp_score = #c_blue_count temp_score
execute if score #global arms_sub_mode matches 2 if score #c_blue_speed temp_score matches 4.. run scoreboard players set #c_blue_speed temp_score 3

# 執行核心與 UI 更新 (每秒 20 Tick 皆執行 UI 更新，核心邏輯維持原頻率)
execute if score #global arms_sub_mode matches 2 if score #global dom_timer matches 20 run function game_core:gamemode/dom_logic_c

# 團隊站點防守金錢獎勵
#紅隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_c dom_state matches 2 if score #c_contested temp_score matches 0 as @a[team=red] run gd656killicon server statistics add score @s 2
#藍隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_c dom_state matches 3 if score #c_contested temp_score matches 0 as @a[team=blue] run gd656killicon server statistics add score @s 2

# 個人站點防守金錢獎勵
#紅隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_c dom_state matches 2 if score #c_contested temp_score matches 0 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,team=red] run gd656killicon server statistics add score @s 2
#藍隊佔領
execute if score #global arms_sub_mode matches 2 if score #100tick dom_timer matches 100 if score #Point_c dom_state matches 3 if score #c_contested temp_score matches 0 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,team=blue] run gd656killicon server statistics add score @s 2
