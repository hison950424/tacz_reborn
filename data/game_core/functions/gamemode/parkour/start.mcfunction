# ==========================================
# 檔案: gamemode/parkour_start.mcfunction
# 觸發: execute as @a[tag=on_parkour,distance=..3] run function game_core:gamemode/parkour/start
# ==========================================

# 重置計時器（含即時秒數，防止顯示上次殘留值）
scoreboard players set @s park_timer 0
scoreboard players set @s park_current_sec 0

tag @s add on_parkour
tag @s remove in_lobby

title @s actionbar {"text":"▶ 計時開始！","color":"green","bold":true}
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
