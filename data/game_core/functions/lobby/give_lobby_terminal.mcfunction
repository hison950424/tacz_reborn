# ==========================================
# 檔案: lobby/give_lobby_terminal.mcfunction
# 目的: 發放大廳終端（普通玩家首頁書，無上一頁）
# 書籍結構: 場景選擇 / 玩家功能 / 返回大廳中心
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"大廳終端",author:"系統",pages:['{"text":" <<< 大廳終端 >>>\\n","color":"dark_purple","bold":true,"extra":[{"text":"\\n"},{"text":"[ ▶ 場景選擇 ]\\n\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 7"}},{"text":"[ ▶ 玩家功能 ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 8"}},{"text":"[ ▶ 返回大廳中心 ]\\n","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 5"}}]}']} 1

scoreboard players enable @s lobby_terminal