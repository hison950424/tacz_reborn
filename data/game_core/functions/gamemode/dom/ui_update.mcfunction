# ==========================================
# 檔案: gamemode/dom_ui_update.mcfunction
# 目的: 集中處理佔領模式的 Bossbar 與 Actionbar 畫面渲染
# 觸發: 由 main_tick.mcfunction 每秒呼叫
# ==========================================

# ==========================================
# [第 0 階段] 同步側邊欄 UI 數據
# ==========================================
scoreboard players operation 紅隊總分 dom_display = #Red dom_score
scoreboard players operation 藍隊總分 dom_display = #Blue dom_score

# 回合倒數（phase 1：150 - 已過秒數；其他階段顯示 0）
execute unless score #dom_phase dom_config matches 1 run scoreboard players set ⏳佔領倒數 dom_display 0
execute if score #dom_phase dom_config matches 1 run scoreboard players set ⏳佔領倒數 dom_display 150
execute if score #dom_phase dom_config matches 1 run scoreboard players operation ⏳佔領倒數 dom_display -= #dom_round_timer dom_config

# 強制重置 Bossbar 最大值為 20（進度條 ±20）
bossbar set game_core:dom_hud_a max 20
bossbar set game_core:dom_hud_b max 20
bossbar set game_core:dom_hud_c max 20

# ==========================================
# [第 1 階段] 數學運算：進度百分比
# ==========================================

# --- A 點計算 ---
scoreboard players operation #a_prog_abs temp_score = #Point_a dom_prog_a
execute if score #a_prog_abs temp_score matches ..-1 run scoreboard players operation #a_prog_abs temp_score *= #-1 dom_const
scoreboard players operation #a_prog_pct temp_score = #a_prog_abs temp_score
scoreboard players operation #a_prog_pct temp_score *= #100 dom_const
scoreboard players operation #a_prog_pct temp_score /= #20 dom_const

# --- B 點計算 ---
scoreboard players operation #b_prog_abs temp_score = #Point_b dom_prog_b
execute if score #b_prog_abs temp_score matches ..-1 run scoreboard players operation #b_prog_abs temp_score *= #-1 dom_const
scoreboard players operation #b_prog_pct temp_score = #b_prog_abs temp_score
scoreboard players operation #b_prog_pct temp_score *= #100 dom_const
scoreboard players operation #b_prog_pct temp_score /= #20 dom_const

# --- C 點計算 ---
scoreboard players operation #c_prog_abs temp_score = #Point_c dom_prog_c
execute if score #c_prog_abs temp_score matches ..-1 run scoreboard players operation #c_prog_abs temp_score *= #-1 dom_const
scoreboard players operation #c_prog_pct temp_score = #c_prog_abs temp_score
scoreboard players operation #c_prog_pct temp_score *= #100 dom_const
scoreboard players operation #c_prog_pct temp_score /= #20 dom_const

# ==========================================
# [第 2 階段] Bossbar 渲染
# ==========================================

# --- A 點 Bossbar ---
execute if score #Point_a dom_state matches 0 run bossbar set game_core:dom_hud_a name {"text":"[A] 🔒 尚未開放","color":"gray"}
execute if score #Point_a dom_state matches 0 run bossbar set game_core:dom_hud_a color white

execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 0 run bossbar set game_core:dom_hud_a name {"text":"[A]  爭奪中 (平手)","color":"white"}
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 0 run bossbar set game_core:dom_hud_a color white
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run bossbar set game_core:dom_hud_a name {"text":"[A]  爭奪中 (紅方領先)","color":"red"}
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run bossbar set game_core:dom_hud_a color red
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run bossbar set game_core:dom_hud_a name {"text":"[A]  爭奪中 (藍方領先)","color":"blue"}
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run bossbar set game_core:dom_hud_a color blue

execute store result bossbar game_core:dom_hud_a value run scoreboard players get #a_prog_abs temp_score

# --- B 點 Bossbar ---
execute if score #Point_b dom_state matches 0 run bossbar set game_core:dom_hud_b name {"text":"[B] 🔒 尚未開放","color":"gray"}
execute if score #Point_b dom_state matches 0 run bossbar set game_core:dom_hud_b color white

execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 0 run bossbar set game_core:dom_hud_b name {"text":"[B]  爭奪中 (平手)","color":"white"}
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 0 run bossbar set game_core:dom_hud_b color white
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 1.. run bossbar set game_core:dom_hud_b name {"text":"[B]  爭奪中 (紅方領先)","color":"red"}
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches 1.. run bossbar set game_core:dom_hud_b color red
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-1 run bossbar set game_core:dom_hud_b name {"text":"[B]  爭奪中 (藍方領先)","color":"blue"}
execute if score #Point_b dom_state matches 1 if score #Point_b dom_prog_b matches ..-1 run bossbar set game_core:dom_hud_b color blue

execute store result bossbar game_core:dom_hud_b value run scoreboard players get #b_prog_abs temp_score

# --- C 點 Bossbar ---
execute if score #Point_c dom_state matches 0 run bossbar set game_core:dom_hud_c name {"text":"[C] 🔒 尚未開放","color":"gray"}
execute if score #Point_c dom_state matches 0 run bossbar set game_core:dom_hud_c color white

execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 0 run bossbar set game_core:dom_hud_c name {"text":"[C]  爭奪中 (平手)","color":"white"}
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 0 run bossbar set game_core:dom_hud_c color white
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 1.. run bossbar set game_core:dom_hud_c name {"text":"[C]  爭奪中 (紅方領先)","color":"red"}
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches 1.. run bossbar set game_core:dom_hud_c color red
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-1 run bossbar set game_core:dom_hud_c name {"text":"[C]  爭奪中 (藍方領先)","color":"blue"}
execute if score #Point_c dom_state matches 1 if score #Point_c dom_prog_c matches ..-1 run bossbar set game_core:dom_hud_c color blue

execute store result bossbar game_core:dom_hud_c value run scoreboard players get #c_prog_abs temp_score

# ==========================================
# [第 3 階段] Actionbar 渲染：區域玩家即時提示
# ==========================================

# --- A 點區域提示 ---
execute if score #Point_a dom_state matches 1 if score #a_contested temp_score matches 0 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s actionbar ["",{"text":"◆ A點 │ 佔領中 │ 進度: ","color":"white"},{"score":{"name":"#a_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_a dom_state matches 1 if score #a_contested temp_score matches 0 if score #Point_a dom_prog_a matches 1.. at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s[team=blue] actionbar ["",{"text":"◆ A點 │ 佔領中 │ 敵方佔領進度: ","color":"white"},{"score":{"name":"#a_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_a dom_state matches 1 if score #a_contested temp_score matches 0 if score #Point_a dom_prog_a matches ..-1 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s[team=red] actionbar ["",{"text":"◆ A點 │ 佔領中 │ 敵方佔領進度: ","color":"white"},{"score":{"name":"#a_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_a dom_state matches 1 if score #a_contested temp_score matches 1.. at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s actionbar {"text":"◆ A點 │ ⚠ 爭奪中","color":"gold","bold":true}

# --- B 點區域提示 ---
execute if score #Point_b dom_state matches 1 if score #b_contested temp_score matches 0 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] run title @s actionbar ["",{"text":"◆ B點 │ 佔領中 │ 進度: ","color":"white"},{"score":{"name":"#b_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_b dom_state matches 1 if score #b_contested temp_score matches 0 if score #Point_b dom_prog_b matches 1.. at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] run title @s[team=blue] actionbar ["",{"text":"◆ B點 │ 佔領中 │ 敵方佔領進度: ","color":"white"},{"score":{"name":"#b_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_b dom_state matches 1 if score #b_contested temp_score matches 0 if score #Point_b dom_prog_b matches ..-1 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] run title @s[team=red] actionbar ["",{"text":"◆ B點 │ 佔領中 │ 敵方佔領進度: ","color":"white"},{"score":{"name":"#b_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_b dom_state matches 1 if score #b_contested temp_score matches 1.. at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] run title @s actionbar {"text":"◆ B點 │ ⚠ 爭奪中","color":"gold","bold":true}

# --- C 點區域提示 ---
execute if score #Point_c dom_state matches 1 if score #c_contested temp_score matches 0 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s actionbar ["",{"text":"◆ C點 │ 佔領中 │ 進度: ","color":"white"},{"score":{"name":"#c_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_c dom_state matches 1 if score #c_contested temp_score matches 0 if score #Point_c dom_prog_c matches 1.. at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s[team=blue] actionbar ["",{"text":"◆ C點 │ 佔領中 │ 敵方佔領進度: ","color":"white"},{"score":{"name":"#c_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_c dom_state matches 1 if score #c_contested temp_score matches 0 if score #Point_c dom_prog_c matches ..-1 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s[team=red] actionbar ["",{"text":"◆ C點 │ 佔領中 │ 敵方佔領進度: ","color":"white"},{"score":{"name":"#c_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_c dom_state matches 1 if score #c_contested temp_score matches 1.. at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s actionbar {"text":"◆ C點 │ ⚠ 爭奪中","color":"gold","bold":true}

# ==========================================
# 勝利判定（達到目標分數）
# ==========================================
execute if score #global game_state matches 2 if score #global arms_sub_mode matches 2 if score #Red dom_score >= #target_score dom_config run function game_core:gamemode/dom/win_red
execute if score #global game_state matches 2 if score #global arms_sub_mode matches 2 if score #Blue dom_score >= #target_score dom_config run function game_core:gamemode/dom/win_blue
