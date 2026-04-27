# ==========================================
# 檔案: system/match_end_sequence.mcfunction
# 說明: 凍結戰局、展示 MVP、排程重置
# ==========================================

# 1. 切換狀態機至「結算中」(Game State 3)
# 作用: 確保 tick 迴圈不再處理重生與一般遊戲邏輯
scoreboard players set #global game_state 3

# 2. 強制解除武裝 (Disarm)
# 作用: 沒收槍械與投擲物，防止玩家在看 MVP 時互相攻擊
gamemode adventure @a
clear @a
effect give @a minecraft:weakness 10 255 true
effect give @a minecraft:slowness 10 5 true

# 3. 執行 MVP 計算與展示
# ⚠️ 依賴對接: 這裡呼叫我們最一開始討論的 MVP 標籤賦予系統
function game_core:mvp/calculate_mvp
function game_core:mvp/display_mvp

# 4. 大廳遊戲設定書結算
# 作用: 遊戲結束瞬間，發放設定書給具備 admin 標籤的管理員
# function game_core:system/game_end

# 5. 排程延遲重置 (Schedule Reset)
# 邏輯: 讓玩家有 10 秒鐘的時間觀看聊天欄的 MVP 資訊，10秒後自動執行 match_reset
schedule function game_core:system/match_reset 10s