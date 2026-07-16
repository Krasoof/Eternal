// Initialize pc stats on mod start after hero was created
func void StExt_InitializeHero()
{
	StExt_PrintDebugStack("StExt_InitializePlayer()");
	if (!StExt_HeroInitialized)
	{
		StExt_CheckUid(hero);
	
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistEdge] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistBlunt] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistFire] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistMagic] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistFly] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistPoint] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxResistPoison] = StExt_Resists_SoftCap;
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxAoeResist] = StExt_Resists_SoftCap;	
		StExt_PcStats_Perm[StExt_PcStats_Index_MaxDodgeChance] = StExt_Resists_SoftCap;
		StExt_Array_SetInt("StExt_PcStats_Perm", StExt_PcStats_Index_MaxDotResist, StExt_Resists_SoftCap);
		StExt_Array_SetInt("StExt_PcStats_Perm", StExt_PcStats_Index_MaxReflectResist, StExt_Resists_SoftCap);		

		StExt_PcStats_Perm[StExt_PcStats_Index_AuraDist] = StExt_AurasDistance_Base;
		StExt_PcStats_Perm[StExt_PcStats_Index_AuraPower] = StExt_AurasPower_Base;
		StExt_PcStats_Perm[StExt_PcStats_Index_AuraChance] = StExt_AurasChance_Base;
		StExt_PcStats_Perm[StExt_PcStats_Index_AuraCountMax] = StExt_AurasCount_Base;
		
		StExt_Array_FillInt("StExt_Aura_Slot", StExt_Null);	
		StExt_Array_FillInt("StExt_Talent_ExpNext", StExt_Mastery_ExpPerLevel);
		StExt_CorruptionPath = StExt_Corruption_None;
		
		StExt_Grimoir_ExpNext = StExt_ArtifactExpPerLevel;
		StExt_Dagger_ExpNext = StExt_ArtifactExpPerLevel;
		
		StExt_ExtraSnCStat_EnergyShield_ExpNext = 500;
		
		Hlp_DoEvent("StExt_Evt_OnHeroInitialized");
		StExt_HeroInitialized = true;
		StExt_PrintDebugStack("StExt_InitializePlayer() -> Player initialized!");
	};
};

// Return name of bonuses source array
func string StExt_GetPlayerStatArray(var int index)
{
	var string result;
	if ((index >= 0) && (index < StExt_PcStat_Source_Max)) 
	{ 
		result = StExt_Array_GetString("StExt_PcStat_SourceIndex", index);
		return result;
	};
	StExt_PrintDebugStack(concatstrings("StExt_GetPlayerStatArray(var int index) -> Unknown index: ", inttostring(index)));
	return StExt_EmptyString;
};

func void StExt_ValidatePcStats_ValidateResist(var int indexMax, var int indexResist)
{
	var int maxResist;
	var int resist;
	
	maxResist = StExt_Array_GetInt(StExt_PcStatsArrayName, indexMax);
	maxResist = StExt_ValidateValueRange(maxResist, 0, StExt_Resists_HardCap);
	StExt_Array_SetInt(StExt_PcStatsArrayName, indexMax, maxResist);
	
	resist = StExt_Array_GetInt(StExt_PcStatsArrayName, indexResist);
	resist = StExt_ValidateValueRange(resist, 0, maxResist);
	StExt_Array_SetInt(StExt_PcStatsArrayName, indexResist, resist);
};

func void StExt_ValidatePcStats()
{
	StExt_PcStats[StExt_PcStats_Index_MaxResistEdge] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistEdge], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxResistBlunt] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistBlunt], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxResistFire] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistFire], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxResistMagic] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistMagic], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxResistFly] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistFly], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxResistPoint] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistPoint], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxResistPoison] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxResistPoison], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxDodgeChance] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxDodgeChance], 0, StExt_Resists_HardCap);
	StExt_PcStats[StExt_PcStats_Index_MaxAoeResist] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_MaxAoeResist], 0, StExt_Resists_HardCap);
	
	StExt_ValidatePcStats_ValidateResist(StExt_PcStats_Index_MaxDotResist, StExt_PcStats_Index_ResistDot);
	StExt_ValidatePcStats_ValidateResist(StExt_PcStats_Index_MaxReflectResist, StExt_PcStats_Index_ResistReflect);
	
	StExt_PcStats[StExt_PcStats_Index_ResistEdge] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistEdge], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistEdge]);
	StExt_PcStats[StExt_PcStats_Index_ResistBlunt] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistBlunt], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistBlunt]);
	StExt_PcStats[StExt_PcStats_Index_ResistFire] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistFire], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistFire]);
	StExt_PcStats[StExt_PcStats_Index_ResistMagic] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistMagic], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistMagic]);
	StExt_PcStats[StExt_PcStats_Index_ResistFly] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistFly], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistFly]);
	StExt_PcStats[StExt_PcStats_Index_ResistPoint] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistPoint], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistPoint]);
	StExt_PcStats[StExt_PcStats_Index_ResistPoison] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ResistPoison], 0, StExt_PcStats[StExt_PcStats_Index_MaxResistPoison]);
	StExt_PcStats[StExt_PcStats_Index_DodgeChance] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_DodgeChance], 0, StExt_PcStats[StExt_PcStats_Index_MaxDodgeChance]);
	StExt_PcStats[StExt_PcStats_Index_AoeResist] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_AoeResist], 0, StExt_PcStats[StExt_PcStats_Index_MaxAoeResist]);

	hero.protection[prot_blunt] = StExt_ValidateValueRange(hero.protection[prot_blunt], 0, StExt_Protection_HardCap);
	hero.protection[prot_edge] = StExt_ValidateValueRange(hero.protection[prot_edge], 0, StExt_Protection_HardCap);
	hero.protection[prot_fire] = StExt_ValidateValueRange(hero.protection[prot_fire], 0, StExt_Protection_HardCap);
	hero.protection[prot_fly] = StExt_ValidateValueRange(hero.protection[prot_fly], 0, StExt_Protection_HardCap);
	hero.protection[prot_magic] = StExt_ValidateValueRange(hero.protection[prot_magic], 0, StExt_Protection_HardCap);	
	hero.protection[prot_point] = StExt_ValidateValueRange(hero.protection[prot_point], 0, StExt_Protection_HardCap);
	
	StExt_PcStats[StExt_PcStats_Index_ReservedHpPerc] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ReservedHpPerc], 0, StExt_StatReservation_HardCap);
	StExt_PcStats[StExt_PcStats_Index_ReservedMpPerc] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ReservedMpPerc], 0, StExt_StatReservation_HardCap);
	StExt_PcStats[StExt_PcStats_Index_ReservedStPerc] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ReservedStPerc], 0, StExt_StatReservation_HardCap);
	StExt_PcStats[StExt_PcStats_Index_ReservedEsPerc] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_ReservedEsPerc], 0, StExt_StatReservation_HardCap);
	additionalacceleration = StExt_ValidateValueRange(additionalacceleration, 0, StExt_ActionsSpeed_HardCap);
	
	StExt_PcStats[StExt_PcStats_Index_AuraConsumptionReduction] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_AuraConsumptionReduction], 0, StExt_AurasConsumptionReduction_HardCap);
	StExt_PcStats[StExt_PcStats_Index_AuraDist] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_AuraDist], 0, StExt_AurasDistance_HardCap);
	StExt_PcStats[StExt_PcStats_Index_AuraCountMax] = StExt_ValidateValueRange(StExt_PcStats[StExt_PcStats_Index_AuraCountMax], 0, StExt_AurasCount_HardCap);
};

// Bind mod stats with AiVars and default game attributes
func void StExt_HandlePcStatChange(var int statId, var int statVal)
{
	// TEMP DEBUG (usunac po diagnozie): tylko nowe staty 311+ (sygnal pierscienia,
	// bez szumu z co-sekundowych przeliczen dynamicznych). Osobny wiersz na
	// kazdy stat - rownoczesne printy w tym samym miejscu sie zakrywaly!
	if (statId >= 311)
	{
		printscreencolor(ConcatStrings(ConcatStrings("STATCHG id=", IntToString(statId)),
			ConcatStrings(" val=", IntToString(statVal))), 40, 30 + ((statId - 311) * 3), StExt_DefaultFont, 5, StExt_Color_Green);
	};

	if (statId == StExt_PcStats_Index_Hp) { hero.attribute[atr_hitpoints_max] += statVal; }
	else if (statId == StExt_PcStats_Index_Mp) { hero.attribute[atr_mana_max] += statVal; }
	else if (statId == StExt_PcStats_Index_Str) { hero.attribute[atr_strength] += statVal; }
	else if (statId == StExt_PcStats_Index_Agi) { hero.attribute[atr_dexterity] += statVal; }
	else if (statId == StExt_PcStats_Index_Int) { rx_changeintquiet(statVal); }
	else if (statId == StExt_PcStats_Index_Es) { StExt_Npc_ChangeMaxEs(hero, statVal); }
	else if (statId == StExt_PcStats_Index_St) { atr_stamina_max = StExt_ValidateValueMin(atr_stamina_max + statVal, 1); }	
	else if (statId == StExt_PcStats_Index_ProtBlunt) { hero.protection[prot_blunt] += statVal; }
	else if (statId == StExt_PcStats_Index_ProtEdge) { hero.protection[prot_edge] += statVal; }
	else if (statId == StExt_PcStats_Index_ProtFire) { hero.protection[prot_fire] += statVal; }
	else if (statId == StExt_PcStats_Index_ProtFly) { hero.protection[prot_fly] += statVal; }
	else if (statId == StExt_PcStats_Index_ProtMagic) { hero.protection[prot_magic] += statVal; }	
	else if (statId == StExt_PcStats_Index_ProtPoint) { hero.protection[prot_point] += statVal; }
	else if (statId == StExt_PcStats_Index_ProtFall) { hero.protection[prot_fall] += statVal; }
	else if (statId == StExt_PcStats_Index_ResistEdge) { StExt_Npc_ChangeEdgeResist(hero, statVal); }
	else if (statId == StExt_PcStats_Index_ResistBlunt) { StExt_Npc_ChangeBluntResist(hero, statVal); }
	else if (statId == StExt_PcStats_Index_ResistFire) { StExt_Npc_ChangeFireResist(hero, statVal);	}
	else if (statId == StExt_PcStats_Index_ResistMagic) { StExt_Npc_ChangeMagicResist(hero, statVal); }
	else if (statId == StExt_PcStats_Index_ResistFly) { StExt_Npc_ChangeFlyResist(hero, statVal); }
	else if (statId == StExt_PcStats_Index_ResistPoint) { StExt_Npc_ChangePointResist(hero, statVal); }
	else if (statId == StExt_PcStats_Index_ResistPoison) { StExt_Npc_ChangePoisionResist(hero, statVal); }
	else if (statId == StExt_PcStats_Index_AoeResist) { StExt_Npc_ChangeAoeResist(hero, statVal); }	
	else if (statId == StExt_PcStats_Index_ResistDot) { StExt_Npc_ChangeDotResist(hero, statVal); }	
	else if (statId == StExt_PcStats_Index_ResistReflect) { StExt_Npc_ChangeReflectResist(hero, statVal); }	
	else if (statId == StExt_PcStats_Index_DodgeChance) { StExt_Npc_ChangeDodgeChance(hero, statVal); }	
	else if (statId == StExt_PcStats_Index_MagicPower) { countlearnspell = StExt_ValidateValueMin(countlearnspell + statVal, 1); }
	else if (statId == StExt_PcStats_Index_ExtraSpeed) { additionalacceleration += statVal; }	
	else if (statId == StExt_PcStats_Index_1hMastery) 
	{ 
		hero.hitchance[1] = StExt_ValidateValueMin(hero.hitchance[1] + statVal, 0);
		hero.aivar[84] = hero.hitchance[1];
	}
	else if (statId == StExt_PcStats_Index_2hMastery) 
	{ 
		hero.hitchance[2] = StExt_ValidateValueMin(hero.hitchance[2] + statVal, 0);
		hero.aivar[85] = hero.hitchance[2];
	}
	else if (statId == StExt_PcStats_Index_BowMastery) 
	{
		hero.hitchance[3] = StExt_ValidateValueMin(hero.hitchance[3] + statVal, 0);		
		hero.aivar[86] = hero.hitchance[3];
		rx_setnpcvar(hero, aivrx_npc_atr_bow, hero.hitchance[3]);
	}
	else if (statId == StExt_PcStats_Index_CBowMastery) 
	{
		hero.hitchance[4] = StExt_ValidateValueMin(hero.hitchance[4] + statVal, 0);
		hero.aivar[87] = hero.hitchance[4];
		rx_setnpcvar(hero, aivrx_npc_atr_crossbow, hero.hitchance[4]);
	};
};

// Bind mod percent stats with AiVars and default game attributes
func void StExt_HandlePcStatPercentChange(var int statId, var int statVal)
{
	if (statId == StExt_PcStat_PercentIndex_Hp) { StExt_HandlePcStatChange(StExt_PcStats_Index_Hp, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_Mp) { StExt_HandlePcStatChange(StExt_PcStats_Index_Mp, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_Str) { StExt_HandlePcStatChange(StExt_PcStats_Index_Str, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_Agi) { StExt_HandlePcStatChange(StExt_PcStats_Index_Agi, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_Int) { StExt_HandlePcStatChange(StExt_PcStats_Index_Int, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_Es) { StExt_HandlePcStatChange(StExt_PcStats_Index_Es, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_Stam) { StExt_HandlePcStatChange(StExt_PcStats_Index_St, statVal); }	
	else if (statId == StExt_PcStat_PercentIndex_ProtBlunt) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtBlunt, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_ProtEdge) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtEdge, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_ProtFire) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtFire, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_ProtFly) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtFly, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_ProtMagic) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtMagic, statVal); }
	else if (statId == StExt_PcStat_PercentIndex_ProtFall) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtFall, statVal); }	
	else if (statId == StExt_PcStat_PercentIndex_ProtPoint) { StExt_HandlePcStatChange(StExt_PcStats_Index_ProtPoint, statVal); };
};

// Player stats handler - OnApply.
func void StExt_PlayerStat_OnApply(var int statId, var int statVal, var int statSource)
{
	var string source;
	var int oldValue;
	var int newValue;
	if (!StExt_StatIdValid(statId))
	{
		//StExt_PrintDebug("StExt_PlayerStat_OnApply()", concatstrings("Incorrect stat id: ", inttostring(statId)), self, other);
		return;
	};
	
	source = StExt_GetPlayerStatArray(statSource);
	if (!StExt_StringIsEmpty(source))
	{
		oldValue = StExt_Array_GetInt(source, statId);
		newValue = oldValue + statVal;
		StExt_Array_SetInt(source, statId, newValue);
		StExt_HandlePcStatChange(statId, statVal);		
		StExt_ValidatePcStats();
	}
	else { StExt_PrintDebugStack("StExt_PlayerStat_OnApply() -> statSource is empty!"); };
};

// Player stats handler - OnRemove.
func void StExt_PlayerStat_OnRemove(var int statId, var int statVal, var int statSource)
{
	var string source;
	var int oldValue;
	var int newValue;
	if (!StExt_StatIdValid(statId))
	{
		//StExt_PrintDebug("StExt_PlayerStat_OnRemove()", concatstrings("Incorrect stat id: ", inttostring(statId)), self, other);
		return;
	};
	
	source = StExt_GetPlayerStatArray(statSource);
	if (!StExt_StringIsEmpty(source))
	{
		oldValue = StExt_Array_GetInt(source, statId);
		newValue = oldValue - statVal;
		if(newValue < 0) { newValue = 0; };
		StExt_HandlePcStatChange(statId, -statVal);	
		StExt_Array_SetInt(source, statId, newValue);	
		StExt_ValidatePcStats();
	}
	else { StExt_PrintDebugStack("StExt_PlayerStat_OnRemove() -> statSource is empty!"); };
};

// Remove bonuses from specific source
func void StEtx_RemovePcStatsSource_Loop(var int index, var int value) { StExt_HandlePcStatChange(index, -value); };
func int StEtx_RemovePcStatsSource(var int statSource)
{
	var string source;
	source = StExt_GetPlayerStatArray(statSource);
	if (!StExt_StringIsEmpty(source)) { StExt_Array_ForEachInt(source, StEtx_RemovePcStatsSource_Loop); }
	else { StExt_PrintDebugStack("StEtx_RemovePcStatsSource() -> statSource is empty!"); };
};

// Apply bonuses from specific source
func void StEtx_ApplyPcStatsSource_Loop(var int index, var int value) { StExt_HandlePcStatChange(index, value); };
func int StEtx_ApplyPcStatsSource(var int statSource)
{
	var string source;
	source = StExt_GetPlayerStatArray(statSource);
	if (!StExt_StringIsEmpty(source)) { StExt_Array_ForEachInt(source, StEtx_ApplyPcStatsSource_Loop); }
	else { StExt_PrintDebugStack("StEtx_ApplyPcStatsSource() -> statSource is empty!"); };
};

// Process player dynamic/scaling bonuses from skills/perks/talents.
func int StExt_ProcessPcDynamicStats()
{
	var c_item armor;
	var c_item meeleWeap;
	var string arrayName;
	var int tmpMult;
	var int dynamicMasteryBonus;
	
	arrayName = StExt_PcStat_SourceIndex[StExt_PcStat_Source_Dynamic];
	armor = Npc_GetEquippedArmor(hero);
	if (npc_hasreadiedmeleeweapon(hero)) { meeleWeap = npc_getreadiedweapon(hero); }
	else { meeleWeap = npc_getequippedmeleeweapon(hero); };
	
	StEtx_RemovePcStatsSource(StExt_PcStat_Source_Dynamic);
	StExt_Array_FillInt(arrayName, 0);
	
	dynamicMasteryBonus = StExt_DynamicBonusForMasteryRank;
	StExt_ElementAffinity_Fire = false;
	StExt_ElementAffinity_Ice = false;
	StExt_ElementAffinity_Electric = false;
	StExt_ElementAffinity_Air = false;
	StExt_ElementAffinity_Earth = false;
	StExt_ElementAffinity_Light = false;
	StExt_ElementAffinity_Dark = false;
	StExt_ElementAffinity_Death = false;
	StExt_ElementAffinity_Life = false;
	StExt_ElementAffinity_Shaman = false;
	StExt_ElementAffinity_Blood = false;
	
	//*********************************
	// ReCalculate bonuses for dynamic
	//*********************************	
	StExt_PcStats_Dynamic[StExt_PcStats_Index_FireMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Fire];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_IceMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Ice];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ElectricMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Electric];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_AirMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Air];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_EarthMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_LightMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Light];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_DarkMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Dark];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_DeathMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Death];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_LifeMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Life];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_GolemMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Golem];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_DemonMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Demon];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_NecroMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Necro];
	
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ShamanMasteryPower] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraSpellDam] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
	
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraMeleeDam] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraRangeDam] += dynamicMasteryBonus * StExt_Talent_Progression[StExt_MasteryIndex_Archery];
	
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtEdge] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtBlunt] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFire] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFly] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtPoint] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFall] += StExt_Talent_Progression[StExt_MasteryIndex_Agile];
	
	// fire mastery bonuses
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_AshHerald)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraFireDam] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Fire];
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_Burner)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_FireDotDamage] += StExt_Talent_Progression[StExt_MasteryIndex_Fire];
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_FireRelation)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistFire] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Fire];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_LavaCoat)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFire] += StExt_Talent_Progression[StExt_MasteryIndex_Fire];
	};
	
	// ice mastery bonuses
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_WinterEmbrace)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_FreezeChance] += StExt_Talent_Progression[StExt_MasteryIndex_Ice];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_IceRelation)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistMagic] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Ice];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_IceCoat)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += StExt_Talent_Progression[StExt_MasteryIndex_Ice];
	};
	
	// electric mastery bonuses
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Stuner)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_StunChance] += StExt_Talent_Progression[StExt_MasteryIndex_Electric];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_ChargedShield)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Electric];
	};
	
	// air mastery bonuses
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_StormHerald)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraFlyDam] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Air];
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_Suffocation)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_FlyDotDamage] += StExt_Talent_Progression[StExt_MasteryIndex_Air];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_Levity)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_DodgeChance] += StExt_Talent_Progression[StExt_MasteryIndex_Air];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_AirShield)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ArrowsDeclineChance] += 2 * StExt_Talent_Progression[StExt_MasteryIndex_Air];
	};
	
	// earth master bonuses
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_Durability)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFly] += 2 * StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_StoneSkin)) 
	{
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistEdge] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistBlunt] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistPoint] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_Concussion)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_StunChance] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_Crushing)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_BluntDotDamage] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_StonedFist)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraBluntDam] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_EarthShield))
	{
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtBlunt] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtEdge] += StExt_Talent_Progression[StExt_MasteryIndex_Earth];
	};
	
	// light mastery perks	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_HollyShield)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light];
	};
	
	// death mastery perks
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathToll)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_StealLifePerc] += StExt_Talent_Progression[StExt_MasteryIndex_Death];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_BoneShield)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += StExt_Talent_Progression[StExt_MasteryIndex_Death];
	};
	
	// life mastery perks
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_LovingMaster)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_SumAnimalHealing] += StExt_Talent_Progression[StExt_MasteryIndex_Life];
	};
	
	// shaman mastery perks
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_SpirithFlesh)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += 5 * StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
	};	
	if (Hlp_IsValidItem(armor))
	{
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_Latnik)) 
		{
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtBlunt] += StExt_GetPercentFromValue(armor.protection[prot_blunt], 25);
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtEdge] += StExt_GetPercentFromValue(armor.protection[prot_edge], 25);
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFire] += StExt_GetPercentFromValue(armor.protection[prot_fire], 25);
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFly] += StExt_GetPercentFromValue(armor.protection[prot_fly], 25);
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += StExt_GetPercentFromValue(armor.protection[prot_magic], 25);
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtPoint] += StExt_GetPercentFromValue(armor.protection[prot_point], 25);
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_RunicScript)) {
			StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += 100 + (hero.level * 5) + ((armor.protection[3] + armor.protection[4] + armor.protection[5]) * 2);
		};
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_RobedFighter)) { magerobeisup = true; };
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Paladin)) 
		{  
			StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += armor.protection[0] + armor.protection[1] + armor.protection[2] +
				armor.protection[3] + armor.protection[4] + armor.protection[5] + armor.protection[6] + armor.protection[7];
		};
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_AstralVampire)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_StealEsPerc] += StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
		StExt_PcStats_Dynamic[StExt_PcStats_Index_StealManaPerc] += StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_AstralTrance)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_EsRegPerc] += StExt_Talent_Progression[StExt_MasteryIndex_Shaman];
	};
	
	// matrial arts perks
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_TwoHandedFan)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_2hExtraDamPerc] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_OneHandedFan)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_1hExtraDamPerc] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_DualFan)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_DualExtraDamPerc] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_MightStrike)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_StunChance] += StExt_Talent_Progression[StExt_MasteryIndex_MartialArts];
	};	

	// agile mastery perks
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ProtBlunt)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtBlunt] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ProtEdge)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtEdge] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ProtFire)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFire] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ProtFly)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFly] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ProtMagic)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ProtPoint)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtPoint] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_ShieldBearer) && rx_isshieldequipped()) 
	{
		tmpMult = 5 * StExt_Talent_Progression[StExt_MasteryIndex_Agile];
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtBlunt] += StExt_GetPermilleFromValue(armor.protection[prot_blunt], tmpMult);
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtEdge] += StExt_GetPermilleFromValue(armor.protection[prot_edge], tmpMult);
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFire] += StExt_GetPermilleFromValue(armor.protection[prot_fire], tmpMult);
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFly] += StExt_GetPermilleFromValue(armor.protection[prot_fly], tmpMult);
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += StExt_GetPermilleFromValue(armor.protection[prot_magic], tmpMult);
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtPoint] += StExt_GetPermilleFromValue(armor.protection[prot_point], tmpMult);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_Dexterity)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_DodgeChance] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_Sustainability)) 
	{
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistEdge] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistBlunt] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistFire] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistMagic] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistFly] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistPoint] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_ResistPoison] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
		StExt_PcStats_Dynamic[StExt_PcStats_Index_AoeResist] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; 
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_RunicHardening)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_AbsorbSpellChance] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_Grace)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ArrowsDeclineChance] += StExt_Talent_Progression[StExt_MasteryIndex_Agile]; };

	// archery perks
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_BowFan)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_BowExtraDamPerc] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_CBowFan)) {
		StExt_PcStats_Dynamic[StExt_PcStats_Index_CBowExtraDamPerc] += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery];
	};	

	// other perks	
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Ritualist)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_MaxSummonsCount] += 1 + ((atr_intellect + 1) / 500); };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Versatility)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_AuraCountMax] += 1 + ((hero.level + 1) / 35); };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SteelWill)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_AuraPower] += hero.level * 5; };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Outlook)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_AuraDist] += hero.level * 10; };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_BeginerFighter)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraMeleeDam] += 100 + (hero.level * 5); };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_BeginerRanger)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraRangeDam] += 100 + (hero.level * 5); };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_BeginerMage)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraSpellDam] += 100 + (hero.level * 5); };
	if (StExt_WeaponIsMagic(meeleWeap))
	{
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_WarlockAtam)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_SumGlobalPower] += (StExt_CalcWeaponTotalDamage(meeleWeap) + 5) / 2; };
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_MagicConductor)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraSpellDamPerc] += StExt_CalcWeaponTotalDamage(meeleWeap); };
	};
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Hardening)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_IncomingDamageReductionPerc] += 100 + hero.level; };

	// corruption perks
	// mage
	if (StExt_CorruptionPath == StExt_Corruption_Mage)
	{
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_HidenOut)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += StExt_GetPermilleFromValue(hero.attribute[atr_hitpoints_max], 300); };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_QuickWit)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_SpellCritChance] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_Warlock)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraSpellDamPerc] += 20 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_EssenceInfusion)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_SumGlobalPower] += 20 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_UnholyGuardian)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ReflectSpellChance] += 5 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_SpellEcho)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_SpellDoubleCastChance] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_MysticalStorage)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_Es] += StExt_GetPermilleFromValue(hero.attribute[atr_mana_max], 500); };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_WillPower)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_EffectDuration] += 30 * StExt_CorruptionPath_Level; };
	};
	
	// warion
	if (StExt_CorruptionPath == StExt_Corruption_Warrior)
	{
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Goliaf)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_Hp] += 50 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Atlet)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_StRegPerc] += StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Adrenaline) && rx_checkhealthpercent(hero, 30)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_HpRegPerc] += 50; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Indestructeble))
		{ 
			tmpMult = 2 * StExt_CorruptionPath_Level;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtBlunt] += tmpMult;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtEdge] += tmpMult;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFire] += tmpMult;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFly] += tmpMult;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtMagic] += tmpMult;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtPoint] += tmpMult;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_ProtFall] += tmpMult;
		};
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_PathOfWarrior)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraMeleeDamPerc] += 20 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Barbarism)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_WeapDoubleDamageChance] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_MadnessOfFight)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_StunChance] += 5 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_ArmyService)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_CBowExtraDamPerc] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Parry)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_1hExtraDamPerc] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Slasher)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_2hExtraDamPerc] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Balance)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_Agi] += StExt_GetPermilleFromValue(hero.attribute[atr_strength], 300); };
	};
	
	// ranger
	if (StExt_CorruptionPath == StExt_Corruption_Ranger)
	{
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_ShadowDance)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ChanceToInvis] += 3 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Dodge)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_DodgeChance] += 5 * StExt_CorruptionPath_Level; };		
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_MightyPierce)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_PointDotDamage] += 10 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Balistic)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraRangeDamPerc] += 20 * StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Atlet)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_StReg] += StExt_CorruptionPath_Level; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Flyweight)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_ExtraSpeed] += StExt_ValidateValueRange((StExt_CorruptionPath_Level + 1) / 2, 1, 50); };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_ForceOfNature)) 
		{
			StExt_PcStats_Dynamic[StExt_PcStats_Index_AddFireDamPerc] += 10 * StExt_CorruptionPath_Level; 
			StExt_PcStats_Dynamic[StExt_PcStats_Index_AddFlyDamPerc] += 10 * StExt_CorruptionPath_Level;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_AddMagicDamPerc] += 10 * StExt_CorruptionPath_Level;
			StExt_PcStats_Dynamic[StExt_PcStats_Index_AddPoisonDamPerc] += 10 * StExt_CorruptionPath_Level;
		};
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Grace) && (sprint_active || (rx_speedpotion > 0))) { StExt_PcStats_Dynamic[StExt_PcStats_Index_DodgeChance] += 500; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Balance)) { StExt_PcStats_Dynamic[StExt_PcStats_Index_Str] += StExt_GetPermilleFromValue(hero.attribute[atr_dexterity], 300); };
	};
	
	StEtx_ApplyPcStatsSource(StExt_PcStat_Source_Dynamic);
};

// Process player percent stats
func int StEtx_RemovePcStatsPercents_Loop(var int index, var int value) { StExt_HandlePcStatPercentChange(index, -value); };
func int StEtx_ApplyPcStatsPercents_Loop(var int index, var int value) { StExt_HandlePcStatPercentChange(index, value); };
func int StExt_ProcessPcStatsPercents()
{
	StExt_Array_ForEachInt("StExt_PcStats_PercentValues", StEtx_RemovePcStatsPercents_Loop);
	
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Hp] = StExt_GetPermilleFromValue(hero.attribute[atr_hitpoints_max], StExt_PcStats[StExt_PcStats_Index_HpPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Mp] = StExt_GetPermilleFromValue(hero.attribute[atr_mana_max], StExt_PcStats[StExt_PcStats_Index_MpPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Str] = StExt_GetPermilleFromValue(hero.attribute[atr_strength], StExt_PcStats[StExt_PcStats_Index_StrPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Agi] = StExt_GetPermilleFromValue(hero.attribute[atr_dexterity], StExt_PcStats[StExt_PcStats_Index_AgiPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Es] = StExt_GetPermilleFromValue(StExt_Npc_GetMaxEs(hero), StExt_PcStats[StExt_PcStats_Index_EsPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Int] = StExt_GetPermilleFromValue(atr_intellect, StExt_PcStats[StExt_PcStats_Index_IntPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Stam] = StExt_GetPermilleFromValue(atr_stamina_max, StExt_PcStats[StExt_PcStats_Index_StPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtBlunt] = StExt_GetPermilleFromValue(hero.protection[prot_blunt], StExt_PcStats[StExt_PcStats_Index_ProtBluntPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtEdge] = StExt_GetPermilleFromValue(hero.protection[prot_edge], StExt_PcStats[StExt_PcStats_Index_ProtEdgePerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtFire] = StExt_GetPermilleFromValue(hero.protection[prot_fire], StExt_PcStats[StExt_PcStats_Index_ProtFirePerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtFly] = StExt_GetPermilleFromValue(hero.protection[prot_fly], StExt_PcStats[StExt_PcStats_Index_ProtFlyPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtMagic] = StExt_GetPermilleFromValue(hero.protection[prot_magic], StExt_PcStats[StExt_PcStats_Index_ProtMagicPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtPoint] = StExt_GetPermilleFromValue(hero.protection[prot_point], StExt_PcStats[StExt_PcStats_Index_ProtPointPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_ProtFall] = StExt_GetPermilleFromValue(hero.protection[prot_fall], StExt_PcStats[StExt_PcStats_Index_ProtFallPerc]);
	
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_HpReg] = StExt_GetPermilleFromValue(hero.attribute[atr_hitpoints_max], StExt_PcStats[StExt_PcStats_Index_HpRegPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_MpReg] = StExt_GetPermilleFromValue(hero.attribute[atr_mana_max], StExt_PcStats[StExt_PcStats_Index_MpRegPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_EsReg] = StExt_GetPermilleFromValue(StExt_Npc_GetMaxEs(hero), StExt_PcStats[StExt_PcStats_Index_EsRegPerc]);
	StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_StamReg] = StExt_GetPermilleFromValue(atr_stamina_max * 10, StExt_PcStats[StExt_PcStats_Index_StRegPerc]);
	
	StExt_Array_ForEachInt("StExt_PcStats_PercentValues", StEtx_ApplyPcStatsPercents_Loop);
};

func int StExt_GetPcSlotItemWeight(var string slotName)
{
	var c_item itm;
	if (StExt_HeroIsTransformed()) { return 0; };
	
	itm = Npc_GetSlotItem(hero, slotName);
	if(hlp_isvaliditem(itm)) { return itm.weight; };
	return 0;
};

func int StExt_GetCurrentStamRegeneration() 
{
    var int staminabonus;
	var int level;
	var int equipmentWeight;
	var int heroIsTransformed;
	
    staminabonus = 0;
	equipmentWeight = 0;
	heroIsTransformed = StExt_HeroIsTransformed();

    if (rx_healerset && (!heroIsTransformed)) { staminabonus += 1; };
    if (trophy_arena && (!heroIsTransformed)) { staminabonus += 1; };
    if (trophy_skalozubisup && (!heroIsTransformed)) { staminabonus += 1; };
	if (((!playerissick) && (!poisoned)) && (rx_serafisbonus > 0)) { staminabonus += 1; };
	if(rx_rerenstatring) { staminabonus += 1; };
   
    if((playerissick == false) && (sbmode == true) && (hero_fatigue >= 1) && (heroIsTransformed == false) && (endgamecredits == false) && (heroisdead == false) && (hero.attribute > 0) && (poisoned == false) && (!c_bodystatecontains(hero, bs_swim)) || (!c_bodystatecontains(hero, bs_dive)) || (!c_bodystatecontains(hero, bs_climb)) || (!c_bodystatecontains(hero, bs_jump)) || (!c_bodystatecontains(hero, bs_sprint)) || rx_isaniactive(hero, "S_SWIM"))
	{
        if(!rx_isnightmarearena()) { staminabonus += 1; };
        if(rx_bonusstaregen) { staminabonus += 2; };
        if(vatras_teachregenstam) 
		{
            staminabonus += 1;
            if(vatras_teachregenstam_level2) 
			{
                staminabonus += 3;
                if((hero.guild == gil_tpl) && rx_checktplguild()) { staminabonus += 1; };
            };
        };
    };	
	if((hero.guild == gil_tpl) && rx_checktplguild()) { staminabonus += 1; };
    if(rx_isvampire()) 
	{
		level = rx_vampirelevel;
        if((rx_vampirewaytype == 2) && (rx_vamp_skillfist_staminarestore > 0)) 
		{
            if((npc_isinfightmode(hero, fmode_fist) == true) || (npc_isinfightmode(hero, fmode_none) == true)) 
			{
                if(rx_vamp_skillfist_staminarestore == 1) { staminabonus += 2; }
                else if(rx_vamp_skillfist_staminarestore == 2) { staminabonus += 4; }
                else { staminabonus += 6; };
            };
        };
		
		if(getthirstlevel() <= 0) 
		{
            if(level == 1) { staminabonus += 1; }
			else if(level == 2) { staminabonus += 1; }
			else if(level == 3) { staminabonus += 2; }
			else if(level == 4) { staminabonus += 3; };
			
			if(rx_vamp_skill_regen == 1) { staminabonus += 1; }
			else if(rx_vamp_skill_regen == 2) { staminabonus += 2; };
        };        
    };
    if((trophy_dragonskullisup == true) && (heroIsTransformed == false) && (endgamecredits == false) && (heroisdead == false)) {
        if(reload_dragonskull >= 1) { staminabonus += 2; };
    };
	
	if (!heroIsTransformed) 
	{
		equipmentWeight += StExt_GetPcSlotItemWeight(StExt_WearSlot_Torso);
		equipmentWeight += StExt_GetPcSlotItemWeight(StExt_WearSlot_Pants);
		equipmentWeight += StExt_GetPcSlotItemWeight(StExt_WearSlot_Gloves);
		equipmentWeight += StExt_GetPcSlotItemWeight(StExt_WearSlot_Boots);
	};

	return staminabonus - equipmentWeight;
};

func int StExt_GetTruePcMana()
{
	var int delta;
	delta = StExt_PcStats_Items[StExt_PcStats_Index_Mp] + StExt_PcStats_Talismans[StExt_PcStats_Index_Mp] + 
		StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Mp] + StExt_PcStats_Dynamic[StExt_PcStats_Index_Mp] + 
		StExt_PcStats_Alchemy_Value[StExt_PcStats_Index_Mp] + StExt_PcStats_Buffs_Value[StExt_PcStats_Index_Mp] + StExt_PcStats_Auras[StExt_PcStats_Index_Mp];
	
	if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Grimoir) { delta += StExt_PcStats_Grimoir[StExt_PcStats_Index_Mp]; }
	else if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Dagger) { delta += StExt_PcStats_Dagger[StExt_PcStats_Index_Mp]; };
	return StExt_ValidateValueMin(hero.attribute[3] - delta, 0);
};

func int StExt_GetTruePcHealth()
{
	var int delta;
	delta = StExt_PcStats_Items[StExt_PcStats_Index_Hp] + StExt_PcStats_Talismans[StExt_PcStats_Index_Hp] + 
		StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_Hp] + StExt_PcStats_Dynamic[StExt_PcStats_Index_Hp] + 
		StExt_PcStats_Alchemy_Value[StExt_PcStats_Index_Hp] + StExt_PcStats_Buffs_Value[StExt_PcStats_Index_Hp] + StExt_PcStats_Auras[StExt_PcStats_Index_Hp];
	
	if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Grimoir) { delta += StExt_PcStats_Grimoir[StExt_PcStats_Index_Hp]; }
	else if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Dagger) { delta += StExt_PcStats_Dagger[StExt_PcStats_Index_Hp]; };
	return StExt_ValidateValueMin(hero.attribute[3] - delta, 0);
};


// Call every second and update pc stats
func void StExt_ProcessPcStats()
{
	var int hpReg;
	var int mpReg;
	var int esReg;
	var int stReg;
	var int maxEs;
	
	if (StExt_HeroIsTransformed()) 
	{ 
		additionalacceleration = StExt_PcCurrentAcceleration;
		StExt_PcWasTransformed = true;
		return; 
	};
	if (StExt_PcWasTransformed)
	{
		StExt_PcWasTransformed = false;
		additionalacceleration = StExt_PcCurrentAcceleration;
	};
	
	maxEs = StExt_Npc_GetMaxEs(hero);	
	StExt_ProcessPcDynamicStats();		// Apply mods from skills and perks
	StExt_ProcessPcInventory();
	StExt_UpdatePcStats();
	StExt_ProcessPcStatsPercents();		// Apply percent stats
	StExt_ValidatePcStats();			// Make shure that stats values in valid ranges	
	
	StExt_ProcessPcStats_Overcap();
	getsummoncountmax();
	
	// Do regeneration
	hpReg = StExt_PcStats[StExt_PcStats_Index_HpReg] + StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_HpReg];
	mpReg = StExt_PcStats[StExt_PcStats_Index_MpReg] + StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_MpReg];
	esReg = StExt_PcStats[StExt_PcStats_Index_EsReg] + StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_EsReg];
	stReg = StExt_PcStats[StExt_PcStats_Index_StReg] + StExt_PcStats_PercentValues[StExt_PcStat_PercentIndex_StamReg];
	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_FavourableWind) && (sprint_active || (rx_speedpotion > 0))) 
	{
		hpReg += StExt_GetPermilleFromValue(hero.attribute[atr_hitpoints_max], 10);
		mpReg += StExt_GetPermilleFromValue(hero.attribute[atr_mana_max], 10);
	};	
	if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_ZealotVow)) {
		esReg += hpReg;
		hpReg = 0;
	};
	
	StExt_UpdateUncaperStat(StExt_UncaperStatIndex_StamMax);
	if ((atr_stamina >= 1000) && (atr_stamina < (atr_stamina_max * 10))) { stReg += StExt_GetCurrentStamRegeneration(); };
	if ((maxEs > 0) && (esReg == 0)) { esReg += 1; };
	
	if (accelerationactive) 
	{ 
		hpReg = hpReg * accelerationratio;
		esReg = esReg * accelerationratio;
		mpReg = mpReg * accelerationratio;
		stReg = stReg * accelerationratio;
	};
	StExt_PcEsRegBuffer = esReg;
	
	StExt_Npc_Restorehealth(hero, hpReg);
	StExt_Npc_ChangeEs(hero, esReg);
	rx_restoremana(mpReg);
	rx_restorestamina(stReg);
	StExt_PcCurrentAcceleration = additionalacceleration;
	
	// Calcualte stats reservation
	StExt_LifeReserved = StExt_GetPercentFromValue(hero.attribute[atr_hitpoints_max], StExt_PcStats[StExt_PcStats_Index_ReservedHpPerc]);
	StExt_ManaReserved = StExt_GetPercentFromValue(hero.attribute[atr_mana_max], StExt_PcStats[StExt_PcStats_Index_ReservedMpPerc]);
	StExt_EsReserved = StExt_GetPercentFromValue(maxEs, StExt_PcStats[StExt_PcStats_Index_ReservedEsPerc]);
	StExt_StaminaReserved = StExt_GetPercentFromValue(atr_stamina_max * 10, StExt_PcStats[StExt_PcStats_Index_ReservedStPerc]);
	
	StExt_LifeReservedMax = hero.attribute[atr_hitpoints_max] - StExt_LifeReserved;
	StExt_ManaReservedMax = hero.attribute[atr_mana_max] - StExt_ManaReserved;
	StExt_StaminaReservedMax = (atr_stamina_max * 10) - StExt_StaminaReserved;
	StExt_EsReservedMax = maxEs - StExt_EsReserved;
	
	StExt_HitProtPotion_Trail -= 1;
	if (rx_nexthitignore) { StExt_HitProtPotion_Trail = 3; };
	if (StExt_HitProtPotion_Trail < 0) { StExt_HitProtPotion_Trail = 0; };
	
	StExt_InvisibleStatCooldown -= 1;
	if (StExt_InvisibleStatCooldown < 0) { StExt_InvisibleStatCooldown = 0; };
	if (StExt_Chance(StExt_PcStats[StExt_PcStats_Index_ChanceToInvis]) && (StExt_InvisibleStatCooldown <= 0)) 
	{
		heroinvisibletimernow += 12;
		rx_invisiblepotion = heroinvisibletimernow;
		heroinvisible = true;
		StExt_InvisibleStatCooldown = 15;
	};
	
	StExt_DoReanimation_Cd -= 1;
	if (StExt_DoReanimation_Cd < 0) { StExt_DoReanimation_Cd = 0; };

	StExt_UpdateTradeVars(StExt_BaseTradeMul + (StExt_TradeMulPerRhetorik * rhetorikskillvalue[1]));
	StExt_OverrideConst(30 + atr_intellect, "spl_damage_stextmagicbolt");
};

// Update hero stats every frame 
func void StExt_ProcessHeroFastStats()
{
	var int tmp;
	if (StExt_GamePaused()) { return; };
	if (!StExt_ModInitialized && !StExt_HeroInitialized) { return; };
	if (StExt_HeroIsTransformed()) 
	{ 
		additionalacceleration = StExt_PcCurrentAcceleration;
		StExt_PcWasTransformed = true;
		return; 
	};
	if (StExt_PcWasTransformed)
	{
		StExt_PcWasTransformed = false;
		additionalacceleration = StExt_PcCurrentAcceleration;
	};
	
	// !fast regeneration do before checks!
	if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_InternalStorage) && !rx_checkhealthpercent(hero, 35) && 
		(hero.attribute[atr_mana] < StExt_GetPercentFromValue(hero.attribute[atr_mana_max], 35)))
	{
		tmp = StExt_GetPermilleFromValue(hero.attribute[atr_mana_max], 1);
		tmp = StExt_ValidateValueRange(tmp, 1, hero.attribute[atr_hitpoints] - 5);
		hero.attribute[atr_mana] += tmp;
		hero.attribute[atr_hitpoints] -= tmp;
	};
	if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_InternalReserves) && rx_checkhealthpercent(hero, 50) && (hero.attribute[atr_mana] > 1))
	{
		tmp = StExt_GetPermilleFromValue(hero.attribute[atr_hitpoints_max], 1);
		tmp = StExt_ValidateValueRange(tmp, 1, hero.attribute[atr_mana] - 1);
		hero.attribute[atr_mana] -= tmp;
		hero.attribute[atr_hitpoints] += tmp;
	};
	
	hero.attribute[atr_hitpoints] = StExt_ValidateValueRange(hero.attribute[atr_hitpoints], 0, StExt_LifeReservedMax);
	hero.attribute[atr_mana] = StExt_ValidateValueRange(hero.attribute[atr_mana], 0, StExt_ManaReservedMax);
	atr_stamina = StExt_ValidateValueRange(atr_stamina, 0, StExt_StaminaReservedMax);
	StExt_Npc_SetEs(hero, StExt_ValidateValueRange(StExt_Npc_GetCurEs(hero), 0, StExt_EsReservedMax));
	
	rx_potionantipoison = StExt_PcStats[StExt_PcStats_Index_PoisionResist];
	if (StExt_PcStats[StExt_PcStats_Index_WeaknessResist] > 0) { playerisweakness = false; };
	if (StExt_PcStats[StExt_PcStats_Index_CurseResist] > 0) { playeriscurse = false; };
	
	if (StExt_Config_CheatsEnabled)
	{
		if (Stext_Cheat_Invisible) 
		{ 
			heroinvisibletimernow = 180;
			rx_invisiblepotion = heroinvisibletimernow;
			heroinvisible = true;
			heroinvisibletimer = false;
		};
		if (Stext_Cheat_Immortal) { StExt_ImmortalFlagTime = 3; };
	};
	if (StExt_HeroStuned > 0) { StExt_HeroStuned -= 1; };
};

func void StExt_ProcessTimers()
{
	StExt_ImmortalFlagTime -= 1;
	StExt_DamageUpTimer -= 1;

	if (StExt_ImmortalFlagTime <= 0)
	{
		StExt_ImmortalFlagTime = 0;
		hero.flags = npc_flag_none;
	};	
	if (StExt_DamageUpTimer <= 0)
	{
		StExt_DamageUpTimer = 0;
		StExt_DamageUpPotionPower = 0;
	};
};

// Hero state controller
func void StExt_HeroController()
{
	if (!StExt_HeroInitialized) 
	{
		if (rx_herocreated && givepack) { StExt_InitializeHero(); }
		else { return; };
	};
	if (menu_readint("AST", "bEnableUnlockSt") != 19385726) { menu_writeint("AST", "bEnableUnlockSt", 19385726); };
	
	StExt_ProcessPcStats();
	StExt_ProcessTimers();
};

func int StExt_HeroCanLearnAdvanceMagic()
{
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
	if (rx_heroismage()) { return true; };
	return false;
};

func int rx_getthieftchance(var c_npc thief, var c_npc target) {
	return rx_getthieftchance_old(thief, target) + StExt_PcStats[StExt_PcStats_Index_PickPocketChance];
};

func void b_givethiefxp() 
{
	b_givethiefxp_old();
	if(pickpocketbonuscount > StExt_PickpocketBonusCount)
	{
		StExt_PickpocketSuccessAttempts += pickpocketbonuscount - StExt_PickpocketBonusCount;
		if(StExt_PickpocketSuccessAttempts >= 25)
		{
			StExt_PickpocketSuccessAttempts -= 25;
			StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 1;
			ai_printbonus(StExt_Str_print_luckinfobonus);
		};
		StExt_PickpocketBonusCount = pickpocketbonuscount;
	};
};

func int b_countstealastmoney(var c_npc pstealednpc) 
{
    var int baseMoney; baseMoney = 0;
	var int bonusMoney; bonusMoney = 0;	
	var int result; result = 0;	

	baseMoney = b_countstealastmoney_old(pstealednpc);
	rx_thiefgotmoneysum -= baseMoney;
	bonusMoney += StExt_GetPermilleFromValue(baseMoney, StExt_PcStats[StExt_PcStats_Index_LuckGold]);	
	
	if (!StExt_Config_DisableThiefLuck && StExt_Chance(StExt_PcStats[StExt_PcStats_Index_Luck]))
	{
		bonusMoney += StExt_GetPermilleFromValue(baseMoney, 500 + hlp_random(250 + StExt_PcStats[StExt_PcStats_Index_Luck]));
		StExt_PrintMessageToTray(StExt_Str_print_luckinfo, StExt_Color_Green);
	};	
	result = baseMoney + bonusMoney;
	result = StExt_ApplyPercentToValue(result, StExt_Config_Luck_Money);
	if (result <= 0) { result = 1; };
	rx_thiefgotmoneysum += result;
	return result;
};

func int StExt_GetPcCurrentStatReservation(var int type)
{
	if ((type <= StExt_StatReservationType_None) || (type >= StExt_StatReservationType_Max))
	{
		StExt_PrintDebug("StExt_GetPcCurrentStatReservation()", concatstrings("Incorrect stat reservation type: ", inttostring(type)), self, other);
		return StExt_Null;
	};
	if (type == StExt_StatReservationType_Hp) { return StExt_PcStats[StExt_PcStats_Index_ReservedHpPerc]; }
	else if (type == StExt_StatReservationType_Mp) { return StExt_PcStats[StExt_PcStats_Index_ReservedMpPerc]; }
	else if (type == StExt_StatReservationType_St) { return StExt_PcStats[StExt_PcStats_Index_ReservedStPerc]; }
	else if (type == StExt_StatReservationType_Es) { return StExt_PcStats[StExt_PcStats_Index_ReservedEsPerc]; };
	return 0;
};

func void StExt_ChangePcStatReservation(var int type, var int sourceId, var int val)
{
	var string source;
	var int oldVal;
	var int statId;
	if ((type <= StExt_StatReservationType_None) || (type >= StExt_StatReservationType_Max))
	{
		StExt_PrintDebug("StExt_ChangePcStatReservation(...)", concatstrings("Incorrect stat reservation type: ", inttostring(type)), self, other);
		return;
	};
	
	source = StExt_GetPlayerStatArray(sourceId);
	if (!StExt_StringIsEmpty(source))
	{
		if (type == StExt_StatReservationType_Hp) { statId = StExt_PcStats_Index_ReservedHpPerc; }
		else if (type == StExt_StatReservationType_Mp) { statId = StExt_PcStats_Index_ReservedMpPerc; }
		else if (type == StExt_StatReservationType_St) { statId = StExt_PcStats_Index_ReservedStPerc; }
		else if (type == StExt_StatReservationType_Es) { statId = StExt_PcStats_Index_ReservedEsPerc; }
		else { return; };
		
		oldVal = StExt_Array_GetInt(source, statId);
		val += oldVal;
		if(val < 0) { val = 0; };		
		StExt_Array_SetInt(source, statId, val);
	}
	else { StExt_PrintDebugStack("StExt_ChangePcStatReservation(...) -> statSource is empty!"); };
};

func int StExt_CheckCondAttribute(var int condAttIndex, var int condAttValue)
{
	if (condAttIndex <= 0)  { return true; };	
	if (condAttIndex == StExt_PcStat_CondIndex_Hp) { return hero.attribute[atr_hitpoints_max] >= condAttValue; }
    else if (condAttIndex == StExt_PcStat_CondIndex_Mp) { return hero.attribute[atr_mana_max] >= condAttValue; }
    else if (condAttIndex == StExt_PcStat_CondIndex_St) { return atr_stamina_max * 10 >= condAttValue; }
    else if (condAttIndex == StExt_PcStat_CondIndex_Str) { return hero.attribute[atr_strength] >= condAttValue; }
    else if (condAttIndex == StExt_PcStat_CondIndex_Agi) { return hero.attribute[atr_dexterity] >= condAttValue; }
    else if (condAttIndex == StExt_PcStat_CondIndex_Int) { return atr_intellect >= condAttValue; }
	else if (condAttIndex == StExt_PcStat_CondIndex_Level) { return hero.level >= condAttValue; }
	else if (condAttIndex == StExt_PcStat_CondIndex_Es) { return StExt_Npc_GetMaxEs(hero) >= condAttValue; };
	StExt_PrintDebug("StExt_CheckCondAttribute()", concatstrings("Incorrect stat index: ", inttostring(condAttIndex)), self, other);
	return true;
};
