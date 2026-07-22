func void StExt_UpdateEquipmentDamageInfo()
{
	var c_item meeleWeap;
	var c_item rangeWeap;
	var int damBonus;
	var int spellDamageFlags;
	var int spellEffectFlags;

	StExt_MeeleDamageInfo = StExt_Null;
	StExt_RangeDamageInfo = StExt_Null;
	StExt_RuneDamageInfo = StExt_Null;
	if (!hlp_isvalidnpc(hero)) { return; };
	
	if (npc_hasreadiedmeleeweapon(hero)) { meeleWeap = npc_getreadiedweapon(hero); }
	else { meeleWeap = npc_getequippedmeleeweapon(hero); };	
	if (npc_hasreadiedrangedweapon(hero)) { rangeWeap = npc_getreadiedweapon(hero); }
	else { rangeWeap = npc_getequippedrangedweapon(hero); };
	
	damBonus = StExt_PcStats[StExt_PcStats_Index_ExtraDamage];
	damBonus += (StExt_PcStats[StExt_PcStats_Index_BluntDotDamage] + StExt_PcStats[StExt_PcStats_Index_EdgeDotDamage] + StExt_PcStats[StExt_PcStats_Index_FireDotDamage] + StExt_PcStats[StExt_PcStats_Index_FlyDotDamage] + 
		StExt_PcStats[StExt_PcStats_Index_MagicDotDamage] + StExt_PcStats[StExt_PcStats_Index_PointDotDamage] + StExt_PcStats[StExt_PcStats_Index_PoisDotDamage]) * 3;
	damBonus += StExt_PcStats[StExt_PcStats_Index_ExtraBluntDam] + StExt_PcStats[StExt_PcStats_Index_ExtraBluntDam] + StExt_PcStats[StExt_PcStats_Index_ExtraEdgeDam] + StExt_PcStats[StExt_PcStats_Index_ExtraFireDam] + 
		StExt_PcStats[StExt_PcStats_Index_ExtraBluntDam] + StExt_PcStats[StExt_PcStats_Index_ExtraFlyDam] + StExt_PcStats[StExt_PcStats_Index_ExtraMagicDam] + StExt_PcStats[StExt_PcStats_Index_ExtraPointDam] + StExt_PcStats[StExt_PcStats_Index_ExtraPoisonDam]; 

	if (hlp_isvaliditem(meeleWeap))
	{
		StExt_MeeleDamageInfo = StExt_CalcWeaponTotalDamage(meeleWeap) + damBonus + StExt_PcStats[StExt_PcStats_Index_ExtraMeleeDam];
		
		if ((StExt_ValueHasFlag(meeleWeap.flags, item_swd) && getitemvarvalue(meeleWeap, bit_item_pierce_damage)) || getitemvarvalue(meeleWeap, bit_item_speer) || StExt_ValueHasFlag(meeleWeap.flags, item_dag))
		{ StExt_MeeleDamageInfo += hero.attribute[5]; }
		else if (StExt_WeaponIsMagicSword(meeleWeap) || StExt_WeaponIsStaff(meeleWeap)) { StExt_MeeleDamageInfo += atr_intellect;}
		else { StExt_MeeleDamageInfo += hero.attribute[4]; };
		
		if (StExt_ValueHasFlag(meeleWeap.flags, item_swd) || StExt_ValueHasFlag(meeleWeap.flags, item_axe) || StExt_ValueHasFlag(meeleWeap.flags, item_dag)) { StExt_MeeleDamageInfo += StExt_PcStats[StExt_PcStats_Index_1hExtraDam]; };
		if (StExt_ValueHasFlag(meeleWeap.flags, item_2hd_swd) || StExt_ValueHasFlag(meeleWeap.flags, item_2hd_axe) || StExt_ValueHasFlag(meeleWeap.flags, item_dag)) { StExt_MeeleDamageInfo += StExt_PcStats[StExt_PcStats_Index_2hExtraDam]; };
	}
	else { StExt_MeeleDamageInfo = hero.attribute[4] + damBonus + StExt_PcStats[StExt_PcStats_Index_ExtraMeleeDam]; };
	
	if (hlp_isvaliditem(rangeWeap))
	{
		StExt_RangeDamageInfo = StExt_CalcWeaponTotalDamage(rangeWeap) + damBonus + StExt_PcStats[StExt_PcStats_Index_ExtraRangeDam];		
		if (StExt_ValueHasFlag(rangeWeap.flags, item_bow)) { StExt_RangeDamageInfo += StExt_PcStats[StExt_PcStats_Index_BowExtraDam] + hero.attribute[5]; };
		if (StExt_ValueHasFlag(rangeWeap.flags, item_crossbow)) { StExt_RangeDamageInfo += StExt_PcStats[StExt_PcStats_Index_CBowExtraDam] + hero.attribute[4]; };
	};
	
	spellDamageFlags = StExt_GetSpellDamageFlags(rx_lastspellid);
	spellEffectFlags = StExt_GetSpellEffectFlags(rx_lastspellid);
	StExt_RuneDamageInfo = atr_intellect + StExt_GetPercentFromValue(atr_intellect, countlearnspell) + damBonus + StExt_PcStats[StExt_PcStats_Index_ExtraSpellDam] + StExt_PcStats[StExt_PcStats_Index_ExtraWeaponSkillDam];	
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Fire)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Ice)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_IceMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Electric)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Air)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Earth)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Dark)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Light)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Death)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower]; };
	if (StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Life) || StExt_ValueHasFlag(spellDamageFlags, StExt_DamageType_Poision)) { StExt_RuneDamageInfo += StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]; };

	// (Traca skladu bazy runicznej WYCIETA po potwierdzeniu w logu:
	// int=638, kregi=16 -> suma=1742 - skalowanie INT dziala; funkcja
	// odswieza sie co klatke i zalewala log milionami linii.)
};

func void StExt_AddSncDamage_Script(var int damage, var int isSummon)
{
	if ((damage <= 0) || (StExt_SncMode == 0)) { return; };	
	StExt_PrintDebug("StExt_AddSncDamage_Script(...)", concatstrings("Add snc damage: ", inttostring(damage)), self, other);
	StExt_SncExpDamage += damage;
};

// Call from engine
// For scripts create and use script layer func!
func void StExt_AddSncDamage(var int damage)
{
	if ((damage <= 0) || (StExt_SncMode == 0)) { return; };
	if (!hlp_isvalidnpc(StExt_AttackNpc) || !hlp_isvalidnpc(StExt_TargetNpc)) { return; };
	if (!StExt_IsSummonOrHero(StExt_AttackNpc)) { return; };
	if ((StExt_TargetNpc.aivar[43] == id_training_aim) && !rx_snk_starttrain) { return; };
	
	StExt_PrintDebug("StExt_AddSncDamage(...)", concatstrings("Add snc damage: ", inttostring(damage)), StExt_TargetNpc, StExt_AttackNpc);
	StExt_SncExpDamage += damage;
};

// Snc damage exp Integration
// These functions just pull up from NB engine
func int mr_fullsnc_changeDamage(var int damage) 
{
	if (StExt_SncExpDamage < 0) { StExt_SncExpDamage = 0; };
    damage += StExt_SncExpDamage;
	StExt_SncExpDamage = 0;
    return damage;
};
func int mr_snc_changeDamage(var int damage) 
{
	if (StExt_SncExpDamage < 0) { StExt_SncExpDamage = 0; };
    damage += StExt_SncExpDamage;
	StExt_SncExpDamage = 0;
    return damage;
};
func int mr_newsnc_changeDamage(var int damage) 
{
	if (StExt_SncExpDamage < 0) { StExt_SncExpDamage = 0; };
    damage += StExt_SncExpDamage;
	StExt_SncExpDamage = 0;
    return damage;
};

func int StExt_ExtraDamageBlockRequired(var int spellId)
{
	if ((spellId == spl_darkcontrol) || (spellId == spl_massagro) || (spellId == spl_darksleep)) { return true; };
	return false;
};

// Identyfikacja celow krucjaty Beliara - wspolna dla wyjatku DontKill (nizej)
// i sond diagnostycznych (DamageController). Obstawa (99790-99794) zawsze;
// bazowi lowcy dopiero po przyjeciu zlecenia (Stage >= 1). Garnizon Zakonu
// (99795-99797) CELOWO poza lista - to nasi, ochrona przed AoE ma ich obejmowac.
func int StExt_DH_IsWarTarget(var c_npc target)
{
	if (!hlp_isvalidnpc(target)) { return false; };
	if ((target.id >= 99790) && (target.id <= 99794)) { return true; };
	if (StExt_DH_Stage < 1) { return false; };
	if (hlp_getinstanceid(target) == hlp_getinstanceid(DH_MAINNPC)) { return true; };
	if (hlp_getinstanceid(target) == hlp_getinstanceid(DH_NPCSEVERIN)) { return true; };
	if (hlp_getinstanceid(target) == hlp_getinstanceid(DH_VILANDNPC)) { return true; };
	if (hlp_getinstanceid(target) == hlp_getinstanceid(DH_SLD_MERCENARY_01)) { return true; };
	if (hlp_getinstanceid(target) == hlp_getinstanceid(DH_SLD_MERCENARY_02)) { return true; };
	return false;
};

func int StExt_DontKillByExtraDamage(var c_npc atk, var c_npc target)
{
	// THE HERO IS NEVER PROTECTED.
	// This guard exists for ONE reason: so the player's stray AoE/DOT does not
	// murder peaceful townsfolk. It was never meant to shield the player.
	// Without this line the hero was immortal against any damage whose attacker
	// is unknown (boss waves/blinks, DOT ticks, environment): the fall-through
	// below returns true for every peaceful human, and the hero is a peaceful
	// human - so the engine clamped the killing blow to leave exactly 1 HP
	// (Damage.cpp, ChangeAttribute_StExt: value = -(attribute[0] - 1)).
	// Reported live: "boss nie mogl mnie dobic, caly czas bylem na 1 HP".
	if (hlp_isvalidnpc(target) && npc_isplayer(target)) { return false; };

	// CELE KRUCJATY BELIARA UMIERAJA NAPRAWDE - lowcy nie sa gil_bdt/gil_dmt,
	// wiec wpadali do ochrony "spokojnych ludzi" ponizej i DLL przycinal kazdy
	// smiertelny cios do 1 HP (Damage.cpp, ChangeAttribute_StExt: saveLife).
	// UWAGA: ten guard jest pytany TYLKO gdy cios jest smiertelny (damage >= hp).
	// Jesli ochrona frameworka przycina obrazenia WYZEJ, cios nigdy nie jest
	// smiertelny i ponizsza linia wcale sie nie odpala - sonda to pokaze.
	if (StExt_DH_IsWarTarget(target))
	{
		StExt_Trace(concatstrings(concatstrings("DH-DONTKILL zwalniam z ochrony inst=", inttostring(hlp_getinstanceid(target))), concatstrings(" hp=", inttostring(target.attribute[atr_hitpoints]))));
		return false;
	};

	if (!hlp_isvalidnpc(target) || !hlp_isvalidnpc(atk))
	{
		if (hlp_isvalidnpc(target)) {
			return ((target.guild != gil_bdt) && (target.guild != gil_dmt)) && c_npcishuman(target);
		};
		StExt_PrintDebug("StExt_DontKillByExtraDamage(...)", "Some actor instance is null!", atk, target);
		return false;
	};
	
	var int targetIsPeacefulHuman; targetIsPeacefulHuman = c_npcishuman(target) && (target.guild != gil_bdt) && (target.guild != gil_dmt);
	var int atkIsPeacefulHuman; atkIsPeacefulHuman = c_npcishuman(atk) && (atk.guild != gil_bdt) && (atk.guild != gil_dmt);
	var int isPlayerSide; isPlayerSide = StExt_IsSummonOrHero(atk) || (atk.aivar[15] == true);
	
	if (isPlayerSide && targetIsPeacefulHuman) { return true; };
	if (atkIsPeacefulHuman && targetIsPeacefulHuman) { return true; };
	return false;
};

func int StExt_DontKillByExtraDamage_Engine() { return StExt_DontKillByExtraDamage(StExt_AttackNpc, StExt_TargetNpc); };

// Define if players debuff/negatice effect can be aplied to npc
func int StExt_PcDebuffSelector()
{
	var int temp_attitude;
    var int perm_attitude;
	var int gil_attitude;
	if(!hlp_isvalidnpc(StExt_Self))
	{
		StExt_PrintDebug("StExt_PcDebuffSelector()", "Instance is null!", StExt_Self, StExt_Other);
		return false;
	};
	if(c_npcisdown(StExt_Self)) { return false; };
	if (StExt_IsHeroPatryNpc(StExt_Self)) { return false; };
	return StExt_NpcsIsEnemies(hero, StExt_Self);
};

func int StExt_FxDamageCanBeApplied_Script(var c_npc atk, var c_npc target)
{
	var int temp_attitude;
    var int perm_attitude;
	if(!hlp_isvalidnpc(target) || !hlp_isvalidnpc(atk))
	{
		StExt_PrintDebug("StExt_FxDamageCanBeApplied_Script()", "Instance is null!", target, atk);
		return true;
	};
	return StExt_NpcsIsEnemies(atk, target);
};

// Mostly for spellFx effects, wich have not id
func int StExt_FxDamageCanBeApplied()
{
	if(!hlp_isvalidnpc(StExt_TargetNpc) || !hlp_isvalidnpc(StExt_AttackNpc))
	{
		StExt_PrintDebug("StExt_FxDamageCanBeApplied()", "Instance is null!", StExt_TargetNpc, StExt_AttackNpc);
		return true;
	};	
	return StExt_FxDamageCanBeApplied_Script(StExt_AttackNpc, StExt_TargetNpc);
};


func int StExt_CheckDamageActors(var string funcName)
{
	var int result;	result = true;
	
	if (Hlp_IsNULL(StExt_AttackNpc) || !hlp_isvalidnpc(StExt_AttackNpc)) {
		StExt_PrintDebug(funcName, "Atk instance is null!", StExt_AttackNpc, StExt_TargetNpc);
		result = false;
	}
	else if (hlp_getinstanceid(StExt_AttackNpc) == StExt_Null) {
		StExt_PrintDebug(funcName, "Atk instance id null!", StExt_AttackNpc, StExt_TargetNpc);
		result = false;
	};
	
	if (Hlp_IsNULL(StExt_TargetNpc) || !hlp_isvalidnpc(StExt_TargetNpc)) {
		StExt_PrintDebug(funcName, "Target instance is null!", StExt_AttackNpc, StExt_TargetNpc);
		result = false;
	}
	else if (hlp_getinstanceid(StExt_TargetNpc) == StExt_Null) {
		StExt_PrintDebug(funcName, "Target instance id null!", StExt_AttackNpc, StExt_TargetNpc);
		result = false;
	};	
	return result;
};


func int StExt_GetDamageMult(var c_npc slf)
{
	var int damageMult; damageMult = 100;
	if (npc_isplayer(slf)) { damageMult = 100; }
	else if (StExt_IsSummonOrTotem(slf)) { damageMult = StExt_Config_Sum_GlobalDamMult; }
	else if (StExt_Npc_IsSummoned(slf)) { damageMult = StExt_Config_NpcSum_GlobalDamMult; }
	else { damageMult = StExt_Config_Npc_GlobalDamMult; };
	return damageMult;
};

func int StExt_GetSummonDamageMult(var c_npc slf)
{
	var int result; result = 0;
	var int sumType; sumType = StExt_GetSummonType(slf);
	var int sumGolType; sumType = StExt_GetSummonGolemType(slf);	
	
	result += StExt_PcStats[StExt_PcStats_Index_SumDamagePower] + (countlearnspell * 5);
	if (sumType == StExt_SummonType_Beast) { result += StExt_PcStats[StExt_PcStats_Index_SumAnimalDamagePower] + StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]; };
	if (sumType == StExt_SummonType_Golem) 
	{ 
		result += StExt_PcStats[StExt_PcStats_Index_SumGolemDamagePower] + StExt_PcStats[StExt_PcStats_Index_GolemMasteryPower];
		if (sumGolType == StExt_SummonGolemType_Stone) { result += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Fire) { result += StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Ice)	{ result += StExt_PcStats[StExt_PcStats_Index_IceMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Magic) { result += StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Swamp) { result += StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Wood) { result += StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Air) { result += StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Bone) { result += StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower]; }
		else if (sumGolType == StExt_SummonGolemType_Electric) { result += StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower]; };
	};
	if (sumType == StExt_SummonType_Demon) { result += StExt_PcStats[StExt_PcStats_Index_SumDemonDamagePower] + StExt_PcStats[StExt_PcStats_Index_DemonMasteryPower]; };
	if (sumType == StExt_SummonType_Undead) { result += StExt_PcStats[StExt_PcStats_Index_SumUndeadDamagePower] + StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower]; };
	if (sumType == StExt_SummonType_Totem) { result += StExt_PcStats[StExt_PcStats_Index_ShamanMasteryPower]; };
	if (sumType == StExt_SummonType_Holly) { result += StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]; };
	
	return result;
};

func int StExt_Npc_CalcAblityDamage(var c_npc slf)
{
	var int level;
	var int tier;
	var int damageMult;
	var int result;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_CalcAblityDamage(...)", "slf instance is null!", slf, other);
		return StExt_Null; 
	};
	
	damageMult = 0;
	level = 1 + slf.level;
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	result = StExt_MinDamage + hlp_random((tier * 10) + level) + level + (tier * 5);
	result += StExt_GetNpcVar(slf, StExt_AiVar_ExtraMagicDamage);
	
	if (npc_isplayer(slf))
	{
		result += StExt_PcStats[StExt_PcStats_Index_ExtraDamage] + StExt_PcStats[StExt_PcStats_Index_ExtraSpellDam] + StExt_PcStats[StExt_PcStats_Index_ExtraWeaponSkillDam];
		result += StExt_GetPermilleFromValue(result ,StExt_PcStats[StExt_PcStats_Index_ExtraDamagePerc] + 
			StExt_PcStats[StExt_PcStats_Index_ExtraSpellDamPerc] + StExt_PcStats[StExt_PcStats_Index_ExtraWeaponSkillDamPerc]);
	}
	else if (StExt_IsSummonOrTotem(slf))
	{
		damageMult += StExt_GetSummonDamageMult(slf);
		result += (hero.level * 5) + (atr_intellect + 1) / 2;
		result += StExt_GetPermilleFromValue(result, damageMult);
		result += StExt_PcStats[StExt_PcStats_Index_SumExtraDamage];
	}
	else
	{
		if (rx_monsterpower > 100) { result += StExt_GetPercentFromValue(result, rx_monsterpower - 100); };
		if (tier > 0) { result += StExt_GetPermilleFromValue(result, tier * (100 + hlp_random(50))); };		
	};
	
	damageMult = StExt_GetDamageMult(slf);
	result = StExt_GetPercentFromValue(result, damageMult);
	result = StExt_ValidateValueRange(result, StExt_MinDamage, StExt_Npc_ExtraDamage_HardCap);
	return result;
};

func int StExt_Npc_CalcExtraDamage(var c_npc slf)
{
	var int level;
	var int tier;
	var int damageMult;
	var int result;
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_Npc_CalcExtraDamage()", "slf instance is null!", slf, other);
		return StExt_Null; 
	};
	
	damageMult = 0;
	level = 1 + slf.level;
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);	
	result = StExt_MinDamage + hlp_random((tier * 15) + level + 5) + level + (tier * 25);
	if (tier > 0) { result += StExt_GetPercentFromValue(result, StExt_GetRandomRange(tier * 5, tier * 15)); };

	if (StExt_IsSummonOrTotem(slf))
	{
		result += StExt_GetRandomRange(25, 50) + (hero.level * 5);
		damageMult += StExt_GetSummonDamageMult(slf);
		result += StExt_GetPermilleFromValue(result, damageMult);
		result += StExt_PcStats[StExt_PcStats_Index_SumExtraDamage];
	}
	else if (rx_monsterpower > 100) {
		result += StExt_GetPercentFromValue(result, rx_monsterpower - 100);
	};
	
	damageMult = StExt_GetDamageMult(slf);
	result = StExt_GetPercentFromValue(result, damageMult);
	result = StExt_ValidateValueRange(result, StExt_MinDamage, StExt_Npc_ExtraDamage_HardCap);
	return result;
};

func int StExt_Npc_CalcSpellDamage(var c_npc slf)
{
	var int level;
	var int tier;
	var int damageMult;
	var int result;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_Npc_CalcSpellDamage()", "slf instance is null!", slf, other);
		return StExt_Null; 
	};
	damageMult = 0;
	level = 1 + slf.level;
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	result = StExt_MinDamage + hlp_random((tier * 10) + level) + (level / 2);
	if (tier > 0) { result += StExt_GetPercentFromValue(result, StExt_GetRandomRange(tier * 5, tier * 15)); };

	if (npc_isplayer(slf))
	{
		result += atr_intellect + StExt_GetPercentFromValue(atr_intellect, hlp_random(10) + countlearnspell);
		result += StExt_PcStats[StExt_PcStats_Index_ExtraSpellDam];		
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Archmage)) { StExt_ExtraDamageInfo.Damage += (hero.attribute[2] + 1) / 2; };
		result += StExt_GetPermilleFromValue(result, StExt_PcStats[StExt_PcStats_Index_ExtraSpellDamPerc]);
		return result;
	}
	else if (StExt_IsSummonOrTotem(slf))
	{
		damageMult += StExt_PcStats[StExt_PcStats_Index_SumDamagePower] + StExt_GetNpcVar(slf, StExt_AiVar_ExtraMagicDamage);
		if (StExt_IsSummonUndead(slf)) { damageMult += StExt_PcStats[StExt_PcStats_Index_SumUndeadDamagePower]; };
		if (StExt_IsSummonAnimal(slf)) { damageMult += StExt_PcStats[StExt_PcStats_Index_SumAnimalDamagePower]; };
		if (StExt_IsSummonGolem(slf)) { damageMult += StExt_PcStats[StExt_PcStats_Index_SumGolemDamagePower]; };
		if (StExt_IsSummonDemon(slf)) { damageMult += StExt_PcStats[StExt_PcStats_Index_SumDemonDamagePower]; };

		result += (atr_intellect + StExt_MinDamage + StExt_GetPercentFromValue(atr_intellect, hlp_random(10) + countlearnspell)) / 2;
		result += StExt_GetPermilleFromValue(result, damageMult);
		result += StExt_PcStats[StExt_PcStats_Index_SumExtraDamage];
	}
	else 
	{
		damageMult = rx_getnpcvar(slf, aivrx_spelldamagescale);
		result += level + StExt_GetNpcVar(slf, StExt_AiVar_ExtraMagicDamage);		
		if (rx_monsterpower > 100) { damageMult += rx_monsterpower - 100; };		
		result += StExt_GetPercentFromValue(result, damageMult);
	};
	
	damageMult = StExt_GetDamageMult(slf);
	result = StExt_GetPercentFromValue(result, damageMult);
	result = StExt_ValidateValueRange(result, StExt_MinDamage, StExt_Npc_ExtraDamage_HardCap);
	return result;
};

func int StExt_Npc_CalcOnDeathDamage(var c_npc slf)
{
	var int dmg;
	var int dmgCap;
	var int dmgMult;
	var int tier;
	var int level;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_CalcOnDeathDamage()", "slf instance is null!", slf, other);
		return 0; 
	};

	dmgCap = StExt_Npc_OnDeadDamage_Cap;
	if (StExt_IsSummonOrTotem(slf))	{ dmgMult = 10 + ((hero.level + 1) / 5); }
	else
	{
		level = StExt_ValidateValueRange(1 + slf.level, 1, 1000);
		tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
		dmgMult = 3 + (tier * 3) + StExt_ValidateValueRange(level / 10, 1, 10);
		if (rx_monsterpower > 100) 
		{ 
			dmgMult += StExt_GetPercentFromValue(dmgMult, rx_monsterpower - 100);
			dmgCap += StExt_GetPercentFromValue(dmgCap, rx_monsterpower - 100); 
		};
	};
	
	dmg = StExt_GetPercentFromValue(slf.attribute[atr_hitpoints_max], dmgMult);
	dmg += level * 5;
	dmg = StExt_ValidateValueRange(dmg, StExt_NpcAbility_OnDeath_Aoe_Damage, dmgCap);
	return dmg;
};


func int StExt_CalcAoeDistance(var c_npc slf, var int flags)
{
	var int result; result = StExt_NpcAoeDistance_Min;
	var int bonus; bonus = 0;
	var int max; max = StExt_NpcAoeDistance_Max;
	var int tier; tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	
	if (StExt_ValueHasFlag(flags, StExt_DamageFlag_Aoe) || StExt_ValueHasFlag(flags, StExt_DamageFlag_Chain)) {
		result = StExt_NpcAoeDistance_Min * 4;
	}
	else { max = max / 3; };
	
	if (StExt_IsSummonOrHero(slf))
	{
		bonus += (atr_intellect + 1) / 5;
		if (!npc_isplayer(slf)) { bonus = (bonus + 1) / 2; };
	}	
	else 
	{ 
		result += StExt_NpcAoeDistance_Min + (slf.level * 2) + (tier * 75);
		max += tier * 100;
	};	
	
	if (StExt_ValueHasFlag(flags, StExt_DamageFlag_Target) || StExt_ValueHasFlag(flags, StExt_DamageFlag_Single)) 
	{ 
		result = StExt_GetPercentFromValue(result, 35);
		max = StExt_GetPercentFromValue(result, 50);
	};
	
	result += bonus;
	result = StExt_ValidateValueRange(result, StExt_NpcAoeDistance_Min, max);
	return result;
};

func int StExt_CalcAoeTargets(var c_npc slf, var int flags, var int extraTargets)
{
	var int result; result = 1 + extraTargets;
	var int bonus; bonus = 0;
	if (StExt_IsSummonOrHero(slf))
	{
		bonus += 1 + (atr_intellect + 100) / 250;
		if (!npc_isplayer(slf)) { bonus = (bonus + 1) / 2; };
	};
	
	if (StExt_ValueHasFlag(flags, StExt_DamageFlag_Aoe)) { result += StExt_AoeTargetsBase; }
	else if (StExt_ValueHasFlag(flags, StExt_DamageFlag_Chain)) { result += StExt_ChainTargetsBase; };	
	result += bonus;
	return result;
};

func int StExt_CalcDamage(var int prot, var int damage)
{
	var int result;
	if (prot <= immune || damage <= 0) { return 0; };	
	result = damage - prot;
	if (result <= 0) { result = StExt_MinDamage; };
	return result;
};

func int StExt_ApplyResist(var int damage, var int resist)
{
	var int result;
	if ((damage <= 0) || (resist <= 0)) { return 0; };
	if (resist > StExt_Resists_HardCap) { resist = StExt_Resists_HardCap; };
	return StExt_GetPermilleFromValue(damage, resist);
};

func int StExt_CalcDamageReduction(var int reductionStat, var int incomingDamage)
{
	if ((reductionStat <= 0) || (incomingDamage <= 0)) { return 0; };
	if (reductionStat < incomingDamage) { return reductionStat; };
	return incomingDamage;
};

func int StExt_CalcTotalDotDamageInExtraDamageInfo(var C_ExtraDamageInfo damageInfo)
{
	if (Hlp_IsNULL(damageInfo)) {
		StExt_PrintDebugStack("StExt_CalcTotalDotDamageInExtraDamageInfo() - damageInfo is null!");
		return 0;
	};	
	return damageInfo.DotDamage[0] + damageInfo.DotDamage[1] + damageInfo.DotDamage[2] + damageInfo.DotDamage[3] + damageInfo.DotDamage[4] + 
		damageInfo.DotDamage[5] + damageInfo.DotDamage[6] + damageInfo.DotDamage[7];
};

func int StExt_CalcTotalDamageInExtraDamageInfo(var C_ExtraDamageInfo damageInfo)
{
	if (Hlp_IsNULL(damageInfo))	{
		StExt_PrintDebugStack("StExt_CalcTotalDamageInExtraDamageInfo() - damageInfo is null!");
		return 0;
	};	
	return damageInfo.Damage[0] + damageInfo.Damage[1] + damageInfo.Damage[2] + damageInfo.Damage[3] + damageInfo.Damage[4] + 
		damageInfo.Damage[5] + damageInfo.Damage[6] + damageInfo.Damage[7];
};

func int StExt_CalcRealDamageFallback(var c_npc slf, var c_item weap, var int damageType, var int damageFlags)
{
	var int result; result = StExt_MinDamage;
	var int damTotal; damTotal = StExt_MinDamage;
	var int damagePerc; damagePerc = 100;
	var int skipWeapon; skipWeapon = false;

	if (!hlp_isvalidnpc(slf)) { return result; };
	
	if (npc_isplayer(slf))
	{
		if ((StExt_MeeleDamageInfo > StExt_MinDamage) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Melee)) { 
			damTotal += StExt_MeeleDamageInfo;
			damagePerc -= 25;
		};	
		if ((StExt_RangeDamageInfo > StExt_MinDamage) && StExt_ValueHasFlag(DamageType, StExt_DamageType_Range)) 
		{ 
			damTotal += StExt_RangeDamageInfo;
			damagePerc -= 25;
		};	
		if ((StExt_RuneDamageInfo > StExt_MinDamage) && (StExt_ValueHasFlag(DamageType, StExt_DamageType_Spell) || StExt_ValueHasFlag(DamageType, StExt_DamageType_Ability)))
		{
			damTotal += StExt_RuneDamageInfo;
			damagePerc -= 25;
		};
		
		if (damagePerc < 100) 
		{ 
			result += StExt_GetPercentFromValue(damTotal, damagePerc);
			skipWeapon = true;
		}
		else
		{
			damagePerc = 50;
			damTotal = slf.attribute[4] + slf.attribute[5] + atr_intellect;
			result += StExt_GetPercentFromValue(damTotal, damagePerc);
		};
	}
	else
	{
		damagePerc = 75;
		damTotal = slf.attribute[4] + slf.attribute[5];
		result += StExt_GetPercentFromValue(damTotal, damagePerc);
	};
	
	if (c_npcishuman(slf) && hlp_isvaliditem(weap) && !skipWeapon) { result += StExt_CalcWeaponTotalDamage(weap); };

	result = StExt_GetPercentFromValue(result, StExt_GetDamageMult(slf));
	return StExt_ValidateValueMin(result, StExt_MinDamage);
};


func int StExt_GetDamageFlags(var c_npc atk, var c_npc target, var c_item weap, var int spellId)
{
	var int result;
	result = 0;
	
	if ((spellId > 0) && (spellId <= max_spell)) { result = result | StExt_GetSpellEffectFlags(spellId); }	
	else if ((spellId > 0) && (spellId > StExt_AbilityPrefix) && (spellId < (StExt_AbilityPrefix + max_spell))) {
		result = result | StExt_GetSpellEffectFlags(spellId - StExt_AbilityPrefix);
	}
	else if (hlp_isvalidnpc(atk))
	{
		spellId = StExt_Null;
		if (npc_isdrawingspell(atk) > 0) { spellId = npc_isdrawingspell(atk); }
		else if (npc_getactivespell(atk) > 0) { spellId = npc_getactivespell(atk); };		
		if (spellId > 0) { result = result | StExt_GetSpellEffectFlags(spellId); };
	};
	
	if (hlp_isvalidnpc(atk)) 
	{
		if (npc_isplayer(atk) && StExt_HeroIsTransformed()) { result = result | StExt_DamageFlag_Transform; };
		if (StExt_IsSummonOrTotem(atk)) { result = result | StExt_DamageFlag_Summon; };
		if (StExt_IsSummonOrTotem(atk) && rx_istotemnpc(atk)) { result = result | StExt_DamageFlag_Totem; };
	};
	if (hlp_isvalidnpc(target))
	{
		if (StExt_IsGolem(target)) { result = result | StExt_DamageFlag_Golem; };
		if (c_npcisevil(target)) { result = result | StExt_DamageFlag_Demon; };
		if (c_npcisundead(target)) { result = result | StExt_DamageFlag_Undead; };
		if (rx_isanimal(target)) { result = result | StExt_DamageFlag_Animal; };
		if (c_npcisorc(target)) { result = result | StExt_DamageFlag_Orc; };
		if (c_npcishuman(target)) { result = result | StExt_DamageFlag_Human; };
	};	
	return result;
};

func int StExt_GetDamageType(var c_npc atk, var c_npc target, var c_item weap, var int spellId)
{
	var int result;
	var int summonType;
	var int summonSubType;
	result = 0;
	
	// detect ability
	if ((spellId > 0) && (spellId < max_spell))
	{ 
		result = result | StExt_DamageType_Spell;
		result = result | StExt_GetSpellDamageFlags(spellId);
	}	
	else if ((spellId > 0) && (spellId > StExt_AbilityPrefix) && (spellId < (StExt_AbilityPrefix + max_spell))) 
	{
		result = result | StExt_DamageType_Ability;
		result = result | StExt_GetSpellDamageFlags(spellId - StExt_AbilityPrefix);
	}
	else if (hlp_isvalidnpc(atk))
	{
		spellId = StExt_Null;
		if (npc_isdrawingspell(atk) > 0) { spellId = npc_isdrawingspell(atk); }
		else if ((spellId <= 0) && (npc_getactivespell(atk) > 0)) { spellId = npc_getactivespell(atk); };		
		if (spellId > 0) { result = result | StExt_DamageType_Spell | StExt_GetSpellDamageFlags(spellId); };
	};
	
	if (hlp_isvalidnpc(atk))
	{
		if (npc_isinfightmode(atk, fmode_fist) || npc_isinfightmode(atk, fmode_melee) || npc_isinfightmode(atk, fmode_1h) || npc_isinfightmode(atk, fmode_2h)) { result = result | StExt_DamageType_Melee; }
		else if (npc_isinfightmode(atk, fmode_far) || npc_isinfightmode(atk, fmode_bow) || npc_isinfightmode(atk, fmode_crossbow)) { result = result | StExt_DamageType_Range; }
		else if (npc_isinfightmode(atk, fmode_magic)) { result = result | StExt_DamageType_Spell; };
		
		//
		if (npc_isplayer(atk))
		{
			if (StExt_HeroIsTransformed()) { result = result | StExt_DamageType_Life; };
			
			if (StExt_ElementAffinity_Fire) { result = result | StExt_DamageType_Fire; };
			if (StExt_ElementAffinity_Ice) { result = result | StExt_DamageType_Ice; };
			if (StExt_ElementAffinity_Electric) { result = result | StExt_DamageType_Electric; };
			if (StExt_ElementAffinity_Air) { result = result | StExt_DamageType_Air; };
			if (StExt_ElementAffinity_Earth) { result = result | StExt_DamageType_Earth; };
			if (StExt_ElementAffinity_Light) { result = result | StExt_DamageType_Light; };
			if (StExt_ElementAffinity_Dark) { result = result | StExt_DamageType_Dark; };
			if (StExt_ElementAffinity_Death) { result = result | StExt_DamageType_Death; };
			if (StExt_ElementAffinity_Life) { result = result | StExt_DamageType_Life; };			
			if (StExt_ElementAffinity_Shaman) { result = result | StExt_DamageType_True; };
			if (StExt_ElementAffinity_Blood) { result = result | StExt_DamageType_Blood; };
		}
		else if (StExt_IsSummonOrTotem(atk))
		{
			summonType = StExt_GetSummonType(atk);
			summonSubType = StExt_Null;
			
			if (summonType == StExt_SummonType_Golem) 
			{ 
				summonSubType = StExt_GetSummonGolemType(atk);
				result = result | StExt_DamageType_Golem;
				if (summonSubType == StExt_SummonGolemType_Stone) { result = result | StExt_DamageType_Earth; }
				else if (summonSubType == StExt_SummonGolemType_Fire) { result = result | StExt_DamageType_Fire; }
				else if (summonSubType == StExt_SummonGolemType_Ice) { result = result | StExt_DamageType_Ice; }
				else if (summonSubType == StExt_SummonGolemType_Magic) { result = result | StExt_DamageType_Dark; }
				else if (summonSubType == StExt_SummonGolemType_Swamp) { result = result | StExt_DamageType_Earth; }
				else if (summonSubType == StExt_SummonGolemType_Wood) { result = result | StExt_DamageType_Life; }
				else if (summonSubType == StExt_SummonGolemType_Air) { result = result | StExt_DamageType_Air; }
				else if (summonSubType == StExt_SummonGolemType_Bone) { result = result | StExt_DamageType_Necro; }
				else if (summonSubType == StExt_SummonGolemType_Electric) { result = result | StExt_DamageType_Electric; };
			};
			if (summonType == StExt_SummonType_Demon) { result = result | StExt_DamageType_Demon; };
			if (summonType == StExt_SummonType_Undead) { result = result | StExt_DamageType_Necro; };
			if (summonType == StExt_SummonType_Beast) { result = result | StExt_DamageType_Life; };
			if (summonType == StExt_SummonType_Totem) { result = result | StExt_DamageType_True; };
			if (summonType == StExt_SummonType_Holly) { result = result | StExt_DamageType_Light; };
		};
		
		if (!Hlp_IsNULL(StExt_DamageInfo))
		{
			if (StExt_DamageInfo.Damage[dam_index_fly] > 0) { result = result | StExt_DamageType_Air; };
			if (StExt_DamageInfo.Damage[dam_index_fire] > 0) { result = result | StExt_DamageType_Fire; };
			if (StExt_DamageInfo.Damage[dam_index_fall] > 0) { result = result | StExt_DamageType_Poision; };
		};
	};
	return result;
};


func int StExt_Npc_CalcDotDuration(var c_npc slf)
{
	var int ticks;
	if (StExt_IsSummonOrHero(slf))
	{
		ticks = 3 + StExt_PcStats[StExt_PcStats_Index_DotExtraTick];
		ticks += StExt_GetPermilleFromValue(ticks, StExt_PcStats[StExt_PcStats_Index_EffectDuration]);
	}
	else
	{
		ticks = 2 + ((StExt_Npc_IsRandomized(slf) + 1) / 2);
		ticks += StExt_GetNpcVar(slf, StExt_AiVar_ExtraDotTicks);
	};
	return ticks;
};

func int StExt_CalcDotDuration(var int ticksNow, var int addTicks)
{
	if (addTicks > ticksNow) { return addTicks; };
	if (addTicks > 0) { ticksNow += 1; };
    return StExt_ValidateValueRange(ticksNow, 1, StExt_MaxDotTime);
};

func int StExt_CalcDotDamage(var int damageNow, var int addDamage)
{
	if (damageNow < 0) { damageNow = 0; };
    if (addDamage < 0) { addDamage = 0; };
	
	if (addDamage <= 0) { return damageNow; };
    if (damageNow <= 0) { return addDamage; };
	if (addDamage <= damageNow) { return damageNow; };
	
    damageNow = (damageNow + addDamage + StExt_MinDamage) / 2;
    return StExt_ValidateValueMin(damageNow, StExt_MinDamage);
};

func void StExt_AddDotDamageToExtraDamageInfo(var C_ExtraDamageInfo damageInfo, var int ticks, var int damage, var int damIndex)
{
	if (Hlp_IsNULL(damageInfo))	{ StExt_PrintDebugStack("StExt_AddDotDamageToExtraDamageInfo() - damageInfo is null!"); return; };
	if ((damage <= 0) || (ticks <= 0)) { return; };
	
	if (damIndex == dam_index_barrier) {
		damageInfo.DotDamage += damage;
		damageInfo.Ticks = StExt_CalcDotDuration(damageInfo.Ticks, ticks);
	}
	else if (damIndex == dam_index_blunt) {
		damageInfo.DotDamage[dam_index_blunt] += damage;
		damageInfo.Ticks[dam_index_blunt] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_blunt], ticks);
	}
	else if (damIndex == dam_index_edge) {
		damageInfo.DotDamage[dam_index_edge] += damage;
		damageInfo.Ticks[dam_index_edge] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_edge], ticks);
	}
	else if (damIndex == dam_index_fire) {
		damageInfo.DotDamage[dam_index_fire] += damage;
		damageInfo.Ticks[dam_index_fire] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_fire], ticks);
	}
	else if (damIndex == dam_index_fly) {
		damageInfo.DotDamage[dam_index_fly] += damage;
		damageInfo.Ticks[dam_index_fly] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_fly], ticks);
	}
	else if (damIndex == dam_index_point) {
		damageInfo.DotDamage[dam_index_point] += damage;
		damageInfo.Ticks[dam_index_point] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_point], ticks);
	}
	else if (damIndex == dam_index_magic) {
		damageInfo.DotDamage[dam_index_magic] += damage;
		damageInfo.Ticks[dam_index_magic] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_magic], ticks);
	}
	else if (damIndex == dam_index_fall) {
		damageInfo.DotDamage[dam_index_fall] += damage;
		damageInfo.Ticks[dam_index_fall] = StExt_CalcDotDuration(damageInfo.Ticks[dam_index_fall], ticks);
	}
	else { StExt_PrintDebugStack("StExt_AddDotDamageToExtraDamageInfo() - damIndex is invalid!"); };
};


func void StExt_RecouperateHp(var c_npc target, var int amount)
{
	if (!hlp_isvalidnpc(target)) { return; };
	if (c_npcisdown(target) || (amount <= 0)) { return; };
	target.attribute[atr_hitpoints] = StExt_ValidateValueRange(target.attribute[atr_hitpoints] + amount, 0, target.attribute[atr_hitpoints_max]);
};

func void StExt_RecouperateMp(var c_npc target, var int amount)
{
	if (!hlp_isvalidnpc(target)) { return; };
	if (c_npcisdown(target) || (amount <= 0)) { return; };
	target.attribute[atr_mana] = StExt_ValidateValueRange(target.attribute[atr_mana] + amount, 0, target.attribute[atr_mana_max]);
};

func void StExt_RecouperateEs(var c_npc target, var int amount)
{
	if (!hlp_isvalidnpc(target)) { return; };
	if (c_npcisdown(target) || (amount <= 0) || StExt_Npc_GetMaxEs(target) <= 0) { return; };
	StExt_Npc_ChangeEs(target, amount);
};

func void StExt_RecouperateSt(var c_npc target, var int amount)
{
	if (!hlp_isvalidnpc(target)) { return; };
	if (c_npcisdown(target) || (amount <= 0) || !npc_isplayer(target)) { return; };
	rx_restorestamina(amount);
};


func int StExt_ApplyLifeSteal(var c_npc atk, var c_npc target, var int hpDrain)
{
	var int hpDrainMax;	
	if (!hlp_isvalidnpc(target) || !hlp_isvalidnpc(atk)) { return 0; };
	if (c_npcisdown(atk) || (hpDrain <= 0)) { return 0; };

	if (c_npcisdown(target)) { hpDrainMax = target.attribute[atr_hitpoints]; }
	else { hpDrainMax = target.attribute[atr_hitpoints] - 5; };
	
	if (hpDrainMax <= 0) { return 0; };
	if (hpDrain > hpDrainMax) { hpDrain = hpDrainMax; };	
	rx_restorehealth(atk, hpDrain);
	return hpDrain;
};

func int StExt_ApplyManaSteal(var c_npc atk, var c_npc target, var int manaDrain)
{
	var int manaDrainMax;
	if (!hlp_isvalidnpc(target) || !hlp_isvalidnpc(atk)) { return 0; };
	if (c_npcisdown(atk) || (manaDrain <= 0)) { return 0; };
	
	manaDrainMax = target.attribute[atr_mana] - 1;
	if (manaDrainMax <= 0) { return 0; };
	if (manaDrain > manaDrainMax) { manaDrain = manaDrainMax; };
	
	if (npc_isplayer(target)) { target.attribute[atr_mana] = StExt_ValidateValueRange(target.attribute[atr_mana] - manaDrain, 0, target.attribute[atr_mana_max]); }
	else if (npc_isplayer(atk)) { atk.attribute[atr_mana] = StExt_ValidateValueRange(atk.attribute[atr_mana] + manaDrain, 0, atk.attribute[atr_mana_max]); };
	return manaDrain;
};

func int StExt_ApplyEsSteal(var c_npc atk, var c_npc target, var int amount)
{
    var int targetEs;
    var int targetMaxEs;
    var int atkMaxEs;

    if (!hlp_isvalidnpc(target) || !hlp_isvalidnpc(atk)) { return 0; };
    if (c_npcisdown(atk) || c_npcisdown(target)) { return 0; };
    if (amount <= 0) { return 0; };

    targetMaxEs = StExt_Npc_GetMaxEs(target);
    atkMaxEs = StExt_Npc_GetMaxEs(atk);
    if (targetMaxEs <= 0 || atkMaxEs <= 0) { return 0; };

    targetEs = StExt_Npc_GetCurEs(target);
    if (targetEs <= 0) { return 0; };
    if (amount > targetEs) { amount = targetEs; };

    StExt_Npc_ChangeEs(target, -amount);
    StExt_Npc_ChangeEs(atk, amount);
    return amount;
};

func int StExt_ApplyStamSteal(var c_npc atk, var c_npc target, var int amount)
{
	if (!hlp_isvalidnpc(target) || !hlp_isvalidnpc(atk)) { return 0; };
	if (c_npcisdown(atk) || (amount <= 0)) { return 0; };
	if (npc_isplayer(atk)) { rx_restorestamina(amount); }
	else if (npc_isplayer(target)) { rx_restorestamina(-amount); };
	return amount;
};

// Check if incoming damage dodged
func int StExt_ApplyDodgeChance(var c_npc slf, var c_npc atk)
{
	var int dodgeChance;
	var int hitChance;
	var int hitChancePerc;

	dodgeChance = StExt_GetNpcVar(slf, StExt_AiVar_DodgeChance);	
	hitChance = 5 + StExt_GetPermilleFromValue(atk.attribute[atr_dexterity], 250);
	hitChancePerc = 0;
	
	if (npc_isinfightmode(atk, fmode_fist)) { hitChance += atk.hitchance[0] + hlp_random(100); }
	else if (npc_isinfightmode(atk, fmode_1h)) { hitChance += atk.hitchance[npc_talent_1h]; }
	else if (npc_isinfightmode(atk, fmode_2h)) { hitChance += atk.hitchance[npc_talent_2h]; }
	else if (npc_isinfightmode(atk, fmode_bow)) { hitChance += atk.hitchance[npc_talent_bow]; }
	else if (npc_isinfightmode(atk, fmode_crossbow)) { hitChance += atk.hitchance[npc_talent_crossbow]; }
	
	if (npc_isplayer(atk)) 
	{ 
		hitChance += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_AimChance);
		hitChancePerc += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_AimChancePerc);
	}
	else if (StExt_IsSummonOrTotem(atk)) 
	{ 
		hitChance += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SummonAimChance);
		hitChancePerc += StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_SummonAimChancePerc);
	}
	else
	{
		hitChance += StExt_GetNpcVar(atk, StExt_AiVar_ExtraAimChance);
	};
	if (hitChancePerc > 0) { hitChance += StExt_GetPermilleFromValue(hitChance, hitChancePerc); }; 
	
	// kind of normalization
	if (hitChance >= dodgeChance) { hitChance = dodgeChance - StExt_GetPermilleFromValue(dodgeChance, 50); };

	dodgeChance = dodgeChance - hitChance;
	dodgeChance = StExt_ValidateValueRange(dodgeChance, 0, StExt_Dodge_HardCap);
	if (StExt_Chance(dodgeChance)) { return true; };
	return false;
};


//*********************************************************************************************************************

func int StExt_StunTarget(var c_npc target, var c_npc atk, var int chance)
{
	var int time;
	if (!hlp_isvalidnpc(target)) { return false; };
	if (c_npcisdown(target) || (chance <= 0)) { return false; };
	if (chance > StExt_StunChance_HardCap) { chance = StExt_StunChance_HardCap; };
	
	if (StExt_Chance(chance))
	{
		time = 1 + hlp_random(2);
		if (StExt_IsSummonOrHero(atk)) { time += StExt_GetPermilleFromValue(time, StExt_PcStats[StExt_PcStats_Index_EffectDuration]); };
		if (npc_isplayer(target)) { StExt_HeroStuned = time * (20 + hlp_random(10)); }
		else { rx_stuntarget(target, time); };
		return true;
	};
	return false;
};

func int StExt_RootTarget(var c_npc target, var c_npc atk, var int chance)
{
	var int time;
	if (!hlp_isvalidnpc(target)) { return false; };
	if (c_npcisdown(target) || (chance <= 0)) { return false; };
	if (chance > StExt_StunChance_HardCap) { chance = StExt_StunChance_HardCap; };
	
	if (StExt_Chance(chance))
	{
		time = 1 + hlp_random(2);
		if (StExt_IsSummonOrHero(atk)) { time += StExt_GetPermilleFromValue(time, StExt_PcStats[StExt_PcStats_Index_EffectDuration]); };
		if (npc_isplayer(target)) { StExt_HeroStuned = time * (20 + hlp_random(10)); }
		else { rx_stuntarget(target, time); };
		
		rx_playeffect("SPELLFX_GREENTENTACLE_TARGET", target);
		return true;
	};
	return false;
};

func int StExt_FreezeTarget(var c_npc target, var c_npc atk, var int chance)
{
	var int time;
	if (!hlp_isvalidnpc(target)) { return false; };
	if (c_npcisdown(target) || (chance <= 0)) { return false; };
	if (chance > StExt_StunChance_HardCap) { chance = StExt_StunChance_HardCap; };
	
	if (StExt_Chance(chance))
	{
		rx_playeffect("SPELLFX_ICECUBE", target);
		rx_playeffect("SPELLFX_ICECUBE_COLLIDE", target);
		
		time = 1 + hlp_random(2);
		if (StExt_IsSummonOrHero(atk)) { time += StExt_GetPermilleFromValue(time, StExt_PcStats[StExt_PcStats_Index_EffectDuration]); };
		if (npc_isplayer(target)) {	StExt_HeroStuned = time * (20 + hlp_random(10)); }
		else { ast_freezenpc(target, time, 0); };
		return true;
	};
	return false;
};


// ----------------------------------------------------------------------------------------------

func int StExt_ShouldHandleMadWhirlwind(var c_npc atk, var c_npc target)
{
	if (StExt_Damage_MadWhirlwindSplashInUse) { return false; };
	if (!npc_isplayer(atk)) { return false; };
	if (!hlp_isvalidnpc(target)) { return false; };
	if (!StExt_ValueHasFlag(StExt_DamageInfo.DamageType, StExt_DamageType_Melee)) { return false; };
	return StExt_IsMasteryPerkLearned(StExt_MasteryIndex_MartialArts, StExt_MasteryPerkIndex_MartialArts_MadWhirlwind);
};

func int StExt_MadWhirlwindSplashSelector()
{
	if (!hlp_isvalidnpc(StExt_Other)) { return false; };
	if (StExt_GetNpcUid(StExt_Other) == StExt_Damage_MadWhirlwindSkipTargetUid) { return false; };
	return StExt_NpcsIsEnemies(StExt_Self, StExt_Other);
};

func void StExt_ApplyMadWhirlwindSplash(var c_npc atk, var c_npc target)
{
	var C_ExtraDamageInfo desc;
	var int totalDamage;
	var int maxTargets;

	if (!StExt_ShouldHandleMadWhirlwind(atk, target)) { return; };

	maxTargets = StExt_CalcAoeTargets(atk, StExt_DamageInfo.DamageFlags | StExt_DamageFlag_Aoe, 0) - 1;
	if (maxTargets <= 0) { return; };

	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };

	StExt_InitializeScriptDamageDesc(desc);
	totalDamage = StExt_DamageInfo.TotalDamage;
	if (totalDamage <= StExt_MinDamage) { totalDamage = StExt_DamageInfo.RealDamage; };
	if (totalDamage <= StExt_MinDamage) { totalDamage = StExt_CalcRealDamageFallback(atk, StExt_AttackWeapon, StExt_DamageInfo.DamageType, StExt_DamageInfo.DamageFlags); };
	if (totalDamage <= StExt_MinDamage) { totalDamage = StExt_MinDamage; };

	desc.TotalDamage = totalDamage;
	desc.DamageType = StExt_DamageInfo.DamageType;
	desc.DamageFlags = StExt_DamageInfo.DamageFlags | StExt_DamageFlag_Aoe;
	desc.MaxTargets = maxTargets;
	desc.Radius = StExt_CalcAoeDistance(atk, desc.DamageFlags);

	desc.Damage = StExt_DamageInfo.Damage[0];
	desc.Damage[dam_index_blunt] = StExt_DamageInfo.Damage[dam_index_blunt];
	desc.Damage[dam_index_edge] = StExt_DamageInfo.Damage[dam_index_edge];
	desc.Damage[dam_index_fire] = StExt_DamageInfo.Damage[dam_index_fire];
	desc.Damage[dam_index_fly] = StExt_DamageInfo.Damage[dam_index_fly];
	desc.Damage[dam_index_magic] = StExt_DamageInfo.Damage[dam_index_magic];
	desc.Damage[dam_index_point] = StExt_DamageInfo.Damage[dam_index_point];
	desc.Damage[dam_index_fall] = StExt_DamageInfo.Damage[dam_index_fall];

	StExt_Damage_MadWhirlwindSkipTargetUid = StExt_GetNpcUid(target);
	StExt_Damage_MadWhirlwindSplashInUse = true;
	StExt_ApplyScriptDamage(atk, target, desc, StExt_MadWhirlwindSplashSelector);
	
	StExt_Damage_MadWhirlwindSplashInUse = false;
	StExt_Damage_MadWhirlwindSkipTargetUid = 0;
	StExt_Struct_Free(desc);
};

func void StExt_CheckTargetImmortality(var c_npc atk, var c_npc target)
{
	var int atkIsHero;
	var int removeImmortality; removeImmortality = false;
	
	if (!Hlp_IsValidNpc(target)) { return; };
	if (!Hlp_IsValidNpc(atk)) { return; };

	// WOJNA Z LOWCAMI: identyfikacja przez rx_isnpc (wzorzec bazowej bialej listy,
	// jak nagdumgar/caracust) - PEWNA, bo nie zalezy od odczytu gildii ani hlp_getnpc
	// (jedno i drugie zawodzilo: gildia zostawala 0). Robimy to PRZED early-exitem
	// i zdejmujemy flagi OD RAZU, zeby dzialalo nawet gdy nizsza logika by wyszla.
	// Sonda pokazuje flags/protekcje - jesli po tym Angel dalej zyje, jego ochrona
	// to nie flaga niesmiertelnosci tylko protekcje/HP i naprawimy to celniej.
	if ((StExt_DH_Stage >= 1) && (rx_isnpc(target, DH_MAINNPC) || rx_isnpc(target, DH_NPCSEVERIN) || rx_isnpc(target, DH_VILANDNPC) || rx_isnpc(target, DH_SLD_MERCENARY_01) || rx_isnpc(target, DH_SLD_MERCENARY_02)))
	{
		StExt_Trace(concatstrings(concatstrings("DH-IMMO flags=", inttostring(target.flags)), concatstrings(concatstrings(" prot_edge=", inttostring(target.protection[prot_edge])), concatstrings(" hp=", inttostring(target.attribute[atr_hitpoints])))));
		target.flags = target.flags & (~npc_flag_immortal);
		target.flags = target.flags & (~npc_flag_xaradrim);
	};

	if (!StExt_ValueHasFlag(target.flags, npc_flag_immortal) && !StExt_ValueHasFlag(target.flags, npc_flag_xaradrim)) { return; };
	
	atkIsHero = StExt_IsSummonOrHero(atk) || rx_getnpcvar(atk, aivrx_npc_control_agro) || rx_getnpcvar(atk, aivrx_npc_darkcontrol);
	if (!atkIsHero) { return; };
	
	if (rx_isnpc(target, orc_8568_nagdumgar) && npc_hasitems(hero, itmw_1h_tributedagger)) { removeImmortality = true; };
	if ((target.guild == gil_dmt) && (npc_hasitems(hero, itmw_1h_blessedblack_magic_dex) || npc_hasitems(hero, itmw_1h_blessedblack_magic) || npc_hasitems(hero, itmw_2h_blessedblack_magic))) { removeImmortality = true; };
	if (rx_isnpc(target, caracust) && (killcaracust || minekingarrive)) 
	{ 
		removeImmortality = true;
		target.protection[prot_blunt] = 500;
		target.protection[prot_edge] = 500;
		target.protection[prot_point] = 500;
		target.protection[prot_fire] = 500;
		target.protection[prot_fly] = 500;
		target.protection[prot_magic] = 500;
	};

	if (removeImmortality)
	{
		target.flags = target.flags & (~npc_flag_immortal);
		target.flags = target.flags & (~npc_flag_xaradrim);
	};
};


//===================================================================//
//			Elemental buildup v3: 8 zywiolow, jawne API				 //
//===================================================================//
// Deterministyczny pasek (zero RNG). Kazde zrodlo zywiolu KARMI pasek
// JAWNYM wywolaniem StExt_ElementBuildup_Feed: bron z zywiolem, skill
// broni, proc pieczeci (ItemAbilitiesController) oraz runy/zwoje
// (DamageController, initial hit gracza). Pakiety extra/DoT/AoE/reflect
// NIE karmia - brak petli samonapedzajacych. Erupcja przy ladunku
// >= 30% maxHP celu (x3 bossy Zakonu 99710-99725); zmiana zywiolu
// resetuje ladunek. v2 mapowal KANALY obrazen (fire/magic/fly/fall),
// przez co 5 z 8 zywiolow zlewalo sie w "PORAZENIE" - stad rewrite.

func int StExt_GetElementIndexFromDamageType(var int damageType)
{
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Fire)) { return StExt_MasteryIndex_Fire; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Ice)) { return StExt_MasteryIndex_Ice; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Electric)) { return StExt_MasteryIndex_Electric; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Air)) { return StExt_MasteryIndex_Air; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Earth)) { return StExt_MasteryIndex_Earth; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Light)) { return StExt_MasteryIndex_Light; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Dark)) { return StExt_MasteryIndex_Dark; };
	if (StExt_ValueHasFlag(damageType, StExt_DamageType_Death)) { return StExt_MasteryIndex_Death; };
	return StExt_Null;
};

// Nazwa zywiolu dla komunikatow buildupu (lokalna kopia: pelny helper
// nazw siedzi w ElementProfessionController, parsowanym PO tym pliku).
func string StExt_ElementBuildup_Name(var int element)
{
	if (element == StExt_MasteryIndex_Fire) { return "OGIEN"; };
	if (element == StExt_MasteryIndex_Ice) { return "LOD"; };
	if (element == StExt_MasteryIndex_Electric) { return "BLYSKAWICE"; };
	if (element == StExt_MasteryIndex_Air) { return "WICHER"; };
	if (element == StExt_MasteryIndex_Earth) { return "ZIEMIA"; };
	if (element == StExt_MasteryIndex_Light) { return "SWIATLO"; };
	if (element == StExt_MasteryIndex_Dark) { return "MROK"; };
	return "SMIERC";
};

// Bezpieczny odczyt perka spellblade: perki 16-19 istnieja tylko w
// drzewkach zywiolow (0-7), kazdy inny indeks = false.
func int StExt_IsSpellbladePerk(var int element, var int perkId)
{
	if ((element < StExt_MasteryIndex_Fire) || (element > StExt_MasteryIndex_Death)) { return false; };
	return StExt_IsMasteryPerkLearned(element, perkId);
};

func void StExt_ElementBuildup_Erupt(var c_npc target, var int element)
{
	var int dmg;
	var int magnitude;

	magnitude = 100;
	if (StExt_IsSpellbladePerk(element, StExt_MasteryPerkIndex_Element_Erupt)) { magnitude = 130; };

	StExt_Trace(concatstrings("ERUPCJA zywiol=", inttostring(element)));

	// Erupcje ida kanalami PIERCE (pelne przebicie protekcji) - % maxHP
	// celu nie moze byc zjadany przez pancerz, inaczej erupcja na bossie
	// z wysoka protekcja bylaby kosmetyka.
	if (element == StExt_MasteryIndex_Fire)
	{
		printscreencolor("PLOMIENNA ERUPCJA!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_FIREWAVE", target);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 2);
		dmg = StExt_GetPercentFromValue(dmg, magnitude);
		StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, 8, dmg, dam_index_fire);
	}
	else if (element == StExt_MasteryIndex_Ice)
	{
		printscreencolor("ZAMROZENIE!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_ICECUBE", target);
		rx_stuntarget(target, 2);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 4);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_magic] += StExt_GetPercentFromValue(dmg, magnitude);
	}
	else if (element == StExt_MasteryIndex_Electric)
	{
		printscreencolor("PORAZENIE!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_LIGHTNINGFLASH", target);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 8);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_magic] += StExt_GetPercentFromValue(dmg, magnitude);
	}
	else if (element == StExt_MasteryIndex_Air)
	{
		printscreencolor("CYKLON!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_MASTEROFDISASTER", target);
		rx_stuntarget(target, 1);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 4);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_fly] += StExt_GetPercentFromValue(dmg, magnitude);
	}
	else if (element == StExt_MasteryIndex_Earth)
	{
		printscreencolor("WSTRZAS!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_STONEFIRST", target);
		rx_stuntarget(target, 1);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 4);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_blunt] += StExt_GetPercentFromValue(dmg, magnitude);
	}
	else if (element == StExt_MasteryIndex_Light)
	{
		printscreencolor("OSLEPIENIE!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_LIGHTSTAR", target);
		rx_stuntarget(target, 1);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 6);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_magic] += StExt_GetPercentFromValue(dmg, magnitude);
	}
	else if (element == StExt_MasteryIndex_Dark)
	{
		printscreencolor("MROCZNY DRENAZ!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_SUCKENERGY", target);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 8);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_magic] += StExt_GetPercentFromValue(dmg, magnitude);
	}
	else
	{
		printscreencolor("ZGNILIZNA!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		rx_playeffect("SPELLFX_SWARM", target);
		dmg = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 8);
		StExt_ExtraDamageInfo.PierceDamage[dam_index_magic] += StExt_GetPercentFromValue(dmg, magnitude);
	};
};

func void StExt_ElementBuildup_Feed(var c_npc target, var int element, var int amount)
{
	var int charge;
	var int threshold;
	var string ebDiag;

	if ((element < StExt_MasteryIndex_Fire) || (element > StExt_MasteryIndex_Death)) { return; };
	if (amount <= 0) { return; };
	if (!hlp_isvalidnpc(target)) { return; };
	if (npc_isplayer(target)) { return; };
	if (c_npcisdown(target)) { return; };

	if (StExt_IsSpellbladePerk(element, StExt_MasteryPerkIndex_Element_Conduit)) { amount += StExt_GetPercentFromValue(amount, 50); };

	// jeden pasek na cel: typ = zywiol+1 (0 oznacza "pusty"), zmiana
	// zywiolu resetuje ladunek
	if (StExt_GetNpcVar(target, StExt_AiVar_ElementBuildupType) != (element + 1))
	{
		StExt_SetNpcVar(target, StExt_AiVar_ElementBuildupType, element + 1);
		StExt_SetNpcVar(target, StExt_AiVar_ElementBuildup, 0);
	};
	charge = StExt_GetNpcVar(target, StExt_AiVar_ElementBuildup) + amount;

	threshold = StExt_GetPercentFromValue(target.attribute[atr_hitpoints_max], 30);
	if ((target.id >= 99710) && (target.id <= 99725)) { threshold = threshold * 3; };

	// TEMP DIAG (weryfikacja v3): kazde karmienie paska.
	ebDiag = concatstrings("EB el=", inttostring(element));
	ebDiag = concatstrings(ebDiag, concatstrings(" +", inttostring(amount)));
	ebDiag = concatstrings(ebDiag, concatstrings(" c=", inttostring(charge)));
	ebDiag = concatstrings(ebDiag, concatstrings("/", inttostring(threshold)));
	StExt_Trace(ebDiag);

	// Czytelnosc systemu: gracz widzi, ze zywiol wzbiera. Komunikat TYLKO
	// przy przekroczeniu progu 50% / 90% ladunku (prev < prog <= charge),
	// wiec zero spamu per cios. Erupcja pisze na y=2, my na y=6.
	var int ebPrev; ebPrev = charge - amount;
	var int ebMark;
	ebMark = StExt_GetPercentFromValue(threshold, 90);
	if ((ebPrev < ebMark) && (charge >= ebMark) && (charge < threshold))
	{
		printscreencolor(concatstrings(StExt_ElementBuildup_Name(element), " ZARAZ WYBUCHNIE!"), 62, 6, StExt_DefaultFont, 2, StExt_Color_Header);
	}
	else
	{
		ebMark = StExt_GetPercentFromValue(threshold, 50);
		if ((ebPrev < ebMark) && (charge >= ebMark))
		{
			printscreencolor(concatstrings(StExt_ElementBuildup_Name(element), " wzbiera..."), 62, 6, StExt_DefaultFont, 1, StExt_Color_Header);
		};
	};

	if (charge >= threshold)
	{
		StExt_SetNpcVar(target, StExt_AiVar_ElementBuildup, 0);
		StExt_ElementBuildup_Erupt(target, element);
	}
	else { StExt_SetNpcVar(target, StExt_AiVar_ElementBuildup, charge); };
};
