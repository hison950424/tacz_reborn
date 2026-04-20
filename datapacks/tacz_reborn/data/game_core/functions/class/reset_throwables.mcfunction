# ==========================================
# 檔案: reset_throwables.mcfunction
# 觸發: 遊戲開始、死亡重生、擊殺、助攻時
# 目的: 刷新固有投擲物與特殊醫療包
# ==========================================

# 1. 預防性清空 (防止囤積)
# 請將以下物品替換為 TaC:Z 實際的投擲物 ID
clear @s lrtactical:throwable
#clear @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"}
#clear @s lrtactical:throwable{ThrowableId: "lrtactical:m67"}
#clear @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"}
#clear @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"}
#clear @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"}
# 清除大補與速補 (以原版藥水代替示意)
clear @s potion
clear @s splash_potion

# 2. 自由人 (class_type=1) : 給予大補 (不可投擲的治療藥水)
execute as @s[scores={class_type=1}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1

# 3. 突擊兵 (class_type=2) : 瞬爆、閃光
execute as @s[scores={class_type=2}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @s[scores={class_type=2}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute as @s[scores={class_type=2}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1

# 4. 支援兵 (class_type=3) : 速補(吸收)、瞬爆、手榴彈、煙霧、閃光、燃燒
# 速補以噴濺型吸收藥水示意
execute as @s[scores={class_type=3}] run give @s minecraft:splash_potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u901f\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u5f37\\u5316\\u5f8c\\u7684\\u5927\\u88dc \\u53ef\\u4ee5\\u5feb\\u901f\\u88dc\\u8840 \\u4e26\\u7d66\\u4f60\\u984d\\u5916\\u751f\\u547d\\u503c (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u51491\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:118b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:12b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:22b,Amplifier:1b,Duration:300,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @s[scores={class_type=3}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
execute as @s[scores={class_type=3}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute as @s[scores={class_type=3}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:rgn"} 1
execute as @s[scores={class_type=3}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute as @s[scores={class_type=3}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:flash_grenade"} 1


# 5. 哨兵 (class_type=4) : 大補、手榴彈、煙霧、燃燒
execute as @s[scores={class_type=4}] run give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"\\u5927\\u88dc","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"\\u4e00\\u6b21\\u88dc\\u6eff\\u7684\\u88dc\\u5305 (\\u9019\\u6703\\u8b93\\u4f60\\u767c\\u5149\\u4e00\\u79d2)","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b},{Id:24b,Amplifier:0b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
execute as @s[scores={class_type=4}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:m67"} 1
execute as @s[scores={class_type=4}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:smoke_grenade"} 1
execute as @s[scores={class_type=4}] run give @s lrtactical:throwable{ThrowableId: "lrtactical:molotov"} 1
