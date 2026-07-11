func void b_refreshatinsert() 
{
	if (!hlp_isvalidnpc(self))
	{
		StExt_PrintDebug("b_refreshatinsert(var c_npc slf)", "Npc is invalid!", self, StExt_NullNpc);
		return;
	};
	
	StExt_CheckUid(self);	
	b_refreshatinsert_old();
	if (self.attribute > 0)
	{
		if (hlp_getinstanceid(self) == hlp_getinstanceid(stext_andriel)) 
		{
			activatezsslot(self, "BIP01 HEAD");
			ext_removefromslot(self, "BIP01 HEAD");
			ext_putinslot(self, "BIP01 HEAD", itar_helm_avabul);
			npc_removeinvitems(self, itar_helm_avabul, npc_hasitems(self, itar_helm_avabul));
			activatezsslot(self, "BIP01 SPINE2");
			ext_removefromslot(self, "BIP01 SPINE2");
			ext_putinslot(self, "BIP01 SPINE2", itar_avabul_wings);
			npc_removeinvitems(self, itar_avabul_wings, npc_hasitems(self, itar_avabul_wings));
		};
	};
};

func void StExt_Npc_ChangeCooldown(var c_npc slf, var int timerId, var int val)
{
	var int now;
	if ((timerId < 0) || (timerId >= 256))
	{
		StExt_PrintDebug("StExt_Npc_ChangeCooldown(var c_npc slf)", concatstrings("Incorrect aiv: ", inttostring(timerId)), slf, StExt_NullNpc);
		return;
	};
	
	now = StExt_GetNpcVar(slf, timerId);
	if (now > StExt_CounterLimit) { now = StExt_Null; };
	now += val;
	if (now < 0) { now = StExt_Null; };	
	StExt_SetNpcVar(slf, timerId, now);
};

func void StExt_Npc_ChangeAiv(var c_npc slf, var int aivId, var int val)
{
	var int now;
	if ((aivId < 0) || (aivId >= 400))
	{
		StExt_PrintDebug("StExt_Npc_ChangeAiv(var c_npc slf)", concatstrings("Incorrect aiv: ", inttostring(aivId)), slf, StExt_NullNpc);
		return;
	};
	
	now = rx_getnpcvar(slf, aivId);
	if ((aivId == aivrx_npc_speed) && (now <= 0))
	{
		if (StExt_IsSummonOrHero(slf)) { now = 100; }
		else { now = StExt_GetRandomRange(95, 105); };
		//StExt_PrintDebug("StExt_Npc_ChangeAiv(var c_npc slf)", concatstrings("speed now: ", inttostring(now)), slf, StExt_NullNpc);
	};
	
	now += val;	
	if (now < 0) { now = 0; };
	if (aivId == aivrx_npc_speed) { now = StExt_ValidateValueRange(now, 50, StExt_ActionsSpeed_HardCap); };	
	rx_setnpcvar(slf, aivId, now);
};

func void StExt_Npc_ChangeAivEx(var c_npc slf, var int aivId, var int val)
{
	var int now;
	if ((aivId < 0) || (aivId >= 256))
	{
		StExt_PrintDebug("StExt_Npc_ChangeAivEx(var c_npc slf)", concatstrings("Incorrect aiv: ", inttostring(aivId)), slf, StExt_NullNpc);
		return;
	};
	
	now = StExt_GetNpcVar(slf, aivId);
	now += val;	
	if (now < 0) { now = 0; };
	StExt_SetNpcVar(slf, aivId, now);
};

func void StExt_Npc_CalcSpeedBonusFromAgi(var c_npc slf)
{
	var int bonus;
	bonus = StExt_GetPercentFromValue(slf.attribute[atr_dexterity], 1);
	StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, bonus);
};

// Call from engine to get current Es for focused npc
func int StExt_Npc_GetBarCurEs() 
{
	if ((StExt_FocusNpc == StExt_Null) || (!hlp_isvalidnpc(StExt_FocusNpc))) { return StExt_Null; };
	return StExt_GetNpcVar(StExt_FocusNpc, StExt_AiVar_EsCur); 
};
// Call from engine to get current Max Es for focused npc
func int StExt_Npc_GetBarMaxEs() 
{
	if ((StExt_FocusNpc == StExt_Null) || (!hlp_isvalidnpc(StExt_FocusNpc))) { return StExt_Null; };
	return StExt_GetNpcVar(StExt_FocusNpc, StExt_AiVar_EsMax); 
};

func int StExt_Npc_GetCurEs(var c_npc slf) { return StExt_GetNpcVar(slf, StExt_AiVar_EsCur); };
func int StExt_Npc_GetMaxEs(var c_npc slf) { return StExt_GetNpcVar(slf, StExt_AiVar_EsMax); };

func void StExt_Npc_ChangeEs(var c_npc slf, var int val) 
{
	var int max;	
	max = StExt_GetNpcVar(slf, StExt_AiVar_EsMax);
	val = StExt_GetNpcVar(slf, StExt_AiVar_EsCur) + val;
	val = StExt_ValidateValueRange(val, 0, max);
	StExt_SetNpcVar(slf, StExt_AiVar_EsCur, val);
};

func void StExt_Npc_RestoreEsPerc(var c_npc slf, var int val) 
{
	var int max;
	max = StExt_GetNpcVar(slf, StExt_AiVar_EsMax);
	if (max <= 0) { return; };
	StExt_Npc_ChangeEs(slf, StExt_GetPercentFromValue(max, val));
};

func void StExt_Npc_RegenerateEs(var c_npc slf)
{
	var int regenRate;
	regenRate = StExt_GetNpcVar(slf, StExt_AiVar_EsReg);
	regenRate = StExt_ValidateValueRange(regenRate, 0, 50);
	if (regenRate > 0) { StExt_Npc_ChangeEs(slf, regenRate); };
};

func void StExt_Npc_SetEs(var c_npc slf, var int val) 
{
	var int max;
	max = StExt_GetNpcVar(slf, StExt_AiVar_EsMax);
	val = StExt_ValidateValueRange(val, 0, max);
	StExt_SetNpcVar(slf, StExt_AiVar_EsCur, val);
};

func void StExt_Npc_ChangeMaxEs(var c_npc slf, var int val)
{
	var int max;
	var int cur;

	max = StExt_GetNpcVar(slf, StExt_AiVar_EsMax) + val;
	if (max < 0) { max = 0; };
	StExt_SetNpcVar(slf, StExt_AiVar_EsMax, max);
	
	cur = StExt_GetNpcVar(slf, StExt_AiVar_EsCur);
	if ((val < 0) && npc_isplayer(slf) && (cur > StExt_PcEsBuffer)) { StExt_PcEsBuffer = cur; };
	if (cur > max)
	{
		cur = StExt_ValidateValueRange(val, 0, max);
		StExt_SetNpcVar(slf, StExt_AiVar_EsCur, cur);
	};
};

func void StExt_Npc_SetMaxEs(var c_npc slf, var int val) 
{
	var int cur;
	if (val < 0) { val = 0; };
	StExt_SetNpcVar(slf, StExt_AiVar_EsMax, val);
	
	cur = StExt_GetNpcVar(slf, StExt_AiVar_EsCur);
	if (cur > val)
	{
		cur = StExt_ValidateValueRange(cur, 0, val);
		StExt_SetNpcVar(slf, StExt_AiVar_EsCur, cur);
	};
};

func int StExt_Npc_ChangeDodgeChance(var c_npc slf, var int val)
{
	var int max;
	var int overcap;
	overcap = 0;
	max = StExt_Dodge_HardCap;
	if (npc_isplayer(slf)) { max = StExt_PcStats[StExt_PcStats_Index_MaxDodgeChance]; };
	val = StExt_GetNpcVar(slf, StExt_AiVar_DodgeChance) + val;
	if (val > max) { overcap = max - val; };
	val = StExt_ValidateValueRange(val, 0, max);
	StExt_SetNpcVar(slf, StExt_AiVar_DodgeChance, val);
	return overcap;
};

func void StExt_Npc_CalcDodgeChanceBonusFromAgi(var c_npc slf)
{
	var int bonus;
	bonus = StExt_GetPercentFromValue(slf.attribute[atr_dexterity], 5);
	StExt_Npc_ChangeDodgeChance(slf, bonus);
};

func int StExt_Npc_ChangeResist(var c_npc slf, var int val, var int resistId, var int maxIndex)
{
	var int max;
	var int overcap;
	overcap = 0;
	max = StExt_Resists_HardCap;
	if (npc_isplayer(slf)) { max = StExt_Array_GetInt(StExt_PcStatsArrayName, maxIndex); };
	
	val = StExt_GetNpcVar(slf, resistId) + val;
	if (val > max) { overcap = max - val; };
	val = StExt_ValidateValueRange(val, 0, max);
	StExt_SetNpcVar(slf, resistId, val);
	return overcap;
};

func int StExt_Npc_ChangeEdgeResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistEdge, StExt_PcStats_Index_MaxResistEdge); };
func int StExt_Npc_ChangeBluntResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistBlunt, StExt_PcStats_Index_MaxResistBlunt); };
func int StExt_Npc_ChangePointResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistPoint, StExt_PcStats_Index_MaxResistPoint); };
func int StExt_Npc_ChangeMagicResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistMagic, StExt_PcStats_Index_MaxResistMagic); };
func int StExt_Npc_ChangeFireResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistFire, StExt_PcStats_Index_MaxResistFire); };
func int StExt_Npc_ChangeFlyResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistFly, StExt_PcStats_Index_MaxResistFly); };
func int StExt_Npc_ChangePoisionResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistPois, StExt_PcStats_Index_MaxResistPoison); };
func int StExt_Npc_ChangeAoeResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistAoe, StExt_PcStats_Index_MaxAoeResist); };
func int StExt_Npc_ChangeDotResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistAoe, StExt_PcStats_Index_MaxAoeResist); };
func int StExt_Npc_ChangeReflectResist(var c_npc slf, var int val) { return StExt_Npc_ChangeResist(slf, val, StExt_AiVar_ResistAoe, StExt_PcStats_Index_MaxAoeResist); };

func void StExt_Npc_ChangeBluntDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_BluntDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_BluntDamage, val);
};
func void StExt_Npc_ChangeEdgeDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_EdgeDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_EdgeDamage, val);
};
func void StExt_Npc_ChangeFireDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_FireDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_FireDamage, val);
};
func void StExt_Npc_ChangeFlyDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_FlyDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_FlyDamage, val);
};
func void StExt_Npc_ChangeMagicDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_MagicDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_MagicDamage, val);
};
func void StExt_Npc_ChangePointDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_PointDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_PointDamage, val);
};
func void StExt_Npc_ChangePoisonDamage(var c_npc slf, var int val)
{
	val = StExt_GetNpcVar(slf, StExt_AiVar_PoisionDamage) + val;
	val = StExt_ValidateValueRange(val, 0, StExt_Npc_ExtraDamage_HardCap);
	StExt_SetNpcVar(slf, StExt_AiVar_PoisionDamage, val);
};

func int StExt_Npc_HasCurse(var c_npc slf, var int curseId)
{
	var int appliedCurseFlags; appliedCurseFlags = StExt_GetNpcVar(slf, StExt_AiVar_AppliedCurseFlags);
	return StExt_ValueHasFlag(appliedCurseFlags, curseId);
};

func void StExt_Npc_Restorehealth(var c_npc slf, var int count) 
{
    if (slf.attribute <= 0) { return; };
    npc_changeattribute(slf, atr_hitpoints, count);
    if (slf.attribute > slf.attribute[1]) { slf.attribute = slf.attribute[1]; };
    if (slf.attribute < 0) { slf.attribute = 0; };
    if (npc_isplayer(slf) && (slf.attribute <= 0)) { heroisdead = true; };
};

func void StExt_Npc_CheckStats(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_CheckStats(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (slf.attribute[atr_hitpoints_max] <= 10) { slf.attribute[atr_hitpoints_max] = 10; };
	if (slf.attribute[atr_strength] <= 5) { slf.attribute[atr_strength] = 5; };
	if (slf.attribute[atr_dexterity] <= 5) { slf.attribute[atr_dexterity] = 5; };
};

func void StExt_Npc_ApplyGlobalConfigs_SummonNpc(var c_npc slf)
{
	var int maxEs;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_ApplyGlobalConfigs_SummonNpc(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	slf.attribute[atr_hitpoints_max] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_hitpoints_max], StExt_Config_NpcSum_GlobalHpMult, 10);
    slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];	
	slf.attribute[atr_strength] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_strength], StExt_Config_NpcSum_GlobalStatMult, 5);
	slf.attribute[atr_dexterity] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_dexterity], StExt_Config_NpcSum_GlobalStatMult, 5);
	
	maxEs = StExt_Npc_GetMaxEs(slf);
	if (maxEs > 0)
	{
		maxEs = StExt_GetPercentFromValue(maxEs, StExt_Config_NpcSum_GlobalEsMult);
		StExt_Npc_SetMaxEs(slf, maxEs);
	};	

	slf.protection[prot_blunt] = StExt_SetValueIfPositive(slf.protection[prot_blunt], StExt_GetPercentFromValue(slf.protection[prot_blunt], StExt_Config_NpcSum_GlobalProtMult));
	slf.protection[prot_edge] = StExt_SetValueIfPositive(slf.protection[prot_edge], StExt_GetPercentFromValue(slf.protection[prot_edge], StExt_Config_NpcSum_GlobalProtMult));
	slf.protection[prot_fire] = StExt_SetValueIfPositive(slf.protection[prot_fire], StExt_GetPercentFromValue(slf.protection[prot_fire], StExt_Config_NpcSum_GlobalProtMult));
	slf.protection[prot_fly] = StExt_SetValueIfPositive(slf.protection[prot_fly], StExt_GetPercentFromValue(slf.protection[prot_fly], StExt_Config_NpcSum_GlobalProtMult));
	slf.protection[prot_magic] = StExt_SetValueIfPositive(slf.protection[prot_magic], StExt_GetPercentFromValue(slf.protection[prot_magic], StExt_Config_NpcSum_GlobalProtMult));
	slf.protection[prot_point] = StExt_SetValueIfPositive(slf.protection[prot_point], StExt_GetPercentFromValue(slf.protection[prot_point], StExt_Config_NpcSum_GlobalProtMult));
	
	slf.damage[dam_index_blunt] = StExt_GetPercentFromValue(slf.damage[dam_index_blunt], StExt_Config_NpcSum_GlobalDamMult);
	slf.damage[dam_index_edge] = StExt_GetPercentFromValue(slf.damage[dam_index_edge], StExt_Config_NpcSum_GlobalDamMult);
	slf.damage[dam_index_point] = StExt_GetPercentFromValue(slf.damage[dam_index_point], StExt_Config_NpcSum_GlobalDamMult);
	slf.damage[dam_index_fire] = StExt_GetPercentFromValue(slf.damage[dam_index_fire], StExt_Config_NpcSum_GlobalDamMult);
	slf.damage[dam_index_fly] = StExt_GetPercentFromValue(slf.damage[dam_index_fly], StExt_Config_NpcSum_GlobalDamMult);
	slf.damage[dam_index_magic] = StExt_GetPercentFromValue(slf.damage[dam_index_magic], StExt_Config_NpcSum_GlobalDamMult);
	StExt_Npc_CheckStats(slf);
};

func void StExt_Npc_ApplyGlobalConfigs(var c_npc slf)
{
	var int maxEs;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_ApplyGlobalConfigs(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	StExt_Npc_CheckStats(slf);
	if (StExt_Npc_IsSummoned(slf)) 
	{ 
		StExt_Npc_ApplyGlobalConfigs_SummonNpc(slf);
		return; 
	};
	
	slf.attribute[atr_hitpoints_max] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_hitpoints_max], StExt_Config_Npc_GlobalHpMult, 10);
    slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];	
	slf.attribute[atr_strength] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_strength], StExt_Config_Npc_GlobalStatMult, 5);
	slf.attribute[atr_dexterity] = StExt_GetPercentFromValueWithMin(slf.attribute[atr_dexterity], StExt_Config_Npc_GlobalStatMult, 5);
	
	maxEs = StExt_Npc_GetMaxEs(slf);
	if (maxEs > 0)
	{
		maxEs = StExt_GetPercentFromValue(maxEs, StExt_Config_Npc_GlobalEsMult);
		StExt_Npc_SetMaxEs(slf, maxEs);
	};	

	slf.protection[prot_blunt] = StExt_SetValueIfPositive(slf.protection[prot_blunt], StExt_GetPercentFromValue(slf.protection[prot_blunt], StExt_Config_Npc_GlobalProtMult));
	slf.protection[prot_edge] = StExt_SetValueIfPositive(slf.protection[prot_edge], StExt_GetPercentFromValue(slf.protection[prot_edge], StExt_Config_Npc_GlobalProtMult));
	slf.protection[prot_fire] = StExt_SetValueIfPositive(slf.protection[prot_fire], StExt_GetPercentFromValue(slf.protection[prot_fire], StExt_Config_Npc_GlobalProtMult));
	slf.protection[prot_fly] = StExt_SetValueIfPositive(slf.protection[prot_fly], StExt_GetPercentFromValue(slf.protection[prot_fly], StExt_Config_Npc_GlobalProtMult));
	slf.protection[prot_magic] = StExt_SetValueIfPositive(slf.protection[prot_magic], StExt_GetPercentFromValue(slf.protection[prot_magic], StExt_Config_Npc_GlobalProtMult));
	slf.protection[prot_point] = StExt_SetValueIfPositive(slf.protection[prot_point], StExt_GetPercentFromValue(slf.protection[prot_point], StExt_Config_Npc_GlobalProtMult));
	
	slf.damage[dam_index_blunt] = StExt_GetPercentFromValue(slf.damage[dam_index_blunt], StExt_Config_Npc_GlobalDamMult);
	slf.damage[dam_index_edge] = StExt_GetPercentFromValue(slf.damage[dam_index_edge], StExt_Config_Npc_GlobalDamMult);
	slf.damage[dam_index_point] = StExt_GetPercentFromValue(slf.damage[dam_index_point], StExt_Config_Npc_GlobalDamMult);
	slf.damage[dam_index_fire] = StExt_GetPercentFromValue(slf.damage[dam_index_fire], StExt_Config_Npc_GlobalDamMult);
	slf.damage[dam_index_fly] = StExt_GetPercentFromValue(slf.damage[dam_index_fly], StExt_Config_Npc_GlobalDamMult);
	slf.damage[dam_index_magic] = StExt_GetPercentFromValue(slf.damage[dam_index_magic], StExt_Config_Npc_GlobalDamMult);
	StExt_Npc_CheckStats(slf);
};

func int StExt_Npc_IsRandomized(var c_npc slf) { return StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized); };

func int StExt_Npc_IsValidForBasicOperations(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (StExt_IsSummonOrHero(slf)) { return false; };
	if (rx_isnpc(slf, wisp_detector) || rx_isnpc(slf, wisp_detector_ast)) { return false; };
	if ((slf.aivar[43] == id_wisp) || (slf.aivar[43] == id_training_aim) || (slf.aivar[43] == id_totem)) { return false; };
	return true;
};

func int StExt_Npc_IsValidForStatRandomization(var c_npc slf)
{
	if (!StExt_Npc_IsValidForBasicOperations(slf)) { return false; };
	if ((slf.guild == gil_sheep) || (slf.guild == gil_meatbug) || (slf.aivar[43] == id_baran) || (slf.aivar[43] == id_ziege)) { return false; };
	return true;
};

func int StExt_Npc_IsValidForDuplication(var c_npc slf)
{
	if (!StExt_Npc_IsValidForBasicOperations(slf)) { return false; };
	if (StExt_IsNpcImmortal(slf)) { return false; };
	if ((rx_getnpcvar(slf, aivrx_npc_lp) > 0) && !rx_isboss(slf)) { return false; };
	if (StExt_Npc_IsDuplicated(slf)) { return false; };
	if (StExt_Npc_IsSummoned(slf) && !StExt_Config_NpcSum_CanBeDuplicated) { return false; };

	if (rx_isnpc(slf, mil_301_soldier_spear) || rx_isnpc(slf, bdt_1089_bandit_spear) || rx_isnpc(slf, zombie_addon_gomez) || rx_isnpc(slf, none_104_gomez) || rx_isnpc(slf, pet_jina) || rx_isnpc(slf, werewolf) || rx_isnpc(slf, Gobbo_Black_clan) || rx_isnpc(slf, riordian_zombie) || rx_isnpc(slf, alef_soul) || rx_isnpc(slf, skeleton_alef) || rx_isnpc(slf, giant_rat_dimon) || rx_isnpc(slf, xardas_goblin) || rx_isnpc(slf, bdt_1089_bandit_spear) || rx_isnpc(slf, mil_301_soldier_spear) || rx_isnpc(slf, ad_boss6) || rx_isnpc(slf, vlk_4350_priscila) || rx_isnpc(slf, none_1813_ilesil)) { return false; };
	if (rx_isnpc(slf, none_110_urshak) || rx_isnpc(slf, bau_974_bauer) || rx_isnpc(slf, vlk_479_lucy) || rx_isnpc(slf, mil_313_boltan) || rx_isnpc(slf, pal_6104_ritter_mage) || rx_isnpc(slf, pal_6107_ritter_boss) || rx_isnpc(slf, pal_6104_ritter) || rx_isnpc(slf, puma_lisa) || rx_isnpc(slf, stoneguardian_ornament) || rx_isnpc(slf, OrkElite_Addon2_Gonez) || rx_isnpc(slf, firetestmonster_01) || rx_isnpc(slf, firetestmonster_02) || rx_isnpc(slf, firetestmonster_03) || rx_isnpc(slf, firetestmonster_04) || rx_isnpc(slf, firetestmonster_05)) { return false; };
	if (rx_isnpc(slf, orc_teacher_shaman)) { return false; };
	if (rx_isnpc(slf, stext_andriel) || rx_isnpc(slf, stext_duriel) || rx_isnpc(slf, stext_mephisto) || rx_isnpc(slf, stext_diablo) || rx_isnpc(slf, stext_baal)) { return false; };
	return true;
};

func int StExt_Npc_IsValidForMagicInfusion(var c_npc slf)
{
	if (!StExt_Npc_IsValidForBasicOperations(slf)) { return false; };
	if (StExt_Npc_IsSummoned(slf) && !StExt_Config_NpcSum_CanBeInfused) { return false; };
	if ((slf.guild == gil_sheep) || (slf.guild == gil_meatbug) || (slf.aivar[43] == id_baran) || (slf.aivar[43] == id_ziege)) { return false; };
	if (rx_isnpc(slf, stext_andriel) || rx_isnpc(slf, stext_duriel) || rx_isnpc(slf, stext_mephisto) || rx_isnpc(slf, stext_diablo) || rx_isnpc(slf, stext_baal)) { return false; };
	return true;
};

func int StExt_IsNpcValidForRandEquipment(var c_npc slf)
{
	if (!StExt_Npc_IsValidForBasicOperations(slf)) { return false; };
	if (!c_npcishuman(slf)) { return false; };	
	if (rx_isnpc(slf, mil_301_soldier_spear) || rx_isnpc(slf, bdt_1089_bandit_spear) || rx_isnpc(slf, djg_702_rod) || rx_isnpc(slf, djg_703_cipher)) { return false; };
	return true;
};

//---------------------------------------------------------------------------------------
//								NPC ABILITIES SECTION
//---------------------------------------------------------------------------------------

func void StExt_Npc_AwaitAbilityCooldown(var c_npc slf) 
{
	var int awitTime;
	awitTime = 30 + hlp_random(30);
	if (StExt_GetNpcVar(slf, StExt_AiVar_ActiveAbilityCooldown) <= 0) { StExt_SetNpcVar(slf, StExt_AiVar_ActiveAbilityCooldown, awitTime); };
};

func void StExt_Npc_AddAbility(var c_npc slf, var int ability)
{
	var int abilitySlot;
	var int abilityAdded; abilityAdded = false;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_AddAbility(var c_npc slf, var int ability)", "slf instance is null!", slf, other);
		return; 
	};
	if ((ability <= StExt_Null) || (ability >= StExt_Npc_Ability_Index_Max)) { return; };
	if (StExt_Npc_HasAbility(slf, ability)) { return; };

	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData1) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData1, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData2) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData2, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData3) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData3, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData4) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData4, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData5) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData5, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData6) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData6, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData7) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData7, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData8) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData8, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData9) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData9, ability); abilityAdded = true; };
	if (!abilityAdded && (StExt_GetNpcVar(slf, StExt_AiVar_AbilityData10) <= 0)) { StExt_SetNpcVar(slf, StExt_AiVar_AbilityData10, ability); abilityAdded = true; };

	abilitySlot = StExt_Npc_SearchAbility(slf, StExt_NpcAbility_Type_Summon, StExt_NpcAbility_Flag_None);
	if ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities)) { StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Summoner, true); };

	abilitySlot = StExt_Npc_SearchAbility(slf, StExt_NpcAbility_Type_Buff, StExt_NpcAbility_Flag_None);
	if ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities)) { StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Priest, true); };
	
	abilitySlot = StExt_Npc_SearchAbility(slf, StExt_NpcAbility_Type_Debuff, StExt_NpcAbility_Flag_None);
	if ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities)) { StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Curser, true); };
};


//---------------------------------------------------------------------------------------

// Call for any npc anyway.
// Initialize base mod aiv
func void StExt_Npc_Initialize(var c_npc slf)
{
	var int speed;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_Initialize(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	StExt_PrintDebugStack("StExt_Npc_Initialize(var c_npc slf)");
	
	StExt_SetNpcVar(slf, StExt_AiVar_Afix, StExt_Null);
	StExt_SetNpcVar(slf, StExt_AiVar_Prefix, StExt_Null);
	StExt_SetNpcVar(slf, StExt_AiVar_Sufix, StExt_Null);
	
	if(rx_getnpcvar(slf, aivrx_npc_speed) == 0) 
	{ 
		speed = StExt_GetRandomRange(95, 105);
		rx_setnpcvar(slf, aivrx_npc_speed, speed);
	};
	
	// Just in case
	StExt_Npc_ResetAllAbilityCooldowns(slf);
};

// Call for any npc anyway.
// Initialize base mod stats, like es for example. 
func void StExt_Npc_InitializeExtraStats(var c_npc slf)
{
	var int esBonus;
	var int resistBonus;
	var int statBonus;
	var int hpBonus;
	var int protBonus;
	var int speedBonus;
	var int curSpellPower;
	var int spellPower;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_InitializeExtraStats(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (!StExt_Npc_IsValidForStatRandomization(slf)) { return; };
	StExt_PrintDebugStack("StExt_Npc_InitializeExtraStats(var c_npc slf)");
	
	speedBonus = 0;	
	speedBonus += StExt_IfInt(StExt_Config_Diff_EnableKapitel, StExt_Config_Diff_Kapitel_Speed * (kapitel - 1), 0);
	speedBonus += StExt_IfInt(StExt_Config_Diff_EnableLevel, StExt_GetPercentFromValue(hero.level, StExt_Config_Diff_Level_Speed), 0);
	if (speedBonus > 0) { StExt_Npc_ChangeAivEx(slf, aivrx_npc_speed, speedBonus); };
	
	curSpellPower = rx_getnpcvar(slf, aivrx_spelldamagescale);
	if (StExt_IsNpcMage(slf))
	{
		esBonus = StExt_ValidateValueRange(hlp_random(25), 10, 25);
		esBonus = StExt_ApplyPercentToValue(slf.attribute[atr_hitpoints_max], esBonus);
		StExt_Npc_ChangeMaxEs(slf, esBonus);
		StExt_Npc_ChangeEs(slf, esBonus);
		StExt_Npc_ChangeAivEx(slf, StExt_AiVar_EsReg, 3);
		spellPower = slf.level + 1 + (rx_monsterpower - 25);
		if (curSpellPower < spellPower) { rx_setnpcvar(slf, aivrx_spelldamagescale, spellPower); };
	}
	else if (StExt_IsNpcNovise(slf) || c_npcismonstermage(slf))
	{
		esBonus = StExt_ValidateValueRange(hlp_random(10), 5, 10);
		esBonus = StExt_ApplyPercentToValue(slf.attribute[atr_hitpoints_max], esBonus);
		StExt_Npc_ChangeMaxEs(slf, esBonus);
		StExt_Npc_ChangeEs(slf, esBonus);
		StExt_Npc_ChangeAivEx(slf, StExt_AiVar_EsReg, 1);
		spellPower = (slf.level + 1) / 2 + (rx_monsterpower - 50);
		if (curSpellPower < spellPower) { rx_setnpcvar(slf, aivrx_spelldamagescale, spellPower); };
	};
	
	//poision protection
	slf.protection[7] += StExt_ValidateValueRange(slf.level, 5, 1000);
	if (StExt_IsGolem(slf) || c_npcisundead(slf)) { slf.protection[7] += 500; };
	
	if (slf.attribute[atr_dexterity] >= 100)
	{
		StExt_Npc_CalcDodgeChanceBonusFromAgi(slf);
		StExt_Npc_CalcSpeedBonusFromAgi(slf);
	};
	
	if (StExt_Chance(StExt_Config_Npc_LuckyFlagChance)) { StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Lucky, true); };
	if (StExt_Chance(StExt_Config_Npc_RichFlagChance)) { StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_Rich, true); };
	
	resistBonus = 5 + StExt_ValidateValueRange(((slf.level + 1) / 2), 1, 500);
	statBonus = 10 + StExt_ValidateValueRange(((slf.level + 1) * 2), 5, 1500);
	hpBonus = statBonus * 10;
	protBonus = statBonus / 3;
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistAoe)) { StExt_Npc_ChangeAoeResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistEdge)) { StExt_Npc_ChangeEdgeResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistBlunt)) { StExt_Npc_ChangeBluntResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistPoint)) { StExt_Npc_ChangePointResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistMagic)) { StExt_Npc_ChangeMagicResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistFire)) { StExt_Npc_ChangeFireResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistFly)) { StExt_Npc_ChangeFlyResist(slf, resistBonus); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveResistPois)) { StExt_Npc_ChangePoisionResist(slf, resistBonus); };	
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraStr)) { slf.attribute[atr_strength] += statBonus; };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraAgi)) { slf.attribute[atr_dexterity] += statBonus; };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraProt)) 
	{ 
	
		slf.protection[0] = StExt_IfInt(slf.protection[0] > 0, slf.protection[0] + protBonus, slf.protection[0]);		
		slf.protection[1] = StExt_IfInt(slf.protection[1] > 0, slf.protection[1] + protBonus, slf.protection[1]);
		slf.protection[2] = StExt_IfInt(slf.protection[2] > 0, slf.protection[2] + protBonus, slf.protection[2]);
		slf.protection[3] = StExt_IfInt(slf.protection[3] > 0, slf.protection[3] + protBonus, slf.protection[3]);
		slf.protection[4] = StExt_IfInt(slf.protection[4] > 0, slf.protection[4] + protBonus, slf.protection[4]);
		slf.protection[5] = StExt_IfInt(slf.protection[5] > 0, slf.protection[5] + protBonus, slf.protection[5]);
		slf.protection[6] = StExt_IfInt(slf.protection[6] > 0, slf.protection[6] + protBonus, slf.protection[6]);
		slf.protection[7] = StExt_IfInt(slf.protection[7] > 0, slf.protection[7] + protBonus, slf.protection[7]);
	};
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraHp)) 
	{ 
		slf.attribute[atr_hitpoints_max] = StExt_CheckIntOverflow(slf.attribute[atr_hitpoints_max], slf.attribute[atr_hitpoints_max] + hpBonus);
		slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];
	};
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraEs))
	{
		StExt_Npc_ChangeMaxEs(slf, hpBonus);
		StExt_Npc_ChangeEs(slf, hpBonus);
		StExt_Npc_ChangeAivEx(slf, StExt_AiVar_EsReg, 1);
	};
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraSpeed)) { StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, 5 + hlp_random(10)); };
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveExtraDodge)) { StExt_Npc_ChangeDodgeChance(slf, resistBonus); };	
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassivePoisioner)) { rx_setnpcvar(slf, var_can_poison, StExt_ValidateValueRange(slf.level, 5, 250)); };
	
	slf.aivar[83] = slf.attribute[atr_mana_max];
    slf.aivar[81] = slf.attribute[atr_strength];
    slf.aivar[82] = slf.attribute[atr_dexterity];
};

func void StExt_Npc_SaveBaseStats(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_Npc_SaveBaseStats(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	
	StExt_SetNpcVar(slf, StExt_AiVar_BaseStatsInitialized, true);
	StExt_SetNpcVar(slf, StExt_AiVar_LastUpdateDay, StExt_CurrentDay);
	StExt_SetNpcVar(slf, StExt_AiVar_LastUpdateHeroLevel, StExt_CurrentHeroLevel);
	StExt_SetNpcVar(slf, StExt_AiVar_LastUpdateKapitel,	StExt_CurrentKapitel);
	
	StExt_SetNpcVar(slf, StExt_AiVar_BaseLevel, slf.level);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseHp, slf.attribute[atr_hitpoints_max]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseStr, slf.attribute[atr_strength]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseAgi, slf.attribute[atr_dexterity]);

	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamBlunt, slf.damage[dam_index_blunt]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamEdge, slf.damage[dam_index_edge]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamFire, slf.damage[dam_index_fire]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamFly, slf.damage[dam_index_fly]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamMagic, slf.damage[dam_index_magic]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamPoint, slf.damage[dam_index_point]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseDamFall, slf.damage[dam_index_fall]);
	
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtBlunt, slf.protection[prot_blunt]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtEdge, slf.protection[prot_edge]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtPoint, slf.protection[prot_point]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtFire, slf.protection[prot_fire]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtMagic, slf.protection[prot_magic]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtFly, slf.protection[prot_fly]);
	StExt_SetNpcVar(slf, StExt_AiVar_BaseProtFall, slf.protection[prot_fall]);
};

func void StExt_Npc_UpdateStats(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_Npc_UpdateStats(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	if (c_npcisdown(slf)) { return; };	
	if (!StExt_ModInitialized || (!rx_herocreated && !givepack)) { return; };
	
	var int lastUpdateDay; lastUpdateDay = StExt_GetNpcVar(slf, StExt_AiVar_LastUpdateDay);
	var int lastUpdateLevel; lastUpdateLevel = StExt_GetNpcVar(slf, StExt_AiVar_LastUpdateHeroLevel);
	var int lastUpdateKapitel; lastUpdateKapitel = StExt_GetNpcVar(slf, StExt_AiVar_LastUpdateKapitel);
	var int statsInitialized; statsInitialized = StExt_GetNpcVar(slf, StExt_AiVar_BaseStatsInitialized);
	
	if (!statsInitialized)
	{
		StExt_Npc_SaveBaseStats(slf);
		return;
	};
	
	var int daysDiff; daysDiff = StExt_CurrentDay - lastUpdateDay;
	var int levelDiff; levelDiff = StExt_CurrentHeroLevel - lastUpdateLevel;
	var int kapitelDiff; kapitelDiff = StExt_CurrentKapitel - lastUpdateKapitel;	
	if ((daysDiff <= 0) && (levelDiff <= 0) && (kapitelDiff <= 0)) { return; };
	
	var int baseHp; baseHp = StExt_GetNpcVar(slf, StExt_AiVar_BaseHp);
	var int baseStr; baseStr = StExt_GetNpcVar(slf, StExt_AiVar_BaseStr);
	var int baseAgi; baseAgi = StExt_GetNpcVar(slf, StExt_AiVar_BaseAgi);
	
	var int baseDamBlunt; baseDamBlunt = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamBlunt);
	var int baseDamEdge; baseDamEdge = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamEdge);
	var int baseDamFire; baseDamFire = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamFire);
	var int baseDamFly; baseDamFly = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamFly);
	var int baseDamMagic; baseDamMagic = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamMagic);
	var int baseDamPoint; baseDamPoint = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamPoint);
	var int baseDamFall; baseDamFall = StExt_GetNpcVar(slf, StExt_AiVar_BaseDamFall);

	var int baseProtBlunt; baseProtBlunt = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtBlunt);
	var int baseProtEdge;  baseProtEdge = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtEdge);
	var int baseProtPoint; baseProtPoint = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtPoint);
	var int baseProtFire; baseProtFire = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtFire);
	var int baseProtMagic; baseProtMagic = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtMagic);
	var int baseProtFly; baseProtFly = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtFly);
	var int baseProtFall; baseProtFall = StExt_GetNpcVar(slf, StExt_AiVar_BaseProtFall);
	
	var int hpMult; hpMult = 0;
	var int hpBonus; hpBonus = 0;
	var int statsMult; statsMult = 0;
	var int protMult; protMult = 0;
	var int updateRequired; updateRequired = false;
	
	if ((daysDiff > 0) && StExt_Config_Diff_EnableDaily)
	{
		hpMult += daysDiff * StExt_Config_Diff_Daily_Hp;
		statsMult += daysDiff * StExt_Config_Diff_Daily_Power;
		protMult += daysDiff * StExt_Config_Diff_Daily_Prot;
		updateRequired = true;
	};
	
	if ((levelDiff > 0) && StExt_Config_Diff_EnableLevel)
	{
		hpMult += levelDiff * StExt_Config_Diff_Level_Hp;
		statsMult += levelDiff * StExt_Config_Diff_Level_Power;
		protMult += levelDiff * StExt_Config_Diff_Level_Prot;
		updateRequired = true;
	};
	
	if ((kapitelDiff > 0) && StExt_Config_Diff_EnableKapitel)
	{
		hpMult += kapitelDiff * StExt_Config_Diff_Kapitel_Hp;
		statsMult += kapitelDiff * StExt_Config_Diff_Kapitel_Power;
		protMult += kapitelDiff * StExt_Config_Diff_Kapitel_Prot;
		updateRequired = true;
	};
	
	if (updateRequired)
	{
		hpBonus = StExt_GetPercentFromValueWithMin(baseHp, hpMult, 1);
		slf.attribute[atr_hitpoints_max] += hpBonus;
		slf.attribute[atr_hitpoints] += hpBonus;
		
		if ((statsMult >= 10) && rx_getchance(10)) { slf.level += 1; };
		slf.attribute[atr_strength] += StExt_GetPercentFromValueWithMin(baseStr, statsMult, 1);
		slf.attribute[atr_dexterity] += StExt_GetPercentFromValueWithMin(baseAgi, statsMult, 1);
		
		if (baseDamBlunt > 0) { slf.damage[dam_index_blunt] += StExt_GetPercentFromValue(baseDamBlunt, statsMult); };
		if (baseDamEdge > 0) { slf.damage[dam_index_edge] += StExt_GetPercentFromValue(baseDamEdge, statsMult); };
		if (baseDamFire > 0) { slf.damage[dam_index_fire] += StExt_GetPercentFromValue(baseDamFire, statsMult); };
		if (baseDamFly > 0) { slf.damage[dam_index_fly] += StExt_GetPercentFromValue(baseDamFly, statsMult); };
		if (baseDamMagic > 0) { slf.damage[dam_index_magic] += StExt_GetPercentFromValue(baseDamMagic, statsMult); };
		if (baseDamPoint > 0) { slf.damage[dam_index_point] += StExt_GetPercentFromValue(baseDamPoint, statsMult); };
		if (baseDamFall > 0) { slf.damage[dam_index_fall] += StExt_GetPercentFromValue(baseDamFall, statsMult); };
		
		if (baseProtBlunt > 0) { slf.protection[prot_blunt] += StExt_GetPercentFromValue(baseProtBlunt, protMult); };
		if (baseProtEdge > 0) { slf.protection[prot_edge] += StExt_GetPercentFromValue(baseProtEdge, protMult); };
		if (baseProtPoint > 0) { slf.protection[prot_point] += StExt_GetPercentFromValue(baseProtPoint, protMult); };
		if (baseProtFire > 0) { slf.protection[prot_fire] += StExt_GetPercentFromValue(baseProtFire, protMult); };
		if (baseProtMagic > 0) { slf.protection[prot_magic] += StExt_GetPercentFromValue(baseProtMagic, protMult); };
		if (baseProtFly > 0) { slf.protection[prot_fly] += StExt_GetPercentFromValue(baseProtFly, protMult); };
		if (baseProtFall > 0) { slf.protection[prot_fall] += StExt_GetPercentFromValue(baseProtFall, protMult); };
		
		StExt_PrintDebug("StExt_Npc_UpdateStats(var c_npc slf)", "Npc was updated!", slf, other);
	};		

	StExt_SetNpcVar(slf, StExt_AiVar_LastUpdateDay, StExt_CurrentDay);
	StExt_SetNpcVar(slf, StExt_AiVar_LastUpdateHeroLevel, StExt_CurrentHeroLevel);
	StExt_SetNpcVar(slf, StExt_AiVar_LastUpdateKapitel,	StExt_CurrentKapitel);
};

// Calls every second
func void StExt_Npc_PassiveHandler(var c_npc slf)
{
	var int regen;
	var int rank;
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_Npc_PassiveHandler(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	if (c_npcisdown(slf)) { return; };
	
	rank = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveHpRegen))
	{
		regen = 1 + StExt_GetPermilleFromValue(slf.attribute[atr_hitpoints_max], 1) + StExt_GetPercentFromValue(slf.level, 3) + rank;
		regen = StExt_ValidateValueRange(regen, 1, 50);
		StExt_Npc_Restorehealth(slf, regen);
	};
	
	if (StExt_Npc_GetMaxEs(slf) > 0)
	{
		regen = 1 + StExt_GetNpcVar(slf, StExt_AiVar_EsReg);
		if (StExt_Npc_HasAbility(slf, StExt_Npc_Ability_PassiveEsRegen)) {
			regen += 1 + StExt_GetPermilleFromValue(StExt_Npc_GetMaxEs(slf), 1) + StExt_GetPercentFromValue(slf.level, 3) + rank; };
		regen = StExt_ValidateValueRange(regen, 1, 75);
		StExt_Npc_ChangeEs(slf, regen);
	};
};

var int StExt_KillSpecialSummons_InstanceId;
func void StExt_KillSpecialSummons_Loop() 
{
	if (!hlp_isvalidnpc(StExt_Self)) { return; };
	if (hlp_getinstanceid(StExt_Self) == StExt_KillSpecialSummons_InstanceId) { StExt_Self.attribute[0] -= StExt_Self.attribute[1]; }; 
};
func void StExt_KillSpecialSummons(var int summonId)
{
	if ((summonId < 0) || (summonId >= StExt_SpecialSummonType_Max))
	{
		StExt_PrintDebugStack("StExt_KillSpecialSummons(...) -> SummonId out of range!");
		return;
	};
	
	StExt_KillSpecialSummons_InstanceId = StExt_Null;	
	if (summonId == StExt_SpecialSummonType_Wolf) { StExt_KillSpecialSummons_InstanceId = StExt_GetInstanceIdByName("summoned_wolf_protector"); };	
	if (summonId == StExt_SpecialSummonType_Zombie) { StExt_KillSpecialSummons_InstanceId = StExt_GetInstanceIdByName("summoned_zombie_proteсtor"); };
	if (summonId == StExt_SpecialSummonType_Demon) { StExt_KillSpecialSummons_InstanceId = StExt_GetInstanceIdByName("summoned_demon_protector"); };
	if (summonId == StExt_SpecialSummonType_Golem) { StExt_KillSpecialSummons_InstanceId = StExt_GetInstanceIdByName("summoned_golem_protector"); };
	if (summonId == StExt_SpecialSummonType_Shadow) { StExt_KillSpecialSummons_InstanceId = StExt_GetInstanceIdByName("stext_heroshadow"); };

	if(StExt_KillSpecialSummons_InstanceId == StExt_Null)
	{
		StExt_PrintDebugStack("StExt_KillSpecialSummons(...) -> SummonInstanceId is null!");
		return;
	};
	StExt_ChangeSpecialSummonCount(summonId, -100);
	StExt_PrintDebugStack("StExt_KillSpecialSummon...");
	StExt_ForEachNpcInRadius(hero, 10000, StExt_EmptyString, StExt_EmptyString, "StExt_KillSpecialSummons_Loop");
};

func void StExt_KillAllSpecialSummons_Loop() 
{	
	if (!hlp_isvalidnpc(StExt_Self)) 
	{
		StExt_PrintDebugStack("StExt_KillAllSpecialSummons_Loop(...) -> SummonInstanceId is null!");
		return; 
	};
	if (hlp_getinstanceid(StExt_Self) == StExt_GetInstanceIdByName("summoned_wolf_protector")) { StExt_Self.attribute[0] -= StExt_Self.attribute[1]; }; 
	if (hlp_getinstanceid(StExt_Self) == StExt_GetInstanceIdByName("summoned_zombie_proteсtor")) { StExt_Self.attribute[0] -= StExt_Self.attribute[1]; }; 
	if (hlp_getinstanceid(StExt_Self) == StExt_GetInstanceIdByName("summoned_demon_protector")) { StExt_Self.attribute[0] -= StExt_Self.attribute[1]; }; 
	if (hlp_getinstanceid(StExt_Self) == StExt_GetInstanceIdByName("summoned_golem_protector")) { StExt_Self.attribute[0] -= StExt_Self.attribute[1]; }; 
	if (hlp_getinstanceid(StExt_Self) == StExt_GetInstanceIdByName("stext_heroshadow")) { StExt_Self.attribute[0] -= StExt_Self.attribute[1]; };  
};

func void StExt_KillAllSpecialSummons()
{
	StExt_ChangeSpecialSummonCount(0, -100);
	StExt_ChangeSpecialSummonCount(1, -100);
	StExt_ChangeSpecialSummonCount(2, -100);
	StExt_ChangeSpecialSummonCount(3, -100);
	StExt_ChangeSpecialSummonCount(4, -100);
	StExt_ForEachNpcInRadius(hero, 10000, StExt_EmptyString, StExt_EmptyString, "StExt_KillAllSpecialSummons_Loop");
};

func int StExt_CheckSpawnWp_IsInvalid(var string wp) { return (StExt_StringIsEmpty(wp) || hlp_strcmp(wp, "TOT")); };
func string StExt_CheckSpawnWp_SearchWp(var string wp, var c_npc npc)
{
	var string result;
	result = wp;
	if (hlp_isvalidnpc(npc))
	{
		result = npc_getnextwp(npc);
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = npc_getnearestwp(npc); }
		else { return result; };
		
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = wp; };
	};
	return result;
};
func string StExt_CheckSpawnWp(var string wp)
{
	var string result;
	result = wp;
	if (StExt_CheckSpawnWp_IsInvalid(wp))
	{
		result = StExt_CheckSpawnWp_SearchWp(result, hero);
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = StExt_CheckSpawnWp_SearchWp(result, self); }
		else { return result; };
		
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = StExt_CheckSpawnWp_SearchWp(result, other); }
		else { return result; };
		
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = StExt_CheckSpawnWp_SearchWp(result, victim); }
		else { return result; };
		
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = StExt_CheckSpawnWp_SearchWp(result, StExt_Self); }
		else { return result; };
		
		if (StExt_CheckSpawnWp_IsInvalid(result)) { result = StExt_CheckSpawnWp_SearchWp(result, StExt_Other); }
		else { return result; };
		
		if (StExt_CheckSpawnWp_IsInvalid(result)) 
		{ 
			result = wp;
			StExt_PrintDebugStack("StExt_CheckSpawnWp() -> Wp is icorrect, but alternative not found!");
		};
	};
	return result;
};

func int StExt_Npc_GetTotalDamage(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_Npc_GetTotalDamage(var c_npc slf)", "slf instance is null!", slf, other);
		return StExt_Null; 
	};
	return slf.damage[0] + slf.damage[1] + slf.damage[2] + slf.damage[3] + slf.damage[4] + slf.damage[5] + slf.damage[6] + slf.damage[7]; 
};


//**************************************************************
//						Random bandits
//**************************************************************

func void StExt_InitializeRandomBandit_StartRoll(var c_npc slf, var C_NpcRandomBanditStats statsData)
{
	var string nameArray; nameArray = "StExt_Str_RandomBanditName_Male";
	var int nameIndexStart; nameIndexStart = 0;
	var int rnd; rnd = 0;

	StExt_CheckUid(slf);
	statsData.Power = 10 + (hero.level * 5) + (kapitel * 75);
	statsData.Power += hlp_random(10 + ((statsData.Power + 1) / 2));
	statsData.Power = StExt_GetPercentFromValue(statsData.Power, StExt_Config_WorldRandomization_BanditsPowerMult);
	statsData.Power = StExt_ValidateValueRange(statsData.Power, 10, StExt_WorldRandomizer_RandomBandit_MaxPower);
	
	if (StExt_Chance(75)) { statsData.Type = StExt_WorldRandomizer_RandomBanditType_Mage; }
	else if (StExt_Chance(250)) { statsData.Type = StExt_WorldRandomizer_RandomBanditType_Warrior; }
	else if (StExt_Chance(250)) { statsData.Type = StExt_WorldRandomizer_RandomBanditType_Ranger; }
	else { statsData.Type = StExt_WorldRandomizer_RandomBanditType_Default; };
	
	statsData.Flags = 0;
	statsData.Level = 5 + (statsData.Power / 15) + hlp_random(5);
	
	statsData.IsFemale = rx_getchance(StExt_Config_WorldRandomization_FamaleBanditChance);
	if (statsData.IsFemale) 
	{ 
		slf.aivar[17] = female;
		nameArray = "StExt_Str_RandomBanditName_Female";
		statsData.VoiceIndex = StExt_IfInt(StExt_Chance(500), 16, 17);
	}
	else
	{
		slf.aivar[17] = male;
		rnd = hlp_random(9);
		if (rnd == 0) { statsData.VoiceIndex = 1; }
		else if (rnd == 1) { statsData.VoiceIndex = 3; }
		else if (rnd == 2) { statsData.VoiceIndex = 4; }
		else if (rnd == 3) { statsData.VoiceIndex = 7; }
		else if (rnd == 4) { statsData.VoiceIndex = 8; }
		else if (rnd == 5) { statsData.VoiceIndex = 10; }
		else if (rnd == 6) { statsData.VoiceIndex = 11; }
		else if (rnd == 7) { statsData.VoiceIndex = 12; }
		else if (rnd == 8) { statsData.VoiceIndex = 13; }
		else { statsData.VoiceIndex = 10; };
	};
	
	nameIndexStart = statsData.Type * StExt_WorldRandomizer_RandomBanditNameOffset;
	statsData.NameIndex = StExt_GetRandomRange(nameIndexStart, nameIndexStart + StExt_WorldRandomizer_RandomBanditNameOffset);	
	slf.name = StExt_Array_GetString(nameArray, statsData.NameIndex);
	slf.voice = statsData.VoiceIndex;
	
	StExt_Npc_SetExtraFlag(slf, StExt_NpcFlag_RandomBandit, true);
};

func void StExt_InitializeRandomBandit_RollStats(var c_npc slf, var C_NpcRandomBanditStats statsData)
{	
	statsData.Hp = 100 + (statsData.Level * 10) + (statsData.Power * 2) + hlp_random(100);	
	statsData.Str = 50 + statsData.Level + (statsData.Power / 5) + hlp_random(25);
	statsData.Agi = 50 + statsData.Level + (statsData.Power / 5) + hlp_random(25);
	statsData.Speed = 0;
	statsData.DodgeChance = 0;
	
	statsData.ProtBlunt = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	statsData.ProtEdge = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	statsData.ProtFire = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	statsData.ProtFly = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	statsData.ProtMagic = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	statsData.ProtPoint = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	statsData.ProtFall = 10 + statsData.Level + hlp_random(statsData.Level + 15);
	
	statsData.1hMastery = 20 + (statsData.Level / 2) + hlp_random(10);
	statsData.2hMastery = 20 + (statsData.Level / 2) + hlp_random(10);
	statsData.BowMastery = 20 + (statsData.Level / 2) + hlp_random(10);
	statsData.CBowMastery = 20 + (statsData.Level / 2) + hlp_random(10);
	
	statsData.MeleeBonusDamage = 5 + (statsData.Power / 10) + hlp_random(statsData.Level + 1);
	statsData.RangeBonusDamage = 5 + (statsData.Power / 10) + hlp_random(statsData.Level + 1);
	statsData.SpellBonusDamage = 5 + (statsData.Power / 10) + hlp_random(statsData.Level + 1);
	
	if (statsData.IsFemale) { statsData.Agi += StExt_GetPermilleFromValue(statsData.Agi, 100 + hlp_random(50)); }
	else { statsData.Str += StExt_GetPermilleFromValue(statsData.Str, 100 + hlp_random(50)); };
	
	if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Warrior)
	{
		statsData.Hp += StExt_GetPermilleFromValue(statsData.Hp, 250 + hlp_random(50));
		statsData.Str += StExt_GetPermilleFromValue(statsData.Str, 150 + hlp_random(50));
		statsData.1hMastery += 10 + (statsData.Level / 5) + hlp_random(5);
		statsData.2hMastery += 10 + (statsData.Level / 5) + hlp_random(5);
		statsData.Speed += statsData.Level / 10;
		statsData.MeleeBonusDamage += statsData.MeleeBonusDamage + hlp_random(statsData.MeleeBonusDamage + 5);
		if (StExt_Chance(statsData.Level * 5)) { rx_setnpcvar(slf, aivrx_npc_sprint, true); };
	}
	else if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Ranger)
	{
		statsData.Agi += StExt_GetPermilleFromValue(statsData.Agi, 150 + hlp_random(50));
		statsData.BowMastery += 10 + (statsData.Level / 5) + hlp_random(5);
		statsData.CBowMastery += 10 + (statsData.Level / 5) + hlp_random(5);
		statsData.Speed += 1 + (statsData.Level / 5);
		statsData.DodgeChance += 1 + (statsData.DodgeChance / 5);
		statsData.RangeBonusDamage += statsData.RangeBonusDamage + hlp_random(statsData.RangeBonusDamage + 5);
		if (StExt_Chance(statsData.Level * 10)) { rx_setnpcvar(slf, aivrx_npc_sprint, true); };
	}
	else if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Mage)
	{
		statsData.SpellDamage = rx_getnpcvar(slf, aivrx_spelldamagescale) + statsData.Level;
		statsData.Es = 50 + (statsData.Level * 5) + statsData.Power + hlp_random(50);
		statsData.SpellBonusDamage += statsData.SpellBonusDamage + hlp_random(statsData.SpellBonusDamage + 5);
		slf.aivar[51] = magic_always;
	};
	
	if (StExt_Chance(statsData.Level * 10)) { slf.fight_tactic = fai_human_master; }
	else if (StExt_Chance(statsData.Level * 10)) { slf.fight_tactic = fai_human_strong; }
	else { slf.fight_tactic = fai_human_coward; };

	
	slf.level = statsData.Level;
	slf.exp_next = (500 * ((slf.level + 2) / 2)) * (slf.level + 1);
	slf.exp = slf.exp_next;    
	
	slf.attribute[atr_strength] = statsData.Str;
	slf.aivar[81] = slf.attribute[atr_strength];
	slf.attribute[atr_dexterity] = statsData.Agi;
	slf.aivar[82] = slf.attribute[atr_dexterity];
	
	slf.attribute[atr_mana_max] = 1000;
	slf.aivar[83] = slf.attribute[atr_mana_max];
	slf.attribute[atr_mana] = slf.attribute[atr_mana_max];
	
	slf.attribute[atr_hitpoints_max] = statsData.Hp;
	slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];
	
	if (statsData.Es > 0)
	{
		StExt_Npc_ChangeMaxEs(slf, statsData.Es);
		StExt_Npc_ChangeEs(slf, statsData.Es);
		StExt_Npc_ChangeAivEx(slf, StExt_AiVar_EsReg, 1 + (statsData.Level / 20));
	};	
	if (statsData.Speed > 0) { StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, statsData.Speed); };
	if (statsData.DodgeChance > 0) { StExt_Npc_ChangeDodgeChance(slf, statsData.DodgeChance); };
	if (statsData.SpellDamage > 0) { rx_setnpcvar(slf, aivrx_spelldamagescale, statsData.SpellDamage); };
	
	b_givenpctalents(slf);
	npc_settalentskill(slf, npc_talent_mage, 6);
	b_raisefighttalent(slf, npc_talent_1h, statsData.1hMastery);
	b_raisefighttalent(slf, npc_talent_2h, statsData.2hMastery);
	b_raisefighttalent(slf, npc_talent_bow, statsData.BowMastery);
	b_raisefighttalent(slf, npc_talent_crossbow, statsData.CBowMastery);
	
	StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraMagicDamage, statsData.SpellBonusDamage);
	StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraMeleeDamage, statsData.MeleeBonusDamage);
	StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraRangeDamage, statsData.RangeBonusDamage);
};

func void StExt_InitializeRandomBandit_RollVisual(var c_npc slf, var C_NpcRandomBanditStats statsData)
{
	var string body_mesh;
	var string head_mesh;
	var int body_tex;
	var int head_tex;
	var int armor_inst;
	
	var int skinToneIndex;
	var string armorInstanceName;
	var string animation_set; animation_set = "HUMANS.MDS";
	var float scale; scale = 1.0;
	var float fatness; fatness = 1.0;
	
	var int animSetIndex; animSetIndex = 0;
	var int headMeshIndex; headMeshIndex = 0;
	var int headMeshExtraIndex; headMeshExtraIndex = 0;
	var int bodyMeshIndex; bodyMeshIndex = 0;
	var int armorInstIndex; armorInstIndex = StExt_Null;
	
	if (statsData.IsFemale) 
	{
		fatness = StExt_GetRandFloatRange(0.15, 0.30);
		scale = StExt_GetRandFloatRange(0.95, 1.01);
		skinToneIndex = hlp_random(StExt_RandNpc_BodyTex_Max);
		
		body_mesh = "FEM_NAKED";
		head_mesh = "Hum_Head_Babe0";
		body_tex = StExt_Array_GetInt("StExt_RandNpc_BodyTex_F", skinToneIndex);
		head_tex = StExt_GetRandomArrayElement_Int("StExt_RandNpc_FaceTex_F");
		
		armorInstanceName = StExt_GetRandomArrayElement_String(concatstrings("StExt_RandNpc_Armor_F_", inttostring(statsData.Type)));
		armorInstIndex = StExt_ReturnSelectedIndex;
		armor_inst = StExt_GetInstanceIdByName(armorInstanceName);
	}
	else
	{
		if (StExt_Chance(150)) { skinToneIndex = 0; }
		else if (StExt_Chance(450)) { skinToneIndex = 1; }
		else if (StExt_Chance(250)) { skinToneIndex = 2; }
		else if (StExt_Chance(150)) { skinToneIndex = 3; }
		else { skinToneIndex = 1; };
		
		if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Warrior) 
		{
			fatness = StExt_GetRandFloatRange(1.0, 1.5);
			scale = StExt_GetRandFloatRange(1.0, 1.1);
		}
		else if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Ranger) { fatness = StExt_GetRandFloatRange(0.35, 0.75); }
		else if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Mage) 
		{ 
			scale = StExt_GetRandFloatRange(0.97, 1.0);
			fatness = StExt_GetRandFloatRange(0.0, 0.35); 
		};
	
		bodyMeshIndex = 0;
		body_mesh = "Hum_Body_Naked0";		
		body_tex = StExt_Array_GetInt("StExt_RandNpc_BodyTex_M", skinToneIndex);
		
		if (StExt_Chance(250)) 
		{ 
			head_mesh = StExt_GetRandomArrayElement_String("StExt_RandNpc_HeadMesh_MB");
			headMeshIndex = StExt_ReturnSelectedIndex;
			headMeshExtraIndex = 1;
			
			if (skinToneIndex >= 2) { head_tex = StExt_GetRandomArrayElement_Int("StExt_RandNpc_FaceTex_M_BB"); }
			else { head_tex = StExt_GetRandomArrayElement_Int("StExt_RandNpc_FaceTex_M_BN"); };
		}
		else 
		{ 
			head_mesh = StExt_GetRandomArrayElement_String("StExt_RandNpc_HeadMesh_MN");
			headMeshIndex = StExt_ReturnSelectedIndex;
			headMeshExtraIndex = 0;
			
			if (skinToneIndex >= 2) { head_tex = StExt_GetRandomArrayElement_Int("StExt_RandNpc_FaceTex_M_HB"); }
			else { head_tex = StExt_GetRandomArrayElement_Int("StExt_RandNpc_FaceTex_M_HN"); };
		};		
		
		armorInstanceName = StExt_GetRandomArrayElement_String(concatstrings("StExt_RandNpc_Armor_M_", inttostring(statsData.Type)));
		armorInstIndex = StExt_ReturnSelectedIndex;
		armor_inst = StExt_GetInstanceIdByName(armorInstanceName);		
	};	
	
	statsData.HeadMeshIndex = headMeshIndex;
	statsData.HeadMeshExtraIndex = headMeshExtraIndex;
	statsData.BodyMeshIndex = bodyMeshIndex;
	statsData.AnimSetIndex = animSetIndex;
	statsData.HeadTexIndex = head_tex;
	statsData.BodyTexIndex = body_tex;
	statsData.SkinToneIndex = skinToneIndex;
	statsData.ArmorInstIndex = armorInstIndex;
	
	mdl_setvisual(slf, animation_set);
	mdl_setvisualbody(slf, body_mesh, body_tex, 0, head_mesh, head_tex, 0, armor_inst);
	mdl_setmodelfatness(slf, fatness);
	mdl_setmodelscale(slf, scale, scale, scale);
	
	slf.protection[prot_blunt] += statsData.ProtBlunt;
	slf.protection[prot_edge] += statsData.ProtEdge;
	slf.protection[prot_fire] += statsData.ProtFire;
	slf.protection[prot_fly] += statsData.ProtFly;
	slf.protection[prot_magic] += statsData.ProtMagic;
	slf.protection[prot_point] += statsData.ProtPoint;
	slf.protection[prot_fall] += statsData.ProtFall;
};

func void StExt_InitializeRandomBandit_RollEquipment(var c_npc slf, var C_NpcRandomBanditStats statsData)
{
	var int weapPower; weapPower = StExt_ValidateValueRange(statsData.Power, 10, StExt_WorldRandomizer_RandomBanditMaxWeaponPower);
	var int meleeWeap; meleeWeap = StExt_Null;
	var int rangeWeap; rangeWeap = StExt_Null;
	var int shield; shield = StExt_Null;
	var int spellId; spellId = StExt_Null;
	
	var int meleeWeaponChance; meleeWeaponChance = 1000;
	var int rangeWeaponChance; rangeWeaponChance = 500;
	var int shieldChance; shieldChance = 0;
	var int magicChance; magicChance = 0;
	
	if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Warrior)
	{
		rangeWeaponChance = 100;
		shieldChance = 750;
	}
	else if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Ranger)
	{
		rangeWeaponChance = 1000;
		shieldChance = 100;
	}
	else if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Mage)
	{
		meleeWeaponChance = 500;
		magicChance = 1000;
		rangeWeaponChance = 0;
		shieldChance = 0;
	}
	else { shieldChance = 250; };	
	
	if (StExt_Chance(meleeWeaponChance))
	{
		if (statsData.Type == StExt_WorldRandomizer_RandomBanditType_Mage) { meleeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_MagicWeapon"), weapPower); }
		else if (rx_getchance(50)) { meleeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_2hWeapon"), weapPower); }
		else
		{
			meleeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), weapPower);
			if (rx_getchance(shieldChance)) { shield = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Shield"), weapPower); };
		};
	};
	if (StExt_Chance(rangeWeaponChance))
	{
		if (rx_getchance(50)) { 
			rangeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_BowWeapon"), weapPower);
			createinvitems(slf, itrw_arrow, 35 + statsData.Level + hlp_random(statsData.Level + 50));
		}
		else {
			rangeWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_CBowWeapon"), weapPower);
			createinvitems(slf, itrw_bolt, 35 + statsData.Level + hlp_random(statsData.Level + 50));
		};
	};	
	if (StExt_Chance(magicChance))
	{
		spellId = StExt_Array_GetInt("StExt_WorldRandomizer_RandomBanditRunes", hlp_random(StExt_WorldRandomizer_RandomBanditRunesMax)); 
		StExt_SetNpcVar(slf, StExt_AiVar_UseSpellRune, spellId);
	};
	
	if (meleeWeap != StExt_Null) { npc_equipitem(slf, meleeWeap); };
	if (rangeWeap != StExt_Null) { npc_equipitem(slf, rangeWeap); };
	if (shield != StExt_Null) 
	{ 
		rx_setnpcvar(slf, aivrx_npc_atr_shield, 150);
		npc_equipitem(slf, shield); 
	};
	
	b_createambientinv(slf);
	createinvitems(slf, itmi_gold, 10 + hlp_random(statsData.Level + 50));
    createinvitems(slf, itfo_booze, 1 + hlp_random(3));
    createinvitems(slf, itfo_fish, 2 + hlp_random(2));
	if (rx_getchance(25)) 
	{
        createinvitems(slf, itfo_sausage, 1);
        createinvitems(slf, itfo_alcohol, 2);
        createinvitems(slf, itfo_water, 1);
    };
    if (rx_getchance(15)) { createinvitems(slf, itfo_bacon, 1); };
    if (rx_getchance(10)) { createinvitems(slf, itfo_wineberrys, 1); };
    if (rx_getchance(25)) { createinvitems(slf, itfo_bread, 1 + hlp_random(2)); };
    if (rx_getchance(50)) 
	{
        createinvitems(slf, itfo_apple, 1);
        createinvitems(slf, itfo_bacon, 1);
    }
    else { createinvitems(slf, itfo_wine, 1); };
	
    if (rx_getchance(20)) 
	{
        if (rx_getchance(30)) { createinvitems(slf, itmi_silvercup, 1); }
        else if (rx_getchance(30)) { createinvitems(slf, itmi_cupgold, 1); }
        else { createinvitems(slf, itmi_jewelerychest, 1); };
    };
    createinvitems(slf, itmi_addon_head_common, 1);
};

func void StExt_InitializeRandomBandit_SaveAppearance(var c_npc slf, var C_NpcRandomBanditStats statsData)
{
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_Gender, statsData.IsFemale);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_NameIndex, statsData.NameIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_AnimSetIndex, statsData.AnimSetIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_BodyMeshIndex, statsData.BodyMeshIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_BodyTexIndex, statsData.BodyTexIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_HeadMeshIndex, statsData.HeadMeshIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_HeadTexIndex, statsData.HeadTexIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_TypeIndex, statsData.Type);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_SkinToneIndex, statsData.SkinToneIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_HeadMeshExtraIndex, statsData.HeadMeshExtraIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_ArmorInstanceIndex, statsData.ArmorInstIndex);
	StExt_SetNpcVar(slf, StExt_AiVar_Appearence_VoiceIndex, statsData.VoiceIndex);	
};

func void StExt_InitializeRandomBandit(var c_npc slf)
{
	var C_NpcRandomBanditStats statsData;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_InitializeRandomBandit()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	statsData = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_NpcRandomBanditStats"));
	if (Hlp_IsNull(statsData)) {
		StExt_PrintDebug("StExt_InitializeRandomBandit()", "Fail create bandit stats data!", slf, StExt_NullNpc);
		return; 
	};
	
	StExt_InitializeRandomBandit_StartRoll(slf, statsData);
	StExt_InitializeRandomBandit_RollStats(slf, statsData);
	StExt_InitializeRandomBandit_RollVisual(slf, statsData);
	StExt_InitializeRandomBandit_RollEquipment(slf, statsData);
	StExt_InitializeRandomBandit_SaveAppearance(slf, statsData);
	
	StExt_Struct_Free(statsData);
};

func void StExt_SpawnRandomBanditHandler() { StExt_InitializeRandomBandit(StExt_Self); };

func void StExt_RestoreRandomBanditAppearance(var c_npc slf)
{
	var string animation_set;
	var string body_mesh;
	var string head_mesh;
	var int body_tex;
	var int head_tex;
	var int armor_inst;
	var string armorName;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_RestoreRandomBanditAppearance()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	var int IsFemale; IsFemale = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_Gender);
	var int NpcType; NpcType = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_TypeIndex);	
	var int NameIndex; NameIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_NameIndex);
	var int AnimSetIndex; AnimSetIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_AnimSetIndex);
	var int BodyMeshIndex; BodyMeshIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_BodyMeshIndex);
	var int BodyTexIndex; BodyTexIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_BodyTexIndex);
	var int SkinToneIndex; SkinToneIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_SkinToneIndex);
	var int HeadMeshIndex; HeadMeshIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_HeadMeshIndex);
	var int HeadTexIndex; HeadTexIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_HeadTexIndex);
	var int HeadMeshExtraIndex; HeadMeshExtraIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_HeadMeshExtraIndex);
	var int ArmorInstIndex; ArmorInstIndex = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_ArmorInstanceIndex);

	body_tex = BodyTexIndex;
	head_tex = HeadTexIndex;	
	slf.voice = StExt_GetNpcVar(slf, StExt_AiVar_Appearence_VoiceIndex);
	
	if (IsFemale)
	{
		slf.name = StExt_Array_GetString("StExt_Str_RandomBanditName_Female", NameIndex);
		animation_set = "HUMANS.MDS";
		body_mesh = "FEM_NAKED";		
		head_mesh = "Hum_Head_Babe0";
		
		if (ArmorInstIndex != StExt_Null)
		{
			armorName = StExt_Array_GetString(concatstrings("StExt_RandNpc_Armor_F_", inttostring(NpcType)), ArmorInstIndex);
			armor_inst = StExt_GetInstanceIdByName(armorName);
		}
		else { armor_inst = StExt_Null; };
	}
	else
	{
		slf.name = StExt_Array_GetString("StExt_Str_RandomBanditName_Male", NameIndex);
		animation_set = "HUMANS.MDS";
		body_mesh = "Hum_Body_Naked0";
		
		if (HeadMeshExtraIndex == 1) { head_mesh = StExt_Array_GetString("StExt_RandNpc_HeadMesh_MB", HeadMeshIndex); }
		else { head_mesh = StExt_Array_GetString("StExt_RandNpc_HeadMesh_MN", HeadMeshIndex); };
		if (ArmorInstIndex != StExt_Null)
		{
			armorName = StExt_Array_GetString(concatstrings("StExt_RandNpc_Armor_M_", inttostring(NpcType)), ArmorInstIndex);		
			armor_inst = StExt_GetInstanceIdByName(armorName);
		}
		else { armor_inst = StExt_Null; };
	};
	
	mdl_setvisual(slf, animation_set);
	mdl_setvisualbody(slf, body_mesh, body_tex, 0, head_mesh, head_tex, 0, armor_inst);
};


//**************************************************************
//						RoT bandits
//**************************************************************

func void StExt_InitializeRotNpc(var c_npc slf, var int power)
{
	var int hp;
	var int str;
	var int agi;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_InitializeRotNpc()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	hp = StExt_GetPercentFromValueWithMin(hero.attribute[atr_hitpoints_max] + (kapitel * (150 + hlp_random(300))), StExt_GetRandomRange(50, 125), 500);
	str = StExt_GetPercentFromValueWithMin(hero.attribute[atr_strength] + (kapitel * (50 + hlp_random(50))), StExt_GetRandomRange(50, 125), 50);
	agi = StExt_GetPercentFromValueWithMin(hero.attribute[atr_dexterity] + (kapitel * (50 + hlp_random(50))), StExt_GetRandomRange(50, 125), 50);
	
	hp += StExt_GetPercentFromValue(hp, power);
	str += StExt_GetPercentFromValue(str, power);
	agi += StExt_GetPercentFromValue(agi, power);

	rx_sethealth(slf, hp);
	rx_setstr(slf, str);
	rx_setdex(slf, agi);
}; 

func void StExt_CreateRotNpcItems(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CreateRotNpcItems()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
	createinvitems(slf, itrw_arrow, 10 + hlp_random(3));
    createinvitems(slf, itmi_gold, 75 + hlp_random(40));
    createinvitems(slf, itfo_booze, 1 + hlp_random(3));
    createinvitems(slf, itfo_fish, 2 + hlp_random(2));
	if (rx_getchance(25)) 
	{
        createinvitems(slf, itfo_sausage, 1);
        createinvitems(slf, itfo_alcohol, 2);
        createinvitems(slf, itfo_water, 1);
    };
    if (rx_getchance(15)) { createinvitems(slf, itfo_bacon, 1); };
    if (rx_getchance(10)) { createinvitems(slf, itfo_wineberrys, 1); };
    if (rx_getchance(25)) { createinvitems(slf, itfo_bread, 1 + hlp_random(2)); };
    if (rx_getchance(50)) 
	{
        createinvitems(slf, itfo_apple, 1);
        createinvitems(slf, itfo_bacon, 1);
    }
    else { createinvitems(slf, itfo_wine, 1); };
	
    if (rx_getchance(20)) 
	{
        if (rx_getchance(30)) { createinvitems(slf, itmi_silvercup, 1); }
        else if (rx_getchance(30)) { createinvitems(slf, itmi_cupgold, 1); }
        else { createinvitems(slf, itmi_jewelerychest, 1); };
    };
    createinvitems(slf, itmi_addon_head_common, 1);
};

func void rx_rt_setnpcstats_nightencounter(var c_npc slf) { StExt_InitializeRotNpc(slf, hlp_random(10) + hero.level + (kapitel * 7)); };

func void rx_rt_setnpcstats_avenger(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("rx_rt_setnpcstats_avenger()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
    if (rx_isnpc(slf, npc_rt_avenger_1)) { StExt_InitializeRotNpc(slf, hlp_random(10) + hero.level + (kapitel * 10)); }
    else if (rx_isnpc(slf, npc_rt_avenger_2)) { StExt_InitializeRotNpc(slf, hlp_random(15) + hero.level + (kapitel * 15)); }
    else { StExt_InitializeRotNpc(slf, hlp_random(10) + hero.level + (kapitel * 5)); };
};

func void rx_rt_setnpcstats_helper(var c_npc slf) 
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("rx_rt_setnpcstats_helper()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	
    if ((currentlevel == newworld_zen) || (currentlevel == arenaloc_zen) || (currentlevel == paladinfort_zen)) { StExt_InitializeRotNpc(slf, hlp_random(5) + hero.level + (kapitel * 5)); }
    else if (currentlevel == addonworld_zen) { StExt_InitializeRotNpc(slf, hlp_random(10) + hero.level + (kapitel * 10)); }
    else if (currentlevel == oldworld_zen) { StExt_InitializeRotNpc(slf, hlp_random(15) + hero.level + (kapitel * 15)); }
	else { StExt_InitializeRotNpc(slf, hlp_random(20) + hero.level + (kapitel * 10)); };
};

func void rx_rt_setnpcstats(var c_npc slf) 
{
    var int day;
    var int skill;
    var int weaponid;
	var int power;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("rx_rt_setnpcstats()", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};

    day = wld_getday();
    weaponid = rx_getrandbanditweapon();
    equipitem(slf, weaponid);
    skill = 40 + (day * 2) + (kapitel * 10) + hero.level;
	power = hero.level + day + hlp_random(20) + (kapitel * hlp_random(15));
    StExt_InitializeRotNpc(slf, power);
	
    slf.aivar[57] = true;
    slf.aivar[25] = true;
    slf.aivar[52] = true;
    slf.aivar[74] = true;
    rx_setnpcvar(slf, aivrx_npc_rt_bandit, true);
	
    if (rx_getchance(20)) 
	{
        if (rx_getchance(50)) 
		{
            createinvitems(slf, itrw_arrow, 10 + power);
            equipitem(slf, itrw_bow_m_03);
        }
        else 
		{
            createinvitems(slf, itrw_bolt, 10 + power);
            equipitem(slf, itrw_crossbow_lightbetter);
        };
        if (rx_getchance(15)) { rx_setnpcvar(slf, aivrx_npc_range_only, true); };
    };
	
    if ((day >= 5) && rx_getchance(20)) 
	{
        mdl_applyoverlaymds(slf, "HUMANS_SPRINT.MDS");
        rx_setnpcvar(slf, aivrx_npc_sprint, 1);
    };
    if ((day > 10) && rx_getchance(5)) { StExt_Npc_ChangeAiv(slf, aivrx_npc_speed, 5 + hlp_random((1 + kapitel) * 2)); };

	StExt_Npc_ChangeAivEx(slf, StExt_AiVar_GoldBonus, power + hlp_random(10 + (kapitel * 5)));
	StExt_Npc_ChangeAivEx(slf, StExt_AiVar_LuckBonus, power + hlp_random(10 + (kapitel * 5)));
    b_setfightskills(slf, skill);
	StExt_CreateRotNpcItems(slf);
};
