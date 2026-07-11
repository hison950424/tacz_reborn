# ==========================================
# 檔案: shop/buy_grip_rk0.mcfunction
# 說明: 處理 RK-0 握把 的購買邏輯
# ==========================================
# 0. 【核心防弊】沒收假物品
clear @s tacz:attachment{ShopItem:"grip_rk0"}

# 1. 【基地檢測】
execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 【職業檢測】無

# 3. 【價格設定】基礎 $100 / 支援兵 $125
scoreboard players set @s shop_price 100
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 125

# 4. 【餘額檢測】
execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

# 5. 【發放與扣款】
give @s tacz:attachment{AttachmentId:"tacz:grip_rk0"} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -100
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -125
tellraw @s ["",{"text":"[商店] 成功購買 RK-0 握把 ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]