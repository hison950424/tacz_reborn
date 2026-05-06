# ==========================================
# 檔案: gamemode/minidm_death_event.mcfunction
# 目的: 玩家在迷你死鬥死亡時執行（以死亡玩家身份執行）
# ==========================================

# 若本命連殺 >= 10 → 廣播「終結連殺」公告
execute if score @s minidm_streak matches 10.. run tellraw @a [{"text":"[ ⚔️ ] ","color":"red","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" 的 ","color":"gray"},{"score":{"name":"@s","objective":"minidm_streak"},"color":"gold","bold":true},{"text":" 連殺被終結了！","color":"gold","bold":true}]
execute if score @s minidm_streak matches 10.. run playsound minecraft:entity.wither.hurt master @a ~ ~ ~ 1 0.8

# 重置本命連殺
scoreboard players set @s minidm_streak 0
