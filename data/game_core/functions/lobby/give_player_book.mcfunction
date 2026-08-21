# ==========================================
# 檔案: lobby/give_player_book.mcfunction
# 目的: 發放玩家功能書（有上一頁 → 根書）
# 書籍結構: 個人戰績 / 規則書 / 上一頁
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"玩家功能",author:"系統",pages:['{"text":" <<< 玩家功能 >>>\\n","color":"gold","bold":true,"extra":[{"text":"\\n"},{"text":"[ ▶ 個人戰績 ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 4"},"hoverEvent":{"action":"show_text","contents":{"text":"查看個人統計數據"}}},{"text":"[ ▶ 規則書 ]\\n\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 6"},"hoverEvent":{"action":"show_text","contents":{"text":"閱讀遊戲規則說明"}}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 9"},"hoverEvent":{"action":"show_text","contents":{"text":"返回大廳終端"}}}]}']} 1

scoreboard players enable @s lobby_terminal
