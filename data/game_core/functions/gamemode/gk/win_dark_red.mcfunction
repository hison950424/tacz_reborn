tellraw @a [{"text":"★ 槍王之王 ★ ","color":"gold","bold":true},{"text":"暗紅隊率先完成全部武器類別，勝利！","color":"dark_red","bold":true}]
execute at @a[limit=1] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2
tag @a add rp_loser
tag @a[team=dark_red] remove rp_loser
tag @a[team=dark_red] add rp_winner
scoreboard players set #winner_team dummy 9
function game_core:gamemode/gk/calc_stage_score
function game_core:core/match_end
