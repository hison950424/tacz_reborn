# ==========================================
# 檔案: gamemode/br_phase8_start.mcfunction
# Phase 8：決勝緩衝期（30 秒）
# 決賽縮圈完畢後觸發，給予玩家 30 秒緩衝，不論快速模式均相同
# 30 秒後自動進入 Phase 9（傷害期）
# ==========================================

scoreboard players set #br_phase dummy 8

# 緩衝計時器：30 秒 = 600 ticks（快速模式相同）
scoreboard players set #br_timer dummy 600

# 停止圓心移動
scoreboard players set #br_sx dummy 0
scoreboard players set #br_sz dummy 0

# 精確補正圓心位置
execute at @e[type=minecraft:marker,tag=br_center,limit=1] run worldborder center ~ ~

# ── 公告 ──
tellraw @a ["",{"text":"[縮圈] ","color":"dark_red"},{"text":"決賽圈縮圈完畢。30 秒後場地傷害將對所有存活玩家啟動！","color":"white"}]
