# ==========================================
# 檔案: shop/open_menu.mcfunction
# 執行者: @s (點選書本開啟轉帳的玩家)
# ==========================================
# 1. 關閉觸發器防呆
scoreboard players set @s transfer_menu 0
scoreboard players enable @s transfer_menu

# [冷卻防護] 若轉帳冷卻尚未結束，顯示剩餘秒數並中止
execute if score @s transfer_cooldown matches 1.. run scoreboard players set #const_20 temp_score 20
execute if score @s transfer_cooldown matches 1.. run scoreboard players operation #cd_display temp_score = @s transfer_cooldown
execute if score @s transfer_cooldown matches 1.. run scoreboard players operation #cd_display temp_score /= #const_20 temp_score
execute if score @s transfer_cooldown matches 1.. run tellraw @s ["",{"text":"[系統] 🕐 轉帳冷卻中，請稍候 ","color":"red"},{"score":{"name":"#cd_display","objective":"temp_score"},"color":"yellow"},{"text":" 秒...","color":"red"}]
execute if score @s transfer_cooldown matches 1.. run return 0

# 開啟選單提示音
execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 1.5

# 2. 開啟狀態與初始化金額
tag @s add transfer_active
scoreboard players set @s transfer_val 0

# 3. 渲染聊天欄控制台
function game_core:shop/ui_render
