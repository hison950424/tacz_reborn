# ==========================================
# 檔案: gamemode/dom/round_end_adjust.mcfunction
# 說明: 每回合結束後的個人存活/陣亡金錢調整
#       存活玩家 -$100（本回合無死亡，財務較充裕）
#       陣亡玩家 +$100（本回合死亡過，額外補償）
# ==========================================

execute as @a[team=red,tag=dom_alive] run gd656killicon server statistics remove score @s 400
execute as @a[team=blue,tag=dom_alive] run gd656killicon server statistics remove score @s 400
execute as @a[team=red,tag=!dom_alive] run gd656killicon server statistics add score @s 200
execute as @a[team=blue,tag=!dom_alive] run gd656killicon server statistics add score @s 200

execute as @a[team=red,tag=dom_alive] run tellraw @s ["",{"text":"[金錢] ","color":"gold","bold":true},{"text":"本回合存活 -$400  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute as @a[team=blue,tag=dom_alive] run tellraw @s ["",{"text":"[金錢] ","color":"gold","bold":true},{"text":"本回合存活 -$400  │  按 [Caps Lock] 查看金錢","color":"gray"}]
execute as @a[team=red,tag=!dom_alive] run tellraw @s ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合陣亡補償 +$200  │  按 [Caps Lock] 查看金錢","color":"green"}]
execute as @a[team=blue,tag=!dom_alive] run tellraw @s ["",{"text":"[金錢] ","color":"green","bold":true},{"text":"本回合陣亡補償 +$200  │  按 [Caps Lock] 查看金錢","color":"green"}]

# 佔點收入本回合結算通知（有收入才顯示）
execute as @a[team=red] if score @s dom_point_earn matches 1.. run tellraw @s ["",{"text":"[金錢] ","color":"gold","bold":true},{"text":"本回合佔點收入 +$","color":"green"},{"score":{"name":"@s","objective":"dom_point_earn"},"color":"green"},{"text":"  │  按 [Caps Lock] 查看金錢","color":"green"}]
execute as @a[team=blue] if score @s dom_point_earn matches 1.. run tellraw @s ["",{"text":"[金錢] ","color":"gold","bold":true},{"text":"本回合佔點收入 +$","color":"green"},{"score":{"name":"@s","objective":"dom_point_earn"},"color":"green"},{"text":"  │  按 [Caps Lock] 查看金錢","color":"green"}]

# 方向 C：存活優勢計分 +50 dom_score（存活人數多的隊伍）
scoreboard players set #dom_surv_red dom_config 0
scoreboard players set #dom_surv_blue dom_config 0
execute as @a[team=red,tag=dom_alive] run scoreboard players add #dom_surv_red dom_config 1
execute as @a[team=blue,tag=dom_alive] run scoreboard players add #dom_surv_blue dom_config 1
execute if score #dom_surv_red dom_config > #dom_surv_blue dom_config run scoreboard players add #Red dom_score 50
execute if score #dom_surv_blue dom_config > #dom_surv_red dom_config run scoreboard players add #Blue dom_score 50
execute if score #dom_surv_red dom_config > #dom_surv_blue dom_config run tellraw @a[team=red] ["",{"text":"[得分] ","color":"aqua","bold":true},{"text":"本回合存活優勢 +50 分","color":"aqua"}]
execute if score #dom_surv_blue dom_config > #dom_surv_red dom_config run tellraw @a[team=blue] ["",{"text":"[得分] ","color":"aqua","bold":true},{"text":"本回合存活優勢 +50 分","color":"aqua"}]
