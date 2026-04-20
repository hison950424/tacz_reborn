# ==========================================
# 檔案: mvp/calculate_mvp.mcfunction
# 依賴: 讀取 gd656killicon 插件的分數
# ==========================================

# 0. 清理舊標籤
tag @a remove mvp_killer
tag @a remove mvp_helper
tag @a remove mvp_loser

# 1. 王牌殺手 (最高擊殺)
scoreboard players set #max_kill gd656killicon.kill 0
execute as @a run scoreboard players operation #max_kill gd656killicon.kill > @s gd656killicon.kill
execute if score #max_kill gd656killicon.kill matches 1.. as @a if score @s gd656killicon.kill = #max_kill gd656killicon.kill run tag @s add mvp_killer

# 2. 國民神隊友 (最高助攻)
scoreboard players set #max_assist gd656killicon.assist 0
execute as @a run scoreboard players operation #max_assist gd656killicon.assist > @s gd656killicon.assist
execute if score #max_assist gd656killicon.assist matches 1.. as @a if score @s gd656killicon.assist = #max_assist gd656killicon.assist run tag @s add mvp_helper

# 3. 戰地砲灰 (最多死亡)
scoreboard players set #max_death gd656killicon.death 0
execute as @a run scoreboard players operation #max_death gd656killicon.death > @s gd656killicon.death
execute if score #max_death gd656killicon.death matches 1.. as @a if score @s gd656killicon.death = #max_death gd656killicon.death run tag @s add mvp_loser