# ==========================================
# 檔案: gamemode/gk/start.mcfunction
# 目的: 槍王之王模式開局初始化（獨立入口）
# ==========================================

# ------------------------------------------
# [步驟 1] 通用初始化（冒險模式、Buff、分數重置）
# ------------------------------------------
gamemode adventure @a
gamerule keepInventory true
effect give @a minecraft:regeneration infinite 1 true
effect give @a minecraft:saturation infinite 1 true
scoreboard players set #global arms_sub_mode 3

gd656killicon server statistics set score @a 0
gd656killicon server statistics set assist @a 0
gd656killicon server statistics set death @a 0
gd656killicon server statistics set kill @a 0

scoreboard players set @a gd656killicon.score 0
scoreboard players set @a gd656killicon.assist 0
scoreboard players set @a gd656killicon.death 0
scoreboard players set @a vanilla_death 0
scoreboard players set @a gd656killicon.kill 0
scoreboard players set #arms_race_score_debug dummy 0
scoreboard players set @a respawn_timer -1
scoreboard players set @a death_prev 0
scoreboard players set @a kill_prev 0
scoreboard players set @a transfer_val 0
scoreboard players set #winner_team dummy 0

tag @a remove transfer_active
tag @a remove transfer_target
tag @a remove in_lobby
tag @a remove on_parkour
tag @a remove in_combat
tag @a remove has_lobby_terminal
tag @s remove fight
tag @s remove on_minidm

# ------------------------------------------
# [步驟 2] 清空背包（僅 game_state=0 時執行）
# ------------------------------------------
execute if score #global game_state matches 0 run scoreboard players set @a assist_prev 0
execute if score #global game_state matches 0 run scoreboard players set @a kill_prev 0
execute if score #global game_state matches 0 run tag @a remove in_base
execute if score #global game_state matches 0 run clear @a

# ------------------------------------------
# [步驟 4] 各隊 team_id 設定（1-16）
# ------------------------------------------
execute if score #global game_state matches 0 as @a[team=red] run scoreboard players set @s team_id 1
execute if score #global game_state matches 0 as @a[team=blue] run scoreboard players set @s team_id 2
execute if score #global game_state matches 0 as @a[team=white] run scoreboard players set @s team_id 3
execute if score #global game_state matches 0 as @a[team=green] run scoreboard players set @s team_id 4
execute if score #global game_state matches 0 as @a[team=yellow] run scoreboard players set @s team_id 5
execute if score #global game_state matches 0 as @a[team=aqua] run scoreboard players set @s team_id 6
execute if score #global game_state matches 0 as @a[team=gold] run scoreboard players set @s team_id 7
execute if score #global game_state matches 0 as @a[team=light_purple] run scoreboard players set @s team_id 8
execute if score #global game_state matches 0 as @a[team=dark_red] run scoreboard players set @s team_id 9
execute if score #global game_state matches 0 as @a[team=dark_blue] run scoreboard players set @s team_id 10
execute if score #global game_state matches 0 as @a[team=dark_green] run scoreboard players set @s team_id 11
execute if score #global game_state matches 0 as @a[team=dark_aqua] run scoreboard players set @s team_id 12
execute if score #global game_state matches 0 as @a[team=dark_purple] run scoreboard players set @s team_id 13
execute if score #global game_state matches 0 as @a[team=dark_gray] run scoreboard players set @s team_id 14
execute if score #global game_state matches 0 as @a[team=gray] run scoreboard players set @s team_id 15
execute if score #global game_state matches 0 as @a[team=black] run scoreboard players set @s team_id 16

# ------------------------------------------
# [步驟 5] 給予 100 HP + 隨機防具
# ------------------------------------------
execute if score #global game_state matches 0 as @a run attribute @s minecraft:generic.max_health base set 100
execute if score #global game_state matches 0 run effect give @a minecraft:instant_health 1 100 true
execute if score #global game_state matches 0 store result score #gk_armor_tier gk_config run random value 1..4
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 2 as @a run item replace entity @s armor.head with minecraft:leather_helmet{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 2 as @a run item replace entity @s armor.chest with minecraft:leather_chestplate{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 2 as @a run item replace entity @s armor.legs with minecraft:leather_leggings{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 2 as @a run item replace entity @s armor.feet with minecraft:leather_boots{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 3 as @a run item replace entity @s armor.head with minecraft:golden_helmet{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 3 as @a run item replace entity @s armor.chest with minecraft:golden_chestplate{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 3 as @a run item replace entity @s armor.legs with minecraft:golden_leggings{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 3 as @a run item replace entity @s armor.feet with minecraft:golden_boots{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 4 as @a run item replace entity @s armor.head with minecraft:iron_helmet{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 4 as @a run item replace entity @s armor.chest with minecraft:iron_chestplate{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 4 as @a run item replace entity @s armor.legs with minecraft:iron_leggings{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if score #global game_state matches 0 if score #gk_armor_tier gk_config matches 4 as @a run item replace entity @s armor.feet with minecraft:iron_boots{Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}

# ------------------------------------------
# [步驟 6] 重置所有 16 隊的進度變數
# ------------------------------------------
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_red gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_blue gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_white gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_green gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_yellow gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_aqua gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_gold gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_light_purple gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_dark_red gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_dark_blue gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_dark_green gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_dark_aqua gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_dark_purple gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_dark_gray gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_gray gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_black gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo1 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo2 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo3 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo4 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo5 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo6 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo7 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo8 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo9 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo10 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo11 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo12 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo13 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo14 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo15 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_stage_solo16 gk_config 1
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_red gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_blue gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_white gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_green gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_yellow gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_aqua gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_gold gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_light_purple gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_dark_red gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_dark_blue gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_dark_green gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_dark_aqua gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_dark_purple gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_dark_gray gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_gray gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_black gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo1 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo2 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo3 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo4 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo5 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo6 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo7 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo8 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo9 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo10 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo11 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo12 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo13 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo14 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo15 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_solo16 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_hud_timer gk_config 0

# ------------------------------------------
# [步驟 7] 計算各隊擊殺需求（= 各隊人數，最少 1）
# ------------------------------------------
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_red gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_blue gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_white gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_green gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_yellow gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_aqua gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_gold gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_light_purple gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_dark_red gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_dark_blue gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_dark_green gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_dark_aqua gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_dark_purple gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_dark_gray gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_gray gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_black gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo1 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo2 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo3 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo4 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo5 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo6 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo7 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo8 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo9 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo10 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo11 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo12 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo13 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo14 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo15 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_kills_needed_solo16 gk_config 0
execute if score #global game_state matches 0 as @a[team=red] run scoreboard players add #gk_kills_needed_red gk_config 1
execute if score #global game_state matches 0 as @a[team=blue] run scoreboard players add #gk_kills_needed_blue gk_config 1
execute if score #global game_state matches 0 as @a[team=white] run scoreboard players add #gk_kills_needed_white gk_config 1
execute if score #global game_state matches 0 as @a[team=green] run scoreboard players add #gk_kills_needed_green gk_config 1
execute if score #global game_state matches 0 as @a[team=yellow] run scoreboard players add #gk_kills_needed_yellow gk_config 1
execute if score #global game_state matches 0 as @a[team=aqua] run scoreboard players add #gk_kills_needed_aqua gk_config 1
execute if score #global game_state matches 0 as @a[team=gold] run scoreboard players add #gk_kills_needed_gold gk_config 1
execute if score #global game_state matches 0 as @a[team=light_purple] run scoreboard players add #gk_kills_needed_light_purple gk_config 1
execute if score #global game_state matches 0 as @a[team=dark_red] run scoreboard players add #gk_kills_needed_dark_red gk_config 1
execute if score #global game_state matches 0 as @a[team=dark_blue] run scoreboard players add #gk_kills_needed_dark_blue gk_config 1
execute if score #global game_state matches 0 as @a[team=dark_green] run scoreboard players add #gk_kills_needed_dark_green gk_config 1
execute if score #global game_state matches 0 as @a[team=dark_aqua] run scoreboard players add #gk_kills_needed_dark_aqua gk_config 1
execute if score #global game_state matches 0 as @a[team=dark_purple] run scoreboard players add #gk_kills_needed_dark_purple gk_config 1
execute if score #global game_state matches 0 as @a[team=dark_gray] run scoreboard players add #gk_kills_needed_dark_gray gk_config 1
execute if score #global game_state matches 0 as @a[team=gray] run scoreboard players add #gk_kills_needed_gray gk_config 1
execute if score #global game_state matches 0 as @a[team=black] run scoreboard players add #gk_kills_needed_black gk_config 1
execute if score #global game_state matches 0 as @a[team=solo1] run scoreboard players add #gk_kills_needed_solo1 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo2] run scoreboard players add #gk_kills_needed_solo2 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo3] run scoreboard players add #gk_kills_needed_solo3 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo4] run scoreboard players add #gk_kills_needed_solo4 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo5] run scoreboard players add #gk_kills_needed_solo5 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo6] run scoreboard players add #gk_kills_needed_solo6 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo7] run scoreboard players add #gk_kills_needed_solo7 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo8] run scoreboard players add #gk_kills_needed_solo8 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo9] run scoreboard players add #gk_kills_needed_solo9 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo10] run scoreboard players add #gk_kills_needed_solo10 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo11] run scoreboard players add #gk_kills_needed_solo11 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo12] run scoreboard players add #gk_kills_needed_solo12 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo13] run scoreboard players add #gk_kills_needed_solo13 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo14] run scoreboard players add #gk_kills_needed_solo14 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo15] run scoreboard players add #gk_kills_needed_solo15 gk_config 1
execute if score #global game_state matches 0 as @a[team=solo16] run scoreboard players add #gk_kills_needed_solo16 gk_config 1

# 記錄各隊是否有玩家（min-1 修正前，0=空隊 1=有人）
execute if score #global game_state matches 0 run scoreboard players set #gk_has_red gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_blue gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_white gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_green gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_yellow gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_aqua gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_gold gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_light_purple gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_dark_red gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_dark_blue gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_dark_green gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_dark_aqua gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_dark_purple gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_dark_gray gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_gray gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_black gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo1 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo2 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo3 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo4 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo5 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo6 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo7 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo8 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo9 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo10 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo11 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo12 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo13 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo14 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo15 gk_config 0
execute if score #global game_state matches 0 run scoreboard players set #gk_has_solo16 gk_config 0
execute if score #global game_state matches 0 if score #gk_kills_needed_red gk_config matches 1.. run scoreboard players set #gk_has_red gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_blue gk_config matches 1.. run scoreboard players set #gk_has_blue gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_white gk_config matches 1.. run scoreboard players set #gk_has_white gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_green gk_config matches 1.. run scoreboard players set #gk_has_green gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_yellow gk_config matches 1.. run scoreboard players set #gk_has_yellow gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_aqua gk_config matches 1.. run scoreboard players set #gk_has_aqua gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_gold gk_config matches 1.. run scoreboard players set #gk_has_gold gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_light_purple gk_config matches 1.. run scoreboard players set #gk_has_light_purple gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_red gk_config matches 1.. run scoreboard players set #gk_has_dark_red gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_blue gk_config matches 1.. run scoreboard players set #gk_has_dark_blue gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_green gk_config matches 1.. run scoreboard players set #gk_has_dark_green gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_aqua gk_config matches 1.. run scoreboard players set #gk_has_dark_aqua gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_purple gk_config matches 1.. run scoreboard players set #gk_has_dark_purple gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_gray gk_config matches 1.. run scoreboard players set #gk_has_dark_gray gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_gray gk_config matches 1.. run scoreboard players set #gk_has_gray gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_black gk_config matches 1.. run scoreboard players set #gk_has_black gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo1 gk_config matches 1.. run scoreboard players set #gk_has_solo1 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo2 gk_config matches 1.. run scoreboard players set #gk_has_solo2 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo3 gk_config matches 1.. run scoreboard players set #gk_has_solo3 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo4 gk_config matches 1.. run scoreboard players set #gk_has_solo4 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo5 gk_config matches 1.. run scoreboard players set #gk_has_solo5 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo6 gk_config matches 1.. run scoreboard players set #gk_has_solo6 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo7 gk_config matches 1.. run scoreboard players set #gk_has_solo7 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo8 gk_config matches 1.. run scoreboard players set #gk_has_solo8 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo9 gk_config matches 1.. run scoreboard players set #gk_has_solo9 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo10 gk_config matches 1.. run scoreboard players set #gk_has_solo10 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo11 gk_config matches 1.. run scoreboard players set #gk_has_solo11 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo12 gk_config matches 1.. run scoreboard players set #gk_has_solo12 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo13 gk_config matches 1.. run scoreboard players set #gk_has_solo13 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo14 gk_config matches 1.. run scoreboard players set #gk_has_solo14 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo15 gk_config matches 1.. run scoreboard players set #gk_has_solo15 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo16 gk_config matches 1.. run scoreboard players set #gk_has_solo16 gk_config 1

execute if score #global game_state matches 0 if score #gk_kills_needed_red gk_config matches ..0 run scoreboard players set #gk_kills_needed_red gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_blue gk_config matches ..0 run scoreboard players set #gk_kills_needed_blue gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_white gk_config matches ..0 run scoreboard players set #gk_kills_needed_white gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_green gk_config matches ..0 run scoreboard players set #gk_kills_needed_green gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_yellow gk_config matches ..0 run scoreboard players set #gk_kills_needed_yellow gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_aqua gk_config matches ..0 run scoreboard players set #gk_kills_needed_aqua gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_gold gk_config matches ..0 run scoreboard players set #gk_kills_needed_gold gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_light_purple gk_config matches ..0 run scoreboard players set #gk_kills_needed_light_purple gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_red gk_config matches ..0 run scoreboard players set #gk_kills_needed_dark_red gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_blue gk_config matches ..0 run scoreboard players set #gk_kills_needed_dark_blue gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_green gk_config matches ..0 run scoreboard players set #gk_kills_needed_dark_green gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_aqua gk_config matches ..0 run scoreboard players set #gk_kills_needed_dark_aqua gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_purple gk_config matches ..0 run scoreboard players set #gk_kills_needed_dark_purple gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_dark_gray gk_config matches ..0 run scoreboard players set #gk_kills_needed_dark_gray gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_gray gk_config matches ..0 run scoreboard players set #gk_kills_needed_gray gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_black gk_config matches ..0 run scoreboard players set #gk_kills_needed_black gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo1 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo1 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo2 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo2 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo3 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo3 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo4 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo4 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo5 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo5 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo6 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo6 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo7 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo7 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo8 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo8 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo9 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo9 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo10 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo10 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo11 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo11 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo12 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo12 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo13 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo13 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo14 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo14 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo15 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo15 gk_config 1
execute if score #global game_state matches 0 if score #gk_kills_needed_solo16 gk_config matches ..0 run scoreboard players set #gk_kills_needed_solo16 gk_config 1

# ------------------------------------------
# [步驟 8] 套用擊殺倍率
# ------------------------------------------
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches ..0 run scoreboard players set #gk_kills_multiplier gk_config 1

execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_red gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_blue gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_white gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_green gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_yellow gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_aqua gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_gold gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_light_purple gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_dark_red gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_dark_blue gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_dark_green gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_dark_aqua gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_dark_purple gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_dark_gray gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_gray gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_black gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo1 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo2 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo3 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo4 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo5 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo6 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo7 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo8 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo9 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo10 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo11 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo12 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo13 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo14 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo15 gk_config *= #gk_kills_multiplier gk_config
execute if score #global game_state matches 0 if score #gk_kills_multiplier gk_config matches 2.. run scoreboard players operation #gk_kills_needed_solo16 gk_config *= #gk_kills_multiplier gk_config

# ------------------------------------------
# [步驟 9] 隨機決定類別順序、槍款
# ------------------------------------------
execute if score #global game_state matches 0 run function game_core:gamemode/gk/shuffle

# ------------------------------------------
# [步驟 10] 解析所有隊伍的第 1 階段
# ------------------------------------------
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_red
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_blue
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_white
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_green
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_yellow
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_aqua
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_gold
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_light_purple
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_dark_red
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_dark_blue
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_dark_green
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_dark_aqua
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_dark_purple
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_dark_gray
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_gray
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_black
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo1
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo2
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo3
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo4
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo5
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo6
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo7
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo8
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo9
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo10
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo11
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo12
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo13
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo14
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo15
execute if score #global game_state matches 0 run function game_core:gamemode/gk/resolve_stage_solo16

# ------------------------------------------
# [步驟 11] 切換遊戲狀態為進行中
# ------------------------------------------
execute if score #global game_state matches 0 run scoreboard players set #global game_state 2

# ------------------------------------------
# [步驟 12] 傳送至 gk_spawn（備援 red_spawn）
# ------------------------------------------
execute as @a at @e[type=marker,tag=gk_spawn,sort=random,limit=1] run spawnpoint @s ~ ~ ~
execute as @a at @e[type=marker,tag=gk_spawn,sort=random,limit=1] run tp @s ~ ~ ~
execute unless entity @e[type=marker,tag=gk_spawn] as @a at @e[type=marker,tag=red_spawn,limit=1] run spawnpoint @s ~ ~ ~
execute unless entity @e[type=marker,tag=gk_spawn] as @a at @e[type=marker,tag=red_spawn,limit=1] run tp @s ~ ~ ~

# ------------------------------------------
# [步驟 13] 發放物品（槍械 → 醫療 → 彈藥箱 → 配件）
# ------------------------------------------
# 1. 給予槍械（進快捷欄 slot 0）
execute as @a run function game_core:gamemode/gk/give_weapon
# 2. 給予醫療用品 carfak（進快捷欄 slot 1）
give @a lrtactical:consumable{ConsumableId:"lrtactical:carfak"} 1
# 3. 暫用 barrier 佔滿快捷欄剩餘格位（slot 2~8），防止後續物品進入快捷欄
execute as @a run item replace entity @s container.2 with minecraft:barrier 1
execute as @a run item replace entity @s container.3 with minecraft:barrier 1
execute as @a run item replace entity @s container.4 with minecraft:barrier 1
execute as @a run item replace entity @s container.5 with minecraft:barrier 1
execute as @a run item replace entity @s container.6 with minecraft:barrier 1
execute as @a run item replace entity @s container.7 with minecraft:barrier 1
execute as @a run item replace entity @s container.8 with minecraft:barrier 1
# 4. 彈藥箱直接放入物品欄 slot 9（跳過快捷欄）
execute as @a run item replace entity @s container.9 with tacz:ammo_box{AllTypeCreative:1b} 1
# 5. 給予配件（快捷欄已滿，give 自動落入物品欄 slot 10+）
execute as @a run function game_core:gamemode/gk/give_attach_for_stage
# 6. 清除佔位 barrier
execute as @a run item replace entity @s container.2 with minecraft:air 1
execute as @a run item replace entity @s container.3 with minecraft:air 1
execute as @a run item replace entity @s container.4 with minecraft:air 1
execute as @a run item replace entity @s container.5 with minecraft:air 1
execute as @a run item replace entity @s container.6 with minecraft:air 1
execute as @a run item replace entity @s container.7 with minecraft:air 1
execute as @a run item replace entity @s container.8 with minecraft:air 1

# ------------------------------------------
# [步驟 13.5] 初始化 GK HUD sidebar（只顯示有玩家的隊伍）
# ------------------------------------------
scoreboard players reset §c紅 gk_hud
scoreboard players reset §9藍 gk_hud
scoreboard players reset §f白 gk_hud
scoreboard players reset §a綠 gk_hud
scoreboard players reset §e黃 gk_hud
scoreboard players reset §b水 gk_hud
scoreboard players reset §6金 gk_hud
scoreboard players reset §d紫 gk_hud
scoreboard players reset §4暗紅 gk_hud
scoreboard players reset §1暗藍 gk_hud
scoreboard players reset §2暗綠 gk_hud
scoreboard players reset §3暗水 gk_hud
scoreboard players reset §5暗紫 gk_hud
scoreboard players reset §8暗灰 gk_hud
scoreboard players reset §7灰 gk_hud
scoreboard players reset §0黑 gk_hud
scoreboard players reset §8孤狼1 gk_hud
scoreboard players reset §8孤狼2 gk_hud
scoreboard players reset §8孤狼3 gk_hud
scoreboard players reset §8孤狼4 gk_hud
scoreboard players reset §8孤狼5 gk_hud
scoreboard players reset §8孤狼6 gk_hud
scoreboard players reset §8孤狼7 gk_hud
scoreboard players reset §8孤狼8 gk_hud
scoreboard players reset §8孤狼9 gk_hud
scoreboard players reset §8孤狼10 gk_hud
scoreboard players reset §8孤狼11 gk_hud
scoreboard players reset §8孤狼12 gk_hud
scoreboard players reset §8孤狼13 gk_hud
scoreboard players reset §8孤狼14 gk_hud
scoreboard players reset §8孤狼15 gk_hud
scoreboard players reset §8孤狼16 gk_hud
execute if score #gk_has_red gk_config matches 1 run scoreboard players operation §c紅 gk_hud = #gk_stage_red gk_config
execute if score #gk_has_blue gk_config matches 1 run scoreboard players operation §9藍 gk_hud = #gk_stage_blue gk_config
execute if score #gk_has_white gk_config matches 1 run scoreboard players operation §f白 gk_hud = #gk_stage_white gk_config
execute if score #gk_has_green gk_config matches 1 run scoreboard players operation §a綠 gk_hud = #gk_stage_green gk_config
execute if score #gk_has_yellow gk_config matches 1 run scoreboard players operation §e黃 gk_hud = #gk_stage_yellow gk_config
execute if score #gk_has_aqua gk_config matches 1 run scoreboard players operation §b水 gk_hud = #gk_stage_aqua gk_config
execute if score #gk_has_gold gk_config matches 1 run scoreboard players operation §6金 gk_hud = #gk_stage_gold gk_config
execute if score #gk_has_light_purple gk_config matches 1 run scoreboard players operation §d紫 gk_hud = #gk_stage_light_purple gk_config
execute if score #gk_has_dark_red gk_config matches 1 run scoreboard players operation §4暗紅 gk_hud = #gk_stage_dark_red gk_config
execute if score #gk_has_dark_blue gk_config matches 1 run scoreboard players operation §1暗藍 gk_hud = #gk_stage_dark_blue gk_config
execute if score #gk_has_dark_green gk_config matches 1 run scoreboard players operation §2暗綠 gk_hud = #gk_stage_dark_green gk_config
execute if score #gk_has_dark_aqua gk_config matches 1 run scoreboard players operation §3暗水 gk_hud = #gk_stage_dark_aqua gk_config
execute if score #gk_has_dark_purple gk_config matches 1 run scoreboard players operation §5暗紫 gk_hud = #gk_stage_dark_purple gk_config
execute if score #gk_has_dark_gray gk_config matches 1 run scoreboard players operation §8暗灰 gk_hud = #gk_stage_dark_gray gk_config
execute if score #gk_has_gray gk_config matches 1 run scoreboard players operation §7灰 gk_hud = #gk_stage_gray gk_config
execute if score #gk_has_black gk_config matches 1 run scoreboard players operation §0黑 gk_hud = #gk_stage_black gk_config
execute if score #gk_has_solo1 gk_config matches 1 run scoreboard players operation §8孤狼1 gk_hud = #gk_stage_solo1 gk_config
execute if score #gk_has_solo2 gk_config matches 1 run scoreboard players operation §8孤狼2 gk_hud = #gk_stage_solo2 gk_config
execute if score #gk_has_solo3 gk_config matches 1 run scoreboard players operation §8孤狼3 gk_hud = #gk_stage_solo3 gk_config
execute if score #gk_has_solo4 gk_config matches 1 run scoreboard players operation §8孤狼4 gk_hud = #gk_stage_solo4 gk_config
execute if score #gk_has_solo5 gk_config matches 1 run scoreboard players operation §8孤狼5 gk_hud = #gk_stage_solo5 gk_config
execute if score #gk_has_solo6 gk_config matches 1 run scoreboard players operation §8孤狼6 gk_hud = #gk_stage_solo6 gk_config
execute if score #gk_has_solo7 gk_config matches 1 run scoreboard players operation §8孤狼7 gk_hud = #gk_stage_solo7 gk_config
execute if score #gk_has_solo8 gk_config matches 1 run scoreboard players operation §8孤狼8 gk_hud = #gk_stage_solo8 gk_config
execute if score #gk_has_solo9 gk_config matches 1 run scoreboard players operation §8孤狼9 gk_hud = #gk_stage_solo9 gk_config
execute if score #gk_has_solo10 gk_config matches 1 run scoreboard players operation §8孤狼10 gk_hud = #gk_stage_solo10 gk_config
execute if score #gk_has_solo11 gk_config matches 1 run scoreboard players operation §8孤狼11 gk_hud = #gk_stage_solo11 gk_config
execute if score #gk_has_solo12 gk_config matches 1 run scoreboard players operation §8孤狼12 gk_hud = #gk_stage_solo12 gk_config
execute if score #gk_has_solo13 gk_config matches 1 run scoreboard players operation §8孤狼13 gk_hud = #gk_stage_solo13 gk_config
execute if score #gk_has_solo14 gk_config matches 1 run scoreboard players operation §8孤狼14 gk_hud = #gk_stage_solo14 gk_config
execute if score #gk_has_solo15 gk_config matches 1 run scoreboard players operation §8孤狼15 gk_hud = #gk_stage_solo15 gk_config
execute if score #gk_has_solo16 gk_config matches 1 run scoreboard players operation §8孤狼16 gk_hud = #gk_stage_solo16 gk_config
scoreboard objectives setdisplay sidebar gk_hud

# ------------------------------------------
# [步驟 14] 廣播與音效
# ------------------------------------------
tellraw @a {"text":"[槍王之王] 遊戲開始！各隊使用相同武器序列，率先完成全部 9 類的隊伍獲勝！","color":"gold","bold":true}
tellraw @a {"text":"[槍王之王] kills_needed = 本隊人數，孤狼可 1 人隊晉級。禁止丟棄物品，常駐 Carfak 補給。","color":"yellow"}
execute at @a run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.5 0.5
