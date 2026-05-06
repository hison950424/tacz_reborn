# ==========================================
# 檔案: system/rank_tier11_check_player.mcfunction
# 目的: 單一玩家的 Tier 11 判定（以玩家身份執行）
# 原理: 計算有幾個在線玩家的 rp_score > 我的 rp_score
#       若少於 5 人 → 我在前 5 名 → 升 T11
# ==========================================

scoreboard players operation #my_rp rank_temp = @s rp_score

scoreboard players set #beats_count rank_temp 0
execute as @a if score @s rp_score > #my_rp rank_temp run scoreboard players add #beats_count rank_temp 1

execute if score #beats_count rank_temp matches ..4 run scoreboard players set @s rank_tier 11
