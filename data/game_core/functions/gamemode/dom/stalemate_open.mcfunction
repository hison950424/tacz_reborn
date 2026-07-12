# ==========================================
# 檔案: gamemode/dom/stalemate_open.mcfunction
# 說明: 僵持 40 秒 → 重置計時器並開啟第二個點
# ==========================================

scoreboard players set #dom_stalemate_sec dom_config 0
tellraw @a {"text":"[系統] 雙方僵持，隨機開啟第二個據點！","color":"yellow","bold":true}
function game_core:gamemode/dom/unlock_random
