# ==========================================
# 檔案: gamemode/br_loot_spawn.mcfunction
# ==========================================

# --- [0. 動態路由分配] ---
# 確保開局時沒有殘留的啟動標籤
tag @e[type=marker,tag=loot_marker] remove active_loot

# [修正] 將變數對齊 lobby_tick 的 #global br_map，並將標籤對齊 check_wool 的 map_1 ~ map_5
execute if score #global br_map matches 1 as @e[type=marker,tag=map_1] run tag @s add active_loot
execute if score #global br_map matches 2 as @e[type=marker,tag=map_2] run tag @s add active_loot
execute if score #global br_map matches 3 as @e[type=marker,tag=map_3] run tag @s add active_loot
execute if score #global br_map matches 4 as @e[type=marker,tag=map_4] run tag @s add active_loot
execute if score #global br_map matches 5 as @e[type=marker,tag=map_5] run tag @s add active_loot

# --- [1. 殘留清理防呆] ---
# (以下維持你原本正確的程式碼不變...)
execute as @e[type=marker,tag=active_loot] at @s run setblock ~ ~ ~ air replace
kill @e[type=item_display,tag=loot_display]
kill @e[type=item]

# --- [2. 全域亂數賦值] ---
# 只為被喚醒的 marker 抽隨機數
execute as @e[type=marker,tag=active_loot] run execute store result score @s rand_val run random value 1..100

# --- [3. 箱子生成與 NBT 注入 (50% 機率)] ---
# 一般箱
execute as @e[type=marker,tag=active_loot,tag=crate_general,scores={rand_val=1..50}] at @s run setblock ~ ~ ~ minecraft:barrel{LootTable:"br:chests/general"} replace

# 醫療箱與視覺模型
execute as @e[type=marker,tag=active_loot,tag=crate_medical,scores={rand_val=1..50}] at @s run setblock ~ ~ ~ variantbarrels:cherry_barrel{LootTable:"br:chests/medical"} replace

# 配件箱與視覺模型
execute as @e[type=marker,tag=active_loot,tag=crate_attach,scores={rand_val=1..50}] at @s run setblock ~ ~ ~ variantbarrels:warped_barrel{LootTable:"br:chests/attach"} replace

# 高階箱與視覺模型
execute as @e[type=marker,tag=active_loot,tag=crate_high,scores={rand_val=1..50}] at @s run setblock ~ ~ ~ variantbarrels:bamboo_barrel{LootTable:"br:chests/high"} replace

# 備註: 這裡「不」移除 active_loot 標籤，讓它保留到遊戲結束，方便重置時精準清理。