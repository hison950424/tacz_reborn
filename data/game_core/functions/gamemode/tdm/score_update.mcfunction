# ==========================================
# 檔案: gamemode/tdm_score_update.mcfunction
# 說明: 處理擊殺加分、同步 UI 畫面、並檢查勝利
# ==========================================

# 落後隊判定（在計分前確定當前落後方）
scoreboard players set #tdm_losing_team tdm_config 0
execute if score #red_team team_score < #blue_team team_score run scoreboard players set #tdm_losing_team tdm_config 1
execute if score #blue_team team_score < #red_team team_score run scoreboard players set #tdm_losing_team tdm_config 2

# 落後隊擊殺加成 +25%
execute if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run function game_core:gamemode/tdm/losing_kill_bonus
execute if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run function game_core:gamemode/tdm/losing_kill_bonus

# 1. 判定擊殺者隊伍並增加底層數據分
execute if entity @s[team=red] run scoreboard players add #red_team team_score 1
execute if entity @s[team=blue] run scoreboard players add #blue_team team_score 1

# 2. [新增 UI 同步] 將底層分數映射 (operation =) 到側邊欄的虛擬玩家上
scoreboard players operation 紅隊分數 tdm_display = #red_team team_score
scoreboard players operation 藍隊分數 tdm_display = #blue_team team_score

# 3. 呼叫勝利判定
function game_core:gamemode/tdm/check_win
