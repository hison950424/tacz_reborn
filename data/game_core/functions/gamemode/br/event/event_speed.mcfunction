# 檔案: gamemode/br/event/event_speed.mcfunction
# 目的: 全場速度異常事件 — 隨機速度 II 或緩速 II，30 秒

execute store result score #br_speed_roll dummy run random value 1..2
execute if score #br_speed_roll dummy matches 1 run tellraw @a ["",{"text":"[特殊事件] ","color":"yellow","bold":true},{"text":"腎上腺素激增！所有存活玩家獲得速度 II，持續 30 秒！","color":"white"}]
execute if score #br_speed_roll dummy matches 2 run tellraw @a ["",{"text":"[特殊事件] ","color":"yellow","bold":true},{"text":"重力異常！所有存活玩家陷入緩速 II，持續 30 秒！","color":"white"}]
execute if score #br_speed_roll dummy matches 1 run effect give @a[scores={br_death_state=1}] minecraft:speed 30 1 true
execute if score #br_speed_roll dummy matches 2 run effect give @a[scores={br_death_state=1}] minecraft:slowness 30 1 true