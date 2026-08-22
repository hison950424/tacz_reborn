# 檔案: give_attach_inventory.mcfunction
# 目的: 將本階段配件強制給入物品欄（slot 9+），而非快捷欄
# 執行者: @s（玩家本身）
#
# 原理（barrier 佔位法）：
#   Minecraft 的 give 指令優先填充快捷欄（slot 0~8）。
#   slot 0 已有武器，slot 1 已有 carfak，因此 slot 2~8 若為空會先被佔用。
#   解法：先用 barrier 填滿 slot 2~8，使 give 無法放入快捷欄，
#   改放到物品欄（slot 9 開始）。完成後再清除 barrier 釋放格位。
#
# 呼叫時機：
#   - 遊戲開始（start.mcfunction 直接內嵌此邏輯，slot 9 保留給彈藥箱，配件從 slot 10 開始）
#   - 階段推進（advance_stage_*.mcfunction）：give_weapon 後緊接呼叫此函式

# 佔滿 slot 2~8，阻止 give 落入快捷欄
item replace entity @s container.2 with minecraft:barrier 1
item replace entity @s container.3 with minecraft:barrier 1
item replace entity @s container.4 with minecraft:barrier 1
item replace entity @s container.5 with minecraft:barrier 1
item replace entity @s container.6 with minecraft:barrier 1
item replace entity @s container.7 with minecraft:barrier 1
item replace entity @s container.8 with minecraft:barrier 1
# 給予本階段配件（因快捷欄已滿，進物品欄 slot 9+）
function game_core:gamemode/gk/give_attach_for_stage
# 清除佔位 barrier，還原 slot 2~8
item replace entity @s container.2 with minecraft:air 1
item replace entity @s container.3 with minecraft:air 1
item replace entity @s container.4 with minecraft:air 1
item replace entity @s container.5 with minecraft:air 1
item replace entity @s container.6 with minecraft:air 1
item replace entity @s container.7 with minecraft:air 1
item replace entity @s container.8 with minecraft:air 1