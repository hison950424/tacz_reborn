# ==========================================
# 檔案: gamemode/br_win_check.mcfunction
# 觸發時機: br_eliminated.mcfunction 淘汰玩家後呼叫
# 目的: 偵測場上是否只剩一支隊伍存活，觸發勝利
# 注意: 此為基礎版 Stub，Phase 5 時將擴充為完整結算系統
# ==========================================

# 【防重複觸發】match_end_sequence 已執行（game_state=3）時直接跳出
# 避免 br_force_state4 立即觸發 + schedule 延遲觸發導致雙重結算
tellraw @a ["",{"text":"[DEBUG] win_check 被呼叫 game_state=","color":"yellow"},{"score":{"name":"#global","objective":"game_state"},"color":"white"}]
execute if score #global game_state matches 3 run tellraw @a {"text":"[DEBUG] game_state=3 提前返回","color":"red"}
execute if score #global game_state matches 3 run return 0

# 以即時 entity query 計算存活隊伍（只計 state 1，排除倒地/靈魂/已淘汰）
# 避免 force_dead 直接呼叫時讀到尚未更新的 cache 值而誤判勝利
scoreboard players set #teams_alive br_sys 0
execute if entity @a[team=red,scores={br_death_state=1}]   run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=blue,scores={br_death_state=1}]  run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=green,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=white,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
# 孤狼每位存活者各算一支「獨立隊伍」
execute as @a[tag=solo,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1

tellraw @a ["",{"text":"[DEBUG] teams_alive=","color":"yellow"},{"score":{"name":"#teams_alive","objective":"br_sys"},"color":"white"}]

# --- 先決定勝者並標記 rp_winner（顯示 title 前先完成，才能在 subtitle 用 selector 顯示名單）---
execute if score #teams_alive br_sys matches ..1 if entity @a[team=red,scores={br_death_state=1}]   run scoreboard players set #winner_team dummy 1
execute if score #teams_alive br_sys matches ..1 if entity @a[team=blue,scores={br_death_state=1}]  run scoreboard players set #winner_team dummy 2
execute if score #teams_alive br_sys matches ..1 if entity @a[team=green,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 3
execute if score #teams_alive br_sys matches ..1 if entity @a[team=white,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 4
execute if score #teams_alive br_sys matches ..1 if entity @a[tag=solo,scores={br_death_state=1}]   as @a[tag=solo,scores={br_death_state=1}] run tag @s add br_winner
execute if score #teams_alive br_sys matches ..1 if entity @a[tag=solo,scores={br_death_state=1}]   run scoreboard players set #winner_team dummy 5

execute if score #winner_team dummy matches 1 run tag @a[team=red] add rp_winner
execute if score #winner_team dummy matches 2 run tag @a[team=blue] add rp_winner
execute if score #winner_team dummy matches 3 run tag @a[team=green] add rp_winner
execute if score #winner_team dummy matches 4 run tag @a[team=white] add rp_winner
execute if score #winner_team dummy matches 5 run tag @a[tag=br_winner] add rp_winner

# --- 顯示勝利公告 title + subtitle（subtitle 顯示獲勝名單）---
execute if score #winner_team dummy matches 1 run title @a title {"text":"紅隊獲勝！","color":"red","bold":true}
execute if score #winner_team dummy matches 2 run title @a title {"text":"藍隊獲勝！","color":"blue","bold":true}
execute if score #winner_team dummy matches 3 run title @a title {"text":"綠隊獲勝！","color":"green","bold":true}
execute if score #winner_team dummy matches 4 run title @a title {"text":"白隊獲勝！","color":"white","bold":true}
execute if score #winner_team dummy matches 5 run title @a title {"text":"孤狼獲勝！","color":"gray","bold":true}
execute if score #winner_team dummy matches 1.. run title @a subtitle ["",{"text":"獲勝成員: ","color":"gold","bold":true},{"selector":"@a[tag=rp_winner]","color":"white"}]

################把所有玩家傳送至贏家身上
execute as @a[tag = rp_winner] at @s run tp @a @s


execute if score #teams_alive br_sys matches 0 run title @a title {"text":"同時死亡，無人獲勝。","color":"dark_gray","bold":true}

execute if score #teams_alive br_sys matches ..1 run tellraw @a {"text":"[DEBUG] match_end 即將呼叫","color":"green"}
execute if score #teams_alive br_sys matches ..1 run function game_core:core/match_end

# 【修復】#winner_team 必須在 match_end_sequence (rank_calculate) 讀取完畢後才能歸零
# 原本放在 match_end_sequence 之前，導致 rank_calculate 永遠讀到 0，RP 與勝敗統計全部失效
scoreboard players set #winner_team dummy 0
