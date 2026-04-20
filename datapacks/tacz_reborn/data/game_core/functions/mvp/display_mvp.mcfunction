# ==========================================
# 檔案: mvp/display_mvp.mcfunction
# ==========================================

tellraw @a {"text":"\n================ 戰局結算 ================\n","color":"gold","bold":true}

execute as @a[tag=mvp_killer] run tellraw @a [{"text":" ⚔️ [王牌殺手] ","color":"red","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多擊殺)","color":"red"}]
execute as @a[tag=mvp_helper] run tellraw @a [{"text":" 🛡️ [國民神隊友] ","color":"green","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多助攻)","color":"green"}]
execute as @a[tag=mvp_loser] run tellraw @a [{"text":" 💀 [戰地砲灰] ","color":"gray","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多陣亡)","color":"gray"}]

tellraw @a {"text":"\n==========================================\n","color":"gold","bold":true}