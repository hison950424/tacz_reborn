# ==========================================
# 檔案: apply_class.mcfunction
# 觸發: 遊戲開始傳送時，或玩家死亡重生時
# 目的: 設定血量上限、給予初始武器與投擲物
# ==========================================

# 1. 血量上限設定 (1點=半顆心，80點=40顆心=4排血)
# 自由人
execute as @s[scores={class_type=1}] run attribute @s minecraft:generic.max_health base set 80
# 突擊兵、支援兵、哨兵
execute as @s[scores={class_type=2..4}] run attribute @s minecraft:generic.max_health base set 100

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true

# 2. 瞬間滿血 (改變上限後必須補血才會生效)
effect give @s minecraft:instant_health 3 50 true
