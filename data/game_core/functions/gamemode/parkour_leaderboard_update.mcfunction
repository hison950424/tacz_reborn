# ==========================================
# 檔案: gamemode/parkour_leaderboard_update.mcfunction
# 目的: 更新前 3 名排行榜（以創紀錄玩家身份執行）
# 排行榜：tag=park_top1/2/3 標記名次
#         #park_top1/2/3_time park_leaderboard 儲存時間（秒）
# ==========================================

# ─ 階段 1：若 @s 已在排行榜，先移除並補位 ─

scoreboard players set @s rank_temp 0
execute if entity @s[tag=park_top1] run scoreboard players set @s rank_temp 1
execute if entity @s[tag=park_top2] run scoreboard players set @s rank_temp 2
execute if entity @s[tag=park_top3] run scoreboard players set @s rank_temp 3

tag @s remove park_top1
tag @s remove park_top2
tag @s remove park_top3

# @s 原為第 1 名 → 2 升 1，3 升 2，清空 3
execute if score @s rank_temp matches 1 run tag @a[tag=park_top2] add park_top1
execute if score @s rank_temp matches 1 run scoreboard players operation #park_top1_time park_leaderboard = #park_top2_time park_leaderboard
execute if score @s rank_temp matches 1 run tag @a[tag=park_top2] remove park_top2
execute if score @s rank_temp matches 1 run tag @a[tag=park_top3] add park_top2
execute if score @s rank_temp matches 1 run scoreboard players operation #park_top2_time park_leaderboard = #park_top3_time park_leaderboard
execute if score @s rank_temp matches 1 run tag @a[tag=park_top3] remove park_top3
execute if score @s rank_temp matches 1 run scoreboard players set #park_top3_time park_leaderboard 9999

# @s 原為第 2 名 → 3 升 2，清空 3
execute if score @s rank_temp matches 2 run tag @a[tag=park_top3] add park_top2
execute if score @s rank_temp matches 2 run scoreboard players operation #park_top2_time park_leaderboard = #park_top3_time park_leaderboard
execute if score @s rank_temp matches 2 run tag @a[tag=park_top3] remove park_top3
execute if score @s rank_temp matches 2 run scoreboard players set #park_top3_time park_leaderboard 9999

# @s 原為第 3 名 → 清空 3
execute if score @s rank_temp matches 3 run scoreboard players set #park_top3_time park_leaderboard 9999

# ─ 階段 2：決定 @s 應插入哪個名次（與補位後的時間比較）─

scoreboard players set @s rank_temp 0
execute if score @s park_best < #park_top1_time park_leaderboard run scoreboard players set @s rank_temp 1
execute if score @s park_best < #park_top2_time park_leaderboard unless score @s park_best < #park_top1_time park_leaderboard run scoreboard players set @s rank_temp 2
execute if score @s park_best < #park_top3_time park_leaderboard unless score @s park_best < #park_top2_time park_leaderboard run scoreboard players set @s rank_temp 3

# 插入第 1 名（原 1 降到 2，原 2 降到 3，原 3 清除）
execute if score @s rank_temp matches 1 run tag @a[tag=park_top3] remove park_top3
execute if score @s rank_temp matches 1 run tag @a[tag=park_top2] add park_top3
execute if score @s rank_temp matches 1 run scoreboard players operation #park_top3_time park_leaderboard = #park_top2_time park_leaderboard
execute if score @s rank_temp matches 1 run tag @a[tag=park_top2] remove park_top2
execute if score @s rank_temp matches 1 run tag @a[tag=park_top1] add park_top2
execute if score @s rank_temp matches 1 run scoreboard players operation #park_top2_time park_leaderboard = #park_top1_time park_leaderboard
execute if score @s rank_temp matches 1 run tag @a[tag=park_top1] remove park_top1
execute if score @s rank_temp matches 1 run tag @s add park_top1
execute if score @s rank_temp matches 1 run scoreboard players operation #park_top1_time park_leaderboard = @s park_best

# 插入第 2 名（原 2 降到 3，原 3 清除）
execute if score @s rank_temp matches 2 run tag @a[tag=park_top3] remove park_top3
execute if score @s rank_temp matches 2 run tag @a[tag=park_top2] add park_top3
execute if score @s rank_temp matches 2 run scoreboard players operation #park_top3_time park_leaderboard = #park_top2_time park_leaderboard
execute if score @s rank_temp matches 2 run tag @a[tag=park_top2] remove park_top2
execute if score @s rank_temp matches 2 run tag @s add park_top2
execute if score @s rank_temp matches 2 run scoreboard players operation #park_top2_time park_leaderboard = @s park_best

# 插入第 3 名（原 3 清除）
execute if score @s rank_temp matches 3 run tag @a[tag=park_top3] remove park_top3
execute if score @s rank_temp matches 3 run tag @s add park_top3
execute if score @s rank_temp matches 3 run scoreboard players operation #park_top3_time park_leaderboard = @s park_best

scoreboard players set @s rank_temp 0

# ─ 更新顯示 ─
function game_core:gamemode/parkour_leaderboard_refresh
