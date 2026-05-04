# ==========================================
# 檔案: player/main_tick.mcfunction
# 執行者: @s (每個玩家每 Tick 僅執行一次)
# ==========================================

#debug
scoreboard players add #arms_race_score_debug dummy 1
execute if score #arms_race_score_debug dummy matches 22.. run scoreboard players set #arms_race_score_debug dummy 21
execute if score #arms_race_score_debug dummy matches 0..20 as @s run function game_core:gamemode/arms_race_score_debug

# --- 1. 雜項清理 ---
clear @s tacz:ammo
clear @s glass_bottle

# --- 2. 基地空間偵測 (無效能損耗版) ---
scoreboard players set @s in_base_score 0

# 紅隊基地
execute if entity @s[team=red] at @e[type=marker,tag=red_spawn,limit=1] positioned ~-9 ~-1 ~-9 if entity @s[dx=17,dy=4,dz=17] run scoreboard players set @s in_base_score 1
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run scoreboard players enable @s base_menu
# 開啟轉帳選單權限
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run scoreboard players enable @s transfer_menu
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run give @s written_book{title:"主選單",author:"系統",pages:['{"text":"=== 紅隊行動基地 ===\\n\\n請選擇您的行動：\\n\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"[ 🔄 前往更換職業 ]\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger base_menu set 2"}},{"text":"[ 💸 開啟轉帳系統 ]\\n\\n\\n\\n\\n\\n","color":"gold","bold":false,"clickEvent":{"action":"run_command","value":"/trigger transfer_menu set 1"}},{"text":"[ ⚠︎ debug ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/function game_core:gamemode/arms_race_debug"}}]}']} 1
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.8
execute if entity @s[team=red,tag=!in_base] if score @s in_base_score matches 1 run tag @s add in_base
execute if entity @s[team=red,tag=in_base] if score @s in_base_score matches 1 run effect give @s minecraft:instant_health 1 0
execute if entity @s[team=red,tag=in_base] if score @s in_base_score matches 0 run clear @s written_book{title:"主選單"}
execute if entity @s[team=red,tag=in_base] if score @s in_base_score matches 0 run tag @s remove in_base



# 藍隊基地
execute if entity @s[team=blue] at @e[type=marker,tag=blue_spawn,limit=1] positioned ~-9 ~-1 ~-9 if entity @s[dx=17,dy=4,dz=17] run scoreboard players set @s in_base_score 1
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run scoreboard players enable @s base_menu
# 開啟轉帳選單權限
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run scoreboard players enable @s transfer_menu
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run give @s written_book{title:"主選單",author:"系統",pages:['{"text":"=== 藍隊行動基地 ===\\n\\n請選擇您的行動：\\n\\n\\n","color":"dark_blue","bold":true,"extra":[{"text":"[ 🔄 前往更換職業 ]\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger base_menu set 2"}},{"text":"[ 💸 開啟轉帳系統 ]\\n\\n\\n\\n\\n\\n","color":"gold","bold":false,"clickEvent":{"action":"run_command","value":"/trigger transfer_menu set 1"}},{"text":"[ ⚠︎ debug ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/function game_core:gamemode/arms_race_debug"}}]}']} 1
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.8
execute if entity @s[team=blue,tag=!in_base] if score @s in_base_score matches 1 run tag @s add in_base
execute if entity @s[team=blue,tag=in_base] if score @s in_base_score matches 1 run effect give @s minecraft:instant_health 1 0
execute if entity @s[team=blue,tag=in_base] if score @s in_base_score matches 0 run clear @s written_book{title:"主選單"}
execute if entity @s[team=blue,tag=in_base] if score @s in_base_score matches 0 run tag @s remove in_base

# --- 轉帳系統事件監聽 ---
# 1. 監聽玩家點擊「開啟轉帳」按鈕
execute if score @s transfer_menu matches 1.. run function game_core:shop/open_menu
# 2. 監聽玩家點擊「增減金額/取消」按鈕
execute if score @s transfer_act matches 1.. run function game_core:shop/calc_logic
# 3.離開基地時，強制取消轉帳
execute if entity @s[tag=transfer_active] if score @s in_base_score matches 0 run function game_core:shop/force_cancel


# --- 3. 死亡與重生緩衝 ---
execute if score @s gd656killicon.death matches 0 as @s run scoreboard players set @s death_prev 0
execute if score @s gd656killicon.death > @s death_prev run scoreboard players set @s respawn_timer 10
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


# =======================================================
# --- 8. [強制覆蓋] 轉帳系統 Actionbar 與 視點目標鎖定 ---
# =======================================================

# A. 重置目標標籤與自我排除防護
tag @a remove transfer_target
# 給轉帳者自己貼上 is_me 標籤，徹底解決自我鎖定的 Bug
tag @s add is_me
scoreboard players operation #current_team team_id = @s team_id

# B. 寬容型視點目標鎖定 (Fat Cone Raycast)
# 說明: 放棄微小半徑，改在準星前方生成兩顆大圓球。
# 第一顆球: 前方 1.5 格，半徑 1.5 (覆蓋近距離與腳底誤差)
execute if entity @s[tag=transfer_active] at @s anchored eyes positioned ^ ^ ^1.5 as @a[tag=!is_me,distance=..1.5,limit=1,sort=nearest,tag=in_base] if score @s team_id = #current_team team_id run tag @s add transfer_target
# 第二顆球: 前方 3.0 格，半徑 2.0 (覆蓋中距離與移動延遲)
execute if entity @s[tag=transfer_active] at @s anchored eyes positioned ^ ^ ^3.0 as @a[tag=!is_me,distance=..2.0,limit=1,sort=nearest,tag=in_base,tag=!transfer_target] if score @s team_id = #current_team team_id run tag @s add transfer_target

# 拔除自我排除標籤
tag @s remove is_me

# C. UI 渲染 (未鎖定目標)
execute if entity @s[tag=transfer_active] unless entity @a[tag=transfer_target] run title @s actionbar ["",{"text":"[ 💸 預計轉出 ] 💰 ","color":"gray"},{"score":{"name":"@s","objective":"transfer_val"},"color":"yellow"},{"text":" (請靠近並看向隊友)","color":"red"}]

# D. UI 渲染 (已鎖定目標)
execute if entity @s[tag=transfer_active] if entity @a[tag=transfer_target] run title @s actionbar ["",{"text":"[ 💸 轉帳給 ","color":"gray"},{"selector":"@a[tag=transfer_target,limit=1]","color":"green"},{"text":" ] 💰 ","color":"gray"},{"score":{"name":"@s","objective":"transfer_val"},"color":"yellow"},{"text":" (按蹲下確認)","color":"aqua"}]

# E. 觸發轉帳 (防呆：需大於0元才執行)
execute if entity @s[tag=transfer_active,scores={sneak_time=1..}] if entity @a[tag=transfer_target] if score @s transfer_val matches 1.. run function game_core:shop/execute

# F. 重置蹲下時間 (防連發扣款)
execute if entity @s[tag=transfer_active,scores={sneak_time=1..}] run scoreboard players set @s sneak_time 0

# 執行商店防護

execute if score @s in_base_score matches 1 run function game_core:shop/master_switch