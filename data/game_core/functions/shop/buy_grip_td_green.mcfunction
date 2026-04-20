# ==========================================
# 檔案: shop/buy_grip_td_green.mcfunction
# 說明: 處理 TD 快拆握把 (綠色款) 的購買邏輯
# ==========================================
# 0. 【核心防弊】沒收玩家剛從箱子裡拿到的「展示假物品」
clear @s tacz:attachment{ShopItem:"grip_td_green"}

# 1. 【基地檢測】檢查玩家是否在基地內，若不在則警告並中斷
execute if score @s in_base_score matches 0 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 【職業檢測】全職業皆可購買配件，此處不需阻擋

# 3. 【價格設定】設定基礎價格 $100，支援兵 (+25%) 則為 $125
scoreboard players set @s shop_price 100
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 125

# 4. 【餘額檢測】檢查玩家分數是否足夠，不足則警告並中斷
execute if score @s gd656killicon.score < @s shop_price run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

# 5. 【發放與扣款】給予真實配件、播放音效，並依職業扣除對應分數
give @s tacz:attachment{AttachmentId:"suffuse:grip_td_green"} 1
playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -100
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -125
tellraw @s ["",{"text":"[商店] 成功購買 TD 快拆握把 (綠) ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]