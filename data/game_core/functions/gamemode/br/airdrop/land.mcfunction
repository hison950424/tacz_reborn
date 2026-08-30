# ==========================================
# game_core:gamemode/br/airdrop/land
# 空投村民落地時觸發
# ==========================================

# 步驟 1：在村民位置召喚 loot_marker（記錄空頭箱位置，遊戲結束時清除用）
execute as @e[type=minecraft:villager,tag=airdrop_bird,limit=1] at @s run summon minecraft:marker ~ ~ ~ {Tags:["loot_marker","crate_airdrop"]}

# 步驟 2：在 marker 位置放置空頭箱（依地圖 + 武器限定模式選擇 loot table）
# 一般模式（無限定）：依地圖選擇
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 0 if score #global br_map matches 1 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_map1"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 0 if score #global br_map matches 2 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_map2"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 0 if score #global br_map matches 3 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_map3"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 0 if score #global br_map matches 4 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_map4"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 0 if score #global br_map matches 5 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_map5"}
# 武器限定模式：使用模式對應的空頭 loot table
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 1 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_mode1"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 2 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_mode2"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 3 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_mode3"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 4 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_mode4"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 5 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_mode5"}
execute as @e[type=minecraft:marker,tag=crate_airdrop] at @s if score #br_weapon_mode br_sys matches 6 run setblock ~ ~ ~ variantbarrels:mangrove_barrel[facing=up]{LootTable:"br:chests/airdrop_mode6"}

# 步驟 3：落地特效與音效
execute as @e[type=minecraft:villager,tag=airdrop_bird,limit=1] at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
execute as @e[type=minecraft:villager,tag=airdrop_bird,limit=1] at @s run particle minecraft:campfire_signal_smoke ~ ~ ~ 0.3 1 0.3 0.01 30
execute as @e[type=minecraft:villager,tag=airdrop_bird,limit=1] at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 0.5 1.2

# 步驟 4：殺掉空投村民
kill @e[type=minecraft:villager,tag=airdrop_bird]

# 步驟 5：重設延遲計數器
scoreboard players set #br_airdrop_delay dummy -1

# 步驟 6：公告落地
tellraw @a ["",{"text":"[空頭] ","color":"gold","bold":true},{"text":"空頭已落地！座標：X=","color":"yellow"},{"score":{"name":"#air_x","objective":"dummy"}},{"text":"  Z=","color":"yellow"},{"score":{"name":"#air_z","objective":"dummy"}},{"text":"","color":"red","bold":true}]
