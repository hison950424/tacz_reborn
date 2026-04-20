# ==========================================
# 檔案: gamemode/tdm_check_win.mcfunction
# 觸發時機: 發生擊殺加分後
# ==========================================

# 1. 檢查分數並導向專屬的勝利腳本
execute if score #red_team team_score >= #global target_score run function game_core:gamemode/tdm_red_win
execute if score #blue_team team_score >= #global target_score run function game_core:gamemode/tdm_blue_win