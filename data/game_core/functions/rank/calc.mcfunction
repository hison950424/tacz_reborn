# ==========================================
# 檔案: system/rank_calculate.mcfunction
# #winner_team: 0=平手 1=紅 2=藍 3=綠(BR) 4=白(BR) 5=孤狼(BR)
# 孤狼BR獲勝時，br_win_check 需預先對獲勝玩家 tag br_winner
# ==========================================

# --- 依模式切換 RP 常數（×30 全面提效：原始×3 再×10） ---
# BR（arms_sub_mode=0）：生存型對戰，高勝利獎勵 + 拉起/祭壇，鼓勵存活與協作
# 勝利獎勵依場上人數動態調整（人少時擊殺機會少，用更高固定獎勵補償）
# 典型勝者 RP：~12000（約 480 RP/min × 25 min）
#擊殺+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_k5 rank_const 360
#助攻+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_a2 rank_const 120
#死亡-(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_d3 rank_const 60
#連勝+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_s20 rank_const 1500
#勝利+(常數) 先設預設值，後面依人數覆蓋
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_w50 rank_const 6000
#敗場-(常數)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_l15 rank_const 300
#拉起+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_rev rank_const 600
#靈魂祭壇復活+(倍率)
execute if score #global arms_sub_mode matches 0 run scoreboard players set #rp_alt rank_const 1200

# BR 勝利獎勵依場上人數動態覆蓋
# 統計本場參與人數（所有在線玩家）
execute if score #global arms_sub_mode matches 0 run scoreboard players set #br_match_size br_sys 0
execute if score #global arms_sub_mode matches 0 as @a run scoreboard players add #br_match_size br_sys 1
# 2-4 人：擊殺機會極少，補償最高
execute if score #global arms_sub_mode matches 0 if score #br_match_size br_sys matches 1..4 run scoreboard players set #rp_w50 rank_const 11400
# 5-8 人：中小場，適度補償
execute if score #global arms_sub_mode matches 0 if score #br_match_size br_sys matches 5..8 run scoreboard players set #rp_w50 rank_const 9000
# 9-12 人：標準場，小幅補償
execute if score #global arms_sub_mode matches 0 if score #br_match_size br_sys matches 9..12 run scoreboard players set #rp_w50 rank_const 7200
# 13+ 人：大場，擊殺機會充足，沿用基礎值 6000（已設置，無需覆蓋）

# 隊伍死鬥（TDM，arms_sub_mode=1）：快節奏擊殺對戰（約 10 分鐘）
# 額外：時間加成 +30 RP/30 秒（calc_player 讀取 #tdm_elapsed），鼓勵打滿全場
# 典型勝者 RP：~4890（約 489 RP/min × 10 min）
#擊殺+(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_k5 rank_const 120
#助攻+(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_a2 rank_const 60
#死亡-(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_d3 rank_const 60
#連勝+(倍率)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_s20 rank_const 750
#勝利+(常數)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_w50 rank_const 2700
#敗場-(常數)
execute if score #global arms_sub_mode matches 1 run scoreboard players set #rp_l15 rank_const 300

# 佔點模式（DOM，arms_sub_mode=2）：重點在佔點，擊殺倍率壓低，佔點/守點為主要 RP 來源
# 額外：時間加成 +30 RP/30 秒（calc_player 讀取 #global dom_arms_timer）
# 額外：勝利基礎高於 TDM（+3000 vs +2700），補償 DOM 通常較長（~15 分鐘）
# 目標：純佔點型玩家的 RP 應高於純獵殺型玩家
# 典型勝者 RP：~6690（約 446 RP/min × 15 min）
#擊殺+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_k5 rank_const 60
#助攻+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_a2 rank_const 30
#死亡-(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_d3 rank_const 30
#連勝+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_s20 rank_const 750
#勝利+(常數)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_w50 rank_const 3000
#敗場-(常數)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_l15 rank_const 300
#佔點過程+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_dom_cap rank_const 90
#佔點成功+(常數)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_dom_flip rank_const 450
#守點+(倍率)
execute if score #global arms_sub_mode matches 2 run scoreboard players set #rp_dom_def rank_const 90

# 槍王之王（GK，arms_sub_mode=3）：武器輪換淘汰賽（約 15 分鐘）
# 額外：階段加成 (stage-1)×180，勝者 stage=10 → 9×180=1620 RP；敗者依完成階段遞減
# 典型勝者 RP：~5910（約 394 RP/min × 15 min）
#擊殺+(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_k5 rank_const 120
#助攻+(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_a2 rank_const 60
#死亡-(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_d3 rank_const 60
#連勝+(倍率)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_s20 rank_const 750
#勝利+(常數)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_w50 rank_const 2700
#敗場-(常數)
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_l15 rank_const 300
#階段加成倍率（(stage-1) × 180 per stage，calc_player 中計算）
execute if score #global arms_sub_mode matches 3 run scoreboard players set #rp_gk_stage rank_const 180
# 時間加成共用常數（TDM/DOM 使用，每 30 秒 +30 RP）
scoreboard players set #rp_time_div rank_const 30
scoreboard players set #rp_time_bonus rank_const 30

tag @a remove rp_winner
tag @a remove rp_loser


# --- 敗者標記 ---
# 隊伍模式（1~4）：所有非獲勝者皆為敗者（扣 RP + 記敗場）
execute if score #winner_team dummy matches 1..4 run tag @a[tag=!rp_winner] add rp_loser
# 孤狼模式（5）：敗者不扣 RP（故不加 rp_loser），但仍需記錄敗場統計
execute if score #winner_team dummy matches 5 as @a[tag=!rp_winner] if score @s team_id matches 5 run tag @s add rp_stat_loser
# #winner_team=0（平手）：無人標記

# [1] 計算 RP delta
execute as @a run function game_core:rank/calc_player



# [3] 更新軍階 T1-T10
execute as @a run function game_core:rank/tier_update

# [4] T11 判定
function game_core:rank/tier11_check

# [5] 清理標記
tag @a remove rp_winner
tag @a remove rp_loser
tag @a remove rp_stat_loser
tag @a remove br_winner

function game_core:lobby/event_leaderboard_update
function game_core:lobby/rp_leaderboard_update