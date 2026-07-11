func string StExt_PassiveLevelToString(var int level)
{
	if (level) { return StExt_Str_Learned; };
	return StExt_Str_No;
};

func string StExt_MasteryLevelToString(var int level)
{
	if (level < StExt_TalentLevel_None) || (level >= StExt_TalentLevel_Max)
	{
		StExt_PrintDebugStack(concatstrings("StExt_MasteryLevelToString(var int level) -> Mastery level out of range! Level: ", inttostring(level)));
		return StExt_UnknownString;
	};	
	return StExt_Array_GetString("StExt_Str_MasteryLevels", level);
};

func void StExt_PrintLearnedMastery(var int mastery)
{
	var string result;
	var string masteryTxt;
	var string levelTxt;
	var int level;
	if (mastery < 0) || (mastery >= StExt_MasteryIndex_Max)
	{
		StExt_PrintDebugStack(concatstrings("StExt_PrintLearnedMastery(var int mastery) -> Mastery index out of range! Index: ", inttostring(mastery)));
		ai_print(StExt_UnknownString);
		return;
	};
	result = StExt_Str_Learned;
	masteryTxt = StExt_Array_GetString("StExt_Str_MasteryNames", mastery);
	level = StExt_Array_GetInt(StExt_MasteryArrayIndex_Level, mastery);
	levelTxt = StExt_MasteryLevelToString(level);
    result = concatstrings(result, masteryTxt);
	result = concatstrings(result, " - ");
	result = concatstrings(result, levelTxt);
	ai_print(result);
};

func void StExt_PrintMasteryLevelUp(var int mastery)
{
	var string result;
	var string masteryName;
	var int level;
	var int lp;
	if (mastery < 0) || (mastery >= StExt_MasteryIndex_Max)
	{
		StExt_PrintDebugStack(concatstrings("StExt_PrintMasteryLevelUp(var int mastery) -> Mastery index out of range! Index: ", inttostring(mastery)));
		ai_print(StExt_UnknownString);
		return;
	};
	
	masteryName = StExt_Array_GetString("StExt_Str_MasteryNames", mastery);
	level = StExt_Array_GetInt(StExt_MasteryArrayIndex_Progress, mastery);
	lp = StExt_Array_GetInt(StExt_MasteryArrayIndex_PerkPoints, mastery);
	
	result = "'";	
    result = concatstrings(result, masteryName);
	result = concatstrings(result, "' - ");
	result = concatstrings(result, StExt_Str_Level);
	result = concatstrings(result, inttostring(level));
	result = concatstrings(result, " (");	
	result = concatstrings(result, StExt_Str_Lp);
	result = concatstrings(result, inttostring(lp));
	result = concatstrings(result, ")");
	ai_printbonus(result);
};

func string StExt_BuildTagsString(var string result, var string tag)
{
	if (!StExt_StringIsEmpty(result)) { result = concatstrings(result, " | "); };
	result = concatstrings(result, tag);
	return result;
};

var string StExt_GetNpcAbilitiesString_Result;
func void StExt_GetNpcAbilitiesString_Loop(var int abilitySlot)
{
	if(Hlp_IsNULL(StExt_CurrentNpcAbility)) {
		StExt_PrintDebug("StExt_GetNpcAbilitiesString_Loop()", "ability instance is null!", StExt_Self, StExt_Other);
		return;
	};
	if ((abilitySlot <= StExt_Null) && (abilitySlot >= StExt_Npc_MaxNpcAbilities)) { return; };
	StExt_GetNpcAbilitiesString_Result = StExt_BuildTagsString(StExt_GetNpcAbilitiesString_Result, StExt_CurrentNpcAbility.Name);
};

func string StExt_GetNpcAbilitiesString(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetNpcAbilitiesString(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return StExt_EmptyString; 
	};
	
	StExt_GetNpcAbilitiesString_Result = StExt_EmptyString;
	StExt_Npc_ForEachAbility(slf, StExt_NpcAbility_Type_None, StExt_NpcAbility_Flag_None, StExt_GetNpcAbilitiesString_Loop);
	return StExt_GetNpcAbilitiesString_Result;
};

func string StExt_GetNpcFlagsString(var c_npc slf)
{
	var string result;
	result = StExt_EmptyString;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetNpcFlagsString(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return StExt_EmptyString; 
	};
	
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_LootProcessed)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_LootProcessed); };	
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_IsDead)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_IsDead); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Duplicated)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Duplicated); };
	//if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Original)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Original); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Summoned)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Summoned); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Corrupted)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Corrupted); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Lucky)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Lucky); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Rich)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Rich); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_ScrollUser)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_ScrollUser); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Summoner)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Summoner); };	
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Priest)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Priest); };
	if (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Curser)) { result = StExt_BuildTagsString(result, StExt_Str_NpcFlag_Curser); };	
	
	if(!StExt_StringIsEmpty(result))
	{
		result = concatstrings("(", result);
		result = concatstrings(result, ")");
	};
	return result;
};

func string StExt_GetNpcRankString(var c_npc slf)
{
	var string result;
	result = StExt_EmptyString;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetNpcRankString(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return StExt_EmptyString; 
	};
	StExt_FocusNpcRank = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	if (StExt_FocusNpcRank == 1) { result = StExt_RankName_Uncommon; }
	else if (StExt_FocusNpcRank == 2) { result = StExt_RankName_Magic; }
	else if (StExt_FocusNpcRank == 3) { result = StExt_RankName_Rare; }
	else if (StExt_FocusNpcRank == 4) { result = StExt_RankName_Uniq; }
	else if (StExt_FocusNpcRank >= 5) { result = StExt_RankName_Legend; }
	else { result = StExt_UnknownString; };
	//if (StExt_Config_DebugEnabled) { result = concatstrings(slf.name, concatstrings(" - ", result)); };
	return result;
};

func string StExt_PermileToString(var int val)
{
	var string result;
	var int major;
	var int minor;
	if (val == 0) { return "0.0"; };
	
	//StExt_PrintDebugStack("StExt_PermileToString -> in");
	if ((val > -10) && (val < 10))
	{ 
		major = 0;
		minor = val;
	}
	else 
	{
		major = val / 10;
		minor = val - (major * 10);
		if(minor < 0) { minor = minor * (-1); };
	};
	
	result = concatstrings(inttostring(major), ".");
	result = concatstrings(result, inttostring(minor));
	//StExt_PrintDebugStack("StExt_PermileToString -> out");
	return result;
};

func string StExt_ResistToString(var c_npc slf, var int resistId)
{
	var string result;
	result = StExt_PermileToString(StExt_GetNpcVar(slf, resistId));
	result = concatstrings(result, "%");
	return result;
};

func string StExt_GetNpcExtraStatsString(var c_npc slf)
{
	var string result;
	result = StExt_EmptyString;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetNpcAbilitiesString(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return StExt_EmptyString; 
	};
	
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_Dodge, StExt_ResistToString(slf, StExt_AiVar_DodgeChance)));
	result = concatstrings(result, " | ");	

	result = concatstrings(result, StExt_Str_NpcStats_Resist);
	result = concatstrings(result, "[ ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtEdge, StExt_ResistToString(slf, StExt_AiVar_ResistEdge)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtBlunt, StExt_ResistToString(slf, StExt_AiVar_ResistBlunt)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtPoint, StExt_ResistToString(slf, StExt_AiVar_ResistPoint)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtFire, StExt_ResistToString(slf, StExt_AiVar_ResistFire)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtFly, StExt_ResistToString(slf, StExt_AiVar_ResistFly)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtMagic, StExt_ResistToString(slf, StExt_AiVar_ResistMagic)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtPois, StExt_ResistToString(slf, StExt_AiVar_ResistPois)));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtAoe, StExt_ResistToString(slf, StExt_AiVar_ResistAoe)));
	result = concatstrings(result, " ]");
	return result;
};

func string StExt_GetNpcStatsString(var c_npc slf)
{
	var string result;
	result = StExt_EmptyString;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetNpcAbilitiesString(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return StExt_EmptyString; 
	};
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_Str, inttostring(slf.attribute[4])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_Agi, inttostring(slf.attribute[5])));
	result = concatstrings(result, " | ");
	
	result = concatstrings(result, StExt_Str_NpcStats_Prot);
	result = concatstrings(result, "[ ");	
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtEdge, inttostring(slf.protection[prot_edge])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtBlunt, inttostring(slf.protection[prot_blunt])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtPoint, inttostring(slf.protection[prot_point])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtFire, inttostring(slf.protection[prot_fire])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtFly, inttostring(slf.protection[prot_fly])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtMagic, inttostring(slf.protection[prot_magic])));
	result = concatstrings(result, ", ");
	result = concatstrings(result, concatstrings(StExt_Str_NpcStats_ProtPois, inttostring(slf.protection[prot_fall])));
	result = concatstrings(result, " ]");
	return result;
};

// This one calls only from engine, when print info above focused instance
func void StExt_UpdateFocusNpcInfo()
{
	StExt_FocusNpcInfo[0] = StExt_EmptyString;
	StExt_FocusNpcInfo[1] = StExt_EmptyString;
	StExt_FocusNpcInfo[2] = StExt_EmptyString;
	StExt_FocusNpcInfo[3] = StExt_EmptyString;
	StExt_FocusNpcInfo[4] = StExt_EmptyString;
	StExt_FocusNpcRank = StExt_Null;
	if (!hlp_isvalidnpc(StExt_FocusNpc)) { return; };
	if (npc_isdead(StExt_FocusNpc)) { return; };
	
	if (StExt_Config_ShowNpcRank) { StExt_FocusNpcInfo[0] = StExt_GetNpcRankString(StExt_FocusNpc); };
	if (StExt_Config_ShowNpcFlags) { StExt_FocusNpcInfo[1] = StExt_GetNpcFlagsString(StExt_FocusNpc); };
	if (StExt_Config_ShowNpcAbilities) { StExt_FocusNpcInfo[2] = StExt_GetNpcAbilitiesString(StExt_FocusNpc); };
	if (StExt_Config_ShowNpcExtraInfo)
	{
		StExt_FocusNpcInfo[3] = StExt_GetNpcStatsString(StExt_FocusNpc);
		StExt_FocusNpcInfo[4] = StExt_GetNpcExtraStatsString(StExt_FocusNpc);
	};
};

func string StExt_GetMasteryPerkName(var int masteryId, var int perkId)
{
	var string perkArray;
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetMasteryPerkName(var int masteryId, var int perkId) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return StExt_UnknownString;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_MasteryPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetMasteryPerkName(var int masteryId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return StExt_UnknownString;
	};
	perkArray = concatstrings("StExt_Str_MasteryPerk_Name_", inttostring(masteryId));
	return StExt_Array_GetString(perkArray, perkId);
};

func string StExt_GetMasteryPerkDescription(var int masteryId, var int perkId)
{
	var string perkArray;
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetMasteryPerkDescription(var int masteryId, var int perkId) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return StExt_UnknownString;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_MasteryPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetMasteryPerkDescription(var int masteryId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return StExt_UnknownString;
	};
	perkArray = concatstrings("StExt_Str_MasteryPerk_Desc_", inttostring(masteryId));
	return StExt_Array_GetString(perkArray, perkId);
};

func string StExt_GetGenericPerkName(var int perkId)
{
	var string perkArray;
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetGenericPerkName(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return StExt_UnknownString;
	};
	return StExt_Array_GetString("StExt_Str_Perk_Name", perkId);
};

func string StExt_GetCorruptionPerkName(var int corruptionId, var int perkId)
{
	var string arrayName;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkName(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return StExt_UnknownString;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkName(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return StExt_UnknownString;
	};
	
	arrayName = StExt_GetCorruptionPrefix(corruptionId);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkName(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return StExt_UnknownString;
	};
	arrayName = concatstrings("StExt_Corruption_Perk_Name_", arrayName);
	return StExt_Array_GetString(arrayName, perkId);
};

func string StExt_GetCorruptionPerkDescription(var int corruptionId, var int perkId)
{
	var string arrayName;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkDescription(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return StExt_UnknownString;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkDescription(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return StExt_UnknownString;
	};
	
	arrayName = StExt_GetCorruptionPrefix(corruptionId);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPerkDescription(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return StExt_UnknownString;
	};
	arrayName = concatstrings("StExt_Corruption_Perk_Desc_", arrayName);
	return StExt_Array_GetString(arrayName, perkId);
};

func void StExt_PrintExtraDamage(var int damage, var int type)
{
	var string msg;
	var string color;
	var string tags;
	if (damage <= 0) { return; };
	if (!hlp_isvalidnpc(StExt_AttackNpc)) { return; };
	
	if (StExt_IsSummonOrHero(StExt_AttackNpc))
	{
		if (StExt_Config_EnableOldDamageOutput) 
		{ 
			tags = StExt_EmptyString;
			msg = StExt_Str_ExtraDamage;
			color = StExt_Color_Common;		
			if (StExt_IsSummonOrTotem(StExt_AttackNpc))
			{
				color = StExt_Color_Common_Faded;
				msg = concatstrings(msg, " (");
				msg = concatstrings(msg, StExt_AttackNpc.name);
				msg = concatstrings(msg, ")");
			};
			if (type > 0)
			{
				msg = concatstrings(msg, " [");
				if (StExt_ValueHasFlag(type, StExt_DamageMessageType_Dot)) { tags = StExt_BuildTagsString(tags, StExt_Str_ExtraDamageFlag_Dot); };
				if (StExt_ValueHasFlag(type, StExt_DamageMessageType_Reflect)) { tags = StExt_BuildTagsString(tags, StExt_Str_ExtraDamageFlag_Reflect); };
				msg = concatstrings(msg, tags);
				msg = concatstrings(msg, "]");
			};
			msg = concatstrings(msg, ": ");
			msg = concatstrings(msg, inttostring(damage));
			StExt_PrintMessageToTray(msg, color); 
		}
		else 
		{ 
			color = StExt_Color_Common_Faded;		
			if (StExt_IsSummonOrTotem(StExt_AttackNpc)) { color = StExt_Color_Damage_Summon; }
			else if (type > 0)
			{
				if (StExt_ValueHasFlag(type, StExt_DamageMessageType_Dot)) { color = StExt_Color_Damage_Dot; };
				if (StExt_ValueHasFlag(type, StExt_DamageMessageType_Reflect)) { color = StExt_Color_Damage_Reflect; };
			};
			RX_PrintDamage(hero, damage, color, true);
		};
	};
};

func void StExt_PrintBlockDamage(var c_npc atk, var c_npc target, var int type)
{
	var string msg;
	var string tags;
	var string color;
	if (!hlp_isvalidnpc(atk) || !hlp_isvalidnpc(target))
	{
		StExt_PrintDebug("StExt_PrintBlockDamage(...)", "Some actor instance is null!", atk, target);
		return;
	};
	
	msg = StExt_Str_DamageBlocked;
	color = StExt_Color_Common;
	tags = StExt_EmptyString;
	
	if (StExt_ValueHasFlag(type, StExt_DamageBlockReason_Dodge)) { tags = StExt_BuildTagsString(tags, StExt_Str_DamageBlocked_Dodge); };
	if (StExt_ValueHasFlag(type, StExt_DamageBlockReason_Ignored)) { tags = StExt_BuildTagsString(tags, StExt_Str_DamageBlocked_Ignored); };
	if (StExt_ValueHasFlag(type, StExt_DamageBlockReason_ArrowDeclined)) { tags = StExt_BuildTagsString(tags, StExt_Str_DamageBlocked_ArrowDeclined); };
	if (StExt_ValueHasFlag(type, StExt_DamageBlockReason_SpellAbsorbed)) { tags = StExt_BuildTagsString(tags, StExt_Str_DamageBlocked_SpellAbsorbed); };
	if (StExt_ValueHasFlag(type, StExt_DamageBlockReason_SpellReflected)) { tags = StExt_BuildTagsString(tags, StExt_Str_DamageBlocked_SpellReflected); };
	
	if (npc_isplayer(atk)) { color = StExt_Color_Red; }
	else if (npc_isplayer(target)) { color = StExt_Color_Green; };
	
	if (!StExt_StringIsEmpty(tags))
	{
		msg = concatstrings(msg, " [");
		msg = concatstrings(msg, tags);
		msg = concatstrings(msg, "]");
	};
	StExt_PrintMessageToTray(msg, color);
};

func string StExt_TryGetValueName(var string valueSym)
{
	var string valueNameSym;
	
	valueNameSym = StExt_TryGetSymbolDescriptionText(valueSym);
	if (StExt_StringIsEmpty(valueNameSym)) { return valueSym; };
	if (!StExt_SymbolExist(valueNameSym)) { return valueSym; };	
	return StExt_GetStringValueByName(valueNameSym);
};