func void StExt_ChangeMasteryPerkPoints(var int masteryId, var int perkPoints)
{
	var int perkPointsNow;
	if (perkPoints == 0) { return; };
	if (masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max)
	{
		StExt_PrintDebugStack(concatstrings("StExt_ChangeMasteryPerkPoints(...) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return;
	};
	perkPointsNow = StExt_Array_GetInt(StExt_MasteryArrayIndex_PerkPoints, masteryId);
	perkPointsNow += perkPoints;
	StExt_Array_SetInt(StExt_MasteryArrayIndex_PerkPoints, masteryId, perkPointsNow);
};

func int StExt_GetMasteryExpMult(var int index)
{
	if (index == StExt_MasteryIndex_Fire) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Fire); }
	else if (index == StExt_MasteryIndex_Ice) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Ice); }
	else if (index == StExt_MasteryIndex_Electric) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Electric); }
	else if (index == StExt_MasteryIndex_Air) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Air); }
	else if (index == StExt_MasteryIndex_Earth) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Earth); }
	else if (index == StExt_MasteryIndex_Light) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Light); }
	else if (index == StExt_MasteryIndex_Dark) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Dark); }
	else if (index == StExt_MasteryIndex_Death) { return StExt_GetElementMasteryExpMult(index, StExt_Config_MasteryExpMult_Death); }
	else if (index == StExt_MasteryIndex_Life) { return StExt_Config_MasteryExpMult_Life; }
	else if (index == StExt_MasteryIndex_Golem) { return StExt_Config_MasteryExpMult_Golem; }
	else if (index == StExt_MasteryIndex_Demon) { return StExt_Config_MasteryExpMult_Demon; }
	else if (index == StExt_MasteryIndex_Necro) { return StExt_Config_MasteryExpMult_Necro; }
	else if (index == StExt_MasteryIndex_Shaman) { return StExt_Config_MasteryExpMult_Shaman; }
	else if (index == StExt_MasteryIndex_MartialArts) { return StExt_Config_MasteryExpMult_MartialArts; }
	else if (index == StExt_MasteryIndex_Agile) { return StExt_Config_MasteryExpMult_Agile; }
	else if (index == StExt_MasteryIndex_Archery) { return StExt_Config_MasteryExpMult_Archery; }
	else if (index == StExt_MasteryIndex_Blood) { return StExt_Config_MasteryExpMult_Blood; }
	else if (index == StExt_MasteryIndex_FistFight) { return StExt_Config_MasteryExpMult_FistFight; }
	else if (index == StExt_MasteryIndex_Aura) { return StExt_Config_MasteryExpMult_Aura; }
	else if (index == StExt_MasteryIndex_Traps) { return StExt_Config_MasteryExpMult_Traps; }
	else if (index == StExt_MasteryIndex_Poision) { return StExt_Config_MasteryExpMult_Poision; }	
	else { return StExt_Null; };
	return 0;
};

func void StExt_AddMasteryExp(var int index, var int exp)
{
	var int expNow;
	var int expNext;
	var int level;
	var int levelMax;
	var int expRate;
	var int currentLevel;
	var int masteryExpRate;
	
	if (exp < 0) { return; };
	if (index < 0) || (index >= StExt_MasteryIndex_Max)
	{
		StExt_PrintDebugStack("StExt_AddMasteryExp(var int index, var int exp) -> index out of range!");
		return;
	};
	
	masteryExpRate = StExt_GetMasteryExpMult(index);
	if (masteryExpRate <= 0) { return; };
	// GLOBAL mastery slowdown per feedback ("biegloscie leca za szybko,
	// stale 40% tego co teraz a nawet mniej"): all proficiency exp at 35%.
	masteryExpRate = StExt_ValidateValueMin(StExt_GetPercentFromValue(masteryExpRate, 35), 1);
	
	expNow = StExt_Array_GetInt(StExt_MasteryArrayIndex_ExpNow, index);
	expNext = StExt_Array_GetInt(StExt_MasteryArrayIndex_ExpNext, index);
	level = StExt_Array_GetInt(StExt_MasteryArrayIndex_Progress, index);
	currentLevel = StExt_Array_GetInt(StExt_MasteryArrayIndex_Level, index);	
	
	if (currentLevel < 0) { currentLevel = 0; };	
	levelMax = StExt_ValidateValueRange((currentLevel + 1) * 50, 50, 1000);
	expRate = StExt_ValidateValueMin(150 - level, 1) + (currentLevel * 10);
	if (StExt_Perk[StExt_PerkIndex_Scholar]) 
	{
		expRate += 25;
		levelMax = StExt_ValidateValueRange((currentLevel + 1) * 75, 75, 1000);
	};
	exp = StExt_GetPercentFromValueWithMin(exp, StExt_Config_MasteriesExpMult, 1);
	exp = StExt_GetPercentFromValueWithMin(exp, expRate, 1); 
	exp = StExt_GetPercentFromValueWithMin(exp, masteryExpRate, 1);
	expNow += exp;
	
	if (expNow >= expNext)
	{
		if (level >= levelMax)
		{
			StExt_Array_SetInt(StExt_MasteryArrayIndex_Progress, index, levelMax);
			StExt_Array_SetInt(StExt_MasteryArrayIndex_ExpNow, index, expNext);
			return;
		};
		level += 1;
		if (level >= 100)
		{
			if (level == 100) { StExt_ChangeMasteryPerkPoints(index, 1); };
			if (level == 150) { StExt_ChangeMasteryPerkPoints(index, 1); };
			if (level == 200) { StExt_ChangeMasteryPerkPoints(index, 1); };
			if (level == 250) { StExt_ChangeMasteryPerkPoints(index, 1); };
			if (level == 300) { StExt_ChangeMasteryPerkPoints(index, 1); };
			if (level == 450) { StExt_ChangeMasteryPerkPoints(index, 1); };
		};
		expNow = expNow - expNext;
		expNext = (level * 2) * StExt_Mastery_ExpPerLevel;
		StExt_Array_SetInt(StExt_MasteryArrayIndex_ExpNext, index, expNext);
		StExt_Array_SetInt(StExt_MasteryArrayIndex_Progress, index, level);
		
		if (StExt_Config_DisplayMasteryLevelUp) { StExt_PrintMasteryLevelUp(index); };
	};
	StExt_Array_SetInt(StExt_MasteryArrayIndex_ExpNow, index, expNow);
};

//--------------------------------------------------------------------------------------------------

func void StExt_ChangePcBonus(var int index, var int val)
{
	var int now;
	if ((index < 0) || (index >= StExt_PcStats_Index_Max)) { return; };
	now = StExt_Array_GetInt("StExt_PcStats_Buffs", index);
	StExt_Array_SetInt("StExt_PcStats_Buffs", index, now + val);
};


//**************************************************************************************************
// 				Call this func's only in context of TimedEffect initialization!
//**************************************************************************************************

func int StExt_TimedEffect_CalcPower(var c_npc slf, var c_npc oth)
{
	var int result; result = 10;
	var int bonus; bonus = 0;
	var int damageType; damageType = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType];
	var int spellDmg; spellDmg = 0;
	var int isHeroCast; isHeroCast = false;
	var int isSpell; isSpell = false;
	
	if (!StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_CanUpdate) && (StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Power] != 0)) {
		return StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Power];
	};
	
	isSpell = StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_Spell);
	if (StExt_IsSummonOrHero(oth))
	{
		isHeroCast = npc_isplayer(oth);
		result += (atr_intellect + 5) / 5;
		if (isSpell) 
		{ 
			bonus += (atr_intellect + 2) / 2;
			bonus += StExt_GetPercentFromValue(bonus + result, countlearnspell);
			
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Fire)) { bonus += (StExt_PcStats[StExt_PcStats_Index_FireMasteryPower] + 1) / 2; };			
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Ice)) { bonus += (StExt_PcStats[StExt_PcStats_Index_IceMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Electric)) { bonus += (StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Dark)) { bonus += (StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Death)) { bonus += (StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Air)) { bonus += (StExt_PcStats[StExt_PcStats_Index_AirMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Earth)) { bonus += (StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Light)) { bonus += (StExt_PcStats[StExt_PcStats_Index_LightMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_Poision)) { bonus += (StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + 1) / 2; };
			if (StExt_ValueHasFlag(damageType, StExt_DamageType_True)) { bonus += (StExt_PcStats[StExt_PcStats_Index_ShamanMasteryPower] + 1) / 2; };			
			//if (StExt_ValueHasFlag(damageType, StExt_DamageType_Blood)) { bonus += (StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + 1) / 2; };
		};
		
		if (StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_Buff)) { 
			bonus += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_BuffPower);
			bonus += (StExt_PcStats[StExt_PcStats_Index_LightMasteryPower] + 1) / 2;
		};		
		if (StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_DeBuff)) { 
			bonus += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_DebuffPower);
			bonus += (StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower] + 1) / 2;
		};
		
		if (!isHeroCast || (npc_getactivespellisscroll(oth) && isSpell)) { bonus = (bonus + 1) / 2; };
	}
	else
	{
		result += (StExt_Npc_IsRandomized(oth) * 100) + (oth.level * 3);
		if (isSpell) 
		{
			bonus += StExt_GetNpcVar(oth, StExt_AiVar_ExtraMagicDamage);
			spellDmg += 1 + ((oth.level + 1) / 5);
			if (rx_getnpcvar(oth, aivrx_spelldamagescale) > 0) { spellDmg += rx_getnpcvar(oth, aivrx_spelldamagescale); };
			if (rx_monsterpower > 100) { spellDmg += rx_monsterpower - 100; };
			bonus += StExt_GetPercentFromValue(bonus + result, spellDmg);
		};

		if (StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_Buff)) { bonus += StExt_GetNpcVar(oth, StExt_AiVar_ExtraBuffPower); };		
		if (StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_DeBuff)) { bonus += StExt_GetNpcVar(oth, StExt_AiVar_ExtraDebuffPower); };		
	};
	
	result += bonus;
	return result;
};

func int StExt_TimedEffect_CalcDuration(var c_npc slf, var c_npc oth)
{
	var int result;
	var int effectPower; 
	
	if (!StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_CanUpdate) && (StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] != 0)) {
		return StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer];
	};
	
	effectPower = StExt_TimedEffect_CalcPower(slf, oth);
	result = StExt_CurrentTimedEffectData.Duration;
	result += StExt_GetPermilleFromValue(result, effectPower);
	
	if (StExt_IsSummonOrHero(oth))
	{
		result += StExt_GetPermilleFromValue(result, StExt_PcStats[StExt_PcStats_Index_EffectDuration]);
		if (!npc_isplayer(oth)) { result = (result + 1) / 2; };
	}
	else { result += StExt_GetNpcVar(oth, StExt_AiVar_ExtraDotTicks) * 12; };
	return StExt_ValidateValueMin(result, 1);
};

func int StExt_TimedEffect_CalcRadius(var c_npc slf, var c_npc oth)
{
	var int result; result = StExt_CurrentTimedEffectData.Range;
	var int effectPower; effectPower = StExt_TimedEffect_CalcPower(slf, oth);
	var int bonus; bonus = StExt_GetPercentFromValue(effectPower, 25);
	var int max; max = StExt_Npc_Ability_RadiusMax;

	if (StExt_IsSummonOrHero(oth))
	{
		max = StExt_AurasDistance_HardCap;
		bonus += StExt_PcStats[StExt_PcStats_Index_AuraDist];
		bonus += StExt_GetPermilleFromValue(result, StExt_PcStats[StExt_PcStats_Index_AuraDistPerc]);
		
		if (!npc_isplayer(oth)) { 
			max = (max + 1) / 2;
			bonus = (result + 1) / 2; 
		};
	}
	else { bonus += oth.level * 2; };
	return StExt_ValidateValueRange(result + bonus, StExt_CurrentTimedEffectData.Range, max);
};

func int StExt_TimedEffect_CalcValue(var c_npc slf, var c_npc oth)
{
	var int result; result = StExt_CurrentTimedEffectData.BaseValue;
	var int effectPower; effectPower = StExt_TimedEffect_CalcPower(slf, oth);	
	result += StExt_GetPercentFromValue(effectPower, StExt_CurrentTimedEffectData.PowerRatio);
	return StExt_ValidateValueRange(result, StExt_CurrentTimedEffectData.MinValue, StExt_CurrentTimedEffectData.MaxValue);
};

func int StExt_TimedEffect_CalcExtProtValue(var c_npc slf, var c_npc oth, var int protId)
{
	var int result; 
	var int effectPower; 
	var int protValue;
	
	if (protId == dam_index_blunt) { protValue = slf.protection[dam_index_blunt]; }
	else if (protId == dam_index_edge) { protValue = slf.protection[dam_index_edge]; }
	else if (protId == dam_index_fire) { protValue = slf.protection[dam_index_fire]; }
	else if (protId == dam_index_fly) { protValue = slf.protection[dam_index_fly]; }
	else if (protId == dam_index_magic) { protValue = slf.protection[dam_index_magic]; }
	else if (protId == dam_index_point) { protValue = slf.protection[dam_index_point]; }
	else if (protId == dam_index_fall) { protValue = slf.protection[dam_index_fall]; }
	else { return 0; };
	
	if (protValue < 0) { return 0; };
	
	effectPower = StExt_TimedEffect_CalcPower(slf, oth);
	result = StExt_CurrentTimedEffectData.BaseValue;
	result += StExt_GetPercentFromValue(effectPower, StExt_CurrentTimedEffectData.PowerRatio);
	return StExt_ValidateValueRange(result, StExt_CurrentTimedEffectData.MinValue, StExt_CurrentTimedEffectData.MaxValue);
};

func int StExt_TimedEffect_CalcDebufProtValue(var c_npc slf, var c_npc oth, var int protId)
{
	var int result; 
	var int effectPower; 
	var int protValue;
	
	if (protId == dam_index_blunt) { protValue = slf.protection[dam_index_blunt]; }
	else if (protId == dam_index_edge) { protValue = slf.protection[dam_index_edge]; }
	else if (protId == dam_index_fire) { protValue = slf.protection[dam_index_fire]; }
	else if (protId == dam_index_fly) { protValue = slf.protection[dam_index_fly]; }
	else if (protId == dam_index_magic) { protValue = slf.protection[dam_index_magic]; }
	else if (protId == dam_index_point) { protValue = slf.protection[dam_index_point]; }
	else if (protId == dam_index_fall) { protValue = slf.protection[dam_index_fall]; }
	else { return 0; };
	
	if (protValue < 0) { return 0; };
	
	effectPower = StExt_TimedEffect_CalcPower(slf, oth);
	result = StExt_CurrentTimedEffectData.BaseValue;
	result += StExt_GetPercentFromValue(effectPower, StExt_CurrentTimedEffectData.PowerRatio);
	result = StExt_ValidateValueRange(result, StExt_CurrentTimedEffectData.MinValue, StExt_CurrentTimedEffectData.MaxValue);
	return StExt_ValidateValueRange(result, 0, protValue);
};

func int StExt_TimedEffect_CalcDebufStatValue(var c_npc slf, var c_npc oth, var int statValue)
{
	var int result; 
	var int effectPower;
	if (statValue <= 10) { return 0; };
	
	effectPower = StExt_TimedEffect_CalcPower(slf, oth);
	result = StExt_CurrentTimedEffectData.BaseValue;
	result += StExt_GetPercentFromValue(effectPower, StExt_CurrentTimedEffectData.PowerRatio);
	result = StExt_ValidateValueRange(result, StExt_CurrentTimedEffectData.MinValue, StExt_CurrentTimedEffectData.MaxValue);
	return StExt_ValidateValueRange(result, 0, statValue - 10);
};

//**************************************************************************************************

func void StExt_ApplyTimedEffect_Init(var c_npc slf, var c_npc oth, var int power, var int time, var int flags)
{
	StExt_CreatedTimedEffect.Flags = StExt_CurrentTimedEffectData.Flags | flags;
	StExt_CreatedTimedEffect.EffectId = StExt_CurrentTimedEffectData.Id;
	if (power > 0) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Power] = power; };
	if (time > 0) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] = time; };
	
	if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Spell)) { };
	if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Buff)) {  };		
	if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_DeBuff)) { };	
};

func int StExt_ApplyTimedEffect_GetOrCreate(var c_npc slf, var c_npc oth)
{
	var int result; result = true;
	StExt_CheckUid(oth); StExt_CheckUid(slf);
	
	StExt_CreatedTimedEffect = StExt_GetTimedEffectByNpc(StExt_GetNpcUid(slf), StExt_CurrentTimedEffectData.Id);
	if (Hlp_IsNULL(StExt_CreatedTimedEffect)) 
	{
		StExt_CreatedTimedEffect = StExt_CreateTimedEffect(StExt_CurrentTimedEffectData.LoopName, 1000, slf, oth);
		if (Hlp_IsNULL(StExt_CreatedTimedEffect)) 
		{
			StExt_PrintDebugStack("StExt_Loop_CanContinue(): fail to create 'StExt_CreatedTimedEffect' - instance is Null!");
			return StExt_Null;
		};
		result = false;
	};
	
	StExt_CreatedTimedEffect.SelfUId = StExt_GetNpcUid(slf);
	if (hlp_isvalidnpc(oth) && StExt_IsSummonOrHero(oth))
	{		
		StExt_CreatedTimedEffect.OtherUId = StExt_GetNpcUid(oth);
		if (npc_isplayer(oth)) { StExt_CreatedTimedEffect.Flags = StExt_CreatedTimedEffect.Flags | StExt_TimedEffect_Flag_OtherIsHero; }
		else { StExt_CreatedTimedEffect.Flags = StExt_CreatedTimedEffect.Flags | StExt_TimedEffect_Flag_OtherIsSummon; };
	};
	return result;
};

func void StExt_ApplyTimedEffect_FinalizeCreation(var c_npc slf, var c_npc oth, var int isExistBefore)
{
	if (isExistBefore) {
		if (StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_CanUpdate) && 
			!StExt_StringIsEmpty(StExt_CurrentTimedEffectData.OnUpdate)) { StExt_CallActorsFunc(StExt_CurrentTimedEffectData.OnUpdate, slf, oth); };
	}
	else {
		if (!StExt_StringIsEmpty(StExt_CurrentTimedEffectData.OnInit)) { StExt_CallActorsFunc(StExt_CurrentTimedEffectData.OnInit, slf, oth); };
	};
};

// to self from other!
func int StExt_BuildTimedEffect(var c_npc slf, var c_npc oth, var int power, var int time, var int flags)
{
	var int timedEffectMode;
	var int isExistBefore; 
	
	if (!hlp_isvalidnpc(slf) || !hlp_isvalidnpc(oth)) {
		StExt_PrintDebug("StExt_BuildTimedEffect()", "Npc is null!", slf, oth);
		return false;
	};
	
	timedEffectMode = StExt_ApplyTimedEffect_GetOrCreate(slf, oth);
	isExistBefore = timedEffectMode == true;
	
	if (timedEffectMode == StExt_Null) { return false; };
	if (!isExistBefore) { StExt_ApplyTimedEffect_Init(slf, oth, power, time, flags); };	
	StExt_ApplyTimedEffect_FinalizeCreation(slf, oth, isExistBefore);
	
	if (hlp_isvalidnpc(oth) && StExt_IsSummonOrHero(oth))
	{
		if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Spell)) { StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, (1 + StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Power]) / 2); };
		if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Buff)) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, 1 + StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Power]); };		
		if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_DeBuff)) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, 1 + StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Power]); };
	};
	return true;
};


var int StExt_BuildMassTimedEffect_Loop_Power;
var int StExt_BuildMassTimedEffect_Loop_Time;
var int StExt_BuildMassTimedEffect_Loop_Flags;
var int StExt_BuildMassTimedEffect_Loop_TargetsCount;
var int StExt_BuildMassTimedEffect_Loop_TargetsAffected;

func void StExt_BuildMassTimedEffect_Loop()
{
	if (!hlp_isvalidnpc(StExt_Self) || !hlp_isvalidnpc(StExt_Other)) {
		StExt_PrintDebug("StExt_BuildMassTimedEffect_Loop()", "Npc is Null!", StExt_Self, StExt_Other);
		return;
	};
	if (StExt_BuildMassTimedEffect_Loop_TargetsCount <= 0) { return; };
	
	if (StExt_BuildTimedEffect(StExt_Self, StExt_Other, StExt_BuildMassTimedEffect_Loop_Power, StExt_BuildMassTimedEffect_Loop_Time, StExt_BuildMassTimedEffect_Loop_Flags))
	{
		StExt_BuildMassTimedEffect_Loop_TargetsAffected += 1;
		StExt_BuildMassTimedEffect_Loop_TargetsCount -= 1;
	};
};

func int StExt_BuildMassTimedEffect(var c_npc slf, var int power, var int time, var int radius, var int targetsCount, var int flags)
{
	var string targetSelector;
	
	if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Buff)) { targetSelector = "StExt_NpcsIsAllies_Engine"; }
	else if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_DeBuff)) { targetSelector = "StExt_NpcsIsDebuffTargets_Engine"; }
	else 
	{
		StExt_PrintDebugStack(concatstrings("StExt_BuildMassTimedEffect(): undefined behavior for effect! effectId: ", inttostring(StExt_CurrentTimedEffectData.Id)));
		return false;
	};
	
	if (targetsCount < 1) { targetsCount = 1; };
	if (radius < 100) { radius = 100; };
	
	StExt_BuildMassTimedEffect_Loop_Power = power;
	StExt_BuildMassTimedEffect_Loop_Time = time;
	StExt_BuildMassTimedEffect_Loop_Flags = flags;
	StExt_BuildMassTimedEffect_Loop_TargetsCount = targetsCount;
	StExt_BuildMassTimedEffect_Loop_TargetsAffected = 0;
	
	StExt_ForEachNpcInRadius(slf, radius, StExt_EmptyString, targetSelector, "StExt_BuildMassTimedEffect_Loop");
	
	return (StExt_BuildMassTimedEffect_Loop_TargetsAffected > 0);
};


//**************************************************************************************************

// Entry point of timed effects. (from self to other) Here we start pipeline...
func int StExt_ApplyTimedEffectEx(var c_npc slf, var c_npc oth, var int effectId, var int power, var int time, var int radius, var int targetsCount, var int flags)
{
	var C_TimedEffect TimedEffect;
	var int isExistBefore; isExistBefore = false;
	var int isOthValid; isOthValid = hlp_isvalidnpc(oth);
	var int isAoe; isAoe = StExt_ValueHasFlag(flags, StExt_TimedEffect_Flag_Aoe);
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebugStack("StExt_ApplyTimedEffect(): slf npc is Null!");
		return false;
	};
	
	StExt_CurrentTimedEffectData = StExt_GetTimedEffectData(effectId);	
	if (Hlp_IsNULL(StExt_CurrentTimedEffectData)) {
		StExt_PrintDebugStack(concatstrings("StExt_ApplyTimedEffect(): fail to find 'StExt_CurrentTimedEffectData'! effectId: ", inttostring(effectId)));
		return false;
	};	
	
	if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Dot)) { return StExt_BuildTimedEffect(slf, oth, power, time, flags); }
	else if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_Buff))
	{
		if (isAoe) { return StExt_BuildMassTimedEffect(slf, power, time, radius, targetsCount, flags); }
		else if (isOthValid) { return StExt_BuildTimedEffect(oth, slf, power, time, flags); }
		else { return StExt_BuildTimedEffect(slf, slf, power, time, flags); };
	}
	else if (StExt_ValueHasFlag(StExt_CurrentTimedEffectData.Flags, StExt_TimedEffect_Flag_DeBuff))
	{
		if (isAoe) { return StExt_BuildMassTimedEffect(slf, power, time, radius, targetsCount, flags); }
		else if (isOthValid) { return StExt_BuildTimedEffect(oth, slf, power, time, flags); };
	};

	StExt_PrintDebugStack(concatstrings("StExt_ApplyTimedEffect(): undefined behavior for effect! effectId: ", inttostring(effectId)));
	return false;	
};

func int StExt_ApplyTimedEffect(var c_npc slf, var c_npc oth, var int effectId) { return StExt_ApplyTimedEffectEx(slf, oth, effectId, 0, 0, 0, 0, 0); };

func int StExt_ApplyRandomDebuffEffect(var c_npc slf, var c_npc oth, var int power, var int time, var int radius, var int targetsCount, var int flags)
{
	var int effectId;
	var int rand; rand = hlp_random(8);
	
	if (rand == 0) { effectId = StExt_TimedEffect_Index_ProtectionCurse; }
	else if (rand == 1) { effectId = StExt_TimedEffect_Index_StatsCurse; }
	else if (rand == 2) { effectId = StExt_TimedEffect_Index_SiphonCurse; }
	else if (rand == 3) { effectId = StExt_TimedEffect_Index_SpeedCurse; }
	else if (rand == 4) { effectId = StExt_TimedEffect_Index_LifeTapCurse; }
	else if (rand == 5) { effectId = StExt_TimedEffect_Index_ReflectDamageCurse; }
	else if (rand == 6) { effectId = StExt_TimedEffect_Index_ExtraDamageCurse; }
	else if (rand == 7) { effectId = StExt_TimedEffect_Index_WeakenCurse; }
	else { effectId = StExt_TimedEffect_Index_ProtectionCurse; };
	
	return StExt_ApplyTimedEffectEx(slf, oth, effectId, power, time, radius, targetsCount, flags);
};