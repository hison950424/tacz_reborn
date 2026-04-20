# ==========================================
# 檔案: gamemode/dom_config_render.mcfunction
# 說明: 佔點模式參數設定的聊天欄 UI 渲染
# ==========================================
# --- [0] 視覺清空 (推擠舊訊息) ---
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s ["",{"text":"\n================================\n","color":"gray"},{"text":"⚠︎   軍備競賽debug   ⚠︎","color":"gold","bold":false}]

# --- [1] 渲染分數介面 (目標總佔領分) ---
tellraw @s ["",{"text":"\n[參數] ","color":"gold"},{"text":"佔點模式: ","color":"yellow"}]

tellraw @s [{"text":"[debug]","color":"red","clickEvent":{"action":"run_command","value":"/function game_core:gamemode/dom_debug2"}},{"text":"  |  ","color":"gray"},{"text":"[undebug]","color":"red","clickEvent":{"action":"run_command","value":"/function game_core:gamemode/dom_debug1"}}]


tellraw @s ["",{"text":"\n[參數] ","color":"gold"},{"text":":團隊死鬥模式: ","color":"yellow"}]

tellraw @s [{"text":"[debug]","color":"red","clickEvent":{"action":"run_command","value":"/function game_core:gamemode/tdm_debug2"}},{"text":"  |  ","color":"gray"},{"text":"[undebug]","color":"red","clickEvent":{"action":"run_command","value":"/function game_core:gamemode/tdm_debug1"}}]
