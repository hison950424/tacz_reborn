# ==========================================
# 檔案: rank/calc_player.mcfunction
# 目的: 計算單一玩家本局 RP 增減（以玩家身份執行）
#
# 呼叫方式: execute as @a run function game_core:rank/calc_player
#   → 由 rank/calc.mcfunction 以 as @a 批次呼叫，@s 為目標玩家
#
# 公式總覽（各倍率常數由 calc.mcfunction 依模式預先寫入 rank_const）:
#   rp_delta = K × rp_k5                         ← 擊殺
#            + A × rp_a2                          ← 助攻
#            - D × rp_d3                          ← 死亡扣分
#            + W × rp_w50                         ← 勝利加分（固定常數）
#            - L × rp_l15                         ← 敗場扣分（固定常數）
#            + S × rp_s20  [僅勝者]               ← 連勝加成（計算前的連勝數）
#            + R × rp_rev  [BR 模式]              ← 拉起隊友
#            + T × rp_alt  [BR 模式]              ← 祭壇復活
#            + dom_caps × rp_dom_cap [DOM 模式]   ← 佔點過程（每 5 秒）
#            + dom_flips × rp_dom_flip [DOM 模式] ← 佔點成功
#            + dom_def × rp_dom_def [DOM 模式]    ← 守點
#
# ⚠️ 注意：連勝加成使用「計算前」的連勝數（舊值），
#    連勝 increment 在本函式末尾才執行，確保第一勝連勝=0，第二勝連勝=1，以此類推。
#
# ⚠️ 注意：比賽積分（event_score）不在此處更新。
#    event_score 僅在 match_end.mcfunction 的 event_mode=1 條件下累加 rp_delta，
#    避免雙重計算（此函式每場每人只執行一次，但曾有 as @a 的錯誤設計）。
# ==========================================

scoreboard players set @s rp_delta 0

# ------------------------------------------
# [1] K × rp_k5 — 擊殺加分
#     BR: ×12  TDM: ×3  DOM: ×1
# ------------------------------------------
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.kill
scoreboard players operation #rp_temp rank_temp *= #rp_k5 rank_const
scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ------------------------------------------
# [2] A × rp_a2 — 助攻加分
#     BR: ×4  TDM: ×2  DOM: ×1
# ------------------------------------------
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.assist
scoreboard players operation #rp_temp rank_temp *= #rp_a2 rank_const
scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ------------------------------------------
# [3] -D × rp_d3 — 死亡扣分
#     BR/TDM/DOM 均為 ×2
# ------------------------------------------
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.death
scoreboard players operation #rp_temp rank_temp *= #rp_d3 rank_const
scoreboard players operation @s rp_delta -= #rp_temp rank_temp

# ------------------------------------------
# [4] +W × rp_w50 — 勝利加分（固定常數，僅勝者）
#     BR: 200~380（依人數動態調整）  TDM/DOM: 80
# ------------------------------------------
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_w50 rank_const

# ------------------------------------------
# [5] -L × rp_l15 — 敗場扣分（固定常數，僅敗者）
#     BR: -10  TDM: -15  DOM: -15
#     ⚠️ 孤狼 BR 敗者（rp_stat_loser）不加 rp_loser tag，故不扣 RP
# ------------------------------------------
execute if entity @s[tag=rp_loser] run scoreboard players operation @s rp_delta -= #rp_l15 rank_const

# ------------------------------------------
# [6] +S × rp_s20 — 連勝加成（僅勝者，取計算前的連勝數）
#     BR: ×50  TDM: ×20  DOM: ×20
#     例：TDM 連勝 3 場 → 第 4 場勝利時，S=3，加 60 RP
# ------------------------------------------
execute if entity @s[tag=rp_winner] run scoreboard players set #rp_temp rank_temp 0
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_br
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 1 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_tdm
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_dom
execute if entity @s[tag=rp_winner] run scoreboard players operation #rp_temp rank_temp *= #rp_s20 rank_const
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ------------------------------------------
# [7] +R × rp_rev — BR 拉起隊友加分（×20/次）
#     stat_br_revives_match 在 BR 復活動作中累計，每場結束後由 match_reset 清零
# ------------------------------------------
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_br_revives_match
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp *= #rp_rev rank_const
execute if score #global arms_sub_mode matches 0 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ------------------------------------------
# [8] +T × rp_alt — BR 靈魂祭壇復活加分（×40/次）
#     stat_br_altars_match 在祭壇復活動作中累計，每場結束後由 match_reset 清零
# ------------------------------------------
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_br_altars_match
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp *= #rp_alt rank_const
execute if score #global arms_sub_mode matches 0 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ------------------------------------------
# [9] DOM 個人貢獻加分（佔點過程 / 佔點成功 / 守點，僅 DOM 模式）
#     rp_dom_cap: ×2/5秒  rp_dom_flip: +10/次  rp_dom_def: ×2/5秒
#     _match 版本每場結束後由 match_reset 清零，_total 版本永久累計
# ------------------------------------------
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_caps_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_cap rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_flips_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_flip rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_def_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_def rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ------------------------------------------
# [10] 套用 rp_delta 至 rp_score，下限鎖 0（不允許負數）
#
# ⚠️ 【已修復】此函式由 rank/calc.mcfunction 以 as @a 呼叫，
#    不應在此再加 as @a，否則 N 人場時每人的 rp_delta 會被累加 N 次。
#
# ⚠️ 【已修復】event_score（比賽積分）不在此處累加。
#    舊版本在此無條件加 event_score += rp_delta，導致：
#    · event_mode=0：比賽積分仍被修改（不應該）
#    · event_mode=1：match_end 又再加一次，造成比賽積分 = RP 的兩倍
#    正確做法：event_score 由 match_end.mcfunction 在 event_mode=1 時統一更新
# ------------------------------------------
scoreboard players operation @s rp_score += @s rp_delta
execute if score @s rp_score matches ..-1 run scoreboard players set @s rp_score 0

# ------------------------------------------
# [11] 更新連勝 & 勝敗統計（各模式獨立計算）
#      連勝數在此 increment，晚於 [6] 的連勝加成讀取，確保當場勝利的連勝不計入本局
# ------------------------------------------
# BR（arms_sub_mode=0）
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_streak_br 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_wins_br 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players set @s stat_streak_br 0
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses_br 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses 1
# 孤狼 BR 敗場（rp_stat_loser：不扣 RP，只記勝敗統計，連勝重置）
execute if entity @s[tag=rp_stat_loser] if score #global arms_sub_mode matches 0 run scoreboard players set @s stat_streak_br 0
execute if entity @s[tag=rp_stat_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses_br 1
execute if entity @s[tag=rp_stat_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses 1
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
