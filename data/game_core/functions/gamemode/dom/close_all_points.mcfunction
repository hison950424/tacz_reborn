# ==========================================
# 檔案: gamemode/dom/close_all_points.mcfunction
# 說明: 關閉所有開放中的佔點，重置進度、狀態與計數
# ==========================================
scoreboard players set #Point_a dom_state 0
scoreboard players set #Point_a dom_prog_a 0
fill 196 24 -13 188 24 -21 minecraft:iron_block replace

scoreboard players set #Point_b dom_state 0
scoreboard players set #Point_b dom_prog_b 0
fill 166 13 -53 156 13 -43 minecraft:iron_block replace

scoreboard players set #Point_c dom_state 0
scoreboard players set #Point_c dom_prog_c 0
fill 130 13 -79 115 13 -94 minecraft:iron_block replace

scoreboard players set #dom_open_count dom_config 0
scoreboard players set #dom_stalemate_sec dom_config 0
