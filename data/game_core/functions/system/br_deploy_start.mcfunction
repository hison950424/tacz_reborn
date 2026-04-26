# ==========================================
# 檔案: system/br_deploy_start.mcfunction
# 目的: 倒數結束後啟動空投部署
#       先 TP 玩家至各路徑起始點（強制載入遠距 Chunk），再召喚 Dropship Marker
# 由 gamemode/br_countdown_tick 在計時器歸零時呼叫
# ==========================================

# === [0.5] 動態物資佈署 ===
function game_core:gamemode/br_loot_spawn

# 切換至空投階段：br_main_tick 從此 Tick 開始改呼叫 br_deploy_tick
scoreboard players set #global br_phase 1

# 在此重置 sneak_time（而非在 start_battle_royale），原因：
# 倒數 5 秒期間玩家可能在等待區自然蹲下，若重置過早，進入 Phase 1 的第一 Tick
# sneak_time 已 ≥1，會觸發立即跳機。於此重置可確保只偵測「空投機飛行中的蹲下」。
scoreboard players set @a sneak_time 0

# === [1] 真正隨機選擇路徑種子 (0~7) ===
# 8 條路線：直線路線 0~5（三條橫向＋三條縱向，垂直偏移在 20% 上下限內）
#           斜線路線 6~7（從角落內縮 20% 起飛，避免玩家感覺困在邊界）
# 上下限計算原則：各軸範圍 × 20% = 內縮量，確保起始點不在邊界 20% 死角區
execute store result score #path_seed br_sys run random value 1..7

# === [2] 先傳送玩家至空投起始點（強制載入遠距地圖的 Chunk）===
# 等待區附近的 Chunk 雖已載入，但空投機起始座標可能超出玩家渲染距離。
# 必須先 TP 玩家到起始點，伺服器才會載入該 Chunk，後續 summon marker 才能成功。

# --- 地圖一: X:-400~400, Z:-400~400（各軸 800 格，20% = 160，上下限 -240~240）---
# 直線種子 0~2: +X 方向，垂直偏移 Z ∈ {-240, 0, 240}
# 直線種子 3~5: +Z 方向，垂直偏移 X ∈ {-240, 0, 240}
# 斜線種子 6~7: 從角落內縮 160 格起飛（-400 → -240），計時縮短至 960 Ticks
execute if score #global br_map matches 1 if score #path_seed br_sys matches 0 run summon marker -400 250 -240 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 1 run summon marker -400 250 0 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 2 run summon marker -400 250 240 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 3 run summon marker -240 250 -400 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 4 run summon marker 0 250 -400 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 5 run summon marker 240 250 -400 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 6 run summon marker -240 250 -240 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 1 if score #path_seed br_sys matches 7 run summon marker 240 250 -240 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖二: X:-5600~-5000, Z:0~600（各軸 600 格，20% = 120，Z 上下限 120~480, X 上下限 -5480~-5120）---
execute if score #global br_map matches 2 if score #path_seed br_sys matches 0 run summon marker -5600 250 120 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 1 run summon marker -5600 250 300 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 2 run summon marker -5600 250 480 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 3 run summon marker -5480 250 0 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 4 run summon marker -5300 250 0 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 5 run summon marker -5120 250 0 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 6 run summon marker -5480 250 120 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 2 if score #path_seed br_sys matches 7 run summon marker -5480 250 480 {Tags:["br_dropship","br_dir_pxnz"]}

# --- 地圖三: X:-750~350, Z:4500~5500（X 軸 1100 格 20%=220 → -530~130；Z 軸 1000 格 20%=200 → 4700~5300）---
execute if score #global br_map matches 3 if score #path_seed br_sys matches 0 run summon marker -750 250 4700 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 1 run summon marker -750 250 5000 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 2 run summon marker -750 250 5300 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 3 run summon marker -530 250 4500 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 4 run summon marker -200 250 4500 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 5 run summon marker 130 250 4500 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 6 run summon marker -530 250 4700 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 3 if score #path_seed br_sys matches 7 run summon marker 130 250 4700 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖四: X:4700~5300, Z:-300~300（各軸 600 格，20% = 120，X 上下限 4820~5180, Z 上下限 -180~180）---
execute if score #global br_map matches 4 if score #path_seed br_sys matches 0 run summon marker 4700 250 -180 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 1 run summon marker 4700 250 0 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 2 run summon marker 4700 250 180 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 3 run summon marker 4820 250 -300 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 4 run summon marker 5000 250 -300 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 5 run summon marker 5180 250 -300 {Tags:["br_dropship","br_dir_pz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 6 run summon marker 4820 250 -180 {Tags:["br_dropship","br_dir_pxpz"]}
execute if score #global br_map matches 4 if score #path_seed br_sys matches 7 run summon marker 5180 250 -180 {Tags:["br_dropship","br_dir_nxpz"]}

# --- 地圖五: X:-250~250, Z:-4700~-5300（X 軸 500 格 20%=100 → -150~150；Z 軸 600 格 20%=120 → -4820~-5180）---
execute if score #global br_map matches 5 if score #path_seed br_sys matches 0 run summon marker -250 250 -4820 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 1 run summon marker -250 250 -5000 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 2 run summon marker -250 250 -5180 {Tags:["br_dropship","br_dir_px"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 3 run summon marker -150 250 -4700 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 4 run summon marker 0 250 -4700 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 5 run summon marker 150 250 -4700 {Tags:["br_dropship","br_dir_nz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 6 run summon marker -150 250 -4820 {Tags:["br_dropship","br_dir_pxnz"]}
execute if score #global br_map matches 5 if score #path_seed br_sys matches 7 run summon marker 150 250 -4820 {Tags:["br_dropship","br_dir_nxnz"]}


# === [2.5] 強制載入空投起始點的 Chunk ===
execute if score #global br_map matches 1 if score #path_seed br_sys matches 0 run forceload add -400 -240
execute if score #global br_map matches 1 if score #path_seed br_sys matches 1 run forceload add -400 0
execute if score #global br_map matches 1 if score #path_seed br_sys matches 2 run forceload add -400 240
execute if score #global br_map matches 1 if score #path_seed br_sys matches 3 run forceload add -240 -400
execute if score #global br_map matches 1 if score #path_seed br_sys matches 4 run forceload add 0 -400
execute if score #global br_map matches 1 if score #path_seed br_sys matches 5 run forceload add 240 -400
execute if score #global br_map matches 1 if score #path_seed br_sys matches 6 run forceload add -240 -240
execute if score #global br_map matches 1 if score #path_seed br_sys matches 7 run forceload add 240 -240

execute if score #global br_map matches 2 if score #path_seed br_sys matches 0 run forceload add -5600 120
execute if score #global br_map matches 2 if score #path_seed br_sys matches 1 run forceload add -5600 300
execute if score #global br_map matches 2 if score #path_seed br_sys matches 2 run forceload add -5600 480
execute if score #global br_map matches 2 if score #path_seed br_sys matches 3 run forceload add -5480 0
execute if score #global br_map matches 2 if score #path_seed br_sys matches 4 run forceload add -5300 0
execute if score #global br_map matches 2 if score #path_seed br_sys matches 5 run forceload add -5120 0
execute if score #global br_map matches 2 if score #path_seed br_sys matches 6 run forceload add -5480 120
execute if score #global br_map matches 2 if score #path_seed br_sys matches 7 run forceload add -5480 480

execute if score #global br_map matches 3 if score #path_seed br_sys matches 0 run forceload add -750 4700
execute if score #global br_map matches 3 if score #path_seed br_sys matches 1 run forceload add -750 5000
execute if score #global br_map matches 3 if score #path_seed br_sys matches 2 run forceload add -750 5300
execute if score #global br_map matches 3 if score #path_seed br_sys matches 3 run forceload add -530 4500
execute if score #global br_map matches 3 if score #path_seed br_sys matches 4 run forceload add -200 4500
execute if score #global br_map matches 3 if score #path_seed br_sys matches 5 run forceload add 130 4500
execute if score #global br_map matches 3 if score #path_seed br_sys matches 6 run forceload add -530 4700
execute if score #global br_map matches 3 if score #path_seed br_sys matches 7 run forceload add 130 4700

execute if score #global br_map matches 4 if score #path_seed br_sys matches 0 run forceload add 4700 -180
execute if score #global br_map matches 4 if score #path_seed br_sys matches 1 run forceload add 4700 0
execute if score #global br_map matches 4 if score #path_seed br_sys matches 2 run forceload add 4700 180
execute if score #global br_map matches 4 if score #path_seed br_sys matches 3 run forceload add 4820 -300
execute if score #global br_map matches 4 if score #path_seed br_sys matches 4 run forceload add 5000 -300
execute if score #global br_map matches 4 if score #path_seed br_sys matches 5 run forceload add 5180 -300
execute if score #global br_map matches 4 if score #path_seed br_sys matches 6 run forceload add 4820 -180
execute if score #global br_map matches 4 if score #path_seed br_sys matches 7 run forceload add 5180 -180

execute if score #global br_map matches 5 if score #path_seed br_sys matches 0 run forceload add -250 -4820
execute if score #global br_map matches 5 if score #path_seed br_sys matches 1 run forceload add -250 -5000
execute if score #global br_map matches 5 if score #path_seed br_sys matches 2 run forceload add -250 -5180
execute if score #global br_map matches 5 if score #path_seed br_sys matches 3 run forceload add -150 -4700
execute if score #global br_map matches 5 if score #path_seed br_sys matches 4 run forceload add 0 -4700
execute if score #global br_map matches 5 if score #path_seed br_sys matches 5 run forceload add 150 -4700
execute if score #global br_map matches 5 if score #path_seed br_sys matches 6 run forceload add -150 -4820
execute if score #global br_map matches 5 if score #path_seed br_sys matches 7 run forceload add 150 -4820

# === [2.9] 先設定部署計時器（必須在 schedule 之前，否則 deploy_tick 會立刻判定結束）===
execute if score #path_seed br_sys matches 0..5 run scoreboard players set #deploy_ticks br_sys 1200
execute if score #path_seed br_sys matches 6..7 run scoreboard players set #deploy_ticks br_sys 960

# === [3] 延遲 10 tick 後生成 Dropship ===
schedule function game_core:system/br_deploy_summon 10t



# === [4] 起飛廣播與音效 ===
tellraw @a ["",{"text":"[大逃殺] 空投機已起飛！","color":"gold"},{"text":"蹲下","color":"red","bold":true},{"text":"即可跳出，祝各位好運！","color":"gold"}]
execute as @a at @s run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1 1.5
