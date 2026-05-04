# ==========================================
# 檔案: shop/process_funds.mcfunction
# 執行者: @s (轉出方本人)
# ==========================================
# 1. 轉出方扣款遞迴
scoreboard players operation #sync_val temp_score = @s transfer_val
function game_core:shop/sync_minus

# 2. 接收方加錢遞迴 (改用 confirm_target 絕對鎖定)
execute as @a[tag=confirm_target,limit=1] run scoreboard players operation #sync_val temp_score = #transfer_amount temp_score
execute as @a[tag=confirm_target,limit=1] run function game_core:shop/sync_add

# 3. 音效與視覺回饋
playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
execute as @a[tag=confirm_target,limit=1] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s ["",{"text":"[系統] 成功匯出 💰 ","color":"green"},{"score":{"name":"#transfer_amount","objective":"temp_score"},"color":"yellow"},{"text":" 元。","color":"green"}]
execute as @a[tag=confirm_target,limit=1] run tellraw @s ["",{"text":"[系統] 收到隊友的匯款 💰 ","color":"green"},{"score":{"name":"#transfer_amount","objective":"temp_score"},"color":"yellow"},{"text":" 元！","color":"green"}]

# 4. 強制關閉與清理
tag @a remove confirm_target
function game_core:shop/force_cancel