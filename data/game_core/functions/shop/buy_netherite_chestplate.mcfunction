# ==========================================
# 檔案: shop/buy_netherite_chestplate.mcfunction
# ==========================================
clear @s minecraft:netherite_chestplate{ShopItem:"netherite_chestplate"}
execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0
execute if score @s class_type matches 2 at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s class_type matches 2 run tellraw @s {"text":"[商店] 權限拒絕：您的職業無法購買！","color":"red"}
execute if score @s class_type matches 2 run return 0
scoreboard players set @s shop_price 1000
execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0
give @s minecraft:netherite_chestplate{Unbreakable:1b} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
gd656killicon server statistics add score @s -1000
tellraw @s ["",{"text":"[商店] 成功購買 獄髓胸甲 ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]