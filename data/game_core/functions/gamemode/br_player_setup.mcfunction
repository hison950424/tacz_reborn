# ==========================================
# 檔案: gamemode/br_player_setup.mcfunction
# 執行者: @s (沒有 br_setup 標籤的玩家)
# 目的: 分配流水號 ID 並生成專屬追蹤器
# ==========================================

scoreboard players set @s altar_progress 0
scoreboard players set @s revive_progress 0
scoreboard players set @s is_reviving 0

# 1. 給予設定完畢的標籤，防止重複執行
tag @s add br_setup

# 2. 全域流水號 +1，並賦予玩家
scoreboard players add #global_id br_sys 1
scoreboard players operation @s br_id = #global_id br_sys

# 3. 生成 Marker，並利用 1.19+ 的 execute summon 直接對剛生成的實體操作
execute summon marker run function game_core:gamemode/br_marker_init

execute as @s[team=red] run scoreboard players set @s team_id 1
execute as @s[team=blue] run scoreboard players set @s team_id 2
execute as @s[team=green] run scoreboard players set @s team_id 3
execute as @s[team=white] run scoreboard players set @s team_id 4
execute as @s[tag=solo] run scoreboard players set @s team_id 5

execute as @s run attribute @s minecraft:generic.max_health base set 100
effect give @s minecraft:instant_health 3 50

# 給予第一次加入大逃殺的玩家狀態 1
scoreboard players set @s br_death_state 1