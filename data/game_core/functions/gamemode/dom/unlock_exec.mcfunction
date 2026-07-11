# ==========================================
# 檔案: gamemode/dom_unlock_exec.mcfunction
# 說明: 執行點位解鎖 (金磚+廣播+狀態更改)
# ==========================================

# --- A 點 ---
execute if entity @s[tag=Point_a] run scoreboard players set #Point_a dom_state 1
execute if entity @s[tag=Point_a] run tellraw @a {"text":"[系統] A 點 已開放！前往爭奪！","color":"yellow","bold":true}
execute if entity @s[tag=Point_a] run fill 196 24 -13 188 24 -21 minecraft:gold_block replace
execute if entity @s[tag=Point_a] at @a run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 0.5

# --- B 點 ---
execute if entity @s[tag=Point_b] run scoreboard players set #Point_b dom_state 1
execute if entity @s[tag=Point_b] run tellraw @a {"text":"[系統] B 點 已開放！前往爭奪！","color":"yellow","bold":true}
execute if entity @s[tag=Point_b] run fill 166 13 -53 156 13 -43 minecraft:gold_block replace
execute if entity @s[tag=Point_b] at @a run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 0.5

# --- C 點 ---
execute if entity @s[tag=Point_c] run scoreboard players set #Point_c dom_state 1
execute if entity @s[tag=Point_c] run tellraw @a {"text":"[系統] C 點 已開放！前往爭奪！","color":"yellow","bold":true}
execute if entity @s[tag=Point_c] run fill 130 13 -79 115 13 -94 minecraft:gold_block replace
execute if entity @s[tag=Point_c] at @a run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 0.5