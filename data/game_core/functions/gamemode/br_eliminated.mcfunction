# ==========================================
# 檔案: gamemode/br_eliminated.mcfunction
# 執行者: @s (倒地村民被擊殺/超時，準備轉化為靈魂的玩家)
# ==========================================

# 1. 精準定位專屬追蹤器，呼叫特效與生成靈魂標籤 (Marker)
execute as @e[type=marker,tag=br_tracker] if score @s br_id = #current_player br_id run tag @s add my_tracker
execute if entity @s[tag=br_used_altar] as @e[type=marker,tag=my_tracker] run tag @s add has_used_altar_temp
execute as @e[type=marker,tag=my_tracker] run function game_core:gamemode/br_eliminated_effects
tag @e[type=marker,tag=my_tracker] remove my_tracker
tag @e[tag=has_used_altar_temp] remove has_used_altar_temp

# 2. 移除倒地實體關聯
tag @s remove br_downed
tag @s remove has_slime

# ==========================================
# 3. 狀態機核心分流 (State 3 vs State 4)
# ==========================================
# 情況 A：已經用過祭壇復活了 -> 失去再次復活資格，強制轉入狀態 4
execute if entity @s[tag=br_used_altar] run function game_core:gamemode/br_force_state4

# 情況 B：孤狼玩家 (Solo) -> 沒有隊友可以撿靈魂，強制轉入狀態 4
execute if score @s team_id matches 5 run function game_core:gamemode/br_force_state4

# 情況 C：正常團隊成員且未復活過 -> 進入狀態 3 (靈魂出竅)
execute unless entity @s[tag=br_used_altar] unless score @s team_id matches 5 run scoreboard players set @s br_death_state 3

# 4. 針對進入狀態 3 的玩家，給予專屬 UI 提示
execute if score @s br_death_state matches 3 run title @s title {"text":"👻 靈魂出竅","color":"aqua","bold":true}
execute if score @s br_death_state matches 3 run title @s subtitle {"text":"請等待隊友撿回你的靈魂標籤","color":"gray"}

# 5. 觸發勝利判定層 (因場上狀態改變)
schedule function game_core:gamemode/br_win_check 1s