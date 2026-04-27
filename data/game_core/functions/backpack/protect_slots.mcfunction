# 刪除玩家附近 1 格內的「被鎖定灰玻」掉落物
execute as @a at @s run kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:gray_stained_glass_pane",tag:{tag:{locked_backpack:1b}}}}]
# 清除快捷欄灰玻
execute as @a at @s run function game_core:backpack/clear_hotbar

# 依等級清掉已解鎖槽位的灰玻
# execute as @a[scores={backpack_level=1..}] run function game_core:backpack/unlock_lv1
# execute as @a[scores={backpack_level=2..}] run function game_core:backpack/unlock_lv2
# execute as @a[scores={backpack_level=3..}] run function game_core:backpack/unlock_lv3

# 檢查鎖位是否被替換，將非灰玻退回
function game_core:backpack/check_locked_replaced
