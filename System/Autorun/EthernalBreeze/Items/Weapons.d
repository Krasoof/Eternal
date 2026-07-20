instance itmw_stext_andriel_dagger(c_item) 
{
    name = stext_str_andriel_dagger_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 150;
    damagetotal = 300;
	damage[6] = 200;
	damage[7] = 100;
    damagetype = dam_point | dam_fall;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 90;
    value = 2500;
    visual = "ItMW_1H_DexSword_17.3DS";
    visual_change = name_onehanded_slash_legend;
    setitemvartrue(itmw_stext_andriel_dagger, bit_item_dex_sword);
};

// Start equipment
instance itmw_stext_starting_magicstaff(c_item)
{
	name = Itmw_StExt_Str_StartingStaff_Name;	
    cond_atr[2] = atr_mana_max;
    cond_value[2] = 15;    
    damagetype = dam_blunt | dam_magic;
    damage[dam_index_blunt] = 10;
	damage[dam_index_magic] = 5;
	damagetotal = 15;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;	
    mainflag = item_kat_nf;
    material = mat_wood;	
    on_equip = equip_stoned_magicstaff_first;
    on_unequip = unequip_stoned_magicstaff_first;
	description = name;
    range = 140;
    value = 10;
	visual = "Kampfstab.3DS";
    text[5] = name_value;
    count[5] = value;
};
func void equip_stoned_magicstaff_first() 
{
    if(npc_isplayer(self)) {
        snd_play3d(hero, "EQUIP_WEAPON_02");
        rx_changerunedamagebonus(5);
        meleeweaponindex = 1;
        aiv_staff = true;
        equipedindex_2h = true;
        rx_applyanim_weapons(self, StExt_Null);	
    };
};
func void unequip_stoned_magicstaff_first() 
{
    if(npc_isplayer(self)) {
        rx_changerunedamagebonus(-5);  
		rx_unequipweapon(self);
    };
};

instance itrw_stext_starting_crossbow(c_item) 
{
    name = itrw_stext_str_starting_crossbow;
    cond_atr[2] = atr_strength;
    cond_value[2] = 1;
    damage[6] = 10;
    damagetype = dam_point;
    description = name;
    flags = item_crossbow | item_mission;
    mainflag = item_kat_ff;
    material = mat_wood;
    munition = itrw_bolt;
    on_equip = equip_crossbow_light;
    on_unequip = unequip_crossbow_light;
    value = 1;
    visual = "ITRW_MIL_CROSSBOW.mms";
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itrw_crossbow_broken, bit_item_remove_trade);
};

instance itrw_stext_starting_bow(c_item) 
{
    name = itrw_stext_str_starting_bow;
    cond_atr[1] = atr_dexterity;
    cond_value[1] = 1;
    damage[6] = 10;
    damagetotal = 10;
    damagetype = dam_point;
    description = name;
    flags = item_bow | item_mission;
    inv_animate = 1;
    mainflag = item_kat_ff;
    material = mat_wood;
    munition = itrw_arrow;
    on_equip = equip_bow_light;
    on_unequip = unequip_bow_light;
    value = 1;
    visual = "ItRw_Bow_L_01.mms";
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_starting_1h_sword(c_item) 
{
    name = itmw_stext_str_starting_1h_sword;
    cond_atr[2] = atr_strength;
    cond_value[2] = 1;
    damagetotal = 10;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = range_miscsword;
    value = 1;
    visual = "ItMw_020_1h_sword_old_01.3DS";
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_starting_2h_sword(c_item) 
{
    name = itmw_stext_str_starting_2h_sword;
    cond_atr[2] = atr_strength;
    cond_value[2] = 1;
    damagetotal = 15;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = range_misc2hsword;
    value = 1;
    visual = "ItMw_025_2h_Sword_old_01.3DS";
    text[5] = name_value;
    count[5] = value;
};


instance itmw_stext_steel_warhammer2h(c_item) 
{
    name = itmw_stext_steel_warhammer_name;
    mainflag = item_kat_nf;
    flags = item_mission | item_2hd_axe;
    material = mat_wood;
    value = 200;
    damagetotal = 150;
    damagetype = dam_blunt;
    range = 110;
    cond_atr[2] = atr_strength;
    cond_value[2] = 130;
    on_equip = equip_2h_heavy_axe;
    on_unequip = unequip_2h_heavy_axe;
    visual = "steel_warhammer.3DS";
    description = name;
	text[5] = name_value;
	count[5] = value;
    inv_animate = 1;
};

instance itmw_stext_iron_warhammer2h(c_item) 
{
    name = itmw_stext_iron_warhammer_name;
    mainflag = item_kat_nf;
    flags = item_mission | item_2hd_axe;
    material = mat_wood;
    value = 200;
    damagetotal = 100;
    damagetype = dam_blunt;
    range = 100;
    cond_atr[2] = atr_strength;
    cond_value[2] = 130;
    on_equip = equip_2h_heavy_axe;
    on_unequip = unequip_2h_heavy_axe;
    visual = "iron_warhammer.3DS";
    description = name;
	text[5] = name_value;
	count[5] = value;
    inv_animate = 1;
};

instance itmw_stext_steel_warhammer(c_item) 
{
    name = itmw_stext_steel_warhammer_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 120;
    damagetotal = 135;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 90;
    value = 100;
    visual = "steel_warhammer.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_waraxe(c_item) 
{
    name = itmw_stext_steel_waraxe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 115;
    damagetotal = 125;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 100;
    value = 200;
    visual = "steel_waraxe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_shortsword(c_item) 
{
    name = itmw_stext_steel_shortsword_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 100;
    damagetotal = 125;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 90;
    value = 150;
    visual = "steel_shortsword.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_steel_shortsword, bit_item_dex_sword);
};

instance itmw_stext_steel_mastersword(c_item) 
{
    name = itmw_stext_steel_mastersword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 85;
    value = 150;
    visual = "steel_mastersword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_mace(c_item) 
{
    name = itmw_stext_steel_mace_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 125;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 90;
    value = 100;
    visual = "steel_mace.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_longsword(c_item) 
{
    name = itmw_stext_steel_longsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 115;
    damagetotal = 130;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 100;
    value = 150;
    visual = "steel_longsword.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_heavyclaymore(c_item) 
{
    name = itmw_stext_steel_heavyclaymore_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 125;
    damagetotal = 150;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 110;
    value = 150;
    visual = "steel_heavyclaymore.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_dagger(c_item) 
{
    name = itmw_stext_steel_dagger_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 85;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 70;
    value = 150;
    visual = "steel_dagger.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_steel_dagger, bit_item_dex_sword);
};

instance itmw_stext_holy_hammer(c_item) 
{
    name = itmw_stext_holy_hammer_name;
    mainflag = item_kat_nf;
    flags = item_mission | item_2hd_axe;
    material = mat_wood;
    value = 200;
    damagetotal = 130;
    damagetype = dam_blunt;
    range = 100;
    cond_atr[2] = atr_strength;
    cond_value[2] = 130;
    on_equip = equip_2h_heavy_axe;
    on_unequip = unequip_2h_heavy_axe;
    visual = "ItMw_030_2h_kdf_hammer_01.3DS";
    description = name;
	text[5] = name_value;
	count[5] = value;
    inv_animate = 1;
};

// Nagroda finalowa "Drogi Beliara" (Npc_DarkKnights.d) - wreczana przez
// Mistrza Mrocznych Rycerzy po zabiciu Lorda Isgarotha. Ciemny mesh z puli
// reliktow (sprawdzony w grze). Staty samodzielne, nie skalowane systemem dusz.
instance itmw_stext_beliar_reaper(c_item)
{
    name = "Zniwiarz Zmierzchu";
    mainflag = item_kat_nf;
    flags = item_mission | item_2hd_swd;
    material = mat_metal;
    value = 8000;
    damagetotal = 200;
    damagetype = dam_edge;
    range = 120;
    cond_atr[2] = atr_strength;
    cond_value[2] = 150;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    visual = "ItMw_2H_DarkSoul.3DS";
    description = name;
    text[1] = "Ostrze naznaczone reka Beliara.";
    text[2] = "Pije swiatlo tak, jak inni pija krew.";
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itmw_stext_steel_club(c_item)
{
    name = itmw_stext_steel_club_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 75;
    damagetotal = 90;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 75;
    value = 100;
    visual = "steel_club.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_claymore(c_item) 
{
    name = itmw_stext_steel_claymore_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 100;
    value = 150;
    visual = "steel_claymore.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_broadsword(c_item) 
{
    name = itmw_stext_steel_broadsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 85;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 85;
    value = 150;
    visual = "steel_broadsword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_steel_axe(c_item) 
{
    name = itmw_stext_steel_axe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 85;
    value = 100;
    visual = "steel_axe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_Saber_05(c_item) 
{
    name = itmw_stext_Saber_05_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 115;
    damagetotal = 125;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 95;
    value = 150;
    visual = "Saber_05.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_05, bit_item_dex_sword);
};

instance itmw_stext_Saber_04_02_02(c_item) 
{
    name = itmw_stext_Saber_04_02_02_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 90;
    damagetotal = 110;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 85;
    value = 150;
    visual = "Saber_04_02_02.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_04_02_02, bit_item_dex_sword);
};

instance itmw_stext_Saber_04_02_01(c_item) 
{
    name = itmw_stext_Saber_04_02_01_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 95;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 85;
    value = 150;
    visual = "Saber_04_02_01.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_04_02_01, bit_item_dex_sword);
};

instance itmw_stext_Saber_04_01(c_item) 
{
    name = itmw_stext_Saber_04_01_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 95;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 95;
    value = 150;
    visual = "Saber_04_01.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_04_01, bit_item_dex_sword);
};

instance itmw_stext_Saber_03(c_item) 
{
    name = itmw_stext_Saber_03_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 85;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 85;
    value = 150;
    visual = "Saber_03.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_03, bit_item_dex_sword);
};

instance itmw_stext_Saber_02(c_item) 
{
    name = itmw_stext_Saber_02_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 95;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 90;
    value = 150;
    visual = "Saber_02.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_02, bit_item_dex_sword);
};

instance itmw_stext_Saber_01(c_item) 
{
    name = itmw_stext_Saber_01_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 95;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 90;
    value = 150;
    visual = "Saber_01.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Saber_01, bit_item_dex_sword);
};

instance itmw_stext_PALKA2(c_item) 
{
    name = itmw_stext_PALKA2_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 105;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 85;
    value = 100;
    visual = "PALKA2.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_palasz2(c_item) 
{
    name = itmw_stext_palasz2_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 85;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 90;
    value = 150;
    visual = "palasz2.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_palasz2, bit_item_dex_sword);
};

instance itmw_stext_palasz(c_item) 
{
    name = itmw_stext_palasz_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 85;
    damagetotal = 100;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 90;
    value = 150;
    visual = "palasz.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_palasz, bit_item_dex_sword);
};

instance itmw_stext_Novizenhueter(c_item) 
{
    name = itmw_stext_Novizenhueter_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 75;
    damagetotal = 90;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 80;
    value = 150;
    visual = "Novizenhueter40STR.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_Novizenhueter, bit_item_dex_sword);
};

instance itmw_stext_new_stl_wingsword(c_item) 
{
    name = itmw_stext_new_stl_wingsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 120;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 90;
    value = 150;
    visual = "new_stl_wingsword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_new_stl_waraxe(c_item) 
{
    name = itmw_stext_new_stl_waraxe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 105;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 100;
    value = 200;
    visual = "new_stl_waraxe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_new_stl_mastersword(c_item) 
{
    name = itmw_stext_new_stl_mastersword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 95;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 90;
    value = 150;
    visual = "new_stl_mastersword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_new_stl_handaxe(c_item) 
{
    name = itmw_stext_new_stl_handaxe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 80;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 75;
    value = 100;
    visual = "new_stl_handaxe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_new_stl_greatsword(c_item) 
{
    name = itmw_stext_new_stl_greatsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 115;
    damagetotal = 140;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 115;
    value = 150;
    visual = "new_stl_greatsword.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_new_stl_dagger(c_item) 
{
    name = itmw_stext_new_stl_dagger_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 70;
    damagetotal = 75;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 70;
    value = 150;
    visual = "new_stl_dagger.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_new_stl_dagger, bit_item_dex_sword);
};

instance itmw_stext_new_stl_claymore(c_item) 
{
    name = itmw_stext_new_stl_claymore_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 110;
    value = 150;
    visual = "new_stl_claymore.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_new_stl_broadsword(c_item) 
{
    name = itmw_stext_new_stl_broadsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 85;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 85;
    value = 150;
    visual = "new_stl_broadsword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Sword_Blaise(c_item) 
{
    name = itmw_stext_2H_Sword_Blaise_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 150;
    damagetotal = 160;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 100;
    value = 350;
    visual = "ItMw_2H_Sword_Blaise.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2h_SleeperEye(c_item) 
{
    name = itmw_stext_2h_SleeperEye_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 170;
    damagetotal = 180;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 115;
    value = 350;
    visual = "ItMw_2h_SleeperEye.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_warhammer(c_item) 
{
    name = itmw_stext_iron_warhammer_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 115;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 80;
    value = 100;
    visual = "iron_warhammer.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_waraxe(c_item) 
{
    name = itmw_stext_iron_waraxe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 95;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 100;
    value = 200;
    visual = "iron_waraxe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_shortsword(c_item) 
{
    name = itmw_stext_iron_shortsword_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 70;
    damagetotal = 70;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 70;
    value = 150;
    visual = "iron_shortsword.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_iron_shortsword, bit_item_dex_sword);
};

instance itmw_stext_iron_mastersword(c_item) 
{
    name = itmw_stext_iron_mastersword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 85;
    value = 150;
    visual = "iron_mastersword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_mace(c_item) 
{
    name = itmw_stext_iron_mace_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 80;
    damagetotal = 95;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 80;
    value = 100;
    visual = "iron_mace.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_longsword(c_item) 
{
    name = itmw_stext_iron_longsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 125;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 105;
    value = 150;
    visual = "iron_longsword.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_heavyclaymore(c_item) 
{
    name = itmw_stext_iron_heavyclaymore_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 140;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 115;
    value = 150;
    visual = "iron_heavyclaymore.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_dagger(c_item) 
{
    name = itmw_stext_iron_dagger_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 60;
    damagetotal = 55;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 60;
    value = 150;
    visual = "iron_dagger.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_iron_dagger, bit_item_dex_sword);
};

instance itmw_stext_iron_club(c_item) 
{
    name = itmw_stext_iron_club_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 70;
    damagetotal = 85;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 70;
    value = 100;
    visual = "iron_club.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_claymore(c_item) 
{
    name = itmw_stext_iron_claymore_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 120;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 110;
    value = 150;
    visual = "iron_claymore.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_broadsword(c_item) 
{
    name = itmw_stext_iron_broadsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 80;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 80;
    value = 150;
    visual = "iron_broadsword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_iron_axe(c_item) 
{
    name = itmw_stext_iron_axe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 80;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 75;
    value = 100;
    visual = "iron_axe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Glaubensbringer(c_item) 
{
    name = itmw_stext_2H_Glaubensbringer_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 125;
    damagetotal = 150;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 115;
    value = 350;
    visual = "Glaubensbringer70str.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_rapier(c_item)
{
    name = itmw_stext_rapier_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 50;
    damagetotal = 65;
    damagetype = dam_point;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dex;
    on_unequip = unequip_1h_light_dex;
    ownerguild = 123;
    range = 80;
    value = 200;
    visual = "floret.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_rapier, bit_item_pierce_damage);
};

instance itmw_stext_2H_Sword_Smith_01(c_item) 
{
    name = itmw_stext_2H_Sword_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 115;
    damagetotal = 140;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 105;
    value = 150;
    visual = "DB_ItMw_2H_Sword_Smith_01.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Sword_Smith_02(c_item) 
{
    name = itmw_stext_2H_Sword_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 120;
    damagetotal = 140;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 105;
    value = 150;
    visual = "DB_ItMw_2H_Sword_Smith_02.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Sword_Light_Smith_01(c_item) 
{
    name = itmw_stext_2H_Sword_Light_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 130;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 105;
    value = 150;
    visual = "DB_ItMw_2H_Sword_Light_Smith_01.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Sword_Light_Smith_02(c_item) 
{
    name = itmw_stext_2H_Sword_Light_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 115;
    damagetotal = 135;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 110;
    value = 150;
    visual = "DB_ItMw_2H_Sword_Light_Smith_02.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Sword_Heavy_Smith_01(c_item) 
{
    name = itmw_stext_2H_Sword_Heavy_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 130;
    damagetotal = 150;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 115;
    value = 150;
    visual = "DB_ItMw_2H_Sword_Heavy_Smith_01.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2H_Sword_Heavy_Smith_02(c_item) 
{
    name = itmw_stext_2H_Sword_Heavy_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 130;
    damagetotal = 155;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 110;
    value = 150;
    visual = "DB_ItMw_2H_Sword_Heavy_Smith_02.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Smith_01(c_item) 
{
    name = itmw_stext_1H_Sword_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 85;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 85;
    value = 150;
    visual = "DB_ItMw_1H_Sword_Smith_01.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Smith_02(c_item) 
{
    name = itmw_stext_1H_Sword_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 85;
    value = 150;
    visual = "DB_ItMw_1H_Sword_Smith_02.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Rep_01(c_item) 
{
    name = itmw_stext_1H_Sword_Rep_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 95;
    value = 250;
    visual = "DB_ItMw_1h_Sword_Rep_01.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Rep_02(c_item) 
{
    name = itmw_stext_1H_Sword_Rep_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 105;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 95;
    value = 250;
    visual = "DB_ItMw_1h_Sword_Rep_02.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Long_Smith_01(c_item) 
{
    name = itmw_stext_1H_Sword_Long_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 125;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 95;
    value = 250;
    visual = "DB_ItMw_1H_Sword_Long_Smith_01.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Long_Smith_02(c_item) 
{
    name = itmw_stext_1H_Sword_Long_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 100;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 95;
    value = 250;
    visual = "DB_ItMw_1H_Sword_Long_Smith_02.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Long_Mission(c_item) 
{
    name = itmw_stext_1H_Sword_Long_Mission_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 150;
    damagetotal = 175;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 95;
    value = 250;
    visual = "DB_Itmw_1H_Sword_Long_Mission.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Broad_Smith_01(c_item) 
{
    name = itmw_stext_1H_Sword_Broad_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 130;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 85;
    value = 250;
    visual = "DB_ItMw_1H_Sword_Broad_Smith_01.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_Sword_Broad_Smith_02(c_item) 
{
    name = itmw_stext_1h_Sword_Broad_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 110;
    damagetotal = 135;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 85;
    value = 250;
    visual = "DB_ItMw_1H_Sword_Broad_Smith_02.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_Sword_Broad_Rep_02(c_item) 
{
    name = itmw_stext_1h_Sword_Broad_Rep_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 120;
    damagetotal = 140;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 90;
    value = 250;
    visual = "DB_ItMw_1h_Sword_Broad_Rep_02.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Bastard_Smith_02(c_item) 
{
    name = itmw_stext_1H_Sword_Bastard_Smith_02_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 150;
    damagetotal = 170;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 90;
    value = 250;
    visual = "DB_ItMw_1H_Sword_Bastard_Smith_02.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1H_Sword_Bastard_Smith_01(c_item) 
{
    name = itmw_stext_1H_Sword_Bastard_Smith_01_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 145;
    damagetotal = 165;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 90;
    value = 250;
    visual = "DB_Itmw_1H_Sword_Bastard_Smith_01.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_crawlerschreck(c_item) 
{
    name = itmw_stext_1h_crawlerschreck_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 110;
    damagetotal = 140;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 95;
    value = 250;
    visual = "CrawlerSchreck60STR.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_1h_crawlerschreck, bit_item_dex_sword);
};

instance itmw_stext_axe3(c_item) 
{
    name = itmw_stext_axe3_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 110;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 110;
    value = 100;
    visual = "Axe_01.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_axe4(c_item) 
{
    name = itmw_stext_axe4_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 110;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 110;
    value = 150;
    visual = "Axe_02.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_2h_sword(c_item) 
{
    name = itmw_stext_2h_sword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 90;
    damagetotal = 110;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 110;
    value = 150;
    visual = "2h_Sword.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_spear_3(c_item) 
{
    name = itmw_stext_spear_3_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 55;
    damagetotal = 75;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_wood;
    on_equip = equip_2h_medium_speer;
    on_unequip = unequip_2h_medium_speer;
    ownerguild = 123;
    range = 125;
    value = 150;
    visual = "2h_Spear.3ds";
    visual_change = name_twohanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_spear_3, bit_item_speer);
};

instance itmw_stext_2h_scimitar(c_item) 
{
    name = itmw_stext_2h_scimitar_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 80;
    damagetotal = 120;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 100;
    value = 150;
    visual = "2h_Scimitar.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
	setitemvartrue(itmw_stext_2h_scimitar, bit_item_dex_sword);
};

instance itmw_stext_spear_2(c_item) 
{
    name = itmw_stext_spear_2_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 45;
    damagetotal = 70;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_wood;
    on_equip = equip_2h_medium_speer;
    on_unequip = unequip_2h_medium_speer;
    ownerguild = 123;
    range = 120;
    value = 150;
    visual = "2h_glewia.3ds";
    visual_change = name_twohanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_spear_2, bit_item_speer);
};

instance itmw_stext_spear_1(c_item) 
{
    name = itmw_stext_spear_1_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 25;
    damagetotal = 50;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_wood;
    on_equip = equip_2h_medium_speer;
    on_unequip = unequip_2h_medium_speer;
    ownerguild = 123;
    range = 120;
    value = 150;
    visual = "2h_dzida.3ds";
    visual_change = name_twohanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_spear_1, bit_item_speer);
};

instance itmw_stext_2h_axe(c_item) 
{
    name = itmw_stext_2h_axe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 95;
    damagetotal = 115;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_veryheavy;
    on_unequip = unequip_1h_veryheavy;
    range = 100;
    value = 200;
    visual = "2h_Axe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_warsickle(c_item) 
{
    name = itmw_stext_1h_warsickle_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 90;
    damagetotal = 120;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 85;
    value = 250;
    visual = "1h_warsickle.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_1h_warsickle, bit_item_dex_sword);
};

instance itmw_stext_1h_sword_long(c_item) 
{
    name = itmw_stext_1h_sword_long_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 85;
    damagetotal = 90;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 80;
    value = 150;
    visual = "1h_Sword_Long.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_sword_heavy(c_item) 
{
    name = itmw_stext_1h_sword_heavy_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 85;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 70;
    value = 150;
    visual = "1h_Sword_Heavy.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_bastard_sword1(c_item) 
{
    name = itmw_stext_1h_bastard_sword1_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 75;
    damagetotal = 85;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 75;
    value = 150;
    visual = "1h_Sword_Bastard_1.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_bastard_sword2(c_item) 
{
    name = itmw_stext_1h_bastard_sword2_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 70;
    damagetotal = 80;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 75;
    value = 150;
    visual = "1h_Sword_Bastard_2.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_cutlass(c_item) 
{
    name = itmw_stext_1h_cutlass_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 70;
    damagetotal = 70;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 65;
    value = 100;
    visual = "1h_Cutlass.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_1h_cutlass, bit_item_dex_sword);
};

instance itmw_stext_1h_bastard_meryl(c_item) 
{
    name = itmw_stext_1h_bastard_meryl_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 75;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 75;
    value = 150;
    visual = "1h_bastard_meryl.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_1h_bastard_sword(c_item) 
{
    name = itmw_stext_1h_bastard_sword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 70;
    damagetotal = 90;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 75;
    value = 150;
    visual = "1h_bastard_sword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_axe1(c_item) 
{
    name = itmw_stext_axe1_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 70;
    damagetotal = 85;
    damagetype = dam_edge;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 75;
    value = 100;
    visual = "1h_Axe_01.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_axe2(c_item) 
{
    name = itmw_stext_axe2_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 80;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 75;
    value = 150;
    visual = "1h_Axe_02.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_bronze_longsword(c_item) 
{
    name = itmw_stext_bronze_longsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 80;
    damagetotal = 100;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium;
    on_unequip = unequip_2h_medium;
    range = 100;
    value = 150;
    visual = "Bronze_Longsword.3ds";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_bronze_broadsword(c_item) 
{
    name = itmw_stext_bronze_broadsword_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 70;
    damagetotal = 85;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_medium;
    on_unequip = unequip_1h_medium;
    range = 75;
    value = 150;
    visual = "Bronze_Broadsword.3ds";
    visual_change = name_onehanded_slash;
    text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_bronze_shortsword(c_item) 
{
    name = itmw_stext_bronze_shortsword_name;
	cond_atr[2] = atr_dexterity;
    cond_value[2] = 60;
    damagetotal = 40;
    damagetype = dam_edge;
    description = name;
    flags = item_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_light_dexs;
    on_unequip = unequip_1h_light_dexs;
    range = 60;
    value = 150;
    visual = "Bronze_Shortsword.3DS";
    visual_change = name_onehanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_bronze_shortsword, bit_item_dex_sword);
};

instance itmw_stext_bronze_mace(c_item) 
{
    name = itmw_stext_bronze_mace_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 60;
    damagetotal = 75;
    damagetype = dam_blunt;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 70;
    value = 100;
    visual = "Bronze_Mace.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_bronze_warhammer(c_item) 
{
    name = itmw_stext_bronze_warhammer_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 95;
    damagetotal = 100;
    damagetype = dam_blunt;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_heavy;
    on_unequip = unequip_2h_heavy;
    range = 100;
    value = 200;
    visual = "Bronze_Warhammer.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_bronze_waraxe(c_item) 
{
    name = itmw_stext_bronze_waraxe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 85;
    damagetotal = 95;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 100;
    value = 200;
    visual = "Bronze_Waraxe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_bronze_axe(c_item) 
{
    name = itmw_stext_bronze_axe_name;
    cond_atr[2] = atr_strength;
    cond_value[2] = 60;
    damagetotal = 75;
    damagetype = dam_edge;
    description = name;
    flags = item_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_1h_heavy;
    on_unequip = unequip_1h_heavy;
    range = 70;
    value = 100;
    visual = "Bronze_Axe.3ds";
	text[5] = name_value;
    count[5] = value;
};

instance itmw_stext_spear_bronze(c_item) 
{
    name = itmw_stext_spear_bronze_name;
    cond_atr[2] = atr_dexterity;
    cond_value[2] = 15;
    damagetotal = 40;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_axe | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_wood;
    on_equip = equip_2h_medium_speer;
    on_unequip = unequip_2h_medium_speer;
    ownerguild = 123;
    range = 120;
    value = 150;
    visual = "Bronze_Spear.3ds";
    visual_change = name_twohanded_pierce;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_spear_bronze, bit_item_speer);
};

instance itmw_stext_halleberde_bronze(c_item) 
{
    name = itmw_stext_halleberde_bronze_name;
    cond_atr[1] = atr_strength;
    cond_value[1] = 25;
    damagetotal = 60;
    damagetype = dam_edge;
    description = name;
    flags = item_2hd_swd | item_mission;
    inv_animate = 1;
    mainflag = item_kat_nf;
    material = mat_metal;
    on_equip = equip_2h_medium_halleberde;
    on_unequip = unequip_2h_medium_halleberde;
    range = 120;
    value = 500;
    visual = "Bronze_Halberd.3DS";
    visual_change = name_twohanded_slash;
    text[5] = name_value;
    count[5] = value;
    setitemvartrue(itmw_stext_halleberde_bronze, bit_item_hellebarde);
};


prototype itrw_stext_bow_l(c_item) 
{
    name = itrw_stext_stext_bow_l_name;
    cond_atr[1] = aivrx_npc_atr_bow;
    cond_atr[2] = atr_dexterity;
    cond_value[1] = 5;
    cond_value[2] = 25;
    damage[6] = 35;
    damagetotal = 35;
    damagetype = dam_point;
    description = name;
    flags = item_bow | item_mission;
    inv_animate = 1;
    mainflag = item_kat_ff;
    material = mat_wood;
    munition = itrw_arrow;
    on_equip = equip_bow_light;
    on_unequip = unequip_bow_light;
    value = 100;
    text[5] = name_value;
    count[5] = value;
};

prototype itrw_stext_bow_m(c_item) 
{
    name = itrw_stext_stext_bow_m_name;
    cond_atr[1] = aivrx_npc_atr_bow;
    cond_atr[2] = atr_dexterity;
    cond_value[1] = 15;
    cond_value[2] = 50;
    damage[6] = 95;
    damagetotal = 95;
    damagetype = dam_point;
    description = name;
    flags = item_bow | item_mission;
    inv_animate = 1;
    mainflag = item_kat_ff;
    material = mat_wood;
    munition = itrw_arrow;
    on_equip = equip_bow_medium;
    on_unequip = unequip_bow_medium;
    value = 200;   
    text[5] = name_value;
    count[5] = value;
};

prototype itrw_stext_bow_h(c_item) 
{
    name = itrw_stext_stext_bow_h_name;
    cond_atr[1] = aivrx_npc_atr_bow;
    cond_atr[2] = atr_dexterity;
    cond_value[1] = 25;
    cond_value[2] = 100;
    damage[6] = 135;
    damagetotal = 135;
    damagetype = dam_point;
    description = name;
    flags = item_bow | item_mission;
    inv_animate = 1;
    mainflag = item_kat_ff;
    material = mat_wood;
    munition = itrw_arrow;
    on_equip = equip_bow_heavy;
    on_unequip = unequip_bow_heavy;
    value = 300;   
    text[5] = name_value;
    count[5] = value;
};

instance itrw_stext_bow_l_01(itrw_stext_bow_l) { visual = "ITRW_BOW_SMALL_01.MMS"; };
instance itrw_stext_bow_l_02(itrw_stext_bow_l) { visual = "ITRW_BOW_SMALL_02.MMS"; };
instance itrw_stext_bow_l_03(itrw_stext_bow_l) { visual = "ITRW_BOW_SMALL_04.MMS"; };
instance itrw_stext_bow_l_04(itrw_stext_bow_l) { visual = "ITRW_BOW_SMALL_05.MMS"; };
 
instance itrw_stext_bow_m_01(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_01.MMS"; };
instance itrw_stext_bow_m_02(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_02.MMS"; };
instance itrw_stext_bow_m_03(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_03.MMS"; };
instance itrw_stext_bow_m_04(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_04.MMS"; };
instance itrw_stext_bow_m_05(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_05.MMS"; };
instance itrw_stext_bow_m_06(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_06.MMS"; };
instance itrw_stext_bow_m_07(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_07.MMS"; };
instance itrw_stext_bow_m_08(itrw_stext_bow_m) { visual = "ITRW_BOW_LONG_08.MMS"; };

instance itrw_stext_bow_h_01(itrw_stext_bow_h) { visual = "ITRW_BOW_WAR_01.MMS"; };
instance itrw_stext_bow_h_02(itrw_stext_bow_h) { visual = "ITRW_BOW_WAR_02.MMS"; };
instance itrw_stext_bow_h_03(itrw_stext_bow_h) { visual = "ITRW_BOW_WAR_03.MMS"; };
instance itrw_stext_bow_h_04(itrw_stext_bow_h) { visual = "ITRW_BOW_WAR_04.MMS"; };

