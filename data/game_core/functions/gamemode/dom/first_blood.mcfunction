# ==========================================
# 檔案: gamemode/dom/first_blood.mcfunction
# 執行者: @s（本回合第一個擊殺的玩家）
# 觸發條件: player/tick 偵測到 kill 增加且 #dom_first_blood = 0
# ==========================================

# 設定旗標，防止本回合重複觸發
scoreboard players set #dom_first_blood dom_config 1

# 首殺獎金
gd656killicon server statistics add score @s 200

# 全場通知
tellraw @a ["",{"selector":"@s","color":"yellow","bold":true},{"text":" 拿下本回合首殺！","color":"gold","bold":true},{"text":" +$200","color":"green","bold":true}]
