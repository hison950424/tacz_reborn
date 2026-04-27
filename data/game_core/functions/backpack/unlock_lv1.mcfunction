execute if data entity @s {Inventory:[{Slot:27b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.18 with air
execute if data entity @s {Inventory:[{Slot:28b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.19 with air
execute if data entity @s {Inventory:[{Slot:29b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.20 with air
execute if data entity @s {Inventory:[{Slot:30b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.21 with air

execute if score @s backpack_level matches 0 if data entity @s {Inventory:[{tag:{tag:{backpack_1:1b}}}]} at @s run tag @s add backpack_1
execute if score @s backpack_level matches 0 if data entity @s {Inventory:[{tag:{tag:{backpack_1:1b}}}]} at @s run scoreboard players set @s backpack_level 1
execute as @a[tag=backpack_1] at @s run clear @s minecraft:light_gray_shulker_box{tag:{backpack_1:1b}} 1
execute as @a[tag=backpack_1] at @s run tellraw @s {"text":"已升級背包等級: ","color":"green","extra":[{"score":{"name":"@s","objective":"backpack_level"},"color":"green"}]}
execute as @a[tag=backpack_1] at @s run playsound entity.player.levelup master @s ~ ~ ~ 5 1.8
execute as @a[tag=backpack_1] at @s run tag @s remove backpack_1