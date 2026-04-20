# ==========================================
# 檔案: gamemode/br_on_jumped.mcfunction
# 執行者: @s (剛按下蹲下鍵的機上玩家，或被強制跳出的玩家)
# 目的: 處理跳出空投機的瞬間邏輯
# ==========================================

# 1. 狀態切換：離開機上標記，進入跳傘中標記（保留 br_deploying 直到著陸）
tag @s add br_jumped
tag @s remove br_on_cart

# 2. 清除漂浮效果，讓玩家開始自然下落，之後按空白鍵可啟動鞘翅滑翔
effect clear @s minecraft:slow_falling

# 3. 重置蹲下計時，防止同一 Tick 內重複觸發本函式
scoreboard players set @s sneak_time 0

# 4. 提示玩家啟動鞘翅
title @s actionbar {"text":"按 [空白鍵] 啟動鞘翅！","color":"aqua","bold":true}
