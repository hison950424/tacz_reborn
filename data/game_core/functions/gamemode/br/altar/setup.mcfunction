# ==========================================
# 檔案: gamemode/br_altar_setup.mcfunction
# 執行者: 管理員 (站在祭壇正中心，腳下是 5x5 的黃色混凝土)
# ==========================================

# 召喚祭壇核心，套用去背、陰影與置中對齊的絕佳視覺參數
summon text_display ~ ~3.5 ~ {Tags:["br_altar"],billboard:"center",alignment:"center",text:'{"text":"【 靈魂祭壇：準備就緒 】","color":"yellow","bold":true}',background:0,see_through:0b,shadow:1b}

# 將其冷卻時間初始化為 0
execute as @e[type=text_display,tag=br_altar,distance=..4,limit=1] run scoreboard players set @s altar_cd 0

tellraw @s {"text":"✔ 已成功在此處設置復活祭壇！","color":"green"}