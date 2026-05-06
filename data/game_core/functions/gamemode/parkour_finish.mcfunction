# ==========================================
# 檔案: gamemode/parkour_finish.mcfunction
# 目的: 玩家踩到跑酷終點壓力板時執行
# 觸發方式: 終點壓力板旁的指令方塊
#   execute as @a[tag=on_parkour,distance=..3] run function game_core:gamemode/parkour_finish
# ==========================================

# 停止計時
tag @s remove on_parkour

# 轉換為秒數（整數）存入 park_best_sec 供顯示用
scoreboard players operation @s park_best_sec = @s park_timer
scoreboard players operation @s park_best_sec /= #20 dom_const

# 個人最佳判定
execute if score @s park_best_sec < @s park_best run function game_core:gamemode/parkour_new_record
execute if score @s park_best_sec >= @s park_best run tellraw @s [{"text":"[跑庫塔] 完成！時間: ","color":"aqua"},{"score":{"name":"@s","objective":"park_best_sec"},"color":"yellow"},{"text":" 秒（最佳: ","color":"gray"},{"score":{"name":"@s","objective":"park_best"},"color":"gold"},{"text":" 秒）","color":"gray"}]
execute if score @s park_best_sec >= @s park_best run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1

# 返回大廳安全區
tag @s add in_lobby
spawnpoint @s -4 32 -1
