#純特效與靈魂生成
# 執行者: 被淘汰玩家，執行座標: 死亡地點的 Marker
# --- [A] 處決特效分流 ---
# 情況 1：已復活過 (二度死亡) -> 遠古守衛者詛咒 + 黑煙
execute if entity @s[tag=has_used_altar_temp] run playsound entity.elder_guardian.curse master @a[distance=..30] ~ ~ ~ 1 1
execute if entity @s[tag=has_used_altar_temp] run particle large_smoke ~ ~ ~ 0.5 1 0.5 0.05 50 normal

# 情況 2：一般淘汰 -> 暴擊音效 + 紅色血花
execute unless entity @s[tag=has_used_altar_temp] run playsound entity.player.attack.crit master @a[distance=..15] ~ ~ ~ 1 1
execute unless entity @s[tag=has_used_altar_temp] run particle block redstone_block ~ ~0.5 ~ 0.3 0.3 0.3 0.1 30 normal

# --- [B] 生成靈魂祭壇標籤 (供隊友回收) ---
# 注意：如果玩家帶有 has_used_altar_temp 標籤，就不生成靈魂 (規則：每人只能復活一次)
execute unless entity @s[tag=has_used_altar_temp] run summon marker ~ ~ ~ {Tags:["br_soul_marker"]}

# 將死者的 ID 與隊伍顏色繼承給剛生成的靈魂標籤
execute unless entity @s[tag=has_used_altar_temp] as @e[type=marker,tag=br_soul_marker,distance=..0.5,limit=1,sort=nearest] run scoreboard players operation @s br_id = #current_player br_id
execute unless entity @s[tag=has_used_altar_temp] as @e[type=marker,tag=br_soul_marker,distance=..0.5,limit=1,sort=nearest] run scoreboard players operation @s team_id = #current_player team_id