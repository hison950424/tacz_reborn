# ==========================================
# 檔案: shop/force_cancel.mcfunction
# 執行者: @s
# ==========================================
tag @s remove transfer_active
tag @s remove transfer_target
scoreboard players set @s transfer_val 0

# 取消/錯誤提示音
execute at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.8
title @s actionbar ""
tellraw @s {"text":"[系統] 轉帳功能已關閉。","color":"gray"}