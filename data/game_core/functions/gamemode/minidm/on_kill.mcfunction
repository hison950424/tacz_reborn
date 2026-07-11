# ==========================================
# 檔案: gamemode/minidm_kill_event.mcfunction
# 目的: 玩家在迷你死鬥擊殺時執行（以擊殺者身份執行）
# ==========================================

# 計算本 tick 新增的擊殺數（通常為 1）並累加到連殺
scoreboard players operation #minidm_kdelta dummy = @s gd656killicon.kill
scoreboard players operation #minidm_kdelta dummy -= @s minidm_kill_prev
scoreboard players operation @s minidm_streak += #minidm_kdelta dummy
