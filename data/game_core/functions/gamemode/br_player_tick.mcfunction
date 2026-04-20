# ==========================================
# 檔案: gamemode/br_player_tick.mcfunction
# 執行者: @s (大逃殺玩家本人)
# ==========================================
#刪除自己身上的空瓶
clear @s minecraft:glass_bottle

#debug
execute if score @s gd656killicon.kill matches 6 if score @s kill_prev matches 0 run function game_core:gamemode/arms_race_score_debug
execute if score @s gd656killicon.death matches 6 if score @s death_prev matches 0 run function game_core:gamemode/arms_race_score_debug

# --- [裝備鎖定：強制第 9 格為地圖] ---
execute if score @s br_death_state matches 1 unless data entity @s {Inventory:[{Slot:8b, id:"map_atlases:atlas"}]} run clear @s map_atlases:atlas
execute if score @s br_death_state matches 1 unless data entity @s {Inventory:[{Slot:8b, id:"map_atlases:atlas"}]} run item replace entity @s hotbar.8 from block 1 14 4 container.13

# --- [著陸偵測 (跨 Phase 安全版與客戶端 NBT 延遲修復)] ---
# 當獲得跳傘標籤時，開始累加寬限期計時
execute if entity @s[tag=br_jumped] run scoreboard players add @s jump_time 1

# 必須超過 20 Ticks (1秒寬限期)，且 NBT 判定確實在地上時，才觸發著陸！
execute if entity @s[tag=br_jumped,tag=!was_on_cart,nbt={OnGround:1b}] if score @s jump_time matches 5.. run function game_core:gamemode/br_on_landed

# 如果沒有在跳傘，確保計時器歸零
execute if entity @s[tag=br_jumped,tag=!was_on_cart,nbt={OnGround:0b}] run scoreboard players set @s jump_time 0
execute unless entity @s[tag=br_jumped] run scoreboard players set @s jump_time 0

# 更新上一 Tick 的狀態 
tag @s remove was_on_cart
execute if entity @s[tag=br_on_cart] run tag @s add was_on_cart

# 已經是狀態2卻又受傷導致血量為6hp以下(判定掉進虛空)，強制拉進狀態4 
execute if score @s br_death_state matches 2 if score @s br_health matches ..6 run tag @s add cause_void
execute if score @s br_death_state matches 2 if score @s br_health matches ..6 run function game_core:gamemode/br_force_state4

# --- [0] 初始化檢查 ---
execute unless entity @s[tag=br_setup] run function game_core:gamemode/br_player_setup

# --- [1] 抄寫黑板 (確保最先執行，將自己的 ID、隊伍與觀戰目標寫上去) ---
scoreboard players operation #current_player br_id = @s br_id
scoreboard players operation #current_player team_id = @s team_id
# 【修復Bug2】將個人的 target_id 抄寫到全域，防脫逃系統才能精準抓對人！
scoreboard players operation #current_player target_id = @s target_id

# --- [2] 更新即時血量 ---
execute store result score @s br_health run data get entity @s Health

# --- [3] 生死狀態捕捉 (Death Detection) ⚠️必須在 Tracker TP 前面！ ---
execute if score @s vanilla_death > @s death_prev run function game_core:gamemode/br_on_death
execute if score @s vanilla_death > @s death_prev run scoreboard players operation @s death_prev = @s vanilla_death

# --- [4] 專屬追蹤器跟隨 (Tracker TP) ---
# 【修復虛空TP】無條件跟隨！只要狀態是 1，追蹤器絕對不罷工！
execute if score @s br_death_state matches 1 at @s as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id run tp @s ~ ~ ~

# --- [4.5] 追蹤器重力同步 ---
execute if entity @s[tag=br_downed,tag=has_slime] as @e[type=villager,tag=br_downed_mob] if score @s br_id = #current_player br_id at @s as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id run tp @s ~ ~ ~
execute if score @s br_death_state matches 1 at @s as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id run tp @s ~ ~ ~

# --- [5] 倒地狀態 2：視角強制鎖定 ---
tag @s add my_cam_target
execute if score @s br_death_state matches 2 as @e[type=villager,tag=br_downed_mob] if score @s br_id = #current_player br_id at @s run tp @a[tag=my_cam_target,limit=1] ~ ~ ~
tag @s remove my_cam_target

# --- [6] 存活人數動態統計 ---
execute unless score @s br_death_state matches 1..4 run scoreboard players set @s br_death_state 1
execute if entity @s[tag=br_downed] run scoreboard players set @s br_death_state 2
execute if entity @s[tag=br_eliminated] unless score @s br_death_state matches 4 run scoreboard players set @s br_death_state 4

execute if entity @s[team=red,scores={br_death_state=1..3}] run scoreboard players add #br_alive_red br_sys 1
execute if entity @s[team=blue,scores={br_death_state=1..3}] run scoreboard players add #br_alive_blue br_sys 1
execute if entity @s[team=green,scores={br_death_state=1..3}] run scoreboard players add #br_alive_green br_sys 1
execute if entity @s[team=white,scores={br_death_state=1..3}] run scoreboard players add #br_alive_white br_sys 1
execute if entity @s[team=solo,scores={br_death_state=1..3}] run scoreboard players add #br_alive_solo br_sys 1

execute if entity @s[team=red,scores={br_death_state=1}] run scoreboard players add #br_stand_red br_sys 1
execute if entity @s[team=blue,scores={br_death_state=1}] run scoreboard players add #br_stand_blue br_sys 1
execute if entity @s[team=green,scores={br_death_state=1}] run scoreboard players add #br_stand_green br_sys 1
execute if entity @s[team=white,scores={br_death_state=1}] run scoreboard players add #br_stand_white br_sys 1


# --- [7] 旁觀者循環切換與防脫逃系統 ---
execute if score @s spectate_cd matches 1.. run scoreboard players remove @s spectate_cd 1

# 目標自動初始化與死亡跳轉
scoreboard players set #target_alive br_sys 0
execute if score @s br_death_state matches 3..4 as @a if score @s br_id = #current_player target_id if score @s br_death_state matches 1 run scoreboard players set #target_alive br_sys 1

execute if score @s br_death_state matches 3..4 if score #target_alive br_sys matches 0 run function game_core:gamemode/br_spectator

# 玩家手動按蹲下切換
execute if score @s br_death_state matches 3..4 if score @s sneak_time matches 1.. if score @s spectate_cd matches 0 run function game_core:gamemode/br_spectator

# 瞬間防脫逃拉回 (攔截按 Shift)
tag @s add my_cam_target
execute if score @s br_death_state matches 3..4 if score @s sneak_time matches 1.. if score @s spectate_cd matches 1.. as @a if score @s br_id = #current_player target_id run spectate @s @a[tag=my_cam_target,limit=1]
tag @s remove my_cam_target

execute if score @s br_death_state matches 3..4 if score @s sneak_time matches 1.. run scoreboard players set @s spectate_cd 10
execute if score @s br_death_state matches 3..4 if score @s sneak_time matches 1.. run scoreboard players set @s sneak_time 0

execute if score @s br_death_state matches 3..4 run function game_core:gamemode/br_spectator_ui


# --- [7.5] 終極防脫逃：重生與斷線重連防護 (距離判定法) ---
# 【修復 Bug 2 & 3】如果狀態 3 或 4 的玩家，與他的觀戰目標距離超過 2 格 (代表他剛點擊重生，或斷線重連)
# 系統會每 Tick 瞬間將他強制吸回目標身上，解決死亡畫面卡指令導致的自由視角 Bug！
tag @s add my_cam_target
execute if score @s br_death_state matches 3..4 as @a if score @s br_id = #current_player target_id at @s unless entity @a[tag=my_cam_target,distance=..0.5,limit=1] run spectate @s @a[tag=my_cam_target,limit=1]
tag @s remove my_cam_target


# --- [8] 視線救援系統 ---
execute if entity @s[tag=!br_downed,tag=!br_eliminated,scores={sneak_time=1..}] at @s anchored eyes positioned ^ ^ ^1.5 as @e[type=villager,tag=br_downed_mob,distance=..1.2,limit=1] if score @s team_id = #current_player team_id run tag @s add being_revived
execute if entity @s[tag=!br_downed,tag=!br_eliminated,scores={sneak_time=1..}] at @s anchored eyes positioned ^ ^ ^1.5 as @e[type=villager,tag=br_downed_mob,tag=being_revived,distance=..1.2,limit=1] if score @s team_id = #current_player team_id run scoreboard players operation @s rescuer_id = #current_player br_id

execute if entity @s[tag=!br_downed,scores={sneak_time=1..}] at @s anchored eyes positioned ^ ^ ^1.5 if entity @e[type=villager,tag=being_revived,distance=..1.2] run scoreboard players add @s revive_progress 1

execute if score @s revive_progress matches 1.. run scoreboard players operation @s revive_pct = @s revive_progress
execute if score @s revive_progress matches 1.. run scoreboard players operation @s revive_pct /= #2 br_sys

execute if score @s revive_progress matches 1..199 at @s anchored eyes positioned ^ ^ ^1.5 as @e[type=villager,tag=being_revived,distance=..1.2,limit=1] run scoreboard players operation #current_player target_id = @s br_id
execute if score @s revive_progress matches 1..199 as @a if score @s br_id = #current_player target_id run tag @s add my_patient
execute if score @s revive_progress matches 1..199 run title @s actionbar ["",{"text":"[💉 正在拉起  ] | "},{"selector":"@a[tag=my_patient,limit=1]","color":"gold"},{"text":" 進度: ","color":"green"},{"score":{"name":"@s","objective":"revive_pct"},"color":"yellow"},{"text":"%","color":"yellow"}]
tag @a remove my_patient

execute unless score @s sneak_time matches 1.. run scoreboard players set @s revive_progress 0
execute if score @s sneak_time matches 1.. at @s anchored eyes positioned ^ ^ ^1.5 unless entity @e[type=villager,tag=being_revived,distance=..1.2] run scoreboard players set @s revive_progress 0

execute if score @s revive_progress matches 200.. run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute if score @s revive_progress matches 200.. at @s anchored eyes positioned ^ ^ ^1.5 run tag @e[type=villager,tag=being_revived,distance=..1.2,limit=1] add revive_success
execute if score @s revive_progress matches 200.. run scoreboard players set @s revive_progress 0

# --- [9] 倒地玩家狀態監聽 ---
tag @s add is_checking

execute if entity @s[tag=br_downed,tag=has_slime] as @e[type=villager,tag=revive_success] if score @s br_id = #current_player br_id as @a[tag=is_checking,limit=1] run function game_core:gamemode/br_on_revived

scoreboard players set #current_player slime_alive 0
scoreboard players set @s slime_alive 0

execute if entity @s[tag=br_downed,tag=has_slime] as @e[type=villager,tag=br_downed_mob] if score @s br_id = #current_player br_id run scoreboard players set #current_player slime_alive 1
execute if entity @s[tag=br_downed,tag=has_slime] run scoreboard players operation @s slime_alive = #current_player slime_alive
execute if entity @s[tag=br_downed,tag=has_slime] if score @s slime_alive matches 0 as @a[tag=is_checking,limit=1] run function game_core:gamemode/br_eliminated

tag @s remove is_checking

# --- [10] 倒地者 UI ---
scoreboard players set #current_player br_slime_hp 0
execute if entity @s[tag=br_downed,tag=has_slime] as @e[type=villager,tag=br_downed_mob] if score @s br_id = #current_player br_id store result score #current_player br_slime_hp run data get entity @s Health

execute if entity @s[tag=br_downed,tag=has_slime] run scoreboard players operation @s br_slime_hp = #current_player br_slime_hp
execute if entity @s[tag=br_downed,tag=has_slime] run scoreboard players remove @s br_slime_hp 200
execute if entity @s[tag=br_downed,tag=has_slime] run scoreboard players operation @s br_slime_hp /= #2 br_sys

scoreboard players set #current_player is_reviving 0
execute if entity @s[tag=br_downed,tag=has_slime] as @e[type=villager,tag=br_downed_mob,tag=being_revived] if score @s br_id = #current_player br_id run scoreboard players set #current_player is_reviving 1

execute if entity @s[tag=br_downed,tag=has_slime] if score #current_player is_reviving matches 0 run title @s actionbar ["",{"text":"[ 🩸 持續流血中 ] 預估存活時間: ","color":"red"},{"score":{"name":"@s","objective":"br_slime_hp"},"color":"yellow"},{"text":" 秒","color":"yellow"}]

execute if entity @s[tag=br_downed,tag=has_slime] if score #current_player is_reviving matches 1 as @e[type=villager,tag=br_downed_mob,tag=being_revived] if score @s br_id = #current_player br_id run scoreboard players operation #current_player rescuer_id = @s rescuer_id
execute if entity @s[tag=br_downed,tag=has_slime] if score #current_player is_reviving matches 1 as @a if score @s br_id = #current_player rescuer_id run tag @s add my_rescuer
execute if entity @s[tag=br_downed,tag=has_slime] if score #current_player is_reviving matches 1 run title @s actionbar ["",{"text":"[ 🩹 "},{"selector":"@a[tag=my_rescuer,limit=1]","color":"green"},{"text":" 正在拉你 ] 狀態暫停惡化，剩餘: ","color":"green"},{"score":{"name":"@s","objective":"br_slime_hp"},"color":"yellow"},{"text":" 秒","color":"yellow"}]
tag @a remove my_rescuer

# --- [11] 靈魂拾取系統 ---
execute if score @s br_death_state matches 1 if score @s sneak_time matches 1.. at @s as @e[type=marker,tag=br_soul_marker,distance=..0.75] if score @s team_id = #current_player team_id run function game_core:gamemode/br_soul_pickup

# --- [12] 靈魂祭壇互動系統 (10秒 / 200 Ticks) ---
tag @s remove near_altar

execute as @e[type=text_display,tag=br_altar,tag=altar_ready] at @s positioned ~-4 ~-5 ~-4 run tag @a[dx=7,dy=6,dz=7] add near_altar

# 2. 【最高優先級防呆與修復 Bug 4】
# 強制限定只有存活者 (狀態 1) 能累積進度，靈魂休想自救！
execute unless score @s br_death_state matches 1 run scoreboard players set @s altar_progress 0
execute unless score @s sneak_time matches 1.. run scoreboard players set @s altar_progress 0
execute if score @s revive_progress matches 1.. run scoreboard players set @s altar_progress 0
execute unless entity @s[tag=near_altar] run scoreboard players set @s altar_progress 0

scoreboard players set #team_has_soul br_sys 0
execute if entity @s[tag=near_altar] as @a if score @s team_id = #current_player team_id if entity @s[tag=soul_picked] run scoreboard players set #team_has_soul br_sys 1

# 4. 累加進度與 UI 顯示 (加入 br_death_state=1 鎖頭)
execute if score @s br_death_state matches 1 if entity @s[tag=near_altar] if score @s revive_progress matches 0 if score #team_has_soul br_sys matches 1 if score @s sneak_time matches 1.. run scoreboard players add @s altar_progress 1

execute if score @s br_death_state matches 1 if score @s altar_progress matches 1..199 run scoreboard players operation @s altar_pct = @s altar_progress
execute if score @s br_death_state matches 1 if score @s altar_progress matches 1..199 run scoreboard players operation @s altar_pct /= #2 br_sys
execute if score @s br_death_state matches 1 if score @s altar_progress matches 1..199 run title @s actionbar ["",{"text":"[⛩️ 正在啟用祭壇] 進度: ","color":"aqua"},{"score":{"name":"@s","objective":"altar_pct"},"color":"white"},{"text":"%","color":"white"}]

# 4.5 【實體方塊快門：烽火台光束切換】
execute if score @s br_death_state matches 1 if score @s altar_progress matches 1..199 at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..6,limit=1,sort=nearest] at @s run setblock ~ ~-3 ~ air
execute if score @s br_death_state matches 1 if score @s altar_progress matches 0 at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..7,limit=1,sort=nearest] at @s run setblock ~ ~-3 ~ soul_sand

execute if score @s br_death_state matches 1 if score @s altar_progress matches 1..199 if score #global br_timer matches 0 at @s as @e[type=text_display,tag=br_altar,distance=..6,limit=1,sort=nearest] at @s run playsound block.beacon.ambient master @a[distance=..180] ~ ~ ~ 1 1
execute if score @s br_death_state matches 1 if score @s altar_progress matches 1..199 if score #global br_timer matches 0 at @s as @a[distance=..180] unless score @s team_id = #current_player team_id run title @s actionbar {"text":"⚠ 附近有人正在啟用祭壇！","color":"gold","bold":true}

# 5. 滿 10 秒觸發復活
execute if score @s altar_progress matches 200.. run function game_core:gamemode/br_altar_execute

# --- [13] 負重系統 ---
execute store result score @s gun_count run clear @s tacz:modern_kinetic_gun 0
execute if score @s gun_count matches 3.. run effect give @s slowness 1 3 true
execute if score @s gun_count matches 3.. run effect give @s jump_boost 1 200 true
execute if score @s gun_count matches 3.. run title @s actionbar {"text":"⚠️ 負重過高！請丟棄多餘的槍枝！","color":"red","bold":true}