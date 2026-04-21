# ==========================================
# 檔案: gamemode/br_deploy_tick.mcfunction
# 每 Tick 執行：空投部署階段 (br_phase = 1) 的全域邏輯
# 由 br_main_tick 在 phase 1 期間呼叫
# ==========================================

# --- [0] 開局保護期 (Phase 1 期間全體無敵) ---
# 給予等級 10 的抗性 (完全免疫所有傷害)，時間 2 秒，隱藏粒子。
# 因為這支檔案每 Tick 都會跑，所以這個效果會一直維持，直到 Phase 1 結束。
effect give @a minecraft:resistance 2 10 true


# --- [A] 空投機移動（速度依地圖各軸距離計算，所有地圖統一 60 秒 = 1200 Ticks）---
# 速度公式：各軸路徑距離（格）÷ 1200 Ticks
# 地圖一: X=Z=800格 → 0.666667/tick（各軸相同）
# 地圖二: X=Z=600格 → 0.5/tick（各軸相同）
# 地圖三: X=1100格→0.916667/tick，Z=1000格→0.833333/tick（X、Z 跨度不同）
# 地圖四: X=Z=600格 → 0.5/tick（各軸相同）
# 地圖五: X=500格→0.416667/tick，Z=600格→0.5/tick（X、Z 跨度不同）

execute if score #global br_map matches 1 as @e[type=marker,tag=br_dropship,tag=br_dir_px] at @s run tp @s ~0.666667 ~ ~
execute if score #global br_map matches 1 as @e[type=marker,tag=br_dropship,tag=br_dir_pz] at @s run tp @s ~ ~ ~0.666667
execute if score #global br_map matches 1 as @e[type=marker,tag=br_dropship,tag=br_dir_pxpz] at @s run tp @s ~0.666667 ~ ~0.666667
execute if score #global br_map matches 1 as @e[type=marker,tag=br_dropship,tag=br_dir_nxpz] at @s run tp @s ~-0.666667 ~ ~0.666667

execute if score #global br_map matches 2 as @e[type=marker,tag=br_dropship,tag=br_dir_px] at @s run tp @s ~0.5 ~ ~
execute if score #global br_map matches 2 as @e[type=marker,tag=br_dropship,tag=br_dir_pz] at @s run tp @s ~ ~ ~0.5
execute if score #global br_map matches 2 as @e[type=marker,tag=br_dropship,tag=br_dir_pxpz] at @s run tp @s ~0.5 ~ ~0.5
execute if score #global br_map matches 2 as @e[type=marker,tag=br_dropship,tag=br_dir_pxnz] at @s run tp @s ~0.5 ~ ~-0.5

execute if score #global br_map matches 3 as @e[type=marker,tag=br_dropship,tag=br_dir_px] at @s run tp @s ~0.916667 ~ ~
execute if score #global br_map matches 3 as @e[type=marker,tag=br_dropship,tag=br_dir_pz] at @s run tp @s ~ ~ ~0.833333
execute if score #global br_map matches 3 as @e[type=marker,tag=br_dropship,tag=br_dir_pxpz] at @s run tp @s ~0.916667 ~ ~0.833333
execute if score #global br_map matches 3 as @e[type=marker,tag=br_dropship,tag=br_dir_nxpz] at @s run tp @s ~-0.916667 ~ ~0.833333

execute if score #global br_map matches 4 as @e[type=marker,tag=br_dropship,tag=br_dir_px] at @s run tp @s ~0.5 ~ ~
execute if score #global br_map matches 4 as @e[type=marker,tag=br_dropship,tag=br_dir_pz] at @s run tp @s ~ ~ ~0.5
execute if score #global br_map matches 4 as @e[type=marker,tag=br_dropship,tag=br_dir_pxpz] at @s run tp @s ~0.5 ~ ~0.5
execute if score #global br_map matches 4 as @e[type=marker,tag=br_dropship,tag=br_dir_nxpz] at @s run tp @s ~-0.5 ~ ~0.5

execute if score #global br_map matches 5 as @e[type=marker,tag=br_dropship,tag=br_dir_px] at @s run tp @s ~0.416667 ~ ~
execute if score #global br_map matches 5 as @e[type=marker,tag=br_dropship,tag=br_dir_nz] at @s run tp @s ~ ~ ~-0.5
execute if score #global br_map matches 5 as @e[type=marker,tag=br_dropship,tag=br_dir_pxnz] at @s run tp @s ~0.416667 ~ ~-0.5
execute if score #global br_map matches 5 as @e[type=marker,tag=br_dropship,tag=br_dir_nxnz] at @s run tp @s ~-0.416667 ~ ~-0.5

# --- [B] 玩家跟隨空投機 ---
# 將仍在機上的玩家 TP 至 Dropship 當前位置（[A] 已移動後的新位置）
# 使用 Slow Falling 取代 Levitation：Levitation 會讓玩家往上飄，Slow Falling 只減緩下落，視覺合理
execute if entity @e[type=marker,tag=br_dropship] as @a[tag=br_on_cart] at @e[type=marker,tag=br_dropship,limit=1] run tp @s ~ ~ ~
execute as @a[tag=br_on_cart] run effect give @s minecraft:slow_falling 2 0 true
execute as @a[tag=br_on_cart] run effect give @s minecraft:invisibility 1 0 true


# --- [C] 蹲下偵測：玩家按下蹲下鍵跳出空投機 ---
# sneak_time 已在 br_deploy_start 重置為 0（倒數結束瞬間），此處 ≥1 代表飛行中首次蹲下
execute as @a[tag=br_on_cart,scores={sneak_time=1..}] run function game_core:gamemode/br_on_jumped

# --- [E] 部署計時器倒數 ---
scoreboard players remove #deploy_ticks br_sys 1

# --- [F] 計時器歸零：空投機到達地圖邊界 ---
# 1. 【專屬警告】只針對「還在飛機上」的玩家發送強制跳傘訊息
execute if score #deploy_ticks br_sys matches ..0 run tellraw @a[tag=br_on_cart] {"text":"[系統] 空投機已離開地圖！所有未跳出的玩家強制跳傘！","color":"red"}

# 2. 【強制踢出】讓剩餘在飛機上的玩家執行跳傘程序
execute if score #deploy_ticks br_sys matches ..0 as @a[tag=br_on_cart] run function game_core:gamemode/br_on_jumped

# 3. 銷毀空投機 Marker
execute if score #deploy_ticks br_sys matches ..0 run kill @e[type=marker,tag=br_dropship]

# 4. 【解除保護】拔除全體玩家的無敵狀態
execute if score #deploy_ticks br_sys matches ..0 run effect clear @a minecraft:resistance

# 5. 【全服公告】霸氣宣布戰鬥開始
execute if score #deploy_ticks br_sys matches ..0 run tellraw @a {"text":"⚔ 戰鬥開始 ⚔","color":"dark_red","bold":true}
execute if score #deploy_ticks br_sys matches ..0 run tellraw @a {"text":"[大逃殺] 空投階段已結束，全體無敵保護解除！","color":"gold"}

# 6. 【核心切換】正式進入 Phase 2 戰鬥階段！
# 這一行執行後，下一個 Tick 系統就不會再跑這支檔案了。
execute if score #deploy_ticks br_sys matches ..0 run scoreboard players set #global br_phase 2

