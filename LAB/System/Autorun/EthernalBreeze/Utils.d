func int StExt_IfInt(var int exp, var int resTrue, var int resFalse)
{
	if (exp) { return resTrue; };
	return resFalse;
};

func string StExt_IfStr(var int exp, var string resTrue, var string resFalse)
{
	if (exp) { return resTrue; };
	return resFalse;
};

func int StExt_GetFramesFromSeconds(var int seconds) 
{ 
	if(StExt_Fps < 45) { StExt_Fps = 45; };
	return StExt_Fps * seconds; 
};

func int StExt_Random(var int val)
{
	if ((val >= (-1)) && (val <= 1)) { return 0; };
	return hlp_random(val);
};

func int StExt_RandIndex(var int val)
{
	if (val <= 1) { return 0; };
	return hlp_random(val);
};

func int StExt_IsDayTime() { return (StExt_CurrentDayPart & StExt_TimeBindingFlag_DayTime) != 0; };

func int StExt_ValidateValueRange(var int val, var int min, var int max)
{
	if (val > max) { return max; };
	if (val < min) { return min; };
	return val;
};

func int StExt_ValidateValueMin(var int val, var int min)
{
	if (val < min) { return min; };
	return val;
};

func int StExt_Abs(var int val)
{
	if (val < 0) { return val * (-1); };
	return val;
};

func int StExt_ValueInRange(var int val, var int min, var int max)
{
	if ((val >= min) && (val <= max)) { return true; };
	return false;
};

func int StExt_CheckRangeInclusive(var int val, var int min, var int max)
{
	if (val >= max) { return false; };
	if (val <= min) { return false; };
	return true;
};

func int StExt_CheckRange(var int val, var int min, var int max)
{
	if (val > max) { return false; };
	if (val < min) { return false; };
	return true;
};

func int StExt_CheckArrayRange(var int val, var int max)
{
	if (val >= max) { return false; };
	if (val < 0) { return false; };
	return true;
};

func int StExt_ApplyValueChangeWithMinimum(var int val, var int min, var int changeVal)
{
	val += changeVal;
	if (val < min) { val = min; };
	return val;
};

func int StExt_ValueHasFlag(var int val, var int flag) { return (val & flag) != 0; };

func int StExt_Chance(var int chance) 
{
    var int rnd;
    if (chance <= 0) { return false; };
	if (chance >= 1000) { return true; };
    rnd = hlp_random(1000);
    if (chance >= rnd) { return true; };
    return false;
};

func int StExt_GetRandomRange(var int min, var int max)
{
	var int diff;
	var string msg;
	if ((min == 0) && (max == 0))
	{
		msg = concatstrings("StExt_GetRandomRange() -> incorrect input. Min: ", inttostring(min));
		msg = concatstrings(msg, "; Max: ");
		msg = concatstrings(msg, inttostring(max));
		StExt_PrintDebugStack(msg);
		return 0;
	};
	if (min >= max) { return min; };
	
	diff = max - min;
	if (diff > 0) {	return min + hlp_random(diff); }
	else if (max > 0) { return hlp_random(max); }
	else if (min > 0) { return hlp_random(min); };
	return min;
};

func int StExt_GetRandomSignedRange(var int val)
{
	var int result;	
	if (val == 0) { return val; };
	if (val < 0) { val = val * (-1); };	
	result = hlp_random(val + 1);
	if (hlp_random(2)) { result = result * (-1); };	
	return result;
};

func int StExt_StringIsEmpty(var string str)
{
	if (Hlp_StrCmp(str, StExt_EmptyString)) { return true; };
	return false;
};

func int StExt_GetNpcUid(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetNpcUid(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return StExt_Null; 
	};
	return rx_getnpcvar(slf, StExt_AiVar_Uid);
};

func void StExt_CheckUid(var c_npc slf)
{
	var string message;
	var int uid;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_CheckUid(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if ((slf.aivar[43] == id_totem) || (hlp_getinstanceid(slf) == hlp_getinstanceid(wisp_detector))) { return; };
	
	if (npc_isplayer(slf)) 
	{ 
		if(StExt_GetNpcUid(slf) != 0) {
			StExt_HeroUid = StExt_RegisterNpc(slf, uid);
		};
		uid = StExt_GetNpcUid(slf);	
		if(uid != 0) 
		{
			uid = 0;
			StExt_HeroUid = StExt_RegisterNpc(slf, uid);
		};
		return;
	};
	
	uid = StExt_GetNpcUid(slf);	
	if ((uid == 0) || (uid == StExt_Null))
	{
		uid = StExt_RegisterNpc(slf, uid);		
		rx_setnpcvar(slf, StExt_AiVar_Uid, uid);
		if(StExt_Config_DebugEnabled)
		{
			message = concatstrings("Set UId [", inttostring(uid));
			message = concatstrings(message, "] to ");
			if (npc_isplayer(slf)) { message = concatstrings(message, "Hero"); }
			else if (hlp_strcmp(slf.name, StExt_EmptyString)) { message = concatstrings(message, "-=No name=-"); }
			else { message = concatstrings(message, slf.name); };		
			StExt_PrintDebugStack(message);
		};
	};
};

func int StExt_IsGolem(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if ((slf.guild == gil_stonegolem) || (slf.guild == gil_firegolem) || (slf.guild == gil_icegolem) || (slf.guild == gil_summoned_golem) || (slf.guild == gil_stoneguardian) || (slf.guild == gil_summonedguardian) || (slf.guild == gil_swampgolem)) 
	{
		return true;
	};
	return false;
};

func int StExt_IsSummonUndead(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (rx_isnpc(slf, dk_petshow) || rx_isnpc(slf, dk_pet)) { return false; };
	if ((slf.aivar[43] == id_summoned_gobbo_skeleton) || (slf.aivar[43] == id_summoned_skeleton) || (slf.aivar[43] == id_summonedzombie) || (slf.aivar[43] == id_shadowbeast_skeleton) || (slf.aivar[43] == id_summoned_skeleton_mage))
	{
		return true;
	};
	return false;
};

func int StExt_IsSummonDemon(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if ((slf.aivar[43] == id_summoned_demon) || rx_isnpc(slf, dk_petshow) || rx_isnpc(slf, dk_pet) || ((slf.aivar[91] == rx_summon_id) && (slf.guild == gil_summoned_demon))) { return true; };
	return false;
};

func int StExt_IsSummonGolem(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if ((slf.aivar[43] == id_summoned_golem) || (slf.aivar[43] == id_summonedguardian)) { return true; };
	return false;
};

func int StExt_IsSummonAnimal(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (rx_isnpc(slf, crait) || rx_isnpc(slf, dsnapper) || (slf.aivar[43] == id_summoned_swampdrone) || (slf.aivar[43] == id_summoned_dragon) || (slf.aivar[43] == id_summoned_wolf)) { return true; };
	return false;
};

func int StExt_IsSummonOrTotem(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (rx_issummonnpc(slf) || rx_getnpcvar(slf, aivrx_npc_darkcontrol) || 
		StExt_IsSummonAnimal(slf) || StExt_IsSummonGolem(slf) || StExt_IsSummonDemon(slf) || StExt_IsSummonUndead(slf)) { return true; };
	return false;
};

func int StExt_IsSummonOrHero(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (npc_isplayer(slf) || StExt_IsSummonOrTotem(slf)) { return true; };
	return false;
};

func int StExt_IsHeroPatryNpc(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (StExt_IsSummonOrHero(slf) || (slf.aivar[15] == true)) { return true; };
	return false;
};

func int StExt_IsNpcImmortal(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (npc_isplayer(slf) && (StExt_ImmortalFlagTime > 0)) { return true; };
	if ((slf.flags == npc_flag_immortal) || (slf.flags == npc_flag_xaradrim) || (slf.flags == orctemplenpcflags) || (hlp_getinstanceid(slf) == hlp_getinstanceid(stonegolem_osta)) || (hlp_getinstanceid(slf) == hlp_getinstanceid(xranfreg)) || (hlp_getinstanceid(slf) == hlp_getinstanceid(caracust))) { return true; };
	return false;
};

func int StExt_IsNpcXardasGuard(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	return (rx_isnpc(slf, xardas_skeleton_servant_01) || rx_isnpc(slf, xardas_skeleton_guard_sum_01) || rx_isnpc(slf, xardas_skeleton_guard_sum_02) ||
		rx_isnpc(slf, xardas_skeleton_guard_01) || rx_isnpc(slf, xardas_skeleton_guard_02) || rx_isnpc(slf, xardas_skeleton_servant_02) || 
		rx_isnpc(slf, xardas_skeleton_guard_03) || rx_isnpc(slf, xardas_skeleton_guard_04) || rx_isnpc(slf, xardas_skeleton_guard_05));
};

func int StExt_Npc_HasExtraFlag(var c_npc slf, var int flag)
{
	var int value; value = StExt_GetNpcVar(slf, StExt_AiVar_ExtraFlags);
	return StExt_ValueHasFlag(value, flag);
};

func void StExt_Npc_SetExtraFlag(var c_npc slf, var int flag, var int val)
{
	var int value;
	value = StExt_GetNpcVar(slf, StExt_AiVar_ExtraFlags);
	if (val == false) { value = value & (~flag); }
	else { value = value | flag; };
	StExt_SetNpcVar(slf, StExt_AiVar_ExtraFlags, value);
};

func int StExt_Npc_IsDuplicated(var c_npc slf) { return (StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Duplicated) || StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Original)); };
func int StExt_Npc_IsSummoned(var c_npc slf) { return StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_Summoned); };
func int StExt_Npc_IsLooted(var c_npc slf) { return StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_LootProcessed); };
func int StExt_Npc_IsDead(var c_npc slf) { return StExt_Npc_HasExtraFlag(slf, StExt_NpcFlag_IsDead); };


func int StExt_IsNpcImmortal_Engine()
{
	if(hlp_isvalidnpc(StExt_TargetNpc)) { return StExt_IsNpcImmortal(StExt_TargetNpc); };
	return false;
};


func int StExt_GetNpcRelation(var c_npc slf, var c_npc oth)
{
    var int slfHeroEnemy;
    var int othHeroEnemy;
	var int isSlfHeroSide;
    var int isOthHeroSide;	
    var int temp_att;
    var int perm_att;
    var int guild_att;
	var int isSlfSummoned;
	var int isOthSummoned;
	var int slfOwnerGuild; slfOwnerGuild = StExt_Null;
	var int othOwnerGuild; othOwnerGuild = StExt_Null;	
	var int summonsIsEnemies;
    
    if (!hlp_isvalidnpc(slf) || !hlp_isvalidnpc(oth)) {
        StExt_PrintDebug("StExt_GetNpcRelation(...)", "Invalid npc!", slf, oth);
        return StExt_NpcRelation_Unknown;
    };
	
	if (rx_isnpc(oth, wisp_detector) || rx_isnpc(oth, wisp_detector_ast)) { return StExt_NpcRelation_Neutral; };
	if ((oth.guild == gil_sheep) || (oth.guild == gil_meatbug) || (oth.aivar[43] == id_baran) || (oth.aivar[43] == id_ziege)) { return StExt_NpcRelation_Neutral; };
    if (hlp_getinstanceid(slf) == hlp_getinstanceid(oth)) { return StExt_NpcRelation_Ally; };

    isSlfHeroSide = StExt_IsHeroPatryNpc(slf);
    isOthHeroSide = StExt_IsHeroPatryNpc(oth);
    if (isSlfHeroSide && isOthHeroSide) { return StExt_NpcRelation_Ally; };	

	temp_att = npc_getattitude(slf, hero);
    perm_att = npc_getpermattitude(slf, hero);
    guild_att = wld_getguildattitude(slf.guild, hero.guild);
    slfHeroEnemy = (temp_att < att_neutral || perm_att < att_neutral || guild_att < att_neutral);
	
	isSlfSummoned = StExt_Npc_IsSummoned(slf);
	if (isSlfSummoned)
	{
		slfOwnerGuild = StExt_GetNpcVar(slf, StExt_AiVar_OwnerGuild);
		if (wld_getguildattitude(slfOwnerGuild, hero.guild) < att_neutral) { slfHeroEnemy = true; };
	};
	
	temp_att = npc_getattitude(oth, hero);
    perm_att = npc_getpermattitude(oth, hero);
    guild_att = wld_getguildattitude(oth.guild, hero.guild);
    othHeroEnemy = (temp_att < att_neutral || perm_att < att_neutral || guild_att < att_neutral);	
	
	isOthSummoned = StExt_Npc_IsSummoned(oth);
	if (isOthSummoned)
	{
		othOwnerGuild = StExt_GetNpcVar(oth, StExt_AiVar_OwnerGuild);
		if (wld_getguildattitude(othOwnerGuild, hero.guild) < att_neutral) { othHeroEnemy = true; };
	};
	
    if (isSlfHeroSide && othHeroEnemy) { return StExt_NpcRelation_Enemy; };
    if (isOthHeroSide && slfHeroEnemy) { return StExt_NpcRelation_Enemy; };
    //if (slfHeroEnemy && othHeroEnemy) { return StExt_NpcRelation_Ally; };
	
	if (isSlfSummoned && isOthSummoned) { summonsIsEnemies = (wld_getguildattitude(slfOwnerGuild, othOwnerGuild) < att_neutral); }
	else if (isSlfSummoned) { summonsIsEnemies = (wld_getguildattitude(slfOwnerGuild, oth.guild) < att_neutral); }
	else if (isOthSummoned) { summonsIsEnemies = (wld_getguildattitude(slf.guild, othOwnerGuild) < att_neutral); };
	if (summonsIsEnemies) { return StExt_NpcRelation_Enemy; };
    
    temp_att = npc_getattitude(slf, oth);
    perm_att = npc_getpermattitude(slf, oth);
    guild_att = wld_getguildattitude(slf.guild, oth.guild);

    if (temp_att < att_neutral || perm_att < att_neutral || guild_att < att_neutral) { return StExt_NpcRelation_Enemy; };
    if (temp_att >= att_friendly && perm_att >= att_friendly && guild_att >= att_friendly) { return StExt_NpcRelation_Ally; };
    return StExt_NpcRelation_Neutral;
};

func int StExt_NpcsIsEnemies(var c_npc slf, var c_npc oth) { return StExt_GetNpcRelation(slf, oth) == StExt_NpcRelation_Enemy; };
func int StExt_NpcsIsAllies(var c_npc slf, var c_npc oth) { return StExt_GetNpcRelation(slf, oth) == StExt_NpcRelation_Ally; };
func int StExt_NpcsIsNeutras(var c_npc slf, var c_npc oth) { return StExt_GetNpcRelation(slf, oth) == StExt_NpcRelation_Neutral; };

func int StExt_CanApplyDebuffToUnconsciousNpc(var c_npc slf, var c_npc oth)
{
	if (!hlp_isvalidnpc(slf) || !hlp_isvalidnpc(oth)) { return false; };
	if (!c_npcisdown(oth) || (oth.attribute[atr_hitpoints] <= 0)) { return false; };
	if (!c_npcishuman(oth) || StExt_IsHeroPatryNpc(oth) || StExt_IsNpcImmortal(oth)) { return false; };
	if (StExt_IsSummonOrHero(slf) || StExt_IsHeroPatryNpc(slf)) { return true; };
	return false;
};

func int StExt_NpcsIsDebuffTargets(var c_npc slf, var c_npc oth)
{
	if (StExt_NpcsIsEnemies(slf, oth)) { return true; };
	return StExt_CanApplyDebuffToUnconsciousNpc(slf, oth);
};

func int StExt_NpcsIsEnemies_Engine() { return StExt_GetNpcRelation(StExt_Self, StExt_Other) == StExt_NpcRelation_Enemy; };
func int StExt_NpcsIsAllies_Engine() { return StExt_GetNpcRelation(StExt_Self, StExt_Other) == StExt_NpcRelation_Ally; };
func int StExt_NpcsIsNeutras_Engine() { return StExt_GetNpcRelation(StExt_Self, StExt_Other) == StExt_NpcRelation_Neutral; };
func int StExt_NpcsIsDebuffTargets_Engine() { return StExt_NpcsIsDebuffTargets(StExt_Self, StExt_Other); };


func int StExt_IsNpcMage(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (slf.guild == gil_kdw || slf.guild == gil_kdf || slf.guild == gil_kdm || slf.guild == gil_dmt || slf.guild == gil_gur) { return true; };
	return false;
};

func int StExt_IsNpcNovise(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (slf.guild == gil_nov || slf.guild == gil_sek || slf.guild == gil_tpl || slf.guild == gil_ndw || slf.guild == gil_ndm || slf.guild == gil_pal) { return true; };
	return false;
};

func int c_npcisevil(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) { return false; };
    if ((hlp_getinstanceid(slf) == hlp_getinstanceid(stext_andriel)) || (hlp_getinstanceid(slf) == hlp_getinstanceid(stext_duriel)) || (hlp_getinstanceid(slf) == hlp_getinstanceid(stext_mephisto)) || (hlp_getinstanceid(slf) == hlp_getinstanceid(stext_diablo)) || (hlp_getinstanceid(slf) == hlp_getinstanceid(stext_baal))) {
        return true;
    };
    return c_npcisevil_old(slf);
};

func int StExt_GetPercentFromValue(var int val, var int perc)
{
	if ((val != 0) && (perc != 0)) { return (val * perc) / 100; };
	return 0;
};

func int StExt_GetPercentFromValueWithMin(var int val, var int perc, var int min)
{
	var int result;
	result = StExt_GetPercentFromValue(val, perc);
	if (result < min) { result = min; };
	return result;
};

func int StExt_GetPermilleFromValue(var int val, var int perc)
{
	var int result;
	if ((val != 0) && (perc != 0)) 
	{ 	
		result = (val * perc) / 1000;
		if (result <= 0) { return 1; };
		return result;
	};
	return 0;
};

func int StExt_GetPermilleFromValueIfPositive(var int val, var int perc)
{
	var int result;
	if ((val > 0) && (perc != 0)) 
	{ 	
		result = (val * perc) / 1000;
		if (result <= 0) { return 1; };
		return result;
	};
	return 0;
};

func int StExt_ApplyPercentToValue(var int val, var int perc) { return val + StExt_GetPercentFromValue(val, perc); };

func int StExt_ApplyPermilleToValue(var int val, var int perc) { return val + StExt_GetPermilleFromValue(val, perc); };

func int StExt_ChangeValueIfPositive(var int val, var int mod)
{
	if (val < 0) { return val; };
	return val + mod;
};

func int StExt_SetValueIfPositive(var int val, var int mod)
{
	if (val < 0) { return val; };
	return mod;
};

func int StExt_ChangeValueIfPositiveWithMin(var int val, var int mod, var int min)
{
	var int tmpVal;
	if (val < 0) { return val; };
	tmpVal = val + mod;
	if (tmpVal < min) { tmpVal = min; };
	return tmpVal;
};

func int StExt_ChangeValueIfGreaterThan(var int val, var int mod, var int comp)
{
	if (val <= comp) { return val; };
	return val + mod;
};
func int StExt_ChangeValueIfGreaterThanZero(var int val, var int mod) { return StExt_ChangeValueIfGreaterThan(val, mod, 0); };

// Return random multiplier based on input range
func int StExt_ApplyRandomRangeMult(var int val, var int range)
{
	var int mult;
	if ((val == 0) || (range <= 0)) { return val; };
	mult = hlp_random(range);
	if (rx_getchance(50)) { mult = -mult; };
	if (mult == 0) { return val; };
	return val + (val * mult / 100);
};

func int StExt_ApplyRandomRangeMultIfNotNegative(var int val, var int range)
{
	var int mult;
	var int result;
	
	if ((val <= 0) || (range <= 0)) { return val; };
	mult = hlp_random(range);
	if (rx_getchance(50)) { mult = -mult; };
	if (mult == 0) { return val; };
	result = val + (val * mult / 100);
	if (result < 0) { result = 0; };
	return result;
};

func int StExt_IsValidWp(var string wp) { return !StExt_StringIsEmpty(wp); };


func void StExt_ChangeIntValueByName(var string symbolName, var int value)
{
	var int parserId;
	var int symbolId;
	var int val;
	var string text;
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_ChangeIntValueByName(var string symbolName, var int value)", "symbolName string is null or empty!", self, other);
		return;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_ChangeIntValueByName(var string symbolName, var int value)", concatstrings("symbolId is null! SymId: ", inttostring(symbolId)), self, other);
		return;
	};
	val = Par_GetSymbolValueInt(parserId, symbolId);
	val += value;
	Par_SetSymbolValueInt(val, parserId, symbolId);
};

func void StExt_ChangeIntValueByNameWithRange(var string symbolName, var int value, var int min, var int max)
{
	var int parserId;
	var int symbolId;
	var int val;
	var string text;
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_ChangeIntValueByNameWithRange(var string symbolName ...)", "symbolName string is null or empty!", self, other);
		return;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_ChangeIntValueByNameWithRange(var string symbolName ...)", concatstrings("symbolId is null! SymId: ", inttostring(symbolId)), self, other);
		return;
	};
	val = Par_GetSymbolValueInt(parserId, symbolId);
	val = StExt_ValidateValueRange(val + value, min, max);
	Par_SetSymbolValueInt(val, parserId, symbolId);
};

func int StExt_GetIntValueByName(var string symbolName)
{
	var int parserId;
	var int symbolId;
	var int val;
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_GetIntValueByName(var string symbolName)", "symbolName string is null or empty!", self, other);
		return 0;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_GetIntValueByName(var string symbolName)", concatstrings("symbolId is null! SymId: ", inttostring(symbolId)), self, other);
		return 0;
	};
	val = Par_GetSymbolValueInt(parserId, symbolId);
	return val;
};

func string StExt_GetStringValueByName(var string symbolName)
{
	var int parserId;
	var int symbolId;
	var string val;
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_GetStringValueByName(var string symbolName)", "symbolName string is null or empty!", self, other);
		return StExt_EmptyString;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_GetStringValueByName(var string symbolName)", concatstrings("symbolId is null! SymId: ", inttostring(symbolId)), self, other);
		return StExt_EmptyString;
	};
	val = Par_GetSymbolValueString(parserId, symbolId);
	return val;
};


func void StExt_SetIntValueByName(var string symbolName, var int value)
{
	var int parserId;
	var int symbolId;
	var int val;
	var string text;
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_SetIntValueByName(var string symbolName, var int value)", "symbolName string is null or empty!", self, other);
		return;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_SetIntValueByName(var string symbolName, var int value)", concatstrings("symbolId is null! SymId: ", inttostring(symbolId)), self, other);
		return;
	};
	Par_SetSymbolValueInt(value, parserId, symbolId);
};

func int StExt_SymbolExist(var string symbolName)
{
	var int parserId;
	var int symbolId;
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null) { return false; };
	return true;
};

func int StExt_GetRandomArrayElement_Int(var string symbolName)
{
	var int parserId;
	var int symbolId;
	var int elementsCount;
	var int valIndex;
	
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_GetRandomElement_Int(var string symbolName)", "symbolName string is null or empty!", self, other);
		return StExt_Null;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_GetRandomElement_Int(var string symbolName)", concatstrings("symbolId is null! SymName: ", symbolName), self, other);
		return StExt_Null;
	};
	
	elementsCount = Par_GetSymbolLength(parserId, symbolId);
	if (elementsCount <= 0) 
	{ 
		StExt_PrintDebug("StExt_GetRandomElement_Int(var string symbolName)", concatstrings("symbolId is not array! SymName: ", symbolName), self, other);
		return StExt_Null;
	};
	
	if (elementsCount == 1) { valIndex = 0; }
	else { valIndex = hlp_random(elementsCount); };
	
	StExt_ReturnSelectedIndex = valIndex;
	return Par_GetSymbolValueIntArray(parserId, symbolId, valIndex);
};

func string StExt_GetRandomArrayElement_String(var string symbolName)
{
	var int parserId;
	var int symbolId;
	var int elementsCount;
	var int valIndex;
	
	if (StExt_StringIsEmpty(symbolName))
	{
		StExt_PrintDebug("StExt_GetRandomElement_String(var string symbolName)", "symbolName string is null or empty!", self, other);
		return StExt_EmptyString;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, symbolName);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_GetRandomElement_String(var string symbolName)", concatstrings("symbolId is null! SymName: ", symbolName), self, other);
		return StExt_EmptyString;
	};
	
	elementsCount = Par_GetSymbolLength(parserId, symbolId);
	if (elementsCount <= 0) 
	{ 
		StExt_PrintDebug("StExt_GetRandomElement_String(var string symbolName)", concatstrings("symbolId is not array! SymName: ", symbolName), self, other);
		return StExt_EmptyString;
	};
	
	if (elementsCount == 1) { valIndex = 0; }
	else { valIndex = hlp_random(elementsCount); };
	
	StExt_ReturnSelectedIndex = valIndex;
	return Par_GetSymbolValueStringArray(parserId, symbolId, valIndex);
};

func string StExt_GetCorruptionPrefix(var int corruptionId)
{
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPrefix(var int corruptionId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return StExt_EmptyString;
	};
	if (corruptionId == StExt_Corruption_Mage) { return "Mage"; };
	if (corruptionId == StExt_Corruption_Warrior) { return "Warrior"; };
	if (corruptionId == StExt_Corruption_Ranger) { return "Ranger"; };
	
	// just in case...
	StExt_PrintDebugStack(concatstrings("StExt_GetCorruptionPrefix(var int corruptionId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
	return StExt_EmptyString;
};

// apply only to hero's weapon. 
// as you can see - here func checks global variable 
func int StExt_WeaponIsStaff(var c_item weap)
{
	if (hlp_isvaliditem(weap)) {
		return (StExt_ValueHasFlag(weap.flags, item_2hd_axe) && aiv_staff);
	};
	return false;
};

func int StExt_WeaponIsMagicSword(var c_item weap)
{
	if (hlp_isvaliditem(weap)) {
		return getitemvarvalue(weap, bit_item_mag_sword);
	};
	return false;
};

// here same as in StExt_WeaponIsStaff
func int StExt_WeaponIsMagic(var c_item weap)
{
	if (hlp_isvaliditem(weap)) { 
		return ((weap.spell > 0) || getitemvarvalue(weap, bit_item_mag_sword) || (StExt_ValueHasFlag(weap.flags, item_2hd_axe) && aiv_staff));
	};
	return false;
};

func int StExt_GetMaxValue(var int val1, var int val2, var int val3, var int val4)
{
	var int max;
	var int indx;
	max = 0;
	indx = 0;
	
	if (val1 > max) { indx = 1; max = val1; };
	if (val2 > max) { indx = 2; max = val2; };
	if (val3 > max) { indx = 3; max = val3; };
	if (val4 > max) { indx = 4; max = val4; };	
	return indx;
};

func int StExt_IsMasteryPerkLearned(var int masteryId, var int perkId)
{
	var string perkArray;
	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_IsMasteryPerkLearned(var int masteryId, var int perkId) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return false;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_MasteryPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_IsMasteryPerkLearned(var int masteryId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return false;
	};
	perkArray = concatstrings("StExt_Perk_", inttostring(masteryId));
	return StExt_Array_GetInt(perkArray, perkId);
};

func int StExt_IsGenericPerkLearned(var int perkId)
{
	if ((perkId <= StExt_Null) || (perkId >= StExt_Perk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_IsGenericPerkLearned(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return false;
	};
	return StExt_Array_GetInt("StExt_Perk", perkId);
};

func int StExt_IsCorruptionPerkLearned(var int corruptionId, var int perkId)
{
	var int cost;
	var string arrayName;
	if ((corruptionId <= StExt_Corruption_None) || (corruptionId >= StExt_Corruption_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_IsCorruptionPerkLearned(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return false;
	};
	if ((perkId <= StExt_Null) || (perkId >= StExt_CorruptionPerk_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_IsCorruptionPerkLearned(var int corruptionId, var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return false;
	};
	if (StExt_CorruptionPath != corruptionId) { return false; };
	
	arrayName = StExt_GetCorruptionPrefix(corruptionId);
	if (StExt_StringIsEmpty(arrayName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_IsCorruptionPerkLearned(var int corruptionId, var int perkId) -> Corruption index out of range! Index: ", inttostring(corruptionId)));
		return false;
	};	
	arrayName = concatstrings("StExt_Corruption_Perk_", arrayName);	
	return StExt_Array_GetInt(arrayName, perkId);
};

func int StExt_CalcWeaponTotalDamage(var c_item weap)
{
	if (hlp_isvaliditem(weap)) {
		return weap.damage[0] + weap.damage[1] + weap.damage[2] + weap.damage[3] + weap.damage[4] + weap.damage[5] + weap.damage[6] + weap.damage[7];
	};
	StExt_PrintDebug("StExt_CalcWeaponTotalDamage(var c_item weap)", "Weapon instance is null!", self, other);
	return 0;
};

func int StExt_GetSummonType(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetSummonType(var c_npc slf)", "slf instance is null!", slf, other);
		return StExt_SummonType_Other; 
	};
	if (hlp_getinstanceid(slf) == hlp_getinstanceid(summoned_wolf_shaman) || hlp_getinstanceid(slf) == hlp_getinstanceid(stext_summoned_shadowbeast_fire)) { return StExt_SummonType_Totem; }
	else if (hlp_getinstanceid(slf) == hlp_getinstanceid(stext_hollywisp)) {return StExt_SummonType_Holly; }
	else if (StExt_IsSummonAnimal(slf) || rx_isnpc(slf, dsnapper) || rx_isnpc(slf, summoned_swampdrone) || rx_isnpc(slf, summoned_dragon) || rx_isnpc(slf, pet_jina)) { return StExt_SummonType_Beast; }
	else if (StExt_IsSummonGolem(slf)) { return StExt_SummonType_Golem; }
	else if (StExt_IsSummonDemon(slf)) { return StExt_SummonType_Demon; }
	else if (StExt_IsSummonUndead(slf)) { return StExt_SummonType_Undead; }
	else if (StExt_IsSummonOrTotem(slf) && rx_istotemnpc(slf)) { return StExt_SummonType_Totem; };	
	return StExt_SummonType_Other;
};

func int StExt_GetSummonGolemType(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_GetSummonType(var c_npc slf)", "slf instance is null!", slf, other);
		return StExt_SummonGolemType_None; 
	};
	if (!StExt_IsSummonGolem(slf)) { return StExt_SummonGolemType_None; }
	
	if (rx_isnpc(slf, summoned_golem)) { return StExt_SummonGolemType_Stone; }	
	else if (rx_isnpc(slf, summoned_firegolem)) { return StExt_SummonGolemType_Fire; }
	else if (rx_isnpc(slf, summoned_icegolem)) { return StExt_SummonGolemType_Ice; }
	else if (rx_isnpc(slf, summoned_swampgolem)) { return StExt_SummonGolemType_Swamp; }
	else if (rx_isnpc(slf, summoned_darkgolem)) { return StExt_SummonGolemType_Magic; }
	else if (rx_isnpc(slf, treant)) { return StExt_SummonGolemType_Wood; }
	else if (rx_isnpc(slf, summoned_airgolem)) { return StExt_SummonGolemType_Air; }
	else if (rx_isnpc(slf, stext_summoned_bonegolem)) { return StExt_SummonGolemType_Bone; }
	else if (rx_isnpc(slf, stext_summoned_electricgolem)) { return StExt_SummonGolemType_Electric; };	
	return StExt_SummonGolemType_None;
};

func int StExt_GamePaused()
{
	if (rx_gamepaused || rx_gamevoting || StExt_IsLevelChanging || StExt_IsLoading || endgamecredits || optioncheck || cammodeon || bheroisincutscene || (magespeechstart && (!magespeechendstop))) { return true; };
	return false;
};

func int StExt_GamePaused_TimedEffect()
{
	if (rx_gamepaused || rx_gamevoting || endgamecredits || optioncheck || cammodeon || bheroisincutscene || (magespeechstart && (!magespeechendstop))) { return true; };
	return false;
};

func int StExt_StatIdValid(var int statId) { return ((statId > StExt_Null) && (statId < StExt_PcStats_Index_Max)); };

func void StExt_ChangeSpecialSummonCount(var int summonId, var int val)
{
	var int count;
	if ((summonId < 0) || (summonId >= StExt_SpecialSummonType_Max))
	{
		StExt_PrintDebugStack("StExt_ChangeSpecialSummonCount(...) -> SummonId out of range!");
		return;
	};
	count = StExt_Array_GetInt("Stext_SpecialSummons", summonId);
	count = StExt_ValidateValueRange(count + val, 0, 10);
	StExt_Array_SetInt("Stext_SpecialSummons", summonId, count);
};

func string StExt_BuildMissedResourceString(var int itemId, var int itemsCount)
{
	var string result;	
	result = StExt_GetItemNameById(itemId);
	if (StExt_StringIsEmpty(result)) { result = StExt_UnknownString; };
	
	result = concatstrings(result, " ");
	result = concatstrings(result, inttostring(itemsCount));
	result = concatstrings(result, StExt_Str_Pcs);	
	return result;
};

func int StExt_CheckCraftResources(var int res1, var int res2, var int res3, var int res4, var int res5, var int count1, var int count2, var int count3, var int count4, var int count5)
{
	var int result;
	var string missedResourcesStr;
	
	result = true;
	missedResourcesStr = StExt_EmptyString;
	
	if ((res1 != StExt_Null) && (count1 > 0))
	{
		if (npc_hasitems(hero, res1) < count1) 
		{
			missedResourcesStr = concatstrings(missedResourcesStr, StExt_BuildMissedResourceString(res1, count1));
			missedResourcesStr = concatstrings(missedResourcesStr, " ");
			result = false;
		};
	};
	if ((res2 != StExt_Null) && (count2 > 0))
	{
		if (npc_hasitems(hero, res2) < count2) 
		{
			missedResourcesStr = concatstrings(missedResourcesStr, StExt_BuildMissedResourceString(res2, count2));
			missedResourcesStr = concatstrings(missedResourcesStr, " ");
			result = false;
		};
	};
	if ((res3 != StExt_Null) && (count3 > 0))
	{
		if (npc_hasitems(hero, res3) < count3) 
		{
			missedResourcesStr = concatstrings(missedResourcesStr, StExt_BuildMissedResourceString(res3, count3));
			missedResourcesStr = concatstrings(missedResourcesStr, " ");
			result = false;
		};
	};
	if ((res4 != StExt_Null) && (count4 > 0))
	{
		if (npc_hasitems(hero, res4) < count4) 
		{
			missedResourcesStr = concatstrings(missedResourcesStr, StExt_BuildMissedResourceString(res4, count4));
			missedResourcesStr = concatstrings(missedResourcesStr, " ");
			result = false;
		};
	};
	if ((res5 != StExt_Null) && (count5 > 0))
	{
		if (npc_hasitems(hero, res5) < count5) 
		{
			missedResourcesStr = concatstrings(missedResourcesStr, StExt_BuildMissedResourceString(res5, count5));
			missedResourcesStr = concatstrings(missedResourcesStr, " ");
			result = false;
		};
	};
	
	if (!result)
	{
		missedResourcesStr = concatstrings(StExt_Str_Required, missedResourcesStr);
		ai_printred(missedResourcesStr);
	};
	return result;
};

func int StExt_CheckCraftResourcesEx(var string res1, var string res2, var string res3, var string res4, var string res5,	var int count1, var int count2, var int count3, var int count4, var int count5)
{
	var int itm1;
	var int itm2;
	var int itm3;
	var int itm4;
	var int itm5;
	
	itm1 = StExt_GetInstanceIdByName(res1);
	itm2 = StExt_GetInstanceIdByName(res2);
	itm3 = StExt_GetInstanceIdByName(res3);
	itm4 = StExt_GetInstanceIdByName(res4);
	itm5 = StExt_GetInstanceIdByName(res5);
	
	return StExt_CheckCraftResources(itm1, itm2, itm3, itm4, itm5, count1, count2, count3, count4, count5);
};

func void StExt_UseCraftResources(var int res1, var int res2, var int res3, var int res4, var int res5, var int count1, var int count2, var int count3, var int count4, var int count5)
{
	if ((res1 != StExt_Null) && (count1 > 0)) { npc_removeinvitems(hero, res1, count1); };
	if ((res2 != StExt_Null) && (count2 > 0)) { npc_removeinvitems(hero, res2, count2); };
	if ((res3 != StExt_Null) && (count3 > 0)) { npc_removeinvitems(hero, res3, count3); };
	if ((res4 != StExt_Null) && (count4 > 0)) { npc_removeinvitems(hero, res4, count4); };
	if ((res5 != StExt_Null) && (count5 > 0)) { npc_removeinvitems(hero, res5, count5); };
};

func void StExt_UseCraftResourcesEx(var string res1, var string res2, var string res3, var string res4, var string res5, var int count1, var int count2, var int count3, var int count4, var int count5)
{
	var int itm1;
	var int itm2;
	var int itm3;
	var int itm4;
	var int itm5;
	
	itm1 = StExt_GetInstanceIdByName(res1);
	itm2 = StExt_GetInstanceIdByName(res2);
	itm3 = StExt_GetInstanceIdByName(res3);
	itm4 = StExt_GetInstanceIdByName(res4);
	itm5 = StExt_GetInstanceIdByName(res5);
	
	StExt_UseCraftResources(itm1, itm2, itm3, itm4, itm5, count1, count2, count3, count4, count5);
};

func void StExt_DevilLaughter_Callback() { snd_play("DEMON_LAUGHTER"); };



func int StExt_CallFuncXTimes(var string funcName, var int count)
{
	if (count <= 0) { return false; };
	if (!StExt_TryCallFunc(funcName)) { return false; };
	return StExt_CallFuncXTimes(funcName, count - 1) + 1;
};

// Prevent set int above max value (negative value)
func int StExt_CheckIntOverflow(var int oldVal, var int newVal)
{
	if ((newVal >= StExt_Int_Max_Safe) || ((newVal < 0) && (oldVal > 0))) { return StExt_Int_Max_Safe; };
	return newVal;
};

func int StExt_GetTrueDamageType(var int damageType)
{
	var int result;
	result = dam_invalid;	
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_True)) { result = result | dam_barrier; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Air)) { result = result | dam_fly; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Earth)) { result = result | dam_blunt | dam_fly; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Fire)) { result = result | dam_fire; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Light)) { result = result | dam_fire | dam_magic; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Ice) || StExt_ValueHasFlag(damageType, StExt_DamageType_Electric) || StExt_ValueHasFlag(damageType, StExt_DamageType_Dark)) { result = result | dam_magic; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Death) || StExt_ValueHasFlag(damageType, StExt_DamageType_Necro)) { result = result | dam_magic | dam_fall; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Melee)) { result = result | dam_blunt | dam_edge; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Range)) { result = result | dam_point; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Poision) || StExt_ValueHasFlag(damageType, StExt_DamageType_Life)) { result = result | dam_fall; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Blood)) { result = result | dam_magic | dam_point; };
	
	if(result == dam_invalid)
	{
		if (StExt_ValueHasFlag(damageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(damageType, StExt_DamageType_Ability)) { result = result | dam_magic; };		
		if (StExt_ValueHasFlag(damageType, StExt_DamageType_Golem) || StExt_ValueHasFlag(damageType, StExt_DamageType_Fist)) { result = result | dam_blunt; };
		if (StExt_ValueHasFlag(damageType, StExt_DamageType_Demon) || StExt_ValueHasFlag(damageType, StExt_DamageType_Trap)) { result = result | dam_edge; };
	};
	return result;
};


func int StExt_GetDamageTypesCount(var int damageType)
{
	var int result; result = 0;
	if (StExt_ValueHasFlag(damageType, dam_barrier)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_blunt)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_edge)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_fire)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_fly)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_magic)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_point)) { result += 1; };
	if (StExt_ValueHasFlag(damageType, dam_fall)) { result += 1; };
	return result;
};


func void StExt_InitializeScriptDamageDesc(var C_ExtraDamageInfo desc)
{
    desc.Damage = 0;
    desc.Damage[1] = 0;
    desc.Damage[2] = 0;
    desc.Damage[3] = 0;
    desc.Damage[4] = 0;
    desc.Damage[5] = 0;
    desc.Damage[6] = 0;
    desc.Damage[7] = 0;

    desc.DotDamage = 0;
    desc.DotDamage[1] = 0;
    desc.DotDamage[2] = 0;
    desc.DotDamage[3] = 0;
    desc.DotDamage[4] = 0;
    desc.DotDamage[5] = 0;
    desc.DotDamage[6] = 0;
    desc.DotDamage[7] = 0;

    desc.Ticks = 0;
    desc.Ticks[1] = 0;
    desc.Ticks[2] = 0;
    desc.Ticks[3] = 0;
    desc.Ticks[4] = 0;
    desc.Ticks[5] = 0;
    desc.Ticks[6] = 0;
    desc.Ticks[7] = 0;

    desc.TotalDamage    = 0;
    desc.TotalDotDamage = 0;
    desc.DamageType     = 0;
    desc.DamageFlags    = 0;
    desc.MaxTargets     = 0;
    desc.Radius         = 0;
    desc.IsProcessed    = false;
};

// Return spell visual effect from index
func string StExt_GetSpellFx(var int spellId)
{	
	var string result;
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_GetSpellFx()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return StExt_EmptyString;
	};
	
	result = StExt_Array_GetString("spellfxinstancenames", spellId);
	result = concatstrings("spellfx_", result);
	return result;
};

// Return spell damage flags
func int StExt_GetSpellDamageFlags(var int spellId)
{
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_GetSpellDamageFlags()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return StExt_Null;
	};
	return StExt_Array_GetInt("StExt_SpellDamageFlags", spellId);	
};

// Return spell effect flags
func int StExt_GetSpellEffectFlags(var int spellId)
{
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_GetSpellEffectFlags()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return StExt_Null;
	};
	return StExt_Array_GetInt("StExt_SpellEffectFlags", spellId);	
};

// Check if spell has dot component
func int StExt_SpellIsDot(var int spellId)
{	
	var int spellFlags;
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_SpellIsDot()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return false;
	};
	spellFlags = StExt_GetSpellEffectFlags(spellId);
	return StExt_ValueHasFlag(spellFlags, StExt_DamageFlag_Dot);
};

// Check if spell has aoe component
func int StExt_SpellIsAoe(var int spellId)
{	
	var int spellFlags;
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_SpellIsAoe()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return false;
	};
	spellFlags = StExt_GetSpellEffectFlags(spellId);
	return StExt_ValueHasFlag(spellFlags, StExt_DamageFlag_Aoe);
};

// Check if spell has stream component
func int StExt_SpellIsStream(var int spellId)
{	
	var int spellFlags;
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_SpellIsAoe()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return false;
	};
	spellFlags = StExt_GetSpellEffectFlags(spellId);
	return StExt_ValueHasFlag(spellFlags, StExt_DamageFlag_Stream);
};

// Check if hero have active transormation
func int StExt_TransformSpellIsActive()
{
	var int activespell;
	activespell = Npc_GetActiveSpell(hero);
	if((activespell == spl_trfsheep) || (activespell == spl_trfscavenger) || (activespell == spl_trfmeatbug) || (activespell == spl_trfgiantbug) || (activespell == spl_trfwolf) || (activespell == spl_trfwaran) || (activespell == spl_trfsnapper) || (activespell == spl_trfwarg) || (activespell == spl_trffirewaran) || (activespell == spl_trflurker) || (activespell == spl_trfshadowbeast) || (activespell == spl_trfdruid) || (activespell == spl_trfdragonsnapper))
	{
		return true;
	};
	return false;
};

func int StExt_HeroIsTransformed() { return herotransscroll || herotransrune; };

func int StExt_NpcIsLivingBeing(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (c_npcisundead(slf)) { return false; };
	if ((slf.guild == gil_stonegolem) || (slf.guild == gil_firegolem) || (slf.guild == gil_icegolem) || (slf.guild == gil_summoned_golem) || (slf.guild == gil_stoneguardian)) { return false; };
	if (rx_isnpc(slf, wisp_detector) || rx_isnpc(slf, wisp_detector_ast)) { return false; };
	if ((slf.aivar[43] == id_wisp) || (slf.aivar[43] == id_training_aim) || (slf.aivar[43] == id_totem)) { return false; };
	return true;
};

func int StExt_SelectItemClassFromList(var string listName)
{
	var int result; result = StExt_Null;
	var int listSize;
	var int selectedIndex;
	
	if (StExt_StringIsEmpty(listName) || !StExt_SymbolExist(listName))
	{
		StExt_PrintDebugStack("StExt_SelectItemClassFromList(var string listName) -> List name is empty or incorrect!");
		return result;
	};
	
	listSize = StExt_Array_GetSize(listName);
	if (listSize <= 0)
	{
		StExt_PrintDebugStack("StExt_SelectItemClassFromList(var string listName) -> List is empty!");
		return result;
	};
	
	selectedIndex = StExt_RandIndex(listSize);
	result = StExt_Array_GetInt(listName, selectedIndex);
	return result;
};
