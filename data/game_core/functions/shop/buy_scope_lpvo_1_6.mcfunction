# ==========================================
# 檔案: shop/buy_scope_lpvo_1_6.mcfunction
# 觸發: 玩家把「假 LPVO 1-6x 瞄準鏡」拿進背包的瞬間
# ==========================================

clear @s tacz:attachment{ShopItem:"scope_lpvo_1_6"}

execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 職業檢測 (全職業皆可購買配件，不需阻擋)

scoreboard players set @s shop_price 300
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 375

execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

give @s tacz:attachment{AttachmentId:"tacz:scope_lpvo_1_6"} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -300
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -375
tellraw @s ["",{"text":"[商店] 成功購買 LPVO 1-6x ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]