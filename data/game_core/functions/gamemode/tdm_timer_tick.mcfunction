# ==========================================
# 檔案: gamemode/tdm_timer_tick.mcfunction
# ==========================================

# 1. 底層 20 Ticks 扣減邏輯
scoreboard players remove #tick_counter tdm_config 1
execute if score #tick_counter tdm_config matches ..0 run scoreboard players remove #current_time tdm_config 1
execute if score #tick_counter tdm_config matches ..0 run scoreboard players set #tick_counter tdm_config 20

# 2. 將底層 #current_time 映射到側邊欄 UI
scoreboard players operation ⏳剩餘秒數 tdm_display = #current_time tdm_config

# 3. 時間耗盡判定
execute if score #current_time tdm_config matches ..0 run function game_core:gamemode/tdm_time_up