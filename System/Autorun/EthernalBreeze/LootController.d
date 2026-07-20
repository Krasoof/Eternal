func void StExt_CreateRandomItem(var c_npc slf, var int itm, var int count, var int chest)
{
	var string detmob;	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_CreateRandomItem(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (count < 1) 
	{
		StExt_PrintDebug("StExt_CreateRandomItem()", "items count less than 1!", self, other);
		return; 
	};
	if (itm == StExt_Null)
	{
		StExt_PrintDebug("StExt_CreateRandomItem()", "item instance is null!", self, other);
		return; 
	};
	
	if (chest && StExt_RandomChestGenerateLoot)
	{
		mob_createitems(StExt_RandomChestName, itm, count);
		StExt_LuckProcGlobal = 0;
		return;
	};

	if(chest && Hlp_HasFocusVob(hero)) 
	{
		detmob = Hlp_GetFocusVobName(hero);
		if(StExt_StringIsEmpty(detmob))
		{
			StExt_PrintDebug("StExt_CreateRandomItem()", "focus vob instance is null!", self, other);
			createinvitems(hero, itm, count);
		}
		else { mob_createitems(detmob, itm, count); };
	}
	else 
	{
		if(Hlp_IsValidNpc(slf)) { createinvitems(slf, itm, count); }		
		else
		{
			StExt_PrintDebug("StExt_CreateRandomItem()", "slf instance is null!", self, other);
			createinvitems(hero, itm, count);
		};
	};
	StExt_LuckProcGlobal += count;
};

func int StExt_ApplyItemPowerConfigs(var int power, var int firstMult, var int secondMult)
{
	power = StExt_ApplyPercentToValue(power, firstMult);
	power = StExt_ApplyPercentToValue(power, secondMult);
	return power;
};

func int StExt_ApplyItemCountConfigs(var int power, var int firstMult, var int secondMult)
{
	power = StExt_ApplyPercentToValue(power, firstMult);
	power = StExt_ApplyPercentToValue(power, secondMult);
	return power;
};

// Food
var int StExt_GiveExtraFoodLoot_Loop_Tier2_Cond;
var int StExt_GiveExtraFoodLoot_Loop_Tier3_Cond;
var int StExt_GiveExtraFoodLoot_Loop_Tier4_Cond;
var int StExt_GiveExtraFoodLoot_Loop_ItemsCount;
var int StExt_GiveExtraFoodLoot_Loop_Power;
var int StExt_GiveExtraFoodLoot_Loop_TopItemGet;
var c_npc StExt_GiveExtraFoodLoot_Loop_Npc;
var int StExt_GiveExtraFoodLoot_Loop_Chest;
func int StExt_GiveExtraFoodLoot_Loop(var int index)
{
	var int tmpPower;
	var int tmpCount;
	var string itmId;
	var int itm;
	if (!hlp_isvalidnpc(StExt_GiveExtraFoodLoot_Loop_Npc)) 
	{
		StExt_PrintDebug("StExt_GiveExtraFoodLoot_Loop(var int index)", "slf instance is null!", StExt_GiveExtraFoodLoot_Loop_Npc, StExt_NullNpc);
		return false; 
	};
	tmpPower = hlp_random(StExt_GiveExtraFoodLoot_Loop_Power);
	tmpCount = hlp_random(StExt_GiveExtraFoodLoot_Loop_ItemsCount);
	// Per-stack cap: bez tego jeden hlp_random moglo pochlonac caly budzet
	// = jeden gigantyczny stos chleba. Max 3 sztuki na wpis.
	tmpCount = StExt_ValidateValueRange(tmpCount, 1, 3);
	
	if ((tmpPower >= StExt_GiveExtraFoodLoot_Loop_Tier4_Cond) && !StExt_GiveExtraFoodLoot_Loop_TopItemGet && rx_getchance(StExt_TopItemChanceMod))
	{
		tmpCount = 1;
		itmId = StExt_Array_GetString("StExt_LootTable_Food4", hlp_random(StExt_LootTable_Food4_Max));
		StExt_GiveExtraFoodLoot_Loop_TopItemGet = true;
	}
	else if (tmpPower >= StExt_GiveExtraFoodLoot_Loop_Tier3_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Food3", hlp_random(StExt_LootTable_Food3_Max)); }
	else if (tmpPower >= StExt_GiveExtraFoodLoot_Loop_Tier2_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Food2", hlp_random(StExt_LootTable_Food2_Max)); }
	else { itmId = StExt_Array_GetString("StExt_LootTable_Food1", hlp_random(StExt_LootTable_Food1_Max)); };
	
	itm = StExt_GetInstanceIdByName(itmId);
	StExt_CreateRandomItem(StExt_GiveExtraFoodLoot_Loop_Npc, itm, tmpCount, StExt_GiveExtraFoodLoot_Loop_Chest);
	StExt_GiveExtraFoodLoot_Loop_ItemsCount -= tmpCount;
	return (StExt_GiveExtraFoodLoot_Loop_ItemsCount > 0);
};
func void StExt_GiveExtraFoodLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itemsPower;
	if ((StExt_Config_Luck_RandomLootQuantityMod_Food == 0) || (power <= 0)) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraFoodLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraFoodLoot(var c_npc slf, var int power, var int chest)");
	
	// Budzet jedzenia ODPIETY od mocy: bossy/championy maja power x4/x2.67
	// (StExt_CalcBodyLootPower), a dawne "+ power/10" robilo z tego 80-100
	// chleba. Fabularnie boss nie nosi bochenka na plecach. Garsc, nie stos.
	itemsCount = 2 + hlp_random(4);
	itemsCount = StExt_ApplyItemCountConfigs(itemsCount, StExt_Config_Luck_Quantity, StExt_Config_Luck_RandomLootQuantityMod_Food);
	itemsCount = StExt_ValidateValueRange(itemsCount, 1, 6);
	itemsPower = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Food);
	if ((itemsCount <= 0) || (itemsPower <= 0)) { return; };
	
	StExt_PrintLootDebug("Food", itemsPower, itemsCount);
	StExt_GiveExtraFoodLoot_Loop_Npc = StExt_GetNpc(slf);
	StExt_GiveExtraFoodLoot_Loop_TopItemGet = false;
	StExt_GiveExtraFoodLoot_Loop_ItemsCount = itemsCount;
	StExt_GiveExtraFoodLoot_Loop_Power = itemsPower;
	StExt_GiveExtraFoodLoot_Loop_Chest = chest;	
	StExt_GiveExtraFoodLoot_Loop_Tier2_Cond = StExt_ApplyPercentToValue(30, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraFoodLoot_Loop_Tier3_Cond = StExt_ApplyPercentToValue(60, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraFoodLoot_Loop_Tier4_Cond = StExt_ApplyPercentToValue(120, StExt_Config_Luck_Difficulty);
	StExt_While(StExt_GiveExtraFoodLoot_Loop);
};

// Magic
var int StExt_GiveExtraMagicLoot_Loop_Tier2_Cond;
var int StExt_GiveExtraMagicLoot_Loop_Tier3_Cond;
var int StExt_GiveExtraMagicLoot_Loop_Tier4_Cond;
var int StExt_GiveExtraMagicLoot_Loop_ItemsCount;
var int StExt_GiveExtraMagicLoot_Loop_Power;
var int StExt_GiveExtraMagicLoot_Loop_TopItemGet;
var c_npc StExt_GiveExtraMagicLoot_Loop_Npc;
var int StExt_GiveExtraMagicLoot_Loop_Chest;
func int StExt_GiveExtraMagicLoot_Loop(var int index)
{
	var int tmpPower;
	var int tmpCount;
	var string itmId;
	var int itm;
	if (!hlp_isvalidnpc(StExt_GiveExtraMagicLoot_Loop_Npc)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMagicLoot_Loop(var int index)", "slf instance is null!", StExt_GiveExtraMagicLoot_Loop_Npc, StExt_NullNpc);
		return false; 
	};
	tmpPower = hlp_random(StExt_GiveExtraMagicLoot_Loop_Power);
	tmpCount = hlp_random(StExt_GiveExtraMagicLoot_Loop_ItemsCount);
	tmpCount = StExt_ValidateValueRange(tmpCount, 1, StExt_GiveExtraMagicLoot_Loop_ItemsCount);
	
	if ((tmpPower >= StExt_GiveExtraMagicLoot_Loop_Tier4_Cond) && !StExt_GiveExtraMagicLoot_Loop_TopItemGet && rx_getchance(StExt_TopItemChanceMod))
	{
		tmpCount = 1;
		itmId = StExt_Array_GetString("StExt_LootTable_Magic4", hlp_random(StExt_LootTable_Magic4_Max));
		StExt_GiveExtraMagicLoot_Loop_TopItemGet = true;
	}
	else if (tmpPower >= StExt_GiveExtraMagicLoot_Loop_Tier3_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Magic3", hlp_random(StExt_LootTable_Magic3_Max)); }
	else if (tmpPower >= StExt_GiveExtraMagicLoot_Loop_Tier2_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Magic2", hlp_random(StExt_LootTable_Magic2_Max)); }
	else { itmId = StExt_Array_GetString("StExt_LootTable_Magic1", hlp_random(StExt_LootTable_Magic1_Max)); };
	
	itm = StExt_GetInstanceIdByName(itmId);
	StExt_CreateRandomItem(StExt_GiveExtraMagicLoot_Loop_Npc, itm, tmpCount, StExt_GiveExtraMagicLoot_Loop_Chest);
	StExt_GiveExtraMagicLoot_Loop_ItemsCount -= tmpCount;
	return (StExt_GiveExtraMagicLoot_Loop_ItemsCount > 0);
};
func void StExt_GiveExtraMagicLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itemsPower;
	if ((StExt_Config_Luck_RandomLootQuantityMod_Magic == 0) || (power <= 0)) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMagicLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraMagicLoot(var c_npc slf, var int power, var int chest)");
	
	itemsCount = 1 + hlp_random(3) + (power / 40);	// nerf: boss/champion power x4 pompowal ilosc; skalowanie /10 -> /40
	itemsCount = StExt_ValidateValueRange(itemsCount, 1, 8);
	itemsCount = StExt_ApplyItemCountConfigs(itemsCount, StExt_Config_Luck_Quantity, StExt_Config_Luck_RandomLootQuantityMod_Magic);
	itemsPower = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Magic);
	if ((itemsCount <= 0) || (itemsPower <= 0)) { return; };
	
	StExt_PrintLootDebug("Magic", itemsPower, itemsCount);
	StExt_GiveExtraMagicLoot_Loop_Npc = StExt_GetNpc(slf);
	StExt_GiveExtraMagicLoot_Loop_TopItemGet = false;
	StExt_GiveExtraMagicLoot_Loop_ItemsCount = itemsCount;
	StExt_GiveExtraMagicLoot_Loop_Power = itemsPower;
	StExt_GiveExtraMagicLoot_Loop_Chest = chest;	
	StExt_GiveExtraMagicLoot_Loop_Tier2_Cond = StExt_ApplyPercentToValue(30, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraMagicLoot_Loop_Tier3_Cond = StExt_ApplyPercentToValue(60, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraMagicLoot_Loop_Tier4_Cond = StExt_ApplyPercentToValue(120, StExt_Config_Luck_Difficulty);
	StExt_While(StExt_GiveExtraMagicLoot_Loop);
};


// Misk
var int StExt_GiveExtraMiskLoot_Loop_Tier2_Cond;
var int StExt_GiveExtraMiskLoot_Loop_Tier3_Cond;
var int StExt_GiveExtraMiskLoot_Loop_Tier4_Cond;
var int StExt_GiveExtraMiskLoot_Loop_ItemsCount;
var int StExt_GiveExtraMiskLoot_Loop_Power;
var int StExt_GiveExtraMiskLoot_Loop_TopItemGet;
var c_npc StExt_GiveExtraMiskLoot_Loop_Npc;
var int StExt_GiveExtraMiskLoot_Loop_Chest;
func int StExt_GiveExtraMiskLoot_Loop(var int index)
{
	var int tmpPower;
	var int tmpCount;
	var string itmId;
	var int itm;
	if (!hlp_isvalidnpc(StExt_GiveExtraMiskLoot_Loop_Npc)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMiskLoot_Loop(var int index)", "slf instance is null!", StExt_GiveExtraMiskLoot_Loop_Npc, StExt_NullNpc);
		return false; 
	};
	tmpPower = hlp_random(StExt_GiveExtraMiskLoot_Loop_Power);
	tmpCount = hlp_random(StExt_GiveExtraMiskLoot_Loop_ItemsCount);
	tmpCount = StExt_ValidateValueRange(tmpCount, 1, StExt_GiveExtraMiskLoot_Loop_ItemsCount);
	
	if ((tmpPower >= StExt_GiveExtraMiskLoot_Loop_Tier4_Cond) && !StExt_GiveExtraMiskLoot_Loop_TopItemGet && rx_getchance(StExt_TopItemChanceMod))
	{
		tmpCount = 1;
		itmId = StExt_Array_GetString("StExt_LootTable_Misk4", hlp_random(StExt_LootTable_Misk4_Max));
		StExt_GiveExtraMiskLoot_Loop_TopItemGet = true;
	}
	else if (tmpPower >= StExt_GiveExtraMiskLoot_Loop_Tier3_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Misk3", hlp_random(StExt_LootTable_Misk3_Max)); }
	else if (tmpPower >= StExt_GiveExtraMiskLoot_Loop_Tier2_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Misk2", hlp_random(StExt_LootTable_Misk2_Max)); }
	else { itmId = StExt_Array_GetString("StExt_LootTable_Misk1", hlp_random(StExt_LootTable_Misk1_Max)); };
	
	itm = StExt_GetInstanceIdByName(itmId);
	StExt_CreateRandomItem(StExt_GiveExtraMiskLoot_Loop_Npc, itm, tmpCount, StExt_GiveExtraMiskLoot_Loop_Chest);
	StExt_GiveExtraMiskLoot_Loop_ItemsCount -= tmpCount;
	return (StExt_GiveExtraMiskLoot_Loop_ItemsCount > 0);
};
func void StExt_GiveExtraMiskLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itemsPower;
	if ((StExt_Config_Luck_RandomLootQuantityMod_Misk == 0) || (power <= 0)) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMiskLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraMiskLoot(var c_npc slf, var int power, var int chest)");
	
	itemsCount = 2 + hlp_random(4) + (power / 40);	// nerf junk ("mean typu chleb"): /10 -> /40
	itemsCount = StExt_ValidateValueRange(itemsCount, 1, 8);
	itemsCount = StExt_ApplyItemCountConfigs(itemsCount, StExt_Config_Luck_Quantity, StExt_Config_Luck_RandomLootQuantityMod_Misk);
	itemsPower = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Misk);	
	if ((itemsCount <= 0) || (itemsPower <= 0)) { return; };
	
	StExt_PrintLootDebug("Misk", itemsPower, itemsCount);
	StExt_GiveExtraMiskLoot_Loop_Npc = StExt_GetNpc(slf);
	StExt_GiveExtraMiskLoot_Loop_TopItemGet = false;
	StExt_GiveExtraMiskLoot_Loop_ItemsCount = itemsCount;
	StExt_GiveExtraMiskLoot_Loop_Power = itemsPower;
	StExt_GiveExtraMiskLoot_Loop_Chest = chest;	
	StExt_GiveExtraMiskLoot_Loop_Tier2_Cond = StExt_ApplyPercentToValue(30, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraMiskLoot_Loop_Tier3_Cond = StExt_ApplyPercentToValue(60, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraMiskLoot_Loop_Tier4_Cond = StExt_ApplyPercentToValue(120, StExt_Config_Luck_Difficulty);
	StExt_While(StExt_GiveExtraMiskLoot_Loop);
};


// Alchemy
var int StExt_GiveExtraAlchemyLoot_Loop_Tier2_Cond;
var int StExt_GiveExtraAlchemyLoot_Loop_Tier3_Cond;
var int StExt_GiveExtraAlchemyLoot_Loop_Tier4_Cond;
var int StExt_GiveExtraAlchemyLoot_Loop_ItemsCount;
var int StExt_GiveExtraAlchemyLoot_Loop_Power;
var int StExt_GiveExtraAlchemyLoot_Loop_TopItemGet;
var c_npc StExt_GiveExtraAlchemyLoot_Loop_Npc;
var int StExt_GiveExtraAlchemyLoot_Loop_Chest;
func int StExt_GiveExtraAlchemyLoot_Loop(var int index)
{
	var int tmpPower;
	var int tmpCount;
	var string itmId;
	var int itm;
	if (!hlp_isvalidnpc(StExt_GiveExtraAlchemyLoot_Loop_Npc)) 
	{
		StExt_PrintDebug("StExt_GiveExtraAlchemyLoot_Loop(var int index)", "slf instance is null!", StExt_GiveExtraAlchemyLoot_Loop_Npc, StExt_NullNpc);
		return false; 
	};
	tmpPower = hlp_random(StExt_GiveExtraAlchemyLoot_Loop_Power);
	tmpCount = hlp_random(StExt_GiveExtraAlchemyLoot_Loop_ItemsCount);
	tmpCount = StExt_ValidateValueRange(tmpCount, 1, StExt_GiveExtraAlchemyLoot_Loop_ItemsCount);
	
	if ((tmpPower >= StExt_GiveExtraAlchemyLoot_Loop_Tier4_Cond) && !StExt_GiveExtraAlchemyLoot_Loop_TopItemGet && rx_getchance(StExt_TopItemChanceMod))
	{
		tmpCount = 1;
		itmId = StExt_Array_GetString("StExt_LootTable_Alchemy4", hlp_random(StExt_LootTable_Alchemy4_Max));
		StExt_GiveExtraAlchemyLoot_Loop_TopItemGet = true;
	}
	else if (tmpPower >= StExt_GiveExtraAlchemyLoot_Loop_Tier3_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Alchemy3", hlp_random(StExt_LootTable_Alchemy3_Max)); }
	else if (tmpPower >= StExt_GiveExtraAlchemyLoot_Loop_Tier2_Cond) { itmId = StExt_Array_GetString("StExt_LootTable_Alchemy2", hlp_random(StExt_LootTable_Alchemy2_Max)); }
	else { itmId = StExt_Array_GetString("StExt_LootTable_Alchemy1", hlp_random(StExt_LootTable_Alchemy1_Max)); };
	
	itm = StExt_GetInstanceIdByName(itmId);
	StExt_CreateRandomItem(StExt_GiveExtraAlchemyLoot_Loop_Npc, itm, tmpCount, StExt_GiveExtraAlchemyLoot_Loop_Chest);
	StExt_GiveExtraAlchemyLoot_Loop_ItemsCount -= tmpCount;
	return (StExt_GiveExtraAlchemyLoot_Loop_ItemsCount > 0);
};
func void StExt_GiveExtraAlchemyLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itemsPower;
	var int itemId;
	if ((StExt_Config_Luck_RandomLootQuantityMod_Alchemy == 0) || (power <= 0)) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraAlchemyLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraAlchemyLoot(var c_npc slf, var int power, var int chest)");
	
	itemsCount = 1 + hlp_random(4) + (power / 40);	// nerf alchemia: /10 -> /40
	itemsCount = StExt_ValidateValueRange(itemsCount, 1, 8);
	itemsCount = StExt_ApplyItemCountConfigs(itemsCount, StExt_Config_Luck_Quantity, StExt_Config_Luck_RandomLootQuantityMod_Alchemy);
	itemsPower = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Alchemy);
	if ((itemsCount <= 0) || (itemsPower <= 0)) { return; };	
	
	if (StExt_Chance(StExt_Config_Luck_ChanceForEnchantedDrop)) 
	{
		itemId = StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, itemsPower);
		StExt_CreateRandomItem(slf, itemId, itemsCount, chest);
		return;
	};
	
	StExt_PrintLootDebug("Alchemy", itemsPower, itemsCount);
	StExt_GiveExtraAlchemyLoot_Loop_Npc = StExt_GetNpc(slf);
	StExt_GiveExtraAlchemyLoot_Loop_TopItemGet = false;
	StExt_GiveExtraAlchemyLoot_Loop_ItemsCount = itemsCount;
	StExt_GiveExtraAlchemyLoot_Loop_Power = itemsPower;
	StExt_GiveExtraAlchemyLoot_Loop_Chest = chest;	
	StExt_GiveExtraAlchemyLoot_Loop_Tier2_Cond = StExt_ApplyPercentToValue(30, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraAlchemyLoot_Loop_Tier3_Cond = StExt_ApplyPercentToValue(60, StExt_Config_Luck_Difficulty);
	StExt_GiveExtraAlchemyLoot_Loop_Tier4_Cond = StExt_ApplyPercentToValue(120, StExt_Config_Luck_Difficulty);
	StExt_While(StExt_GiveExtraAlchemyLoot_Loop);
};

// Munition
func void StExt_GiveExtraMunitionLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var string itmId;
	var int itm;
	if ((StExt_Config_Luck_RandomLootQuantityMod_Munition == 0) || (power <= 0)) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMunitionLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraMunitionLoot(var c_npc slf, var int power, var int chest)");
	
	itemsCount = 5 + hlp_random(10) + ((power + 1) / 10);	// nerf amunicji: /3 -> /10 (strzaly dalej w porzadnej ilosci)
	itemsCount = StExt_ValidateValueRange(itemsCount, 1, 40);
	itemsCount = StExt_ApplyItemCountConfigs(itemsCount, StExt_Config_Luck_Quantity, StExt_Config_Luck_RandomLootQuantityMod_Munition);
	if (itemsCount <= 0) { return; };
	
	StExt_PrintLootDebug("Munition", power, itemsCount);	
	itmId = StExt_Array_GetString("StExt_LootTable_Munition", hlp_random(StExt_LootTable_Munition_Max));	
	itm = StExt_GetInstanceIdByName(itmId);
	StExt_CreateRandomItem(slf, itm, itemsCount, chest);
};

// Magic weapon (staffs or magic swords)
func void StExt_GiveExtraMagicWeaponLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itmId;
	var int itemType;
	
	power = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Weapon);
	if (power <= 0) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMagicWeaponLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraMagicWeaponLoot(var c_npc slf, var int power, var int chest)");
	
	itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_MagicWeapon");
	itemsCount = 1;	
	StExt_PrintLootDebug("MagicWeapon", power, itemsCount);

	// Bron ZAWSZE bazowa - magiczne wylacznie z bossow (decyzja usera).
	// Afiksy dokladasz sam zaklinajac u Shivy/Kowala.
	itmId = StExt_GetRegularItem(itemType, power);
	StExt_CreateRandomItem(slf, itmId, itemsCount, chest);
};

// Melee weapon
func void StExt_GiveExtraMeleeWeaponLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itmId;
	var int itemType;
	
	power = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Weapon);
	if (power <= 0) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraMeleeWeaponLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraMeleeWeaponLoot(var c_npc slf, var int power, var int chest)");
	
	itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_MeleeWeapon");
	itemsCount = 1;	
	StExt_PrintLootDebug("MeleeWeapon", power, itemsCount);

	// Bron ZAWSZE bazowa - magiczne wylacznie z bossow.
	itmId = StExt_GetRegularItem(itemType, power);
	StExt_CreateRandomItem(slf, itmId, itemsCount, chest);
};

// Range weapon
func void StExt_GiveExtraRangeWeaponLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itmId;
	var int itemType;
	
	power = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Weapon);
	if (power <= 0) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraRangeWeaponLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraRangeWeaponLoot(var c_npc slf, var int power, var int chest)");
	
	itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_RangeWeapon");
	itemsCount = 1;	
	StExt_PrintLootDebug("Range", power, itemsCount);

	// Bron ZAWSZE bazowa - magiczne wylacznie z bossow.
	itmId = StExt_GetRegularItem(itemType, power);
	StExt_CreateRandomItem(slf, itmId, itemsCount, chest);
};

// Jewelry
func void StExt_GiveExtraJewelryLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itmId;
	var int itemType;
	
	power = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Jewelry);
	if (power <= 0) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraJewelryLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraJewelryLoot(var c_npc slf, var int power, var int chest)");
	
	itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Jewelry");
	itemsCount = 1;	
	StExt_PrintLootDebug("Jewelry", power, itemsCount);	
	
	if (StExt_Chance(StExt_Config_Luck_ChanceForEnchantedDrop)) { itmId = StExt_GenerateRandomItem(itemType, power); }
	else { itmId = StExt_GetRegularItem(itemType, power); };
	StExt_CreateRandomItem(slf, itmId, itemsCount, chest);
};

// Armor (shield/helm or armor)
func void StExt_GiveExtraArmorLoot(var c_npc slf, var int power, var int chest)
{
	var int itemsCount;
	var int itmId;
	var int itemType;

	power = StExt_ApplyItemPowerConfigs(power, StExt_Config_Luck_Power, StExt_Config_Luck_RandomLootPowerMod_Armor);
	if (power <= 0) { return; };
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GiveExtraArmorLoot(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_GiveExtraArmorLoot(var c_npc slf, var int power, var int chest)");
	
	if (chest) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_AnyChestArmor"); }
	else { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_AnyArmor"); };
	
	itemsCount = 1;	
	StExt_PrintLootDebug("Armor", power, itemsCount);
	
	if (StExt_Chance(StExt_Config_Luck_ChanceForEnchantedDrop)) { itmId = StExt_GenerateRandomItem(itemType, power); }
	else { itmId = StExt_GetRegularItem(itemType, power); };
	StExt_CreateRandomItem(slf, itmId, itemsCount, chest);
};

func void StExt_Traders_ExtraSpellComponents(var c_npc slf, var int bonus)
{
	StExt_LuckProcGlobal = 0;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Traders_ExtraSpellComponents(...)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_CreateRandomItem(slf, itat_swampgolemheart, 1 + hlp_random(2 + bonus), false);
	StExt_CreateRandomItem(slf, itat_stonegolemheart, 1 + hlp_random(2 + bonus), false);
	StExt_CreateRandomItem(slf, itat_firegolemheart, 1 + hlp_random(2 + bonus), false);
	StExt_CreateRandomItem(slf, itat_icegolemheart, 1 + hlp_random(2 + bonus), false);
	StExt_CreateRandomItem(slf, itmi_plazma, 1 + hlp_random(3 + bonus), false);	
	StExt_CreateRandomItem(slf, itat_goblinbone, 3 + hlp_random(6 + bonus), false);		
	StExt_CreateRandomItem(slf, itwr_magicpaper, 2 + hlp_random(5 + bonus), false);		
	StExt_CreateRandomItem(slf, itmi_runeblank, 1 + hlp_random(2 + bonus), false);		
	StExt_CreateRandomItem(slf, itat_demonheart, 1 + hlp_random(2 + bonus), false);		
	StExt_CreateRandomItem(slf, itmi_addon_whitepearl, 2 + hlp_random(3 + bonus), false);	
	StExt_CreateRandomItem(slf, itat_skeletonbone, 3 + hlp_random(4 + bonus), false);		
	StExt_CreateRandomItem(slf, itmi_darkpearl, 1 + hlp_random(2 + bonus), false);	
	StExt_CreateRandomItem(slf, itat_waranfiretongue, 1 + hlp_random(3 + bonus), false);		
	StExt_CreateRandomItem(slf, itmi_nugget, 3 + hlp_random(5 + bonus), false);	
	StExt_CreateRandomItem(slf, itmi_sulfur, 4 + hlp_random(7 + bonus), false);
	StExt_CreateRandomItem(slf, itmi_quartz, 4 + hlp_random(7 + bonus), false);
	StExt_CreateRandomItem(slf, itmi_rockcrystal, 4 + hlp_random(7 + bonus), false);
	StExt_CreateRandomItem(slf, itmi_coal, 4 + hlp_random(7 + bonus), false);
	StExt_CreateRandomItem(slf, itmi_pitch, 4 + hlp_random(7 + bonus), false);	
	StExt_CreateRandomItem(slf, itmi_salt, 3 + hlp_random(7 + bonus), false);
	StExt_CreateRandomItem(slf, itat_wing, 3 + hlp_random(7 + bonus), false);

	StExt_LuckProcGlobal = 0;
};

func int StExt_Npc_CanGetRandomLoot(var c_npc vict)
{
	if (!hlp_isvalidnpc(vict)) 
	{
		StExt_PrintDebug("StExt_Npc_CanGetRandomLoot(...)", "slf instance is null!", vict, StExt_NullNpc);
		return false; 
	};
	if (StExt_IsSummonOrHero(vict)) { return false; };
	if (StExt_Npc_IsLooted(vict)) { return false; };
	if (rx_isnpc(vict, wisp_detector) || rx_isnpc(vict, wisp_detector_ast)) { return false; };
	if ((vict.guild == gil_sheep) || (vict.guild == gil_meatbug) || (vict.aivar[43] == id_wisp) || (vict.aivar[43] == id_baran) || (vict.aivar[43] == id_ziege) || (vict.aivar[43] == id_training_aim)) { return false; };
	if (StExt_Npc_IsRandomized(vict) || rx_isboss(vict) || vict.aivar[94] > npc_uncommon) { return true; };
	if (StExt_IsGolem(vict) || c_npcishuman(vict) || (vict.guild == gil_gobbo) || (vict.guild == gil_gobbo_skeleton) || (vict.guild == gil_skeleton) || (vict.guild == gil_skeleton_mage) || (vict.guild == gil_zombie) || (vict.guild == gil_harpy) || (vict.guild == gil_demon)  || (vict.guild == gil_troll) || (vict.guild == gil_dragon) || (vict.guild == gil_gargoyle) || (vict.guild >= gil_seperator_orc))
	{ return true; }
	else if (StExt_Config_Luck_RandomLoot_EnableUnHumanDrop) { return true; };
	return false;
};

var int StExt_CalcBodyLootPower_Ret_GoldPower;
var int StExt_CalcBodyLootPower_Ret_LootPower;
func void StExt_CalcBodyLootPower(var c_npc vict)
{
	var int goldPower;
	var int lootPower;
	var int lootPowerTmp;
	
	// Calculate extra gold
	goldPower = 5 + ((1 + vict.level) / 3);
	if (rx_isboss(vict)) { goldPower += goldPower * 2; };
	goldPower += StExt_GetNpcVar(vict, StExt_AiVar_IsRandomized) * StExt_GetRandomRange(50, 100);
	goldPower += StExt_GetNpcVar(vict, StExt_AiVar_GoldBonus);
	goldPower += StExt_GetPermilleFromValue(goldPower, StExt_PcStats[StExt_PcStats_Index_LuckGold]);
	
	// Calculate loot power
	lootPower = 1 + ((5 + vict.level + hero.level) / 4);
	lootPower += hlp_random(((vict.level + 5) / 2) + 3);
	lootPowerTmp = 0;
	if (rx_isboss(vict)) { lootPowerTmp += lootPower * 3; };
	lootPowerTmp += StExt_GetNpcVar(vict, StExt_AiVar_IsRandomized) * ((lootPower + 1) / 3);
	lootPower += lootPowerTmp + StExt_GetNpcVar(vict, StExt_AiVar_LuckBonus);
	lootPower += StExt_GetPermilleFromValue(lootPower, StExt_PcStats[StExt_PcStats_Index_Luck] + StExt_PcStats[StExt_PcStats_Index_BodyLuck]);
	
	StExt_CalcBodyLootPower_Ret_GoldPower = goldPower;
	StExt_CalcBodyLootPower_Ret_LootPower = lootPower;
};

func void StExt_BodyLootHandler(var c_npc vict)
{	
	var int dropchance;
	var int dropchanceTmp;
	var int goldPower;
	var int lootPower;
	var int lootPowerTmp;
	StExt_LuckProcGlobal = 0;
	
	if (!StExt_Config_Luck_EnableRandomLoot_Bodies) { return; };
	if (!hlp_isvalidnpc(vict)) 
	{
		StExt_PrintDebug("StExt_LootHandler()", "vict instance is null!", vict, other);
		return; 
	};
	if (!StExt_Npc_CanGetRandomLoot(vict)) { return; };	
	StExt_PrintDebugStack("StExt_LootHandler(var c_npc vict)");
	
	// Calculate chance
	dropchanceTmp = StExt_PcStats[StExt_PcStats_Index_Luck] + StExt_PcStats[StExt_PcStats_Index_BodyLuck];
	if (dropchanceTmp > 0) { dropchanceTmp = (dropchanceTmp + 1) / 10; };
	dropchance = 10 + dropchanceTmp + ((hero.level + 1 + vict.level) / 2) + (kapitel * 10);

	if (StExt_Npc_IsRandomized(vict) || rx_isboss(vict) || vict.aivar[94] > npc_uncommon) { dropchance += 1000; };
	if (rx_isboss(vict)) { createinvitems(vict, itmi_stext_bosssoul, 1); };	
	if (!StExt_Chance(dropchance)) 
	{
		StExt_PrintDebugStack("StExt_LootHandler(var c_npc vict) -> Skip");
		return; 
	};
	
	StExt_CalcBodyLootPower(vict);
	goldPower = StExt_CalcBodyLootPower_Ret_GoldPower;
	lootPower = StExt_CalcBodyLootPower_Ret_LootPower;

	// Do the loot
	StExt_PrintLootInitDebug(vict.name, lootPower, goldPower);	
	goldPower = StExt_ApplyPercentToValue(goldPower, StExt_Config_Luck_Money);
	if (goldPower > 0)
	{
		goldPower = 1 + StExt_GetRandomRange(goldPower / 3, goldPower);
		createinvitems(vict, itmi_gold, goldPower);
	};
	
	if (lootPower > 0)
	{
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Food + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraFoodLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Magic + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraMagicLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Alchemy + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraAlchemyLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_MagicWeapons + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraMagicWeaponLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_MeeleWeapons + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraMeleeWeaponLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_RangeWeapons + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraRangeWeaponLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Jewelry + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraJewelryLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Munition + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraMunitionLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Misk + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraMiskLoot(vict, lootPower, false); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Armors + StExt_BodyLuck_RelativeMult)) { StExt_GiveExtraArmorLoot(vict, lootPower, false); };
	};
	if ((StExt_LuckProcGlobal > 0) && StExt_Config_DisplayLuckMessage && npc_canseenpcfreelos(vict, hero)) { StExt_PrintMessageToTray(StExt_Str_print_luckinfo, StExt_Color_Green); };
	StExt_Npc_SetExtraFlag(vict, StExt_NpcFlag_LootProcessed, true);
	StExt_LuckProcGlobal = 0;
};

func void StExt_BodyExtraLootHandler(var c_npc vict)
{
	if (!hlp_isvalidnpc(vict)) 
	{
		StExt_PrintDebug("StExt_LootHandler()", "vict instance is null!", vict, other);
		return; 
	};
	
	if (rx_getchance(5) && c_npcisundead(vict)) { createinvitems(vict, itmi_skull, 1); };	
};

func void StExt_ChestLuckHandler()
{
	StExt_ChestOpenCounter += 1;
	if(StExt_ChestOpenCounter >= 15)
	{
		StExt_ChestOpenCounter = 0;
		StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 5;
		StExt_PcStats_Perm[StExt_PcStats_Index_ChestLuck] += 10;
		ai_printbonus(StExt_Str_print_luckinfobonus);
	};
};

var int StExt_CalcChestLootPower_Ret_GoldPower;
var int StExt_CalcChestLootPower_Ret_LootPower;
func void StExt_CalcChestLootPower(var int chestlvl, var int dropchance)
{
	var int goldPower;
	var int lootPower;	
	
	goldPower = 5 + hlp_random(10 + dropchance) + (hero.level * 2) + (chestlvl * 5);	
	goldPower += StExt_GetPermilleFromValue(goldPower, StExt_PcStats[StExt_PcStats_Index_LuckGold]);
	lootPower = 5 + hero.level + (chestlvl * 2) + (kapitel * (3 + hlp_random(3))) + ((dropchance + 10) / 50);
	lootPower += StExt_GetPermilleFromValue(lootPower, (StExt_PcStats[StExt_PcStats_Index_Luck] + StExt_PcStats[StExt_PcStats_Index_ChestLuck] + 1) / 2);
	
	StExt_CalcChestLootPower_Ret_GoldPower = goldPower;
	StExt_CalcChestLootPower_Ret_LootPower = lootPower;
};

func void StExt_ChestLootHandler(var int chestlvl)
{	
	var int dropchance;
	var int dropchanceTmp;
	var int goldPower;
	var int lootPower;
	StExt_LuckProcGlobal = 0;
	
	if (!StExt_Config_Luck_EnableRandomLoot_Chests && !StExt_RandomChestGenerateLoot) { return; };
	StExt_PrintDebugStack(concatstrings("StExt_ChestLootHandler(var int chestlvl) chestlvl:", inttostring(chestlvl)));	
	
	// Calculate chance
	
	dropchanceTmp = StExt_PcStats[StExt_PcStats_Index_Luck];
	if (dropchanceTmp > 0) { dropchanceTmp = (dropchanceTmp + 1) / 2; };
	dropchance = 50 + (chestlvl * 25) + (kapitel * 10) + hero.level + StExt_PcStats[StExt_PcStats_Index_ChestLuck];
	if (!StExt_RandomChestGenerateLoot) {
		if (!StExt_Chance(dropchance)) 
		{
			StExt_PrintDebugStack("StExt_ChestLootHandler(var int chestlvl) -> Skip");
			return; 
		};
	};
	
	StExt_CalcChestLootPower(chestlvl, dropchance);
	goldPower = StExt_CalcChestLootPower_Ret_GoldPower;
	lootPower = StExt_CalcChestLootPower_Ret_LootPower;	

	// Do the loot
	StExt_PrintLootInitDebug("Chest", lootPower, goldPower);	
	goldPower = StExt_ApplyPercentToValue(goldPower, StExt_Config_Luck_Money);
	if (goldPower > 0)
	{
		goldPower = 1 + StExt_GetRandomRange(goldPower / 2, goldPower);
		StExt_CreateRandomItem(hero, itmi_gold, goldPower, true);
	};
	
	if (lootPower > 0)
	{
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Food + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraFoodLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Magic + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraMagicLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Alchemy + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraAlchemyLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_MagicWeapons + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraMagicWeaponLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_MeeleWeapons + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraMeleeWeaponLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_RangeWeapons + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraRangeWeaponLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Jewelry + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraJewelryLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Munition + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraMunitionLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Misk + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraMiskLoot(hero, lootPower, true); };
		if (StExt_Chance(StExt_Config_Luck_RelativeDropChance_Armors + StExt_ChestLuck_RelativeMult)) { StExt_GiveExtraArmorLoot(hero, lootPower, true); };
	};
	if ((StExt_LuckProcGlobal > 0) && StExt_Config_DisplayLuckMessage) { StExt_PrintMessageToTray(StExt_Str_print_luckinfo, StExt_Color_Green); };
	StExt_LuckProcGlobal = 0;
};

// Random box handler
var int StExt_OpenFish_TierCond[4];
var int StExt_OpenFish_TierCount[4];
var string StExt_OpenFish_TierArray0;
var string StExt_OpenFish_TierArray1;
var string StExt_OpenFish_TierArray2;
var string StExt_OpenFish_TierArray3;

func int StExt_OpenFish_GetMaxPower() { return 15 + hero.level + ((10 + StExt_PcStats[StExt_PcStats_Index_Luck] + StExt_PcStats[StExt_PcStats_Index_ChestLuck]) / 10); };

func void StExt_OpenFish()
{
	var int power;
	var int powerMax;
	var int powerMin;
	var int itemId;
	var string itemName;
	
	powerMax = StExt_OpenFish_GetMaxPower();
	powerMin = StExt_GetPercentFromValue(powerMax, 50);
	power = StExt_GetRandomRange(powerMin, powerMax);
	
	if (power >= StExt_OpenFish_TierCond[3]) { itemName = StExt_Array_GetString(StExt_OpenFish_TierArray3, hlp_random(StExt_OpenFish_TierCount[3])); }
	else if (power >= StExt_OpenFish_TierCond[2]) { itemName = StExt_Array_GetString(StExt_OpenFish_TierArray2, hlp_random(StExt_OpenFish_TierCount[2])); }
	else if (power >= StExt_OpenFish_TierCond[1]) { itemName = StExt_Array_GetString(StExt_OpenFish_TierArray1, hlp_random(StExt_OpenFish_TierCount[1])); }
	else { itemName = StExt_Array_GetString(StExt_OpenFish_TierArray0, hlp_random(StExt_OpenFish_TierCount[0])); };
	
	itemId = StExt_GetInstanceIdByName(itemName);
	b_playerfinditem(itemId, 1);
};

func void StExt_OpenFish_Misk()
{
	StExt_OpenFish_TierCond[0] = 0;
	StExt_OpenFish_TierCount[0] = StExt_LootTable_Misk1_Max;
	StExt_OpenFish_TierArray0 = "StExt_LootTable_Misk1";
	
	StExt_OpenFish_TierCond[1] = StExt_ApplyPercentToValue(30, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[1] = StExt_LootTable_Misk2_Max;
	StExt_OpenFish_TierArray1 = "StExt_LootTable_Misk2";
	
	StExt_OpenFish_TierCond[2] = StExt_ApplyPercentToValue(60, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[2] = StExt_LootTable_Misk3_Max;
	StExt_OpenFish_TierArray2 = "StExt_LootTable_Misk3";
	
	StExt_OpenFish_TierCond[3] = StExt_ApplyPercentToValue(90, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[3] = StExt_LootTable_Misk4_Max;
	StExt_OpenFish_TierArray3 = "StExt_LootTable_Misk4";
	
	StExt_OpenFish();	
};

func void StExt_OpenFish_Magic()
{
	StExt_OpenFish_TierCond[0] = 0;
	StExt_OpenFish_TierCount[0] = StExt_LootTable_Magic1_Max;
	StExt_OpenFish_TierArray0 = "StExt_LootTable_Magic1";
	
	StExt_OpenFish_TierCond[1] = StExt_ApplyPercentToValue(35, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[1] = StExt_LootTable_Magic2_Max;
	StExt_OpenFish_TierArray1 = "StExt_LootTable_Magic2";
	
	StExt_OpenFish_TierCond[2] = StExt_ApplyPercentToValue(70, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[2] = StExt_LootTable_Magic3_Max;
	StExt_OpenFish_TierArray2 = "StExt_LootTable_Magic3";
	
	StExt_OpenFish_TierCond[3] = StExt_ApplyPercentToValue(100, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[3] = StExt_LootTable_Magic4_Max;
	StExt_OpenFish_TierArray3 = "StExt_LootTable_Magic4";
	
	StExt_OpenFish();	
};

func void StExt_OpenFish_Alchemy()
{
	StExt_OpenFish_TierCond[0] = 0;
	StExt_OpenFish_TierCount[0] = StExt_LootTable_Alchemy1_Max;
	StExt_OpenFish_TierArray0 = "StExt_LootTable_Alchemy1";
	
	StExt_OpenFish_TierCond[1] = StExt_ApplyPercentToValue(30, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[1] = StExt_LootTable_Alchemy2_Max;
	StExt_OpenFish_TierArray1 = "StExt_LootTable_Alchemy2";
	
	StExt_OpenFish_TierCond[2] = StExt_ApplyPercentToValue(60, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[2] = StExt_LootTable_Alchemy3_Max;
	StExt_OpenFish_TierArray2 = "StExt_LootTable_Alchemy3";
	
	StExt_OpenFish_TierCond[3] = StExt_ApplyPercentToValue(90, StExt_Config_Luck_Difficulty);
	StExt_OpenFish_TierCount[3] = StExt_LootTable_Alchemy4_Max;
	StExt_OpenFish_TierArray3 = "StExt_LootTable_Alchemy4";
	
	StExt_OpenFish();	
};

func int StExt_OpenChest_GetMaxPower() { return 15 + (kapitel * 10) + (hero.level * 2) + ((10 + StExt_PcStats[StExt_PcStats_Index_Luck] + StExt_PcStats[StExt_PcStats_Index_ChestLuck]) / 10); };

func void StExt_OpenChest(var string listName)
{
	var int power;
	var int powerMax;
	var int powerMin;
	var int itemId;
	var int type;
	
	type = StExt_SelectItemClassFromList(listName);
	if (type == StExt_Null)
	{
		StExt_PrintDebugStack(concatstrings("StExt_OpenChest(var string listName) -> list name seems incorrect: ", listName));
		return;
	};
	
	powerMax = StExt_OpenChest_GetMaxPower();
	powerMin = StExt_GetPercentFromValue(powerMax, 50);
	power = StExt_GetRandomRange(powerMin, powerMax);
	
	itemId = StExt_GenerateRandomItem(type, power);
	b_playerfinditem_stext(itemId, 1);
	createinvitems(hero, itmi_jewelerychest_empty, 1);
};