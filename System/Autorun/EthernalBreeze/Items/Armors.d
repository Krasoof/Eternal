instance itar_stext_mage_novise(c_item)
{
    name = itar_stext_mage_novise_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_leather;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 10;
    protection[2] = 15;
    protection[3] = 10;
    protection[5] = 15;
    protection[6] = 5;
    value = protection[5];
    visual = "ItAr_NDM_L.3ds";
    visual_change = "PIRANHA_INNOSROBE_ADRIAN.asc";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text = itar_stext_mage_novise_txt1;
    text[1] = itar_stext_mage_novise_txt2;
    text[2] = itar_stext_mage_novise_txt3;
    text[3] = itar_stext_mage_novise_txt4;
};

instance itar_StExt_helmet_crone(c_item) 
{
    name = itar_StExt_Str_helmet_crone_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 50;
    protection[6] = 0;
    value = 1000;
    visual = "ItMi_IceCrown.3ds";
    visual_change = "ItMi_IceCrown.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_greathelm(c_item) 
{
    name = itar_StExt_greathelm_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 35;
    protection[2] = 35;
    protection[3] = 10;
    protection[5] = 10;
    protection[6] = 15;
    value = 1000;
    visual = "greathelm.3ds";
    visual_change = "greathelm.3ds";
    visual_skin = 0;
    wear = wear_head;
	weight = 2;
};

instance itar_StExt_ancienthelm(c_item) 
{
    name = itar_StExt_ancienthelm_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 25;
    protection[2] = 25;
    protection[3] = 15;
    protection[5] = 15;
    protection[6] = 10;
    value = 750;
    visual = "helmet_01.3ds";
    visual_change = "helmet_01.3ds";
    visual_skin = 0;
    wear = wear_head;
	weight = 2;
};

instance itar_stext_hat_beliar(c_item) 
{
    name = itar_stext_hat_beliar_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 15;
    protection[2] = 15;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 10;
    value = 750;
    visual = "ITAR_HAT_BELIAR_FIXED.3ds";
    visual_change = "ITAR_HAT_BELIAR_FIXED.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_grey(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 15;
    protection[5] = 25;
    protection[6] = 0;
    value = 500;
    visual = "ITHE_MAGE_GREY.3ds";
    visual_change = "ITHE_MAGE_GREY.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_01(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_Merlinhut_dmbm.3ds";
    visual_change = "StExt_Merlinhut_dmbm.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_02(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_Merlinhut_Kdf_h.3ds";
    visual_change = "StExt_Merlinhut_Kdf_h.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_03(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_Merlinhut_kdf_m.3ds";
    visual_change = "StExt_Merlinhut_kdf_m.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_04(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_Merlinhut_kdw.3ds";
    visual_change = "StExt_Merlinhut_kdw.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_05(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_merlinhut_Law.3ds";
    visual_change = "StExt_merlinhut_Law.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_06(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_merlinhut_01.3ds";
    visual_change = "StExt_merlinhut_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_07(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_merlinhut_02.3ds";
    visual_change = "StExt_merlinhut_02.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_08(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_merlinhut_03.3ds";
    visual_change = "StExt_merlinhut_03.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hat_mage_09(c_item) 
{
    name = itar_stext_hat_mage_grey_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 25;
    protection[5] = 35;
    protection[6] = 0;
    value = 500;
    visual = "StExt_merlinhut_04.3ds";
    visual_change = "StExt_merlinhut_04.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_kapalin_1(c_item) 
{
    name = itar_stext_kapalin_1_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 25;
    protection[2] = 25;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 15;
    value = 500;
    visual = "kapalin_1.3ds";
    visual_change = "kapalin_1.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_kapalin_2(c_item) 
{
    name = itar_stext_kapalin_2_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 25;
    protection[2] = 25;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 15;
    value = 500;
    visual = "kapalin_2.3ds";
    visual_change = "kapalin_2.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_kapalin_3(c_item) 
{
    name = itar_stext_kapalin_3_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 25;
    protection[2] = 25;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 15;
    value = 500;
    visual = "kapalin_3.3ds";
    visual_change = "kapalin_3.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_kapalin_4(c_item) 
{
    name = itar_stext_kapalin_4_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 25;
    protection[2] = 25;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 15;
    value = 500;
    visual = "kapalin_4.3ds";
    visual_change = "kapalin_4.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "stext_hut.3ds";
    visual_change = "stext_hut.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_01(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_BIEDACKI_01.3ds";
    visual_change = "KOZA_BIEDACKI_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_02(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_01.3ds";
    visual_change = "KOZA_KAPELUSZ_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_03(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_02.3ds";
    visual_change = "KOZA_KAPELUSZ_02.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_04(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_02_BLACK.3ds";
    visual_change = "KOZA_KAPELUSZ_02_BLACK.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_05(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_03.3ds";
    visual_change = "KOZA_KAPELUSZ_03.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_06(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_04.3ds";
    visual_change = "KOZA_KAPELUSZ_04.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_06(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_05.3ds";
    visual_change = "KOZA_KAPELUSZ_05.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_07(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_06.3ds";
    visual_change = "KOZA_KAPELUSZ_06.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_08(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_07.3ds";
    visual_change = "KOZA_KAPELUSZ_07.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_09(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_KAPELUSZ_09.3ds";
    visual_change = "KOZA_KAPELUSZ_09.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_10(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "KOZA_PIRATE_HAT_01.3ds";
    visual_change = "KOZA_PIRATE_HAT_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_StExt_hut_01(c_item) 
{
    name = itar_StExt_hut_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelm;
    on_unequip = unequip_itar_shrechelm;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
    protection[5] = 5;
    protection[6] = 0;
    value = 200;
    visual = "stext_hut.3ds";
    visual_change = "stext_hut.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_wreath_01(c_item) 
{
    name = itar_stext_wreath_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 10;
    protection[5] = 15;
    protection[6] = 0;
    value = 250;
    visual = "KOZA_WIANEK_GREEN.3ds";
    visual_change = "KOZA_WIANEK_GREEN.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_wreath_02(c_item) 
{
    name = itar_stext_wreath_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 15;
    protection[5] = 10;
    protection[6] = 0;
    value = 250;
    visual = "KOZA_WIANEK_RED.3ds";
    visual_change = "KOZA_WIANEK_RED.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_wreath_03(c_item) 
{
    name = itar_stext_wreath_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 0;
    protection[2] = 0;
    protection[3] = 15;
    protection[5] = 15;
    protection[6] = 0;
    value = 250;
    visual = "KOZA_WIANEK_YELLOW.3ds";
    visual_change = "KOZA_WIANEK_YELLOW.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_plaguehood_01(c_item) 
{
    name = itar_stext_plaguehood_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 25;
    protection[5] = 25;
    protection[6] = 5;
    value = 250;
    visual = "KOZA_DOKTOR_PLAGUE_01.3ds";
    visual_change = "KOZA_DOKTOR_PLAGUE_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_plaguehood_02(c_item) 
{
    name = itar_stext_plaguehood_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 25;
    protection[5] = 25;
    protection[6] = 5;
    value = 250;
    visual = "KOZA_DRPLAGUES_BLACK_01.3ds";
    visual_change = "KOZA_DRPLAGUES_BLACK_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hood_01(c_item) 
{
    name = itar_stext_hood_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 20;
    protection[5] = 20;
    protection[6] = 0;
    value = 225;
    visual = "KOZA_KAPTUR_01.3ds";
    visual_change = "KOZA_KAPTUR_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};

instance itar_stext_hood_02(c_item) 
{
    name = itar_stext_hood_name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    inv_zbias = invcam_entf_helm;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_shrechelmspirit;
    on_unequip = unequip_itar_shrechelmspirit;
    protection[1] = 5;
    protection[2] = 5;
    protection[3] = 20;
    protection[5] = 20;
    protection[6] = 0;
    value = 225;
    visual = "KOZA_KAPTUR_BLACK_01.3ds";
    visual_change = "KOZA_KAPTUR_BLACK_01.3ds";
    visual_skin = 0;
    wear = wear_head;
};


instance itar_stext_collar(c_item) 
{
    name = itar_stext_collar_name;
	mainflag = item_kat_none;
	flags = item_mission;
	material = mat_metal;
	scemename = "FOODHUGE";
	on_state = use_itar_stext_collar; 
    value = 666;
	visual = "ItMi_StExt_Collar.3ds";
    visual_change = "ItMi_StExt_Collar.3ds";
    description = name;
    text[3] = itar_stext_collar_desc1; 
	text[4] = itar_stext_collar_desc2;	
	text[5] = name_value;
    count[5] = value;
};
func void use_itar_stext_collar()
{

};

instance itar_stext_shield_NTARCZA33(itar_shield_a) 
{
    name = itar_stext_shield_NTARCZA33_name;
    cond_atr = aivrx_npc_atr_stamina;
    cond_value = 30;
    description = name;
    on_equip = equip_itar_shield_03;
    on_unequip = unequip_itar_shield_03;
    protection[1] = 50;
    protection[2] = 50;
    protection[6] = 50;
	visual = "NTARCZA33.3ds";
    value = 1200;
	text[2] = name_prot_edge;
	text[3] = name_prot_blunt;
	text[4] = name_prot_point;	
	count[2] = protection[1];
	count[3] = protection[2];
	count[4] = protection[6];    
    text[5] = name_value;
    count[5] = value;
};

instance itar_stext_godarmor(c_item) 
{
    name = itar_stext_godarmor_name;
    change_atr[1] = atr_hitpoints_max;
    change_value[1] = 500;
    change_atr[2] = npc_item_atr_hitpoints;
    change_value[2] = 500;	
	cond_atr = aivrx_npc_atr_stamina;
    cond_value = 95;	
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_leather;
    on_equip = equip_otherarmor;
    //on_unequip = unequip_otherarmor;
    protection[prot_blunt] = 400;
    protection[prot_edge] = 400;
    protection[prot_fire] = 250;
    protection[prot_magic] = 250;
    protection[prot_point] = 400;
    protection[prot_fly] = 200;
	protection[prot_fall] = 200;
    value = 10000;
    visual = "ItAr_Pal_H_V5.3ds";
    visual_change = "EBONOWAZBROJA13.asc";
    visual_skin = 0;
    wear = wear_torso;
    weight = 7;
};


// -----------------------------------------------------
//					Separated armors
// -----------------------------------------------------

// Pauldrons prototypes
prototype Itar_Stext_Torso_Low_Proto(c_item) 
{
	name = itar_stext_torso_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 1500;
    visual_skin = 0;
	visual = "ItAr_Uniform_L.3ds";
    wear = wear_breast;
	inv_animate = 0;
	protection[1] = 15;
    protection[2] = 15;
    protection[3] = 15;
	protection[4] = 15;
    protection[5] = 15;
    protection[6] = 15;
};
prototype Itar_Stext_Torso_Med_Proto(c_item) 
{
	name = itar_stext_torso_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 2500;
    visual_skin = 0;
	visual = "ItAr_Uniform_L.3ds";
    wear = wear_breast;
	inv_animate = 0;
	protection[1] = 20;
    protection[2] = 20;
    protection[3] = 20;
	protection[4] = 20;
    protection[5] = 20;
    protection[6] = 20;
};
prototype Itar_Stext_Torso_Top_Proto(c_item) 
{
	name = itar_stext_torso_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_metal;
    value = 5000;
    visual_skin = 0;
	visual = "ItAr_Uniform_L.3ds";
    wear = wear_breast;
	inv_animate = 0;
	protection[1] = 25;
    protection[2] = 25;
    protection[3] = 25;
	protection[4] = 25;
    protection[5] = 25;
    protection[6] = 25;
};

// Pants prototypes
prototype Itar_Stext_Pants_Low_Proto(c_item) 
{
	name = itar_stext_pants_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 1000;
    visual_skin = 0;
	visual = "ItAr_Uniform_L.3ds";
    wear = wear_pants;
	inv_animate = 0;
	protection[1] = 10;
    protection[2] = 10;
    protection[3] = 10;
	protection[4] = 10;
    protection[5] = 10;
    protection[6] = 10;
};
prototype Itar_Stext_Pants_Med_Proto(c_item) 
{
	name = itar_stext_pants_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 2000;
    visual_skin = 0;
	visual = "ItAr_Uniform_L.3ds";
    wear = wear_pants;
	inv_animate = 0;
	protection[1] = 15;
    protection[2] = 15;
    protection[3] = 15;
	protection[4] = 15;
    protection[5] = 15;
    protection[6] = 15;
};
prototype Itar_Stext_Pants_Top_Proto(c_item) 
{
	name = itar_stext_pants_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_metal;
    value = 3000;
    visual_skin = 0;
	visual = "ItAr_Uniform_L.3ds";
    wear = wear_pants;
	inv_animate = 0;
	protection[1] = 20;
    protection[2] = 20;
    protection[3] = 20;
	protection[4] = 20;
    protection[5] = 20;
    protection[6] = 20;
};

// Boots prototypes
prototype ItAr_StExt_Boots_Low_Proto(c_item) 
{
	name = itar_stext_boots_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 500;
    visual_skin = 0;
	visual = "stext_inv_boots.3ds";
    wear = wear_boots;
	inv_animate = 0;
	protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
	protection[4] = 5;
    protection[5] = 5;
    protection[6] = 5;
};
prototype ItAr_StExt_Boots_Med_Proto(c_item) 
{
	name = itar_stext_boots_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 1500;
    visual_skin = 0;
	visual = "stext_inv_boots.3ds";
    wear = wear_boots;
	inv_animate = 0;
	protection[1] = 10;
    protection[2] = 10;
    protection[3] = 10;
	protection[4] = 10;
    protection[5] = 10;
    protection[6] = 10;
};
prototype ItAr_StExt_Boots_Top_Proto(c_item) 
{
	name = itar_stext_boots_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_metal;
    value = 2500;
    visual_skin = 0;
	visual = "stext_inv_boots.3ds";
    wear = wear_boots;
	inv_animate = 0;
	protection[1] = 15;
    protection[2] = 15;
    protection[3] = 15;
	protection[4] = 15;
    protection[5] = 15;
    protection[6] = 15;
};

// Gloves prototypes
prototype Itar_Stext_Gloves_Low_Proto(c_item) 
{
	name = itar_stext_gloves_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 500;
    visual_skin = 0;
	visual = "stext_inv_gloves.3ds";
    wear = wear_gloves;
	inv_animate = 0;
	protection[1] = 5;
    protection[2] = 5;
    protection[3] = 5;
	protection[4] = 5;
    protection[5] = 5;
    protection[6] = 5;
};
prototype Itar_Stext_Gloves_Med_Proto(c_item) 
{
	name = itar_stext_gloves_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
    value = 1500;
    visual_skin = 0;
	visual = "stext_inv_gloves.3ds";
    wear = wear_gloves;
	inv_animate = 0;
	protection[1] = 10;
    protection[2] = 10;
    protection[3] = 10;
	protection[4] = 10;
    protection[5] = 10;
    protection[6] = 10;
};
prototype Itar_Stext_Gloves_Top_Proto(c_item) 
{
	name = itar_stext_gloves_name;
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_metal;
    value = 2500;
    visual_skin = 0;
	visual = "stext_inv_gloves.3ds";
    wear = wear_gloves;
	inv_animate = 0;
	protection[1] = 15;
    protection[2] = 15;
    protection[3] = 15;
	protection[4] = 15;
    protection[5] = 15;
    protection[6] = 15;
};


// -----------------------------------------------------
//						Generated
// Template
// instance [instName]([protoName]) { visual_change = [visualName]; };

instance ItAr_StExt_Boots_Low_00(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Boots_Leather_Low_01.ASC"; };
instance ItAr_StExt_Boots_Low_01(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_01.ASC"; };
instance ItAr_StExt_Boots_Low_02(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_02.ASC"; };
instance ItAr_StExt_Boots_Low_03(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_03.ASC"; };
instance ItAr_StExt_Boots_Low_04(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_04.ASC"; };
instance ItAr_StExt_Boots_Low_05(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_05.ASC"; };
instance ItAr_StExt_Boots_Low_06(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_06.ASC"; };
instance ItAr_StExt_Boots_Low_07(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_07.ASC"; };
instance ItAr_StExt_Boots_Low_08(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_08.ASC"; };
instance ItAr_StExt_Boots_Low_09(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_09.ASC"; };
instance ItAr_StExt_Boots_Low_10(ItAr_StExt_Boots_Low_Proto) { visual_change = "ItAr_Shoes_10.ASC"; };

instance ItAr_StExt_Boots_Med_00(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_01.ASC"; };
instance ItAr_StExt_Boots_Med_01(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_02.ASC"; };
instance ItAr_StExt_Boots_Med_02(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_03.ASC"; };
instance ItAr_StExt_Boots_Med_03(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_04.ASC"; };
instance ItAr_StExt_Boots_Med_04(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_05.ASC"; };
instance ItAr_StExt_Boots_Med_05(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_06.ASC"; };
instance ItAr_StExt_Boots_Med_06(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_07.ASC"; };
instance ItAr_StExt_Boots_Med_07(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_08.ASC"; };
instance ItAr_StExt_Boots_Med_08(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_09.ASC"; };
instance ItAr_StExt_Boots_Med_09(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Leather_10.ASC"; };
instance ItAr_StExt_Boots_Med_10(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_0.ASC"; };
instance ItAr_StExt_Boots_Med_11(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_02.ASC"; };
instance ItAr_StExt_Boots_Med_12(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_03.ASC"; };
instance ItAr_StExt_Boots_Med_13(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_04.ASC"; };
instance ItAr_StExt_Boots_Med_14(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_05.ASC"; };
instance ItAr_StExt_Boots_Med_15(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_06.ASC"; };
instance ItAr_StExt_Boots_Med_16(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_07.ASC"; };
instance ItAr_StExt_Boots_Med_17(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_08.ASC"; };
instance ItAr_StExt_Boots_Med_18(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_09.ASC"; };
instance ItAr_StExt_Boots_Med_19(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_10.ASC"; };
instance ItAr_StExt_Boots_Med_20(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_Boots_Steal_11.ASC"; };
instance ItAr_StExt_Boots_Med_21(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_01.ASC"; };
instance ItAr_StExt_Boots_Med_22(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_02.ASC"; };
instance ItAr_StExt_Boots_Med_23(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_03.ASC"; };
instance ItAr_StExt_Boots_Med_24(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_04.ASC"; };
instance ItAr_StExt_Boots_Med_25(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_05.ASC"; };
instance ItAr_StExt_Boots_Med_26(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_06.ASC"; };
instance ItAr_StExt_Boots_Med_27(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_07.ASC"; };
instance ItAr_StExt_Boots_Med_28(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_08.ASC"; };
instance ItAr_StExt_Boots_Med_29(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_09.ASC"; };
instance ItAr_StExt_Boots_Med_30(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_10.ASC"; };
instance ItAr_StExt_Boots_Med_31(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_11.ASC"; };
instance ItAr_StExt_Boots_Med_32(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_12.ASC"; };
instance ItAr_StExt_Boots_Med_33(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_13.ASC"; };
instance ItAr_StExt_Boots_Med_34(ItAr_StExt_Boots_Med_Proto) { visual_change = "ItAr_HeavyBoots_14.ASC"; };

instance ItAr_StExt_Boots_Top_00(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_01.ASC"; };
instance ItAr_StExt_Boots_Top_01(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_02.ASC"; };
instance ItAr_StExt_Boots_Top_02(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_03.ASC"; };
instance ItAr_StExt_Boots_Top_03(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_04.ASC"; };
instance ItAr_StExt_Boots_Top_04(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_05.ASC"; };
instance ItAr_StExt_Boots_Top_05(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_06.ASC"; };
instance ItAr_StExt_Boots_Top_06(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_07.ASC"; };
instance ItAr_StExt_Boots_Top_07(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_08.ASC"; };
instance ItAr_StExt_Boots_Top_08(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_09.ASC"; };
instance ItAr_StExt_Boots_Top_09(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteelBoots_10.ASC"; };
instance ItAr_StExt_Boots_Top_10(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_01.ASC"; };
instance ItAr_StExt_Boots_Top_11(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_02.ASC"; };
instance ItAr_StExt_Boots_Top_12(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_03.ASC"; };
instance ItAr_StExt_Boots_Top_13(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_04.ASC"; };
instance ItAr_StExt_Boots_Top_14(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_05.ASC"; };
instance ItAr_StExt_Boots_Top_15(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_06.ASC"; };
instance ItAr_StExt_Boots_Top_16(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_07.ASC"; };
instance ItAr_StExt_Boots_Top_17(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_08.ASC"; };
instance ItAr_StExt_Boots_Top_18(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_09.ASC"; };
instance ItAr_StExt_Boots_Top_19(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_10.ASC"; };
instance ItAr_StExt_Boots_Top_20(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_11.ASC"; };
instance ItAr_StExt_Boots_Top_21(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_12.ASC"; };
instance ItAr_StExt_Boots_Top_22(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_13.ASC"; };
instance ItAr_StExt_Boots_Top_23(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_14.ASC"; };
instance ItAr_StExt_Boots_Top_24(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_15.ASC"; };
instance ItAr_StExt_Boots_Top_25(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_16.ASC"; };
instance ItAr_StExt_Boots_Top_26(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_17.ASC"; };
instance ItAr_StExt_Boots_Top_27(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_18.ASC"; };
instance ItAr_StExt_Boots_Top_28(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HeavySteel_19.ASC"; };
instance ItAr_StExt_Boots_Top_29(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_01.ASC"; };
instance ItAr_StExt_Boots_Top_30(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_02.ASC"; };
instance ItAr_StExt_Boots_Top_31(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_03.ASC"; };
instance ItAr_StExt_Boots_Top_32(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_04.ASC"; };
instance ItAr_StExt_Boots_Top_33(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_05.ASC"; };
instance ItAr_StExt_Boots_Top_34(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_06.ASC"; };
instance ItAr_StExt_Boots_Top_35(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_07.ASC"; };
instance ItAr_StExt_Boots_Top_36(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_08.ASC"; };
instance ItAr_StExt_Boots_Top_37(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_09.ASC"; };
instance ItAr_StExt_Boots_Top_38(ItAr_StExt_Boots_Top_Proto) { visual_change = "ItAr_HighBoots_10.ASC"; };

instance ItAr_StExt_Gloves_Low_00(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_01.ASC"; };
instance ItAr_StExt_Gloves_Low_01(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_02.ASC"; };
instance ItAr_StExt_Gloves_Low_02(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_03.ASC"; };
instance ItAr_StExt_Gloves_Low_03(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_04.ASC"; };
instance ItAr_StExt_Gloves_Low_04(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_05.ASC"; };
instance ItAr_StExt_Gloves_Low_05(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_06.ASC"; };
instance ItAr_StExt_Gloves_Low_06(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_07.ASC"; };
instance ItAr_StExt_Gloves_Low_07(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_08.ASC"; };
instance ItAr_StExt_Gloves_Low_08(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_09.ASC"; };
instance ItAr_StExt_Gloves_Low_09(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_10.ASC"; };
instance ItAr_StExt_Gloves_Low_10(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_11.ASC"; };
instance ItAr_StExt_Gloves_Low_11(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_12.ASC"; };
instance ItAr_StExt_Gloves_Low_12(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_13.ASC"; };
instance ItAr_StExt_Gloves_Low_13(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_14.ASC"; };
instance ItAr_StExt_Gloves_Low_14(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_15.ASC"; };
instance ItAr_StExt_Gloves_Low_15(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_17.ASC"; };
instance ItAr_StExt_Gloves_Low_16(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_18.ASC"; };
instance ItAr_StExt_Gloves_Low_17(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_19.ASC"; };
instance ItAr_StExt_Gloves_Low_18(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_20.ASC"; };
instance ItAr_StExt_Gloves_Low_19(ItAr_StExt_Gloves_Low_Proto) { visual_change = "ItAr_Braclets_Low_21.ASC"; };

instance ItAr_StExt_Gloves_Med_00(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_01.ASC"; };
instance ItAr_StExt_Gloves_Med_01(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_02.ASC"; };
instance ItAr_StExt_Gloves_Med_02(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_03.ASC"; };
instance ItAr_StExt_Gloves_Med_03(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_04.ASC"; };
instance ItAr_StExt_Gloves_Med_04(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_05.ASC"; };
instance ItAr_StExt_Gloves_Med_05(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_06.ASC"; };
instance ItAr_StExt_Gloves_Med_06(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_07.ASC"; };
instance ItAr_StExt_Gloves_Med_07(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_08.ASC"; };
instance ItAr_StExt_Gloves_Med_08(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_09.ASC"; };
instance ItAr_StExt_Gloves_Med_09(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_10.ASC"; };
instance ItAr_StExt_Gloves_Med_10(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_11.ASC"; };
instance ItAr_StExt_Gloves_Med_11(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_12.ASC"; };
instance ItAr_StExt_Gloves_Med_12(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_13.ASC"; };
instance ItAr_StExt_Gloves_Med_13(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_14.ASC"; };
instance ItAr_StExt_Gloves_Med_14(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_15.ASC"; };
instance ItAr_StExt_Gloves_Med_15(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Braclets_16.ASC"; };
instance ItAr_StExt_Gloves_Med_16(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_01.ASC"; };
instance ItAr_StExt_Gloves_Med_17(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_02.ASC"; };
instance ItAr_StExt_Gloves_Med_18(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_03.ASC"; };
instance ItAr_StExt_Gloves_Med_19(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_04.ASC"; };
instance ItAr_StExt_Gloves_Med_20(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_05.ASC"; };
instance ItAr_StExt_Gloves_Med_21(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_06.ASC"; };
instance ItAr_StExt_Gloves_Med_22(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_07.ASC"; };
instance ItAr_StExt_Gloves_Med_23(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_08.ASC"; };
instance ItAr_StExt_Gloves_Med_24(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_09.ASC"; };
instance ItAr_StExt_Gloves_Med_25(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_10.ASC"; };
instance ItAr_StExt_Gloves_Med_26(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_11.ASC"; };
instance ItAr_StExt_Gloves_Med_27(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_12.ASC"; };
instance ItAr_StExt_Gloves_Med_28(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_13.ASC"; };
instance ItAr_StExt_Gloves_Med_29(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_14.ASC"; };
instance ItAr_StExt_Gloves_Med_30(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_15.ASC"; };
instance ItAr_StExt_Gloves_Med_31(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_16.ASC"; };
instance ItAr_StExt_Gloves_Med_32(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_17.ASC"; };
instance ItAr_StExt_Gloves_Med_33(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_19.ASC"; };
instance ItAr_StExt_Gloves_Med_34(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_20.ASC"; };
instance ItAr_StExt_Gloves_Med_35(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_21.ASC"; };
instance ItAr_StExt_Gloves_Med_36(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_22.ASC"; };
instance ItAr_StExt_Gloves_Med_37(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_23.ASC"; };
instance ItAr_StExt_Gloves_Med_38(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_24.ASC"; };
instance ItAr_StExt_Gloves_Med_39(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_25.ASC"; };
instance ItAr_StExt_Gloves_Med_40(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_26.ASC"; };
instance ItAr_StExt_Gloves_Med_41(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_27.ASC"; };
instance ItAr_StExt_Gloves_Med_42(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_28.ASC"; };
instance ItAr_StExt_Gloves_Med_43(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_29.ASC"; };
instance ItAr_StExt_Gloves_Med_44(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_30.ASC"; };
instance ItAr_StExt_Gloves_Med_45(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_31.ASC"; };
instance ItAr_StExt_Gloves_Med_46(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_32.ASC"; };
instance ItAr_StExt_Gloves_Med_47(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_33.ASC"; };
instance ItAr_StExt_Gloves_Med_48(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_34.ASC"; };
instance ItAr_StExt_Gloves_Med_49(ItAr_StExt_Gloves_Med_Proto) { visual_change = "ItAr_Gloves_35.ASC"; };

instance ItAr_StExt_Gloves_Top_00(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_BracletsSteel_01.ASC"; };
instance ItAr_StExt_Gloves_Top_01(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_BracletsSteel_02.ASC"; };
instance ItAr_StExt_Gloves_Top_02(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_BracletsSteel_03.ASC"; };
instance ItAr_StExt_Gloves_Top_03(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_01.ASC"; };
instance ItAr_StExt_Gloves_Top_04(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_02.ASC"; };
instance ItAr_StExt_Gloves_Top_05(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_03.ASC"; };
instance ItAr_StExt_Gloves_Top_06(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_05.ASC"; };
instance ItAr_StExt_Gloves_Top_07(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_06.ASC"; };
instance ItAr_StExt_Gloves_Top_08(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_07.ASC"; };
instance ItAr_StExt_Gloves_Top_09(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_08.ASC"; };
instance ItAr_StExt_Gloves_Top_10(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_09.ASC"; };
instance ItAr_StExt_Gloves_Top_11(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_10.ASC"; };
instance ItAr_StExt_Gloves_Top_12(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_11.ASC"; };
instance ItAr_StExt_Gloves_Top_13(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_12.ASC"; };
instance ItAr_StExt_Gloves_Top_14(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_13.ASC"; };
instance ItAr_StExt_Gloves_Top_15(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_14.ASC"; };
instance ItAr_StExt_Gloves_Top_16(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_15.ASC"; };
instance ItAr_StExt_Gloves_Top_17(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_16.ASC"; };
instance ItAr_StExt_Gloves_Top_18(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_17.ASC"; };
instance ItAr_StExt_Gloves_Top_19(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_18.ASC"; };
instance ItAr_StExt_Gloves_Top_20(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_19.ASC"; };
instance ItAr_StExt_Gloves_Top_21(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_20.ASC"; };
instance ItAr_StExt_Gloves_Top_22(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_21.ASC"; };
instance ItAr_StExt_Gloves_Top_23(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_22.ASC"; };
instance ItAr_StExt_Gloves_Top_24(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_23.ASC"; };
instance ItAr_StExt_Gloves_Top_25(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_25.ASC"; };
instance ItAr_StExt_Gloves_Top_26(ItAr_StExt_Gloves_Top_Proto) { visual_change = "ItAr_Gloves_Steel_26.ASC"; };

instance ItAr_StExt_Pants_Low_00(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_01.ASC"; };
instance ItAr_StExt_Pants_Low_01(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_02.ASC"; };
instance ItAr_StExt_Pants_Low_02(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_03.ASC"; };
instance ItAr_StExt_Pants_Low_03(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_04.ASC"; };
instance ItAr_StExt_Pants_Low_04(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_05.ASC"; };
instance ItAr_StExt_Pants_Low_05(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_06.ASC"; };
instance ItAr_StExt_Pants_Low_06(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_07.ASC"; };
instance ItAr_StExt_Pants_Low_07(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_08.ASC"; };
instance ItAr_StExt_Pants_Low_08(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_09.ASC"; };
instance ItAr_StExt_Pants_Low_09(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_10.ASC"; };
instance ItAr_StExt_Pants_Low_10(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_11.ASC"; };
instance ItAr_StExt_Pants_Low_11(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_12.ASC"; };
instance ItAr_StExt_Pants_Low_12(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_13.ASC"; };
instance ItAr_StExt_Pants_Low_13(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_14.ASC"; };
instance ItAr_StExt_Pants_Low_14(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_15.ASC"; };
instance ItAr_StExt_Pants_Low_15(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_16.ASC"; };
instance ItAr_StExt_Pants_Low_16(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_17.ASC"; };
instance ItAr_StExt_Pants_Low_17(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_18.ASC"; };
instance ItAr_StExt_Pants_Low_18(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_19.ASC"; };
instance ItAr_StExt_Pants_Low_19(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_20.ASC"; };
instance ItAr_StExt_Pants_Low_20(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_21.ASC"; };
instance ItAr_StExt_Pants_Low_21(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_22.ASC"; };
instance ItAr_StExt_Pants_Low_22(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_23.ASC"; };
instance ItAr_StExt_Pants_Low_23(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_24.ASC"; };
instance ItAr_StExt_Pants_Low_24(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Pants_Low_25.ASC"; };
instance ItAr_StExt_Pants_Low_25(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_01.ASC"; };
instance ItAr_StExt_Pants_Low_26(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_02.ASC"; };
instance ItAr_StExt_Pants_Low_27(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_03.ASC"; };
instance ItAr_StExt_Pants_Low_28(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_04.ASC"; };
instance ItAr_StExt_Pants_Low_29(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_05.ASC"; };
instance ItAr_StExt_Pants_Low_30(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_06.ASC"; };
instance ItAr_StExt_Pants_Low_31(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_07.ASC"; };
instance ItAr_StExt_Pants_Low_32(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_08.ASC"; };
instance ItAr_StExt_Pants_Low_33(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_09.ASC"; };
instance ItAr_StExt_Pants_Low_34(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_10.ASC"; };
instance ItAr_StExt_Pants_Low_35(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_11.ASC"; };
instance ItAr_StExt_Pants_Low_36(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_12.ASC"; };
instance ItAr_StExt_Pants_Low_37(ItAr_StExt_Pants_Low_Proto) { visual_change = "ItAr_Skirt_Low_13.ASC"; };

instance ItAr_StExt_Pants_Med_00(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_01.ASC"; };
instance ItAr_StExt_Pants_Med_01(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_02.ASC"; };
instance ItAr_StExt_Pants_Med_02(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_03.ASC"; };
instance ItAr_StExt_Pants_Med_03(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_04.ASC"; };
instance ItAr_StExt_Pants_Med_04(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_05.ASC"; };
instance ItAr_StExt_Pants_Med_05(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_06.ASC"; };
instance ItAr_StExt_Pants_Med_06(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_07.ASC"; };
instance ItAr_StExt_Pants_Med_07(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_08.ASC"; };
instance ItAr_StExt_Pants_Med_08(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_09.ASC"; };
instance ItAr_StExt_Pants_Med_09(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_10.ASC"; };
instance ItAr_StExt_Pants_Med_10(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_11.ASC"; };
instance ItAr_StExt_Pants_Med_11(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_12.ASC"; };
instance ItAr_StExt_Pants_Med_12(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_13.ASC"; };
instance ItAr_StExt_Pants_Med_13(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_14.ASC"; };
instance ItAr_StExt_Pants_Med_14(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_15.ASC"; };
instance ItAr_StExt_Pants_Med_15(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_16.ASC"; };
instance ItAr_StExt_Pants_Med_16(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_17.ASC"; };
instance ItAr_StExt_Pants_Med_17(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_18.ASC"; };
instance ItAr_StExt_Pants_Med_18(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_19.ASC"; };
instance ItAr_StExt_Pants_Med_19(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_20.ASC"; };
instance ItAr_StExt_Pants_Med_20(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_21.ASC"; };
instance ItAr_StExt_Pants_Med_21(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_22.ASC"; };
instance ItAr_StExt_Pants_Med_22(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_23.ASC"; };
instance ItAr_StExt_Pants_Med_23(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_24.ASC"; };
instance ItAr_StExt_Pants_Med_24(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_25.ASC"; };
instance ItAr_StExt_Pants_Med_25(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_26.ASC"; };
instance ItAr_StExt_Pants_Med_26(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_27.ASC"; };
instance ItAr_StExt_Pants_Med_27(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_28.ASC"; };
instance ItAr_StExt_Pants_Med_28(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_29.ASC"; };
instance ItAr_StExt_Pants_Med_29(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_30.ASC"; };
instance ItAr_StExt_Pants_Med_30(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_31.ASC"; };
instance ItAr_StExt_Pants_Med_31(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Pants_Med_32.ASC"; };
instance ItAr_StExt_Pants_Med_32(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_01.ASC"; };
instance ItAr_StExt_Pants_Med_33(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_02.ASC"; };
instance ItAr_StExt_Pants_Med_34(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_03.ASC"; };
instance ItAr_StExt_Pants_Med_35(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_04.ASC"; };
instance ItAr_StExt_Pants_Med_36(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_05.ASC"; };
instance ItAr_StExt_Pants_Med_37(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_06.ASC"; };
instance ItAr_StExt_Pants_Med_38(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_07.ASC"; };
instance ItAr_StExt_Pants_Med_39(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_08.ASC"; };
instance ItAr_StExt_Pants_Med_40(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_09.ASC"; };
instance ItAr_StExt_Pants_Med_41(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_10.ASC"; };
instance ItAr_StExt_Pants_Med_42(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_11.ASC"; };
instance ItAr_StExt_Pants_Med_43(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_12.ASC"; };
instance ItAr_StExt_Pants_Med_44(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_13.ASC"; };
instance ItAr_StExt_Pants_Med_45(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_14.ASC"; };
instance ItAr_StExt_Pants_Med_46(ItAr_StExt_Pants_Med_Proto) { visual_change = "ItAr_Skirt_Med_15.ASC"; };

instance ItAr_StExt_Pants_Top_00(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_01.ASC"; };
instance ItAr_StExt_Pants_Top_01(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_02.ASC"; };
instance ItAr_StExt_Pants_Top_02(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_03.ASC"; };
instance ItAr_StExt_Pants_Top_03(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_04.ASC"; };
instance ItAr_StExt_Pants_Top_04(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_05.ASC"; };
instance ItAr_StExt_Pants_Top_05(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_06.ASC"; };
instance ItAr_StExt_Pants_Top_06(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_07.ASC"; };
instance ItAr_StExt_Pants_Top_07(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_08.ASC"; };
instance ItAr_StExt_Pants_Top_08(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_09.ASC"; };
instance ItAr_StExt_Pants_Top_09(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Pants_Top_10.ASC"; };
instance ItAr_StExt_Pants_Top_10(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_01.ASC"; };
instance ItAr_StExt_Pants_Top_11(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_02.ASC"; };
instance ItAr_StExt_Pants_Top_12(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_03.ASC"; };
instance ItAr_StExt_Pants_Top_13(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_04.ASC"; };
instance ItAr_StExt_Pants_Top_14(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_05.ASC"; };
instance ItAr_StExt_Pants_Top_15(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_06.ASC"; };
instance ItAr_StExt_Pants_Top_16(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_07.ASC"; };
instance ItAr_StExt_Pants_Top_17(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_08.ASC"; };
instance ItAr_StExt_Pants_Top_18(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_09.ASC"; };
instance ItAr_StExt_Pants_Top_19(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_10.ASC"; };
instance ItAr_StExt_Pants_Top_20(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_11.ASC"; };
instance ItAr_StExt_Pants_Top_21(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_12.ASC"; };
instance ItAr_StExt_Pants_Top_22(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_13.ASC"; };
instance ItAr_StExt_Pants_Top_23(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_14.ASC"; };
instance ItAr_StExt_Pants_Top_24(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_15.ASC"; };
instance ItAr_StExt_Pants_Top_25(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_16.ASC"; };
instance ItAr_StExt_Pants_Top_26(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_17.ASC"; };
instance ItAr_StExt_Pants_Top_27(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_18.ASC"; };
instance ItAr_StExt_Pants_Top_28(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_19.ASC"; };
instance ItAr_StExt_Pants_Top_29(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_20.ASC"; };
instance ItAr_StExt_Pants_Top_30(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_21.ASC"; };
instance ItAr_StExt_Pants_Top_31(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_22.ASC"; };
instance ItAr_StExt_Pants_Top_32(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_23.ASC"; };
instance ItAr_StExt_Pants_Top_33(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_24.ASC"; };
instance ItAr_StExt_Pants_Top_34(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_25.ASC"; };
instance ItAr_StExt_Pants_Top_35(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_26.ASC"; };
instance ItAr_StExt_Pants_Top_36(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_27.ASC"; };
instance ItAr_StExt_Pants_Top_37(ItAr_StExt_Pants_Top_Proto) { visual_change = "ItAr_Skirt_Top_28.ASC"; };

instance ItAr_StExt_Torso_Low_00(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_01.ASC"; };
instance ItAr_StExt_Torso_Low_01(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_02.ASC"; };
instance ItAr_StExt_Torso_Low_02(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_03.ASC"; };
instance ItAr_StExt_Torso_Low_03(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_04.ASC"; };
instance ItAr_StExt_Torso_Low_04(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_05.ASC"; };
instance ItAr_StExt_Torso_Low_05(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_06.ASC"; };
instance ItAr_StExt_Torso_Low_06(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_07.ASC"; };
instance ItAr_StExt_Torso_Low_07(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_08.ASC"; };
instance ItAr_StExt_Torso_Low_08(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_09.ASC"; };
instance ItAr_StExt_Torso_Low_09(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_10.ASC"; };
instance ItAr_StExt_Torso_Low_10(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_11.ASC"; };
instance ItAr_StExt_Torso_Low_11(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_12.ASC"; };
instance ItAr_StExt_Torso_Low_12(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_13.ASC"; };
instance ItAr_StExt_Torso_Low_13(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_14.ASC"; };
instance ItAr_StExt_Torso_Low_14(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_15.ASC"; };
instance ItAr_StExt_Torso_Low_15(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_16.ASC"; };
instance ItAr_StExt_Torso_Low_16(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_17.ASC"; };
instance ItAr_StExt_Torso_Low_17(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_18.ASC"; };
instance ItAr_StExt_Torso_Low_18(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_19.ASC"; };
instance ItAr_StExt_Torso_Low_19(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_20.ASC"; };
instance ItAr_StExt_Torso_Low_20(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_21.ASC"; };
instance ItAr_StExt_Torso_Low_21(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_22.ASC"; };
instance ItAr_StExt_Torso_Low_22(ItAr_StExt_Torso_Low_Proto) { visual_change = "ItAr_Pauldrons_Low_23.ASC"; };

instance ItAr_StExt_Torso_Med_00(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_01.ASC"; };
instance ItAr_StExt_Torso_Med_01(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_02.ASC"; };
instance ItAr_StExt_Torso_Med_02(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_03.ASC"; };
instance ItAr_StExt_Torso_Med_03(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_04.ASC"; };
instance ItAr_StExt_Torso_Med_04(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_05.ASC"; };
instance ItAr_StExt_Torso_Med_05(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_06.ASC"; };
instance ItAr_StExt_Torso_Med_06(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_07.ASC"; };
instance ItAr_StExt_Torso_Med_07(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_08.ASC"; };
instance ItAr_StExt_Torso_Med_08(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_09.ASC"; };
instance ItAr_StExt_Torso_Med_09(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_10.ASC"; };
instance ItAr_StExt_Torso_Med_10(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_11.ASC"; };
instance ItAr_StExt_Torso_Med_11(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_12.ASC"; };
instance ItAr_StExt_Torso_Med_12(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_13.ASC"; };
instance ItAr_StExt_Torso_Med_13(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_14.ASC"; };
instance ItAr_StExt_Torso_Med_14(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_15.ASC"; };
instance ItAr_StExt_Torso_Med_15(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_16.ASC"; };
instance ItAr_StExt_Torso_Med_16(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_17.ASC"; };
instance ItAr_StExt_Torso_Med_17(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_18.ASC"; };
instance ItAr_StExt_Torso_Med_18(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_19.ASC"; };
instance ItAr_StExt_Torso_Med_19(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_20.ASC"; };
instance ItAr_StExt_Torso_Med_20(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_21.ASC"; };
instance ItAr_StExt_Torso_Med_21(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_22.ASC"; };
instance ItAr_StExt_Torso_Med_22(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_23.ASC"; };
instance ItAr_StExt_Torso_Med_23(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_24.ASC"; };
instance ItAr_StExt_Torso_Med_24(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_25.ASC"; };
instance ItAr_StExt_Torso_Med_25(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_26.ASC"; };
instance ItAr_StExt_Torso_Med_26(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_27.ASC"; };
instance ItAr_StExt_Torso_Med_27(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_28.ASC"; };
instance ItAr_StExt_Torso_Med_28(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_29.ASC"; };
instance ItAr_StExt_Torso_Med_29(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_30.ASC"; };
instance ItAr_StExt_Torso_Med_30(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_31.ASC"; };
instance ItAr_StExt_Torso_Med_31(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_32.ASC"; };
instance ItAr_StExt_Torso_Med_32(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_33.ASC"; };
instance ItAr_StExt_Torso_Med_33(ItAr_StExt_Torso_Med_Proto) { visual_change = "ItAr_Pauldrons_Med_34.ASC"; };

instance ItAr_StExt_Torso_Top_00(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_01.ASC"; };
instance ItAr_StExt_Torso_Top_01(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_02.ASC"; };
instance ItAr_StExt_Torso_Top_02(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_03.ASC"; };
instance ItAr_StExt_Torso_Top_03(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_04.ASC"; };
instance ItAr_StExt_Torso_Top_04(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_05.ASC"; };
instance ItAr_StExt_Torso_Top_05(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_06.ASC"; };
instance ItAr_StExt_Torso_Top_06(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_07.ASC"; };
instance ItAr_StExt_Torso_Top_07(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_08.ASC"; };
instance ItAr_StExt_Torso_Top_08(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_09.ASC"; };
instance ItAr_StExt_Torso_Top_09(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_10.ASC"; };
instance ItAr_StExt_Torso_Top_10(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_11.ASC"; };
instance ItAr_StExt_Torso_Top_11(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_12.ASC"; };
instance ItAr_StExt_Torso_Top_12(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_13.ASC"; };
instance ItAr_StExt_Torso_Top_13(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_14.ASC"; };
instance ItAr_StExt_Torso_Top_14(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_15.ASC"; };
instance ItAr_StExt_Torso_Top_15(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_16.ASC"; };
instance ItAr_StExt_Torso_Top_16(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_17.ASC"; };
instance ItAr_StExt_Torso_Top_17(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_18.ASC"; };
instance ItAr_StExt_Torso_Top_18(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_19.ASC"; };
instance ItAr_StExt_Torso_Top_19(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_20.ASC"; };
instance ItAr_StExt_Torso_Top_20(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_21.ASC"; };
instance ItAr_StExt_Torso_Top_21(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_22.ASC"; };
instance ItAr_StExt_Torso_Top_22(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_23.ASC"; };
instance ItAr_StExt_Torso_Top_23(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_24.ASC"; };
instance ItAr_StExt_Torso_Top_24(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_25.ASC"; };
instance ItAr_StExt_Torso_Top_25(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_26.ASC"; };
instance ItAr_StExt_Torso_Top_26(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_27.ASC"; };
instance ItAr_StExt_Torso_Top_27(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_28.ASC"; };
instance ItAr_StExt_Torso_Top_28(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_29.ASC"; };
instance ItAr_StExt_Torso_Top_29(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_30.ASC"; };
instance ItAr_StExt_Torso_Top_30(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_31.ASC"; };
instance ItAr_StExt_Torso_Top_31(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_32.ASC"; };
instance ItAr_StExt_Torso_Top_32(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_33.ASC"; };
instance ItAr_StExt_Torso_Top_33(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_34.ASC"; };
instance ItAr_StExt_Torso_Top_34(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_35.ASC"; };
instance ItAr_StExt_Torso_Top_35(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_36.ASC"; };
instance ItAr_StExt_Torso_Top_36(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_37.ASC"; };
instance ItAr_StExt_Torso_Top_37(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_38.ASC"; };
instance ItAr_StExt_Torso_Top_38(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_39.ASC"; };
instance ItAr_StExt_Torso_Top_39(ItAr_StExt_Torso_Top_Proto) { visual_change = "ItAr_Pauldrons_Top_40.ASC"; };


// **************************************************************************************
//									NPC FEM ARMORS
// **************************************************************************************

instance itar_stext_assasins_02(c_item) 
{
    name = "Armor";
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_otherarmor;
    protection[prot_blunt] = 80;
    protection[prot_edge] = 80;
    protection[prot_fire] = 30;
    protection[prot_magic] = 30;
    protection[prot_point] = 60;
    protection[prot_fly] = 50;
    visual = "DB_Prior_Armor.3ds";
    visual_change = "ARMOR_PRIOR.asc";
    visual_skin = 0;
    wear = wear_torso;
    weight = 3;
};

instance itar_stext_assasins_01(c_item) 
{
    name = "Armor";
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_otherarmor;
    protection[prot_blunt] = 90;
    protection[prot_edge] = 90;
    protection[prot_fire] = 5;
    protection[prot_magic] = 10;
    protection[prot_point] = 50;
    protection[prot_fly] = 5;
    value = 5;
    visual = "DB_Adept_Ar.3ds";
    visual_change = "DB_Pri_Armor_M.asc";
    visual_skin = 0;
    wear = wear_torso;
    weight = 3;
};

prototype Itar_Stext_NpcFem_Armor_Proto(c_item) 
{
	name = "Armor";
    description = name;
    flags = item_mission;
    mainflag = item_kat_armor;
    material = mat_leather;
	on_equip = equip_otherarmor;    
    visual_skin = 0;
	visual = "ItAr_VLKBabe.3DS";
    wear = wear_torso;
	value = 1;
	inv_animate = 0;
	protection[1] = 15 + hlp_random(25);
    protection[2] = 15 + hlp_random(25);
    protection[3] = 15 + hlp_random(25);
	protection[4] = 15 + hlp_random(25);
    protection[5] = 15 + hlp_random(25);
    protection[6] = 15 + hlp_random(25);
};

instance ItAr_StExt_FEM_HERO(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_HERO.ASC"; };
instance ItAr_StExt_FEM_PRIS(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_PRIS.ASC"; };
instance ItAr_StExt_FEM_Digger_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_Digger_M.ASC"; };
instance ItAr_StExt_FEM_STTL(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_STTL.ASC"; };
instance ItAr_StExt_FEM_STT_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_STT_L.ASC"; };
instance ItAr_StExt_FEM_STTM(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_STTM.ASC"; };
instance ItAr_StExt_FEM_Digger_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_Digger_L.ASC"; };
instance ItAr_StExt_FEM_Digger_L2(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_Digger_L2.ASC"; };
instance ItAr_StExt_FEM_LEATHER_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_LEATHER_L.ASC"; };
instance ItAr_StExt_FEM_LEATHER(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_LEATHER.ASC"; };
instance ItAr_StExt_FEM_BDT_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_BDT_L.ASC"; };
instance ItAr_StExt_FEM_BDT_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_BDT_H.ASC"; };
instance ItAr_StExt_FEM_RANGER_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_RANGER_L.ASC"; };
instance ItAr_StExt_FEM_RANGER_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_RANGER_H.ASC"; };
instance ItAr_StExt_FEM_GRD_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_GRD_L.ASC"; };
instance ItAr_StExt_FEM_GRD_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_GRD_M.ASC"; };
instance ItAr_StExt_FEM_PIR(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_PIR.ASC"; };
instance ItAr_StExt_FEM_PIR_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_PIR_L.ASC"; };
instance ItAr_StExt_FEM_PIR_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_PIR_M.ASC"; };
instance ItAr_StExt_FEM_HUN_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_HUN_L.ASC"; };
instance ItAr_StExt_FEM_DJG_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_DJG_L.ASC"; };
instance ItAr_StExt_Armor_DJG_W_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "Armor_DJG_W_L.ASC"; };
instance ItAr_StExt_FEM_GRD_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_GRD_H.ASC"; };
instance ItAr_StExt_Armor_DJG_W_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "Armor_DJG_W_H.ASC"; };
instance ItAr_StExt_FEM_BARON(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_BARON.ASC"; };
instance ItAr_StExt_FEM_SLD_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SLD_L.ASC"; };
instance ItAr_StExt_FEM_SLD_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SLD_M.ASC"; };
instance ItAr_StExt_FEM_SLD_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SLD_H.ASC"; };
instance ItAr_StExt_FEM_KDW_N(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDW_N.ASC"; };
instance ItAr_StExt_FEM_KDF_N(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDF_N.ASC"; };
instance ItAr_StExt_FEM_KDM_N(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDM_N.ASC"; };
instance ItAr_StExt_FEM_KDF_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDF_L.ASC"; };
instance ItAr_StExt_FEM_KDW_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDW_L.ASC"; };
instance ItAr_StExt_FEM_KDM_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDM_L.ASC"; };
instance ItAr_StExt_FEM_KDF_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDF_H.ASC"; };
instance ItAr_StExt_FEM_KDF_SH(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDF_SH.ASC"; };
instance ItAr_StExt_FEM_KDW_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDW_H.ASC"; };
instance ItAr_StExt_FEM_KDW_SH(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDW_SH.ASC"; };
instance ItAr_StExt_FEM_KDM_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDM_H.ASC"; };
instance ItAr_StExt_FEM_KDM_SH(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_KDM_SH.ASC"; };
instance ItAr_StExt_FEM_SEK_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SEK_L.ASC"; };
instance ItAr_StExt_FEM_SEK_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SEK_M.ASC"; };
instance ItAr_StExt_FEM_SECT_NOV_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SECT_NOV_L.ASC"; };
instance ItAr_StExt_FEM_GUR_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_GUR_L.ASC"; };
instance ItAr_StExt_FEM_GUR_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_GUR_M.ASC"; };
instance ItAr_StExt_FEM_GUR_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_GUR_H.ASC"; };
instance ItAr_StExt_FEM_SECT_GUR_S(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SECT_GUR_S.ASC"; };
instance ItAr_StExt_FEM_SECT_GUR_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_SECT_GUR_M.ASC"; };
instance ItAr_StExt_FEM_MAYAPRIEST(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_MAYAPRIEST.ASC"; };
instance ItAr_StExt_FEM_TPL_L(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_TPL_L.ASC"; };
instance ItAr_StExt_FEM_TPL_M(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_TPL_M.ASC"; };
instance ItAr_StExt_FEM_TPL_S(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_TPL_S.ASC"; };
instance ItAr_StExt_FEM_TPL_H(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "FEM_TPL_H.ASC"; };
instance ItAr_StExt_DJG_CRW_VEL(Itar_Stext_NpcFem_Armor_Proto) { visual_change = "DJG_CRW_VEL.ASC"; };

// Zakon Dusz chapter rewards (F4): one armor per chapter 1-6, granted
// by the Soul Master after the hunt + 10/10 arena kills. Visuals are
// precompiled third-party MDM+TEX shipped in _work/_compiled.
// ch1 novdark(cultist robe) ch2 royal ch3 templar(skellord)
// ch4 guardian(chaos) ch5 rustlord ch6 crusader
instance itar_stext_zakon_royal(c_item)
{
    name = StExt_Str_ZakonRoyal_Name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 120;
    protection[2] = 120;
    protection[3] = 90;
    protection[5] = 90;
    protection[6] = 60;
    value = 5000;
    visual = "ItAr_NDM_L.3ds";
    visual_change = "ROYAL_OFFICER.ASC";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text[3] = StExt_Str_Zakon_Royal_Lore;
};

instance itar_stext_zakon_templar(c_item)
{
    name = StExt_Str_Zakon_Templar_Name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 150;
    protection[2] = 150;
    protection[3] = 115;
    protection[5] = 115;
    protection[6] = 80;
    value = 5000;
    visual = "ItAr_NDM_L.3ds";
    visual_change = "ZAKON_SKELLORD.ASC";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text[3] = StExt_Str_Zakon_Templar_Lore;
};

// ch5: rusty full-helm lord (ArmorExpansion, precompiled)
instance itar_stext_zakon_rustlord(c_item)
{
    name = StExt_Str_Zakon_Rustlord_Name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 215;
    protection[2] = 215;
    protection[3] = 165;
    protection[5] = 165;
    protection[6] = 125;
    value = 5000;
    visual = "ItAr_NDM_L.3ds";
    visual_change = "ZAKON_RUSTLORD.ASC";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text[3] = StExt_Str_Zakon_Rustlord_Lore;
};

// ch6: greathelm crusader (ArmorExpansion, precompiled)
instance itar_stext_zakon_crusader(c_item)
{
    name = StExt_Str_Zakon_Crusader_Name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 250;
    protection[2] = 250;
    protection[3] = 190;
    protection[5] = 190;
    protection[6] = 150;
    value = 5000;
    visual = "ItAr_NDM_L.3ds";
    visual_change = "ZAKON_CRUSADER.ASC";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text[3] = StExt_Str_Zakon_Crusader_Lore;
};

instance itar_stext_zakon_novdark(c_item)
{
    name = StExt_Str_Zakon_NovDark_Name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 70;
    protection[2] = 70;
    protection[3] = 65;
    protection[5] = 65;
    protection[6] = 90;
    value = 5000;
    visual = "ItAr_NDM_L.3ds";
    visual_change = "ZAKON_CULTIST.ASC";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text[3] = StExt_Str_Zakon_NovDark_Lore;
};

instance itar_stext_zakon_guardian(c_item)
{
    name = StExt_Str_Zakon_Guardian_Name;
    description = name;
    flags = item_mission;
    inv_animate = 0;
    mainflag = item_kat_armor;
    material = mat_metal;
    on_equip = equip_itar_nov_l;
    on_unequip = unequip_itar_nov_l;
    protection[1] = 180;
    protection[2] = 180;
    protection[3] = 140;
    protection[5] = 140;
    protection[6] = 100;
    value = 5000;
    visual = "ItAr_NDM_L.3ds";
    visual_change = "ZAKON_CHAOS.ASC";
    visual_skin = 0;
    wear = wear_torso;
    weight = 0;
    text[3] = StExt_Str_Zakon_Guardian_Lore;
};
