# 檔案: gamemode/br/airdrop/check_lottery.mcfunction
# 目的: 存活人數門檻判定 + 延遲倒數（每秒，戰鬥階段且非快速模式）
# 執行者: 無（全域）

# 計算當前存活人數（br_death_state=1 表示存活）
execute store result score #br_alive br_sys if entity @a[scores={br_death_state=1}]

# ── 60% 門檻：首次觸發 ──
execute if score #br_airdrop_flag1 br_sys matches 0 if score #br_alive br_sys <= #br_threshold_60 br_sys run function game_core:gamemode/br/airdrop/trigger1

# ── 30% 門檻：第二次觸發 ──
execute if score #br_airdrop_flag2 br_sys matches 0 if score #br_alive br_sys <= #br_threshold_30 br_sys run function game_core:gamemode/br/airdrop/trigger2

# ── 延遲倒數：flag1（每秒 -1，歸零且無空頭在途時召喚）──
execute if score #br_airdrop_delay1 br_sys matches 1.. run scoreboard players remove #br_airdrop_delay1 br_sys 1
execute if score #br_airdrop_delay1 br_sys matches 0 if score #br_airdrop_flag1 br_sys matches 2 unless entity @e[type=minecraft:villager,tag=airdrop_bird] run function game_core:gamemode/br/airdrop/do_spawn1

# ── 延遲倒數：flag2 ──
execute if score #br_airdrop_delay2 br_sys matches 1.. run scoreboard players remove #br_airdrop_delay2 br_sys 1
execute if score #br_airdrop_delay2 br_sys matches 0 if score #br_airdrop_flag2 br_sys matches 2 unless entity @e[type=minecraft:villager,tag=airdrop_bird] run function game_core:gamemode/br/airdrop/do_spawn2