# ==========================================
# 檔案: lobby/rp_leaderboard_update.mcfunction
# 目的: 重新排序 RP 積分前 10 名，並將各名次稱號寫入 storage
# 呼叫: match_end_sequence（每局結束）
# 算法: 每次從未標記玩家中找最高分，依序標記第1~10名
# ==========================================

# 清除所有舊排名標籤
tag @a remove rp_top1
tag @a remove rp_top2
tag @a remove rp_top3
tag @a remove rp_top4
tag @a remove rp_top5
tag @a remove rp_top6
tag @a remove rp_top7
tag @a remove rp_top8
tag @a remove rp_top9
tag @a remove rp_top10

# ── 第 1 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top1_cand
execute as @a[tag=rp_top1_cand,limit=1,sort=arbitrary] run tag @s add rp_top1
tag @a remove rp_top1_cand
execute store result score #rp_top1_score rp_leaderboard run scoreboard players get @a[tag=rp_top1,limit=1] rp_score
execute as @a[tag=rp_top1,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top1_tier set from storage rp_lb:temp current_tier

# ── 第 2 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top2_cand
execute as @a[tag=rp_top2_cand,limit=1,sort=arbitrary] run tag @s add rp_top2
tag @a remove rp_top2_cand
execute store result score #rp_top2_score rp_leaderboard run scoreboard players get @a[tag=rp_top2,limit=1] rp_score
execute as @a[tag=rp_top2,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top2_tier set from storage rp_lb:temp current_tier

# ── 第 3 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top3_cand
execute as @a[tag=rp_top3_cand,limit=1,sort=arbitrary] run tag @s add rp_top3
tag @a remove rp_top3_cand
execute store result score #rp_top3_score rp_leaderboard run scoreboard players get @a[tag=rp_top3,limit=1] rp_score
execute as @a[tag=rp_top3,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top3_tier set from storage rp_lb:temp current_tier

# ── 第 4 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top4_cand
execute as @a[tag=rp_top4_cand,limit=1,sort=arbitrary] run tag @s add rp_top4
tag @a remove rp_top4_cand
execute store result score #rp_top4_score rp_leaderboard run scoreboard players get @a[tag=rp_top4,limit=1] rp_score
execute as @a[tag=rp_top4,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top4_tier set from storage rp_lb:temp current_tier

# ── 第 5 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top5_cand
execute as @a[tag=rp_top5_cand,limit=1,sort=arbitrary] run tag @s add rp_top5
tag @a remove rp_top5_cand
execute store result score #rp_top5_score rp_leaderboard run scoreboard players get @a[tag=rp_top5,limit=1] rp_score
execute as @a[tag=rp_top5,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top5_tier set from storage rp_lb:temp current_tier

# ── 第 6 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top6_cand
execute as @a[tag=rp_top6_cand,limit=1,sort=arbitrary] run tag @s add rp_top6
tag @a remove rp_top6_cand
execute store result score #rp_top6_score rp_leaderboard run scoreboard players get @a[tag=rp_top6,limit=1] rp_score
execute as @a[tag=rp_top6,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top6_tier set from storage rp_lb:temp current_tier

# ── 第 7 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top7_cand
execute as @a[tag=rp_top7_cand,limit=1,sort=arbitrary] run tag @s add rp_top7
tag @a remove rp_top7_cand
execute store result score #rp_top7_score rp_leaderboard run scoreboard players get @a[tag=rp_top7,limit=1] rp_score
execute as @a[tag=rp_top7,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top7_tier set from storage rp_lb:temp current_tier

# ── 第 8 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6,tag=!rp_top7] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6,tag=!rp_top7] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top8_cand
execute as @a[tag=rp_top8_cand,limit=1,sort=arbitrary] run tag @s add rp_top8
tag @a remove rp_top8_cand
execute store result score #rp_top8_score rp_leaderboard run scoreboard players get @a[tag=rp_top8,limit=1] rp_score
execute as @a[tag=rp_top8,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top8_tier set from storage rp_lb:temp current_tier

# ── 第 9 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6,tag=!rp_top7,tag=!rp_top8] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6,tag=!rp_top7,tag=!rp_top8] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top9_cand
execute as @a[tag=rp_top9_cand,limit=1,sort=arbitrary] run tag @s add rp_top9
tag @a remove rp_top9_cand
execute store result score #rp_top9_score rp_leaderboard run scoreboard players get @a[tag=rp_top9,limit=1] rp_score
execute as @a[tag=rp_top9,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top9_tier set from storage rp_lb:temp current_tier

# ── 第 10 名 ──
scoreboard players set #rp_max rp_leaderboard 0
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6,tag=!rp_top7,tag=!rp_top8,tag=!rp_top9] run scoreboard players operation #rp_max rp_leaderboard > @s rp_score
execute as @a[tag=!rp_top1,tag=!rp_top2,tag=!rp_top3,tag=!rp_top4,tag=!rp_top5,tag=!rp_top6,tag=!rp_top7,tag=!rp_top8,tag=!rp_top9] if score @s rp_score = #rp_max rp_leaderboard if score @s rp_score matches 1.. run tag @s add rp_top10_cand
execute as @a[tag=rp_top10_cand,limit=1,sort=arbitrary] run tag @s add rp_top10
tag @a remove rp_top10_cand
execute store result score #rp_top10_score rp_leaderboard run scoreboard players get @a[tag=rp_top10,limit=1] rp_score
execute as @a[tag=rp_top10,limit=1] run function game_core:lobby/rp_lb_tier_store
data modify storage rp_lb:top top10_tier set from storage rp_lb:temp current_tier

# 更新顯示
function game_core:lobby/rp_leaderboard_refresh
execute as @a at @s run function game_core:rank/tier_update
