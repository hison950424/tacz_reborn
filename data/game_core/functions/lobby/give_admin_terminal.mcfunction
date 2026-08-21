# ==========================================
# 檔案: lobby/give_admin_terminal.mcfunction
# 目的: 發放管理員終端（管理員首頁書）
# 書籍結構: 場景選擇 / 玩家功能 / 開始遊戲 / 隊伍管理
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"管理員終端",author:"系統",pages:['{"text":" <<< 管理員終端 >>>\\n","color":"dark_red","bold":true,"extra":[{"text":"\\n"},{"text":"[ ▶ 場景選擇 ]\\n\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 7"},"hoverEvent":{"action":"show_text","contents":{"text":"切換目前大廳的地圖場景"}}},{"text":"[ ▶ 玩家功能 ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 8"},"hoverEvent":{"action":"show_text","contents":{"text":"玩家相關功能與設定"}}},{"text":"[ ▶ 開始遊戲 ]\\n\\n","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 11"},"hoverEvent":{"action":"show_text","contents":{"text":"選擇模式並開始"}}},{"text":"[ ▶ 隊伍管理 ]\\n","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 13"},"hoverEvent":{"action":"show_text","contents":{"text":"發放隊伍書、隨機分隊、比賽模式設定"}}}]}']} 1

scoreboard players enable @s lobby_terminal
scoreboard players enable @s admin_terminal
