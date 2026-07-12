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

# 3. 補品數量上限偵測（隨時，對所有冒險模式隊伍玩家）
execute as @a[team=red,gamemode=adventure] run function game_core:gamemode/dom/limit_potions
execute as @a[team=blue,gamemode=adventure] run function game_core:gamemode/dom/limit_potions

# 4. 死亡偵測（phase 1 存活玩家）
execute if score #dom_phase dom_config matches 1 as @a[tag=dom_alive] if score @s vanilla_death > @s death_prev run function game_core:gamemode/dom/on_death

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