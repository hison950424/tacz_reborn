# ==========================================
# 檔案: system/combat_tag_apply.mcfunction
# 目的: 觸發或刷新戰鬥標記（以受傷玩家身份執行）
# ==========================================

# 若尚未進入戰鬥狀態 → 標記並換發戰鬥版指令書
tag @s add in_combat
# 重置/刷新 tick 計時器（15 秒 = 300 ticks）
scoreboard players set @s combat_tag 300
# 重置秒數倒數（供 actionbar 顯示用）
scoreboard players set @s combat_tag_sec 15


