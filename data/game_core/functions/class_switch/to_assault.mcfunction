# ==========================================
# 檔案: to_assault.mcfunction
# ==========================================
# 1. 格式化
clear @s tacz:modern_kinetic_gun
clear @s lrtactical:throwable

# 2. 變更職業 ID 並初始化 (設定 Speed II)
scoreboard players set @s class_type 2
function game_core:class/apply_class

# 3. 職業資訊顯示
tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已成為 ","color":"white"},{"text":"突擊兵！","color":"aqua"}]
tellraw @s {"text":""}
tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「輕裝上陣」","color":"green"}]
tellraw @s ["",{"text":"    效果: ","color":"gray"},{"text":"移動速度 +40%。","color":"white"}]
tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「輕裝協議」","color":"red"}]
tellraw @s ["",{"text":"    效果: ","color":"gray"},{"text":"無法購買或穿戴鐵等級以上(不含)的防具、無法購買高倍鏡。","color":"white"}]
tellraw @s {"text":""}
tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"散彈槍, 衝鋒槍","color":"white"}]
tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"擊殺敵人後自動補充 ","color":"white"},{"text":"閃光彈,破片手榴彈","color":"aqua"}]

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 0 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true