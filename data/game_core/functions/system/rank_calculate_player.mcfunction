# ==========================================
# 檔案: system/rank_calculate_player.mcfunction
# 目的: 計算單一玩家本局 RP 增減（以玩家身份執行）
# 公式: RP = (K×#rp_k5) + (A×#rp_a2) + (W×#rp_w50) + (S×#rp_s20)
#           + (R×#rp_rev[BR]) + (T×#rp_alt[BR])
#           - (D×#rp_d3) - (L×#rp_l15)
#       S = 計算前該模式連勝數（先乘加，再 increment）
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

# +W × #rp_w50（獲勝加分）
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_w50 rank_const

# -L × #rp_l15（敗場扣分）
execute if entity @s[tag=rp_loser] run scoreboard players operation @s rp_delta -= #rp_l15 rank_const

# +S × #rp_s20（連勝加成：依模式取對應連勝，先乘加，再 increment）
execute if entity @s[tag=rp_winner] run scoreboard players set #rp_temp rank_temp 0
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_br
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 1 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_tdm
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_dom
execute if entity @s[tag=rp_winner] run scoreboard players operation #rp_temp rank_temp *= #rp_s20 rank_const
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# +R × #rp_rev（BR 拉起隊友加分）
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_br_revives_match
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp *= #rp_rev rank_const
execute if score #global arms_sub_mode matches 0 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# +T × #rp_alt（BR 祭壇復活加分）
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_br_altars_match
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp *= #rp_alt rank_const
execute if score #global arms_sub_mode matches 0 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# DOM 個人貢獻加分（佔點過程 / 佔點成功 / 守點，僅 DOM 模式）
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_caps_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_cap rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_flips_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_flip rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_def_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_def rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# 套用 delta，下限 0
execute as @a run scoreboard players operation @s rp_score += @s rp_delta
execute as @a if score @s rp_score matches ..-1 run scoreboard players set @s rp_score 0

# 更新連勝 & 勝敗統計（各模式獨立）
# BR（arms_sub_mode=0）
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_streak_br 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_wins_br 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players set @s stat_streak_br 0
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses_br 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses 1
# TDM（arms_sub_mode=1）
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 1 run scoreboard players add @s stat_streak_tdm 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 1 run scoreboard players add @s stat_wins_tdm 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 1 run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 1 run scoreboard players set @s stat_streak_tdm 0
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 1 run scoreboard players add @s stat_losses_tdm 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 1 run scoreboard players add @s stat_losses 1
# DOM（arms_sub_mode=2）
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 2 run scoreboard players add @s stat_streak_dom 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 2 run scoreboard players add @s stat_wins_dom 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 2 run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 2 run scoreboard players set @s stat_streak_dom 0
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 2 run scoreboard players add @s stat_losses_dom 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 2 run scoreboard players add @s stat_losses 1
