
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:9b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.0 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:10b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.1 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:11b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.2 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:12b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.3 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

#########################################

execute as @a at @s if data entity @s {Inventory:[{Slot:18b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.9 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:19b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.10 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:20b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.11 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:21b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.12 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

#########################################

execute as @a at @s if data entity @s {Inventory:[{Slot:27b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.18 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:28b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.19 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:29b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.20 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

execute as @a at @s if data entity @s {Inventory:[{Slot:30b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill_0
execute as @s[tag=needs_fill_0] run item replace entity @s inventory.21 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill_0

# 清理臨時標籤
tag @s remove needs_fill_0







