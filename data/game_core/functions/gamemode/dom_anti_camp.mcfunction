# ==========================================
# 檔案: gamemode/tdm_anti_camp.mcfunction
# 說明: 偵測腳下 (-0.1格) 是否為特定羊毛，並給予多重負面狀態
# ==========================================

# ------------------------------------------
# 1. 藍隊擅闖紅隊重生區 (踩到紅色羊毛)
# ------------------------------------------
# 警告提示
execute as @a[team=blue] at @s if block ~ ~-0.1 ~ red_wool run title @s actionbar {"text":"[警告] 偵測到入侵！請立即撤出敵方基地！","color":"red","bold":true}
# 緩速 - 阻礙推進
execute as @a[team=blue] at @s if block ~ ~-0.1 ~ red_wool run effect give @s minecraft:slowness 1 3 true
# 跳躍 - 阻礙跳躍
execute as @a[team=blue] at @s if block ~ ~-0.1 ~ red_wool run effect give @s minecraft:jump_boost 1 200 true
# 傷害 - 扣血逼退
execute as @a[team=blue] at @s if block ~ ~-0.1 ~ red_wool run damage @s 20 magic
# 發光 - 暴露行蹤給防守方
execute as @a[team=blue] at @s if block ~ ~-0.1 ~ red_wool run effect give @s minecraft:glowing 1 0 true

# ------------------------------------------
# 2. 紅隊擅闖藍隊重生區 (踩到藍色羊毛)
# ------------------------------------------
execute as @a[team=red] at @s if block ~ ~-0.1 ~ blue_wool run title @s actionbar {"text":"[警告] 偵測到入侵！請立即撤出敵方基地！","color":"blue","bold":true}
execute as @a[team=red] at @s if block ~ ~-0.1 ~ blue_wool run effect give @s minecraft:slowness 1 3 true
execute as @a[team=red] at @s if block ~ ~-0.1 ~ blue_wool run effect give @s minecraft:jump_boost 1 200 true
execute as @a[team=red] at @s if block ~ ~-0.1 ~ blue_wool run damage @s 20 magic
execute as @a[team=red] at @s if block ~ ~-0.1 ~ blue_wool run effect give @s minecraft:glowing 1 0 true