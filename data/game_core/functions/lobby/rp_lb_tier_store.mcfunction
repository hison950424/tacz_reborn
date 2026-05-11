# ==========================================
# 檔案: lobby/rp_lb_tier_store.mcfunction
# 目的: 將 @s 的 rank_tier 轉換成稱號 JSON 字串，暫存至 rp_lb:temp current_tier
#       供 rp_leaderboard_update 複製到對應的 top1_tier ~ top10_tier 路徑
# ==========================================

execute if score @s rank_tier matches 1 run data modify storage rp_lb:temp current_tier set value '{"text":"訓練生","color":"gray"}'
execute if score @s rank_tier matches 2 run data modify storage rp_lb:temp current_tier set value '{"text":"戰術先鋒","color":"white"}'
execute if score @s rank_tier matches 3 run data modify storage rp_lb:temp current_tier set value '{"text":"影之掠奪者","color":"dark_gray"}'
execute if score @s rank_tier matches 4 run data modify storage rp_lb:temp current_tier set value '{"text":"鋼鐵捍衛者","color":"blue"}'
execute if score @s rank_tier matches 5 run data modify storage rp_lb:temp current_tier set value '{"text":"巔峰獵手","color":"gold"}'
execute if score @s rank_tier matches 6 run data modify storage rp_lb:temp current_tier set value '{"text":"灰燼審判官","color":"red"}'
execute if score @s rank_tier matches 7 run data modify storage rp_lb:temp current_tier set value '{"text":"虛空行者","color":"dark_purple"}'
execute if score @s rank_tier matches 8 run data modify storage rp_lb:temp current_tier set value '{"text":"幽靈軍官","color":"aqua"}'
execute if score @s rank_tier matches 9 run data modify storage rp_lb:temp current_tier set value '{"text":"末日指揮官","color":"dark_red","bold":true}'
execute if score @s rank_tier matches 10 run data modify storage rp_lb:temp current_tier set value '{"text":"戰爭主宰","color":"light_purple","bold":true}'
execute if score @s rank_tier matches 11 run data modify storage rp_lb:temp current_tier set value '{"text":"★ 永恆傳奇 ★","color":"yellow","bold":true}'
