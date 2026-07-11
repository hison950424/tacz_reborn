# ==========================================
# 檔案: system/lobby_environment_tick.mcfunction
# 目的: 大廳全局環境效果（每 tick 執行）
# 呼叫來源: lobby_tick.mcfunction 開頭
# ==========================================

# [1] 全域飽食協議 - 全地圖持續補充飽食（duration=3s 每 tick 刷新 = 永久）
effect give @a minecraft:saturation 3 1 true

# [2] 大廳安全領域 - 僅對帶有 in_lobby tag 的玩家套用
# weakness 255：禁止近戰傷害，確保大廳與跑庫非戰鬥區安全
effect give @a[tag=in_lobby] minecraft:weakness 3 255 true
effect give @a[tag=on_parkour] minecraft:weakness 3 255 true
# resistance 255：防止意外墜落或環境傷害（mini DM / 跑酷玩家不在此範圍）
effect give @a[tag=in_lobby] minecraft:resistance 3 255 true


#[訓練場]調整最高血量
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run attribute @s minecraft:generic.max_health base set 100
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run effect give @s minecraft:instant_health 3 50 true
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run tag @s remove on_parkour
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run tag @s remove on_minidm
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run tag @s remove in_combat
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run tag @s add in_lobby
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run scoreboard players set @s combat_tag_sec -1
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run clear @s minecraft:potion
# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run effect give @s minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run effect give @s minecraft:saturation infinite 1 true


#[大廳]
execute as @e[type=marker,tag=lobby_spawn_point] at @s as @p[distance=..5] run attribute @s minecraft:generic.max_health base set 100
execute as @e[type=marker,tag=lobby_spawn_point] at @s as @p[distance=..5] run effect give @s minecraft:instant_health 3 50 true
# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
execute as @e[type=marker,tag=lobby_spawn_point] at @s as @p[distance=..5] run effect give @s minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
execute as @e[type=marker,tag=lobby_spawn_point] at @s as @p[distance=..5] run effect give @s minecraft:saturation infinite 1 true

# execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run 
# execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run 
# execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run 
# execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run 
# execute as @e[type=marker,tag=training_spawn_point] at @s as @p[distance=..5] run 
