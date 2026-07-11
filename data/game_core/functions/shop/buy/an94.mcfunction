# ==========================================
# 檔案: shop/buy_an94.mcfunction
# ==========================================
clear @s tacz:modern_kinetic_gun{ShopItem:"an94"}

execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

execute if score @s class_type matches 4 at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s class_type matches 4 run tellraw @s {"text":"[商店] 權限拒絕：您的職業無法購買步槍！","color":"red"}
execute if score @s class_type matches 4 run return 0

scoreboard players set @s shop_price 360
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 450

execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

give @s tacz:modern_kinetic_gun{GunId:"suffuse:an94",GunFireMode:"AUTO"} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -360
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -450
tellraw @s ["",{"text":"[商店] 成功購買 AN-94 ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]