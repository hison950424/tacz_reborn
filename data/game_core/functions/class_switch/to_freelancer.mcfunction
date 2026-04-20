# ==========================================
# 檔案: to_freelancer.mcfunction
# ==========================================
# 1. 格式化：清除所有舊槍械與舊投擲物
clear @s tacz:modern_kinetic_gun
clear @s lrtactical:throwable

# 2. 變更職業 ID 並初始化 (設定血量上限 80)
scoreboard players set @s class_type 1
function game_core:class/apply_class

# 3. 職業資訊顯示
tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已成為 ","color":"white"},{"text":"自由人！","color":"aqua"}]
tellraw @s {"text":""}
tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「武器大師」","color":"green"}]
tellraw @s ["",{"text":"    效果: ","color":"gray"},{"text":"可購買和使用所有武器、配件與道具。","color":"white"}]
tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「孤狼代價」","color":"red"}]
tellraw @s ["",{"text":"    效果: ","color":"gray"},{"text":"最大生命值上限為 80 HP (-20%)。","color":"white"}]
tellraw @s {"text":""}
tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買裝備: ","color":"yellow"},{"text":"無任何限制。","color":"white"}]
tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"關於投擲物: ","color":"yellow"},{"text":"你是唯一需要自己花錢購買的職業。","color":"white"}]

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 0 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true