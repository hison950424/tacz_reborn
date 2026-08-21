# ==========================================
# 檔案: lobby/give_start_game_book.mcfunction
# 目的: 發放開始遊戲書（管理員）
# 書籍結構: 大逃殺 / 佔點模式 / 團隊死鬥模式 / 上一頁
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"開始遊戲",author:"系統",pages:['{"text":" <<< 開始遊戲 >>>\\n","color":"dark_aqua","bold":true,"extra":[{"text":"\\n"},{"text":"【 選擇模式 】\\n","color":"black","bold":true},{"text":"\\n"},{"text":"[ ▶ 大逃殺模式 ]\\n\\n","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 1"},"hoverEvent":{"action":"show_text","contents":{"text":"最後存活的隊伍獲勝"}}},{"text":"[ ▶ 佔點模式 ]\\n\\n","color":"dark_aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 3"},"hoverEvent":{"action":"show_text","contents":{"text":"搶占並守住據點"}}},{"text":"[ ▶ 團隊死鬥模式 ]\\n\\n","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 4"},"hoverEvent":{"action":"show_text","contents":{"text":"最先達到擊殺上限獲勝"}}},{"text":"[ ▶ 槍王之王 ]\\n\\n","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 11"},"hoverEvent":{"action":"show_text","contents":{"text":"以全類別武器各擊殺所需數量，先完成的隊伍獲勝"}}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 9"},"hoverEvent":{"action":"show_text","contents":{"text":"返回管理員終端"}}}]}']} 1

scoreboard players enable @s lobby_terminal
