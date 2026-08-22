# 重型武器 (9 把)
# 執行者: @s | GunCurrentAmmoCount = 彈夾容量 - 1，HasBulletInBarrel:1b
# 單發武器（rpg7/m320/aiyasinrpg/m79/m203/pf98a）彈夾容量=1 → count=0，膛室一發
execute if score #gk_give_gun gk_config matches 1 run give @s tacz:modern_kinetic_gun{GunId:"tacz:rpg7",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 2 run give @s tacz:modern_kinetic_gun{GunId:"tacz:m320",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 3 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qlz87",GunFireMode:"AUTO",GunCurrentAmmoCount:6,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 4 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:m32a1",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 5 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:aiyasinrpg",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 6 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:m79",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 7 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:m203",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 8 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:pf98a",GunFireMode:"SEMI",GunCurrentAmmoCount:0,HasBulletInBarrel:1b} 1
execute if score #gk_give_gun gk_config matches 9 run give @s tacz:modern_kinetic_gun{GunId:"suffuse:qlu11",GunFireMode:"SEMI",GunCurrentAmmoCount:4,HasBulletInBarrel:1b} 1