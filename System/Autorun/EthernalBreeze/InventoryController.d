func void StExt_ProcessPcInventory()
{
	var c_item collar;
	if (npc_hasitems(hero, itar_stext_wig) > 0) { npc_removeinvitems(hero, itar_stext_wig, npc_hasitems(hero, itar_stext_wig)); };
	if (npc_hasitems(hero, itpo_rt_godspotion) > 0) { npc_removeinvitems(hero, itpo_rt_godspotion, npc_hasitems(hero, itpo_rt_godspotion)); };
	
	if (StExt_CollarOn)
	{
		StExt_CollarOn = true;
		StExt_LockConfigs = true;
		StExt_LockConsole = true;
		itm_setflagactive(itar_stext_collar, true);
		collar = hlp_getslotitem(hero, "BIP01 NECK");
		if (!hlp_isvaliditem(collar) || !hlp_isitem(collar, itar_stext_collar))
		{
			activatezsslot(hero, "BIP01 NECK");
			ext_removefromslot(hero, "BIP01 NECK");
			ext_putinslot(hero, "BIP01 NECK", itar_stext_collar);
			npc_removeinvitems(hero, itar_stext_collar, npc_hasitems(hero, itar_stext_collar));
		};
	};	
};

// This function called from engine only for player
func int StExt_CheckConditionStat(var int condAtrId, var int condAtrVal)
{
	var int result; result = true;
	var int curVal;
	var int valDelta;
	var string atrName;
	var string msg;
	
	if ((condAtrId == atr_mana_max) && ((condAtrVal == 666666) || (condAtrVal == 6666))) 
	{
		ai_print(print_addon_beliarscourse_missing);
        return false;
    };
	
	if(condAtrId == atr_hitpoints)
	{
		curVal = hero.attribute[atr_hitpoints];
		atrName = StExt_Str_Item_Cond_Hp;
	}
	else if(condAtrId == atr_hitpoints_max)
	{
		curVal = hero.attribute[atr_hitpoints_max];
		atrName = StExt_Str_Item_Cond_Hp;
	}
	else if(condAtrId == atr_mana)
	{
		curVal = hero.attribute[atr_mana];
		atrName = StExt_Str_Item_Cond_Mp;
	}
	else if(condAtrId == atr_mana_max)
	{
		curVal = hero.attribute[atr_mana_max];
		atrName = StExt_Str_Item_Cond_Mp;
	}
	else if(condAtrId == atr_strength)
	{
		curVal = hero.attribute[atr_strength];
		atrName = StExt_Str_Item_Cond_Str;
	}
	else if(condAtrId == atr_dexterity)
	{
		curVal = hero.attribute[atr_dexterity];
		atrName = StExt_Str_Item_Cond_Agi;
	}
	else if(condAtrId == aivrx_npc_atr_shield)
	{
		curVal = rx_getnpcvar(hero, aivrx_npc_atr_shield);
		atrName = StExt_Str_Item_Cond_Shield;
		result = (curVal > 0);
		if (!result)
		{
			msg = StExt_Str_Absent;
			msg = concatstrings(msg, StExt_Str_Item_Cond_Shield);
			msg = concatstrings(msg, "!");
			ai_print(msg);
		};
		return result;
	}		
	else if(condAtrId == aivrx_npc_atr_bow)
	{
		curVal = hero.hitchance[3];
		atrName = StExt_Str_Item_Cond_Bow;
	}
	else if(condAtrId == aivrx_npc_atr_crossbow)
	{
		curVal = hero.hitchance[4];
		atrName = StExt_Str_Item_Cond_CBow;
	}
	else if(condAtrId == aivrx_npc_atr_stamina)
	{
		curVal = atr_stamina_max;
		atrName = StExt_Str_Item_Cond_St;
	}
	else if(condAtrId == StExt_Item_Cond_OneHanded)
	{
		curVal = hero.hitchance[1];
		atrName = StExt_Str_Item_Cond_OneHanded;
	}
	else if(condAtrId == StExt_Item_Cond_TwoHanded)
	{
		curVal = hero.hitchance[2];
		atrName = StExt_Str_Item_Cond_TwoHanded;
	}
	else if(condAtrId == StExt_Item_Cond_Int)
	{
		curVal = atr_intellect;
		atrName = StExt_Str_Item_Cond_Int;
	}	
	else if(condAtrId == StExt_Item_Cond_Level)
	{
		curVal = hero.level;
		atrName = StExt_Str_Item_Cond_Level;
	}
	else if(condAtrId == StExt_Item_Cond_BeliarKarma)
	{
		curVal = beliarpraycount + StExt_BeliarKarmaQuest;	// wymagania przedmiotow licza SUME (baza + questy)
		atrName = StExt_Str_Item_Cond_BeliarKarma;
	}
	else if(condAtrId == StExt_Item_Cond_InnosKarma)
	{
		curVal = StExt_InnosKarma;
		atrName = StExt_Str_Item_Cond_InnosKarma;
	}
	else if(condAtrId == StExt_Item_Cond_AdanosKarma)
	{
		curVal = StExt_AdanosKarma;
		atrName = StExt_Str_Item_Cond_AdanosKarma;
	}	
	else { return true; };
	
	valDelta = curVal - condAtrVal;
	result = (valDelta >= 0);
	if (!result)
	{
		msg = print_missing;
		msg = concatstrings(msg, inttostring(valDelta * (-1)));
		msg = concatstrings(msg, StExt_Str_Pts);
		msg = concatstrings(msg, " ");
		msg = concatstrings(msg, atrName);
		msg = concatstrings(msg, "!");
		ai_print(msg);
	};
	return result;
};

func void StExt_BuildItemsSellForm_Loop() {
	rx_craft_playersales_addtoproductlist(StExt_CraftInfo.ResultInstance, StExt_CraftInfo.Price);
};

const string StExt_ItemsSellForm_ExcludedItems[8] =
{
	"itbg_trash",
	"itbg_platsfood",
	"itbg_jewerly",
	"itbg_mage",
	"itbg_alchemy",
	"itbg_weapon",
	"itbg_armor",
	"itmi_sleepsack"
};