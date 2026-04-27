# check_slot_10.mcfunction（無 unless，單檔完成）

# 先預設不彈出
data modify storage backpack:temp flag set value 0b

# 槽位10有物品 → 準備彈出
execute if data entity @s {Inventory:[{Slot:10b}]} run data modify storage backpack:temp flag set value 1b

# 合法灰玻（雙層tag）→ 取消彈出
execute if data entity @s {Inventory:[{Slot:10b,id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}]} run data modify storage backpack:temp flag set value 0b
# （可選）合法灰玻（單層tag）→ 取消彈出

# flag=1b 才執行彈出流程
execute if data storage backpack:temp {flag:1b} run data modify storage backpack:temp item set from entity @s Inventory[{Slot:10b}]
execute if data storage backpack:temp {flag:1b} run item replace entity @s inventory.1 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":""}',Lore:[]},HideFlags:63,tag:{locked_backpack:1b}}
execute if data storage backpack:temp {flag:1b} at @s run summon item ~ ~0.1 ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["temp_drop"]}
execute if data storage backpack:temp {flag:1b} run data modify entity @e[type=item,tag=temp_drop,limit=1,sort=nearest] Item set from storage backpack:temp item
execute if data storage backpack:temp {flag:1b} run tag @e[type=item,tag=temp_drop,limit=1,sort=nearest] remove temp_drop

# 收尾
data remove storage backpack:temp item
data modify storage backpack:temp flag set value 0b
