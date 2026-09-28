# 檔案: gamemode/br/airdrop/trigger2.mcfunction
# 目的: 30% 存活人數門檻空投抽獎（40% 機率）

scoreboard players set #br_airdrop_flag2 br_sys 1
execute store result score #br_lottery br_sys run random value 1..10
execute if score #br_lottery br_sys matches 1..4 run function game_core:gamemode/br/airdrop/set_delay2