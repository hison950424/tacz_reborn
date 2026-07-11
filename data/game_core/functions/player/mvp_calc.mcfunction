# ==========================================
# 檔案: mvp/calculate_mvp.mcfunction
# 依賴: 讀取 gd656killicon 插件的分數
# 模式:
#   game_state=1          → BR
#   game_state=2, sub=1   → TDM
#   game_state=2, sub=2   → DOM
# ==========================================

# 0. 清理所有舊標籤
tag @a remove mvp_killer
tag @a remove mvp_helper
tag @a remove mvp_loser
tag @a remove mvp_reviver
tag @a remove mvp_altar
tag @a remove mvp_capper
tag @a remove mvp_flipper
tag @a remove mvp_defender

# ==========================================
# 1. 王牌殺手（所有模式，最多擊殺 ≥ 1）
# ==========================================
scoreboard players set #max_kill gd656killicon.kill 0
execute as @a run scoreboard players operation #max_kill gd656killicon.kill > @s gd656killicon.kill
execute if score #max_kill gd656killicon.kill matches 1.. as @a if score @s gd656killicon.kill = #max_kill gd656killicon.kill run tag @s add mvp_killer

# ==========================================
# 2. 戰地砲灰（所有模式，最多陣亡 ≥ 1）
# ==========================================
scoreboard players set #max_death gd656killicon.death 0
execute as @a run scoreboard players operation #max_death gd656killicon.death > @s gd656killicon.death
execute if score #max_death gd656killicon.death matches 1.. as @a if score @s gd656killicon.death = #max_death gd656killicon.death run tag @s add mvp_loser

# ==========================================
# 3. 國民神隊友（最多助攻 ≥ 1）
# ==========================================

scoreboard players set #max_assist gd656killicon.assist 0
execute as @a run scoreboard players operation #max_assist gd656killicon.assist > @s gd656killicon.assist
execute if score #max_assist gd656killicon.assist matches 1.. as @a if score @s gd656killicon.assist = #max_assist gd656killicon.assist run tag @s add mvp_helper


# ==========================================
# 3. BR 專屬
# ==========================================

# 生死情義（最多拉起 ≥ 1）
execute if score #global game_state matches 1 run scoreboard players set #max_revive stat_br_revives_match 0
execute if score #global game_state matches 1 as @a run scoreboard players operation #max_revive stat_br_revives_match > @s stat_br_revives_match
execute if score #global game_state matches 1 if score #max_revive stat_br_revives_match matches 1.. as @a if score @s stat_br_revives_match = #max_revive stat_br_revives_match run tag @s add mvp_reviver

# 祭壇英雄（最多祭壇復活 ≥ 1）
execute if score #global game_state matches 1 run scoreboard players set #max_altar stat_br_altars_match 0
execute if score #global game_state matches 1 as @a run scoreboard players operation #max_altar stat_br_altars_match > @s stat_br_altars_match
execute if score #global game_state matches 1 if score #max_altar stat_br_altars_match matches 1.. as @a if score @s stat_br_altars_match = #max_altar stat_br_altars_match run tag @s add mvp_altar

# ==========================================
# 4. TDM 專屬
# ==========================================


# ==========================================
# 5. DOM 專屬
# ==========================================

# 佔點先鋒（最多佔點貢獻次數 ≥ 1）
execute if score #global arms_sub_mode matches 2 run scoreboard players set #max_cap stat_dom_caps_match 0
execute if score #global arms_sub_mode matches 2 as @a run scoreboard players operation #max_cap stat_dom_caps_match > @s stat_dom_caps_match
execute if score #global arms_sub_mode matches 2 if score #max_cap stat_dom_caps_match matches 1.. as @a if score @s stat_dom_caps_match = #max_cap stat_dom_caps_match run tag @s add mvp_capper

# 旗幟主宰（最多佔領成功次數 ≥ 1）
execute if score #global arms_sub_mode matches 2 run scoreboard players set #max_flip stat_dom_flips_match 0
execute if score #global arms_sub_mode matches 2 as @a run scoreboard players operation #max_flip stat_dom_flips_match > @s stat_dom_flips_match
execute if score #global arms_sub_mode matches 2 if score #max_flip stat_dom_flips_match matches 1.. as @a if score @s stat_dom_flips_match = #max_flip stat_dom_flips_match run tag @s add mvp_flipper

# 守土英雄（最多守點次數 ≥ 1）
execute if score #global arms_sub_mode matches 2 run scoreboard players set #max_def stat_dom_def_match 0
execute if score #global arms_sub_mode matches 2 as @a run scoreboard players operation #max_def stat_dom_def_match > @s stat_dom_def_match
execute if score #global arms_sub_mode matches 2 if score #max_def stat_dom_def_match matches 1.. as @a if score @s stat_dom_def_match = #max_def stat_dom_def_match run tag @s add mvp_defender
