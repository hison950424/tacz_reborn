# ==========================================
# 檔案: gamemode/dom/round_end_capture.mcfunction
# 說明: 某點被佔領 → 回合勝利（+300分）
# 前置: #dom_round_winner (1=紅/2=藍)、#dom_capture_point (1=A/2=B/3=C) 由呼叫方設定
# ==========================================

# 防重複觸發：僅在戰鬥階段執行
execute unless score #dom_phase dom_config matches 1 run return 0

# 立即切換至撿裝階段（同一 Tick 內其他點的佔領觸發將被攔截）
scoreboard players set #dom_phase dom_config 2
scoreboard players set #dom_phase_timer dom_config 7

# 關閉所有點位
function game_core:gamemode/dom/close_all_points

# 佔點勝利：+300 分
execute if score #dom_round_winner dom_config matches 1 run scoreboard players add #Red dom_score 300
execute if score #dom_round_winner dom_config matches 2 run scoreboard players add #Blue dom_score 300

# --- 通報勝利隊伍 ---
execute if score #dom_round_winner dom_config matches 1 if score #dom_capture_point dom_config matches 1 run tellraw @a[team=red] {"text":"[系統] 成功佔領 A 點！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 1 if score #dom_capture_point dom_config matches 2 run tellraw @a[team=red] {"text":"[系統] 成功佔領 B 點！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 1 if score #dom_capture_point dom_config matches 3 run tellraw @a[team=red] {"text":"[系統] 成功佔領 C 點！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 2 if score #dom_capture_point dom_config matches 1 run tellraw @a[team=blue] {"text":"[系統] 成功佔領 A 點！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 2 if score #dom_capture_point dom_config matches 2 run tellraw @a[team=blue] {"text":"[系統] 成功佔領 B 點！本回合勝利 +300 分","color":"green","bold":true}
execute if score #dom_round_winner dom_config matches 2 if score #dom_capture_point dom_config matches 3 run tellraw @a[team=blue] {"text":"[系統] 成功佔領 C 點！本回合勝利 +300 分","color":"green","bold":true}

# --- 通報失敗隊伍 ---
execute if score #dom_round_winner dom_config matches 1 if score #dom_capture_point dom_config matches 1 run tellraw @a[team=blue] {"text":"[系統] A 點已被佔領！本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 1 if score #dom_capture_point dom_config matches 2 run tellraw @a[team=blue] {"text":"[系統] B 點已被佔領！本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 1 if score #dom_capture_point dom_config matches 3 run tellraw @a[team=blue] {"text":"[系統] C 點已被佔領！本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 2 if score #dom_capture_point dom_config matches 1 run tellraw @a[team=red] {"text":"[系統] A 點已被佔領！本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 2 if score #dom_capture_point dom_config matches 2 run tellraw @a[team=red] {"text":"[系統] B 點已被佔領！本回合失敗","color":"red","bold":true}
execute if score #dom_round_winner dom_config matches 2 if score #dom_capture_point dom_config matches 3 run tellraw @a[team=red] {"text":"[系統] C 點已被佔領！本回合失敗","color":"red","bold":true}

# 音效
execute at @a run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

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
