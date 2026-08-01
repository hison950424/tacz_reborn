# ==========================================
# 檔案: gamemode/dom/limit_potions.mcfunction
# 執行者: @s（各隊玩家）
# 說明: 補品/投擲物持有超過 1 個 → 清除多餘並補回 1 個
#       自由人 (class_type=1) 投擲物不受限制
# ==========================================

# 大補（一般藥水）上限 1 - 所有職業
execute store result score @s potion_count run clear @s minecraft:potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]} 0
execute if score @s potion_count matches 2.. run clear @s minecraft:potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]}
execute if score @s potion_count matches 2.. run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"大補","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"一次補滿的補包 (這會讓你發光一秒)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 速補（醫療兵噴濺藥水）上限 1 - 所有職業
execute store result score @s potion_count run clear @s minecraft:splash_potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]} 0
execute if score @s potion_count matches 2.. run clear @s minecraft:splash_potion{CustomPotionColor:16711680,CustomPotionEffects:[{Id:6b}]}
execute if score @s potion_count matches 2.. run give @s minecraft:splash_potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"速補","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"強化後的大補 可以快速補血 並給你額外生命值 ","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:118b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:12b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:22b,Amplifier:1b,Duration:300,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# ==========================================
# 投擲物上限（自由人 class_type=1 免除）
# ==========================================

# 突擊兵 (class_type=2)：瞬爆、閃光各上限 1
execute if score @s class_type matches 2 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 0
execute if score @s class_type matches 2 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"}
execute if score @s class_type matches 2 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute if score @s class_type matches 2 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 0
execute if score @s class_type matches 2 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"}
execute if score @s class_type matches 2 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 支援兵 (class_type=3)：燃燒、手榴彈、瞬爆、煙霧、閃光各上限 1
execute if score @s class_type matches 3 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 0
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"}
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
execute if score @s class_type matches 3 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 0
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"}
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute if score @s class_type matches 3 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 0
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"}
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute if score @s class_type matches 3 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 0
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"}
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute if score @s class_type matches 3 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 0
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"}
execute if score @s class_type matches 3 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 哨兵 (class_type=4)：手榴彈、煙霧、燃燒各上限 1
execute if score @s class_type matches 4 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 0
execute if score @s class_type matches 4 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"}
execute if score @s class_type matches 4 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute if score @s class_type matches 4 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 0
execute if score @s class_type matches 4 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"}
execute if score @s class_type matches 4 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute if score @s class_type matches 4 store result score @s potion_count run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 0
execute if score @s class_type matches 4 if score @s potion_count matches 2.. run clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"}
execute if score @s class_type matches 4 if score @s potion_count matches 2.. run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
