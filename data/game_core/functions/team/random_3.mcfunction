execute if score #team_turn temp_score matches 1 run team join red @s
execute if score #team_turn temp_score matches 2 run team join blue @s
execute if score #team_turn temp_score matches 3 run team join white @s
scoreboard players add #team_turn temp_score 1
execute if score #team_turn temp_score matches 4 run scoreboard players set #team_turn temp_score 1