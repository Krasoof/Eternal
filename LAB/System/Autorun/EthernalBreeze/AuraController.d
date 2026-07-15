var int StExt_GetActiveAurasCount_Counter;
func void StExt_GetActiveAurasCount_Loop(var int index, var int value) { if (value > StExt_Null) { StExt_GetActiveAurasCount_Counter += 1; }; };
// Count how many auras equiped now
func int StExt_GetActiveAurasCount()
{
	StExt_GetActiveAurasCount_Counter = 0;
	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_GetActiveAurasCount_Loop);
	return StExt_GetActiveAurasCount_Counter;
};

// Check if any aura is active
func int StExt_HasActiveAura()
{
	if (StExt_GetActiveAurasCount() > 0) { return true; };
	return false;
};

// Get maximum allowed auras slots 
func int StExt_GetMaxAuraSlots() { return StExt_PcStats[StExt_PcStats_Index_AuraCountMax]; };

var int StExt_IsAuraActive_Flag;
var int StExt_IsAuraActive_AuraId;
func void StExt_IsAuraActive_Loop(var int index, var int value) 
{ 
	if (value == StExt_Null) { return; };
	if (value == StExt_IsAuraActive_AuraId) { StExt_IsAuraActive_Flag = true; }; 
};
// Check if specified aura is active
func int StExt_IsAuraActive(var int auraId)
{
	if ((auraId < 0) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_IsAuraActive()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return false;
	};
	StExt_IsAuraActive_Flag = false;
	StExt_IsAuraActive_AuraId = auraId;
	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_IsAuraActive_Loop);
	return StExt_IsAuraActive_Flag;
};

// Calculate true aura reservation percent
func int StExt_CalcAuraConsumption(var int value, var int index)
{
	var int reduction;
	reduction = 0;
	reduction = StExt_PcStats[StExt_PcStats_Index_AuraConsumptionReduction];
	if (index == StExt_StatReservationType_Mp) { reduction += StExt_PcStats[StExt_PcStats_Index_AuraMpConsumReduction]; };
	if (index == StExt_StatReservationType_St) { reduction += StExt_PcStats[StExt_PcStats_Index_AuraStConsumReduction]; };
	if (index == StExt_StatReservationType_Hp) { reduction += StExt_PcStats[StExt_PcStats_Index_AuraHpConsumReduction]; };
	if (index == StExt_StatReservationType_Es) { reduction += StExt_PcStats[StExt_PcStats_Index_AuraEsConsumReduction]; };
	value -= StExt_GetPermilleFromValue(value, reduction);
	if (value <= 0) { return 1; }
	else { return value; };
};

// Check if aura can be activated
func int StExt_CanActivateAura(var int auraId)
{
	var C_AuraData auraData;
	var int activeAurasCount;
	var int currentConsumption;
	var int auraConsumption;
	if ((auraId < 0) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_CanActivateAura()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return false;
	};
	if (StExt_IsAuraActive(auraId)) { return false; };
	
	auraData = StExt_GetAuraData(auraId);
	if (Hlp_IsNull(auraData))
	{
		StExt_PrintDebug("StExt_CanActivateAura()", "Aura instance is Null!", self, other);
		return false;
	};
	
	activeAurasCount = StExt_GetActiveAurasCount();
	if (activeAurasCount >= StExt_GetMaxAuraSlots())
	{
		ai_printred(StExt_Str_Auras_NoSlot);
		return false;
	};
	
	if ((auraData.ReservedAtr > StExt_StatReservationType_None) && (auraData.ReservedAtr < StExt_StatReservationType_Max))
	{
		currentConsumption = StExt_GetPcCurrentStatReservation(auraData.ReservedAtr);
		auraConsumption = StExt_CalcAuraConsumption(auraData.ReservedValue, auraData.ReservedAtr);
		if ((currentConsumption + auraConsumption) > StExt_StatReservation_HardCap)
		{
			ai_printred(StExt_Str_Auras_NoMana);
			return false;
		};
	};
	
	if (!StExt_CheckCondAttribute(auraData.CondAtr[0], auraData.CondValue[0]) || 
		!StExt_CheckCondAttribute(auraData.CondAtr[1], auraData.CondValue[1]) || 
		!StExt_CheckCondAttribute(auraData.CondAtr[2], auraData.CondValue[2]))
	{
		ai_printred(StExt_Str_Auras_NoStats);
		return false;
	};
	return true;
};

func int StExt_CalcAuraBonus(var int statId, var int statVal, var int powerRatio) 
{
	var int result;
	if (statVal <= 0) { return 0; };
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max)) { return 0; };	
	if (statId == StExt_PcStats_Index_AuraPower) { return statVal; };
	if (powerRatio <= 0) { powerRatio = 1; };
	result = statVal * StExt_PcStats[StExt_PcStats_Index_AuraPower];
	result += StExt_GetPermilleFromValue(result, StExt_PcStats[StExt_PcStats_Index_AuraPowerPerc]);	
	result = StExt_GetPercentFromValue(result, powerRatio);
	if (StExt_AurasPowerMult != 100) { result = StExt_GetPercentFromValue(result, StExt_AurasPowerMult); };
	if (result <= 0) { result = 1; };
	return result;
};

// Apply aura effect
func void StExt_ApplyAuraEffect(var int auraId)
{
	var C_AuraData auraData;
	var int tmp1;
	var int tmp2;
	var int tmp3;
	var int tmp4;
	var int tmp5;
	var int consumption;
	
	if (auraId == StExt_Null) { return; };
	if ((auraId < StExt_Null) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_ApplyAuraEffect()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return;
	};
	auraData = StExt_GetAuraData(auraId);	
	
	tmp1 = StExt_CalcAuraBonus(auraData.StatId[0], auraData.StatValue[0], auraData.PowerRatio);
	tmp2 = StExt_CalcAuraBonus(auraData.StatId[1], auraData.StatValue[1], auraData.PowerRatio);
	tmp3 = StExt_CalcAuraBonus(auraData.StatId[2], auraData.StatValue[2], auraData.PowerRatio);
	tmp4 = StExt_CalcAuraBonus(auraData.StatId[3], auraData.StatValue[3], auraData.PowerRatio);
	tmp5 = StExt_CalcAuraBonus(auraData.StatId[4], auraData.StatValue[4], auraData.PowerRatio);
	
	StExt_Array_SetInt("StExt_Aura_TmpValue1", auraData.Id, tmp1);
	StExt_Array_SetInt("StExt_Aura_TmpValue2", auraData.Id, tmp2);
	StExt_Array_SetInt("StExt_Aura_TmpValue3", auraData.Id, tmp3);
	StExt_Array_SetInt("StExt_Aura_TmpValue4", auraData.Id, tmp4);
	StExt_Array_SetInt("StExt_Aura_TmpValue5", auraData.Id, tmp5);
	
	StExt_PlayerStat_OnApply(auraData.StatId[0], tmp1, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnApply(auraData.StatId[1], tmp2, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnApply(auraData.StatId[2], tmp3, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnApply(auraData.StatId[3], tmp4, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnApply(auraData.StatId[4], tmp5, StExt_PcStat_Source_Auras);
	
	consumption = StExt_CalcAuraConsumption(auraData.ReservedValue, auraData.ReservedAtr);
	StExt_Array_SetInt("StExt_Aura_Consumption", auraData.Id, consumption);
	StExt_ChangePcStatReservation(auraData.ReservedAtr, StExt_PcStat_Source_Auras, consumption);
};

// Disable aura effect
func void StExt_DisableAuraEffect(var int auraId)
{
	var C_AuraData auraData;
	var int tmp1;
	var int tmp2;
	var int tmp3;
	var int tmp4;
	var int tmp5;
	var int consumption;
	
	if (auraId == StExt_Null) { return; };
	if ((auraId < StExt_Null) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_DisableAuraEffect()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return;
	};
	auraData = StExt_GetAuraData(auraId);	
	
	consumption = StExt_Array_GetInt("StExt_Aura_Consumption", auraData.Id);
	StExt_ChangePcStatReservation(auraData.ReservedAtr, StExt_PcStat_Source_Auras, -consumption);
	StExt_Array_SetInt("StExt_Aura_Consumption", auraData.Id, 0);
	
	tmp1 = StExt_Array_GetInt("StExt_Aura_TmpValue1", auraData.Id);
	tmp2 = StExt_Array_GetInt("StExt_Aura_TmpValue2", auraData.Id);
	tmp3 = StExt_Array_GetInt("StExt_Aura_TmpValue3", auraData.Id);
	tmp4 = StExt_Array_GetInt("StExt_Aura_TmpValue4", auraData.Id);
	tmp5 = StExt_Array_GetInt("StExt_Aura_TmpValue5", auraData.Id);
	
	StExt_PlayerStat_OnRemove(auraData.StatId[0], tmp1, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnRemove(auraData.StatId[1], tmp2, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnRemove(auraData.StatId[2], tmp3, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnRemove(auraData.StatId[3], tmp4, StExt_PcStat_Source_Auras);
	StExt_PlayerStat_OnRemove(auraData.StatId[4], tmp5, StExt_PcStat_Source_Auras);

	StExt_Array_SetInt("StExt_Aura_TmpValue1", auraData.Id, 0);
	StExt_Array_SetInt("StExt_Aura_TmpValue2", auraData.Id, 0);
	StExt_Array_SetInt("StExt_Aura_TmpValue3", auraData.Id, 0);
	StExt_Array_SetInt("StExt_Aura_TmpValue4", auraData.Id, 0);
	StExt_Array_SetInt("StExt_Aura_TmpValue5", auraData.Id, 0);
};

func int StExt_CheckAuraItems_Loop(var int index)
{
	var c_item auraStone;
	var C_AuraData auraData;
	var int isActive;
	var int isContinue;
	isContinue = (index < StExt_AuraIndex_Max);
	if (!isContinue) { return false; };
	
	auraData = StExt_GetAuraData(index);
	if (isContinue && !Hlp_IsNULL(auraData)) 
	{
		auraStone = npc_getitembyid(hero, StExt_GetInstanceIdByName(auraData.BoundedItem));
		if (StExt_IsAuraActive(auraData.Id)) { isActive = true; }
		else { isActive = false; };
		itm_setflagactive(auraStone, isActive);
	};
    return isContinue;
};
// Check item active flag for each aura
func void StExt_CheckAuraItems() { StExt_While(StExt_CheckAuraItems_Loop); };

var int StExt_StExt_PutAuraInSlot_Index;
func int StExt_StExt_PutAuraInSlot_Loop(var int index)
{
	var int slotData;
	if (index >= StExt_AurasCount_HardCap) { return false; };
	if (index > StExt_GetMaxAuraSlots()) { return false; };
	
	slotData = StExt_Array_GetInt("StExt_Aura_Slot", index);
	if (slotData == StExt_Null)
	{
		StExt_StExt_PutAuraInSlot_Index = index;
		return false;
	};
	return true;
};
func void StExt_PutAuraInSlot(var int auraId)
{
	if ((auraId < 0) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_PutAuraInSlot()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return;
	};	
	StExt_StExt_PutAuraInSlot_Index = StExt_Null;
	StExt_While(StExt_StExt_PutAuraInSlot_Loop);
	if(StExt_StExt_PutAuraInSlot_Index > StExt_Null)
	{
		StExt_Array_SetInt("StExt_Aura_Slot", StExt_StExt_PutAuraInSlot_Index, auraId);
	};
	StExt_CheckAuraItems();
};

var int StExt_RemoveAuraFromSlot_AuraId;
var int StExt_RemoveAuraFromSlot_AuraIndex;
func void StExt_RemoveAuraFromSlot_Loop(var int index, var int value) 
{
	if (StExt_RemoveAuraFromSlot_AuraIndex != StExt_Null) { return; };
	if (value == StExt_RemoveAuraFromSlot_AuraId) { StExt_RemoveAuraFromSlot_AuraIndex = index; };
};
func void StExt_RemoveAuraFromSlot(var int auraId)
{
	if ((auraId < 0) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_RemoveAuraFromSlot()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return;
	};
	StExt_RemoveAuraFromSlot_AuraId = auraId;
	StExt_RemoveAuraFromSlot_AuraIndex = StExt_Null;
	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_RemoveAuraFromSlot_Loop);
	if (StExt_RemoveAuraFromSlot_AuraIndex != StExt_Null) { StExt_Array_SetInt("StExt_Aura_Slot", StExt_RemoveAuraFromSlot_AuraIndex, StExt_Null); }
	else { StExt_PrintDebug("StExt_RemoveAuraFromSlot()", concatstrings("Aura not removed from slot. Id: ", inttostring(auraId)), self, other); };
	StExt_CheckAuraItems();
};

// Call OnTick func for each equiped aura
func void StExt_AuraOnTick_Loop(var int index, var int value) 
{
	var C_AuraData auraData;
	var int masteryExp;
	if ((value < 0) || (value >= StExt_AuraIndex_Max))
	{
		//StExt_PrintDebug("StExt_AuraOnTick_Loop()", concatstrings("Incorrect aura id: ", inttostring(value)), self, other);
		return;
	};
	StExt_CurrentAura = StExt_GetAuraData(value);
	if(Hlp_IsNULL(StExt_CurrentAura))
	{
		StExt_PrintDebug("StExt_AuraOnTick_Loop()", "StExt_CurrentAura is null!", self, other);
		return;
	};
	
	StExt_ActiveAurasNames = StExt_BuildTagsString(StExt_ActiveAurasNames, StExt_Array_GetString("StExt_Str_AuraName", value));
	if (!StExt_StringIsEmpty(StExt_CurrentAura.OnTick)) { StExt_CallActorsFunc(StExt_CurrentAura.OnTick, self, other); };
	
	// special handlers
	if (value == StExt_AuraIndex_FireMasteryPower) { StExt_ElementAffinity_Fire = true; };
	if (value == StExt_AuraIndex_IceMasteryPower) { StExt_ElementAffinity_Ice = true; };
	if (value == StExt_AuraIndex_ElectricMasteryPower) { StExt_ElementAffinity_Electric = true; };
	if (value == StExt_AuraIndex_AirMasteryPower) { StExt_ElementAffinity_Air = true; };
	if (value == StExt_AuraIndex_EarthMasteryPower) { StExt_ElementAffinity_Earth = true; };
	if (value == StExt_AuraIndex_LightMasteryPower) { StExt_ElementAffinity_Light = true; };
	if (value == StExt_AuraIndex_DarkMasteryPower) { StExt_ElementAffinity_Dark = true; };
	if (value == StExt_AuraIndex_DeathMasteryPower) { StExt_ElementAffinity_Death = true; };
	if (value == StExt_AuraIndex_LifeMasteryPower) { StExt_ElementAffinity_Life = true; };		
	if (value == StExt_AuraIndex_ShamanMasteryPower) { StExt_ElementAffinity_Shaman = true; };
	//if (value == -100) { StExt_ElementAffinity_Blood = true; };
	
	// do aura mastery bonuses
	if (StExt_AuraMasterBonusTimer >= 6)
	{
		masteryExp = 1 + StExt_GetPercentFromValue(StExt_CurrentAura.ReservedValue, 10);		
		if ((StExt_CurrentAura.MasteryId[0] > StExt_Null) && (StExt_CurrentAura.MasteryId[0] < StExt_MasteryIndex_Max)) { StExt_AddMasteryExp(StExt_CurrentAura.MasteryId[0], masteryExp); };
		if ((StExt_CurrentAura.MasteryId[1] > StExt_Null) && (StExt_CurrentAura.MasteryId[1] < StExt_MasteryIndex_Max)) { StExt_AddMasteryExp(StExt_CurrentAura.MasteryId[1], masteryExp); };
		if ((StExt_CurrentAura.MasteryId[2] > StExt_Null) && (StExt_CurrentAura.MasteryId[2] < StExt_MasteryIndex_Max)) { StExt_AddMasteryExp(StExt_CurrentAura.MasteryId[2], masteryExp); };
	};
};

func void StExt_RefreshAura_Disable_Loop(var int index, var int value) { StExt_DisableAuraEffect(value); };
func void StExt_RefreshAura_Enable_Loop(var int index, var int value) { StExt_ApplyAuraEffect(value); };

func void StExt_AuraUnEquipHandler(var int auraId)
{
	if (auraId == StExt_AuraIndex_Forest) { StExt_KillSpecialSummons(StExt_SpecialSummonType_Wolf); };
	if (auraId == StExt_AuraIndex_Graveyard) { StExt_KillSpecialSummons(StExt_SpecialSummonType_Zombie); };
	if (auraId == StExt_AuraIndex_Hell) { StExt_KillSpecialSummons(StExt_SpecialSummonType_Demon); };
	if (auraId == StExt_AuraIndex_Golem) { StExt_KillSpecialSummons(StExt_SpecialSummonType_Golem); };
	if (auraId == StExt_AuraIndex_ShadowWarrior) { StExt_KillSpecialSummons(StExt_SpecialSummonType_Shadow); };
};

// Entry point for aura equipment
// This func calls from aura stones
func void StExt_ApplyAura(var int auraId)
{
	if ((auraId < 0) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_ApplyAura()", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return;
	};
	
	if(StExt_IsAuraActive(auraId)) 
	{
		StExt_DisableAuraEffect(auraId);
		StExt_RemoveAuraFromSlot(auraId);
		StExt_AuraUnEquipHandler(auraId);
		StExt_PrintDebug("StExt_ApplyAura()", concatstrings("Aura disabled id: ", inttostring(auraId)), self, other);
		return;
	};
	if (!StExt_CanActivateAura(auraId)) 
	{
		b_say(self, self, "$IMPOSSIBLEFORME");
		ai_printred(StExt_Str_Auras_CantEquip);
		return; 
	};
	StExt_ApplyAuraEffect(auraId);
	StExt_PutAuraInSlot(auraId);
	StExt_PrintDebug("StExt_ApplyAura()", concatstrings("Aura enabled id: ", inttostring(auraId)), self, other);
};

func void StExt_AuraUnEquip_Loop(var int index, var int value) 
{
	var C_AuraData auraData;
	if ((value < 0) || (value >= StExt_AuraIndex_Max)) { return; };
	
	StExt_CurrentAura = StExt_GetAuraData(value);
	if(Hlp_IsNULL(StExt_CurrentAura))
	{
		StExt_PrintDebug("StExt_AuraUnEquip_Loop()", "StExt_CurrentAura is null!", self, other);
		return;
	};
	
	StExt_HeroActiveAuras = StExt_GetActiveAurasCount();
	StExt_HeroActiveAurasMax = StExt_PcStats[StExt_PcStats_Index_AuraCountMax];
	if (StExt_HeroActiveAuras > StExt_HeroActiveAurasMax) {	StExt_ApplyAura(value); };
};

// Main aura controller. Refresh aura bonuses every second.
func void StExt_AuraController()
{
	var int activeAurasCount;
	if (StExt_HeroIsTransformed()) { return; };
	
	StExt_HeroActiveAuras = StExt_GetActiveAurasCount();
	StExt_HeroActiveAurasMax = StExt_PcStats[StExt_PcStats_Index_AuraCountMax];

	StExt_ActiveAurasNames = StExt_EmptyString;
	StExt_HeroHasAnyAura = false;
	if ((StExt_HeroActiveAuras <= 0) || npc_isdead(hero)) { return; };
	if (StExt_HeroActiveAuras > StExt_HeroActiveAurasMax)
	{
		StExt_AuraOvercapCounter += 1;
		if (StExt_AuraOvercapCounter >= 2)
		{
			ai_printred(StExt_Str_Auras_NoSlot);
			StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_AuraUnEquip_Loop);
			StExt_AuraOvercapCounter = 0;
			return;
		};
	}
	else { StExt_AuraOvercapCounter = 0; };
	
	StExt_HeroHasAnyAura = true;
	StExt_AuraMasterBonusTimer += 1;
	StExt_CheckAuraItems();
	StExt_AuraOnTickProcessing = true;
	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_AuraOnTick_Loop);
	StExt_AuraOnTickProcessing = false;
	
	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_RefreshAura_Disable_Loop);
	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_RefreshAura_Enable_Loop);
	
	if (StExt_AuraMasterBonusTimer >= 6) { StExt_AuraMasterBonusTimer = 0; };
};

func int StExt_IsInAuraRange(var c_npc target)
{
	var int dist;
	if (!StExt_HeroHasAnyAura) { return false; };
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity)) { return false; };
	dist = npc_getdisttonpc(hero, target);
	if (StExt_HasActiveAura() && (dist <= StExt_PcStats[StExt_PcStats_Index_AuraDist])) { return true; };
	return false;
};

// Call OnOffence func for each equiped aura
func void StExt_AuraOnOffence_Loop(var int index, var int value) 
{
	if ((value < 0) || (value >= StExt_AuraIndex_Max))
	{
		//StExt_PrintDebug("StExt_AuraOnOffence_Loop()", concatstrings("Incorrect aura id: ", inttostring(value)), slf, oth);
		return;
	};

	StExt_CurrentAura = StExt_GetAuraData(value);
	if(Hlp_IsNULL(StExt_CurrentAura))
	{
		StExt_PrintDebug("StExt_AuraOnOffence_Loop()", "StExt_CurrentAura is null!", StExt_AttackNpc, StExt_TargetNpc);
		return;
	};
	if (!StExt_StringIsEmpty(StExt_CurrentAura.OnOffence)) { StExt_CallActorsFunc(StExt_CurrentAura.OnOffence, StExt_AttackNpc, StExt_TargetNpc); };
};

// on aura offence
func void StExt_AuraOnOffence()
{
	if (!StExt_HeroHasAnyAura) { return; };
	
	if(npc_isplayer(StExt_AttackNpc)) { }
	else if (StExt_IsHeroPatryNpc(StExt_AttackNpc) && !StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && !StExt_IsInAuraRange(StExt_AttackNpc)) { return; }
	else { return; };

	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_AuraOnOffence_Loop);
};

// Call OnDeffence func for each equiped aura

func void StExt_AuraOnDeffence_Loop(var int index, var int value) 
{
	if ((value < 0) || (value >= StExt_AuraIndex_Max))
	{
		//StExt_PrintDebug("StExt_AuraOnDeffence_Loop()", concatstrings("Incorrect aura id: ", inttostring(value)), slf, oth);
		return;
	};

	StExt_CurrentAura = StExt_GetAuraData(value);
	if(Hlp_IsNULL(StExt_CurrentAura))
	{
		StExt_PrintDebug("StExt_AuraOnDeffence_Loop()", "StExt_CurrentAura is null!", StExt_TargetNpc, StExt_AttackNpc);
		return;
	};
	if (!StExt_StringIsEmpty(StExt_CurrentAura.OnDeffence)) { StExt_CallActorsFunc(StExt_CurrentAura.OnDeffence, StExt_TargetNpc, StExt_AttackNpc); };
};

// on aura deffence
func void StExt_AuraOnDeffence()
{
	if (!StExt_HeroHasAnyAura) { return; };
	
	if(npc_isplayer(StExt_TargetNpc)) { }
	else if (StExt_IsHeroPatryNpc(StExt_TargetNpc) && !StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && !StExt_IsInAuraRange(StExt_TargetNpc)) { return; }
	else { return; };

	StExt_Array_ForEachInt("StExt_Aura_Slot", StExt_AuraOnDeffence_Loop);
};