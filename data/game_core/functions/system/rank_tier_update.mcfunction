# ==========================================
# 檔案: system/rank_tier_update.mcfunction
# 目的: 根據 rp_score 更新玩家軍階 T1-T10（以玩家身份執行）
#       T11 由 rank_tier11_check 另行處理
# ==========================================

scoreboard players set @s rank_tier 1
execute if score @s rp_score matches 1001.. run scoreboard players set @s rank_tier 2
execute if score @s rp_score matches 2501.. run scoreboard players set @s rank_tier 3
execute if score @s rp_score matches 4501.. run scoreboard players set @s rank_tier 4
execute if score @s rp_score matches 7001.. run scoreboard players set @s rank_tier 5
execute if score @s rp_score matches 10001.. run scoreboard players set @s rank_tier 6
execute if score @s rp_score matches 14001.. run scoreboard players set @s rank_tier 7
execute if score @s rp_score matches 19001.. run scoreboard players set @s rank_tier 8
execute if score @s rp_score matches 25001.. run scoreboard players set @s rank_tier 9
execute if score @s rp_score matches 32001.. run scoreboard players set @s rank_tier 10
