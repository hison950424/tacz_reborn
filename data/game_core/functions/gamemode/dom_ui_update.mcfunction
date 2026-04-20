# ==========================================
# 檔案: gamemode/dom_ui_update.mcfunction
# 目的: 集中處理佔領模式的 Bossbar 與 Actionbar 畫面渲染
# 觸發: 由 arms_race_tick.mcfunction 每秒呼叫 (或指定頻率呼叫)
# 備註: 依賴 init.mcfunction 中的 dom_const 常數 (20, 45, 100)
# ==========================================

# ==========================================
# [第 0 階段] 同步側邊欄 UI 數據 (補回此區塊)
# ==========================================
scoreboard players operation 紅隊總分 dom_display = #Red dom_score
scoreboard players operation 藍隊總分 dom_display = #Blue dom_score

# 計算初始倒數計時並賦予顯示面板
scoreboard players operation ⏳佔領倒數 dom_display = #time_limit_sec dom_config
scoreboard players operation ⏳佔領倒數 dom_display -= #global dom_arms_timer

# 強制重置與修復 Bossbar 最大值為 45 (防呆機制)
bossbar set game_core:dom_hud_a max 45
bossbar set game_core:dom_hud_b max 45
bossbar set game_core:dom_hud_c max 45

# ==========================================
# [第 1 階段] 數學運算：休戰秒數與進度百分比
# ==========================================

# --- A 點計算 ---
# 計算休戰秒數 (Ticks / 20)
execute if score #Point_a dom_state matches 4 run scoreboard players operation #a_truce_sec temp_score = #Point_a dom_truce_timer
execute if score #Point_a dom_state matches 4 run scoreboard players operation #a_truce_sec temp_score /= #20 dom_const

# 計算絕對進度與百分比
scoreboard players operation #a_prog_abs temp_score = #Point_a dom_prog_a
execute if score #a_prog_abs temp_score matches ..-1 run scoreboard players operation #a_prog_abs temp_score *= #-1 dom_const
scoreboard players operation #a_prog_pct temp_score = #a_prog_abs temp_score
scoreboard players operation #a_prog_pct temp_score *= #100 dom_const
scoreboard players operation #a_prog_pct temp_score /= #45 dom_const

# --- B 點計算 ---
execute if score #Point_b dom_state matches 4 run scoreboard players operation #b_truce_sec temp_score = #Point_b dom_truce_timer
execute if score #Point_b dom_state matches 4 run scoreboard players operation #b_truce_sec temp_score /= #20 dom_const

scoreboard players operation #b_prog_abs temp_score = #Point_b dom_prog_b
execute if score #b_prog_abs temp_score matches ..-1 run scoreboard players operation #b_prog_abs temp_score *= #-1 dom_const
scoreboard players operation #b_prog_pct temp_score = #b_prog_abs temp_score
scoreboard players operation #b_prog_pct temp_score *= #100 dom_const
scoreboard players operation #b_prog_pct temp_score /= #45 dom_const

# --- C 點計算 ---
execute if score #Point_c dom_state matches 4 run scoreboard players operation #c_truce_sec temp_score = #Point_c dom_truce_timer
execute if score #Point_c dom_state matches 4 run scoreboard players operation #c_truce_sec temp_score /= #20 dom_const

scoreboard players operation #c_prog_abs temp_score = #Point_c dom_prog_c
execute if score #c_prog_abs temp_score matches ..-1 run scoreboard players operation #c_prog_abs temp_score *= #-1 dom_const
scoreboard players operation #c_prog_pct temp_score = #c_prog_abs temp_score
scoreboard players operation #c_prog_pct temp_score *= #100 dom_const
scoreboard players operation #c_prog_pct temp_score /= #45 dom_const


# ==========================================
# [第 2 階段] Bossbar 渲染：全域戰況更新
# ==========================================

# --- A 點 Bossbar ---
# 狀態 0: 未開放 (🔒)
execute if score #Point_a dom_state matches 0 run bossbar set game_core:dom_hud_a name {"text":"[A] 🔒 尚未開放","color":"gray"}
execute if score #Point_a dom_state matches 0 run bossbar set game_core:dom_hud_a color white

# 狀態 1: ⚪ 爭奪中 (State 1) - 根據領先方切換顏色
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 0 run bossbar set game_core:dom_hud_a name {"text":"[A]  爭奪中 (平手)","color":"white"}
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 0 run bossbar set game_core:dom_hud_a color white

execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run bossbar set game_core:dom_hud_a name {"text":"[A]  爭奪中 (紅方領先)","color":"red"}
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches 1.. run bossbar set game_core:dom_hud_a color red

execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run bossbar set game_core:dom_hud_a name {"text":"[A]  爭奪中 (藍方領先)","color":"blue"}
execute if score #Point_a dom_state matches 1 if score #Point_a dom_prog_a matches ..-1 run bossbar set game_core:dom_hud_a color blue

# 狀態 2: 紅方控制 (🔴)
execute if score #Point_a dom_state matches 2 run bossbar set game_core:dom_hud_a name {"text":"[A] 🔴 紅方控制","color":"red"}
execute if score #Point_a dom_state matches 2 run bossbar set game_core:dom_hud_a color red

# 狀態 3: 藍方控制 (🔵)
execute if score #Point_a dom_state matches 3 run bossbar set game_core:dom_hud_a name {"text":"[A] 🔵 藍方控制","color":"blue"}
execute if score #Point_a dom_state matches 3 run bossbar set game_core:dom_hud_a color blue

# 狀態 4: 休戰重整 (⏳)
execute if score #Point_a dom_state matches 4 run bossbar set game_core:dom_hud_a name ["",{"text":"[A] ⏳ 休戰重整: ","color":"gray"},{"score":{"name":"#Point_a","objective":"dom_truce_timer"},"color":"gold"},{"text":"s","color":"gray"}]
execute if score #Point_a dom_state matches 4 run bossbar set game_core:dom_hud_a color yellow

# 更新 Bossbar 長度 (絕對進度) 
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

execute if score #Point_b dom_state matches 2 run bossbar set game_core:dom_hud_b name {"text":"[B] 🔴 紅方控制","color":"red"}
execute if score #Point_b dom_state matches 2 run bossbar set game_core:dom_hud_b color red

execute if score #Point_b dom_state matches 3 run bossbar set game_core:dom_hud_b name {"text":"[B] 🔵 藍方控制","color":"blue"}
execute if score #Point_b dom_state matches 3 run bossbar set game_core:dom_hud_b color blue

execute if score #Point_b dom_state matches 4 run bossbar set game_core:dom_hud_b name ["",{"text":"[B] ⏳ 休戰重整: ","color":"gray"},{"score":{"name":"#Point_b","objective":"dom_truce_timer"},"color":"gold"},{"text":"s","color":"gray"}]
execute if score #Point_b dom_state matches 4 run bossbar set game_core:dom_hud_b color yellow

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

execute if score #Point_c dom_state matches 2 run bossbar set game_core:dom_hud_c name {"text":"[C] 🔴 紅方控制","color":"red"}
execute if score #Point_c dom_state matches 2 run bossbar set game_core:dom_hud_c color red

execute if score #Point_c dom_state matches 3 run bossbar set game_core:dom_hud_c name {"text":"[C] 🔵 藍方控制","color":"blue"}
execute if score #Point_c dom_state matches 3 run bossbar set game_core:dom_hud_c color blue

execute if score #Point_c dom_state matches 4 run bossbar set game_core:dom_hud_c name ["",{"text":"[C] ⏳ 休戰重整: ","color":"gray"},{"score":{"name":"#Point_c","objective":"dom_truce_timer"},"color":"gold"},{"text":"s","color":"gray"}]
execute if score #Point_c dom_state matches 4 run bossbar set game_core:dom_hud_c color yellow

execute store result bossbar game_core:dom_hud_c value run scoreboard players get #c_prog_abs temp_score

# ==========================================
# [第 3 階段] Actionbar 渲染：區域玩家即時提示
# 依賴各點位 Marker 的範圍，並使用 positioned 校正中心點
# ==========================================

# --- A 點區域提示 ---
#正常推進
execute if score #Point_a dom_state matches 1..3 if score #a_contested temp_score matches 0 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s actionbar ["",{"text":"[A點] 佔領進度: ","color":"white"},{"score":{"name":"#a_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
#奪回據點(1..是紅隊領先，所以顯示給藍隊。..-1是藍隊領先，所以顯示給紅隊)
execute if score #Point_a dom_state matches 1..3 if score #a_contested temp_score matches 0 if score #Point_a dom_prog_a matches 1.. at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s[team=blue] actionbar ["",{"text":"[A點] 敵方佔領進度: ","color":"white"},{"score":{"name":"#a_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_a dom_state matches 1..3 if score #a_contested temp_score matches 0 if score #Point_a dom_prog_a matches ..-1 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s[team=red] actionbar ["",{"text":"[A點] 敵方佔領進度: ","color":"white"},{"score":{"name":"#a_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
#雙方衝突
execute if score #Point_a dom_state matches 1..3 if score #a_contested temp_score matches 1.. at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=8,dy=3,dz=8] run title @s actionbar ["",{"text":"[A點] ⚠ 爭奪中 ","color":"gold"}]
#休戰模式
execute if score #Point_a dom_state matches 4 at @e[type=marker,tag=Point_a] positioned ~-4 ~-1 ~-4 as @a[dx=7,dy=3,dz=7] run title @s actionbar ["",{"text":"[A點] ⏳ 據點休戰中，暫停推進","color":"gray"}]

# --- B 點區域提示 ---
#正常推進
execute if score #Point_b dom_state matches 1..3 if score #b_contested temp_score matches 0 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=10,dy=3,dz=10] run title @s actionbar ["",{"text":"[B點] 佔領進度: ","color":"white"},{"score":{"name":"#b_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
#奪回據點(1..是紅隊領先，所以顯示給藍隊。..-1是藍隊領先，所以顯示給紅隊)
execute if score #Point_b dom_state matches 1..3 if score #b_contested temp_score matches 0 if score #Point_b dom_prog_b matches 1.. at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=10,dy=3,dz=10] run title @s[team=blue] actionbar ["",{"text":"[B點] 敵方佔領進度: ","color":"white"},{"score":{"name":"#b_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_b dom_state matches 1..3 if score #b_contested temp_score matches 0 if score #Point_b dom_prog_b matches ..-1 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=10,dy=3,dz=10] run title @s[team=red] actionbar ["",{"text":"[B點] 敵方佔領進度: ","color":"white"},{"score":{"name":"#b_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
#雙方衝突
execute if score #Point_b dom_state matches 1..3 if score #b_contested temp_score matches 1.. at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=10,dy=3,dz=10] run title @s actionbar ["",{"text":"[B點] ⚠ 爭奪中 ","color":"gold"}]
#休戰模式
execute if score #Point_b dom_state matches 4 at @e[type=marker,tag=Point_b] positioned ~-5 ~-1 ~-5 as @a[dx=9,dy=3,dz=9] run title @s actionbar ["",{"text":"[B點] ⏳ 據點休戰中，暫停推進","color":"gray"}]

# --- C 點區域提示 ---
#正常推進
execute if score #Point_c dom_state matches 1..3 if score #c_contested temp_score matches 0 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s actionbar ["",{"text":"[C點] 佔領進度: ","color":"white"},{"score":{"name":"#c_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
#奪回據點(1..是紅隊領先，所以顯示給藍隊。..-1是藍隊領先，所以顯示給紅隊)
execute if score #Point_c dom_state matches 1..3 if score #c_contested temp_score matches 0 if score #Point_c dom_prog_c matches 1.. at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s[team=blue] actionbar ["",{"text":"[C點] 敵方佔領進度: ","color":"white"},{"score":{"name":"#c_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
execute if score #Point_c dom_state matches 1..3 if score #c_contested temp_score matches 0 if score #Point_c dom_prog_c matches ..-1 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s[team=red] actionbar ["",{"text":"[C點] 敵方佔領進度: ","color":"white"},{"score":{"name":"#c_prog_pct","objective":"temp_score"},"color":"aqua"},{"text":"%","color":"aqua"}]
#雙方衝突
execute if score #Point_c dom_state matches 1..3 if score #c_contested temp_score matches 1.. at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s actionbar ["",{"text":"[C點] ⚠ 爭奪中 ","color":"gold"}]
#休戰模式
execute if score #Point_c dom_state matches 4 at @e[type=marker,tag=Point_c] positioned ~-8 ~-1 ~-8 as @a[dx=15,dy=3,dz=15] run title @s actionbar ["",{"text":"[C點] ⏳ 據點休戰中，暫停推進","color":"gray"}]


# ==========================================
# 🏆 佔領模式：勝利與時間判定
# ==========================================
# 增加狀態機防呆 (game_state = 2 才判定)，防止進入結算期間後被無限觸發
execute if score #global game_state matches 2 if score #global arms_sub_mode matches 2 if score #Red dom_score >= #target_score dom_config run function game_core:gamemode/dom_red_win

execute if score #global game_state matches 2 if score #global arms_sub_mode matches 2 if score #Blue dom_score >= #target_score dom_config run function game_core:gamemode/dom_blue_win

# 遊戲時間結束判定
execute if score #global game_state matches 2 if score #global arms_sub_mode matches 2 if score #global dom_arms_timer >= #time_limit_sec dom_config run function game_core:gamemode/dom_time_up
