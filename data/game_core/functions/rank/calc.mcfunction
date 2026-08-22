# ==========================================
# 檔案: rank/calc.mcfunction
# 目的: 比賽結束時依遊戲模式設定 RP 計算常數，標記勝敗，再呼叫 calc_player
# 執行者: 伺服器（由 match_end 呼叫，非玩家身份）
#
# 累計倍率歷程：原始 ×3（初版平衡）→ ×10（大幅提效）→ ×(2/3)（微調）= 最終 ×20
#
# 各模式典型勝者 RP 估算（×20 基礎，假設條件如下）：
#   BR  ：8K/2A/0D/連勝1/10人場/25分鐘 → ~7920 RP（~317 RP/min）
#   TDM ：8K/2A/4D/連勝1/10分鐘 → ~3260 RP（~326 RP/min）
#   DOM ：5K/2A/3D/連勝0/10cap/2flip/8def/15分鐘 → ~4460 RP（~297 RP/min）
#   GK  ：8K/2A/4D/連勝1/9階段/15分鐘 → ~3940 RP（~263 RP/min）
#
# 常數名稱對照（均儲存於 rank_const objective）：
#   #rp_k5   = 擊殺倍率        #rp_a2   = 助攻倍率
#   #rp_d3   = 死亡扣分倍率    #rp_s20  = 連勝倍率（勝者才計）
#   #rp_w50  = 勝利固定加分    #rp_l15  = 敗場固定扣分
#   #rp_rev  = BR拉起倍率      #rp_alt  = BR祭壇倍率
#   #rp_dom_cap/flip/def = DOM 佔點/翻點/守點倍率
#   #rp_gk_stage  = GK 階段加成倍率（乘以 gk_stage_score）
#   #rp_time_div  = 時間加成除數（30，代表每 30 秒一個單位）
#   #rp_time_bonus = 時間加成每單位 RP（TDM/DOM 專用）
# ==========================================

# --- 依模式切換 RP 常數 ---

# ── BR（arms_sub_mode=0）──────────────────────────────────────────
# 生存型對戰；擊殺倍率最高，鼓勵積極交戰
# 勝利獎勵依場上人數動態調整：人少時擊殺機會稀少，用更高固定值補償時間成本
#擊殺+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_k5 rank_const 240
#助攻+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_a2 rank_const 80
#死亡-(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_d3 rank_const 40
#連勝+(倍率)：需在連勝 increment 前讀取，由 calc_player 處理
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_s20 rank_const 1000
#勝利+(常數)：先設基礎值，後段依人數覆蓋
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_w50 rank_const 4000
#敗場-(常數)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_l15 rank_const 200
#拉起+(倍率)：BR 專屬，每次救起倒地隊友計一次
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_rev rank_const 400
#靈魂祭壇復活+(倍率)：BR 專屬，使用祭壇復活計一次
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_alt rank_const 800

# BR 勝利獎勵動態覆蓋（依本場在線人數）
execute if score #global arms_sub_mode matches 0 run scoreboard players set #br_match_size br_sys 0
execute if score #global arms_sub_mode matches 0 as @a run scoreboard players add #br_match_size br_sys 1
# 2-4 人：擊殺機會極少，補償最高
execute if score #global arms_sub_mode matches 0 if score #br_match_size br_sys matches 1..4 run scoreboard players set #rp_w50 rank_const 7600
# 5-8 人：中小場，適度補償
execute if score #global arms_sub_mode matches 0 if score #br_match_size br_sys matches 5..8 run scoreboard players set #rp_w50 rank_const 6000
# 9-12 人：標準場，小幅補償
execute if score #global arms_sub_mode matches 0 if score #br_match_size br_sys matches 9..12 run scoreboard players set #rp_w50 rank_const 4800
# 13+ 人：大場，擊殺機會充足，沿用基礎值 4000

# ── TDM（arms_sub_mode=1）────────────────────────────────────────
# 快節奏擊殺對戰，約 10 分鐘
# 時間加成：calc_player 讀取 #tdm_elapsed tdm_config（秒數）
#   公式：floor(elapsed / 30) × 20，每 30 秒 +20 RP，打滿 10 分鐘 +400 RP
#擊殺+(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_k5 rank_const 80
#助攻+(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_a2 rank_const 40
#死亡-(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_d3 rank_const 40
#連勝+(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_s20 rank_const 500
#勝利+(常數)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_w50 rank_const 1800
#敗場-(常數)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_l15 rank_const 200

# ── DOM（arms_sub_mode=2）────────────────────────────────────────
# 佔點對戰，約 15 分鐘；擊殺倍率壓低，佔點/守點為主要 RP 來源
# 勝利固定加分高於 TDM（+2000 vs +1800），補償較長的遊戲時間
# 時間加成：calc_player 讀取 #global dom_arms_timer（秒數）
#   公式：floor(elapsed / 30) × 20，打滿 15 分鐘 +600 RP
#擊殺+(倍率)：刻意壓低，避免純獵殺 > 佔點貢獻
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_k5 rank_const 40
#助攻+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_a2 rank_const 20
#死亡-(倍率)：比 TDM 低，因 DOM 死亡率本身較高
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_d3 rank_const 20
#連勝+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_s20 rank_const 500
#勝利+(常數)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_w50 rank_const 2000
#敗場-(常數)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_l15 rank_const 200
#佔點過程+(倍率)：每次貢獻佔點進度計一次（5 秒輪詢）
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_dom_cap rank_const 60
#佔點成功+(常數)：成功翻轉一個點給予額外獎勵
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_dom_flip rank_const 300
#守點+(倍率)：在己方控制點附近存活計一次
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_dom_def rank_const 60

# ── GK（arms_sub_mode=3）─────────────────────────────────────────
# 槍王之王：武器輪換淘汰賽，約 15 分鐘，9 個階段
# 階段加成：calc_stage_score 預先將 (team_stage - 1) 寫入玩家 gk_stage_score
#   calc_player 計算：gk_stage_score × 120
#   勝者 stage=10 → gk_stage_score=9 → 9×120=1080 RP
#   完成 5 階段 → gk_stage_score=4 → 4×120=480 RP
#   此設計讓時間投入越多（推進越多階段）RP 越高，即使輸了也有補償
#擊殺+(倍率)：同 TDM，武器多樣性使擊殺難度較高
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_k5 rank_const 80
#助攻+(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_a2 rank_const 40
#死亡-(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_d3 rank_const 40
#連勝+(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_s20 rank_const 500
#勝利+(常數)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_w50 rank_const 1800
#敗場-(常數)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_l15 rank_const 200
#階段加成倍率（乘以 gk_stage_score，由 calc_player 執行）
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_gk_stage rank_const 120

# ── 時間加成共用常數（TDM/DOM 共用，GK 不使用） ──────────────────
# #rp_time_div  = 30（秒，每個「時間單位」的長度）
# #rp_time_bonus = 20（每個時間單位的 RP 獎勵）
scoreboard players set #rp_time_div rank_const 30
scoreboard players set #rp_time_bonus rank_const 20

# ── 勝敗標記 ──────────────────────────────────────────────────────
# 先清除上一局殘留標記，再由下方邏輯重新標記
tag @a remove rp_winner
tag @a remove rp_loser

# 敗者標記：
#   隊伍模式（winner_team 1~4）：所有非 rp_winner 視為敗者
#   孤狼 BR（winner_team 5）：敗者不扣 RP 但記敗場統計（rp_stat_loser）
#   平手（winner_team 0）：無人標記，無 RP 變動
execute if score #winner_team dummy matches 1..4 run tag @a[tag=!rp_winner] add rp_loser
execute if score #winner_team dummy matches 5 as @a[tag=!rp_winner] if score @s team_id matches 5 run tag @s add rp_stat_loser

# ── 計算每位玩家的 RP delta ───────────────────────────────────────
execute as @a run function game_core:rank/calc_player

# ── 更新軍階 T1-T10 ───────────────────────────────────────────────
execute as @a run function game_core:rank/tier_update

# ── T11 特殊判定 ──────────────────────────────────────────────────
function game_core:rank/tier11_check

# ── 清理標記 ──────────────────────────────────────────────────────
tag @a remove rp_winner
tag @a remove rp_loser
tag @a remove rp_stat_loser
tag @a remove br_winner

function game_core:lobby/event_leaderboard_update
function game_core:lobby/rp_leaderboard_update