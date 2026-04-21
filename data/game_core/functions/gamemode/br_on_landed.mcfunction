# ==========================================
# 檔案: gamemode/br_on_landed.mcfunction
# 執行者: @s (觸地的跳傘玩家，OnGround:1b 偵測觸發)
# 目的: 著陸後清除空投裝備、發放補包、正式進入戰鬥
# ==========================================

# 1. 移除所有部署階段標記，代表此玩家正式進入戰鬥循環
tag @s remove br_jumped
tag @s remove br_deploying

# 2. 強制清除胸甲槽的鞘翅（item replace 可繞過 Binding Curse 限制）
item replace entity @s armor.chest with air

# 3. 發放大補藥水（瞬間治療 Amplifier 120，等同補滿 100HP）清除無法移動
effect clear @s jump_boost
effect clear @s slowness
execute as @s[tag=br_used_altar] run give @s tacz:modern_kinetic_gun{GunId:"tacz:p320",GunFireMode:"SEMI"} 1
give @s minecraft:potion{HideFlags:0,display:{Name:'[{"text":"","italic":false},{"text":"大補","color":"red"}]',Lore:['[{"text":"","italic":false},{"text":"一次補滿的補包","color":"red"}]']},CustomPotionEffects:[{Id:6b,Amplifier:120b,Duration:20,ShowParticles:0b,ShowIcon:0b}],CustomPotionColor:16711680} 1
give @s tacz:ammo_box{AllTypeCreative:1b} 1


# 4. 著陸音效與提示
execute as @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
title @s actionbar {"text":"☄ 已著陸！尋找武器並生存到最後！","color":"yellow","bold":true}
