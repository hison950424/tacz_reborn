# ==========================================
# 檔案: give_starter_gear.mcfunction
# 觸發: 只有在玩家「成功轉職」或「開局第一次」時才會呼叫
# 目的: 發放初始防身武器
# ==========================================

# 1. 自由人初始武器 (CZ75 手槍)
execute as @s[scores={class_type=1}] run give @s tacz:modern_kinetic_gun{GunId:"tacz:cz75",GunFireMode:"AUTO"} 1

# 2. 突擊兵初始武器
execute as @s[scores={class_type=2}] run give @s tacz:modern_kinetic_gun{GunId:"suffuse:tt33",GunFireMode:"SEMI"} 1

# 3. 支援兵初始武器 (MAS-38 衝鋒槍)
execute as @s[scores={class_type=3}] run give @s tacz:modern_kinetic_gun{GunId:"suffuse:mas38",GunFireMode:"AUTO"} 1

# 4. 哨兵初始武器 (M1895 左輪)
execute as @s[scores={class_type=4}] run give @s tacz:modern_kinetic_gun{GunId:"suffuse:m1895",GunFireMode:"SEMI"} 1