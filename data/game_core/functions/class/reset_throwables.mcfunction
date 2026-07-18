# ==========================================
# 檔案: reset_throwables.mcfunction
# 觸發: 遊戲開始、死亡重生、擊殺、助攻時
# 目的: 刷新固有投擲物與特殊醫療包（已持有則不重複給予）
# ==========================================

# ── 超量藥水偵測：持有 2 瓶以上 → 清除全部並強制補發正確職業藥水 ──
execute store result score #pot_check temp_score run clear @s minecraft:potion 0
execute store result score #spl_check temp_score run clear @s minecraft:splash_potion 0
scoreboard players operation #pot_check temp_score += #spl_check temp_score

# 自由人 (class_type=1)
execute as @s[scores={class_type=1}] if score #pot_check temp_score matches 2.. run clear @s minecraft:potion
execute as @s[scores={class_type=1}] if score #pot_check temp_score matches 2.. run clear @s minecraft:splash_potion
execute as @s[scores={class_type=1}] if score #pot_check temp_score matches 2.. run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 突擊兵 (class_type=2)
execute as @s[scores={class_type=2}] if score #pot_check temp_score matches 2.. run clear @s minecraft:potion
execute as @s[scores={class_type=2}] if score #pot_check temp_score matches 2.. run clear @s minecraft:splash_potion
execute as @s[scores={class_type=2}] if score #pot_check temp_score matches 2.. run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 支援兵 (class_type=3)
execute as @s[scores={class_type=3}] if score #pot_check temp_score matches 2.. run clear @s minecraft:potion
execute as @s[scores={class_type=3}] if score #pot_check temp_score matches 2.. run clear @s minecraft:splash_potion
execute as @s[scores={class_type=3}] if score #pot_check temp_score matches 2.. run give @s minecraft:splash_potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u901f\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u5f37\\u5316\\u5f8c\\u7684\\u5927\\u88dc \\u53ef\\u4ee5\\u5feb\\u901f\\u88dc\\u8840 \\u4e26\\u7d66\\u4f60\\u984d\\u5916\\u751f\\u547d\\u503c ","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:118b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:12b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:22b,Amplifier:1b,Duration:300,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 哨兵 (class_type=4)
execute as @s[scores={class_type=4}] if score #pot_check temp_score matches 2.. run clear @s minecraft:potion
execute as @s[scores={class_type=4}] if score #pot_check temp_score matches 2.. run clear @s minecraft:splash_potion
execute as @s[scores={class_type=4}] if score #pot_check temp_score matches 2.. run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# ── 超量投擲物偵測：同類持有 2 個以上時清除並補發 1 個 ──

# 突擊兵 (class_type=2)：瞬爆、閃光
execute as @s[scores={class_type=2}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 0
execute as @s[scores={class_type=2}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"}
execute as @s[scores={class_type=2}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute as @s[scores={class_type=2}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 0
execute as @s[scores={class_type=2}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"}
execute as @s[scores={class_type=2}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 支援兵 (class_type=3)：燃燒、手榴彈、瞬爆、煙霧、閃光
execute as @s[scores={class_type=3}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 0
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"}
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
execute as @s[scores={class_type=3}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 0
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"}
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute as @s[scores={class_type=3}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 0
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"}
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute as @s[scores={class_type=3}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 0
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"}
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute as @s[scores={class_type=3}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 0
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"}
execute as @s[scores={class_type=3}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 哨兵 (class_type=4)：手榴彈、煙霧、燃燒
execute as @s[scores={class_type=4}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 0
execute as @s[scores={class_type=4}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"}
execute as @s[scores={class_type=4}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute as @s[scores={class_type=4}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 0
execute as @s[scores={class_type=4}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"}
execute as @s[scores={class_type=4}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute as @s[scores={class_type=4}] store result score #item_check temp_score run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 0
execute as @s[scores={class_type=4}] if score #item_check temp_score matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"}
execute as @s[scores={class_type=4}] if score #item_check temp_score matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1

# ── 正常補發：已持有對應物品則不給予 ──

# 1. 自由人 (class_type=1) : 大補
execute as @s[scores={class_type=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:potion"}]}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 2. 突擊兵 (class_type=2) : 大補、瞬爆、閃光
execute as @s[scores={class_type=2}] unless entity @s[nbt={Inventory:[{id:"minecraft:potion"}]}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @s[scores={class_type=2}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:rgn"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute as @s[scores={class_type=2}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:flash_grenade"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 3. 支援兵 (class_type=3) : 速補、燃燒、手榴彈、瞬爆、煙霧、閃光
execute as @s[scores={class_type=3}] unless entity @s[nbt={Inventory:[{id:"minecraft:splash_potion"}]}] run give @s minecraft:splash_potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u901f\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u5f37\\u5316\\u5f8c\\u7684\\u5927\\u88dc \\u53ef\\u4ee5\\u5feb\\u901f\\u88dc\\u8840 \\u4e26\\u7d66\\u4f60\\u984d\\u5916\\u751f\\u547d\\u503c ","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:118b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:12b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:22b,Amplifier:1b,Duration:300,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @s[scores={class_type=3}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:molotov"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
execute as @s[scores={class_type=3}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:m67"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute as @s[scores={class_type=3}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:rgn"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute as @s[scores={class_type=3}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:smoke_grenade"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute as @s[scores={class_type=3}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:flash_grenade"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 4. 哨兵 (class_type=4) : 大補、手榴彈、煙霧、燃燒
execute as @s[scores={class_type=4}] unless entity @s[nbt={Inventory:[{id:"minecraft:potion"}]}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @s[scores={class_type=4}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:m67"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute as @s[scores={class_type=4}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:smoke_grenade"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute as @s[scores={class_type=4}] unless entity @s[nbt={Inventory:[{id:"lrtactical:throwable",tag:{ThrowableId:"lrtactical:molotov"}}]}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
