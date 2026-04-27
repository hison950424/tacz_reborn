execute as @a at @s run function game_core:backpack/fill_slots_locked_permanent
execute as @a if score @s backpack_level matches 0 at @s run function game_core:backpack/fill_slots_locked_lv0
execute as @a if score @s backpack_level matches 1 at @s run function game_core:backpack/fill_slots_locked_lv1
execute as @a if score @s backpack_level matches 2 at @s run function game_core:backpack/fill_slots_locked_lv2
