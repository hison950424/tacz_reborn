# 檔案: give_attach_for_stage.mcfunction
# 目的: 依 #gk_give_stage（當前階段）與 #gk_give_cat（武器類別 1..7）給予對應的 6 類配件各 2 個
# 執行者: @s（玩家本身）
# 前置條件: 呼叫前必須先設定 #gk_give_stage 與 #gk_give_cat
#
# 配件類型（6 類 × 2 個 = 12 件/階段）：
#   am = 彈匣（17 種）| sc = 瞄準鏡（40 種）| mu = 膛口（26 種）
#   st = 槍托（32 種）| gr = 握把（21 種）  | la = 雷射（8 種）
# 類別 8/9（投擲物/近戰）不給配件（條件限制為 matches 1..7）
#
# 配件索引由 shuffle.mcfunction 在開局時預先隨機，各階段各類各有 a/b 兩個固定值，
# 確保所有玩家在同一階段同一類別收到完全相同的配件。
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_1_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_1_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_1_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_1_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_1_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_1_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_1_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_1_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_1_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_1_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_1_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_1_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 1 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_2_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_2_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_2_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_2_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_2_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_2_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_2_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_2_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_2_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_2_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_2_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_2_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 2 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_3_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_3_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_3_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_3_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_3_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_3_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_3_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_3_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_3_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_3_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_3_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_3_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 3 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_4_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_4_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_4_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_4_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_4_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_4_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_4_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_4_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_4_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_4_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_4_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_4_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 4 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_5_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_5_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_5_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_5_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_5_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_5_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_5_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_5_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_5_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_5_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_5_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_5_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 5 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_6_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_6_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_6_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_6_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_6_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_6_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_6_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_6_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_6_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_6_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_6_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_6_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 6 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_7_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_7_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_7_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_7_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_7_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_7_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_7_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_7_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_7_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_7_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_7_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_7_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 7 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_8_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_8_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_8_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_8_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_8_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_8_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_8_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_8_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_8_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_8_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_8_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_8_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 8 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_9_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_am_9_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_mag
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_9_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_sc_9_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_scope
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_9_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_mu_9_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_muzzle
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_9_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_st_9_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_stock
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_9_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_gr_9_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_grip
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_9_a gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_laser
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run scoreboard players operation #gk_give_attach_idx gk_config = #gk_la_9_b gk_config
execute if score #gk_give_cat gk_config matches 1..7 if score #gk_give_stage gk_config matches 9 run function game_core:gamemode/gk/give_attach_laser
