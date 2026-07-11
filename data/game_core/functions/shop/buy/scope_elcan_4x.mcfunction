# ==========================================
# 檔案: shop/buy_scope_elcan_4x.mcfunction
# 觸發: 玩家把「假 Elcan 4x 光學瞄具」拿進背包的瞬間
# ==========================================

clear @s tacz:attachment{ShopItem:"scope_elcan_4x"}

execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 職業檢測 (全職業皆可購買配件，不需阻擋)

scoreboard players set @s shop_price 180
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 225

execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

give @s tacz:attachment{AttachmentId:"tacz:scope_elcan_4x"} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -180
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -225
tellraw @s ["",{"text":"[商店] 成功購買 Elcan 4x 瞄具 ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]