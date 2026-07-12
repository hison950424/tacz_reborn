# ==========================================
# 檔案: gamemode/dom/round_loss_money.mcfunction
# 說明: 敗方補償金（基礎 $450，連敗 +$50，上限 $600）
# ==========================================

# 藍隊失敗補償（當 winner=1 即紅隊勝）
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 0 as @a[team=blue] run gd656killicon server statistics add score @s 450
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 1 as @a[team=blue] run gd656killicon server statistics add score @s 500
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 2 as @a[team=blue] run gd656killicon server statistics add score @s 550
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 3.. as @a[team=blue] run gd656killicon server statistics add score @s 600

# 紅隊失敗補償（當 winner=2 即藍隊勝）
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 0 as @a[team=red] run gd656killicon server statistics add score @s 450
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 1 as @a[team=red] run gd656killicon server statistics add score @s 500
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 2 as @a[team=red] run gd656killicon server statistics add score @s 550
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 3.. as @a[team=red] run gd656killicon server statistics add score @s 600
