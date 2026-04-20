# ==========================================
# 檔案: gamemode/br_win_check.mcfunction
# 觸發時機: br_eliminated.mcfunction 淘汰玩家後呼叫
# 目的: 偵測場上是否只剩一支隊伍存活，觸發勝利
# 注意: 此為基礎版 Stub，Phase 5 時將擴充為完整結算系統
# ==========================================

# 計算場上存活隊伍數量（只統計有至少 1 人存活的隊伍）
# 存活人數在 br_player_tick 的 [6] 段落每 Tick 重新統計
scoreboard players set #teams_alive br_sys 0
execute if score #br_alive_red br_sys matches 1.. run scoreboard players add #teams_alive br_sys 1
execute if score #br_alive_blue br_sys matches 1.. run scoreboard players add #teams_alive br_sys 1
execute if score #br_alive_green br_sys matches 1.. run scoreboard players add #teams_alive br_sys 1
execute if score #br_alive_white br_sys matches 1.. run scoreboard players add #teams_alive br_sys 1
# 孤狼有幾個人活著，就等同於有幾支「獨立隊伍」
execute if score #br_alive_solo br_sys matches 1.. run scoreboard players operation #teams_alive br_sys += #br_alive_solo br_sys

# 存活隊伍數 <= 1：遊戲結束（隊伍模式剩最後一隊，或孤狼模式剩最後一人）
execute if score #teams_alive br_sys matches ..1 run tellraw @a {"text":"[大逃殺] 遊戲結束！感謝所有人的參與！","color":"gold","bold":true}
execute if score #teams_alive br_sys matches ..1 run schedule function game_core:system/match_reset 10s
execute if score #teams_alive br_sys matches ..1 run scoreboard players set #global arms_sub_mode 0

