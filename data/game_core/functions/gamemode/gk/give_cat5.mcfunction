# 機槍 (11 把)
# 執行者: @s | GunCurrentAmmoCount = 彈夾容量 - 1，HasBulletInBarrel:1b
# 特例：minigun 需設 HasBulletInBarrel:1b、HeatAmount:0.0f（冷卻初始值）、GunCurrentAmmoCount:9999（無限彈）
execute if score #gk_give_gun gk_config matches 1 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m249",GunFireMode:"AUTO",GunCurrentAmmoCount:74,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 2 run give @s tacz:modern_kinetic_gun{GunId:"tacz:rpk",GunFireMode:"AUTO",GunCurrentAmmoCount:40,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 3 run give @s tacz:modern_kinetic_gun{GunId:"tacz:minigun",GunFireMode:"AUTO",HasBulletInBarrel:1b,HeatAmount:0.0f,GunCurrentAmmoCount:9999} 1
execute if score #gk_give_gun gk_config matches 4 run give @s tacz:modern_kinetic_gun{GunId:"tacz:fn_evolys",GunFireMode:"AUTO",GunCurrentAmmoCount:74,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 5 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:mk3",GunFireMode:"AUTO",GunCurrentAmmoCount:29,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 6 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qjb_201",GunFireMode:"AUTO",GunCurrentAmmoCount:29,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 7 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:type81_lmg",GunFireMode:"AUTO",GunCurrentAmmoCount:30,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 8 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qjz171",GunFireMode:"AUTO",GunCurrentAmmoCount:49,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 9 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:mg338",GunFireMode:"AUTO",GunCurrentAmmoCount:49,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 10 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:pkp",GunFireMode:"AUTO",GunCurrentAmmoCount:119,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 11 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qjb951",GunFireMode:"AUTO",GunCurrentAmmoCount:20,HasBulletInBarrel:1b} 1