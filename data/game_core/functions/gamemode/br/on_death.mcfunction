# ==========================================
# 檔案: gamemode/br_on_death.mcfunction
# 執行者: @s (剛剛死亡的玩家)
# 死亡後直接進入靈魂標籤階段，不再產生倒地村民
# ==========================================

#先恢復血量防止誤判掉入虛空
effect give @s minecraft:saturation 3 50 true

# --- [A] 中斷空投部署狀態 ---
execute as @s[tag=br_jumped] run function game_core:gamemode/br/deploy/on_landed
execute as @s[tag=br_on_cart] run function game_core:gamemode/br/deploy/on_landed
tag @s remove br_on_cart

# ==========================================
# --- [防呆機制：自動修復空值 (Null)] ---
# ==========================================
execute unless score @s br_death_state matches 1..4 run scoreboard players set @s br_death_state 1
execute unless score @s team_id matches 1..5 run scoreboard players set @s team_id 5

scoreboard players operation #current_player br_id = @s br_id
scoreboard players operation #current_player team_id = @s team_id

# ==========================================
# --- [A] 狀態分流防護鎖 ---
# ==========================================
# 【修復 Bug 1】如果已經是狀態 2 或 3 卻觸發了原版死亡 (例如掉進虛空)，直接進狀態 4 並清理舊屍體！
execute if score @s br_death_state matches 2..3 if score @s br_health matches ..4 run tag @s add cause_void
execute if score @s br_death_state matches 2..3 if score @s br_health matches ..4 run function game_core:gamemode/br/force_dead

# 孤狼死亡，直接拉進狀態4
execute if score @s team_id matches 5 if score @s br_death_state matches 1 run tag @s add cause_solo
execute if score @s team_id matches 5 if score @s br_death_state matches 1 run function game_core:gamemode/br/force_dead

# ==========================================
# --- [B] 靈魂程序（跳過倒地村民，直接進入靈魂標籤階段）---
# ==========================================
# 不產生倒地村民，直接呼叫 eliminated 進入靈魂標籤流程
# main_tick [D] 的滅團偵測在下一 Tick 若判定全滅，仍會觸發 force_dead
execute if score @s br_death_state matches 1 unless score @s team_id matches 5 run gamemode spectator @s
execute if score @s br_death_state matches 1 unless score @s team_id matches 5 run function game_core:gamemode/br/eliminated

schedule function game_core:gamemode/br/win_check 1s