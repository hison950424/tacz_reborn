# ==========================================
# 檔案: gamemode/dom_blue_win.mcfunction
# ==========================================

# 1. 切換狀態機為 3 (結算中)，瞬間阻斷判定迴圈
scoreboard players set #global game_state 3

# 2. 全域大標題與提示音
title @a title {"text":"藍隊獲勝！","color":"blue","bold":true}
tellraw @a {"text":"[系統] 藍隊 達到了目標佔領分數，獲得勝利！","color":"blue","bold":true}
execute at @a run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1

# 3. 啟動通用的結算過場管線 (取代舊版的 end_game)
function game_core:system/match_end_sequence