# ==========================================
# 檔案: gamemode/dom_time_up.mcfunction
# ==========================================

# 1. 立即將狀態機切換為 3 (結算中)，阻斷計時器與判定
scoreboard players set #global game_state 3

# 2. 發送時間到的全域大標題
title @a title {"text":"⏱ 時間到！","color":"yellow","bold":true}
tellraw @a {"text":"[系統] 佔領時間到，開始結算分數...","color":"yellow","bold":true}

# 3. 比較紅藍兩隊分數並導向對應的結算管線
# 紅隊領先
execute if score #Red dom_score > #Blue dom_score run function game_core:gamemode/dom_red_win

# 藍隊領先
execute if score #Blue dom_score > #Red dom_score run function game_core:gamemode/dom_blue_win

# 平手 (借用已經寫好的 TDM 平手邏輯檔案)
execute if score #Red dom_score = #Blue dom_score run function game_core:gamemode/tdm_draw_win