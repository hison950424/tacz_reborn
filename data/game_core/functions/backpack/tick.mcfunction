# data/backpack/functions/tick.mcfunction
 execute as @a if data entity @s {Inventory:[{tag:{tag:{backpack_3:1b}}}]} if score @s backpack_level matches ..2 at @s run function game_core:backpack/upgrade_3
 execute as @a if data entity @s {Inventory:[{tag:{tag:{backpack_2:1b}}}]} if score @s backpack_level matches ..1 at @s run function game_core:backpack/upgrade_2
 execute as @a if data entity @s {Inventory:[{tag:{tag:{backpack_1:1b}}}]} if score @s backpack_level matches ..0 at @s run function game_core:backpack/upgrade_1

function game_core:backpack/protect_slots

