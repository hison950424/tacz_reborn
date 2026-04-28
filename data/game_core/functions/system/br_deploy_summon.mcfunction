# ==========================================
# 檔案: system/br_deploy_summon.mcfunction
# 目的: 延遲 1 tick 後生成 Dropship Marker
# 由 br_deploy_start 透過 schedule 呼叫
# ==========================================

# --- 地圖一 ---
execute if score #global br_map matches 1 if score #path_seed br_sys matches 0 run summon marker -400 250 -240 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 1 run summon marker -400 250 0 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 2 run summon marker -400 250 240 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 3 run summon marker -240 250 -400 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 4 run summon marker 0 250 -400 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 5 run summon marker 240 250 -400 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 6 run summon marker -240 250 -240 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 7 run summon marker 240 250 -240 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖二 ---
execute if score #global br_map matches 2 if score #path_seed br_sys matches 0 run summon marker -5600 250 120 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 1 run summon marker -5600 250 300 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 2 run summon marker -5600 250 480 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 3 run summon marker -5480 250 0 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 4 run summon marker -5300 250 0 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 5 run summon marker -5120 250 0 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 6 run summon marker -5480 250 120 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 7 run summon marker -5480 250 480 {Tags:["br_dropship","br_dir_pxnz"]}

# --- 地圖三 ---
execute if score #global br_map matches 3 if score #path_seed br_sys matches 0 run summon marker -750 250 4700 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 1 run summon marker -750 250 5000 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 2 run summon marker -750 250 5300 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 3 run summon marker -530 250 4500 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 4 run summon marker -200 250 4500 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 5 run summon marker 130 250 4500 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 6 run summon marker -530 250 4700 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 7 run summon marker 130 250 4700 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖四 ---
execute if score #global br_map matches 4 if score #path_seed br_sys matches 0 run summon marker 4700 250 -180 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 1 run summon marker 4700 250 0 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 2 run summon marker 4700 250 180 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 3 run summon marker 4820 250 -300 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 4 run summon marker 5000 250 -300 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 5 run summon marker 5180 250 -300 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 6 run summon marker 4820 250 -180 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 7 run summon marker 5180 250 -180 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖五 ---
execute if score #global br_map matches 5 if score #path_seed br_sys matches 0 run summon marker -250 250 -4820 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 1 run summon marker -250 250 -5000 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 2 run summon marker -250 250 -5180 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 3 run summon marker -150 250 -4700 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 4 run summon marker 0 250 -4700 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 5 run summon marker 150 250 -4700 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 6 run summon marker -150 250 -4820 {Tags:["br_dropship","br_dir_pxnz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 7 run summon marker 150 250 -4820 {Tags:["br_dropship","br_dir_nxnz"]}

# === [2] 動態物資佈署 ===
function game_core:gamemode/br_loot_spawn

# === [3] 縮圈系統佈署 ===
# 載入地圖設定（worldborder center/size + #map 座標）
execute if score #global br_map matches 1 run function game_core:br_map/map1
execute if score #global br_map matches 2 run function game_core:br_map/map2
execute if score #global br_map matches 3 run function game_core:br_map/map3
execute if score #global br_map matches 4 run function game_core:br_map/map4
execute if score #global br_map matches 5 run function game_core:br_map/map5

# 進入準備期（同時預算所有圓心）
function game_core:gamemode/br_phase0_start

# 緩衝距離（在圈外幾格內不受傷，預設 5 格）
worldborder damage buffer 1

# 每格每秒傷害量（預設 0.2，單位是 HP）
worldborder damage amount 0.2

# === [4]解除強制載入（marker 已生成，不再需要）===
# === 地圖一 (16 段) ===
execute if score #global br_map matches 1 run forceload remove -512 -512 511 -449
execute if score #global br_map matches 1 run forceload remove -512 -448 511 -385
execute if score #global br_map matches 1 run forceload remove -512 -384 511 -321
execute if score #global br_map matches 1 run forceload remove -512 -320 511 -257
execute if score #global br_map matches 1 run forceload remove -512 -256 511 -193
execute if score #global br_map matches 1 run forceload remove -512 -192 511 -129
execute if score #global br_map matches 1 run forceload remove -512 -128 511 -65
execute if score #global br_map matches 1 run forceload remove -512 -64 511 -1
execute if score #global br_map matches 1 run forceload remove -512 0 511 63
execute if score #global br_map matches 1 run forceload remove -512 64 511 127
execute if score #global br_map matches 1 run forceload remove -512 128 511 191
execute if score #global br_map matches 1 run forceload remove -512 192 511 255
execute if score #global br_map matches 1 run forceload remove -512 256 511 319
execute if score #global br_map matches 1 run forceload remove -512 320 511 383
execute if score #global br_map matches 1 run forceload remove -512 384 511 447
execute if score #global br_map matches 1 run forceload remove -512 448 511 511

# === 地圖二 (10 段) ===
execute if score #global br_map matches 2 run forceload remove -5712 -128 -4993 -49
execute if score #global br_map matches 2 run forceload remove -5712 -48 -4993 31
execute if score #global br_map matches 2 run forceload remove -5712 32 -4993 111
execute if score #global br_map matches 2 run forceload remove -5712 112 -4993 191
execute if score #global br_map matches 2 run forceload remove -5712 192 -4993 271
execute if score #global br_map matches 2 run forceload remove -5712 272 -4993 351
execute if score #global br_map matches 2 run forceload remove -5712 352 -4993 431
execute if score #global br_map matches 2 run forceload remove -5712 432 -4993 511
execute if score #global br_map matches 2 run forceload remove -5712 512 -4993 591
execute if score #global br_map matches 2 run forceload remove -5712 592 -4993 655

# === 地圖三 (21 段) ===
execute if score #global br_map matches 3 run forceload remove -800 4496 415 4543
execute if score #global br_map matches 3 run forceload remove -800 4544 415 4591
execute if score #global br_map matches 3 run forceload remove -800 4592 415 4639
execute if score #global br_map matches 3 run forceload remove -800 4640 415 4687
execute if score #global br_map matches 3 run forceload remove -800 4688 415 4735
execute if score #global br_map matches 3 run forceload remove -800 4736 415 4783
execute if score #global br_map matches 3 run forceload remove -800 4784 415 4831
execute if score #global br_map matches 3 run forceload remove -800 4832 415 4879
execute if score #global br_map matches 3 run forceload remove -800 4880 415 4927
execute if score #global br_map matches 3 run forceload remove -800 4928 415 4975
execute if score #global br_map matches 3 run forceload remove -800 4976 415 5023
execute if score #global br_map matches 3 run forceload remove -800 5024 415 5071
execute if score #global br_map matches 3 run forceload remove -800 5072 415 5119
execute if score #global br_map matches 3 run forceload remove -800 5120 415 5167
execute if score #global br_map matches 3 run forceload remove -800 5168 415 5215
execute if score #global br_map matches 3 run forceload remove -800 5216 415 5263
execute if score #global br_map matches 3 run forceload remove -800 5264 415 5311
execute if score #global br_map matches 3 run forceload remove -800 5312 415 5359
execute if score #global br_map matches 3 run forceload remove -800 5360 415 5407
execute if score #global br_map matches 3 run forceload remove -800 5408 415 5455
execute if score #global br_map matches 3 run forceload remove -800 5456 415 5503

# === 地圖四 (10 段) ===
execute if score #global br_map matches 4 run forceload remove 4688 -400 5407 -321
execute if score #global br_map matches 4 run forceload remove 4688 -320 5407 -241
execute if score #global br_map matches 4 run forceload remove 4688 -240 5407 -161
execute if score #global br_map matches 4 run forceload remove 4688 -160 5407 -81
execute if score #global br_map matches 4 run forceload remove 4688 -80 5407 -1
execute if score #global br_map matches 4 run forceload remove 4688 0 5407 79
execute if score #global br_map matches 4 run forceload remove 4688 80 5407 159
execute if score #global br_map matches 4 run forceload remove 4688 160 5407 239
execute if score #global br_map matches 4 run forceload remove 4688 240 5407 319
execute if score #global br_map matches 4 run forceload remove 4688 320 5407 351

# === 地圖五 (11 段) ===
execute if score #global br_map matches 5 run forceload remove -400 -5408 415 -5329
execute if score #global br_map matches 5 run forceload remove -400 -5328 415 -5249
execute if score #global br_map matches 5 run forceload remove -400 -5248 415 -5169
execute if score #global br_map matches 5 run forceload remove -400 -5168 415 -5089
execute if score #global br_map matches 5 run forceload remove -400 -5088 415 -5009
execute if score #global br_map matches 5 run forceload remove -400 -5008 415 -4929
execute if score #global br_map matches 5 run forceload remove -400 -4928 415 -4849
execute if score #global br_map matches 5 run forceload remove -400 -4848 415 -4769
execute if score #global br_map matches 5 run forceload remove -400 -4768 415 -4689
execute if score #global br_map matches 5 run forceload remove -400 -4688 415 -4609
execute if score #global br_map matches 5 run forceload remove -400 -4608 415 -4593


