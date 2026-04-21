# ==========================================
# 檔案: gamemode/br_on_death.mcfunction
# 執行者: @s (剛剛死亡、座標已被傳送走的玩家)
# 倒地狀態
#{PersistenceRequired:1b,Tags:["br_downed_mob"],Age:-2147483648,Silent:1b,Health:300f,DeathLootTable:"minecraft:empty",Attributes:[{Name:"generic.max_health",Base:300f},{Name:"generic.knockback_resistance",Base:1f},{Name:"generic.movement_speed",Base:0f}],ActiveEffects:[{Id:2b,Amplifier:255,Duration:-1,ShowParticles:0b},{Id:8b,Amplifier:250,Duration:-1,ShowParticles:0b},{Id:18b,Amplifier:255,Duration:-1,ShowParticles:0b}]}
# ==========================================

#先恢復血量防止誤判掉入虛空
effect give @s minecraft:saturation 3 50 true

# --- [A] 中斷空投部署狀態 ---
execute as @s[tag=br_jumped] run function game_core:gamemode/br_on_landed
execute as @s[tag=br_on_cart] run function game_core:gamemode/br_on_landed
tag @s remove br_on_cart

# ==========================================
# --- [防呆機制：自動修復空值 (Null)] ---
# ==========================================
execute unless score @s br_death_state matches 1..4 run scoreboard players set @s br_death_state 1
execute unless score @s team_id matches 1..5 run scoreboard players set @s team_id 5

scoreboard players operation #current_player br_id = @s br_id
scoreboard players operation #current_player team_id = @s team_id

# ==========================================
# --- [A] 狀態分流防護鎖 ---
# ==========================================
# 【修復 Bug 1】如果已經是狀態 2 或 3 卻觸發了原版死亡 (例如掉進虛空)，直接進狀態 4 並清理舊屍體！
execute if score @s br_death_state matches 2..3 if score @s br_health matches ..4 run tag @s add cause_void
execute if score @s br_death_state matches 2..3 if score @s br_health matches ..4 run function game_core:gamemode/br_force_state4

# 孤狼死亡，直接拉進狀態4
execute if score @s team_id matches 5 if score @s br_death_state matches 1 run tag @s add cause_solo
execute if score @s team_id matches 5 if score @s br_death_state matches 1 run function game_core:gamemode/br_force_state4

# ==========================================
# --- [B] 團隊倒地程序 & 滅團判定 ---
# ==========================================
# (因為上面已經把掉進虛空的人轉成 4 了，所以他們絕對進不來這個 1 的判定，完美防堵雙胞胎！)
execute if score @s br_death_state matches 1 unless score @s team_id matches 5 run tag @s add check_wipe

execute if entity @s[tag=check_wipe] run scoreboard players set @s br_death_state 2

scoreboard players set #team_stand br_sys 0
execute if entity @s[tag=check_wipe] as @a if score @s team_id = #current_player team_id unless score @s br_death_state matches 1..4 run scoreboard players set @s br_death_state 1
execute if entity @s[tag=check_wipe] as @a if score @s team_id = #current_player team_id if score @s br_death_state matches 1 run scoreboard players add #team_stand br_sys 1

execute if entity @s[tag=check_wipe] if score #team_stand br_sys matches 0 as @a if score @s team_id = #current_player team_id if score @s br_death_state matches 2..3 run tag @s add cause_wipe
execute if entity @s[tag=check_wipe] if score #team_stand br_sys matches 0 as @a if score @s team_id = #current_player team_id if score @s br_death_state matches 2..3 run function game_core:gamemode/br_force_state4

# 重新同步全域變數，防止 br_force_state4 內部污染
scoreboard players operation #current_player br_id = @s br_id
scoreboard players operation #current_player team_id = @s team_id

execute if entity @s[tag=check_wipe] if score #team_stand br_sys matches 1.. run tag @s add br_downed_processing

execute if entity @s[tag=br_downed_processing] run title @s title {"text":"🩸 你已倒地","color":"red","bold":true}
execute if entity @s[tag=br_downed_processing] run title @s subtitle {"text":"請等待隊友救援","color":"gray"}

# 生成村民
execute if entity @s[tag=br_downed_processing] as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id at @s run summon villager ~ ~ ~ {PersistenceRequired:1b,Tags:["br_downed_mob"],Age:-2147483648,Silent:1b,Health:300f,DeathLootTable:"minecraft:empty",Attributes:[{Name:"generic.max_health",Base:300f},{Name:"generic.knockback_resistance",Base:1f},{Name:"generic.movement_speed",Base:0f}],ActiveEffects:[{Id:2b,Amplifier:255,Duration:-1,ShowParticles:0b},{Id:8b,Amplifier:250,Duration:-1,ShowParticles:0b},{Id:18b,Amplifier:255,Duration:-1,ShowParticles:0b}]}

# 綁定 ID 
execute if entity @s[tag=br_downed_processing] as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id at @s as @e[type=villager,tag=br_downed_mob,distance=..1,limit=1,sort=nearest] run scoreboard players operation @s br_id = #current_player br_id
execute if entity @s[tag=br_downed_processing] as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id at @s as @e[type=villager,tag=br_downed_mob,distance=..1,limit=1,sort=nearest] run scoreboard players operation @s team_id = #current_player team_id

# 狀態切換
execute if entity @s[tag=br_downed_processing] run tag @s add br_downed
execute if entity @s[tag=br_downed_processing] run gamemode spectator @s
execute if entity @s[tag=br_downed_processing] run tag @s add has_slime

# 清除暫存
tag @s remove check_wipe
tag @s remove br_downed_processing

schedule function game_core:gamemode/br_win_check 1s