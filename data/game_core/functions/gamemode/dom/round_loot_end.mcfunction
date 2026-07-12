# ==========================================
# 檔案: gamemode/dom/round_loot_end.mcfunction
# 說明: 撿裝階段結束 → 進入戰前準備（phase 3）
# ==========================================

# 清除掉落物
kill @e[type=item]

# 預先選定並顯示下一回合的點位（金磚高亮）
function game_core:gamemode/dom/unlock_random

# 進入準備階段
scoreboard players set #dom_phase dom_config 3
scoreboard players set #dom_phase_timer dom_config 15

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

# TODO: 傳送玩家至各自基地（需填入世界座標）
# tp @a[team=red] <紅隊基地 X Y Z>
# tp @a[team=blue] <藍隊基地 X Y Z>

# TODO: 放置屏障方塊封住基地出口（需填入座標）
# fill <x1 y1 z1> <x2 y2 z2> minecraft:barrier replace
