# 檔案: gamemode/br/event/dispatch.mcfunction
# 目的: 每 30 秒抽選一次特殊事件
# 機率分配: 1=無事件(靜默), 2=全場發光, 3=速度異常

execute store result score #br_event_roll dummy run random value 1..3
execute if score #br_event_roll dummy matches 2 run function game_core:gamemode/br/event/event_glow
execute if score #br_event_roll dummy matches 3 run function game_core:gamemode/br/event/event_speed