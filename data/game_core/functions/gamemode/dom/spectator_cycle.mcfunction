# ==========================================
# 檔案: gamemode/dom/spectator_cycle.mcfunction
# 執行者: @s（死亡觀察者）
# 觸發時機: main_tick 偵測到距離 > 2 格（玩家按 Shift 脫離）
# 說明: 索引遞增，附身下一個存活隊友；超出存活總數時歸 1 循環
#       Shift 脫離 = 切換至下一個存活隊友
# ==========================================

tag @s add dom_cycling

# 1. 觀看索引 +1，同步至全域
scoreboard players add @s spectate_idx 1
scoreboard players operation #dom_spec_idx dom_config = @s spectate_idx

# 2. 清除暫存標籤與計數器
tag @a remove dom_spec_target
scoreboard players set #dom_spec_assign dom_config 1

# 3. 對本隊存活隊友發流水號
execute if entity @s[team=red] as @a[team=red,tag=dom_alive] run tag @s add dom_spec_target
execute if entity @s[team=blue] as @a[team=blue,tag=dom_alive] run tag @s add dom_spec_target
execute as @a[tag=dom_spec_target] run scoreboard players operation @s sys_index = #dom_spec_assign dom_config
execute as @a[tag=dom_spec_target] run scoreboard players add #dom_spec_assign dom_config 1

# 4. 計算存活總數；超出時歸 1（循環）
scoreboard players operation #dom_spec_total dom_config = #dom_spec_assign dom_config
scoreboard players remove #dom_spec_total dom_config 1
execute if score @s spectate_idx > #dom_spec_total dom_config run scoreboard players set @s spectate_idx 1
scoreboard players operation #dom_spec_idx dom_config = @s spectate_idx

# 5. 附身流水號對應的存活隊友
execute if score #dom_spec_total dom_config matches 1.. as @a[tag=dom_spec_target] if score @s sys_index = #dom_spec_idx dom_config run spectate @s @a[tag=dom_cycling,limit=1]

tag @a remove dom_spec_target
tag @s remove dom_cycling
