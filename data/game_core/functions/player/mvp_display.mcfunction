# ==========================================
# 檔案: mvp/display_mvp.mcfunction
# ==========================================


tellraw @a {"text":"\n================ 戰局結算 ================\n","color":"gold","bold":true}

# ==========================================
# 共用（所有模式）
# ==========================================
execute as @a[tag=mvp_killer] run tellraw @a [{"text":" ⚔️ [王牌殺手] ","color":"red","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多擊殺)","color":"red"}]

execute as @a[tag=mvp_helper] run tellraw @a [{"text":" 🛡️ [國民神隊友] ","color":"green","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多助攻)","color":"green"}]

# ==========================================
# BR 專屬
# ==========================================
execute if score #global game_state matches 1 as @a[tag=mvp_reviver] run tellraw @a [{"text":" 💚 [生死情義] ","color":"green","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多拉起)","color":"green"}]
execute if score #global game_state matches 1 as @a[tag=mvp_altar] run tellraw @a [{"text":" 🔥 [祭壇英雄] ","color":"light_purple","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多祭壇復活)","color":"light_purple"}]

# ==========================================
# TDM 專屬
# ==========================================
execute if score #global arms_sub_mode matches 1 as @a[tag=mvp_loser] run tellraw @a [{"text":" 💀 [戰地砲灰] ","color":"gray","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多陣亡)","color":"gray"}]

# ==========================================
# DOM 專屬
# ==========================================
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_capper] run tellraw @a [{"text":" 🏴 [佔點先鋒] ","color":"gold","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多佔點貢獻)","color":"gold"}]
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_flipper] run tellraw @a [{"text":" 🎯 [旗幟主宰] ","color":"yellow","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多佔領成功)","color":"yellow"}]
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_defender] run tellraw @a [{"text":" 🏰 [守土英雄] ","color":"aqua","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多守點)","color":"aqua"}]
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_loser] run tellraw @a [{"text":" 💀 [戰地砲灰] ","color":"gray","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多陣亡)","color":"gray"}]


# ==========================================
# 共用（所有模式）
# ==========================================

tellraw @a {"text":"\n==========================================\n","color":"gold","bold":true}
