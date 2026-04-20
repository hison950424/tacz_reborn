# ==========================================
# 檔案: gamemode/tdm_time_up.mcfunction
# ==========================================

# 1. 立即將狀態機切換為 3 (結算中)
# 作用: 瞬間阻斷 arms_race_tick 繼續執行計時器，防止無限迴圈
scoreboard players set #global game_state 3

# 2. 發送時間到的全域大標題
title @a title {"text":"⏱ 時間到！","color":"yellow","bold":true}

# 3. 比較紅藍兩隊分數並導向對應的結算管線
# 紅隊獲勝
execute if score #red_team team_score > #blue_team team_score run function game_core:gamemode/tdm_red_win

# 藍隊獲勝
execute if score #blue_team team_score > #red_team team_score run function game_core:gamemode/tdm_blue_win

# 平手 (分數相等)
execute if score #red_team team_score = #blue_team team_score run function game_core:gamemode/tdm_draw_win