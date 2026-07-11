func int StExt_GetArtifactBonusSource(var int type)
{
	if (type == StExt_ArtifactIndex_Grimoir) { return StExt_PcStat_Source_Grimoir; }
	else if (type == StExt_ArtifactIndex_Dagger) { return StExt_PcStat_Source_Dagger; };
	return StExt_Null;
};

func void StExt_EquipArtifact(var int type)
{
	var int bonusSource;
	if ((type <= StExt_ArtifactIndex_None) || (type >= StExt_ArtifactIndex_Max))
	{
		StExt_PrintDebugStack("StExt_EquipArtifact(var int type) -> artifact type incorrect!");
		return;
	};
	rx_playeffect("spellfx_incovation_violet", hero);
	bonusSource = StExt_GetArtifactBonusSource(type);
	StEtx_ApplyPcStatsSource(bonusSource);
	StExt_ArtifactEquipped = type;
};

func void StExt_UnEquipArtifact(var int type)
{
	var int bonusSource;
	if ((type <= StExt_ArtifactIndex_None) || (type >= StExt_ArtifactIndex_Max))
	{
		StExt_PrintDebugStack("StExt_UnEquipArtifact(var int type) -> artifact type incorrect!");
		return;
	};
	b_clearusetrophy();
	bonusSource = StExt_GetArtifactBonusSource(type);
	StEtx_RemovePcStatsSource(bonusSource);
	StExt_ArtifactEquipped = StExt_ArtifactIndex_None;
	ext_removefromslot(hero, "BIP01 PELVIS");
};

func int StExt_GetResetArtifactCost(var int type) 
{
	var int cost;
	var int levelPrice;
	if ((type <= StExt_ArtifactIndex_None) || (type >= StExt_ArtifactIndex_Max))
	{
		StExt_PrintDebugStack("StExt_GetResetArtifactCost(var int type) -> artifact type incorrect!");
		return StExt_Null;
	};
	if (type == StExt_ArtifactIndex_Grimoir) { levelPrice = 250 * StExt_Grimoir_Level; }
	else if (type == StExt_ArtifactIndex_Dagger) { levelPrice = 250 * StExt_Dagger_Level; };
	cost = 500 + levelPrice;
	return cost; 
};

func void StExt_ResetArtifact(var int type)
{
	if ((type <= StExt_ArtifactIndex_None) || (type >= StExt_ArtifactIndex_Max))
	{
		StExt_PrintDebugStack("StExt_ResetArtifact(var int type) -> artifact type incorrect!");
		return;
	};
	
	rx_playeffect("spellfx_incovation_white", hero);
	if (type == StExt_ArtifactIndex_Grimoir) 
	{ 
		StExt_Grimoir_Lp = StExt_Grimoir_Level;
		StExt_Array_FillInt("StExt_PcStats_Grimoir", 0);
		StExt_Array_FillInt("StExt_Grimoir_Skill", 0);
		StExt_Array_FillInt("StExt_Grimoir_Skill_Value", 0);
		StExt_Array_FillInt("StExt_Grimoir_Skill_Cooldown", 0);
	}
	else if (type == StExt_ArtifactIndex_Dagger) 
	{
		StExt_Dagger_Lp = StExt_Dagger_Level; 
		StExt_Array_FillInt("StExt_PcStats_Dagger", 0);
		StExt_Array_FillInt("StExt_Dagger_Skill", 0);
		StExt_Array_FillInt("StExt_Dagger_Skill_Value", 0);
		StExt_Array_FillInt("StExt_Dagger_Skill_Cooldown", 0);
	};
	npc_removeinvitems(hero, itmi_gold, StExt_GetResetArtifactCost(type));
};

func void StExt_UnEquipGrimoir()
{
	var c_item curitem;
	curitem = hlp_getslotitem(hero, "BIP01 PELVIS");
	
    if((hlp_isvaliditem(curitem) == true) && ((hlp_isitem(curitem, itut_stext_magicbook) == true) || (hlp_isitem(curitem, itut_stext_magicbook_2) == true)))
	{
        npc_unequipitem(hero, curitem);
		ext_removefromslot(hero, "BIP01 PELVIS");
		itm_setflagactive(curitem, false);
    };
	itm_setflagactive(itut_stext_magicbook, false);
	StExt_UnEquipArtifact(StExt_ArtifactIndex_Grimoir);
};

func void StExt_UnEquipDagger()
{
	var c_item curitem;
	curitem = hlp_getslotitem(hero, "BIP01 PELVIS");
    if((hlp_isvaliditem(curitem) == true) && ((hlp_isitem(curitem, itut_stext_magicdagger) == true) || (hlp_isitem(curitem, itut_stext_magicdagger_2) == true)))
	{
        npc_unequipitem(hero, curitem);
		ext_removefromslot(hero, "BIP01 PELVIS");
		itm_setflagactive(curitem, false);
    };
	itm_setflagactive(itut_stext_magicdagger, false);
	StExt_UnEquipArtifact(StExt_ArtifactIndex_Dagger);
};

func void StExt_ProcessArtifactExp(var int exp)
{
	var string artExpStr;
	if (exp <= 0) { return; };
	exp = StExt_GetPercentFromValueWithMin(exp, StExt_Config_ArtifactsExpMult, 1);
	
	artExpStr = " +";
	artExpStr = concatstrings(artExpStr, inttostring(exp));
	artExpStr = concatstrings(artExpStr, StExt_Str_Config_ArtifactExp);
	
	if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Grimoir) 
	{
		StExt_Grimoir_ExpNow += exp;
		artExpStr = concatstrings(StExt_Str_Grimmoire_Name, artExpStr);
		if (StExt_Config_Artifact_ShowExpMessage) { ai_printexp(artExpStr); };

		if (StExt_Grimoir_ExpNow >= StExt_Grimoir_ExpNext)
		{
			StExt_Grimoir_Lp += 1;
			StExt_Grimoir_Level += 1;
			StExt_Grimoir_ExpNow -= StExt_Grimoir_ExpNext;
			StExt_Grimoir_ExpNext = StExt_Grimoir_ExpNext + (StExt_Grimoir_Level * StExt_ArtifactExpPerLevel);
			ai_printbonus(StExt_Str_Grimoir_NewLevel);
		};
	}
	else if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Dagger) 
	{
		StExt_Dagger_ExpNow += exp;
		artExpStr = concatstrings(StExt_Str_Dagger_Name, artExpStr);
		if (StExt_Config_Artifact_ShowExpMessage) { ai_printexp(artExpStr); };
		
		if (StExt_Dagger_ExpNow >= StExt_Dagger_ExpNext)
		{
			StExt_Dagger_Lp += 1;
			StExt_Dagger_Level += 1;
			StExt_Dagger_ExpNow -= StExt_Dagger_ExpNext;
			StExt_Dagger_ExpNext = StExt_Dagger_ExpNext + (StExt_Dagger_Level * StExt_ArtifactExpPerLevel);
			ai_printbonus(StExt_Str_Dagger_NewLevel);
		};
	};
};

func void StExt_InitializeArtifacts()
{
	StExt_Grimoir_ExpNext = StExt_ArtifactExpPerLevel;
	StExt_Dagger_ExpNext = StExt_ArtifactExpPerLevel;
};

func void StExt_AddAtrifactStat(var int artifactId, var string statName, var int statValue,
	var int itm1, var int itm2, var int itm3, var int count1, var int count2, var int count3)
{
	var int statId;
	var int statNow;
	var int lp;
	var int nuggetId;
	var int nuggetCount;
	var string message;
	var string artStatsArray;
	
	if(!StExt_SymbolExist(statName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_AddAtrifactStat() -> incorrect statName: ", statName));
		return;
	};
	
	statId = StExt_GetIntValueByName(statName);
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_AddAtrifactStat() -> incorrect statId: ", inttostring(statId)));
		return;
	};
	
	if (artifactId == StExt_ArtifactIndex_Grimoir) 
	{
		artStatsArray = "StExt_PcStats_Grimoir"; 
		lp = StExt_Grimoir_Lp;
	}
	else if (artifactId == StExt_ArtifactIndex_Dagger)	
	{
		artStatsArray = "StExt_PcStats_Dagger"; 
		lp = StExt_Dagger_Lp;
	}
	else
	{
		StExt_PrintDebugStack("StExt_AddAtrifactStat() -> incorrect artifact type!");
		return;
	};
	
	if(lp < 1)
	{
		ai_printred(concatstrings(StExt_Str_AtrifactNotEnoughtLp, inttostring(1)));
		return;
	};
	
	nuggetId  = StExt_GetInstanceIdByName("itmi_nugget");
	nuggetCount = 10;
	
	nuggetCount = StExt_GetPercentFromValueWithMin(nuggetCount, StExt_Config_ArtifactsUpgradeCostMult, 1);
	count1 = StExt_GetPercentFromValueWithMin(count1, StExt_Config_ArtifactsUpgradeCostMult, 1);
	count2 = StExt_GetPercentFromValueWithMin(count2, StExt_Config_ArtifactsUpgradeCostMult, 1);
	count3 = StExt_GetPercentFromValueWithMin(count3, StExt_Config_ArtifactsUpgradeCostMult, 1);
	
	if (StExt_CheckCraftResources(nuggetId, itm1, itm2, itm3, StExt_Null, nuggetCount, count1, count2, count3, StExt_Null))
	{
		if (artifactId == StExt_ArtifactIndex_Grimoir) { StExt_Grimoir_Lp -= 1; }
		else if (artifactId == StExt_ArtifactIndex_Dagger) { StExt_Dagger_Lp -= 1; };		
		StExt_UseCraftResources(nuggetId, itm1, itm2, itm3, StExt_Null, nuggetCount, count1, count2, count3, StExt_Null);		
		statNow = StExt_Array_GetInt(artStatsArray, statId);
		statNow += statValue;
		StExt_Array_SetInt(artStatsArray, statId, statNow);
		ai_printbonus(StExt_Str_Done);
	};
};