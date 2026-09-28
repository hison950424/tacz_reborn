# 檔案: gamemode/br/airdrop/do_spawn1.mcfunction
# 目的: 執行第一次空投召喚，標記 flag1=3 防止重複

scoreboard players set #br_airdrop_flag1 br_sys 3
function game_core:gamemode/br/airdrop/spawn