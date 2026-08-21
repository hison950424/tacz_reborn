tellraw @a [{"text":"★ 槍王之王 ★ ","color":"gold","bold":true},{"text":"紅隊率先完成全部武器類別，勝利！","color":"red","bold":true}]
execute at @a[limit=1] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2

tag @a[team=red] add rp_winner
tag @a[team=blue] add rp_loser
scoreboard players set #winner_team dummy 1

function game_core:core/match_end
