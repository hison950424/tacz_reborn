# 檔案: gamemode/br/event/event_glow.mcfunction
# 目的: 全場發光事件 — 所有存活玩家持續發光 30 秒

tellraw @a ["",{"text":"[特殊事件] ","color":"yellow","bold":true},{"text":"目標暴露！所有存活玩家持續發光 30 秒！","color":"white"}]
effect give @a[scores={br_death_state=1}] minecraft:glowing 30 0 true