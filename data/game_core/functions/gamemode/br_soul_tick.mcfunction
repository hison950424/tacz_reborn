# ==========================================
# 檔案: gamemode/br_soul_tick.mcfunction
# 執行者: @s (地上的靈魂 Marker)，每 Tick 執行
# ==========================================

# 每秒 (timer=0) 噴發一次明顯的隊伍顏色粒子 (紅、藍、綠、白)
execute if score @s team_id matches 1 at @s run particle dust 1.0 0.1 0.1 1.5 ~ ~0.5 ~ 0.2 0.5 0.2 0.05 10 normal
execute if score @s team_id matches 2 at @s run particle dust 0.1 0.1 1.0 1.5 ~ ~0.5 ~ 0.2 0.5 0.2 0.05 10 normal
execute if score @s team_id matches 3 at @s run particle dust 0.1 1.0 0.1 1.5 ~ ~0.5 ~ 0.2 0.5 0.2 0.05 10 normal
execute if score @s team_id matches 4 at @s run particle dust 1.0 1.0 1.0 1.5 ~ ~0.5 ~ 0.2 0.5 0.2 0.05 10 normal

# 每 Tick 產生少量的靈魂火焰微粒，增加神祕感
execute at @s run particle soul_fire_flame ~ ~0.2 ~ 0.1 0.2 0.1 0 1 normal