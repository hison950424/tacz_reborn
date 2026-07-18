# ==========================================
# 檔案: gamemode/dom/second_process.mcfunction
# 說明: 每秒執行一次的階段管理器
# phase 1 = 戰鬥中
# phase 2 = 撿裝階段（loot，7s）
# phase 3 = 戰前準備（prep，15s）
# ==========================================

# ==========================================
# Phase 2：撿裝倒數
# ==========================================
execute if score #dom_phase dom_config matches 2 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 2 run title @a actionbar ["",{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後進入下一回合準備","color":"white"}]

execute if score #dom_phase dom_config matches 2 if score #dom_phase_timer dom_config matches ..0 run function game_core:gamemode/dom/round_loot_end

# ==========================================
# Phase 3：準備倒數
# ==========================================
execute if score #dom_phase dom_config matches 3 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 3 run title @a actionbar ["",{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後戰鬥開始","color":"white"}]

execute if score #dom_phase dom_config matches 3 if score #dom_phase_timer dom_config matches ..0 run function game_core:gamemode/dom/round_start

# ==========================================
# Phase 1：戰鬥計時
# ==========================================
execute if score #dom_phase dom_config matches 1 run scoreboard players add #dom_round_timer dom_config 1

# 120 秒（佔領開放後 90 秒）：若本回合預定開放第二個據點，且目前只有 1 個點開啟
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 120 if score #dom_second_open dom_config matches 1 if score #dom_open_count dom_config matches 1 run function game_core:gamemode/dom/stalemate_open
# 觸發後清除旗標（防止重複執行）
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 120 run scoreboard players set #dom_second_open dom_config 0

# 佔點收入（每秒，戰鬥階段，$3/s，回合結束統一通知）
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_a] if score #Point_a dom_state matches 1 positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,gamemode=adventure] run gd656killicon server statistics add score @s 3
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_a] if score #Point_a dom_state matches 1 positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,gamemode=adventure] run scoreboard players add @s dom_point_earn 3
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_b] if score #Point_b dom_state matches 1 positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,gamemode=adventure] run gd656killicon server statistics add score @s 3
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_b] if score #Point_b dom_state matches 1 positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,gamemode=adventure] run scoreboard players add @s dom_point_earn 3
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_c] if score #Point_c dom_state matches 1 positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,gamemode=adventure] run gd656killicon server statistics add score @s 3
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_c] if score #Point_c dom_state matches 1 positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,gamemode=adventure] run scoreboard players add @s dom_point_earn 3

# 持點計時分（方向 B）：據點進度領先方每秒 +1 dom_score（一方全滅時凍結）
execute if score #dom_phase dom_config matches 1 if score #dom_wipeout dom_config matches 0 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run scoreboard players add #Red dom_score 1
execute if score #dom_phase dom_config matches 1 if score #dom_wipeout dom_config matches 0 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run scoreboard players add #Blue dom_score 1
execute if score #dom_phase dom_config matches 1 if score #dom_wipeout dom_config matches 0 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 1.. run scoreboard players add #Red dom_score 1
execute if score #dom_phase dom_config matches 1 if score #dom_wipeout dom_config matches 0 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-1 run scoreboard players add #Blue dom_score 1
execute if score #dom_phase dom_config matches 1 if score #dom_wipeout dom_config matches 0 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 1.. run scoreboard players add #Red dom_score 1
execute if score #dom_phase dom_config matches 1 if score #dom_wipeout dom_config matches 0 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-1 run scoreboard players add #Blue dom_score 1

# 回合計時 180 秒 → 超時結算
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 180.. run function game_core:gamemode/dom/round_end_timeout

# 金錢上限 $12,000（每秒強制執行，所有 DOM 玩家）
execute as @a[team=red] if score @s gd656killicon.score matches 12001.. run gd656killicon server statistics set score @s 12000
execute as @a[team=blue] if score @s gd656killicon.score matches 12001.. run gd656killicon server statistics set score @s 12000
