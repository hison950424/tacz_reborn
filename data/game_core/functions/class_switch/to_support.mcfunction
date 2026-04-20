# ==========================================
# 檔案: to_support.mcfunction
# ==========================================
# 1. 格式化
clear @s tacz:modern_kinetic_gun
clear @s lrtactical:throwable

# 2. 變更職業 ID 並初始化 (設定強化補包)
scoreboard players set @s class_type 3
function game_core:class/apply_class

# 3. 職業資訊顯示
tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已成為 ","color":"white"},{"text":"支援兵！","color":"aqua"}]
tellraw @s {"text":""}
tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「戰術補給」","color":"green"}]
tellraw @s ["",{"text":"    效果: ","color":"gray"},{"text":"補包增強為強化補包。","color":"white"}]
tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「後勤負擔」","color":"red"}]
tellraw @s ["",{"text":"    效果: ","color":"gray"},{"text":"所有物品的購買價格 +25%。","color":"white"}]
tellraw @s {"text":""}
tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"霰彈槍, 步槍","color":"white"}]
tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"所有投擲物。","color":"white"}]

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 0 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true