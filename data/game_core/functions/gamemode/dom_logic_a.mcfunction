# --- [A-L0] 攔截休戰狀態 (State 4) ---
# 休戰倒數扣除
execute if score #Point_a dom_state matches 4 run scoreboard players remove #Point_a dom_truce_timer 1
# 倒數結束，重置為中立(State 1)並廣播
execute if score #Point_a dom_state matches 4 if score #Point_a dom_truce_timer matches ..0 run tellraw @a {"text":"[系統] A 點休戰結束，重新開放爭奪！","color":"yellow","bold":true}
execute if score #Point_a dom_state matches 4 if score #Point_a dom_truce_timer matches ..0 run fill 196 24 -13 188 24 -21 minecraft:gold_block replace
execute if score #Point_a dom_state matches 4 if score #Point_a dom_truce_timer matches ..0 run scoreboard players set #Point_a dom_state 1
# 處於休戰狀態時，中止後續任何進度推移
execute if score #Point_a dom_state matches 4 run return 0

# --- [A-L1] 進度推移 ---
# (保留原有的 += #a_red_speed 等邏輯)
execute if score #Point_a dom_state matches 1.. if score #a_contested temp_score matches 0 if score #a_red_count temp_score matches 1.. run scoreboard players operation #Point_a dom_prog_a += #a_red_speed temp_score
execute if score #Point_a dom_state matches 1.. if score #a_contested temp_score matches 0 if score #a_blue_count temp_score matches 1.. run scoreboard players operation #Point_a dom_prog_a -= #a_blue_speed temp_score

# 限制進度邊界 (-45 ~ 45)
execute if score #Point_a dom_prog_a matches 45.. run scoreboard players set #Point_a dom_prog_a 45
execute if score #Point_a dom_prog_a matches ..-45 run scoreboard players set #Point_a dom_prog_a -45

# --- [A-L2] 狀態轉移：佔領與休戰 ---
# 紅隊佔領 (進度達45)
execute if score #Point_a dom_prog_a matches 45 if score #Point_a dom_state matches ..1 run fill 196 24 -13 188 24 -21 minecraft:red_concrete replace
execute if score #Point_a dom_prog_a matches 45 if score #Point_a dom_state matches ..1 run tellraw @a {"text":"[系統] 紅隊 成功佔領了 A 點！","color":"red","bold":true}
execute if score #Point_a dom_prog_a matches 45 if score #Point_a dom_state matches ..1 run scoreboard players set #Point_a dom_state 2

# 藍隊佔領 (進度達-45)
execute if score #Point_a dom_prog_a matches ..-45 if score #Point_a dom_state matches ..1 run fill 196 24 -13 188 24 -21 minecraft:blue_concrete replace
execute if score #Point_a dom_prog_a matches ..-45 if score #Point_a dom_state matches ..1 run tellraw @a {"text":"[系統] 藍隊 成功佔領了 A 點！","color":"blue","bold":true}
execute if score #Point_a dom_prog_a matches ..-45 if score #Point_a dom_state matches ..1 run scoreboard players set #Point_a dom_state 3

# 中立化觸發休戰 (由紅/藍方佔領流失至 0，觸發 30s = 600 Ticks 休戰)
# 紅方流失判定
execute if score #Point_a dom_state matches 2 if score #Point_a dom_prog_a matches ..0 run fill 196 24 -13 188 24 -21 minecraft:iron_block replace
execute if score #Point_a dom_state matches 2 if score #Point_a dom_prog_a matches ..0 run tellraw @a {"text":"[系統] A 點已被中立化，進入 30 秒休戰重整！","color":"gray"}
execute if score #Point_a dom_state matches 2 if score #Point_a dom_prog_a matches ..0 run scoreboard players set #Point_a dom_truce_timer 30
execute if score #Point_a dom_state matches 2 if score #Point_a dom_prog_a matches ..0 run scoreboard players set #Point_a dom_state 4
execute if score #Point_a dom_state matches 2 if score #Point_a dom_prog_a matches ..0 run scoreboard players set #Point_a dom_prog_a 0

# 藍方流失判定
execute if score #Point_a dom_state matches 3 if score #Point_a dom_prog_a matches 0.. run fill 196 24 -13 188 24 -21 minecraft:iron_block replace
execute if score #Point_a dom_state matches 3 if score #Point_a dom_prog_a matches 0.. run tellraw @a {"text":"[系統] A 點已被中立化，進入 30 秒休戰重整！","color":"gray"}
execute if score #Point_a dom_state matches 3 if score #Point_a dom_prog_a matches 0.. run scoreboard players set #Point_a dom_truce_timer 30
execute if score #Point_a dom_state matches 3 if score #Point_a dom_prog_a matches 0.. run scoreboard players set #Point_a dom_state 4
execute if score #Point_a dom_state matches 3 if score #Point_a dom_prog_a matches 0.. run scoreboard players set #Point_a dom_prog_a 0

# --- [A-L4] 隊伍佔領跳分系統 ---
# 必須嚴格使用大寫 #Red 與 #Blue 以對齊勝利判定與 UI 映射
execute if score #Point_a dom_state matches 2 if score #a_prog_abs temp_score matches 23.. run scoreboard players add #Red dom_score 1
execute if score #Point_a dom_state matches 3 if score #a_prog_abs temp_score matches 23.. run scoreboard players add #Blue dom_score 1