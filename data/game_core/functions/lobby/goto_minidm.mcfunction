# ==========================================
# 檔案: lobby/goto_minidm.mcfunction
# 目的: 傳送至迷你死鬥區域（marker: minidm_spawn_point）
# ==========================================

# 傳送到迷你死鬥 Marker
tp @s @e[type=marker,tag=minidm_spawn_point,limit=1,sort=random]

# 設置玩家模式為冒險
gamemode adventure @s

# 設定重生點（迷你死鬥出生點）
spawnpoint @s 61 14 18

# 離開大廳安全領域（移除 in_lobby → 恢復受傷與戰鬥能力）
tag @s remove in_lobby
tag @s remove on_parkour
tag @s add on_minidm
execute as @s[tag=!fight] run gd656killicon server statistics set score @s 0
execute as @s[tag=!fight] run gd656killicon server statistics set assist @s 0
execute as @s[tag=!fight] run gd656killicon server statistics set death @s 0
execute as @s[tag=!fight] run gd656killicon server statistics set kill @s 0
execute as @s[tag=!fight] run tag @s add fight

#去除跑庫塔殘留訊息
title @s actionbar {"text":""}

#調整最高血量
execute as @s run attribute @s minecraft:generic.max_health base set 100
effect give @s minecraft:instant_health 3 50 true

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @s minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @s minecraft:saturation infinite 1 true

# 給予無限彈藥箱
clear @s tacz:ammo_box{AllTypeCreative:1b}
give @s tacz:ammo_box{AllTypeCreative:1b} 1

tellraw @s {"text":"[迷你死鬥] 進入熱身競技場！","color":"gold"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
