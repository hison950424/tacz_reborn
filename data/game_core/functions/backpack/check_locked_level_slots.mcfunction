# LV3 未解鎖 0~3
execute as @a at @s if score @s backpack_level matches ..2 run function game_core:backpack/check_slot_0
execute as @a at @s if score @s backpack_level matches ..2 run function game_core:backpack/check_slot_1
execute as @a at @s if score @s backpack_level matches ..2 run function game_core:backpack/check_slot_2
execute as @a at @s if score @s backpack_level matches ..2 run function game_core:backpack/check_slot_3

# LV2 未解鎖 9~12
execute as @a at @s if score @s backpack_level matches ..1 run function game_core:backpack/check_slot_9
execute as @a at @s if score @s backpack_level matches ..1 run function game_core:backpack/check_slot_10
execute as @a at @s if score @s backpack_level matches ..1 run function game_core:backpack/check_slot_11
execute as @a at @s if score @s backpack_level matches ..1 run function game_core:backpack/check_slot_12

# LV1 未解鎖 18~21
execute as @a at @s if score @s backpack_level matches 0 run function game_core:backpack/check_slot_18
execute as @a at @s if score @s backpack_level matches 0 run function game_core:backpack/check_slot_19
execute as @a at @s if score @s backpack_level matches 0 run function game_core:backpack/check_slot_20
execute as @a at @s if score @s backpack_level matches 0 run function game_core:backpack/check_slot_21

function game_core:backpack/lock_slots
