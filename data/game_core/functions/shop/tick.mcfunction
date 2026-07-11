# ==========================================
# 檔案: shop/shop_tick.mcfunction
# 命名空間: game_core
# 說明: 掃描玩家滑鼠與背包，攔截假槍並分流購買
# ==========================================

# 移除玩家身上商店中的填充玻璃片 (直接清除，無需進入後續判定)
clear @s minecraft:light_gray_stained_glass_pane{shop:1b, ShopItem:"filler"}

# == 手槍 ==
execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"cz75"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/cz75

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"tec9"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/tec9

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"viper2011"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/viper2011

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"b93r"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/b93r

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"usp45"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/usp45

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"tti2011"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/tti2011

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"p320"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/p320

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"deagle"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/deagle

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"python"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/python

# == 狙擊槍 ==
execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"svd"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/svd

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"springfield1873"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/springfield1873

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"dvl10"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/dvl10

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m700"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m700

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m107"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m107

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"ai_awp"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ai_awp

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m95"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m95

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"aw50"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/aw50

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"gm6"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/gm6

# == 步槍 (Assault Rifles) ==
execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"hk416d"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/hk416d

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"aks74u"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/aks74u

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"g36k"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/g36k

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"aug"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/aug

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"qbz951"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/qbz951

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"qbz191"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/qbz191

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"mpdr"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/mpdr

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"qbz_95"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/qbz_95

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m16a4"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m16a4

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"an94"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/an94

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"ak47"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ak47

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"qbu191"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/qbu191

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"fn_fal"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/fn_fal

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"sks_tactical"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sks_tactical

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"mk14"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/mk14

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"rm277"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/rm277

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"scar_h"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scar_h

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m1895"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m1895

# == 散彈槍 ==
execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"db_short"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/db_short

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"db_long"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/db_long

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m870"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m870

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"ks23m"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ks23m

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"spas_12_tacz"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/spas_12_tacz

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"aa12"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/aa12

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"spas12_suffuse"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/spas12_suffuse

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m1014"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m1014

# == 衝鋒槍 ==
execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"mas38"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/mas38

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"gepardpdw"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/gepardpdw

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"p90"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/p90

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"hk_mp5a5"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/hk_mp5a5

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"uzi"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/uzi

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"vector45"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/vector45

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"pp19"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/pp19

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"ar57"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ar57

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"ump45"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ump45

# == 機槍 ==
execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"m249"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m249

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"minigun"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/minigun

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"rpk"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/rpk

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"pkp"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/pkp

execute store success score @s temp run clear @s tacz:modern_kinetic_gun{shop:1b, ShopItem:"fn_evolys"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/fn_evolys

# == 彈匣 ==
execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"extended_mag_1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/extended_mag_1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"extended_mag_2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/extended_mag_2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"extended_mag_3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/extended_mag_3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"light_extended_mag_1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/light_extended_mag_1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"light_extended_mag_2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/light_extended_mag_2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"light_extended_mag_3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/light_extended_mag_3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"shotgun_extended_mag_1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/shotgun_extended_mag_1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"shotgun_extended_mag_2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/shotgun_extended_mag_2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"shotgun_extended_mag_3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/shotgun_extended_mag_3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sniper_extended_mag_1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sniper_extended_mag_1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sniper_extended_mag_2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sniper_extended_mag_2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sniper_extended_mag_3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sniper_extended_mag_3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"ammo_mod_i"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ammo_mod_i

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"ammo_mod_hp"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ammo_mod_hp

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"ammo_mod_he"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ammo_mod_he

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"ammo_mod_slug"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ammo_mod_slug

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"ammo_mod_fmj"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/ammo_mod_fmj

# == 瞄準鏡 ==
execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_qlu11s"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_qlu11s

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_compm4"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_compm4

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_acro_pistol"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_acro_pistol

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_sro_dot"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_sro_dot

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_srs_02"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_srs_02

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_pk06_pistol"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_pk06_pistol

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_fastfire_pistol"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_fastfire_pistol

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_deltapoint_pistol"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_deltapoint_pistol

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_t1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_t1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_t2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_t2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_dbala2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_dbala2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_hamr"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_hamr

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_uh1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_uh1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_coyote"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_coyote

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_552"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_552

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"sight_exp3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/sight_exp3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_acog_ta31"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_acog_ta31

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_vudu"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_vudu

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_qmk152"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_qmk152

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_lpvo_1_6"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_lpvo_1_6

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_elcan_4x"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_elcan_4x

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_mk5hd"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_mk5hd

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_standard_8x"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_standard_8x

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_retro_2x"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_retro_2x

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_contender"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_contender

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_1873_6x"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_1873_6x

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"scope_sig_tango_msr_1_6"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/scope_sig_tango_msr_1_6

# == 膛口 ==
execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_brake_mastiff_sg"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_brake_mastiff_sg

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_brake_timeless50"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_brake_timeless50

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_brake_pioneer"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_brake_pioneer

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_brake_cyclone_d2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_brake_cyclone_d2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_brake_trex"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_brake_trex

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_compensator_trident"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_compensator_trident

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_brake_cthulhu"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_brake_cthulhu

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"deagle_golden_long_barrel"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/deagle_golden_long_barrel

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_choke_sg"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_choke_sg

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_ursus"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_ursus

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_vulture"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_vulture

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_sg"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_sg

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_phantom_s1"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_phantom_s1

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_knight_qd"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_knight_qd

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_ptilopsis"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_ptilopsis

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"muzzle_silencer_mirage"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/muzzle_silencer_mirage

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"m7_silencer"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m7_silencer

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"rm277_silencer"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/rm277_silencer

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"bayonet_6h3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/bayonet_6h3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"bayonet_m9"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/bayonet_m9

# == 槍托 (Stocks) ==
execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"oem_stock_tactical"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/oem_stock_tactical

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"oem_stock_light"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/oem_stock_light

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"oem_stock_heavy"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/oem_stock_heavy

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_sig_blue_grey"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_sig_blue_grey

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_n4"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_n4

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_colt"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_colt

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_vltor_emod_green"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_vltor_emod_green

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_sig_black"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_sig_black

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_elf_ultralight"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_elf_ultralight

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_colt_plus"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_colt_plus

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_bcm_mod2_sopmod"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_bcm_mod2_sopmod

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_ak12"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_ak12

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_moe"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_moe

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_m4ss"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_m4ss

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_carbon_bone_c5"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_carbon_bone_c5

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_sba3"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_sba3

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_tactical_ar"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_tactical_ar

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_hk_slim_line"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_hk_slim_line

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_militech_b5"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_militech_b5

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_ripstock"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_ripstock

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_heavy_spas_12"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_heavy_spas_12

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"stock_tactical_spas_12"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stock_tactical_spas_12

# == 握把 (Grips) ==
execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_td_green"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_td_green

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_m203"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_m203

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_flashlight"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_flashlight

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"pistollaser"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/pistollaser

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_vertical_ranger"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_vertical_ranger

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_magpul_afg_2"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_magpul_afg_2

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_cobra"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_cobra

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_rk6"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_rk6

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_osovets_black"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_osovets_black

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_vertical_talon"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_vertical_talon

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_vertical_military"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_vertical_military

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_se_5"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_se_5

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_rk0"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_rk0

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_rk1_b25u"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_rk1_b25u

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"grip_td"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/grip_td

# == 雷射指示器 (Lasers) ==
execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"laser_compact"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/laser_compact

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"laser_nightstick"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/laser_nightstick

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"laser_lopro"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/laser_lopro

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"laser_pistol"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/laser_pistol

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"laser_an_peq_2a"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/laser_an_peq_2a

execute store success score @s temp run clear @s tacz:attachment{shop:1b, ShopItem:"laser_dbala2_attachment"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/laser_dbala2

# == 投擲物 (Throwables - 僅自由人) ==
execute store success score @s temp run clear @s lrtactical:throwable{shop:1b, ShopItem:"m67"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m67

execute store success score @s temp run clear @s lrtactical:throwable{shop:1b, ShopItem:"rgn"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/rgn

execute store success score @s temp run clear @s lrtactical:throwable{shop:1b, ShopItem:"smoke_grenade"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/smoke_grenade

execute store success score @s temp run clear @s lrtactical:throwable{shop:1b, ShopItem:"flash_grenade"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/flash_grenade

execute store success score @s temp run clear @s lrtactical:throwable{shop:1b, ShopItem:"molotov"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/molotov

# == 防具 (Armor) ==
# 皮革
execute store success score @s temp run clear @s minecraft:leather_helmet{shop:1b, ShopItem:"leather_helmet"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/leather_helmet

execute store success score @s temp run clear @s minecraft:leather_chestplate{shop:1b, ShopItem:"leather_chestplate"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/leather_chestplate

execute store success score @s temp run clear @s minecraft:leather_leggings{shop:1b, ShopItem:"leather_leggings"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/leather_leggings

execute store success score @s temp run clear @s minecraft:leather_boots{shop:1b, ShopItem:"leather_boots"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/leather_boots

# 鐵
execute store success score @s temp run clear @s minecraft:iron_helmet{shop:1b, ShopItem:"iron_helmet"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/iron_helmet

execute store success score @s temp run clear @s minecraft:iron_chestplate{shop:1b, ShopItem:"iron_chestplate"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/iron_chestplate

execute store success score @s temp run clear @s minecraft:iron_leggings{shop:1b, ShopItem:"iron_leggings"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/iron_leggings

execute store success score @s temp run clear @s minecraft:iron_boots{shop:1b, ShopItem:"iron_boots"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/iron_boots

# 鑽石
execute store success score @s temp run clear @s minecraft:diamond_helmet{shop:1b, ShopItem:"diamond_helmet"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/diamond_helmet

execute store success score @s temp run clear @s minecraft:diamond_chestplate{shop:1b, ShopItem:"diamond_chestplate"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/diamond_chestplate

execute store success score @s temp run clear @s minecraft:diamond_leggings{shop:1b, ShopItem:"diamond_leggings"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/diamond_leggings

execute store success score @s temp run clear @s minecraft:diamond_boots{shop:1b, ShopItem:"diamond_boots"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/diamond_boots

# 獄髓
execute store success score @s temp run clear @s minecraft:netherite_helmet{shop:1b, ShopItem:"netherite_helmet"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/netherite_helmet

execute store success score @s temp run clear @s minecraft:netherite_chestplate{shop:1b, ShopItem:"netherite_chestplate"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/netherite_chestplate

execute store success score @s temp run clear @s minecraft:netherite_leggings{shop:1b, ShopItem:"netherite_leggings"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/netherite_leggings

execute store success score @s temp run clear @s minecraft:netherite_boots{shop:1b, ShopItem:"netherite_boots"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/netherite_boots

# == 近戰武器 (Melee) ==
execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"dagger"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/dagger

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"lr_karambit"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/lr_karambit

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"baseball_bat"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/baseball_bat

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"css"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/css

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"tactical_knife"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/tactical_knife

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"m9_knife"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/m9_knife

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"bayonet_knife"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/bayonet_knife

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"talon"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/talon

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"cs2_karambit"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/cs2_karambit

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"skeleton"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/skeleton

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"stiletto"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/stiletto

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"butterfly"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/butterfly

execute store success score @s temp run clear @s lrtactical:melee{shop:1b, ShopItem:"push"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/push

# == 戰術護盾 (Shield) ==
execute store success score @s temp run clear @s lrtactical:flash_shield{shop:1b, ShopItem:"flash_shield"} 0
execute if score @s temp matches 1 run function game_core:shop/buy/flash_shield