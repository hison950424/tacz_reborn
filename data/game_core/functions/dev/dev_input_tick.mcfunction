# ==========================================
# game_core:system/dev_input_tick
# 偵測玩家 Q 丟特定物品並觸發對應 function
# 需在主 tick 中呼叫
# ==========================================
# Q 丟出木棒 → start_scan
execute as @s[scores={drop_stick=1..}] at @s run function game_core:dev/start_scan
execute as @s[scores={drop_stick=1..}] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:stick"}},distance=..3]
execute as @s[scores={drop_stick=1..}] run give @s minecraft:stick 1
execute as @s[scores={drop_stick=1..}] run scoreboard players set @s drop_stick 0

# Q 丟出終界之眼 → check_marker
execute as @s[scores={drop_eye=1..}] run function game_core:dev/check_marker
execute as @s[scores={drop_eye=1..}] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_eye"}},distance=..3]
execute as @s[scores={drop_eye=1..}] run give @s minecraft:ender_eye 1
execute as @s[scores={drop_eye=1..}] run scoreboard players set @s drop_eye 0

# Q 丟出終界之眼 → check_marker
execute as @s[scores={drop_barrier=1..}] at @s run kill @e[type=minecraft:marker,tag=loot_marker,limit=1,sort=nearest,distance=..10]
execute as @s[scores={drop_barrier=1..}] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrier"}},distance=..3]
execute as @s[scores={drop_barrier=1..}] run give @s minecraft:barrier 1
execute as @s[scores={drop_barrier=1..}] run scoreboard players set @s drop_barrier 0