# 召喚類別 marker，各帶唯一標籤以便後續賦值
summon marker ~ ~ ~ {Tags:["gg_cat_pool","gg_c1"]}
summon marker ~ ~ ~ {Tags:["gg_cat_pool","gg_c2"]}
summon marker ~ ~ ~ {Tags:["gg_cat_pool","gg_c3"]}
summon marker ~ ~ ~ {Tags:["gg_cat_pool","gg_c4"]}
summon marker ~ ~ ~ {Tags:["gg_cat_pool","gg_c5"]}
summon marker ~ ~ ~ {Tags:["gg_cat_pool","gg_c6"]}

# 賦予各 marker 的類別編號（1=手槍 2=衝鋒槍 3=散彈槍 4=步槍 5=機槍 6=狙擊槍）
execute as @e[tag=gg_c1,limit=1] run scoreboard players set @s gg_config 1
execute as @e[tag=gg_c2,limit=1] run scoreboard players set @s gg_config 2
execute as @e[tag=gg_c3,limit=1] run scoreboard players set @s gg_config 3
execute as @e[tag=gg_c4,limit=1] run scoreboard players set @s gg_config 4
execute as @e[tag=gg_c5,limit=1] run scoreboard players set @s gg_config 5
execute as @e[tag=gg_c6,limit=1] run scoreboard players set @s gg_config 6

# 無放回隨機抽取：依序決定 6 個階段的類別
tag @e[tag=gg_cat_pool,tag=!gg_used,sort=random,limit=1] add gg_sel
execute as @e[tag=gg_sel] run scoreboard players operation #gg_cat_order_1 gg_config = @s gg_config
tag @e[tag=gg_sel] add gg_used
tag @e[tag=gg_sel] remove gg_sel

tag @e[tag=gg_cat_pool,tag=!gg_used,sort=random,limit=1] add gg_sel
execute as @e[tag=gg_sel] run scoreboard players operation #gg_cat_order_2 gg_config = @s gg_config
tag @e[tag=gg_sel] add gg_used
tag @e[tag=gg_sel] remove gg_sel

tag @e[tag=gg_cat_pool,tag=!gg_used,sort=random,limit=1] add gg_sel
execute as @e[tag=gg_sel] run scoreboard players operation #gg_cat_order_3 gg_config = @s gg_config
tag @e[tag=gg_sel] add gg_used
tag @e[tag=gg_sel] remove gg_sel

tag @e[tag=gg_cat_pool,tag=!gg_used,sort=random,limit=1] add gg_sel
execute as @e[tag=gg_sel] run scoreboard players operation #gg_cat_order_4 gg_config = @s gg_config
tag @e[tag=gg_sel] add gg_used
tag @e[tag=gg_sel] remove gg_sel

tag @e[tag=gg_cat_pool,tag=!gg_used,sort=random,limit=1] add gg_sel
execute as @e[tag=gg_sel] run scoreboard players operation #gg_cat_order_5 gg_config = @s gg_config
tag @e[tag=gg_sel] add gg_used
tag @e[tag=gg_sel] remove gg_sel

tag @e[tag=gg_cat_pool,tag=!gg_used,sort=random,limit=1] add gg_sel
execute as @e[tag=gg_sel] run scoreboard players operation #gg_cat_order_6 gg_config = @s gg_config
tag @e[tag=gg_sel] add gg_used
tag @e[tag=gg_sel] remove gg_sel

# 清除 marker
kill @e[tag=gg_cat_pool]

# 各類別隨機選一把槍（索引從 1 開始）
execute store result score #gg_gun_idx_1 gg_config run random value 1..11
execute store result score #gg_gun_idx_2 gg_config run random value 1..7
execute store result score #gg_gun_idx_3 gg_config run random value 1..7
execute store result score #gg_gun_idx_4 gg_config run random value 1..12
execute store result score #gg_gun_idx_5 gg_config run random value 1..6
execute store result score #gg_gun_idx_6 gg_config run random value 1..8
