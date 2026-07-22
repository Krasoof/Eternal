instance StExt_ConfigPreset_Normal(C_ConfigPreset)
{
	Name = "StExt_ConfigPreset_Normal";
	Text = StExt_Str_DiffLevel[1];
	TextColor = StExt_Color_Green;
	OnApply = "StExt_ApplyConfigs_Normal";
};

instance StExt_ConfigPreset_Nightmare(C_ConfigPreset)
{
	Name = "StExt_ConfigPreset_Nightmare";
	Text = StExt_Str_DiffLevel[2];
	TextColor = StExt_Color_Orange;
	OnApply = "StExt_ApplyConfigs_Nightmare";
};

instance StExt_ConfigPreset_Hell(C_ConfigPreset)
{
	Name = "StExt_ConfigPreset_Hell";
	Text = StExt_Str_DiffLevel[3];
	TextColor = StExt_Color_Red;
	OnApply = "StExt_ApplyConfigs_Hell";
};

func void StExt_ApplyConfigs_Default()
{
	//****************************************************************
	//				*** Difficulty configs ***
	//****************************************************************
	StExt_Config_Diff_EnableStatic = true;
	StExt_Config_Diff_Static_Power = 10;
	StExt_Config_Diff_Static_Hp = 25;
	StExt_Config_Diff_Static_Prot = 10;

	StExt_Config_Diff_EnableDaily = true;
	StExt_Config_Diff_Daily_Power = 1;
	StExt_Config_Diff_Daily_Hp = 1;
	StExt_Config_Diff_Daily_Prot = 1;

	StExt_Config_Diff_EnableKapitel = true;
	StExt_Config_Diff_Kapitel_Power = 10;
	StExt_Config_Diff_Kapitel_Hp = 25;
	StExt_Config_Diff_Kapitel_Prot = 10;
	StExt_Config_Diff_Kapitel_Speed = 1;

	StExt_Config_Diff_Kapitel_Npc_Duplication_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_Duplication_Count = 1;
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = 25;	
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance = 15;
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange = 0;
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Power = 10;
	StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = 50;
	StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = 50;
	StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_RandomShield_Chance = 50;
	StExt_Config_Diff_Kapitel_Npc_RandomHelm_Chance = 50;

	StExt_Config_Diff_Kapitel_DailyHpMod = 0;
	StExt_Config_Diff_Kapitel_DailyPowerMod = 0;
	StExt_Config_Diff_Kapitel_DailyProtMod = 0;
	
	// EnableLevel WLACZONE wylacznie pod infuzje (2026-07-23, user: "HP skaluje
	// sie z lvl mocniej"): wszystkie Diff_Level_* globalnego ratio zostaja 0,
	// wiec rx_monsterhpratio NIE rosnie (bossow nie wolno ruszac - saga Angela).
	// Realny efekt ma tylko Level_MagicInfusionPower (moc/HP infuzowanych).
	StExt_Config_Diff_EnableLevel = true;
	StExt_Config_Diff_Level_Power = 0;
	StExt_Config_Diff_Level_Hp = 0;
	StExt_Config_Diff_Level_Prot = 0;
	StExt_Config_Diff_Level_Speed = 0;
	StExt_Config_Diff_Level_DuplicationChance = 0;
	StExt_Config_Diff_Level_CorruptionChance = 0;
	StExt_Config_Diff_Level_MagicInfusionChance = 0;
	StExt_Config_Diff_Level_MagicInfusionPower = 2;

	//****************************************************************
	//					*** Npc configs ***
	//****************************************************************
	StExt_Config_Npc_EnableStatsRandomization = true;
	StExt_Config_Npc_StatsRandomization_Hp = 10;
	StExt_Config_Npc_StatsRandomization_Stats = 5;
	StExt_Config_Npc_StatsRandomization_Protection = 5;
	StExt_Config_Npc_StatsRandomization_Damage = 5;

	StExt_Config_Npc_EnableLevelBonus = true;
	StExt_Config_Npc_LevelBonus_Hp = 25;
	StExt_Config_Npc_LevelBonus_Stats = 5;
	StExt_Config_Npc_LevelBonus_Protection = 5;
	StExt_Config_Npc_LevelBonus_Damage = 5;

	StExt_Config_Npc_EnableDuplication = true;
	StExt_Config_Npc_Duplication_Chance = 100;
	StExt_Config_Npc_Duplication_CountMin = 1;
	StExt_Config_Npc_Duplication_CountMax = 2;
	StExt_Config_Npc_Duplication_AllowBosses = false;
	StExt_Config_Npc_Duplication_AllowHumans = true;
	StExt_Config_Npc_Duplication_AllowHumansBandits = true;
	StExt_Config_Npc_Duplication_LevelThreshold = 0;

	StExt_Config_Npc_EnableMagicInfusion = true;
	StExt_Config_Npc_MagicInfusion_Chance = 100;
	StExt_Config_Npc_MagicInfusion_LevelThreshold = 0;
	StExt_Config_Npc_MagicInfusion_PowerMod = 25;
	StExt_Config_Npc_MagicInfusion_AllowHumans = true;
	StExt_Config_Npc_MagicInfusion_AllowBosses = false;
	StExt_Config_Npc_MagicInfusion_CorruptionChance = 50;
	StExt_Config_Npc_MagicInfusion_HumansExtraChance = 0;
	StExt_Config_Npc_MagicInfusion_BossesExtraChance = 500;

	StExt_Config_Npc_EnableRandomEquipment = true;
	StExt_Config_Npc_RandomMeleeWeapon_Chance = 150;
	StExt_Config_Npc_RandomRangeWeapon_Chance = 150;
	StExt_Config_Npc_RandomScroll_Chance = 50;
	StExt_Config_Npc_HealingScroll_Chance = 50;
	StExt_Config_Npc_RandomShield_Chance = 150;
	StExt_Config_Npc_RandomHelm_Chance = 100;

	StExt_Config_Npc_MagicInfusedAlwaysHasRandomEquipment = true;

	StExt_Config_Npc_LuckyFlagChance = 5;
	StExt_Config_Npc_RichFlagChance = 10;

	StExt_Config_Npc_GlobalHpMult = 100;
	StExt_Config_Npc_GlobalEsMult = 100;
	StExt_Config_Npc_GlobalStatMult = 100;
	StExt_Config_Npc_GlobalProtMult = 100;
	StExt_Config_Npc_GlobalDamMult = 100;
	
	// 140: infuzowani maja byc ELITA takze po podbiciu zwyklych mobow (mnozy
	// sie z MobHpMult 180 z TierFloor => lacznie ~x2.5 dzisiejszego HP).
	// Infuzja ma twardy straznik bossow (rx_isboss, MagicInfusionController:311).
	StExt_Config_Npc_InfusionHpMult = 140;
	StExt_Config_Npc_InfusionEsMult = 100;
	StExt_Config_Npc_InfusionStatMult = 100;
	StExt_Config_Npc_InfusionProtMult = 100;
	StExt_Config_Npc_InfusionDamMult = 100;
	
	StExt_Config_NpcSum_CanBeDuplicated = false;
	StExt_Config_NpcSum_CanBeInfused = true;
	StExt_Config_NpcSum_GlobalHpMult = 100;
	StExt_Config_NpcSum_GlobalEsMult = 100;
	StExt_Config_NpcSum_GlobalStatMult = 100;
	StExt_Config_NpcSum_GlobalProtMult = 100;
	StExt_Config_NpcSum_GlobalDamMult = 100;

	StExt_Config_Sum_GlobalHpMult = 100;
	StExt_Config_Sum_GlobalStatMult = 100;
	StExt_Config_Sum_GlobalProtMult = 100;
	StExt_Config_Sum_GlobalDamMult = 100;

	StExt_Config_Npc_SummonsCanHaveOwnSummons = false;
	StExt_Config_Npc_CantUseSpellAbilities = false;
	StExt_Config_Npc_CantUseBuffAbilities = false;
	StExt_Config_Npc_CantUseSummonAbilities = false;

	//****************************************************************
	//					*** Luck configs ***
	//****************************************************************
	StExt_Config_Luck_Difficulty = 100;
	StExt_Config_Luck_Power = 0;
	StExt_Config_Luck_Quantity = 0;
	StExt_Config_Luck_Money = 0;

	StExt_Config_Luck_EnableRandomLoot_Bodies = true;
	StExt_Config_Luck_EnableRandomLoot_Chests = true;
	StExt_Config_Luck_RandomLoot_EnableUnHumanDrop = false;

	StExt_Config_Luck_RandomLootPowerMod_Food = 10;
	StExt_Config_Luck_RandomLootPowerMod_Alchemy = 10;
	StExt_Config_Luck_RandomLootPowerMod_Magic = 10;
	StExt_Config_Luck_RandomLootPowerMod_Misk = 10;
	StExt_Config_Luck_RandomLootPowerMod_Armor = 10;
	StExt_Config_Luck_RandomLootPowerMod_Weapon = 10;
	StExt_Config_Luck_RandomLootPowerMod_Jewelry = 10;

	StExt_Config_Luck_RandomLootQuantityMod_Food = 10;
	StExt_Config_Luck_RandomLootQuantityMod_Alchemy = 10;
	StExt_Config_Luck_RandomLootQuantityMod_Magic = 10;
	StExt_Config_Luck_RandomLootQuantityMod_Munition = 10;
	StExt_Config_Luck_RandomLootQuantityMod_Misk = 10;

	StExt_Config_Luck_ChanceForEnchantedDrop = 100;
	StExt_Config_Luck_RelativeDropChance_Food = 350;
	StExt_Config_Luck_RelativeDropChance_Alchemy = 150;
	StExt_Config_Luck_RelativeDropChance_Magic = 100;
	StExt_Config_Luck_RelativeDropChance_Misk = 500;
	StExt_Config_Luck_RelativeDropChance_Munition = 250;
	StExt_Config_Luck_RelativeDropChance_Armors = 50;
	StExt_Config_Luck_RelativeDropChance_Jewelry = 50;
	StExt_Config_Luck_RelativeDropChance_MagicWeapons = 100;
	StExt_Config_Luck_RelativeDropChance_MeeleWeapons = 100;
	StExt_Config_Luck_RelativeDropChance_RangeWeapons = 100;


	//****************************************************************
	//			*** World randomization configs ***
	//****************************************************************
	StExt_Config_EnableWorldRandomization_Items = true;
	StExt_Config_EnableWorldRandomization_Npc = true;
	StExt_Config_EnableWorldRandomization_ByTimeEvents = true;
	StExt_Config_WorldRandomization_MinCooldown = 300;
	StExt_Config_WorldRandomization_MaxCooldown = 300;
	StExt_Config_WorldRandomization_Npc_SpawnChance = 350;
	StExt_Config_WorldRandomization_Npc_SpawnPowerMod = 100;
	StExt_Config_WorldRandomization_Npc_SpawnPower_LevelMod = 100;
	StExt_Config_WorldRandomization_Npc_SpawnPower_KapitelMod = 100;
	StExt_Config_WorldRandomization_Npc_SpawnPower_DayMod = 100;
	StExt_Config_WorldRandomization_Npc_SpawnCountMod = 100;
	StExt_Config_WorldRandomization_Item_SpawnChance = 350;
	StExt_Config_WorldRandomization_Item_SpawnPowerMod = 100;
	StExt_Config_WorldRandomization_Item_SpawnCountMod = 100;
	
	StExt_Config_WorldRandomization_EnableChestUpdate = true;	
	StExt_Config_WorldRandomization_TradersExtraItemsAddRate = 7;
	StExt_Config_WorldRandomization_EmptyChestsUpdateRate = 1;
	StExt_Config_WorldRandomization_EmptyChestsUpdateCount = 1;	
	StExt_Config_WorldRandomization_PutInAnyChest = false;
	StExt_Config_WorldRandomization_LockChest = true;
	
	StExt_Config_WorldRandomization_EnableRandomBandits = true;
	StExt_Config_WorldRandomization_FamaleBanditChance = 35;
	StExt_Config_WorldRandomization_BanditsPacksSpawnRate = 3;
	StExt_Config_WorldRandomization_BanditsPacksPerSpawn = 1;
	StExt_Config_WorldRandomization_BanditsPowerMult = 100;
	StExt_Config_WorldRandomization_BanditsCountMin = 1;
	StExt_Config_WorldRandomization_BanditsCountMax = 3;
	StExt_Config_WorldRandomization_BanditsCountBonusPerKapitel = 1;

	//****************************************************************
	//					*** Other configs ***
	//****************************************************************
	/*
	StExt_Config_EnableSkeletonSkin = false;
	StExt_Config_EnableSkeletonSkin_OnlyAtNight = false;
	StExt_Config_EnableFemaleSkin = false;
	StExt_Config_EnableFemaleSkin_AlwaysWig = false;
	StExt_Config_EnableFemaleSkin_DemonLook = false;
	StExt_Config_DisableEnchantedItemsEffects = false;	
	StExt_Config_HideHelm = false;
	*/
	
	StExt_Config_GainExpMod = 100;
	StExt_Config_GainExpRandomMod = 0;
	StExt_Config_ExpMod = 0;
	StExt_Config_SncExp = 100;
	StExt_Config_PartyExp = 100;
	StExt_Config_NpcExp = 100;
	StExt_Config_BelliarRageExp = 70;

	StExt_Config_ExtraLp = 0;
	StExt_Config_ExtraHpPerLevel = 0;
	StExt_Config_ExtraMpPerLevel = 0;
	StExt_Config_ExtraEsPerLevel = 0;
	StExt_Config_ExtraStrPerLevel = 0;
	StExt_Config_ExtraAgiPerLevel = 0;
	StExt_Config_ExtraIntPerLevel = 0;
	StExt_Config_ExtraLuckPerLevel = 0;
	
	/*
	StExt_Config_BelliarRage_Active = false;
	StExt_Config_BelliarRage_SpawnMonsters = false;
	StExt_Config_BelliarRage_StaminaReduce = false;
	StExt_Config_BelliarRage_AddDamageReduce = false;
	StExt_Config_BelliarRage_RegenEnemies = false;
	StExt_Config_BelliarRage_SoundEnable = false;
	*/
	
	StExt_Config_MasteriesExpMult = 100;
	StExt_Config_CorruptionExpMult = 100;
	StExt_Config_ArtifactsExpMult = 100;
	StExt_Config_ArtifactsUpgradeCostMult = 100;
	StExt_Config_EducationMoneyCostMult = 100;
	StExt_Config_EducationRequirementsMult = 100;
	StExt_Config_CorruptionTouchExp = 100;
	StExt_Config_DamageReductionExpRate = 50;
	
	StExt_Config_MasteryExpMult_Fire = 100;
	StExt_Config_MasteryExpMult_Ice = 100;
	StExt_Config_MasteryExpMult_Electric = 100;
	StExt_Config_MasteryExpMult_Air = 100;
	StExt_Config_MasteryExpMult_Earth = 100;
	StExt_Config_MasteryExpMult_Light = 100;
	StExt_Config_MasteryExpMult_Dark = 100;
	StExt_Config_MasteryExpMult_Death = 100;
	StExt_Config_MasteryExpMult_Life = 100;
	StExt_Config_MasteryExpMult_Golem = 100;
	StExt_Config_MasteryExpMult_Demon = 100;
	StExt_Config_MasteryExpMult_Necro = 100;
	StExt_Config_MasteryExpMult_Shaman = 100;
	StExt_Config_MasteryExpMult_MartialArts = 100;
	StExt_Config_MasteryExpMult_Agile = 100;
	StExt_Config_MasteryExpMult_Archery = 100;
	StExt_Config_MasteryExpMult_Blood = 100;
	StExt_Config_MasteryExpMult_FistFight = 100;
	StExt_Config_MasteryExpMult_Aura = 100;
	StExt_Config_MasteryExpMult_Traps = 100;
	StExt_Config_MasteryExpMult_Poision = 100;

	
	StExt_Config_NoChapterForMagicCircle = false;
	//StExt_Config_DisplayBuffEffects = false;
	//StExt_Config_DisplayEsEffects = true;
	StExt_Config_ExtraItemsDisplayMode = StExt_ExtraItemsDisplayMode_UnderArmor;
	StExt_Config_FoodBonusResetDay = 7;
};

//				*** Presets ***

func void StExt_ApplyConfigs_Normal()
{
	StExt_PrintDebugStack("StExt_ApplyConfigs_Normal() -> Loading...");
	StExt_ApplyConfigs_Default();
	
	//****************************************************************
	//				*** Difficulty configs ***
	//****************************************************************
	StExt_Config_Diff_EnableStatic = true;
	StExt_Config_Diff_Static_Power = 10;
	StExt_Config_Diff_Static_Hp = 10;
	StExt_Config_Diff_Static_Prot = 10;

	StExt_Config_Diff_EnableDaily = true;
	StExt_Config_Diff_Daily_Power = 1;
	StExt_Config_Diff_Daily_Hp = 1;
	StExt_Config_Diff_Daily_Prot = 1;

	StExt_Config_Diff_EnableKapitel = true;
	StExt_Config_Diff_Kapitel_Power = 5;
	StExt_Config_Diff_Kapitel_Hp = 5;
	StExt_Config_Diff_Kapitel_Prot = 5;

	//****************************************************************
	//					*** Npc configs ***
	//****************************************************************
	StExt_Config_Npc_EnableStatsRandomization = true;
	StExt_Config_Npc_StatsRandomization_Hp = 10;
	StExt_Config_Npc_StatsRandomization_Stats = 10;
	StExt_Config_Npc_StatsRandomization_Protection = 5;
	StExt_Config_Npc_StatsRandomization_Damage = 5;
};

func void StExt_ApplyConfigs_Nightmare()
{
	StExt_PrintDebugStack("StExt_ApplyConfigs_Nightmare() -> Loading...");
	StExt_ApplyConfigs_Default();
	
	//****************************************************************
	//				*** Difficulty configs ***
	//****************************************************************
	StExt_Config_Diff_EnableStatic = true;
	StExt_Config_Diff_Static_Power = 20;
	StExt_Config_Diff_Static_Hp = 25;
	StExt_Config_Diff_Static_Prot = 20;

	StExt_Config_Diff_EnableDaily = true;
	StExt_Config_Diff_Daily_Power = 1;
	StExt_Config_Diff_Daily_Hp = 2;
	StExt_Config_Diff_Daily_Prot = 1;

	StExt_Config_Diff_EnableKapitel = true;
	StExt_Config_Diff_Kapitel_Power = 15;
	StExt_Config_Diff_Kapitel_Hp = 15;
	StExt_Config_Diff_Kapitel_Prot = 15;	
	StExt_Config_Diff_Kapitel_Speed = 3;

	StExt_Config_Diff_Kapitel_Npc_Duplication_Chance = 10;
	StExt_Config_Diff_Kapitel_Npc_Duplication_Count = 10;
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = 10;
	StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = 10;
	StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = 10;
	StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance = 10;
	StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance = 10;

	//****************************************************************
	//					*** Npc configs ***
	//****************************************************************
	StExt_Config_Npc_EnableStatsRandomization = true;
	StExt_Config_Npc_StatsRandomization_Hp = 20;
	StExt_Config_Npc_StatsRandomization_Stats = 15;
	StExt_Config_Npc_StatsRandomization_Protection = 10;
	StExt_Config_Npc_StatsRandomization_Damage = 10;

	StExt_Config_Npc_EnableLevelBonus = true;
	StExt_Config_Npc_LevelBonus_Hp = 15;
	StExt_Config_Npc_LevelBonus_Stats = 10;
	StExt_Config_Npc_LevelBonus_Protection = 2;
	StExt_Config_Npc_LevelBonus_Damage = 2;

	StExt_Config_Npc_EnableDuplication = true;
	StExt_Config_Npc_Duplication_Chance = 150;
	StExt_Config_Npc_Duplication_CountMax = 3;
	StExt_Config_Npc_Duplication_LevelThreshold = 3;

	StExt_Config_Npc_MagicInfusion_Chance = 150;
	StExt_Config_Npc_MagicInfusion_LevelThreshold = 3;
	StExt_Config_Npc_MagicInfusion_PowerMod = 25;
	StExt_Config_Npc_MagicInfusion_CorruptionChance = 50;

	StExt_Config_Npc_EnableRandomEquipment = true;
	StExt_Config_Npc_RandomMeleeWeapon_Chance = 200;
	StExt_Config_Npc_RandomRangeWeapon_Chance = 200;
	StExt_Config_Npc_RandomScroll_Chance = 200;
	StExt_Config_Npc_HealingScroll_Chance = 200;

	StExt_Config_Npc_LuckyFlagChance = 7;
	StExt_Config_Npc_RichFlagChance = 7;

	//****************************************************************
	//					*** Luck configs ***
	//****************************************************************
	StExt_Config_Luck_Difficulty = 150;
	StExt_Config_Luck_Money = -25;

	//****************************************************************
	//			*** World randomization configs ***
	//****************************************************************
	StExt_Config_WorldRandomization_Npc_SpawnChance = 600;
	StExt_Config_WorldRandomization_Item_SpawnChance = 400;
	StExt_Config_WorldRandomization_Npc_SpawnPowerMod = 150;
	StExt_Config_WorldRandomization_Npc_SpawnCountMod = 25;

	//****************************************************************
	//					*** Other configs ***
	//****************************************************************
	StExt_Config_EducationMoneyCostMult = 150;
	StExt_Config_EducationRequirementsMult = 125;
};

func void StExt_ApplyConfigs_Hell()
{
	StExt_PrintDebugStack("StExt_ApplyConfigs_Hell() -> Loading...");
	StExt_ApplyConfigs_Default();
	
	//****************************************************************
	//				*** Difficulty configs ***
	//****************************************************************
	StExt_Config_Diff_EnableStatic = true;
	StExt_Config_Diff_Static_Power = 35;
	StExt_Config_Diff_Static_Hp = 50;
	StExt_Config_Diff_Static_Prot = 35;

	StExt_Config_Diff_EnableDaily = true;
	StExt_Config_Diff_Daily_Power = 2;
	StExt_Config_Diff_Daily_Hp = 2;
	StExt_Config_Diff_Daily_Prot = 2;

	StExt_Config_Diff_EnableKapitel = true;
	StExt_Config_Diff_Kapitel_Power = 30;
	StExt_Config_Diff_Kapitel_Hp = 30;
	StExt_Config_Diff_Kapitel_Prot = 30;
	StExt_Config_Diff_Kapitel_Speed = 5;

	StExt_Config_Diff_Kapitel_Npc_Duplication_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance = 25;
	StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance = 25;
	StExt_Config_Diff_Kapitel_DailyHpMod = 1;

	//****************************************************************
	//					*** Npc configs ***
	//****************************************************************
	StExt_Config_Npc_EnableStatsRandomization = true;
	StExt_Config_Npc_StatsRandomization_Hp = 25;
	StExt_Config_Npc_StatsRandomization_Stats = 25;
	StExt_Config_Npc_StatsRandomization_Protection = 25;
	StExt_Config_Npc_StatsRandomization_Damage = 25;

	StExt_Config_Npc_EnableLevelBonus = true;
	StExt_Config_Npc_LevelBonus_Hp = 25;
	StExt_Config_Npc_LevelBonus_Stats = 15;
	StExt_Config_Npc_LevelBonus_Protection = 5;
	StExt_Config_Npc_LevelBonus_Damage = 5;

	StExt_Config_Npc_EnableDuplication = true;
	StExt_Config_Npc_Duplication_Chance = 250;
	StExt_Config_Npc_Duplication_CountMin = 2;
	StExt_Config_Npc_Duplication_CountMax = 3;
	StExt_Config_Npc_Duplication_LevelThreshold = 1;

	StExt_Config_Npc_EnableMagicInfusion = true;
	StExt_Config_Npc_MagicInfusion_Chance = 250;
	StExt_Config_Npc_MagicInfusion_LevelThreshold = 1;
	StExt_Config_Npc_MagicInfusion_PowerMod = 50;
	StExt_Config_Npc_MagicInfusion_CorruptionChance = 100;

	StExt_Config_Npc_EnableRandomEquipment = true;
	StExt_Config_Npc_RandomMeleeWeapon_Chance = 300;
	StExt_Config_Npc_RandomRangeWeapon_Chance = 300;
	StExt_Config_Npc_RandomScroll_Chance = 300;
	StExt_Config_Npc_HealingScroll_Chance = 300;

	StExt_Config_Npc_LuckyFlagChance = 5;
	StExt_Config_Npc_RichFlagChance = 5;

	//****************************************************************
	//					*** Luck configs ***
	//****************************************************************
	StExt_Config_Luck_Difficulty = 200;
	StExt_Config_Luck_Power = -25;
	StExt_Config_Luck_Quantity = -25;
	StExt_Config_Luck_Money = -50;

	//****************************************************************
	//			*** World randomization configs ***
	//****************************************************************
	StExt_Config_EnableWorldRandomization_Items = true;
	StExt_Config_EnableWorldRandomization_Npc = true;
	StExt_Config_EnableWorldRandomization_ByTimeEvents = true;
	StExt_Config_WorldRandomization_MinCooldown = 300;
	StExt_Config_WorldRandomization_MaxCooldown = 600;
	StExt_Config_WorldRandomization_Npc_SpawnChance = 250;
	StExt_Config_WorldRandomization_Npc_SpawnPowerMod = 250;
	StExt_Config_WorldRandomization_Npc_SpawnCountMod = 50;
	StExt_Config_WorldRandomization_Item_SpawnChance = 250;
	StExt_Config_WorldRandomization_Item_SpawnPowerMod = -50;
	StExt_Config_WorldRandomization_Item_SpawnCountMod = -50;

	//****************************************************************
	//					*** Other configs ***
	//****************************************************************
	StExt_Config_EducationMoneyCostMult = 200;
	StExt_Config_EducationRequirementsMult = 150;
	StExt_Config_NoChapterForMagicCircle = false;	
};
