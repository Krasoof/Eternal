func void StExt_ValidateConfigValues()
{
	StExt_ValidateConfigs();
	if (StExt_Config_Npc_Duplication_CountMin > StExt_Config_Npc_Duplication_CountMax) { StExt_Config_Npc_Duplication_CountMin = StExt_Config_Npc_Duplication_CountMax; };
	if (StExt_Config_WorldRandomization_MinCooldown > StExt_Config_WorldRandomization_MaxCooldown) { StExt_Config_WorldRandomization_MinCooldown = StExt_Config_WorldRandomization_MaxCooldown; };	
	if (StExt_Config_WorldRandomization_BanditsCountMin > StExt_Config_WorldRandomization_BanditsCountMax) { StExt_Config_WorldRandomization_BanditsCountMin = StExt_Config_WorldRandomization_BanditsCountMax; };
};

// You can use StExt_Evt_OnModLoaded event to register own configs
// Instead of hooking this function
func void StExt_InitializeConfigsData()
{
	var int currentGroup;
	StExt_PrintDebugStack("StExt_InitializeExportConfigs()");

	//****************************************************************
	//				*** Difficulty configs ***
	//****************************************************************
	currentGroup = StExt_ConfigCat_Index_Difficulty;
	
	StExt_RegisterConfig("StExt_Config_Diff_EnableStatic", "StExt_Str_Config_Diff_EnableStatic", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Static_Power", "StExt_Str_Config_Diff_Static_Power", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Static_Hp", "StExt_Str_Config_Diff_Static_Hp", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Static_Prot", "StExt_Str_Config_Diff_Static_Prot", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Diff_EnableDaily", "StExt_Str_Config_Diff_EnableDaily", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Daily_Power", "StExt_Str_Config_Diff_Daily_Power", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Daily_Hp", "StExt_Str_Config_Diff_Daily_Hp", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Daily_Prot", "StExt_Str_Config_Diff_Daily_Prot", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Diff_EnableKapitel", "StExt_Str_Config_Diff_EnableKapitel", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Power", "StExt_Str_Config_Diff_Kapitel_Power", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Hp", "StExt_Str_Config_Diff_Kapitel_Hp", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Prot", "StExt_Str_Config_Diff_Kapitel_Prot", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Speed", "StExt_Str_Config_Diff_Kapitel_Speed", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
		
	StExt_RegisterConfig("StExt_Config_Diff_EnableLevel", "StExt_Str_Config_Diff_EnableLevel", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_Power", "StExt_Str_Config_Diff_Level_Power", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_Hp", "StExt_Str_Config_Diff_Level_Hp", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_Prot", "StExt_Str_Config_Diff_Level_Prot", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_Speed", "StExt_Str_Config_Diff_Level_Speed", currentGroup, 0, 5, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_DuplicationChance", "StExt_Str_Config_Diff_Level_DuplicationChance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_CorruptionChance", "StExt_Str_Config_Diff_Level_CorruptionChance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_MagicInfusionChance", "StExt_Str_Config_Diff_Level_MagicInfusionChance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Level_MagicInfusionPower", "StExt_Str_Config_Diff_Level_MagicInfusionPower", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_Duplication_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_Duplication_Count", "StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Count", currentGroup, 0, 3, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Power", "StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Power", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance", "StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange", "StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange", currentGroup, -50, 150, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_RandomScroll_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_HealingScroll_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_RandomShield_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_RandomShield_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_Npc_RandomHelm_Chance", "StExt_Str_Config_Diff_Kapitel_Npc_RandomHelm_Chance", currentGroup, 0, 100, StExt_Value_DisplayType_Permille, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_DailyHpMod", "StExt_Str_Config_Diff_Kapitel_DailyHpMod", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_DailyPowerMod", "StExt_Str_Config_Diff_Kapitel_DailyPowerMod", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_Kapitel_DailyProtMod", "StExt_Str_Config_Diff_Kapitel_DailyProtMod", currentGroup, 0, 10, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Diff_EnableRot", "StExt_Str_Config_Diff_EnableRot", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_EnableRot_NightEncounters", "StExt_Str_Config_Diff_EnableRot_NightEncounters", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_EnableRot_Avengers", "StExt_Str_Config_Diff_EnableRot_Avengers", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Diff_EnableRot_Bandits", "StExt_Str_Config_Diff_EnableRot_Bandits", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_BelliarRage_Active", "StExt_Str_Config_BelliarRage_Active", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_BelliarRage_SpawnMonsters", "StExt_Str_Config_BelliarRage_SpawnMonsters", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_BelliarRage_StaminaReduce", "StExt_Str_Config_BelliarRage_StaminaReduce", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_BelliarRage_AddDamageReduce", "StExt_Str_Config_BelliarRage_AddDamageReduce", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_BelliarRage_RegenEnemies", "StExt_Str_Config_BelliarRage_RegenEnemies", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_BelliarRage_SoundEnable", "StExt_Str_Config_BelliarRage_SoundEnable", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	
	//****************************************************************
	//					*** Npc configs ***
	//****************************************************************	
	currentGroup = StExt_ConfigCat_Index_Npc;
	
	StExt_RegisterConfig("StExt_Config_Npc_GlobalHpMult", "StExt_Str_Config_Npc_GlobalHpMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_GlobalEsMult", "StExt_Str_Config_Npc_GlobalEsMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_GlobalStatMult", "StExt_Str_Config_Npc_GlobalStatMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_GlobalProtMult", "StExt_Str_Config_Npc_GlobalProtMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_GlobalDamMult", "StExt_Str_Config_Npc_GlobalDamMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Npc_EnableStatsRandomization", "StExt_Str_Config_Npc_EnableStatsRandomization", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_StatsRandomization_Hp", "StExt_Str_Config_Npc_StatsRandomization_Hp", currentGroup, 0, 50, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_StatsRandomization_Stats", "StExt_Str_Config_Npc_StatsRandomization_Stats", currentGroup, 0, 50, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_StatsRandomization_Protection", "StExt_Str_Config_Npc_StatsRandomization_Protection", currentGroup, 0, 50, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_StatsRandomization_Damage", "StExt_Str_Config_Npc_StatsRandomization_Damage", currentGroup, 0, 50, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Npc_EnableLevelBonus", "StExt_Str_Config_Npc_EnableLevelBonus", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_LevelBonus_Hp", "StExt_Str_Config_Npc_LevelBonus_Hp", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_LevelBonus_Stats", "StExt_Str_Config_Npc_LevelBonus_Stats", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_LevelBonus_Protection", "StExt_Str_Config_Npc_LevelBonus_Protection", currentGroup, 0, 50, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_LevelBonus_Damage", "StExt_Str_Config_Npc_LevelBonus_Damage", currentGroup, 0, 50, StExt_Value_DisplayType_Default, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Npc_EnableDuplication", "StExt_Str_Config_Npc_EnableDuplication", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_AllowBosses", "StExt_Str_Config_Npc_Duplication_AllowBosses", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_AllowHumans", "StExt_Str_Config_Npc_Duplication_AllowHumans", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_AllowHumansBandits", "StExt_Str_Config_Npc_Duplication_AllowHumansBandits", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_Chance", "StExt_Str_Config_Npc_Duplication_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_CountMin", "StExt_Str_Config_Npc_Duplication_CountMin", currentGroup, 1, 8, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_CountMax", "StExt_Str_Config_Npc_Duplication_CountMax", currentGroup, 1, 16, StExt_Value_DisplayType_Default, true, true, true);	
	StExt_RegisterConfig("StExt_Config_Npc_Duplication_LevelThreshold", "StExt_Str_Config_Npc_Duplication_LevelThreshold", currentGroup, 0, 50, StExt_Value_DisplayType_Default, true, true, true);

	StExt_RegisterConfig("StExt_Config_Npc_EnableMagicInfusion", "StExt_Str_Config_Npc_EnableMagicInfusion", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_AllowHumans", "StExt_Str_Config_Npc_MagicInfusion_AllowHumans", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_AllowBosses", "StExt_Str_Config_Npc_MagicInfusion_AllowBosses", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_LevelThreshold", "StExt_Str_Config_Npc_MagicInfusion_LevelThreshold", currentGroup, 0, 50, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_PowerMod", "StExt_Str_Config_Npc_MagicInfusion_PowerMod", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_Chance", "StExt_Str_Config_Npc_MagicInfusion_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_CorruptionChance", "StExt_Str_Config_Npc_MagicInfusion_CorruptionChance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_HumansExtraChance", "StExt_Str_Config_Npc_MagicInfusion_HumansExtraChance", currentGroup, -1000, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusion_BossesExtraChance", "StExt_Str_Config_Npc_MagicInfusion_BossesExtraChance", currentGroup, -1000, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_MagicInfusedAlwaysHasRandomEquipment", "StExt_Str_Config_Npc_MagicInfusedAlwaysHasRandomEquipment", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);

	StExt_RegisterConfig("StExt_Config_Npc_InfusionHpMult", "StExt_Str_Config_Npc_InfusionHpMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_InfusionEsMult", "StExt_Str_Config_Npc_InfusionEsMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_InfusionStatMult", "StExt_Str_Config_Npc_InfusionStatMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_InfusionProtMult", "StExt_Str_Config_Npc_InfusionProtMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_InfusionDamMult", "StExt_Str_Config_Npc_InfusionDamMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Npc_EnableRandomEquipment", "StExt_Str_Config_Npc_EnableRandomEquipment", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_RandomMeleeWeapon_Chance", "StExt_Str_Config_Npc_RandomMeleeWeapon_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_RandomRangeWeapon_Chance", "StExt_Str_Config_Npc_RandomRangeWeapon_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_RandomScroll_Chance", "StExt_Str_Config_Npc_RandomScroll_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_HealingScroll_Chance", "StExt_Str_Config_Npc_HealingScroll_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_RandomShield_Chance", "StExt_Str_Config_Npc_RandomShield_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_RandomHelm_Chance", "StExt_Str_Config_Npc_RandomHelm_Chance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_LuckyFlagChance", "StExt_Str_Config_Npc_LuckyFlagChance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_RichFlagChance", "StExt_Str_Config_Npc_RichFlagChance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);

	StExt_RegisterConfig("StExt_Config_NpcSum_CanBeDuplicated", "StExt_Str_Config_NpcSum_CanBeDuplicated", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_NpcSum_CanBeInfused", "StExt_Str_Config_NpcSum_CanBeInfused", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_NpcSum_GlobalHpMult", "StExt_Str_Config_NpcSum_GlobalHpMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);	
	StExt_RegisterConfig("StExt_Config_NpcSum_GlobalEsMult", "StExt_Str_Config_NpcSum_GlobalEsMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_NpcSum_GlobalStatMult", "StExt_Str_Config_NpcSum_GlobalStatMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_NpcSum_GlobalProtMult", "StExt_Str_Config_NpcSum_GlobalProtMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_NpcSum_GlobalDamMult", "StExt_Str_Config_NpcSum_GlobalDamMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Npc_SummonsCanHaveOwnSummons", "StExt_Str_Config_Npc_SummonsCanHaveOwnSummons", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_CantUseSpellAbilities", "StExt_Str_Config_Npc_CantUseSpellAbilities", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_CantUseBuffAbilities", "StExt_Str_Config_Npc_CantUseBuffAbilities", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Npc_CantUseSummonAbilities", "StExt_Str_Config_Npc_CantUseSummonAbilities", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);

	StExt_RegisterConfig("StExt_Config_Sum_GlobalHpMult", "StExt_Str_Config_Sum_GlobalHpMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Sum_GlobalStatMult", "StExt_Str_Config_Sum_GlobalStatMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Sum_GlobalProtMult", "StExt_Str_Config_Sum_GlobalProtMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Sum_GlobalDamMult", "StExt_Str_Config_Sum_GlobalDamMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	

	//****************************************************************
	//					*** Luck configs ***
	//****************************************************************
	currentGroup = StExt_ConfigCat_Index_Luck;
	
	StExt_RegisterConfig("StExt_Config_Luck_EnableRandomLoot_Bodies", "StExt_Str_Config_Luck_EnableRandomLoot_Bodies", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_EnableRandomLoot_Chests", "StExt_Str_Config_Luck_EnableRandomLoot_Chests", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLoot_EnableUnHumanDrop", "StExt_Str_Config_Luck_RandomLoot_EnableUnHumanDrop", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Luck_Difficulty", "StExt_Str_Config_Luck_Difficulty", currentGroup, -50, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_Power", "StExt_Str_Config_Luck_Power", currentGroup, -100, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_Quantity", "StExt_Str_Config_Luck_Quantity", currentGroup, -100, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_Money", "StExt_Str_Config_Luck_Money", currentGroup, -100, 100, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Food", "StExt_Str_Config_Luck_RandomLootPowerMod_Food", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Alchemy", "StExt_Str_Config_Luck_RandomLootPowerMod_Alchemy", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Magic", "StExt_Str_Config_Luck_RandomLootPowerMod_Magic", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Misk", "StExt_Str_Config_Luck_RandomLootPowerMod_Misk", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Armor", "StExt_Str_Config_Luck_RandomLootPowerMod_Armor", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Weapon", "StExt_Str_Config_Luck_RandomLootPowerMod_Weapon", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootPowerMod_Jewelry", "StExt_Str_Config_Luck_RandomLootPowerMod_Jewelry", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootQuantityMod_Food", "StExt_Str_Config_Luck_RandomLootQuantityMod_Food", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootQuantityMod_Alchemy", "StExt_Str_Config_Luck_RandomLootQuantityMod_Alchemy", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootQuantityMod_Magic", "StExt_Str_Config_Luck_RandomLootQuantityMod_Magic", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootQuantityMod_Munition", "StExt_Str_Config_Luck_RandomLootQuantityMod_Munition", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RandomLootQuantityMod_Misk", "StExt_Str_Config_Luck_RandomLootQuantityMod_Misk", currentGroup, -100, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_Luck_ChanceForEnchantedDrop", "StExt_Str_Config_Luck_ChanceForEnchantedDrop", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Food", "StExt_Str_Config_Luck_RelativeDropChance_Food", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Alchemy", "StExt_Str_Config_Luck_RelativeDropChance_Alchemy", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Magic", "StExt_Str_Config_Luck_RelativeDropChance_Magic", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Misk", "StExt_Str_Config_Luck_RelativeDropChance_Misk", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Munition", "StExt_Str_Config_Luck_RelativeDropChance_Munition", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Armors", "StExt_Str_Config_Luck_RelativeDropChance_Armors", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_Jewelry", "StExt_Str_Config_Luck_RelativeDropChance_Jewelry", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_MagicWeapons", "StExt_Str_Config_Luck_RelativeDropChance_MagicWeapons", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_MeeleWeapons", "StExt_Str_Config_Luck_RelativeDropChance_MeeleWeapons", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_Luck_RelativeDropChance_RangeWeapons", "StExt_Str_Config_Luck_RelativeDropChance_RangeWeapons", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);


	//****************************************************************
	//			*** World randomization configs ***
	//****************************************************************
	currentGroup = StExt_ConfigCat_Index_WorldRandomization;
	
	StExt_RegisterConfig("StExt_Config_EnableWorldRandomization_Items", "StExt_Str_Config_EnableWorldRandomization_Items", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EnableWorldRandomization_Npc", "StExt_Str_Config_EnableWorldRandomization_Npc", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EnableWorldRandomization_ByTimeEvents", "StExt_Str_Config_EnableWorldRandomization_ByTimeEvents", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_MinCooldown", "StExt_Str_Config_WorldRandomization_MinCooldown", currentGroup, 60, 3600, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_MaxCooldown", "StExt_Str_Config_WorldRandomization_MaxCooldown", currentGroup, 60, 3600, StExt_Value_DisplayType_Default, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_SpawnChance", "StExt_Str_Config_WorldRandomization_Npc_SpawnChance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_SpawnPowerMod", "StExt_Str_Config_WorldRandomization_Npc_SpawnPowerMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_SpawnPower_LevelMod", "StExt_Str_Config_WorldRandomization_Npc_SpawnPower_LevelMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_SpawnPower_KapitelMod", "StExt_Str_Config_WorldRandomization_Npc_SpawnPower_KapitelMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_SpawnPower_DayMod", "StExt_Str_Config_WorldRandomization_Npc_SpawnPower_DayMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_SpawnCountMod", "StExt_Str_Config_WorldRandomization_Npc_SpawnCountMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Item_SpawnChance", "StExt_Str_Config_WorldRandomization_Item_SpawnChance", currentGroup, 0, 1000, StExt_Value_DisplayType_Permille, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Item_SpawnPowerMod", "StExt_Str_Config_WorldRandomization_Item_SpawnPowerMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Item_SpawnCountMod", "StExt_Str_Config_WorldRandomization_Item_SpawnCountMod", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_EnableRandomBandits", "StExt_Str_Config_WorldRandomization_EnableRandomBandits", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_FamaleBanditChance", "StExt_Str_Config_WorldRandomization_FamaleBanditChance", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_BanditsPacksSpawnRate", "StExt_Str_Config_WorldRandomization_BanditsPacksSpawnRate", currentGroup, 1, 356, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_BanditsPacksPerSpawn", "StExt_Str_Config_WorldRandomization_BanditsPacksPerSpawn", currentGroup, 1, 8, StExt_Value_DisplayType_Default, true, true, true);	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_BanditsPowerMult", "StExt_Str_Config_WorldRandomization_BanditsPowerMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_BanditsCountMin", "StExt_Str_Config_WorldRandomization_BanditsCountMin", currentGroup, 1, 8, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_BanditsCountMax", "StExt_Str_Config_WorldRandomization_BanditsCountMax", currentGroup, 2, 16, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_BanditsCountBonusPerKapitel", "StExt_Str_Config_WorldRandomization_BanditsCountBonusPerKapitel", currentGroup, 0, 8, StExt_Value_DisplayType_Default, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_WorldRandomization_Npc_EnableSpawnSound", "StExt_Str_Config_WorldRandomization_Npc_EnableSpawnSound", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_TradersExtraItemsAddRate", "StExt_Str_Config_WorldRandomization_TradersExtraItemsAddRate", currentGroup, 3, 356, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_EnableChestUpdate", "StExt_Str_Config_WorldRandomization_EnableChestUpdate", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_PutInAnyChest", "StExt_Str_Config_WorldRandomization_PutInAnyChest", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_LockChest", "StExt_Str_Config_WorldRandomization_LockChest", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_EmptyChestsUpdateRate", "StExt_Str_Config_WorldRandomization_EmptyChestsUpdateRate", currentGroup, 1, 356, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_WorldRandomization_EmptyChestsUpdateCount", "StExt_Str_Config_WorldRandomization_EmptyChestsUpdateCount", currentGroup, 1, 32, StExt_Value_DisplayType_Default, true, true, true);


	//****************************************************************
	//					*** Exp configs ***
	//****************************************************************
	currentGroup = StExt_ConfigCat_Index_Exp;
	
	StExt_RegisterConfig("StExt_Config_GainExpMod", "StExt_Str_Config_GainExpMod", currentGroup, 5, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_GainExpRandomMod", "StExt_Str_Config_GainExpRandomMod", currentGroup, 0, 250, StExt_Value_DisplayType_Permille, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_ExpMod", "StExt_Str_Config_ExpMod", currentGroup, -5, 5, StExt_Value_DisplayType_DeciPercent, true, true, true);
	StExt_RegisterConfig("StExt_Config_SncExp", "StExt_Str_Config_SncExp", currentGroup, 5, 200, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_PartyExp", "StExt_Str_Config_PartyExp", currentGroup, 5, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_NpcExp", "StExt_Str_Config_NpcExp", currentGroup, 5, 500, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_MasteriesExpMult", "StExt_Str_Config_MasteriesExpMult", currentGroup, 5, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_CorruptionExpMult", "StExt_Str_Config_CorruptionExpMult", currentGroup, 5, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_ArtifactsExpMult", "StExt_Str_Config_ArtifactsExpMult", currentGroup, 5, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_BelliarRageExp", "StExt_Str_Config_BelliarRageExp", currentGroup, 5, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_CorruptionTouchExp", "StExt_Str_Config_CorruptionTouchExp", currentGroup, 5, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_DamageReductionExpRate", "StExt_Str_Config_DamageReductionExpRate", currentGroup, 5, 100, StExt_Value_DisplayType_Percent, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Fire", "StExt_Str_Config_MasteryExpMult_Fire", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Ice", "StExt_Str_Config_MasteryExpMult_Ice", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Electric", "StExt_Str_Config_MasteryExpMult_Electric", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Air", "StExt_Str_Config_MasteryExpMult_Air", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Earth", "StExt_Str_Config_MasteryExpMult_Earth", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Light", "StExt_Str_Config_MasteryExpMult_Light", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Dark", "StExt_Str_Config_MasteryExpMult_Dark", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Death", "StExt_Str_Config_MasteryExpMult_Death", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Life", "StExt_Str_Config_MasteryExpMult_Life", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Golem", "StExt_Str_Config_MasteryExpMult_Golem", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Demon", "StExt_Str_Config_MasteryExpMult_Demon", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Necro", "StExt_Str_Config_MasteryExpMult_Necro", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Shaman", "StExt_Str_Config_MasteryExpMult_Shaman", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_MartialArts", "StExt_Str_Config_MasteryExpMult_MartialArts", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Agile", "StExt_Str_Config_MasteryExpMult_Agile", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Archery", "StExt_Str_Config_MasteryExpMult_Archery", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Blood", "StExt_Str_Config_MasteryExpMult_Blood", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_FistFight", "StExt_Str_Config_MasteryExpMult_FistFight", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Aura", "StExt_Str_Config_MasteryExpMult_Aura", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Traps", "StExt_Str_Config_MasteryExpMult_Traps", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MasteryExpMult_Poision", "StExt_Str_Config_MasteryExpMult_Poision", currentGroup, 0, 500, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_ExtraLp", "StExt_Str_Config_ExtraLp", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraHpPerLevel", "StExt_Str_Config_ExtraHpPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraMpPerLevel", "StExt_Str_Config_ExtraMpPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraEsPerLevel", "StExt_Str_Config_ExtraEsPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraStrPerLevel", "StExt_Str_Config_ExtraStrPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraAgiPerLevel", "StExt_Str_Config_ExtraAgiPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraIntPerLevel", "StExt_Str_Config_ExtraIntPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);
	StExt_RegisterConfig("StExt_Config_ExtraLuckPerLevel", "StExt_Str_Config_ExtraLuckPerLevel", currentGroup, 0, 100, StExt_Value_DisplayType_Default, true, true, true);

	StExt_RegisterConfig("StExt_Config_EducationMoneyCostMult", "StExt_Str_Config_EducationMoneyCostMult", currentGroup, 50, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_EducationRequirementsMult", "StExt_Str_Config_EducationRequirementsMult", currentGroup, 50, 1000, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_ArtifactsUpgradeCostMult", "StExt_Str_Config_ArtifactsUpgradeCostMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);


	//****************************************************************
	//					*** Ui configs ***
	//****************************************************************
	currentGroup = StExt_ConfigCat_Index_Ui;

	StExt_RegisterConfig("StExt_Config_ModMenuKey", "StExt_Str_Config_ModMenuKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	StExt_RegisterConfig("StExt_Config_ModCraftKey", "StExt_Str_Config_ModCraftKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	StExt_RegisterConfig("StExt_Config_AuraCastKey", "StExt_Str_Config_AuraCastKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	StExt_RegisterConfig("StExt_Config_ModOptionsKey", "StExt_Str_Config_ModOptionsKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	
	StExt_RegisterConfig("StExt_Config_PcMainActionKey", "StExt_Str_Config_PcMainActionKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	StExt_RegisterConfig("StExt_Config_PcSecondaryActionKey", "StExt_Str_Config_PcSecondaryActionKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	StExt_RegisterConfig("StExt_Config_PcSupportActionKey", "StExt_Str_Config_PcSupportActionKey", currentGroup, -1, 1024, StExt_Value_DisplayType_Default, false, false, true);
	
	StExt_RegisterConfig("StExt_Config_ShowNpcLevel", "StExt_Str_Config_ShowNpcLevel", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_ShowNpcExtraInfo", "StExt_Str_Config_ShowNpcExtraInfo", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_ShowNpcFlags", "StExt_Str_Config_ShowNpcFlags", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_ShowNpcRank", "StExt_Str_Config_ShowNpcRank", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_ShowNpcAbilities", "StExt_Str_Config_ShowNpcAbilities", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_DisplayLuckMessage", "StExt_Str_Config_DisplayLuckMessage", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_DisplayMasteryLevelUp", "StExt_Str_Config_DisplayMasteryLevelUp", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);

	StExt_RegisterConfig("StExt_Config_Alch_DisplayOnScreen", "StExt_Str_Config_Alch_DisplayOnScreen", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Alch_PosX", "StExt_Str_Config_Alch_PosX", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Alch_PosY", "StExt_Str_Config_Alch_PosY", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_Artifact_DisplayOnScreen", "StExt_Str_Config_Artifact_DisplayOnScreen", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Artifact_ShowExpMessage", "StExt_Str_Config_Artifact_ShowExpMessage", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Artifact_PosX", "StExt_Str_Config_Artifact_PosX", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Artifact_PosY", "StExt_Str_Config_Artifact_PosY", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_Aura_DisplayOnScreen", "StExt_Str_Config_Aura_DisplayOnScreen", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_Aura_PosX", "StExt_Str_Config_Aura_PosX", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_Aura_PosY", "StExt_Str_Config_Aura_PosY", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_EsBar_DefaultPos", "StExt_Str_Config_EsBar_DefaultPos", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EsBar_PosX", "StExt_Str_Config_EsBar_PosX", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_EsBar_PosY", "StExt_Str_Config_EsBar_PosY", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_MenuPauseOnShow", "StExt_Str_Config_MenuPauseOnShow", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_MenuScaleX", "StExt_Str_Config_MenuScaleX", currentGroup, 35, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MenuScaleY", "StExt_Str_Config_MenuScaleY", currentGroup, 35, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MenuScrollMult", "StExt_Str_Config_MenuScrollMult", currentGroup, 10, 1000, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_ItemMenu_PosX", "StExt_Str_Config_ItemMenu_PosX", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_ItemMenu_PosY", "StExt_Str_Config_ItemMenu_PosY", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_MsgTray_PosX", "StExt_Str_Config_MsgTray_PosX", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);
	StExt_RegisterConfig("StExt_Config_MsgTray_PosY", "StExt_Str_Config_MsgTray_PosY", currentGroup, 0, 100, StExt_Value_DisplayType_Percent, true, true, true);

	StExt_RegisterConfig("StExt_Config_DisplayBuffEffects", "StExt_Str_Config_DisplayBuffEffects", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_DisplayEsEffects", "StExt_Str_Config_DisplayEsEffects", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);


	//****************************************************************
	//					*** Other configs ***
	//****************************************************************
	currentGroup = StExt_ConfigCat_Index_Other;
	
	StExt_RegisterConfig("StExt_Config_EnableSkeletonSkin", "StExt_Str_Config_EnableSkeletonSkin", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EnableSkeletonSkin_OnlyAtNight", "StExt_Str_Config_EnableSkeletonSkin_OnlyAtNight", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EnableFemaleSkin", "StExt_Str_Config_EnableFemaleSkin", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EnableFemaleSkin_AlwaysWig", "StExt_Str_Config_EnableFemaleSkin_AlwaysWig", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_EnableFemaleSkin_DemonLook", "StExt_Str_Config_EnableFemaleSkin_DemonLook", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_DisableEnchantedItemsEffects", "StExt_Str_Config_DisableEnchantedItemsEffects", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_HideHelm", "StExt_Str_Config_HideHelm", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);
	StExt_RegisterConfig("StExt_Config_NoChapterForMagicCircle", "StExt_Str_Config_NoChapterForMagicCircle", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, true, true, true);	
	
	StExt_RegisterConfig("StExt_Config_ExtraItemsDisplayMode", "StExt_Str_Config_ExtraItemsDisplayMode", currentGroup, 0, 100, StExt_Value_DisplayType_Default, false, true, true);
	StExt_RegisterConfig("StExt_Config_FoodBonusResetDay", "StExt_Str_Config_FoodBonusResetDay", currentGroup, 1, 1000, StExt_Value_DisplayType_Default, true, true, true);
	
	StExt_RegisterConfig("StExt_Config_DebugEnabled", "StExt_Str_Config_DebugEnabled", currentGroup, 0, 1, StExt_Value_DisplayType_Bool, false, true, true);
};


func void StExt_NotifyConfigsLoaded(var C_ConfigPreset preset)
{
	var string configName;
	var string text;
	var string debug;
	var string color;
	if (Hlp_IsNull(preset))
	{
		StExt_PrintDebugStack("StExt_NotifyConfigsLoaded() -> Config is Null!");
		return;
	};

	configName = preset.Name;
	text = concatstrings(StExt_Str_LoadedConfig, preset.Text);
	text = concatstrings(text, " (");
	text = concatstrings(text, configName);
	text = concatstrings(text, ")");
	color = preset.TextColor;
	if (StExt_StringIsEmpty(color)) { color = StExt_Color_Header; };
	
	//ai_printpos(text, 500, 2500, color, 1500, true);
	ai_printbonus(text);
	debug = "Configs preset '";
	debug = concatstrings(debug, configName);
	debug = concatstrings(debug , "' was loaded!");
	StExt_PrintDebugStack(debug);
};

func int StExt_ApplyConfig(var string configName)
{
	var C_ConfigPreset configPreset;
	var string text;
	text = concatstrings(" (", configName);
	text = concatstrings(text, ")");
	
	if (StExt_StringIsEmpty(configName))
	{
		StExt_PrintDebugStack("StExt_ApplyConfig() -> Config preset name is empty!");
		ai_printred(concatstrings(StExt_Str_UserConfigsNotFound, text));
		return false;
	};
	
	configPreset = StExt_GetConfigsPreset(configName);
	if (Hlp_IsNull(configPreset))
	{
		StExt_PrintDebug("StExt_ApplyConfig()", concatstrings(configName, " - not found!"), self, other);
		ai_printred(concatstrings(StExt_Str_UserConfigsNotFound, text));
		return false;
	};
	
	StExt_PrintDebugStack(concatstrings("StExt_ApplyConfig() -> Loading ", configName));
	StExt_ApplyConfigs_Default();
	if (!StExt_TryCallFunc(configPreset.OnApply))
	{
		StExt_PrintDebugStack("StExt_ApplyConfig() -> 'OnApply' Func not found!");		
		ai_printred(concatstrings(StExt_Str_UserConfigsFuncNotFound, text));
		return false;
	};
	StExt_ValidateConfigValues();
	StExt_CurrentUserConfigs = configPreset.Name;
	StExt_NotifyConfigsLoaded(configPreset);
	return true;
};

func int StExt_CheckConfigsPresetName()
{
	if (StExt_StringIsEmpty(StExt_CurrentUserConfigs))
	{
		if (StExt_SelectedConfigsIndex == StExt_ConfigIndex_Normal) { StExt_CurrentUserConfigs = "StExt_ConfigPreset_Normal"; }
		else if (StExt_SelectedConfigsIndex == StExt_ConfigIndex_Nightmare) { StExt_CurrentUserConfigs = "StExt_ConfigPreset_Nightmare"; }
		else if (StExt_SelectedConfigsIndex == StExt_ConfigIndex_Hell) { StExt_CurrentUserConfigs = "StExt_ConfigPreset_Hell"; }
		else if (StExt_SelectedConfigsIndex == StExt_ConfigIndex_User) { StExt_CurrentUserConfigs = "StExt_ConfigPreset_User"; }
		else
		{
			ai_printred(StExt_Str_UnknownConfig);
			StExt_CurrentUserConfigs = "StExt_ConfigPreset_Normal";
		};
		return true;
	}
	else if (StExt_SelectedConfigsIndex == StExt_ConfigIndex_Export) { return true; };
	return false;
};

func void StExt_Configure(var int skipConfigApply)
{	
	if (StExt_StringIsEmpty(StExt_CurrentUserConfigs))
	{
		ai_printred(StExt_Str_UnknownConfig);
		StExt_CurrentUserConfigs = "StExt_ConfigPreset_Normal";
		skipConfigApply = false;
	};
	
	if (skipConfigApply)
	{
		StExt_ValidateConfigValues();
		return;
	};
	
	if (!StExt_ApplyConfig(StExt_CurrentUserConfigs))
	{
		StExt_PrintDebug("StExt_Configure()", concatstrings(StExt_CurrentUserConfigs, " - not found!"), self, other);
		ai_printred(StExt_Str_UserConfigsNotFound);
		StExt_ApplyConfigs_Default();
		StExt_ApplyConfigs_Normal();
		StExt_CurrentUserConfigs = "StExt_ConfigPreset_Normal";
	};
	StExt_ValidateConfigValues();
	
	if (StExt_Config_Diff_EnableDaily || StExt_Config_Diff_EnableKapitel) { ai_printred(StExt_Str_DisplayModDailyGrowDiffNotify); };
};

func void StExt_LoadSaveConfigs()
{
	var string msg;
	if (!StExt_ModInitialized) { return; };
	
	StExt_PrintDebugStack("StExt_LoadSaveConfigs()");
	if (!StExt_StringIsEmpty(StExt_CurrentItemGeneratorConfigs))
	{
		if (StExt_SetItemGeneratorConfigs(StExt_CurrentItemGeneratorConfigs)) 
		{ 
			ai_printbonus(concatstrings(StExt_Str_LoadedConfig, StExt_CurrentItemGeneratorConfigs));
			StExt_CurrentItemGeneratorConfigs = StExt_CurrentItemGeneratorConfigs;		
		}
		else 
		{ 
			msg = StExt_Str_UserConfigsNotFound;
			msg = concatstrings(msg, " (");
			msg = concatstrings(msg, StExt_CurrentItemGeneratorConfigs);
			msg = concatstrings(msg, ")");
			ai_printred(msg);
			StExt_CurrentItemGeneratorConfigs = StExt_EmptyString;
			StExt_ResetItemGeneratorConfigs();
		};
	};
	StExt_Configure(true);
};

// Register default presets
func event StExt_Evt_OnModLoaded()
{
	StExt_RegistrateConfigsPreset("StExt_ConfigPreset_Normal");
	StExt_RegistrateConfigsPreset("StExt_ConfigPreset_Nightmare");
	StExt_RegistrateConfigsPreset("StExt_ConfigPreset_Hell");
};

func void StExt_ExportCurrentConfigs_Script()
{
	var string result;
	if (StExt_ExportCurrentConfigs()) 
	{
		result = concatstrings(StExt_ReturnString, " ");
		ai_printbonus(concatstrings(result, StExt_Str_Done));
	}
	else { ai_printred(StExt_Str_ExportCurrentConfigs_Failed); };
};

func void StExt_SelectConfigs_Script() { StExt_ApplyConfig(StExt_ReturnString); };