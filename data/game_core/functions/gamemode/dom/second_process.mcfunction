# ==========================================
# 檔案: gamemode/dom/second_process.mcfunction
# 說明: 每秒執行一次的階段管理器
# phase 0 = 開賽前等待（30s 後啟動第一回合）
# phase 1 = 戰鬥中
# phase 2 = 撿裝階段（loot，7s）
# phase 3 = 戰前準備（prep，15s）
# ==========================================

# ==========================================
# Phase 0：開賽等待 → 第一回合準備
# ==========================================
execute if score #dom_phase dom_config matches 0 run scoreboard players add #dom_phase_timer dom_config 1
execute if score #dom_phase dom_config matches 0 if score #dom_phase_timer dom_config matches 30.. run function game_core:gamemode/dom/round_loot_end

# ==========================================
# Phase 2：撿裝倒數
# ==========================================
execute if score #dom_phase dom_config matches 2 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 2 run title @a actionbar ["",{"text":"撿裝中，","color":"white"},{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後進入下一回合準備","color":"white"}]

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

# 僵持偵測：只有 1 個點開啟且點上有爭奪時累積
execute if score #dom_phase dom_config matches 1 if score #dom_open_count dom_config matches 1 if score #a_contested temp_score matches 1.. run scoreboard players add #dom_stalemate_sec dom_config 1
execute if score #dom_phase dom_config matches 1 if score #dom_open_count dom_config matches 1 if score #b_contested temp_score matches 1.. run scoreboard players add #dom_stalemate_sec dom_config 1
execute if score #dom_phase dom_config matches 1 if score #dom_open_count dom_config matches 1 if score #c_contested temp_score matches 1.. run scoreboard players add #dom_stalemate_sec dom_config 1
# 非爭奪中時重置僵持計時
execute if score #dom_phase dom_config matches 1 if score #a_contested temp_score matches 0 if score #b_contested temp_score matches 0 if score #c_contested temp_score matches 0 run scoreboard players set #dom_stalemate_sec dom_config 0

# 僵持 40 秒 → 開啟第二個點（最多同時 2 個點）
execute if score #dom_phase dom_config matches 1 if score #dom_open_count dom_config matches 1 if score #dom_stalemate_sec dom_config matches 40.. run function game_core:gamemode/dom/stalemate_open

# 回合計時 150 秒 → 超時平手
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 150.. run function game_core:gamemode/dom/round_end_timeout
