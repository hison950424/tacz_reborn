# ==========================================
# 檔案: gamemode/on_death.mcfunction
# 觸發: 當玩家死亡時 (death_trigger >= 1)
# ==========================================

# 陣亡補貼（依當前階段，落後隊 +25%）

# --- 早期（stage 0）：$15，落後隊 +$5 ---
execute if score #tdm_stage tdm_config matches 0 run gd656killicon server statistics add score @s 15
execute if score #tdm_stage tdm_config matches 0 run tellraw @s {"text":"[系統] 陣亡補貼：+15 元","color":"gray","italic":true}
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run gd656killicon server statistics add score @s 5
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run gd656killicon server statistics add score @s 5
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run tellraw @s {"text":"[系統] 落後補償：+5 元","color":"yellow","italic":true}
execute if score #tdm_stage tdm_config matches 0 if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run tellraw @s {"text":"[系統] 落後補償：+5 元","color":"yellow","italic":true}

# --- 中期（stage 1）：$45，落後隊 +$15 ---
execute if score #tdm_stage tdm_config matches 1 run gd656killicon server statistics add score @s 45
execute if score #tdm_stage tdm_config matches 1 run tellraw @s {"text":"[系統] 陣亡補貼：+45 元","color":"gray","italic":true}
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run gd656killicon server statistics add score @s 15
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run gd656killicon server statistics add score @s 15
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run tellraw @s {"text":"[系統] 落後補償：+15 元","color":"yellow","italic":true}
execute if score #tdm_stage tdm_config matches 1 if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run tellraw @s {"text":"[系統] 落後補償：+15 元","color":"yellow","italic":true}

# --- 後期（stage 2）：$135，落後隊 +$45 ---
execute if score #tdm_stage tdm_config matches 2 run gd656killicon server statistics add score @s 135
execute if score #tdm_stage tdm_config matches 2 run tellraw @s {"text":"[系統] 陣亡補貼：+135 元","color":"gray","italic":true}
execute if score #tdm_stage tdm_config matches 2 if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run gd656killicon server statistics add score @s 45
execute if score #tdm_stage tdm_config matches 2 if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run gd656killicon server statistics add score @s 45
execute if score #tdm_stage tdm_config matches 2 if score #tdm_losing_team tdm_config matches 1 if entity @s[team=red] run tellraw @s {"text":"[系統] 落後補償：+45 元","color":"yellow","italic":true}
execute if score #tdm_stage tdm_config matches 2 if score #tdm_losing_team tdm_config matches 2 if entity @s[team=blue] run tellraw @s {"text":"[系統] 落後補償：+45 元","color":"yellow","italic":true}

# --- 全局常駐 BUFF (恢復 I 與 飽食) ---
# 恢復 I (amplifier 0)，隱藏粒子
effect give @a minecraft:regeneration infinite 1 true
# 飽食 (amplifier 0)，隱藏粒子，確保飢餓值不掉
effect give @a minecraft:saturation infinite 1 true
