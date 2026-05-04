# ==========================================
# 檔案: shop/sync_add.mcfunction
# 執行者: @s (接收方)
# 目的: 將動態變數 #sync_val 拆解為靜態指令增加
# ==========================================
# 處理 500
execute if score #sync_val temp_score matches 500.. run gd656killicon server statistics add score @s 500
execute if score #sync_val temp_score matches 500.. run scoreboard players add @s gd656killicon.score 500
execute if score #sync_val temp_score matches 500.. run scoreboard players remove #sync_val temp_score 500
execute if score #sync_val temp_score matches 500.. run function game_core:shop/sync_add

# 處理 50
execute if score #sync_val temp_score matches 50..499 run gd656killicon server statistics add score @s 50
execute if score #sync_val temp_score matches 50..499 run scoreboard players add @s gd656killicon.score 50
execute if score #sync_val temp_score matches 50..499 run scoreboard players remove #sync_val temp_score 50
execute if score #sync_val temp_score matches 50..499 run function game_core:shop/sync_add

# 處理 5
execute if score #sync_val temp_score matches 5..49 run gd656killicon server statistics add score @s 5
execute if score #sync_val temp_score matches 5..49 run scoreboard players add @s gd656killicon.score 5
execute if score #sync_val temp_score matches 5..49 run scoreboard players remove #sync_val temp_score 5
execute if score #sync_val temp_score matches 5..49 run function game_core:shop/sync_add

# 處理 1 (防呆補底：若因梭哈出現非 5 的倍數)
execute if score #sync_val temp_score matches 1..4 run gd656killicon server statistics add score @s 1
execute if score #sync_val temp_score matches 1..4 run scoreboard players add @s gd656killicon.score 1
execute if score #sync_val temp_score matches 1..4 run scoreboard players remove #sync_val temp_score 1
execute if score #sync_val temp_score matches 1..4 run function game_core:shop/sync_add