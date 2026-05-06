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
execute as @a[scores={lobby_terminal=2},tag=on_minidm] run tellraw @s [{"text":"[系統] ⚔ 你現在就在迷你死鬥中","color":"red"}]
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
execute as @a[scores={lobby_terminal=6}] run tellraw @s [{"text":"\n"},{"text":"════ 伺服器規則 ════","color":"dark_red","bold":true},{"text":"\n1. 禁止惡意騷擾或語言攻擊\n2. 禁止使用作弊或外掛程式\n3. 保持健康競技精神\n4. 遵守管理員指示\n5. 祝你玩得愉快！\n","color":"white"}]
execute as @a[scores={lobby_terminal=6}] run playsound ui.button.click master @s ~ ~ ~ 1 1

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
# 收尾：音效 + 重置所有已觸發的 lobby_terminal
# ===========================================
execute as @a[scores={lobby_terminal=1..}] run playsound ui.button.click master @s ~ ~ ~ 1 1
scoreboard players set @a[scores={lobby_terminal=1..}] lobby_terminal 0
