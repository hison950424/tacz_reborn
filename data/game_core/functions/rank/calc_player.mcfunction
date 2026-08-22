# ==========================================
# 檔案: rank/calc_player.mcfunction
# 目的: 計算單一玩家本局 RP 增減，套用到 rp_score，並更新勝敗/連勝統計
# 執行者: @s（由 rank/calc.mcfunction 以 execute as @a run 呼叫）
#
# 完整公式：
#   rp_delta = K×#rp_k5 + A×#rp_a2 - D×#rp_d3
#            + [勝利 #rp_w50] - [敗場 #rp_l15]
#            + [勝者] S×#rp_s20（S = 計算前該模式連勝數）
#            + [BR] R×#rp_rev + T×#rp_alt
#            + [DOM] cap×#rp_dom_cap + flip×#rp_dom_flip + def×#rp_dom_def
#            + [TDM/DOM] floor(elapsed_sec / #rp_time_div) × #rp_time_bonus
#            + [GK] gk_stage_score × #rp_gk_stage
#   rp_score += rp_delta（下限 0，不允許負分）
#
# 資料來源：
#   K/A/D → gd656killicon.kill / .assist / .death（mod 提供的 scoreboard objective）
#   S     → stat_streak_br / stat_streak_tdm / stat_streak_dom / stat_streak_gk
#   R     → stat_br_revives_match（每局清零）
#   T     → stat_br_altars_match（每局清零）
#   cap/flip/def → stat_dom_caps_match / stat_dom_flips_match / stat_dom_def_match
#   elapsed → #tdm_elapsed tdm_config（TDM秒數）/ #global dom_arms_timer（DOM秒數）
#   gk_stage_score → 由 gamemode/gk/calc_stage_score.mcfunction 預先寫入
# ==========================================

scoreboard players set @s rp_delta 0

# ── K × #rp_k5（擊殺加分）────────────────────────────────────────
# gd656killicon.kill 由模組即時維護，直接讀取即可（無需與原版 kill 同步）
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.kill
scoreboard players operation #rp_temp rank_temp *= #rp_k5 rank_const
scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── A × #rp_a2（助攻加分）────────────────────────────────────────
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.assist
scoreboard players operation #rp_temp rank_temp *= #rp_a2 rank_const
scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── -D × #rp_d3（死亡扣分）───────────────────────────────────────
scoreboard players operation #rp_temp rank_temp = @s gd656killicon.death
scoreboard players operation #rp_temp rank_temp *= #rp_d3 rank_const
scoreboard players operation @s rp_delta -= #rp_temp rank_temp

# ── +W × #rp_w50（獲勝固定加分）─────────────────────────────────
# rp_winner 標記由 calc.mcfunction 在呼叫本函式前設置
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_w50 rank_const

# ── -L × #rp_l15（敗場固定扣分）─────────────────────────────────
# rp_loser 標記同上；孤狼 BR 敗者使用 rp_stat_loser，不扣 RP
execute if entity @s[tag=rp_loser] run scoreboard players operation @s rp_delta -= #rp_l15 rank_const

# ── +S × #rp_s20（連勝加成）──────────────────────────────────────
# 僅勝者計算；讀取計算前的連勝值（這一局勝利後的 increment 在本段執行後才進行）
# 各模式連勝獨立儲存，以 arms_sub_mode 路由讀取正確的 stat_streak_*
execute if entity @s[tag=rp_winner] run scoreboard players set #rp_temp rank_temp 0
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_br
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 1 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_tdm
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_dom
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 3 run scoreboard players operation #rp_temp rank_temp = @s stat_streak_gk
execute if entity @s[tag=rp_winner] run scoreboard players operation #rp_temp rank_temp *= #rp_s20 rank_const
execute if entity @s[tag=rp_winner] run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── +R × #rp_rev（BR 拉起隊友加分）──────────────────────────────
# stat_br_revives_match 在每局開始時歸零，記錄本局累計拉起次數
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_br_revives_match
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp *= #rp_rev rank_const
execute if score #global arms_sub_mode matches 0 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── +T × #rp_alt（BR 靈魂祭壇復活加分）──────────────────────────
# stat_br_altars_match 在每局開始時歸零，記錄本局累計祭壇使用次數
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp = @s stat_br_altars_match
execute if score #global arms_sub_mode matches 0 run scoreboard players operation #rp_temp rank_temp *= #rp_alt rank_const
execute if score #global arms_sub_mode matches 0 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── DOM 個人貢獻加分（佔點過程 / 佔點成功 / 守點）────────────────
# cap  = 玩家在奪點期間每 5 秒觸發一次（stat_dom_caps_match）
# flip = 玩家所在點被成功翻轉時觸發（stat_dom_flips_match）
# def  = 玩家在己方控制點附近每 5 秒觸發一次（stat_dom_def_match）
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_caps_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_cap rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_flips_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_flip rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = @s stat_dom_def_match
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_dom_def rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── 時間加成（TDM/DOM 專用，GK 以階段加成替代）───────────────────
# 公式：floor(elapsed_seconds / 30) × 20，每 30 秒 +20 RP
# TDM 資料來源：#tdm_elapsed tdm_config（timer_tick.mcfunction 每秒累加）
#   10 分鐘 = 600 秒 → floor(600/30)×20 = 400 RP
# DOM 資料來源：#global dom_arms_timer（dom/main_tick.mcfunction 每秒累加）
#   15 分鐘 = 900 秒 → floor(900/30)×20 = 600 RP
execute if score #global arms_sub_mode matches 1 run scoreboard players operation #rp_temp rank_temp = #tdm_elapsed tdm_config
execute if score #global arms_sub_mode matches 1 run scoreboard players operation #rp_temp rank_temp /= #rp_time_div rank_const
execute if score #global arms_sub_mode matches 1 run scoreboard players operation #rp_temp rank_temp *= #rp_time_bonus rank_const
execute if score #global arms_sub_mode matches 1 run scoreboard players operation @s rp_delta += #rp_temp rank_temp
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp = #global dom_arms_timer
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp /= #rp_time_div rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation #rp_temp rank_temp *= #rp_time_bonus rank_const
execute if score #global arms_sub_mode matches 2 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── GK 階段加成（槍王之王專用）───────────────────────────────────
# gk_stage_score 由 gamemode/gk/calc_stage_score.mcfunction 在 match_end 前計算：
#   玩家所屬隊伍的 #gk_stage_<team> - 1
#   勝者 stage=10 → gk_stage_score=9 → 9×120 = 1080 RP
#   完成 7 階段 → gk_stage_score=6 → 6×120 = 720 RP
#   完成 5 階段 → gk_stage_score=4 → 4×120 = 480 RP
#   完成 1 階段（從未進步）→ gk_stage_score=0 → 0 RP
# 此設計讓「時間投入越多、推進越多階段」的玩家獲得更多 RP，鼓勵持續推進
execute if score #global arms_sub_mode matches 3 run scoreboard players operation #rp_temp rank_temp = @s gk_stage_score
execute if score #global arms_sub_mode matches 3 run scoreboard players operation #rp_temp rank_temp *= #rp_gk_stage rank_const
execute if score #global arms_sub_mode matches 3 run scoreboard players operation @s rp_delta += #rp_temp rank_temp

# ── 套用 delta 到 rp_score（下限 0）──────────────────────────────
# 注意：此函式已由 calc.mcfunction 以 execute as @a run 呼叫，
#   不可在此再次 execute as @a，否則 N 名玩家時每人 delta 被累加 N 倍。
scoreboard players operation @s rp_score += @s rp_delta
# event_score 由 match_end 統一累加（event_mode=1 時），不在此處處理
execute if score @s rp_score matches ..-1 run scoreboard players set @s rp_score 0

# ── 更新勝敗/連勝統計（各模式獨立）──────────────────────────────
# BR（arms_sub_mode=0）
# 注意：孤狼 BR 的連勝/敗場透過 rp_stat_loser 單獨處理（不扣 RP，只記統計）
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_streak_br 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_wins_br 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players set @s stat_streak_br 0
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses_br 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 0 run scoreboard players add @s stat_losses 1
# 孤狼 BR 敗場（rp_stat_loser：不扣 RP，只記統計，連勝歸零）
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
# GK（arms_sub_mode=3）
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 3 run scoreboard players add @s stat_streak_gk 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 3 run scoreboard players add @s stat_wins_gk 1
execute if entity @s[tag=rp_winner] if score #global arms_sub_mode matches 3 run scoreboard players add @s stat_wins 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 3 run scoreboard players set @s stat_streak_gk 0
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 3 run scoreboard players add @s stat_losses_gk 1
execute if entity @s[tag=rp_loser] if score #global arms_sub_mode matches 3 run scoreboard players add @s stat_losses 1