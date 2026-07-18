# ==========================================
# 檔案: gamemode/dom/round_loot_end.mcfunction
# 說明: 撿裝階段結束 → 進入戰前準備（phase 3）
# ==========================================

# 清除掉落物與屍體（屍體立即清除，地板物品延遲 10t 再刪）
kill @e[type=corpse:corpse]
schedule function game_core:gamemode/dom/kill_floor_items 10t

# 預先選定並顯示下一回合的點位（金磚高亮）
function game_core:gamemode/dom/unlock_random

# 進入準備階段
scoreboard players set #dom_phase dom_config 3
scoreboard players set #dom_phase_timer dom_config 25

# 回合數 +1
scoreboard players add #dom_round dom_config 1

# 廣播 "第X回合" 標題，副標題顯示本回合將開啟的點位
# 以 dom_capture_point 目前的預告值來顯示（由 unlock_random → unlock_exec 設定 dom_state=1 時會在 round_start 才開放，此處僅高亮）
execute if score #dom_round dom_config matches 1.. run title @a times 10 60 20
execute if score #Point_a dom_state matches 1 run title @a subtitle {"text":"本回合據點：A 點","color":"yellow","bold":true}
execute if score #Point_b dom_state matches 1 run title @a subtitle {"text":"本回合據點：B 點","color":"yellow","bold":true}
execute if score #Point_c dom_state matches 1 run title @a subtitle {"text":"本回合據點：C 點","color":"yellow","bold":true}
# A 和 B 同時開啟（僵持後的兩點情況）
execute if score #Point_a dom_state matches 1 if score #Point_b dom_state matches 1 run title @a subtitle {"text":"本回合據點：A 點 + B 點","color":"yellow","bold":true}
execute if score #Point_a dom_state matches 1 if score #Point_c dom_state matches 1 run title @a subtitle {"text":"本回合據點：A 點 + C 點","color":"yellow","bold":true}
execute if score #Point_b dom_state matches 1 if score #Point_c dom_state matches 1 run title @a subtitle {"text":"本回合據點：B 點 + C 點","color":"yellow","bold":true}
title @a title ["",{"text":"第 ","color":"gold","bold":true},{"score":{"name":"#dom_round","objective":"dom_config"},"color":"white","bold":true},{"text":" 回合","color":"gold","bold":true}]

# 決定本回合是否在 90 秒後開放第二個據點（50% 機率），於準備階段開始時廣播
execute store result score #dom_second_open dom_config run random value 0..1
execute if score #dom_second_open dom_config matches 1 run tellraw @a {"text":"[系統] 本回合將於 90 秒後隨機開放第二個據點","color":"yellow"}
execute if score #dom_second_open dom_config matches 0 run tellraw @a {"text":"[系統] 本回合不會開放第二個據點","color":"gray"}

# 復原死亡玩家為冒險模式（準備階段已可在基地移動）
gamemode adventure @a[team=red]
gamemode adventure @a[team=blue]

# 傳送玩家至各自基地
execute as @e[type=marker,tag=red_spawn] run tp @a[team=red] @s
execute as @e[type=marker,tag=blue_spawn] run tp @a[team=blue] @s

# TODO: 放置屏障方塊封住基地出口（需填入座標）
#紅右
fill 191 14 -90 191 18 -86 minecraft:barrier replace
#紅左
fill 199 14 -78 203 18 -78 minecraft:barrier replace
#紅後
fill 192 13 -79 195 13 -82 minecraft:barrier replace
#藍右
fill 131 14 -6 131 18 -10 minecraft:barrier replace
#藍左
fill 123 14 -18 119 18 -18 minecraft:barrier replace
#藍後
fill 127 13 -14 130 13 -17 minecraft:barrier replace

# 清空基地補給箱（紅隊、藍隊各兩格）
data merge block 193 14 -84 {Items:[]}
data merge block 193 14 -85 {Items:[]}
data merge block 129 14 -12 {Items:[]}
data merge block 129 14 -11 {Items:[]}

# 每回合準備階段：補充固有投擲物與彈藥箱（武器僅第一回合由開局給予，不再補發）
execute as @a[team=red] run function game_core:class/reset_throwables
execute as @a[team=blue] run function game_core:class/reset_throwables
execute as @a[team=red] run function game_core:class/give_ammo
execute as @a[team=blue] run function game_core:class/give_ammo

