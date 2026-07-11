# ==========================================
# 檔案: gamemode/parkour_leaderboard_refresh.mcfunction
# 目的: 根據目前有紀錄的名次，動態更新排行榜顯示
# ==========================================

# 預設：完全無紀錄
data modify entity @e[type=text_display,tag=parkour_leaderboard,limit=1] text set value '[{"text":"🏃 跑庫塔排行榜\\n","color":"gold","bold":true},{"text":"（尚無紀錄）","color":"gray"}]'

# 第 1 名存在：顯示 1 名 + 2、3 名暫無
execute if entity @a[tag=park_top1] run data modify entity @e[type=text_display,tag=parkour_leaderboard,limit=1] text set value '[{"text":"🏃 跑庫塔排行榜\\n","color":"gold","bold":true},{"text":"🥇 ","color":"yellow"},{"selector":"@a[tag=park_top1]"},{"text":" - ","color":"gray"},{"score":{"name":"#park_top1_time","objective":"park_leaderboard"}},{"text":" 秒\\n","color":"aqua"},{"text":"🥈 暫無紀錄\\n","color":"gray"},{"text":"🥉 暫無紀錄","color":"gray"}]'

# 第 2 名也存在：顯示 1、2 名 + 3 名暫無
execute if entity @a[tag=park_top2] run data modify entity @e[type=text_display,tag=parkour_leaderboard,limit=1] text set value '[{"text":"🏃 跑庫塔排行榜\\n","color":"gold","bold":true},{"text":"🥇 ","color":"yellow"},{"selector":"@a[tag=park_top1]"},{"text":" - ","color":"gray"},{"score":{"name":"#park_top1_time","objective":"park_leaderboard"}},{"text":" 秒\\n","color":"aqua"},{"text":"🥈 ","color":"gray"},{"selector":"@a[tag=park_top2]"},{"text":" - ","color":"gray"},{"score":{"name":"#park_top2_time","objective":"park_leaderboard"}},{"text":" 秒\\n","color":"aqua"},{"text":"🥉 暫無紀錄","color":"gray"}]'

# 第 3 名也存在：顯示完整 3 名
execute if entity @a[tag=park_top3] run data modify entity @e[type=text_display,tag=parkour_leaderboard,limit=1] text set value '[{"text":"🏃 跑庫塔排行榜\\n","color":"gold","bold":true},{"text":"🥇 ","color":"yellow"},{"selector":"@a[tag=park_top1]"},{"text":" - ","color":"gray"},{"score":{"name":"#park_top1_time","objective":"park_leaderboard"}},{"text":" 秒\\n","color":"aqua"},{"text":"🥈 ","color":"gray"},{"selector":"@a[tag=park_top2]"},{"text":" - ","color":"gray"},{"score":{"name":"#park_top2_time","objective":"park_leaderboard"}},{"text":" 秒\\n","color":"aqua"},{"text":"🥉 ","color":"dark_gray"},{"selector":"@a[tag=park_top3]"},{"text":" - ","color":"gray"},{"score":{"name":"#park_top3_time","objective":"park_leaderboard"}},{"text":" 秒","color":"aqua"}]'
