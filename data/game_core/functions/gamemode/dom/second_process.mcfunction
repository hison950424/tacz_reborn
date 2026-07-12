# ==========================================
# 檔案: gamemode/dom/second_process.mcfunction
# 說明: 每秒執行一次的階段管理器
# phase 1 = 戰鬥中
# phase 2 = 撿裝階段（loot，7s）
# phase 3 = 戰前準備（prep，15s）
# ==========================================

# ==========================================
# Phase 2：撿裝倒數
# ==========================================
execute if score #dom_phase dom_config matches 2 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 2 run title @a actionbar ["",{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後進入下一回合準備","color":"white"}]

execute if score #dom_phase dom_config matches 2 if score #dom_phase_timer dom_config matches ..0 run function game_core:gamemode/dom/round_loot_end

# ==========================================
# Phase 3：準備倒數
# ==========================================
execute if score #dom_phase dom_config matches 3 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 3 run title @a actionbar ["",{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後戰鬥開始","color":"white"}]

execute if score #dom_phase dom_config matches 3 if score #dom_phase_timer dom_config matches ..0 run function game_core:gamemode/dom/round_start

# ==========================================
# Phase 1：戰鬥計時
# ==========================================
execute if score #dom_phase dom_config matches 1 run scoreboard players add #dom_round_timer dom_config 1

# 90 秒：若本回合預定開放第二個據點，且目前只有 1 個點開啟
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 90 if score #dom_second_open dom_config matches 1 if score #dom_open_count dom_config matches 1 run function game_core:gamemode/dom/stalemate_open
# 觸發後清除旗標（防止重複執行）
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 90 run scoreboard players set #dom_second_open dom_config 0

# 回合計時 150 秒 → 超時結算
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 150.. run function game_core:gamemode/dom/round_end_timeout
