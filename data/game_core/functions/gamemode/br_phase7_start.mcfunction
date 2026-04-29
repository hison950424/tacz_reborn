# Phase 7：決賽縮圈
# map2/4/5=2分(2400) map1=2.5分(3000) map3=2.5分(3000)
scoreboard players set #br_phase dummy 7

execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 2400
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 3000
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 3000

# worldborder 縮圈秒數對應各地圖 timer
execute if score #global br_map matches 2 run worldborder set 10 120
execute if score #global br_map matches 4 run worldborder set 10 120
execute if score #global br_map matches 5 run worldborder set 10 120
execute if score #global br_map matches 1 run worldborder set 10 150
execute if score #global br_map matches 3 run worldborder set 10 150

# ── 公告 ──
execute if score #global br_map matches 2 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red","bold":true},{"text":"★ 決賽縮圈開始！ ★","color":"red","bold":true}]
execute if score #global br_map matches 4 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red","bold":true},{"text":"★ 決賽縮圈開始！ ★","color":"red","bold":true}]
execute if score #global br_map matches 5 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red","bold":true},{"text":"★ 決賽縮圈開始！ ★","color":"red","bold":true}]
execute if score #global br_map matches 1 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red","bold":true},{"text":"★ 決賽縮圈開始！ ★","color":"red","bold":true}]
execute if score #global br_map matches 3 run tellraw @a ["",{"text":"[縮圈] ","color":"dark_red","bold":true},{"text":"★ 決賽縮圈開始！ ★","color":"red","bold":true}]
