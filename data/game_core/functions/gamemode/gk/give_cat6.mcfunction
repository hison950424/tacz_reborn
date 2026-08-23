# 狙擊槍 (16 把)
# 執行者: @s | GunCurrentAmmoCount = 彈夾容量 - 1，HasBulletInBarrel:1b
# 特例：ptrd41 彈夾容量=1 → count=0，僅膛室一發
# 已移除：springfied1873（單發換彈，效率極低）
execute if score #gk_give_gun gk_config matches 1 run give @s tacz:modern_kinetic_gun{GunId:"tacz:ai_awp",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 2 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m95",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 3 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m700",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 4 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m107",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 5 run give @s tacz:modern_kinetic_gun{GunId:"tacz:kar98",GunFireMode:"SEMI",GunCurrentAmmoCount:4,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 6 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:cslr4",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 7 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:svd",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 8 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:aw50",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 9 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:dvl10",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 10 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:gm6",GunFireMode:"SEMI",GunCurrentAmmoCount:6,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 11 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:m200",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 12 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:axmc",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 13 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:l115a3",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 14 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:axsr",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 15 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qbu88",GunFireMode:"SEMI",GunCurrentAmmoCount:10,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 16 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:ptrd41",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1