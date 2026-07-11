# ==========================================
# 檔案: system/assign_solo_slot.mcfunction
# 目的: 為單一玩家分配至第一個空的孤狼槽位（solo1~solo16）
# 執行者: @s（每位玩家）
# 呼叫者: admin_team_ctrl=5 (全員加入孤狼)
# ==========================================

# ── slot 1 ──
execute as @s[tag=!solo] unless entity @a[team=solo1,gamemode=!spectator] run team join solo1 @s
execute if entity @s[team=solo1] run tag @s add solo

# ── slot 2 ──
execute as @s[tag=!solo] unless entity @a[team=solo2,gamemode=!spectator] run team join solo2 @s
execute if entity @s[team=solo2] run tag @s add solo

# ── slot 3 ──
execute as @s[tag=!solo] unless entity @a[team=solo3,gamemode=!spectator] run team join solo3 @s
execute if entity @s[team=solo3] run tag @s add solo

# ── slot 4 ──
execute as @s[tag=!solo] unless entity @a[team=solo4,gamemode=!spectator] run team join solo4 @s
execute if entity @s[team=solo4] run tag @s add solo

# ── slot 5 ──
execute as @s[tag=!solo] unless entity @a[team=solo5,gamemode=!spectator] run team join solo5 @s
execute if entity @s[team=solo5] run tag @s add solo

# ── slot 6 ──
execute as @s[tag=!solo] unless entity @a[team=solo6,gamemode=!spectator] run team join solo6 @s
execute if entity @s[team=solo6] run tag @s add solo

# ── slot 7 ──
execute as @s[tag=!solo] unless entity @a[team=solo7,gamemode=!spectator] run team join solo7 @s
execute if entity @s[team=solo7] run tag @s add solo

# ── slot 8 ──
execute as @s[tag=!solo] unless entity @a[team=solo8,gamemode=!spectator] run team join solo8 @s
execute if entity @s[team=solo8] run tag @s add solo

# ── slot 9 ──
execute as @s[tag=!solo] unless entity @a[team=solo9,gamemode=!spectator] run team join solo9 @s
execute if entity @s[team=solo9] run tag @s add solo

# ── slot 10 ──
execute as @s[tag=!solo] unless entity @a[team=solo10,gamemode=!spectator] run team join solo10 @s
execute if entity @s[team=solo10] run tag @s add solo

# ── slot 11 ──
execute as @s[tag=!solo] unless entity @a[team=solo11,gamemode=!spectator] run team join solo11 @s
execute if entity @s[team=solo11] run tag @s add solo

# ── slot 12 ──
execute as @s[tag=!solo] unless entity @a[team=solo12,gamemode=!spectator] run team join solo12 @s
execute if entity @s[team=solo12] run tag @s add solo

# ── slot 13 ──
execute as @s[tag=!solo] unless entity @a[team=solo13,gamemode=!spectator] run team join solo13 @s
execute if entity @s[team=solo13] run tag @s add solo

# ── slot 14 ──
execute as @s[tag=!solo] unless entity @a[team=solo14,gamemode=!spectator] run team join solo14 @s
execute if entity @s[team=solo14] run tag @s add solo

# ── slot 15 ──
execute as @s[tag=!solo] unless entity @a[team=solo15,gamemode=!spectator] run team join solo15 @s
execute if entity @s[team=solo15] run tag @s add solo

# ── slot 16 ──
execute as @s[tag=!solo] unless entity @a[team=solo16,gamemode=!spectator] run team join solo16 @s
execute if entity @s[team=solo16] run tag @s add solo

# ── 溢出：超過 16 名玩家時循環分配至四色隊 ──
execute as @s[tag=!solo] run title @s actionbar {"text":"孤狼名額已滿，已自動分配至組隊模式","color":"yellow"}
execute as @s[tag=!solo] run function game_core:team/random_2
