# ==========================================
# 檔案: lobby/show_stats.mcfunction
# 目的: 輸出玩家個人戰績到聊天欄
# （以玩家身份執行）
# ==========================================

tellraw @s [{"text":"\n"},{"text":"══════ 個人戰績 ══════","color":"gold","bold":true}]
tellraw @s [{"text":" ▸ RP 積分: ","color":"gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"yellow","bold":true}]

execute if score @s rank_tier matches 1 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"訓練生","color":"gray"}]
execute if score @s rank_tier matches 2 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"戰術先鋒","color":"white"}]
execute if score @s rank_tier matches 3 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"影之掠奪者","color":"dark_gray"}]
execute if score @s rank_tier matches 4 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"鋼鐵捍衛者","color":"blue"}]
execute if score @s rank_tier matches 5 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"巔峰獵手","color":"gold"}]
execute if score @s rank_tier matches 6 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"灰燼審判官","color":"red"}]
execute if score @s rank_tier matches 7 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"虛空行者","color":"dark_purple"}]
execute if score @s rank_tier matches 8 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"幽靈軍官","color":"aqua"}]
execute if score @s rank_tier matches 9 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"末日指揮官","color":"dark_red","bold":true}]
execute if score @s rank_tier matches 10 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"戰爭主宰","color":"light_purple","bold":true}]
execute if score @s rank_tier matches 11 run tellraw @s [{"text":" ▸ 軍階:   ","color":"gray"},{"text":"★ 永恆傳奇 ★","color":"yellow","bold":true}]

tellraw @s [{"text":" ▸ 勝場:   ","color":"gray"},{"score":{"name":"@s","objective":"stat_wins"},"color":"green"}]
tellraw @s [{"text":" ▸ 敗場:   ","color":"gray"},{"score":{"name":"@s","objective":"stat_losses"},"color":"red"}]
tellraw @s [{"text":" ▸ 連勝:   ","color":"gray"},{"score":{"name":"@s","objective":"stat_streak"},"color":"gold"}]
tellraw @s [{"text":"══════════════════════\n","color":"gold","bold":true}]
