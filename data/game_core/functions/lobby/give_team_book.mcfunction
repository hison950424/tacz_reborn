# ==========================================
# 檔案: lobby/give_team_book.mcfunction
# 目的: 發放隊伍選擇書（普通玩家版，上一頁 → 大廳終端）
# ==========================================

function game_core:lobby/clear_all_lobby_books

give @s written_book{title:"隊伍選擇",author:"系統",pages:['{"text":" <<< 選擇隊伍 >>>\\n","color":"dark_purple","bold":true,"extra":[{"text":"\\n"},{"text":"[ ▶ 加入紅隊 ]\\n\\n","color":"red","clickEvent":{"action":"run_command","value":"/trigger join_team set 1"}},{"text":"[ ▶ 加入藍隊 ]\\n\\n","color":"blue","clickEvent":{"action":"run_command","value":"/trigger join_team set 2"}},{"text":"[ ▶ 加入白隊 ]\\n\\n","color":"black","clickEvent":{"action":"run_command","value":"/trigger join_team set 3"}},{"text":"[ ▶ 加入綠隊 ]\\n\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger join_team set 4"}},{"text":"[ ▶ 孤狼模式 ]\\n\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger join_team set 5"}},{"text":"[ ◄ 上一頁 ]\\n","color":"gray","clickEvent":{"action":"run_command","value":"/trigger lobby_terminal set 9"}}]}']} 1

scoreboard players enable @s lobby_terminal