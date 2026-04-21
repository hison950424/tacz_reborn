# ==========================================
# 檔案: system/start_battle_royale.mcfunction
# 目的: 大逃殺遊戲初始化，TP 玩家至等待區並啟動 5 秒倒數
# 空投機起飛邏輯已移至 system/br_deploy_start（由倒數結束後觸發）
# ==========================================

#會噴裝
gamerule keepInventory false
# === [0] 完整狀態清理 (鐵律 #6：無痕清理) ===
# 拔除所有 BR 相關 Tags，確保不殘留上一局垃圾
tag @a remove br_setup
tag @a remove br_deploying
tag @a remove br_on_cart
tag @a remove br_jumped
tag @a remove br_downed
tag @a remove has_slime
tag @a remove br_eliminated
tag @a remove br_used_altar
# 清除所有 BR 相關實體
kill @e[type=marker,tag=br_tracker]
kill @e[type=marker,tag=br_soul_marker]
kill @e[type=villager,tag=br_downed_mob]
kill @e[type=marker,tag=br_dropship]
kill @e[type=corpse:corpse]
# 清除計分板殘留數值
scoreboard players set #global_id br_sys 0
scoreboard players set #global br_timer 0
scoreboard players reset @a br_id
scoreboard players reset @a team_id
scoreboard players set @a vanilla_death 0
scoreboard players set @a death_prev 0
scoreboard players set @a revive_progress 0
scoreboard players set @a kill_prev 0
# 重置 GD656 模組的底層分數 (金錢) 為 1 
gd656killicon server statistics set score @a 0
gd656killicon server statistics set assist @a 0
gd656killicon server statistics set death @a 0
gd656killicon server statistics set kill @a 0
# 重置minecraft內建與GD656同步的分數與計時器
scoreboard players set @a gd656killicon.score 0
scoreboard players set @a gd656killicon.assist 0
scoreboard players set @a gd656killicon.death 0
scoreboard players set @a gd656killicon.kill 0

# === [1] 切換狀態機 ===
# game_state = 1 代表 br_main_tick 接管
# br_phase = 0：等待倒數階段，5 秒後由 br_deploy_start 切換至 Phase 1（空投）
scoreboard players set #global game_state 1
scoreboard players set #global br_phase 0
# 設定 5 秒倒數計時器（100 Ticks），br_countdown_tick 每 Tick 遞減
scoreboard players set #br_countdown br_sys 200

# === [2] 玩家基礎初始化 ===
gamemode adventure @a
execute as @a run attribute @s minecraft:generic.max_health base set 100
effect give @a minecraft:instant_health 3 50 true
# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true
# 大逃殺從零開始，強制清空背包
clear @a

# === [3] 標記為「部署中」===
# 重置蹲下計時：sneak_time 是累積計分板，不重置會讓遊戲開局第一 Tick 就誤觸跳機偵測
scoreboard players set @a sneak_time 0
# br_deploying：整個空投階段（在機上 + 跳傘滑翔中），落地後才移除
# br_on_cart：還在空投機上，尚未跳出
tag @a add br_deploying
tag @a add br_on_cart



# === [5] 傳送玩家至各地圖開局等待區 ===
# 等待區是玩家站立、觀看倒數的安全區域
# 注意：空投機真正的起始點 Chunk 載入留待倒數結束後的 br_deploy_start 負責
execute if score #global br_map matches 1 run tp @a -3 51 0
execute if score #global br_map matches 2 run tp @a -5306 -5 308
execute if score #global br_map matches 3 run tp @a 5 1 5037
execute if score #global br_map matches 4 run tp @a 5001 112 5
execute if score #global br_map matches 5 run tp @a 65 245 -5177
execute if score #global br_map matches 1 run spawnpoint @a -3 51 0
execute if score #global br_map matches 2 run spawnpoint @a -5306 -5 308
execute if score #global br_map matches 3 run spawnpoint @a 5 1 5037
execute if score #global br_map matches 4 run spawnpoint @a 5001 112 5
execute if score #global br_map matches 5 run spawnpoint @a 65 245 -5177

# === [6] 廣播開局訊息 ===
tellraw @a {"text":"[大逃殺] 準備就緒！空投機將在 10 秒後起飛！","color":"gold","bold":true}
