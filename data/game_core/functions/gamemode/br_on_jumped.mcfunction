# ==========================================
# 檔案: gamemode/br_on_jumped.mcfunction
# 執行者: @s (剛按下蹲下鍵的機上玩家，或被強制跳出的玩家)
# 目的: 處理跳出空投機的瞬間邏輯
# ==========================================

# 1. 狀態切換：離開機上標記，進入跳傘中標記（保留 br_deploying 直到著陸）
tag @s add br_jumped
tag @s remove br_on_cart

# 2. 清除漂浮效果，讓玩家開始自然下落，之後按空白鍵可啟動鞘翅滑翔，落地後無法移動
effect clear @s minecraft:slow_falling
effect give @s jump_boost infinite 200 true
effect give @s slowness infinite 200 true


# 3. 重置蹲下計時，防止同一 Tick 內重複觸發本函式
scoreboard players set @s sneak_time 0

# === [3.5] 發放 Binding Curse 鞘翅 ===
# 強制裝備在胸甲槽；Binding Curse 讓玩家無法自行脫下；落地由系統用 item replace 清除
# Damage:422 = 432(最大耐久) - 10(剩餘耐久)，讓玩家著陸前鞘翅就快耗盡，強化跳傘策略壓力
item replace entity @s armor.chest with minecraft:elytra{Damage:422,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],display:{Name:'[{"text":"空投鞘翅","italic":false,"color":"gray"}]'}} 1


# 4. 提示玩家啟動鞘翅
title @s actionbar {"text":"按 [空白鍵] 啟動鞘翅！","color":"aqua","bold":true}
