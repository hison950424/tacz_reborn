tellraw @a [{"text":"★ 槍王之王 ★ ","color":"gold","bold":true},{"text":"黑隊率先完成全部武器類別，勝利！","color":"dark_gray","bold":true}]
execute at @a[limit=1] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2
tag @a add rp_loser
tag @a[team=black] remove rp_loser
tag @a[team=black] add rp_winner
scoreboard players set #winner_team dummy 16
function game_core:core/match_end
