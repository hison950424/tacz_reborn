# 檔案: fill_slots_locked_by_if.mcfunction
# 目的: 使用 IF 邏輯取代 UNLESS，用於永久性填補鎖定背包的空間。
# 邏輯: 1. 為所有玩家設定一個「需要填入」的標籤。
#       2. 如果格子已經有正確的鎖定物品，則移除「需要填入」的標籤。
#       3. 只有仍帶有「需要填入」標籤的格子才執行填入動作。

# 建立一個臨時標籤來標記所有需要檢查的玩家
tag @s add needs_fill
# --- 4~8 槽位 ---

# 1. 檢查 Slot 13b (對應背包 Slot 4)
# 如果玩家 Inventory 的 Slot 13b 已經有鎖定的玻璃片，則移除 needs_fill 標籤
execute as @a at @s if data entity @s {Inventory:[{Slot:13b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
# 如果玩家仍帶有 needs_fill 標籤 (表示 Slot 13b 是空的或物品不符)，則填入物品
execute as @s[tag=needs_fill] at @s run item replace entity @s inventory.4 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
# 重設標籤給下一個 Slot 檢查
tag @s add needs_fill 

execute as @a at @s if data entity @s {Inventory:[{Slot:14b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.5 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:15b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.6 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:16b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.7 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:17b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.8 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

#########################################

execute as @a at @s if data entity @s {Inventory:[{Slot:22b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.13 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:23b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.14 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:24b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.15 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:25b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.16 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:26b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.17 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

#########################################

execute as @a at @s if data entity @s {Inventory:[{Slot:31b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.22 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:32b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.23 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:33b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.24 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:34b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.25 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill

execute as @a at @s if data entity @s {Inventory:[{Slot:35b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run tag @s remove needs_fill
execute as @s[tag=needs_fill] run item replace entity @s inventory.26 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}} 1
tag @s add needs_fill




# 清理臨時標籤
tag @s remove needs_fill
