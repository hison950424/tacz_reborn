# ==========================================
# 檔案: lobby/event_leaderboard_update.mcfunction
# 目的: 重新排序比賽積分前 10 名
# 呼叫: match_end_sequence（event_mode=1 時）
#       admin_event_ctrl=3（重置積分後）
# ==========================================

# 清除所有舊排名標籤
tag @a remove evt_top1
tag @a remove evt_top2
tag @a remove evt_top3
tag @a remove evt_top4
tag @a remove evt_top5
tag @a remove evt_top6
tag @a remove evt_top7
tag @a remove evt_top8
tag @a remove evt_top9
tag @a remove evt_top10

# ── 第 1 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top1_cand
execute as @a[tag=evt_top1_cand,limit=1,sort=arbitrary] run tag @s add evt_top1
tag @a remove evt_top1_cand
execute store result score #evt_top1_score evt_leaderboard run scoreboard players get @a[tag=evt_top1,limit=1] event_score

# ── 第 2 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top2_cand
execute as @a[tag=evt_top2_cand,limit=1,sort=arbitrary] run tag @s add evt_top2
tag @a remove evt_top2_cand
execute store result score #evt_top2_score evt_leaderboard run scoreboard players get @a[tag=evt_top2,limit=1] event_score

# ── 第 3 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top3_cand
execute as @a[tag=evt_top3_cand,limit=1,sort=arbitrary] run tag @s add evt_top3
tag @a remove evt_top3_cand
execute store result score #evt_top3_score evt_leaderboard run scoreboard players get @a[tag=evt_top3,limit=1] event_score

# ── 第 4 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top4_cand
execute as @a[tag=evt_top4_cand,limit=1,sort=arbitrary] run tag @s add evt_top4
tag @a remove evt_top4_cand
execute store result score #evt_top4_score evt_leaderboard run scoreboard players get @a[tag=evt_top4,limit=1] event_score

# ── 第 5 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top5_cand
execute as @a[tag=evt_top5_cand,limit=1,sort=arbitrary] run tag @s add evt_top5
tag @a remove evt_top5_cand
execute store result score #evt_top5_score evt_leaderboard run scoreboard players get @a[tag=evt_top5,limit=1] event_score

# ── 第 6 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top6_cand
execute as @a[tag=evt_top6_cand,limit=1,sort=arbitrary] run tag @s add evt_top6
tag @a remove evt_top6_cand
execute store result score #evt_top6_score evt_leaderboard run scoreboard players get @a[tag=evt_top6,limit=1] event_score

# ── 第 7 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top7_cand
execute as @a[tag=evt_top7_cand,limit=1,sort=arbitrary] run tag @s add evt_top7
tag @a remove evt_top7_cand
execute store result score #evt_top7_score evt_leaderboard run scoreboard players get @a[tag=evt_top7,limit=1] event_score

# ── 第 8 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6,tag=!evt_top7] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6,tag=!evt_top7] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top8_cand
execute as @a[tag=evt_top8_cand,limit=1,sort=arbitrary] run tag @s add evt_top8
tag @a remove evt_top8_cand
execute store result score #evt_top8_score evt_leaderboard run scoreboard players get @a[tag=evt_top8,limit=1] event_score

# ── 第 9 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6,tag=!evt_top7,tag=!evt_top8] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6,tag=!evt_top7,tag=!evt_top8] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top9_cand
execute as @a[tag=evt_top9_cand,limit=1,sort=arbitrary] run tag @s add evt_top9
tag @a remove evt_top9_cand
execute store result score #evt_top9_score evt_leaderboard run scoreboard players get @a[tag=evt_top9,limit=1] event_score

# ── 第 10 名 ──
scoreboard players set #evt_max evt_leaderboard 0
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6,tag=!evt_top7,tag=!evt_top8,tag=!evt_top9] run scoreboard players operation #evt_max evt_leaderboard > @s event_score
execute as @a[tag=!evt_top1,tag=!evt_top2,tag=!evt_top3,tag=!evt_top4,tag=!evt_top5,tag=!evt_top6,tag=!evt_top7,tag=!evt_top8,tag=!evt_top9] if score @s event_score = #evt_max evt_leaderboard if score @s event_score matches 1.. run tag @s add evt_top10_cand
execute as @a[tag=evt_top10_cand,limit=1,sort=arbitrary] run tag @s add evt_top10
tag @a remove evt_top10_cand
execute store result score #evt_top10_score evt_leaderboard run scoreboard players get @a[tag=evt_top10,limit=1] event_score

# 更新顯示（依 event_mode 自動選擇 🟢/🔴 樣式）
function game_core:lobby/event_leaderboard_auto_refresh
