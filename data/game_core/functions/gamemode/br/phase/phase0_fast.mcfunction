# ==========================================
# 檔案: gamemode/br_phase0_fast_skip.mcfunction
# 目的: 快速模式專用 — br_phase0_start 預算完成後立即跳至 Phase 2
#       跳過 Phase 0（準備期 4-6 分鐘）與 Phase 1（第一次縮圈 3-4 分鐘）
#       安全圈直接設定為 Phase 2 大小，玩家跳傘後縮圈已就位
# 由: br_deploy_summon（在 br_phase0_start 之後呼叫）
# ==========================================

# === [1] 切換至 Phase 2（靜止期）===
scoreboard players set #br_phase dummy 2

# === [2] Phase 2 靜止計時器（快速模式縮短約 50%，與一般模式 br_phase2_start 不同）===
# 一般模式: Map1=3000 Map2/4/5=2400 Map3=3600；快速模式: Map1=1500 Map2/4/5=1200 Map3=1800
execute if score #global br_map matches 1 run scoreboard players set #br_timer dummy 1500
execute if score #global br_map matches 2 run scoreboard players set #br_timer dummy 1200
execute if score #global br_map matches 3 run scoreboard players set #br_timer dummy 1800
execute if score #global br_map matches 4 run scoreboard players set #br_timer dummy 1200
execute if score #global br_map matches 5 run scoreboard players set #br_timer dummy 1200

# === [3] 停止移動步進（Phase 2 為靜止期）===
scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

# === [4] 移動 br_center 至 P2 圓心，更新 worldborder 中心 ===
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p2cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p2cz dummy
execute at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

# === [5] 即刻將 worldborder 設定為 Phase 2 大小（無漸縮動畫）===
# 數值來自 br_phase1_start 的目標大小（Phase 1 縮圈結束後的直徑）
execute if score #global br_map matches 1 run worldborder set 460
execute if score #global br_map matches 2 run worldborder set 350
execute if score #global br_map matches 3 run worldborder set 520
execute if score #global br_map matches 4 run worldborder set 350
execute if score #global br_map matches 5 run worldborder set 350

# === [6] 更新整數與毫格圓心分數（供距離計算 / 傷害系統使用）===
scoreboard players operation #br_cxm dummy = #br_p2cx dummy
scoreboard players operation #br_cxm dummy *= #br_c1000 dummy
scoreboard players operation #br_czm dummy = #br_p2cz dummy
scoreboard players operation #br_czm dummy *= #br_c1000 dummy
scoreboard players operation #br_cx dummy = #br_p2cx dummy
scoreboard players operation #br_cz dummy = #br_p2cz dummy

# === [7] br_next 指向 P4（供 HUD 顯示下一圈位置）===
kill @e[type=minecraft:marker,tag=br_next]
summon minecraft:marker 0 64 0 {Tags:["br_next"]}
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[0] double 1.0 run scoreboard players get #br_p4cx dummy
execute store result entity @e[type=minecraft:marker,tag=br_next,limit=1] Pos[2] double 1.0 run scoreboard players get #br_p4cz dummy

# === [8] 重置空頭機路徑至 Phase 2 邊界（依 br_center 當前 P2 位置計算）===
# 先移除已在 br_deploy_summon 依原始地圖邊界生成的舊路徑標記，再依 P2 圓心重新生成。
# 半徑：Map1=230  Map2/4/5=175  Map3=260
# 各地圖 seeds 0-2 = dir_px (從西緣飛向東)；seeds 3-5 = dir_pz/nz (從南/北緣飛)
#         seed  6   = 對角線起點 (左下角)；seed 7 = 對角線起點 (右下角)
kill @e[type=minecraft:marker,tag=br_dropship]

# --- 地圖一 (radius=230) ---
execute if score #global br_map matches 1 if score #path_seed br_sys matches 0 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-230 250 ~-115 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 1 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-230 250 ~ {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 2 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-230 250 ~115 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 3 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-115 250 ~-230 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 4 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~ 250 ~-230 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 5 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~115 250 ~-230 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 6 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-230 250 ~-230 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 7 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~230 250 ~-230 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖二 (radius=175) ---
execute if score #global br_map matches 2 if score #path_seed br_sys matches 0 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~-87 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 1 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~ {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 2 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~87 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 3 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-87 250 ~-175 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 4 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~ 250 ~-175 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 5 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~87 250 ~-175 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 6 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~-175 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 7 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~175 {Tags:["br_dropship","br_dir_pxnz"]}

# --- 地圖三 (radius=260) ---
execute if score #global br_map matches 3 if score #path_seed br_sys matches 0 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-260 250 ~-130 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 1 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-260 250 ~ {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 2 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-260 250 ~130 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 3 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-130 250 ~-260 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 4 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~ 250 ~-260 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 5 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~130 250 ~-260 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 6 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-260 250 ~-260 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 7 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~260 250 ~-260 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖四 (radius=175) ---
execute if score #global br_map matches 4 if score #path_seed br_sys matches 0 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~-87 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 1 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~ {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 2 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~87 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 3 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-87 250 ~-175 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 4 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~ 250 ~-175 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 5 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~87 250 ~-175 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 6 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~-175 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 7 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~175 250 ~-175 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖五 (radius=175，dir_nz = 由北往南) ---
execute if score #global br_map matches 5 if score #path_seed br_sys matches 0 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~87 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 1 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~ {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 2 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~-87 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 3 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-87 250 ~175 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 4 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~ 250 ~175 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 5 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~87 250 ~175 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 6 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~-175 250 ~175 {Tags:["br_dropship","br_dir_pxnz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 7 at @e[type=minecraft:marker,tag=br_center,limit=1] run summon minecraft:marker ~175 250 ~175 {Tags:["br_dropship","br_dir_nxnz"]}

# === [9] 廣播（快速模式啟動，不觸發空頭）===
execute if score #global br_map matches 1 run tellraw @a ["",{"text":"[快速模式] ","color":"red","bold":true},{"text":"安全圈已就位，1 分 15 秒後開始縮圈！","color":"gold"}]
execute if score #global br_map matches 2 run tellraw @a ["",{"text":"[快速模式] ","color":"red","bold":true},{"text":"安全圈已就位，1 分鐘後開始縮圈！","color":"gold"}]
execute if score #global br_map matches 3 run tellraw @a ["",{"text":"[快速模式] ","color":"red","bold":true},{"text":"安全圈已就位，1 分 30 秒後開始縮圈！","color":"gold"}]
execute if score #global br_map matches 4 run tellraw @a ["",{"text":"[快速模式] ","color":"red","bold":true},{"text":"安全圈已就位，1 分鐘後開始縮圈！","color":"gold"}]
execute if score #global br_map matches 5 run tellraw @a ["",{"text":"[快速模式] ","color":"red","bold":true},{"text":"安全圈已就位，1 分鐘後開始縮圈！","color":"gold"}]
