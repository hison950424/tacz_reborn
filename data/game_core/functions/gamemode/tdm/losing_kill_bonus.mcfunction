# ==========================================
# 檔案: gamemode/tdm/losing_kill_bonus.mcfunction
# 執行者: @s（落後隊的擊殺者）
# 說明: 每次擊殺額外 +25% 收入
# ==========================================
execute if score #tdm_stage tdm_config matches 0 run gd656killicon server statistics add score @s 5
execute if score #tdm_stage tdm_config matches 1 run gd656killicon server statistics add score @s 15
execute if score #tdm_stage tdm_config matches 2 run gd656killicon server statistics add score @s 45
