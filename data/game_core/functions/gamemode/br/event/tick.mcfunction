# 檔案: gamemode/br/event/tick.mcfunction
# 目的: 特殊事件 30 秒倒數計時器（每秒呼叫一次，來自 main_tick）
# 執行者: 無目標（全域）

scoreboard players add #br_event_timer dummy 1
execute if score #br_event_timer dummy matches 30.. run function game_core:gamemode/br/event/dispatch
execute if score #br_event_timer dummy matches 30.. run scoreboard players set #br_event_timer dummy 0