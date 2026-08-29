# 檔案: gamemode/br/airdrop/do_spawn2.mcfunction
# 目的: 執行第二次空投召喚，標記 flag2=3 防止重複

scoreboard players set #br_airdrop_flag2 br_sys 3
function game_core:gamemode/br/airdrop/spawn