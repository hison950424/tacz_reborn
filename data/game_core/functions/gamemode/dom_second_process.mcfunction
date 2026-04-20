# ==========================================
# 檔案: gamemode/dom_second_process.mcfunction
# 說明: 佔領模式的時間軸，每秒執行一次
# ==========================================

# --- 判定開放時間點 ---
# 30秒時開放隨機第一點
execute if score #global dom_arms_timer matches 30 run function game_core:gamemode/dom_unlock_random
# 120秒時開放隨機第二點
execute if score #global dom_arms_timer matches 120 run function game_core:gamemode/dom_unlock_random
# 240秒時開放最後一點
execute if score #global dom_arms_timer matches 240 run function game_core:gamemode/dom_unlock_random