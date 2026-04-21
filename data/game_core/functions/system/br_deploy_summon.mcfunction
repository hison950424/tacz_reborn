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



# === 解除強制載入（marker 已生成，不再需要）===
execute if score #global br_map matches 1 if score #path_seed br_sys matches 0 run forceload remove -400 -240
execute if score #global br_map matches 1 if score #path_seed br_sys matches 1 run forceload remove -400 0
execute if score #global br_map matches 1 if score #path_seed br_sys matches 2 run forceload remove -400 240
execute if score #global br_map matches 1 if score #path_seed br_sys matches 3 run forceload remove -240 -400
execute if score #global br_map matches 1 if score #path_seed br_sys matches 4 run forceload remove 0 -400
execute if score #global br_map matches 1 if score #path_seed br_sys matches 5 run forceload remove 240 -400
execute if score #global br_map matches 1 if score #path_seed br_sys matches 6 run forceload remove -240 -240
execute if score #global br_map matches 1 if score #path_seed br_sys matches 7 run forceload remove 240 -240

execute if score #global br_map matches 2 if score #path_seed br_sys matches 0 run forceload remove -5600 120
execute if score #global br_map matches 2 if score #path_seed br_sys matches 1 run forceload remove -5600 300
execute if score #global br_map matches 2 if score #path_seed br_sys matches 2 run forceload remove -5600 480
execute if score #global br_map matches 2 if score #path_seed br_sys matches 3 run forceload remove -5480 0
execute if score #global br_map matches 2 if score #path_seed br_sys matches 4 run forceload remove -5300 0
execute if score #global br_map matches 2 if score #path_seed br_sys matches 5 run forceload remove -5120 0
execute if score #global br_map matches 2 if score #path_seed br_sys matches 6 run forceload remove -5480 120
execute if score #global br_map matches 2 if score #path_seed br_sys matches 7 run forceload remove -5480 480

execute if score #global br_map matches 3 if score #path_seed br_sys matches 0 run forceload remove -750 4700
execute if score #global br_map matches 3 if score #path_seed br_sys matches 1 run forceload remove -750 5000
execute if score #global br_map matches 3 if score #path_seed br_sys matches 2 run forceload remove -750 5300
execute if score #global br_map matches 3 if score #path_seed br_sys matches 3 run forceload remove -530 4500
execute if score #global br_map matches 3 if score #path_seed br_sys matches 4 run forceload remove -200 4500
execute if score #global br_map matches 3 if score #path_seed br_sys matches 5 run forceload remove 130 4500
execute if score #global br_map matches 3 if score #path_seed br_sys matches 6 run forceload remove -530 4700
execute if score #global br_map matches 3 if score #path_seed br_sys matches 7 run forceload remove 130 4700

execute if score #global br_map matches 4 if score #path_seed br_sys matches 0 run forceload remove 4700 -180
execute if score #global br_map matches 4 if score #path_seed br_sys matches 1 run forceload remove 4700 0
execute if score #global br_map matches 4 if score #path_seed br_sys matches 2 run forceload remove 4700 180
execute if score #global br_map matches 4 if score #path_seed br_sys matches 3 run forceload remove 4820 -300
execute if score #global br_map matches 4 if score #path_seed br_sys matches 4 run forceload remove 5000 -300
execute if score #global br_map matches 4 if score #path_seed br_sys matches 5 run forceload remove 5180 -300
execute if score #global br_map matches 4 if score #path_seed br_sys matches 6 run forceload remove 4820 -180
execute if score #global br_map matches 4 if score #path_seed br_sys matches 7 run forceload remove 5180 -180

execute if score #global br_map matches 5 if score #path_seed br_sys matches 0 run forceload remove -250 -4820
execute if score #global br_map matches 5 if score #path_seed br_sys matches 1 run forceload remove -250 -5000
execute if score #global br_map matches 5 if score #path_seed br_sys matches 2 run forceload remove -250 -5180
execute if score #global br_map matches 5 if score #path_seed br_sys matches 3 run forceload remove -150 -4700
execute if score #global br_map matches 5 if score #path_seed br_sys matches 4 run forceload remove 0 -4700
execute if score #global br_map matches 5 if score #path_seed br_sys matches 5 run forceload remove 150 -4700
execute if score #global br_map matches 5 if score #path_seed br_sys matches 6 run forceload remove -150 -4820
execute if score #global br_map matches 5 if score #path_seed br_sys matches 7 run forceload remove 150 -4820

