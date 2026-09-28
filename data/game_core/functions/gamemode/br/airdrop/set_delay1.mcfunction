# 檔案: gamemode/br/airdrop/set_delay1.mcfunction
# 目的: 設定第一次空投的隨機延遲（5~15 秒）

scoreboard players set #br_airdrop_flag1 br_sys 2
execute store result score #br_airdrop_delay1 br_sys run random value 5..15
tellraw @a ["",{"text":"[空頭] ","color":"gold","bold":true},{"text":"偵測到空投訊號！空頭即將投下...","color":"yellow"}]