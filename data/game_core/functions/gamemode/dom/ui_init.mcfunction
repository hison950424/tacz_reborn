# ==========================================
# 檔案: gamemode/dom_ui_init.mcfunction 
# 說明: 建立佔領模式專用的計分板 UI，並設定顏色與最大值
# ==========================================

# 1. 清除舊有的顯示板
scoreboard objectives remove dom_display

# 2. 建立新的顯示面板，支援 JSON 標題格式
scoreboard objectives add dom_display dummy {"text":"🚩 據點爭奪 🚩","color":"gold","bold":true}

# 3. 將虛擬玩家加入實體隊伍，以獲取字體顏色
team join red 紅隊總分
team join blue 藍隊總分
team join yellow ⏳佔領倒數

# 4. 初始化虛擬玩家的分數為 0
scoreboard players set 紅隊總分 dom_display 0
scoreboard players set 藍隊總分 dom_display 0

# 計算初始倒數計時並賦予顯示面板
scoreboard players operation ⏳佔領倒數 dom_display = #time_limit_sec dom_config
scoreboard players operation ⏳佔領倒數 dom_display -= #global dom_arms_timer

# 6. 將此計分板推播至全體玩家的側邊欄
scoreboard objectives setdisplay sidebar dom_display