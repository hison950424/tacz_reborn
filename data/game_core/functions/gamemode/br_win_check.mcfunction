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
execute if score #teams_alive br_sys matches ..1 if score #br_alive_red br_sys matches 1.. run title @a title {"text":"紅隊獲勝！","color":"red","bold":true}
execute if score #teams_alive br_sys matches ..1 if score #br_alive_blue br_sys matches 1.. run title @a title {"text":"藍隊獲勝！","color":"blue","bold":true}
execute if score #teams_alive br_sys matches ..1 if score #br_alive_green br_sys matches 1.. run title @a title {"text":"綠隊獲勝！","color":"green","bold":true}
execute if score #teams_alive br_sys matches ..1 if score #br_alive_white br_sys matches 1.. run title @a title {"text":"白隊獲勝！","color":"white","bold":true}
execute if score #teams_alive br_sys matches ..1 if score #br_alive_solo br_sys matches 1.. run title @a title {"text":"孤狼獲勝！","color":"gray","bold":true}
execute if score #teams_alive br_sys matches ..1 if score #br_alive_solo br_sys matches 0 if score #br_alive_white br_sys matches 0 if score #br_alive_green br_sys matches 0 if score #br_alive_blue br_sys matches 0 if score #br_alive_red br_sys matches 0 run title @a title {"text":"同時死亡，平手！","color":"dark_gray","bold":true}

#隊伍名稱可見
execute if score #teams_alive br_sys matches ..1 run team modify blue nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify red nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify green nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify white nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo nametagVisibility always

execute if score #teams_alive br_sys matches ..1 run function game_core:system/match_end_sequence
