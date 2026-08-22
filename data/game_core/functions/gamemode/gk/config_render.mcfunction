# 執行者: @s（管理員）
# 在聊天欄顯示槍王之王擊殺倍率設定介面（模板：仿 TDM config_render）

# --- [0] 視覺清空 (推擠舊訊息) ---
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s ["",{"text":"\n================================\n","color":"gray"},{"text":" 🎖 槍王之王設定 - 擊殺倍率","color":"gold","bold":true}]

# --- [1] 說明與當前數值 ---
tellraw @s {"text":" 擊殺需求 = 本隊人數 × 倍率","color":"dark_gray"}
tellraw @s ["",{"text":"\n[參數] ","color":"gold"},{"text":"倍率：","color":"yellow"},{"score":{"name":"#gk_kills_multiplier","objective":"gk_config"},"color":"white","bold":true},{"text":" 倍  (範圍: 1 ~ 20)","color":"gray"}]

# --- [2] 動態調整按鈕（3 分支，仿 TDM 防呆邏輯） ---
# 分支1: 已在下限 ≤1（減少按鈕灰色不可用）
execute if score #gk_kills_multiplier gk_config matches ..1 run tellraw @s [{"text":"[ -5 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"[ -1 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"  |  ","color":"gray"},{"text":"[ +1 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 1"}},{"text":"[ +5 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 5"}}]
# 分支2: 中間值 2..19（全部按鈕可用）
execute if score #gk_kills_multiplier gk_config matches 2..19 run tellraw @s [{"text":"[ -5 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 5"}},{"text":"[ -1 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 1"}},{"text":"  |  ","color":"gray"},{"text":"[ +1 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 1"}},{"text":"[ +5 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 5"}}]
# 分支3: 已在上限 ≥20（增加按鈕灰色不可用）
execute if score #gk_kills_multiplier gk_config matches 20.. run tellraw @s [{"text":"[ -5 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 5"}},{"text":"[ -1 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 1"}},{"text":"  |  ","color":"gray"},{"text":"[ +1 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 0"}},{"text":"[ +5 ]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 0"}}]
tellraw @s {"text":"     [ 重置為 1 倍 ]","color":"gray","italic":true,"clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 9999"}}

# --- [3] 確認開始遊戲 + 底線 ---
tellraw @s ["",{"text":"\n[ ▶ 確認並開始遊戲 ]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 12"}},"\n",{"text":"================================\n","color":"gray"}]

scoreboard players enable @s btn_score_up
scoreboard players enable @s btn_score_dn
