# ==========================================
# 檔案: shop/open_menu.mcfunction
# 執行者: @s (點選書本開啟轉帳的玩家)
# ==========================================
# 1. 關閉觸發器防呆
scoreboard players set @s transfer_menu 0
scoreboard players enable @s transfer_menu

# 開啟選單提示音
execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 1.5

# 2. 開啟狀態與初始化金額
tag @s add transfer_active
scoreboard players set @s transfer_val 0

# 3. 渲染聊天欄控制台
function game_core:shop/ui_render