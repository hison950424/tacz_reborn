# ==========================================
# 檔案: lobby/goto_training.mcfunction
# 目的: 傳送至訓練場（marker: training_spawn_point）
# ==========================================

# 傳送到訓練場 Marker
tp @s @e[type=marker,tag=training_spawn_point,limit=1]

# 設置玩家模式為冒險
gamemode adventure @s

# 訓練場仍屬大廳安全區（保留 in_lobby tag）
# 移除跑酷或死鬥標記以防萬一
tag @s remove on_parkour
tag @s remove on_minidm
tag @s add in_lobby
execute as @s[tag=!fight] run tag @s add fight

# 給予無限彈藥箱
clear @s tacz:ammo_box{AllTypeCreative:1b}
give @s tacz:ammo_box{AllTypeCreative:1b} 1

#調整最高血量
execute as @s run attribute @s minecraft:generic.max_health base set 100
effect give @s minecraft:instant_health 3 50 true

#去除跑庫塔殘留訊息
title @s actionbar {"text":""}

# 重置迷你死鬥連殺（離開死鬥區就歸零）
scoreboard players set @s minidm_streak 0
scoreboard players operation @s minidm_kill_prev = @s gd656killicon.kill
scoreboard players operation @s minidm_death_prev = @s vanilla_death

tellraw @s {"text":"[訓練場] 已進入訓練場。","color":"green"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
