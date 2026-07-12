# ==========================================
# 檔案: gamemode/dom/limit_potions.mcfunction
# 執行者: @s（各隊玩家）
# 說明: 大補數量超過 2 個(含) → 清空並補回 1 個
# ==========================================

# 大補（一般藥水）上限 1
execute store result score @s potion_count run clear @s minecraft:potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]} 0
execute if score @s potion_count matches 2.. run clear @s minecraft:potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]}
execute if score @s potion_count matches 2.. run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 速補（醫療兵噴濺藥水）上限 1
execute store result score @s potion_count run clear @s minecraft:splash_potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]} 0
execute if score @s potion_count matches 2.. run clear @s minecraft:splash_potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]}
execute if score @s potion_count matches 2.. run give @s minecraft:splash_potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u901f\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u5f37\\u5316\\u5f8c\\u7684\\u5927\\u88dc \\u53ef\\u4ee5\\u5feb\\u901f\\u88dc\\u8840 \\u4e26\\u7d66\\u4f60\\u984d\\u5916\\u751f\\u547d\\u503c ","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:118b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:12b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:22b,Amplifier:1b,Duration:300,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
