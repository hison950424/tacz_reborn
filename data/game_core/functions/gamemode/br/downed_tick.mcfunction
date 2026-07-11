# ==========================================
# 檔案: gamemode/br_downed_tick.mcfunction
# 執行者: @s (倒地史萊姆)
# 目的: 流血機制與靈魂火焰視覺
# ==========================================

# 1. 消除墜落傷害：防止小豬在空中生成時摔死
data modify entity @s FallDistance set value 0f

# 2. 視覺回饋 (明確的倒地與求救標記)
# A. 鮮血輪廓：每 Tick 在小豬的碰撞箱範圍內產生微量紅石粒子
execute at @s run particle minecraft:dust 0.7 0.0 0.0 1.2 ~ ~0.2 ~ 0.2 0.2 0.2 0.01 2 normal
# B. 求救信號：每秒一次，在屍體上方噴發靈魂火焰
execute if score #global br_timer matches 1 at @s run particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.1 0.3 0.1 0.05 5 normal

# 3. 獲取真實血量 
execute store result score @s br_slime_hp run data get entity @s Health

# 4. 流血機制：沒被救的時候，每秒扣 2 滴 (50 秒會從 300 扣到 200)
execute if score #global br_timer matches 1 unless entity @s[tag=being_revived] run damage @s 2 minecraft:magic

# 5. 【防擊殺判定】: 血量跌破 200 視為徹底死亡！
execute if score @s br_slime_hp matches ..200 run kill @s

# 6. 清除救援標記 (交給玩家 Tick 重新判定)
tag @s remove being_revived