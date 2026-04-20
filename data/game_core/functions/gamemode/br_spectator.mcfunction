# ==========================================
# 檔案: gamemode/br_spectator.mcfunction
# 執行者: @s (準備切換視角的 狀態 3 或 4 玩家)
# ==========================================
tag @s add spectating_player
scoreboard players add @s spectate_idx 1

tag @a remove valid_target
scoreboard players set #target_count br_sys 0
scoreboard players set #current_assign br_sys 1

# 3. 尋找合法目標 (第一優先級：同隊且狀態為 1 的活人)
execute as @a if score @s team_id = #current_player team_id if score @s br_death_state matches 1 run tag @s add valid_target

# 【修復 Bug 1 & 2】自動降級防護：如果同隊已經沒有活人了(全滅)，改為尋找全場「任何存活的玩家」！
execute unless entity @a[tag=valid_target] as @a if score @s br_death_state matches 1 run tag @s add valid_target

# 4. 發放流水號與計算總數
execute as @a[tag=valid_target] run scoreboard players operation @s sys_index = #current_assign br_sys
execute as @a[tag=valid_target] run scoreboard players add #current_assign br_sys 1

scoreboard players operation #target_count br_sys = #current_assign br_sys
scoreboard players remove #target_count br_sys 1

execute if score @s spectate_idx > #target_count br_sys run scoreboard players set @s spectate_idx 1

# 6. 執行觀戰鎖定 (加上防呆：確保場上還有活人才能執行)
execute if score #target_count br_sys matches 1.. as @a[tag=valid_target] if score @s sys_index = #current_player spectate_idx run spectate @s @a[tag=spectating_player,limit=1]

# 7. 更新目標 ID
execute if score #target_count br_sys matches 1.. as @a[tag=valid_target] if score @s sys_index = #current_player spectate_idx run scoreboard players operation #current_player target_id = @s br_id
execute if score #target_count br_sys matches 1.. run scoreboard players operation @s target_id = #current_player target_id

tag @a remove valid_target
tag @s remove spectating_player