instance itam_stext_luckycharm(c_item) 
{
    name = stext_itam_luckycharm_name;
    mainflag = item_kat_magic;
    flags = item_amulet | item_mission;
    value = 1500;
    visual = "ItAm_Hp_01.3ds";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itam_stext_luckycharm;
    on_unequip = unequip_itam_stext_luckycharm;
    wear = wear_effect;
    description = name;
    text[2] = name_bonus_manamax;
    count[2] = 10;
    text[3] = stext_itam_luckycharm_txt;
	count[3] = 50;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_amulette_standard;
    inv_animate = 1;
};
func void equip_itam_stext_luckycharm() 
{
    rx_changeattr(self, atr_mana_max, 10);
	StExt_PcStats_Items[StExt_PcStats_Index_Luck] += 50;
};
func void unequip_itam_stext_luckycharm() 
{
    rx_changeattr(self, atr_mana_max, -10);
    StExt_PcStats_Items[StExt_PcStats_Index_Luck] -= 50;
};

instance itam_stext_goldnecklace(c_item) 
{
    name = itam_stext_goldnecklace_name;
    mainflag = item_kat_magic;
    flags = item_amulet | item_mission;
    value = 1000;
    visual = "ItMi_GoldNecklace.3ds";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itam_stext_goldnecklace;
    on_unequip = unequip_itam_stext_goldnecklace;
    wear = wear_effect;
    description = name;
    text[2] = StExt_PcStats_Desc[StExt_PcStats_Index_LuckGold];
    count[2] = 250;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_amulette_standard;
    inv_animate = 1;
};
func void equip_itam_stext_goldnecklace() { StExt_PcStats_Items[StExt_PcStats_Index_LuckGold] += 250; };
func void unequip_itam_stext_goldnecklace() { StExt_PcStats_Items[StExt_PcStats_Index_LuckGold] -= 250; };

instance itam_stext_silvernecklace(c_item) 
{
    name = itam_stext_silvernecklace_name;
    mainflag = item_kat_magic;
    flags = item_amulet | item_mission;
    value = 500;
    visual = "ItMi_SilverNecklace.3ds";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itam_stext_silvernecklace;
    on_unequip = unequip_itam_stext_silvernecklace;
    wear = wear_effect;
    description = name;
    text[2] = StExt_PcStats_Desc[StExt_PcStats_Index_Luck];
    count[2] = 50;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_amulette_standard;
    inv_animate = 1;
};
func void equip_itam_stext_silvernecklace() { StExt_PcStats_Items[StExt_PcStats_Index_Luck] += 50; };
func void unequip_itam_stext_silvernecklace() { StExt_PcStats_Items[StExt_PcStats_Index_Luck] -= 50; };

instance itam_stext_darknecklace_01(c_item) 
{
    name = itam_stext_darknecklace_name;
    mainflag = item_kat_magic;
    flags = item_amulet | item_mission;
    value = 1000;
    visual = "ITAM_MASIAF_01.3ds";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itam_stext_darknecklace;
    on_unequip = unequip_itam_stext_darknecklace;
    wear = wear_effect;
    description = name;
    text[2] = StExt_PcStats_Desc[StExt_PcStats_Index_AuraPower];
    count[2] = 100;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_amulette_standard;
    inv_animate = 1;
};
func void equip_itam_stext_darknecklace() { StExt_PcStats_Items[StExt_PcStats_Index_AuraPower] += 100; };
func void unequip_itam_stext_darknecklace() { StExt_PcStats_Items[StExt_PcStats_Index_AuraPower] -= 100; };

instance itam_stext_darknecklace_02(c_item) 
{
    name = itam_stext_darknecklace_name;
    mainflag = item_kat_magic;
    flags = item_amulet | item_mission;
    value = 1000;
    visual = "ITMI_TRIRAMAR_SKY.3ds";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itam_stext_darknecklace2;
    on_unequip = unequip_itam_stext_darknecklace2;
    wear = wear_effect;
    description = name;
    text[2] = StExt_PcStats_Desc[StExt_PcStats_Index_DodgeChance];
    count[2] = 50;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_amulette_standard;
    inv_animate = 1;
};
func void equip_itam_stext_darknecklace2() { StExt_PcStats_Items[StExt_PcStats_Index_DodgeChance] += 50; };
func void unequip_itam_stext_darknecklace2() { StExt_PcStats_Items[StExt_PcStats_Index_DodgeChance] -= 50; };


instance itri_stext_silverring(c_item) 
{
    name = itri_stext_silverring_name;
    mainflag = item_kat_magic;
    flags = item_ring | item_mission;
    value = 250;
    visual = "ItMi_Ring_Silver_New_01.3DS";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itri_stext_silverring;
    on_unequip = unequip_itri_stext_silverring;
    wear = wear_effect;
    description = name;
    text[2] = StExt_PcStats_Desc[StExt_PcStats_Index_Luck];
    count[2] = 25;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_ring_standard;
    inv_rotz = invcam_z_ring_standard;
    inv_rotx = invcam_x_ring_standard;
    inv_animate = 1;
};
func void equip_itri_stext_silverring() { StExt_PcStats_Items[StExt_PcStats_Index_Luck] += 25; };
func void unequip_itri_stext_silverring() { StExt_PcStats_Items[StExt_PcStats_Index_Luck] -= 25; };

instance itri_stext_goldring(c_item) 
{
    name = itri_stext_goldring_name;
    mainflag = item_kat_magic;
    flags = item_ring | item_mission;
    value = 500;
    visual = "ItMi_Ring_Gold_New_01.3DS";
    visual_skin = 0;
    material = mat_metal;
    on_equip = equip_itri_stext_goldring;
    on_unequip = unequip_itri_stext_goldring;
    wear = wear_effect;
    description = name;
    text[2] = StExt_PcStats_Desc[StExt_PcStats_Index_LuckGold];
    count[2] = 100;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_ring_standard;
    inv_rotz = invcam_z_ring_standard;
    inv_rotx = invcam_x_ring_standard;
    inv_animate = 1;
};
func void equip_itri_stext_goldring() { StExt_PcStats_Items[StExt_PcStats_Index_LuckGold] += 100; };
func void unequip_itri_stext_goldring() { StExt_PcStats_Items[StExt_PcStats_Index_LuckGold] -= 100; };