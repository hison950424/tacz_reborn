# ==========================================
# 檔案: gamemode/br_main_tick.mcfunction
# 屬性: 大逃殺主路由 (每 Tick 執行)
# ==========================================

# ==========================================
# --- [全域實體清理防護網] ---
# ==========================================
# 瞬間銷毀所有被玩家丟出、掉在世界上的地圖集實體，徹底杜絕洗頻與伺服器卡頓！
kill @e[type=item,nbt={Item:{id:"map_atlases:atlas"}}]




# --- [A] 重置存活計數器 (供勝利判定使用) ---
# 每 Tick 歸零，交由底下的 player_tick 重新統計，避免 O(N) 效能炸裂
scoreboard players set #br_alive_red br_sys 0
scoreboard players set #br_alive_blue br_sys 0
scoreboard players set #br_alive_green br_sys 0
scoreboard players set #br_alive_white br_sys 0
scoreboard players set #br_alive_solo br_sys 0

# 站立戰力計數器 (排除倒地者)
scoreboard players set #br_stand_red br_sys 0
scoreboard players set #br_stand_blue br_sys 0
scoreboard players set #br_stand_green br_sys 0
scoreboard players set #br_stand_white br_sys 0




# --- [B] Phase 路由分發 ---
# Phase 0 (等待倒數)：10 秒倒數計時，結束後呼叫 br_deploy_start 啟動空投
execute if score #global br_phase matches 0 run function game_core:gamemode/br_countdown_tick

# Phase 1 (空投部署)：執行空投機移動、跟隨、著陸偵測等邏輯
execute if score #global br_phase matches 1 run function game_core:gamemode/br_deploy_tick

# Phase 1 & 2 (共通邏輯)：執行玩家生死判定、救援、旁觀切換等完整邏輯
# 先清除所有村民上一 Tick 的救援標記，保證所有玩家看到的狀態同步
execute if score #global br_phase matches 1..2 as @e[type=villager,tag=br_downed_mob] run tag @s remove being_revived

execute if score #global br_phase matches 1..2 as @a at @s run function game_core:gamemode/br_player_tick
execute if score #global br_phase matches 1..2 as @e[type=villager,tag=br_downed_mob] at @s run function game_core:gamemode/br_downed_tick

# 重置全體玩家的蹲下時間，確保只有「持續按住」才會增加
scoreboard players set @a sneak_time 0




# --- [C] 全域計時器 ---
# 維持 20 Ticks = 1 秒的循環，供祭壇、流血等系統使用
scoreboard players add #global br_timer 1


# ==========================================
# --- 靈魂標籤 ---
# ==========================================
# 執行靈魂標籤的視覺特效
execute if score #global br_phase matches 1..2 if score #global br_timer matches 20 as @e[type=marker,tag=br_soul_marker] at @s run function game_core:gamemode/br_soul_tick
#靈魂祭壇
execute as @e[type=text_display,tag=br_altar] run function game_core:gamemode/br_altar_tick


# ==========================================
# --- 背包系統 ---10tick一次
# ==========================================
# ====== 背包系統：升級與防護 ======
# 偵測背包內是否有對應的潛影盒，並執行升級解鎖
execute if score #global br_timer matches 10 as @a if data entity @s {Inventory:[{tag:{tag:{backpack_3:1b}}}]} if score @s backpack_level matches ..2 at @s run function game_core:backpack/upgrade_3
execute if score #global br_timer matches 10 as @a if data entity @s {Inventory:[{tag:{tag:{backpack_2:1b}}}]} if score @s backpack_level matches ..1 at @s run function game_core:backpack/upgrade_2
execute if score #global br_timer matches 10 as @a if data entity @s {Inventory:[{tag:{tag:{backpack_1:1b}}}]} if score @s backpack_level matches ..0 at @s run function game_core:backpack/upgrade_1

# 執行背包系統防護網，把硬塞進鎖定格的非法物品吐回地上
execute if score #global br_timer matches 10 run function game_core:backpack/protect_slots
# ====== 背包系統：升級與防護 ======
# 偵測背包內是否有對應的潛影盒，並執行升級解鎖
execute if score #global br_timer matches 20 as @a if data entity @s {Inventory:[{tag:{tag:{backpack_3:1b}}}]} if score @s backpack_level matches ..2 at @s run function game_core:backpack/upgrade_3
execute if score #global br_timer matches 20 as @a if data entity @s {Inventory:[{tag:{tag:{backpack_2:1b}}}]} if score @s backpack_level matches ..1 at @s run function game_core:backpack/upgrade_2
execute if score #global br_timer matches 20 as @a if data entity @s {Inventory:[{tag:{tag:{backpack_1:1b}}}]} if score @s backpack_level matches ..0 at @s run function game_core:backpack/upgrade_1

# 執行背包系統防護網，把硬塞進鎖定格的非法物品吐回地上
execute if score #global br_timer matches 20 run function game_core:backpack/protect_slots


execute if score #global br_timer matches 20.. run scoreboard players set #global br_timer 0



# ==========================================
# --- [D] 隊伍滅團與靈魂清空系統 ---
# ==========================================
# 1. 【滅團核心判定】只要隊伍中「狀態 1」人數為 0，強制將所有「狀態 2 與 3」轉入「狀態 4」！
execute if score #global br_phase matches 2 if score #br_stand_red br_sys matches 0 as @a[team=red,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4
execute if score #global br_phase matches 2 if score #br_stand_blue br_sys matches 0 as @a[team=blue,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4
execute if score #global br_phase matches 2 if score #br_stand_green br_sys matches 0 as @a[team=green,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4
execute if score #global br_phase matches 2 if score #br_stand_white br_sys matches 0 as @a[team=white,scores={br_death_state=2..3}] run function game_core:gamemode/br_force_state4

# 2. 【靈魂大掃除】(防呆機制)
execute if score #global br_phase matches 2 if score #br_alive_red br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=1}]
execute if score #global br_phase matches 2 if score #br_alive_blue br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=2}]
execute if score #global br_phase matches 2 if score #br_alive_green br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=3}]
execute if score #global br_phase matches 2 if score #br_alive_white br_sys matches 0 run kill @e[type=marker,tag=br_soul_marker,scores={team_id=4}]



# ==========================================
# 縮圈階段 只在遊戲進行中運作（phase 0 以上） 需要在整個的tick最後執行 因為有return
# ==========================================
execute if score #br_phase dummy matches ..-1 run return 0

# ── tick20 計數 ──
scoreboard players add #br_tick20 dummy 1
execute if score #br_tick20 dummy matches 20.. run scoreboard players set #br_tick20 dummy 0

# ── 計時器 ──
scoreboard players remove #br_timer dummy 1

# ── 階段切換 ──
execute if score #br_phase dummy matches 0 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase1_start
execute if score #br_phase dummy matches 1 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase2_start
execute if score #br_phase dummy matches 2 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase3_start
execute if score #br_phase dummy matches 3 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase4_start
execute if score #br_phase dummy matches 4 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase5_start
execute if score #br_phase dummy matches 5 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase6_start
execute if score #br_phase dummy matches 6 if score #br_timer dummy matches ..0 run function game_core:gamemode/br_phase7_start

#公告
execute if score #br_phase dummy matches 0 if score #br_timer dummy matches 1200 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 1 分鐘後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 0 if score #br_timer dummy matches 600 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 30 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 0 if score #br_timer dummy matches 200 run tellraw @a ["",{"text":"[縮圈] ","color":"red"},{"text":"10 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 2 if score #br_timer dummy matches 1200 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 1 分鐘後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 2 if score #br_timer dummy matches 600 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 30 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 2 if score #br_timer dummy matches 200 run tellraw @a ["",{"text":"[縮圈] ","color":"red"},{"text":"10 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 4 if score #br_timer dummy matches 1200 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 1 分鐘後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 4 if score #br_timer dummy matches 600 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 30 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 4 if score #br_timer dummy matches 200 run tellraw @a ["",{"text":"[縮圈] ","color":"red"},{"text":"10 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 6 if score #br_timer dummy matches 1200 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 1 分鐘後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 6 if score #br_timer dummy matches 600 run tellraw @a ["",{"text":"[縮圈] ","color":"aqua"},{"text":" 30 秒後縮圈。","color":"white"}]
execute if score #br_phase dummy matches 6 if score #br_timer dummy matches 200 run tellraw @a ["",{"text":"[縮圈] ","color":"red"},{"text":"10 秒後縮圈。","color":"white"}]
# ══════════════════════════════════════════
# center marker 平滑移動（縮圈期 phase 1,3,5）
# ══════════════════════════════════════════

# 毫格座標 += 步進
execute if score #br_phase dummy matches 1 run scoreboard players operation #br_cxm dummy += #br_sx dummy
execute if score #br_phase dummy matches 1 run scoreboard players operation #br_czm dummy += #br_sz dummy
execute if score #br_phase dummy matches 3 run scoreboard players operation #br_cxm dummy += #br_sx dummy
execute if score #br_phase dummy matches 3 run scoreboard players operation #br_czm dummy += #br_sz dummy
execute if score #br_phase dummy matches 5 run scoreboard players operation #br_cxm dummy += #br_sx dummy
execute if score #br_phase dummy matches 5 run scoreboard players operation #br_czm dummy += #br_sz dummy

# 寫入 marker Pos（×0.001 還原真實座標）
execute if score #br_phase dummy matches 1 run execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 0.001 run scoreboard players get #br_cxm dummy
execute if score #br_phase dummy matches 1 run execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 0.001 run scoreboard players get #br_czm dummy
execute if score #br_phase dummy matches 3 run execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 0.001 run scoreboard players get #br_cxm dummy
execute if score #br_phase dummy matches 3 run execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 0.001 run scoreboard players get #br_czm dummy
execute if score #br_phase dummy matches 5 run execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] double 0.001 run scoreboard players get #br_cxm dummy
execute if score #br_phase dummy matches 5 run execute store result entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] double 0.001 run scoreboard players get #br_czm dummy

# 縮圈期同步更新整數 br_cx/cz（供 calc_distance 比較用）
execute if score #br_phase dummy matches 1 run execute store result score #br_cx dummy run data get entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] 1
execute if score #br_phase dummy matches 1 run execute store result score #br_cz dummy run data get entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] 1
execute if score #br_phase dummy matches 3 run execute store result score #br_cx dummy run data get entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] 1
execute if score #br_phase dummy matches 3 run execute store result score #br_cz dummy run data get entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] 1
execute if score #br_phase dummy matches 5 run execute store result score #br_cx dummy run data get entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[0] 1
execute if score #br_phase dummy matches 5 run execute store result score #br_cz dummy run data get entity @e[type=minecraft:marker,tag=br_center,limit=1] Pos[2] 1

# 所有 active phase：維持 worldborder center
execute if score #br_phase dummy matches 0.. at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

# ══════════════════════════════════════════
# 空頭落地偵測
# ══════════════════════════════════════════

# delay 計數（-1 代表無空投在途中）
execute if score #br_airdrop_delay dummy matches 0.. run scoreboard players add #br_airdrop_delay dummy 1

# delay >= 20 且村民存在時才偵測 OnGround
execute if score #br_airdrop_delay dummy matches 20.. if entity @e[type=minecraft:villager,tag=airdrop_bird] run function game_core:gamemode/br_airdrop_check
