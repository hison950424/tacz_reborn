# 執行者: @s（身處 cat 8 隊伍的玩家）
# 檢查玩家身上是否有當前 cat 8 投擲物，沒有就補 1 個
# #gk_gun_idx_8 是 shuffle 時為 cat 8 隨機選定的槍款索引（1..6）

execute if score #gk_gun_idx_8 gk_config matches 1 store result score @s gk_tmp run clear @s lrtactical:throwable{ThrowableId:"lrtactical:molotov"} 0
execute if score #gk_gun_idx_8 gk_config matches 1 if score @s gk_tmp matches 0 run give @s lrtactical:throwable{ThrowableId:"lrtactical:molotov"} 1
execute if score #gk_gun_idx_8 gk_config matches 2 store result score @s gk_tmp run clear @s lrtactical:throwable{ThrowableId:"lrtactical:m67"} 0
execute if score #gk_gun_idx_8 gk_config matches 2 if score @s gk_tmp matches 0 run give @s lrtactical:throwable{ThrowableId:"lrtactical:m67"} 1
execute if score #gk_gun_idx_8 gk_config matches 3 store result score @s gk_tmp run clear @s lrtactical:throwable{ThrowableId:"lrtactical:rgn"} 0
execute if score #gk_gun_idx_8 gk_config matches 3 if score @s gk_tmp matches 0 run give @s lrtactical:throwable{ThrowableId:"lrtactical:rgn"} 1
execute if score #gk_gun_idx_8 gk_config matches 4 store result score @s gk_tmp run clear @s lrtactical:throwable{ThrowableId:"suffuse:m24_cluster"} 0
execute if score #gk_gun_idx_8 gk_config matches 4 if score @s gk_tmp matches 0 run give @s lrtactical:throwable{ThrowableId:"suffuse:m24_cluster"} 1
execute if score #gk_gun_idx_8 gk_config matches 5 store result score @s gk_tmp run clear @s lrtactical:throwable{ThrowableId:"lrtactical:c4"} 0
execute if score #gk_gun_idx_8 gk_config matches 5 if score @s gk_tmp matches 0 run give @s lrtactical:throwable{ThrowableId:"lrtactical:c4"} 1
execute if score #gk_gun_idx_8 gk_config matches 6 store result score @s gk_tmp run clear @s lrtactical:throwable{ThrowableId:"suffuse:m24"} 0
execute if score #gk_gun_idx_8 gk_config matches 6 if score @s gk_tmp matches 0 run give @s lrtactical:throwable{ThrowableId:"suffuse:m24"} 1
