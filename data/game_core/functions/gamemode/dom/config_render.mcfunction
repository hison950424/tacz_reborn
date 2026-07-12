# ==========================================
# 檔案: gamemode/dom_config_render.mcfunction
# 說明: 佔點模式參數設定的聊天欄 UI 渲染
# ==========================================
# --- [0] 視覺清空 (推擠舊訊息) ---
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s ["",{"text":"\n================================\n","color":"gray"},{"text":" 🚩 佔點模式參數設定 🚩","color":"gold","bold":true}]

# --- [1] 渲染分數介面 (目標總佔領分) ---
tellraw @s ["",{"text":"\n[參數] ","color":"gold"},{"text":"目標總佔領分: ","color":"yellow"},{"score":{"name":"#target_score","objective":"dom_config"},"color":"white","bold":true}]

execute if score #target_score dom_config matches 110.. run tellraw @s [{"text":"[ -100 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 100"}},{"text":"[ -20 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 20"}},{"text":"  |  ","color":"gray"},{"text":"[ +20 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 20"}},{"text":"[ +100 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 100"}}]
execute if score #target_score dom_config matches 11..109 run tellraw @s [{"text":"[ -100 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"[ -20 ] ","color":"red","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 20"}},{"text":"  |  ","color":"gray"},{"text":"[ +20 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 20"}},{"text":"[ +100 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 100"}}]
execute if score #target_score dom_config matches ..10 run tellraw @s [{"text":"[ -100 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"[ -20 ] ","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger btn_score_dn set 0"}},{"text":"  |  ","color":"gray"},{"text":"[ +20 ] ","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 20"}},{"text":"[ +100 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 100"}}]
tellraw @s {"text":"     [ 重置為 100 分 ]","color":"gray","italic":true,"clickEvent":{"action":"run_command","value":"/trigger btn_score_up set 9999"}}

# --- [2] 確認按鈕 ---
tellraw @s ["",{"text":"\n[ ▶ 確認並進入職業選擇 ]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 6"}},"\n",{"text":"================================\n","color":"gray"}]