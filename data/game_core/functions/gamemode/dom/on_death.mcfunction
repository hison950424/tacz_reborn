# ==========================================
# 檔案: gamemode/dom/on_death.mcfunction
# 執行者: @s（本回合死亡的玩家）
# 說明: 移除存活標籤、進入觀戰、觸發死亡判定
# ==========================================

# 更新死亡計數（防止同一死亡被重複偵測）
scoreboard players operation @s death_prev = @s vanilla_death

# 移除本回合存活資格
tag @s remove dom_alive
gamemode spectator @s

# 觸發全員死亡判定
function game_core:gamemode/dom/death_check
