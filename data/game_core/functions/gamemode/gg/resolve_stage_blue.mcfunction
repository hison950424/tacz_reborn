# 依照藍隊當前階段，查找對應的類別
execute if score #gg_stage_blue gg_config matches 1 run scoreboard players operation #gg_cur_cat_blue gg_config = #gg_cat_order_1 gg_config
execute if score #gg_stage_blue gg_config matches 2 run scoreboard players operation #gg_cur_cat_blue gg_config = #gg_cat_order_2 gg_config
execute if score #gg_stage_blue gg_config matches 3 run scoreboard players operation #gg_cur_cat_blue gg_config = #gg_cat_order_3 gg_config
execute if score #gg_stage_blue gg_config matches 4 run scoreboard players operation #gg_cur_cat_blue gg_config = #gg_cat_order_4 gg_config
execute if score #gg_stage_blue gg_config matches 5 run scoreboard players operation #gg_cur_cat_blue gg_config = #gg_cat_order_5 gg_config
execute if score #gg_stage_blue gg_config matches 6 run scoreboard players operation #gg_cur_cat_blue gg_config = #gg_cat_order_6 gg_config

# 依照類別查找對應的槍款索引
execute if score #gg_cur_cat_blue gg_config matches 1 run scoreboard players operation #gg_cur_gun_blue gg_config = #gg_gun_idx_1 gg_config
execute if score #gg_cur_cat_blue gg_config matches 2 run scoreboard players operation #gg_cur_gun_blue gg_config = #gg_gun_idx_2 gg_config
execute if score #gg_cur_cat_blue gg_config matches 3 run scoreboard players operation #gg_cur_gun_blue gg_config = #gg_gun_idx_3 gg_config
execute if score #gg_cur_cat_blue gg_config matches 4 run scoreboard players operation #gg_cur_gun_blue gg_config = #gg_gun_idx_4 gg_config
execute if score #gg_cur_cat_blue gg_config matches 5 run scoreboard players operation #gg_cur_gun_blue gg_config = #gg_gun_idx_5 gg_config
execute if score #gg_cur_cat_blue gg_config matches 6 run scoreboard players operation #gg_cur_gun_blue gg_config = #gg_gun_idx_6 gg_config
