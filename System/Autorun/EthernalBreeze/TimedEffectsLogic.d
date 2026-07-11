func int StExt_TimedEffect_Loop_CanContinue()
{
	if (Hlp_IsNULL(StExt_CurrentTimedEffect)) { 
		StExt_PrintDebugStack("StExt_Loop_CanContinue(): 'StExt_CurrentTimedEffect' instance is Null!");
		return false; 
	};
	if (!hlp_isvalidnpc(StExt_Self) || Hlp_IsNULL(StExt_Self)) {
		StExt_PrintDebugStack("StExt_Loop_CanContinue(): 'StExt_Self' instance is Null!");
		return false;
	};
	if (npc_isdead(StExt_Self)) { return false; };
	return true;
};

func int StExt_TimedEffect_DeBuffShouldStopOnDownTarget()
{
	if (!c_npcisdown(StExt_Self)) { return false; };
	if (npc_isplayer(StExt_Self)) { return true; };
	if (hlp_isvalidnpc(StExt_Other)) { return !StExt_CanApplyDebuffToUnconsciousNpc(StExt_Other, StExt_Self); };
	if (StExt_ValueHasFlag(StExt_CurrentTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsHero)) {
		return !StExt_CanApplyDebuffToUnconsciousNpc(hero, StExt_Self);
	};
	return true;
};


// ===========================================================================================
//										INITIALIZERS
// ===========================================================================================

// Call/attach only concreate functions and never base initializers, or stack will die!

func void StExt_TimedEffect_Init_Base(var c_npc slf, var c_npc oth, var int duration)
{
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_IsInit] = true;
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] = duration;	
};


func void StExt_TimedEffect_Init_Base_Buff(var c_npc slf, var c_npc oth)
{
	var int duration;
	duration = StExt_TimedEffect_CalcDuration(slf, oth);
	
	StExt_TimedEffect_Init_Base(slf, oth, duration);
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellFX_HealShrine", slf); };
};

func void StExt_TimedEffect_Init_Base_DeBuff(var c_npc slf, var c_npc oth)
{
	var int duration;
	duration = StExt_TimedEffect_CalcDuration(slf, oth);
	
	StExt_TimedEffect_Init_Base(slf, oth, duration);
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellfx_beliarshrine", slf); };
};


func void StExt_TimedEffect_Init_Base_RegenBuff(var c_npc slf, var c_npc oth, var int statId)
{
	StExt_TimedEffect_Init_Base_Buff(slf, oth);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcValue(slf, oth);
};

func void StExt_TimedEffect_Init_Base_StatBuff(var c_npc slf, var c_npc oth, var int statId)
{
	StExt_TimedEffect_Init_Base_Buff(slf, oth);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcValue(slf, oth);
	
	if (statId == 0)
	{ 
		slf.attribute[1] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		slf.attribute[0] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
	}
	else if (statId == 1) 
	{ 
		slf.attribute[2] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		slf.attribute[3] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
	}
	else if (statId == 2) { slf.attribute[4] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
	else if (statId == 3) { slf.attribute[5] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
	else if (statId == 9) 
	{ 
		slf.attribute[4] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		slf.attribute[5] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; 
	}
	else if (npc_isplayer(slf))
	{
		if (statId == 4) { StExt_PcStats_Buffs[StExt_PcStats_Index_St] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 5) { StExt_PcStats_Buffs[StExt_PcStats_Index_Int] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 6) { StExt_PcStats_Buffs[StExt_PcStats_Index_Es] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 7) { StExt_PcStats_Buffs[StExt_PcStats_Index_DodgeChance] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 8) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraSpeed] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }		
		else if (statId == 10) 
		{ 
			StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraSpellDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
			StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraMeleeDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
			StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraRangeDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		};
	}
	else
	{
		if (statId == 6) { StExt_Npc_ChangeMaxEs(slf, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == 7) { StExt_Npc_ChangeDodgeChance(slf, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == 8) { StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == 10) 
		{ 
			StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraMagicDamage, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]);
			StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraMeleeDamage, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]);
			StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraRangeDamage, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]);
		};
	};
};

func void StExt_TimedEffect_Init_Base_ExtStatBuff(var c_npc slf, var c_npc oth, var int statId)
{
	StExt_TimedEffect_Init_Base_Buff(slf, oth);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcValue(slf, oth);
	
	if (npc_isplayer(slf))
	{
		if (statId == StExt_AiVar_ResistEdge) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistEdge] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ResistBlunt) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistBlunt] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ResistFire) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistFire] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ResistMagic) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistMagic] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ResistFly) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistFly] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ResistPoint) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistPoint] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ResistPois) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistPoison] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

		else if (statId == StExt_AiVar_ResistAoe) { StExt_PcStats_Buffs[StExt_PcStats_Index_AoeResist] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

		else if (statId == StExt_AiVar_ExtraMagicDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraSpellDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ExtraMeleeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraMeleeDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ExtraRangeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraRangeDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

		else if (statId == StExt_AiVar_BluntDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraBluntDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_EdgeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraEdgeDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_FireDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraFireDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_FlyDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraFlyDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_MagicDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraMagicDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_PointDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraPointDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_PoisionDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraPoisonDam] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

		else if (statId == StExt_AiVar_DotBluntDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_BluntDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_DotEdgeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_EdgeDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_DotFireDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_FireDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_DotFlyDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_FlyDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_DotMagicDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_MagicDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_DotPointDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_PointDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_DotPoisionDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_PoisDotDamage] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == StExt_AiVar_ExtraDotTicks) { StExt_PcStats_Buffs[StExt_PcStats_Index_DotExtraTick] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		
		else if (statId == StExt_AiVar_ReflectBluntDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsBlunt, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ReflectEdgeDamage)  { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsEdge, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ReflectPointDamage)  { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsPoint, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ReflectFireDamage)  { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsFire, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ReflectFlyDamage)  { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsFly, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ReflectMagicDamage)  { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsMagic, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ReflectPoisionDamage)  { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsPoision, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ExtraAimChance)  { StExt_ChangePcBonus(StExt_PcStats_Index_AimChance, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ResistDot) { StExt_ChangePcBonus( StExt_PcStats_Index_ResistDot, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
		else if (statId == StExt_AiVar_ResistReflect) { StExt_ChangePcBonus( StExt_PcStats_Index_ResistReflect, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); };
	}
	else { StExt_Npc_ChangeAivEx(slf, statId, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]); };
};

func void StExt_TimedEffect_Init_Base_ProtBuff(var c_npc slf, var c_npc oth, var int protFlags)
{
	StExt_TimedEffect_Init_Base_Buff(slf, oth);
	
	if (StExt_ValueHasFlag(protFlags, dam_blunt)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_blunt);
	};
	if (StExt_ValueHasFlag(protFlags, dam_edge)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_edge);
	};
	if (StExt_ValueHasFlag(protFlags, dam_fire)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_fire);
	};
	if (StExt_ValueHasFlag(protFlags, dam_fly)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_fly);
	};
	if (StExt_ValueHasFlag(protFlags, dam_magic)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_magic);
	};
	if (StExt_ValueHasFlag(protFlags, dam_point)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_point);
	};
	if (StExt_ValueHasFlag(protFlags, dam_fall)) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison] = StExt_TimedEffect_CalcExtProtValue(slf, oth, dam_index_fall);
	};

	slf.protection[dam_index_blunt] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
	slf.protection[dam_index_edge] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
	slf.protection[dam_index_fire] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
	slf.protection[dam_index_fly] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
	slf.protection[dam_index_magic] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
	slf.protection[dam_index_point] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
	slf.protection[dam_index_fall] += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
};


func void StExt_TimedEffect_Base_UpdateCapeSpell(var c_npc slf, var c_npc oth, var int spellId, var int isInitializing)
{
	var int damageTotal;
	var int damagePerType;
	var int damageTypeCount;
	var int damageEnum;
	var int damageType;
	var int damageFlags;
	var int radius;
	var int duration;
	
	damagePerType = 0;
	damageType = StExt_GetSpellDamageFlags(spellId);
	damageFlags = StExt_GetSpellEffectFlags(spellId) | StExt_DamageFlag_Aoe;
	damageEnum = StExt_GetTrueDamageType(damageType);
	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType] = damageType;
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageFlags] = damageFlags;
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageEnum] = damageEnum;
	
	damageTotal = StExt_TimedEffect_CalcValue(slf, oth);
	duration = StExt_TimedEffect_CalcDuration(slf, oth);
	radius = StExt_TimedEffect_CalcRadius(slf, oth);
	
	if (npc_isplayer(oth))
	{
		damagePerType += StExt_PcStats[StExt_PcStats_Index_AoeExtraDamage] + StExt_PcStats[StExt_PcStats_Index_AoeExtraMagicDamage];
		damagePerType += StExt_GetPermilleFromValue(damageTotal, StExt_PcStats[StExt_PcStats_Index_AoeExtraDamagePerc]);
		damagePerType += StExt_GetPermilleFromValue(damageTotal, StExt_PcStats[StExt_PcStats_Index_AoeExtraMagicDamagePerc]);
		damageTotal += damagePerType;
	};
	
	damageTypeCount = StExt_GetDamageTypesCount(damageEnum);
	if (damageTypeCount <= 0) { 
		damageTypeCount = 1; 
		damageEnum = damageEnum | dam_barrier;
	}
	else if (damageTypeCount > 7) { damageTypeCount = 7; };
	
	damagePerType = (damageTotal + StExt_MinDamage) / damageTypeCount;
	if (damagePerType <= 0) { damagePerType = 1; };
	
	if(isInitializing) { 
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_IsInit] = true; 
	};
	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTotal] = damageTotal;	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Radius] = radius;
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] = duration;
	
	if (StExt_ValueHasFlag(damageEnum, dam_barrier)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True] = damagePerType; };	
	if (StExt_ValueHasFlag(damageEnum, dam_blunt)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_edge)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_fire)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_fly)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_magic)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_point)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_fall)) { StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison] = damagePerType; };
};

func void StExt_TimedEffect_Init_Base_CapeSpell(var c_npc slf, var c_npc oth, var int spellId) { StExt_TimedEffect_Base_UpdateCapeSpell(slf, oth, spellId, true); };
func void StExt_TimedEffect_Update_Base_CapeSpell(var c_npc slf, var c_npc oth, var int spellId) { StExt_TimedEffect_Base_UpdateCapeSpell(slf, oth, spellId, false); };

func void StExt_TimedEffect_Init_Base_FlaggedDeBuff(var c_npc slf, var c_npc oth, var int debufId)
{
	var int appliedCurseFlags;
	var int appliedCursePower;

	StExt_TimedEffect_Init_Base_DeBuff(slf, oth);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcPower(slf, oth);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_2] = debufId;
	
	appliedCurseFlags = StExt_GetNpcVar(slf, StExt_AiVar_AppliedCurseFlags);
	appliedCursePower = StExt_GetNpcVar(slf, StExt_AiVar_AppliedCursePower);
	
	appliedCurseFlags = appliedCurseFlags | StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_2];
	appliedCursePower = StExt_IfInt(StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] > appliedCursePower, StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1], appliedCursePower);
	
	StExt_SetNpcVar(slf, StExt_AiVar_AppliedCurseFlags, appliedCurseFlags);
	StExt_SetNpcVar(slf, StExt_AiVar_AppliedCursePower, appliedCursePower);
};

// ===========================================================================================

func void StExt_TimedEffect_Init_HpRegen() { StExt_TimedEffect_Init_Base_RegenBuff(StExt_Self, StExt_Other, 0); };
func void StExt_TimedEffect_Init_EsRegen() { StExt_TimedEffect_Init_Base_RegenBuff(StExt_Self, StExt_Other, 1); };
func void StExt_TimedEffect_Init_MpRegen() { StExt_TimedEffect_Init_Base_RegenBuff(StExt_Self, StExt_Other, 2); };
func void StExt_TimedEffect_Init_StRegen() { StExt_TimedEffect_Init_Base_RegenBuff(StExt_Self, StExt_Other, 3); };
func void StExt_TimedEffect_Init_AllRegen() { StExt_TimedEffect_Init_Base_RegenBuff(StExt_Self, StExt_Other, 4); };

func void StExt_TimedEffect_Init_HpBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 0); };
func void StExt_TimedEffect_Init_MpBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 1); };
func void StExt_TimedEffect_Init_EsBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 6); };
func void StExt_TimedEffect_Init_StBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 4); };

func void StExt_TimedEffect_Init_StrBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 2); };
func void StExt_TimedEffect_Init_AgiBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 3); };
func void StExt_TimedEffect_Init_IntBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 5); };
func void StExt_TimedEffect_Init_SpeedBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 8); };

func void StExt_TimedEffect_Init_ProtAllBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_blunt | dam_edge | dam_fire | dam_fly | dam_magic | dam_point | dam_fall); };
func void StExt_TimedEffect_Init_ProtBluntBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_blunt); };
func void StExt_TimedEffect_Init_ProtEdgeBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_edge); };
func void StExt_TimedEffect_Init_ProtFireBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_fire); };
func void StExt_TimedEffect_Init_ProtFlyBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_fly); };
func void StExt_TimedEffect_Init_ProtMagicBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_magic); };
func void StExt_TimedEffect_Init_ProtPointBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_point); };
func void StExt_TimedEffect_Init_ProtFallBonus() { StExt_TimedEffect_Init_Base_ProtBuff(StExt_Self, StExt_Other, dam_fall); };

func void StExt_TimedEffect_Init_ResistAllBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistAll); };
func void StExt_TimedEffect_Init_ResistAoeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistAoe); };
func void StExt_TimedEffect_Init_ResistBluntBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistBlunt); };
func void StExt_TimedEffect_Init_ResistEdgeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistEdge); };
func void StExt_TimedEffect_Init_ResistFireBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistFire); };
func void StExt_TimedEffect_Init_ResistFlyBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistFly); };
func void StExt_TimedEffect_Init_ResistMagicBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistMagic); };
func void StExt_TimedEffect_Init_ResistPointBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistPoint); };
func void StExt_TimedEffect_Init_ResistFallBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistPois); };
func void StExt_TimedEffect_Init_ResistDotBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistDot); };
func void StExt_TimedEffect_Init_ResistReflectBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ResistReflect); };

func void StExt_TimedEffect_Init_DodgeBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 7); };
func void StExt_TimedEffect_Init_AllStatsBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 9); };
func void StExt_TimedEffect_Init_AllDamageBonus() { StExt_TimedEffect_Init_Base_StatBuff(StExt_Self, StExt_Other, 10); };
func void StExt_TimedEffect_Init_AimBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ExtraAimChance); };

func void StExt_TimedEffect_Init_DamageTrueBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_TrueDamage); };
func void StExt_TimedEffect_Init_DamageBluntBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_BluntDamage); };
func void StExt_TimedEffect_Init_DamageEdgeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_EdgeDamage); };
func void StExt_TimedEffect_Init_DamageFireBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_FireDamage); };
func void StExt_TimedEffect_Init_DamageFlyBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_FlyDamage); };
func void StExt_TimedEffect_Init_DamageMagicBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_MagicDamage); };
func void StExt_TimedEffect_Init_DamagePointBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_PointDamage); };
func void StExt_TimedEffect_Init_DamageFallBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_PoisionDamage); };

func void StExt_TimedEffect_Init_DamageMeleeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ExtraMeleeDamage); };
func void StExt_TimedEffect_Init_DamageRangeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ExtraRangeDamage); };
func void StExt_TimedEffect_Init_DamageSpellBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ExtraMagicDamage); };
func void StExt_TimedEffect_Init_DotDurationBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ExtraDotTicks); };

func void StExt_TimedEffect_Init_DamageDotTrueBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotTrueDamage); };
func void StExt_TimedEffect_Init_DamageDotBluntBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotBluntDamage); };
func void StExt_TimedEffect_Init_DamageDotEdgeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotEdgeDamage); };
func void StExt_TimedEffect_Init_DamageDotFireBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotFireDamage); };
func void StExt_TimedEffect_Init_DamageDotFlyBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotFlyDamage); };
func void StExt_TimedEffect_Init_DamageDotMagicBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotMagicDamage); };
func void StExt_TimedEffect_Init_DamageDotPointBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotPointDamage); };
func void StExt_TimedEffect_Init_DamageDotFallBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_DotPoisionDamage); };

func void StExt_TimedEffect_Init_DamageReflectTrueBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectTrueDamage); };
func void StExt_TimedEffect_Init_DamageReflectBluntBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectBluntDamage); };
func void StExt_TimedEffect_Init_DamageReflectEdgeBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectEdgeDamage); };
func void StExt_TimedEffect_Init_DamageReflectFireBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectFireDamage); };
func void StExt_TimedEffect_Init_DamageReflectFlyBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectFlyDamage); };
func void StExt_TimedEffect_Init_DamageReflectMagicBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectMagicDamage); };
func void StExt_TimedEffect_Init_DamageReflectPointBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectPointDamage); };
func void StExt_TimedEffect_Init_DamageReflectFallBonus() { StExt_TimedEffect_Init_Base_ExtStatBuff(StExt_Self, StExt_Other, StExt_AiVar_ReflectPoisionDamage); };

func void StExt_TimedEffect_Init_Elevation() 
{ 
	if (npc_isplayer(StExt_Self))
	{
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcValue(StExt_Self, StExt_Other);
		countlearnspell += StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellFX_HealShrine", StExt_Self); };
	};
	StExt_TimedEffect_Init_Base_Buff(StExt_Self, StExt_Other);	
};

func int StExt_TimedEffect_Init_Firecape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_firecape); };
func int StExt_TimedEffect_Init_Icecape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_icecape); };
func int StExt_TimedEffect_Init_Lightingcape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_lightingcape); };
func int StExt_TimedEffect_Init_Darkcape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_darkcape); };
func int StExt_TimedEffect_Init_Aircape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_aircape); };
func int StExt_TimedEffect_Init_Earthcape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_earthcape); };
func int StExt_TimedEffect_Init_Poisioncape() { StExt_TimedEffect_Init_Base_CapeSpell(StExt_Self, StExt_Other, spl_poisioncape); };

func void StExt_TimedEffect_ProtDeBuff_Init()
{
	StExt_TimedEffect_Init_Base_DeBuff(StExt_Self, StExt_Other);
	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_blunt);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_edge);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_fire);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_fly);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_magic);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_point);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison] = StExt_TimedEffect_CalcDebufProtValue(StExt_Self, StExt_Other, dam_index_fall);

	StExt_Self.protection[dam_index_blunt] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
	StExt_Self.protection[dam_index_edge] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
	StExt_Self.protection[dam_index_fire] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
	StExt_Self.protection[dam_index_fly] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
	StExt_Self.protection[dam_index_magic] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
	StExt_Self.protection[dam_index_point] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
	StExt_Self.protection[dam_index_fall] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
};

func void StExt_TimedEffect_StatDeBuff_Init()
{
	StExt_TimedEffect_Init_Base_DeBuff(StExt_Self, StExt_Other);	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcDebufStatValue(StExt_Self, StExt_Other, StExt_Self.attribute[4]);
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_2] = StExt_TimedEffect_CalcDebufStatValue(StExt_Self, StExt_Other, StExt_Self.attribute[5]);
	StExt_Self.attribute[4] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
	StExt_Self.attribute[5] -= StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_2]; 
};

func void StExt_TimedEffect_LifeSiphonDeBuff_Init()
{
	StExt_TimedEffect_Init_Base_DeBuff(StExt_Self, StExt_Other);	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcValue(StExt_Self, StExt_Other);
};

func void StExt_TimedEffect_SpeedDeBuff_Init()
{
	StExt_TimedEffect_Init_Base_DeBuff(StExt_Self, StExt_Other);	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] = StExt_TimedEffect_CalcValue(StExt_Self, StExt_Other);
	StExt_Npc_ChangeAiv(StExt_Self, aivrx_npc_speed, -StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]);
};

func void StExt_TimedEffect_LifeTapCurse_Init() { StExt_TimedEffect_Init_Base_FlaggedDeBuff(StExt_Self, StExt_Other, StExt_DebuffFlag_LifeTap); };
func void StExt_TimedEffect_ReflectDamageCurse_Init() { StExt_TimedEffect_Init_Base_FlaggedDeBuff(StExt_Self, StExt_Other, StExt_DebuffFlag_IronMaiden); };
func void StExt_TimedEffect_ExtraDamageCurse_Init() { StExt_TimedEffect_Init_Base_FlaggedDeBuff(StExt_Self, StExt_Other, StExt_DebuffFlag_AmplifyDamage); };
func void StExt_TimedEffect_WeakenCurse_Init() { StExt_TimedEffect_Init_Base_FlaggedDeBuff(StExt_Self, StExt_Other, StExt_DebuffFlag_Weaken); };

// ===========================================================================================
//										LOOP LOGIC
// ===========================================================================================

// Call/attach only concreate functions and never base loop handlers, or stack will die!

func int StExt_TimedEffect_Buff_BaseRegen_Loop(var int statId)
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
		
	if (statId == 0) { StExt_Npc_Restorehealth(StExt_Self, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
	else if (statId == 1) {	StExt_Npc_ChangeEs(StExt_Self, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
	else if ((statId == 2) && !npc_isplayer(StExt_Self)) { rx_restoremana(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
	else if ((statId == 3) && !npc_isplayer(StExt_Self)) { rx_restorestamina(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
	else if ((statId == 4)) 
	{ 
		StExt_Npc_Restorehealth(StExt_Self, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]);
		StExt_Npc_ChangeEs(StExt_Self, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]);
		if (npc_isplayer(StExt_Self))
		{
			rx_restoremana(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]);
			rx_restorestamina(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1] * 3); 
		};
	};
		
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(!npc_isplayer(StExt_Self) && ((statId == 2) || (statId == 3))) {
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] = StExt_Null;
	};
	
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) { return LOOP_END; };	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_Buff_BaseProtection_Loop(var int protFlags)
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		StExt_Self.protection[dam_index_blunt] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
		StExt_Self.protection[dam_index_edge] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
		StExt_Self.protection[dam_index_fire] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
		StExt_Self.protection[dam_index_fly] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
		StExt_Self.protection[dam_index_magic] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
		StExt_Self.protection[dam_index_point] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
		StExt_Self.protection[dam_index_fall] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_Buff_BaseStat_Loop(var int statId)
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		if (statId == 0) { StExt_Self.attribute[1] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 1) { StExt_Self.attribute[3] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 2) { StExt_Self.attribute[4] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 3) { StExt_Self.attribute[5] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
		else if (statId == 9) 
		{ 
			StExt_Self.attribute[4] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
			StExt_Self.attribute[5] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; 
		}
		else if (npc_isplayer(StExt_Self))
		{
			if (statId == 4) { StExt_PcStats_Buffs[StExt_PcStats_Index_St] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == 5) { StExt_PcStats_Buffs[StExt_PcStats_Index_Int] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == 6) { StExt_PcStats_Buffs[StExt_PcStats_Index_Es] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == 7) { StExt_PcStats_Buffs[StExt_PcStats_Index_DodgeChance] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == 8) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraSpeed] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == 10) 
			{ 
				StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraSpellDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
				StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraMeleeDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
				StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraRangeDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
			};
		}
		else
		{
			if (statId == 6) { StExt_Npc_ChangeMaxEs(StExt_Self, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == 7) { StExt_Npc_ChangeDodgeChance(StExt_Self, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == 8) { StExt_Npc_ChangeAiv(StExt_Self, aivrx_npc_speed, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == 10) 
			{ 
				StExt_Npc_ChangeAivEx(StExt_Self, StExt_AiVar_ExtraMagicDamage, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]);
				StExt_Npc_ChangeAivEx(StExt_Self, StExt_AiVar_ExtraMeleeDamage, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]);
				StExt_Npc_ChangeAivEx(StExt_Self, StExt_AiVar_ExtraRangeDamage, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]);
			};
		};
		
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_Buff_BaseExtStat_Loop(var int statId)
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		if (npc_isplayer(StExt_Self))
		{
			if (statId == StExt_AiVar_ResistEdge) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistEdge] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ResistBlunt) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistBlunt] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ResistFire) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistFire] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ResistMagic) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistMagic] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ResistFly) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistFly] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ResistPoint) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistPoint] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ResistPois) { StExt_PcStats_Buffs[StExt_PcStats_Index_ResistPoison] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

			else if (statId == StExt_AiVar_ResistAoe) { StExt_PcStats_Buffs[StExt_PcStats_Index_AoeResist] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

			else if (statId == StExt_AiVar_ExtraMagicDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraSpellDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ExtraMeleeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraMeleeDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ExtraRangeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraRangeDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

			else if (statId == StExt_AiVar_BluntDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraBluntDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_EdgeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraEdgeDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_FireDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraFireDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_FlyDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraFlyDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_MagicDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraMagicDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_PointDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraPointDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_PoisionDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_ExtraPoisonDam] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }

			else if (statId == StExt_AiVar_DotBluntDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_BluntDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_DotEdgeDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_EdgeDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_DotFireDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_FireDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_DotFlyDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_FlyDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_DotMagicDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_MagicDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_DotPointDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_PointDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_DotPoisionDamage) { StExt_PcStats_Buffs[StExt_PcStats_Index_PoisDotDamage] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			else if (statId == StExt_AiVar_ExtraDotTicks) { StExt_PcStats_Buffs[StExt_PcStats_Index_DotExtraTick] -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]; }
			
			else if (statId == StExt_AiVar_ReflectBluntDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsBlunt, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ReflectEdgeDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsEdge, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ReflectPointDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsPoint, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ReflectFireDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsFire, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ReflectFlyDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsFly, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ReflectMagicDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsMagic, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ReflectPoisionDamage) { StExt_ChangePcBonus(StExt_PcStats_Index_ReflectDamageAsPoision, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ExtraAimChance) { StExt_ChangePcBonus(StExt_PcStats_Index_AimChance, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ResistDot) { StExt_ChangePcBonus( StExt_PcStats_Index_ResistDot, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
			else if (statId == StExt_AiVar_ResistReflect) { StExt_ChangePcBonus( StExt_PcStats_Index_ResistReflect, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); };
		}
		else { StExt_Npc_ChangeAivEx(StExt_Self, statId, -StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer]); };
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};


// ===========================================================================================

func int StExt_TimedEffect_Loop_HpRegen() { return StExt_TimedEffect_Buff_BaseRegen_Loop(0); };
func int StExt_TimedEffect_Loop_EsRegen() { return StExt_TimedEffect_Buff_BaseRegen_Loop(1); };
func int StExt_TimedEffect_Loop_MpRegen() { return StExt_TimedEffect_Buff_BaseRegen_Loop(2); };
func int StExt_TimedEffect_Loop_StRegen() { return StExt_TimedEffect_Buff_BaseRegen_Loop(3); };
func int StExt_TimedEffect_Loop_AllRegen() { return StExt_TimedEffect_Buff_BaseRegen_Loop(4); };

func int StExt_TimedEffect_Loop_HpBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(0); };
func int StExt_TimedEffect_Loop_MpBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(1); };
func int StExt_TimedEffect_Loop_EsBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(6); };
func int StExt_TimedEffect_Loop_StBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(4); };

func int StExt_TimedEffect_Loop_StrBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(2); };
func int StExt_TimedEffect_Loop_AgiBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(3); };
func int StExt_TimedEffect_Loop_IntBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(5); };
func int StExt_TimedEffect_Loop_SpeedBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(8); };

func int StExt_TimedEffect_Loop_ProtAllBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_blunt | dam_edge | dam_fire | dam_fly | dam_magic | dam_point | dam_fall); };
func int StExt_TimedEffect_Loop_ProtBluntBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_blunt); };
func int StExt_TimedEffect_Loop_ProtEdgeBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_edge); };
func int StExt_TimedEffect_Loop_ProtFireBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_fire); };
func int StExt_TimedEffect_Loop_ProtFlyBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_fly); };
func int StExt_TimedEffect_Loop_ProtMagicBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_magic); };
func int StExt_TimedEffect_Loop_ProtPointBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_point); };
func int StExt_TimedEffect_Loop_ProtFallBonus() { return StExt_TimedEffect_Buff_BaseProtection_Loop(dam_fall); };

func int StExt_TimedEffect_Loop_ResistAllBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistAll); };
func int StExt_TimedEffect_Loop_ResistAoeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistAoe); };
func int StExt_TimedEffect_Loop_ResistDotBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistDot); };
func int StExt_TimedEffect_Loop_ResistBluntBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistBlunt); };
func int StExt_TimedEffect_Loop_ResistEdgeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistEdge); };
func int StExt_TimedEffect_Loop_ResistFireBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistFire); };
func int StExt_TimedEffect_Loop_ResistFlyBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistFly); };
func int StExt_TimedEffect_Loop_ResistMagicBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistMagic); };
func int StExt_TimedEffect_Loop_ResistPointBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistPoint); };
func int StExt_TimedEffect_Loop_ResistFallBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistPois); };
func int StExt_TimedEffect_Loop_ResistReflectBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ResistReflect); };

func int StExt_TimedEffect_Loop_DodgeBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(7); };
func int StExt_TimedEffect_Loop_AllStatsBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(9); };
func int StExt_TimedEffect_Loop_AllDamageBonus() { return StExt_TimedEffect_Buff_BaseStat_Loop(10); };
func int StExt_TimedEffect_Loop_AimBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ExtraAimChance); };

func int StExt_TimedEffect_Loop_DamageTrueBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_TrueDamage); };
func int StExt_TimedEffect_Loop_DamageBluntBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_BluntDamage); };
func int StExt_TimedEffect_Loop_DamageEdgeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_EdgeDamage); };
func int StExt_TimedEffect_Loop_DamageFireBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_FireDamage); };
func int StExt_TimedEffect_Loop_DamageFlyBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_FlyDamage); };
func int StExt_TimedEffect_Loop_DamageMagicBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_MagicDamage); };
func int StExt_TimedEffect_Loop_DamagePointBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_PointDamage); };
func int StExt_TimedEffect_Loop_DamageFallBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_PoisionDamage); };

func int StExt_TimedEffect_Loop_DamageMeleeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ExtraMeleeDamage); };
func int StExt_TimedEffect_Loop_DamageRangeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ExtraRangeDamage); };
func int StExt_TimedEffect_Loop_DamageSpellBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ExtraMagicDamage); };
func int StExt_TimedEffect_Loop_DotDurationBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ExtraDotTicks); };

func int StExt_TimedEffect_Loop_DamageDotTrueBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotTrueDamage); };
func int StExt_TimedEffect_Loop_DamageDotBluntBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotBluntDamage); };
func int StExt_TimedEffect_Loop_DamageDotEdgeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotEdgeDamage); };
func int StExt_TimedEffect_Loop_DamageDotFireBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotFireDamage); };
func int StExt_TimedEffect_Loop_DamageDotFlyBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotFlyDamage); };
func int StExt_TimedEffect_Loop_DamageDotMagicBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotMagicDamage); };
func int StExt_TimedEffect_Loop_DamageDotPointBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotPointDamage); };
func int StExt_TimedEffect_Loop_DamageDotFallBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_DotPoisionDamage); };

func int StExt_TimedEffect_Loop_DamageReflectTrueBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectTrueDamage); };
func int StExt_TimedEffect_Loop_DamageReflectBluntBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectBluntDamage); };
func int StExt_TimedEffect_Loop_DamageReflectEdgeBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectEdgeDamage); };
func int StExt_TimedEffect_Loop_DamageReflectFireBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectFireDamage); };
func int StExt_TimedEffect_Loop_DamageReflectFlyBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectFlyDamage); };
func int StExt_TimedEffect_Loop_DamageReflectMagicBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectMagicDamage); };
func int StExt_TimedEffect_Loop_DamageReflectPointBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectPointDamage); };
func int StExt_TimedEffect_Loop_DamageReflectFallBonus() { return StExt_TimedEffect_Buff_BaseExtStat_Loop(StExt_AiVar_ReflectPoisionDamage); };

func int StExt_TimedEffect_Loop_Elevation()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	if (!npc_isplayer(StExt_Self)) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		countlearnspell -= StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func int StExt_TimedEffect_ProtDeBuff_Loop(var int protFlags)
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	if (StExt_TimedEffect_DeBuffShouldStopOnDownTarget()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		StExt_Self.protection[dam_index_blunt] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
		StExt_Self.protection[dam_index_edge] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
		StExt_Self.protection[dam_index_fire] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
		StExt_Self.protection[dam_index_fly] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
		StExt_Self.protection[dam_index_magic] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
		StExt_Self.protection[dam_index_point] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
		StExt_Self.protection[dam_index_fall] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_StatDeBuff_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	if (StExt_TimedEffect_DeBuffShouldStopOnDownTarget()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		StExt_Self.attribute[4] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1];
		StExt_Self.attribute[5] += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_2]; 
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_LifeSiphonDeBuff_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	if (StExt_TimedEffect_DeBuffShouldStopOnDownTarget()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;	
	if (hlp_isvalidnpc(StExt_Other)) { StExt_ApplyLifeSteal(StExt_Other, StExt_Self, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
	else if (StExt_ValueHasFlag(StExt_CurrentTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsHero)) { StExt_ApplyLifeSteal(hero, StExt_Self, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]); }
	else { return LOOP_END; };
	
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) { return LOOP_END; };	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_SpeedDeBuff_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	if (StExt_TimedEffect_DeBuffShouldStopOnDownTarget()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;	
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) { 
		StExt_Npc_ChangeAiv(StExt_Self, aivrx_npc_speed, StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_1]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_FlaggedDeBuff_Loop()
{
	var int appliedCurseFlags;	
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	if (StExt_TimedEffect_DeBuffShouldStopOnDownTarget()) { return LOOP_END; };
	
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) 
	{ 
		appliedCurseFlags = StExt_GetNpcVar(StExt_Self, StExt_AiVar_AppliedCurseFlags);		
		appliedCurseFlags = appliedCurseFlags & ~(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Value_2]);
		if (appliedCurseFlags == StExt_DebuffFlag_None) { StExt_SetNpcVar(StExt_Self, StExt_AiVar_AppliedCursePower, 0); };		
		StExt_SetNpcVar(StExt_Self, StExt_AiVar_AppliedCurseFlags, appliedCurseFlags);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;	
};