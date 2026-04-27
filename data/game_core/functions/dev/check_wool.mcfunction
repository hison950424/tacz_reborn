# ==========================================
# 檔案: dev/check_wool.mcfunction
# 說明: 實際比對當前座標 (~ ~ ~) 的方塊，並召喚錨點
# ==========================================
## 記得更改map* ##
# --- 一般物資 (棕色) ---
execute if block ~ ~ ~ brown_wool run summon marker ~ ~ ~ {Tags:["loot_marker","crate_general","map_4"]}
execute if block ~ ~ ~ brown_wool run tellraw @a {"text":"[系統] 一般+1","color":"green"}
execute if block ~ ~ ~ brown_wool run setblock ~ ~ ~ air

# --- 醫療物資 (粉色) ---
execute if block ~ ~ ~ pink_wool run summon marker ~ ~ ~ {Tags:["loot_marker","crate_medical","map_4"]}
execute if block ~ ~ ~ pink_wool run tellraw @a {"text":"[系統] 醫療+1","color":"green"}
execute if block ~ ~ ~ pink_wool run setblock ~ ~ ~ air

# --- 配件物資 (青色) ---
execute if block ~ ~ ~ cyan_wool run summon marker ~ ~ ~ {Tags:["loot_marker","crate_attach","map_4"]}
execute if block ~ ~ ~ cyan_wool run tellraw @a {"text":"[系統] 配件+1","color":"green"}
execute if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ air

# --- 高階物資 (黃色) ---
execute if block ~ ~ ~ yellow_wool run summon marker ~ ~ ~ {Tags:["loot_marker","crate_high","map_4"]}
execute if block ~ ~ ~ yellow_wool run tellraw @a {"text":"[系統] 高階+1","color":"green"}
execute if block ~ ~ ~ yellow_wool run setblock ~ ~ ~ air