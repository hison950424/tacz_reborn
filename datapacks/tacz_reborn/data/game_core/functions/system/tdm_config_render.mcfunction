# ==========================================
# 檔案: gamemode/tdm_config_render.mcfunction
# 說明: TDM 參數設定的聊天欄 UI 渲染
# ==========================================
# --- [0] 視覺清空 (推擠舊訊息) ---
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s ["",{"text":"\n================================\n","color":"gray"},{"text":" ⚔ 團隊死鬥參數設定 ⚔","color":"dark_red","bold":true}]

# --- [1] 渲染分數介面 (目標擊殺數) ---
tellraw @s ["",{"text":"\n[參數] ","color":"gold"},{"text":"目標擊殺數: ","color":"yellow"},{"score":{"name":"#target_score","objective":"tdm_config"},"color":"white","bold":true}]

# 分數按鈕組 (依照數值動態改變顏色與防呆)
execute if score #target_score tdm_config matches 110.. run tellraw @s [{"text":"[ -100 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 100"}},{"text":"[ -20 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 20"}},{"text":"  |  ","color":"gray"},{"text":"[ +20 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 20"}},{"text":"[ +100 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 100"}}]
execute if score #target_score tdm_config matches 11..109 run tellraw @s [{"text":"[ -100 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"[ -20 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 20"}},{"text":"  |  ","color":"gray"},{"text":"[ +20 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 20"}},{"text":"[ +100 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 100"}}]
execute if score #target_score tdm_config matches ..10 run tellraw @s [{"text":"[ -100 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"[ -20 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"  |  ","color":"gray"},{"text":"[ +20 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 20"}},{"text":"[ +100 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 100"}}]
tellraw @s {"text":"     [ 重置為 100 殺 ]","color":"gray","italic":true,"clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 9999"}}

# --- [2] 渲染時間介面 ---
# 單位換算：秒 -> 分、秒
scoreboard players operation #temp_min dom_math = #time_limit_sec tdm_config
scoreboard players operation #temp_min dom_math /= #60 dom_const
scoreboard players operation #temp_sec dom_math = #time_limit_sec tdm_config
scoreboard players operation #temp_sec dom_math %= #60 dom_const

tellraw @s ["",{"text":"\n[參數] ","color":"gold"},{"text":"遊戲時長: ","color":"yellow"},{"score":{"name":"#temp_min","objective":"dom_math"},"color":"white","bold":true},{"text":" 分 ","color":"yellow"},{"score":{"name":"#temp_sec","objective":"dom_math"},"color":"white","bold":true},{"text":" 秒","color":"yellow"}]

# 時間按鈕組 (依照數值動態改變顏色與防呆)
execute if score #time_limit_sec tdm_config matches 360.. run tellraw @s [{"text":"[ -5m ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_time_dn set 300"}},{"text":"[ -1m ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_time_dn set 60"}},{"text":"  |  ","color":"gray"},{"text":"[ +1m ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 60"}},{"text":"[ +5m ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 300"}}]
execute if score #time_limit_sec tdm_config matches 61..359 run tellraw @s [{"text":"[ -5m ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_time_dn set 0"}},{"text":"[ -1m ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_time_dn set 60"}},{"text":"  |  ","color":"gray"},{"text":"[ +1m ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 60"}},{"text":"[ +5m ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 300"}}]
execute if score #time_limit_sec tdm_config matches ..60 run tellraw @s [{"text":"[ -5m ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_time_dn set 0"}},{"text":"[ -1m ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_time_dn set 0"}},{"text":"  |  ","color":"gray"},{"text":"[ +1m ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 60"}},{"text":"[ +5m ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 300"}}]
tellraw @s {"text":"     [ 重置為 10 分鐘 ]","color":"gray","italic":true,"clickEvent":{"action":"run_command","value":"/trigger btn_time_up set 9999"}}

# --- [3] 確認按鈕 ---
tellraw @s ["",{"text":"\n[ ▶ 確認並進入職業選擇 ]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 6"}},"\n",{"text":"================================\n","color":"gray"}]