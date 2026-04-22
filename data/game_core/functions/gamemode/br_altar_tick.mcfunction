# ==========================================
# 檔案: gamemode/br_altar_tick.mcfunction
# 執行者: @s (所有的祭壇 text_display Marker)
# ==========================================

# 階段防護：僅在 Phase 1 (空投) 與 Phase 2 (戰鬥) 允許祭壇運作
execute unless score #global br_phase matches 1..2 run return 0

# 1. 倒數冷卻 (如果大於 0)
execute if score @s altar_cd matches 1.. run scoreboard players remove @s altar_cd 1

# 【修復 Bug 2.1】補回上次被我不小心刪掉的秒數轉換！(把 Ticks 除以 20)
execute if score @s altar_cd matches 1.. run scoreboard players operation @s altar_cd_sec = @s altar_cd
execute if score @s altar_cd matches 1.. run scoreboard players operation @s altar_cd_sec /= #20 dom_const




# 【修復 Bug 2.2】告示牌解析神技 (距離放寬至 ..10 確保抓取成功)
execute if score @s altar_cd matches 1.. at @s run setblock ~ ~-6 ~ oak_sign replace
execute if score @s altar_cd matches 1.. at @s run data modify block ~ ~-6 ~ front_text.messages[0] set value '[{"text":"【 祭壇冷卻中：","color":"red","bold":true},{"score":{"name":"@e[type=text_display,distance=..10,limit=1]","objective":"altar_cd_sec"},"color":"red","bold":true},{"text":"s 】","color":"red","bold":true}]'
execute if score @s altar_cd matches 1.. at @s run data modify entity @s text set from block ~ ~-6 ~ front_text.messages[0]

# 2. 冷卻歸零時的重置
execute if score @s altar_cd matches 0 unless entity @s[tag=altar_ready] run data modify entity @s text set value '{"text":"【 靈魂祭壇：準備就緒 】","color":"yellow","bold":true}'
execute if score @s altar_cd matches 0 unless entity @s[tag=altar_ready] at @s run fill ~-4 ~-6 ~-4 ~4 ~-0.5 ~4 yellow_concrete replace light_gray_concrete
execute if score @s altar_cd matches 0 unless entity @s[tag=altar_ready] run tag @s add altar_ready