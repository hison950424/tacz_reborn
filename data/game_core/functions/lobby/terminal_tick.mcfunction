# ==========================================
# 檔案: lobby/terminal_tick.mcfunction
# lobby_terminal: 1=訓練場 2=迷你死鬥 3=跑酷塔
#                 4=個人戰績 5=返回大廳 6=規則書
#                 7=場景選擇書 8=玩家功能書
#                 9=上一頁（回根書） 11=模式與隊伍書(admin)
#                 12=上一頁（隊伍書 → 模式與隊伍書，admin）
# admin_terminal: 1=發放隊伍書 2=發放指令書給所有人
# ==========================================

scoreboard players enable @a lobby_terminal

# 路由 1: 訓練場
execute as @a[scores={lobby_terminal=1},tag=in_combat] run tellraw @s [{"text":"[系統] ⚔ 戰鬥標記中，","color":"red"},{"score":{"name":"@s","objective":"combat_tag_sec"}},{"text":" 秒後才能傳送。","color":"red"}]
execute as @a[scores={lobby_terminal=1},tag=!in_combat] run function game_core:lobby/goto_training

# 路由 2: 迷你死鬥
execute as @a[scores={lobby_terminal=2},tag=on_minidm,tag=!in_combat] run tellraw @s [{"text":"[系統] ⚔ 你現在就在迷你死鬥中","color":"red"}]
execute as @a[scores={lobby_terminal=2},tag=in_combat] run tellraw @s [{"text":"[系統] ⚔ 戰鬥標記中，","color":"red"},{"score":{"name":"@s","objective":"combat_tag_sec"}},{"text":" 秒後才能傳送。","color":"red"}]
execute as @a[scores={lobby_terminal=2},tag=!in_combat,tag=!on_minidm] run function game_core:lobby/goto_minidm

# 路由 3: 跑酷塔
execute as @a[scores={lobby_terminal=3},tag=in_combat] run tellraw @s [{"text":"[系統] ⚔ 戰鬥標記中，","color":"red"},{"score":{"name":"@s","objective":"combat_tag_sec"}},{"text":" 秒後才能傳送。","color":"red"}]
execute as @a[scores={lobby_terminal=3},tag=!in_combat] run function game_core:lobby/goto_parkour

# 路由 4: 個人戰績
execute as @a[scores={lobby_terminal=4}] run function game_core:lobby/show_stats

# 路由 5: 返回大廳
execute as @a[scores={lobby_terminal=5},tag=in_combat] run tellraw @s [{"text":"[系統] ⚔ 戰鬥標記中，","color":"red"},{"score":{"name":"@s","objective":"combat_tag_sec"}},{"text":" 秒後才能傳送。","color":"red"}]
execute as @a[scores={lobby_terminal=5},tag=!in_combat] run function game_core:lobby/return_to_lobby

# 路由 6: 規則書
execute as @a[scores={lobby_terminal=6}] run function game_core:lobby/give_rules_book

# 路由 7: 場景選擇書
execute as @a[scores={lobby_terminal=7}] run function game_core:lobby/give_scene_book

# 路由 8: 玩家功能書
execute as @a[scores={lobby_terminal=8}] run function game_core:lobby/give_player_book

# 路由 9: 上一頁（回根書）
execute as @a[scores={lobby_terminal=9},tag=!admin] run function game_core:lobby/give_lobby_terminal
execute as @a[scores={lobby_terminal=9},tag=admin] run function game_core:lobby/give_admin_terminal

# 路由 11: 模式與隊伍書（管理員）
execute as @a[scores={lobby_terminal=11},tag=admin] run function game_core:lobby/give_mode_team_book

# 路由 12: 上一頁（從隊伍選擇書回模式與隊伍書，管理員）
execute as @a[scores={lobby_terminal=12},tag=admin] run function game_core:lobby/give_mode_team_book

# ===========================================
# Admin Terminal（僅 tag=admin）
# ===========================================
scoreboard players enable @a[tag=admin] admin_terminal

# 路由 1: 發放隊伍選擇書（普通玩家拿一般版，管理員拿有上一頁→模式書的版本）
execute as @a[tag=admin,scores={admin_terminal=1}] run tellraw @a {"text":"[系統] 管理員已發放隊伍選擇書。","color":"yellow"}
execute as @a[tag=admin,scores={admin_terminal=1}] run execute as @a[tag=!admin] run function game_core:lobby/give_team_book
execute as @a[tag=admin,scores={admin_terminal=1}] run execute as @a[tag=admin] run function game_core:lobby/give_admin_team_book
execute as @a[tag=admin,scores={admin_terminal=1}] run playsound ui.button.click master @s ~ ~ ~ 1 1

# 路由 2: 重新發放指令書給所有人
execute as @a[tag=admin,scores={admin_terminal=2}] run function game_core:lobby/give_all_books
execute as @a[tag=admin,scores={admin_terminal=2}] run playsound ui.button.click master @s ~ ~ ~ 1 1

scoreboard players set @a[scores={admin_terminal=1..}] admin_terminal 0


# ===========================================
# 跑庫塔計時
# ===========================================
function game_core:gamemode/parkour_tick

# ===========================================
# 展示數據按鈕（show_stat trigger）
# ===========================================
scoreboard players enable @a show_stat

# RP 積分
execute as @a[scores={show_stat=1}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  RP 積分：","color":"gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"yellow","bold":true}]

# 軍階
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 1 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T1 訓練生","color":"gray"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 2 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T2 戰術先鋒","color":"white"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 3 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T3 影之掠奪者","color":"dark_gray"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 4 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T4 鋼鐵捍衛者","color":"blue"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 5 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T5 巔峰獵手","color":"gold"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 6 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T6 灰燼審判官","color":"red"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 7 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T7 虛空行者","color":"dark_purple"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 8 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T8 幽靈軍官","color":"aqua"}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 9 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T9 末日指揮官","color":"dark_red","bold":true}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 10 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T10 戰爭主宰","color":"light_purple","bold":true}]
execute as @a[scores={show_stat=2}] if score @s rank_tier matches 11 run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  軍階：","color":"gray"},{"text":"T11 ★ 永恆傳奇 ★","color":"yellow","bold":true}]

# 大逃殺 勝/敗/連勝
execute as @a[scores={show_stat=3}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  大逃殺  勝 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_wins_br"},"color":"green"},{"text":"  敗 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_losses_br"},"color":"red"},{"text":"  連勝 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_streak_br"},"color":"gold"}]

# 大逃殺 拉起/祭壇
execute as @a[scores={show_stat=4}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  大逃殺  拉起 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_br_revives"},"color":"aqua"},{"text":"  祭壇 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_br_altars"},"color":"light_purple"}]

# TDM 勝/敗/連勝
execute as @a[scores={show_stat=5}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  團隊死鬥  勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_wins_tdm"},"color":"green"},{"text":"  敗 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_losses_tdm"},"color":"red"},{"text":"  連勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_streak_tdm"},"color":"gold"}]

# DOM 勝/敗/連勝
execute as @a[scores={show_stat=6}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  佔點模式  勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_wins_dom"},"color":"green"},{"text":"  敗 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_losses_dom"},"color":"red"},{"text":"  連勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_streak_dom"},"color":"gold"}]

# 總勝/敗
execute as @a[scores={show_stat=7}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  總計  勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins"},"color":"green"},{"text":"  敗 ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses"},"color":"red"}]

# DOM 個人貢獻
execute as @a[scores={show_stat=8}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  佔點模式貢獻  佔點 ","color":"gold"},{"score":{"name":"@s","objective":"stat_dom_caps"},"color":"green"},{"text":"  成功 ","color":"gold"},{"score":{"name":"@s","objective":"stat_dom_flips"},"color":"yellow"},{"text":"  守點 ","color":"gold"},{"score":{"name":"@s","objective":"stat_dom_def"},"color":"aqua"}]

# RP 積分（私）
execute as @a[scores={show_stat=11}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"RP 積分：","color":"gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"gold","bold":true}]

# 軍階（私）
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 1 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T1 訓練生","color":"gray"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 2 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T2 戰術先鋒","color":"white"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 3 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T3 影之掠奪者","color":"dark_gray"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 4 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T4 鋼鐵捍衛者","color":"blue"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 5 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T5 巔峰獵手","color":"gold"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 6 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T6 灰燼審判官","color":"red"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 7 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T7 虛空行者","color":"dark_purple"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 8 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T8 幽靈軍官","color":"aqua"}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 9 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T9 末日指揮官","color":"dark_red","bold":true}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 10 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T10 戰爭主宰","color":"light_purple","bold":true}]
execute as @a[scores={show_stat=12}] if score @s rank_tier matches 11 run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"軍階：","color":"gray"},{"text":"T11 ★ 永恆傳奇 ★","color":"yellow","bold":true}]

# 大逃殺 勝/敗/連勝（私）
execute as @a[scores={show_stat=13}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"大逃殺  勝 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_wins_br"},"color":"green"},{"text":"  敗 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_losses_br"},"color":"red"},{"text":"  連勝 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_streak_br"},"color":"gold"}]

# 大逃殺 拉起/祭壇（私）
execute as @a[scores={show_stat=14}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"大逃殺  拉起 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_br_revives"},"color":"aqua"},{"text":"  祭壇 ","color":"dark_aqua"},{"score":{"name":"@s","objective":"stat_br_altars"},"color":"light_purple"}]

# TDM 勝/敗/連勝（私）
execute as @a[scores={show_stat=15}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"TDM  勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_wins_tdm"},"color":"green"},{"text":"  敗 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_losses_tdm"},"color":"red"},{"text":"  連勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_streak_tdm"},"color":"gold"}]

# DOM 勝/敗/連勝（私）
execute as @a[scores={show_stat=16}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"DOM  勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_wins_dom"},"color":"green"},{"text":"  敗 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_losses_dom"},"color":"red"},{"text":"  連勝 ","color":"dark_red"},{"score":{"name":"@s","objective":"stat_streak_dom"},"color":"gold"}]

# 總勝/敗（私）
execute as @a[scores={show_stat=17}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"總計  勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins"},"color":"green"},{"text":"  敗 ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses"},"color":"red"}]

# DOM 個人貢獻（私）
execute as @a[scores={show_stat=18}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"DOM貢獻  佔點 ","color":"gold"},{"score":{"name":"@s","objective":"stat_dom_caps"},"color":"green"},{"text":"  成功 ","color":"gold"},{"score":{"name":"@s","objective":"stat_dom_flips"},"color":"yellow"},{"text":"  守點 ","color":"gold"},{"score":{"name":"@s","objective":"stat_dom_def"},"color":"aqua"}]

# 比賽積分（私）
execute as @a[scores={show_stat=19}] run tellraw @s ["",{"text":"[個人] ","color":"dark_aqua","bold":true},{"text":"比賽積分：","color":"gray"},{"score":{"name":"@s","objective":"event_score"},"color":"light_purple","bold":true}]

# 比賽積分（全體展示）
execute as @a[scores={show_stat=20}] run tellraw @a ["",{"text":"[展示] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":"  比賽積分：","color":"gray"},{"score":{"name":"@s","objective":"event_score"},"color":"light_purple","bold":true}]

execute as @a[scores={show_stat=1..}] run playsound ui.button.click master @s ~ ~ ~ 1 1
scoreboard players set @a[scores={show_stat=1..}] show_stat 0

# ===========================================
# 收尾：音效 + 重置所有已觸發的 lobby_terminal
# ===========================================
execute as @a[scores={lobby_terminal=1..}] run playsound ui.button.click master @s ~ ~ ~ 1 1
scoreboard players set @a[scores={lobby_terminal=1..}] lobby_terminal 0
