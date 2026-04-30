# ==========================================
# 檔案: dev/loop_z.mcfunction
# ==========================================
# [核心邏輯] 在當前座標檢查是否有羊毛
function game_core:dev/check_wool

# Z 軸計數器 +1
scoreboard players add #scan_z dom_math 1

# 只要 Z <= 20，就把執行座標往正 Z 軸移動 1 格，並遞迴呼叫自己
execute if score #scan_z dom_math matches ..16 positioned ~ ~ ~1 run function game_core:dev/loop_z