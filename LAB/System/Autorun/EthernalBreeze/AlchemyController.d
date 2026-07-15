func int StExt_IsAlchEffectActive(var int statId)
{
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebug("StExt_IsAlchEffectActive()", concatstrings("invalid statId:", inttostring(statId)), self, other);
		return false;
	};
	if (StExt_Array_GetInt("StExt_PcStats_Alchemy_Value", statId) > 0) { return true; };
	return false;
};

func void StExt_StopPotionEffect(var int statId)
{
	var int statBonus; 
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebug("StExt_StopPotionEffect()", concatstrings("invalid statId:", inttostring(statId)), self, other);
		return;
	};
	StExt_PrintDebugStack(concatstrings("StExt_StopPotionEffect() -> statId: ", inttostring(statId)));
	
	statBonus = StExt_Array_GetInt("StExt_PcStats_Alchemy_Value", statId);
	StExt_PlayerStat_OnRemove(statId, statBonus, StExt_PcStat_Source_Alchemy);
	if ((statId == StExt_PcStats_Index_St) || (statId == StExt_PcStats_Index_StPerc)) { StExt_UpdateUncaperStat(StExt_UncaperStatIndex_StamMax); };
	StExt_Array_SetInt("StExt_PcStats_Alchemy_Value", statId, 0);
	StExt_Array_SetInt("StExt_PcStats_Alchemy_Cooldown", statId, 0);
};

func void StExt_ApplyPotionPermEffect(var int statId, var int power)
{
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebug("StExt_ApplyPotionPermEffect()", concatstrings("invalid statId:", inttostring(statId)), self, other);
		return;
	};
	if (power <= 0)
	{
		StExt_PrintDebug("StExt_ApplyPotionPermEffect()", concatstrings("invalid power:", inttostring(statId)), self, other);
		return;
	};

	StExt_PrintDebugStack("StExt_ApplyPotionPermEffect()");	
	StExt_PrintDebugStack(concatstrings("StExt_ApplyPotionPermEffect() statId: ", inttostring(statId)));	
	StExt_PrintDebugStack(concatstrings("StExt_ApplyPotionPermEffect() power: ", inttostring(power)));
	
	StExt_PlayerStat_OnApply(statId, power, StExt_PcStat_Source_Perm);
};

func void StExt_ApplyPotionEffect(var int statId, var int power, var int duration)
{
	var int curPower;
	var int curDuration;
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebug("StExt_ApplyPotionEffect()", concatstrings("invalid statId:", inttostring(statId)), self, other);
		return;
	};
	if (power <= 0)
	{
		StExt_PrintDebug("StExt_ApplyPotionEffect()", concatstrings("invalid power:", inttostring(statId)), self, other);
		return;
	};
	if (duration <= 0)
	{
		StExt_PrintDebug("StExt_ApplyPotionEffect()", concatstrings("invalid duration:", inttostring(statId)), self, other);
		return;
	};
	//StExt_PrintDebugStack("StExt_ApplyPotionEffect()");	
	//StExt_PrintDebugStack(concatstrings("StExt_ApplyPotionEffect() statId: ", inttostring(statId)));	
	//StExt_PrintDebugStack(concatstrings("StExt_ApplyPotionEffect() power: ", inttostring(power)));
	//StExt_PrintDebugStack(concatstrings("StExt_ApplyPotionEffect() duration: ", inttostring(duration)));
	
	curPower = StExt_Array_GetInt("StExt_PcStats_Alchemy_Value", statId);
	curDuration = StExt_Array_GetInt("StExt_PcStats_Alchemy_Cooldown", statId);
	if (curPower > 0) { StExt_StopPotionEffect(statId); };	
	if (curPower > power) { power = curPower; };
	if (curDuration > duration) { duration = curDuration; };	
	StExt_Array_SetInt("StExt_PcStats_Alchemy_Value", statId, power);
	StExt_Array_SetInt("StExt_PcStats_Alchemy_Cooldown", statId, duration);
	StExt_PlayerStat_OnApply(statId, power, StExt_PcStat_Source_Alchemy);
};

func void StExt_Potions_TimerLoop(var int index, var int value) 
{ 
	//StExt_PrintDebugStack(concatstrings("StExt_Potions_TimerLoop() statId: ", inttostring(index)));	
	//StExt_PrintDebugStack(concatstrings("StExt_Potions_TimerLoop() duration: ", inttostring(value)));
	if (accelerationactive) { value -= accelerationratio; }
	else { value -= 1; };
	
	if ((value <= 0) && (StExt_Array_GetInt("StExt_PcStats_Alchemy_Value", index) > 0)) { StExt_StopPotionEffect(index); };
	if (value < 0) { value = 0; };	
	StExt_Array_SetInt("StExt_PcStats_Alchemy_Cooldown", index, value);
};

func void StExt_PotionsController() 
{ 
	if (StExt_HeroIsTransformed()) { return; };
	StExt_Array_ForEachInt("StExt_PcStats_Alchemy_Cooldown", StExt_Potions_TimerLoop); 
};

func void StExt_UsePotion() { StExt_UseEnchantedItem(); };
