# ==========================================
# 檔案: gamemode/dom/death_check.mcfunction
# 說明: 統計各隊存活人數，偵測全滅觸發即時結算
#       單方全滅 → 存活方勝利；雙方同時全滅 → 佔領進度結算
# ==========================================

scoreboard players set #dom_red_alive dom_config 0
scoreboard players set #dom_blue_alive dom_config 0
execute as @a[team=red,tag=dom_alive] run scoreboard players add #dom_red_alive dom_config 1
execute as @a[team=blue,tag=dom_alive] run scoreboard players add #dom_blue_alive dom_config 1

# 紅隊全滅（藍隊仍存活）→ 藍隊立即勝利
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 1.. run scoreboard players set #dom_round_winner dom_config 2
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 1.. run function game_core:gamemode/dom/round_end_wipeout

# 藍隊全滅（紅隊仍存活）→ 紅隊立即勝利
execute if score #dom_blue_alive dom_config matches 0 if score #dom_red_alive dom_config matches 1.. run scoreboard players set #dom_round_winner dom_config 1
execute if score #dom_blue_alive dom_config matches 0 if score #dom_red_alive dom_config matches 1.. run function game_core:gamemode/dom/round_end_wipeout

# 雙方同時全滅 → 按佔領進度結算
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 0 run function game_core:gamemode/dom/round_end_alldead
