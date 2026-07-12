instance itwr_StExt_CorruptionScroll(c_item) 
{
    name = StExt_Str_CorruptionScrollName;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItSc_Shrink_New.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	text[2] = StExt_Str_CorruptionScrollTxt1;
	text[3] = StExt_Str_CorruptionScrollTxt2;
	text[5] = StExt_Str_CorruptionScrollTxt3;
    on_state = use_itwr_StExt_CorruptionScroll;
    inv_animate = 1;
};

func void use_itwr_StExt_CorruptionScroll() 
{
    if(npc_isplayer(self) && StExt_CorruptionPath == StExt_Corruption_None) 
	{
		if(hero.level > 15)
		{
			b_say(self, self, "$IMPOSSIBLEFORME");
			npc_removeinvitems(self, itwr_StExt_CorruptionScroll, 1);
			ai_printred(StExt_Str_CantBecomeCorruptedNotify);
			ai_printred(StExt_Str_CantBecomeCorruptedNotify2);
			return;
		};	
		StExt_DisplayCorruptionMenu = true;
		ai_processinfos(hero);
    }
	else if(npc_isplayer(self) && StExt_CorruptionPath != StExt_Corruption_None) { npc_removeinvitems(self, itwr_StExt_CorruptionScroll, 1); };
};

instance itmi_stoned_wax(c_item) 
{
    name = StExt_Str_StonedWax_Name;
    mainflag = item_kat_magic;
    flags = item_mission;
    value = 200;
    visual = "ItMi_Wax.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	text[4] = StExt_Str_StonedWax_Desc;
	text[5] = name_value;
    count[5] = value;
    on_state = use_itmi_stoned_wax;
	inv_zbias = 200;
    inv_animate = 1;
};
func void use_itmi_stoned_wax()
{
	var c_npc her;
    her = hlp_getnpc(pc_hero);
    if(hlp_getinstanceid(self) == hlp_getinstanceid(her)) 
	{
		if(npc_hasitems(her, itmi_feder) > 0)
		{
			StExt_DisplayScrollmakingMenu = true;
			ai_processinfos(self);    
		}
		else
		{
			b_say(self, self, StExt_ImpossibleForMe);
			ai_print(StExt_Str_NeedFeather);
		};
    };
};

instance itut_stext_magicbook(c_item) 
{
    name = StExt_Str_Grimmoire_Name;
    mainflag = item_kat_magic;
    flags = item_trophy | item_multi;
    value = 1;
    visual = "book_necro.3DS";
    material = mat_leather;
    on_equip = equip_itut_stext_magicbook;
    on_unequip = unequip_itut_stext_magicbook;
    description = name;  
    text[3] = StExt_Str_Grimmoire_Txt;
    text[4] = StExt_Str_Artifact_Txt;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_ring_standard;
    inv_animate = 1;
};
instance itut_stext_magicbook_2(c_item) 
{
    name = StExt_Str_Grimmoire_Name;
    mainflag = item_kat_none;
    flags = item_multi | item_mission;
    visual = "book_necro.3DS";
    material = mat_leather;
    description = name;
    inv_zbias = invcam_entf_ring_standard;
};
func void equip_itut_stext_magicbook() 
{
    b_clearusetrophy();
    activatezsslot(self, "BIP01 PELVIS");
    ext_removefromslot(self, "BIP01 PELVIS");
    ext_putinslot(self, "BIP01 PELVIS", itut_stext_magicbook_2);
    npc_removeinvitems(self, itut_stext_magicbook_2, npc_hasitems(self, itut_stext_magicbook_2));
	itm_setflagactive(itut_stext_magicbook, true);
    StExt_EquipArtifact(StExt_ArtifactIndex_Grimoir);
};
func void unequip_itut_stext_magicbook() { StExt_UnEquipGrimoir(); };

instance itut_stext_magicdagger(c_item) 
{
    name = StExt_Str_Dagger_Name;
    mainflag = item_kat_magic;
    flags = item_trophy | item_multi;
    value = 1;
    visual = "ITMI_AREANATROPHY.3DS";
    material = mat_leather;
    on_equip = equip_itut_stext_magicdagger;
    on_unequip = unequip_itut_stext_magicdagger;
    description = name; 
    text[3] = StExt_Str_Dagger_Txt;
    text[4] = StExt_Str_Artifact_Txt;
    text[5] = name_value;
    count[5] = value;
    inv_zbias = invcam_entf_ring_standard;
    inv_animate = 1;
};
instance itut_stext_magicdagger_2(c_item) 
{
    name = StExt_Str_Dagger_Name;
    mainflag = item_kat_none;
    flags = item_multi | item_mission;
    visual = "ITMI_AREANATROPHY.3DS";
    material = mat_leather;
    description = name;
    inv_zbias = invcam_entf_ring_standard;
};
func void equip_itut_stext_magicdagger() 
{
    b_clearusetrophy();
    activatezsslot(self, "BIP01 PELVIS");
    ext_removefromslot(self, "BIP01 PELVIS");
    ext_putinslot(self, "BIP01 PELVIS", itut_stext_magicdagger_2);
    npc_removeinvitems(self, itut_stext_magicdagger_2, npc_hasitems(self, itut_stext_magicdagger_2));
	itm_setflagactive(itut_stext_magicdagger, true);
    StExt_EquipArtifact(StExt_ArtifactIndex_Dagger);
};
func void unequip_itut_stext_magicdagger() { StExt_UnEquipDagger(); };

instance itmi_orestuck(c_item) 
{
	itmi_orestuck_old();
	text[4] = itmi_stext_orestuck_desc;
	text[5] = name_value;
    count[5] = value;
    value = 2500;
};

instance itmi_moonstone(c_item) 
{
	itmi_moonstone_old();
	value = 5000; 
};

instance itmi_silber(c_item) 
{
	itmi_silber_old();
	value = 50; 
};

instance itse_erzfisch(c_item) 
{
	itse_erzfisch_old();
	flags = item_multi | item_mission;
};
instance itse_goldfisch(c_item) 
{
	itse_goldfisch_old();
	flags = item_multi | item_mission;
};
instance itse_ringfisch(c_item) 
{
	itse_ringfisch_old();
	flags = item_multi | item_mission;
};
instance itse_lockpickfisch(c_item) 
{
	itse_lockpickfisch_old();
    flags = item_multi | item_mission;
};

instance itwr_stoned_shivaletter(c_item) 
{
    name = StExt_str_shivaletter_Name;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItWr_Scroll_01.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;	
	text[4] = StExt_str_shivaletter_Desc;
    on_state = use_itwr_stoned_shivaletter;
    inv_animate = 1;
	setitemvartrue(itwr_stoned_shivaletter, bit_item_questitem);
};
func void use_itwr_stoned_shivaletter() 
{
	rx_scrollsizex = 60;
    rx_scrollsizey = 80;
    rx_scrollposx = -1;
    rx_scrollposy = -1;
    rx_scrolltext = StExt_str_shivaletter_Info;
    rx_scrolltexttexture = "NOTE_LETTER_NB_2.TGA";
    rx_isscrollonscreen = 1;
	if(stext_mis_shiva == log_none) 
	{
        stext_mis_shiva = log_running;
        log_createtopic(StExt_topic_shivaletter, log_mission);
        log_settopicstatus(StExt_topic_shivaletter, log_running);
        b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_0);
    };
};

instance itwr_stoned_andriel(c_item) 
{
    name = StExt_str_andrielletter_Name;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItWr_Scroll_01.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;	
	text[4] = StExt_str_andrielletter_Desc;
	text[4] = StExt_str_bosslletter_Desc;
    on_state = use_itwr_stoned_andriel;
    inv_animate = 1;
	setitemvartrue(itwr_stoned_andriel, bit_item_questitem);
};
func void use_itwr_stoned_andriel_callback() 
{
	ai_printred(StExt_Str_EvilBossApears);
	rx_saveparservars();
	wld_spawnnpcrange(hero, stext_andriel, 1, 500.0);
	rx_restoreparservars();
};
func void use_itwr_stoned_andriel() 
{
	if(npc_isplayer(self)) 
	{
		if(!StExt_WorldRandomizer_IsForbidenWp(self))
		{
			rx_playeffect("SPELLFX_MASSDEATH_EXPLOSION", self);	
			snd_play("MFX_FEAR_CAST");
			rx_callbackdialog(hero, 5.0, use_itwr_stoned_andriel_callback);
			npc_removeinvitems(self, itwr_stoned_andriel, 1);
		}
		else
		{
			b_say(self, self, "$IMPOSSIBLEFORME");
		};
    };
};

instance itwr_stoned_duriel(c_item) 
{
    name = StExt_str_durielletter_Name;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItWr_Scroll_01.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;	
	text[4] = StExt_str_durielletter_Desc;
	text[4] = StExt_str_bosslletter_Desc;
    on_state = use_itwr_stoned_duriel;
    inv_animate = 1;
	setitemvartrue(itwr_stoned_duriel, bit_item_questitem);
};
func void use_itwr_stoned_duriel_callback() 
{
	ai_printred(StExt_Str_EvilBossApears);
	rx_saveparservars();
	wld_spawnnpcrange(hero, stext_duriel, 1, 500.0);
	rx_restoreparservars();
};
func void use_itwr_stoned_duriel() 
{
	if(npc_isplayer(self)) 
	{
		if(!StExt_WorldRandomizer_IsForbidenWp(self))
		{
			rx_playeffect("SPELLFX_MASSDEATH_EXPLOSION", self);	
			snd_play("MFX_FEAR_CAST");			
			rx_callbackdialog(hero, 5.0, use_itwr_stoned_duriel_callback);
			npc_removeinvitems(self, itwr_stoned_duriel, 1);
		}
		else
		{
			b_say(self, self, "$IMPOSSIBLEFORME");
		};
    };
};

instance itwr_stoned_mephisto(c_item) 
{
    name = StExt_str_mephistoletter_Name;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItWr_Scroll_01.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;	
	text[4] = StExt_str_mephistoetter_Desc;
	text[4] = StExt_str_bosslletter_Desc;
    on_state = use_itwr_stoned_mephisto;
    inv_animate = 1;
	setitemvartrue(itwr_stoned_mephisto, bit_item_questitem);
};
func void use_itwr_stoned_mephisto_callback() 
{
	ai_printred(StExt_Str_EvilBossApears);
	rx_saveparservars();
	wld_spawnnpcrange(hero, stext_mephisto, 1, 500.0);
	rx_restoreparservars();
};
func void use_itwr_stoned_mephisto() 
{
	if(npc_isplayer(self)) 
	{
		if(!StExt_WorldRandomizer_IsForbidenWp(self))
		{
			rx_playeffect("SPELLFX_MASSDEATH_EXPLOSION", self);	
			snd_play("MFX_FEAR_CAST");
			rx_callbackdialog(hero, 5.0, use_itwr_stoned_mephisto_callback);
			npc_removeinvitems(self, itwr_stoned_mephisto, 1);
			rx_callback(4, StExt_DevilLaughter_Callback);
		}
		else
		{
			b_say(self, self, "$IMPOSSIBLEFORME");
		};
    };
};

instance itwr_stoned_diablo(c_item) 
{
    name = StExt_str_diabloletter_Name;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItWr_Scroll_01.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;	
	text[4] = StExt_str_diabloletter_Desc;
	text[4] = StExt_str_bosslletter_Desc;
    on_state = use_itwr_stoned_diablo;
    inv_animate = 1;
	setitemvartrue(itwr_stoned_diablo, bit_item_questitem);
};
func void use_itwr_stoned_diablo_callback() 
{
	ai_printred(StExt_Str_EvilBossApears);
	rx_saveparservars();
	wld_spawnnpcrange(hero, stext_diablo, 1, 500.0);
	rx_restoreparservars();
};
func void use_itwr_stoned_diablo() 
{
	if(npc_isplayer(self)) 
	{
		if(!StExt_WorldRandomizer_IsForbidenWp(self))
		{
			rx_playeffect("SPELLFX_MASSDEATH_EXPLOSION", self);	
			snd_play("MFX_FEAR_CAST");
			rx_callbackdialog(hero, 5.0, use_itwr_stoned_diablo_callback);
			npc_removeinvitems(self, itwr_stoned_diablo, 1);
			rx_callback(4, StExt_DevilLaughter_Callback);
		}
		else
		{
			b_say(self, self, "$IMPOSSIBLEFORME");
		};
    };
};

instance itwr_stoned_baal(c_item) 
{
    name = StExt_str_baalletter_Name;
    mainflag = item_kat_docs;
    flags = item_mission;
    value = 1;
    visual = "ItWr_Scroll_01.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;	
	text[4] = StExt_str_baalletter_Desc;
	text[4] = StExt_str_bosslletter_Desc;
    on_state = use_itwr_stoned_baal;
    inv_animate = 1;
	setitemvartrue(itwr_stoned_baal, bit_item_questitem);
};
func void use_itwr_stoned_baal_callback() 
{
	ai_printred(StExt_Str_EvilBossApears);
	rx_saveparservars();
	wld_spawnnpcrange(hero, stext_baal, 1, 500.0);
	rx_restoreparservars();
};
func void use_itwr_stoned_baal() 
{
	if(npc_isplayer(self)) 
	{
		if(!StExt_WorldRandomizer_IsForbidenWp(self))
		{
			rx_playeffect("SPELLFX_MASSDEATH_EXPLOSION", self);	
			snd_play("MFX_FEAR_CAST");
			rx_callbackdialog(hero, 5.0, use_itwr_stoned_baal_callback);
			npc_removeinvitems(self, itwr_stoned_baal, 1);
			rx_callback(4, StExt_DevilLaughter_Callback);
		}
		else
		{
			b_say(self, self, "$IMPOSSIBLEFORME");
		};
    };
};

// Random fish
prototype itse_stext_randomfish(c_item)
{
    mainflag = item_kat_none;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItFo_Fish_Sky.3DS";
    material = mat_leather;
    scemename = "MAPSEALED";
    inv_animate = 1;
    description = name;
    text[4] = itse_stext_rndfish_desc;  
	text[5] = name_value;
    count[5] = value;
};

instance itse_stext_poitionfish(itse_stext_randomfish) 
{
    name = itse_stext_poitionfish_name;
    on_state = use_itse_stext_poitionfish;    
};
func void use_itse_stext_poitionfish() { StExt_OpenFish_Alchemy(); };

instance itse_stext_magicfish(itse_stext_randomfish) 
{
    name = itse_stext_magicfish_name;
    on_state = use_itse_stext_magicfish;    
};
func void use_itse_stext_magicfish() { StExt_OpenFish_Magic(); };

instance itse_stext_miscfish(itse_stext_randomfish) 
{
    name = itse_stext_miscfish_name;
    on_state = use_itse_stext_miscfish;    
};
func void use_itse_stext_miscfish() { StExt_OpenFish_Misk(); };

// Random chests
prototype itmi_stext_lootchest(c_item) 
{
	name = itmi_stext_lootchest_name;
    mainflag = item_kat_none;
    flags = item_multi | item_mission;
    value = 3000;
    visual = "ItMi_JeweleryChest_Sky.3DS";
    material = mat_metal;
    scemename = "MAPSEALED";
    description = name;
    text[4] = itmi_stext_lootchest_dsec;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

instance itmi_stext_lootchest_Helm(itmi_stext_lootchest) 
{
	value = 4000;
    on_state = use_itmi_stext_lootchest_Helm;
	text[3] = itmi_stext_lootchest_Helm_dsec;
};
func void use_itmi_stext_lootchest_Helm() { StExt_OpenChest("StExt_ItemClass_List_Helm"); };

instance itmi_stext_lootchest_Armor(itmi_stext_lootchest) 
{
	value = 5000;
    on_state = use_itmi_stext_lootchest_Armor;
	text[3] = itmi_stext_lootchest_Armor_dsec;
};
func void use_itmi_stext_lootchest_Armor() { StExt_OpenChest("StExt_ItemClass_List_FullArmor"); };

instance itmi_stext_lootchest_Pants(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Pants;
	text[3] = itmi_stext_lootchest_Pants_dsec;
};
func void use_itmi_stext_lootchest_Pants() { StExt_OpenChest("StExt_ItemClass_List_Pants"); };

instance itmi_stext_lootchest_Boots(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Boots;
	text[3] = itmi_stext_lootchest_Boots_dsec;
};
func void use_itmi_stext_lootchest_Boots() { StExt_OpenChest("StExt_ItemClass_List_Boots"); };

instance itmi_stext_lootchest_Gloves(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Gloves;
	text[3] = itmi_stext_lootchest_Gloves_dsec;
};
func void use_itmi_stext_lootchest_Gloves() { StExt_OpenChest("StExt_ItemClass_List_Gloves"); };

instance itmi_stext_lootchest_Belt(itmi_stext_lootchest) 
{
	value = 5000;
    on_state = use_itmi_stext_lootchest_Belt;
	text[3] = itmi_stext_lootchest_Belt_dsec;
};
func void use_itmi_stext_lootchest_Belt() { StExt_OpenChest("StExt_ItemClass_List_Belt"); };

instance itmi_stext_lootchest_Amulet(itmi_stext_lootchest) 
{
	value = 5000;
    on_state = use_itmi_stext_lootchest_Amulet;
	text[3] = itmi_stext_lootchest_Amulet_dsec;
};
func void use_itmi_stext_lootchest_Amulet() { StExt_OpenChest("StExt_ItemClass_List_Amulet"); };

instance itmi_stext_lootchest_Ring(itmi_stext_lootchest) 
{
	value = 4000;
    on_state = use_itmi_stext_lootchest_Ring;
	text[3] = itmi_stext_lootchest_Ring_dsec;
};
func void use_itmi_stext_lootchest_Ring() { StExt_OpenChest("StExt_ItemClass_List_Ring"); };

instance itmi_stext_lootchest_Shield(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Shield;
	text[3] = itmi_stext_lootchest_Shield_dsec;
};
func void use_itmi_stext_lootchest_Shield() { StExt_OpenChest("StExt_ItemClass_List_Shield"); };

instance itmi_stext_lootchest_Sword1h(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Sword1h;
	text[3] = itmi_stext_lootchest_Sword1h_dsec;
};
func void use_itmi_stext_lootchest_Sword1h() { StExt_OpenChest("StExt_ItemClass_List_Sword1H"); };

instance itmi_stext_lootchest_Sword2h(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Sword2h;
	text[3] = itmi_stext_lootchest_Sword2h_dsec;
};
func void use_itmi_stext_lootchest_Sword2h() { StExt_OpenChest("StExt_ItemClass_List_Sword2H"); };

instance itmi_stext_lootchest_Axe1h(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Axe1h;
	text[3] = itmi_stext_lootchest_Axe1h_dsec;
};
func void use_itmi_stext_lootchest_Axe1h() { StExt_OpenChest("StExt_ItemClass_List_Axe1H"); };

instance itmi_stext_lootchest_Axe2h(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Axe2h;
	text[3] = itmi_stext_lootchest_Axe2h_dsec;
};
func void use_itmi_stext_lootchest_Axe2h() { StExt_OpenChest("StExt_ItemClass_List_Axe2H"); };

instance itmi_stext_lootchest_Mace1h(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Mace1h;
	text[3] = itmi_stext_lootchest_Mace1h_dsec;
};
func void use_itmi_stext_lootchest_Mace1h() { StExt_OpenChest("StExt_ItemClass_List_Mace1H"); };

instance itmi_stext_lootchest_Mace2h(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Mace2h;
	text[3] = itmi_stext_lootchest_Mace2h_dsec;
};
func void use_itmi_stext_lootchest_Mace2h() { StExt_OpenChest("StExt_ItemClass_List_Mace2H"); };

instance itmi_stext_lootchest_MagicSword(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_MagicSword;
	text[3] = itmi_stext_lootchest_MagicSword_dsec;
};
func void use_itmi_stext_lootchest_MagicSword() { StExt_OpenChest("StExt_ItemClass_List_MagicSword"); };

instance itmi_stext_lootchest_Staff(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Staff;
	text[3] = itmi_stext_lootchest_Staff_dsec;
};
func void use_itmi_stext_lootchest_Staff() { StExt_OpenChest("StExt_ItemClass_List_Staff"); };

instance itmi_stext_lootchest_Rapier(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Rapier;
	text[3] = itmi_stext_lootchest_Rapier_dsec;
};
func void use_itmi_stext_lootchest_Rapier() { StExt_OpenChest("StExt_ItemClass_List_Rapier"); };

instance itmi_stext_lootchest_DexSword(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_DexSword;
	text[3] = itmi_stext_lootchest_DexSword_dsec;
};
func void use_itmi_stext_lootchest_DexSword() { StExt_OpenChest("StExt_ItemClass_List_DexSword"); };

instance itmi_stext_lootchest_Halleberd(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Halleberd;
	text[3] = itmi_stext_lootchest_Halleberd_dsec;
};
func void use_itmi_stext_lootchest_Halleberd() { StExt_OpenChest("StExt_ItemClass_List_Halleberd"); };

instance itmi_stext_lootchest_Spear(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Spear;
	text[3] = itmi_stext_lootchest_Spear_dsec;
};
func void use_itmi_stext_lootchest_Spear() { StExt_OpenChest("StExt_ItemClass_List_Spear"); };

instance itmi_stext_lootchest_Dual(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Dual;
	text[3] = itmi_stext_lootchest_Dual_dsec;
};
func void use_itmi_stext_lootchest_Dual() { StExt_OpenChest("StExt_ItemClass_List_Dual"); };

instance itmi_stext_lootchest_Bow(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Bow;
	text[3] = itmi_stext_lootchest_Bow_dsec;
};
func void use_itmi_stext_lootchest_Bow() { StExt_OpenChest("StExt_ItemClass_List_BowWeapon"); };

instance itmi_stext_lootchest_CrossBow(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_CrossBow;
	text[3] = itmi_stext_lootchest_CrossBow_dsec;
};
func void use_itmi_stext_lootchest_CrossBow() { StExt_OpenChest("StExt_ItemClass_List_CBowWeapon"); };

instance itmi_stext_lootchest_Torso(itmi_stext_lootchest) 
{
    on_state = use_itmi_stext_lootchest_Torso;
	text[3] = itmi_stext_lootchest_Torso_dsec;
};
func void use_itmi_stext_lootchest_Torso() { StExt_OpenChest("StExt_ItemClass_List_Torso"); };

// Boss soul: guaranteed drop from bosses; spend at the StonedTrader to
// empower the equipped weapon's seal/element (dark-souls-like growth).
instance itmi_stext_bosssoul(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_BossSoul_Name;
	description = name;
	text[1] = StExt_Str_BossSoul_Desc;
	value = 5000;
};
