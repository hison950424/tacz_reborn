execute if data entity @s {Inventory:[{Slot:18b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.9 with air
execute if data entity @s {Inventory:[{Slot:19b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.10 with air
execute if data entity @s {Inventory:[{Slot:20b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.11 with air
execute if data entity @s {Inventory:[{Slot:21b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.12 with air

execute if score @s backpack_level matches 0..1 if data entity @s {Inventory:[{tag:{tag:{backpack_2:1b}}}]} at @s run tag @s add backpack_2
execute if score @s backpack_level matches 0..1 if data entity @s {Inventory:[{tag:{tag:{backpack_2:1b}}}]} at @s run scoreboard players set @s backpack_level 2
execute as @a[tag=backpack_2] at @s run clear @s minecraft:blue_shulker_box{tag:{backpack_2:1b}} 1
execute as @a[tag=backpack_2] at @s run tellraw @s {"text":"已升級背包等級: ","color":"green","extra":[{"score":{"name":"@s","objective":"backpack_level"},"color":"green"}]}
execute as @a[tag=backpack_2] at @s run playsound entity.player.levelup master @s ~ ~ ~ 5 1.8
execute as @a[tag=backpack_2] at @s run tag @s remove backpack_2


