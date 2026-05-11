# ==========================================
# 檔案: lobby/event_leaderboard_refresh_inactive.mcfunction
# 目的: 比賽模式關閉時，將 text_display 顯示為關閉狀態
# 實體: type=text_display, tag=event_leaderboard
# ==========================================

data modify entity @e[type=text_display,tag=event_leaderboard,limit=1] text set value '[{"text":"🔴 比賽積分排行榜 [未開放]\\n","color":"red","bold":true},{"text":"\\n"},{"text":"比賽模式目前關閉中。\\n","color":"gray"},{"text":"管理員開啟比賽模式後\\n","color":"dark_gray"},{"text":"可開始累積比賽積分。","color":"dark_gray"}]'
