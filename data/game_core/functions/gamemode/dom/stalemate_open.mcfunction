# ==========================================
# 檔案: gamemode/dom/stalemate_open.mcfunction
# 說明: 90 秒後（預先決定）→ 開啟第二個據點
# ==========================================

tellraw @a {"text":"[系統] 90 秒到！隨機開放第二個據點！","color":"yellow","bold":true}
function game_core:gamemode/dom/unlock_random
tellraw @a {"text":"[系統] 前往爭奪！","color":"red","bold":true}
