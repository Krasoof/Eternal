// Apply level bonus to Npc if option
// require enabled 'StExt_Config_Npc_EnableLevelBonus'
func void StExt_Npc_ApplyLevelBonus(var c_npc slf)
{
	var int level;
	var int protBonus;
	var int damBonus;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_ApplyLevelBonus()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (!StExt_Config_Npc_EnableLevelBonus) { return; };
	if (!StExt_Npc_IsValidForStatRandomization(slf)) { return; };
	
	StExt_PrintDebugStack(concatstrings("StExt_Npc_ApplyLevelBonus(var c_npc slf) - ", slf.name));	
	StExt_Npc_CheckStats(slf);
	level = slf.level;
	
	if (level > 0)
	{		
		protBonus = level * StExt_Config_Npc_LevelBonus_Protection;
		damBonus = level * StExt_Config_Npc_LevelBonus_Damage;
		
		slf.attribute[atr_hitpoints_max] = StExt_CheckIntOverflow(slf.attribute[atr_hitpoints_max], slf.attribute[atr_hitpoints_max] + (level * StExt_Config_Npc_LevelBonus_Hp));
        slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];		
		slf.attribute[atr_strength] += level * StExt_Config_Npc_LevelBonus_Stats;
        slf.attribute[atr_dexterity] += level * StExt_Config_Npc_LevelBonus_Stats;		
	
		slf.protection[prot_blunt] = StExt_ChangeValueIfPositive(slf.protection[prot_blunt], protBonus);
		slf.protection[prot_edge] = StExt_ChangeValueIfPositive(slf.protection[prot_edge], protBonus);
		slf.protection[prot_fire] = StExt_ChangeValueIfPositive(slf.protection[prot_fire], protBonus);
		slf.protection[prot_fly] = StExt_ChangeValueIfPositive(slf.protection[prot_fly], protBonus);
		slf.protection[prot_magic] = StExt_ChangeValueIfPositive(slf.protection[prot_magic], protBonus);
		slf.protection[prot_point] = StExt_ChangeValueIfPositive(slf.protection[prot_point], protBonus);
	
		slf.damage[dam_index_blunt] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_blunt], damBonus);
		slf.damage[dam_index_edge] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_edge], damBonus);
		slf.damage[dam_index_point] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_point], damBonus);
		slf.damage[dam_index_fire] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fire], damBonus);
		slf.damage[dam_index_fly] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_fly], damBonus);
		slf.damage[dam_index_magic] = StExt_ChangeValueIfGreaterThanZero(slf.damage[dam_index_magic], damBonus);
	};
};

// Randomize Npc stats in selected range
// require 'StExt_Config_Npc_EnableStatsRandomization'
func void StExt_Npc_RandomizeStats(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_RandomizeStats()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (!StExt_Config_Npc_EnableStatsRandomization) { return; };
	if (!StExt_Npc_IsValidForStatRandomization(slf)) { return; };
	StExt_PrintDebugStack(concatstrings("StExt_Npc_RandomizeStats(var c_npc slf) - ", slf.name));
	StExt_Npc_CheckStats(slf);
	
	slf.attribute[atr_hitpoints_max] = StExt_CheckIntOverflow(slf.attribute[atr_hitpoints_max], 
		StExt_ApplyRandomRangeMult(slf.attribute[atr_hitpoints_max], StExt_Config_Npc_StatsRandomization_Hp));
	slf.attribute = slf.attribute[atr_hitpoints];	
	slf.attribute[atr_strength] = StExt_ApplyRandomRangeMult(slf.attribute[atr_strength], StExt_Config_Npc_StatsRandomization_Stats);
    slf.attribute[atr_dexterity] = StExt_ApplyRandomRangeMult(slf.attribute[atr_dexterity], StExt_Config_Npc_StatsRandomization_Stats);
	
	slf.protection[prot_blunt] = StExt_ApplyRandomRangeMultIfNotNegative(slf.protection[prot_blunt], StExt_Config_Npc_StatsRandomization_Protection);
	slf.protection[prot_edge] = StExt_ApplyRandomRangeMultIfNotNegative(slf.protection[prot_edge], StExt_Config_Npc_StatsRandomization_Protection);
	slf.protection[prot_fire] = StExt_ApplyRandomRangeMultIfNotNegative(slf.protection[prot_fire], StExt_Config_Npc_StatsRandomization_Protection);
	slf.protection[prot_fly] = StExt_ApplyRandomRangeMultIfNotNegative(slf.protection[prot_fly], StExt_Config_Npc_StatsRandomization_Protection);
	slf.protection[prot_magic] = StExt_ApplyRandomRangeMultIfNotNegative(slf.protection[prot_magic], StExt_Config_Npc_StatsRandomization_Protection);
	slf.protection[prot_point] = StExt_ApplyRandomRangeMultIfNotNegative(slf.protection[prot_point], StExt_Config_Npc_StatsRandomization_Protection);
	
	slf.damage[dam_index_blunt] = StExt_ApplyRandomRangeMult(slf.damage[dam_index_blunt], StExt_Config_Npc_StatsRandomization_Damage);
	slf.damage[dam_index_edge] = StExt_ApplyRandomRangeMult(slf.damage[dam_index_edge], StExt_Config_Npc_StatsRandomization_Damage);
	slf.damage[dam_index_point] = StExt_ApplyRandomRangeMult(slf.damage[dam_index_point], StExt_Config_Npc_StatsRandomization_Damage);
	slf.damage[dam_index_fire] = StExt_ApplyRandomRangeMult(slf.damage[dam_index_fire], StExt_Config_Npc_StatsRandomization_Damage);
	slf.damage[dam_index_fly] = StExt_ApplyRandomRangeMult(slf.damage[dam_index_fly], StExt_Config_Npc_StatsRandomization_Damage);
	slf.damage[dam_index_magic] = StExt_ApplyRandomRangeMult(slf.damage[dam_index_magic], StExt_Config_Npc_StatsRandomization_Damage);
};

// Give scrolls from battle scrolls list to npc
func void StExt_Npc_GiveRandomScrolls_Loop(var int index, var string value)
{
	var int scroll;
	var int chance;
	var int count;
	chance = 5;
	count = 1 + hlp_random(5) + StExt_Npc_GiveRandomScrolls_LevelBonus;
	if(StExt_IsNpcNovise(StExt_Npc_GiveRandomScrolls_Npc)) { chance += 5; count = (count * 2) + hlp_random(5); };
	
	if (!hlp_isvalidnpc(StExt_Npc_GiveRandomScrolls_Npc)) { return; };
	if (rx_getchance(chance))
	{
		scroll = StExt_GetInstanceIdByName(value);
		createinvitems(StExt_Npc_GiveRandomScrolls_Npc, scroll, count);
	};
};
var c_npc StExt_Npc_GiveRandomScrolls_Npc;
var int StExt_Npc_GiveRandomScrolls_LevelBonus;
func void StExt_Npc_GiveRandomScrolls(var c_npc slf)
{
	StExt_PrintDebug("StExt_Npc_GiveRandomScrolls(var c_npc slf)", "Create scrolls...", slf, other);
	StExt_Npc_GiveRandomScrolls_Npc = StExt_GetNpc(slf);
	if (!hlp_isvalidnpc(StExt_Npc_GiveRandomScrolls_Npc)) { StExt_PrintDebug("StExt_Npc_GiveRandomScrolls(var c_npc slf)", "Insyance is Null!", StExt_Npc_GiveRandomScrolls_Npc, other); return; };
	
	StExt_Npc_GiveRandomScrolls_LevelBonus = (slf.level + 1) / 10;
	createinvitems(StExt_Npc_GiveRandomScrolls_Npc, itsc_firebolt, 1 + StExt_Npc_GiveRandomScrolls_LevelBonus);
	StExt_Array_ForEachStr("StExt_BattleScrolls", StExt_Npc_GiveRandomScrolls_Loop);
	StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_ScrollUser, true);
};

func void StExt_Npc_RandomizeEquipment_Helm(var c_npc slf)
{
	var c_item equippedHelm;
	var c_item equippedArmor;
	var int helmId;
	var string helmArray;
	var string helmName;
	var int helmArrayMax;
	var int rand;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_RandomizeEquipment_Helm(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (!StExt_IsNpcValidForRandEquipment(slf)) { return; };
	if ((slf.aivar[17] == female) && rx_getchance(75)) { return; };
	
	equippedHelm = hlp_getslotitem(slf, "ZS_HELMET");
	if (hlp_isvaliditem(equippedHelm) || hlp_getinstanceid(equippedHelm) != StExt_Null) { return; };
	
	equippedArmor = npc_getequippedarmor(slf);
	if (hlp_isvaliditem(equippedArmor) && (hlp_isitem(equippedArmor, itar_pal_m_npc) || 
		hlp_isitem(equippedArmor, itar_pal_m_v1_npc) || hlp_isitem(equippedArmor, itar_pal_h_npc) || hlp_isitem(equippedArmor, itar_pal_h_v1_npc) || 
		hlp_isitem(equippedArmor, itar_pal_h_v2_npc) || hlp_isitem(equippedArmor, itar_djg_m_npc) || hlp_isitem(equippedArmor, itar_djg_h_npc) || 
		hlp_isitem(equippedArmor, itar_kdf_h_npc) || hlp_isitem(equippedArmor, itar_kdw_h_npc) || hlp_isitem(equippedArmor, itar_dmt_h_npc) ||		
		hlp_isitem(equippedArmor, itar_kdm_h_npc) || hlp_isitem(equippedArmor, itar_huntarmor_npc) || hlp_isitem(equippedArmor, itar_huntarmor_m_npc) ||		
		hlp_isitem(equippedArmor, itar_huntarmor_h_npc) || hlp_isitem(equippedArmor, itar_dementor) || hlp_isitem(equippedArmor, itar_oberdementor))) { return; };
		
	if (StExt_IsNpcMage(slf))
	{
		helmArray = "StExt_LootTable_NpcMageHelms";
		helmArrayMax = StExt_LootTable_NpcMageHelms_Max;
	}
	else if (slf.guild == gil_pal || slf.guild == gil_mil || slf.guild == gil_djg || slf.guild == gil_sld || slf.guild == gil_bdt || slf.guild == gil_pir || slf.guild == gil_tpl)
	{
		helmArray = "StExt_LootTable_NpcWarriorHelms";
		helmArrayMax = StExt_LootTable_NpcWarriorHelms_Max;
	}
	else if (slf.guild == gil_vlk || slf.guild == gil_bau || slf.guild == gil_sek || slf.guild == gil_ndw || slf.guild == gil_ndm || slf.guild == gil_nov)
	{
		helmArray = "StExt_LootTable_NpcMiskHelms";
		helmArrayMax = StExt_LootTable_NpcMiskHelms_Max;
	}
	else { return; };
	
	rand = hlp_random(helmArrayMax);
	rand = StExt_ValidateValueRange(rand, 0, helmArrayMax - 1);
	helmName = StExt_Array_GetString(helmArray, rand);
	helmId = StExt_GetInstanceIdByName(helmName);
	
	if (helmId == StExt_Null) 
	{
		StExt_PrintDebug("StExt_Npc_RandomizeEquipment_Helm(...)", concatstrings(helmName, " instance is null!"), slf, StExt_NullNpc);
		return; 
	};

	if (npc_hasitems(slf, helmId) == 0) { createinvitem(slf, helmId); };
	ai_equiparmor(slf, helmId);
};

// Randomize npc equipment
func void StExt_Npc_RandomizeEquipment(var c_npc slf)
{
	var int weapPower;	
	var int meleeWeap;
	var int rangeWeap;
	var int shield;
	var int helm;
	var int munitionCount;
	var int meleeWeaponChance;
	var int rangeWeaponChance;
	var int shieldChance;
	var int helmChance;
	var int magicChance;
	var int healChance;
	var int isChampion;
	var int isGenerated;
	
	if(!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_RandomizeEquipment(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if(!StExt_IsNpcValidForRandEquipment(slf)) { return; };
	StExt_PrintDebugStack(concatstrings("StExt_Npc_RandomizeEquipment(...) - ", slf.name));
	
	isGenerated = false;
	meleeWeap = StExt_Null;
	rangeWeap = StExt_Null;
	shield = StExt_Null;
	isChampion = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	
	weapPower = 5 + slf.level + hlp_random(10 + slf.level) + (kapitel * 10) + hlp_random(kapitel * 15);
	munitionCount = slf.level + 15 + hlp_random(30 + slf.level);
	magicChance = StExt_Config_Npc_RandomScroll_Chance + (StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance * (kapitel - 1));
	healChance = StExt_Config_Npc_HealingScroll_Chance + (StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance * (kapitel - 1));
	meleeWeaponChance = StExt_Config_Npc_RandomMeleeWeapon_Chance + (StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance * (kapitel - 1));
	rangeWeaponChance = StExt_Config_Npc_RandomRangeWeapon_Chance + (StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance * (kapitel - 1));
	shieldChance = StExt_Config_Npc_RandomShield_Chance + (StExt_Config_Diff_Kapitel_Npc_RandomShield_Chance * (kapitel - 1));
	helmChance = StExt_Config_Npc_RandomHelm_Chance + (StExt_Config_Diff_Kapitel_Npc_RandomHelm_Chance * (kapitel - 1));
	
	if (isChampion) 
	{
		meleeWeaponChance = meleeWeaponChance * 2;
		rangeWeaponChance = rangeWeaponChance * 2;
		healChance = healChance * 2;
		magicChance = magicChance * 2;
		if (StExt_Config_Npc_MagicInfusedAlwaysHasRandomEquipment) 
		{
			meleeWeaponChance += 1000;
			rangeWeaponChance += 1000;
		};
	};
	if (StExt_IsNpcMage(slf) || StExt_IsNpcNovise(slf)) { magicChance = magicChance * 2; };
	
	// Melee weapon generate
	if (StExt_Chance(meleeWeaponChance))
	{
		if (StExt_IsNpcMage(slf) || StExt_IsNpcNovise(slf)) { meleeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_MagicWeapon"), weapPower); }
		else if (rx_getchance(50)) {
			meleeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_2hWeapon"), weapPower);
		}
		else
		{
			meleeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), weapPower);
			if (rx_getchance(shieldChance))
			{ 
				shield = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Shield"), weapPower);
				rx_setnpcvar(slf, aivrx_npc_atr_shield, 150);
			};
		};
		isGenerated = true;
	};

	// Range weapon generate
	if (StExt_Chance(rangeWeaponChance) && (!StExt_IsNpcMage(slf) && !StExt_IsNpcNovise(slf)))
	{
		if (rx_getchance(50)) 
		{ 
			rangeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_BowWeapon"), weapPower);
			createinvitems(slf, itrw_arrow, munitionCount);
		}
		else
		{
			rangeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_CBowWeapon"), weapPower);
			createinvitems(slf, itrw_bolt, munitionCount);
		};
		isGenerated = true;
	};
	
	if(isGenerated)
	{
		ai_removeweapon(slf);
		ai_unequipweapons(slf);

		if (meleeWeap != StExt_Null) { npc_equipitem(slf, meleeWeap); };
		if (shield != StExt_Null) { npc_equipitem(slf, shield); };
		if (rangeWeap != StExt_Null) { npc_equipitem(slf, rangeWeap); };
		
        ai_equipbestmeleeweapon(slf);
		if (!StExt_IsNpcMage(slf)) { ai_equipbestrangedweapon(slf); };
	};
	
	// Handle scrolls
	if (StExt_Chance(healChance))
	{
		if(rx_getchance(1)) { createinvitems(slf, itsc_palfullheal, 1); }
		else if(rx_getchance(2)) { createinvitems(slf, itsc_fullheal, 1); }
		else if(rx_getchance(5)) { createinvitems(slf, itsc_palmediumheal, 1 + hlp_random(2)); }
		else if(rx_getchance(10)) { createinvitems(slf, itsc_mediumheal, 1 + hlp_random(2)); }
		else if(rx_getchance(15)) { createinvitems(slf, itsc_pallightheal, 1 + hlp_random(3)); }
		else if(rx_getchance(25)) { createinvitems(slf, itsc_lightheal, 1 + hlp_random(3)); }
		else { createinvitems(slf, itsc_lightheal, 1); };
		StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_ScrollUser, true);
	};	
	if (StExt_Chance(magicChance) && (!rx_isnpc(slf, vlk_449_lares))) { StExt_Npc_GiveRandomScrolls(slf); };
	
	// Handle helm
	if (StExt_Chance(helmChance)) { StExt_Npc_RandomizeEquipment_Helm(slf);	};
};

func void StExt_SetNpcDuplicated()
{
	if (!hlp_isvalidnpc(StExt_Self))
	{
		StExt_PrintDebug("StExt_SetNpcDuplicated(var int pSlf)", "Instance is null!", StExt_Self, StExt_Self);
		return;
	};
	
	if (c_npcishuman(StExt_Self) && rx_isnpc(StExt_Self, stext_bdt_random)) { StExt_InitializeRandomBandit(StExt_Self); };
	
	npc_setattitude(StExt_Self, StExt_Npc_Duplicate_ParentAttitude);
	npc_settempattitude(StExt_Self, StExt_Npc_Duplicate_ParentTempAttitude);
	StExt_Npc_SetExtraFlag(StExt_Self, StExt_NpcFlag_Duplicated, true);
};

var int StExt_Npc_Duplicate_ParentAttitude;
var int StExt_Npc_Duplicate_ParentTempAttitude;

// Duplicate npc if option enabled and chances are correct.
// require enabled 'StExt_Config_Npc_EnableDuplication'
func void StExt_Npc_Duplicate(var c_npc slf)
{
	var int npcCount;
	var int npcCountBonus;
	var int chance;
	var string wayPoint;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_Duplicate(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (!StExt_Config_Npc_EnableDuplication) { return; };
	if (!StExt_Npc_IsValidForDuplication(slf)) { return; };
	if (!infomanager_hasfinished() || !rx_notindialog(hero)) { return; };
	if (hero.level < StExt_Config_Npc_Duplication_LevelThreshold) { return; };

	if (rx_isboss(slf) && StExt_Config_Npc_Duplication_AllowBosses) { }
	else if (rx_isboss(slf)) { return; };
	
	if (c_npcishuman(slf))
	{
		if ((slf.npctype == npctype_main) || (slf.npctype == npctype_friend) || (slf.npctype == npctype_ocmain) || (slf.npctype == npctype_bl_main) || (slf.npctype == npctype_xbsmain)) { return; }
		else if (((slf.guild == gil_bdt) || (slf.guild == gil_dmt)) && StExt_Config_Npc_Duplication_AllowHumansBandits) { }
		else if (((slf.npctype == npctype_ambient) || (slf.npctype == npctype_ocambient) || (slf.npctype == npctype_bl_ambient) || 
			(slf.npctype == npctype_tal_ambient) || (slf.npctype == npctype_csp_ambient) || (slf.npctype == npctype_xbsambient) || 
			(slf.npctype == npctype_palmora)) && StExt_Config_Npc_Duplication_AllowHumans) { }
		else { return; };
	};
		
	StExt_PrintDebugStack("StExt_Npc_Duplicate(var c_npc slf)");	
	StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Original, true);
	
	chance = StExt_Config_Npc_Duplication_Chance;
	chance += StExt_IfInt(StExt_Config_Diff_EnableKapitel, StExt_Config_Diff_Kapitel_Npc_Duplication_Chance * (kapitel - 1), 0);	
	chance += StExt_IfInt(StExt_Config_Diff_EnableLevel, StExt_Config_Diff_Level_CorruptionChance * hero.level, 0);
	if (!StExt_Chance(chance))
	{
		StExt_PrintDebugStack("StExt_Npc_Duplicate(var c_npc slf) -> Skip.");		
		return;
	};
	
	npcCountBonus = 0;
	npcCountBonus += StExt_IfInt(StExt_Config_Diff_EnableKapitel, StExt_Config_Diff_Kapitel_Npc_Duplication_Count * (kapitel - 1), 0);
	npcCount = StExt_GetRandomRange(StExt_Config_Npc_Duplication_CountMin, StExt_Config_Npc_Duplication_CountMax + npcCountBonus);
	if (npcCount <= 0) { npcCount = 1; };
	
	wayPoint = slf.wp;
	wayPoint = StExt_CheckSpawnWp(wayPoint);
	StExt_Npc_Duplicate_ParentAttitude = npc_getattitude(slf, hero);
    StExt_Npc_Duplicate_ParentTempAttitude = npc_getpermattitude(slf, hero);
	rx_saveparservars();
	StExt_SpawnNpcWithFunc(hlp_getinstanceid(slf), npcCount, wayPoint, "StExt_SetNpcDuplicated");
	rx_restoreparservars(); 
};

func int StExt_WorldRandomizer_GetTimerCd() 
{
	var int result;
	result = StExt_GetRandomRange(StExt_Config_WorldRandomization_MinCooldown, StExt_Config_WorldRandomization_MaxCooldown);
	if (result < 60)
	{
		StExt_PrintDebug("StExt_WorldRandomizer_GetTimerCd()", "generated time is less than 1 min!", self, other);
		result = StExt_GetRandomRange(60, 300);
	};
	return result;
};

func int StExt_WorldRandomizer_IsForbidenWp(var c_npc slf)
{
	if(!hlp_isvalidnpc(slf))
	{
		StExt_PrintDebug("StExt_WorldRandomization_IsForbidenWp()", "slf instance is null!", slf, StExt_NullNpc);
		return true;
	};	
	return StExt_IsNpcInProhibitedPlace(slf);
};

func string StExt_WorldRandomizer_GetWaypoint()
{
	var string wp;
	wp = StExt_EmptyString;
	
	if (StExt_Config_WorldRandomizer_UseNewWpSearch)
	{
		wp = StExt_GetRandomWp();
		if (!StExt_IsValidWp(wp)) { wp = StExt_ReturnString; };
		if (StExt_IsValidWp(wp)) { return wp; };
	};
	
	if (!StExt_WorldRandomizer_IsForbidenWp(hero))
	{
		if (rx_getchance(50)) { wp = npc_getnextwp(hero); }
		else { wp = npc_getnearestwp(hero); };
	};	
	if (hlp_isvalidnpc(other) && !StExt_IsValidWp(wp))
	{
		if (!StExt_WorldRandomizer_IsForbidenWp(other) && !npc_isplayer(other))
		{
			if (rx_getchance(50)) { wp = npc_getnextwp(other); }
			else { wp = npc_getnearestwp(other); };
		};
	};	
	if (hlp_isvalidnpc(self) && !StExt_IsValidWp(wp))
	{
		if (!StExt_WorldRandomizer_IsForbidenWp(self) && !npc_isplayer(self))
		{
			if (rx_getchance(50)) { wp = npc_getnextwp(self); }
			else { wp = npc_getnearestwp(self); };
		};
	};
	// just some fallback
	if (hlp_isvalidnpc(StExt_Self) && !StExt_IsValidWp(wp))
	{
		if (!StExt_WorldRandomizer_IsForbidenWp(StExt_Self) && !npc_isplayer(StExt_Self))
		{
			if (rx_getchance(50)) { wp = npc_getnextwp(StExt_Self); }
			else { wp = npc_getnearestwp(StExt_Self); };
		};
	};
	if (hlp_isvalidnpc(StExt_Other) && !StExt_IsValidWp(wp))
	{
		if (!StExt_WorldRandomizer_IsForbidenWp(StExt_Other) && !npc_isplayer(StExt_Other))
		{
			if (rx_getchance(50)) { wp = npc_getnextwp(StExt_Other); }
			else { wp = npc_getnearestwp(StExt_Other); };
		};
	};
	if(!StExt_IsValidWp(wp)) { wp = rx_getrandompointcurrentloc(); };
	
	if(!StExt_IsValidWp(wp)) 
	{ 
		wp = StExt_EmptyString;
		StExt_PrintDebug("StExt_WorldRandomizer_GetWaypoint()", "return null wp!", self, other); 
	};
	return wp;
};

var string StExt_WorldRandomizer_RandomizeWorld_Wp;
var int StExt_WorldRandomizer_RandomizeWorld_Count;
var int StExt_WorldRandomizer_RandomizeWorld_Instance;

// Generate mob instance id
func int StExt_RandomizeWorld_GetMob()
{
	var int powerMin; powerMin = 0;
	var int powerMax; powerMax = 10;
	var int countMin; countMin = 1;
	var int countMax; countMax = 2;
	
	var int levelPowerMod; levelPowerMod = 1 + (hero.level * 3);
	var int kapitelPowerMod; kapitelPowerMod = 1 + ((kapitel - 1) * 75);
	var int dayPowerMod; dayPowerMod = 1 + (wld_getday() * 2);
	
	var int powerMinMult; powerMinMult = (kapitel * 10) + ((hero.level + 1) / 2);
	var int countMinMult; countMinMult = 10 + (kapitel * 5);
	var int countMaxMult; countMaxMult = kapitel * 25;
	var C_RandomNpcData npcData;
	
	
	StExt_WorldRandomizer_RandomizeWorld_Instance = StExt_Null;
	StExt_WorldRandomizer_RandomizeWorld_Count = 0;
	
	levelPowerMod = 1 + StExt_GetPercentFromValue(levelPowerMod, StExt_Config_WorldRandomization_Npc_SpawnPower_LevelMod);
	kapitelPowerMod = 1 + StExt_GetPercentFromValue(kapitelPowerMod, StExt_Config_WorldRandomization_Npc_SpawnPower_KapitelMod);
	dayPowerMod = 1 + StExt_GetPercentFromValue(dayPowerMod, StExt_Config_WorldRandomization_Npc_SpawnPower_DayMod);

	powerMax += levelPowerMod + kapitelPowerMod + dayPowerMod;
	powerMax = StExt_GetPercentFromValue(powerMax, StExt_Config_WorldRandomization_Npc_SpawnPowerMod);
	powerMax = StExt_ValidateValueRange(powerMax, 15, StExt_WorldRandomizer_NpcMaxPowerCap);
	
	powerMinMult = StExt_ValidateValueRange(powerMinMult, 10, 50);
	powerMin = StExt_GetPercentFromValue(powerMax, powerMinMult);
	powerMin = StExt_ValidateValueRange(powerMin, 0, powerMax - 1);
	if (powerMin > StExt_WorldRandomizer_NpcMinPowerCap) { powerMin = StExt_WorldRandomizer_NpcMinPowerCap; };

	npcData = StExt_GetRandomNpcData(powerMin, powerMax);
	if (Hlp_IsNull(npcData))
	{
		StExt_PrintDebug("StExt_RandomizeWorld_GetMob()", concatstrings("Npc data not found! Power: ", inttostring(powerMax)), hero, other);
		return false;
	};
	
	if ((npcData.Power > 0) && (npcData.Power < 1000)) {
		countMaxMult += StExt_GetPercentFromValue(1000 - npcData.Power, 5 + (kapitel * 2));
	};
	countMax = npcData.Count + hlp_random(1 + npcData.Count) + StExt_GetPercentFromValue(npcData.Count, countMaxMult);
	if (countMax < 1) { countMax = 1; };
	
	countMin = StExt_GetPercentFromValue(countMax, countMinMult);	
	countMin = StExt_ValidateValueRange(countMin, 1, countMax);
	
	StExt_WorldRandomizer_RandomizeWorld_Instance = StExt_GetInstanceIdByName(npcData.InstanceName);
	StExt_WorldRandomizer_RandomizeWorld_Count = StExt_GetPercentFromValue(StExt_GetRandomRange(countMin, countMax + 1), StExt_Config_WorldRandomization_Npc_SpawnCountMod);
	StExt_WorldRandomizer_RandomizeWorld_Count = StExt_ValidateValueRange(StExt_WorldRandomizer_RandomizeWorld_Count, 1, 32);
	
	return true;
};

// Generate item instance id
func int StExt_RandomizeWorld_GetItem()
{
	var int powerMin;
	var int powerMax;
	var int power;
	var int rnd;
	var string result;
	
	rnd = hlp_random(100);
	powerMax = 5 + hero.level + (kapitel * 10);
	powerMin = 1 + (kapitel - 1) * 10;
	power = StExt_GetRandomRange(powerMin, powerMax);
	power = StExt_GetPercentFromValue(power, StExt_Config_WorldRandomization_Item_SpawnPowerMod);
	result = StExt_EmptyString;
	
	if (rnd > 85)
	{
		if (power >= 125) { result = StExt_Array_GetString("StExt_LootTable_Magic3", hlp_random(StExt_LootTable_Magic3_Max)); }
		else if (power >= 75) { result = StExt_Array_GetString("StExt_LootTable_Magic2", hlp_random(StExt_LootTable_Magic2_Max)); }
		else { result = StExt_Array_GetString("StExt_LootTable_Magic1", hlp_random(StExt_LootTable_Magic1_Max)); };
	}
	else if (rnd > 65)
	{
		if (power >= 100) { result = StExt_Array_GetString("StExt_LootTable_Alchemy3", hlp_random(StExt_LootTable_Alchemy3_Max)); }
		else if (power >= 50) { result = StExt_Array_GetString("StExt_LootTable_Alchemy2", hlp_random(StExt_LootTable_Alchemy2_Max)); }
		else { result = StExt_Array_GetString("StExt_LootTable_Alchemy1", hlp_random(StExt_LootTable_Alchemy1_Max)); };
	}
	else if (rnd > 45)
	{
		if (power >= 100) { result = StExt_Array_GetString("StExt_LootTable_Food3", hlp_random(StExt_LootTable_Food3_Max)); }
		else if (power >= 50) { result = StExt_Array_GetString("StExt_LootTable_Food2", hlp_random(StExt_LootTable_Food2_Max)); }
		else { result = StExt_Array_GetString("StExt_LootTable_Food1", hlp_random(StExt_LootTable_Food1_Max)); };
	}	
	else
	{
		if (power >= 75) { result = StExt_Array_GetString("StExt_LootTable_Misk3", hlp_random(StExt_LootTable_Misk3_Max)); }
		else if (power >= 35) { result = StExt_Array_GetString("StExt_LootTable_Misk2", hlp_random(StExt_LootTable_Misk2_Max)); }
		else 
		{ 
			if (rx_getchance(85)) { result = StExt_Array_GetString("StExt_LootTable_Misk1", hlp_random(StExt_LootTable_Misk1_Max)); }
			else { result = StExt_Array_GetString("StExt_LootTable_Munition", hlp_random(StExt_LootTable_Munition_Max)); };	
		};
	};
	return StExt_GetInstanceIdByName(result);
};

func int StExt_WorldRandomizer_RandomizeWorld_Mob_Loop(var int index)
{
	if (StExt_WorldRandomizer_RandomizeWorld_Count <= 0) { return false; };	
	rx_saveparservars();
	wld_insertnpc(StExt_WorldRandomizer_RandomizeWorld_Instance, StExt_WorldRandomizer_RandomizeWorld_Wp);
	//StExt_PrintDebug("StExt_WorldRandomizer_RandomizeWorld_Mob_Loop()", concatstrings("Insert npc with id: ", inttostring(StExt_WorldRandomizer_RandomizeWorld_Instance)), self, other);
	rx_restoreparservars();	
	return (index <= StExt_WorldRandomizer_RandomizeWorld_Count);
};
func int StExt_WorldRandomizer_RandomizeWorld_Item_Loop(var int index)
{
	if (StExt_WorldRandomizer_RandomizeWorld_Count <= 0) { return false; };
	StExt_WorldRandomizer_RandomizeWorld_Instance = StExt_RandomizeWorld_GetItem();
	//StExt_PrintDebug("StExt_WorldRandomizer_RandomizeWorld_Item_Loop()", concatstrings("Insert item with id: ", inttostring(StExt_WorldRandomizer_RandomizeWorld_Instance)), self, other);
	wld_insertitem(StExt_WorldRandomizer_RandomizeWorld_Instance, StExt_WorldRandomizer_RandomizeWorld_Wp);
	return (index <= StExt_WorldRandomizer_RandomizeWorld_Count);
};

func void StExt_WorldRandomizer_RandomizeWorld(var string wp)
{
	var int mob;
	var int count;
	
	if (StExt_GamePaused()) { return; };
	if (!StExt_IsValidWp(wp))
	{
		StExt_PrintDebug("StExt_WorldRandomizer_RandomizeWorld()", concatstrings("wp is null, empty or incorrect: ", wp), self, other);
		return;
	};
	if (!infomanager_hasfinished() || !rx_notindialog(hero)) 
	{
		StExt_PrintDebug("StExt_RandomizeWorld()", "impossible to insert items/mobs - hero seems in dialog!", self, other);
		return; 
	};
	StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld(var string wp) -> On Wp: ", wp));
	
	if (StExt_Chance(StExt_Config_WorldRandomization_Npc_SpawnChance) && StExt_Config_EnableWorldRandomization_Npc)
	{
		if (StExt_RandomizeWorld_GetMob())
		{
			StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld(var string wp) -> Insert Npc's On Wp: ", wp));
			StExt_WorldRandomizer_RandomizeWorld_Wp = wp;
			
			if (StExt_Config_WorldRandomization_Npc_EnableSpawnSound && StExt_WorldRandomizer_RandomizeWorld_Count) { snd_play("MFX_FEAR_CAST"); };
			if (StExt_WorldRandomizer_RandomizeWorld_Instance != StExt_Null) { StExt_While(StExt_WorldRandomizer_RandomizeWorld_Mob_Loop); }
			else { StExt_PrintDebug("StExt_RandomizeWorld()", "impossible to insert npc - instance is null!", self, other); };
		};
	};
	if (StExt_Chance(StExt_Config_WorldRandomization_Item_SpawnChance) && StExt_Config_EnableWorldRandomization_Items)
	{
		StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld(var string wp) -> Insert Items On Wp: ", wp));
		StExt_WorldRandomizer_RandomizeWorld_Instance = StExt_Null;
		StExt_WorldRandomizer_RandomizeWorld_Count = 1 + hlp_random(3) + hlp_random(1 + kapitel);
		StExt_WorldRandomizer_RandomizeWorld_Count = StExt_GetPercentFromValue(StExt_WorldRandomizer_RandomizeWorld_Count, StExt_Config_WorldRandomization_Item_SpawnCountMod);
		StExt_WorldRandomizer_RandomizeWorld_Count = StExt_ValidateValueRange(StExt_WorldRandomizer_RandomizeWorld_Count, 1, kapitel * 5);
		StExt_WorldRandomizer_RandomizeWorld_Wp = wp;
		
		StExt_While(StExt_WorldRandomizer_RandomizeWorld_Item_Loop);
	};
};

func void StExt_RandomizeWorld_ProcessCooldown(var int id)
{
	var int cd;
	var string wp;
	if ((id < 0) || (id >= 3))
	{
		StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld_ProcessCooldown(var int id) -> Id is incorrect: ", inttostring(id)));
		return;
	};
	
	cd = StExt_Array_GetInt("StExt_WorldRandimizer_Cooldown", id);
	wp = StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", id);
	cd -= 1;
	
	if ((cd < 6) && !StExt_IsValidWp(wp))
	{
		wp = StExt_WorldRandomizer_GetWaypoint();
		StExt_Array_SetString("StExt_WorldRandimizer_Waypoint", id, wp);
		if (!StExt_IsValidWp(wp))
		{
			cd += 60 + hlp_random(30);
			StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld_ProcessCooldown(var int id) -> Wp is null. Id: ", inttostring(id)));
		};
	};	
	StExt_Array_SetInt("StExt_WorldRandimizer_Cooldown", id, cd);
	
	/*
	StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld_ProcessCooldown(var int id) -> Id: ", inttostring(id)));
	StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld_ProcessCooldown(var int id) -> Cd: ", inttostring(cd)));
	StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld_ProcessCooldown(var int id) -> Wp: ", wp));
	*/
};


func void StExt_RandomizeWorld_ProcessTimeEvent()
{
	var string wp;
	
	if (!StExt_Config_EnableWorldRandomization_ByTimeEvents) { return; };
	if (!StExt_Config_EnableWorldRandomization_Npc && !StExt_Config_EnableWorldRandomization_Items) { return; };
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	
	wp = StExt_GetRandomWp();
	if (!StExt_IsValidWp(wp)) { wp = StExt_ReturnString; };
	StExt_WorldRandomizer_RandomizeWorld(wp);
};

var string StExt_RandomizeWorld_Wp1_CallbackStr;
var string StExt_RandomizeWorld_Wp2_CallbackStr;
var string StExt_RandomizeWorld_Wp3_CallbackStr;
func void StExt_RandomizeWorld_Wp1_Callback() {	StExt_WorldRandomizer_RandomizeWorld(StExt_RandomizeWorld_Wp1_CallbackStr); };
func void StExt_RandomizeWorld_Wp2_Callback() {	StExt_WorldRandomizer_RandomizeWorld(StExt_RandomizeWorld_Wp2_CallbackStr); };
func void StExt_RandomizeWorld_Wp3_Callback() {	StExt_WorldRandomizer_RandomizeWorld(StExt_RandomizeWorld_Wp3_CallbackStr); };

func int StExt_RandomizeWorld_Chest_Loop(var int index)
{
	StExt_GetRandomEmptyChest(StExt_Config_WorldRandomization_PutInAnyChest);
	if (StExt_StringIsEmpty(StExt_ReturnString))
	{
		StExt_PrintDebugStack("StExt_RandomizeWorld_Chest() -> chest not found!");
		return (index <= StExt_RandomChestsCount);
	};
	StExt_PrintDebugStack(concatstrings("StExt_RandomizeWorld_Chest() -> fill chest: ", StExt_ReturnString));
	
	StExt_RandomChestName = StExt_ReturnString;
	StExt_RandomChestGenerateLoot = true;
	StExt_ChestLootHandler(3 + hlp_random(5 + ((hero.level + 1) / 5)));
	if(StExt_Config_WorldRandomization_LockChest) {	StExt_LockChest(StExt_RandomChestName, hero.level); };
	StExt_RandomChestGenerateLoot = false;
	StExt_RandomChestName = StExt_EmptyString;
	return (index <= StExt_RandomChestsCount);
};

func void StExt_RandomizeWorld_Chest()
{
	var int dayNow; dayNow = wld_getday();
	if ((dayNow >= StExt_RandomChestLootDay) || (StExt_RandomChestLootDay == 0))
	{
		StExt_RandomChestsCount = StExt_Config_WorldRandomization_EmptyChestsUpdateCount;		
		StExt_While(StExt_RandomizeWorld_Chest_Loop);
		StExt_RandomChestsCount = 0;
		StExt_RandomChestLootDay = dayNow + StExt_Config_WorldRandomization_EmptyChestsUpdateRate;
	};
};

func int StExt_RandomizeWorld_Bandits_Loop(var int index)
{
	var int npcCount; npcCount = 0;
	var int npcCountBonus; npcCountBonus = 0;
	var int instanceId; instanceId = StExt_GetInstanceIdByName("StExt_Bdt_Random");
	var string spawnWp; spawnWp = StExt_WorldRandomizer_GetWaypoint();

	if (StExt_StringIsEmpty(spawnWp)) {
		StExt_PrintDebugStack("StExt_RandomizeWorld_Bandits_Loop() -> Wp not found!");
		return (index <= StExt_RandomBanditsPacksCount);
	};
	if (instanceId == StExt_Null) {
		StExt_PrintDebugStack("StExt_RandomizeWorld_Bandits_Loop() -> 'StExt_Bdt_Random' instance not found!");
		return (index <= StExt_RandomBanditsPacksCount);
	};
	
	npcCountBonus += StExt_IfInt(StExt_Config_Diff_EnableKapitel, StExt_Config_WorldRandomization_BanditsCountBonusPerKapitel * (kapitel - 1), 0);
	npcCount = StExt_GetRandomRange(StExt_Config_WorldRandomization_BanditsCountMin, StExt_Config_WorldRandomization_BanditsCountMax + npcCountBonus);
	if (npcCount <= 0) { npcCount = 1; };
	
	rx_saveparservars();
	StExt_SpawnNpcWithFunc(instanceId, npcCount, spawnWp, "StExt_SpawnRandomBanditHandler");
	rx_restoreparservars();
	return (index <= StExt_RandomBanditsPacksCount);
};

func void StExt_RandomizeWorld_Bandits()
{
	var int dayNow; dayNow = wld_getday();
	if ((dayNow >= StExt_RandomBanditsDay) || (StExt_RandomBanditsDay == 0))
	{
		StExt_RandomBanditsPacksCount = StExt_Config_WorldRandomization_BanditsPacksPerSpawn;
		StExt_While(StExt_RandomizeWorld_Bandits_Loop);
		StExt_RandomBanditsPacksCount = 0;
		StExt_RandomBanditsDay = dayNow + StExt_Config_WorldRandomization_BanditsPacksSpawnRate;
	};	
};

func void StExt_WorldRandomizerController()
{
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	
	if (currentlevel == StExt_WorldRandimizer_LevelId)
	{
		if (StExt_Config_WorldRandomization_EnableChestUpdate) { StExt_RandomizeWorld_Chest(); };
		if (StExt_Config_WorldRandomization_EnableRandomBandits) { StExt_RandomizeWorld_Bandits(); };
	};

	if (!StExt_Config_EnableWorldRandomization_Npc && !StExt_Config_EnableWorldRandomization_Items) { return; };	
	if (currentlevel != StExt_WorldRandimizer_LevelId) 
	{
		StExt_WorldRandimizer_LevelId = currentlevel;
		StExt_WorldRandimizer_Cooldown[0] = StExt_WorldRandomizer_GetTimerCd();
		StExt_WorldRandimizer_Cooldown[1] = StExt_WorldRandomizer_GetTimerCd();
		StExt_WorldRandimizer_Cooldown[2] = StExt_WorldRandomizer_GetTimerCd();
		StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 0, StExt_WorldRandomizer_GetWaypoint());
		StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 1, StExt_WorldRandomizer_GetWaypoint());
		StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 2, StExt_WorldRandomizer_GetWaypoint());
		return;
	};	
	
	StExt_WorldRandimizer_LevelId = currentlevel;
	StExt_RandomizeWorld_ProcessCooldown(0);
	StExt_RandomizeWorld_ProcessCooldown(1);
	StExt_RandomizeWorld_ProcessCooldown(2);	

	if(StExt_WorldRandimizer_Cooldown[0] <= 0)
	{
		StExt_RandomizeWorld_Wp1_CallbackStr = StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", 0);
		rx_callback(0.5, StExt_RandomizeWorld_Wp1_Callback);
		StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 0, StExt_WorldRandomizer_GetWaypoint());
		StExt_WorldRandimizer_Cooldown[0] = StExt_WorldRandomizer_GetTimerCd();
	};
	if(StExt_WorldRandimizer_Cooldown[1] <= 0)
	{
		StExt_RandomizeWorld_Wp2_CallbackStr = StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", 1);
		rx_callback(1.0, StExt_RandomizeWorld_Wp2_Callback); 
		StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 1, StExt_WorldRandomizer_GetWaypoint());
		StExt_WorldRandimizer_Cooldown[1] = StExt_WorldRandomizer_GetTimerCd();
	};
	if(StExt_WorldRandimizer_Cooldown[2] <= 0)
	{
		StExt_RandomizeWorld_Wp3_CallbackStr = StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", 2);
		rx_callback(1.5, StExt_RandomizeWorld_Wp3_Callback); 
		StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 2, StExt_WorldRandomizer_GetWaypoint());
		StExt_WorldRandimizer_Cooldown[2] = StExt_WorldRandomizer_GetTimerCd();
	};
	
	/*
	StExt_PrintDebugStack(concatstrings("StExt_WorldRandomizerController(var int id) -> StExt_WorldRandimizer_Waypoint1: ", StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", 0)));
	StExt_PrintDebugStack(concatstrings("StExt_WorldRandomizerController(var int id) -> StExt_WorldRandimizer_Waypoint2: ", StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", 1)));
	StExt_PrintDebugStack(concatstrings("StExt_WorldRandomizerController(var int id) -> StExt_WorldRandimizer_Waypoint3: ", StExt_Array_GetString("StExt_WorldRandimizer_Waypoint", 2)));
	
	StExt_PrintDebugStack(concatstrings("StExt_WorldRandomizerController(var int id) -> StExt_RandomizeWorld_Wp1_CallbackStr: ", StExt_RandomizeWorld_Wp1_CallbackStr));
	StExt_PrintDebugStack(concatstrings("StExt_WorldRandomizerController(var int id) -> StExt_RandomizeWorld_Wp2_CallbackStr: ", StExt_RandomizeWorld_Wp2_CallbackStr));
	StExt_PrintDebugStack(concatstrings("StExt_WorldRandomizerController(var int id) -> StExt_RandomizeWorld_Wp3_CallbackStr: ", StExt_RandomizeWorld_Wp3_CallbackStr));
	*/
};

func void StExt_InitializeWorldRandomizer()
{
	StExt_WorldRandimizer_LevelId = currentlevel;
	StExt_WorldRandimizer_Cooldown[0] = 300 + hlp_random(300);
	StExt_WorldRandimizer_Cooldown[1] = 300 + hlp_random(300);
	StExt_WorldRandimizer_Cooldown[2] = 300 + hlp_random(300);
	StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 0, StExt_WorldRandomizer_GetWaypoint());
	StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 1, StExt_WorldRandomizer_GetWaypoint());
	StExt_Array_SetString(StExt_WorldRandimizer_WaypointsArrayName, 2, StExt_WorldRandomizer_GetWaypoint());
};

func event StExt_Evt_OnMidnight() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnDawn() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnMorning() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnNoon() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnAfternoon() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnDusk() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnEvening() { StExt_RandomizeWorld_ProcessTimeEvent(); };
func event StExt_Evt_OnNewDay() { StExt_RandomizeWorld_ProcessTimeEvent(); };

func void StExt_GiveLootBox_Daily(var c_npc slf)
{
	var int bonus;
	if (!hlp_isvalidnpc(slf)) { return; };
	
	bonus = 1 + StExt_GetPercentFromValue(StExt_TraderReputation, 5);
	createinvitems(slf, itmi_stext_lootchest_Shield, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Sword1h, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Sword2h, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Axe1h, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Axe2h, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Mace1h, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Mace2h, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_MagicSword, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Staff, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Rapier, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_DexSword, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Halleberd, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Spear, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Dual, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Bow, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_CrossBow, bonus + (kapitel * 2) + hlp_random(kapitel + 3));	
	createinvitems(slf, itmi_stext_lootchest_Helm, bonus + (kapitel * 2) + hlp_random(kapitel + 3));		
	createinvitems(slf, itmi_stext_lootchest_Pants, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Boots, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Gloves, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Torso, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Armor, bonus + (kapitel * 2) + hlp_random(kapitel + 3));	
	createinvitems(slf, itmi_stext_lootchest_Belt, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Amulet, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	createinvitems(slf, itmi_stext_lootchest_Ring, bonus + (kapitel * 2) + hlp_random(kapitel + 3));
	//createinvitems(slf, itmi_stext_lootchest_MagicStaff, bonus + (kapitel * 2) + hlp_random(3));
};

func void rx_looptrades() 
{
	var c_npc trd_cronos_nw;
    var c_npc trd_cronos_adw;
    var c_npc trd_fisk;
    var c_npc trd_lucia;
    var c_npc trd_samuel;
    var c_npc trd_miguel;
    var c_npc trd_scatty;
    var c_npc trd_constantino;
    var c_npc trd_kardif;
    var c_npc trd_zuris;
    var c_npc trd_baltram;
    var c_npc trd_jora;
    var c_npc trd_coragon;
    var c_npc trd_gorax;
    var c_npc trd_orlan;
    var c_npc trd_elena;
    var c_npc trd_sagitta;
    var c_npc trd_rosi;
    var c_npc trd_ignaz;
    var c_npc trd_isgaroth;
    var c_npc trd_fenia;
    var c_npc trd_salandril;
    var c_npc trd_xardas;
    var c_npc trd_baaltyon;
    var c_npc trd_taliasan;
    var c_npc trd_rupert;
    var c_npc trd_fregeal;
    var c_npc trd_neoras;	
	var c_npc trd_rengaru;
	var c_npc trd_valeran;
    var c_npc trd_martin;
    var c_npc trd_garett;
    var c_npc trd_huno;
    var c_npc trd_erol;
    var c_npc trd_matteo;
    var c_npc trd_canthar;
    var c_npc trd_sarah;
    var c_npc trd_hakon;
    var c_npc trd_bennet;
    var c_npc trd_khaled;
    var c_npc trd_karras;
    var c_npc trd_lutero;
    var c_npc trd_joru;
    var c_npc trd_talas;
    var c_npc trd_nigel;
    var c_npc trd_raffa;
    var c_npc trd_gornakosh;
    var c_npc trd_ramirez;
	var c_npc trd_bosper;
	var c_npc trd_harad;
    var c_npc trd_bartolomie;
	var c_npc trd_mortis;
	var c_npc trd_stoned;
	
	var int tradePower;	
	var int dayNow;
	var int bonus;
	var int bonusStoned;

    trd_matteo = hlp_getnpc(vlk_416_matteo);
    trd_bosper = hlp_getnpc(vlk_413_bosper);
    trd_harad = hlp_getnpc(vlk_412_harad);
    trd_baltram = hlp_getnpc(vlk_410_baltram);
    trd_canthar = hlp_getnpc(vlk_468_canthar);
    trd_sarah = hlp_getnpc(vlk_470_sarah); 
    trd_hakon = hlp_getnpc(vlk_407_hakon);
    trd_bennet = hlp_getnpc(sld_809_bennet);
    trd_fenia = hlp_getnpc(vlk_476_fenia);
    trd_khaled = hlp_getnpc(sld_823_khaled);
    trd_karras = hlp_getnpc(kdf_503_karras);
    trd_lutero = hlp_getnpc(vlk_404_lutero);
    trd_joru = hlp_getnpc(sek_8013_joru);
    trd_raffa = hlp_getnpc(hun_745_raffa);
    trd_gornakosh = hlp_getnpc(tpl_8005_gornakosh);
    trd_rengaru = hlp_getnpc(vlk_492_rengaru);
    trd_mortis = hlp_getnpc(mil_314_mortis);
    trd_ramirez = hlp_getnpc(vlk_445_ramirez);
    trd_rupert = hlp_getnpc(vlk_458_rupert);
    trd_valeran = hlp_getnpc(vlk_6134_valeran);
    trd_nigel = hlp_getnpc(vlk_6110_nigel);
    trd_martin = hlp_getnpc(mil_350_addon_martin);
    trd_garett = hlp_getnpc(pir_1357_addon_garett);
    trd_huno = hlp_getnpc(bdt_1099_addon_huno);
    trd_erol = hlp_getnpc(vlk_4303_addon_erol);
    trd_talas = hlp_getnpc(sek_8012_talas);
    trd_neoras = hlp_getnpc(kdf_506_neoras);
    trd_taliasan = hlp_getnpc(vlk_6027_taliasan);
    trd_baaltyon = hlp_getnpc(gur_8003_tyon);
    trd_cronos_nw = hlp_getnpc(kdw_1401_addon_cronos_nw);
    trd_cronos_adw = hlp_getnpc(kdw_14010_addon_cronos_adw);
    trd_lucia = hlp_getnpc(bdt_1091_addon_lucia);
    trd_samuel = hlp_getnpc(pir_1351_addon_samuel);
    trd_bartolomie = hlp_getnpc(pir_50087);
    trd_scatty = hlp_getnpc(bdt_1086_addon_scatty);
    trd_constantino = hlp_getnpc(vlk_417_constantino);
    trd_kardif = hlp_getnpc(vlk_431_kardif);
    trd_zuris = hlp_getnpc(vlk_409_zuris);
    trd_baltram = hlp_getnpc(vlk_410_baltram);
    trd_jora = hlp_getnpc(vlk_408_jora);
    trd_coragon = hlp_getnpc(vlk_420_coragon);
    trd_gorax = hlp_getnpc(kdf_508_gorax);
    trd_orlan = hlp_getnpc(bau_970_orlan);
    trd_elena = hlp_getnpc(bau_911_elena);
    trd_sagitta = hlp_getnpc(bau_980_sagitta);
    trd_rosi = hlp_getnpc(bau_936_rosi);
    trd_ignaz = hlp_getnpc(vlk_498_ignaz);
    trd_isgaroth = hlp_getnpc(kdf_509_isgaroth);
    trd_fenia = hlp_getnpc(vlk_476_fenia);
    trd_salandril = hlp_getnpc(vlk_422_salandril);
    trd_fregeal = hlp_getnpc(none_1192_fregeal);
    trd_fisk = hlp_getnpc(bdt_1097_addon_fisk);
	trd_miguel = hlp_getnpc(bdt_10022_addon_miguel);
	trd_stoned = hlp_getnpc(none_99666_StonedTrader);
	
	tradePower = 5 + hero.level + hlp_random(hero.level + 1) + (kapitel * StExt_GetRandomRange(10 + kapitel, 20 + (kapitel * 2)));
	bonus = StExt_GetPercentFromValue(tradePower, 10 + hlp_random(5));
	dayNow = wld_getday();
	
	rx_looptrades_old();
    if(currentlevel == newworld_zen) 
	{
		if (hlp_isvalidnpc(trd_stoned) && ((dayNow >= StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Repeating]) || (StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Repeating] == 0)))
		{
			bonusStoned = StExt_GetPercentFromValue(StExt_TraderReputation, 10);
			createinvitems(trd_stoned, itmi_nugget, 10 + bonusStoned + hlp_random(5 + bonus + bonusStoned));
			createinvitems(trd_stoned, itmi_silber, 5 + bonusStoned + hlp_random(5 + bonus + bonusStoned));
			createinvitems(trd_stoned, itwr_magicpaper, 10 + bonusStoned + hlp_random(5 + bonus + bonusStoned));
			StExt_GiveLootBox_Daily(trd_stoned);
			
			StExt_Traders_ExtraSpellComponents(trd_stoned, kapitel + bonus + bonusStoned);
			StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Repeating] = dayNow + StExt_ValidateValueRange(StExt_Config_WorldRandomization_TradersExtraItemsAddRate, 3, 7);
		};
		
        if ((dayNow >= StExt_RandomTradersLootDay) || (StExt_RandomTradersLootDay == 0)) 
		{
			StExt_GiveExtraMagicLoot(trd_taliasan, tradePower, false);
			StExt_GiveExtraMagicLoot(trd_baaltyon, tradePower, false);
			StExt_GiveExtraMagicLoot(trd_cronos_nw, tradePower, false);
			StExt_GiveExtraMagicLoot(trd_isgaroth, tradePower, false);
			StExt_GiveExtraMagicLoot(trd_gorax, tradePower, false);
			StExt_GiveExtraMagicLoot(trd_karras, tradePower, false);
			
			StExt_GiveExtraMagicWeaponLoot(trd_taliasan, tradePower, false);
			StExt_GiveExtraMagicWeaponLoot(trd_baaltyon, tradePower, false);
			StExt_GiveExtraMagicWeaponLoot(trd_cronos_nw, tradePower, false);
			StExt_GiveExtraMagicWeaponLoot(trd_isgaroth, tradePower, false);
			StExt_GiveExtraMagicWeaponLoot(trd_gorax, tradePower, false);
			StExt_GiveExtraMagicWeaponLoot(trd_karras, tradePower, false);
			
			if(kapitel < 5) 
			{
				trd_xardas = hlp_getnpc(none_100_xardas);
				StExt_GiveExtraMagicLoot(trd_xardas, tradePower, false);
				StExt_Traders_ExtraSpellComponents(trd_xardas, kapitel + bonus);
			};
			
			StExt_GiveExtraAlchemyLoot(trd_constantino, tradePower, false);
			StExt_GiveExtraAlchemyLoot(trd_zuris, tradePower, false);
			StExt_GiveExtraAlchemyLoot(trd_ignaz, tradePower, false);
			StExt_GiveExtraAlchemyLoot(trd_sagitta, tradePower, false);			
			StExt_GiveExtraAlchemyLoot(trd_salandril, tradePower, false);
			StExt_GiveExtraAlchemyLoot(trd_baaltyon, tradePower, false);
			StExt_GiveExtraAlchemyLoot(trd_neoras, tradePower, false);	
			StExt_GiveExtraAlchemyLoot(trd_fregeal, tradePower, false);	
			StExt_GiveExtraAlchemyLoot(trd_joru, tradePower, false);				
			
			StExt_GiveExtraFoodLoot(trd_coragon, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_baltram, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_rupert, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_fenia, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_kardif, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_orlan, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_elena, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_gorax, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_rosi, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_jora, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_valeran, tradePower, false);			
			StExt_GiveExtraFoodLoot(trd_erol, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_matteo, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_nigel, tradePower, false);
			
			StExt_Traders_ExtraSpellComponents(trd_gorax, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_constantino, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_zuris, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_baaltyon, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_taliasan, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_ignaz, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_salandril, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_neoras, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_karras, kapitel + bonus);
			StExt_Traders_ExtraSpellComponents(trd_lutero, kapitel + bonus);
			
			StExt_GiveExtraMiskLoot(trd_jora, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_rengaru, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_valeran, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_ramirez, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_erol, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_matteo, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_lutero, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_nigel, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_rosi, tradePower, false);

			StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_canthar, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_sarah, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_hakon, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_bennet, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_khaled, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_talas, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_gornakosh, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_harad, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_mortis, tradePower, false);
			
			StExt_GiveExtraMunitionLoot(trd_martin, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_canthar, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_sarah, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_hakon, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_bennet, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_khaled, tradePower, false);

			StExt_GiveExtraRangeWeaponLoot(trd_canthar, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_sarah, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_raffa, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_bosper, tradePower, false);
			
			StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false);
			if (rx_getchance(75)) { StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(75)) { StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(50)) { StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(50)) { StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(25)) { StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(25)) { StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(15)) { StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(15)) { StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(10)) { StExt_GiveExtraRangeWeaponLoot(trd_martin, tradePower, false); };
			if (rx_getchance(10)) { StExt_GiveExtraMeleeWeaponLoot(trd_martin, tradePower, false); };

			StExt_RandomTradersLootDay = dayNow + StExt_Config_WorldRandomization_TradersExtraItemsAddRate;
        };
    };
	if(currentlevel == addonworld_zen) 
	{
        if((dayNow >= StExt_RandomTradersLootDay_Adw) || (StExt_RandomTradersLootDay_Adw == 0)) 
		{
			StExt_GiveExtraMeleeWeaponLoot(trd_garett, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_fisk, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_huno, tradePower, false);
			StExt_GiveExtraMeleeWeaponLoot(trd_scatty, tradePower, false);
			
			StExt_GiveExtraMunitionLoot(trd_garett, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_fisk, tradePower, false);
			StExt_GiveExtraMunitionLoot(trd_scatty, tradePower, false);

			StExt_GiveExtraRangeWeaponLoot(trd_garett, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_fisk, tradePower, false);
			StExt_GiveExtraRangeWeaponLoot(trd_scatty, tradePower, false);
			
			StExt_GiveExtraMiskLoot(trd_fisk, tradePower, false);
			StExt_GiveExtraMiskLoot(trd_scatty, tradePower, false);
		
			StExt_GiveExtraMagicLoot(trd_cronos_adw, tradePower, false);
			StExt_Traders_ExtraSpellComponents(trd_cronos_adw, bonus);
			StExt_GiveExtraAlchemyLoot(trd_cronos_adw, tradePower, false);
			StExt_GiveExtraMagicWeaponLoot(trd_cronos_adw, tradePower, false);
			
			StExt_GiveExtraFoodLoot(trd_fisk, tradePower, false);			
			StExt_GiveExtraFoodLoot(trd_lucia, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_bartolomie, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_scatty, tradePower, false);
			StExt_GiveExtraFoodLoot(trd_samuel, tradePower, false);
			
			StExt_RandomTradersLootDay_Adw = dayNow + StExt_Config_WorldRandomization_TradersExtraItemsAddRate;
		};
	};
};
