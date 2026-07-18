# ==========================================
# 檔案: gamemode/dom/round_end_timeout.mcfunction
# 說明: 回合計時 150 秒到時，根據佔領進度決定勝負
#       領先方勝 (+300分)；進度為 0 時才平手（雙方 +$400）
# ==========================================

execute unless score #dom_phase dom_config matches 1 run return 0

scoreboard players set #dom_phase dom_config 2
scoreboard players set #dom_phase_timer dom_config 10

# --- 計算各開放點的領先方（按點數計：多數點獲勝，1-1 算平手）---
scoreboard players set #red_lead_count dom_config 0
scoreboard players set #blue_lead_count dom_config 0

execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run scoreboard players add #red_lead_count dom_config 1
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run scoreboard players add #blue_lead_count dom_config 1
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 1.. run scoreboard players add #red_lead_count dom_config 1
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-1 run scoreboard players add #blue_lead_count dom_config 1
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 1.. run scoreboard players add #red_lead_count dom_config 1
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-1 run scoreboard players add #blue_lead_count dom_config 1

# 紅方領先點數多 → 紅勝；藍方多 → 藍勝；相同（含 0-0、1-1）→ 平手
execute if score #red_lead_count dom_config > #blue_lead_count dom_config run scoreboard players set #dom_round_winner dom_config 1
execute if score #blue_lead_count dom_config > #red_lead_count dom_config run scoreboard players set #dom_round_winner dom_config 2
execute if score #red_lead_count dom_config = #blue_lead_count dom_config run scoreboard players set #dom_round_winner dom_config 0

# 關閉所有點位
function game_core:gamemode/dom/close_all_points

# ==========================================
# 平手（進度恰好 0）
# ==========================================
execute if score #dom_round_winner dom_config matches 0 run tellraw @a {"text":"[系統] 時間結束，雙方進度相同，本回合平手","color":"gray","bold":true}
execute if score #dom_round_winner dom_config matches 0 as @a[team=red] run gd656killicon server statistics add score @s 400
execute if score #dom_round_winner dom_config matches 0 as @a[team=blue] run gd656killicon server statistics add score @s 400
execute if score #dom_round_winner dom_config matches 0 run tellraw @a ["",{"text":"[金錢] ","color":"gold","bold":true},{"text":"本回合平手 +$400  │  按 [Caps Lock] 查看金錢","color":"gold"}]
execute if score #dom_round_winner dom_config matches 0 run function game_core:gamemode/dom/round_end_adjust
execute if score #dom_round_winner dom_config matches 0 run return 0

# ==========================================
# 有勝者（佔領進度領先）
# ==========================================
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Red dom_score 300
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Blue dom_score 300

execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=red] {"text":"[系統] 時間結束！我方佔領領先，本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=blue] {"text":"[系統] 時間結束！我方佔領領先，本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=blue] {"text":"[系統] 時間結束！敵方佔領領先，本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=red] {"text":"[系統] 時間結束！敵方佔領領先，本回合失敗","color":"red","bold":true}

# 金錢獎勵：勝方 $700
execute if score #dom_round_winner dom_config matches 1 as @a[team=red] run gd656killicon server statistics add score @s 700
execute if score #dom_round_winner dom_config matches 2 as @a[team=blue] run gd656killicon server statistics add score @s 700

# 金錢補償：敗方 $450 起，連敗 +$50，上限 $600
function game_core:gamemode/dom/round_loss_money

# --- 金錢通知（在連敗更新前執行）---
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$700  │  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$700  │  按 [Caps Lock] 查看金錢","color":"green"}]

execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 0 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$450  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 1 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$550（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$650（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 3 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$750（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 4.. run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$850（連敗滿額）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 0 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$450  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$550（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 2 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$650（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 3 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$750（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 4.. run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$850（連敗滿額）│  按 [Caps Lock] 查看金錢","color":"gray"}]

# 更新連敗計數
execute if score #dom_round_winner dom_config matches 1 run scoreboard players set #Red_loss dom_config 0
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Blue_loss dom_config 1
execute if score #dom_round_winner dom_config matches 2 run scoreboard players set #Blue_loss dom_config 0
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Red_loss dom_config 1

# 存活/陣亡個人調整（有勝者情況）
function game_core:gamemode/dom/round_end_adjust
