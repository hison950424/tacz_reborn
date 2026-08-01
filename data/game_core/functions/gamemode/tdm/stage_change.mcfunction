# ==========================================
# 檔案: gamemode/tdm/stage_change.mcfunction
# 說明: 比賽進入下一階段（早→中 或 中→後）
#       在 timer_tick 每秒觸發，由 #tdm_stage 判斷當前階段
# ==========================================

# === 補償金（給落後隊，依切換前的 #tdm_stage 決定金額）===
# 早→中：落後隊每人 +$750
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 1 as @a[team=red] run gd656killicon server statistics add score @s 750
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 2 as @a[team=blue] run gd656killicon server statistics add score @s 750
# 中→後：落後隊每人 +$1500
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 1 as @a[team=red] run gd656killicon server statistics add score @s 1500
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 2 as @a[team=blue] run gd656killicon server statistics add score @s 1500

# === 廣播補償通知（只對落後隊顯示）===
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"yellow","bold":true},{"text":"進入中期階段，落後補償 +$750  │  按 [Caps Lock] 查看金錢","color":"yellow"}]
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"yellow","bold":true},{"text":"進入中期階段，落後補償 +$750  │  按 [Caps Lock] 查看金錢","color":"yellow"}]
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 1 run tellraw @a[team=red] ["",{"text":"[金錢] ","color":"yellow","bold":true},{"text":"進入後期階段，落後補償 +$1500  │  按 [Caps Lock] 查看金錢","color":"yellow"}]
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 2 run tellraw @a[team=blue] ["",{"text":"[金錢] ","color":"yellow","bold":true},{"text":"進入後期階段，落後補償 +$1500  │  按 [Caps Lock] 查看金錢","color":"yellow"}]

# === 全域廣播標題 ===
execute if score #tdm_stage tdm_config matches 0 run title @a times 10 40 20
execute if score #tdm_stage tdm_config matches 0 run title @a title {"text":"中期階段","color":"yellow","bold":true}
execute if score #tdm_stage tdm_config matches 0 run title @a subtitle {"text":"擊殺：$80，補貼：$60","color":"white"}
execute if score #tdm_stage tdm_config matches 0 run tellraw @a {"text":"[系統] 已進入中期階段！擊殺 $80，重生補貼 $60","color":"yellow"}
execute if score #tdm_stage tdm_config matches 1 run title @a times 10 40 20
execute if score #tdm_stage tdm_config matches 1 run title @a title {"text":"後期階段","color":"red","bold":true}
execute if score #tdm_stage tdm_config matches 1 run title @a subtitle {"text":"擊殺：$160，補貼：$140","color":"white"}
execute if score #tdm_stage tdm_config matches 1 run tellraw @a {"text":"[系統] 已進入後期階段！擊殺 $160，重生補貼 $140","color":"red"}

# === 遞增階段 ===
scoreboard players add #tdm_stage tdm_config 1

# === 更新 gd656killicon 擊殺表達式 ===
execute if score #tdm_stage tdm_config matches 1 run function game_core:gamemode/tdm/stage_mid_expressions
execute if score #tdm_stage tdm_config matches 2 run function game_core:gamemode/tdm/stage_late_expressions
