# ==========================================
# 檔案: shop/sync_minus.mcfunction
# 執行者: @s (轉出方)
# 目的: 將動態變數 #sync_val 拆解為靜態指令扣除 (扁平化架構)
# [修復] 移除重複的 gd656killicon.score 操作
#        原版記分板由 process_funds 步驟5 統一進行一次性修正
# ==========================================

# 處理 500 (只要大於 500 就先扣一輪)
execute if score #sync_val temp_score matches 500.. run gd656killicon server statistics add score @s -500
execute if score #sync_val temp_score matches 500.. run scoreboard players remove #sync_val temp_score 500

# 處理 50 (如果剩下的數值在 50~499 之間，再扣一輪)
execute if score #sync_val temp_score matches 50..499 run gd656killicon server statistics add score @s -50
execute if score #sync_val temp_score matches 50..499 run scoreboard players remove #sync_val temp_score 50

# 處理 5 (如果剩下的數值在 5~49 之間，再扣一輪)
execute if score #sync_val temp_score matches 5..49 run gd656killicon server statistics add score @s -5
execute if score #sync_val temp_score matches 5..49 run scoreboard players remove #sync_val temp_score 5

# 處理 1 (防呆補底：若因梭哈出現非 5 的倍數)
execute if score #sync_val temp_score matches 1..4 run gd656killicon server statistics add score @s -1
execute if score #sync_val temp_score matches 1..4 run scoreboard players remove #sync_val temp_score 1

# 判定是否需要再次進入迴圈 (若單次拆解完後數值仍大於 1，才觸發遞迴)
execute if score #sync_val temp_score matches 1.. run function game_core:shop/sync_minus
