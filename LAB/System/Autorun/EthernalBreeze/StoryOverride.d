// xardas first dialog override
func int dia_xardas_firstexit_condition() 
{
    if(dia_xardas_firstexit_condition_old() && (StExt_SelectedConfigsIndex != StExt_ConfigIndex_None) && (StExt_PreHistoryMode != StExt_PreHistoryMode_Empty)) {
        return true;
    };
	return false;
};

instance stext_dia_xardas_selectdiff(c_info) 
{
    npc = none_100_xardas;
    nr = 100;
    condition = stext_dia_xardas_selectdiff_condition;
    information = stext_dia_xardas_selectdiff_info;
    permanent = false;
    description = Stext_Str_Dia_Xardas_SelectDiff;
};
func int stext_dia_xardas_selectdiff_condition()
{
	if (StExt_SelectedConfigsIndex == StExt_ConfigIndex_None) { return true; };
	return false;
};
func void stext_dia_xardas_selectdiff_info()
{
	ai_printpos_clear();
	info_clearchoices(stext_dia_xardas_selectdiff);
	StExt_CurrentUserConfigs = StExt_EmptyString;
	StExt_SelectedConfigsIndex = StExt_ConfigIndex_None;
	StExt_Info_BuildConfigPresetsChoices(stext_dia_xardas_selectdiff, "Dia_StExt_Xardas_SelectExportedDiff_Action");
	
	//info_addchoice(stext_dia_xardas_selectdiff, StExt_Str_DiffLevel[StExt_ConfigIndex_User], stext_dia_xardas_selectdiff_user);
	//info_addchoice(stext_dia_xardas_selectdiff, StExt_Str_DiffLevel[StExt_ConfigIndex_Hell], stext_dia_xardas_selectdiff_hell);
	//info_addchoice(stext_dia_xardas_selectdiff, StExt_Str_DiffLevel[StExt_ConfigIndex_Nightmare], stext_dia_xardas_selectdiff_nightmare);
	//info_addchoice(stext_dia_xardas_selectdiff, StExt_Str_DiffLevel[StExt_ConfigIndex_Normal], stext_dia_xardas_selectdiff_normal);
};
func void stext_dia_xardas_selectdiff_normal() { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Normal; info_clearchoices(stext_dia_xardas_selectdiff); };
func void stext_dia_xardas_selectdiff_nightmare() { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Nightmare; info_clearchoices(stext_dia_xardas_selectdiff); };
func void stext_dia_xardas_selectdiff_hell() { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Hell; info_clearchoices(stext_dia_xardas_selectdiff); };
func void stext_dia_xardas_selectdiff_user() { StExt_SelectedConfigsIndex = StExt_ConfigIndex_User; info_clearchoices(stext_dia_xardas_selectdiff); };
func void Dia_StExt_Xardas_SelectExportedDiff_Action()
{
	var C_ConfigPreset configPreset;	
	StExt_ParsePresetName(StExt_ChoiceName);
	configPreset = StExt_GetConfigsPreset(StExt_ReturnString);
	
	if(!Hlp_IsNULL(configPreset))
	{
		StExt_CurrentUserConfigs = configPreset.Name;
		if (Hlp_StrCmp(StExt_CurrentUserConfigs, "StExt_ConfigPreset_Normal")) { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Normal; }
		else if (Hlp_StrCmp(StExt_CurrentUserConfigs, "StExt_ConfigPreset_Nightmare")) { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Nightmare; }
		else if (Hlp_StrCmp(StExt_CurrentUserConfigs, "StExt_ConfigPreset_Hell")) { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Hell; }
		else if (Hlp_StrCmp(StExt_CurrentUserConfigs, "StExt_ConfigPreset_User")) { StExt_SelectedConfigsIndex = StExt_ConfigIndex_User; }
		else { StExt_SelectedConfigsIndex = StExt_ConfigIndex_Export; };
		info_clearchoices(stext_dia_xardas_selectdiff);
	}
	else { stext_dia_xardas_selectdiff_info(); };
};

instance stext_dia_xardas_selectprehistory(c_info) 
{
    npc = none_100_xardas;
    nr = 100;
    condition = stext_dia_xardas_selectprehistory_condition;
    information = stext_dia_xardas_selectprehistory_info;
    permanent = false;
    description = Stext_Str_Dia_Xardas_SelectPreHistory;
};
func int stext_dia_xardas_selectprehistory_condition()
{
	if (StExt_PreHistoryMode == StExt_PreHistoryMode_Empty) { return true; };
	return false;
};

func string StExt_BuildPreHistoryString(var int index)
{
	var string name;
	var string desc;
	name = StExt_Array_GetString("StExt_Str_Prehistory", index);
	desc = StExt_Array_GetString("StExt_Str_PrehistoryDesc", index);
	return concatstrings(name, desc);
};

func void stext_dia_xardas_selectprehistory_info()
{
	ai_printpos_clear();
	info_clearchoices(stext_dia_xardas_selectprehistory);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_Str_Random, stext_dia_xardas_selectprehistory_random);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_None), stext_dia_xardas_selectprehistory_none);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_OldCamp), stext_dia_xardas_selectprehistory_oldcamp);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_NewCamp), stext_dia_xardas_selectprehistory_newcamp);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_PsiCamp), stext_dia_xardas_selectprehistory_psicamp);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_FireMage), stext_dia_xardas_selectprehistory_firemage);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_WaterMage), stext_dia_xardas_selectprehistory_watermage);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_Guru), stext_dia_xardas_selectprehistory_guru);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_Necro), stext_dia_xardas_selectprehistory_necro);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_Baron), stext_dia_xardas_selectprehistory_baron);
	info_addchoice(stext_dia_xardas_selectprehistory, StExt_BuildPreHistoryString(StExt_PreHistoryMode_Miner), stext_dia_xardas_selectprehistory_miner);
};

func void stext_dia_xardas_selectprehistory_miner()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_Miner;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_none()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_None;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_guru()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_Guru;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_watermage()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_WaterMage;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_firemage()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_FireMage;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_psicamp()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_PsiCamp;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_newcamp()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_NewCamp;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_oldcamp()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_OldCamp;	
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_baron()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_Baron;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_necro()
{
	StExt_PreHistoryMode = StExt_PreHistoryMode_Necro;
	info_clearchoices(stext_dia_xardas_selectprehistory);
};
func void stext_dia_xardas_selectprehistory_random()
{
	var int random;
	random = hlp_random(8);
	if(random == 0) { stext_dia_xardas_selectprehistory_watermage(); }
	else if(random == 1) { stext_dia_xardas_selectprehistory_firemage(); }
	else if(random == 2) { stext_dia_xardas_selectprehistory_psicamp(); }
	else if(random == 3) { stext_dia_xardas_selectprehistory_newcamp(); }
	else if(random == 4) { stext_dia_xardas_selectprehistory_oldcamp(); }	
	else if(random == 5) { stext_dia_xardas_selectprehistory_baron(); }
	else if(random == 6) { stext_dia_xardas_selectprehistory_necro(); }	
	else { stext_dia_xardas_selectprehistory_guru(); };
};

func void StExt_ApplyPrehistoryBonus_Callback()
{
	if (StExt_PreHistoryMode == StExt_PreHistoryMode_None) { b_giveplayerxp(1000); }
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_OldCamp)
	{
		createinvitems(hero, itmw_stext_starting_1h_sword, 1);
		createinvitems(hero, itrw_stext_starting_crossbow, 1);
		createinvitems(hero, itrw_bolt, 10 + hlp_random(10));
		createinvitems(hero, itpo_health_01, 1 + hlp_random(3));
		b_raiseattribute_bonus(hero, atr_strength, 2);
		b_raiseattribute_bonus(hero, atr_dexterity, 1);
		b_raiseattribute_bonus(hero, atr_hitpoints_max, 10);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_NewCamp)
	{
		createinvitems(hero, itmw_stext_starting_1h_sword, 1);
		createinvitems(hero, itrw_stext_starting_bow, 1);
		createinvitems(hero, itrw_arrow, 10 + hlp_random(10));
		createinvitems(hero, itpo_health_01, 1 + hlp_random(3));
		b_raiseattribute_bonus(hero, atr_strength, 1);
		b_raiseattribute_bonus(hero, atr_dexterity, 2);
		b_raiseattribute_bonus(hero, atr_hitpoints_max, 10);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_PsiCamp)
	{
		createinvitems(hero, itmw_stext_starting_2h_sword, 1);
		createinvitems(hero, itpo_health_01, 1 + hlp_random(2));
		createinvitems(hero, itpo_stamina, 1 + hlp_random(2));
		b_raiseattribute_bonus(hero, atr_strength, 2);
		b_raiseattribute_bonus(hero, atr_hitpoints_max, 10);
		b_raiseattribute_bonus(hero, atr_mana_max, 3);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_FireMage)
	{
		createinvitems(hero, itpo_mana_01, 1 + hlp_random(2));
		createinvitems(hero, itsc_firebolt, hlp_random(5) + 3);
		createinvitems(hero, itsc_instantfireball, hlp_random(2) + 1);
		createinvitems(hero, itmw_stext_starting_magicstaff, 1);
		rx_changeint(1);
		countlearnspell += 1;
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_WaterMage)
	{
		createinvitems(hero, itpo_mana_01, 2 + hlp_random(2));
		createinvitems(hero, itsc_icebolt, hlp_random(5) + 3);
		createinvitems(hero, itsc_icelance, hlp_random(2) + 1);
		createinvitems(hero, itmw_stext_starting_magicstaff, 1);
		rx_changeint(2);
		b_raiseattribute_bonus(hero, atr_mana_max, 7);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_Guru)
	{
		createinvitems(hero, itpo_mana_01, 1 + hlp_random(2));
		createinvitems(hero, itsc_berzerk, hlp_random(5) + 3);
		createinvitems(hero, itsc_windfist, hlp_random(2) + 1);
		createinvitems(hero, itmw_stext_starting_magicstaff, 1);
		b_raiseattribute_bonus(hero, atr_mana_max, 15);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_Necro)
	{		
		createinvitems(hero, itpo_mana_01, 2 + hlp_random(2));
		createinvitems(hero, itsc_deathbolt, hlp_random(5) + 3);
		createinvitems(hero, itsc_sumgobskel, hlp_random(2) + 1);
		createinvitems(hero, itmw_stext_starting_magicstaff, 1);
		countlearnspell += 1;
		b_raiseattribute_bonus(hero, atr_mana_max, 5);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_Baron)
	{
		createinvitems(hero, itmw_stext_starting_1h_sword, 1);
		createinvitems(hero, itrw_stext_starting_crossbow, 1);
		createinvitems(hero, itrw_bolt, 10 + hlp_random(10));
		createinvitems(hero, itpo_health_01, 1 + hlp_random(3));
		createinvitems(hero, itmi_gold, 250 + hlp_random(100));
		b_raiseattribute_bonus(hero, atr_hitpoints_max, 15);
	}
	else if (StExt_PreHistoryMode == StExt_PreHistoryMode_Miner)
	{
		createinvitems(hero, itmw_2h_axe_l_01, 1);
		createinvitems(hero, itmi_nugget, 7 + hlp_random(10));
		createinvitems(hero, itpo_stamina, 2 + hlp_random(2));
		atr_stamina_max = atr_stamina_max + 1;
		atr_stamina = atr_stamina + 10;
		npc_settalentskill(hero, npc_talent_stamina, atr_stamina_max);
		b_raiseattribute_bonus(hero, atr_hitpoints_max, 10);
	};
};

func void StExt_ApplyPrehistoryBonus() { rx_callback(10.0, StExt_ApplyPrehistoryBonus_Callback); };

func void dia_xardas_firstexit_gothic() 
{
	dia_xardas_firstexit_gothic_old();
	StExt_ApplyPrehistoryBonus();
};

func void dia_xardas_firstexit_nightmare()
{
	dia_xardas_firstexit_nightmare_old();
	StExt_ApplyPrehistoryBonus();
};

//=================================================================================
//						Craftsman dialogs overrides
//=================================================================================
func int StExt_Craftsman_GetStudyPrice()
{
	var int price;
	price = 10000;
	if (StExt_Config_EducationMoneyCostMult == 100) { return price; };	
	price = StExt_GetPercentFromValue(price, StExt_Config_EducationMoneyCostMult);
	if (price < 1000) { price = 1000; };
	return price;
};

func string StExt_Craftsman_BuildRequiredGoldStr() 
{
    var string str;
    str = concatstrings(StExt_Craftsman_Str_RequiredGoldStart, inttostring(StExt_Craftsman_GetStudyPrice()));
    str = concatstrings(str, StExt_Craftsman_Str_RequiredGoldEnd);
    return str;
};

// *** Bosper teach ***

func int dia_bosper_makebow_condition() 
{
    if(StExt_CanLearn_Bosper) { return true; };
	return dia_bosper_makebow_condition_old();
};

func int dia_bosper_sellbows_condition() 
{
    if((StExt_CanLearn_Bosper == true) && (StExt_Craftsman_CanSellItems == true)) { return true; };
	return dia_bosper_sellbows_condition_old();
};

instance dia_bosper_StExt_LearnCraft(c_info) 
{
    npc = vlk_413_bosper;
    nr = 300;
    condition = dia_bosper_StExt_LearnCraft_condition;
    information = dia_bosper_StExt_LearnCraft_info;
    permanent = true;
    description = StExt_Craftsman_Str_LearnCraft;
};

func int dia_bosper_StExt_LearnCraft_condition() 
{
    if((StExt_CanLearn_Bosper == false) && (player_isapprentice != app_bosper) && (player_isapprentice != app_none)) {
        return true;
    };
};

func void dia_bosper_StExt_LearnCraft_info()
{
	if(npc_hasitems(hero, itmi_gold) >= StExt_Craftsman_GetStudyPrice())
	{
		npc_removeinvitems(hero, itmi_gold, StExt_Craftsman_GetStudyPrice());
		StExt_CanLearn_Bosper = true;
		ai_printbonus(StExt_Craftsman_Str_BosperCraftLearned);
	}
	else { ai_printred(StExt_Craftsman_BuildRequiredGoldStr()); };
};

func int pc_psionicquest_templatedialog_798_condition() 
{
    if(StExt_CanLearn_Bosper && ((!player_talent_takeanimaltrophy[13]) || (!player_talent_takeanimaltrophy) || (!player_talent_takeanimaltrophy[1]) || (!knowhowtomakearrows))) { return true; };
	return pc_psionicquest_templatedialog_798_condition_old();
};

func int pc_psionicquest_templatedialog_799_condition() 
{
	if(StExt_CanLearn_Bosper) { return true; };
	return pc_psionicquest_templatedialog_799_condition_old();
};

func int pc_psionicquest_templatedialog_301_condition() 
{
    if ((kapitel >= 3) && (hero.level >= 30) && (rx_totalbosperskincount >= 50) && StExt_CanLearn_Bosper) {
        return true;
    };
	return pc_psionicquest_templatedialog_301_condition_old();
};

// *** Harad terach *** 

func int dia_harad_teachsmith_condition() 
{
    if(player_isapprentice == app_harad || StExt_CanLearn_Harad) 
	{
        if((player_talent_smith == false) || (player_talent_smith[9] == false) || (player_talent_smith[10] == false) || (player_talent_smith[11] == false) || (player_talent_smith[12] == false) || (player_talent_smith[36] == false) || (player_talent_smith[37] == false) || (player_talent_smith[38] == false) || (player_talent_smith[39] == false)) {
            return true;
        };
    };
};

func int dia_harad_sellblades_condition() 
{
    if((StExt_CanLearn_Harad == true) && (StExt_Craftsman_CanSellItems == true)) { return true; };
	return dia_harad_sellblades_condition_old();
};

instance dia_harad_StExt_LearnCraft(c_info) 
{
    npc = vlk_412_harad;
    nr = 300;
    condition = dia_harad_StExt_LearnCraft_condition;
    information = dia_harad_StExt_LearnCraft_info;
    permanent = true;
    description = StExt_Craftsman_Str_LearnCraft;
};

func int dia_harad_StExt_LearnCraft_condition() 
{
    if((StExt_CanLearn_Harad == false) && (player_isapprentice != app_harad) && (player_isapprentice != app_none)) {
        return true;
    };
};

func void dia_harad_StExt_LearnCraft_info()
{
	if(npc_hasitems(hero, itmi_gold) >= StExt_Craftsman_GetStudyPrice())
	{
		npc_removeinvitems(hero, itmi_gold, StExt_Craftsman_GetStudyPrice());
		StExt_CanLearn_Harad = true;
		haradbuymiscweap = true;
		ai_printbonus(StExt_Craftsman_Str_HaradCraftLearned);
	}
	else { ai_printred(StExt_Craftsman_BuildRequiredGoldStr()); };
};

func int pc_psionicquest_templatedialog_800_condition() 
{
	if(StExt_CanLearn_Harad) { return true; };
    return pc_psionicquest_templatedialog_800_condition_old();
};

// Give Harad key
func int pc_psionicquest_templatedialog_300_condition() 
{
    if ((kapitel >= 3) && (hero.level >= 30) && (rx_sworddone >= 70) && (talentcount_smith >= 100) && (mis_haradorcwar == log_success) && StExt_CanLearn_Harad) {
        return true;
    };
	return pc_psionicquest_templatedialog_300_condition_old();
};

// *** Constantino teach *** 

func int dia_constantino_teach_condition() 
{
    if(StExt_CanLearn_Constantino == true) { return true; };
	return dia_constantino_teach_condition_old();
};
func int dia_constantino_mushroomsrunning_condition() 
{
    if(StExt_CanLearn_Constantino == true) { return true; };
	return dia_constantino_mushroomsrunning_condition_old();
};

func void dia_constantino_mushroomsrunning_info() 
{
	dia_constantino_mushroomsrunning_info_old();
	if((StExt_CanLearn_Constantino == true) && (StExt_Craftsman_CanSellItems == true) && (player_isapprentice != app_constantino))
	{
        if((npc_hasitems(other, itpo_perm_stamina) > 0) || (npc_hasitems(other, itpo_perm_mana) > 0) || (npc_hasitems(other, itpo_perm_mana_craft) > 0) || (npc_hasitems(other, itpo_perm_health) > 0) || (npc_hasitems(other, itpo_perm_dex) > 0) || (npc_hasitems(other, itpo_perm_str) > 0)) {
            info_addchoice(dia_constantino_mushroomsrunning, StExt_Craftsman_CanStudy_Constantino_SellElixirs, dia_constantino_mushroomsrunning_sell_perm_potion);
        };
        if((npc_hasitems(other, itpl_mana_herb_03) > 0) || (npc_hasitems(other, itpl_health_herb_03) > 0) || (npc_hasitems(other, itpl_dex_herb_01) > 0) || (npc_hasitems(other, itpl_strength_herb_01) > 0) || (npc_hasitems(other, itpl_speed_herb_01) > 0) || (npc_hasitems(other, itpl_temp_herb) > 0) || (npc_hasitems(other, itpl_perm_herb) > 0) || (npc_hasitems(other, itpl_super_herb) > 0)) {
            info_addchoice(dia_constantino_mushroomsrunning, StExt_Craftsman_CanStudy_Constantino_SellPlants, dia_constantino_mushroomsrunning_sell_rare_plants);
        };
    };
};

instance dia_constantino_StExt_LearnCraft(c_info) 
{
    npc = vlk_417_constantino;
    nr = 300;
    condition = dia_constantino_StExt_LearnCraft_condition;
    information = dia_constantino_StExt_LearnCraft_info;
    permanent = true;
    description = StExt_Craftsman_Str_LearnCraft;
};

func int dia_constantino_StExt_LearnCraft_condition() 
{
    if((StExt_CanLearn_Constantino == false) && (player_isapprentice != app_constantino) && (player_isapprentice != app_none)) {
        return true;
    };
};

func void dia_constantino_StExt_LearnCraft_info()
{
	if(npc_hasitems(hero, itmi_gold) >= StExt_Craftsman_GetStudyPrice())
	{
		npc_removeinvitems(hero, itmi_gold, StExt_Craftsman_GetStudyPrice());
		StExt_CanLearn_Constantino = true;
		ai_printbonus(StExt_Craftsman_Str_ConstantionoCraftLearned);
	}
	else { ai_printred(StExt_Craftsman_BuildRequiredGoldStr()); };
};

// Give Constantino key
func int pc_psionicquest_templatedialog_299_condition() 
{
    if ((kapitel >= 3) && (hero.level >= 30) && (mis_constantino_lostkey == log_success) && (talentcount_alchemy >= 100) && 
		((rx_used_poperm_str_created >= 10) || (rx_used_poperm_dex_created >= 10) || (rx_used_poperm_mana_created >= 10) || (rx_used_poperm_health_created >= 10)) && StExt_CanLearn_Constantino) {
        return true;
    };
	return pc_psionicquest_templatedialog_299_condition_old();
};

//=================================================================================

// Trade overrides
func int dia_baaltyon_trade_condition() { return (StExt_HeroCanLearnAdvanceMagic() || dia_baaltyon_trade_condition_old()); };
func int dia_xardas_trade_condition() { return ((StExt_ModInitialized != false) && (StExt_HeroCanLearnAdvanceMagic() || dia_xardas_trade_condition_old())); };
func void dia_addon_cronos_adw_trade_info() 
{
	if(crontr == false) 
	{
        createinvitems(self, itwr_addon_runemaking_kdw_circ1, 1);
        createinvitems(self, itwr_addon_runemaking_kdw_circ2, 1);
        createinvitems(self, itwr_addon_runemaking_kdw_circ3, 1);
        createinvitems(self, itwr_addon_runemaking_kdw_circ4, 1);
        createinvitems(self, itwr_addon_runemaking_kdw_circ5, 1);
        createinvitems(self, itwr_addon_runemaking_kdw_circ6, 1);
        crontr = true;
    };
	dia_addon_cronos_adw_trade_info_old();
};

// Learn demonology
func int dia_xardas_ndm_teachdemonolog_condition() 
{
	if (StExt_CanLearnDemon) { return true; };
	return dia_xardas_ndm_teachdemonolog_condition_old();
};
func int dia_kreol_ndm_teachdemonolog_condition() 
{
	if (StExt_CanLearnDemon) { return true; };
	return dia_kreol_ndm_teachdemonolog_condition_old();
};

func int dia_kreol_runen_condition() 
{
    if(StExt_CanLearnNecro || StExt_CanLearnDarkmage || StExt_CanLearnDeath || StExt_CanLearnDemon) { return true; };
	return dia_kreol_runen_condition_old();
};
func int dia_xardas_runen_condition() 
{
	if(StExt_CanLearnNecro || StExt_CanLearnDarkmage || StExt_CanLearnDeath || StExt_CanLearnDemon) { return true; };
	return dia_xardas_runen_condition_old();
};

func void dia_xardas_runen_info() 
{
    ai_output(other, self, "DIA_Parlan_TEACH_15_00");
    info_clearchoices(dia_xardas_runen);
    info_addchoice(dia_xardas_runen, dialog_back, dia_xardas_runen_back);	

	if((npc_gettalentskill(other, npc_talent_demonolog) >= 1) || StExt_CanLearnDemon) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Demon, dia_xardas_runen_dem); };
	if(((!rx_isdarkmage()) && (!rx_isnecrosummoner())) || StExt_CanLearnDeath || StExt_DefaultKdmFix)
	{		
		if(npc_gettalentskill(other, npc_talent_mage) >= 6) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Death6, dia_xardas_runen_6); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 5) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Death5, dia_xardas_runen_5); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 4) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Death4, dia_xardas_runen_4); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 3) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Death3, dia_xardas_runen_3); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 2) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Death2, dia_xardas_runen_2); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 1) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Death1, dia_xardas_runen_1); };
    };
    if(rx_isnecrosummoner() || StExt_CanLearnNecro) 
	{
        if(npc_gettalentskill(other, npc_talent_mage) >= 6) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Necro6, dia_xardas_runen_6_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 5) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Necro5, dia_xardas_runen_5_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 4) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Necro4, dia_xardas_runen_4_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 3) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Necro3, dia_xardas_runen_3_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 2) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Necro2, dia_xardas_runen_2_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 1) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Necro1, dia_xardas_runen_1_sum); };
    };
    if(rx_isdarkmage() || StExt_CanLearnDarkmage) 
	{
        if(npc_gettalentskill(other, npc_talent_mage) >= 6) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Dark6, dia_xardas_runen_6_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 5) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Dark5, dia_xardas_runen_5_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 4) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Dark4, dia_xardas_runen_4_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 3) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Dark3, dia_xardas_runen_3_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 2) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Dark2, dia_xardas_runen_2_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 1) { info_addchoice(dia_xardas_runen, StExt_Str_XardasRunen_Dark1, dia_xardas_runen_1_dm); };
    };
};

func void dia_kreol_runen_info() 
{
    ai_output(other, self, "DIA_Parlan_TEACH_15_00");
    info_clearchoices(dia_kreol_runen);
    info_addchoice(dia_kreol_runen, dialog_back, dia_kreol_runen_back);
	
	if(((!rx_isdarkmage()) && (!rx_isnecrosummoner())) || (StExt_CanLearnDemon))
	{		
		if((npc_gettalentskill(other, npc_talent_demonolog) >= 1) && (player_talent_runes[40] == false)) {
			info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Demon, dia_kreol_runen_dem);
		};
	};
	if(((!rx_isdarkmage()) && (!rx_isnecrosummoner())) || StExt_CanLearnDeath || StExt_DefaultKdmFix)
	{		
		if(npc_gettalentskill(other, npc_talent_mage) >= 6) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Death6, dia_kreol_runen_6); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 5) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Death5, dia_kreol_runen_5); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 4) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Death4, dia_kreol_runen_4); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 3) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Death3, dia_kreol_runen_3); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 2) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Death2, dia_kreol_runen_2); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 1) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Death1, dia_kreol_runen_1); };
    }
    if(rx_isnecrosummoner() || StExt_CanLearnNecro) 
	{
        if(npc_gettalentskill(other, npc_talent_mage) >= 6) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Necro6, dia_kreol_runen_6_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 5) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Necro5, dia_kreol_runen_5_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 4) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Necro4, dia_kreol_runen_4_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 3) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Necro3, dia_kreol_runen_3_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 2) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Necro2, dia_kreol_runen_2_sum); };
        if(npc_gettalentskill(other, npc_talent_mage) >= 1) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Necro1, dia_kreol_runen_1_sum); };
    }
    if(rx_isdarkmage() || StExt_CanLearnDarkmage) 
	{
        if(npc_gettalentskill(other, npc_talent_mage) >= 6) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Dark6, dia_kreol_runen_6_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 5) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Dark5, dia_kreol_runen_5_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 4) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Dark4, dia_kreol_runen_4_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 3) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Dark3, dia_kreol_runen_3_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 2) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Dark2, dia_kreol_runen_2_dm); };
		if(npc_gettalentskill(other, npc_talent_mage) >= 1) { info_addchoice(dia_kreol_runen, StExt_Str_XardasRunen_Dark1, dia_kreol_runen_1_dm); };
    };	
};

// Some necro fixes
func void dia_xardas_makemekdm_info() {
	StExt_DefaultKdmFix = true;
	dia_xardas_makemekdm_info_old();
};

func void dia_kreol_kill_pals_done_info() 
{
	dia_kreol_kill_pals_done_info_old();
	if (npc_hasitems(other, itru_necrobolt) <= 0) { createinvitems(other, itru_necrobolt, 1); };
};

func int pc_psionicquest_templatedialog_889_condition() { return (rx_isnecrosummoner() || StExt_CanLearnNecro || (StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 3)); };

// Named demons (khub and dkPet) summons
func int pc_psionicquest_templatedialog_306_condition() {
    if((StExt_Talent_Level[StExt_MasteryIndex_Demon] > 0) && (!rx_demonhub_learned)) { return true; };
	return pc_psionicquest_templatedialog_306_condition_old();
};
func int pc_psionicquest_templatedialog_481_condition() {
	if(StExt_Talent_Level[StExt_MasteryIndex_Demon] > 0) { return true; };
    return pc_psionicquest_templatedialog_481_condition_old();
};

// Learn fire runes override
func int pc_psionicquest_templatedialog_394_condition() {
    if((StExt_CanLearnFiremage == true) && (npc_gettalentskill(other, npc_talent_mage) > 0)) {
		return ((!rx_skill_dot1) || (!rx_skill_dot2) || (!rx_skill_dotplus1) || (!rx_skill_dotnewdamage) || (!rx_skill_dotrepeat));
    };
	return pc_psionicquest_templatedialog_394_condition_old();
};
func int dia_parlan_teach_condition() {
    if(StExt_CanLearnFiremage == true) { return true; };
	return dia_parlan_teach_condition_old();
};
func int dia_hyglas_talent_firebolt_condition() {
    if((StExt_CanLearnFiremage == true) && (player_talent_runes[19] == false)) { return true; };
	return dia_hyglas_talent_firebolt_condition_old();
};

// Learn guru runes override
func int pc_psionicquest_templatedialog_546_condition() 
{
    if(StExt_CanLearnGuru) { return true; };
	return pc_psionicquest_templatedialog_546_condition_old();
};
func int dia_baalnamib_runen_condition() {
    if(StExt_CanLearnGuru) { return true; };
	return dia_baalnamib_runen_condition_old();
};

// Teach light magic runes
func int dia_gornatot_teachtplrunes_condition() 
{
	if((StExt_CanLearnPaladin) && ((!psiwaycombat) || (!psiwayheal))) { return true; };
	return dia_gornatot_teachtplrunes_condition_old();
};

func int dia_gornatot_teachtplnextrunes_condition() 
{
	if((StExt_CanLearnPaladin) && ((psiwaycombat) || (psiwayheal))) { return true; };
	return dia_gornatot_teachtplnextrunes_condition_old();
};

func void dia_albrecht_canteach_info() 
{
	dia_albrecht_canteach_info_old();
	if(StExt_CanLearnPaladin) { albrecht_teachmana = true; };
};

// Talisan new robe sell
instance dia_taliasan_stext_buyrobe(c_info) 
{
    npc = vlk_6027_taliasan;
    nr = 950;
    condition = dia_taliasan_stext_buyrobe_condition;
    information = dia_taliasan_stext_buyrobe_info;
    permanent = false;
    description = stext_str_buyrobe;
};

func int dia_taliasan_stext_buyrobe_condition() {
    if((mis_taliasanfinefood == log_success) && (npc_hasitems(other, itmi_gold) >= 1500)) {
        return true;
    };
};

func void dia_taliasan_stext_buyrobe_info() {
    b_giveinvitemswithremove(hero, self, itmi_gold, 1500);
    b_giveinvitems(self, other, itar_stext_mage_novise, 1);
    ai_stopprocessinfos(self);
};

func int dia_taliasan_circle_condition() { return taliasanteachmagic; };

func void dia_taliasan_circle_info() 
{
	dia_taliasan_circle_info_old();
	if (StExt_HeroCanLearnAdvanceMagic())
	{
		if((npc_gettalentskill(hero, npc_talent_mage) == 3) && (rx_canlearnmagiccirclenext(4) == true)) {
			info_addchoice(dia_taliasan_circle, b_buildlearnstringforcircles(print_learncircle_4, 4), dia_taliasan_circle_4);
		}
		else if((npc_gettalentskill(hero, npc_talent_mage) == 4) && (rx_canlearnmagiccirclenext(5) == true)) {
			info_addchoice(dia_taliasan_circle, b_buildlearnstringforcircles(print_learncircle_5, 5), dia_taliasan_circle_5);
		};
	};
};

func void dia_taliasan_circle_4() 
{
    b_teachmagiccircle(self, other, 4);
    info_clearchoices(dia_taliasan_circle);
};
func void dia_taliasan_circle_5() 
{
    b_teachmagiccircle(self, other, 5);
    info_clearchoices(dia_taliasan_circle);
};

// Luck bonus for thorben quest
func void dia_thorben_zustimmung_info() 
{
	if((vatras_segen == true) && ((daron_segen == true) || (isgaroth_segen == true) || (other.guild == gil_kdf)) && (mis_thorben_getblessings != log_success))
	{
		StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 5;
		ai_printbonus(StExt_Str_print_luckinfobonus5);
	};
	dia_thorben_zustimmung_info_old();
};

// Luck bonuses for bandits heads
func void rx_form_banditsheads() 
{
	rx_form_banditsheads_old();
    if ((npc_hasitems(hero, itmi_addon_head_common) >= 1) && !rx_roadoftrialsactive()) 
	{
        info_addchoice(dia_andre_auslieferung, StExt_Str_Dia_SellBanditHead, dia_andre_banditscommon);
    };
};

func void dia_andre_banditscommon() 
{
	var string str;
	var int headsCount; headsCount = npc_hasitems(other, itmi_addon_head_common);
	dia_andre_banditscommon_old();
	
	if (headsCount > 0)
	{
		StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += headsCount;	
		if (headsCount == 1) { ai_printbonus(StExt_Str_print_luckinfobonus); }
		else
		{
			StExt_FormatIntToString(headsCount, StExt_Value_DisplayType_Permille);
			str = concatstrings(StExt_ReturnString, StExt_Str_Print_LuckinfobonusAny);
			str = concatstrings("+", str);
			ai_printbonus(str);
		};
	};
};

func void dia_andre_auslieferung_brago()
{
	dia_andre_auslieferung_brago_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_kiko()
{
	dia_andre_auslieferung_kiko_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_deep()
{
	dia_andre_auslieferung_deep_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_haart()
{
	dia_andre_auslieferung_haart_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_mountain()
{
	dia_andre_auslieferung_mountain_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_mountain2()
{
	dia_andre_auslieferung_mountain2_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_bloodwyn()
{
	dia_andre_auslieferung_bloodwyn_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_dexter()
{
	dia_andre_auslieferung_dexter_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_nestor()
{
	dia_andre_auslieferung_nestor_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_kriks()
{
	dia_andre_auslieferung_kriks_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_bart()
{
	dia_andre_auslieferung_bart_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_skiron()
{
	dia_andre_auslieferung_skiron_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_brutus()
{
	dia_andre_auslieferung_brutus_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};
func void dia_andre_auslieferung_rocks()
{
	dia_andre_auslieferung_rocks_old();
	StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
	ai_printbonus(StExt_Str_print_luckinfobonus);
};

// Random fish story
instance pc_stext_halvor_openfish(c_info) 
{
    npc = vlk_469_halvor;
    condition = pc_stext_halvor_openfish_condition;
    information = pc_stext_halvor_openfish_info;
    important = false;
    permanent = true;
    nr = 7;
    description = stext_str_halvor_openfish;
};
func int pc_stext_halvor_openfish_condition() { return ((betrayal_halvor == false) && (!halvor_ausgeliefert)); };

func int StExt_OpenFish_Halvor_Alchemy(var int index)
{
	StExt_OpenFish_Alchemy();
	return (index <= StExt_OpenFishCallback_potionfishCount);
};
func int StExt_OpenFish_Halvor_Misc(var int index)
{
	StExt_OpenFish_Misk();
	return (index <= StExt_OpenFishCallback_miscfishCount);
};
func int StExt_OpenFish_Halvor_Magic(var int index)
{
	StExt_OpenFish_Magic();
	return (index <= StExt_OpenFishCallback_magicfishCount);
};

var int StExt_OpenFishCallback_potionfishCount;
var int StExt_OpenFishCallback_magicfishCount;
var int StExt_OpenFishCallback_miscfishCount;
var int StExt_OpenFishCallback_erzfischCount;
var int StExt_OpenFishCallback_goldfischCount;
var int StExt_OpenFishCallback_ringfischCount;
var int StExt_OpenFishCallback_lockpickfischCount;
func void StExt_OpenFishCallback()
{
	if(StExt_OpenFishCallback_potionfishCount > 0) { StExt_While(StExt_OpenFish_Halvor_Alchemy); };
	if(StExt_OpenFishCallback_magicfishCount > 0) { StExt_While(StExt_OpenFish_Halvor_Magic); };
	if(StExt_OpenFishCallback_miscfishCount > 0) { StExt_While(StExt_OpenFish_Halvor_Misc); };	
	if(StExt_OpenFishCallback_erzfischCount > 0) { b_playerfinditem(itmi_nugget, StExt_OpenFishCallback_erzfischCount); };
	if(StExt_OpenFishCallback_goldfischCount > 0) { b_playerfinditem(itmi_gold, StExt_OpenFishCallback_goldfischCount * 50); };
	if(StExt_OpenFishCallback_ringfischCount > 0) { b_playerfinditem(itmi_ringgold, StExt_OpenFishCallback_ringfischCount); };
	if(StExt_OpenFishCallback_lockpickfischCount > 0) { b_playerfinditem(itke_lockpick, StExt_OpenFishCallback_lockpickfischCount * 3); };
};

func void pc_stext_halvor_openfish_info() 
{
	var int potionfishCount;
	var int magicfishCount;
	var int miscfishCount;	
	var int erzfischCount;
	var int goldfischCount;
	var int ringfischCount;
	var int lockpickfischCount;
	
	potionfishCount = 0;
	magicfishCount = 0;
	miscfishCount = 0;
	erzfischCount = 0;
	goldfischCount = 0;
	ringfischCount = 0;
	lockpickfischCount = 0;

    if((npc_hasitems(other, itse_erzfisch) == 0) && (npc_hasitems(other, itse_goldfisch) == 0) && (npc_hasitems(other, itse_ringfisch) == 0) && (npc_hasitems(other, itse_lockpickfisch) == 0) &&
		(npc_hasitems(other, itse_stext_miscfish) == 0) && (npc_hasitems(other, itse_stext_magicfish) == 0) && (npc_hasitems(other, itse_stext_poitionfish) == 0)) 
	{ 
		ai_printred(stext_str_halvor_openfish_nofish); 
	}
    else 
	{
        potionfishCount = npc_hasitems(other, itse_stext_poitionfish);
		magicfishCount = npc_hasitems(other, itse_stext_magicfish);
		miscfishCount = npc_hasitems(other, itse_stext_miscfish);		
		erzfischCount = npc_hasitems(other, itse_erzfisch);
		goldfischCount = npc_hasitems(other, itse_goldfisch);
		ringfischCount = npc_hasitems(other, itse_ringfisch);
		lockpickfischCount = npc_hasitems(other, itse_lockpickfisch);
		
		if(miscfishCount > 1000) { miscfishCount = 1000; };
		if(magicfishCount > 1000) { magicfishCount = 1000; };
		if(potionfishCount > 1000) { potionfishCount = 1000; };
		
		npc_removeinvitems(other, itse_stext_magicfish, magicfishCount);
		npc_removeinvitems(other, itse_stext_poitionfish, potionfishCount);
		npc_removeinvitems(other, itse_stext_miscfish, miscfishCount);		
		npc_removeinvitems(other, itse_erzfisch, erzfischCount);
		npc_removeinvitems(other, itse_goldfisch, goldfischCount);
		npc_removeinvitems(other, itse_ringfisch, ringfischCount);
		npc_removeinvitems(other, itse_lockpickfisch, lockpickfischCount);		
		
		StExt_OpenFishCallback_potionfishCount = potionfishCount;
		StExt_OpenFishCallback_magicfishCount = magicfishCount;
		StExt_OpenFishCallback_miscfishCount = miscfishCount;		
		StExt_OpenFishCallback_erzfischCount = erzfischCount;
		StExt_OpenFishCallback_goldfischCount = goldfischCount;
		StExt_OpenFishCallback_ringfischCount = ringfischCount;
		StExt_OpenFishCallback_lockpickfischCount = lockpickfischCount;
		
		ai_stopprocessinfos(self);
		rx_callbacknpc(other, 1, StExt_OpenFishCallback);
        snd_play("LevelUP");
    };
};

instance dia_stext_wasili_junktrade(c_info) 
{
    npc = bau_907_wasili;
    nr = 1;
    condition = dia_stext_wasili_junktrade_condition;
    information = dia_stext_wasili_junktrade_info;
    permanent = true;
    trade = true;
    description = StExt_Str_Wasili_JunkTrade;
};
func int dia_stext_wasili_junktrade_condition() { return mis_wasili_bringoldcoin; };
func void dia_stext_wasili_junktrade_info() 
{
    npc_clearinv(self);
    b_givetradeinv(self);
};

instance dia_stext_sagitta_sellpotions_trade(c_info) 
{
    npc = bau_980_sagitta;
    condition = dia_stext_sagitta_sellpotions_condition;
    information = dia_stext_sagitta_sellpotions_info;
    permanent = true;
    description = StExt_Str_Saghita_PotionSell;
};

func int dia_stext_sagitta_sellpotions_condition() { return (npc_knowsinfo(other, dia_sagitta_hallo)); };

func void dia_stext_sagitta_sellpotions_info_callback() 
{
	var C_IntArray array;
    rx_craft_playersales_clearproductlist();
	
	array = StExt_Struct_Alloc(StExt_SizeOf_Int * 1);
	if (Hlp_IsNULL(array)) { return; };
	
	StExt_Struct_Write(array, StExt_SizeOf_Int * 0, StExt_ItemClass_Consumable_Potion);
	StExt_BuildEnchntedItemsSellForm(array, 1);
	StExt_Struct_Free(array);
    rx_opencraft_playersales(self);

};
func void dia_stext_sagitta_sellpotions_info() 
{
    if (c_bodystatecontains(self, bs_sit)) 
	{
        ai_standup(self);
        ai_turntonpc(self, other);
    };	
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_sagitta_sellpotions_info_callback);
};

func int dia_taliasan_teachdoitsc2_condition() { return howcanmakerune_itsc; };

func void dia_taliasan_teachdoitsc2_info() 
{
    info_clearchoices(dia_taliasan_teachdoitsc2);
    info_addchoice(dia_taliasan_teachdoitsc2, dialog_back, dia_taliasan_teachdoitsc2_back);

	if (StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_BasicScrolls])
	{
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_AdvancedScrolls]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_AdvancedScrolls), dia_stext_taliasan_teachdoitsc_AdvancedScrolls);
		};
		if(StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_AdvancedScrolls] && !StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_DoubleScrolls]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_DoubleScrolls), dia_stext_taliasan_teachdoitsc_DoubleScrolls);
		};
		if(StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_AdvancedScrolls] && !StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_MasterScrolls]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_MasterScrolls), dia_stext_taliasan_teachdoitsc_MasterScrolls);
		};
		
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Fire]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Fire), dia_stext_taliasan_teachdoitsc_Fire);
		};		
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Ice]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Ice), dia_stext_taliasan_teachdoitsc_Ice);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Electro]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Electro), dia_stext_taliasan_teachdoitsc_Electro);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Air]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Air), dia_stext_taliasan_teachdoitsc_Air);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Earth]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Earth), dia_stext_taliasan_teachdoitsc_Earth);
		};		
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Light]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Light), dia_stext_taliasan_teachdoitsc_Light);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Dark]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Dark), dia_stext_taliasan_teachdoitsc_Dark);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Death]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Death), dia_stext_taliasan_teachdoitsc_Death);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Life]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Life), dia_stext_taliasan_teachdoitsc_Life);
		};		
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Golem]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Golem), dia_stext_taliasan_teachdoitsc_Golem);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Demon]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Demon), dia_stext_taliasan_teachdoitsc_Demon);
		};
		if(!StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Necro]) {
			info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_Necro), dia_stext_taliasan_teachdoitsc_Necro);
		};
	}
	else {
		info_addchoice(dia_taliasan_teachdoitsc2, StExt_BuildScrollmakingSkillLearnText(StExt_ScrollmakingSkillIndex_BasicScrolls), dia_stext_taliasan_teachdoitsc_BasicScrolls);
	};
};

func void dia_stext_taliasan_teachdoitsc_base(var int skillId)
{
	var int lp;
	var int gold;
	var int canLearn;
	if ((skillId <= StExt_Null) || (skillId >= StExt_ScrollmakingSkillIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("dia_stext_taliasan_teachdoitsc_base(var int skillId) -> Perk index out of range! Index: ", inttostring(skillId)));
		dia_taliasan_teachdoitsc2_info();
		return;
	};
	
	canLearn = true;
	lp = StExt_GetScrollmakingSkillLpCost(skillId);
	gold = StExt_GetScrollmakingSkillCost(skillId);
	
	if (StExt_SncMode != 3)
	{
		if (hero.lp < lp)
		{
			ai_printred(concatstrings(StExt_Str_NeedLp, inttostring(lp)));
			canLearn = false;
		};
	};
	if (npc_hasitems(hero, itmi_gold) < gold)
	{
		ai_printred(concatstrings(StExt_Str_NeedGold, inttostring(gold)));
		canLearn = false; 
	};
	
	if(canLearn) { StExt_LearnScrollmakingSkill(skillId); };
	dia_taliasan_teachdoitsc2_info();
};

func void dia_stext_taliasan_teachdoitsc_BasicScrolls() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_BasicScrolls); };
func void dia_stext_taliasan_teachdoitsc_AdvancedScrolls() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_AdvancedScrolls); };
func void dia_stext_taliasan_teachdoitsc_MasterScrolls() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_MasterScrolls); };
func void dia_stext_taliasan_teachdoitsc_DoubleScrolls() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_DoubleScrolls); };
func void dia_stext_taliasan_teachdoitsc_Fire() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Fire); };
func void dia_stext_taliasan_teachdoitsc_Ice() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Ice); };
func void dia_stext_taliasan_teachdoitsc_Electro() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Electro); };
func void dia_stext_taliasan_teachdoitsc_Air() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Air); };
func void dia_stext_taliasan_teachdoitsc_Earth() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Earth); };
func void dia_stext_taliasan_teachdoitsc_Light() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Light); };
func void dia_stext_taliasan_teachdoitsc_Dark() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Dark); };
func void dia_stext_taliasan_teachdoitsc_Death() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Death); };
func void dia_stext_taliasan_teachdoitsc_Life() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Life); };
func void dia_stext_taliasan_teachdoitsc_Golem() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Golem); };
func void dia_stext_taliasan_teachdoitsc_Demon() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Demon); };
func void dia_stext_taliasan_teachdoitsc_Necro() { dia_stext_taliasan_teachdoitsc_base(StExt_ScrollmakingSkillIndex_Necro); };

func int StExt_CalcDynamicSellPrice(var int price)
{
	var int percent;
	percent = 10 + StExt_GetPercentFromValue(rhetorikskillvalue[1], 50);
	price = StExt_GetPercentFromValue(price, percent);
	if (price <= 0) { price = 1; };
	return price;
};

instance dia_stext_bosper_sellmissles_trade(c_info) 
{
    npc = vlk_413_bosper;
    condition = dia_stext_bosper_sellmissles_condition;
    information = dia_stext_bosper_sellmissles_info;
    permanent = true;
    description = StExt_Str_Bosper_MisslesSell;
};

func int dia_stext_bosper_sellmissles_condition() { return bosperbuymace; };

func void dia_stext_bosper_sellmissles_info_callback() 
{
	rx_craft_playersales_clearproductlist();
	rx_craft_playersales_addtoproductlist("itrw_arrow", StExt_CalcDynamicSellPrice(1));
	rx_craft_playersales_addtoproductlist("itrw_bolt", StExt_CalcDynamicSellPrice(1));
	rx_craft_playersales_addtoproductlist("itrw_explosivebolt", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itrw_crushingbolt", StExt_CalcDynamicSellPrice(2));
	rx_craft_playersales_addtoproductlist("itrw_sharpbolt", StExt_CalcDynamicSellPrice(2));
	rx_craft_playersales_addtoproductlist("itrw_piercingbolt", StExt_CalcDynamicSellPrice(2));
	rx_craft_playersales_addtoproductlist("itrw_holybolt", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itrw_addon_magicbolt", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itrw_explosivearrow", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itrw_addon_magicarrow", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itrw_addon_firearrow", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itrw_holyarrow", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itrw_poisonarrow", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itmi_arrowtip", StExt_CalcDynamicSellPrice(1));
	rx_craft_playersales_addtoproductlist("itmi_kerarrowtip", StExt_CalcDynamicSellPrice(1));
	rx_craft_playersales_addtoproductlist("itmi_bolttip", StExt_CalcDynamicSellPrice(1));
	rx_craft_playersales_addtoproductlist("itmi_bowrope_01", StExt_CalcDynamicSellPrice(1));
	rx_craft_playersales_addtoproductlist("itmi_bowrope_02", StExt_CalcDynamicSellPrice(2));
	rx_craft_playersales_addtoproductlist("itmi_bowrope_03", StExt_CalcDynamicSellPrice(6));
	rx_craft_playersales_addtoproductlist("itmi_bowrope_04", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_bowrope_05", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_bokcorpse", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itmi_ysuocorpse", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itmi_evecorpse", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itmi_vyzcorpse", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_boktree", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_ysuotree", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itmi_vyztree", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_evetree", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itmi_powder_smoke", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_powder_fire", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_powder_explosion", StExt_CalcDynamicSellPrice(25));	
	rx_craft_playersales_addtoproductlist("itmi_powder_acid", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_powder_magic", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_powder_undead", StExt_CalcDynamicSellPrice(25));
    rx_opencraft_playersales(self);
};
func void dia_stext_bosper_sellmissles_info() 
{
    if (c_bodystatecontains(self, bs_sit)) 
	{
        ai_standup(self);
        ai_turntonpc(self, other);
    };	
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_bosper_sellmissles_info_callback);
};

instance dia_stext_jora_sellmisk_trade(c_info) 
{
    npc = vlk_408_jora;
    condition = dia_stext_jora_sellmisk_condition;
    information = dia_stext_jora_sellmisk_info;
    permanent = true;
    description = StExt_Str_Jora_MiskSell;
};

func int dia_stext_jora_sellmisk_condition() { return true; };

func void dia_stext_jora_sellmisk_info_callback() 
{
	rx_craft_playersales_clearproductlist();	
	rx_craft_playersales_addtoproductlist("itmi_pliers", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_anvilpliers", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_hammer", StExt_CalcDynamicSellPrice(4));
	rx_craft_playersales_addtoproductlist("itmi_scoop", StExt_CalcDynamicSellPrice(2));
	rx_craft_playersales_addtoproductlist("itmi_pan", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itmi_panfull", StExt_CalcDynamicSellPrice(4));
	rx_craft_playersales_addtoproductlist("itmi_broom", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itmi_lute", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_brush", StExt_CalcDynamicSellPrice(4));
	rx_craft_playersales_addtoproductlist("itmw_kirka_new", StExt_CalcDynamicSellPrice(30));
	rx_craft_playersales_addtoproductlist("itmw_2h_axe_l_01", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itmi_chopper", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itmw_1h_axe_woodchoppin", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_meetknife", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itlstorch", StExt_CalcDynamicSellPrice(2));
	rx_craft_playersales_addtoproductlist("itmi_saw", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmw_stonehammer", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itmw_1h_mace_l_04", StExt_CalcDynamicSellPrice(75));
	rx_craft_playersales_addtoproductlist("itmw_1h_g3_smithhammer_01", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmw_1h_g4_axesmall_01", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmw_2h_bau_axe", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_iecello", StExt_CalcDynamicSellPrice(75));
	rx_craft_playersales_addtoproductlist("itmi_iedrum", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_iedrumscheit", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_iedrumstick", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_iedudelblau", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itmi_ieharfe", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itmi_ielaute", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itmi_iedudelgelb", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itmi_rake", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itmw_2h_scythe", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itmw_1h_mace_l_01", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmw_1h_bau_axe", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_sextant", StExt_CalcDynamicSellPrice(50));
    rx_opencraft_playersales(self);
};
func void dia_stext_jora_sellmisk_info() 
{
    if (c_bodystatecontains(self, bs_sit)) 
	{
        ai_standup(self);
        ai_turntonpc(self, other);
    };	
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_jora_sellmisk_info_callback);
};

instance dia_stext_harad_sellcoal_trade(c_info) 
{
    npc = vlk_412_harad;
    condition = dia_stext_harad_sellcoal_condition;
    information = dia_stext_harad_sellcoal_info;
    permanent = true;
    description = StExt_Str_Harad_CoalSell;
};

func int dia_stext_harad_sellcoal_condition() { return true; };

func void dia_stext_harad_sellcoal_info_callback() 
{
	rx_craft_playersales_clearproductlist();	
	rx_craft_playersales_addtoproductlist("itmiswordraw", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itmiswordrawhot_1", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itmiswordblade_1", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itmiswordbladehot", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itmi_orestuck", StExt_CalcDynamicSellPrice(750));
	rx_craft_playersales_addtoproductlist("itmi_ironstuck", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itmi_snugget", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_nugget", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itmi_sulfur", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itmi_quartz", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itmi_rockcrystal", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_coal", StExt_CalcDynamicSellPrice(9));
	rx_craft_playersales_addtoproductlist("itmi_pitch", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itmi_darkpearl", StExt_CalcDynamicSellPrice(100));
	rx_craft_playersales_addtoproductlist("itmi_aquamarine", StExt_CalcDynamicSellPrice(30));
	rx_craft_playersales_addtoproductlist("itmi_addon_whitepearl", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itmi_quicksilver", StExt_CalcDynamicSellPrice(150));
    rx_opencraft_playersales(self);
};
func void dia_stext_harad_sellcoal_info() 
{
    if (c_bodystatecontains(self, bs_sit)) 
	{
        ai_standup(self);
        ai_turntonpc(self, other);
    };	
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_harad_sellcoal_info_callback);
};

func int dia_kardif_sellmeat_condition() 
{
	rx_setdialogdescription(dia_kardif_sellmeat, StExt_Str_Kardif_FoodSell);
    return dia_kardif_sellmeat_condition_old();
};
func void dia_kardif_sellmeat_info_form_craft_callback() 
{
    rx_craft_playersales_clearproductlist();
    rx_craft_playersales_addtoproductlist("ItFoMuttonRaw", StExt_CalcDynamicSellPrice(4));
	rx_craft_playersales_addtoproductlist("itfomutton", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itfo_fish_gebraten", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itfo_fish", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itfo_water", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itfo_bread", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itfo_StExt_PineApple", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Cocount", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Banana", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Pear", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itfo_honey", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itfo_wineberrys", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itfo_meatbugragout", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_nashsoup", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_schildkroetesoup", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itfo_cheese", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_milk", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itfo_meetsoup", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itfo_fishsoup", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itfo_sausage", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itfo_bacon", StExt_CalcDynamicSellPrice(30));
	rx_craft_playersales_addtoproductlist("itfo_pilzsuppe", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_fleischwanzenragout", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_stew", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itfo_apple", StExt_CalcDynamicSellPrice(5));
	rx_craft_playersales_addtoproductlist("itat_meatbugflesh", StExt_CalcDynamicSellPrice(3));
	rx_craft_playersales_addtoproductlist("itat_meatbugflesh_gebraten", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itfoschildkroeteraw", StExt_CalcDynamicSellPrice(7));
    rx_opencraft_playersales(self);
};

instance dia_stext_kardif_sellbooze_trade(c_info) 
{
    npc = vlk_431_kardif;
    condition = dia_stext_kardif_sellbooze_condition;
    information = dia_stext_kardif_sellbooze_info;
    permanent = true;
    description = StExt_Str_Kardif_BoozeSell;
};
func int dia_stext_kardif_sellbooze_condition() { return dia_kardif_sellmeat_condition_old(); };
func void dia_stext_kardif_sellbooze_info_callback() 
{
	rx_craft_playersales_clearproductlist();	
	rx_craft_playersales_addtoproductlist("itfo_StExt_Cider", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Mead", StExt_CalcDynamicSellPrice(20));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Vodka", StExt_CalcDynamicSellPrice(30));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Whiskey", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Cognac", StExt_CalcDynamicSellPrice(40));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Brendy", StExt_CalcDynamicSellPrice(50));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Absinth", StExt_CalcDynamicSellPrice(75));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Tequila", StExt_CalcDynamicSellPrice(65));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Scotch", StExt_CalcDynamicSellPrice(40));
	rx_craft_playersales_addtoproductlist("itfo_StExt_Grappa", StExt_CalcDynamicSellPrice(40));
	rx_craft_playersales_addtoproductlist("itfo_wine", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_addon_grog", StExt_CalcDynamicSellPrice(7));
	rx_craft_playersales_addtoproductlist("itfo_addon_loushammer", StExt_CalcDynamicSellPrice(10));
	rx_craft_playersales_addtoproductlist("itfo_addon_schlafhammer", StExt_CalcDynamicSellPrice(25));
	rx_craft_playersales_addtoproductlist("itfo_addon_rum", StExt_CalcDynamicSellPrice(15));
	rx_craft_playersales_addtoproductlist("itfo_beer", StExt_CalcDynamicSellPrice(6));
	rx_craft_playersales_addtoproductlist("itfo_booze", StExt_CalcDynamicSellPrice(4));
	rx_craft_playersales_addtoproductlist("itfo_booze_ext", StExt_CalcDynamicSellPrice(40));
	rx_craft_playersales_addtoproductlist("itfo_addon_schnellerhering", StExt_CalcDynamicSellPrice(15));
    rx_opencraft_playersales(self);
};
func void dia_stext_kardif_sellbooze_info() 
{
    if (c_bodystatecontains(self, bs_sit)) 
	{
        ai_standup(self);
        ai_turntonpc(self, other);
    };	
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_kardif_sellbooze_info_callback);
};

instance dia_stext_dragomir_sellcrossbows(c_info) 
{
    npc = bau_983_dragomir;
    nr = 995;
    condition = dia_stext_dragomir_sellcrossbows_condition;
    information = dia_stext_dragomir_sellcrossbows_info;
    permanent = true;
    description = StExt_Str_Dragomir_CBowSell;
};
func int dia_stext_dragomir_sellcrossbows_condition() { return (mis_dragomirsarmbrust == log_success); };

func void dia_stext_dragomir_sellcrossbows_info_callback()
{
	rx_craft_playersales_clearproductlist();
	StExt_BuildItemsSellForm(item_kat_ff, item_crossbow, false, 5 + StExt_GetPercentFromValue(rhetorikskillvalue[1], 25));
	rx_opencraft_playersales(self);
};

func void dia_stext_dragomir_sellcrossbows_info() 
{
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_dragomir_sellcrossbows_info_callback);   
};

instance dia_stext_matteo_selljews(c_info) 
{
    npc = vlk_416_matteo;
    nr = 995;
    condition = dia_stext_matteo_selljews_condition;
    information = dia_stext_matteo_selljews_info;
    permanent = true;
    description = StExt_Str_Matteo_JewSell;
};
func int dia_stext_matteo_selljews_condition() { return npc_knowsinfo(hero, dia_matteo_jewerly); };

func void dia_stext_matteo_selljews_info_callback()
{
	rx_craft_playersales_clearproductlist();
	StExt_BuildItemsSellForm(item_kat_magic, item_amulet, false, 5 + StExt_GetPercentFromValue(rhetorikskillvalue[1], 25));
	StExt_BuildItemsSellForm(item_kat_magic, item_ring, false, 5 + StExt_GetPercentFromValue(rhetorikskillvalue[1], 25));
	StExt_BuildItemsSellForm(item_kat_magic, item_belt, false, 5 + StExt_GetPercentFromValue(rhetorikskillvalue[1], 25));
	rx_opencraft_playersales(self);
};

func void dia_stext_matteo_selljews_info() 
{
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.05, dia_stext_matteo_selljews_info_callback);   
};
