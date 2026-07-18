//--------------------------------------------------------------
// 				*** Masteries section ***
//--------------------------------------------------------------

// Calculate how much masteries books can be readed
func int StExt_GetMaxMasteriesToLearn()
{
	var int masteriesMax;
	masteriesMax = StExt_MasteriesCountBase;
	if (hero.level > 0)	{ masteriesMax += hero.level / 25; };
	if (StExt_Perk[StExt_PerkIndex_Scholar]) 
	{
		masteriesMax += 1;
		if (hero.level >= 50) { masteriesMax += 1; };
		if (hero.level >= 100) { masteriesMax += 1; };
	};	
	return masteriesMax;
};

var int StExt_GetLearnedMasteriesCount_Count;
func void StExt_GetLearnedMasteriesCount_Loop(var int index, var int value)
{
	if (value > StExt_TalentLevel_None) { StExt_GetLearnedMasteriesCount_Count += 1; };
};
func int StExt_GetLearnedMasteriesCount()
{
	StExt_GetLearnedMasteriesCount_Count = 0;
	StExt_Array_ForEachInt(StExt_MasteryArrayIndex_Level, StExt_GetLearnedMasteriesCount_Loop);
	return StExt_GetLearnedMasteriesCount_Count;
};

func int StExt_GetMasteryPerkPoints(var int masteryId)
{
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ModMenu_Education_BuildMasteryPerksChoiseList(...) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return StExt_Null;
	};
	return StExt_Array_GetInt(StExt_MasteryArrayIndex_PerkPoints, masteryId);
};

func void StExt_LearnMasteryPerk(var int masteryId, var int perkId)
{
	var string perkArray;
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_LearnMateryPerk(var int masteryId, var int perkId) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_MasteryPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_LearnMateryPerk(var int masteryId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};	
	StExt_ChangeMasteryPerkPoints(masteryId, -1);
	perkArray = concatstrings("StExt_Perk_", inttostring(masteryId));
	StExt_Array_SetInt(perkArray, perkId, true);
	ai_printbonus(concatstrings(StExt_Str_Learned, StExt_GetMasteryPerkName(masteryId, perkId)));

	// handle perk bonus
	//if (perkId == ) { StExt_PlayerStat_OnApply(statId, statVal, StExt_PcStat_Source_Perm); };
	if (masteryId == StExt_MasteryIndex_Fire)
	{
		if (perkId == StExt_MasteryPerkIndex_Fire_Pyromant) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraFireDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Fire_FireHeart) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_FireDotDamage, 50, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Fire_FireWalker) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistFire, 100, StExt_PcStat_Source_Perm);	
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistFire, 50, StExt_PcStat_Source_Perm);					
		};
	};
	if (masteryId == StExt_MasteryIndex_Ice)
	{
		if (perkId == StExt_MasteryPerkIndex_Ice_IceHeart) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraMagicDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Ice_IceWalker) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistMagic, 100, StExt_PcStat_Source_Perm);	
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistMagic, 50, StExt_PcStat_Source_Perm);					
		};
	};
	if (masteryId == StExt_MasteryIndex_Electric)
	{
		if (perkId == StExt_MasteryPerkIndex_Electric_EsSteal) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_StealEsPerc, 50, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Electric_Spark) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraSpeed, 5, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Air)
	{
		if (perkId == StExt_MasteryPerkIndex_Air_AirFlow) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraFlyDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Air_Vacuum) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_FlyDotDamage, 50, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Earth)
	{
		if (perkId == StExt_MasteryPerkIndex_Earth_EarthPower) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraBluntDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Earth_Break) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_BluntDotDamage, 50, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Light)
	{
		if (perkId == StExt_MasteryPerkIndex_Light_Stuborn) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistEdge, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistBlunt, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistFire, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistMagic, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistFly, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistPoint, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistPoison, 50, StExt_PcStat_Source_Perm);
		};
		if (perkId == StExt_MasteryPerkIndex_Light_Blessing) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRegPerc, 3, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_EsRegPerc, 3, StExt_PcStat_Source_Perm);
		};
	};
	if (masteryId == StExt_MasteryIndex_Dark) { };
	if (masteryId == StExt_MasteryIndex_Death)
	{
		if (perkId == StExt_MasteryPerkIndex_Death_CorpseHand) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraMagicDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Death_CallOfTheGrave) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_HumanExtraDamPerc, 250, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_OrcExtraDamPerc, 250, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_AnimalExtraDamPerc, 250, StExt_PcStat_Source_Perm);
		};
	};
	if (masteryId == StExt_MasteryIndex_Life) 
	{
		if (perkId == StExt_MasteryPerkIndex_Life_Freshness) 
		{ 
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRegPerc, 10, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_StRegPerc, 10, StExt_PcStat_Source_Perm);
		};
	};
	if (masteryId == StExt_MasteryIndex_Golem) { };
	if (masteryId == StExt_MasteryIndex_Demon) { };
	if (masteryId == StExt_MasteryIndex_Necro) { };
	if (masteryId == StExt_MasteryIndex_Shaman)
	{
		if (perkId == StExt_MasteryPerkIndex_Shaman_Es) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Es, 500, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Shaman_DeepMeditation) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_MpRegPerc, 10, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Shaman_Economy) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_SpellConsumptionReduction, 100, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_MartialArts) { };
	if (masteryId == StExt_MasteryIndex_Agile)
	{
		if (perkId == StExt_MasteryPerkIndex_Agile_Conterattack) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageChance, 50, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Agile_Sustainability) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistEdge, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistBlunt, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistFire, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistMagic, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistFly, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistPoint, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxResistPoison, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_MaxAoeResist, 100, StExt_PcStat_Source_Perm);	
		};
		if (perkId == StExt_MasteryPerkIndex_Agile_Preparation) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRecouped, 200, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Archery)
	{
		if (perkId == StExt_MasteryPerkIndex_Archery_Dexterity) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraSpeed, 10, StExt_PcStat_Source_Perm); };
	};
};

func int StExt_CanLearnMasteryPerk(var int masteryId, var int perkId)
{
	var int perkPointsNow;
	var int isLearned;
	var string perkArray;
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))	{ return false;	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_MasteryPerk_Max)) { return false; };	
	
	perkArray = concatstrings("StExt_Perk_", inttostring(masteryId));
	isLearned = StExt_Array_GetInt(perkArray, perkId);
	perkPointsNow = StExt_Array_GetInt(StExt_MasteryArrayIndex_PerkPoints, masteryId);
	return (perkPointsNow > 0) && !isLearned;
};

func void StExt_ResetMasteryPerk(var int masteryId, var int perkId)
{
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetMasteryPerk(var int masteryId, var int perkId) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_MasteryPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetMasteryPerk(var int masteryId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};
	
	if (masteryId == StExt_MasteryIndex_Fire)
	{
		if (perkId == StExt_MasteryPerkIndex_Fire_Pyromant) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraFireDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Fire_FireHeart) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_FireDotDamage, 50, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Fire_FireWalker) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistFire, 100, StExt_PcStat_Source_Perm);	
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistFire, 50, StExt_PcStat_Source_Perm);					
		};
	};
	if (masteryId == StExt_MasteryIndex_Ice)
	{
		if (perkId == StExt_MasteryPerkIndex_Ice_IceHeart) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraMagicDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Ice_IceWalker) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistMagic, 100, StExt_PcStat_Source_Perm);	
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistMagic, 50, StExt_PcStat_Source_Perm);					
		};
	};
	if (masteryId == StExt_MasteryIndex_Electric)
	{
		if (perkId == StExt_MasteryPerkIndex_Electric_EsSteal) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_StealEsPerc, 50, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Electric_Spark) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraSpeed, 5, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Air)
	{
		if (perkId == StExt_MasteryPerkIndex_Air_AirFlow) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraFlyDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Air_Vacuum) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_FlyDotDamage, 50, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Earth)
	{
		if (perkId == StExt_MasteryPerkIndex_Earth_EarthPower) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraBluntDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Earth_Break) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_BluntDotDamage, 50, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Light)
	{
		if (perkId == StExt_MasteryPerkIndex_Light_Stuborn) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistEdge, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistBlunt, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistFire, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistMagic, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistFly, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistPoint, 50, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistPoison, 50, StExt_PcStat_Source_Perm);
		};
		if (perkId == StExt_MasteryPerkIndex_Light_Blessing) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRegPerc, 3, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_EsRegPerc, 3, StExt_PcStat_Source_Perm);
		};
	};
	if (masteryId == StExt_MasteryIndex_Dark) { };
	if (masteryId == StExt_MasteryIndex_Death)
	{
		if (perkId == StExt_MasteryPerkIndex_Death_CorpseHand) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraMagicDam, 150, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Death_CallOfTheGrave) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HumanExtraDamPerc, 250, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_OrcExtraDamPerc, 250, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_AnimalExtraDamPerc, 250, StExt_PcStat_Source_Perm);
		};
	};
	if (masteryId == StExt_MasteryIndex_Life) 
	{
		if (perkId == StExt_MasteryPerkIndex_Life_Freshness) 
		{ 
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRegPerc, 10, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_StRegPerc, 10, StExt_PcStat_Source_Perm);
		};
	};
	if (masteryId == StExt_MasteryIndex_Golem) { };
	if (masteryId == StExt_MasteryIndex_Demon) { };
	if (masteryId == StExt_MasteryIndex_Necro) { };
	if (masteryId == StExt_MasteryIndex_Shaman)
	{
		if (perkId == StExt_MasteryPerkIndex_Shaman_Es) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_Es, 500, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Shaman_DeepMeditation) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MpRegPerc, 10, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Shaman_Economy) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_SpellConsumptionReduction, 100, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_MartialArts) { };
	if (masteryId == StExt_MasteryIndex_Agile)
	{
		if (perkId == StExt_MasteryPerkIndex_Agile_Conterattack) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ReflectDamageChance, 50, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_MasteryPerkIndex_Agile_Sustainability) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistEdge, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistBlunt, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistFire, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistMagic, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistFly, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistPoint, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxResistPoison, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MaxAoeResist, 100, StExt_PcStat_Source_Perm);	
		};
		if (perkId == StExt_MasteryPerkIndex_Agile_Preparation) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRecouped, 200, StExt_PcStat_Source_Perm); };
	};
	if (masteryId == StExt_MasteryIndex_Archery)
	{
		if (perkId == StExt_MasteryPerkIndex_Archery_Dexterity) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraSpeed, 10, StExt_PcStat_Source_Perm); };
	};
};

var int StExt_ResetMasteryPerks_MasteryId;
func void StExt_ResetMasteryPerks_Loop(var int index, var int value)
{
	if (value) 
	{
		StExt_ChangeMasteryPerkPoints(StExt_ResetMasteryPerks_MasteryId, 1);
		StExt_ResetMasteryPerk(StExt_ResetMasteryPerks_MasteryId, index);
	};
};

func void StExt_ResetMasteryPerks(var int masteryId)
{
	var string perkArray;
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetMasteryPerks(var int masteryId) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return;
	};	
	
	StExt_PrintDebugStack("StExt_ResetMasteryPerks(var int masteryId)");
	perkArray = concatstrings("StExt_Perk_", inttostring(masteryId));
	StExt_ResetMasteryPerks_MasteryId = masteryId;
	StExt_Array_ForEachInt(perkArray, StExt_ResetMasteryPerks_Loop);
	StExt_Array_FillInt(perkArray, false);
	ai_printbonus(StExt_Str_Done);
};

func void StExt_LearnMasteryLevel(var int index, var int level)
{
	var int levelNow;
	if (index < 0) || (index >= StExt_MasteryIndex_Max)
	{
		StExt_PrintDebugStack("StExt_LearnMasteryLevel(var int index, var int perkPoints) -> index out of range!");
		return;
	};
	levelNow = StExt_Array_GetInt(StExt_MasteryArrayIndex_Level, index);
	if (level <= levelNow) 
	{ 
		StExt_PrintDebugStack("StExt_LearnMasteryLevel(var int index, var int perkPoints) -> new level is lower than current!");
		return;
	};
	StExt_Array_SetInt(StExt_MasteryArrayIndex_Level, index, level);
};

func int StExt_CanLearnNextMasteryLevel(var int index, var int learnLevel)
{
	var int result;
	var int currentLevel;
	var int currentProgress;
	var int requiredProgress;
	var int masteriesLearned;
	var int masteriesMax;
	if ((index < 0) || (index >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack("StExt_CanLearnNextMasteryLevel(var int index, var int perkPoints) -> index out of range!");
		return false;
	};	
	
	masteriesLearned = StExt_GetLearnedMasteriesCount();
	masteriesMax = StExt_GetMaxMasteriesToLearn();
	currentProgress = StExt_Array_GetInt(StExt_MasteryArrayIndex_Progress, index);
	currentLevel = StExt_Array_GetInt(StExt_MasteryArrayIndex_Level, index);
	requiredProgress = learnLevel * 20;
	
	if ((learnLevel == StExt_TalentLevel_Apprentice) && (masteriesLearned >= masteriesMax)) { return false; };
	if (learnLevel <= currentLevel) { return false; };
	if ((learnLevel - currentLevel) > 1) { return false; };
	if (currentProgress < requiredProgress) { return false; };
	return true;
};

//--------------------------------------------------------------
// 				*** Generic perks ***
//--------------------------------------------------------------

func int StExt_GetGenericPerkCost(var int perkId)
{
	var int cost;
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetGenericPerkCost(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return 0;
	};
	// Gold can be farmed forever, so it is the SOFT gate only - a third of the old
	// price. The real cost sits in LP (StExt_GetGenericPerkLpCost), the one currency
	// the player cannot grind. StExt_Perk_Cost stays the single power rating of a
	// perk; both prices derive from it.
	cost = StExt_Array_GetInt("StExt_Perk_Cost", perkId) / 3;
	if (StExt_SncMode == 3) { cost += StExt_GetPercentFromValue(cost, 50); };
	cost = StExt_GetPercentFromValueWithMin(cost, StExt_Config_EducationMoneyCostMult, 1);
	return cost;
};

func int StExt_GetGenericPerkLpCost(var int perkId)
{
	var int cost;
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetGenericPerkLpCost(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return 0;
	};
	if (StExt_SncMode == 3) { return 0; };
	// LP is the HARD gate - unfarmable, so this is where a perk actually costs.
	// Divisor 1000 -> 300 (3.3x more LP). A 30k-rated perk now runs 10k gold +
	// 100 LP instead of 30k gold + 30 LP: the old formula had the ratio backwards,
	// charging grindable gold heavily and the scarce currency almost not at all.
	cost = (StExt_Array_GetInt("StExt_Perk_Cost", perkId) + 1) / 300;
	cost = StExt_GetPercentFromValueWithMin(cost, StExt_Config_EducationRequirementsMult, 1);
	return cost;
};

func int StExt_LearnGenericPerk_BuildFailReqString(var int val, var string name, var int isSilent)
{
	var string text;
	if (!isSilent)
	{
		text = concatstrings(StExt_Str_Required, inttostring(val));
		text = concatstrings(text, StExt_Str_Pts);	
		text = concatstrings(text, " ");
		text = concatstrings(text, name);
		text = concatstrings(text, "!");
		ai_printred(text);
	};
	return false;
};

func int StExt_CanLearnGenericPerk(var int perkId, var int isSilent)
{
	var int goldRequired;
	var int lpRequired;
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_CanLearnGenericPerk(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return false;
	};
	if (StExt_IsGenericPerkLearned(perkId)) { return false; };
	goldRequired = StExt_GetGenericPerkCost(perkId);
	lpRequired = StExt_GetGenericPerkLpCost(perkId);
	if (StExt_SncMode != 3)
	{
		if (hero.lp < lpRequired)
		{
			if (!isSilent) { ai_printred(concatstrings(StExt_Str_NeedLp, inttostring(lpRequired))); };
			return false;
		};
	};
	if (npc_hasitems(hero, itmi_gold) < goldRequired)
	{
		if (!isSilent) { ai_printred(concatstrings(StExt_Str_NeedGold, inttostring(goldRequired))); };
		return false; 
	};
	
	// handle other conditions
	if ((perkId == StExt_PerkIndex_Ritualist) && (atr_intellect < 250)) { return StExt_LearnGenericPerk_BuildFailReqString(250, StExt_Str_Required_Intellect, isSilent); };
	if ((perkId == StExt_PerkIndex_MindOverMatter) && (hero.attribute[atr_mana_max] < 500)) { return StExt_LearnGenericPerk_BuildFailReqString(500, StExt_Str_Required_Mp, isSilent); };
	if ((perkId == StExt_PerkIndex_BattleMage) && (atr_intellect < 150)) { return StExt_LearnGenericPerk_BuildFailReqString(150, StExt_Str_Required_Intellect, isSilent); };
	if ((perkId == StExt_PerkIndex_Thief) && (hero.attribute[atr_dexterity] < 100)) { return StExt_LearnGenericPerk_BuildFailReqString(100, StExt_Str_Required_Agi, isSilent); };
	if ((perkId == StExt_PerkIndex_Archmage) && (hero.attribute[atr_mana_max] < 1000)) { return StExt_LearnGenericPerk_BuildFailReqString(1000, StExt_Str_Required_Mp, isSilent); };
	if ((perkId == StExt_PerkIndex_Grunt) && (atr_stamina_max < 100)) { return StExt_LearnGenericPerk_BuildFailReqString(1000, StExt_Str_Required_Stam, isSilent); };
	if ((perkId == StExt_PerkIndex_PainResist) && (atr_stamina_max < 750)) { return StExt_LearnGenericPerk_BuildFailReqString(750, StExt_Str_Required_Stam, isSilent); };

	return true;
};

func void StExt_LearnGenericPerk(var int perkId)
{
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_LearnGenericPerk(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};
	StExt_Array_SetInt("StExt_Perk", perkId, true);
	npc_removeinvitems(hero, itmi_gold, StExt_GetGenericPerkCost(perkId));
	if (StExt_SncMode != 3)	{ hero.lp -= StExt_GetGenericPerkLpCost(perkId); };
	ai_printbonus(concatstrings(StExt_Str_Learned, StExt_GetGenericPerkName(perkId)));
	
	// handle perk bonus
	// if (perkId == ) { StExt_PlayerStat_OnApply(statId, statVal, StExt_PcStat_Source_Perm); };

	if (perkId == StExt_PerkIndex_ThickSkin) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_AncestorsGift) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_MpRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Atlet) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_StRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Recouperation) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_EsRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_DenseAura) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_AuraConsumptionReduction, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_BattleMage) 
	{
		StExt_PlayerStat_OnApply(StExt_PcStats_Index_SpellCritChance, 100, StExt_PcStat_Source_Perm); 
		StExt_PlayerStat_OnApply(StExt_PcStats_Index_SpellCritChanceMult, 250, StExt_PcStat_Source_Perm); 
	};
	if (perkId == StExt_PerkIndex_Gridy) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_LuckGold, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Lucky) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Luck, 50, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Thief) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_PickPocketChance, 10, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Dexterity) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraSpeed, 10, StExt_PcStat_Source_Perm); };	
	if (perkId == StExt_PerkIndex_BowMan) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_BowExtraDamPerc, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_CBowMan) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_CBowExtraDamPerc, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_AmbiMan) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_DualExtraDamPerc, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_CorruptTouch)	{ StExt_CorruptedPerk_DamageNext = StExt_CorruptionTouch_ExpPerLevel; };
};

func void StExt_ResetGenericPerk(var int perkId)
{
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetGenericPerk(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};
	if (perkId == StExt_PerkIndex_ThickSkin) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_AncestorsGift) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MpRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Atlet) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_StRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Recouperation) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_EsRegPerc, 5, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_DenseAura) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_AuraConsumptionReduction, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_BattleMage) 
	{
		StExt_PlayerStat_OnRemove(StExt_PcStats_Index_SpellCritChance, 100, StExt_PcStat_Source_Perm); 
		StExt_PlayerStat_OnRemove(StExt_PcStats_Index_SpellCritChanceMult, 250, StExt_PcStat_Source_Perm); 
	};
	if (perkId == StExt_PerkIndex_Gridy) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_LuckGold, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Lucky) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_Luck, 50, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Thief) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_PickPocketChance, 10, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_Dexterity) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ExtraSpeed, 10, StExt_PcStat_Source_Perm); };	
	if (perkId == StExt_PerkIndex_BowMan) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_BowExtraDamPerc, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_CBowMan) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_CBowExtraDamPerc, 250, StExt_PcStat_Source_Perm); };
	if (perkId == StExt_PerkIndex_AmbiMan) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_DualExtraDamPerc, 250, StExt_PcStat_Source_Perm); };
};

func void StExt_ResetGenericPerks_Loop(var int index, var int value)
{
	var int lp;
	var int gold;
	if (value) 
	{
		if (index == StExt_PerkIndex_CorruptTouch) { return; };
		
		StExt_Array_SetInt("StExt_Perk", index, false);
		gold = StExt_GetGenericPerkCost(index);
		gold = StExt_GetPercentFromValue(gold, StExt_ForgetPerks_ReturnGoldMult);
		createinvitems(hero, itmi_gold, gold);
		if (StExt_SncMode != 3)	
		{ 
			lp = StExt_GetGenericPerkLpCost(index);
			hero.lp += lp; 
		};
		StExt_ResetGenericPerk(index);
	};
};

func void StExt_ResetGenericPerks()
{
	StExt_PrintDebugStack("StExt_ResetGenericPerks()");
	StExt_Array_ForEachInt("StExt_Perk", StExt_ResetGenericPerks_Loop);
	ai_printbonus(StExt_Str_Done);
};

//--------------------------------------------------------------
// 						*** Corruption ***
//--------------------------------------------------------------
func void StExt_SetCorruptionLevel_Stats()
{
	var int decreaseLevel;
	decreaseLevel = StExt_CorruptionPath_Level + 1;
	if (StExt_CorruptionPath == StExt_Corruption_Mage)
	{
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Int] = 1;
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Mp] = 3;
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Hp] = (-decreaseLevel);
	}
	else if (StExt_CorruptionPath == StExt_Corruption_Warrior)
	{	
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Str] = 1;
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Hp] = 3;
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Mp] = (-decreaseLevel);
	}
	else if (StExt_CorruptionPath == StExt_Corruption_Ranger)
	{	
		if (decreaseLevel <= 1) { decreaseLevel = 2; };
		decreaseLevel = decreaseLevel / 2;
		
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Hp] = (-decreaseLevel);
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Agi] = 2;
		StExt_Corruption_BonusNext[StExt_CorruptionBonus_Dodge] = 1;
	};
};

// Call when corruption level rise
func void StExt_HandleCorruptionLevel()
{
	var int decreaseLevel;
	decreaseLevel = StExt_CorruptionPath_Level;
	StExt_CorruptionPath_SkillPoints += 1;
	if (StExt_CorruptionPath == StExt_Corruption_Mage)
	{
		atr_intellect += 1;	
		npc_settalentskill(hero, npc_talent_intellect, atr_intellect);
		b_raiseattribute_bonus(hero, atr_mana_max, 3);
		npc_changeattribute(hero, atr_mana, 3);
		hero.attribute[atr_hitpoints_max] = StExt_ApplyValueChangeWithMinimum(hero.attribute[atr_hitpoints_max], 5 + StExt_PcStats[StExt_PcStats_Index_Hp], -decreaseLevel);
		if (hero.attribute[atr_hitpoints] > hero.attribute[atr_hitpoints_max]) { hero.attribute[atr_hitpoints] = hero.attribute[atr_hitpoints_max]; };
		
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Int] += 1;
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Mp] += 3;
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Hp] += (-decreaseLevel);
	}
	else if (StExt_CorruptionPath == StExt_Corruption_Warrior)
	{	
		b_raiseattribute_bonus(hero, atr_strength, 1);
		b_raiseattribute_bonus(hero, atr_hitpoints_max, 3);
		npc_changeattribute(hero, atr_hitpoints, 3);
		hero.attribute[atr_mana_max] = StExt_ApplyValueChangeWithMinimum(hero.attribute[atr_mana_max], 5 + StExt_PcStats[StExt_PcStats_Index_Mp], -decreaseLevel);
		if (hero.attribute[atr_mana] > hero.attribute[atr_mana_max]) { hero.attribute[atr_mana] = hero.attribute[atr_mana_max]; };
		
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Str] += 1;
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Hp] += 3;
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Mp] += (-decreaseLevel);
	}
	else if (StExt_CorruptionPath == StExt_Corruption_Ranger)
	{	
		b_raiseattribute_bonus(hero, atr_dexterity, 2);
		StExt_PcStats_Perm[StExt_PcStats_Index_DodgeChance] += 1;
		
		if (decreaseLevel <= 1) { decreaseLevel = 2; };
		decreaseLevel = decreaseLevel / 2;
		hero.attribute[atr_hitpoints_max] = StExt_ApplyValueChangeWithMinimum(hero.attribute[atr_hitpoints_max], 5 + StExt_PcStats[StExt_PcStats_Index_Hp], -decreaseLevel);
		if (hero.attribute[atr_hitpoints] > hero.attribute[atr_hitpoints_max]) { hero.attribute[atr_hitpoints] = hero.attribute[atr_hitpoints_max]; };
		
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Hp] += (-decreaseLevel);
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Agi] += 2;
		StExt_Corruption_BonusCount[StExt_CorruptionBonus_Dodge] += 1;
	};
};

// Corrupted ascendant leveling
func void StExt_AddCorruptionExp(var int exp)
{	
	if (StExt_CorruptionPath > StExt_Corruption_None)
	{
		if (exp <= 0) 
		{
			if (StExt_CorruptionPath_ExpNow >= StExt_CorruptionPath_ExpNext) { exp = 0; }
			else { return; };
		};

		exp = StExt_GetPercentFromValue(exp, StExt_Config_CorruptionExpMult); 
		StExt_CorruptionPath_ExpNow += exp;
		if (StExt_CorruptionPath_ExpNow >= StExt_CorruptionPath_ExpNext)
		{
			StExt_CorruptionPath_Level += 1;
			StExt_CorruptionPath_ExpNow = StExt_CorruptionPath_ExpNow - StExt_CorruptionPath_ExpNext;			
			StExt_CorruptionPath_ExpNext = (StExt_CorruptionPath_Level * 2) * StExt_Corruption_ExpPerLevel;
			StExt_HandleCorruptionLevel();
			StExt_SetCorruptionLevel_Stats();
			Hlp_DoEvent("StExt_Evt_OnCorruptionLevelUp");
			ai_printred(StExt_Str_CorruptionLevelUpMsg);
		};
		if(StExt_CorruptionPath_ExpNow >= StExt_CorruptionPath_ExpNext) { StExt_AddCorruptionExp(0); };
	};
};

func int StExt_GetCorruptionPerkCost(var int corruptionId, var int perkId)
{
	var int cost;
	var string arrayName;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkCost(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return 0;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkCost(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return 0;
	};
	
	arrayName = StExt_GetCorruptionPrefix(corruptionId);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkCost(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return 0;
	};
	arrayName = concatstrings("StExt_Corruption_Perk_", arrayName);
	arrayName = concatstrings(arrayName, "_Cost");
	
	cost = StExt_Array_GetInt(arrayName, perkId);
	cost = StExt_GetPercentFromValueWithMin(cost, StExt_Config_EducationRequirementsMult, 1);
	return cost;
};

func int StExt_CanLearnCorruptionPerk(var int corruptionId, var int perkId, var int isSilent)
{
	var int lpRequired;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_CanLearnCorruptionPerk(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return false;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_CanLearnCorruptionPerk(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return false;
	};
	if (corruptionId != StExt_CorruptionPath) { return false; };
	
	lpRequired = StExt_GetCorruptionPerkCost(corruptionId, perkId);
	if (StExt_CorruptionPath_SkillPoints < lpRequired)
	{
		if (!isSilent) { ai_printred(concatstrings(StExt_Str_NeedSkillPoints, inttostring(lpRequired))); };
		return false;
	};
	return true;
};

func void StExt_LearnCorruptionPerk(var int corruptionId, var int perkId)
{
	var int cost;
	var string arrayName;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_LearnCorruptionPerk(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_LearnCorruptionPerk(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};
	
	cost = StExt_GetCorruptionPerkCost(corruptionId, perkId);
	arrayName = StExt_GetCorruptionPrefix(corruptionId);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack("StExt_LearnCorruptionPerk(var int corruptionId, var int perkId) -> Corruption array is empty!");
		return;
	};
	arrayName = concatstrings("StExt_Corruption_Perk_", arrayName);	
	StExt_Array_SetInt(arrayName, perkId, true);
	StExt_CorruptionPath_SkillPoints -= cost;
	ai_printbonus(concatstrings(StExt_Str_Learned, StExt_GetCorruptionPerkName(corruptionId, perkId)));
	
	// handle perk bonus
	// if (perkId == ) { StExt_PlayerStat_OnApply(statId, statVal, StExt_PcStat_Source_Perm); };
	if (corruptionId == StExt_Corruption_Mage)
	{
		if (perkId == StExt_CorruptPerkIndex_Mage_Dreamer) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_MpRegPerc, 10, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Foresight) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_AuraConsumptionReduction, 250, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Forethought) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_MpRecouped, 200, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_SoulStealer) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_StealEsPerc, 100, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Thinker) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_MpPerc, 100, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Adept) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_SpellConsumptionReduction, 100, StExt_PcStat_Source_Perm); };
	};
	if (corruptionId == StExt_Corruption_Warrior)
	{
		if (perkId == StExt_CorruptPerkIndex_Warior_BloodLess) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRecouped, 200, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_ForeverYoung) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRegPerc, 20, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_Discipline) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_AuraCountMax, 1, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_Preparation) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_AuraConsumptionReduction, 250, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_HealthyBody) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpPerc, 100, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_BrilliantSkin) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistEdge, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistBlunt, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistFire, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistMagic, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistFly, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistPoint, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_ResistPoison, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_AoeResist, 100, StExt_PcStat_Source_Perm);
		};
	};
	if (corruptionId == StExt_Corruption_Ranger)
	{
		if (perkId == StExt_CorruptPerkIndex_Ranger_Regeneration) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_HpRegPerc, 10, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Ranger_BloodSucker) 
		{
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_StealLifePerc, 100, StExt_PcStat_Source_Perm); 
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_StealStamPerc, 100, StExt_PcStat_Source_Perm);
		};
	};
};

func void StExt_ResetCorruptionPerk(var int corruptionId, var int perkId)
{
	var string arrayName;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetCorruptionPerk(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetCorruptionPerk(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};
	
	arrayName = StExt_GetCorruptionPrefix(corruptionId);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack("StExt_ResetCorruptionPerk(var int corruptionId, var int perkId) -> Corruption array is empty!");
		return;
	};
	
	arrayName = concatstrings("StExt_Corruption_Perk_", arrayName);	
	StExt_Array_SetInt(arrayName, perkId, false);
	
	if (corruptionId == StExt_Corruption_Mage)
	{
		if (perkId == StExt_CorruptPerkIndex_Mage_Dreamer) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MpRegPerc, 10, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Foresight) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_AuraConsumptionReduction, 250, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Forethought) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MpRecouped, 200, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_SoulStealer) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_StealEsPerc, 100, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Thinker) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_MpPerc, 100, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Mage_Adept) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_SpellConsumptionReduction, 100, StExt_PcStat_Source_Perm); };
	};
	if (corruptionId == StExt_Corruption_Warrior)
	{
		if (perkId == StExt_CorruptPerkIndex_Warior_BloodLess) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRecouped, 200, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_ForeverYoung) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRegPerc, 20, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_Discipline) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_AuraCountMax, 1, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_Preparation) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_AuraConsumptionReduction, 250, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_HealthyBody) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpPerc, 100, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Warior_BrilliantSkin) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistEdge, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistBlunt, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistFire, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistMagic, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistFly, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistPoint, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_ResistPoison, 100, StExt_PcStat_Source_Perm);
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_AoeResist, 100, StExt_PcStat_Source_Perm);
		};
	};
	if (corruptionId == StExt_Corruption_Ranger)
	{
		if (perkId == StExt_CorruptPerkIndex_Ranger_Regeneration) { StExt_PlayerStat_OnRemove(StExt_PcStats_Index_HpRegPerc, 10, StExt_PcStat_Source_Perm); };
		if (perkId == StExt_CorruptPerkIndex_Ranger_BloodSucker) 
		{
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_StealLifePerc, 100, StExt_PcStat_Source_Perm); 
			StExt_PlayerStat_OnRemove(StExt_PcStats_Index_StealStamPerc, 100, StExt_PcStat_Source_Perm);
		};
	};
};

func void StExt_ResetCorruptionPerks_Loop(var int index, var int value)
{
	var int lp;
	if (value) 
	{
		lp = StExt_GetCorruptionPerkCost(StExt_CorruptionPath, index);
		StExt_CorruptionPath_SkillPoints += lp;
		StExt_ResetCorruptionPerk(StExt_CorruptionPath, index);
	};
};

func void StExt_ResetCorruptionPerks()
{
	var string arrayName;
	if ((StExt_CorruptionPath <= StExt_Corruption_None) || (StExt_CorruptionPath >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ResetCorruptionPerks() -> Corruption index out of range! Index: ", inttostring(StExt_CorruptionPath)));
		return;
	};
	
	arrayName = StExt_GetCorruptionPrefix(StExt_CorruptionPath);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack("StExt_ResetCorruptionPerks() -> Corruption array is empty!");
		return;
	};
	arrayName = concatstrings("StExt_Corruption_Perk_", arrayName);
	StExt_PrintDebugStack("StExt_ResetCorruptionPerks()");
	StExt_Array_ForEachInt(arrayName, StExt_ResetCorruptionPerks_Loop);
	ai_printbonus(StExt_Str_Done);
};

//--------------------------------------------------------------
// 				*** Leveling ***
//--------------------------------------------------------------
func void StExt_OnLevelUp()
{
	if (hero.level != StExt_HeroLevel)
	{
		if ((StExt_Config_ExtraLp > 0) && (StExt_SncMode != 3)) { rx_givelp(StExt_Config_ExtraLp); };		
		if (StExt_Config_ExtraHpPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Hp, StExt_Config_ExtraHpPerLevel, StExt_PcStat_Source_Perm); };		
		if (StExt_Config_ExtraMpPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Mp, StExt_Config_ExtraMpPerLevel, StExt_PcStat_Source_Perm); };
		if (StExt_Config_ExtraEsPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Es, StExt_Config_ExtraEsPerLevel, StExt_PcStat_Source_Perm); };
		if (StExt_Config_ExtraStrPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Str, StExt_Config_ExtraStrPerLevel, StExt_PcStat_Source_Perm); };
		if (StExt_Config_ExtraAgiPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Agi, StExt_Config_ExtraAgiPerLevel, StExt_PcStat_Source_Perm); };
		if (StExt_Config_ExtraIntPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Int, StExt_Config_ExtraIntPerLevel, StExt_PcStat_Source_Perm); };		
		if (StExt_Config_ExtraLuckPerLevel > 0) { StExt_PlayerStat_OnApply(StExt_PcStats_Index_Luck, StExt_Config_ExtraLuckPerLevel, StExt_PcStat_Source_Perm); };		
		Hlp_DoEvent("StExt_Evt_OnLevelUp");
	};
	StExt_HeroLevel = hero.level;
};

func int StExt_ApplyExpMult(var int exp)
{
	var int reduction;
	var int randBonus;
	if (exp < 0) { return exp; };
	if (exp == 0) { return 0; };
	
	if (xp_per_victory <= 0) 
	{
		StExt_PrintDebugStack("StExt_ApplyExpMult(var int exp) -> xp_per_victory was zero!");
		xp_per_victory = 1;
	};
	if (StExt_Config_GainExpMod <= 0) { StExt_Config_GainExpMod = 100; };
	
	reduction = 0;
	exp = StExt_GetPercentFromValueWithMin(exp, xp_per_victory * 10, 1);	
	exp = StExt_GetPercentFromValueWithMin(exp, StExt_Config_GainExpMod, 1);
	if ((StExt_Config_GainExpRandomMod > 0) && (exp >= 10))
	{
		randBonus = StExt_GetPermilleFromValue(exp, StExt_Config_GainExpRandomMod);
		if (randBonus > 0) { exp += StExt_GetRandomSignedRange(randBonus); };
	};
	
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_CorruptTouch)) { reduction += StExt_CorruptionTouch_ExpReduction; };
	if (StExt_CorruptionPath != StExt_Corruption_None) { reduction += StExt_Corruption_ExpReduction; };
	
	if (reduction > 0) { exp -= StExt_GetPercentFromValue(exp, reduction); };
	if (exp <= 0) { exp = 1; };
	return exp;
};

func void b_giveplayerxp(var int add_xp)
{
	var int artifactExp;
    if ((add_xp == 0) || (hero.attribute <= 0)) { return; };
	
	add_xp = StExt_ApplyExpMult(add_xp);
	if (add_xp > 0)
	{
		artifactExp = StExt_GetPercentFromValueWithMin(add_xp, 20, 1);	
		StExt_ProcessArtifactExp(artifactExp);	
	};
	
	StExt_HeroLevel = hero.level;
	StExt_AddCorruptionExp(add_xp);
	b_giveplayerxp_old(add_xp);
	StExt_OnLevelUp();
};
func void b_giveplayerxpquiet(var int add_xp, var int longtime)
{
	var int artifactExp;
    if ((add_xp == 0) || (hero.attribute <= 0)) { return; };
	
	add_xp = StExt_ApplyExpMult(add_xp);
	if (add_xp > 0)
	{
		artifactExp = StExt_GetPercentFromValueWithMin(add_xp, 20, 1);	
		StExt_ProcessArtifactExp(artifactExp);	
	};

	StExt_HeroLevel = hero.level;
	StExt_AddCorruptionExp(add_xp);
	b_giveplayerxpquiet_old(add_xp, longtime);
	StExt_OnLevelUp();
};

func void StExt_ProcessDamageExp_CorruptTouch(var int damage)
{
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_CorruptTouch)) { return; };	
	if (damage <= 0) 
	{
		if (StExt_CorruptedPerk_DamageNow >= StExt_CorruptedPerk_DamageNext) { damage = 0; }
		else { return; };
	};

	damage = StExt_GetPercentFromValueWithMin(damage, StExt_Config_CorruptionTouchExp, 1);
	StExt_CorruptedPerk_DamageNow += damage;
	if (StExt_CorruptedPerk_DamageNow >= StExt_CorruptedPerk_DamageNext)
	{
		StExt_CorruptedPerk_DamageLevel += 1;
		StExt_CorruptedPerk_DamagePoints += 1;
		StExt_CorruptedPerk_DamageNow = StExt_CorruptedPerk_DamageNow - StExt_CorruptedPerk_DamageNext;			
		StExt_CorruptedPerk_DamageNext = (StExt_CorruptedPerk_DamageLevel * 2) * StExt_CorruptionTouch_ExpPerLevel;		
	};
	if(StExt_CorruptedPerk_DamageNow >= StExt_CorruptedPerk_DamageNext) { StExt_ProcessDamageExp_CorruptTouch(0); };
};

func void StExt_AddCorruptTouchStat(var string statName, var int statValue)
{
	var int statId;
	var int statNow;
	
	if(!StExt_SymbolExist(statName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_AddCorruptTouchStat() -> incorrect statName: ", statName));
		return;
	};
	
	statId = StExt_GetIntValueByName(statName);
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_AddCorruptTouchStat() -> incorrect statId: ", inttostring(statId)));
		return;
	};
	
	if(StExt_CorruptedPerk_DamagePoints < StExt_CorruptionTouch_SkillCost)
	{
		ai_printred(StExt_Str_CorruptedPerkNotEnoughtLp);
		return;
	};
	
	StExt_CorruptedPerk_DamagePoints -= StExt_CorruptionTouch_SkillCost;
	StExt_PlayerStat_OnApply(statId, statValue, StExt_PcStat_Source_Other);
	ai_printbonus(StExt_Str_Done);
};

func void StExt_AddCorruptTouchStatEngine(var int statId, var int statValue)
{
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max)) {
		StExt_PrintDebugStack(concatstrings("StExt_AddCorruptTouchStatEngine() -> incorrect statId: ", inttostring(statId)));
		return;
	};
	
	if(StExt_CorruptedPerk_DamagePoints < StExt_CorruptionTouch_SkillCost) {
		ai_printred(StExt_Str_CorruptedPerkNotEnoughtLp);
		return;
	};
	
	StExt_CorruptedPerk_DamagePoints -= StExt_CorruptionTouch_SkillCost;
	StExt_PlayerStat_OnApply(statId, statValue, StExt_PcStat_Source_Other);
	ai_printbonus(StExt_Str_Done);
};

func void StExt_ProcessExtraSnc(var int statId, var int exp)
{
	var int bonus;
	var int isBonus;
	var string msg;
	
	if (exp <= 0) { return; };
	if (!StExt_Config_ExtraSncStatsAlwaysEnabled && (StExt_SncMode > 0)) { return; };

	isBonus = false;
	exp = StExt_GetPercentFromValueWithMin(exp, StExt_Config_SncExp, 1);	
	if (statId == StExt_ExtraSnC_StatId_EnergyShield)
	{
		StExt_ExtraSnCStat_EnergyShield_ExpNow += exp;
		if (StExt_ExtraSnCStat_EnergyShield_ExpNow >= StExt_ExtraSnCStat_EnergyShield_ExpNext)
		{
			StExt_ExtraSnCStat_EnergyShield_BonusCount += 1;
			StExt_ExtraSnCStat_EnergyShield_ExpNow = StExt_ExtraSnCStat_EnergyShield_ExpNow - StExt_ExtraSnCStat_EnergyShield_ExpNext;			
			StExt_ExtraSnCStat_EnergyShield_ExpNext = (StExt_ExtraSnCStat_EnergyShield_BonusCount * 2) * StExt_ExtraSnCStat_EnergyShield_ExpPerLevel;
			
			isBonus = true;
			bonus = 1;
			if (rx_heroismage()) { bonus = 2; };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_SpirithFlesh)) { bonus += 1; };
			StExt_PlayerStat_OnApply(StExt_PcStats_Index_Es, bonus, StExt_PcStat_Source_Perm);
			
			msg = StExt_EsText;
			msg = concatstrings(msg, " +");
			msg = concatstrings(msg, inttostring(bonus));
		};
	};

	if (isBonus) { ai_printbonus(msg); };
};

func void StExt_ProcessDamageExp(var c_npc atk, var c_npc target, var c_item weap, var int damType, var int damFlags, var int totaldamage)
{
	var int sumType;
	var int sumGolType;
	var int halfDamage;
	var int qDamage;
	
	if (totaldamage <= 0) { return; };
	if (!hlp_isvalidnpc(atk) || !hlp_isvalidnpc(target)) { return; };
	if (!rx_snk_starttrain && (target.aivar[43] == id_training_aim)) { return; };
	
	if (StExt_IsSummonOrHero(atk) || npc_isplayer(target)) {
		StExt_PrintDebug("StExt_ProcessDamageExp(...)", concatstrings("Add masteries damage: ", inttostring(totaldamage)), atk, target);
	}
	else { return; };
	
	halfDamage = (totaldamage + 1) / 2;
	qDamage = (totaldamage + 1) / 4;
	if (StExt_IsSummonOrHero(atk)) 
	{
		if (npc_isplayer(atk) && !StExt_IsHeroPatryNpc(target))
		{
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_CorruptTouch)) { StExt_ProcessDamageExp_CorruptTouch(totaldamage); };

			if (StExt_ValueHasFlag(damType, StExt_DamageType_Fire)) { StExt_AddMasteryExp(StExt_MasteryIndex_Fire, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Ice)) { StExt_AddMasteryExp(StExt_MasteryIndex_Ice, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Electric)) { StExt_AddMasteryExp(StExt_MasteryIndex_Electric, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Air)) { StExt_AddMasteryExp(StExt_MasteryIndex_Air, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Earth)) { StExt_AddMasteryExp(StExt_MasteryIndex_Earth, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Light)) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Dark)) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Death)) { StExt_AddMasteryExp(StExt_MasteryIndex_Death, totalDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Life) || StExt_ValueHasFlag(damType, StExt_DamageType_Poision)) { StExt_AddMasteryExp(StExt_MasteryIndex_Life, totalDamage); };
		
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Melee)) 
			{ 
				StExt_AddMasteryExp(StExt_MasteryIndex_MartialArts, totalDamage);
				if (StExt_WeaponIsMagic(weap)) { StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, totalDamage); };
			};
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Range)) 
			{ 
				StExt_AddMasteryExp(StExt_MasteryIndex_Archery, totalDamage);
				if (StExt_WeaponIsMagic(weap)) { StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, totalDamage); };
			};
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Spell) || StExt_ValueHasFlag(damType, StExt_DamageType_Ability) || StExt_ValueHasFlag(damType, StExt_DamageType_True) || StExt_WeaponIsMagic(weap)) 
			{ 
				StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, totalDamage);
				StExt_ProcessExtraSnc(StExt_ExtraSnC_StatId_EnergyShield, totalDamage);
			};
		}
		else if (StExt_IsSummonOrTotem(atk))
		{
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_CorruptTouch)) { StExt_ProcessDamageExp_CorruptTouch(halfDamage); };

			if (StExt_ValueHasFlag(damType, StExt_DamageType_Fire)) { StExt_AddMasteryExp(StExt_MasteryIndex_Fire, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Ice)) { StExt_AddMasteryExp(StExt_MasteryIndex_Ice, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Electric)) { StExt_AddMasteryExp(StExt_MasteryIndex_Electric, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Air)) { StExt_AddMasteryExp(StExt_MasteryIndex_Air, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Earth)) { StExt_AddMasteryExp(StExt_MasteryIndex_Earth, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Light)) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Dark) || rx_getnpcvar(atk, aivrx_npc_control_agro) || rx_getnpcvar(atk, aivrx_npc_darkcontrol)) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Death)) { StExt_AddMasteryExp(StExt_MasteryIndex_Death, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Life) || StExt_ValueHasFlag(damType, StExt_DamageType_Poision)) { StExt_AddMasteryExp(StExt_MasteryIndex_Life, halfDamage); };
			
			sumType = StExt_GetSummonType(atk);
			StExt_ProcessExtraSnc(StExt_ExtraSnC_StatId_EnergyShield, qDamage);
			if (sumType == StExt_SummonType_Beast) { StExt_AddMasteryExp(StExt_MasteryIndex_Life, totalDamage); };
			if ((sumType == StExt_SummonType_Golem) || StExt_ValueHasFlag(damType, StExt_DamageType_Golem)) 
			{ 
				StExt_AddMasteryExp(StExt_MasteryIndex_Golem, totalDamage);
				sumGolType = StExt_GetSummonGolemType(atk);
				if (sumGolType == StExt_SummonGolemType_Stone) { StExt_AddMasteryExp(StExt_MasteryIndex_Earth, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Fire) { StExt_AddMasteryExp(StExt_MasteryIndex_Fire, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Ice) { StExt_AddMasteryExp(StExt_MasteryIndex_Ice, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Magic) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Swamp) { StExt_AddMasteryExp(StExt_MasteryIndex_Earth, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Wood) { StExt_AddMasteryExp(StExt_MasteryIndex_Life, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Air) { StExt_AddMasteryExp(StExt_MasteryIndex_Air, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Bone) { StExt_AddMasteryExp(StExt_MasteryIndex_Necro, halfDamage); }
				else if (sumGolType == StExt_SummonGolemType_Electric) { StExt_AddMasteryExp(StExt_MasteryIndex_Electric, halfDamage); };
			};
			if ((sumType == StExt_SummonType_Demon) || StExt_ValueHasFlag(damType, StExt_DamageType_Demon)) 
			{ 
				StExt_AddMasteryExp(StExt_MasteryIndex_Demon, totalDamage); 
				StExt_AddMasteryExp(StExt_MasteryIndex_Dark, halfDamage);
			};
			if ((sumType == StExt_SummonType_Undead) || StExt_ValueHasFlag(damType, StExt_DamageType_Necro)) 
			{ 
				StExt_AddMasteryExp(StExt_MasteryIndex_Necro, totalDamage); 
				StExt_AddMasteryExp(StExt_MasteryIndex_Death, halfDamage);
			};
			if (sumType == StExt_SummonType_Totem) { StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, totalDamage); };
			if (sumType == StExt_SummonType_Holly) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, totalDamage); };
		};
	};
	
	if (rx_getnpcvar(atk, aivrx_npc_control_agro) || rx_getnpcvar(atk, aivrx_npc_darkcontrol)) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, halfDamage); };
	
	if (npc_isplayer(target) && !StExt_IsHeroPatryNpc(atk))
	{
		StExt_PrintDebug("StExt_ProcessDamageExp(...)", concatstrings("Add masteries damage for damage to hero: ", inttostring(halfDamage)), target, atk);
		
		StExt_AddMasteryExp(StExt_MasteryIndex_Agile, totalDamage * 2);
		if (StExt_ValueHasFlag(damType, StExt_DamageType_Spell) || StExt_ValueHasFlag(damType, StExt_DamageType_Ability) || StExt_ValueHasFlag(damType, StExt_DamageType_True)) 
		{ 
			StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, halfDamage);
			StExt_ProcessExtraSnc(StExt_ExtraSnC_StatId_EnergyShield, halfDamage);
		};
		
		if (StExt_Config_DisableElementalExpFromDamage != true)
		{			
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Fire)) { StExt_AddMasteryExp(StExt_MasteryIndex_Fire, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Ice)) { StExt_AddMasteryExp(StExt_MasteryIndex_Ice, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Electric)) { StExt_AddMasteryExp(StExt_MasteryIndex_Electric, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Air)) { StExt_AddMasteryExp(StExt_MasteryIndex_Air, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Earth)) { StExt_AddMasteryExp(StExt_MasteryIndex_Earth, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Light)) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Dark)) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Death)) { StExt_AddMasteryExp(StExt_MasteryIndex_Death, halfDamage); };
			if (StExt_ValueHasFlag(damType, StExt_DamageType_Life) || StExt_ValueHasFlag(damType, StExt_DamageType_Poision)) { StExt_AddMasteryExp(StExt_MasteryIndex_Life, halfDamage); };
		};
	};
};

func void StExt_LevelingOnTick()
{
	var c_item armor;
	var int agileBonus;
	if (StExt_GamePaused()) { return; };
	
	agileBonus = 0;
	armor = Npc_GetEquippedArmor(hero);
	if (hlp_getinstanceid(armor) != no_armor) { agileBonus += 1 + armor.weight;	};
	if (aiv_shield) { agileBonus += 2; };
	StExt_AddMasteryExp(StExt_MasteryIndex_Agile, agileBonus);
	if (StExt_HeroIsTransformed()) { StExt_AddMasteryExp(StExt_MasteryIndex_Life, 1 + ((hero.level + 1) / 10)); };
	
	StExt_HeroMasteriesLearned = StExt_GetLearnedMasteriesCount();
	StExt_HeroMasteriesMax = StExt_GetMaxMasteriesToLearn();
};

//===================================================================//
//		Migracja punktow perkow v2 (progi 350/400/600/750/900)		 //
//===================================================================//
// Progi punktow strzelaja TYLKO w momencie wbicia poziomu masterii -
// postac, ktora juz przekroczyla nowy prog, nigdy by go nie dostala.
// Ta migracja (wolana raz per save z StExt_OnLoadEnd) przyznaje zalegle
// punkty za nowe progi wstecz. Stare progi (100-300, 450) NIE sa tu
// liczone - te postac dostala normalnie przy wbijaniu.

func void StExt_MigrateMasteryPerkPointsV2_One(var int masteryId)
{
	var int lvl;
	var int granted;

	lvl = StExt_Array_GetInt(StExt_MasteryArrayIndex_Progress, masteryId);
	granted = 0;
	if (lvl >= 350) { granted += 1; };
	if (lvl >= 400) { granted += 1; };
	if (lvl >= 600) { granted += 1; };
	if (lvl >= 750) { granted += 1; };
	if (lvl >= 900) { granted += 1; };
	if (granted > 0)
	{
		StExt_ChangeMasteryPerkPoints(masteryId, granted);
		StExt_Trace(concatstrings(concatstrings("MIGRACJA perk-pkt: masteria ", inttostring(masteryId)), concatstrings(" +", inttostring(granted))));
	};
};

func void StExt_MigrateMasteryPerkPointsV2()
{
	if (StExt_MasteryPerkPoints_MigratedV2) { return; };
	StExt_MasteryPerkPoints_MigratedV2 = true;
	StExt_MigrateMasteryPerkPointsV2_One(0);
	StExt_MigrateMasteryPerkPointsV2_One(1);
	StExt_MigrateMasteryPerkPointsV2_One(2);
	StExt_MigrateMasteryPerkPointsV2_One(3);
	StExt_MigrateMasteryPerkPointsV2_One(4);
	StExt_MigrateMasteryPerkPointsV2_One(5);
	StExt_MigrateMasteryPerkPointsV2_One(6);
	StExt_MigrateMasteryPerkPointsV2_One(7);
	StExt_MigrateMasteryPerkPointsV2_One(8);
	StExt_MigrateMasteryPerkPointsV2_One(9);
	StExt_MigrateMasteryPerkPointsV2_One(10);
	StExt_MigrateMasteryPerkPointsV2_One(11);
	StExt_MigrateMasteryPerkPointsV2_One(12);
	StExt_MigrateMasteryPerkPointsV2_One(13);
	StExt_MigrateMasteryPerkPointsV2_One(14);
	StExt_MigrateMasteryPerkPointsV2_One(15);
};
