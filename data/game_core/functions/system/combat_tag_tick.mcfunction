# ==========================================
# 檔案: system/combat_tag_tick.mcfunction
# 目的: 迷你死鬥戰鬥標記計時（只在 game_state=0 運行）
# 呼叫來源: lobby_tick.mcfunction
# 依賴: p_health (health), combat_tag / combat_tag_sec (dummy), prev_health (dummy)
# ==========================================

# --- [1] 偵測受傷（血量小於上一tick）---
# 只追蹤 mini DM 區域玩家（無 in_lobby 且無 on_parkour tag）
execute as @a[tag=!in_lobby,tag=!on_parkour] if score @s p_health < @s prev_health run function game_core:system/combat_tag_apply

# --- [2] 計時器遞減（每 tick）---
scoreboard players remove @a[tag=in_combat,scores={combat_tag=1..}] combat_tag 1

# --- [3] 戰鬥標記到期：移除狀態並換回普通書 ---
execute as @a[tag=in_combat,scores={combat_tag=0}] run tag @s remove in_combat
execute as @a[tag=in_combat,scores={combat_tag=0}] run function game_core:lobby/give_lobby_terminal

# --- [4] 更新 prev_health ---
execute as @a run scoreboard players operation @s prev_health = @s p_health
