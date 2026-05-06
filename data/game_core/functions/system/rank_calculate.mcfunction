# ==========================================
# 檔案: system/rank_calculate.mcfunction
# #winner_team: 0=平手 1=紅 2=藍 3=綠(BR) 4=白(BR) 5=孤狼(BR)
# 孤狼BR獲勝時，br_win_check 需預先對獲勝玩家 tag br_winner
# ==========================================

tag @a remove rp_winner
tag @a remove rp_loser

# --- 勝者標記 ---
execute if score #winner_team dummy matches 1 run tag @a[team=red] add rp_winner
execute if score #winner_team dummy matches 2 run tag @a[team=blue] add rp_winner
execute if score #winner_team dummy matches 3 run tag @a[team=green] add rp_winner
execute if score #winner_team dummy matches 4 run tag @a[team=white] add rp_winner
# 孤狼：只有 br_winner 一人獲勝
execute if score #winner_team dummy matches 5 run tag @a[tag=br_winner] add rp_winner

# --- 敗者標記 ---
# 隊伍模式（1~4）：所有非獲勝者皆為敗者
execute if score #winner_team dummy matches 1..4 run tag @a[tag=!rp_winner] add rp_loser
# 孤狼模式（5）：其餘孤狼不計 W/L（BR 性質不同，不扣 -15 RP）
# #winner_team=0（平手）：無人標記

# [1] 計算 RP delta
execute as @a run function game_core:system/rank_calculate_player



# [3] 更新軍階 T1-T10
execute as @a run function game_core:system/rank_tier_update

# [4] T11 判定
function game_core:system/rank_tier11_check

# [5] 清理標記
tag @a remove rp_winner
tag @a remove rp_loser
tag @a remove br_winner

# [6] 通知軍階
execute as @a run function game_core:system/rank_announce_player
