# ==========================================
# 檔案: shop/calc_logic.mcfunction
# 執行者: @s (按下 + 或 - 的玩家)
# ==========================================
# 任何金額加減按鈕點擊，第一時間播放音效
execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 1.5

# 讀取並重置選項
execute store result score #action_id temp_score run scoreboard players get @s transfer_act
scoreboard players set @s transfer_act 0

# 運算
execute if score #action_id temp_score matches 1 run scoreboard players remove @s transfer_val 500
execute if score #action_id temp_score matches 2 run scoreboard players remove @s transfer_val 50
execute if score #action_id temp_score matches 3 run scoreboard players remove @s transfer_val 5
execute if score #action_id temp_score matches 4 run scoreboard players add @s transfer_val 5
execute if score #action_id temp_score matches 5 run scoreboard players add @s transfer_val 50
execute if score #action_id temp_score matches 6 run scoreboard players add @s transfer_val 500
execute if score #action_id temp_score matches 7 run scoreboard players operation @s transfer_val = @s gd656killicon.score
execute if score #action_id temp_score matches 8 run scoreboard players set @s transfer_val 0

# 防護 1: 小於 0 則歸零
execute if score @s transfer_val matches ..-1 run scoreboard players set @s transfer_val 0
# 防護 2: 大於財產則設為總財產 (梭哈)
execute if score @s transfer_val > @s gd656killicon.score run scoreboard players operation @s transfer_val = @s gd656killicon.score

# 處理取消按鈕
execute if score #action_id temp_score matches 9 run function game_core:shop/force_cancel
execute if score #action_id temp_score matches 9 run return 0

# 渲染刷新
playsound ui.button.click master @s ~ ~ ~ 1 1.5
function game_core:shop/ui_render