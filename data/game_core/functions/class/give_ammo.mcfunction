# ==========================================
# 檔案: give_ammo_box.mcfunction
# 目的: 發放無限彈藥箱（已有則不給；超量時清除並補發 1 個）
# ==========================================

# 超量偵測：持有 2 個以上時清除並補發 1 個
execute store result score #ammo_check temp_score run clear @s tacz:ammo_box{AllTypeCreative:1b} 0
execute if score #ammo_check temp_score matches 2.. run clear @s tacz:ammo_box{AllTypeCreative:1b}
execute if score #ammo_check temp_score matches 2.. run give @s tacz:ammo_box{AllTypeCreative:1b} 1

# 沒有時才給予
execute unless entity @s[nbt={Inventory:[{id:"tacz:ammo_box",tag:{AllTypeCreative:1b}}]}] run give @s tacz:ammo_box{AllTypeCreative:1b} 1
