# ==========================================
# 檔案: shop/buy_grip_magpul_afg_2.mcfunction
# 說明: 處理 Talon AFG1 直角握把 的購買邏輯
# ==========================================
# 0. 【核心防弊】沒收假物品
clear @s tacz:attachment{ShopItem:"grip_magpul_afg_2"}

# 1. 【基地檢測】
execute if score @s in_base_score matches 0 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 【職業檢測】無

# 3. 【價格設定】基礎 $60 / 支援兵 $75
scoreboard players set @s shop_price 60
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 75

# 4. 【餘額檢測】
execute if score @s gd656killicon.score < @s shop_price run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

# 5. 【發放與扣款】
give @s tacz:attachment{AttachmentId:"tacz:grip_magpul_afg_2"} 1
playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -60
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -75
tellraw @s ["",{"text":"[商店] 成功購買 AFG1 直角握把 ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]