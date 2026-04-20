# ==========================================
# 檔案: gamemode/br_spectator_ui.mcfunction
# 執行者: @s (狀態 4 玩家)
# ==========================================

# 抓取目前正在觀看對象的名字 (利用 br_spectator 存下的 target_id)
execute as @a if score @s br_id = #current_player target_id run tag @s add my_target

# 顯示 UI (第一優先級：同隊隊友)
execute if score @s watching_team matches 0 run title @s actionbar ["",{"text":"[👁 觀戰中] 正在觀看隊友: ","color":"gray"},{"selector":"@a[tag=my_target,limit=1]","color":"green"},{"text":" (蹲下切換)","color":"dark_gray"}]

tag @a remove my_target