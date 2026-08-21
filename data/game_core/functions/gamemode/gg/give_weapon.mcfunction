# 以玩家身份（@s）執行 - 清除舊武器並根據隊伍發放當前階段武器
clear @s tacz:modern_kinetic_gun
clear @s lrtactical:melee
clear @s lrtactical:throwable
execute if entity @s[team=red] run function game_core:gamemode/gg/give_weapon_red
execute if entity @s[team=blue] run function game_core:gamemode/gg/give_weapon_blue
