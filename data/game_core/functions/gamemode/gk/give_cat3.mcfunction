# 散彈槍 (10 把)
# 執行者: @s | GunCurrentAmmoCount = 彈夾容量 - 1，HasBulletInBarrel:1b
execute if score #gk_give_gun gk_config matches 1 run give @s tacz:modern_kinetic_gun{GunId:"tacz:db_short",GunFireMode:"SEMI",GunCurrentAmmoCount:1,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 2 run give @s tacz:modern_kinetic_gun{GunId:"tacz:db_long",GunFireMode:"SEMI",GunCurrentAmmoCount:1,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 3 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m870",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 4 run give @s tacz:modern_kinetic_gun{GunId:"tacz:spas_12",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 5 run give @s tacz:modern_kinetic_gun{GunId:"tacz:aa12",GunFireMode:"AUTO",GunCurrentAmmoCount:4,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 6 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m1014",GunFireMode:"SEMI",GunCurrentAmmoCount:6,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 7 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:gen12",GunFireMode:"AUTO",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 8 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qba221",GunFireMode:"SEMI",GunCurrentAmmoCount:8,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 9 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:spas12",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 10 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:ks23m",GunFireMode:"SEMI",GunCurrentAmmoCount:3,HasBulletInBarrel:1b} 1