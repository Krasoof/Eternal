// Apply bonuses from aura if skill Generosity is learned
// and distance to player is valid
func void StExt_Summon_AuraPassiveHandler(var c_npc slf)
{
	var int hp;
	var int es;
	if(StExt_GamePaused()) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Summon_AuraPassiveHandler(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	if (npc_isdead(slf) || !StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) || !StExt_IsInAuraRange(slf)) { return; };
	
	hp = StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], StExt_PcStats_Auras[StExt_PcStats_Index_HpRegPerc]);
	es = StExt_GetPermilleFromValue(StExt_Npc_GetMaxEs(slf), StExt_PcStats_Auras[StExt_PcStats_Index_EsRegPerc]);
	hp += StExt_PcStats_Auras[StExt_PcStats_Index_HpReg];
	es += StExt_PcStats_Auras[StExt_PcStats_Index_EsReg];
	StExt_Npc_ChangeEs(slf, es);
	StExt_Npc_Restorehealth(slf, hp);
};

// Call every second for summons
func void StExt_Summon_PassiveHandler(var c_npc slf)
{
	var int hp;
	var int es;
	var int sumType;
	if(StExt_GamePaused()) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Summon_PassiveHandler(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	if (npc_isdead(slf)) { return; };
	StExt_Npc_PassiveHandler(slf);
	StExt_Summon_AuraPassiveHandler(slf);
	
	es = StExt_PcStats[StExt_PcStats_Index_SumEsRegen];
	hp = StExt_PcStats[StExt_PcStats_Index_SumHpRegen] + StExt_PcStats[StExt_PcStats_Index_SumHealing];
	sumType = StExt_GetSummonType(slf);
	if (sumType == StExt_SummonType_Beast) { hp += StExt_PcStats[StExt_PcStats_Index_SumAnimalHealing];	}
	else if (sumType == StExt_SummonType_Golem) 
	{
		hp += StExt_PcStats[StExt_PcStats_Index_SumGolemHealing];		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_SelfRepair)) { hp += StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 10); };
	}
	else if (sumType == StExt_SummonType_Demon)	
	{ 
		hp += StExt_PcStats[StExt_PcStats_Index_SumDemonHealing];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_BondWithInferno)) { hp += StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 5); };
	}
	else if (sumType == StExt_SummonType_Undead) 
	{ 
		hp += StExt_PcStats[StExt_PcStats_Index_SumUndeadHealing];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_PogostBind)) { hp += StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 5); };
	}
	else if (sumType == StExt_SummonType_Totem) { hp += StExt_PcStats[StExt_PcStats_Index_SumTotemHealing]; };
	StExt_Npc_ChangeEs(slf, es);
	StExt_Npc_Restorehealth(slf, hp);
};

func void StExt_GetSummonBaseStats(var c_npc slf)
{	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetSummonBaseStats(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	StExt_CurrentSummonStats = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_NpcBaseStats"));
	
	StExt_CurrentSummonStats.Hp = slf.attribute[atr_hitpoints_max];
	StExt_CurrentSummonStats.Str = slf.attribute[atr_strength];
	StExt_CurrentSummonStats.Agi = slf.attribute[atr_dexterity];
	StExt_CurrentSummonStats.Es = StExt_Npc_GetMaxEs(slf);

	StExt_CurrentSummonStats.ProtBlunt = slf.protection[prot_blunt];
	StExt_CurrentSummonStats.ProtEdge = slf.protection[prot_edge];
	StExt_CurrentSummonStats.ProtFire = slf.protection[prot_fire];
	StExt_CurrentSummonStats.ProtFly = slf.protection[prot_fly];
	StExt_CurrentSummonStats.ProtMagic = slf.protection[prot_magic];
	StExt_CurrentSummonStats.ProtPoint = slf.protection[prot_point];
	StExt_CurrentSummonStats.ProtFall = slf.protection[prot_fall];

	StExt_CurrentSummonStats.DamBlunt = slf.damage[dam_index_blunt];
	StExt_CurrentSummonStats.DamEdge = slf.damage[dam_index_edge];
	StExt_CurrentSummonStats.DamFire = slf.damage[dam_index_fire];
	StExt_CurrentSummonStats.DamFly = slf.damage[dam_index_fly];
	StExt_CurrentSummonStats.DamMagic = slf.damage[dam_index_magic];
	StExt_CurrentSummonStats.DamPoint = slf.damage[dam_index_point];
	StExt_CurrentSummonStats.DamFall = slf.damage[dam_index_fall];
	
	StExt_CurrentSummonStats.DamTotal = slf.damage[0] + slf.damage[1] + slf.damage[2] + 
		slf.damage[3] + slf.damage[4] + slf.damage[5] + slf.damage[6] + slf.damage[7];

	StExt_CurrentSummonStats.DodgeChance = StExt_GetNpcVar(slf, StExt_AiVar_DodgeChance);
	StExt_CurrentSummonStats.Speed = rx_getnpcvar(slf, aivrx_npc_speed);
};

// Apply bonuses from current aura source 
// if skill Generosity is learned
func void StExt_UpdateSummonStats_AuraBonus(var c_npc slf)
{
	var int hp;
	var int str;
	var int agi;
	var int es;	
	var int protBlunt;
	var int protEdge;
	var int protFire;
	var int protFly;
	var int protMagic;
	var int protPoint;
	var int protFall;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_UpdateSummonStats_AuraBonus(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) || !StExt_IsInAuraRange(slf)) { return; };
	
	hp = StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Hp, StExt_PcStats_Auras[StExt_PcStats_Index_HpPerc]);
	str = StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Str, StExt_PcStats_Auras[StExt_PcStats_Index_StrPerc]);
	agi = StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Agi, StExt_PcStats_Auras[StExt_PcStats_Index_AgiPerc]);
	slf.attribute[atr_hitpoints_max] += StExt_PcStats_Auras[StExt_PcStats_Index_Hp] + hp;
	slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];		
	slf.attribute[atr_strength] += StExt_PcStats_Auras[StExt_PcStats_Index_Str] + str;
	slf.attribute[atr_dexterity] += StExt_PcStats_Auras[StExt_PcStats_Index_Agi] + agi;

	protBlunt = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtBlunt, StExt_PcStats_Auras[StExt_PcStats_Index_ProtBluntPerc]);
	protEdge = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtEdge, StExt_PcStats_Auras[StExt_PcStats_Index_ProtEdgePerc]);
	protFire = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtFire, StExt_PcStats_Auras[StExt_PcStats_Index_ProtFirePerc]);
	protFly = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtFly, StExt_PcStats_Auras[StExt_PcStats_Index_ProtFlyPerc]);
	protMagic = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtMagic, StExt_PcStats_Auras[StExt_PcStats_Index_ProtMagicPerc]);
	protPoint = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtPoint, StExt_PcStats_Auras[StExt_PcStats_Index_ProtPointPerc]);	
	protFall = StExt_GetPermilleFromValueIfPositive(StExt_CurrentSummonStats.ProtFall, StExt_PcStats_Auras[StExt_PcStats_Index_ProtFallPerc]);	
	protBlunt += StExt_PcStats_Auras[StExt_PcStats_Index_ProtBlunt];
	protEdge += StExt_PcStats_Auras[StExt_PcStats_Index_ProtEdge];
	protFire += StExt_PcStats_Auras[StExt_PcStats_Index_ProtFire];
	protFly += StExt_PcStats_Auras[StExt_PcStats_Index_ProtFly];
	protMagic += StExt_PcStats_Auras[StExt_PcStats_Index_ProtMagic];
	protPoint += StExt_PcStats_Auras[StExt_PcStats_Index_ProtPoint];
	protFall += StExt_PcStats_Auras[StExt_PcStats_Index_ProtFall];

	slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtBlunt, protBlunt);
	slf.protection[prot_edge] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtEdge, protEdge);
	slf.protection[prot_fire] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtFire, protFire);
	slf.protection[prot_fly] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtFly, protFly);
	slf.protection[prot_magic] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtMagic, protMagic);
	slf.protection[prot_point] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtPoint, protPoint);
	slf.protection[prot_fall] = StExt_ChangeValueIfPositive(StExt_CurrentSummonStats.ProtFall, protFall);

	if (StExt_Npc_GetTotalDamage(slf) == 0) { slf.attribute[atr_strength] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]; }
	else
	{
		slf.damage[dam_index_blunt] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamBlunt, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
		slf.damage[dam_index_edge] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamEdge, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
		slf.damage[dam_index_point] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamPoint, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
		slf.damage[dam_index_fire] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamFire, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
		slf.damage[dam_index_fly] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamFly, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
		slf.damage[dam_index_magic] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamMagic, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
		slf.damage[dam_index_fall] = StExt_ChangeValueIfGreaterThanZero(StExt_CurrentSummonStats.DamFall, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage]);
	};
	
	es = StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Es, StExt_PcStats_Auras[StExt_PcStats_Index_EsPerc]);
	StExt_Npc_ChangeDodgeChance(slf, StExt_PcStats_Auras[StExt_PcStats_Index_DodgeChance]);
	StExt_Npc_ChangeMaxEs(slf, StExt_PcStats_Auras[StExt_PcStats_Index_Es] + es);
	StExt_Npc_ChangeEs(slf, StExt_PcStats_Auras[StExt_PcStats_Index_Es] + es);	
	StExt_Npc_ChangePoisionResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistPoison]);	
	StExt_Npc_ChangeEdgeResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistEdge]);
	StExt_Npc_ChangeFlyResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistFly]);
	StExt_Npc_ChangeFireResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistFire]);
	StExt_Npc_ChangeMagicResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistMagic]);
	StExt_Npc_ChangePointResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistPoint]);
	StExt_Npc_ChangeBluntResist(slf, StExt_PcStats_Auras[StExt_PcStats_Index_ResistBlunt]);
	StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, StExt_ValidateValueRange(StExt_PcStats_Auras[StExt_PcStats_Index_ExtraSpeed], 0, 25));
};

// Calculate summons percents bonuses before add extra stats
func void StExt_UpdateSummonStats_BaseBonus(var c_npc slf)
{
	var int sumType;
	var int hp;
	var int str;
	var int agi;
	var int damAll;
	var int protAll;
	var int extraBonus;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_UpdateSummonStats_BaseBonus(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	StExt_Npc_ResetAllAbilityCooldowns(slf);
	
	sumType = StExt_GetSummonType(slf);
	extraBonus = 0;
	hp = StExt_PcStats[StExt_PcStats_Index_SumGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumHpPower];
	str = StExt_PcStats[StExt_PcStats_Index_SumGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumStatsPower];
	agi = StExt_PcStats[StExt_PcStats_Index_SumGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumStatsPower];
	damAll = StExt_PcStats[StExt_PcStats_Index_SumGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumDamagePower];
	protAll = StExt_PcStats[StExt_PcStats_Index_SumGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumProtPower];
	
	if (sumType == StExt_SummonType_Beast) 
	{
		hp += StExt_PcStats[StExt_PcStats_Index_SumAnimalGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumAnimalHpPower];
		str += StExt_PcStats[StExt_PcStats_Index_SumAnimalGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumAnimalStatsPower];
		agi += StExt_PcStats[StExt_PcStats_Index_SumAnimalGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumAnimalStatsPower];
		damAll += StExt_PcStats[StExt_PcStats_Index_SumAnimalGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumAnimalDamagePower];
		protAll += StExt_PcStats[StExt_PcStats_Index_SumAnimalGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumAnimalProtPower];
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_PetLover)) { extraBonus += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Life]; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_HiveLord)) { StExt_Npc_ChangePoisonDamage(slf, 5 * StExt_Talent_Progression[StExt_MasteryIndex_Life]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_AnimalDoctor)) { hp += 500; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_BeastLeader)) { str += 250; agi += 250; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_LairKeeper)) { protAll += 250; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_Trainer)) { StExt_Npc_ChangeDodgeChance(slf, StExt_Talent_Progression[StExt_MasteryIndex_Life]); };
	}
	else if (sumType == StExt_SummonType_Golem) 
	{ 
		hp += StExt_PcStats[StExt_PcStats_Index_SumGolemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumGolemHpPower];
		str += StExt_PcStats[StExt_PcStats_Index_SumGolemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumGolemStatsPower];
		agi += StExt_PcStats[StExt_PcStats_Index_SumGolemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumGolemStatsPower];
		damAll += StExt_PcStats[StExt_PcStats_Index_SumGolemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumGolemDamagePower];
		protAll += StExt_PcStats[StExt_PcStats_Index_SumGolemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumGolemProtPower];
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_Sculptor)) { extraBonus += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Golem]; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_HilsEthernity)) { hp += 500; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_CrasftApogee)) { str += 250; agi += 250; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_FlintPeek)) { damAll += 250; };		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_GraniteLimit)) { protAll += 250; };		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_SulfurMines)) { StExt_Npc_ChangeFireDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Golem]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_CrystalGorge)) { StExt_Npc_ChangeMagicDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Golem]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_HighRidge)) { StExt_Npc_ChangeFlyDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Golem]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_IronFist)) { StExt_Npc_ChangeBluntDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Golem]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_Concussion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Quake); };
	}
	else if (sumType == StExt_SummonType_Demon) 
	{
		hp += StExt_PcStats[StExt_PcStats_Index_SumDemonGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumDemonHpPower];
		str += StExt_PcStats[StExt_PcStats_Index_SumDemonGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumDemonStatsPower];
		agi += StExt_PcStats[StExt_PcStats_Index_SumDemonGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumDemonStatsPower];
		damAll += StExt_PcStats[StExt_PcStats_Index_SumDemonGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumDemonDamagePower];
		protAll += StExt_PcStats[StExt_PcStats_Index_SumDemonGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumDemonProtPower];
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_Demonolog)) { extraBonus += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Demon]; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_HellCare)) { hp += 500; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_DarkAncestory)) { str += 250; agi += 250; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_EligorPower)) { damAll += 250; };		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_DevilPatronage)) { protAll += 250; };			
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_EligorFire)) { StExt_Npc_ChangeFireDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Demon]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_EnchantTooth)) { StExt_Npc_ChangeMagicDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Demon]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_SharpClaws)) { StExt_Npc_ChangeEdgeDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Demon]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_HellHand)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Fireball); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_NegralHand)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Darkball); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_Appearence)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Blink); };
	}
	else if (sumType == StExt_SummonType_Undead) 
	{ 
		hp += StExt_PcStats[StExt_PcStats_Index_SumUndeadGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumUndeadHpPower];
		str += StExt_PcStats[StExt_PcStats_Index_SumUndeadGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumUndeadStatsPower];
		agi += StExt_PcStats[StExt_PcStats_Index_SumUndeadGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumUndeadStatsPower];
		damAll += StExt_PcStats[StExt_PcStats_Index_SumUndeadGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumUndeadDamagePower];
		protAll += StExt_PcStats[StExt_PcStats_Index_SumUndeadGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumUndeadProtPower];
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_Necromaster)) { extraBonus += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Necro]; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_Balsamation)) { hp += 500; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_DeathDance)) { str += 250; agi += 250; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_FuryOfDamned)) { damAll += 250; };		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_BoneEmbrace)) { protAll += 250; };			
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_FleshFist)) { StExt_Npc_ChangeBluntDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Necro]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_EnchantFlesh)) { StExt_Npc_ChangeMagicDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Necro]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_DeadlyCut)) { StExt_Npc_ChangeEdgeDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Necro]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_BoneSpike)) { StExt_Npc_ChangePointDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Necro]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_DeathPoision)) { StExt_Npc_ChangePoisonDamage(slf, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Necro]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_FingerOfDeath)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Deathball); };
	}
	else if (sumType == StExt_SummonType_Totem)
	{ 
		hp += StExt_PcStats[StExt_PcStats_Index_SumTotemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumTotemHpPower];
		str += StExt_PcStats[StExt_PcStats_Index_SumTotemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumTotemStatsPower];
		agi += StExt_PcStats[StExt_PcStats_Index_SumTotemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumTotemStatsPower];
		damAll += StExt_PcStats[StExt_PcStats_Index_SumTotemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumTotemDamagePower];
		protAll += StExt_PcStats[StExt_PcStats_Index_SumTotemGlobalPower] + StExt_PcStats[StExt_PcStats_Index_SumTotemProtPower];
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_Shaman)) { extraBonus += 10 * StExt_Talent_Progression[StExt_MasteryIndex_Shaman]; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_AncestorsWrath)) { StExt_Npc_ChangeFireDamage(slf, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Shaman]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_SpirithBounds)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_BuffMassFullheal); };
	};
	
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Archmage)) { extraBonus += StExt_GetPercentFromValue(hero.attribute[3], 10); };
	
	hp += extraBonus;
	str += extraBonus;
	agi += extraBonus;
	damAll += extraBonus;
	protAll += extraBonus;
	
	slf.attribute[atr_hitpoints_max] += StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Hp, hp);
	slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];		
	slf.attribute[atr_strength] += StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Str, str);
	slf.attribute[atr_dexterity] += StExt_GetPermilleFromValue(StExt_CurrentSummonStats.Agi, agi);	

	slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtBlunt, protAll));
	slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtEdge, protAll));
	slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtFire, protAll));
	slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtFly, protAll));
	slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtMagic, protAll));
	slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtPoint, protAll));
	slf.protection[prot_fall] = StExt_ChangeValueIfPositive(slf.protection[prot_fall], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.ProtFall, protAll));
	
	if (StExt_Npc_GetTotalDamage(slf) == 0) { slf.attribute[atr_strength] += StExt_GetPermilleFromValue(slf.attribute[atr_strength], damAll); }
	else
	{
		slf.damage[dam_index_blunt] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_blunt], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamBlunt, damAll));
		slf.damage[dam_index_edge] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_edge], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamEdge, damAll));
		slf.damage[dam_index_point] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_point], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamPoint, damAll));
		slf.damage[dam_index_fire] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fire], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamFire, damAll));
		slf.damage[dam_index_fly] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fly], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamFly, damAll));
		slf.damage[dam_index_magic] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_magic], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamMagic, damAll));
		slf.damage[dam_index_fall] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fall], StExt_GetPermilleFromValue(StExt_CurrentSummonStats.DamFall, damAll));
	};
	StExt_Npc_ChangeAiv(slf, aivrx_spelldamagescale, (damAll + 1) / 10);
};

// Add extra skills to summons
func void StExt_UpdateSummonStats_ExtraAbilities(var c_npc slf)
{
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_FireLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Firebolt); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_SnowLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Icebolt); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_ElectricLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Zap); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_AirLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Whirlwind); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_StonedLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Stonefirst); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_HollyLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Holybolt); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_DarkLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Dot_First); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathLegion)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Deathbolt); };
	if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_MinionInstability)) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveFireWaveOnDeath); };
};

func void StExt_Summon_ApplyGlobalConfigs(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Summon_ApplyGlobalConfigs(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	slf.attribute[atr_hitpoints_max] = StExt_GetPercentFromValue(slf.attribute[atr_hitpoints_max], StExt_Config_Sum_GlobalHpMult);
    slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];	
	slf.attribute[atr_strength] = StExt_GetPercentFromValue(slf.attribute[atr_strength], StExt_Config_Sum_GlobalStatMult);
	slf.attribute[atr_dexterity] = StExt_GetPercentFromValue(slf.attribute[atr_dexterity], StExt_Config_Sum_GlobalStatMult);

	slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], StExt_GetPercentFromValue(slf.protection[prot_blunt], StExt_Config_Sum_GlobalProtMult));
	slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], StExt_GetPercentFromValue(slf.protection[prot_edge], StExt_Config_Sum_GlobalProtMult));
	slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], StExt_GetPercentFromValue(slf.protection[prot_fire], StExt_Config_Sum_GlobalProtMult));
	slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], StExt_GetPercentFromValue(slf.protection[prot_fly], StExt_Config_Sum_GlobalProtMult));
	slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], StExt_GetPercentFromValue(slf.protection[prot_magic], StExt_Config_Sum_GlobalProtMult));
	slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], StExt_GetPercentFromValue(slf.protection[prot_point], StExt_Config_Sum_GlobalProtMult));
	
	slf.damage[dam_index_blunt] = StExt_GetPercentFromValue(slf.damage[dam_index_blunt], StExt_Config_Sum_GlobalDamMult);
	slf.damage[dam_index_edge] = StExt_GetPercentFromValue(slf.damage[dam_index_edge], StExt_Config_Sum_GlobalDamMult);
	slf.damage[dam_index_point] = StExt_GetPercentFromValue(slf.damage[dam_index_point], StExt_Config_Sum_GlobalDamMult);
	slf.damage[dam_index_fire] = StExt_GetPercentFromValue(slf.damage[dam_index_fire], StExt_Config_Sum_GlobalDamMult);
	slf.damage[dam_index_fly] = StExt_GetPercentFromValue(slf.damage[dam_index_fly], StExt_Config_Sum_GlobalDamMult);
	slf.damage[dam_index_magic] = StExt_GetPercentFromValue(slf.damage[dam_index_magic], StExt_Config_Sum_GlobalDamMult);
	StExt_Npc_CheckStats(slf);
};

// Add extra summons stats
func void StExt_UpdateSummonStats_TopBonus(var c_npc slf)
{
	var int sumType;
	var int protAll;
	var int es;
	var int spellScaleBonus;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_UpdateSummonStats_TopBonus(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	sumType = StExt_GetSummonType(slf);
	protAll = StExt_PcStats[StExt_PcStats_Index_SumExtraProtAll];
	spellScaleBonus = 0;

	slf.attribute[atr_hitpoints_max] += StExt_PcStats[StExt_PcStats_Index_SumExtraHp];
	slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];		
	slf.attribute[atr_strength] += StExt_PcStats[StExt_PcStats_Index_SumExtraStr];
	slf.attribute[atr_dexterity] += StExt_PcStats[StExt_PcStats_Index_SumExtraAgi];

	slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], protAll + StExt_PcStats[StExt_PcStats_Index_SumProtBlunt]);
	slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], protAll + StExt_PcStats[StExt_PcStats_Index_SumProtEdge]);
	slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], protAll + StExt_PcStats[StExt_PcStats_Index_SumProtFire]);
	slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], protAll + StExt_PcStats[StExt_PcStats_Index_SumProtFly]);
	slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], protAll + StExt_PcStats[StExt_PcStats_Index_SumProtMagic]);
	slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], protAll + StExt_PcStats[StExt_PcStats_Index_SumProtPoint]);
	slf.protection[prot_fall] = StExt_ChangeValueIfPositive(slf.protection[prot_fall], protAll);

	if (StExt_Npc_GetTotalDamage(slf) == 0) { slf.attribute[atr_strength] += StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]; }
	else
	{
		slf.damage[dam_index_blunt] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_blunt], StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]);
		slf.damage[dam_index_edge] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_edge], StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]);
		slf.damage[dam_index_point] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_point], StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]);
		slf.damage[dam_index_fire] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fire], StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]);
		slf.damage[dam_index_fly] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fly], StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]);
		slf.damage[dam_index_magic] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_magic], StExt_PcStats[StExt_PcStats_Index_SumExtraDamage]);
	};
	
	if (slf.attribute[atr_dexterity] >= 100)
	{
		StExt_Npc_CalcDodgeChanceBonusFromAgi(slf);
		StExt_Npc_CalcSpeedBonusFromAgi(slf);
	};
	StExt_Npc_ChangeDodgeChance(slf, StExt_PcStats[StExt_PcStats_Index_SumExtraDodge]);
	
	es = StExt_PcStats[StExt_PcStats_Index_SumExtraEs];
	if (sumType == StExt_SummonType_Golem) 
	{ 
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_RuneStone)) { es += StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 250); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_MercuryMine)) { StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, (1 + StExt_Talent_Progression[StExt_MasteryIndex_Golem]) / 3); };
		spellScaleBonus = StExt_Talent_Progression[StExt_MasteryIndex_Golem];
	};
	if (sumType == StExt_SummonType_Demon) 
	{ 
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_EthernalSoul)) { es += StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 250); };
		spellScaleBonus = StExt_Talent_Progression[StExt_MasteryIndex_Demon];
	};
	if (sumType == StExt_SummonType_Undead) 
	{ 
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_DeadlyAgile)) { StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, (1 + StExt_Talent_Progression[StExt_MasteryIndex_Necro]) / 3); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_RuneFlesh)) { es += StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 250); };
		spellScaleBonus = StExt_Talent_Progression[StExt_MasteryIndex_Necro];
	};	
	if (sumType == StExt_SummonType_Beast) { spellScaleBonus = StExt_Talent_Progression[StExt_MasteryIndex_Life]; };
	if (sumType == StExt_SummonType_Totem) { spellScaleBonus = StExt_Talent_Progression[StExt_MasteryIndex_Shaman]; };
	if (sumType == StExt_SummonType_Holly) { spellScaleBonus = StExt_Talent_Progression[StExt_MasteryIndex_Light]; };
	
	StExt_Npc_ChangeAiv(slf, aivrx_spelldamagescale, 50 + countlearnspell + spellScaleBonus);
	
	StExt_Npc_ChangeMaxEs(slf, es);
	StExt_Npc_ChangeEs(slf, es);
	
	StExt_Npc_ChangePoisionResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistPois]);	
	StExt_Npc_ChangeEdgeResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistEdge]);
	StExt_Npc_ChangeFlyResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistFly]);
	StExt_Npc_ChangeFireResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistFire]);
	StExt_Npc_ChangeMagicResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistMagic]);
	StExt_Npc_ChangePointResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistPoint]);
	StExt_Npc_ChangeBluntResist(slf, StExt_PcStats[StExt_PcStats_Index_SumResistBlunt]);
	
	StExt_Npc_ChangeAoeResist(slf, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumResistAoe));
	StExt_Npc_ChangeDotResist(slf, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumResistDot));
	StExt_Npc_ChangeReflectResist(slf, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumResistReflect));
		
	StExt_Summon_ApplyGlobalConfigs(slf);
	// add abilities
	StExt_UpdateSummonStats_ExtraAbilities(slf);
};

// Add extra summons stats
func void StExt_UpdateSummonStats_MasteryBonus(var c_npc slf, var int power)
{
	var int hp;
	var int prot;
	var int dam;
	var int stats;
	var int speed;
	if (power <= 0) { return; };
	
	hp = power;
	stats = StExt_GetPercentFromValue(power, 20);
	prot = StExt_GetPercentFromValue(power, 10);
	dam = StExt_GetPercentFromValue(power, 10);
	speed = StExt_ValidateValueRange(StExt_GetPercentFromValue(power, 2), 0, 50);

	slf.attribute[atr_hitpoints_max] += hp;
	slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];		
	slf.attribute[atr_strength] += stats;
	slf.attribute[atr_dexterity] += stats;

	slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], prot);
	slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], prot);
	slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], prot);
	slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], prot);
	slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], prot);
	slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], prot);
	slf.protection[prot_fall] = StExt_ChangeValueIfPositive(slf.protection[prot_fall], prot);

	if (StExt_Npc_GetTotalDamage(slf) == 0) { slf.attribute[atr_strength] += dam; }
	else
	{
		slf.damage[dam_index_blunt] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_blunt], dam);
		slf.damage[dam_index_edge] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_edge], dam);
		slf.damage[dam_index_point] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_point], dam);
		slf.damage[dam_index_fire] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fire], dam);
		slf.damage[dam_index_fly] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fly], dam);
		slf.damage[dam_index_magic] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_magic], dam);
	};
	
	StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, speed);
};

func void StExt_UpdateSummonStats(var c_npc slf, var int masteryBonus)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_UpdateSummonStats(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	StExt_GetSummonBaseStats(slf);
	StExt_UpdateSummonStats_BaseBonus(slf);
	StExt_UpdateSummonStats_MasteryBonus(slf, masteryBonus);
	StExt_UpdateSummonStats_TopBonus(slf);
	StExt_UpdateSummonStats_AuraBonus(slf);
	StExt_Struct_Free(StExt_CurrentSummonStats);
};

func void StExt_UpdateSummonStats_Undead(var c_npc slf) { StExt_UpdateSummonStats(slf, StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower]); };
func void StExt_UpdateSummonStats_Totem(var c_npc slf) { StExt_UpdateSummonStats(slf, StExt_PcStats[StExt_PcStats_Index_ShamanMasteryPower]); };
func void StExt_UpdateSummonStats_Holly(var c_npc slf) { StExt_UpdateSummonStats(slf, StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]); };
func void StExt_UpdateSummonStats_Heroshadow(var c_npc slf, var int masteryBonus) { StExt_UpdateSummonStats(slf, masteryBonus); };
func void StExt_UpdateSummonStats_Demon(var c_npc slf) { StExt_UpdateSummonStats(slf, StExt_PcStats[StExt_PcStats_Index_DemonMasteryPower]); };
func int StExt_UpdateSummonStats_Animal(var c_npc slf) { StExt_UpdateSummonStats(slf, StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]); };
func int StExt_UpdateSummonStats_DkDemon(var c_npc slf) { StExt_UpdateSummonStats(slf, StExt_PcStats[StExt_PcStats_Index_DemonMasteryPower] + StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]); };
func void StExt_UpdateSummonStats_Gol(var c_npc slf, var int type)
{
	var int masteryPower;
	masteryPower = StExt_PcStats[StExt_PcStats_Index_GolemMasteryPower];
	
	if (type == StExt_SummonGolemType_Stone)
	{
		masteryPower += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_StoneSculptor)) { masteryPower += StExt_Talent_Progression[StExt_MasteryIndex_Earth] * 3; };
	}
	else if (type == StExt_SummonGolemType_Fire) 
	{
		masteryPower += StExt_PcStats[StExt_PcStats_Index_FireMasteryPower];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_BasaltSculptor)) { masteryPower += StExt_Talent_Progression[StExt_MasteryIndex_Fire] * 3; };
	}
	else if (type == StExt_SummonGolemType_Ice)	
	{
		masteryPower += StExt_PcStats[StExt_PcStats_Index_IceMasteryPower];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_IceSculptor)) { masteryPower += StExt_Talent_Progression[StExt_MasteryIndex_Ice] * 3; };
	}
	else if (type == StExt_SummonGolemType_Magic)
	{
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Bigdarkball);
		masteryPower += StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_DarkSculptor)) { masteryPower += StExt_Talent_Progression[StExt_MasteryIndex_Dark] * 3; };
	}
	else if (type == StExt_SummonGolemType_Swamp)
	{
		masteryPower += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower];
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_StoneSculptor)) { masteryPower += StExt_Talent_Progression[StExt_MasteryIndex_Earth] * 3; };
	}
	else if (type == StExt_SummonGolemType_Wood) 
	{
		masteryPower += StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower];	
	}
	else if (type == StExt_SummonGolemType_Air) 
	{
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Whirlwind);		
		masteryPower += StExt_PcStats[StExt_PcStats_Index_AirMasteryPower];	
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_StormSculptor)) { masteryPower += StExt_Talent_Progression[StExt_MasteryIndex_Air] * 3; };
	}
	else if(type == StExt_SummonGolemType_Bone)
	{
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Skull);
		masteryPower += StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower];			
	}
	else if(type == StExt_SummonGolemType_Electric)
	{
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Lightningflash);
		masteryPower += StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower];			
	};

	masteryPower = (masteryPower + 1) / 2;
	StExt_UpdateSummonStats(slf, masteryPower);
};

func void StExt_UpdateTransformHp_Callback() { self.attribute[atr_hitpoints] = self.attribute[atr_hitpoints_max]; };
func void StExt_UpdateTransformStats(var c_npc slf)
{
	var int masteryBonus; masteryBonus = 0;
	// if (!StExt_IsHeroTransformed()) { return; };
	if (!hlp_isvalidnpc(slf) || !npc_isplayer(slf)) { return; };
	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_Warewolf)) { masteryBonus = 5 * StExt_Talent_Progression[StExt_MasteryIndex_Life]; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_BearHealth)) 
	{
		slf.attribute[atr_hitpoints_max] += StExt_GetPermilleFromValue(hero.attribute[atr_hitpoints_max], 500);
		slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_LionHeart)) 
	{
		slf.attribute[atr_strength] += StExt_GetPermilleFromValue(hero.attribute[atr_strength], 250);
		slf.attribute[atr_dexterity] += StExt_GetPermilleFromValue(hero.attribute[atr_dexterity], 250);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_BisonCoat)) 
	{
		slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], StExt_GetPermilleFromValue(hero.protection[prot_blunt], 250));
		slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], StExt_GetPermilleFromValue(hero.protection[prot_edge], 250));
		slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], StExt_GetPermilleFromValue(hero.protection[prot_fire], 250));
		slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], StExt_GetPermilleFromValue(hero.protection[prot_fly], 250));
		slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], StExt_GetPermilleFromValue(hero.protection[prot_magic], 250));
		slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], StExt_GetPermilleFromValue(hero.protection[prot_point], 250));
		slf.protection[prot_fall] = StExt_ChangeValueIfPositive(slf.protection[prot_fall], StExt_GetPermilleFromValue(hero.protection[prot_fall], 250));
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_WolfBite)) { StExt_Npc_ChangeEdgeDamage(slf, 5 * StExt_Talent_Progression[StExt_MasteryIndex_Life]); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_BeeSting)) { StExt_Npc_ChangePointDamage(slf, 5 * StExt_Talent_Progression[StExt_MasteryIndex_Life]); };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_SnakeTeeth)) { StExt_Npc_ChangePoisonDamage(slf, 5 * StExt_Talent_Progression[StExt_MasteryIndex_Life]); };
	
	StExt_UpdateSummonStats_MasteryBonus(slf, StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + masteryBonus);
	StExt_AddMasteryExp(StExt_MasteryIndex_Life, 100 + StExt_GetPercentFromValue(slf.attribute[atr_hitpoints_max], 10));
	rx_callbacknpc(slf, 1.1, StExt_UpdateTransformHp_Callback);	
};

func void rx_updateskeletonarcher_speed(var c_npc slf) 
{
	var int bonus;
	rx_updateskeletonarcher_speed_old(slf);
    bonus = rx_getnpcvar(slf, aivrx_npc_archerspeed);
	bonus += (StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower] + 1) / 50;
	if (bonus > 100) { bonus = 100; };
	rx_setnpcvar(slf, aivrx_npc_archerspeed, bonus);
};

func void rx_updateskeletonuniqstats(var c_npc slf, var int spawned, var int heal) 
{
    rx_updateskeletonuniqstats_old(slf, spawned, heal);
	if (!spawned) { StExt_UpdateSummonStats_Undead(slf); };
};

func void rx_updatedkpetstats(var c_npc slf) 
{
	rx_updatedkpetstats_old(slf);
	StExt_UpdateSummonStats_DkDemon(slf);	
};

func void rx_updatecraitstats(var c_npc slf) 
{
    rx_updatecraitstats_old(slf);
	StExt_UpdateSummonStats_Animal(slf);
};

func void rx_updatejinastats(var c_npc slf, var int jinaspawned) 
{
    rx_updatejinastats_old(slf, jinaspawned);
	if (!jinaspawned) { StExt_UpdateSummonStats_Animal(slf); };
};

func void rx_updatekhub(var c_npc slf) 
{
    rx_updatekhub_old(slf);
	StExt_UpdateSummonStats_Demon(slf);
};

func void rx_updatedsnapperstats(var c_npc slf) 
{
	rx_updatedsnapperstats_old(slf);
	StExt_UpdateSummonStats_Animal(slf);
};

func void rx_settreantstats(var c_npc slf) 
{
    rx_settreantstats_old(slf);
	StExt_UpdateSummonStats_Gol(slf, StExt_SummonGolemType_Wood);
};

func void rx_setwolfshamanstats(var c_npc slf) 
{
	rx_setwolfshamanstats_old(slf); 
    StExt_UpdateSummonStats_BaseBonus(slf);
	StExt_UpdateSummonStats_MasteryBonus(slf, StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + StExt_Talent_Progression[StExt_MasteryIndex_Shaman] * 5);
	StExt_UpdateSummonStats_TopBonus(slf);
	StExt_UpdateSummonStats_AuraBonus(slf);
};

func void StExt_DoReanimation_Callback()
{
	if (c_npcisdown(hero)) { return; };
	if (Hlp_IsNull(StExt_CallbackParams)) { StExt_PrintDebug("StExt_DoReanimation(...)", "Callback params is Null!", StExt_Self, StExt_Other); return; };	

	rx_saveparservars();
	if (StExt_CallbackParams.IntParam == 0) { wld_insertnpc(stext_summoned_skeleton, StExt_CallbackParams.StringParam); }
	else if (StExt_CallbackParams.IntParam == 1) { wld_insertnpc(stext_summoned_skeleton_orc, StExt_CallbackParams.StringParam); }
	else { wld_insertnpc(stext_summoned_gobbo_skeleton, StExt_CallbackParams.StringParam); };
	rx_restoreparservars();
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Necro, StExt_CallbackParams.IntParam[1]);
};

func void StExt_DoReanimation(var c_npc slf)
{
	var C_ScriptCallbackParams callBackParams;
	
	if ((slf.guild == gil_sheep) || (slf.guild == gil_meatbug) || (slf.aivar[43] == id_baran) || (slf.aivar[43] == id_ziege)) { return; };
	if (StExt_DoReanimation_Cd > 0) { return; };
	if (!hlp_isvalidnpc(slf))
	{
		StExt_PrintDebugStack("StExt_DoReanimation() -> prototype npc is null!");
		return;
	};	
	StExt_PrintDebugStack("StExt_DoReanimation() -> Reanimate...");
	callBackParams = StExt_InitializeCallback(hero, hero, "StExt_DoReanimation_Callback", 2 + hlp_random(3));
	if (Hlp_IsNull(callBackParams)) { StExt_PrintDebug("StExt_DoReanimation(...)", "Fail to create callback params!", slf, StExt_NullNpc); return; };
	
	StExt_DoReanimation_Cd = 60;
	callBackParams.StringParam[0] = npc_getnearestwp(hero);
	callBackParams.IntParam[1] = 100 + (slf.level * 10);
	
	if (c_npcishuman(slf)) {callBackParams.IntParam[0] = 0;	}
	else if (c_npcisorc(slf)) { callBackParams.IntParam[0] = 1; }
	else { callBackParams.IntParam[0] = 2; };	
};

func void rx_form_skeletonuniqweapon() 
{
    rx_form_skeletonuniqweapon_old();
	if(skeletonuniqlevel >= 10) { info_addchoice(pc_psionicquest_templatedialog_896, StExt_Str_ChoiceSidWeap_Bow, stext_form_skeletonuniqweapon_bow); };
	if(skeletonuniqlevel >= 25) { info_addchoice(pc_psionicquest_templatedialog_896, StExt_Str_ChoiceSidWeap_Magic, stext_form_skeletonuniqweapon_magic); };
};

func void stext_form_skeletonuniqweapon_bow() 
{
    skeletonweapontype = 6;
    rx_func_skeletonuniqweapon_update();
	AI_StopProcessInfos(self);
};
func void stext_form_skeletonuniqweapon_magic() 
{
    skeletonweapontype = 7;
    rx_func_skeletonuniqweapon_update();
	AI_StopProcessInfos(self);
};

func void rx_updateskeltonuniqweapon(var c_npc slf) 
{
	if(skeletonweapontype == 6) 
	{			
		mdl_applyoverlaymds(slf, "Humans_Militia.mds");
		mdl_applyoverlaymds(slf, "humans_skeleton.mds");

		if (slf.level >= 50) { equipitem(slf, itrw_undeadsummon_3); }
		else if (slf.level >= 30) { equipitem(slf, itrw_undeadsummon_2); }
		else { equipitem(slf, itrw_undeadsummon_1); };
		
		createinvitems(slf, itrw_arrow, 100 + (slf.level * 10));
		rx_setnpcvar(slf, aivrx_is_monster_archer, 1);
		rx_setnpcvar(slf, aivrx_npc_range_only, 1);
		rx_updateskeletonarcher_speed(slf);
		return;
	}
	else if(skeletonweapontype == 7) 
	{ 
		slf.aivar[51] = magic_always;
		equipitem(slf, itmw_shadowpriest_summon);
		if (slf.level >= 50) 
		{
			createinvitems(slf, itru_skull, 1);
			mdl_setvisualbody(self, "Ske_Body", 0, 4, "Ske_Head", 4, default, itar_skeleton_mage_armor);
		}
		else if (slf.level >= 30) 
		{ 
			createinvitems(slf, itru_deathball, 1);
			mdl_setvisualbody(self, "Ske_Body", 1, 1, "Ske_Head", 1, 1, itar_mage_av);
		}
		else { createinvitems(slf, itru_deathbolt, 1); };
		return;
	};
	rx_updateskeltonuniqweapon_old(slf);
};
