META
{
    Mod = EthernalBreeze.vdf;
};
// DO NOT edit or change meta-block above!
// DO NOT place any symbols, coments or even empty line/space before this code.


	//*************************************************************************************
	// 							*** Configuration tips ***
	//
	// 	Do not broke syntax - make sure end of line finished by ';' (except of coment)
	// 	Also be shure that all values here must be contained inside 'StExt_UserConfigs' function
	//
	//		'//' is comment. comented line not compile.
	// 		'true' means 1 or ON
	// 		'false' means 0 or OFF
	// 		‰ is permilled value. means 1000->100%; 10->1% 1->0.1%
	// 		in some cases 0 in numeric values means that function will be disabled
	//		set X and Y coordinates between 0 and 100 (for Ui)
	//
	//*************************************************************************************

instance StExt_ConfigPreset_User(C_ConfigPreset)
{
	Name = "StExt_ConfigPreset_User";
	Text = StExt_Str_DiffLevel[4];
	TextColor = StExt_Color_Corruption;
	OnApply = "StExt_UserConfigs";
};

// Register default presets
func event StExt_Evt_OnModLoaded() { StExt_RegistrateConfigsPreset("StExt_ConfigPreset_User"); };	

// This function calls by mod when apply user configs
func void StExt_UserConfigs() 
{
	//****************************************************************
	//				*** Difficulty configs ***
	//****************************************************************
	
	// Вкл/откл спавн из RoadOfTrial. (true - да, false - нет).
	StExt_Config_Diff_EnableRot = false;
	
	// Вкл/откл статическую прибавку сложности. (true - да, false - нет).
	StExt_Config_Diff_EnableStatic = true;	
	// Статическая прибавка мощи для врагов в % (минимум 0, максимум 500).
	StExt_Config_Diff_Static_Power = 10;	
	// Статическая прибавка здоровья для врагов в % (минимум 0, максимум 500).
	StExt_Config_Diff_Static_Hp = 25;	
	// Статическая прибавка защиты для врагов в % (минимум 0, максимум 500).
	StExt_Config_Diff_Static_Prot = 10;


	// Вкл/откл ежедневный рост сложности. (true - да, false - нет).
	StExt_Config_Diff_EnableDaily = true;
	// Ежедневный рост мощи у врагов в % (минимум 0, максимум 10).
	StExt_Config_Diff_Daily_Power = 1;
	// Ежедневный рост здоровья у врагов в % (минимум 0, максимум 10).
	StExt_Config_Diff_Daily_Hp = 1;
	// Ежедневный рост защиты у врагов в % (минимум 0, максимум 10).
	StExt_Config_Diff_Daily_Prot = 1;
	
	
	// Вкл/откл рост сложности по главам. (true - да, false - нет).
	StExt_Config_Diff_EnableKapitel = true;
	// Рост мощи у врагов в следуйщей главе в % (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Power = 10;
	// Рост здоровья у врагов в следуйщей главе в % (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Hp = 25;
	// Рост защиты у врагов в следуйщей главе в % (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Prot = 10;
	// Рост скорости у врагов в следуйщей главе в % (минимум 0, максимум 10).
	StExt_Config_Diff_Kapitel_Speed = 5;


	// Дополнительный бонус к росту шанса на дублирование врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_Duplication_Chance = 25;
	// Дополнительный рост количества дублированых врагов в следующей главе (минимум 0, максимум 3).
	StExt_Config_Diff_Kapitel_Npc_Duplication_Count = 1;
	// Дополнительный бонус к росту шанса магического насыщения у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = 25;
	// Дополнительный бонус к росту шанса осквернения магического насыщения у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance = 15;
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange = 0;
	// Дополнительный бонус к росту мощи магического насыщения у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Power = 10;
	// Дополнительный бонус к росту шанса появления магического оружия ближнего боя у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = 50;
	// Дополнительный бонус к росту шанса появления магического оружия дальнего боя у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = 50;
	// Дополнительный бонус к росту шанса появления атакующего свитка у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance = 25;
	// Дополнительный бонус к росту шанса появления свитка лечения у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance = 25;
	// Дополнительный бонус к росту шанса появления щита у врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_RandomShield_Chance = 50;
	// Дополнительный бонус к росту шанса появления шлема у людей-врагов в следующей главе в ‰ (минимум 0, максимум 100).
	StExt_Config_Diff_Kapitel_Npc_RandomHelm_Chance = 50;
	
	// Дополнительный бонус ежедневного роста здоровья у врагов в следующей главе в % (минимум 0, максимум 10).
	StExt_Config_Diff_Kapitel_DailyHpMod = 0;
	// Дополнительный бонус ежедневного роста мощи у врагов в следующей главе в % (минимум 0, максимум 10).
	StExt_Config_Diff_Kapitel_DailyPowerMod = 0;
	// Дополнительный бонус ежедневного роста защиты у врагов в следующей главе в % (минимум 0, максимум 10).
	StExt_Config_Diff_Kapitel_DailyProtMod = 0;
	
	
	// Вкл/откл рост сложности от уровня героя. (true - да, false - нет).
	StExt_Config_Diff_EnableLevel = false;
	StExt_Config_Diff_Level_Power = 0;
	StExt_Config_Diff_Level_Hp = 0;
	StExt_Config_Diff_Level_Prot = 0;
	StExt_Config_Diff_Level_Speed = 0;
	StExt_Config_Diff_Level_DuplicationChance = 0;
	StExt_Config_Diff_Level_CorruptionChance = 0;
	StExt_Config_Diff_Level_MagicInfusionChance = 0;
	StExt_Config_Diff_Level_MagicInfusionPower = 0;

	//****************************************************************
	//					*** Npc configs ***
	//****************************************************************
	
	// Вкл/откл разброс характеристик у врагов. (true - да, false - нет).
	StExt_Config_Npc_EnableStatsRandomization = true;
	// Дополнительное здоровье у врагов при разбросе характеристик (минимум 0, максимум 50).
	StExt_Config_Npc_StatsRandomization_Hp = 10;
	// Дополнительные характеристики у врагов при разбросе характеристик (минимум 0, максимум 50).
	StExt_Config_Npc_StatsRandomization_Stats = 5;
	// Дополнительная защита у врагов при разбросе характеристик (минимум 0, максимум 50).
	StExt_Config_Npc_StatsRandomization_Protection = 5;
	// Дополнительный урон у врагов при разбросе характеристик (минимум 0, максимум 50).
	StExt_Config_Npc_StatsRandomization_Damage = 5;


	// Вкл/откл уровневый бонус врагов. (true - да, false - нет).
	StExt_Config_Npc_EnableLevelBonus = true;
	// Дополнительное здоровье за уровень врага в % (минимум 0, максимум 100).
	StExt_Config_Npc_LevelBonus_Hp = 25;
	// Дополнительные характеристики за уровень врага в % (минимум 0, максимум 100).
	StExt_Config_Npc_LevelBonus_Stats = 5;
	// Дополнительная защита за уровень у врагов в % (минимум 0, максимум 50).
	StExt_Config_Npc_LevelBonus_Protection = 5;
	// Дополнительный урон за уровень у врагов в % (минимум 0, максимум 50).
	StExt_Config_Npc_LevelBonus_Damage = 5;


	// Вкл/откл дублирование врагов. (true - да, false - нет).
	StExt_Config_Npc_EnableDuplication = true;
	// Шанс дублирования врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_Duplication_Chance = 100;
	// Максимальное количество дублирования врагов (минимум 1, максимум 8).
	StExt_Config_Npc_Duplication_CountMin = 1;
	// Максимальное количество дублирования врагов (минимум 1, максимум 12).
	StExt_Config_Npc_Duplication_CountMax = 2;
	// Вкл/откл дублирование боссов. (true - да, false - нет).
	StExt_Config_Npc_Duplication_AllowBosses = false;
	// Вкл/откл дублирование людей. (true - да, false - нет).
	StExt_Config_Npc_Duplication_AllowHumans = true;
	// Вкл/откл дублирование людей-бандитов. (true - да, false - нет).
	StExt_Config_Npc_Duplication_AllowHumansBandits = true;
	// Минимальный уровень героя для начала дублирования врагов (минимум 0, максимум 50).
	StExt_Config_Npc_Duplication_LevelThreshold = 0;

	// Вкл/откл магическое насыщение врагов. (true - да, false - нет).
	StExt_Config_Npc_EnableMagicInfusion = true;
	// Шанс магического насыщения врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_MagicInfusion_Chance = 100;
	// Минимальный уровень героя для начала магического насыщения врагов (минимум 0, максимум 50).
	StExt_Config_Npc_MagicInfusion_LevelThreshold = 0;
	// Модификатор силы магического насыщения у врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_MagicInfusion_PowerMod = 25;
	// Вкл/откл магическое насыщение врагов-людей. (true - да, false - нет).
	StExt_Config_Npc_MagicInfusion_AllowHumans = true;
	// Вкл/откл магическое насыщение врагов-боссов. (true - да, false - нет).
	StExt_Config_Npc_MagicInfusion_AllowBosses = false;
	// Шанс освернения аффиксов у врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_MagicInfusion_CorruptionChance = 50;
	StExt_Config_Npc_MagicInfusion_HumansExtraChance = 0;
	StExt_Config_Npc_MagicInfusion_BossesExtraChance = 500;


	//Вкл/откл случайное оружие у врагов. (true - да, false - нет).
	StExt_Config_Npc_EnableRandomEquipment = true;
	// Шанс появления магического оружие ближнего боя у врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_RandomMeleeWeapon_Chance = 150;
	// Шанс появления магического оружие дальнего боя у врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_RandomRangeWeapon_Chance = 150;
	// Шанс появления атакующего свитка у врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_RandomScroll_Chance = 50;
	// Шанс появления свитка лечения у врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_HealingScroll_Chance = 50;
	// Шанс появления щита у врагов в ‰ (минимум 0, максимум 1000).	
	StExt_Config_Npc_RandomShield_Chance = 150;
	// Шанс появления шлема у врагов-людей в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_RandomHelm_Chance = 100;

	//Магически насыщенные враги (люди) всегда получают магическое оружие вкл/откл. (true - да, false - нет).
	StExt_Config_Npc_MagicInfusedAlwaysHasRandomEquipment = true;

	// Шанс появления удачливых врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_LuckyFlagChance = 5;
	// Шанс появления богатых врагов в ‰ (минимум 0, максимум 1000).
	StExt_Config_Npc_RichFlagChance = 10;
	
	
	// Финальный модификатор здоровья у врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_GlobalHpMult = 100;
	// Финальный модификатор энерго-щита у врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_GlobalEsMult = 100;
	// Финальный модификатор характеристик у врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_GlobalStatMult = 100;
	// Финальный модификатор защиты у врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_GlobalProtMult = 100;
	// Финальный модификатор урона у врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_GlobalDamMult = 100;	
	
	
	// Модификатор здоровья у магических врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_InfusionHpMult = 100;
	// Модификатор энерго-щита у магических врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_InfusionEsMult = 100;
	// Модификатор характеристик у магических врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_InfusionStatMult = 100;
	// Модификатор защиты у магических врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_InfusionProtMult = 100;
	// Модификатор урона у магических врагов в % (минимум 10, максимум 1000).
	StExt_Config_Npc_InfusionDamMult = 100;
	
	
	// Призваные существа врагами могут дублироваться
	StExt_Config_NpcSum_CanBeDuplicated = false;
	// Призваные существа врагами могут быть магическими
	StExt_Config_NpcSum_CanBeInfused = true;
	// Финальный модификатор здоровья у призваных существ врагами в % (минимум 10, максимум 1000).
	StExt_Config_NpcSum_GlobalHpMult = 100;
	// Финальный модификатор энерго-щита у призваных существ врагами в % (минимум 10, максимум 1000).
	StExt_Config_NpcSum_GlobalEsMult = 100;
	// Финальный модификатор характеристик у призваных существ врагами в % (минимум 10, максимум 1000).
	StExt_Config_NpcSum_GlobalStatMult = 100;
	// Финальный модификатор защиты у призваных существ врагами в % (минимум 10, максимум 1000).
	StExt_Config_NpcSum_GlobalProtMult = 100;
	// Финальный модификатор урона у призваных существ врагами в % (минимум 10, максимум 1000).
	StExt_Config_NpcSum_GlobalDamMult = 100;


	// Финальный модификатор здоровья призваных существ в % (минимум 10, максимум 1000).
	StExt_Config_Sum_GlobalHpMult = 100;
	// Финальный модификатор характеристик призваных существ в % (минимум 10, максимум 1000).
	StExt_Config_Sum_GlobalStatMult = 100;
	// Финальный модификатор защиты призваных существ в % (минимум 10, максимум 1000).
	StExt_Config_Sum_GlobalProtMult = 100;
	// Финальный модификатор урона призваных существ в % (минимум 10, максимум 1000).
	StExt_Config_Sum_GlobalDamMult = 100;

	// Вкл/откл призыв собственных суммонов у призваных существ
	StExt_Config_Npc_SummonsCanHaveOwnSummons = false;
	// Вкл/откл абилки у врагов (некоторые будут игнорировать эти настройки!)
	StExt_Config_Npc_CantUseSpellAbilities = false;
	// Вкл/откл бафы у врагов (некоторые будут игнорировать эти настройки!)
	StExt_Config_Npc_CantUseBuffAbilities = false;
	// Вкл/откл призыв у врагов (некоторые будут игнорировать эти настройки!)
	StExt_Config_Npc_CantUseSummonAbilities = false;


	//****************************************************************
	//					*** Luck configs ***
	//****************************************************************
	
	// Модификатор сложности удачи в % (минимум -50, максимум 500).
	StExt_Config_Luck_Difficulty = 100;
	// Модификатор мощи предметов в % (минимум -100, максимум 100).
	StExt_Config_Luck_Power = 0;
	// Модификатор количества предметов в % (минимум -100, максимум 100).
	StExt_Config_Luck_Quantity = 0;
	// Модификатор количества золота в % (минимум -100, максимум 100).
	StExt_Config_Luck_Money = 0;

	
	// Вкл/откл удачливый лут для врагов (true - да, false - нет).
	StExt_Config_Luck_EnableRandomLoot_Bodies = true;
	// Вкл/откл удачливый лут для сундуков (true - да, false - нет).
	StExt_Config_Luck_EnableRandomLoot_Chests = true;
	// Вкл/откл удачливый лут для врагов не гуманойдов (true - да, false - нет).
	StExt_Config_Luck_RandomLoot_EnableUnHumanDrop = false;


	// Модификатор мощи удачи для еды в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Food = 10;
	// Модификатор мощи удачи для флхимии в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Alchemy = 10;
	// Модификатор мощи удачи для магии в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Magic = 10;
	// Модификатор мощи удачи для разных предметов в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Misk = 10;
	// Модификатор мощи удачи для брони в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Armor = 10;
	// Модификатор мощи удачи для оружия в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Weapon = 10;
	// Модификатор мощи удачи для бижутерии в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootPowerMod_Jewelry = 10;

	
	// Модификатор мощи удачи для еды в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootQuantityMod_Food = 10;
	// Модификатор мощи удачи для алхимии в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootQuantityMod_Alchemy = 10;
	// Модификатор количества для магии в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootQuantityMod_Magic = 10;
	// Модификатор количества для стрел и болтов в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootQuantityMod_Munition = 10;
	// Модификатор количества для разных предметов в % (минимум -100, максимум 1000).
	StExt_Config_Luck_RandomLootQuantityMod_Misk = 10;
	
	// Шанс что найденые предметы будут зачарованы в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_ChanceForEnchantedDrop = 100;
	// Относительный шанс найти еду в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Food = 350;
	// Относительный шанс найти алхимию в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Alchemy = 150;
	// Относительный шанс найти магию в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Magic = 100;
	// Относительный шанс найти прочее в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Misk = 500;
	// Относительный шанс найти стрелы в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Munition = 250;
	// Относительный шанс найти броню в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Armors = 50;
	// Относительный шанс найти бижутерию в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_Jewelry = 50;
	// Относительный шанс найти магическое оружие в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_MagicWeapons = 100;
	// Относительный шанс найти оружие ближнего боя в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_MeeleWeapons = 100;
	// Относительный шанс найти оружие дальнего боя в ‰ (минимум 0, максимум 1000).
	StExt_Config_Luck_RelativeDropChance_RangeWeapons = 100;


	//****************************************************************
	//			*** World randomization configs ***
	//****************************************************************

	// Вкл/откл случайное появление предметов в мире (true - да, false - нет).
	StExt_Config_EnableWorldRandomization_Items = true;
	// Вкл/откл случайное появление врагов в мире (true - да, false - нет).
	StExt_Config_EnableWorldRandomization_Npc = true;
	StExt_Config_EnableWorldRandomization_ByTimeEvents = true;
	// Минимальное время для рандомизации мира в секундах (минимум 60, максимум 600).
	StExt_Config_WorldRandomization_MinCooldown = 300;
	// Максимальное время для рандомизации мира в секундах (минимум 60, максимум 3600).
	StExt_Config_WorldRandomization_MaxCooldown = 300;
	// Шанс появления врагов в мире в % (минимум 0, максимум 1000).
	StExt_Config_WorldRandomization_Npc_SpawnChance = 350;
	// Модификатор мощи случайногых врагов в % (минимум 10, максимум 500).
	StExt_Config_WorldRandomization_Npc_SpawnPowerMod = 100;
	
	StExt_Config_WorldRandomization_Npc_SpawnPower_LevelMod = 100;
	StExt_Config_WorldRandomization_Npc_SpawnPower_KapitelMod = 100;
	StExt_Config_WorldRandomization_Npc_SpawnPower_DayMod = 100;
	// Модификатор количества случайных врагов в % (минимум 10, максимум 500).
	StExt_Config_WorldRandomization_Npc_SpawnCountMod = 100;
	//Шанс появления предметов в мире в % (минимум 0, максимум 1000).
	StExt_Config_WorldRandomization_Item_SpawnChance = 350;
	// Модификатор мощи случайных предметов в % (минимум 10, максимум 500).
	StExt_Config_WorldRandomization_Item_SpawnPowerMod = 100;
	// Модификатор количества случайных предметов в % (минимум 10, максимум 500).
	StExt_Config_WorldRandomization_Item_SpawnCountMod = 100;

	
	// Частота добавления новых товаров торговцам
	StExt_Config_WorldRandomization_TradersExtraItemsAddRate = 7;
	StExt_Config_WorldRandomization_EnableChestUpdate = true;	
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
	
	// Вкл/откл скин нежити (true - да, false - нет).
	//StExt_Config_EnableSkeletonSkin = false;
	// Вкл/откл скин нежити только ночью (true - да, false - нет).
	//StExt_Config_EnableSkeletonSkin_OnlyAtNight = false;
	// Вкл/откл женский скин (true - да, false - нет).
	//StExt_Config_EnableFemaleSkin = false;
	// Вкл/откл женский скин - причёска (true - да, false - нет).
	//StExt_Config_EnableFemaleSkin_AlwaysWig = false;
	// Вкл/откл женский скин - крылья (true - да, false - нет).
	//StExt_Config_EnableFemaleSkin_DemonLook = false;
	// Вкл/откл визульный эффект зачарований (работает после выхода из игры) (true - да, false - нет).
	//StExt_Config_DisableEnchantedItemsEffects = false;
	// Вкл/откл отображение шлема.
	//StExt_Config_HideHelm = false;
	
	
	// Общий модификатор получаемого опыта в %  (минимум 10, максимум 500).
	StExt_Config_GainExpMod = 100;
	// Общий модификатор получаемого опыта в 10x% (настройка из оригинальной игры) (минимум -5, максимум 5).
	StExt_Config_ExpMod = 0;
	// Модификатор коффициента АСНК очков урона в % (минимум 30, максимум 200).
	StExt_Config_SncExp = 100;
	// Модификатор получения опыта за убийство врагов с союзниками в % (минимум 25, максимум 100).
	StExt_Config_PartyExp = 100;
	// Модификатор получения опыта за убийство врагов в % (минимум 10, максимум 200).
	StExt_Config_NpcExp = 100;
	// Модификатор получения опыта за убийство врагов на сложности Гнев Белиара в % (минимум 5, максимум 100).
	StExt_Config_BelliarRageExp = 70;
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


	// Дополнительные очки обучения за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraLp = 0;
	// Дополнительное здоровье за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraHpPerLevel = 0;
	// Дополнительная мана за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraMpPerLevel = 0;
	// Дополнительный энерго-щит за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraEsPerLevel = 0;
	// Дополнительная сила за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraStrPerLevel = 0;
	// Дополнительная ловкость за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraAgiPerLevel = 0;
	// Дополнительный интеллект за каждый уровень героя (минимум 0, максимум 100).
	StExt_Config_ExtraIntPerLevel = 0;
	// Дополнительная удача за каждый уровень героя в % (минимум 0, максимум 100).
	StExt_Config_ExtraLuckPerLevel = 0;
	
	// Настройки ниже только для Гнева Белиара.
	//StExt_Config_BelliarRage_Active = false;
	//StExt_Config_BelliarRage_SpawnMonsters = true;
	//StExt_Config_BelliarRage_StaminaReduce = true;
	//StExt_Config_BelliarRage_AddDamageReduce = true;
	//StExt_Config_BelliarRage_RegenEnemies = true;
	//StExt_Config_BelliarRage_SoundEnable = true;
	
	
	// Модификатор опыта для мастерства в % (минимум 10, максимум 1000).
	StExt_Config_MasteriesExpMult = 100;
	// Модификатор опыта для оскверненного в % (минимум 10, максимум 1000).
	StExt_Config_CorruptionExpMult = 100;
	// Модификатор опыта для артефактов в % (минимум 10, максимум 1000).
	StExt_Config_ArtifactsExpMult = 100;
	// Модификатор стоимости ресурсов на улучшение артефактов в % (минимум 10, максимум 1000).
	StExt_Config_ArtifactsUpgradeCostMult = 100;
	// Модификатор золота для обучения умениям в % (минимум 50, максимум 1000).
	StExt_Config_EducationMoneyCostMult = 100;
	// Модификатор требований для обучения умениям в % (минимум 50, максимум 500).
	StExt_Config_EducationRequirementsMult = 100;
	// Вкл/откл требование кругов магии по главам (true - да, false - нет).
	StExt_Config_NoChapterForMagicCircle = false;
	// Вкл/откл визуальные эффекты бафов/проклятий (true - да, false - нет).
	StExt_Config_DisplayBuffEffects = false;
	// Вкл/откл визуальные эффекты энерго-щита (true - да, false - нет).
	StExt_Config_DisplayEsEffects = true;
	StExt_Config_ExtraItemsDisplayMode = StExt_ExtraItemsDisplayMode_UnderArmor;

	// Количество дней для сброса бонусов пищи
	StExt_Config_FoodBonusResetDay = 7;
	
	
	//===================================================================//
	//							Ui Configs								 //
	//===================================================================//
	
	// Настройка клавиши вызова меню мода
	StExt_Config_ModMenuKey = key_t;
	StExt_Config_ModCraftKey = key_c;
	// Настройка отключения автоматических аур
	StExt_Config_AuraCastKey = key_o;
	StExt_Config_ModOptionsKey = key_o;
	
	StExt_Config_PcMainActionKey = key_lcontrol;
	StExt_Config_PcSecondaryActionKey = key_lshift;
	StExt_Config_PcSupportActionKey = key_lmenu;

	// Umiejetnosc broni (ladowanie: nastepne trafienie zada bonusowe obrazenia zywiolowe)
	StExt_Config_WeaponSkillKey = key_h;
	StExt_Config_WeaponSkill_CooldownSec = 8;
	StExt_Config_WeaponSkill_StaminaCostPerc = 30;
	StExt_Config_WeaponSkill_ManaCostPerc = 20;

	// Profesja zywiolu (blokada expa zywiolowego bez wybranej specjalizacji)
	StExt_Config_ElementProfession_MaxSlots = 3;
	StExt_Config_ElementProfession_UniversalPenaltyPerc = 50;
	StExt_Config_ElementProfession_ResetCost = 500;

	// Вкл/откл отображение уровня врага на экране (true - да, false - нет).
	StExt_Config_ShowNpcLevel = false;
	// Вкл/откл отображение характеристик врагов на экране (true - да, false - нет).
	StExt_Config_ShowNpcExtraInfo = false;
	// Вкл/откл отображение тегов врагов на экране (true - да, false - нет).
	StExt_Config_ShowNpcFlags = true;
	// Вкл/откл отображение ранга врагов на экране (true - да, false - нет).
	StExt_Config_ShowNpcRank = true;
	// Вкл/откл отображение умений врагов на экране (true - да, false - нет).
	StExt_Config_ShowNpcAbilities = true;	
	// Вкл/откл отображение сообщений об удачи на экране (true - да, false - нет).
	StExt_Config_DisplayLuckMessage = true;


	// Вкл/откл показ временных эффектов от зелий на экране (true - да, false - нет).
	StExt_Config_Alch_DisplayOnScreen = false;
	// Задать позицию временных эффектов от зелий по оси X
	StExt_Config_Alch_PosX = 1;
	// Задать позицию временных эффектов от зелий по оси Y
	StExt_Config_Alch_PosY = 92;


	// Вкл/откл показ шкалы опыта артефакта на экране (true - да, false - нет).
	StExt_Config_Artifact_DisplayOnScreen = true;
	// Вкл/откл показ сообщения об получении опыта артефактом
	StExt_Config_Artifact_ShowExpMessage = false;
	// Задать позицию артефакта по оси X
	StExt_Config_Artifact_PosX = 7;
	// Задать позицию артефакта по оси Y
	StExt_Config_Artifact_PosY = 0;

	
	// Вкл/откл показ аур на экране (true - да, false - нет).
	StExt_Config_Aura_DisplayOnScreen = false;
	// Задать позицию аур по оси X
	StExt_Config_Aura_PosX = 1;
	// Задать позицию аур по оси Y
	StExt_Config_Aura_PosY = 92;


	// Вкл/откл стандартную позицию бара энерго-щита (true - да, false - нет).
	StExt_Config_EsBar_DefaultPos = true;
	// Задать позицию энерго-щита по оси X
	StExt_Config_EsBar_PosX = 1;
	// Задать позицию энерго-щита по оси Y
	StExt_Config_EsBar_PosY = 94;


	// Индекс переноса текстра в меню мода
	StExt_Config_MenuTextWrapIndex = 150;
	// Ширина меню мода
	StExt_Config_MenuScaleX = 80;
	// Высота меню мода
	StExt_Config_MenuScaleY = 80;
	
	StExt_Config_MenuPauseOnShow = true;
	StExt_Config_MenuScrollMult = 100;

	// Расположение окна дополнительной информации об вещах по X
	StExt_Config_ItemMenu_PosX = 75;
	// Расположение окна дополнительной информации об вещах по Y
	StExt_Config_ItemMenu_PosY = 75;


	// Расположение окна вывода дополнительной информации (MessageTray) X
	StExt_Config_MsgTray_PosX = 75;
	// Расположение окна вывода дополнительной информации (MessageTray) Y
	StExt_Config_MsgTray_PosY = 75;
	
	
	// Вкл/откл режим отчетов о багах в отдельный файл (true - да, false - нет).
	StExt_Config_DebugEnabled = false;
};
