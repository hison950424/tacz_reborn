# ==========================================
# 檔案: give_ammo_box.mcfunction
# 目的: 獨立發放無限彈藥箱，並防止重複堆疊
# ==========================================

# 1. 先清除玩家身上可能殘留的無限彈藥箱 (確保不會越拿越多)
clear @s tacz:ammo_box{AllTypeCreative:1b}

# 2. 發放一個全新的無限彈藥箱
give @s tacz:ammo_box{AllTypeCreative:1b} 1