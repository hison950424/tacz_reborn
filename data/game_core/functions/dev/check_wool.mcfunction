# ==========================================
# 檔案: dev/check_wool.mcfunction
# 說明: 實際比對當前座標 (~ ~ ~) 的方塊，並召喚錨點
# ==========================================
## 記得更改map* ##
# --- 一般物資 (棕色) ---
execute if block ~ ~ ~ stripped_acacia_wood run summon marker ~ ~ ~ {Tags:["loot_marker","crate_general","map_5"]}
execute if block ~ ~ ~ stripped_acacia_wood run tellraw @a {"text":"[系統] 一般+1","color":"green"}
execute if block ~ ~ ~ stripped_acacia_wood run setblock ~ ~ ~ air

# --- 醫療物資 (紅色) ---
execute if block ~ ~ ~ stripped_crimson_hyphae run summon marker ~ ~ ~ {Tags:["loot_marker","crate_medical","map_5"]}
execute if block ~ ~ ~ stripped_crimson_hyphae run tellraw @a {"text":"[系統] 醫療+1","color":"green"}
execute if block ~ ~ ~ stripped_crimson_hyphae run setblock ~ ~ ~ air

# --- 配件物資 (青色) ---
execute if block ~ ~ ~ stripped_warped_hyphae run summon marker ~ ~ ~ {Tags:["loot_marker","crate_attach","map_5"]}
execute if block ~ ~ ~ stripped_warped_hyphae run tellraw @a {"text":"[系統] 配件+1","color":"green"}
execute if block ~ ~ ~ stripped_warped_hyphae run setblock ~ ~ ~ air

# --- 高階物資 (紫色) ---
execute if block ~ ~ ~ waxed_exposed_copper run summon marker ~ ~ ~ {Tags:["loot_marker","crate_high","map_5"]}
execute if block ~ ~ ~ waxed_exposed_copper run tellraw @a {"text":"[系統] 高階+1","color":"green"}
execute if block ~ ~ ~ waxed_exposed_copper run setblock ~ ~ ~ air