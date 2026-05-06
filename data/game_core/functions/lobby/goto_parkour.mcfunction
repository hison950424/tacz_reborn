# ==========================================
# 檔案: lobby/goto_parkour.mcfunction
# 目的: 傳送至跑酷起點（marker: parkour_spawn_point）
# ==========================================

# 傳送到跑酷 TP 點
tp @s @e[type=marker,tag=parkour_spawn_point,limit=1]

# 設置玩家模式為冒險
gamemode adventure @s

# 離開大廳安全領域（跑酷需要正常的重力與墜落傷害）
tag @s remove in_lobby
tag @s remove on_minidm
tag @s remove fight
tag @s add on_parkour

# 清除計時器
scoreboard players set @s park_timer 0

# 刪除無限彈藥箱、槍械、配件
clear @s tacz:ammo_box{AllTypeCreative:1b}
clear @s tacz:modern_kinetic_gun
clear @s tacz:attachment

#調整最高血量
execute as @s run attribute @s minecraft:generic.max_health base set 100
effect give @s minecraft:instant_health 3 50 true

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @s minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @s minecraft:saturation infinite 1 true

# 重置迷你死鬥連殺（離開死鬥區就歸零）
scoreboard players set @s minidm_streak 0
scoreboard players operation @s minidm_kill_prev = @s gd656killicon.kill
scoreboard players operation @s minidm_death_prev = @s vanilla_death

tellraw @s {"text":"[跑庫塔] 走到起點壓力板即可開始計時！","color":"aqua"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
