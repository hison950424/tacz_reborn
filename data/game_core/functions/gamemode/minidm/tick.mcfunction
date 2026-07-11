# ==========================================
# 檔案: gamemode/minidm_tick.mcfunction
# 目的: 迷你死鬥邏輯（每 tick 在 lobby_tick 中呼叫）
# 運作條件: game_state=0，玩家無 in_lobby 且無 on_parkour tag
# 功能: 追蹤連殺，偵測 10+ 連殺被終結時廣播公告
# 依賴: gd656killicon.kill / .death, vanilla_death
#       minidm_streak / minidm_kill_prev / minidm_death_prev (dummy)
# ==========================================

# --- [1] 死亡偵測：vanilla_death 增加 → 連殺終結判定 ---
execute as @a[tag=!in_lobby,tag=!on_parkour] if score @s vanilla_death > @s minidm_death_prev run function game_core:gamemode/minidm/on_death
execute as @a[tag=!in_lobby,tag=!on_parkour] run scoreboard players operation @s minidm_death_prev = @s vanilla_death

# --- [2] 擊殺偵測：gd656killicon.kill 增加 → 累積連殺 ---
execute as @a[tag=!in_lobby,tag=!on_parkour] if score @s gd656killicon.kill > @s minidm_kill_prev run function game_core:gamemode/minidm/on_kill
execute as @a[tag=!in_lobby,tag=!on_parkour] run scoreboard players operation @s minidm_kill_prev = @s gd656killicon.kill
