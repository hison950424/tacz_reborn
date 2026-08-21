# 槍王之王每 tick 邏輯
# 每 40 tick（2 秒）刷新一次進度提示
scoreboard players add #gg_hud_timer gg_config 1
execute if score #gg_hud_timer gg_config matches 40.. run scoreboard players set #gg_hud_timer gg_config 0
execute if score #gg_hud_timer gg_config matches 0 run title @a actionbar [{"text":"【紅】","color":"red","bold":true},{"score":{"name":"#gg_stage_red","objective":"gg_config"},"color":"yellow"},{"text":"/9　"},{"text":"【藍】","color":"aqua","bold":true},{"score":{"name":"#gg_stage_blue","objective":"gg_config"},"color":"yellow"},{"text":"/9"}]

# 常駐消耗品：玩家身上沒有 carfak 時自動補給
execute as @a store result score @s gg_carfak gg_config run clear @s lrtactical:consumable{ConsumableId:"lrtactical:carfak"} 0
execute as @a if score @s gg_carfak gg_config matches 0 run give @s lrtactical:consumable{ConsumableId:"lrtactical:carfak"} 1
