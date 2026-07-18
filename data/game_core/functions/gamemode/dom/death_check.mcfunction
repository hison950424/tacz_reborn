# ==========================================
# 檔案: gamemode/dom/death_check.mcfunction
# 說明: 統計各隊存活人數，偵測雙方同時全滅立即結算
#       單方全滅不結束回合，回合繼續至 150 秒超時
# ==========================================

scoreboard players set #dom_red_alive dom_config 0
scoreboard players set #dom_blue_alive dom_config 0
execute as @a[team=red,tag=dom_alive] run scoreboard players add #dom_red_alive dom_config 1
execute as @a[team=blue,tag=dom_alive] run scoreboard players add #dom_blue_alive dom_config 1

# 一方全滅（另一方仍存活）→ 解除附身，改為自由視角；並凍結持點計時分
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 1.. as @a[team=red,gamemode=spectator] run spectate @s
execute if score #dom_blue_alive dom_config matches 0 if score #dom_red_alive dom_config matches 1.. as @a[team=blue,gamemode=spectator] run spectate @s
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 1.. run scoreboard players set #dom_wipeout dom_config 1
execute if score #dom_blue_alive dom_config matches 0 if score #dom_red_alive dom_config matches 1.. run scoreboard players set #dom_wipeout dom_config 1

# 雙方同時全滅 → 立即按佔領進度結算
execute if score #dom_red_alive dom_config matches 0 if score #dom_blue_alive dom_config matches 0 run function game_core:gamemode/dom/round_end_alldead
