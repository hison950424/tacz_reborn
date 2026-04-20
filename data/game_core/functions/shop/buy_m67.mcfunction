# ==========================================
# 檔案: shop/buy_m67.mcfunction
# 說明: 自由人專屬 - M67 破片手榴彈購買邏輯
# ==========================================
# 0. 【核心防弊】沒收假物品 (無論有無 shop:1b)
clear @s lrtactical:throwable{ShopItem:"m67"}

# 1. 【基地檢測】
execute if score @s in_base_score matches 0 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 【職業檢測】嚴格限制僅自由人 (class_type 1) 可購買
execute unless score @s class_type matches 1 run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute unless score @s class_type matches 1 run tellraw @s {"text":"[商店] 權限拒絕：只有【自由人】可以購買戰術投擲物！","color":"red"}
execute unless score @s class_type matches 1 run return 0

# 3. 【價格設定與餘額檢測】(固定價格 $120)
scoreboard players set @s shop_price 120
execute if score @s gd656killicon.score < @s shop_price run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

# 4. 【發放與扣款】(不需動態扣款，直接扣 120)
give @s lrtactical:throwable{ThrowableId:"lrtactical:m67"} 1
playsound block.anvil.use master @s ~ ~ ~ 1 1.2
gd656killicon server statistics add score @s -120
tellraw @s ["",{"text":"[商店] 成功購買 M67 破片手榴彈 ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]