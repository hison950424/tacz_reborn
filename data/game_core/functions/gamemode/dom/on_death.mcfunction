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

# 附身最近的存活隊友（有隊友存活才執行）
execute if entity @s[team=red] if entity @a[team=red,tag=dom_alive,limit=1] run spectate @a[team=red,tag=dom_alive,sort=nearest,limit=1]
execute if entity @s[team=blue] if entity @a[team=blue,tag=dom_alive,limit=1] run spectate @a[team=blue,tag=dom_alive,sort=nearest,limit=1]

# 觸發全員死亡判定
function game_core:gamemode/dom/death_check
