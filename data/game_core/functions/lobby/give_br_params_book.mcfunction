# ==========================================
# 檔案: lobby/give_br_params_book.mcfunction
# 目的: 發放大逃殺參數設定書（選完地圖後）
# 第1頁: 遊戲時間（白天/黃昏/夜晚）+ 查看配置 + 開始遊戲
# 第2頁: 天氣設定（晴天/雨天/雷雨）+ 查看配置 + 開始遊戲
# 觸發: lobby_tick br_map_pick=1..5 (管理員選圖後)
# ==========================================

# 清除地圖書與舊參數書，確保介面整潔
clear @s written_book{title:"大逃殺地圖選擇"}
clear @s written_book{title:"大逃殺參數設定"}

give @s written_book{title:"大逃殺參數設定",author:"系統",pages:['{"text":" <<< BR 參數設定 >>>\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"【 遊戲時間 】\\n","color":"dark_gray","bold":true},{"text":"[ ▶ 白天 ]\\n\\n","color":"gold","clickEvent":{"action":"run_command","value":"/trigger br_time_pick set 1"}},{"text":"[ ▶ 黃昏 ]\\n\\n","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger br_time_pick set 2"}},{"text":"[ ▶ 夜晚 ]\\n\\n","color":"dark_purple","clickEvent":{"action":"run_command","value":"/trigger br_time_pick set 3"}},{"text":"[ 📋 查看目前配置 ]\\n\\n","color":"dark_aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 13"}},{"text":"[ ▶▶ 開始遊戲 ◀◀ ]\\n","color":"dark_blue","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 10"}},{"text":"[ ◄ 返回地圖選擇 ]","color":"gray","clickEvent":{"action":"run_command","value":"/trigger select_mode set 1"}}]}','{"text":" <<< BR 參數設定 >>>\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"【 天氣設定 】\\n","color":"dark_gray","bold":true},{"text":"[ ▶ 晴天 ]\\n\\n","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger br_weather_pick set 1"}},{"text":"[ ▶ 雨天 ]\\n\\n","color":"blue","clickEvent":{"action":"run_command","value":"/trigger br_weather_pick set 2"}},{"text":"[ ▶ 雷雨 ]\\n\\n","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger br_weather_pick set 3"}},{"text":"[ 📋 查看目前配置 ]\\n\\n","color":"dark_aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 13"}},{"text":"[ ▶▶ 開始遊戲 ◀◀ ]\\n","color":"dark_blue","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 10"}},{"text":"[ ◄ 返回地圖選擇 ]","color":"gray","clickEvent":{"action":"run_command","value":"/trigger select_mode set 1"}}]}']} 1

scoreboard players enable @s br_time_pick
scoreboard players enable @s br_weather_pick
scoreboard players enable @s select_mode
