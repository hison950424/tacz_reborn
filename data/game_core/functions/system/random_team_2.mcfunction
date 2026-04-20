execute if score #team_turn temp_score matches 1 run team join red @s
execute if score #team_turn temp_score matches 2 run team join blue @s
scoreboard players add #team_turn temp_score 1
execute if score #team_turn temp_score matches 3 run scoreboard players set #team_turn temp_score 1