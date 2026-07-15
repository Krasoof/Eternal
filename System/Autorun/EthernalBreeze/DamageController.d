
//===================================================================//
//						Damage processing							 //
//===================================================================//

func void StExt_Aura_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;
	
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && !StExt_IsInAuraRange(atk)) { return; };	
};

func void StExt_Aura_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int tmp;
	var int ticks;
	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && !StExt_IsInAuraRange(atk)) { return; };
	
	ticks = StExt_Npc_CalcDotDuration(atk);
	
	// handle extra damage
	StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraBluntDam];
	StExt_ExtraDamageInfo.Damage[dam_index_edge] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraEdgeDam];
	StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraFireDam];
	StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraFlyDam];
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraMagicDam];
	StExt_ExtraDamageInfo.Damage[dam_index_point] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraPointDam];
	StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraPoisonDam];

	// handle bonus damage
	StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamage];
	StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraDamagePerc]);
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraMeleeDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraMeleeDamPerc]);
	};	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraRangeDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraRangeDamPerc]);
	};	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraSpellDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_ExtraSpellDamPerc]);
	};
	
	// handle damage bonus
	StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_blunt], StExt_PcStats_Auras[StExt_PcStats_Index_AddBluntDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_edge], StExt_PcStats_Auras[StExt_PcStats_Index_AddEdgeDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_fire], StExt_PcStats_Auras[StExt_PcStats_Index_AddFireDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_fly], StExt_PcStats_Auras[StExt_PcStats_Index_AddFlyDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_magic], StExt_PcStats_Auras[StExt_PcStats_Index_AddMagicDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_point], StExt_PcStats_Auras[StExt_PcStats_Index_AddPointDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(StExt_DamageInfo.Damage[dam_index_fall], StExt_PcStats_Auras[StExt_PcStats_Index_AddPoisonDamPerc]);
	
	// handle extra dot
	if (StExt_PcStats_Auras[StExt_PcStats_Index_BluntDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_BluntDotDamage], dam_index_blunt);
	};
	if (StExt_PcStats_Auras[StExt_PcStats_Index_EdgeDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_EdgeDotDamage], dam_index_edge);
	};
	if (StExt_PcStats_Auras[StExt_PcStats_Index_FireDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_FireDotDamage], dam_index_fire);
	};
	if (StExt_PcStats_Auras[StExt_PcStats_Index_FlyDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_FlyDotDamage], dam_index_fly);
	};
	if (StExt_PcStats_Auras[StExt_PcStats_Index_MagicDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_MagicDotDamage], dam_index_magic);
	};
	if (StExt_PcStats_Auras[StExt_PcStats_Index_PointDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_PointDotDamage], dam_index_point);
	};
	if (StExt_PcStats_Auras[StExt_PcStats_Index_PoisDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats_Auras[StExt_PcStats_Index_PoisDotDamage], dam_index_fall);
	};
	
	// handle weapon
	if (hlp_isvaliditem(weap))
	{
		if (StExt_ValueHasFlag(weap.flags, item_swd) || StExt_ValueHasFlag(weap.flags, item_axe)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_1hExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_1hExtraDamPerc]);
		};
		if (StExt_ValueHasFlag(weap.flags, item_2hd_swd) || StExt_ValueHasFlag(weap.flags, item_2hd_axe)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_2hExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_2hExtraDamPerc]);
		};
		if (StExt_ValueHasFlag(weap.flags, item_bow)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_BowExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_BowExtraDamPerc]);
		};
		if (StExt_ValueHasFlag(weap.flags, item_crossbow)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_CBowExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_CBowExtraDamPerc]);
		};
		if (StExt_ValueHasFlag(weap.flags, item_dag)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_DualExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_DualExtraDamPerc]);
		};
	};

	// handle extra damage to specific target
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Golem)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_GolemExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_GolemExtraDamPerc]);
	};	
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Demon)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_EvilExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_EvilExtraDamPerc]);
	};	
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Undead)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_UndeadExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_UndeadExtraDamPerc]);
	};
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Human))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_HumanExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_HumanExtraDamPerc]);
	}; 
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Orc))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_OrcExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_OrcExtraDamPerc]);
	}; 
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Animal))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_AnimalExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_AnimalExtraDamPerc]);
	}; 
		
	// crit chance and double damage
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) 
	{ 
		if (StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_WeapDoubleDamageChance])) {
			StExt_ExtraDamageInfo.Damage += RealDamage;
		};
	};	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) 
	{ 
		if (StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_SpellCritChance]))
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats_Auras[StExt_PcStats_Index_ExtraSpellDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 1000 + StExt_PcStats_Auras[StExt_PcStats_Index_SpellCritChanceMult]);
		};
		if (!StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability) && StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_SpellDoubleCastChance])) {
			StExt_CastSpell(StExt_DamageInfo.SpellId, atk, target, RealDamage);
		};
	};
	
	// steal hp/mana/stam/es
	tmp = StExt_PcStats_Auras[StExt_PcStats_Index_StealLife] + StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_StealLifePerc]);
	StExt_ExtraDamageInfo.Damage += StExt_ApplyLifeSteal(atk, target, tmp);
	tmp = StExt_PcStats_Auras[StExt_PcStats_Index_StealEs] + StExt_GetPermilleFromValue(RealDamage, StExt_PcStats_Auras[StExt_PcStats_Index_StealEsPerc]);
	StExt_ExtraDamageInfo.Damage += StExt_ApplyEsSteal(atk, target, tmp);
	
	// life/mana/stam/es per hit
	if (StExt_PcStats_Auras[StExt_PcStats_Index_HpPerHit] > 0) { rx_restorehealth(atk, StExt_PcStats_Auras[StExt_PcStats_Index_HpPerHit]); };
	if (StExt_PcStats_Auras[StExt_PcStats_Index_EsPerHit] > 0) { StExt_Npc_ChangeEs(atk, StExt_PcStats_Auras[StExt_PcStats_Index_EsPerHit]); };
	
	// stun/freze chance
	StExt_StunTarget(target, atk, StExt_PcStats_Auras[StExt_PcStats_Index_StunChance]);
	StExt_FreezeTarget(target, atk, StExt_PcStats_Auras[StExt_PcStats_Index_FreezeChance]);
};

func void StExt_Aura_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;
	var int tmp;
	
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && !StExt_IsInAuraRange(target)) { return; };

	// reflect spell
	if ((StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) && StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_ReflectSpellChance])) 
	{
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_SpellReflected;
		tmp = StExt_DamageInfo.TotalDamage;
		if (tmp <= 0) { tmp = StExt_DamageInfo.RealDamage; };
		tmp = 10 + StExt_GetPercentFromValue(tmp, 50);
		StExt_CastSpell(StExt_DamageInfo.SpellId, target, atk, tmp);
	};
	// absorb spell
	if ((StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) && StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_AbsorbSpellChance])) 
	{
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_SpellAbsorbed;
	};
	// decline arrwos
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range) && StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_ArrowsDeclineChance])) 
	{
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_ArrowDeclined;
	};
	// just damage ignore
	if (StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_IgnoreDamageChance])) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_Ignored; };
	if (StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_DodgeChance])) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_Dodge; };
};

func void StExt_Aura_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && !StExt_IsInAuraRange(target)) { return; };
};

//===================================================================//
//						NPC Damage processing						 //
//===================================================================//

// Call before do damage
func void StExt_Npc_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;
	var int baseDamage;
	
	StExt_PrintDamageDebugStack("StExt_Npc_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	if (target.aivar[15] && !StExt_IsSummonOrHero(target) && StExt_HeroHasAnyAura) { StExt_Aura_BeforeOffenceHandler(atk, target, weap); };
};

// Call before get damage
func void StExt_Npc_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int tmp;
	var int rank;
	var int abilityChance;

	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Npc_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	rank = StExt_Npc_IsRandomized(target);
	
	// npc passive deffence abilities handler.
	// exclude player...
	if (!npc_isplayer(target))
	{
		abilityChance = 10 + (rank * 25) + StExt_ValidateValueRange((target.level + 1) / 10, target.aivar[94] + 1, 100);

		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) 
		{
			// reflect spell
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpells)) 
			{
				abilityChance = 10 + StExt_CurrentNpcAbility.Chance + (rank * 25);
				if (StExt_Chance(abilityChance)) {
					StExt_CastSpell(StExt_DamageInfo.SpellId, target , atk , 1 + StExt_GetPercentFromValue(StExt_DamageInfo.TotalDamage, 50));				
					StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_SpellReflected;
				};
			};
			
			// absorb spell
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveAbsorbSpell) && StExt_Chance(abilityChance)) 
			{
				abilityChance = 10 + StExt_CurrentNpcAbility.Chance + (rank * 25);
				if (StExt_Chance(abilityChance))
				{
					StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_SpellAbsorbed;
					if (StExt_Npc_GetMaxEs(target) > 0) { StExt_Npc_ChangeEs(target, StExt_GetPercentFromValue(StExt_DamageInfo.TotalDamage, 10 + rank)); }
					else { rx_restorehealth(target, StExt_GetPercentFromValue(StExt_DamageInfo.TotalDamage, 10 + rank)); };
				};
			};
		};

		// decline arrwos
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range) && StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveDeclineArrow)) {
			abilityChance = 10 + StExt_CurrentNpcAbility.Chance + (rank * 15);
			if (StExt_Chance(abilityChance)) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_ArrowDeclined; };
		};
		
		// just damage ignore
		if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveIgnoreDamage) && StExt_Chance(abilityChance)) {		
			abilityChance = 10 + StExt_CurrentNpcAbility.Chance + (rank * 10);
			if (StExt_Chance(abilityChance)) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_Ignored; };
		};	
	};

	// fix abilities friendly-fier	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability) && !StExt_FxDamageCanBeApplied_Script(atk, target)) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_FriendlyFier; };
	if ((!StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) && !StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) && StExt_ApplyDodgeChance(target, atk)) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_Dodge; };
	
	if (target.aivar[15] && !StExt_IsSummonOrHero(target) && StExt_HeroHasAnyAura) { StExt_Aura_BeforeDefenceHandler(atk, target, weap); };
};

// Call after damage done
func void StExt_Npc_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int damage;
	var int percent;
	var int rank;
	var int ticks;
	var int extraDamage;
	var int extraDotDamage;
	var int damageMult;

	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
		
	StExt_PrintDamageDebugStack("StExt_Npc_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)");

	// Zakon boss passive self-heal (no spells / no on-death): they lifesteal
	// a fifth of the damage they deal, so the fight is about out-DPSing their
	// sustain. IDs 99710-99725 are exactly the Zakon bosses.
	if ((atk.id >= 99710) && (atk.id <= 99725) && (RealDamage > 0))
	{
		StExt_RecouperateHp(atk, StExt_GetPermilleFromValue(RealDamage, 200));
		// Furia: below 30% HP the boss rages and hits ~60% harder.
		if ((atk.attribute[atr_hitpoints] * 100) < (atk.attribute[atr_hitpoints_max] * 30))
		{
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 600);
		};
		// Zdruzgotanie: crushing blow - chance to stun the hero on hit.
		StExt_StunTarget(target, atk, 12);
		// Tempo shift: after landing a hit the boss may change attack/anim
		// speed (aivrx_npc_speed is delta-based, so move from current to the
		// random target) - parry timing can't be memorized. Per feedback:
		// slowdown capped at -10, speed-up allowed up to +300 (terror spikes).
		if (StExt_Chance(25))
		{
			StExt_Npc_ChangeAiv(atk, aivrx_npc_speed, (-10 + hlp_random(311)) - rx_getnpcvar(atk, aivrx_npc_speed));
		};

		// (no synthetic shockwave for HUMAN bosses - per user call, chapter 1
		// bosses stay plain brutal melee; from chapter 2 bosses spawn as
		// UNDEAD monsters whose native monster AI runs the real ability kits)
	};

	// GLOBAL combo mixing: every npc used to swing in a fixed metronome
	// (left-right-left-hit forever). Small per-hit anim-speed jitter breaks
	// the pattern for ALL non-player melee attackers. Bosses excluded -
	// they run their own bigger -10..+300 tempo shift above.
	if (!npc_isplayer(atk) && !StExt_IsSummonOrTotem(atk)
		&& !((atk.id >= 99710) && (atk.id <= 99740))
		&& StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) && StExt_Chance(20))
	{
		StExt_Npc_ChangeAiv(atk, aivrx_npc_speed, (-8 + hlp_random(29)) - rx_getnpcvar(atk, aivrx_npc_speed));
	};

	rank = StExt_Npc_IsRandomized(atk);
	ticks = StExt_Npc_CalcDotDuration(atk);
	extraDamage = StExt_Npc_CalcExtraDamage(atk);
	extraDotDamage = (extraDamage + 5) / 3;
	damageMult = StExt_GetDamageMult(atk);
	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee)) { 
		StExt_ExtraDamageInfo.Damage += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_ExtraMeleeDamage), damageMult);
	};
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) { 
		StExt_ExtraDamageInfo.Damage += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_ExtraRangeDamage), damageMult);
	};
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) {
		StExt_ExtraDamageInfo.Damage += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_ExtraMagicDamage), damageMult);
	};

	StExt_ExtraDamageInfo.Damage += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_TrueDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_BluntDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_edge] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_EdgeDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_FireDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_FlyDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_MagicDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_point] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_PointDamage), damageMult);
	StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_PoisionDamage), damageMult);
	
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotTrueDamage), damageMult), dam_index_barrier);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotBluntDamage), damageMult), dam_index_blunt);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotEdgeDamage), damageMult), dam_index_edge);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotFireDamage), damageMult), dam_index_fire);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotFlyDamage), damageMult), dam_index_fly);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotMagicDamage), damageMult), dam_index_magic);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotPointDamage), damageMult), dam_index_point);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_GetPercentFromValue(StExt_GetNpcVar(atk, StExt_AiVar_DotPoisionDamage), damageMult), dam_index_fall);
	

	// npc passive attack abilities handler.
	// exclude player...
	if (!npc_isplayer(atk))
	{
		// berzerk ability
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveBerzerk))
		{
			percent = 100 - (((atk.attribute[atr_hitpoints] + 5) * 100) / (atk.attribute[atr_hitpoints_max] + 5));
			StExt_ExtraDamageInfo.Damage += 5 + StExt_GetPercentFromValue(RealDamage, percent);
		};
		
		// lich abilities
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveLifeLich)) {
			StExt_ExtraDamageInfo.Damage += StExt_ApplyLifeSteal(atk, target, 1 + StExt_GetPermilleFromValue(RealDamage, 5 + (rank * 5)));
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveEsLich)) {
			StExt_ExtraDamageInfo.Damage += StExt_ApplyEsSteal(atk, target, 1 + StExt_GetPermilleFromValue(RealDamage, 5 + (rank * 5)));
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveStamLeach)) {
			StExt_ApplyStamSteal(atk, target, 1 + StExt_GetPermilleFromValue(RealDamage, 5 + (rank * 5)));
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveManaLich)) {
			StExt_ApplyManaSteal(atk, target, 1 + StExt_GetPermilleFromValue(RealDamage, 5 + (rank * 5)));
		};
		
		// extra damage abilities
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveBluntDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_blunt] += extraDamage; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveEdgeDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_edge] += extraDamage; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassivePointDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_point] += extraDamage; };		
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveFireDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_fire] += extraDamage; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassivePoisionDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_fall] += extraDamage; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveMagicDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_magic] += extraDamage; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveFlyDamage)) { StExt_ExtraDamageInfo.Damage[dam_index_fly] += extraDamage; };
		
		// dot abilities
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveBluntDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_blunt);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveEdgeDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_edge);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassivePointDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_point);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveFireDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_fire);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassivePoisionDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_fall);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveMagicDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_magic);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveFlyDotDamage)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_fly);
		};

		// stun/freeze ability
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveStun)) { StExt_StunTarget(target, atk, 10 + (rank * 10)); };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveFreeze)) { StExt_FreezeTarget(target, atk, 10 + (rank * 10)); };		
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveCurser))
		{
			if (npc_isplayer(target)) { rx_applycurse(); };
			rx_playeffect("spellfx_beliarshrine", target);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_magic);
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassivePoisioner))
		{
			if (npc_isplayer(target)) { rx_applysick(); };
			rx_playeffect("spellfx_acid_collidefx", target);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_fall);			
		};
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveBleeder))
		{
			if (npc_isplayer(target)) { rx_applyweakness(); };
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, extraDotDamage, dam_index_point);			
		};
		
		
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveAoeDamage)) { StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Aoe; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveChainDamage)) { StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Chain; };
		if (StExt_Npc_HasAbility(atk, StExt_Npc_Ability_PassiveDoubleDamage)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 100 + (rank * 50)); };
	};	
	
	// handle weapon bonus damage
	if (hlp_isvaliditem(weap)) { };
	
	if (atk.aivar[15] && !StExt_IsSummonOrHero(atk) && StExt_HeroHasAnyAura) { StExt_Aura_AfterOffenceHandler(atk, target, weap); };
	
	// process damage flags
	/*
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Freeze)) { StExt_FreezeTarget(target, atk, 300 + atk.level); };
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Stun)) { StExt_StunTarget(target, atk, 300 + atk.level); };
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Roots)) { StExt_RootTarget(target, atk, 300 + atk.level); };
	*/
};

// Call after damage get
func void StExt_Npc_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Npc_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)");

	// Ciernie: Zakon bosses reflect a slice of the damage they take back at
	// the attacker (thorns). No spell / no on-death. Clamped so it can't kill.
	if ((target.id >= 99710) && (target.id <= 99725) && npc_isplayer(atk) && (RealDamage > 0))
	{
		atk.attribute[atr_hitpoints] = StExt_ValidateValueMin(atk.attribute[atr_hitpoints] - StExt_GetPermilleFromValue(RealDamage, 150), 1);
		// Tempo shift also when the boss TAKES a hit (10%), so a dominating
		// player still faces rhythm changes. Same -10..+300 range.
		if (StExt_Chance(10))
		{
			StExt_Npc_ChangeAiv(target, aivrx_npc_speed, (-10 + hlp_random(311)) - rx_getnpcvar(target, aivrx_npc_speed));
		};
	};

	if ((target.aivar[15] && !StExt_IsSummonOrHero(target) && StExt_HeroHasAnyAura)) { StExt_Aura_AfterDefenceHandler(atk, target, weap); };
};

//===================================================================//
//					SUMMON Damage processing						 //
//===================================================================//

// Process summons offence on attack
func void StExt_Summon_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Summon_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	StExt_Npc_BeforeOffenceHandler(atk, target, weap);

	// aura bonus handler
	if (StExt_HeroHasAnyAura) { StExt_Aura_BeforeOffenceHandler(atk, target, weap); };
};

// Process summons defence on attack
func void StExt_Summon_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Summon_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	StExt_Npc_BeforeDefenceHandler(atk, target, weap);
	
	// aura bonus handler
	if (StExt_HeroHasAnyAura) { StExt_Aura_BeforeDefenceHandler(atk, target, weap); };
};

func void StExt_Summon_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int ticks;
	var int tmp;
	var int sumType;
	var int aoeDist;
	var int aoeTargets;
	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Summon_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	
	StExt_Npc_AfterOffenceHandler(atk, target, weap);
	
	aoeDist = StExt_CalcAoeDistance(atk, DamageFlags);
	aoeTargets = StExt_CalcAoeTargets(atk, DamageFlags, 0);
	ticks = StExt_Npc_CalcDotDuration(atk);
	sumType = StExt_GetSummonType(atk);
	
	// handle summon extra damage
	StExt_ExtraDamageInfo.Damage += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumExtraDamage], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddBluntDam], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_edge] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddEdgeDam], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddFireDam], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddFlyDam], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddMagicDam], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_point] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddPointDam], StExt_Config_Sum_GlobalDamMult);
	StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_SumAddPoisDam], StExt_Config_Sum_GlobalDamMult);
	
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumExtraDotDamage), dam_index_barrier);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumBluntExtraDotDamage), dam_index_blunt);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumEdgeExtraDotDamage), dam_index_edge);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumFireExtraDotDamage), dam_index_fire);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumFlyExtraDotDamage), dam_index_fly);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumMagicExtraDotDamage), dam_index_magic);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumPointExtraDotDamage), dam_index_point);
	StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumPoisonExtraDotDamage), dam_index_fall);	
	
	if (sumType == StExt_SummonType_Golem) 
	{ 
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_HammerHit)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Talent_Progression[StExt_MasteryIndex_Golem], dam_index_blunt);
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_Stun)) { StExt_StunTarget(target, atk, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Golem]); };
	};
	if (sumType == StExt_SummonType_Demon) 
	{ 
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_SoulWrap)) { StExt_ExtraDamageInfo.Damage += StExt_ApplyLifeSteal(atk, target, StExt_GetPermilleFromValue(RealDamage, 50)); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_UnhollyRitual) && rx_getchance(5)) { 
			StExt_ApplyTimedEffectEx(atk, target, StExt_TimedEffect_Index_StatsCurse, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Demon], 60, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe); 
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Demon, StExt_MasteryPerkIndex_Demon_Demoralization) && rx_getchance(5)) { 
			StExt_ApplyTimedEffectEx(atk, target, StExt_TimedEffect_Index_ProtectionCurse, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Demon], 60, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe); 
		};
	};
	if (sumType == StExt_SummonType_Undead) 
	{ 
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_Vampirism)) { StExt_ExtraDamageInfo.Damage += StExt_ApplyLifeSteal(atk, target, StExt_GetPermilleFromValue(RealDamage, 50)); };
	};	
	
	// aura bonus handler
	if (StExt_HeroHasAnyAura) { StExt_Aura_AfterOffenceHandler(atk, target, weap); };
};

func void StExt_Summon_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int sumType;
	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Summon_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	StExt_Npc_AfterDefenceHandler(atk, target, weap);
	if (StExt_HeroHasAnyAura) { StExt_Aura_AfterDefenceHandler(atk, target, weap); };
};

//===================================================================//
//						HERO Damage processing						 //
//===================================================================//

func void StExt_Hero_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int damMult;
	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Hero_BeforeOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_Slaver) && StExt_Chance(3 * StExt_Talent_Progression[StExt_MasteryIndex_Dark]))
	{
		rx_setnpcvar(target, aivrx_npc_control_agro, true);
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_FriendlyFier;
		StExt_DamageInfo.StopProcess = true;
		return;
	};

	// Zar Dusz: carried boss souls empower every hero hit.
	damMult = StExt_ZakonEmbers_OffencePermille();
	if (damMult > 0) { StExt_DamageInfo.RealDamage += StExt_GetPermilleFromValue(StExt_DamageInfo.RealDamage, damMult); };

	StExt_Npc_BeforeOffenceHandler(atk, target, weap);
};

func void StExt_Hero_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int tmp;	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Hero_BeforeDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	StExt_Npc_BeforeDefenceHandler(atk, target, weap);

	// Zar Dusz: carried boss souls make the hero fragile (risk of hoarding).
	tmp = StExt_ZakonEmbers_DefencePermille();
	if (tmp > 0) { StExt_DamageInfo.RealDamage += StExt_GetPermilleFromValue(StExt_DamageInfo.RealDamage, tmp); };

	// NOTE: perfect parry / block economy moved to StExt_OnPlayerParadeSuccess
	// (HeroActionsController.d), fed by the DLL from the engine's oCNpc::didParade.
	// This handler only fires for hits that actually LAND, so detecting parries
	// here was backwards (the old version printed "perfect" when you ate a hit).

	// Getting HIT still staggers you: a landed melee hit drains 6% max stamina.
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee))
	{
		rx_restorestamina(-StExt_GetPercentFromValue(atr_stamina_max, 6));
		// Pancerz Dusz (knight tree): -8% incoming melee damage
		if (StExt_KnightPerk_Armor) { StExt_DamageInfo.RealDamage -= StExt_GetPercentFromValue(StExt_DamageInfo.RealDamage, 8); };
	};

	// Zakon boss chip: a LANDED boss hit also chips 2% of your max HP (this
	// path never sees parried hits anymore - blocking is punished via the
	// per-parry stamina drain instead).
	if ((atk.id >= 99710) && (atk.id <= 99725))
	{
		target.attribute[atr_hitpoints] = StExt_ValidateValueMin(target.attribute[atr_hitpoints] - StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 2), 1);
	};

	// reflect spell
	if ((StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) && StExt_Chance(StExt_PcStats[StExt_PcStats_Index_ReflectSpellChance])) 
	{
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_SpellReflected;
		tmp = StExt_DamageInfo.TotalDamage;
		if (tmp <= 0) { tmp = StExt_DamageInfo.RealDamage; };
		tmp = 10 + StExt_GetPercentFromValue(tmp, 50);		
		StExt_CastSpell(StExt_DamageInfo.SpellId, target, atk, tmp);
	};
	// absorb spell
	if ((StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) && StExt_Chance(StExt_PcStats[StExt_PcStats_Index_AbsorbSpellChance])) 
	{
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_SpellAbsorbed;
		tmp = StExt_DamageInfo.TotalDamage;
		if (tmp <= 0) { tmp = StExt_DamageInfo.RealDamage; };
		tmp = 10 + StExt_GetPercentFromValue(tmp, 10);
		rx_restoremana(tmp);
	};
	// decline arrwos
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range) && StExt_Chance(StExt_PcStats[StExt_PcStats_Index_ArrowsDeclineChance])) {
		StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_ArrowDeclined;
	};
	// just damage ignore
	if (StExt_Chance(StExt_PcStats[StExt_PcStats_Index_IgnoreDamageChance])) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_Ignored; };	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_Inaccessibility) && rx_isshieldequipped() && rx_getchance(10)) { StExt_DamageInfo.BlockDamage = StExt_DamageInfo.BlockDamage | StExt_DamageBlockReason_Ignored; };
};

func void StExt_Hero_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int ticks;
	var int tmp;
	var int damageMult;
	var int qDamage;
	var int hDamage;
	var int aoeDist;
	var int aoeTargets;
	
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;	
	
	StExt_PrintDamageDebugStack("StExt_Hero_AfterOffenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	StExt_Npc_AfterOffenceHandler(atk, target, weap);
	StExt_TriggerWeaponSkillOnHit(atk, target, weap);
	StExt_TriggerWeaponSealOnHit(atk, target, weap);
	StExt_TriggerEquippedPerksOnHit(atk, target);

	aoeDist = StExt_CalcAoeDistance(atk, DamageFlags);
	aoeTargets = StExt_CalcAoeTargets(atk, DamageFlags, 0);
	ticks = StExt_Npc_CalcDotDuration(atk);
	qDamage = StExt_GetPermilleFromValue(RealDamage, 250);
	hDamage = StExt_GetPermilleFromValue(RealDamage, 500);
	
	// handle bonus damage
	StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ExtraDamage];
	StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_ExtraDamagePerc]);
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ExtraMeleeDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_ExtraMeleeDamPerc]);
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 3 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts]);
		if ((StExt_DamageUpPotionPower > 0) && (StExt_DamageUpTimer > 0)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_DamageUpPotionPower); };	
	};	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ExtraRangeDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_ExtraRangeDamPerc]);
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]);
	};	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ExtraSpellDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_ExtraSpellDamPerc]);
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Archmage)) { StExt_ExtraDamageInfo.Damage += (hero.attribute[2] + 1) / 2; };
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability))
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ExtraWeaponSkillDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_ExtraWeaponSkillDamPerc]);
		};
		
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Fire)) { StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]; };
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Ice)) 
		{
			StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_IceMasteryPower];
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_Hydromant)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Electric)) 
		{
			StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower];
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Electromant)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Air)) 
		{
			StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_PcStats[StExt_PcStats_Index_AirMasteryPower];			
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_Aeromancy)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Earth)) 
		{
			StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower];
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_Geomancy)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Dark)) 
		{
			StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower];
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_DarkLord)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Light)) 
		{
			StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_PcStats[StExt_PcStats_Index_LightMasteryPower];			
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Hollynes)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Death))
		{
			StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower];
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_MassDeath)) 
			{
				StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Aoe | StExt_DamageFlag_Target;
				DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Aoe | StExt_DamageFlag_Target;
			};
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathMage)) { StExt_ExtraDamageInfo.Damage += qDamage; };		
			if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Human) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Orc) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Animal))
			{
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_GrimReaper)) { 
					StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_ChangeValueIfGreaterThanZero(StExt_DamageInfo.Damage[dam_index_magic], StExt_GetPercentFromValue(StExt_DamageInfo.Damage[dam_index_magic], 1 + StExt_Talent_Progression[StExt_MasteryIndex_Death]));
				};
			};
		};
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Life) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Poision)) {
			StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower];
		};
	};
	
	if (StExt_ElementAffinity_Fire) { StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]; };
	if (StExt_ElementAffinity_Ice) { StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_IceMasteryPower]; };
	if (StExt_ElementAffinity_Electric) { StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower]; };
	if (StExt_ElementAffinity_Air) { StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]; };
	if (StExt_ElementAffinity_Earth) { StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]; };
	if (StExt_ElementAffinity_Light) { StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]; };
	if (StExt_ElementAffinity_Dark) { StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]; };
	if (StExt_ElementAffinity_Death) { StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower]; };
	if (StExt_ElementAffinity_Life) { StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]; };			
	if (StExt_ElementAffinity_Shaman) { StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ShamanMasteryPower]; };
	if (StExt_ElementAffinity_Blood) { StExt_ExtraDamageInfo.Damage += 0; /*StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower];*/ };


	// handle extra dot
	if (StExt_PcStats[StExt_PcStats_Index_BluntDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_BluntDotDamage], dam_index_blunt);
	};
	if (StExt_PcStats[StExt_PcStats_Index_EdgeDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_EdgeDotDamage], dam_index_edge);
	};
	if (StExt_PcStats[StExt_PcStats_Index_FireDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_FireDotDamage], dam_index_fire);
	};
	if (StExt_PcStats[StExt_PcStats_Index_FlyDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_FlyDotDamage], dam_index_fly);
	};
	if (StExt_PcStats[StExt_PcStats_Index_MagicDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_MagicDotDamage], dam_index_magic);
	};
	if (StExt_PcStats[StExt_PcStats_Index_PointDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_PointDotDamage], dam_index_point);
	};
	if (StExt_PcStats[StExt_PcStats_Index_PoisDotDamage] > 0) {
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_PcStats[StExt_PcStats_Index_PoisDotDamage], dam_index_fall);
	};

	// handle weapon
	if (hlp_isvaliditem(weap))
	{
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SwordMan) && (StExt_ValueHasFlag(weap.flags, item_swd) || StExt_ValueHasFlag(weap.flags, item_2hd_swd))) { StExt_ExtraDamageInfo.Damage += qDamage; };
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Executor) && (StExt_ValueHasFlag(weap.flags, item_axe) || StExt_ValueHasFlag(weap.flags, item_2hd_axe))) { StExt_ExtraDamageInfo.Damage += qDamage; };
		if (StExt_ValueHasFlag(weap.flags, item_swd) && getitemvarvalue(weap, bit_item_pierce_damage)) 
		{
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SpageMan)) { StExt_ExtraDamageInfo.Damage += qDamage; };
			if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_BackKick)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_CorruptionPath_Level); };
		};
		if (getitemvarvalue(weap, bit_item_speer)) 
		{
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SpearMan)) { StExt_ExtraDamageInfo.Damage += qDamage; };
			if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_TrueStrike)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_CorruptionPath_Level); };
		};
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_HalebardMan) && getitemvarvalue(weap, bit_item_hellebarde)) { StExt_ExtraDamageInfo.Damage += qDamage; };
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_Monk) && StExt_WeaponIsMagic(weap)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_CorruptionPath_Level); };
		
		if (StExt_ValueHasFlag(weap.flags, item_swd) || StExt_ValueHasFlag(weap.flags, item_axe)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_1hExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_1hExtraDamPerc]);
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_OneHandedFighter)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 250); };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Veteran) && (atk.hitchance[1] > 100)) {StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * (atk.hitchance[1] - 100)); };
		};
		if (StExt_ValueHasFlag(weap.flags, item_2hd_swd) || StExt_ValueHasFlag(weap.flags, item_2hd_axe)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_2hExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_2hExtraDamPerc]);
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_TwoHandedFighter)) { StExt_ExtraDamageInfo.Damage += qDamage; };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Veteran) && (atk.hitchance[2] > 100)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * (atk.hitchance[2] - 100)); };
		};
		if (StExt_ValueHasFlag(weap.flags, item_bow)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_BowExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_BowExtraDamPerc]);
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_Archery_ArcherVeteran) && (atk.hitchance[3] > 100)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * (atk.hitchance[3] - 100)); };
		};
		if (StExt_ValueHasFlag(weap.flags, item_crossbow)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_CBowExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_CBowExtraDamPerc]);
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_Archery_ArcherVeteran) && (atk.hitchance[4] > 100)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * (atk.hitchance[4] - 100)); };
		};
		if (StExt_ValueHasFlag(weap.flags, item_dag)) 
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_DualExtraDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_DualExtraDamPerc]);
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_DualFighter)) { StExt_ExtraDamageInfo.Damage += qDamage; };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Veteran)) 
			{
				if ((atk.hitchance[1] > atk.hitchance[2]) && (atk.hitchance[1] > 100)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * (atk.hitchance[1] - 100)); }
				else if (atk.hitchance[2] > 100) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * (atk.hitchance[2] - 100)); };
			};
			if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_BladeWill)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_CorruptionPath_Level); };
		};
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_Enchanter) && StExt_WeaponIsMagic(weap)) {
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(weap.damagetotal, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Shaman]);
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_Elementalist))
		{
			damageMult = 1 + StExt_Talent_Progression[StExt_MasteryIndex_Shaman];	
			StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_GetPercentFromValue(weap.damage[dam_index_fire], damageMult);
			StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_GetPercentFromValue(weap.damage[dam_index_fly], damageMult);
			StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_GetPercentFromValue(weap.damage[dam_index_magic], damageMult);
			StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_GetPercentFromValue(weap.damage[dam_index_fall], damageMult);
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_WarlockWeapon) && StExt_WeaponIsMagicSword(weap)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(weap.damagetotal, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Shaman]); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_MageTool) && StExt_WeaponIsStaff(weap)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(weap.damagetotal, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Shaman]); };
		
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) ||  StExt_ValueHasFlag(DamageType, StExt_DamageType_Range))
		{
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Grunt) && (atr_stamina > 10)) 
			{
				StExt_ExtraDamageInfo.Damage += atr_stamina;
				rx_restorestamina(-10);
			};
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_ManaCharge)) 
			{
				tmp = StExt_ValidateValueRange(StExt_GetPercentFromValue(hero.attribute[3], 5), 0, hero.attribute[2]);
				if (tmp > 0)
				{
					StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_MinDamage + tmp * (10 + hlp_random(6));
					rx_restoremana(-tmp);
				};
			};
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_MagmaStrike)) { StExt_ExtraDamageInfo.Damage += hDamage; };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_IceEdge)) { StExt_ExtraDamageInfo.Damage += hDamage; };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Disruption)) 
			{
				StExt_ExtraDamageInfo.Damage[dam_index_magic] += qDamage;
				StExt_ExtraDamageInfo.MaxTargets += 1 + StExt_Random(3 + ((1 + StExt_Talent_Progression[StExt_MasteryIndex_Electric]) / 25));
				StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Chain | StExt_DamageFlag_Target;
			};
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_Breeze)) { StExt_ExtraDamageInfo.Damage += hDamage; };	
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_Weighting)) { StExt_ExtraDamageInfo.Damage += hDamage; };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_Corruption)) { StExt_ExtraDamageInfo.Damage += hDamage; };
			if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee))
			{
				if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Human) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Orc) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Animal))
				{
					if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_SacrificialBlade)) { StExt_ExtraDamageInfo.Damage += hDamage; };
				};			
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_HammerMan)) { StExt_ExtraDamageInfo.Damage[dam_index_blunt] += 5 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts]; };
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Executor)) { StExt_ExtraDamageInfo.Damage[dam_index_edge] += 5 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts]; };
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_SpearMan)) { StExt_ExtraDamageInfo.Damage[dam_index_point] += 5 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts]; };
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_MadWhirlwind)) { StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Aoe; };
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Mercenary)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 3 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts], dam_index_blunt);
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Guard)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 3 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts], dam_index_edge);
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Asassin)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 3 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts], dam_index_point);
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_Fighter)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 5 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts]); };
			};
			
			
			if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range))
			{
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_Shooter)) { 
					StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 5 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); 
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_CrushingShot)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery], dam_index_blunt);
				};				
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_PiercingShot)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery], dam_index_point);
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_PoisionShot)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery], dam_index_fall);
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_CriticalShot) && rx_getchance(10)) 
				{
					StExt_ExtraDamageInfo.Damage += RealDamage;				
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_Ricochete)) 
				{
					StExt_ExtraDamageInfo.MaxTargets += 1 + hlp_random(3);
					StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Chain | StExt_DamageFlag_Target;
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_AimedShot)) { StExt_StunTarget(target, atk, 3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); };
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_Hunter) && StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Animal)) { 
					StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); 
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_Killer) && StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Human)) { 
					StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); 
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_OrcNemesis) && StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Orc)) { 
					StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); 
				};				
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_DemonHunter) && (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Undead) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Demon))) { 
					StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); 
				};
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Archery, StExt_MasteryPerkIndex_Archery_GolemDestroyer) && StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Golem)) { 
					StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]); 
				};				
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_SplintArrow) && rx_getchance(20)) {
					StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Aoe | StExt_DamageFlag_Target;
				};
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_DeadlyToxins)) {
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 5 * StExt_CorruptionPath_Level, dam_index_fall);
				};
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_MagickArrow)) { 
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, 5 * StExt_CorruptionPath_Level, dam_index_magic);
				};
				if (StExt_IsGenericPerkLearned(StExt_PerkIndex_DoubleShot) && rx_getchance(10) && !StExt_Damage_SkillCrtiticalShotDone)
				{
					if (hlp_isvaliditem(weap) && StExt_ValueHasFlag(weap.flags, item_crossbow))
					{ StExt_ThrowItem(atk, target, "ItRw_Bolt", RealDamage + (3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]), dam_point); }
					else { StExt_ThrowItem(atk, target, "ItRw_Arrow", RealDamage + (3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]), dam_point); };
					StExt_Damage_SkillCrtiticalShotDone = true;
				};
			};
		};		
	};

	// handle extra damage to specific target
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Golem)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_GolemExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_GolemExtraDamPerc]);
	};	
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Demon)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_EvilExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_EvilExtraDamPerc]);
	};	
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Undead)) 
	{ 
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_UndeadExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_UndeadExtraDamPerc]);
	};
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Human))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_HumanExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_HumanExtraDamPerc]);
	}; 
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Orc))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_OrcExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_OrcExtraDamPerc]);
	}; 
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Animal))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_AnimalExtraDam];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_AnimalExtraDamPerc]);
	}; 
	
	// aoe bonus damage
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Aoe))
	{
		StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_AoeExtraDamage];
		StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_AoeExtraDamagePerc]);
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) 
		{ 
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_AoeExtraWeapDamage];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_AoeExtraWeapDamagePerc]);
		};	
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) 
		{ 
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_AoeExtraMagicDamage];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_AoeExtraMagicDamagePerc]);
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_Storm)) { StExt_ExtraDamageInfo.Damage += qDamage; };
	};
	
	// crit chance and double damage
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) { 
		if (StExt_Chance(StExt_PcStats[StExt_PcStats_Index_WeapDoubleDamageChance])) { StExt_ExtraDamageInfo.Damage += RealDamage; };
	};	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) 
	{ 
		if (StExt_Chance(StExt_PcStats[StExt_PcStats_Index_SpellCritChance]))
		{
			StExt_ExtraDamageInfo.Damage += StExt_PcStats[StExt_PcStats_Index_ExtraSpellDam];
			StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 1000 + StExt_PcStats[StExt_PcStats_Index_SpellCritChanceMult]);
		};
		if (!StExt_ReflectSpellAbility_InUse && !StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability) && StExt_Chance(StExt_PcStats[StExt_PcStats_Index_SpellDoubleCastChance])) 
		{
			StExt_ReflectSpellAbility_InUse = true;
			StExt_CastSpell(StExt_DamageInfo.SpellId, atk, target, RealDamage); 
		};
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_InspirationPain) && rx_checkhealthpercent(hero, 30)) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 500); };
	};

	// steal hp/mana/stam/es
	tmp = StExt_PcStats[StExt_PcStats_Index_StealLife] + StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_StealLifePerc]);
	StExt_ExtraDamageInfo.Damage += StExt_ApplyLifeSteal(atk, target, tmp);
	tmp = StExt_PcStats[StExt_PcStats_Index_SteaMana] + StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_StealManaPerc]);
	StExt_ApplyManaSteal(atk, target, tmp);
	tmp = StExt_PcStats[StExt_PcStats_Index_StealEs] + StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_StealEsPerc]);
	StExt_ExtraDamageInfo.Damage += StExt_ApplyEsSteal(atk, target, tmp);
	tmp = StExt_PcStats[StExt_PcStats_Index_StealStam] + StExt_GetPermilleFromValue(RealDamage, StExt_PcStats[StExt_PcStats_Index_StealStamPerc]);
	StExt_ApplyStamSteal(atk, target, tmp);
	
	// life/mana/stam/es per hit
	if (StExt_PcStats[StExt_PcStats_Index_HpPerHit] > 0) { rx_restorehealth(atk, StExt_PcStats[StExt_PcStats_Index_HpPerHit]); };
	if (StExt_PcStats[StExt_PcStats_Index_MpPerHit] > 0) { rx_restoremana(StExt_PcStats[StExt_PcStats_Index_MpPerHit]); };
	// Melee stamina economy: a big stamina pool + StPerHit (restore-on-hit) used to keep
	// the warrior permanently full and swinging forever - the melee "Archmage" (infinite
	// stamina, hits for millions in chapter 1). Every landed MELEE hit costs 8% of max
	// stamina and StPerHit can refund AT MOST A THIRD of it, so each hit always drains a net
	// >=5% - a full-refund made net-zero chains infinite at 2k stamina in playtests.
	// Non-melee hits keep the old StPerHit behaviour. (8% / third-refund tunable.)
	// RIPOSTE: first melee hit after a perfect parry (~1.5s window) deals +50%
	// and costs no stamina - the payoff for timing instead of holding block.
	var int isRiposte; isRiposte = false;
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) && (StExt_Riposte_Window > 0))
	{
		isRiposte = true;
		StExt_Riposte_Window = 0;
		// Gniew Rycerza (knight tree): riposte +100% instead of +50%
		if (StExt_KnightPerk_Wrath) { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 1000); }
		else { StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 500); };
		printscreencolor("RIPOSTA!", StExt_Null, 45, StExt_DefaultFont, 1, StExt_Color_Green);
	};

	// Rycerz Dusz: Miazdzacy Cios (every 4th landed melee hit +40%) + Pakt Dusz
	// (2% melee lifesteal). Bought with boss souls at the Soul Master.
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) && (RealDamage > 0))
	{
		if (StExt_KnightPerk_Crush)
		{
			StExt_KnightCrush_Counter += 1;
			if (StExt_KnightCrush_Counter >= 4)
			{
				StExt_KnightCrush_Counter = 0;
				StExt_ExtraDamageInfo.Damage += StExt_GetPermilleFromValue(RealDamage, 400);
			};
		};
		if (StExt_KnightPerk_Pact) { StExt_RecouperateHp(atk, StExt_GetPermilleFromValue(RealDamage, 20)); };
	};

	// *** ELEMENTAL BUILDUP (deterministic - zero RNG) ***
	// v2: charges from the hit's ACTUAL elemental damage components (fire /
	// magic / fly / poison), so it works with ANY weapon or spell that deals
	// elemental damage - v1 required a weapon seal, which most builds lack
	// ("wybuch nie dziala"). Dominant element of the hit feeds the gauge;
	// switching the dominant element resets it. Eruption at charge >= 30% of
	// the target's max HP (x3 for Zakon bosses):
	//   fire -> burn DoT ~16% maxHP, magic -> +8% maxHP burst,
	//   fly -> 1.5s stagger + 4%, poison -> 8% maxHP rot.
	if (!npc_isplayer(target) && (RealDamage > 0))
	{
		var int ebAmount; var int ebKey;
		ebAmount = 0; ebKey = 0;
		if (StExt_DamageInfo.Damage[dam_index_fire] > ebAmount)  { ebAmount = StExt_DamageInfo.Damage[dam_index_fire];  ebKey = 1; };
		if (StExt_DamageInfo.Damage[dam_index_magic] > ebAmount) { ebAmount = StExt_DamageInfo.Damage[dam_index_magic]; ebKey = 2; };
		if (StExt_DamageInfo.Damage[dam_index_fly] > ebAmount)   { ebAmount = StExt_DamageInfo.Damage[dam_index_fly];   ebKey = 3; };
		if (StExt_DamageInfo.Damage[dam_index_fall] > ebAmount)  { ebAmount = StExt_DamageInfo.Damage[dam_index_fall];  ebKey = 4; };
		if ((ebKey > 0) && (ebAmount > 0))
		{
			var int ebCharge;
			if (StExt_GetNpcVar(target, StExt_AiVar_ElementBuildupType) != ebKey)
			{
				StExt_SetNpcVar(target, StExt_AiVar_ElementBuildupType, ebKey);
				StExt_SetNpcVar(target, StExt_AiVar_ElementBuildup, 0);
			};
			ebCharge = StExt_GetNpcVar(target, StExt_AiVar_ElementBuildup) + ebAmount;

			var int ebThreshold; ebThreshold = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 30);
			if ((target.id >= 99710) && (target.id <= 99725)) { ebThreshold = ebThreshold * 3; };

			if (ebCharge >= ebThreshold)
			{
				StExt_SetNpcVar(target, StExt_AiVar_ElementBuildup, 0);
				printscreencolor("ERUPCJA ZYWIOLU!", StExt_Null, 48, StExt_DefaultFont, 1, StExt_Color_Green);
				if (ebKey == 1)
				{
					rx_playeffect("SPELLFX_FIREWAVE", target);
					StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, 8, StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 2), dam_index_fire);
				}
				else if (ebKey == 2)
				{
					rx_playeffect("spellFX_Thunderstorm", target);
					StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 8);
				}
				else if (ebKey == 3)
				{
					rx_playeffect("SPELLFX_MASTEROFDISASTER", target);
					rx_stuntarget(target, 1);
					StExt_ExtraDamageInfo.Damage += StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 4);
				}
				else
				{
					rx_playeffect("SPELLFX_ICEWAVE", target);
					target.attribute[atr_hitpoints] = StExt_ValidateValueMin(target.attribute[atr_hitpoints] - StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 8), 1);
				};
			}
			else { StExt_SetNpcVar(target, StExt_AiVar_ElementBuildup, ebCharge); };
		};
	};

	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee) && !isRiposte)
	{
		var int staCost; staCost = StExt_GetPercentFromValue(atr_stamina_max, 8);
		var int staRefund; staRefund = staCost / 3;
		rx_restorestamina(-staCost);
		if (StExt_PcStats[StExt_PcStats_Index_StPerHit] > 0)
		{
			if (StExt_PcStats[StExt_PcStats_Index_StPerHit] < staRefund) { staRefund = StExt_PcStats[StExt_PcStats_Index_StPerHit]; };
			rx_restorestamina(staRefund);
		};
	}
	else if (StExt_PcStats[StExt_PcStats_Index_StPerHit] > 0) { rx_restorestamina(StExt_PcStats[StExt_PcStats_Index_StPerHit]); };
	if (StExt_PcStats[StExt_PcStats_Index_EsPerHit] > 0) { StExt_Npc_ChangeEs(atk, StExt_PcStats[StExt_PcStats_Index_EsPerHit]); };
	
	// stun/freze chance
	if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Stream)) 
	{ 
		StExt_StunTarget(target, atk, StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_StunChance], StExt_Config_StreamSpellDamageMult));
		StExt_FreezeTarget(target, atk, StExt_GetPercentFromValue(StExt_PcStats[StExt_PcStats_Index_FreezeChance], StExt_Config_StreamSpellDamageMult));
	}
	else
	{
		StExt_StunTarget(target, atk, StExt_PcStats[StExt_PcStats_Index_StunChance]);
		StExt_FreezeTarget(target, atk, StExt_PcStats[StExt_PcStats_Index_FreezeChance]);
	};
	
	// fire mastery
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_AgniGift) && rx_getchance(10)) { 
		StExt_CastSpell(spl_instantfireball, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_BreathOfFire)) {
		StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_ChangeValueIfGreaterThanZero(StExt_DamageInfo.Damage[dam_index_fire], StExt_GetPercentFromValue(StExt_DamageInfo.Damage[dam_index_fire], 25));
	};
	
	// ice mastery
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_IceHerald) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Ice)) { 
		StExt_ExtraDamageInfo.Damage[dam_index_magic] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Ice]; 
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_Icing) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Ice)) { 
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Talent_Progression[StExt_MasteryIndex_Ice], dam_index_magic);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_AdanosGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_icelance, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_IceMasteryPower]);
	};
	
	// electric mastery
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_LightingHerald) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Electric)) { 
		StExt_ExtraDamageInfo.Damage[dam_index_magic] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Electric]; 
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Shock) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Electric)) { 
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Talent_Progression[StExt_MasteryIndex_Electric], dam_index_magic);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_AmpersGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_lightningflash, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower]);
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Conductor) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Electric)) { 
		StExt_ExtraDamageInfo.MaxTargets += 1 + hlp_random(3 + ((1 + StExt_Talent_Progression[StExt_MasteryIndex_Electric]) / 25));
		StExt_ExtraDamageInfo.DamageFlags = StExt_ExtraDamageInfo.DamageFlags | StExt_DamageFlag_Chain;
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_ChargedStrike)) {
		StExt_ExtraDamageInfo.Damage[dam_index_magic] += 1 + hlp_random(300 + StExt_Talent_Progression[StExt_MasteryIndex_Electric]) + StExt_Talent_Progression[StExt_MasteryIndex_Electric];
	};	
	
	// air mastery
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_SkiesGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_whirlwind, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]);
	};
	
	// earth mastery
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_StonosGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_stonefirst, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]);
	};
	
	// light mastery
	if (c_npcisevil(target) || c_npcisundead(target))
	{
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Godly)) { StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_GetPercentFromValue(RealDamage, 25); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Dogma)) { StExt_ExtraDamageInfo.Damage += 50 + (3 * StExt_Talent_Progression[StExt_MasteryIndex_Light]); };
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_InnosGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_palholybolt, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]);
	};
	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Ward) && rx_getchance(5)) {
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_ProtAllBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, 100, 1, 0);
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_ProtAllBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);		
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Inspire) && rx_getchance(5)) {
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_HpBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, 100, 1, 0);
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_HpBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);	
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Steadfastness) && rx_getchance(5)) {
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_RegenAllBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, 100, 1, 0);
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_RegenAllBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Leadership) && rx_getchance(5)) {
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_DamageAllBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, 100, 1, 0);
		StExt_ApplyTimedEffectEx(atk, atk, StExt_TimedEffect_Index_DamageAllBonus, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Light], 15, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);
	};

	// dark mastery
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Dark))
	{
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_Agony)) { StExt_ExtraDamageInfo.Damage[dam_index_magic] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Dark]; };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_Unholly)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Talent_Progression[StExt_MasteryIndex_Dark], dam_index_magic);
		};
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_DemonGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_darkball, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]);
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_Siphon) && rx_getchance(10)) { 
		StExt_ApplyTimedEffectEx(atk, target, StExt_TimedEffect_Index_SiphonCurse, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Dark], 60, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_StatsDecrease) && rx_getchance(10)) { 
		StExt_ApplyTimedEffectEx(atk, target, StExt_TimedEffect_Index_StatsCurse, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Dark], 60, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_ProtectionDecrase) && rx_getchance(10)) { 
		StExt_ApplyTimedEffectEx(atk, target, StExt_TimedEffect_Index_ProtectionCurse, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Dark], 60, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);
	};

	// death mastery
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Death))
	{
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathHerald)) {
			StExt_ExtraDamageInfo.Damage[dam_index_magic] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Death];
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_Withering)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, StExt_Talent_Progression[StExt_MasteryIndex_Death], dam_index_magic);
		};		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_WightsChorus) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell)) {
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, ticks, (RealDamage + 5) / 3, dam_index_magic);
		};
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathHerald)) {
		StExt_ExtraDamageInfo.Damage[dam_index_magic] += 3 * StExt_Talent_Progression[StExt_MasteryIndex_Death];
	};	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathGift) && rx_getchance(10)) {
		StExt_CastSpell(spl_deathball, atk, target, 100 + StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower]);
	};	
	if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_QuietSteps) && !npc_canseenpc(target, atk)) { StExt_ExtraDamageInfo.Damage += RealDamage; };

	// handle damage bonus
	StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_blunt], StExt_PcStats[StExt_PcStats_Index_AddBluntDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_edge], StExt_PcStats[StExt_PcStats_Index_AddEdgeDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_fire], StExt_PcStats[StExt_PcStats_Index_AddFireDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_fly], StExt_PcStats[StExt_PcStats_Index_AddFlyDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_magic], StExt_PcStats[StExt_PcStats_Index_AddMagicDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_point], StExt_PcStats[StExt_PcStats_Index_AddPointDamPerc]);
	StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.Damage[dam_index_fall], StExt_PcStats[StExt_PcStats_Index_AddPoisonDamPerc]);
	
	StExt_ExtraDamageInfo.DotDamage[dam_index_blunt] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_blunt], StExt_PcStats[StExt_PcStats_Index_AddBluntDamPerc]);
	StExt_ExtraDamageInfo.DotDamage[dam_index_edge] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_edge], StExt_PcStats[StExt_PcStats_Index_AddEdgeDamPerc]);
	StExt_ExtraDamageInfo.DotDamage[dam_index_fire] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_fire], StExt_PcStats[StExt_PcStats_Index_AddFireDamPerc]);
	StExt_ExtraDamageInfo.DotDamage[dam_index_fly] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_fly], StExt_PcStats[StExt_PcStats_Index_AddFlyDamPerc]);
	StExt_ExtraDamageInfo.DotDamage[dam_index_magic] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_magic], StExt_PcStats[StExt_PcStats_Index_AddMagicDamPerc]);
	StExt_ExtraDamageInfo.DotDamage[dam_index_point] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_point], StExt_PcStats[StExt_PcStats_Index_AddPointDamPerc]);
	StExt_ExtraDamageInfo.DotDamage[dam_index_fall] += StExt_GetPermilleFromValue(StExt_ExtraDamageInfo.DotDamage[dam_index_fall], StExt_PcStats[StExt_PcStats_Index_AddPoisonDamPerc]);

	// handle extra damage
	StExt_ExtraDamageInfo.Damage[dam_index_blunt] += StExt_PcStats[StExt_PcStats_Index_ExtraBluntDam];
	StExt_ExtraDamageInfo.Damage[dam_index_edge] += StExt_PcStats[StExt_PcStats_Index_ExtraEdgeDam];
	StExt_ExtraDamageInfo.Damage[dam_index_fire] += StExt_PcStats[StExt_PcStats_Index_ExtraFireDam];
	StExt_ExtraDamageInfo.Damage[dam_index_fly] += StExt_PcStats[StExt_PcStats_Index_ExtraFlyDam];
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += StExt_PcStats[StExt_PcStats_Index_ExtraMagicDam];
	StExt_ExtraDamageInfo.Damage[dam_index_point] += StExt_PcStats[StExt_PcStats_Index_ExtraPointDam];
	StExt_ExtraDamageInfo.Damage[dam_index_fall] += StExt_PcStats[StExt_PcStats_Index_ExtraPoisonDam];	
};

func void StExt_Hero_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int RealDamage; RealDamage = StExt_DamageInfo.RealDamage;
	var int DamageType; DamageType = StExt_DamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_DamageInfo.DamageFlags;
	
	var int aoeDist; aoeDist = StExt_CalcAoeDistance(target, DamageFlags);
	var int aoeTargets; aoeTargets = StExt_CalcAoeTargets(target, DamageFlags, 0);
	
	StExt_PrintDamageDebugStack("StExt_Hero_AfterDefenceHandler(var c_npc atk, var c_npc target, var c_item weap)");
	StExt_Npc_AfterDefenceHandler(atk, target, weap);
	StExt_TriggerAegisOnDefence(atk);
	
	if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee))
	{
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_Frost)) { StExt_FreezeTarget(atk, target, 100); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_Recoil)) { StExt_StunTarget(atk, target, 100); };
	};	
	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_DarkCape) && rx_getchance(10)) {	
		StExt_ApplyRandomDebuffEffect(target, atk, 10 * StExt_Talent_Progression[StExt_MasteryIndex_Dark], 60, aoeDist, aoeTargets, StExt_TimedEffect_Flag_Aoe);
	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_BeliarHand)) { StExt_ApplyLifeSteal(target, atk, StExt_GetPermilleFromValue(atk.attribute[1], 5));	};
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Agile, StExt_MasteryPerkIndex_Agile_Besieged) && rx_isshieldequipped()) { StExt_StunTarget(atk, target, 5 * StExt_Talent_Progression[StExt_MasteryIndex_Agile]); };
};

func void StExt_PostDamageHandler(var c_npc atk, var c_npc target, var c_item weap)
{
	var int rank;
	var int percent;
	var int abilitySlot;
	var int ticks;
	var int sumType;
	
	var int TotalDamage; TotalDamage = StExt_IncomingDamageInfo.DamageTotal;
	var int DamageType; DamageType = StExt_IncomingDamageInfo.DamageType;
	var int DamageFlags; DamageFlags = StExt_IncomingDamageInfo.DamageFlags;
	
	var int RecouperateHp; RecouperateHp = 0;
	var int RecouperateMp; RecouperateMp = 0;
	var int RecouperateSt; RecouperateSt = 0;
	var int RecouperateEs; RecouperateEs = 0;
	
	StExt_PrintDamageDebugStack("StExt_PostDamageHandler(var c_npc atk, var c_npc target, var c_item weap)");
	
	if (TotalDamage < StExt_MinDamage) { TotalDamage = StExt_MinDamage; };
	ticks = StExt_Npc_CalcDotDuration(target);	
	
	if (npc_isplayer(target))
	{
		if (StExt_Chance(StExt_PcStats[StExt_PcStats_Index_ReflectDamageChance])) { StExt_ReflectDamageInfo.Damage += StExt_GetPermilleFromValue(TotalDamage, 200 + hlp_random(50)); };
		
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Inductor)) { 
			StExt_ReflectDamageInfo.Damage[dam_index_magic] += 1 + hlp_random(50 + (5 * StExt_Talent_Progression[StExt_MasteryIndex_Electric]));
		};
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Patronage)) { StExt_ReflectDamageInfo.Damage[dam_index_fire] += 50 + (5 * StExt_Talent_Progression[StExt_MasteryIndex_Light]); };
		
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee)) {
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_GraniteCoat)) { StExt_ReflectDamageInfo.Damage[dam_index_blunt] += 50 + (7 * StExt_Talent_Progression[StExt_MasteryIndex_Earth]); };
		};
		if (c_npcisevil(atk) || c_npcisundead(atk))
		{
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_Saintness)) { StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(TotalDamage, 200); };
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_StrongFaith)) 
			{
				RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, 100);
				RecouperateEs += StExt_GetPermilleFromValue(TotalDamage, 100);
			};
		};
		if (StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Human) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Orc) || StExt_ValueHasFlag(DamageFlags, StExt_DamageFlag_Animal)) {
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_LichWill)) { StExt_ReflectDamageInfo.Damage[dam_index_magic] += 50 + (5 * StExt_Talent_Progression[StExt_MasteryIndex_Death]); };
		};
		if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_ThornCoat)) { StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(TotalDamage, 100); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_FireEater))	{ RecouperateHp += StExt_GetPercentFromValue(StExt_IncomingDamageInfo.Damage[dam_index_fire], 20); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_WaterCoat)) { RecouperateMp += StExt_GetPercentFromValue(TotalDamage, 10); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Capacitor)) { RecouperateEs += StExt_GetPercentFromValue(TotalDamage, 10); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_DeathEater) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Death)) { RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, 200); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_Forethought)) { RecouperateEs += StExt_GetPermilleFromValue(TotalDamage, 100); };
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Shaman, StExt_MasteryPerkIndex_Shaman_Thriftiness)) { RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, 100); };

		// recouperate stats
		RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, StExt_PcStats[StExt_PcStats_Index_HpRecouped]);
		RecouperateMp += StExt_GetPermilleFromValue(TotalDamage, StExt_PcStats[StExt_PcStats_Index_MpRecouped]);
		RecouperateEs += StExt_GetPermilleFromValue(TotalDamage, StExt_PcStats[StExt_PcStats_Index_EsRecouped]);
		RecouperateSt += StExt_GetPermilleFromValue(TotalDamage, StExt_PcStats[StExt_PcStats_Index_StRecouped]);
		
//		StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsBlunt); 
//		StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsEdge); 
//		StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFire); 
//		StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFly); 
//		StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsMagic); 
//		StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPoint); 
//		StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPoision); 
		
		StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsBluntPerc));
		StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsEdgePerc));
		StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFirePerc));
		StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFlyPerc));
		StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsMagicPerc));
		StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPointPerc));
		StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPoisionPerc));
		
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsBluntDot) > 0) {
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsBluntDot), dam_index_blunt);
//		};
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsEdgeDot) > 0) {
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsEdgeDot), dam_index_edge);
//		};
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFireDot) > 0) {
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFireDot), dam_index_fire);
//		};
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFlyDot) > 0) {	
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsFlyDot), dam_index_fly);
//		};
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsMagicDot) > 0) {
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsMagicDot), dam_index_magic);
//		};
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPointDot) > 0) {
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPointDot), dam_index_point);
//		};
//		if (StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPoisionDot) > 0) {	
//			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_ReflectDamageAsPoision), dam_index_fall);
//		};
	}
	else if (StExt_IsSummonOrTotem(target) || target.aivar[15])
	{
		// Handle party auras
		if (StExt_HeroHasAnyAura && StExt_IsGenericPerkLearned(StExt_PerkIndex_Generosity) && StExt_IsInAuraRange(target))
		{
			if (StExt_Chance(StExt_PcStats_Auras[StExt_PcStats_Index_ReflectDamageChance])) {
				StExt_ReflectDamageInfo.Damage += StExt_GetPermilleFromValue(TotalDamage, 150 + hlp_random(50));
			};
			
			RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, StExt_PcStats_Auras[StExt_PcStats_Index_HpRecouped]);
			RecouperateEs += StExt_GetPermilleFromValue(TotalDamage, StExt_PcStats_Auras[StExt_PcStats_Index_EsRecouped]);			
			
			StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsBlunt);
			StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsEdge);
			StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFire);
			StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFly);
			StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsMagic);
			StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPoint);
			StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPoision);
			
			StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsBluntPerc));
			StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsEdgePerc));
			StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFirePerc));
			StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFlyPerc));
			StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsMagicPerc));
			StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPointPerc));
			StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(TotalDamage, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPoisionPerc));
			
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsBluntDot) > 0) {
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsBluntDot), dam_index_blunt);
			};
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsEdgeDot) > 0) {
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsEdgeDot), dam_index_edge);
			};
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFireDot) > 0) {
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFireDot), dam_index_fire);
			};
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFlyDot) > 0) {	
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsFlyDot), dam_index_fly);
			};
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsMagicDot) > 0) {
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsMagicDot), dam_index_magic);
			};
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPointDot) > 0) {
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPointDot), dam_index_point);
			};
			if (StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPoisionDot) > 0) {	
				StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStats_AurasArrayName, StExt_PcStats_Index_ReflectDamageAsPoision), dam_index_fall);
			};
		};
		
		// Handle specific summons skills
		if (StExt_IsSummonOrTotem(target))
		{
			StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsBlunt), StExt_Config_Sum_GlobalDamMult);
			StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsEdge), StExt_Config_Sum_GlobalDamMult);
			StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsFire), StExt_Config_Sum_GlobalDamMult);
			StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsFly), StExt_Config_Sum_GlobalDamMult);
			StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsMagic), StExt_Config_Sum_GlobalDamMult);
			StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsPoint), StExt_Config_Sum_GlobalDamMult);
			StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetPercentFromValue(StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsPoision), StExt_Config_Sum_GlobalDamMult);
			
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsBluntDot), dam_index_blunt);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsEdgeDot), dam_index_edge);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsFireDot), dam_index_fire);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsFlyDot), dam_index_fly);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsMagicDot), dam_index_magic);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsPointDot), dam_index_point);
			StExt_AddDotDamageToExtraDamageInfo(StExt_ReflectDamageInfo, ticks, StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SumReflectDamageAsPoisionDot), dam_index_fall);	

		
			sumType = StExt_GetSummonType(target);
			if (sumType == StExt_SummonType_Undead) 
			{ 
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Necro, StExt_MasteryPerkIndex_Necro_BoneShield)) { 
					StExt_ReflectDamageInfo.Damage += StExt_GetPermilleFromValue(TotalDamage, 50 + StExt_Talent_Progression[StExt_MasteryIndex_Necro]); 
				};
			};
			if (sumType == StExt_SummonType_Golem) 
			{ 
				if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Golem, StExt_MasteryPerkIndex_Golem_Accumulation)) { 
					RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, 200 + StExt_Talent_Progression[StExt_MasteryIndex_Golem]); 
				};
			};	
		};
	};
	
	if(!npc_isplayer(target))
	{		
		rank = StExt_Npc_IsRandomized(target);
		ticks = StExt_Npc_CalcDotDuration(target);
		percent = 5 + (rank * 5);		
		
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee)) 
		{ 
			// reflect damage abilities
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamage)) {				
				StExt_ReflectDamageInfo.Damage += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsFire)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsMagic)) {
				StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsPoision)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsPoint)) {
				StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsBlunt)) {
				StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsEdge)) {
				StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectMeleeDamageAsFly)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
		};
		
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) 
		{ 
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamage)) {				
				StExt_ReflectDamageInfo.Damage += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsFire)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsMagic)) {
				StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsPoision)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsPoint)) {
				StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsBlunt)) {
				StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsEdge)) {
				StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectRangeDamageAsFly)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
		};
		
		if (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)) 
		{ 
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamage)) {				
				StExt_ReflectDamageInfo.Damage += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsFire)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsMagic)) {
				StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsPoision)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};			
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsPoint)) {
				StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsBlunt)) {
				StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsEdge)) {
				StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
			if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveReflectSpellDamageAsFly)) {
				StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetPermilleFromValue(TotalDamage, percent);
			};
		};
		
		StExt_ReflectDamageInfo.Damage += StExt_GetNpcVar(target, StExt_AiVar_ReflectTrueDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_fire] += StExt_GetNpcVar(target, StExt_AiVar_ReflectFireDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_magic] += StExt_GetNpcVar(target, StExt_AiVar_ReflectMagicDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_fall] += StExt_GetNpcVar(target, StExt_AiVar_ReflectPoisionDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_point] += StExt_GetNpcVar(target, StExt_AiVar_ReflectPointDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_blunt] += StExt_GetNpcVar(target, StExt_AiVar_ReflectBluntDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_edge] += StExt_GetNpcVar(target, StExt_AiVar_ReflectEdgeDamage);
		StExt_ReflectDamageInfo.Damage[dam_index_fly] += StExt_GetNpcVar(target, StExt_AiVar_ReflectFlyDamage);
		
		abilitySlot = StExt_Npc_SelectAbility(target, StExt_NpcAbility_Type_Passive, StExt_NpcAbility_Flag_OnDeffense, StExt_Null);
		if ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities)) {
			StExt_Npc_UseAbility(target, atk, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnDeffence);			
		};
		
		if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveRecouperateHp)) { RecouperateHp += StExt_GetPermilleFromValue(TotalDamage, percent); };
		if (StExt_Npc_HasAbility(target, StExt_Npc_Ability_PassiveRecouperateEs)) { RecouperateEs += StExt_GetPermilleFromValue(TotalDamage, percent); };
	};	
	
	// recouperate stats
	StExt_RecouperateHp(target, RecouperateHp);	
	StExt_RecouperateEs(target, RecouperateEs);
	if (npc_isplayer(target))
	{
		StExt_RecouperateMp(target, RecouperateMp);
		StExt_RecouperateSt(target, RecouperateSt);
	};
};


//===================================================================//
//							Dot logic						 		 //
//===================================================================//

func void StExt_OnDotDamage() {	StExt_ApplyTimedEffect(StExt_Self, StExt_Other, StExt_TimedEffect_Index_DotDamage); };

func void StExt_ChangeDotDamage(var c_npc slf, var c_npc oth, var int addDamage, var int damIndex)
{
	var int damageNow; damageNow = 0;
	var int damageBonus; damageBonus = 0;
	var int damageType; damageType = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType];
	var int isFromPlayer; isFromPlayer = StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsHero);
	
	if (hlp_isvalidnpc(oth)) {
		isFromPlayer = isFromPlayer || npc_isplayer(oth);
	};

	if (isFromPlayer)
	{
		if (rx_godprocdotdamage) { damageBonus += StExt_GetPermilleFromValue(addDamage, 100); };
	};

	if (damIndex == dam_index_barrier) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else if (damIndex == dam_index_blunt) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else if (damIndex == dam_index_edge) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else if (damIndex == dam_index_fire) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];		
		if(isFromPlayer)
		{
			if (rx_skill_dotnewdamage) { damageBonus += StExt_GetPercentFromValue(addDamage, 50); };
		};
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else if (damIndex == dam_index_fly) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];		
		if(isFromPlayer)
		{
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_Hypoxia)) {
				damageBonus += StExt_GetPercentFromValue(addDamage, StExt_Talent_Progression[StExt_MasteryIndex_Air]);
			};
		};
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else if (damIndex == dam_index_magic) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];		
		if(isFromPlayer)
		{
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_WinterBreaze) && StExt_ValueHasFlag(damageType, StExt_DamageType_Ice)) { 
				damageBonus += StExt_GetPercentFromValue(addDamage, StExt_Talent_Progression[StExt_MasteryIndex_Ice]); 
			};		
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_Transformator) && StExt_ValueHasFlag(damageType, StExt_DamageType_Electric)) { 
				damageBonus += StExt_GetPercentFromValue(addDamage, StExt_Talent_Progression[StExt_MasteryIndex_Electric]); 
			};
		};
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else if (damIndex == dam_index_point) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}	
	else if (damIndex == dam_index_fall) 
	{
		damageNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison] = StExt_CalcDotDamage(damageNow, addDamage + damageBonus);
	}
	else 
	{ 
		StExt_PrintDebugStack("StExt_ChangeDotDamage() - damIndex is invalid!");
		return;
	};
};

func void StExt_ChangeDotTime(var c_npc slf, var c_npc oth, var int addTicks, var int damIndex)
{
	var int ticksNow; ticksNow = 0;
	var int ticksBonus; ticksBonus = 0;
	var int damageType; damageType = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType];	
	var int isFromPlayer; isFromPlayer = StExt_ValueHasFlag(StExt_CreatedTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsHero);
	
	if (hlp_isvalidnpc(oth)) {
		isFromPlayer = isFromPlayer || npc_isplayer(oth);
	};

	if (damIndex == dam_index_barrier) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_True];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_True] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else if (damIndex == dam_index_blunt) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Blunt];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Blunt] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else if (damIndex == dam_index_edge) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Edge];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Edge] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else if (damIndex == dam_index_fire) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fire];		
		if(isFromPlayer)
		{
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_FireBreath)) {
				ticksBonus += StExt_GetPercentFromValue(addTicks, StExt_Talent_Progression[StExt_MasteryIndex_Fire]);
			};
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_Scorching)) {
				ticksBonus += StExt_GetPercentFromValue(addTicks, 50);
			};
			if (rx_skill_dotplus1) { ticksBonus += 1; };
			if (rx_skill_dotrepeat) { ticksBonus += 1; };
			if (rx_skill_dot1) { ticksBonus += StExt_GetPercentFromValue(addTicks + 1, 25); };
			if (rx_skill_dot2) { ticksBonus += StExt_GetPercentFromValue(addTicks + 1, 50); };
		};
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fire] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else if (damIndex == dam_index_fly) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fly];		
		if(isFromPlayer)
		{
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_EyeOfStorm)) {
				ticksBonus += StExt_GetPercentFromValue(addTicks, StExt_Talent_Progression[StExt_MasteryIndex_Air]);
			};
		};
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fly] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else if (damIndex == dam_index_magic) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Magic];		
		if(isFromPlayer)
		{
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Dark_Oppression) && StExt_ValueHasFlag(damageType, StExt_DamageType_Dark)) {
				ticksBonus += StExt_GetPercentFromValue(addTicks, 50);
			};
			if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_Curser)) {
				ticksBonus += StExt_GetPercentFromValue(addTicks, StExt_Talent_Progression[StExt_MasteryIndex_Dark]);
			};
		};
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Magic] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else if (damIndex == dam_index_point) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Point];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Point] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}	
	else if (damIndex == dam_index_fall) 
	{
		ticksNow = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Poison];
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Poison] = StExt_CalcDotDuration(ticksNow, addTicks + ticksBonus);
	}
	else 
	{ 
		StExt_PrintDebugStack("StExt_ChangeDotTime() - damIndex is invalid!");
		return;
	};
};


func void StExt_UpdateDotDamage(var c_npc slf, var c_npc oth, var int isInitializing)
{
	if (Hlp_IsNULL(StExt_CreatedTimedEffect)) {
		StExt_PrintDebug("StExt_UpdateDotDamage()", "StExt_CreatedTimedEffect is Null", slf, oth);
		return; 
	};
	if (Hlp_IsNULL(StExt_ExtraDamageInfoPtr)) {
		StExt_PrintDebug("StExt_UpdateDotDamage()", "StExt_ExtraDamageInfoPtr is Null", slf, oth);
		return; 
	};

	if (isInitializing) {
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_IsInit] = true;
	};
	
	StExt_CreatedTimedEffect.SelfUId = StExt_GetNpcUid(slf);
	StExt_CreatedTimedEffect.OtherUId = StExt_GetNpcUid(oth);
	if (hlp_isvalidnpc(oth))
	{
		if (npc_isplayer(oth)) { StExt_CreatedTimedEffect.Flags = StExt_CreatedTimedEffect.Flags | StExt_TimedEffect_Flag_OtherIsHero; }
		else if (StExt_IsSummonOrTotem(oth)) { StExt_CreatedTimedEffect.Flags = StExt_CreatedTimedEffect.Flags | StExt_TimedEffect_Flag_OtherIsSummon; };
	};
	
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType] = StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType] | StExt_ExtraDamageInfoPtr.DamageType;
	StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType] = 
		StExt_CreatedTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType] | StExt_ExtraDamageInfoPtr.DamageFlags | StExt_DamageFlag_Dot | StExt_DamageFlag_Timed;

	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage, dam_index_barrier);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_blunt], dam_index_blunt);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_edge], dam_index_edge);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_fire], dam_index_fire);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_fly], dam_index_fly);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_magic], dam_index_magic);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_point], dam_index_point);
	StExt_ChangeDotDamage(slf, oth, StExt_ExtraDamageInfoPtr.DotDamage[dam_index_fall], dam_index_fall);
	
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks, dam_index_barrier);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_blunt], dam_index_blunt);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_edge], dam_index_edge);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_fire], dam_index_fire);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_fly], dam_index_fly);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_magic], dam_index_magic);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_point], dam_index_point);
	StExt_ChangeDotTime(slf, oth, StExt_ExtraDamageInfoPtr.Ticks[dam_index_fall], dam_index_fall);
};


func void StExt_OnDotDamage_Init() { StExt_UpdateDotDamage(StExt_Self, StExt_Other, true); };
func void StExt_OnDotDamage_Update() { StExt_UpdateDotDamage(StExt_Self, StExt_Other, false); };
func int StExt_OnDotDamage_Loop()
{
	var int totalDamage; totalDamage = 0;
	var int totalDuration; totalDuration = 0;

	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!hlp_isvalidnpc(StExt_Self)) 
	{ 
		StExt_PrintDebug("StExt_OnDotDamage_Loop()", "Dot target npc is Null", StExt_Self, StExt_Other);
		return LOOP_END; 
	};
	if (Hlp_IsNULL(StExt_CurrentTimedEffect))
	{
		StExt_PrintDebug("StExt_OnDotDamage_Loop()", "StExt_CurrentTimedEffect is Null", StExt_Self, StExt_Other);
		return LOOP_END; 
	};
	
	if (c_npcisdown(StExt_Self))
	{
		if (npc_isplayer(StExt_Self)) { return LOOP_END; };
		if (hlp_isvalidnpc(StExt_Other) && !StExt_CanApplyDebuffToUnconsciousNpc(StExt_Other, StExt_Self)) { return LOOP_END; };
		if (!hlp_isvalidnpc(StExt_Other) && StExt_ValueHasFlag(StExt_CurrentTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsHero) &&
			!StExt_CanApplyDebuffToUnconsciousNpc(hero, StExt_Self)) { return LOOP_END; };
	};

	StExt_InitializeDotDamage();
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_True] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_True];
		StExt_DotDamageInfo.Damage = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_True] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Blunt] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Blunt];
		StExt_DotDamageInfo.Damage[dam_index_blunt] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Blunt] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Edge] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Edge];
		StExt_DotDamageInfo.Damage[dam_index_edge] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Edge] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fire] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fire];
		StExt_DotDamageInfo.Damage[dam_index_fire] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fire] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fly] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fly];
		StExt_DotDamageInfo.Damage[dam_index_fly] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fly] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Magic] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Magic];
		StExt_DotDamageInfo.Damage[dam_index_magic] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Magic] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Point] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Point];
		StExt_DotDamageInfo.Damage[dam_index_point] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Point] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point] = 0; };
	
	if (StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Poison] > 0) 
	{
		totalDamage += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
		totalDuration += StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Poison];
		StExt_DotDamageInfo.Damage[dam_index_fall] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
		StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Poison] -= 1;
	}
	else { StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison] = 0; };

	
	if ((totalDuration <= 0) || (totalDamage <= 0))
	{
		StExt_FinalizeDotDamage();
		return LOOP_END;
	};

	StExt_DotDamageInfo.DamageType = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType];
	StExt_DotDamageInfo.DamageFlags = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageFlags];
	StExt_DotDamageInfo.TotalDamage = totalDamage;
	
	if (hlp_isvalidnpc(StExt_Other)) { StExt_ApplyDotDamage(StExt_Other, StExt_Self); }
	else
	{
		if (StExt_ValueHasFlag(StExt_CurrentTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsHero) || 
			StExt_ValueHasFlag(StExt_CurrentTimedEffect.Flags, StExt_TimedEffect_Flag_OtherIsSummon)) { StExt_ApplyDotDamage(hero, StExt_Self); }
		else { StExt_ApplyDotDamage(StExt_NullNpc, StExt_Self); };
	};

	StExt_FinalizeDotDamage();
	return LOOP_CONTINUE;
};

//===================================================================//
//						Damage processing...						 //
//===================================================================//

// Preprocess damage
// Main entry point of mod's damage handling
func void StExt_OnDamageBegin()
{
	StExt_PrintDebug("StExt_OnDamageBegin()", "ENTER", StExt_AttackNpc, StExt_TargetNpc);
	
	if (Hlp_IsNULL(StExt_DamageInfo))
	{
		StExt_PrintDebug("StExt_OnDamageBegin()", "StExt_DamageInfo instance is Null!", StExt_TargetNpc, StExt_AttackNpc);
		return; 
	};
	if (!StExt_CheckDamageActors("StExt_OnDamageBegin()")) { StExt_PrintDebugStack("StExt_OnDamageBegin(): EXIT - actors is invalid!"); return; };
	
	StExt_PrintDamageDebug("STEXT_ONDAMAGEBEGIN");
	StExt_SetNpcVar(StExt_TargetNpc, StExt_AiVar_LastAtkPtr, Cast_InstanceToPointer(StExt_AttackNpc));
	
	StExt_CheckTargetImmortality(StExt_AttackNpc, StExt_TargetNpc);
	if (StExt_IsNpcImmortal(StExt_TargetNpc) || c_npcisdown(StExt_TargetNpc) || (StExt_IsSummonOrHero(StExt_AttackNpc) && StExt_IsSummonOrHero(StExt_TargetNpc)))
	{
		StExt_DamageInfo.StopProcess = true;
		return; 
	};
	
	StExt_DamageInfo.DamageFlags = StExt_GetDamageFlags(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon, StExt_DamageInfo.SpellId);
	StExt_DamageInfo.DamageType = StExt_GetDamageType(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon, StExt_DamageInfo.SpellId);
	
	if (npc_isplayer(StExt_AttackNpc)) { StExt_Hero_BeforeOffenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
	else if (StExt_IsSummonOrTotem(StExt_AttackNpc)) { StExt_Summon_BeforeOffenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
	else { StExt_Npc_BeforeOffenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); };
	
	if (npc_isplayer(StExt_TargetNpc)) { StExt_Hero_BeforeDefenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
	else if (StExt_IsSummonOrTotem(StExt_TargetNpc)) { StExt_Summon_BeforeDefenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
	else { StExt_Npc_BeforeDefenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); };
	
	if ((StExt_DamageInfo.BlockDamage > StExt_DamageBlockReason_None) && (npc_isplayer(StExt_AttackNpc) || npc_isplayer(StExt_TargetNpc))) {
		StExt_PrintBlockDamage(StExt_AttackNpc, StExt_TargetNpc, StExt_DamageInfo.BlockDamage);
	};
	
	StExt_PrintDebug("StExt_OnDamageBegin()", "EXIT", StExt_AttackNpc, StExt_TargetNpc);
};

// Postprocess damage
func void StExt_OnDamageAfter()
{
	StExt_PrintDebug("StExt_OnDamageAfter()", "ENTER", StExt_AttackNpc, StExt_TargetNpc);
	
	if (Hlp_IsNULL(StExt_DamageInfo))
	{
		StExt_PrintDebug("StExt_OnDamageAfter()", "StExt_DamageInfo instance is Null!", StExt_TargetNpc, StExt_AttackNpc);
		return; 
	};
	if (!StExt_CheckDamageActors("StExt_OnDamageAfter()")) { StExt_PrintDebugStack("StExt_OnDamageAfter(): EXIT - actors is invalid!"); return; };
	
	if (StExt_Damage_MadWhirlwindSplashInUse) { StExt_DamageInfo.StopAoe = true; };	
	if (npc_isplayer(StExt_TargetNpc) && (rx_getnpcvar(StExt_AttackNpc, aivrx_special_attack) == 31)) { additionalacceleration = StExt_PcCurrentAcceleration; };
	
	// do only for initial damage, skip extra, or reflect
	StExt_PrintDamageDebug("STEXT_ONDAMAGEAFTER");
	if (StExt_DamageInfo.IsInitial && !StExt_DamageInfo.StopProcess && (StExt_DamageInfo.BlockDamage == StExt_DamageBlockReason_None))
	{
		StExt_InitializeExtraDamage();
		StExt_ExtraDamageInfo.DamageType = StExt_DamageInfo.DamageType;
		StExt_ExtraDamageInfo.DamageFlags = StExt_DamageInfo.DamageFlags;
		
		if (StExt_DamageInfo.RealDamage <= StExt_MinDamage) {
			StExt_DamageInfo.RealDamage = StExt_CalcRealDamageFallback(StExt_AttackNpc, StExt_AttackWeapon, StExt_DamageInfo.DamageType, StExt_DamageInfo.DamageFlags);
		};
		
		if (npc_isplayer(StExt_AttackNpc)) { StExt_Hero_AfterOffenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
		else if (StExt_IsSummonOrTotem(StExt_AttackNpc)) { StExt_Summon_AfterOffenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
		else { StExt_Npc_AfterOffenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); };

		if (npc_isplayer(StExt_TargetNpc)) { StExt_Hero_AfterDefenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
		else if (StExt_IsSummonOrTotem(StExt_TargetNpc)) { StExt_Summon_AfterDefenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); }
		else { StExt_Npc_AfterDefenceHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon); };
		
		// do the aura things
		if (StExt_IsHeroPatryNpc(StExt_AttackNpc)) { StExt_AuraOnOffence(); };
		if (StExt_IsHeroPatryNpc(StExt_TargetNpc)) { StExt_AuraOnDeffence(); };
		
		if (StExt_ValueHasFlag(StExt_ExtraDamageInfo.DamageFlags, StExt_DamageFlag_Stream) && 
			(StExt_ValueHasFlag(StExt_ExtraDamageInfo.DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(StExt_ExtraDamageInfo.DamageType, StExt_DamageType_Ability)))
		{
			StExt_ExtraDamageInfo.Damage[0] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[0], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[1] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[1], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[2] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[2], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[3] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[3], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[4] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[4], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[5] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[5], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[6] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[6], StExt_Config_StreamSpellDamageMult);
			StExt_ExtraDamageInfo.Damage[7] = StExt_GetPercentFromValue(StExt_ExtraDamageInfo.Damage[7], StExt_Config_StreamSpellDamageMult);
		};		
		if (StExt_ShouldHandleMadWhirlwind(StExt_AttackNpc, StExt_TargetNpc)) { StExt_DamageInfo.StopAoe = true; };
		
		StExt_ExtraDamageInfo.MaxTargets = StExt_CalcAoeTargets(StExt_AttackNpc, StExt_ExtraDamageInfo.DamageFlags, StExt_ExtraDamageInfo.MaxTargets);
		StExt_ExtraDamageInfo.Radius = StExt_CalcAoeDistance(StExt_AttackNpc, StExt_ExtraDamageInfo.DamageFlags);		
		StExt_ExtraDamageInfo.TotalDamage = StExt_CalcTotalDamageInExtraDamageInfo(StExt_ExtraDamageInfo);
		
		if (StExt_DamageInfo.StopAoe) { StExt_ExtraDamageInfo.MaxTargets = 0; };
		
		StExt_ApplyExtraDamage(StExt_AttackNpc, StExt_TargetNpc);
		StExt_ApplyMadWhirlwindSplash(StExt_AttackNpc, StExt_TargetNpc);
		StExt_FinalizeExtraDamage();		
	};
	
	StExt_DamageInfo.StopProcess = true;
	StExt_PrintDebug("StExt_OnDamageAfter()", "EXIT", StExt_AttackNpc, StExt_TargetNpc);
};

func void StExt_OnPostDamage()
{
	var int reflectAllowed;
	var int damageFlags;
	var int dist;
	
	StExt_PrintDebug("StExt_OnPostDamage()", "ENTER", StExt_AttackNpc, StExt_TargetNpc);
	
	if (Hlp_IsNULL(StExt_IncomingDamageInfo)) {
		StExt_PrintDebug("StExt_OnPostDamage()", "StExt_IncomingDamageInfo instance is Null!", StExt_TargetNpc, StExt_AttackNpc);
		return; 
	};
	if (!StExt_CheckDamageActors("StExt_OnPostDamage()")) { StExt_PrintDebugStack("StExt_OnPostDamage(): EXIT - actors is invalid!"); return; };
	StExt_PrintIncomingDamageDebug("STEXT_ONPOSTDAMAGE");
	
	StExt_InitializeReflectDamage();	
	StExt_ReflectDamageInfo.DamageFlags = StExt_GetDamageFlags(StExt_TargetNpc, StExt_AttackNpc, StExt_NullItem, StExt_IncomingDamageInfo.SpellId);
	StExt_ReflectDamageInfo.DamageType = StExt_GetDamageType(StExt_TargetNpc, StExt_AttackNpc, StExt_NullItem, StExt_IncomingDamageInfo.SpellId);
	
	StExt_PostDamageHandler(StExt_AttackNpc, StExt_TargetNpc, StExt_NullItem);
	
	dist = npc_getdisttonpc(StExt_TargetNpc, StExt_AttackNpc);
	damageFlags = StExt_IncomingDamageInfo.Flags;
	reflectAllowed = (!StExt_ValueHasFlag(damageFlags, StExt_IncomingDamageFlag_Index_ReflectDamage) &&  
		!StExt_ValueHasFlag(damageFlags, StExt_IncomingDamageFlag_Index_Contextual) && StExt_ValueHasFlag(damageFlags, StExt_IncomingDamageFlag_Index_HasAttacker));
	
	if (reflectAllowed && (dist < 3200))
	{
		StExt_ReflectDamageInfo.MaxTargets = StExt_CalcAoeTargets(StExt_TargetNpc, StExt_ReflectDamageInfo.DamageFlags, StExt_ReflectDamageInfo.MaxTargets);
		StExt_ReflectDamageInfo.Radius = StExt_CalcAoeDistance(StExt_TargetNpc, StExt_ReflectDamageInfo.DamageFlags);		
		StExt_ApplyReflectDamage(StExt_TargetNpc, StExt_AttackNpc);
	}
	else { StExt_PrintDebug("StExt_OnPostDamage()", "StExt_IncomingDamageInfo reflect not allowed!?", StExt_TargetNpc, StExt_AttackNpc); };

	StExt_FinalizeReflectDamage();
	StExt_PrintDebug("StExt_OnPostDamage()", "EXIT", StExt_AttackNpc, StExt_TargetNpc);
};


// --------------------------------------------------------------------------------------------------------------

func int StExt_ApplyDamageToResists()
{
	var int result; result = 0;
	var int maxResistDamage;
	
	if (StExt_IncomingDamageInfo.DamageTotal <= 0) { return 0; };
	maxResistDamage = StExt_GetPermilleFromValue(StExt_IncomingDamageInfo.DamageTotal, StExt_Resists_HardCap);
	
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.DamageTotal, StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistAll));
	if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.DamageFlags, StExt_DamageFlag_Aoe)) {
		result += StExt_ApplyResist(StExt_IncomingDamageInfo.DamageTotal, StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistAoe));
	};
	if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_DotDamage)) {
		result += StExt_ApplyResist(StExt_IncomingDamageInfo.DamageTotal, StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistDot));
	};
	if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_ReflectDamage)) {
		result += StExt_ApplyResist(StExt_IncomingDamageInfo.DamageTotal, StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistReflect));
	};
	
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_blunt], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistBlunt));
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_edge], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistEdge));
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_fire], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistFire));
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_fly], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistFly));
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_magic], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistMagic));
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_point], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistPoint));
	result += StExt_ApplyResist(StExt_IncomingDamageInfo.Damage[dam_index_fall], StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_ResistPois));
	
	if (npc_isplayer(StExt_TargetNpc))
	{
		if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_DotDamage) && StExt_IsGenericPerkLearned(StExt_PerkIndex_DotResist)) {
			result += StExt_ApplyResist(StExt_IncomingDamageInfo.DamageTotal, 500);
		};
		if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_ReflectDamage) && StExt_IsGenericPerkLearned(StExt_PerkIndex_ReflectResist)) {
			result += StExt_ApplyResist(StExt_IncomingDamageInfo.DamageTotal, 500);
		};
	};
	
	result = StExt_ValidateValueRange(result, 0, maxResistDamage);
	if ((result > 0) && npc_isplayer(StExt_TargetNpc)) { StExt_AddMasteryExp(StExt_MasteryIndex_Agile, StExt_GetPercentFromValueWithMin(result, StExt_Config_DamageReductionExpRate, 1)); };
	return result;
};

func int StExt_ApplyDamageToSkills(var int incomingDamage)
{
	var int result;
	var int damage;
	var int expDamage;
	var int reductionStat;
	var int reductionMax;
	
	var int DamageTotal; DamageTotal = StExt_IncomingDamageInfo.DamageTotal;	
	if ((DamageTotal <= 0) || (incomingDamage <= 0)) { return 0; };
	
	reductionMax = incomingDamage;
	result = 0;
	expDamage = 0;
	if (npc_isplayer(StExt_TargetNpc))
	{
		if(rx_nexthitignore && (incomingDamage > 0))
		{
			damage = StExt_CalcDamageReduction(incomingDamage + 1, incomingDamage);	
			result += damage;
			incomingDamage -= damage;
			expDamage += damage;
			rx_useprotectpotion();
			StExt_HitProtPotion_Trail = 3;
		};
		
		if((StExt_HitProtPotion_Trail > 0) && (incomingDamage > 0))
		{
			damage = StExt_CalcDamageReduction(incomingDamage + 1, incomingDamage);	
			result += damage;
			incomingDamage -= damage;
			expDamage += damage;
			StExt_HitProtPotion_Trail -= 1;
		};		
	
		if (incomingDamage > 0)
		{
			reductionStat = StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_IncomingDamageReductionPerc);
			if (reductionStat > 0)
			{
				reductionStat = StExt_GetPermilleFromValue(DamageTotal, reductionStat);
				damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);	
				result += damage;
				incomingDamage -= damage;
				expDamage += damage;
			};
		};		
		
		if (incomingDamage > 0)
		{
			reductionStat = StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_IncomingDamageReduction);
			if (reductionStat > 0)
			{
				damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);	
				result += damage;
				incomingDamage -= damage;
				expDamage += damage;
			};
		};
		
		reductionStat = rx_magicshieldactive;
		if ((incomingDamage > 0) && (reductionStat > 0))
		{
			damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);
			rx_magicshieldactive -= damage;
			result += damage;
			incomingDamage -= damage;
			expDamage += damage;
		};
		
		reductionStat = rx_dh_skillshieldvalue;
		if ((incomingDamage > 0) && (reductionStat > 0))
		{
			damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);
			rx_dh_skillshieldvalue -= damage;			
			result += damage;
			incomingDamage -= damage;
			expDamage += damage;
		};		
		
		if ((incomingDamage > 0) && (StExt_TargetNpc.attribute[atr_mana] > 10) && StExt_IsGenericPerkLearned(StExt_PerkIndex_MindOverMatter))
		{
			reductionStat = StExt_TargetNpc.attribute[atr_mana] - 10;
			damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);		
			StExt_TargetNpc.attribute[atr_mana] -= damage;
			result += damage;
			incomingDamage -= damage;
			expDamage += damage;
		};
		
		if ((incomingDamage > 0) && (atr_stamina > 10) && StExt_IsGenericPerkLearned(StExt_PerkIndex_PainResist))
		{
			reductionStat = atr_stamina - 10;
			damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);		
			atr_stamina -= damage;
			result += damage;
			incomingDamage -= damage;
			expDamage += damage;
		};
		
		
		if (expDamage > 0)
		{
			expDamage = StExt_GetPercentFromValueWithMin(expDamage, StExt_Config_DamageReductionExpRate, 1);
			StExt_AddMasteryExp(StExt_MasteryIndex_Agile, expDamage);
			StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, expDamage);
		};
	}
	else
	{
		if (StExt_Npc_HasAbility(StExt_TargetNpc, StExt_Npc_Ability_PassiveIronSkin))
		{
			reductionStat = 5 + StExt_TargetNpc.level + (StExt_Npc_IsRandomized(StExt_TargetNpc) * 35);
			reductionStat = StExt_ValidateValueRange(reductionStat, 100, 500);
			reductionStat = StExt_GetPermilleFromValue(DamageTotal, reductionStat);
			damage = StExt_CalcDamageReduction(reductionStat, incomingDamage);	
			result += damage;
			incomingDamage -= damage;
		};
	};	
	return StExt_ValidateValueRange(result, 0, reductionMax);
};

func int StExt_ApplyDamageToEs(var int incomingDamage)
{
	var int damage;
	var int currentEs;
	var int reductionMax;
	var int isPlayer;
	var int expDamage;	
	var int hpLoss;
	var int hpRest;
	
	var int DamageTotal; DamageTotal = StExt_IncomingDamageInfo.DamageTotal;	
	if ((DamageTotal <= 0) || (incomingDamage <= 0)) { return 0; };
	
	currentEs = StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_EsCur);
	isPlayer = npc_isplayer(StExt_TargetNpc);
	if (currentEs <= 0) { return 0; };
	
	reductionMax = incomingDamage;	
	damage = StExt_CalcDamageReduction(currentEs, incomingDamage);
	currentEs -= damage;
	expDamage = damage;
	
	if (isPlayer && (expDamage > 0))
	{
		expDamage = StExt_GetPercentFromValueWithMin(expDamage, StExt_Config_DamageReductionExpRate, 1);
		StExt_AddMasteryExp(StExt_MasteryIndex_Agile, expDamage);
		StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, expDamage);
		StExt_ProcessExtraSnc(StExt_ExtraSnC_StatId_EnergyShield, expDamage * 2);
	};

	if (currentEs > 1)
	{
		hpLoss = StExt_TargetNpc.attribute[1] - StExt_TargetNpc.attribute[0];	
		if (isPlayer) { hpLoss -= StExt_LifeReserved; };
		if (hpLoss > 0)
		{
			hpRest = StExt_ValidateValueRange(hpLoss, 0, currentEs);
			StExt_TargetNpc.attribute[0] += hpRest;
			currentEs -= hpRest;
		};
	};
	if (currentEs < 0) { currentEs = 0; };
	
	StExt_SetNpcVar(StExt_TargetNpc, StExt_AiVar_EsCur, currentEs);
	if (StExt_Config_DisplayEsEffects) { rx_playeffect("SPELLFX_ICECUBE_COLLIDE", StExt_TargetNpc); };	
	
	return StExt_ValidateValueRange(damage, 0, reductionMax);
};

func int StExt_ApplyDamageToCurses(var int incomingDamage)
{
	var int effectPower; effectPower = StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_AppliedCursePower);
	var int effectFlags; effectFlags = StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_AppliedCurseFlags);
	var int result; result = 0;
	var int tmp;

	// handle target
	if (StExt_ValueHasFlag(effectFlags, StExt_DebuffFlag_LifeTap))
	{ 
		tmp = StExt_GetPermilleFromValue(incomingDamage, effectPower);
		StExt_Npc_Restorehealth(StExt_AttackNpc, tmp);
	};
	if (StExt_ValueHasFlag(effectFlags, StExt_DebuffFlag_AmplifyDamage)) { result += StExt_GetPermilleFromValue(incomingDamage, effectPower); };
	
	// handle attacker	
	effectPower = StExt_GetNpcVar(StExt_AttackNpc, StExt_AiVar_AppliedCursePower);
	effectFlags = StExt_GetNpcVar(StExt_AttackNpc, StExt_AiVar_AppliedCurseFlags);
	
	if (StExt_ValueHasFlag(effectFlags, StExt_DebuffFlag_IronMaiden))
	{ 
		tmp = StExt_GetPermilleFromValue(incomingDamage, effectPower);		
		StExt_ApplyLifeSteal(StExt_TargetNpc, StExt_AttackNpc, tmp);
	};
	if (StExt_ValueHasFlag(effectFlags, StExt_DebuffFlag_Weaken)) { result -= StExt_ApplyResist(incomingDamage, effectPower); };
	
	return result;
};

// call this one from enigne
// function provide calculation for damage reduction
func int StExt_ProcessHpDamage()
{
	var int damageDone;
	var int maxDamageDone;
	var int resistReduction;
	var int esReduction;
	var int skillReduction;
	var int totalReduction;
	var int incomingDamage;
	
	if (Hlp_IsNULL(StExt_IncomingDamageInfo)) {
		StExt_PrintDebug("StExt_ProcessHpDamage()", "StExt_IncomingDamageInfo instance is Null!", StExt_TargetNpc, StExt_AttackNpc);
		return 0; 
	};
	
	var int DamageTotal; DamageTotal = StExt_IncomingDamageInfo.DamageTotal;
	if (DamageTotal <= 0) {
		StExt_PrintDebug("StExt_ProcessHpDamage()", "Damage is 0!", StExt_TargetNpc, StExt_AttackNpc);
		return 0; 
	};
	if (!hlp_isvalidnpc(StExt_TargetNpc)) {
		StExt_PrintDebug("StExt_ProcessHpDamage()", "Target is null!", StExt_TargetNpc, StExt_AttackNpc);
		return 0;
	};
	
	if (npc_isplayer(StExt_TargetNpc) && c_npcisdown(StExt_TargetNpc))
	{
		StExt_PrintDebug("StExt_ProcessHpDamage()", "Skip hp damage on downed hero", StExt_TargetNpc, StExt_AttackNpc);
		return DamageTotal;
	};
	
	maxDamageDone = StExt_TargetNpc.attribute + StExt_GetNpcVar(StExt_TargetNpc, StExt_AiVar_EsCur);
	damageDone = 0;
	totalReduction = 0;
	resistReduction = 0;
	esReduction = 0;
	skillReduction = 0;
	incomingDamage = DamageTotal;
	
	StExt_IncomingDamageInfo.DamageFlags = StExt_IncomingDamageInfo.DamageFlags | StExt_GetDamageFlags(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon, StExt_IncomingDamageInfo.SpellId);
	StExt_IncomingDamageInfo.DamageType = StExt_IncomingDamageInfo.DamageType | StExt_GetDamageType(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon, StExt_IncomingDamageInfo.SpellId);	
	if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_ExtraDamage) && StExt_DontKillByExtraDamage(StExt_AttackNpc, StExt_TargetNpc)) { 
		StExt_IncomingDamageInfo.Flags = StExt_IncomingDamageInfo.Flags | StExt_IncomingDamageFlag_Index_DontKill;
	};
	
	// reduce damage by resists
	if ((incomingDamage > 0) && StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_HasAttacker) && hlp_isvalidnpc(StExt_AttackNpc)) {
		incomingDamage += StExt_ApplyDamageToCurses(incomingDamage);
	};
	
	if (incomingDamage > 0)
	{
		resistReduction = StExt_ApplyDamageToResists();
		totalReduction += resistReduction;
		incomingDamage -= resistReduction;
	};
	
	// reduce damage by skills
	if (incomingDamage > 0)
	{
		skillReduction = StExt_ApplyDamageToSkills(incomingDamage);
		totalReduction += skillReduction;
		incomingDamage -= skillReduction;
	};
	
	// reduce damage by energy shield
	if (incomingDamage > 0)
	{
		esReduction = StExt_ApplyDamageToEs(incomingDamage);
		totalReduction += esReduction;
		incomingDamage -= esReduction;
	};
	
	totalReduction = StExt_ValidateValueRange(totalReduction, 0, DamageTotal);
	if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_HasAttacker))
	{
		damageDone += StExt_ValidateValueMin(DamageTotal - totalReduction, 0) + esReduction;
		damageDone = StExt_ValidateValueRange(damageDone, 0, maxDamageDone);
		if (damageDone > 0)
		{
			if(StExt_IsHeroPatryNpc(StExt_AttackNpc))
			{
				if (StExt_ValueHasFlag(StExt_IncomingDamageInfo.Flags, StExt_IncomingDamageFlag_Index_ExtraDamage)) { StExt_AddSncDamage(damageDone); }
				else { StExt_AddSncDamage(esReduction); };
			};
			StExt_ProcessDamageExp(StExt_AttackNpc, StExt_TargetNpc, StExt_AttackWeapon, StExt_IncomingDamageInfo.DamageType, StExt_IncomingDamageInfo.DamageFlags, damageDone);
		};
	};	

	return totalReduction;
};

