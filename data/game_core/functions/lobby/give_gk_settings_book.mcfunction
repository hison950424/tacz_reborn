# ==========================================
# 檔案: lobby/give_gk_settings_book.mcfunction
# 目的: 槍王之王設定書（代理書，管理員）
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"槍王之王設定",author:"系統",pages:['{"text":" === 槍王之王設定 ===\\n\\n","color":"gold","bold":true,"extra":[{"text":"擊殺需求 = 本隊人數 × 倍率\\n若聊天欄被洗掉，可點擊下方按鈕重新喚出介面。\\n\\n\\n","color":"dark_gray"},{"text":"[ 💬 重新喚出設定介面 ]\\n\\n\\n","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 11"}},{"text":"[ ▶ 確認並開始遊戲 ]\\n\\n","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 12"}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 11"}}]}']} 1

scoreboard players enable @s select_mode
