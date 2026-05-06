# ==========================================
# 檔案: gamemode/parkour_new_record.mcfunction
# 以玩家身份執行
# ==========================================

# 更新個人最佳（秒）
scoreboard players operation @s park_best = @s park_best_sec

# 廣播新紀錄
tellraw @a [{"text":"[跑庫塔] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":" 創下新個人最佳！","color":"aqua"},{"score":{"name":"@s","objective":"park_best_sec"},"color":"green","bold":true},{"text":" 秒","color":"aqua"}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1



# 更新排行榜
function game_core:gamemode/parkour_leaderboard_update
