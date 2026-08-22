tellraw @a [{"text":"★ 槍王之王 ★ ","color":"gold","bold":true},{"text":"水隊率先完成全部武器類別，勝利！","color":"aqua","bold":true}]
execute at @a[limit=1] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2
tag @a add rp_loser
tag @a[team=aqua] remove rp_loser
tag @a[team=aqua] add rp_winner
scoreboard players set #winner_team dummy 6
function game_core:core/match_end
