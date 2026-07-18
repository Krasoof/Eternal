func int StExt_GetTrueSpellId(var int spellId)
{
	if (spellId > StExt_AbilityPrefix) { spellId -= StExt_AbilityPrefix; };
	if ((spellId > 0) && (spellId <= max_spell)) { return spellId; };
	return StExt_Null;
};

func int StExt_SpellIdIsValid(var int spellId) { return (spellId > 0) && (spellId <= max_spell); };

func int StExt_CanSummon(var int addsums)
{
	var int slotLeft;
	slotLeft = getsummoncountmax() - rx_summoncount;
	return (slotLeft >= addsums);
};

func int StExt_CalcScrollMana(var int cost)
{
	if(cost <= 0) { return 0; };
	cost = cost / 2;
	if (cost < 1) { cost = 1; };
	return cost;
};

func void StExt_GiveMasteryExpBySpell(var int spellId, var int exp)
{
	var int damageFlags; 
	var int effectFlags; 
	
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_GiveMasteryExpBySpell()", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return;
	};
	if (exp < 0) 
	{ 
		StExt_PrintDebugStack("StExt_GiveMasteryExpBySpell() -> exp is less than 0!");
		return;
	};
	damageFlags = StExt_GetSpellDamageFlags(spellId);
	effectFlags = StExt_GetSpellEffectFlags(spellId);
	
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Ability) || StExt_ValueHasFlag(damageFlags, StExt_DamageType_Spell) || StExt_ValueHasFlag(damageFlags, StExt_DamageType_True)) { 
		StExt_AddMasteryExp(StExt_MasteryIndex_Shaman, exp); 
	};
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Life) || StExt_ValueHasFlag(damageFlags, StExt_DamageType_Poision) || StExt_ValueHasFlag(effectFlags, StExt_DamageFlag_Animal)) { 
		StExt_AddMasteryExp(StExt_MasteryIndex_Life, exp); 
	};
	
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Fire)) { StExt_AddMasteryExp(StExt_MasteryIndex_Fire, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Ice)) { StExt_AddMasteryExp(StExt_MasteryIndex_Ice, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Electric)) { StExt_AddMasteryExp(StExt_MasteryIndex_Electric, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Air)) { StExt_AddMasteryExp(StExt_MasteryIndex_Air, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Earth)) { StExt_AddMasteryExp(StExt_MasteryIndex_Earth, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Light)) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Dark)) { StExt_AddMasteryExp(StExt_MasteryIndex_Dark, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Death)) { StExt_AddMasteryExp(StExt_MasteryIndex_Death, exp); };
	if (StExt_ValueHasFlag(damageFlags, StExt_DamageType_Blood)) { StExt_AddMasteryExp(StExt_MasteryIndex_Blood, exp); };	
	if (StExt_ValueHasFlag(effectFlags, StExt_DamageFlag_Golem)) { StExt_AddMasteryExp(StExt_MasteryIndex_Golem, exp); };
	if (StExt_ValueHasFlag(effectFlags, StExt_DamageFlag_Demon)) { StExt_AddMasteryExp(StExt_MasteryIndex_Demon, exp); };
	if (StExt_ValueHasFlag(effectFlags, StExt_DamageFlag_Undead)) { StExt_AddMasteryExp(StExt_MasteryIndex_Necro, exp); };
};

func void StExt_SpellController()
{
	if (rx_lightspell_time > 0) { StExt_AddMasteryExp(StExt_MasteryIndex_Light, 1); };
};

var int StExt_ApplyManaCostReduction_Callback_Mana;
func void StExt_ApplyManaCostReduction_Callback() { rx_restoremana(StExt_ApplyManaCostReduction_Callback_Mana); };

func void StExt_ApplyManaCostReduction(var int manainvested, var int spellId)
{
	var int costReduction;
	var int spellFlags;
	var int manaRestore;
	
	if (!npc_isplayer(self)) { return; };
	if ((spellId < 0) || (spellId >= max_spell))
	{
		StExt_PrintDebug("StExt_ApplyManaCostReduction(var int manainvested, var int spellId)", concatstrings("Incorrect spell id: ", inttostring(spellId)), self, other);
		return;
	};	
	spellFlags = StExt_GetSpellDamageFlags(spellId);
	costReduction = StExt_PcStats[StExt_PcStats_Index_SpellConsumptionReduction];
	manaRestore = 0;
	
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Fire, StExt_MasteryPerkIndex_Fire_FireSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Fire)) { costReduction += 100; };		
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Ice, StExt_MasteryPerkIndex_Ice_IceSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Ice)) { costReduction += 100; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Electric, StExt_MasteryPerkIndex_Electric_ElectricSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Electric)) { costReduction += 100; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Air, StExt_MasteryPerkIndex_Air_AirSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Air)) { costReduction += 100; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Earth, StExt_MasteryPerkIndex_Earth_EarthSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Earth)) { costReduction += 100; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Light, StExt_MasteryPerkIndex_Light_HollySpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Light)) { costReduction += 100; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Dark, StExt_MasteryPerkIndex_Dark_DarkSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Dark)) { costReduction += 100; };
	if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Death, StExt_MasteryPerkIndex_Death_GraveyardSpirith) && StExt_ValueHasFlag(spellFlags, StExt_DamageType_Death)) { costReduction += 100; };
	
	costReduction = StExt_ValidateValueRange(costReduction, 0, 900);
	if (costReduction <= 0) { return; };
	manaRestore = StExt_GetPermilleFromValue(manainvested, costReduction);
	if (manaRestore > 0)
	{
		StExt_ApplyManaCostReduction_Callback_Mana = manaRestore;
		rx_callbacknpc(hero, 0.05, StExt_ApplyManaCostReduction_Callback);
	};
};

func int StExt_ProcessSpellConsumption(var int manainvested)
{
	var int extraCost; extraCost = 0;
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Archmage)) { extraCost += manainvested; };
	// Percentage mana tax: every cast also costs ~7% of your MAX mana. Flat
	// costs (firestorm = 40) were trivial once you had a big pool + a mana-regen
	// item - you could machine-gun spells. Now a big pool pays proportionally,
	// so mana is a real resource again (~12-14 casts from a full bar).
	extraCost += StExt_GetPercentFromValue(hero.attribute[atr_mana_max], 7);
	return extraCost;
};


//Calls every healing spell cast
func void StExt_HandleHealingSpell(var c_npc slf)
{
	var int power;
	var int time;
	
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_HandleHealingSpell(var c_npc slf)", "slf instance is null!", slf, other);
		return; 
	};
	if (c_npcisdown(slf)) { return; };
	
	if (npc_isplayer(slf))
	{
		rx_restorehealth(hero, StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]);
		if (StExt_IsMasteryPerkLearned(StExt_MasteryIndex_Life, StExt_MasteryPerkIndex_Life_Restoration)) 
		{
			power = 1 + StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + atr_intellect;
			power += StExt_GetPercentFromValue(power, countlearnspell);
			time = 5 + (power / 60);
			StExt_ApplyTimedEffectEx(self, self, StExt_TimedEffect_Index_HpRegen, power, time, 100, 1, 0);
		};
	};
};


// Call from engine. Only for hero!
func void StExt_OnSpellPreCast()
{
	var int delta; delta = StExt_PcPreCastMana - hero.attribute[atr_mana];
    if (delta > 0) { StExt_PcCastManaSpent += delta; };
    StExt_PcPreCastMana = hero.attribute[atr_mana];
};

// Call from engine
func void StExt_OnSpellCast()
{
	var int activespell;
	var int extraManaCost;
	
	if (Hlp_IsNull(StExt_SpellInfo))
	{
		StExt_PrintDebugStack("StExt_OnSpellCast() -> StExt_SpellInfo is null!");
		StExt_PcCastManaSpent = 0;
		return;
	};
	
	if ((StExt_SpellInfo.SpellId < 0) || (StExt_SpellInfo.SpellId >= max_spell))
	{
		StExt_PrintDebug("StExt_OnSpellCast()", concatstrings("Incorrect spell id: ", inttostring(StExt_SpellInfo.SpellId)), self, other);
		StExt_PcCastManaSpent = 0;
		return;
	};
	
	activespell = StExt_SpellInfo.SpellId;
	StExt_SpellInfo.SpellType = StExt_GetSpellDamageFlags(activespell);
	StExt_SpellInfo.SpellFlags = StExt_GetSpellDamageFlags(activespell);

	StExt_SpellInfo.IsScroll = npc_getactivespellisscroll(hero);
	StExt_SpellInfo.IsAoe = StExt_ValueHasFlag(StExt_SpellInfo.SpellFlags, StExt_DamageFlag_Aoe);
	StExt_SpellInfo.IsDot = StExt_ValueHasFlag(StExt_SpellInfo.SpellFlags, StExt_DamageFlag_Dot);
	StExt_SpellInfo.IsStream = StExt_ValueHasFlag(StExt_SpellInfo.SpellFlags, StExt_DamageFlag_Stream);
	
	StExt_OnSpellPreCast();
	StExt_SpellInfo.ManaCost = StExt_PcCastManaSpent;
	// Pomiar delty bywa zerowy (spelle NO_MANADEC / reczne odejmowanie w
	// SpellsOverrides miedzy probkami). Silnik zna faktyczna inwestycje
	// (EngineManaInvested z DLL) - prawda to wieksza z obu, a brakujaca
	// roznice dobieramy z paska, zeby runa NIGDY nie byla darmowa.
	if (StExt_SpellInfo.EngineManaInvested > StExt_SpellInfo.ManaCost)
	{
		var int manaShortfall; manaShortfall = StExt_SpellInfo.EngineManaInvested - StExt_SpellInfo.ManaCost;
		hero.attribute[atr_mana] = StExt_ValidateValueRange(hero.attribute[atr_mana] - manaShortfall, 0, hero.attribute[atr_mana_max]);
		StExt_SpellInfo.ManaCost = StExt_SpellInfo.EngineManaInvested;
	};
	extraManaCost = StExt_ProcessSpellConsumption(StExt_SpellInfo.ManaCost);
	if(extraManaCost > 0) { hero.attribute[atr_mana] = StExt_ValidateValueRange(hero.attribute[atr_mana] - extraManaCost, 0, hero.attribute[atr_mana_max]); };
	StExt_ApplyManaCostReduction(StExt_SpellInfo.ManaCost + extraManaCost, activespell);

	// TEMP DIAG (sledztwo many): pelny rachunek kazdego castu.
	var string mnDiag;
	mnDiag = concatstrings("MANA cast id=", inttostring(activespell));
	mnDiag = concatstrings(mnDiag, concatstrings(" delta=", inttostring(StExt_PcCastManaSpent)));
	mnDiag = concatstrings(mnDiag, concatstrings(" engine=", inttostring(StExt_SpellInfo.EngineManaInvested)));
	mnDiag = concatstrings(mnDiag, concatstrings(" koszt=", inttostring(StExt_SpellInfo.ManaCost)));
	mnDiag = concatstrings(mnDiag, concatstrings(" podatek=", inttostring(extraManaCost)));
	mnDiag = concatstrings(mnDiag, concatstrings(" manaTeraz=", inttostring(hero.attribute[atr_mana])));
	StExt_Trace(mnDiag);
	if ((StExt_SpellInfo.ManaCost <= 0) && (StExt_GetSpellDamageFlags(activespell) != 0))
	{
		StExt_Trace(concatstrings("MANA WARN: spell obrazeniowy z kosztem 0! id=", inttostring(activespell)));
	};
		
	if ((activespell == spl_light) || (activespell == spl_teleporttaverne) || (activespell == spl_teleportowdemontower) || (activespell == spl_teleportoc) || 
	(activespell == spl_teleportpassow) || (activespell == spl_teleportpassnw) || (activespell == spl_teleportxardas) || (activespell == spl_teleportmonastery) || 
	(activespell == spl_teleportseaport) || (activespell == spl_palteleportsecret) || (activespell == spl_fear) || (activespell == spl_shrink) || 
	(activespell == spl_charm) || (activespell == spl_teleportorc) || (activespell == spl_teleportpsicamp) || (activespell == spl_waterwall) || 
	(activespell == spl_telekinesis) || (activespell == spl_manaforlife) || (activespell == spl_teleportdagot) || (activespell == spl_control) || 
	(activespell == spl_severefetidity) || (activespell == spl_unlockchest) || (activespell == spl_rage) || (activespell == spl_magiccage) ||
	(activespell == spl_blink)) { 
		StExt_GiveMasteryExpBySpell(activespell, 250 + (hero.level * 10));
	};
	
	Hlp_DoEvent("StExt_Evt_OnSpellCast");
	StExt_PcPreCastMana = hero.attribute[atr_mana];
	StExt_PcCastManaSpent = 0;
};

func void StExt_OnOtherSpellCast()
{
	Hlp_DoEvent("StExt_Evt_OnOtherSpellCast");
};


//-------------------------------------------------------------------------------------------

func void StExt_InitializeScriptSpellDamageDesc(var c_npc atk, var C_ExtraDamageInfo desc, var int spellId, var int damageTotal)
{
	var int damagePerType;
	var int damageTypeCount;
	var int damageEnum;
	var int damageType;
	var int ticks;	

	damageType = StExt_GetSpellDamageFlags(spellId);
	damageEnum = StExt_GetTrueDamageType(damageType);	
	damageTypeCount = StExt_GetDamageTypesCount(damageEnum);
	if (damageTypeCount <= 0) { 
		damageTypeCount = 1; 
		damageEnum = damageEnum | dam_barrier;
	}
	else if (damageTypeCount > 7) { damageTypeCount = 7; };
	
	StExt_InitializeScriptDamageDesc(desc);
	if (StExt_ValueHasFlag(desc.DamageFlags, StExt_DamageFlag_Aoe) || StExt_ValueHasFlag(desc.DamageFlags, StExt_DamageFlag_Chain))
	{
		desc.Radius = 50 + StExt_CalcAoeDistance(atk, desc.DamageFlags);
		desc.MaxTargets = 1 + StExt_CalcAoeTargets(atk, desc.DamageFlags, 0);
		damageTotal = (damageTotal + StExt_MinDamage) / 5;
		if (damageTotal < StExt_MinDamage) { damageTotal = StExt_MinDamage; };
	}
	else
	{
		desc.Radius = 50;
		desc.MaxTargets = 1;
	};
	damagePerType = (damageTotal + StExt_MinDamage) / damageTypeCount;
	if (damagePerType < StExt_MinDamage) { damagePerType = StExt_MinDamage; };
	
	desc.TotalDamage = damageTotal;	
	desc.DamageType = damageType;
	desc.DamageFlags = StExt_GetSpellEffectFlags(spellId);
	
	if (StExt_ValueHasFlag(desc.DamageFlags, StExt_DamageFlag_Dot))
	{
		ticks = StExt_Npc_CalcDotDuration(atk);
		damagePerType = (damagePerType + StExt_MinDamage) / ticks;
		if (damagePerType < StExt_MinDamage) { damagePerType = StExt_MinDamage; };
		
		desc.TotalDotDamage = (desc.TotalDamage + StExt_MinDamage) / ticks;
		if (desc.TotalDotDamage < StExt_MinDamage) { desc.TotalDotDamage = StExt_MinDamage * damageTypeCount; };
	
		if (StExt_ValueHasFlag(damageEnum, dam_barrier)) { desc.DotDamage = damagePerType; desc.Ticks = ticks; };	
		if (StExt_ValueHasFlag(damageEnum, dam_blunt)) { desc.DotDamage[dam_index_blunt] = damagePerType; desc.Ticks[dam_index_blunt] = ticks; };
		if (StExt_ValueHasFlag(damageEnum, dam_edge)) { desc.DotDamage[dam_index_edge] = damagePerType; desc.Ticks[dam_index_edge] = ticks; };
		if (StExt_ValueHasFlag(damageEnum, dam_fire)) { desc.DotDamage[dam_index_fire] = damagePerType; desc.Ticks[dam_index_fire] = ticks; };
		if (StExt_ValueHasFlag(damageEnum, dam_fly)) { desc.DotDamage[dam_index_fly] = damagePerType; desc.Ticks[dam_index_fly] = ticks; };
		if (StExt_ValueHasFlag(damageEnum, dam_magic)) { desc.DotDamage[dam_index_magic] = damagePerType; desc.Ticks[dam_index_magic] = ticks; };
		if (StExt_ValueHasFlag(damageEnum, dam_point)) { desc.DotDamage[dam_index_point] = damagePerType; desc.Ticks[dam_index_point] = ticks; };
		if (StExt_ValueHasFlag(damageEnum, dam_fall)) { desc.DotDamage[dam_index_fall] = damagePerType; desc.Ticks[dam_index_fall] = ticks; };
	};

	if (StExt_ValueHasFlag(damageEnum, dam_barrier)) { desc.Damage = damagePerType; };	
	if (StExt_ValueHasFlag(damageEnum, dam_blunt)) { desc.Damage[dam_index_blunt] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_edge)) { desc.Damage[dam_index_edge] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_fire)) { desc.Damage[dam_index_fire] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_fly)) { desc.Damage[dam_index_fly] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_magic)) { desc.Damage[dam_index_magic] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_point)) { desc.Damage[dam_index_point] = damagePerType; };
	if (StExt_ValueHasFlag(damageEnum, dam_fall)) { desc.Damage[dam_index_fall] = damagePerType; };
};


//-------------------------------------------------------------------------------------------

func int StExt_CastAoeEffect(var c_npc atk, var string proj, var C_ExtraDamageInfo damageDesc)
{
	var int damType;
	var int time;
	
	if (Hlp_IsNull(damageDesc)) { StExt_PrintDebug("StExt_CastAoeEffect(...)", "DamageDesc instance is null!", atk, StExt_NullNpc); return false; };	
	if (!hlp_isvalidnpc(atk)) { StExt_PrintDebug("StExt_CastAoeEffect(...)", "Npc instance is null!", atk, StExt_NullNpc); return false; };	
	if (StExt_StringIsEmpty(proj)) { StExt_PrintDebug("StExt_CastAoeEffect(...)", "Projectile is empty!", atk, StExt_NullNpc); return false; };
		
	StExt_ApplyScriptPendingDamage(atk, StExt_NullNpc, damageDesc, StExt_NpcsIsEnemies_Engine);
	rx_playeffect(proj, atk);
	return true;
};

func int StExt_CastSpellEffect(var c_npc atk, var c_npc target, var string proj, var C_ExtraDamageInfo damageDesc)
{
	if (Hlp_IsNull(damageDesc)) { StExt_PrintDebug("StExt_CastSpellEffect(...)", "DamageDesc instance is null!", atk, target); return false; };	
	if (!hlp_isvalidnpc(atk) || !hlp_isvalidnpc(target)) { StExt_PrintDebug("StExt_CastSpellEffect(...)", "Npc instance is null!", atk, target); return false; };	
	if (StExt_StringIsEmpty(proj)) { StExt_PrintDebug("StExt_CastSpellEffect(...)", "Projectile is empty!", atk, target); return false; };
	
	return StExt_CastScriptSpell(proj, atk, target, damageDesc.TotalDamage, StExt_GetTrueDamageType(damageDesc.DamageType), damageDesc);
};


//-------------------------------------------------------------------------------------------

func void StExt_CastSpell_Callback()
{
	var C_ExtraDamageInfo desc;
	if (!hlp_isvalidnpc(StExt_Self) || !hlp_isvalidnpc(StExt_Other)) { StExt_PrintDebug("StExt_CastSpell(...)", "One of npcs is invalid!", StExt_Self, StExt_Other); return; };
	if (c_npcisdown(StExt_Self) || c_npcisdown(StExt_Other)) { return; };
	if (Hlp_IsNull(StExt_CallbackParams)) { StExt_PrintDebug("StExt_CastSpell(...)", "Callback params is Null!", StExt_Self, StExt_Other); return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { StExt_PrintDebug("StExt_CastSpell(...)", "Fail to create script damage descriptor!", StExt_Self, StExt_Other); return; };
	
	StExt_InitializeScriptSpellDamageDesc(StExt_Self, desc, StExt_CallbackParams.IntParam[1], StExt_CallbackParams.IntParam);
	StExt_CastScriptSpell(StExt_CallbackParams.StringParam, StExt_Self, StExt_Other, StExt_CallbackParams.IntParam, StExt_GetTrueDamageType(desc.DamageType), desc);
	StExt_Struct_Free(desc);
};

func int StExt_CastSpell(var int spellId, var c_npc atk, var c_npc target, var int damageTotal)
{
	var int damType;
	var string projName;	
	var C_ScriptCallbackParams callBackParams;

	if (!hlp_isvalidnpc(atk) || !hlp_isvalidnpc(target)) {
		StExt_PrintDebug("StExt_CastSpell(...)", "One of npcs is invalid!", atk, target);
		return false; 
	};
	if (c_npcisdown(atk) || c_npcisdown(target)) { return false; };
	
	spellId = StExt_GetTrueSpellId(spellId);
	if (!StExt_SpellIdIsValid(spellId)) {
		StExt_PrintDebug("StExt_CastSpell(...)", concatstrings("Incorrect spell id: ", inttostring(spellId)), atk, target);
		return false;
	};
	// TEMP DIAG: "bialy cyklon na odbicie dmg" - kazdy skryptowy cast do logu.
	// Jak przy cyklonie pojawi sie tu id 60 (MasterOfDisaster) / 71 (Whirlwind)
	// castowane przez GRACZA, to zrodlo = reflect (DamageController:761) rzucajacy
	// SpellId z ability bossa, ktory nie jest spellem.
	if (npc_isplayer(atk)) { StExt_Trace(concatstrings("CASTSPELL przez GRACZA id=", inttostring(spellId))); }
	else { StExt_Trace(concatstrings(concatstrings("CASTSPELL id=", inttostring(spellId)), concatstrings(" atkInst=", inttostring(hlp_getinstanceid(atk))))); };
	
	projName = StExt_GetSpellFx(spellId);
	if (StExt_StringIsEmpty(projName)) {
		StExt_PrintDebug("StExt_CastSpell(...)", "Effect name is empty!", atk, target);
		return false; 
	};	

	callBackParams = StExt_InitializeCallback(atk, target, "StExt_CastSpell_Callback", 2 + hlp_random(3 + StExt_Damage_SpellCastFrameOffset));
	if (Hlp_IsNull(callBackParams)) { StExt_PrintDebug("StExt_CastSpell(...)", "Fail to create callback params!", atk, target); return false; };
	
	callBackParams.StringParam = projName;	
	callBackParams.IntParam[0] = damageTotal;
	callBackParams.IntParam[1] = spellId;
	
	StExt_Damage_SpellCastFrameOffset += 1;
	return true;
};


//-------------------------------------------------------------------------------------------

func void StExt_SetNpcSummoned()
{
	if (!hlp_isvalidnpc(StExt_Self)) {		
		StExt_PrintDebug("StExt_SetNpcSummoned()", "Instance is null!", StExt_Self, StExt_Other);
		return;
	};
	
	if (!Hlp_IsNull(StExt_CallbackParams)) 
	{
		StExt_SetNpcVar(StExt_Self, StExt_AiVar_OwnerGuild, StExt_CallbackParams.IntParam[2]);
		rx_setnpcvar(StExt_Self, aivrx_magic_collision_index, StExt_CallbackParams.IntParam[2]);
	};
	StExt_Npc_SetExtraFlag(StExt_Self, StExt_NpcFlag_Summoned, true);
	//StExt_ValidateNpcPosition(StExt_Self);
};

func void StExt_SpawnSummons_Callback()
{
	if (Hlp_IsNull(StExt_CallbackParams)) { return; };
	rx_saveparservars();
	StExt_SpawnNpcWithFunc(StExt_CallbackParams.IntParam, StExt_CallbackParams.IntParam[1], StExt_CallbackParams.StringParam, "StExt_SetNpcSummoned");
	rx_restoreparservars();	
};

func int StExt_SpawnSummons_CreateCallback(var c_npc slf, var int summonId, var int summonCount)
{
	var C_ScriptCallbackParams callBackParams;
	callBackParams = StExt_InitializeCallback(slf, StExt_NullNpc, "StExt_SpawnSummons_Callback", 3 + hlp_random(3));
	if (Hlp_IsNull(callBackParams)) 
	{ 
		StExt_PrintDebug("StExt_SpawnSummons_CreateCallback()", "callback params is null!", slf, StExt_NullNpc);
		return false; 
	};
	
	callBackParams.StringParam = slf.wp;
	callBackParams.StringParam = StExt_CheckSpawnWp(callBackParams.StringParam);
	
	callBackParams.IntParam = summonId;
	callBackParams.IntParam[1] = summonCount;
	callBackParams.IntParam[2] = slf.guild;
	return true;
};

func int StExt_SpawnSummons(var c_npc slf, var int summonId1, var int summonId2, var int summonId3, var int summonCount1, var int summonCount2, var int summonCount3)
{
	var int spawned; spawned = 0;	
	if (!hlp_isvalidnpc(slf)) { StExt_PrintDebug("StExt_SpawnSummons(...)", "Npc instance is null!", slf, StExt_NullNpc); return false; };	
	
	if ((summonId1 != StExt_Null) && (summonCount1 > 0)) { spawned += StExt_SpawnSummons_CreateCallback(slf, summonId1, summonCount1); };
	if ((summonId2 != StExt_Null) && (summonCount2 > 0)) { spawned += StExt_SpawnSummons_CreateCallback(slf, summonId2, summonCount2); };
	if ((summonId3 != StExt_Null) && (summonCount3 > 0)) { spawned += StExt_SpawnSummons_CreateCallback(slf, summonId3, summonCount3); };
	return (spawned > 0);
};

//-------------------------------------------------------------------------------------------

func void StExt_CastBlink(var c_npc slf, var c_npc target, var int inBattle)
{
	if (!hlp_isvalidnpc(slf) || !hlp_isvalidnpc(target))
	{
		StExt_PrintDebug("StExt_CastBlink()", "Some of npc is null!", slf, target);
		return;
	};
	
	rx_playeffect("spellFX_Teleport_RING", slf);
	StExt_TeleportToNpc(slf, target);	
	if (inBattle)
	{
		ai_turntonpc(slf, target);
		rx_restorenpchealthstop(slf);
		b_attack(slf, target, ar_none, 1);
	};
};

//-------------------------------------------------------------------------------------------

var int StExt_CastMassHeal_HealPerc;
var int StExt_CastMassHeal_TargetsLeft;
func void StExt_CastMassHeal_Loop()
{
	if (!hlp_isvalidnpc(StExt_Self)) {
		StExt_PrintDebug("StExt_CastMassHeal_Loop()", "Self npc is null!", StExt_Self, StExt_NullNpc);
		return;
	};
	if (StExt_CastMassHeal_TargetsLeft <= 0) { return; };
	
	wld_playeffect("spellfx_heal", StExt_Self, StExt_Self, 0, 0, 0, false);
	rx_restorehealthpercent(StExt_Self, StExt_CastMassHeal_HealPerc);
	StExt_CastMassHeal_TargetsLeft -= 1;
};

func void StExt_CastMassHeal(var c_npc slf, var int perc, var int power, var int targetsCount, var int radius)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	
	StExt_CastMassHeal_HealPerc = perc + StExt_GetPermilleFromValue(perc, power);
	if (StExt_CastMassHeal_HealPerc < 1) { StExt_CastMassHeal_HealPerc = 1; };
	
	StExt_CastMassHeal_TargetsLeft = targetsCount;
	if (StExt_CastMassHeal_TargetsLeft < 1) { StExt_CastMassHeal_TargetsLeft = 1; };	
	if (radius < 200) { radius = 200; };
	
	StExt_ForEachNpcInRadius(slf, radius, StExt_EmptyString, "StExt_NpcsIsAllies_Engine", "StExt_CastMassHeal_Loop");
};

func void StExt_CastSelfHeal(var c_npc slf, var int perc, var int power)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	
	perc = perc + StExt_GetPermilleFromValue(perc, power);
	if (perc < 1) { perc = 1; };	
	wld_playeffect("spellfx_heal", slf, slf, 0, 0, 0, false);
	rx_restorehealthpercent(slf, perc);
};

var int StExt_CastMassHpRegen_HealPerc;
var int StExt_CastMassHpRegen_TargetsLeft;
func void StExt_CastMassHpRegen_Loop()
{
	if (!hlp_isvalidnpc(StExt_Self)) {
		StExt_PrintDebug("StExt_CastMassHpRegen_Loop()", "Self npc is null!", StExt_Self, StExt_NullNpc);
		return;
	};
	if (StExt_CastMassHpRegen_TargetsLeft <= 0) { return; };
	rx_restorehealth(StExt_Self, StExt_CastMassHpRegen_HealPerc);
	StExt_CastMassHpRegen_TargetsLeft -= 1;
};

func void StExt_CastMassHpRegen(var c_npc slf, var int val, var int power, var int targetsCount, var int radius)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassHpRegen()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	
	StExt_CastMassHpRegen_HealPerc = val + StExt_GetPermilleFromValue(val, power);
	if (StExt_CastMassHpRegen_HealPerc < 1) { StExt_CastMassHpRegen_HealPerc = 1; };
	
	StExt_CastMassHpRegen_TargetsLeft = targetsCount;
	if (StExt_CastMassHpRegen_TargetsLeft < 1) { StExt_CastMassHpRegen_TargetsLeft = 1; };	
	if (radius < 100) { radius = 100; };
	
	StExt_ForEachNpcInRadius(slf, radius, StExt_EmptyString, "StExt_NpcsIsAllies_Engine", "StExt_CastMassHpRegen_Loop");
};

var int StExt_CastMassEsRegen_HealPerc;
var int StExt_CastMassEsRegen_TargetsLeft;
func void StExt_CastMassEsRegen_Loop()
{
	if (!hlp_isvalidnpc(StExt_Self)) {
		StExt_PrintDebug("StExt_CastMassEsRegen_Loop()", "Self npc is null!", StExt_Self, StExt_NullNpc);
		return;
	};
	if ((StExt_CastMassEsRegen_TargetsLeft <= 0) || (StExt_Npc_GetMaxEs(StExt_Self) <= 0)) { return; };
	StExt_Npc_ChangeEs(StExt_Self, StExt_CastMassEsRegen_HealPerc);
	StExt_CastMassEsRegen_TargetsLeft -= 1;
};

func void StExt_CastMassEsRegen(var c_npc slf, var int val, var int power, var int targetsCount, var int radius)
{
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassEsRegen()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	
	StExt_CastMassEsRegen_HealPerc = val + StExt_GetPermilleFromValue(val, power);
	if (StExt_CastMassEsRegen_HealPerc < 1) { StExt_CastMassEsRegen_HealPerc = 1; };
	
	StExt_CastMassEsRegen_TargetsLeft = targetsCount;
	if (StExt_CastMassEsRegen_TargetsLeft < 1) { StExt_CastMassEsRegen_TargetsLeft = 1; };	
	if (radius < 100) { radius = 100; };
	
	StExt_ForEachNpcInRadius(slf, radius, StExt_EmptyString, "StExt_NpcsIsAllies_Engine", "StExt_CastMassEsRegen_Loop");
};
