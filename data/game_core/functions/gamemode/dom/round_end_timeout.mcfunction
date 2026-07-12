# ==========================================
# 檔案: gamemode/dom/round_end_timeout.mcfunction
# 說明: 回合計時 150 秒到時 → 平手，不給分
# ==========================================

execute unless score #dom_phase dom_config matches 1 run return 0

scoreboard players set #dom_phase dom_config 2
scoreboard players set #dom_phase_timer dom_config 7
scoreboard players set #dom_round_winner dom_config 0
function game_core:gamemode/dom/close_all_points

tellraw @a {"text":"[系統] 時間結束，本回合平手","color":"gray","bold":true}
