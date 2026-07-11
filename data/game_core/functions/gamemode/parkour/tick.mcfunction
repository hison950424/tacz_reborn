# ==========================================
# 檔案: gamemode/parkour_tick.mcfunction
# 目的: 跑酷計時器（每 tick 在 lobby_tick 中呼叫）
# ==========================================

# 累計計時（僅對正在計時的玩家）
scoreboard players add @a[tag=on_parkour] park_timer 1

# 顯示即時秒數於 actionbar（每 20 tick = 1 秒更新已在 lobby_second_tick 中處理）
