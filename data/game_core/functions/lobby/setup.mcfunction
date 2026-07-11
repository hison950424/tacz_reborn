# ==========================================
# 檔案: system/setup_lobby.mcfunction
# 目的: 一次性初始化大廳永久實體（跑酷排行榜 text_display 等）
# 使用方式: 由管理員手動執行一次 /function game_core:lobby/setup
# 前提: 需先在大廳放置 tag=parkour_leaderboard_spawn 的 Marker，
#       標示排行榜顯示位置
# ==========================================

# 清除舊排行榜實體（避免重複）
kill @e[type=text_display,tag=parkour_leaderboard]

# 在指定 Marker 位置生成排行榜 text_display
execute at @e[type=marker,tag=parkour_leaderboard_spawn,limit=1] run summon text_display ~ ~3 ~ {Tags:["parkour_leaderboard"],text:'[{"text":"🏃 跑庫塔排行榜\\n","color":"gold","bold":true},{"text":"（尚無紀錄）","color":"gray"}]',billboard:"center",background:553648127,shadow_radius:0.0f,line_width:200}

tellraw @a[tag=admin] {"text":"[系統] 大廳排行榜已初始化。","color":"green"}
