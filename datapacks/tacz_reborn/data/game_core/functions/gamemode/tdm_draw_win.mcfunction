# ==========================================
# 檔案: gamemode/tdm_draw_win.mcfunction
# 說明: 分數相同時的處理邏輯
# ==========================================

# 1. 全域公告平手
tellraw @a {"text":"[系統] 雙方分數相同，本局平手！","color":"yellow"}
execute at @a run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1

# 2. 啟動通用的結算過場管線
# 此模組會處理：MVP 計算、轉為旁觀者、10秒後傳送回大廳清場
function game_core:system/match_end_sequence