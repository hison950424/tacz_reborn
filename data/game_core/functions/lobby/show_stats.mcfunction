# ==========================================
# 檔案: lobby/show_stats.mcfunction
# 目的: 輸出玩家個人戰績到聊天欄
# （以玩家身份執行）
# ==========================================

tellraw @s [{"text":"\n"},{"text":"══════ 個人戰績 ══════","color":"gold","bold":true}]
tellraw @s [{"text":" ▸ RP 積分: ","color":"gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"yellow","bold":true},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 1"}}]

execute if score @s rank_tier matches 1 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"訓練生","color":"gray"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 2 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"戰術先鋒","color":"white"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 3 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"影之掠奪者","color":"dark_gray"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 4 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"鋼鐵捍衛者","color":"blue"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 5 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"巔峰獵手","color":"gold"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 6 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"灰燼審判官","color":"red"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 7 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"虛空行者","color":"dark_purple"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 8 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"幽靈軍官","color":"aqua"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 9 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"末日指揮官","color":"dark_red","bold":true},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 10 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"戰爭主宰","color":"light_purple","bold":true},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]
execute if score @s rank_tier matches 11 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"★ 永恆傳奇 ★","color":"yellow","bold":true},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 2"}}]

tellraw @s [{"text":" ── 大逃殺 ──","color":"dark_aqua"}]
tellraw @s [{"text":" ▸ 勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins_br"},"color":"green"},{"text":"  敗 ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses_br"},"color":"red"},{"text":"  連勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_streak_br"},"color":"gold"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 3"}}]
tellraw @s [{"text":" ▸ 拉起 ","color":"gray"},{"score":{"name":"@s","objective":"stat_br_revives"},"color":"aqua"},{"text":"  祭壇 ","color":"gray"},{"score":{"name":"@s","objective":"stat_br_altars"},"color":"light_purple"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 4"}}]

tellraw @s [{"text":" ── 軍備競賽 ──","color":"dark_red"}]
tellraw @s [{"text":" ▸ TDM  勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins_tdm"},"color":"green"},{"text":"  敗 ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses_tdm"},"color":"red"},{"text":"  連勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_streak_tdm"},"color":"gold"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 5"}}]
tellraw @s [{"text":" ▸ DOM  勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins_dom"},"color":"green"},{"text":"  敗 ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses_dom"},"color":"red"},{"text":"  連勝 ","color":"gray"},{"score":{"name":"@s","objective":"stat_streak_dom"},"color":"gold"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 6"}}]

tellraw @s [{"text":" ── 總計 ──","color":"gray"}]
tellraw @s [{"text":" ▸ 總勝場 ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins"},"color":"green"},{"text":"  總敗場 ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses"},"color":"red"},{"text":"  "},{"text":"[ 展示 ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger show_stat set 7"}}]
tellraw @s [{"text":"══════════════════════\n","color":"gold","bold":true}]
