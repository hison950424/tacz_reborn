# ==========================================
# 檔案: lobby/give_mode_team_book.mcfunction
# 目的: 發放模式與隊伍書（管理員專屬，共兩頁）
# 第1頁: 模式設定 / 發放收回隊伍書 / 上一頁
# 第2頁: 隨機分隊 / 上一頁
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"模式與隊伍",author:"系統",pages:['{"text":" <<< 模式與隊伍 >>>\\n","color":"dark_aqua","bold":true,"extra":[{"text":"\\n"},{"text":"【 模式設定 】\\n","color":"black","bold":true},{"text":"[ ▶ 模式選擇 ]\\n\\n","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger select_mode set 9"}},{"text":"【 隊伍管理 】\\n","color":"black","bold":true},{"text":"[ ▶ 發放隊伍選擇書 ]\\n\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger admin_terminal set 1"}},{"text":"[ ▶ 收回隊伍選擇書 ]\\n\\n","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 4"}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 9"}}]}','{"text":" <<< 隨機分隊 >>>\\n","color":"gold","bold":true,"extra":[{"text":"\\n"},{"text":"[ ▶ 隨機分隊(2隊) ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 1"}},{"text":"[ ▶ 隨機分隊(3隊) ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 2"}},{"text":"[ ▶ 隨機分隊(4隊) ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger admin_team_ctrl set 3"}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 9"}}]}']} 1

scoreboard players enable @s lobby_terminal
scoreboard players enable @s admin_terminal