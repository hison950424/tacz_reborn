# ==========================================
# 檔案: gamemode/br_spectator.mcfunction
# 執行者: @s (按下蹲下準備切換視角的 狀態 3或4 玩家)
# ==========================================

# 為自己貼上專屬標籤
tag @s add spectating_player

# 1. 索引 +1 (準備看下一個人)
scoreboard players add @s spectate_idx 1
# 【修正】同步黑板變數！(之前漏了這行，導致全部失效)
scoreboard players operation #current_player spectate_idx = @s spectate_idx

# 2. 清理上一輪的暫存標籤
tag @a remove valid_target
scoreboard players set #target_count br_sys 0
scoreboard players set #current_assign br_sys 1

# 3. 尋找合法目標
# 預先尋找同隊活人 (狀態 3 或 4 都能觸發)
execute as @a if score @s team_id = #current_player team_id if score @s br_death_state matches 1 run tag @s add valid_target

# 自動降級防護 1：若狀態 4 找不到隊友，找全場有隊伍(1~4)的敵人
execute if score @s br_death_state matches 4 unless entity @a[tag=valid_target] as @a if score @s team_id matches 1..4 if score @s br_death_state matches 1 run tag @s add valid_target

# 自動降級防護 2：若狀態 4 找不到有隊伍的，找孤狼(5)
execute if score @s br_death_state matches 4 unless entity @a[tag=valid_target] as @a if score @s team_id matches 5 if score @s br_death_state matches 1 run tag @s add valid_target

# 4. 發放流水號與計算總數
execute as @a[tag=valid_target] run scoreboard players operation @s sys_index = #current_assign br_sys
execute as @a[tag=valid_target] run scoreboard players add #current_assign br_sys 1

# 總合法目標數 = 發放完畢後的號碼 - 1
scoreboard players operation #target_count br_sys = #current_assign br_sys
scoreboard players remove #target_count br_sys 1

# 5. 循環防呆 (如果按超過存活總人數，回到第 1 個人)
execute if score @s spectate_idx > #target_count br_sys run scoreboard players set @s spectate_idx 1
scoreboard players operation #current_player spectate_idx = @s spectate_idx

# 6. 執行觀戰鎖定！(增加數量防呆，確保有目標才執行)
execute if score #target_count br_sys matches 1.. as @a[tag=valid_target] if score @s sys_index = #current_player spectate_idx run spectate @s @a[tag=spectating_player,limit=1]

# 7. 抄寫對象 ID 供 UI 顯示，並同步更新自己的 target_id 用於防脫逃！
execute if score #target_count br_sys matches 1.. as @a[tag=valid_target] if score @s sys_index = #current_player spectate_idx run scoreboard players operation #current_player target_id = @s br_id
execute if score #target_count br_sys matches 1.. run scoreboard players operation @s target_id = #current_player target_id

# 清理標籤
tag @a remove valid_target
tag @s remove spectating_player