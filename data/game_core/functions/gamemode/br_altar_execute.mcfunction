# ==========================================
# 檔案: gamemode/br_altar_execute.mcfunction
# 執行者: @s (完成讀條的活人隊友)
# ==========================================
scoreboard players set @s altar_progress 0

# 1. 鎖定並觸發祭壇冷卻 (放寬至 ..7 距離涵蓋角落)
execute at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..7,limit=1,sort=nearest] run scoreboard players set @s altar_cd 1800
# 【修復 Bug 3】使用萬用字元 * 讓 Text Display 讀取自己的計分板
execute at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..7,limit=1,sort=nearest] run data modify entity @s text set value '[{"text":"【 祭壇重載中：","color":"red","bold":true},{"score":{"name":"*","objective":"altar_cd_sec"},"color":"red","bold":true},{"text":"s 】","color":"red","bold":true}]'

execute at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..7,limit=1,sort=nearest] at @s run fill ~-4 ~-6 ~-4 ~4 ~-0.5 ~4 light_gray_concrete replace yellow_concrete
execute at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..7,limit=1,sort=nearest] at @s run setblock ~ ~-3 ~ soul_sand

execute at @s as @e[type=text_display,tag=br_altar,tag=altar_ready,distance=..7,limit=1,sort=nearest] run tag @s remove altar_ready

# 2. 復活瞬間的爆發回饋
execute at @s run playsound entity.wither.spawn master @s ~ ~ ~ 1 1.5
execute at @s run particle flash ~ ~ ~ 1 1 1 0 1 normal @s

# 3. 復活同隊擁有 soul_picked 的死者
execute at @e[type=text_display,tag=br_altar,distance=..7,limit=1,sort=nearest] as @a if score @s team_id = #current_player team_id if entity @s[tag=soul_picked] run function game_core:gamemode/br_altar_revive