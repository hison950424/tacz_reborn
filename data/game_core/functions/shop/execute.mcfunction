# ==========================================
# 檔案: shop/execute.mcfunction
# ==========================================
# 1. 執行者財產防呆
execute if score @s gd656killicon.score < @s transfer_val run tellraw @s {"text":"[系統] 錯誤：餘額異常不足。","color":"red"}
execute if score @s gd656killicon.score < @s transfer_val run function game_core:shop/force_cancel
execute if score @s gd656killicon.score < @s transfer_val run return 0

# 2. 標記最終收款人 (放棄錯誤的 br_id，改用臨時 tag 絕對定位)
tag @a remove confirm_target
execute as @a[tag=transfer_target,limit=1] run tag @s add confirm_target

# 3. 檢查是否成功鎖定對象
execute unless entity @a[tag=confirm_target] run tellraw @s {"text":"[系統] 交易失敗：無法獲取對象資料。","color":"red"}
execute unless entity @a[tag=confirm_target] run function game_core:shop/force_cancel
execute unless entity @a[tag=confirm_target] run return 0

# 4. 金額寫入與觸發後端交割
scoreboard players operation #transfer_amount temp_score = @s transfer_val
function game_core:shop/process_funds