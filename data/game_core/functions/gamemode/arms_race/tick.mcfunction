# ==========================================
# 檔案: system/arms_race_tick.mcfunction
# 屬性: 主路由 (Main Router) - v1.7 規範
# ==========================================

# --- [1. 全域環境處理] ---
# 防丟棄機制
tag @e[type=item,tag=!not_money] add not_money
execute as @e[type=item,tag=not_money] at @s run title @p[distance=..2] actionbar {"text":"[警告] 軍備競賽中嚴禁丟棄裝備！","color":"red"}
execute as @e[type=item,tag=not_money] run data merge entity @s {PickupDelay:0s}

# --- [1.5 DOM 死亡偵測（必須在 player/tick 更新 death_prev 之前執行）] ---
execute if score #global arms_sub_mode matches 2 if score #dom_phase dom_config matches 1 as @a[tag=dom_alive] if score @s vanilla_death > @s death_prev run function game_core:gamemode/dom/on_death

# --- [2. 玩家主邏輯 (Player Tick)] ---
# 核心降維：將所有玩家運算濃縮至此，避免伺服器重複遍歷玩家列表
execute as @a run function game_core:player/tick

# --- [3. 模式獨立路由 (Mode Tick)] ---
# 根據子模式切換邏輯，徹底分離 TDM 與 DOM
execute if score #global arms_sub_mode matches 1 run function game_core:gamemode/tdm/main_tick
execute if score #global arms_sub_mode matches 2 run function game_core:gamemode/dom/main_tick

#指令書偵測
function game_core:player/ui_router


