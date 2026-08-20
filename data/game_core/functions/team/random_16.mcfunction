execute if score #team_turn temp_score matches 1 run team join red @s
execute if score #team_turn temp_score matches 2 run team join blue @s
execute if score #team_turn temp_score matches 3 run team join white @s
execute if score #team_turn temp_score matches 4 run team join green @s
execute if score #team_turn temp_score matches 5 run team join yellow @s
execute if score #team_turn temp_score matches 6 run team join aqua @s
execute if score #team_turn temp_score matches 7 run team join gold @s
execute if score #team_turn temp_score matches 8 run team join light_purple @s
execute if score #team_turn temp_score matches 9 run team join dark_red @s
execute if score #team_turn temp_score matches 10 run team join dark_blue @s
execute if score #team_turn temp_score matches 11 run team join dark_green @s
execute if score #team_turn temp_score matches 12 run team join dark_aqua @s
execute if score #team_turn temp_score matches 13 run team join dark_purple @s
execute if score #team_turn temp_score matches 14 run team join dark_gray @s
execute if score #team_turn temp_score matches 15 run team join gray @s
execute if score #team_turn temp_score matches 16 run team join black @s
scoreboard players add #team_turn temp_score 1
execute if score #team_turn temp_score matches 17.. run scoreboard players set #team_turn temp_score 1
