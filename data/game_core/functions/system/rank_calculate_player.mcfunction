# ==========================================
# 檔案: system/rank_calculate_player.mcfunction
# 目的: 計算單一玩家本局 RP 增減（以玩家身份執行）
# 公式: RP = (K×5) + (A×2) + (W×50) + (S×20) - (D×3) - (L×15)
#       S = 計算前的連勝數（先乘加，再 increment streak）
# ==========================================

scoreboard players set @s rp_delta 0

# K × 5（擊殺）
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.kill
scoreboard players operation #rp_temp rank_temp *= #rp_k5 rank_const
scoreboard players operation @s rp_delta += #rp_temp rank_temp

# A × 2（助攻）
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.assist
scoreboard players operation #rp_temp rank_temp *= #rp_a2 rank_const
scoreboard players operation @s rp_delta += #rp_temp rank_temp

# -D × 3（死亡）
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.death
scoreboard players operation #rp_temp rank_temp *= #rp_d3 rank_const
scoreboard players operation @s rp_delta -= #rp_temp rank_temp

# +W × 50（獲勝加分）
execute if entity @s[tag=rp_winner] run scoreboard players add @s rp_delta 50

# -L × 15（敗場扣分）
execute if entity @s[tag=rp_loser] run scoreboard players remove @s rp_delta 15

# +S × 20（連勝加成：先乘加，再 increment）
execute if entity @s[tag=rp_winner] run scoreboard players operation #rp_temp rank_temp = @s stat_streak
execute if entity @s[tag=rp_winner] run scoreboard players operation #rp_temp rank_temp *= #rp_s20 rank_const
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_temp rank_temp
# 套用 delta，下限 0
execute as @a run scoreboard players operation @s rp_score += @s rp_delta
execute as @a if score @s rp_score matches ..-1 run scoreboard players set @s rp_score 0

# 更新連勝 & 勝敗統計
execute if entity @s[tag=rp_winner] run scoreboard players add @s stat_streak 1
execute if entity @s[tag=rp_winner] run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] run scoreboard players set @s stat_streak 0
execute if entity @s[tag=rp_loser] run scoreboard players add @s stat_losses 1
