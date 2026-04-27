tag @s add needs_fill_2

execute as @a at @s if data entity @s {Inventory:[{Slot:9b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_2
execute as @s[tag=needs_fill_2] run item replace entity @s inventory.0 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_2

execute as @a at @s if data entity @s {Inventory:[{Slot:10b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_2
execute as @s[tag=needs_fill_2] run item replace entity @s inventory.1 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_2

execute as @a at @s if data entity @s {Inventory:[{Slot:11b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_2
execute as @s[tag=needs_fill_2] run item replace entity @s inventory.2 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_2

execute as @a at @s if data entity @s {Inventory:[{Slot:12b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_2
execute as @s[tag=needs_fill_2] run item replace entity @s inventory.3 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_2

# 清理臨時標籤
tag @s remove needs_fill_2