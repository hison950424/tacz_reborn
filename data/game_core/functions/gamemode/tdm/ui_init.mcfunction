# ==========================================
# 檔案: gamemode/tdm_ui_init.mcfunction
# 說明: 建立 TDM 專用的計分板 UI，並設定顏色
# ==========================================

# 1. 清除舊有的顯示板 (確保不會有殘留錯誤)
scoreboard objectives remove tdm_display

# 2. 建立新的顯示面板，支援 JSON 標題格式 (1.13+ 語法)
scoreboard objectives add tdm_display dummy {"text":"⚔ 團隊死鬥 ⚔","color":"gold","bold":true}

# 3. 將虛擬玩家加入實體隊伍，以獲取字體顏色
# 備註: 這裡直接使用中文字串作為虛擬玩家 ID，在側邊欄會顯示得非常乾淨
team join red 紅隊分數
team join blue 藍隊分數

# 4. 初始化虛擬玩家的分數為 0
scoreboard players set 紅隊分數 tdm_display 0
scoreboard players set 藍隊分數 tdm_display 0

# 建立時間顯示的虛擬玩家 (使用 yellow 隊伍讓字體變黃色)
team join yellow ⏳剩餘秒數
team join yellow 目標擊殺數

# 初始化畫面上時間的顯示數字
scoreboard players operation ⏳剩餘秒數 tdm_display = #current_time tdm_config
scoreboard players operation 目標擊殺數 tdm_display = #target_score tdm_config

# 5. 將此計分板推播至全體玩家的側邊欄 (Sidebar)
scoreboard objectives setdisplay sidebar tdm_display