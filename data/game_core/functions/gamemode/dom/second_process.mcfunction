# ==========================================
# Phase 2：撿裝倒數
# ==========================================
execute if score #dom_phase dom_config matches 2 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 2 run title @a actionbar ["",{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後進入撿裝準備","color":"white"}]

execute if score #dom_phase dom_config matches 2 if score #dom_phase_timer dom_config matches ..0 run function game_core:gamemode/dom/round_loot_end

# ==========================================
# Phase 3：準備倒數
# ==========================================
execute if score #dom_phase dom_config matches 3 run scoreboard players remove #dom_phase_timer dom_config 1

execute if score #dom_phase dom_config matches 3 run title @a actionbar ["",{"score":{"name":"#dom_phase_timer","objective":"dom_config"},"color":"yellow","bold":true},{"text":" 秒後開始戰鬥！","color":"white"}]

execute if score #dom_phase dom_config matches 3 if score #dom_phase_timer dom_config matches ..0 run function game_core:gamemode/dom/round_start

# ==========================================
# Phase 1：戰鬥
# ==========================================
execute if score #dom_phase dom_config matches 1 run scoreboard players add #dom_round_timer dom_config 1

# 90 秒：若允許且目前只有 1 個佔點，開放第二個點
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 90 if score #dom_second_open dom_config matches 1 if score #dom_open_count dom_config matches 1 run function game_core:gamemode/dom/stalemate_open
# 觸發後停止標誌，避免重複觸發
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 90 run scoreboard players set #dom_second_open dom_config 0

# 佔點收入（每秒戰鬥階段 2/s）
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_a] if score #Point_a dom_state matches 1 positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,gamemode=adventure] run gd656killicon server statistics add score @s 2
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_a] if score #Point_a dom_state matches 1 positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7,gamemode=adventure] run scoreboard players add @s dom_point_earn 2
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_b] if score #Point_b dom_state matches 1 positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,gamemode=adventure] run gd656killicon server statistics add score @s 2
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_b] if score #Point_b dom_state matches 1 positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9,gamemode=adventure] run scoreboard players add @s dom_point_earn 2
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_c] if score #Point_c dom_state matches 1 positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,gamemode=adventure] run gd656killicon server statistics add score @s 2
execute if score #dom_phase dom_config matches 1 at @e[type=marker,tag=Point_c] if score #Point_c dom_state matches 1 positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15,gamemode=adventure] run scoreboard players add @s dom_point_earn 2

# 分數計算（A、B、C）：根據進度方向 +1 dom_score
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run scoreboard players add #Red dom_score 1
execute if score #dom_phase dom_config matches 1 if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run scoreboard players add #Blue dom_score 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 1.. run scoreboard players add #Red dom_score 1
execute if score #dom_phase dom_config matches 1 if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-1 run scoreboard players add #Blue dom_score 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 1.. run scoreboard players add #Red dom_score 1
execute if score #dom_phase dom_config matches 1 if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-1 run scoreboard players add #Blue dom_score 1

# 時間計算 120 秒：超時結束
execute if score #dom_phase dom_config matches 1 if score #dom_round_timer dom_config matches 120.. run function game_core:gamemode/dom/round_end_timeout

# 金錢上限 $2,500（每秒強制執行）
execute as @a[team=red] if score @s gd656killicon.score matches 2501.. run gd656killicon server statistics set score @s 2500
execute as @a[team=blue] if score @s gd656killicon.score matches 2501.. run gd656killicon server statistics set score @s 2500
