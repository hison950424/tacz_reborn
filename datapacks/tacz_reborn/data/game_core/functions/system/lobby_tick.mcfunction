# ==========================================
# 檔案: lobby_tick.mcfunction
# 目的: 大廳多層級書本路由控制 (完整修復版)
# ==========================================

# ------------------------------------------
# 路由 A: 從 [模式選擇書] 進行選擇
# ------------------------------------------
# 選擇 1: 大逃殺 -> 清除模式選擇書，發放地圖選擇書
execute as @a[scores={select_mode=1}] run scoreboard players set #global arms_sub_mode 0
execute as @a[scores={select_mode=1}] run clear @s written_book{title:"模式選擇書"}
execute as @a[scores={select_mode=1}] run give @s written_book{title:"大逃殺地圖選擇",author:"系統",pages:['{"text":" ==== 大逃殺 ====\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"選擇地圖:\\n\\n","color":"gold","bold":false},{"text":"[▶ 地圖一: 經典]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger br_map_pick set 1"}},{"text":"[▶ 地圖二: 腐蝕之地]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger br_map_pick set 2"}},{"text":"[▶ 地圖三: 櫻峰之城]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger br_map_pick set 3"}},{"text":"[▶ 地圖四: 山吹城]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger br_map_pick set 4"}},{"text":"[▶ 地圖五: 普羅米修斯禁區]\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger br_map_pick set 5"}},{"text":"[▶ 開始遊戲 ]\\n","color":"dark_blue","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 10"}},{"text":"[ 返回上一步 ]","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 9"}}]}']} 1

# 選擇 2: 軍備競賽 -> 給予【軍備競賽模式選擇書】
execute as @a[scores={select_mode=2}] run clear @s written_book{title:"模式選擇書"}
execute as @a[scores={select_mode=2}] run give @s written_book{title:"軍備競賽模式選擇書",author:"系統",pages:['{"text":" ==== 軍備競賽 ====\\n\\n","color":"gold","bold":true,"extra":[{"text":"[▶ 佔點模式]\\n\\n","color":"dark_aqua","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 3"}},{"text":"[▶ 團隊死鬥模式]\\n\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 4"}},{"text":"[ 返回上一步 ]\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 9"}}]}']} 1
execute as @a[scores={select_mode=2}] run tellraw @s {"text":"[系統] 已開啟軍備競賽選單。","color":"yellow"}

# ------------------------------------------
# 從【軍備競賽模式選擇書】返回【模式選擇書】
# ------------------------------------------
execute as @a[scores={select_mode=9}] run clear @s written_book{title:"軍備競賽模式選擇書"}
execute as @a[scores={select_mode=9}] run clear @s written_book{title:"大逃殺地圖選擇"}
execute as @a[scores={select_mode=9}] run give @s written_book{title:"模式選擇書",author:"系統",pages:['{"text":" ==== 模式選擇 ====\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"[▶ 大逃殺模式]\\n\\n","color":"dark_gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 1"}},{"text":"[▶ 軍備競賽模式]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 2"}}]}']} 1

# ------------------------------------------
# 路由 B: 軍備競賽 -> 佔點模式設定 (select_mode = 3)
# ------------------------------------------
execute as @a[scores={select_mode=3}] run clear @s written_book{title:"軍備競賽模式選擇書"}
execute as @a[scores={select_mode=3}] run scoreboard players set #global arms_sub_mode 2

# 避免重複發放，先清除手上的設定書
execute as @a[scores={select_mode=3}] run clear @s written_book{title:"佔點模式設定"}
execute as @a[scores={select_mode=3}] run clear @s written_book{title:"團隊死鬥設定"}

# 發放「代理設定書」，提供返回與重新喚出 UI 的功能
execute as @a[scores={select_mode=3}] run give @s written_book{title:"佔點模式設定",author:"系統",pages:['{"text":" == 佔點參數設定 ==\\n\\n","color":"gold","bold":true,"extra":[{"text":"請在「聊天欄」中進行連點設定。\\n若聊天欄被洗掉，可點擊下方按鈕重新喚出介面。\\n\\n\\n","color":"dark_gray"},{"text":"[ 💬 重新喚出設定介面 ]\\n\\n\\n","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 3"}},{"text":"[▶ 確認並進入職業選擇 ]\\n\\n","color":"dark_blue","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 6"}},{"text":"[ 返回上一步 ]\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 7"}}]}']} 1

execute as @a[scores={select_mode=3}] run tellraw @s {"text":"[系統] 已選擇佔點模式，請在聊天欄設定參數。","color":"yellow"}
# 職業選擇後呼叫系統資料夾中的渲染 UI 所以在下面
# execute as @a[scores={select_mode=3}] run function game_core:system/dom_config_render

# ------------------------------------------
# 選擇 4: 團隊死鬥模式 -> 給予【團隊死鬥設定】
# ------------------------------------------
execute as @a[scores={select_mode=4}] run clear @s written_book{title:"軍備競賽模式選擇書"}
execute as @a[scores={select_mode=4}] run scoreboard players set #global arms_sub_mode 1

# 避免重複發放，先清除手上的設定書
execute as @a[scores={select_mode=4}] run clear @s written_book{title:"佔點模式設定"}
execute as @a[scores={select_mode=4}] run clear @s written_book{title:"團隊死鬥設定"}

# 發放「代理設定書」，提供返回與重新喚出 UI 的功能
execute as @a[scores={select_mode=4}] run give @s written_book{title:"團隊死鬥設定",author:"系統",pages:['{"text":" == TDM 參數設定 ==\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"請在「聊天欄」中進行連點設定。\\n若聊天欄被洗掉，可點擊下方按鈕重新喚出介面。\\n\\n\\n","color":"dark_gray"},{"text":"[ 💬 重新喚出設定介面 ]\\n\\n\\n","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 4"}},{"text":"[▶ 確認並進入職業選擇 ]\\n\\n","color":"dark_blue","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 6"}},{"text":"[ 返回上一步 ]\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 7"}}]}']} 1

execute as @a[scores={select_mode=4}] run tellraw @s {"text":"[系統] 已選擇團隊死鬥，請在聊天欄設定參數。","color":"yellow"}
# 職業選擇後呼叫系統資料夾中的渲染 UI 所以在下面
# execute as @a[scores={select_mode=4}] run function game_core:system/tdm_config_render

# ------------------------------------------
# 從【參數設定代理書】返回【軍備競賽模式選擇書】 (select_mode = 7)
# ------------------------------------------
execute as @a[scores={select_mode=7}] run clear @s written_book{title:"團隊死鬥設定"}
execute as @a[scores={select_mode=7}] run clear @s written_book{title:"佔點模式設定"}
execute as @a[scores={select_mode=7}] run give @s written_book{title:"軍備競賽模式選擇書",author:"系統",pages:['{"text":" ==== 軍備競賽 ====\\n\\n","color":"gold","bold":true,"extra":[{"text":"[▶ 佔點模式]\\n\\n","color":"dark_aqua","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 3"}},{"text":"[▶ 團隊死鬥模式]\\n\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 4"}},{"text":"[ 返回上一步 ]\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 9"}}]}']} 1

# 開啟觸發權限 (每 Tick 執行)
scoreboard players enable @a btn_score_up
scoreboard players enable @a btn_score_dn
scoreboard players enable @a btn_time_up
scoreboard players enable @a btn_time_dn

# --- [A] 分數增加與重置 ---
execute as @a[scores={btn_score_up=1..9998}] run playsound ui.button.click master @s ~ ~ ~ 1 1
# 根據子模式修改對應變數
execute as @a[scores={btn_score_up=1..9998}] if score #global arms_sub_mode matches 1 run scoreboard players operation #target_score tdm_config += @s btn_score_up
execute as @a[scores={btn_score_up=1..9998}] if score #global arms_sub_mode matches 2 run scoreboard players operation #target_score dom_config += @s btn_score_up

# 重置邏輯 (9999)
execute as @a[scores={btn_score_up=9999}] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={btn_score_up=9999}] if score #global arms_sub_mode matches 1 run scoreboard players set #target_score tdm_config 100 
execute as @a[scores={btn_score_up=9999}] if score #global arms_sub_mode matches 2 run scoreboard players set #target_score dom_config 100

# --- [B] 分數減少與防呆 ---
# TDM 減少與防呆 (下限 10)
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 1 if score #target_score tdm_config matches 11.. run playsound ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 1 if score #target_score tdm_config matches 11.. run scoreboard players operation #target_score tdm_config -= @s btn_score_dn 
execute if score #global arms_sub_mode matches 1 if score #target_score tdm_config matches ..9 run scoreboard players set #target_score tdm_config 10 
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 1 if score #target_score tdm_config matches ..10 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5

# DOM 減少與防呆 (下限 100)
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 2 if score #target_score dom_config matches 101.. run playsound ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 2 if score #target_score dom_config matches 101.. run scoreboard players operation #target_score dom_config -= @s btn_score_dn
execute if score #global arms_sub_mode matches 2 if score #target_score dom_config matches ..99 run scoreboard players set #target_score dom_config 100
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 2 if score #target_score dom_config matches ..100 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5

# --- [C] 時間增加與重置 --- 
execute as @a[scores={btn_time_up=1..9998}] run playsound ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={btn_time_up=1..9998}] if score #global arms_sub_mode matches 1 run scoreboard players operation #time_limit_sec tdm_config += @s btn_time_up 
execute as @a[scores={btn_time_up=1..9998}] if score #global arms_sub_mode matches 2 run scoreboard players operation #time_limit_sec dom_config += @s btn_time_up

execute as @a[scores={btn_time_up=9999}] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={btn_time_up=9999}] if score #global arms_sub_mode matches 1 run scoreboard players set #time_limit_sec tdm_config 600 
execute as @a[scores={btn_time_up=9999}] if score #global arms_sub_mode matches 2 run scoreboard players set #time_limit_sec dom_config 600

# --- [D] 時間減少與防呆 (共用下限 60 秒) ---
# TDM
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 1 if score #time_limit_sec tdm_config matches 61.. run playsound ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 1 if score #time_limit_sec tdm_config matches 61.. run scoreboard players operation #time_limit_sec tdm_config -= @s btn_time_dn
execute if score #global arms_sub_mode matches 1 if score #time_limit_sec tdm_config matches ..59 run scoreboard players set #time_limit_sec tdm_config 60
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 1 if score #time_limit_sec tdm_config matches ..60 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5

# DOM
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 2 if score #time_limit_sec dom_config matches 61.. run playsound ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 2 if score #time_limit_sec dom_config matches 61.. run scoreboard players operation #time_limit_sec dom_config -= @s btn_time_dn
execute if score #global arms_sub_mode matches 2 if score #time_limit_sec dom_config matches ..59 run scoreboard players set #time_limit_sec dom_config 60
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 2 if score #time_limit_sec dom_config matches ..60 run playsound block.note_block.bass master @s ~ ~ ~ 1 0.5


# ==========================================
# 核心：判定變動並「原地刷新介面」
# ==========================================
# 只要有任何按鈕被按下，依照目前的子模式重新發送 UI
# 1. 初始點擊書本時的呼叫路徑
execute as @a[scores={select_mode=3}] run function game_core:system/dom_config_render
execute as @a[scores={select_mode=4}] run function game_core:system/tdm_config_render

# 2. 觸發按鈕連點後的「原地刷新」呼叫路徑
execute as @a[scores={btn_score_up=1..}] if score #global arms_sub_mode matches 1 run function game_core:system/tdm_config_render
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 1 run function game_core:system/tdm_config_render
execute as @a[scores={btn_time_up=1..}] if score #global arms_sub_mode matches 1 run function game_core:system/tdm_config_render
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 1 run function game_core:system/tdm_config_render

execute as @a[scores={btn_score_up=1..}] if score #global arms_sub_mode matches 2 run function game_core:system/dom_config_render
execute as @a[scores={btn_score_dn=1..}] if score #global arms_sub_mode matches 2 run function game_core:system/dom_config_render
execute as @a[scores={btn_time_up=1..}] if score #global arms_sub_mode matches 2 run function game_core:system/dom_config_render
execute as @a[scores={btn_time_dn=1..}] if score #global arms_sub_mode matches 2 run function game_core:system/dom_config_render

# 清空所有觸發器狀態 (取代原本的 reset，避免權限遺失)
scoreboard players set @a btn_score_up 0
scoreboard players set @a btn_score_dn 0
scoreboard players set @a btn_time_up 0
scoreboard players set @a btn_time_dn 0


# ------------------------------------------
# 路由 C: 確認參數並發放【職業選擇書】與【啟動書】
# ------------------------------------------
execute if score #global arms_sub_mode matches 1 as @a[scores={select_mode=6}] run tellraw @a {"text":"[系統] 管理員已設定完畢！團隊死鬥即將開始，請選擇你的職業。","color":"gold","bold":true}
execute if score #global arms_sub_mode matches 2 as @a[scores={select_mode=6}] run tellraw @a {"text":"[系統] 管理員已設定完畢！佔點模式即將開始，請選擇你的職業。","color":"gold","bold":true}

# 透過發送 40 個換行符，推擠並隱藏先前的設定 UI
execute as @a[scores={select_mode=6}] run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

# 清除可能殘留的設定代理書
execute as @a[scores={select_mode=6}] run clear @s written_book{title:"佔點模式設定"}
execute as @a[scores={select_mode=6}] run clear @s written_book{title:"團隊死鬥設定"}
execute as @a[scores={select_mode=6}] run clear @s written_book{title:"職業選擇"}
execute as @a[scores={select_mode=6}] run clear @s written_book{title:"系統啟動確認"}

# 發放職業書給所有人，並清空管理員手上的設定書
execute as @a[scores={select_mode=6}] run clear @s written_book{title:"佔點模式設定"}
execute as @a[scores={select_mode=6}] at @s run give @a written_book{title:"職業選擇",author:"系統",pages:['{"text":" ==== 選擇職業 ====\\n\\n","color":"dark_aqua","bold":true,"extra":[{"text":"[ 自由人 (80 HP) ]\\n\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_class set 1"}},{"text":"[ 突擊兵 (100 HP) ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_class set 2"}},{"text":"[ 支援兵 (100 HP) ]\\n\\n","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_class set 3"}},{"text":"[ 哨兵 (100 HP) ]\\n","color":"blue","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_class set 4"}}]}']} 1

# 給予管理員「強制啟動」的權限書
execute as @a[scores={select_mode=6},tag=admin] run give @s written_book{title:"系統啟動確認",author:"系統",pages:['{"text":" ==== 啟動確認 ====\\n\\n請等待所有玩家選擇完畢後，點擊下方按鈕正式開始遊戲。\\n\\n\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"[▶ 開始遊戲 ]\\n\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 5"}},{"text":"[ 返回重選模式 ]\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 8"}}]}']} 1


# ==========================================
# 觸發器: 取消啟動與重置返回 (select_mode = 8)
# ==========================================
execute as @a[scores={select_mode=8}] run clear @s written_book{title:"系統啟動確認"}
execute as @a[scores={select_mode=8}] run clear @a written_book{title:"職業選擇"}

# 清除可能殘留的設定代理書
execute as @a[scores={select_mode=8}] run clear @s written_book{title:"佔點模式設定"}
execute as @a[scores={select_mode=8}] run clear @s written_book{title:"團隊死鬥設定"}

execute as @a[scores={select_mode=8}] run scoreboard players set @a class_type 0
execute as @a[scores={select_mode=8}] run tellraw @a {"text":"[系統] 管理員已取消遊戲啟動，請等待重新設定。","color":"yellow"}

# 給予初始的「模式選擇書」重新開始
execute as @a[scores={select_mode=8}] run give @s written_book{title:"模式選擇書",author:"系統",pages:['{"text":" ==== 模式選擇 ====\\n\\n","color":"dark_red","bold":true,"extra":[{"text":"[▶ 大逃殺模式]\\n\\n","color":"dark_gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 1"}},{"text":"[▶ 軍備競賽模式]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger select_mode set 2"}}]}']} 1


# ------------------------------------------
# 路由 D: 處理玩家點擊【職業選擇書】 (原封不動保留)
# ------------------------------------------
# ==== 自由人 (1) ====
execute as @a[scores={select_class=1}] run scoreboard players set @s class_type 1
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"自由人！","color":"aqua"}]
execute as @a[scores={select_class=1}] run tellraw @s {"text":""}
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「武器大師」","color":"green"}]
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"可購買和使用所有武器、配件與道具。","color":"white"}]
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「孤狼代價」","color":"red"}]
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"最大生命值上限為 80 HP (-20%)。","color":"white"}]
execute as @a[scores={select_class=1}] run tellraw @s {"text":""}
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買裝備: ","color":"yellow"},{"text":"無任何限制。","color":"white"}]
execute as @a[scores={select_class=1}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"關於投擲物: ","color":"yellow"},{"text":"你是唯一需要自己花錢購買的職業。","color":"white"}]

# ==== 突擊兵 (2) ====
execute as @a[scores={select_class=2}] run scoreboard players set @s class_type 2
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"突擊兵！","color":"aqua"}]
execute as @a[scores={select_class=2}] run tellraw @s {"text":""}
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「輕裝上陣」","color":"green"}]
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"移動速度 +40%。","color":"white"}]
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「輕裝協議」","color":"red"}]
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"無法購買或穿戴鐵等級以上(不含)的防具、無法購買高倍鏡。","color":"white"}]
execute as @a[scores={select_class=2}] run tellraw @s {"text":""}
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"散彈槍, 衝鋒槍，步槍","color":"white"}]
execute as @a[scores={select_class=2}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"擊殺敵人後自動補充 ","color":"white"},{"text":"閃光彈,破片手榴彈","color":"aqua"}]

# ==== 支援兵 (3) ====
execute as @a[scores={select_class=3}] run scoreboard players set @s class_type 3
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"支援兵！","color":"aqua"}]
execute as @a[scores={select_class=3}] run tellraw @s {"text":""}
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「戰術補給」","color":"green"}]
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"補包增強為強化補包。","color":"white"}]
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「後勤負擔」","color":"red"}]
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"所有物品的購買價格 +25%。","color":"white"}]
execute as @a[scores={select_class=3}] run tellraw @s {"text":""}
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"霰彈槍, 步槍，機槍","color":"white"}]
execute as @a[scores={select_class=3}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"所有投擲物。","color":"white"}]

# ==== 哨兵 (4) ====
execute as @a[scores={select_class=4}] run scoreboard players set @s class_type 4
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"哨兵！","color":"aqua"}]
execute as @a[scores={select_class=4}] run tellraw @s {"text":""}
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「陣地固守」","color":"green"}]
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"蹲下後，獲得 20% 傷害減免。","color":"white"}]
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「重裝步兵」","color":"red"}]
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"移動速度 -40%。","color":"white"}]
execute as @a[scores={select_class=4}] run tellraw @s {"text":""}
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"步槍, 狙擊槍，衝鋒槍","color":"white"}]
execute as @a[scores={select_class=4}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"擊殺敵人後自動補充 ","color":"white"},{"text":"煙霧彈,瞬爆手榴彈","color":"aqua"}]

# 職業選擇後呼叫系統資料夾中的渲染 UI
execute as @a[scores={select_mode=3}] run function game_core:system/dom_config_render
# 職業選擇後呼叫系統資料夾中的渲染 UI
execute as @a[scores={select_mode=4}] run function game_core:system/tdm_config_render


# ------------------------------------------
# 路由 E: 管理員按下【強制開始遊戲】(軍備競賽)
# ------------------------------------------
execute as @a[scores={select_mode=5},tag=admin] run clear @s written_book{title:"系統啟動確認"}
execute as @a[scores={select_mode=5},tag=admin] run function game_core:system/start_arms_race

# ------------------------------------------
# 路由 BR: 地圖選擇 (br_map_pick trigger)
# 鐵律：必須在 E2 (開始大逃殺) 之前執行！
# 原因：同一 Tick 內若玩家選圖＋管理員開局，要確保 #global br_map 已更新
#       再由 start_battle_royale 讀取，否則總是使用上一局或 init 的預設值。
# ------------------------------------------
scoreboard players enable @a br_map_pick
execute as @a[scores={br_map_pick=1}] run scoreboard players set #global br_map 1
execute as @a[scores={br_map_pick=1}] run tellraw @s {"text":"[系統] 已選擇地圖一：經典","color":"green"}
execute as @a[scores={br_map_pick=2}] run scoreboard players set #global br_map 2
execute as @a[scores={br_map_pick=2}] run tellraw @s {"text":"[系統] 已選擇地圖二：腐蝕之地","color":"green"}
execute as @a[scores={br_map_pick=3}] run scoreboard players set #global br_map 3
execute as @a[scores={br_map_pick=3}] run tellraw @s {"text":"[系統] 已選擇地圖三：櫻峰之城","color":"green"}
execute as @a[scores={br_map_pick=4}] run scoreboard players set #global br_map 4
execute as @a[scores={br_map_pick=4}] run tellraw @s {"text":"[系統] 已選擇地圖四：山吹城","color":"green"}
execute as @a[scores={br_map_pick=5}] run scoreboard players set #global br_map 5
execute as @a[scores={br_map_pick=5}] run tellraw @s {"text":"[系統] 已選擇地圖五：普羅米修斯禁區","color":"green"}
execute as @a[scores={br_map_pick=1..}] at @s run playsound ui.button.click master @s ~ ~ ~ 1 1
scoreboard players set @a[scores={br_map_pick=1..}] br_map_pick 0

# ------------------------------------------
# 路由 E2: 管理員按下【開始大逃殺】(select_mode = 10)
# ------------------------------------------
execute as @a[scores={select_mode=10},tag=admin] run clear @s written_book{title:"大逃殺地圖選擇"}
execute as @a[scores={select_mode=10},tag=admin] run function game_core:system/start_battle_royale

# ------------------------------------------
# 路由 F: 處理玩家加入隊伍 (join_team)
# ------------------------------------------
execute as @a[scores={join_team=1}] run team join red @s
execute as @a[scores={join_team=1}] run tellraw @a ["",{"selector":"@s","color":"gold"},{"text":" 加入了 ","color":"yellow"},{"text":"紅隊！","color":"red"}]

execute as @a[scores={join_team=2}] run team join blue @s
execute as @a[scores={join_team=2}] run tellraw @a ["",{"selector":"@s","color":"gold"},{"text":" 加入了 ","color":"yellow"},{"text":"藍隊！","color":"blue"}]

execute as @a[scores={join_team=3}] run team join white @s
execute as @a[scores={join_team=3}] run tellraw @a ["",{"selector":"@s","color":"gold"},{"text":" 加入了 ","color":"yellow"},{"text":"白隊！","color":"white"}]

execute as @a[scores={join_team=4}] run team join green @s
execute as @a[scores={join_team=4}] run tellraw @a ["",{"selector":"@s","color":"gold"},{"text":" 加入了 ","color":"yellow"},{"text":"綠隊！","color":"green"}]

execute as @a[scores={join_team=5}] run team join solo @s
execute as @a[scores={join_team=5}] run tellraw @a ["",{"selector":"@s","color":"gold"},{"text":" 選擇成為 ","color":"yellow"},{"text":"孤狼 (Solo)！","color":"dark_gray"}]

# ------------------------------------------
# 路由 G: 管理員隊伍控制 (admin_team_ctrl) (原封不動保留)
# ------------------------------------------
execute as @a[scores={admin_team_ctrl=1}] run tellraw @a {"text":"[系統] 管理員已將所有人隨機分為 兩隊！","color":"yellow"}
execute as @a[scores={admin_team_ctrl=1}] run execute store result score #team_turn temp_score run random value 1..2
execute as @a[scores={admin_team_ctrl=1}] run execute as @a[sort=random] run function game_core:system/random_team_2

execute as @a[scores={admin_team_ctrl=2}] run tellraw @a {"text":"[系統] 管理員已將所有人隨機分為 三隊！","color":"yellow"}
execute as @a[scores={admin_team_ctrl=2}] run execute store result score #team_turn temp_score run random value 1..3
execute as @a[scores={admin_team_ctrl=2}] run execute as @a[sort=random] run function game_core:system/random_team_3

execute as @a[scores={admin_team_ctrl=3}] run tellraw @a {"text":"[系統] 管理員已將所有人隨機分為 四隊！","color":"yellow"}
execute as @a[scores={admin_team_ctrl=3}] run execute store result score #team_turn temp_score run random value 1..4
execute as @a[scores={admin_team_ctrl=3}] run execute as @a[sort=random] run function game_core:system/random_team_4

execute as @a[scores={admin_team_ctrl=4}] run clear @a[tag=!admin] written_book{title:"隊伍選擇"}
execute as @a[scores={admin_team_ctrl=4}] run tellraw @a {"text":"[系統] 管理員已收回隊伍選擇書。","color":"yellow"}

# ------------------------------------------
# 收尾防呆與音效回饋 (原封不動保留)
# ------------------------------------------
execute as @a[scores={select_mode=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={select_class=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
scoreboard players set @a[scores={select_mode=1..}] select_mode 0
scoreboard players set @a[scores={select_class=1..}] select_class 0
scoreboard players enable @a select_mode
scoreboard players enable @a select_class

execute as @a[scores={join_team=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={admin_team_ctrl=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
scoreboard players set @a[scores={join_team=1..}] join_team 0
scoreboard players set @a[scores={admin_team_ctrl=1..}] admin_team_ctrl 0
scoreboard players enable @a join_team
scoreboard players enable @a admin_team_ctrl