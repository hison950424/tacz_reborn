# ==========================================
# 檔案: system/rank_announce_player.mcfunction
# 目的: 向單一玩家發送目前軍階通知（以玩家身份執行）
# 呼叫時機:
#   1. rank_calculate.mcfunction 結算完畢後
#   2. match_reset.mcfunction 返回大廳後
# ==========================================

execute if score @s rank_tier matches 1 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"訓練生","color":"gray"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 2 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"戰術先鋒","color":"white"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 3 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"影之掠奪者","color":"dark_gray"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 4 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"鋼鐵捍衛者","color":"blue"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 5 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"巔峰獵手","color":"gold"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 6 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"灰燼審判官","color":"red"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 7 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"虛空行者","color":"dark_purple"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 8 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"幽靈軍官","color":"aqua"},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 9 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"末日指揮官","color":"dark_red","bold":true},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 10 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"戰爭主宰","color":"light_purple","bold":true},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
execute if score @s rank_tier matches 11 run tellraw @s [{"text":"\n[軍階] ","color":"gold","bold":true},{"text":"★ 永恆傳奇 ★","color":"yellow","bold":true},{"text":"  RP: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rp_score"},"color":"white"},{"text":"\n","color":"dark_gray"}]
