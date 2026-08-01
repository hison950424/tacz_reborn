# ==========================================
# 檔案: gamemode/tdm_main_tick.mcfunction
# ==========================================
# 執行防堵機制 (防蹲點)
function game_core:gamemode/tdm/anti_camp
# 執行倒數計時器
function game_core:gamemode/tdm/timer_tick

clear @a tacz:ammo
data merge block 193 14 -85 {Items:[]}
data merge block 129 14 -11 {Items:[]}

#debug
execute as @a[tag=debug] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
tag @a[tag=debug] remove debug