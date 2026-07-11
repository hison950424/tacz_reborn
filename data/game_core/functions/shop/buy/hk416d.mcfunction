# ==========================================
# 檔案: shop/buy_hk416d.mcfunction
# 觸發: 玩家把「假 HK416D」拿進背包的瞬間
# ==========================================

# 0. 【核心防弊】瞬間沒收假物品 (無論它有沒有 shop:1b，ShopItem 對了就沒收)
clear @s tacz:modern_kinetic_gun{ShopItem:"hk416d"}

# 1. 基地檢測 (不在基地直接中斷)
execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 職業檢測 (哨兵不可買步槍)
execute if score @s class_type matches 4 at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s class_type matches 4 run tellraw @s {"text":"[商店] 權限拒絕：您的職業無法購買步槍！","color":"red"}
execute if score @s class_type matches 4 run return 0

# 3. 動態價格設定 (支援兵價格加收 25%)
scoreboard players set @s shop_price 420
execute if score @s class_type matches 3 run scoreboard players set @s shop_price 525

# 4. 餘額檢測 (錢不夠直接中斷)
execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

# 5. 發放真正的武器 (不帶 shop:1b！)、音效、扣款
give @s tacz:modern_kinetic_gun{GunId:"tacz:hk416d",GunFireMode:"AUTO"} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
execute unless score @s class_type matches 3 run gd656killicon server statistics add score @s -420
execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -525
tellraw @s ["",{"text":"[商店] 成功購買 HK416D ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]