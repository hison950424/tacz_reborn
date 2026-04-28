# ==========================================
# 檔案: mvp/display_mvp.mcfunction
# ==========================================
#隊伍名稱可見
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

#邊界重置
worldborder set 9999999

tellraw @a {"text":"\n================ 戰局結算 ================\n","color":"gold","bold":true}

execute as @a[tag=mvp_killer] run tellraw @a [{"text":" ⚔️ [王牌殺手] ","color":"red","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多擊殺)","color":"red"}]
execute as @a[tag=mvp_helper] run tellraw @a [{"text":" 🛡️ [國民神隊友] ","color":"green","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多助攻)","color":"green"}]
execute as @a[tag=mvp_loser] run tellraw @a [{"text":" 💀 [戰地砲灰] ","color":"gray","bold":true},{"selector":"@s","color":"gray"},{"text":" (最多陣亡)","color":"gray"}]

tellraw @a {"text":"\n==========================================\n","color":"gold","bold":true}