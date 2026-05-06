# ==========================================
# 檔案: lobby/return_to_lobby.mcfunction
# 目的: 從子區域返回大廳中心
# ==========================================

# 傳送
tp @s @e[type=marker,tag=lobby_spawn_point,limit=1]
spawnpoint @s -4 32 -1

# 設置玩家模式為冒險
gamemode adventure @s

# 回到大廳安全領域
tag @s add in_lobby
tag @s remove on_parkour
tag @s remove on_minidm
tag @s remove fight


# 重置迷你死鬥連殺
scoreboard players set @s minidm_streak 0
scoreboard players operation @s minidm_kill_prev = @s gd656killicon.kill
scoreboard players operation @s minidm_death_prev = @s vanilla_death

# 刪除無限彈藥箱、槍械、配件
clear @s tacz:ammo_box{AllTypeCreative:1b}
clear @s tacz:modern_kinetic_gun
clear @s tacz:attachment

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

# 清除跑酷計時
scoreboard players set @s park_timer 0
scoreboard players set @s park_current_sec 0

tellraw @s {"text":"[大廳] 已返回大廳中心。","color":"green"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1

# 書本由 lobby_second_tick 的 NBT 偵測自動補發
