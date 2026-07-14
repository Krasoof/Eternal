// Calculate maximum infusion tier 
func int StExt_GetMagicInfusionTier() 
{ 
	var int result;
    var int minTier;
    var int maxTier;
	if (kapitel < 1) { return 1; };

    minTier = StExt_ApplyPercentToValue(kapitel * 60, StExt_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange);
    maxTier = StExt_ApplyPercentToValue(kapitel * 125, StExt_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange);
	result = StExt_GetRandomRange(minTier, maxTier);
	if (result < 100) { return 1; };
	
	return StExt_ValidateValueRange(result / 100, 1, 5); 
};

func void StExt_BuildInfusedNpcName(var c_npc slf)
{
	var int tier;
	var int preffixId;
	var int affixId;
	var int suffixId;
	var string trueName;	
	var string preffixName;
	var string affixName;
	var string suffixName;
	var string result;
	var string curName;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_BuildInfusedNpcName(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (StExt_Npc_IsRandomized(slf) <= 0) { return; };
	if (!StExt_StringIsEmpty(StExt_Array_GetString("slf.name", 3))) { return; };
	
	tier = StExt_Npc_IsRandomized(slf);
	preffixId = StExt_GetNpcVar(slf, StExt_AiVar_Prefix);
	affixId = StExt_GetNpcVar(slf, StExt_AiVar_Afix);
	suffixId = StExt_GetNpcVar(slf, StExt_AiVar_Sufix);
	trueName = slf.name;
	preffixName = StExt_EmptyString;
	affixName = StExt_EmptyString;
	suffixName = StExt_EmptyString;
	result = StExt_EmptyString;
	
	// do stuff
	if (preffixId > StExt_Null)
	{
		if (!StExt_CheckArrayRange(preffixId, StExt_MagicInfusionPreffix_Max))
		{
			StExt_PrintDebug("StExt_BuildInfusedNpcName(var c_npc slf)->Preffix id", concatstrings("Wrong preffixId: ", inttostring(preffixId)), slf, StExt_NullNpc);
			result = concatstrings(result, StExt_UnknownString);
			result = concatstrings(result, " ");
		}
		else
		{
			preffixName = StExt_Array_GetString("StExt_MagicInfusionPreffix_Name", preffixId);
			result = concatstrings(result, preffixName);
			result = concatstrings(result, " ");
		};
	};
	
	// set random false affix to npc if tier greater than 3
	if ((affixId <= StExt_Null) && (tier >= 3))
	{
		affixId = hlp_random(StExt_MagicInfusionAffix_Max);
		StExt_SetNpcVar(slf, StExt_AiVar_Afix, affixId);
	};
	if (affixId > StExt_Null)
	{
		if (!StExt_CheckArrayRange(affixId, StExt_MagicInfusionAffix_Max))
		{
			StExt_PrintDebug("StExt_BuildInfusedNpcName(var c_npc slf)->Affix id", concatstrings("Wrong affixId: ", inttostring(affixId)), slf, StExt_NullNpc);
			affixName = StExt_UnknownString;
		}
		else { affixName = StExt_Array_GetString("StExt_MagicInfusionAffix_Name", affixId); };
		
		if (c_npcishuman(slf))
		{
			result = concatstrings(result, trueName);
			result = concatstrings(result, " '");
			result = concatstrings(result, affixName);
			result = concatstrings(result, "'");
		}
		else if (tier < 3)
		{
			result = concatstrings(result, trueName);
			result = concatstrings(result, " - ");
			result = concatstrings(result, affixName);
		}
		else { result = concatstrings(result, affixName); };
	}
	else { result = concatstrings(result, trueName); };
	
	if (suffixId > StExt_Null)
	{
		if (!StExt_CheckArrayRange(suffixId, StExt_MagicInfusionSuffix_Max))
		{
			StExt_PrintDebug("StExt_BuildInfusedNpcName(var c_npc slf)->Suffix id", concatstrings("Wrong suffixId: ", inttostring(suffixId)), slf, StExt_NullNpc);
			result = concatstrings(result, " ");
			result = concatstrings(result, StExt_UnknownString);
		}
		else
		{
			suffixName = StExt_Array_GetString("StExt_MagicInfusionSuffix_Name", suffixId);
			result = concatstrings(result, " ");
			result = concatstrings(result, suffixName);
		};
	};
	
	slf.name[3] = trueName;
	slf.name = result;
};

func int StExt_ApplyInfusionPower(var C_MagicInfusionData infusion, var int tier)
{
	var int power; power = 0;
	StExt_PrintDebugStack("StExt_ApplyInfusionPower(C_MagicInfusionData infusion, var int tier)");
	if (tier <= 0)
	{
		StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "tier is zero!", self, other);
		return StExt_Null;
	};
	
	if (tier == 1) { power = 50 + hlp_random(25); }
	else if (tier == 2) { power = 75 + hlp_random(50); }
	else if (tier == 3) { power = 100 + hlp_random(75); }
	else if (tier == 4) { power = 150 + hlp_random(100); }
	else if (tier >= 5) { power = 200 + hlp_random(150); };
	power += StExt_Config_Npc_MagicInfusion_PowerMod + (kapitel * 5);
	power += StExt_IfInt(StExt_Config_Diff_EnableKapitel, StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Power * (kapitel - 1), 0);	
	power += StExt_IfInt(StExt_Config_Diff_EnableLevel, StExt_Config_Diff_Level_MagicInfusionPower * hero.level, 0);
	
	// Attribute mods
	infusion.ExtraHp = StExt_ApplyPercentToValue(infusion.ExtraHp, power);
	infusion.ExtraEs = StExt_ApplyPercentToValue(infusion.ExtraEs, power);
	infusion.ExtraStr = StExt_ApplyPercentToValue(infusion.ExtraStr, power);
	infusion.ExtraAgi = StExt_ApplyPercentToValue(infusion.ExtraAgi, power);
	infusion.ExtraHpMult = StExt_ApplyPercentToValue(infusion.ExtraHpMult, power);
	infusion.ExtraEsMult = StExt_ApplyPercentToValue(infusion.ExtraEsMult, power);
	infusion.ExtraStrMult = StExt_ApplyPercentToValue(infusion.ExtraStrMult, power);
	infusion.ExtraAgiMult = StExt_ApplyPercentToValue(infusion.ExtraAgiMult, power);
	// Damage mods
	infusion.ExtraBluntDam = StExt_ApplyPercentToValue(infusion.ExtraBluntDam, power);
	infusion.ExtraEdgeDam = StExt_ApplyPercentToValue(infusion.ExtraEdgeDam, power);
	infusion.ExtraFireDam = StExt_ApplyPercentToValue(infusion.ExtraFireDam, power);
	infusion.ExtraFlyDam = StExt_ApplyPercentToValue(infusion.ExtraFlyDam, power);
	infusion.ExtraMagicDam = StExt_ApplyPercentToValue(infusion.ExtraMagicDam, power);
	infusion.ExtraPointDam = StExt_ApplyPercentToValue(infusion.ExtraPointDam, power);
	infusion.ExtraPoisonDam = StExt_ApplyPercentToValue(infusion.ExtraPoisonDam, power);
	infusion.ExtraHitchances = StExt_ApplyPercentToValue(infusion.ExtraHitchances, power);
	// Protection mods
	//infusion.ExtraDodgeChance = StExt_ApplyPercentToValue(infusion.ExtraDodgeChance, power);
	infusion.ExtraBluntProt = StExt_ApplyPercentToValue(infusion.ExtraBluntProt, power);
	infusion.ExtraEdgeProt = StExt_ApplyPercentToValue(infusion.ExtraEdgeProt, power);
	infusion.ExtraFireProt = StExt_ApplyPercentToValue(infusion.ExtraFireProt, power);
	infusion.ExtraFlyProt = StExt_ApplyPercentToValue(infusion.ExtraFlyProt, power);
	infusion.ExtraMagicProt = StExt_ApplyPercentToValue(infusion.ExtraMagicProt, power);
	infusion.ExtraPointProt = StExt_ApplyPercentToValue(infusion.ExtraPointProt, power);
	infusion.ExtraProtAllMult = StExt_ApplyPercentToValue(infusion.ExtraProtAllMult, power);
	
	return power;
};

func int StExt_Npc_CorruptInfusion_Ability(var c_npc slf, var int ability)
{
	if (rx_getchance(75)) { return ability; };
	if ((ability <= 0) && rx_getchance(15))	{ return StExt_GetRandomAbility(slf); }
	else if (rx_getchance(10)) { return StExt_GetRandomAbility(slf); };
	return ability;
};

func int StExt_Npc_CorruptInfusion_Stat(var int stat, var int mult)
{
	var int mod;
	if (rx_getchance(75)) { return stat; };
	
	mod = (hlp_random(10) + 1) * (hlp_random(mult) + 1);
	if ((stat > 0) && rx_getchance(15)) { stat += mod; }
	else if (rx_getchance(10)) { stat += mod; };
	return stat;
};

func void StExt_Npc_CorruptInfusion(var c_npc slf, var C_MagicInfusionData infusion)
{
	StExt_PrintDebug("StExt_Npc_CorruptInfusion(...)", "corrupt infusion...", slf, StExt_NullNpc);
	
	// Attribute mods
	infusion.ExtraHp = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraHp, 25);
	infusion.ExtraEs = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraEs, 25);
	infusion.ExtraStr = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraStr, 10);
	infusion.ExtraAgi = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraAgi, 10);
	infusion.ExtraHpMult = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraHpMult, 1);
	infusion.ExtraEsMult = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraEsMult, 1);
	infusion.ExtraStrMult = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraStrMult, 1);
	infusion.ExtraAgiMult = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraAgiMult, 1);
	// Damage mods
	infusion.ExtraBluntDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraBluntDam, 10);
	infusion.ExtraEdgeDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraEdgeDam, 10);
	infusion.ExtraFireDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraFireDam, 10);
	infusion.ExtraFlyDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraFlyDam, 10);
	infusion.ExtraMagicDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraMagicDam, 10);
	infusion.ExtraPointDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraPointDam, 10);
	infusion.ExtraPoisonDam = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraPoisonDam, 10);
	infusion.ExtraHitchances = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraHitchances, 5);
	// Protection mods
	infusion.ExtraDodgeChance = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraDodgeChance, 1);
	infusion.ExtraBluntProt = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraBluntProt, 3);
	infusion.ExtraEdgeProt = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraEdgeProt, 3);
	infusion.ExtraFireProt = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraFireProt, 3);
	infusion.ExtraFlyProt = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraFlyProt, 3);
	infusion.ExtraMagicProt = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraMagicProt, 3);
	infusion.ExtraPointProt = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraPointProt, 3);
	infusion.ExtraProtAllMult = StExt_Npc_CorruptInfusion_Stat(infusion.ExtraProtAllMult, 1);
	
	infusion.Abilities[0] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[0]);
	infusion.Abilities[1] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[1]);
	infusion.Abilities[2] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[2]);
	infusion.Abilities[3] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[3]);
	infusion.Abilities[4] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[4]);
	infusion.Abilities[5] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[5]);
	infusion.Abilities[6] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[6]);
	infusion.Abilities[7] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[7]);
	infusion.Abilities[8] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[8]);
	infusion.Abilities[9] = StExt_Npc_CorruptInfusion_Ability(slf, infusion.Abilities[9]);
	
	infusion.GoldBonus = StExt_Npc_CorruptInfusion_Stat(infusion.GoldBonus, 20);
	infusion.LuckBonus = StExt_Npc_CorruptInfusion_Stat(infusion.LuckBonus, 3);
};

func string StExt_Npc_InfuseWithMagic_GetEnchantEffect() {
	return StExt_Array_GetString("StExt_MagicInfusion_VisualEffects", hlp_random(StExt_MagicInfusion_VisualEffectsMax));
};

func void StExt_Npc_ApplyInfusionConfigs(var c_npc slf)
{
	var int maxEs;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_ApplyInfusionConfigs(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	slf.attribute[atr_hitpoints_max] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_hitpoints_max], StExt_Config_Npc_InfusionHpMult, 10);
    slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];	
	slf.attribute[atr_strength] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_strength], StExt_Config_Npc_InfusionStatMult, 5);
	slf.attribute[atr_dexterity] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_dexterity], StExt_Config_Npc_InfusionStatMult, 5);
	
	maxEs = StExt_Npc_GetMaxEs(slf);
	if (maxEs > 0)
	{
		maxEs = StExt_GetPercentFromValue(maxEs, StExt_Config_Npc_InfusionEsMult);
		StExt_Npc_SetMaxEs(slf, maxEs);
	};	

	slf.protection[prot_blunt] = StExt_SetValueIfPositive(slf.protection[prot_blunt], StExt_GetPercentFromValue(slf.protection[prot_blunt], StExt_Config_Npc_InfusionProtMult));
	slf.protection[prot_edge] = StExt_SetValueIfPositive(slf.protection[prot_edge], StExt_GetPercentFromValue(slf.protection[prot_edge], StExt_Config_Npc_InfusionProtMult));
	slf.protection[prot_fire] = StExt_SetValueIfPositive(slf.protection[prot_fire], StExt_GetPercentFromValue(slf.protection[prot_fire], StExt_Config_Npc_InfusionProtMult));
	slf.protection[prot_fly] = StExt_SetValueIfPositive(slf.protection[prot_fly], StExt_GetPercentFromValue(slf.protection[prot_fly], StExt_Config_Npc_InfusionProtMult));
	slf.protection[prot_magic] = StExt_SetValueIfPositive(slf.protection[prot_magic], StExt_GetPercentFromValue(slf.protection[prot_magic], StExt_Config_Npc_InfusionProtMult));
	slf.protection[prot_point] = StExt_SetValueIfPositive(slf.protection[prot_point], StExt_GetPercentFromValue(slf.protection[prot_point], StExt_Config_Npc_InfusionProtMult));
	
	slf.damage[dam_index_blunt] = StExt_GetPercentFromValue(slf.damage[dam_index_blunt], StExt_Config_Npc_InfusionDamMult);
	slf.damage[dam_index_edge] = StExt_GetPercentFromValue(slf.damage[dam_index_edge], StExt_Config_Npc_InfusionDamMult);
	slf.damage[dam_index_point] = StExt_GetPercentFromValue(slf.damage[dam_index_point], StExt_Config_Npc_InfusionDamMult);
	slf.damage[dam_index_fire] = StExt_GetPercentFromValue(slf.damage[dam_index_fire], StExt_Config_Npc_InfusionDamMult);
	slf.damage[dam_index_fly] = StExt_GetPercentFromValue(slf.damage[dam_index_fly], StExt_Config_Npc_InfusionDamMult);
	slf.damage[dam_index_magic] = StExt_GetPercentFromValue(slf.damage[dam_index_magic], StExt_Config_Npc_InfusionDamMult);
	StExt_Npc_CheckStats(slf);
};

// Make npc special...
func void StExt_Npc_InfuseWithMagic(var c_npc slf)
{
	var int chance;
	var int tier;

	// Zakon bosses (99710-99725) are NOT infusable: they have their own move
	// kits + tuned HP now; a random infusion on top made a 600k sponge.
	if ((slf.id >= 99710) && (slf.id <= 99725)) { return; };
	var int protBlunt;
	var int protEdge;
	var int protFire;
	var int protFly;
	var int protMagic;
	var int protPoint;
	var int es;
	var int addDam;
	var int power;	
	var int hpBonus;
	var int statsBonus;
	var int protBonus;
	var int levelBonus;
	var int esBonus;
	var int damageBonus;
	var int speedBonus;
	var int corrupionChance;
	var C_MagicInfusionData infusion;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	StExt_CheckUid(slf);
	if (!StExt_Config_Npc_EnableMagicInfusion) { return; };
	if (hero.level < StExt_Config_Npc_MagicInfusion_LevelThreshold) { return; };	
	if (!StExt_Npc_IsValidForMagicInfusion(slf)) { return; };
	if (rx_isboss(slf) && !StExt_Config_Npc_MagicInfusion_AllowBosses) { return; };
	if (c_npcishuman(slf) && !StExt_Config_Npc_MagicInfusion_AllowHumans) { return; };
	
	StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "try to infuse...", slf, StExt_NullNpc);	
	chance = StExt_Config_Npc_MagicInfusion_Chance;
	if (StExt_Config_Diff_EnableKapitel) { chance += StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance * (kapitel - 1); };
	if (StExt_Config_Diff_EnableLevel) { chance += StExt_Config_Diff_Level_MagicInfusionChance * hero.level; };	
	if (c_npcishuman(slf)) { chance += StExt_Config_Npc_MagicInfusion_HumansExtraChance; };
	if (rx_isboss(slf)) { chance += StExt_Config_Npc_MagicInfusion_BossesExtraChance; };
	
	if (StExt_Chance(chance))
	{
		tier = StExt_GetMagicInfusionTier();
		if (tier <= 0)
		{
			StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "infusion tier is zero!", slf, StExt_NullNpc);
			return;
		};
		infusion = StExt_InfuseNpcWithMagic(slf, tier); 	// Call infusion generator... Abilities and id's sets inside engine!
		if (Hlp_IsNull(infusion))
		{
			StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "infusion instance is null!", slf, StExt_NullNpc);
			return;
		};
		
		StExt_PrintDebugStack("StExt_Npc_InfuseWithMagic(var c_npc slf) -> apply infusion...");
		power = StExt_ApplyInfusionPower(infusion, tier);
		if (power <= StExt_Null)
		{
			StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "infusion power is null!", slf, StExt_NullNpc);
			return;
		};
		
		corrupionChance = StExt_Config_Npc_MagicInfusion_CorruptionChance;
		corrupionChance += StExt_IfInt(StExt_Config_Diff_EnableKapitel, StExt_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance * (kapitel - 1), 0);	
		corrupionChance += StExt_IfInt(StExt_Config_Diff_EnableLevel, StExt_Config_Diff_Level_CorruptionChance * hero.level, 0);
		if (StExt_Chance(corrupionChance))
		{
			StExt_Npc_CorruptInfusion(slf, infusion);
			StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Corrupted, true);
		};
		
		hpBonus = power;
		esBonus = StExt_GetPercentFromValue(power, 30);
		statsBonus = StExt_GetPercentFromValue(power, 30);
		protBonus = StExt_GetPercentFromValue(power, 15);
		levelBonus = StExt_GetPercentFromValue(power, 25);
		damageBonus = StExt_GetPercentFromValue(power, 15);
		speedBonus = StExt_GetPermilleFromValue(power, 25);
		
		// Apply infusion to npc
		slf.flags = slf.flags | infusion.NpcFlags;		
		slf.level += infusion.ExtraLevel + StExt_GetPercentFromValue(slf.level, levelBonus + infusion.ExtraLevelMult);
		
		if ((infusion.Tier >= 3) && !StExt_StringIsEmpty(infusion.Effect)) { slf.effect = infusion.Effect; }
		else if ((infusion.Tier >= 3) && StExt_StringIsEmpty(infusion.Effect) && rx_getchance(50)) { slf.effect = StExt_Npc_InfuseWithMagic_GetEnchantEffect(); };
		
		StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, infusion.SpeedMod + speedBonus);		
		StExt_Npc_ChangeAivEx(slf, StExt_AiVar_GoldBonus, infusion.GoldBonus);
		StExt_Npc_ChangeAivEx(slf, StExt_AiVar_LuckBonus, infusion.LuckBonus);
		
		StExt_SetNpcVar(slf, StExt_AiVar_IsRandomized, infusion.Tier);
		StExt_SetNpcVar(slf, StExt_AiVar_Afix, infusion.AffixId);
		StExt_SetNpcVar(slf, StExt_AiVar_Prefix, infusion.PreffixId);
		StExt_SetNpcVar(slf, StExt_AiVar_Sufix, infusion.SuffixId);
		if (!c_npcishuman(slf)) { mdl_setmodelscale(slf, infusion.Size, infusion.Size, infusion.Size); };
		StExt_BuildInfusedNpcName(slf);
		
		// change health bar
		if (tier >= 5) { slf.aivar[94] == npc_epic; }
		else if (tier >= 3) { slf.aivar[94] == npc_legend; }
		else { slf.aivar[94] == npc_uncommon; };
		
		// stats
		slf.attribute[atr_hitpoints_max] = StExt_CheckIntOverflow(slf.attribute[atr_hitpoints_max], 
			slf.attribute[atr_hitpoints_max] + infusion.ExtraHp + StExt_GetPercentFromValue(slf.attribute[atr_hitpoints_max], hpBonus + infusion.ExtraHpMult));
        slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];		
		slf.attribute[atr_strength] += infusion.ExtraStr + StExt_GetPercentFromValue(slf.attribute[atr_strength], statsBonus + infusion.ExtraStrMult);
		slf.attribute[atr_dexterity] += infusion.ExtraAgi + StExt_GetPercentFromValue(slf.attribute[atr_dexterity], statsBonus + infusion.ExtraAgiMult);
		
		// protection
		protBlunt = infusion.ExtraBluntProt + StExt_GetPercentFromValue(slf.protection[prot_blunt], protBonus + infusion.ExtraProtAllMult);
		protEdge = infusion.ExtraEdgeProt + StExt_GetPercentFromValue(slf.protection[prot_edge], protBonus + infusion.ExtraProtAllMult);
		protFire = infusion.ExtraFireProt + StExt_GetPercentFromValue(slf.protection[prot_fire], protBonus + infusion.ExtraProtAllMult);
		protFly = infusion.ExtraFlyProt + StExt_GetPercentFromValue(slf.protection[prot_fly], protBonus + infusion.ExtraProtAllMult);
		protMagic = infusion.ExtraMagicProt + StExt_GetPercentFromValue(slf.protection[prot_magic], protBonus + infusion.ExtraProtAllMult);
		protPoint = infusion.ExtraPointProt + StExt_GetPercentFromValue(slf.protection[prot_point], protBonus + infusion.ExtraProtAllMult);
		slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], protBlunt);
		slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], protEdge);
		slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], protFire);
		slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], protFly);
		slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], protMagic);
		slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], protPoint);
		
		// es and dodge
		StExt_Npc_ChangeDodgeChance(slf, infusion.ExtraDodgeChance);
		es = infusion.ExtraEs + StExt_GetPercentFromValue(StExt_Npc_GetMaxEs(slf), esBonus + infusion.ExtraEsMult);
		StExt_Npc_ChangeMaxEs(slf, es);
		StExt_Npc_ChangeEs(slf, es);
		if (StExt_Npc_GetMaxEs(slf) > 100) { StExt_Npc_ChangeAivEx(slf, StExt_AiVar_EsReg, 1 + hlp_random(tier * 2) + tier); };
		
		// resists
		StExt_Npc_ChangePoisionResist(slf, infusion.ResistPois);	
		StExt_Npc_ChangeEdgeResist(slf, infusion.ResistEdge);
		StExt_Npc_ChangeFlyResist(slf, infusion.ResistFly);
		StExt_Npc_ChangeFireResist(slf, infusion.ResistFire);
		StExt_Npc_ChangeMagicResist(slf, infusion.ResistMagic);
		StExt_Npc_ChangePointResist(slf, infusion.ResistPoint);
		StExt_Npc_ChangeBluntResist(slf, infusion.ResistBlunt);	
		
		// damage
		addDam = 5 + hlp_random(25) + StExt_ValidateValueRange(hlp_random(slf.level), 5, 100);
		addDam = StExt_ApplyPercentToValue(addDam, damageBonus);
		slf.damage[dam_index_blunt] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_blunt], addDam);
		slf.damage[dam_index_edge] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_edge], addDam);
		slf.damage[dam_index_point] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_point], addDam);
		slf.damage[dam_index_fire] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fire], addDam);
		slf.damage[dam_index_fly] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fly], addDam);
		slf.damage[dam_index_magic] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_magic], addDam);
		
		// extra damage
		StExt_Npc_ChangeBluntDamage(slf, infusion.ExtraBluntDam + StExt_ApplyPercentToValue(infusion.ExtraBluntDam, damageBonus));
		StExt_Npc_ChangeEdgeDamage(slf, infusion.ExtraEdgeDam + StExt_ApplyPercentToValue(infusion.ExtraEdgeDam, damageBonus));
		StExt_Npc_ChangeFireDamage(slf, infusion.ExtraFireDam + StExt_ApplyPercentToValue(infusion.ExtraFireDam, damageBonus));
		StExt_Npc_ChangeFlyDamage(slf, infusion.ExtraFlyDam + StExt_ApplyPercentToValue(infusion.ExtraFlyDam, damageBonus));
		StExt_Npc_ChangeMagicDamage(slf, infusion.ExtraMagicDam + StExt_ApplyPercentToValue(infusion.ExtraMagicDam, damageBonus));
		StExt_Npc_ChangePointDamage(slf, infusion.ExtraPointDam + StExt_ApplyPercentToValue(infusion.ExtraPointDam, damageBonus));
		StExt_Npc_ChangePoisonDamage(slf, infusion.ExtraPoisonDam + StExt_ApplyPercentToValue(infusion.ExtraPoisonDam, damageBonus));
		
		// hitchances
		slf.hitchance[0] += infusion.ExtraHitchances;
		slf.hitchance[1] += infusion.ExtraHitchances;
		slf.hitchance[2] += infusion.ExtraHitchances;
		slf.hitchance[3] += infusion.ExtraHitchances;
		slf.hitchance[4] += infusion.ExtraHitchances;
		
		// abilities
		StExt_Npc_AddAbility(slf, infusion.Abilities[0]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[1]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[2]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[3]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[4]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[5]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[6]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[7]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[8]);
		StExt_Npc_AddAbility(slf, infusion.Abilities[9]);
		
		if (tier >= 4) { StExt_Npc_AddAbility(slf, StExt_GetRandomAbility(slf)); };
		if (tier >= 5) { StExt_Npc_AddAbility(slf, StExt_GetRandomAbility(slf)); };
		StExt_Npc_ApplyInfusionConfigs(slf);		
		infusion = StExt_DisposeNpcInfusion(infusion);
	}
	else { StExt_PrintDebug("StExt_Npc_InfuseWithMagic(var c_npc slf)", "skip infusion.", slf, StExt_NullNpc); };
};
