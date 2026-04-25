# ==========================================
# 檔案: dev/loop_x.mcfunction
# ==========================================
# 初始化 Y 軸計數器，進入 Y 軸迴圈
scoreboard players set #scan_y dom_math 0
function game_core:dev/loop_y

# X 軸計數器 +1
scoreboard players add #scan_x dom_math 1

# 只要 X <= 20，就把執行座標往正 X 軸移動 1 格，並遞迴呼叫自己
execute if score #scan_x dom_math matches ..20 positioned ~1 ~ ~ run function game_core:dev/loop_x