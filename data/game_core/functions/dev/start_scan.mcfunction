# ==========================================
# 檔案: dev/start_scan.mcfunction
# 執行者: 開發者本人 (@s)
# 說明: 從玩家腳下偏移 (-10, -5, -10) 開始，執行 20x10x20 的高強度矩陣掃描
# ==========================================

# 初始化 X 軸計數器
scoreboard players set #scan_x dom_math 0

# 將執行座標定錨在玩家左下後方，並啟動 X 軸迴圈
execute positioned ~-10 ~-5 ~-10 run function game_core:dev/loop_x

# 掃描完成回報
# tellraw @s {"text":"[系統] 區域羊毛掃描與轉化完畢！(消耗: 1 Tick)","color":"green"}