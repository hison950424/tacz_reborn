# ==========================================
# 檔案: gamemode/br_soul_pickup.mcfunction
# 執行者: @s (被撿起的靈魂 Marker 本身)
# ==========================================

# 1. 提取這個靈魂專屬的 br_id 到暫存黑板
scoreboard players operation #target_soul br_id = @s br_id

# 2. 給予「撿拾者 (活著的隊友)」UI 與音效回饋
# 【修正】使用 if score 來比對動態 ID，避開選擇器的常數限制
execute as @a if score @s br_id = #current_player br_id run title @s actionbar {"text":"✔ 已回收隊友靈魂","color":"green"}
execute as @a if score @s br_id = #current_player br_id run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1

# 3. 給予「死者 (變成靈魂的本人)」狀態變更、UI 與音效
# (這裡的 br_death_state=3 是常數，所以寫在選擇器裡是合法的，搭配 if score 做動態匹配)
execute as @a[scores={br_death_state=3}] if score @s br_id = #target_soul br_id run tag @s add soul_picked
execute as @a[scores={br_death_state=3}] if score @s br_id = #target_soul br_id run title @s title {"text":"✔ 靈魂已被拾取","color":"green","bold":true}
execute as @a[scores={br_death_state=3}] if score @s br_id = #target_soul br_id run title @s subtitle {"text":"等待隊友進行祭壇重啟","color":"gray"}
execute as @a[scores={br_death_state=3}] if score @s br_id = #target_soul br_id run playsound entity.player.levelup master @s ~ ~ ~ 1 1.2

# 4. 銷毀地上的靈魂實體
kill @s