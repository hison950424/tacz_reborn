# ==========================================
# 檔案: player/main_tick.mcfunction
# 執行者: @s (每個玩家每 Tick 僅執行一次)
# ==========================================

#debug
execute if score @s gd656killicon.kill matches 6 if score @s kill_prev matches 0 run function game_core:gamemode/arms_race_score_debug
execute if score @s gd656killicon.death matches 6 if score @s death_prev matches 0 run function game_core:gamemode/arms_race_score_debug


# --- 1. 雜項清理 ---
clear @s tacz:ammo
clear @s glass_bottle

# --- 2. 基地空間偵測 (無效能損耗版) ---
scoreboard players set @s in_base_score 0

# 紅隊基地
execute if entity @s[team=red] at @e[type=marker,tag=red_spawn,limit=1] positioned ~-9 ~-1 ~-9 if entity @s[dx=17,dy=4,dz=17] run scoreboard players set @s in_base_score 1
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run scoreboard players enable @s base_menu
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run give @s written_book{title:"主選單",author:"系統",pages:['{"text":"=== 紅隊行動基地 ===\\n\\n請選擇您的行動：\\n\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"[ 🔄 前往更換職業 ]\\n\\n\\n\\n\\n\\n\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger base_menu set 2"}},{"text":"[ ⚠︎ debug ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/function game_core:gamemode/arms_race_debug"}}]}']} 1
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.8
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run tag @s add in_base
execute if entity @s[team=red,tag=in_base] if score @s in_base_score matches 1 run effect give @s minecraft:instant_health 1 0
execute if entity @s[team=red,tag=in_base] if score @s in_base_score matches 0 run clear @s written_book{title:"主選單"}
execute if entity @s[team=red,tag=in_base] if score @s in_base_score matches 0 run tag @s remove in_base

# 藍隊基地
execute if entity @s[team=blue] at @e[type=marker,tag=blue_spawn,limit=1] positioned ~-9 ~-1 ~-9 if entity @s[dx=17,dy=4,dz=17] run scoreboard players set @s in_base_score 1
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run scoreboard players enable @s base_menu
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run give @s written_book{title:"主選單",author:"系統",pages:['{"text":"=== 藍隊行動基地 ===\\n\\n請選擇您的行動：\\n\\n\\n","color":"dark_blue","bold":true,"extra":[{"text":"[ 🔄 前往更換職業 ]\\n\\n\\n\\n\\n\\n\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger base_menu set 2"}},{"text":"[ ⚠︎ debug ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/function game_core:gamemode/arms_race_debug"}}]}']} 1
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.8
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run tag @s add in_base
execute if entity @s[team=blue,tag=in_base] if score @s in_base_score matches 1 run effect give @s minecraft:instant_health 1 0
execute if entity @s[team=blue,tag=in_base] if score @s in_base_score matches 0 run clear @s written_book{title:"主選單"}
execute if entity @s[team=blue,tag=in_base] if score @s in_base_score matches 0 run tag @s remove in_base


# --- 3. 死亡與重生緩衝 ---
execute if score @s gd656killicon.death matches 0 as @s run scoreboard players set @s death_prev 0
execute if score @s gd656killicon.death > @s death_prev run scoreboard players set @s respawn_timer 5
execute if score @s gd656killicon.death > @s death_prev run scoreboard players operation @s death_prev = @s gd656killicon.death
execute if score @s respawn_timer matches 1.. run scoreboard players remove @s respawn_timer 1

execute if score @s respawn_timer matches 0 if score @s p_health matches 20.. run function game_core:class/apply_class
execute if score @s respawn_timer matches 0 if score @s p_health matches 20.. run effect give @s minecraft:instant_health 3 50 true
execute if score @s respawn_timer matches 0 if score @s p_health matches 20.. run function game_core:class/reset_throwables
execute if score @s respawn_timer matches 0 if score @s p_health matches 20.. run function game_core:gamemode/tdm_on_death
execute if score @s respawn_timer matches 0 run scoreboard players set @s respawn_timer -1


# --- 4. 兵種被動與狀態維持 ---
execute if score @s class_type matches 2 run effect give @s minecraft:speed 2 1 true
execute if score @s class_type matches 4 run effect give @s minecraft:slowness 2 1 true
execute if score @s class_type matches 4 if score @s sneak_tracker matches 1.. run effect give @s minecraft:resistance 1 0 true
execute if score @s class_type matches 4 run scoreboard players set @s sneak_tracker 0


# --- 5. 擊殺與助攻 ---
execute if score @s gd656killicon.kill > @s kill_prev run function game_core:class/reset_throwables
execute if score @s gd656killicon.kill > @s kill_prev run title @s actionbar {"text":"擊殺確認！投擲物已重置","color":"gold"}
execute if score #global arms_sub_mode matches 1 if score @s gd656killicon.kill > @s kill_prev run function game_core:gamemode/tdm_score_update
execute if score @s gd656killicon.kill > @s kill_prev run scoreboard players operation @s kill_prev = @s gd656killicon.kill

execute if score @s gd656killicon.assist > @s assist_prev run function game_core:class/reset_throwables
execute if score @s gd656killicon.assist > @s assist_prev run title @s actionbar {"text":"助攻確認！投擲物已重置","color":"yellow"}
execute if score @s gd656killicon.assist > @s assist_prev run scoreboard players operation @s assist_prev = @s gd656killicon.assist


# --- 6. 負重系統 ---
execute store result score @s gun_count run clear @s tacz:modern_kinetic_gun 0
execute if score @s gun_count matches 3.. run effect give @s slowness 1 3 true
execute if score @s gun_count matches 3.. run effect give @s jump_boost 1 200 true
execute if score @s gun_count matches 3.. run title @s actionbar {"text":"⚠️ 負重過高！請丟棄多餘的槍枝！","color":"red","bold":true}


# --- 7. UI 與商店按鈕防呆 ---
execute if score @s shop_buy matches 1.. at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute if score @s shop_buy matches 1.. run scoreboard players set @s shop_buy 0

# 執行商店防護
execute if score @s in_base_score matches 1 run function game_core:shop/master_switch