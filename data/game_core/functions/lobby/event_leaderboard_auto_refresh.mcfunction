# ==========================================
# 檔案: lobby/event_leaderboard_auto_refresh.mcfunction
# 目的: 依據 event_mode 狀態自動選擇對應的排行榜顯示
#       event_mode=1 → 🟢 進行中（顯示積分）
#       event_mode=0 → 🔴 未開放（顯示關閉訊息）
# ==========================================

execute if score #global event_mode matches 1 run function game_core:lobby/event_leaderboard_refresh
execute if score #global event_mode matches 0 run function game_core:lobby/event_leaderboard_refresh_inactive
