instance itru_sumdeathhound(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 1500;
    visual = "itru_sumdeathhound.3DS";
    material = mat_stone;
    spell = spl_summondeathhound;
    mag_circle = 1;
    wear = wear_effect;
    description = name_spl_summon_deathhound;
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summondeathhound;
	text[2] = name_dam_magic;
    inv_animate = 1;
};

instance itru_sumdarkgol(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_sumdarkgol.3DS";
    material = mat_stone;
    spell = spl_summondarkgolem;
    mag_circle = 3;
    wear = wear_effect;
    description = name_spl_summon_darkgolem;
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summondarkgolem;
	text[2] = name_dam_magic;
    inv_animate = 1;
};

instance itru_stext_magicbolt(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 250;
    visual = "itru_stext_magicbolt.3DS";
    material = mat_stone;
    spell = spl_stextmagicbolt;
	cond_atr[2] = atr_mana_max;
    cond_value[2] = 20;
    mag_circle = 0;
    wear = wear_effect;
    description = name_spl_stext_magicbolt;
    text[1] = name_manakosten;
    count[1] = spl_cost_stextmagicbolt;
	text[2] = name_dam_magic;
	count[2] = spl_damage_stextmagicbolt;
	text[3] = name_spl_stext_magicbolt_txt1;
    inv_animate = 1;
};

instance itru_sumskelmage(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 8000;
    visual = "itru_sumskelmage.3DS";
    material = mat_stone;
    spell = spl_summon_skeleton_mage;
    mag_circle = 4;
    wear = wear_effect;
    description = name_spl_summon_skeleton_mage;
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_skeleton_mage;
	text[2] = name_dam_magic;
    inv_animate = 1;
};

instance itsc_sumskelmage(c_item) 
{
    name = name_spl_summon_skeleton_mage;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItSc_SummonSkeletonWar_New.3DS";
    material = mat_leather;
    spell = spl_summon_skeleton_mage;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_sumdeathhound(c_item) 
{
    name = name_spl_summon_deathhound;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summondeathhound;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll3;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_sumdarkgol(c_item) 
{
    name = name_spl_summon_darkgolem;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summondarkgolem;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

// Scrolls
instance itsc_darkcontrol(c_item) 
{
    name = name_spl_darkcontrol;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darkcontrol;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_darkcsleep(c_item) 
{
    name = name_spl_darksleep;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darksleep;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_dot_first(c_item) 
{
    name = name_spl_dot_first;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_dot_first;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_dot_second(c_item) 
{
    name = name_spl_dot_second;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_dot_second;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_argo(c_item) 
{
    name = name_spl_agro;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_agro;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll3;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;	
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_darkinvis(c_item) 
{
    name = name_spl_dark_invis;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_dark_invis;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll5;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll5;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_massagro(c_item) 
{
    name = name_spl_massagro;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_massagro;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll6;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll6;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_massdot(c_item) 
{
    name = name_spl_massdot;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_massdot;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll6;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll6;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_darkball(c_item) 
{
    name = name_spl_darkball;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darkball;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll3;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_darkspear(c_item) 
{
    name = name_spl_darkspear;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darkspear;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll3;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_bigdarkball(c_item) 
{
    name = name_spl_bigdarkball;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_bigdarkball;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_darkwave(c_item) 
{
    name = name_spl_darkwave;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darkwave;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll5;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll5;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_torture(c_item) 
{
    name = name_spl_torture;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_torture;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll5;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll5;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_electrowave(c_item) 
{
    name = name_spl_electrowave;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_electrowave;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stonefirst(c_item) 
{
    name = name_spl_stonefirst;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_stonefirst;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll3;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_magsphere(c_item) 
{
    name = name_spl_magsphere;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_magsphere;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_magsphere;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_magsphere;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_guruwrath(c_item) 
{
    name = name_spl_guruwrath;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_concussionbolt;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_guruwrath;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_guruwrath;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_bloodrain(c_item) 
{
    name = name_spl_bloodrain;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_bloodrain;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_iceexploision(c_item) 
{
    name = name_spl_iceexploision;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_iceexploision;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_icerain(c_item) 
{
    name = name_spl_icerain;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_icerain;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll6;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll6;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_control(c_item) 
{
    name = name_spl_control;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_control;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_telekinesis(c_item) 
{
    name = name_spl_telekinesis;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_telekinesis;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll;
    wear = wear_effect;
    description = name;
    text[1] = name_manakosten;
    count[1] = spl_cost_telekinesis;
    text[2] = name_manapersec;
    count[2] = spl_telekinesis_damage_per_sec;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_lightningsphere(c_item) 
{
    name = name_spl_lightningsphere;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_lightningsphere;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_firewave(c_item) 
{
    name = name_spl_firewave;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_firewave;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_firemeteor(c_item) 
{
    name = name_spl_firemeteor;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_firemeteor;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll6;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll6;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_firelight(c_item) 
{
    name = name_spl_firelight;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_firelight;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_firelight;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_firelight;
	text[2] = name_dam_magic;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_sumkhub(c_item) 
{
    name = stext_name_spl_summondemon_khub;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spell_sumkhub;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    inv_animate = 1;
};

instance itsc_sumskeluniq(c_item) 
{
    name = name_spl_summon_skeleton_uniq;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spell_summon_skeleton_uniq;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    inv_animate = 1;
};

instance itsc_sumdkpet(c_item) 
{
    name = name_spl_darkpetsummon;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darkpetsummon;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_sumhollywisp(c_item) 
{
    name = name_spl_stext_sumhollywisp;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ItSc_PalLight_New.3DS";
    material = mat_leather;
    spell = spl_summon_hollywisp;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_sumhollywisp(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_sumhollywisp.3ds";
    material = mat_stone;
    spell = spl_summon_hollywisp;
    mag_circle = 1;
    wear = wear_effect;
    description = name_spl_stext_sumhollywisp;
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
    inv_animate = 1;
};

instance itsc_summonairgolem(c_item) 
{
    name = name_spl_summon_airgolem;
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItSc_TrfGolem_New.3DS";
    material = mat_leather;
    spell = spl_summon_airgolem;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll4;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll4;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_summonairgolem(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 10000;
    visual = "itru_summonairgolem.3ds";
    material = mat_stone;
    spell = spl_summon_airgolem;
    mag_circle = 1;
    wear = wear_effect;
    description = name_spl_summon_airgolem;
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll5;
    inv_animate = 1;
};

instance itsc_debuff_protection(c_item) 
{
    name = txt_spells[spl_debuff_protection];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_protection;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_protection(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_protection.3ds";
    material = mat_stone;
    spell = spl_debuff_protection;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_protection];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_stats(c_item) 
{
    name = txt_spells[spl_debuff_stats];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_stats;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_stats(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_stats.3ds";
    material = mat_stone;
    spell = spl_debuff_stats;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_stats];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_siphon(c_item) 
{
    name = txt_spells[spl_debuff_siphon];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_siphon;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_siphon(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_siphon.3ds";
    material = mat_stone;
    spell = spl_debuff_siphon;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_siphon];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_speed(c_item) 
{
    name = txt_spells[spl_debuff_speed];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_speed;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_speed(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_speed.3ds";
    material = mat_stone;
    spell = spl_debuff_speed;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_speed];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_lifetap(c_item) 
{
    name = txt_spells[spl_debuff_lifetap];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_lifetap;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_lifetap(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_lifetap2.3ds";
    material = mat_stone;
    spell = spl_debuff_lifetap;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_lifetap];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_reflectdamage(c_item) 
{
    name = txt_spells[spl_debuff_reflectdamage];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_reflectdamage;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_reflectdamage(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_reflectdamage.3ds";
    material = mat_stone;
    spell = spl_debuff_reflectdamage;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_reflectdamage];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_extradamage(c_item) 
{
    name = txt_spells[spl_debuff_extradamage];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_extradamage;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_extradamage(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_extradamage.3ds";
    material = mat_stone;
    spell = spl_debuff_extradamage;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_extradamage];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_debuff_weaken(c_item) 
{
    name = txt_spells[spl_debuff_weaken];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_debuff_weaken;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_debuff_weaken(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_debuff_weaken.3ds";
    material = mat_stone;
    spell = spl_debuff_weaken;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_debuff_weaken];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_massrestore(c_item) 
{
    name = txt_spells[spl_buff_massrestore];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_massrestore;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_massrestore(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_massrestore.3ds";
    material = mat_stone;
    spell = spl_buff_massrestore;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_massrestore];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_es(c_item) 
{
    name = txt_spells[spl_buff_es];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_es;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_es(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_es.3ds";
    material = mat_stone;
    spell = spl_buff_es;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_es];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_dodge(c_item) 
{
    name = txt_spells[spl_buff_dodge];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_dodge;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_dodge(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_dodge.3ds";
    material = mat_stone;
    spell = spl_buff_dodge;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_dodge];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_speed(c_item) 
{
    name = txt_spells[spl_buff_speed];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_speed;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_speed(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_speed.3ds";
    material = mat_stone;
    spell = spl_buff_speed;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_speed];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_damage(c_item) 
{
    name = txt_spells[spl_buff_damage];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_damage;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_damage(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_damage.3ds";
    material = mat_stone;
    spell = spl_buff_damage;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_damage];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_regen(c_item) 
{
    name = txt_spells[spl_buff_regen];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_regen;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_regen(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_regen.3ds";
    material = mat_stone;
    spell = spl_buff_regen;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_regen];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_stats(c_item) 
{
    name = txt_spells[spl_buff_stats];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_stats;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_stats(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_stats.3ds";
    material = mat_stone;
    spell = spl_buff_stats;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_stats];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_hp(c_item) 
{
    name = txt_spells[spl_buff_hp];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_hp;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_hp(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_hp.3ds";
    material = mat_stone;
    spell = spl_buff_hp;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_hp];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itsc_buff_protection(c_item) 
{
    name = txt_spells[spl_buff_protection];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_buff_protection;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = spl_cost_scroll2;
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = spl_cost_scroll2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_buff_protection(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_buff_protection.3ds";
    material = mat_stone;
    spell = spl_buff_protection;
    mag_circle = 1;
    wear = wear_effect;
    description = txt_spells[spl_buff_protection];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_scroll3;
    inv_animate = 1;
};

instance itru_summon_ghost(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_summon_ghost.3ds";
    material = mat_stone;
    spell = spl_summon_ghost;
    mag_circle = 5;
    wear = wear_effect;
    description = txt_spells[spl_summon_ghost];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_ghost;
    inv_animate = 1;
};

instance itru_summon_bonegolem(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_summon_bonegolem.3ds";
    material = mat_stone;
    spell = spl_summon_bonegolem;
    mag_circle = 4;
    wear = wear_effect;
    description = txt_spells[spl_summon_bonegolem];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_bonegolem;
    inv_animate = 1;
};

instance itru_summon_shadowbeast(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 3000;
    visual = "itru_summon_shadowbeast.3ds";
    material = mat_stone;
    spell = spl_summon_shadowbeast;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_summon_shadowbeast];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_shadowbeast;
    inv_animate = 1;
};

instance itru_summon_shadowbeast_fire(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_summon_shadowbeast_fire.3ds";
    material = mat_stone;
    spell = spl_summon_shadowbeast_fire;
    mag_circle = 4;
    wear = wear_effect;
    description = txt_spells[spl_summon_shadowbeast_fire];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_shadowbeast_fire;
    inv_animate = 1;
};

instance itru_summon_troll(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_summon_troll.3ds";
    material = mat_stone;
    spell = spl_summon_troll;
    mag_circle = 4;
    wear = wear_effect;
    description = txt_spells[spl_summon_troll];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_troll;
    inv_animate = 1;
};

instance itru_summon_crawler(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 2000;
    visual = "itru_summon_crawler.3ds";
    material = mat_stone;
    spell = spl_summon_crawler;
    mag_circle = 2;
    wear = wear_effect;
    description = txt_spells[spl_summon_crawler];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_crawler;
    inv_animate = 1;
};

instance itru_summon_oster(c_item) 
{
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 2000;
    visual = "itru_summon_oster.3ds";
    material = mat_stone;
    spell = spl_summon_oster;
    mag_circle = 2;
    wear = wear_effect;
    description = txt_spells[spl_summon_oster];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summon_oster;
    inv_animate = 1;
};

instance itsc_summon_oster(c_item) 
{
    name = txt_spells[spl_summon_oster];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_oster;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_oster);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_oster);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_summon_crawler(c_item) 
{
    name = txt_spells[spl_summon_crawler];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 200;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_crawler;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_crawler);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_crawler);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_summon_troll(c_item) 
{
    name = txt_spells[spl_summon_troll];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_troll;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_troll);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_troll);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_summon_shadowbeast_fire(c_item) 
{
    name = txt_spells[spl_summon_shadowbeast_fire];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 300;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_shadowbeast_fire;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_shadowbeast_fire);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_shadowbeast_fire);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_summon_shadowbeast(c_item) 
{
    name = txt_spells[spl_summon_shadowbeast];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 300;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_shadowbeast;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_shadowbeast);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_shadowbeast);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_summon_bonegolem(c_item) 
{
    name = txt_spells[spl_summon_bonegolem];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_bonegolem;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_bonegolem);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_bonegolem);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_summon_ghost(c_item) 
{
    name = txt_spells[spl_summon_ghost];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_ghost;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summon_ghost);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summon_ghost);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itru_stext_firecape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_firecape.3ds";
    material = mat_stone;
    spell = spl_firecape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_firecape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_icecape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_icecape.3ds";
    material = mat_stone;
    spell = spl_icecape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_icecape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_lightingcape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_lightingcape.3ds";
    material = mat_stone;
    spell = spl_lightingcape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_lightingcape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_darkcape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_darkcape.3ds";
    material = mat_stone;
    spell = spl_darkcape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_darkcape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_aircape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_aircape.3ds";
    material = mat_stone;
    spell = spl_aircape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_aircape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_earthcape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_earthcape.3ds";
    material = mat_stone;
    spell = spl_earthcape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_earthcape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_poisioncape (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_poisioncape.3ds";
    material = mat_stone;
    spell = spl_poisioncape;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_poisioncape];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_timedaoe;
    inv_animate = 1;
};

instance itru_stext_summon_electricgolem (c_item) 
{
	name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 5000;
    visual = "itru_stext_summon_electricgolem.3DS";
    material = mat_stone;
    spell = spl_summon_electricgolem;
    mag_circle = 3;
    wear = wear_effect;
    description = txt_spells[spl_summon_electricgolem];
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_summonelectricgolem;
	text[2] = name_dam_magic;
    inv_animate = 1;
};

instance itsc_stext_firecape(c_item) 
{
    name = txt_spells[spl_firecape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_firecape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_icecape(c_item) 
{
    name = txt_spells[spl_icecape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_icecape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_lightingcape(c_item) 
{
    name = txt_spells[spl_lightingcape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_lightingcape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_darkcape(c_item) 
{
    name = txt_spells[spl_darkcape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_darkcape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_aircape(c_item) 
{
    name = txt_spells[spl_aircape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_aircape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_earthcape(c_item) 
{
    name = txt_spells[spl_earthcape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_earthcape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_poisioncape(c_item) 
{
    name = txt_spells[spl_poisioncape];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_poisioncape;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_timedaoe);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_timedaoe);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itsc_stext_summon_electricgolem(c_item) 
{
    name = txt_spells[spl_summon_electricgolem];
    mainflag = item_kat_rune;
    flags = item_multi | item_mission;
    value = 500;
    visual = "ItWr_Scrl_RezN.3DS";
    material = mat_leather;
    spell = spl_summon_electricgolem;
    cond_atr[2] = atr_mana_max;
    cond_value[2] = StExt_CalcScrollMana(spl_cost_summonelectricgolem);
    wear = wear_effect;
    description = name;
    text = name_magescroll;
	text[1] = name_manakosten;
    count[1] = StExt_CalcScrollMana(spl_cost_summonelectricgolem);
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};