# ==========================================
# 檔案: gamemode/tdm_red_win.mcfunction
# ==========================================

# 1. 全域大標題公告
title @a title {"text":"藍隊獲勝！","color":"blue","bold":true}
execute at @a run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1

# 2. 啟動通用的結算過場管線
function game_core:system/match_end_sequence