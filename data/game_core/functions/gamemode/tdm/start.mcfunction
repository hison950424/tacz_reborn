# 1秒 = 20 Ticks，建立一個 20 的循環倒數器
scoreboard players set #tick_counter tdm_config 20
# 將管理員設定的總秒數，複製給當前遊戲倒數計時器
scoreboard players operation #current_time tdm_config = #time_limit_sec tdm_config