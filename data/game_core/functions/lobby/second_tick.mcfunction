# ==========================================
# 檔案: system/lobby_second_tick.mcfunction
# 目的: 每秒執行一次的大廳邏輯
# 呼叫來源: lobby_tick.mcfunction（每 20 tick 呼叫）
# 變更: 已移除 rank_display_tick（改用聊天室通知）
# ==========================================

# --- [1] 戰鬥標記秒數倒數（combat_tag_sec）---
scoreboard players remove @a[tag=in_combat,scores={combat_tag_sec=1..}] combat_tag_sec 1

# # --- [2] 在戰鬥標記中的玩家顯示 actionbar 倒數 ---
# execute as @a[tag=in_combat,scores={combat_tag_sec=1..}] run title @s actionbar [{"text":"⚔ 戰鬥標記中，","color":"red"},{"score":{"name":"@s","objective":"combat_tag_sec"}},{"text":" 秒後可傳送","color":"red"}]

# --- [3] 跑酷計時 actionbar ---
execute as @a[tag=on_parkour] run scoreboard players operation @s park_best_sec = @s park_timer
execute as @a[tag=on_parkour] run scoreboard players operation @s park_best_sec /= #20 dom_const
execute as @a[tag=on_parkour] run title @s actionbar [{"text":"▶ 計時中: ","color":"green"},{"score":{"name":"@s","objective":"park_best_sec"},"color":"aqua"},{"text":" 秒","color":"aqua"}]
