# ==========================================
# 檔案: shop/process_funds.mcfunction
# 執行者: @s (轉出方本人)
# ==========================================
# 1. 防護校驗：確認餘額充足 (避免幽靈殘值導致的溢出)
execute if score @s gd656killicon.score < @s transfer_val run tellraw @s {"text":"[系統] 錯誤：餘額異常不足。","color":"red"}
execute if score @s gd656killicon.score < @s transfer_val run function game_core:shop/force_cancel
execute if score @s gd656killicon.score < @s transfer_val run return 0

# 2. 暫存轉出金額
scoreboard players operation #transfer_amount temp_score = @s transfer_val

# 3. 轉出方扣款遞迴 (呼叫扁平化拆解)
scoreboard players operation #sync_val temp_score = @s transfer_val
function game_core:shop/sync_minus

# 4. 接收方加錢遞迴 (呼叫扁平化拆解)
execute as @a[tag=confirm_target,limit=1] run scoreboard players operation #sync_val temp_score = #transfer_amount temp_score
execute as @a[tag=confirm_target,limit=1] run function game_core:shop/sync_add

# 5. [核心修復] 雙重記分板同步防護 (Double-Sync Protection)
# 手動覆寫原版記分板，強制解決插件歸零時不發送封包的 Bug
scoreboard players operation @s gd656killicon.score -= #transfer_amount temp_score
execute as @a[tag=confirm_target,limit=1] run scoreboard players operation @s gd656killicon.score += #transfer_amount temp_score

# 6. [冷卻] 設定雙方轉帳冷卻時間 (900 ticks = 45秒)
# 防止記分板同步延遲期間的二次轉帳洗錢
scoreboard players set @s transfer_cooldown 900
execute as @a[tag=confirm_target,limit=1] run scoreboard players set @s transfer_cooldown 900
execute as @a[tag=confirm_target,limit=1] run function game_core:shop/force_cancel

# 7. 音效與視覺回饋
playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
execute as @a[tag=confirm_target,limit=1] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s ["",{"text":"[系統] 成功匯出 💰 ","color":"green"},{"score":{"name":"#transfer_amount","objective":"temp_score"},"color":"yellow"},{"text":" 元。","color":"green"}]
execute as @a[tag=confirm_target,limit=1] run tellraw @s ["",{"text":"[系統] 收到隊友的匯款 💰 ","color":"green"},{"score":{"name":"#transfer_amount","objective":"temp_score"},"color":"yellow"},{"text":" 元！","color":"green"}]

# 8. 強制關閉與清理
tag @a remove confirm_target
function game_core:shop/force_cancel