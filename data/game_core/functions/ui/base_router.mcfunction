# ==========================================
# 檔案: base_router.mcfunction
# 目的: 處理基地內多層級書本 UI 的按鈕邏輯
# ==========================================

# ------------------------------------------
# 區塊 A: 基地主選單動作 (base_menu)
# ------------------------------------------


# [動作 2: 前往中轉軍械庫]
execute as @a[scores={base_menu=2}] run clear @s written_book{title:"主選單"}
# 紅隊分流
execute as @a[team=red,scores={base_menu=2,class_type=1}] run tp @s @e[type=marker,tag=red_transit_1,limit=1]
execute as @a[team=red,scores={base_menu=2,class_type=2}] run tp @s @e[type=marker,tag=red_transit_2,limit=1]
execute as @a[team=red,scores={base_menu=2,class_type=3}] run tp @s @e[type=marker,tag=red_transit_3,limit=1]
execute as @a[team=red,scores={base_menu=2,class_type=4}] run tp @s @e[type=marker,tag=red_transit_4,limit=1]
# 藍隊分流
execute as @a[team=blue,scores={base_menu=2,class_type=1}] run tp @s @e[type=marker,tag=blue_transit_1,limit=1]
execute as @a[team=blue,scores={base_menu=2,class_type=2}] run tp @s @e[type=marker,tag=blue_transit_2,limit=1]
execute as @a[team=blue,scores={base_menu=2,class_type=3}] run tp @s @e[type=marker,tag=blue_transit_3,limit=1]
execute as @a[team=blue,scores={base_menu=2,class_type=4}] run tp @s @e[type=marker,tag=blue_transit_4,limit=1]
# 發放中轉軍械庫指令書 (包含三重視覺警告)
execute as @a[scores={base_menu=2}] run give @s written_book{title:"中轉軍械庫",author:"系統",pages:['{"text":"= 中轉軍械庫(返回書) =\\n\\n請將想留給隊友的武器放入前方的共享箱中。\\n\\n⚠️ ","color":"dark_aqua","bold":true,"extra":[{"text":"【嚴格警告】","color":"dark_red"},{"text":" ⚠️\\n進入選角區將會","color":"dark_aqua"},{"text":"永久刪除","color":"red"},{"text":"您身上殘留的槍械與投擲物！\\n\\n","color":"dark_aqua"},{"text":"[ 🔙 取消並返回基地 ]\\n\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger transit_action set 1"}}]}']} 1
execute as @a[scores={base_menu=2}] run give @s written_book{title:"中轉軍械庫",author:"系統",pages:['{"text":"= 中轉軍械庫(轉職書) =\\n\\n請將想留給隊友的武器放入前方的共享箱中。\\n\\n⚠️ ","color":"dark_aqua","bold":true,"extra":[{"text":"【嚴格警告】","color":"dark_red"},{"text":" ⚠️\\n進入選角區將會","color":"dark_aqua"},{"text":"永久刪除","color":"red"},{"text":"您身上殘留的槍械與投擲物！\\n\\n","color":"dark_aqua"},{"text":"[ 🚪 已放好，進入選角 ]\\n","color":"dark_green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger transit_action set 2"}}]}']} 1
execute as @a[scores={base_menu=2}] run title @s title {"text":"請將保留武器/裝備放入箱中","color":"yellow"}
execute as @a[scores={base_menu=2}] run title @s subtitle {"text":"下一步將會格式化背包！","color":"red"}


# ------------------------------------------
# 區塊 B: 中轉房動作 (transit_action)
# ------------------------------------------
# [動作 1: 取消並返回基地]
execute as @a[scores={transit_action=1}] run clear @s written_book{title:"中轉軍械庫"}
execute as @a[scores={transit_action=1},team=red] run tp @s @e[type=marker,tag=red_spawn,limit=1]
execute as @a[scores={transit_action=1},team=blue] run tp @s @e[type=marker,tag=blue_spawn,limit=1]
# 為了讓基地重新發書，移除標籤
execute as @a[scores={transit_action=1}] run tag @s remove in_base

# [動作 2: 格式化並前往選角室]
execute as @a[scores={transit_action=2}] run clear @s written_book{title:"中轉軍械庫"}
## 執行殘留武器格式化！
# execute as @a[scores={transit_action=2}] run clear @s tacz:modern_kinetic_gun
# execute as @a[scores={transit_action=2}] run clear @s lrtactical:throwable
# # 清除大補與速補 (以原版藥水代替示意)
# execute as @a[scores={transit_action=2}] run clear @s potion
# execute as @a[scores={transit_action=2}] run clear @s splash_potion
# # 清除彈藥箱
# execute as @a[scores={transit_action=2}] run clear @s tacz:ammo_box
execute as @a[scores={transit_action=2}] run clear @s

# 傳送至選角室 (紅藍隊分開)
execute as @a[scores={transit_action=2},team=red] run tp @s @e[type=marker,tag=red_class_room,limit=1]
execute as @a[scores={transit_action=2},team=blue] run tp @s @e[type=marker,tag=blue_class_room,limit=1]
# 初始化預選狀態，並發放轉職書
execute as @a[scores={transit_action=2}] run scoreboard players set @s pending_class 0
execute as @a[scores={transit_action=2}] run give @s written_book{title:"轉職中心",author:"系統",pages:['{"text":"==== 轉職中心 ====\\n\\n","color":"dark_aqua","bold":true,"extra":[{"text":"[ 自由人 (80 HP) ]\\n\\n","color":"gray","bold":false,"clickEvent":{"action":"run_command","value":"/trigger switch_class set 1"}},{"text":"[ 突擊兵 (100 HP) ]\\n\\n","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger switch_class set 2"}},{"text":"[ 支援兵 (100 HP) ]\\n\\n","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger switch_class set 3"}},{"text":"[ 哨兵 (100 HP) ]\\n\\n\\n","color":"blue","bold":false,"clickEvent":{"action":"run_command","value":"/trigger switch_class set 4"}},{"text":"[ ✅ 確認變更並返回 ]\\n","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger switch_class set 5"}}]}']} 1


# ------------------------------------------
# 區塊 C: 選角室預選與確認 (switch_class)
# ------------------------------------------
# [動作 1~4: 預選職業]
execute as @a[scores={switch_class=1..4}] run scoreboard players operation @s pending_class = @s switch_class
# ==== 自由人 (1) ====

execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"自由人！","color":"aqua"}]
execute as @a[scores={switch_class=1}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「武器大師」","color":"green"}]
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"可購買和使用所有武器、配件與道具。","color":"white"}]
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「孤狼代價」","color":"red"}]
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"最大生命值上限為 80 HP (-20%)。","color":"white"}]
execute as @a[scores={switch_class=1}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買裝備: ","color":"yellow"},{"text":"無任何限制。","color":"white"}]
execute as @a[scores={switch_class=1}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"關於投擲物: ","color":"yellow"},{"text":"你是唯一需要自己花錢購買的職業。","color":"white"}]

# ==== 突擊兵 (2) ====
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"突擊兵！","color":"aqua"}]
execute as @a[scores={switch_class=2}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「輕裝上陣」","color":"green"}]
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"移動速度 +40%。","color":"white"}]
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「輕裝協議」","color":"red"}]
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"無法購買或穿戴鐵等級以上(不含)的防具、無法購買高倍鏡。","color":"white"}]
execute as @a[scores={switch_class=2}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"散彈槍, 衝鋒槍，步槍","color":"white"}]
execute as @a[scores={switch_class=2}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"閃光彈,破片手榴彈","color":"aqua"},{"text":"擊殺敵人後自動補充 ","color":"white"}]

# ==== 支援兵 (3) ====
execute as @a[scores={switch_class=3}] run scoreboard players set @s class_type 3
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"支援兵！","color":"aqua"}]
execute as @a[scores={switch_class=3}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「戰術補給」","color":"green"}]
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"補包增強為強化補包。","color":"white"}]
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「後勤負擔」","color":"red"}]
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"所有物品的購買價格 +25%。","color":"white"}]
execute as @a[scores={switch_class=3}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"霰彈槍, 步槍，機槍","color":"white"}]
execute as @a[scores={switch_class=3}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"所有投擲物。","color":"white"},{"text":"擊殺敵人後自動補充 ","color":"white"}]

# ==== 哨兵 (4) ====
execute as @a[scores={switch_class=4}] run scoreboard players set @s class_type 4
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n"}]
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":"[系統] ","color":"gold"},{"text":"已選擇職業: ","color":"white"},{"text":"哨兵！","color":"aqua"}]
execute as @a[scores={switch_class=4}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":" + ","color":"green"},{"text":"Buff:「陣地固守」","color":"green"}]
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"蹲下後，獲得 20% 傷害減免。","color":"white"}]
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":" - ","color":"red"},{"text":"Debuff:「重裝步兵」","color":"red"}]
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":"   效果: ","color":"gray"},{"text":"移動速度 -40%。","color":"white"}]
execute as @a[scores={switch_class=4}] run tellraw @s {"text":""}
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"可購買主武器: ","color":"yellow"},{"text":"步槍, 狙擊槍，衝鋒槍","color":"white"}]
execute as @a[scores={switch_class=4}] run tellraw @s ["",{"text":" ▸ ","color":"gold"},{"text":"固有投擲物: ","color":"yellow"},{"text":"煙霧彈,瞬爆手榴彈","color":"aqua"},{"text":"擊殺敵人後自動補充 ","color":"white"}]


# ------------------------------------------
# 區塊 C 的轉職確認防呆 (修正多重分數報錯)
# ------------------------------------------
# [動作 5: 確認轉職並返回]
execute as @a[scores={switch_class=5}] run clear @s written_book{title:"轉職中心"}
# 情境 A: 沒選職業直接按確認 (取消轉職)
execute as @a[scores={switch_class=5,pending_class=0}] run tellraw @s {"text":"[系統] 未選擇任何新職業，已取消轉職。","color":"yellow"}
# 情境 B: 有預選職業 (正式套用)
execute as @a[scores={switch_class=5,pending_class=1..}] run scoreboard players operation @s class_type = @s pending_class
# 1. 調整身體屬性 (血量)
execute as @a[scores={switch_class=5,pending_class=0..}] run function game_core:class/apply_class
# 2. 發放新職業的初始裝備
execute as @a[scores={switch_class=5,pending_class=0..}] run function game_core:class/give_starter_gear
execute as @a[scores={switch_class=5,pending_class=0..}] run function game_core:class/reset_throwables
execute as @a[scores={switch_class=5,pending_class=0..}] run function game_core:class/give_ammo_box

execute as @a[scores={switch_class=5,pending_class=0..}] run scoreboard players set @s pending_class 0
# 共用動作: 傳回基地並重置標籤
execute as @a[team=red,scores={switch_class=5}] run tp @s @e[type=marker,tag=red_spawn,limit=1]
execute as @a[team=blue,scores={switch_class=5}] run tp @s @e[type=marker,tag=blue_spawn,limit=1]
execute as @a[scores={switch_class=5}] run tag @s remove in_base


# ------------------------------------------
# 收尾區塊: 音效與防呆歸零
# ------------------------------------------
# 只要有按任何按鈕，就播放清脆音效
execute as @a[scores={base_menu=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={transit_action=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={switch_class=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

# 將觸發變數歸零
scoreboard players set @a[scores={base_menu=1..}] base_menu 0
scoreboard players set @a[scores={transit_action=1..}] transit_action 0
scoreboard players set @a[scores={switch_class=1..}] switch_class 0

# 重新解鎖觸發權限 (確保玩家下一秒還能按)
scoreboard players enable @a base_menu
scoreboard players enable @a transit_action
scoreboard players enable @a switch_class