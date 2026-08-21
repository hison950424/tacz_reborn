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
#    呼叫 rank/calc → rank/calc_player（as @a），計算每人的 rp_delta 並寫入 rp_score
execute if score #global arms_sub_mode matches 0..2 run function game_core:rank/calc

# 3b. 比賽積分累計（event_score）
#
#    設計原則：比賽積分與一般 RP 使用完全相同的 rp_delta（公式與數值一致）。
#    只在比賽模式開啟（event_mode=1）時才累加，關閉時 event_score 保持不動。
#
#    ⚠️ 注意：rp_delta 已在上方 rank/calc_player 中計算完畢並寫入各玩家分數板，
#    此處直接讀取 rp_delta 累加至 event_score，不重新計算，確保數值與 rp_score 一致。
#
#    ⚠️ 歷史 Bug（已修復）：
#    舊版 rank/calc_player 第 66 行有一行無條件的 event_score += rp_delta，
#    導致 event_mode=1 時 match_end 又加一次，event_score 成為 RP 的兩倍；
#    event_mode=0 時也會錯誤累加。已移除該行，此處為唯一更新點。
execute if score #global event_mode matches 1 as @a run scoreboard players operation @s event_score += @s rp_delta
execute if score #global event_mode matches 1 as @a if score @s event_score matches ..-1 run scoreboard players set @s event_score 0

# 3c. 更新排行榜顯示
#    rp_leaderboard_update：每場結束後刷新大廳 RP 排行榜計分板
#    event_leaderboard_update：僅 event_mode=1 時刷新比賽積分排行榜
function game_core:lobby/rp_leaderboard_update
execute if score #global event_mode matches 1 run function game_core:lobby/event_leaderboard_update

# 4. MVP 計算
function game_core:player/mvp_calc
function game_core:player/mvp_display

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
schedule function game_core:core/match_reset 10s
