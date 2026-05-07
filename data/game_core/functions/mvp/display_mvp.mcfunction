# ==========================================
# 檔案: mvp/display_mvp.mcfunction
# ==========================================

# 隊伍名稱可見（BR 結算）
execute if score #teams_alive br_sys matches ..1 run team modify blue nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify red nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify green nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify white nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo1 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo2 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo3 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo4 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo5 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo6 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo7 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo8 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo9 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo10 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo11 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo12 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo13 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo14 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo15 nametagVisibility always
execute if score #teams_alive br_sys matches ..1 run team modify solo16 nametagVisibility always

# 邊界重置
worldborder set 9999999

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

# ==========================================
# DOM 專屬
# ==========================================
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_capper] run tellraw @a [{"text":" 🏴 [佔點先鋒] ","color":"gold","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多佔點貢獻)","color":"gold"}]
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_flipper] run tellraw @a [{"text":" 🎯 [旗幟主宰] ","color":"yellow","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多佔領成功)","color":"yellow"}]
execute if score #global arms_sub_mode matches 2 as @a[tag=mvp_defender] run tellraw @a [{"text":" 🏰 [守土英雄] ","color":"aqua","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多守點)","color":"aqua"}]

# ==========================================
# 共用（所有模式）
# ==========================================
execute as @a[tag=mvp_loser] run tellraw @a [{"text":" 💀 [戰地砲灰] ","color":"gray","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多陣亡)","color":"gray"}]

tellraw @a {"text":"\n==========================================\n","color":"gold","bold":true}
