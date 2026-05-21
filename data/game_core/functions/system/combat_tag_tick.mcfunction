# ==========================================
# 檔案: system/combat_tag_tick.mcfunction
# 目的: 迷你死鬥戰鬥標記計時（只在 game_state=0 運行）
# 呼叫來源: lobby_tick.mcfunction
# 依賴: p_health (health), combat_tag / combat_tag_sec (dummy), prev_health (dummy)
# ==========================================

# --- [1] 偵測受傷（血量小於上一tick）---
# 只追蹤 mini DM 區域玩家（無 in_lobby 且無 on_parkour tag）
execute as @a[tag=on_minidm] if score @s p_health < @s prev_health run function game_core:system/combat_tag_apply

# --- [2] 計時器遞減（每 tick）---
scoreboard players remove @a[tag=in_combat,scores={combat_tag=1..}] combat_tag 1

# --- [3] 戰鬥標記到期：移除狀態並換回普通書 ---
execute as @a[tag=in_combat,scores={combat_tag=..0}] run tag @s remove in_combat

# --- [4] 更新 prev_health ---
execute as @a run scoreboard players operation @s prev_health = @s p_health

# --- [5] 擊殺偵測：給予大補藥水 ---
execute as @a[tag=on_minidm] if score @s gd656killicon.kill > @s minidm_kill_prev run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @a[tag=on_minidm] if score @s gd656killicon.kill > @s minidm_kill_prev run scoreboard players operation @s minidm_kill_prev = @s gd656killicon.kill

# --- [6] 大補藥水上限：超過一瓶則清除並補一瓶 ---
execute as @a store result score @s potion_count run clear @s minecraft:potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]} 0
execute as @a[scores={potion_count=2..}] run clear @s minecraft:potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]}
execute as @a[scores={potion_count=2..}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# --- [7] 清除空瓶 ---
clear @a glass_bottle
