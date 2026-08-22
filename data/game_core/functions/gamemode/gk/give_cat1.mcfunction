# 手槍 (27 把)
# 執行者: @s | 前置條件: #gk_give_gun 已設為目標槍款索引
# GunCurrentAmmoCount = 彈夾容量 - 1（-1 是因膛室已上膛 HasBulletInBarrel:1b）
# 單發槍（lonetrail/trapper50cal/lifecard）彈夾容量=1 → count=0，膛室已有 1 發 = 滿彈
execute if score #gk_give_gun gk_config matches 1 run give @s tacz:modern_kinetic_gun{GunId:"tacz:glock_17",GunFireMode:"SEMI",GunCurrentAmmoCount:17,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 2 run give @s tacz:modern_kinetic_gun{GunId:"tacz:deagle",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 3 run give @s tacz:modern_kinetic_gun{GunId:"tacz:cz75",GunFireMode:"AUTO",GunCurrentAmmoCount:9,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 4 run give @s tacz:modern_kinetic_gun{GunId:"tacz:deagle_golden",GunFireMode:"SEMI",GunCurrentAmmoCount:9,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 5 run give @s tacz:modern_kinetic_gun{GunId:"tacz:p320",GunFireMode:"SEMI",GunCurrentAmmoCount:12,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 6 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m1911",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 7 run give @s tacz:modern_kinetic_gun{GunId:"tacz:b93r",GunFireMode:"AUTO",GunCurrentAmmoCount:20,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 8 run give @s tacz:modern_kinetic_gun{GunId:"tacz:timeless50",GunFireMode:"SEMI",GunCurrentAmmoCount:8,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 9 run give @s tacz:modern_kinetic_gun{GunId:"tacz:taurus943",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 10 run give @s tacz:modern_kinetic_gun{GunId:"tacz:rhino357",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 11 run give @s tacz:modern_kinetic_gun{GunId:"tacz:lonetrail",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 12 run give @s tacz:modern_kinetic_gun{GunId:"tacz:hk_mk23",GunFireMode:"SEMI",GunCurrentAmmoCount:12,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 13 run give @s tacz:modern_kinetic_gun{GunId:"tacz:taurus500",GunFireMode:"SEMI",GunCurrentAmmoCount:4,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 14 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m9a4",GunFireMode:"SEMI",GunCurrentAmmoCount:17,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 15 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:sw_686",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 16 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:desert",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 17 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:tec9",GunFireMode:"AUTO",GunCurrentAmmoCount:14,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 18 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:tti2011",GunFireMode:"SEMI",GunCurrentAmmoCount:12,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 19 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:trapper50cal",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 20 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:webley1913",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 21 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:usp45",GunFireMode:"SEMI",GunCurrentAmmoCount:12,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 22 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qsz92g",GunFireMode:"SEMI",GunCurrentAmmoCount:16,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 23 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:lifecard",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 24 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:python",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 25 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:tt33",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 26 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:np762",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 27 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:viper2011",GunFireMode:"SEMI",GunCurrentAmmoCount:12,HasBulletInBarrel:1b} 1