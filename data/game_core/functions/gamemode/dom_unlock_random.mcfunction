# ==========================================
# 檔案: gamemode/dom_unlock_random.mcfunction
# ==========================================

# 1. 輔助：更新 Pool 標籤 (確保只選到 state 為 0 的點)
tag @e[type=marker,tag=Point_a] remove Point_unlock_pool
tag @e[type=marker,tag=Point_b] remove Point_unlock_pool
tag @e[type=marker,tag=Point_c] remove Point_unlock_pool

execute if score #Point_a dom_state matches 0 run tag @e[type=marker,tag=Point_a] add Point_unlock_pool
execute if score #Point_b dom_state matches 0 run tag @e[type=marker,tag=Point_b] add Point_unlock_pool
execute if score #Point_c dom_state matches 0 run tag @e[type=marker,tag=Point_c] add Point_unlock_pool

# 2. 利用 sort=random 隨機選擇一個符合條件的 Marker (取代無效的 @r)
execute as @e[type=marker,tag=Point_unlock_pool,sort=random,limit=1] run function game_core:gamemode/dom_unlock_exec