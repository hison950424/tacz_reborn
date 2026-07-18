# ==========================================
# 檔案: gamemode/dom_main_tick.mcfunction
# ==========================================
# 執行防堵機制 (防蹲點)
function game_core:gamemode/dom/anti_camp

# 1. 遊戲計時器 (每 Tick 增加)
scoreboard players add #global dom_timer 1
scoreboard players add #100tick dom_timer 1

# 2. 滿秒觸發 (20 Tick)
execute if score #global dom_timer matches 20.. run scoreboard players add #global dom_arms_timer 1
execute if score #global dom_timer matches 20.. run function game_core:gamemode/dom/second_process

# 2.5 防脫逃 + 輪轉：每 tick 距離偵測（附身中距離≈0；按 Shift 脫離後距離 > 2 格觸發）
# spectator_cycle 將索引遞增並附身下一個存活隊友，Shift 自然成為切換鍵
# 全滅後已是自由視角，if entity [tag=dom_alive] 條件不成立，自動跳過
execute if score #dom_phase dom_config matches 1 as @a[team=red,gamemode=spectator,tag=!dom_alive] if entity @a[team=red,tag=dom_alive,limit=1] unless entity @a[team=red,tag=dom_alive,distance=..2] run function game_core:gamemode/dom/spectator_cycle
execute if score #dom_phase dom_config matches 1 as @a[team=blue,gamemode=spectator,tag=!dom_alive] if entity @a[team=blue,tag=dom_alive,limit=1] unless entity @a[team=blue,tag=dom_alive,distance=..2] run function game_core:gamemode/dom/spectator_cycle

# 3. 補品數量上限偵測（隨時，對所有冒險模式隊伍玩家）
execute as @a[team=red,gamemode=adventure] run function game_core:gamemode/dom/limit_potions
execute as @a[team=blue,gamemode=adventure] run function game_core:gamemode/dom/limit_potions

# 4. 點位偵測與邏輯 (請將原本 arms_race_tick 裡面的 A, B, C 點偵測程式碼全數搬移到這裡)
function game_core:gamemode/dom/point_router

# 5. UI 更新
function game_core:gamemode/dom/ui_update

# 6. 計時器歸零
execute if score #global dom_timer matches 20.. run scoreboard players set #global dom_timer 0
execute if score #100tick dom_timer matches 100.. run scoreboard players set #100tick dom_timer 0

#debug
execute as @a[tag=debug] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
tag @a[tag=debug] remove debug