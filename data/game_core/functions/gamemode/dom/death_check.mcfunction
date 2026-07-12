# ==========================================
# 檔案: gamemode/dom/death_check.mcfunction
# 說明: 統計各隊存活人數，偵測全員陣亡觸發回合結束
# ==========================================

scoreboard players set #dom_red_alive dom_config 0
scoreboard players set #dom_blue_alive dom_config 0
execute as @a[team=red,tag=dom_alive] run scoreboard players add #dom_red_alive dom_config 1
execute as @a[team=blue,tag=dom_alive] run scoreboard players add #dom_blue_alive dom_config 1

# 藍隊全滅 → 紅隊勝
execute if score #dom_blue_alive dom_config matches 0 if score #dom_red_alive dom_config matches 1.. run scoreboard players set #dom_round_winner dom_config 1
execute if score #dom_blue_alive dom_config matches 0 if score #dom_red_alive dom_config matches 1.. run function game_core:gamemode/dom/round_end_alldead

# 紅隊全滅 → 藍隊勝
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 1.. run scoreboard players set #dom_round_winner dom_config 2
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 1.. run function game_core:gamemode/dom/round_end_alldead

# 雙方同時全滅 → 平手
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 0 run scoreboard players set #dom_round_winner dom_config 0
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 0 run function game_core:gamemode/dom/round_end_alldead
