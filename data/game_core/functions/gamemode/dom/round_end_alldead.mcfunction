# ==========================================
# 檔案: gamemode/dom/round_end_alldead.mcfunction
# 說明: 一方全員陣亡 → 回合勝利（+100分）
# 前置: #dom_round_winner (1=紅/2=藍/0=同時全滅) 由 death_check 設定
# ==========================================

execute unless score #dom_phase dom_config matches 1 run return 0

scoreboard players set #dom_phase dom_config 2
scoreboard players set #dom_phase_timer dom_config 7
function game_core:gamemode/dom/close_all_points

# 同時全滅視為平手（不給分）
execute if score #dom_round_winner dom_config matches 0 run tellraw @a {"text":"[系統] 雙方同時全滅，本回合平手","color":"gray","bold":true}
execute if score #dom_round_winner dom_config matches 0 run return 0

# 全員陣亡：+100 分
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Red dom_score 100
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Blue dom_score 100

# 通報
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=red] {"text":"[系統] 敵方全員陣亡，本回合勝利 +100 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=blue] {"text":"[系統] 敵方全員陣亡，本回合勝利 +100 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=blue] {"text":"[系統] 我方全員陣亡，本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=red] {"text":"[系統] 我方全員陣亡，本回合失敗","color":"red","bold":true}

# 金錢獎勵：勝方 $250
execute if score #dom_round_winner dom_config matches 1 as @a[team=red] run gd656killicon server statistics add score @s 250
execute if score #dom_round_winner dom_config matches 2 as @a[team=blue] run gd656killicon server statistics add score @s 250

# 金錢補償：敗方 $100 起，連敗累加上限 $200
function game_core:gamemode/dom/round_loss_money

# --- 金錢通知（在連敗更新前執行，確保數值一致）---
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$250  │  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$250  │  按 [Caps Lock] 查看金錢","color":"green"}]

execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 0 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$100  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 1 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$150（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 2.. run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$200（連敗滿額）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 0 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$100  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$150（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 2.. run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$200（連敗滿額）│  按 [Caps Lock] 查看金錢","color":"gray"}]

# 更新連敗計數
execute if score #dom_round_winner dom_config matches 1 run scoreboard players set #Red_loss dom_config 0
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Blue_loss dom_config 1
execute if score #dom_round_winner dom_config matches 2 run scoreboard players set #Blue_loss dom_config 0
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Red_loss dom_config 1
