# ==========================================
# 檔案: shop/buy_aks74u.mcfunction
# ==========================================
clear @s tacz:modern_kinetic_gun{ShopItem:"aks74u"}

execute if score @s in_base_score matches 0 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

execute if score @s class_type matches 4 run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s class_type matches 4 run tellraw @s {"text":"[商店] 權限拒絕：您的職業無法購買步槍！","color":"red"}
execute if score @s class_type matches 4 run return 0

scoreboard players set @s shop_price 300
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 375

execute if score @s gd656killicon.score < @s shop_price run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

give @s tacz:modern_kinetic_gun{GunId:"suffuse:aks74u",GunFireMode:"AUTO"} 1
playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -300
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -375
tellraw @s ["",{"text":"[商店] 成功購買 AKS-74U ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]