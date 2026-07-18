# ==========================================
# 檔案: gamemode/dom/round_start.mcfunction
# 說明: 準備倒數結束 → 回合正式開始
# ==========================================

# 切換為戰鬥階段
scoreboard players set #dom_phase dom_config 1
scoreboard players set #dom_wipeout dom_config 0
scoreboard players set #dom_round_timer dom_config 0

# 給予所有隊伍玩家 dom_alive 標籤（本回合存活資格）
tag @a[team=red] add dom_alive
tag @a[team=blue] add dom_alive

# 重置觀戰索引（每回合從頭開始循環）
scoreboard players set @a[team=red] spectate_idx 0
scoreboard players set @a[team=blue] spectate_idx 0

# 重置首殺旗標
scoreboard players set #dom_first_blood dom_config 0

# 重置本回合佔點收入累計
scoreboard players set @a[team=red] dom_point_earn 0
scoreboard players set @a[team=blue] dom_point_earn 0

# 復原所有玩家為冒險模式
gamemode adventure @a[team=red]
gamemode adventure @a[team=blue]

# 補充職業藥水與投擲物
execute as @a[team=red] run function game_core:class/reset_throwables
execute as @a[team=blue] run function game_core:class/reset_throwables

# 通知戰鬥開始
title @a times 10 40 20
title @a title {"text":"⚔ 戰鬥開始！","color":"red","bold":true}
title @a subtitle {"text":"佔領將於 30 秒後開放","color":"yellow"}
execute as @a at @s run playsound minecraft:block.amethyst_block.break master @s ~ ~ ~ 1 1.2

# TODO: 移除屏障方塊開啟基地出口（需填入座標）
#紅右
fill 191 14 -90 191 18 -86 minecraft:air replace
#紅左
fill 199 14 -78 203 18 -78 minecraft:air replace
#紅後
fill 192 13 -79 195 13 -82 minecraft:air replace
#藍右
fill 131 14 -6 131 18 -10 minecraft:air replace
#藍左
fill 123 14 -18 119 18 -18 minecraft:air replace
#藍後
fill 127 13 -14 130 13 -17 minecraft:air replace
