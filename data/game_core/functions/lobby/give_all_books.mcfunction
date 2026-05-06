# ==========================================
# 檔案: lobby/give_all_books.mcfunction
# 目的: 補發指令書給所有玩家
# 呼叫來源: terminal_tick（admin_terminal=2）
# ==========================================

execute as @a[tag=!admin] run function game_core:lobby/give_lobby_terminal
execute as @a[tag=admin] run function game_core:lobby/give_admin_terminal

tellraw @a {"text":"[系統] 管理員已重新發放指令書。","color":"green"}
