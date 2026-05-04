# ==========================================
# 檔案: shop/buy_akm.mcfunction
# 觸發: 玩家把「假 AKM」拿進背包的瞬間
# ==========================================

# 0. 【核心防弊】瞬間沒收玩家剛從箱子裡拿到的「展示假槍」
clear @s tacz:modern_kinetic_gun{ShopItem:"svd"}

# 1. 基地檢測 (不在基地直接中斷)
execute if score @s in_base_score matches 0 at @s run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s in_base_score matches 0 run tellraw @s {"text":"[商店警告] 必須在基地內才能購買！","color":"dark_red","bold":true}
execute if score @s in_base_score matches 0 run return 0

# 2. 職業檢測 ( 狙擊槍只有哨兵與自由人能買！其他職業無法購買！)
execute if score @s class_type matches 2..3 at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s class_type matches 2..3 run tellraw @s {"text":"[商店] 權限拒絕：您的職業無法購買狙擊槍！","color":"red"}
execute if score @s class_type matches 2..3 run return 0

# 3. 動態價格設定 (支援兵價格 * 1.25)
scoreboard players set @s shop_price 150
# # 只有哨兵能買 沒有動態價格問題
# execute if score @s class_type matches 3 run scoreboard players set @s shop_price 610

# 4. 餘額檢測 (錢不夠直接中斷)
execute if score @s gd656killicon.score < @s shop_price at @s run playsound entity.villager.no master @s ~ ~ ~ 1 1
execute if score @s gd656killicon.score < @s shop_price run tellraw @s ["",{"text":"[商店] 餘額不足！需要 ","color":"red"},{"score":{"name":"@s","objective":"shop_price"},"color":"yellow"},{"text":" 元。","color":"red"}]
execute if score @s gd656killicon.score < @s shop_price run return 0

# 6. 發放真正的武器、音效、扣款
give @s tacz:modern_kinetic_gun{GunId:"suffuse:svd",GunFireMode:"SEMI"} 1
execute at @s run playsound block.anvil.use master @s ~ ~ ~ 1 1.2
gd656killicon server statistics add score @s -150
# # 只有哨兵能買 沒有動態價格問題
# execute if score @s class_type matches 3 run gd656killicon server statistics add score @s -610
tellraw @s ["",{"text":"[商店] 成功購買 svd ！剩餘餘額：","color":"green"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"yellow"},{"text":" 元。","color":"green"}]

