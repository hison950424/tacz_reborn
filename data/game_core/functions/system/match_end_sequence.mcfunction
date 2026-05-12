# ==========================================
# 【補丁】match_end_sequence.mcfunction 修改
# 在步驟 4（calculate_mvp）之前插入：
# ==========================================

# 1. 切換狀態機
scoreboard players set #global game_state 3

# 2. 強制解除武裝
gamemode adventure @a
clear @a
effect give @a minecraft:resistance 10 100 true

# 3. RP 積分結算（BR=arms_sub_mode 0，TDM=1，DOM=2）
execute if score #global arms_sub_mode matches 0..2 run function game_core:system/rank_calculate

# 3b. 比賽積分累計（當 event_mode 開啟時，將本場 rp_delta 累加至 event_score）
execute if score #global event_mode matches 1 as @a run scoreboard players operation @s event_score += @s rp_delta
execute if score #global event_mode matches 1 as @a if score @s event_score matches ..-1 run scoreboard players set @s event_score 0

# 3c. 更新 RP 排行榜與比賽積分排行榜
function game_core:lobby/rp_leaderboard_update
execute if score #global event_mode matches 1 run function game_core:lobby/event_leaderboard_update

# 4. MVP 計算
function game_core:mvp/calculate_mvp
function game_core:mvp/display_mvp

# 隊伍名稱可見
team modify blue nametagVisibility always
team modify red nametagVisibility always
team modify green nametagVisibility always
team modify white nametagVisibility always
team modify solo1 nametagVisibility always
team modify solo2 nametagVisibility always
team modify solo3 nametagVisibility always
team modify solo4 nametagVisibility always
team modify solo5 nametagVisibility always
team modify solo6 nametagVisibility always
team modify solo7 nametagVisibility always
team modify solo8 nametagVisibility always
team modify solo9 nametagVisibility always
team modify solo10 nametagVisibility always
team modify solo11 nametagVisibility always
team modify solo12 nametagVisibility always
team modify solo13 nametagVisibility always
team modify solo14 nametagVisibility always
team modify solo15 nametagVisibility always
team modify solo16 nametagVisibility always

# 邊界重置
worldborder set 9999999


# 5. 延遲重置
schedule function game_core:system/match_reset 10s
