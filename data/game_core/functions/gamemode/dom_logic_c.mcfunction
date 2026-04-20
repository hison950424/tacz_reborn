# --- [C-L0] 攔截休戰狀態 (State 4) ---
execute if score #Point_c dom_state matches 4 run scoreboard players remove #Point_c dom_truce_timer 1
execute if score #Point_c dom_state matches 4 if score #Point_c dom_truce_timer matches ..0 run tellraw @a {"text":"[系統] C 點休戰結束，重新開放爭奪！","color":"yellow","bold":true}
execute if score #Point_c dom_state matches 4 if score #Point_c dom_truce_timer matches ..0 run fill 130 13 -79 115 13 -94 minecraft:gold_block replace
execute if score #Point_c dom_state matches 4 if score #Point_c dom_truce_timer matches ..0 run scoreboard players set #Point_c dom_state 1
execute if score #Point_c dom_state matches 4 run return 0

# --- [C-L1] 進度推移 ---
execute if score #Point_c dom_state matches 1.. if score #c_contested temp_score matches 0 if score #c_red_count temp_score matches 1.. run scoreboard players operation #Point_c dom_prog_c += #c_red_speed temp_score
execute if score #Point_c dom_state matches 1.. if score #c_contested temp_score matches 0 if score #c_blue_count temp_score matches 1.. run scoreboard players operation #Point_c dom_prog_c -= #c_blue_speed temp_score

# 限制進度邊界 (-45 ~ 45)
execute if score #Point_c dom_prog_c matches 45.. run scoreboard players set #Point_c dom_prog_c 45
execute if score #Point_c dom_prog_c matches ..-45 run scoreboard players set #Point_c dom_prog_c -45

# --- [C-L2] 狀態轉移 ---
# 紅隊佔領
execute if score #Point_c dom_prog_c matches 45 if score #Point_c dom_state matches ..1 run fill 130 13 -79 115 13 -94 minecraft:red_concrete replace
execute if score #Point_c dom_prog_c matches 45 if score #Point_c dom_state matches ..1 run tellraw @a {"text":"[系統] 紅隊 成功佔領了 C 點！","color":"red","bold":true}
execute if score #Point_c dom_prog_c matches 45 if score #Point_c dom_state matches ..1 run scoreboard players set #Point_c dom_state 2

# 藍隊佔領
execute if score #Point_c dom_prog_c matches ..-45 if score #Point_c dom_state matches ..1 run fill 130 13 -79 115 13 -94 minecraft:blue_concrete replace
execute if score #Point_c dom_prog_c matches ..-45 if score #Point_c dom_state matches ..1 run tellraw @a {"text":"[系統] 藍隊 成功佔領了 C 點！","color":"blue","bold":true}
execute if score #Point_c dom_prog_c matches ..-45 if score #Point_c dom_state matches ..1 run scoreboard players set #Point_c dom_state 3

# 中立化觸發休戰
execute if score #Point_c dom_state matches 2 if score #Point_c dom_prog_c matches ..0 run fill 130 13 -79 115 13 -94 minecraft:iron_block replace
execute if score #Point_c dom_state matches 2 if score #Point_c dom_prog_c matches ..0 run scoreboard players set #Point_c dom_truce_timer 30
execute if score #Point_c dom_state matches 2 if score #Point_c dom_prog_c matches ..0 run scoreboard players set #Point_c dom_state 4
execute if score #Point_c dom_state matches 2 if score #Point_c dom_prog_c matches ..0 run scoreboard players set #Point_c dom_prog_c 0

execute if score #Point_c dom_state matches 3 if score #Point_c dom_prog_c matches 0.. run fill 130 13 -79 115 13 -94 minecraft:iron_block replace
execute if score #Point_c dom_state matches 3 if score #Point_c dom_prog_c matches 0.. run scoreboard players set #Point_c dom_truce_timer 30
execute if score #Point_c dom_state matches 3 if score #Point_c dom_prog_c matches 0.. run scoreboard players set #Point_c dom_state 4
execute if score #Point_c dom_state matches 3 if score #Point_c dom_prog_c matches 0.. run scoreboard players set #Point_c dom_prog_c 0

# --- [A-L4] 隊伍佔領跳分系統 ---
# 必須嚴格使用大寫 #Red 與 #Blue 以對齊勝利判定與 UI 映射
execute if score #Point_c dom_state matches 2 if score #c_prog_abs temp_score matches 23.. run scoreboard players add #Red dom_score 1
execute if score #Point_c dom_state matches 3 if score #c_prog_abs temp_score matches 23.. run scoreboard players add #Blue dom_score 1