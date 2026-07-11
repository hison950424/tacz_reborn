# ==========================================
# 檔案: gamemode/br_phase9_start.mcfunction
# Phase 9：決勝傷害期
# Phase 8 緩衝結束後觸發，圈外傷害升至 2，同時所有存活玩家每秒持續受到 2 HP 傷害
# 本 Phase 無自動結束計時器，由勝利條件觸發遊戲結束
# ==========================================

scoreboard players set #br_phase dummy 9

# 計時器設定為極大值，確保 Phase 9 不會自動觸發下一階段
scoreboard players set #br_timer dummy 999999

# 圈外遞增傷害升至 2 HP/s per block
worldborder damage amount 2

# ── 公告 ──
tellraw @a ["",{"text":"[系統] ","color":"gray"},{"text":"場地傷害已啟動。所有存活玩家每秒持續受到傷害。","color":"white"}]
