# ==========================================
# 檔案: lobby/give_scene_book.mcfunction
# 目的: 發放場景選擇書（有上一頁 → 根書）
# 書籍結構: 訓練場 / 迷你死鬥 / 跑酷塔 / 返回大廳中心 / 上一頁
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"場景選擇",author:"系統",pages:['{"text":" <<< 場景選擇 >>>\\n","color":"dark_green","bold":true,"extra":[{"text":"\\n"},{"text":"[ ▶ 進入訓練場 ]\\n\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 1"}},{"text":"[ ▶ 迷你死鬥 ]\\n\\n","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 2"}},{"text":"[ ▶ 挑戰跑酷塔 ]\\n\\n","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 3"}},{"text":"[ ▶ 返回大廳中心 ]\\n\\n","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 5"}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 9"}}]}']} 1

scoreboard players enable @s lobby_terminal