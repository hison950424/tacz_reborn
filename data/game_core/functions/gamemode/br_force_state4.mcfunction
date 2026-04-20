# ==========================================
# 檔案: gamemode/br_force_state4.mcfunction
# 執行者: @s (被判定滅團，強制轉移至狀態4的玩家)
# ==========================================

# 1. 同步黑板 ID
scoreboard players operation #current_player br_id = @s br_id

# 2. 設置狀態為 4 (徹底淘汰)
scoreboard players set @s br_death_state 4

# 3. 清理實體殘留 (無情銷毀地上的「村民」與沒被撿起的靈魂)
execute as @e[type=villager,tag=br_downed_mob] if score @s br_id = #current_player br_id run kill @s
execute as @e[type=marker,tag=br_soul_marker] if score @s br_id = #current_player br_id run kill @s

# 4. 舊版標籤清理與模式切換
tag @s add br_eliminated
tag @s remove br_downed
tag @s remove has_slime
gamemode spectator @s

# ==========================================
# 5. 絕望的 UI 提示 (動態分流)
# ==========================================

# A. 預設提示 (例如被敵人補刀、已用過祭壇等常規淘汰)
execute unless entity @s[tag=cause_void] unless entity @s[tag=cause_wipe] unless entity @s[tag=cause_solo] run title @s title {"text":"☠ 徹底淘汰","color":"dark_red","bold":true}
execute unless entity @s[tag=cause_void] unless entity @s[tag=cause_wipe] unless entity @s[tag=cause_solo] run title @s subtitle {"text":"無法再被復活，按 [蹲下] 切換觀戰","color":"gray"}

# B. 掉入虛空
execute if entity @s[tag=cause_void] run title @s title {"text":"☠ 墜入深淵","color":"dark_red","bold":true}
execute if entity @s[tag=cause_void] run title @s subtitle {"text":"你已墜入虛空，徹底淘汰","color":"gray"}
execute if entity @s[tag=cause_void] run tp @s @e[type=marker,tag=lobby_spawn_point,limit=1]


# C. 隊伍全滅
execute if entity @s[tag=cause_wipe] run title @s title {"text":"☠ 徹底淘汰","color":"dark_red","bold":true}
execute if entity @s[tag=cause_wipe] run title @s subtitle {"text":"小隊已全滅，無法再被復活","color":"gray"}

# D. 孤狼死亡
execute if entity @s[tag=cause_solo] run title @s title {"text":"☠ 孤狼陣亡","color":"dark_red","bold":true}
execute if entity @s[tag=cause_solo] run title @s subtitle {"text":"孤狼無法復活，徹底淘汰","color":"gray"}

# 6. 清理死因暫存標籤
tag @s remove cause_void
tag @s remove cause_wipe
tag @s remove cause_solo

# 7. 觸發勝利判定層
function game_core:gamemode/br_win_check