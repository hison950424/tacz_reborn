# ==========================================
# 檔案: system/rank_tier11_check.mcfunction
# 目的: 對所有 T10 玩家判定是否進入 Tier 11（全服在線前 5 名）
# ==========================================
execute as @a[scores={rank_tier=10}] run function game_core:system/rank_tier11_check_player
