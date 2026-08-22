tellraw @a [{"text":"★ 槍王之王 ★ ","color":"gold","bold":true},{"text":"灰隊率先完成全部武器類別，勝利！","color":"gray","bold":true}]
execute at @a[limit=1] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2
tag @a add rp_loser
tag @a[team=gray] remove rp_loser
tag @a[team=gray] add rp_winner
scoreboard players set #winner_team dummy 15
function game_core:core/match_end
