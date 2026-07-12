# ==========================================
# 檔案: gamemode/dom/limit_potions.mcfunction
# 執行者: @s（各隊玩家）
# 說明: 大補數量超過 2 個(含) → 清空並補回 1 個
# ==========================================

execute store result score @s _pot_count temp_score run clear @s minecraft:potion{CustomPotionEffects:[{Id:6b,Amplifier:120b}]} 0
execute if score @s _pot_count temp_score matches 2.. run clear @s minecraft:potion{CustomPotionEffects:[{Id:6b,Amplifier:120b}]}
execute if score @s _pot_count temp_score matches 2.. run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"大補","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"一次補滿的補包","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
