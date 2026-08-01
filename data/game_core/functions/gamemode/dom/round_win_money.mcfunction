# ==========================================
# 檔案: gamemode/dom/round_win_money.mcfunction
# 說明: 勝方獎金（基礎 $560，連勝 -$80，最低 $240）
# ==========================================

# 紅隊勝利獎金（當 winner=1）
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 0 as @a[team=red] run gd656killicon server statistics add score @s 560
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 1 as @a[team=red] run gd656killicon server statistics add score @s 480
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 2 as @a[team=red] run gd656killicon server statistics add score @s 400
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 3 as @a[team=red] run gd656killicon server statistics add score @s 320
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 4.. as @a[team=red] run gd656killicon server statistics add score @s 240

# 藍隊勝利獎金（當 winner=2）
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 0 as @a[team=blue] run gd656killicon server statistics add score @s 560
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 1 as @a[team=blue] run gd656killicon server statistics add score @s 480
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 2 as @a[team=blue] run gd656killicon server statistics add score @s 400
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 3 as @a[team=blue] run gd656killicon server statistics add score @s 320
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 4.. as @a[team=blue] run gd656killicon server statistics add score @s 240
