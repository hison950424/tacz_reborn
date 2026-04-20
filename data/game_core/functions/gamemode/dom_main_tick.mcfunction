# ==========================================
# 檔案: gamemode/dom_main_tick.mcfunction
# ==========================================
# 執行防堵機制 (防蹲點)
function game_core:gamemode/dom_anti_camp

# 1. 遊戲計時器 (每 Tick 增加)
scoreboard players add #global dom_timer 1
scoreboard players add #100tick dom_timer 1

# 2. 滿秒觸發 (20 Tick)
execute if score #global dom_timer matches 20.. run scoreboard players add #global dom_arms_timer 1
execute if score #global dom_timer matches 20.. run function game_core:gamemode/dom_second_process

# 3. 點位偵測與邏輯 (請將原本 arms_race_tick 裡面的 A, B, C 點偵測程式碼全數搬移到這裡)
function game_core:gamemode/dom_point_router

# 4. UI 更新
function game_core:gamemode/dom_ui_update

# 5. 計時器歸零
execute if score #global dom_timer matches 20.. run scoreboard players set #global dom_timer 0
execute if score #100tick dom_timer matches 100.. run scoreboard players set #100tick dom_timer 0

#debug
execute as @a[tag=debug] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
tag @a[tag=debug] remove debug