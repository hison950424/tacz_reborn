execute if data entity @s {Inventory:[{Slot:9b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.0 with air
execute if data entity @s {Inventory:[{Slot:10b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.1 with air
execute if data entity @s {Inventory:[{Slot:11b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.2 with air
execute if data entity @s {Inventory:[{Slot:12b,tag:{tag:{locked_backpack:1b}}}]} at @s run item replace entity @s inventory.3 with air

execute if score @s backpack_level matches 0..2 if data entity @s {Inventory:[{tag:{tag:{backpack_3:1b}}}]} at @s run tag @s add backpack_3
execute if score @s backpack_level matches 0..2 if data entity @s {Inventory:[{tag:{tag:{backpack_3:1b}}}]} at @s run scoreboard players set @s backpack_level 3
execute as @a[tag=backpack_3] at @s run clear @s minecraft:purple_shulker_box{tag:{backpack_3:1b}} 1
execute as @a[tag=backpack_3] at @s run tellraw @s {"text":"已升級背包等級: ","color":"green","extra":[{"score":{"name":"@s","objective":"backpack_level"},"color":"green"}]}
execute as @a[tag=backpack_3] at @s run playsound entity.player.levelup master @s ~ ~ ~ 5 1.8
execute as @a[tag=backpack_3] at @s run tag @s remove backpack_3


