# ==========================================
# 檔案: gamemode/br_altar_revive.mcfunction
# 執行者: @s (被復活的死者)
# 執行座標: 剛才使用的祭壇正中心 (已由 execute 傳遞)
# ==========================================

# 1. 狀態重置
tag @s remove soul_picked
tag @s add br_used_altar
scoreboard players set @s br_death_state 1
gamemode adventure @s
attribute @s minecraft:generic.max_health base set 100
effect give @s instant_health 3 50

# 2. 祭壇上空傳送與緩降
# 💡 提示：~ 250 ~ 代表「祭壇的 X，絕對高度 Y=250，祭壇的 Z」。
# 如果你的意思是「在祭壇的基礎上再往上疊加 250 格高」，請改成 ~ ~250 ~ 
tp @s ~ ~250 ~
title @s title {"text":"⛩️ 靈魂重啟","color":"aqua","bold":true}
title @s subtitle {"text":"你已重返戰場！","color":"yellow"}

# 3. 清空並發放起始武裝 (鞘翅耐久度改為 4 -> Damage: 428)
clear @s
item replace entity @s armor.chest with elytra{Damage:428,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]} 1

# 4. 給予無限期恢復狀態
effect give @s minecraft:regeneration infinite 1 true
effect give @s minecraft:saturation infinite 1 true

tag @s add br_jumped
tag @a add br_deploying