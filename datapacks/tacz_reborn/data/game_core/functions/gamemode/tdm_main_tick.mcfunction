# ==========================================
# 檔案: gamemode/tdm_main_tick.mcfunction
# ==========================================
# 執行防堵機制 (防蹲點)
function game_core:gamemode/tdm_anti_camp
# 執行倒數計時器
function game_core:gamemode/tdm_timer_tick

#debug
execute as @a[tag=debug] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
tag @a[tag=debug] remove debug