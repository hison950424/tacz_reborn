# ==========================================
# 檔案: gamemode/br_countdown_tick.mcfunction
# 每 Tick 執行：開局等待倒數（Phase 0）
# 由 br_main_tick 在 br_phase = 0 時呼叫
# 倒數從 100 Ticks（5秒）遞減至 0，結束後呼叫 br_deploy_start
# ==========================================

# 每 Tick 遞減倒數計時器
scoreboard players remove #br_countdown br_sys 1

# 顯示倒數 ActionBar（依計時器區間對應秒數）
# 每秒對應 20 Ticks：81..100="5", 61..80="4", 41..60="3", 21..40="2", 1..20="1"
execute if score #br_countdown br_sys matches 81..100 run title @a actionbar {"text":"✈ 空投機即將起飛... 5","color":"gold","bold":true}
execute if score #br_countdown br_sys matches 61..80 run title @a actionbar {"text":"✈ 空投機即將起飛... 4","color":"gold","bold":true}
execute if score #br_countdown br_sys matches 41..60 run title @a actionbar {"text":"✈ 空投機即將起飛... 3","color":"yellow","bold":true}
execute if score #br_countdown br_sys matches 21..40 run title @a actionbar {"text":"✈ 空投機即將起飛... 2","color":"yellow","bold":true}
execute if score #br_countdown br_sys matches 1..20 run title @a actionbar {"text":"✈ 空投機即將起飛... 1","color":"red","bold":true}

# 整秒切換音效：在計時器剛進入新區間的那一 Tick 播放（各秒音調遞增，製造緊張感）
execute if score #br_countdown br_sys matches 80 as @a at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.2
execute if score #br_countdown br_sys matches 60 as @a at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.4
execute if score #br_countdown br_sys matches 40 as @a at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.6
execute if score #br_countdown br_sys matches 20 as @a at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.8

# 倒數歸零：呼叫起飛函數
# br_deploy_start 會設定 br_phase = 1，此後 br_main_tick 不再呼叫本函數
execute if score #br_countdown br_sys matches ..0 run tellraw @a {"text":"全體進入保護期60秒","color":"red","bold":true}
execute if score #br_countdown br_sys matches ..0 run function game_core:system/br_deploy_start
