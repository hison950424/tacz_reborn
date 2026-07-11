# ==========================================
# game_core:gamemode/br/airdrop/check
# ==========================================
execute as @e[type=minecraft:villager,tag=airdrop_bird,limit=1] if data entity @s {OnGround:1b} run function game_core:gamemode/br/airdrop/land
