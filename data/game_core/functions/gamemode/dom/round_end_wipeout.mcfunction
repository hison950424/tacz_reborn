# ==========================================
# 檔案: gamemode/dom/round_end_wipeout.mcfunction
# 說明: 一方全員陣亡 → 存活方立即獲勝（+300分）
# 前置: #dom_round_winner (1=紅/2=藍) 由 death_check 設定
# ==========================================

# 防重複觸發：僅在戰鬥階段執行
execute unless score #dom_phase dom_config matches 1 run return 0

# 立即切換至撿裝階段
scoreboard players set #dom_phase dom_config 2
scoreboard players set #dom_phase_timer dom_config 10

# 關閉所有點位
function game_core:gamemode/dom/close_all_points

# 全滅勝利：+300 分
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Red dom_score 300
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Blue dom_score 300

# --- 通報 ---
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=red] {"text":"[系統] 敵方全員陣亡！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=blue] {"text":"[系統] 敵方全員陣亡！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 1 run tellraw @a[team=blue] {"text":"[系統] 我方全員陣亡！本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 2 run tellraw @a[team=red] {"text":"[系統] 我方全員陣亡！本回合失敗","color":"red","bold":true}

# 音效
execute at @a run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.25

# 金錢獎勵：勝方（連勝遞減）
function game_core:gamemode/dom/round_win_money

# 金錢補償：敗方（連敗遞增）
function game_core:gamemode/dom/round_loss_money

# --- 金錢通知（在計數更新前執行，確保數值一致）---
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 0 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$560  │  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$480（連勝遞減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 2 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$400（連勝遞減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 3 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$320（連勝遞減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 1 if score #Red_win dom_config matches 4.. run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$240（連勝滿減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 0 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$560  │  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 1 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$480（連勝遞減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$400（連勝遞減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 3 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$320（連勝遞減）│  按 [Caps Lock] 查看金錢","color":"green"}]
execute if score #dom_round_winner dom_config matches 2 if score #Blue_win dom_config matches 4.. run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合勝利 +$240（連勝滿減）│  按 [Caps Lock] 查看金錢","color":"green"}]

execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 0 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$360  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 1 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$520（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$680（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 3 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$840（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 1 if score #Blue_loss dom_config matches 4.. run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$1000（連敗滿額）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 0 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$360  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$520（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 2 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$680（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 3 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$840（連敗加成）│  按 [Caps Lock] 查看金錢","color":"gray"}]
execute if score #dom_round_winner dom_config matches 2 if score #Red_loss dom_config matches 4.. run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"gray","bold":true},{"text":"本回合失敗 +$1000（連敗滿額）│  按 [Caps Lock] 查看金錢","color":"gray"}]

# 更新連敗計數
execute if score #dom_round_winner dom_config matches 1 run scoreboard players set #Red_loss dom_config 0
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Blue_loss dom_config 1
execute if score #dom_round_winner dom_config matches 2 run scoreboard players set #Blue_loss dom_config 0
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Red_loss dom_config 1

# 更新連勝計數
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Red_win dom_config 1
execute if score #dom_round_winner dom_config matches 1 run scoreboard players set #Blue_win dom_config 0
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Blue_win dom_config 1
execute if score #dom_round_winner dom_config matches 2 run scoreboard players set #Red_win dom_config 0

# 存活/陣亡個人調整
function game_core:gamemode/dom/round_end_adjust
