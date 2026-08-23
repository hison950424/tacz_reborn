# 確保 GK 計分板目標存在（即使 init 未執行也能正常運作）
scoreboard objectives add gk_config dummy "槍王之王設定值"
scoreboard objectives add gk_tmp dummy "GK暫存(per-player)"

# 召喚類別 marker，各帶唯一標籤以便後續賦值
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c1"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c2"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c3"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c4"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c5"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c6"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c7"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c8"]}
summon marker ~ ~ ~ {Tags:["gk_cat_pool","gk_c9"]}

# 賦予各 marker 的類別編號（1=手槍 2=衝鋒槍 3=散彈槍 4=步槍 5=機槍 6=狙擊槍 7=重型武器 8=傷害型投擲物 9=近戰武器）
execute as @e[tag=gk_c1,limit=1] run scoreboard players set @s gk_config 1
execute as @e[tag=gk_c2,limit=1] run scoreboard players set @s gk_config 2
execute as @e[tag=gk_c3,limit=1] run scoreboard players set @s gk_config 3
execute as @e[tag=gk_c4,limit=1] run scoreboard players set @s gk_config 4
execute as @e[tag=gk_c5,limit=1] run scoreboard players set @s gk_config 5
execute as @e[tag=gk_c6,limit=1] run scoreboard players set @s gk_config 6
execute as @e[tag=gk_c7,limit=1] run scoreboard players set @s gk_config 7
execute as @e[tag=gk_c8,limit=1] run scoreboard players set @s gk_config 8
execute as @e[tag=gk_c9,limit=1] run scoreboard players set @s gk_config 9

# 無放回隨機抽取：依序決定 9 個階段的類別
tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_1 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_2 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_3 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_4 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_5 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_6 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_7 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_8 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

tag @e[tag=gk_cat_pool,tag=!gk_used,sort=random,limit=1] add gk_sel
execute as @e[tag=gk_sel] run scoreboard players operation #gk_cat_order_9 gk_config = @s gk_config
tag @e[tag=gk_sel] add gk_used
tag @e[tag=gk_sel] remove gk_sel

# 清除 marker
kill @e[tag=gk_cat_pool]

# 各類別隨機選一把槍（索引從 1 開始）
execute store result score #gk_gun_idx_1 gk_config run random value 1..27
execute store result score #gk_gun_idx_2 gk_config run random value 1..11
execute store result score #gk_gun_idx_3 gk_config run random value 1..10
execute store result score #gk_gun_idx_4 gk_config run random value 1..36
execute store result score #gk_gun_idx_5 gk_config run random value 1..11
execute store result score #gk_gun_idx_6 gk_config run random value 1..17
execute store result score #gk_gun_idx_7 gk_config run random value 1..9
execute store result score #gk_gun_idx_8 gk_config run random value 1..5
execute store result score #gk_gun_idx_9 gk_config run random value 1..17

# 各階段 6 類配件隨機預先決定（cat 1..7 適用；各類各 2 個）
# 彈匣 17 種 | 瞄準鏡 40 種 | 膛口 26 種 | 槍托 32 種 | 握把 21 種 | 雷射 8 種
execute store result score #gk_am_1_a gk_config run random value 1..17
execute store result score #gk_am_1_b gk_config run random value 1..17
execute store result score #gk_sc_1_a gk_config run random value 1..40
execute store result score #gk_sc_1_b gk_config run random value 1..40
execute store result score #gk_mu_1_a gk_config run random value 1..26
execute store result score #gk_mu_1_b gk_config run random value 1..26
execute store result score #gk_st_1_a gk_config run random value 1..32
execute store result score #gk_st_1_b gk_config run random value 1..32
execute store result score #gk_gr_1_a gk_config run random value 1..21
execute store result score #gk_gr_1_b gk_config run random value 1..21
execute store result score #gk_la_1_a gk_config run random value 1..8
execute store result score #gk_la_1_b gk_config run random value 1..8
execute store result score #gk_am_2_a gk_config run random value 1..17
execute store result score #gk_am_2_b gk_config run random value 1..17
execute store result score #gk_sc_2_a gk_config run random value 1..40
execute store result score #gk_sc_2_b gk_config run random value 1..40
execute store result score #gk_mu_2_a gk_config run random value 1..26
execute store result score #gk_mu_2_b gk_config run random value 1..26
execute store result score #gk_st_2_a gk_config run random value 1..32
execute store result score #gk_st_2_b gk_config run random value 1..32
execute store result score #gk_gr_2_a gk_config run random value 1..21
execute store result score #gk_gr_2_b gk_config run random value 1..21
execute store result score #gk_la_2_a gk_config run random value 1..8
execute store result score #gk_la_2_b gk_config run random value 1..8
execute store result score #gk_am_3_a gk_config run random value 1..17
execute store result score #gk_am_3_b gk_config run random value 1..17
execute store result score #gk_sc_3_a gk_config run random value 1..40
execute store result score #gk_sc_3_b gk_config run random value 1..40
execute store result score #gk_mu_3_a gk_config run random value 1..26
execute store result score #gk_mu_3_b gk_config run random value 1..26
execute store result score #gk_st_3_a gk_config run random value 1..32
execute store result score #gk_st_3_b gk_config run random value 1..32
execute store result score #gk_gr_3_a gk_config run random value 1..21
execute store result score #gk_gr_3_b gk_config run random value 1..21
execute store result score #gk_la_3_a gk_config run random value 1..8
execute store result score #gk_la_3_b gk_config run random value 1..8
execute store result score #gk_am_4_a gk_config run random value 1..17
execute store result score #gk_am_4_b gk_config run random value 1..17
execute store result score #gk_sc_4_a gk_config run random value 1..40
execute store result score #gk_sc_4_b gk_config run random value 1..40
execute store result score #gk_mu_4_a gk_config run random value 1..26
execute store result score #gk_mu_4_b gk_config run random value 1..26
execute store result score #gk_st_4_a gk_config run random value 1..32
execute store result score #gk_st_4_b gk_config run random value 1..32
execute store result score #gk_gr_4_a gk_config run random value 1..21
execute store result score #gk_gr_4_b gk_config run random value 1..21
execute store result score #gk_la_4_a gk_config run random value 1..8
execute store result score #gk_la_4_b gk_config run random value 1..8
execute store result score #gk_am_5_a gk_config run random value 1..17
execute store result score #gk_am_5_b gk_config run random value 1..17
execute store result score #gk_sc_5_a gk_config run random value 1..40
execute store result score #gk_sc_5_b gk_config run random value 1..40
execute store result score #gk_mu_5_a gk_config run random value 1..26
execute store result score #gk_mu_5_b gk_config run random value 1..26
execute store result score #gk_st_5_a gk_config run random value 1..32
execute store result score #gk_st_5_b gk_config run random value 1..32
execute store result score #gk_gr_5_a gk_config run random value 1..21
execute store result score #gk_gr_5_b gk_config run random value 1..21
execute store result score #gk_la_5_a gk_config run random value 1..8
execute store result score #gk_la_5_b gk_config run random value 1..8
execute store result score #gk_am_6_a gk_config run random value 1..17
execute store result score #gk_am_6_b gk_config run random value 1..17
execute store result score #gk_sc_6_a gk_config run random value 1..40
execute store result score #gk_sc_6_b gk_config run random value 1..40
execute store result score #gk_mu_6_a gk_config run random value 1..26
execute store result score #gk_mu_6_b gk_config run random value 1..26
execute store result score #gk_st_6_a gk_config run random value 1..32
execute store result score #gk_st_6_b gk_config run random value 1..32
execute store result score #gk_gr_6_a gk_config run random value 1..21
execute store result score #gk_gr_6_b gk_config run random value 1..21
execute store result score #gk_la_6_a gk_config run random value 1..8
execute store result score #gk_la_6_b gk_config run random value 1..8
execute store result score #gk_am_7_a gk_config run random value 1..17
execute store result score #gk_am_7_b gk_config run random value 1..17
execute store result score #gk_sc_7_a gk_config run random value 1..40
execute store result score #gk_sc_7_b gk_config run random value 1..40
execute store result score #gk_mu_7_a gk_config run random value 1..26
execute store result score #gk_mu_7_b gk_config run random value 1..26
execute store result score #gk_st_7_a gk_config run random value 1..32
execute store result score #gk_st_7_b gk_config run random value 1..32
execute store result score #gk_gr_7_a gk_config run random value 1..21
execute store result score #gk_gr_7_b gk_config run random value 1..21
execute store result score #gk_la_7_a gk_config run random value 1..8
execute store result score #gk_la_7_b gk_config run random value 1..8
execute store result score #gk_am_8_a gk_config run random value 1..17
execute store result score #gk_am_8_b gk_config run random value 1..17
execute store result score #gk_sc_8_a gk_config run random value 1..40
execute store result score #gk_sc_8_b gk_config run random value 1..40
execute store result score #gk_mu_8_a gk_config run random value 1..26
execute store result score #gk_mu_8_b gk_config run random value 1..26
execute store result score #gk_st_8_a gk_config run random value 1..32
execute store result score #gk_st_8_b gk_config run random value 1..32
execute store result score #gk_gr_8_a gk_config run random value 1..21
execute store result score #gk_gr_8_b gk_config run random value 1..21
execute store result score #gk_la_8_a gk_config run random value 1..8
execute store result score #gk_la_8_b gk_config run random value 1..8
execute store result score #gk_am_9_a gk_config run random value 1..17
execute store result score #gk_am_9_b gk_config run random value 1..17
execute store result score #gk_sc_9_a gk_config run random value 1..40
execute store result score #gk_sc_9_b gk_config run random value 1..40
execute store result score #gk_mu_9_a gk_config run random value 1..26
execute store result score #gk_mu_9_b gk_config run random value 1..26
execute store result score #gk_st_9_a gk_config run random value 1..32
execute store result score #gk_st_9_b gk_config run random value 1..32
execute store result score #gk_gr_9_a gk_config run random value 1..21
execute store result score #gk_gr_9_b gk_config run random value 1..21
execute store result score #gk_la_9_a gk_config run random value 1..8
execute store result score #gk_la_9_b gk_config run random value 1..8