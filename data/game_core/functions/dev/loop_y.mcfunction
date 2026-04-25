# ==========================================
# 檔案: dev/loop_y.mcfunction
# ==========================================
# 初始化 Z 軸計數器，進入 Z 軸迴圈
scoreboard players set #scan_z dom_math 0
function game_core:dev/loop_z

# Y 軸計數器 +1
scoreboard players add #scan_y dom_math 1

# 只要 Y <= 10，就把執行座標往正 Y 軸移動 1 格，並遞迴呼叫自己
execute if score #scan_y dom_math matches ..10 positioned ~ ~1 ~ run function game_core:dev/loop_y