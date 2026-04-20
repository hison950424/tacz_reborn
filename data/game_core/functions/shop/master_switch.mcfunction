# ==========================================
# 檔案: shop/master_switch.mcfunction
# 執行者: @s (已確認身處基地內的玩家)
# ==========================================


# ==========================================
# 🛒 商店系統：大門守門員 (Master Switch)
# 說明：以極低效能消耗，攔截所有類別的商店物品
# ==========================================

# == 1. 核心模組與 UI ==
# 偵測 TacZ 槍械
execute as @s store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b} 0
# 偵測 TacZ 配件
execute as @s if score @s temp matches 0 store success score @s temp run clear @s tacz:attachment{shop:1b} 0
# 偵測 空白填充玻璃格
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:light_gray_stained_glass_pane{shop:1b} 0

# == 2. LRTactical 戰術模組 ==
# 偵測 近戰武器與閃光盾
execute as @s if score @s temp matches 0 store success score @s temp run clear @s lrtactical:melee{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s lrtactical:flash_shield{shop:1b} 0

# 偵測 投擲物
execute as @s if score @s temp matches 0 store success score @s temp run clear @s lrtactical:throwable{shop:1b} 0

# == 3. Minecraft 原版防具 (皮、鐵、鑽、獄髓) ==
# 皮革系列
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:leather_helmet{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:leather_chestplate{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:leather_leggings{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:leather_boots{shop:1b} 0

# 鐵系列
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:iron_helmet{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:iron_chestplate{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:iron_leggings{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:iron_boots{shop:1b} 0

# 鑽石系列
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:diamond_helmet{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:diamond_chestplate{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:diamond_leggings{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:diamond_boots{shop:1b} 0

# 獄髓系列
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:netherite_helmet{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:netherite_chestplate{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:netherite_leggings{shop:1b} 0
execute as @s if score @s temp matches 0 store success score @s temp run clear @s minecraft:netherite_boots{shop:1b} 0


execute if score @s temp matches 1.. run function game_core:shop/auto_restock
execute if score @s temp matches 1.. run function game_core:system/shop_tick
