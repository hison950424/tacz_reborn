# ==========================================
# 檔案: gamemode/dom/round_start.mcfunction
# 說明: 準備倒數結束 → 回合正式開始
# ==========================================

# 切換為戰鬥階段
scoreboard players set #dom_phase dom_config 1
scoreboard players set #dom_round_timer dom_config 0

# 給予所有隊伍玩家 dom_alive 標籤（本回合存活資格）
tag @a[team=red] add dom_alive
tag @a[team=blue] add dom_alive

# 復原所有玩家為冒險模式
gamemode adventure @a[team=red]
gamemode adventure @a[team=blue]

# 通知戰鬥開始
title @a actionbar {"text":"⚔ 戰鬥開始！","color":"red","bold":true}

# TODO: 移除屏障方塊開啟基地出口（需填入座標）
#紅右
fill 191 14 -90 191 18 -86 minecraft:air replace
#紅左
fill 199 14 -78 203 18 -78 minecraft:air replace
#藍右
fill 131 14 -6 131 18 -10 minecraft:air replace
#藍左
fill 123 14 -18 119 18 -18 minecraft:air replace
