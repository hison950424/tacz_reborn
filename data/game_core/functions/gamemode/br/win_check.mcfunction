# ==========================================
# 檔案: gamemode/br_win_check.mcfunction
# 觸發時機: br_eliminated.mcfunction 淘汰玩家後呼叫
# 目的: 偵測場上是否只剩一支隊伍存活，觸發勝利
# ==========================================

# 【防重複觸發】match_end_sequence 已執行（game_state=3）時直接跳出
execute if score #global game_state matches 3 run return 0

# 以即時 entity query 計算存活隊伍（只計 state 1，排除倒地/靈魂/已淘汰）
scoreboard players set #teams_alive br_sys 0
execute if entity @a[team=red,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=blue,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=green,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=white,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=yellow,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=aqua,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=gold,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=light_purple,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=dark_red,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=dark_blue,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=dark_green,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=dark_aqua,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=dark_purple,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=dark_gray,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=gray,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
execute if entity @a[team=black,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1
# 孤狼每位存活者各算一支「獨立隊伍」
execute as @a[tag=solo,scores={br_death_state=1}] run scoreboard players add #teams_alive br_sys 1

# --- 先決定勝者並標記 rp_winner（顯示 title 前先完成，才能在 subtitle 用 selector 顯示名單）---
execute if score #teams_alive br_sys matches ..1 if entity @a[team=red,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 1
execute if score #teams_alive br_sys matches ..1 if entity @a[team=blue,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 2
execute if score #teams_alive br_sys matches ..1 if entity @a[team=green,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 3
execute if score #teams_alive br_sys matches ..1 if entity @a[team=white,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 4
execute if score #teams_alive br_sys matches ..1 if entity @a[team=yellow,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 5
execute if score #teams_alive br_sys matches ..1 if entity @a[team=aqua,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 6
execute if score #teams_alive br_sys matches ..1 if entity @a[team=gold,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 7
execute if score #teams_alive br_sys matches ..1 if entity @a[team=light_purple,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 8
execute if score #teams_alive br_sys matches ..1 if entity @a[team=dark_red,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 9
execute if score #teams_alive br_sys matches ..1 if entity @a[team=dark_blue,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 10
execute if score #teams_alive br_sys matches ..1 if entity @a[team=dark_green,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 11
execute if score #teams_alive br_sys matches ..1 if entity @a[team=dark_aqua,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 12
execute if score #teams_alive br_sys matches ..1 if entity @a[team=dark_purple,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 13
execute if score #teams_alive br_sys matches ..1 if entity @a[team=dark_gray,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 14
execute if score #teams_alive br_sys matches ..1 if entity @a[team=gray,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 15
execute if score #teams_alive br_sys matches ..1 if entity @a[team=black,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 16
execute if score #teams_alive br_sys matches ..1 if entity @a[tag=solo,scores={br_death_state=1}] as @a[tag=solo,scores={br_death_state=1}] run tag @s add br_winner
execute if score #teams_alive br_sys matches ..1 if entity @a[tag=solo,scores={br_death_state=1}] run scoreboard players set #winner_team dummy 17

execute if score #winner_team dummy matches 1 run tag @a[team=red] add rp_winner
execute if score #winner_team dummy matches 2 run tag @a[team=blue] add rp_winner
execute if score #winner_team dummy matches 3 run tag @a[team=green] add rp_winner
execute if score #winner_team dummy matches 4 run tag @a[team=white] add rp_winner
execute if score #winner_team dummy matches 5 run tag @a[team=yellow] add rp_winner
execute if score #winner_team dummy matches 6 run tag @a[team=aqua] add rp_winner
execute if score #winner_team dummy matches 7 run tag @a[team=gold] add rp_winner
execute if score #winner_team dummy matches 8 run tag @a[team=light_purple] add rp_winner
execute if score #winner_team dummy matches 9 run tag @a[team=dark_red] add rp_winner
execute if score #winner_team dummy matches 10 run tag @a[team=dark_blue] add rp_winner
execute if score #winner_team dummy matches 11 run tag @a[team=dark_green] add rp_winner
execute if score #winner_team dummy matches 12 run tag @a[team=dark_aqua] add rp_winner
execute if score #winner_team dummy matches 13 run tag @a[team=dark_purple] add rp_winner
execute if score #winner_team dummy matches 14 run tag @a[team=dark_gray] add rp_winner
execute if score #winner_team dummy matches 15 run tag @a[team=gray] add rp_winner
execute if score #winner_team dummy matches 16 run tag @a[team=black] add rp_winner
execute if score #winner_team dummy matches 17 run tag @a[tag=br_winner] add rp_winner

# --- 顯示勝利公告 title + subtitle（subtitle 顯示獲勝名單）---
execute if score #winner_team dummy matches 1 run title @a title {"text":"紅隊獲勝！","color":"red","bold":true}
execute if score #winner_team dummy matches 2 run title @a title {"text":"藍隊獲勝！","color":"blue","bold":true}
execute if score #winner_team dummy matches 3 run title @a title {"text":"綠隊獲勝！","color":"green","bold":true}
execute if score #winner_team dummy matches 4 run title @a title {"text":"白隊獲勝！","color":"white","bold":true}
execute if score #winner_team dummy matches 5 run title @a title {"text":"黃隊獲勝！","color":"yellow","bold":true}
execute if score #winner_team dummy matches 6 run title @a title {"text":"水藍隊獲勝！","color":"aqua","bold":true}
execute if score #winner_team dummy matches 7 run title @a title {"text":"金隊獲勝！","color":"gold","bold":true}
execute if score #winner_team dummy matches 8 run title @a title {"text":"淡紫隊獲勝！","color":"light_purple","bold":true}
execute if score #winner_team dummy matches 9 run title @a title {"text":"深紅隊獲勝！","color":"dark_red","bold":true}
execute if score #winner_team dummy matches 10 run title @a title {"text":"深藍隊獲勝！","color":"dark_blue","bold":true}
execute if score #winner_team dummy matches 11 run title @a title {"text":"深綠隊獲勝！","color":"dark_green","bold":true}
execute if score #winner_team dummy matches 12 run title @a title {"text":"深水藍隊獲勝！","color":"dark_aqua","bold":true}
execute if score #winner_team dummy matches 13 run title @a title {"text":"深紫隊獲勝！","color":"dark_purple","bold":true}
execute if score #winner_team dummy matches 14 run title @a title {"text":"深灰隊獲勝！","color":"dark_gray","bold":true}
execute if score #winner_team dummy matches 15 run title @a title {"text":"灰隊獲勝！","color":"gray","bold":true}
execute if score #winner_team dummy matches 16 run title @a title {"text":"黑隊獲勝！","color":"dark_gray","bold":true}
execute if score #winner_team dummy matches 17 run title @a title {"text":"孤狼獲勝！","color":"gray","bold":true}

# 把所有玩家傳送至贏家身上
execute as @a[tag=rp_winner] at @s run tp @a @s

execute if score #teams_alive br_sys matches 0 run title @a title {"text":"同時死亡，無人獲勝。","color":"dark_gray","bold":true}

# 戰局結算前顯示獲勝名單（聊天欄訊息，比副標題更能容納多人）
execute if score #teams_alive br_sys matches ..1 run tellraw @a ["",{"text":"⚑ 獲勝名單 » ","color":"gold","bold":true},{"selector":"@a[tag=rp_winner]","color":"white","bold":false}]

execute if score #teams_alive br_sys matches ..1 run function game_core:core/match_end

# 【修復】#winner_team 必須在 match_end_sequence (rank_calculate) 讀取完畢後才能歸零
scoreboard players set #winner_team dummy 0
