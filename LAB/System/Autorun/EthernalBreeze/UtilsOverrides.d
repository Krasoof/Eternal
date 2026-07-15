func void b_clearusetrophy() 
{
	b_clearusetrophy_old();
	StExt_ArtifactEquipped = false;
};

func int rx_heroismage() 
{
    if(StExt_CorruptionPath == StExt_Corruption_Mage) { return true; };
	if (StExt_CanLearnNecro || StExt_CanLearnDemon || StExt_CanLearnGuru || StExt_CanLearnWatermage || StExt_CanLearnFiremage || StExt_CanLearnDarkmage) {
		return true;
	};
	if ((StExt_Talent_Level[StExt_MasteryIndex_Fire] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Ice] >= StExt_TalentLevel_Expert) ||
		(StExt_Talent_Level[StExt_MasteryIndex_Electric] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Air] >= StExt_TalentLevel_Expert) ||
		(StExt_Talent_Level[StExt_MasteryIndex_Earth] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Light] >= StExt_TalentLevel_Expert) ||
		(StExt_Talent_Level[StExt_MasteryIndex_Dark] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Death] >= StExt_TalentLevel_Expert) ||		
		(StExt_Talent_Level[StExt_MasteryIndex_Life] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Golem] >= StExt_TalentLevel_Expert) ||
		(StExt_Talent_Level[StExt_MasteryIndex_Demon] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Necro] >= StExt_TalentLevel_Expert) ||
		(StExt_Talent_Level[StExt_MasteryIndex_Dark] >= StExt_TalentLevel_Expert) || (StExt_Talent_Level[StExt_MasteryIndex_Death] >= StExt_TalentLevel_Expert) ||
		(StExt_Talent_Level[StExt_MasteryIndex_Shaman] >= StExt_TalentLevel_Expert)) { return true; };
    return rx_heroismage_old();
};

func int rx_isdarkmage() 
{
	if(StExt_IsFakeDarkmage == true) { return true; };
    return rx_isdarkmage_old();
};

func int rx_isdarkmagedialog() 
{
	if(StExt_IsFakeDarkmage && rx_darkmagedialogskill) { return true; };
    return rx_isdarkmagedialog_old();
};

func int rx_isnecrosummoner() 
{
	if(StExt_CanLearnNecro == true) { return true; };
    return rx_isnecrosummoner_old();
};

func int getsummoncountmax() 
{
	rx_summoncountmax = StExt_SummonsCountBase + StExt_PcStats[StExt_PcStats_Index_MaxSummonsCount];
	if (rx_godgiftsummonmax) { rx_summoncountmax += 1; };
	if (rx_necrosummonaddskilllearned) { rx_summoncountmax += 1; };
    return rx_summoncountmax;
};

func void b_raiserealfighttalentpercent(var c_npc oth, var int talent, var int percent) 
{
    if(talent == npc_talent_1h) 
	{
        oth.aivar[84] = oth.aivar[84] + percent;
		oth.aivar[84] = StExt_ValidateValueMin(oth.aivar[84], 0);
    }
    else if(talent == npc_talent_2h) 
	{
        oth.aivar[85] = oth.aivar[85] + percent;
		oth.aivar[85] = StExt_ValidateValueMin(oth.aivar[85], 0);
    }
    else if(talent == npc_talent_bow) 
	{
        oth.aivar[86] = oth.aivar[86] + percent;
		oth.aivar[86] = StExt_ValidateValueMin(oth.aivar[86], 0);
    }
    else if(talent == npc_talent_crossbow) 
	{
        oth.aivar[87] = oth.aivar[87] + percent;
		oth.aivar[87] = StExt_ValidateValueMin(oth.aivar[87], 0);
    };
};

func void b_addfightskill(var c_npc slf, var int talent, var int percent) 
{
	var int talentWas;
	
	if (talent == npc_talent_1h) { talentWas = slf.hitchance[1]; }
	else if (talent == npc_talent_2h) { talentWas = slf.hitchance[2]; }
	else if (talent == npc_talent_bow) { talentWas = slf.hitchance[3]; }
	else if (talent == npc_talent_crossbow) { talentWas = slf.hitchance[4]; };
	
	b_addfightskill_old(slf, talent, percent); 

	if (talent == npc_talent_1h) 
	{ 
		slf.hitchance[1] = talentWas + percent; 
		slf.hitchance[1] = StExt_ValidateValueMin(slf.hitchance[1], 0);
	}
	else if (talent == npc_talent_2h) 
	{ 
		slf.hitchance[2] = talentWas + percent;
		slf.hitchance[2] = StExt_ValidateValueMin(slf.hitchance[2], 0);		
	}
	else if (talent == npc_talent_bow) 
	{ 
		slf.hitchance[3] = talentWas + percent;
		slf.hitchance[3] = StExt_ValidateValueMin(slf.hitchance[3], 0);
		rx_setnpcvar(slf, aivrx_npc_atr_bow, slf.hitchance[3]);
	}
	else if (talent == npc_talent_crossbow) 
	{
		slf.hitchance[4] = talentWas + percent;
		slf.hitchance[4] = StExt_ValidateValueMin(slf.hitchance[4], 0);
		rx_setnpcvar(slf, aivrx_npc_atr_crossbow, slf.hitchance[4]);	
	};	
};

func void rx_restorestamina(var int count) 
{
	if(hero.attribute <= 0) { return; };
	StExt_UpdateUncaperStat(StExt_UncaperStatIndex_StamMax);
	rx_restorestamina_old(count);    
};

func void rx_restorestaminapercent(var int count) 
{
	if(hero.attribute <= 0) { return; };
	StExt_UpdateUncaperStat(StExt_UncaperStatIndex_StamMax);
	rx_restorestaminapercent_old(count);  
};

func void rx_regencommonfunc() 
{
	StExt_UpdateUncaperStat(StExt_UncaperStatIndex_StamMax);
	rx_regencommonfunc_old();
};

func void StExt_SaveParserVars() { };
func void StExt_RestoreParserVars() { };

func int rx_cangetint(var c_npc slf) { return true; };

func void rx_giverhit(var int count) 
{
    var string concattext;
	rhetorikskillvalue[1] = StExt_ValidateValueRange(rhetorikskillvalue[1] + count, 0, StExt_RhetorikMaxLevel);
	concattext = concatstrings(StExt_Str_GiveRhit_Rhit, inttostring(count));
	concattext = concatstrings(concattext, StExt_Str_GiveRhit_Total);
	concattext = concatstrings(concattext, inttostring(rhetorikskillvalue[1]));
	concattext = concatstrings(concattext, ")");
	ai_printbonus(concattext);
};

func void b_playerfinditem_stext(var int itm, var int amount) 
{
    var string concattext;
    var string itemname;
	if (itm == StExt_Null)
	{
		StExt_PrintDebugStack("b_playerfinditem_stext() -> item id is null!");
		return;
	};
	if (amount <= 0) 
	{ 
		StExt_PrintDebugStack("b_playerfinditem_stext() -> amount is less than zero!");
		return; 
	};

	createinvitems(hero, itm, amount);	
	if (hlp_isvaliditem(item)) { itemname = item.name; }
	else 
	{ 
		StExt_PrintDebugStack("b_playerfinditem_stext() -> item is null! (set unknown name)");
		itemname = StExt_UnknownString; 
	};
	
	if (itm == itmi_gold) 
	{
		concattext = concatstrings(inttostring(amount), print_golderhalten);
		ai_printiteminfo("", concattext, 3, 1);
		snd_play("Geldbeutel");
	}
	else if (amount == 1) 
	{
		concattext = concatstrings(itemname, print_addon_erhalten);
		ai_printiteminfo("", concattext, 3, 1);
	}
	else 
	{
		concattext = concatstrings(inttostring(amount), print_itemserhalten);
		concattext = concatstrings(concattext, " (");
		concattext = concatstrings(concattext, itemname);
		concattext = concatstrings(concattext, ")");
		ai_printiteminfo("", concattext, 3, 1);
	};    
};