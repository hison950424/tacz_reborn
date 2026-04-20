# ==========================================
# 檔案: gamemode/on_death.mcfunction
# 觸發: 當玩家死亡時 (death_trigger >= 1)
# ==========================================

# 發放 5 元陣亡補貼 (調用插件指令)
execute as @s run gd656killicon server statistics add score @s 5

# 聊天欄微弱提示 (不要用大標題，以免干擾視線)
execute as @s run tellraw @s {"text":"[系統] 陣亡補貼：+5 元","color":"gray","italic":true}

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true
