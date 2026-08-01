# ==========================================
# 檔案: gamemode/tdm_timer_tick.mcfunction
# ==========================================

# 1. 底層 20 Ticks 扣減邏輯
scoreboard players remove #tick_counter tdm_config 1
execute if score #tick_counter tdm_config matches ..0 run scoreboard players remove #current_time tdm_config 1

# 每秒觸發：記錄已過秒數與階段切換檢查（在 tick_counter 重置前執行）
execute if score #tick_counter tdm_config matches ..0 run scoreboard players add #tdm_elapsed tdm_config 1
execute if score #tick_counter tdm_config matches ..0 if score #tdm_stage tdm_config matches 0 if score #tdm_elapsed tdm_config >= #tdm_stage1_at tdm_config run function game_core:gamemode/tdm/stage_change
execute if score #tick_counter tdm_config matches ..0 if score #tdm_stage tdm_config matches 1 if score #tdm_elapsed tdm_config >= #tdm_stage2_at tdm_config run function game_core:gamemode/tdm/stage_change

execute if score #tick_counter tdm_config matches ..0 run scoreboard players set #tick_counter tdm_config 20

# 2. 將底層 #current_time 映射到側邊欄 UI
scoreboard players operation ⏳剩餘秒數 tdm_display = #current_time tdm_config

# 3. 時間耗盡判定
execute if score #current_time tdm_config matches ..0 run function game_core:gamemode/tdm/time_up
