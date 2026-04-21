# ==========================================
# 檔案: gamemode/br_on_revived.mcfunction
# 執行者: @s (被救起的玩家)
# 玩家被救起來時
# ==========================================
tag @s remove br_downed
tag @s remove has_slime
effect clear @s instant_health
gamemode adventure @s

# 1. 【完美修正】利用暫時標籤，避開原版不支援動態分數選擇器的限制！
tag @s add my_revive_target
execute as @e[type=villager,tag=revive_success] if score @s br_id = #current_player br_id at @s run tp @a[tag=my_revive_target,limit=1] ~ ~ ~
tag @s remove my_revive_target

# 2. 將村民丟進虛空刪除
execute as @e[type=villager,tag=revive_success] if score @s br_id = #current_player br_id run kill @s

# 3. 安全控血 (維持在 6 HP 虛弱狀態)
attribute @s minecraft:generic.max_health base set 100

# 4. 給予無限期恢復狀態
effect give @s minecraft:regeneration infinite 1 true
effect give @s minecraft:saturation infinite 1 true

# 5. 【極度重要】將狀態機分數恢復為 1 (存活)！
scoreboard players set @s br_death_state 1