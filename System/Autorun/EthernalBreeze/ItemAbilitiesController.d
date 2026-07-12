
//===================================================================//
//					Weapon skills (active abilities)				 //
//===================================================================//
// Player presses StExt_Config_WeaponSkillKey to "charge" the currently
// readied weapon's skill (paying stamina or mana + starting a cooldown).
// The charge is consumed and unleashed as bonus elemental damage on the
// hero's next successful hit (see StExt_TriggerWeaponSkillOnHit, called
// from StExt_Hero_AfterOffenceHandler in DamageController.d).

func int StExt_WeaponSkillUsesMana(var c_item weap)
{
	return StExt_WeaponIsMagicSword(weap) || StExt_WeaponIsStaff(weap);
};

// Physical weapons get a themed element by type; magic weapons follow the
// player's currently active element affinity (same one spells/masteries use).
func int StExt_GetWeaponSkillSpellId(var c_item weap)
{
	if (!hlp_isvaliditem(weap)) { return StExt_Null; };

	if (StExt_WeaponSkillUsesMana(weap))
	{
		if (StExt_ElementAffinity_Ice) { return spl_icelance; };
		if (StExt_ElementAffinity_Electric) { return spl_lightningflash; };
		if (StExt_ElementAffinity_Air) { return spl_whirlwind; };
		if (StExt_ElementAffinity_Earth) { return spl_stonefirst; };
		if (StExt_ElementAffinity_Light) { return spl_palholybolt; };
		if (StExt_ElementAffinity_Dark) { return spl_darkball; };
		if (StExt_ElementAffinity_Death) { return spl_deathball; };
		return spl_instantfireball;
	};

	if (StExt_ValueHasFlag(weap.flags, item_bow)) { return spl_whirlwind; };
	if (StExt_ValueHasFlag(weap.flags, item_crossbow)) { return spl_lightningflash; };
	if (StExt_ValueHasFlag(weap.flags, item_dag)) { return spl_darkball; };
	if (StExt_ValueHasFlag(weap.flags, item_2hd_axe) || StExt_ValueHasFlag(weap.flags, item_2hd_swd)) { return spl_stonefirst; };
	if (StExt_ValueHasFlag(weap.flags, item_axe) || StExt_ValueHasFlag(weap.flags, item_swd)) { return spl_instantfireball; };
	return StExt_Null;
};

func int StExt_GetWeaponSkillMasteryPower(var int spellId)
{
	if (spellId == spl_instantfireball) { return StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]; };
	if (spellId == spl_icelance) { return StExt_PcStats[StExt_PcStats_Index_IceMasteryPower]; };
	if (spellId == spl_lightningflash) { return StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower]; };
	if (spellId == spl_whirlwind) { return StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]; };
	if (spellId == spl_stonefirst) { return StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]; };
	if (spellId == spl_palholybolt) { return StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]; };
	if (spellId == spl_darkball) { return StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]; };
	if (spellId == spl_deathball) { return StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower]; };
	return 0;
};

// Element mastery LEVEL (e.g. pyromancy trained to 150) for the seal's spell.
func int StExt_GetWeaponSkillMasteryLevel(var int spellId)
{
	if (spellId == spl_instantfireball) { return StExt_Talent_Progression[StExt_MasteryIndex_Fire]; };
	if (spellId == spl_icelance) { return StExt_Talent_Progression[StExt_MasteryIndex_Ice]; };
	if (spellId == spl_lightningflash) { return StExt_Talent_Progression[StExt_MasteryIndex_Electric]; };
	if (spellId == spl_whirlwind) { return StExt_Talent_Progression[StExt_MasteryIndex_Air]; };
	if (spellId == spl_stonefirst) { return StExt_Talent_Progression[StExt_MasteryIndex_Earth]; };
	if (spellId == spl_palholybolt) { return StExt_Talent_Progression[StExt_MasteryIndex_Light]; };
	if (spellId == spl_darkball) { return StExt_Talent_Progression[StExt_MasteryIndex_Dark]; };
	if (spellId == spl_deathball) { return StExt_Talent_Progression[StExt_MasteryIndex_Death]; };
	return 0;
};

// Weapon proficiency bonus (1h/2h/bow/crossbow) added to burst damage.
func int StExt_GetWeaponProficiency(var c_item weap)
{
	if (!hlp_isvaliditem(weap)) { return 0; };
	if (StExt_ValueHasFlag(weap.flags, item_bow)) { return StExt_PcStats[StExt_PcStats_Index_BowMastery]; };
	if (StExt_ValueHasFlag(weap.flags, item_crossbow)) { return StExt_PcStats[StExt_PcStats_Index_CBowMastery]; };
	if (StExt_ValueHasFlag(weap.flags, item_2hd_axe) || StExt_ValueHasFlag(weap.flags, item_2hd_swd)) { return StExt_PcStats[StExt_PcStats_Index_2hMastery]; };
	return StExt_PcStats[StExt_PcStats_Index_1hMastery];
};

// Attribute scaling: magic weapon -> int + magic power; bow/xbow/dagger -> dex; else strength.
func int StExt_GetWeaponBurstStat(var c_item weap)
{
	if (StExt_WeaponSkillUsesMana(weap)) { return atr_intellect + StExt_PcStats[StExt_PcStats_Index_MagicPower]; };
	if (StExt_ValueHasFlag(weap.flags, item_bow) || StExt_ValueHasFlag(weap.flags, item_crossbow) || StExt_ValueHasFlag(weap.flags, item_dag)) { return hero.attribute[5]; };
	return hero.attribute[4];
};

// Shared burst formula for the H-skill and seals.
func int StExt_CalcWeaponBurstPower(var c_item weap, var int spellId, var int extraBase)
{
	var int power;
	power = 20 + extraBase + StExt_CalcWeaponTotalDamage(weap);
	power += StExt_GetWeaponSkillMasteryPower(spellId) + (StExt_GetWeaponSkillMasteryLevel(spellId) * 2);
	power += StExt_GetWeaponProficiency(weap);
	power += StExt_GetWeaponBurstStat(weap);
	return power;
};

func int StExt_HasAnyItemAbility() { return true; };

// Call from engine (bound to StExt_Config_WeaponSkillKey in StExt_HandleKeyEvent).
func event OnWeaponSkillKeyPress()
{
	var c_item weap;
	var int spellId;
	var int cost;

	if (!hlp_isvalidnpc(hero) || c_npcisdown(hero)) { return; };
	if (StExt_WeaponSkill_Cooldown > 0)
	{
		ai_printred(StExt_Str_WeaponSkill_OnCooldown);
		return;
	};

	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };
	spellId = StExt_GetWeaponSkillSpellId(weap);
	if (spellId == StExt_Null) { return; };

	if (StExt_WeaponSkillUsesMana(weap))
	{
		cost = StExt_GetPercentFromValue(hero.attribute[atr_mana_max], StExt_Config_WeaponSkill_ManaCostPerc);
		if (hero.attribute[atr_mana] < cost)
		{
			ai_printred(StExt_Str_WeaponSkill_NotEnoughMana);
			return;
		};
		hero.attribute[atr_mana] -= cost;
	}
	else
	{
		cost = StExt_GetPercentFromValue(atr_stamina_max, StExt_Config_WeaponSkill_StaminaCostPerc);
		if (atr_stamina < cost)
		{
			ai_printred(StExt_Str_WeaponSkill_NotEnoughStamina);
			return;
		};
		rx_restorestamina(-cost);
	};

	StExt_WeaponSkill_Charged = true;
	StExt_WeaponSkill_Cooldown = StExt_Config_WeaponSkill_CooldownSec;
	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(StExt_Str_WeaponSkill_Charged);
};

// Call from StExt_Hero_AfterOffenceHandler on the hero's next landed hit.
func void StExt_TriggerWeaponSkillOnHit(var c_npc atk, var c_npc target, var c_item weap)
{
	var int spellId;
	var int power;

	if (!StExt_WeaponSkill_Charged) { return; };
	StExt_WeaponSkill_Charged = false;

	if (!hlp_isvalidnpc(target) || c_npcisdown(target)) { return; };
	spellId = StExt_GetWeaponSkillSpellId(weap);
	if (spellId == StExt_Null) { return; };

	power = StExt_CalcWeaponBurstPower(weap, spellId, 0);
	StExt_CastSpell(StExt_AbilityPrefix + spellId, atk, target, power);
};

//===================================================================//
//					Weapon seals (passive on-hit)					 //
//===================================================================//
// A seal stores an offensive spell + power on a weapon (DLL item extension).
// It procs passively every N hits (N depends on seal power) and costs mana
// (magic weapon) or stamina (physical), scaling like the H-skill burst.

// Strong seal -> every hit; weak -> every 3-4 hits.
func int StExt_GetSealProcInterval(var int sealPower)
{
	var int n;
	n = 4 - (sealPower / 50);
	return StExt_ValidateValueRange(n, 1, 4);
};

// Deduct the per-proc resource cost. Returns true if paid.
func int StExt_PaySealCost(var c_item weap, var int sealPower)
{
	var int cost;
	cost = 10 + (sealPower / 10);
	if (StExt_WeaponSkillUsesMana(weap))
	{
		if (hero.attribute[atr_mana] < cost) { return false; };
		hero.attribute[atr_mana] = hero.attribute[atr_mana] - cost;
		return true;
	};
	if (atr_stamina < cost) { return false; };
	rx_restorestamina(-cost);
	return true;
};

// Call from StExt_Hero_AfterOffenceHandler: passive seal proc on hit.
func void StExt_TriggerWeaponSealOnHit(var c_npc atk, var c_npc target, var c_item weap)
{
	var int spellId;
	var int sealPower;
	var int power;

	if (!hlp_isvaliditem(weap)) { return; };
	if (!hlp_isvalidnpc(target) || c_npcisdown(target)) { return; };

	spellId = StExt_GetItemSeal(weap);
	if (spellId <= 0) { return; };
	sealPower = StExt_GetItemSealPower(weap);

	StExt_WeaponSeal_HitCounter += 1;
	if (StExt_WeaponSeal_HitCounter < StExt_GetSealProcInterval(sealPower)) { return; };
	StExt_WeaponSeal_HitCounter = 0;

	if (!StExt_PaySealCost(weap, sealPower)) { return; };

	power = StExt_CalcWeaponBurstPower(weap, spellId, sealPower);
	StExt_CastSpell(StExt_AbilityPrefix + spellId, atk, target, power);
};

// Apply a seal to the hero's equipped weapon (from a seal item on_use).
// Returns true on success (caller consumes the seal item).
func int StExt_ApplySeal(var int spellId, var int power)
{
	var c_item weap;

	if (!hlp_isvalidnpc(hero)) { return false; };
	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };

	if (!hlp_isvaliditem(weap))
	{
		ai_printred(StExt_Str_Seal_NoWeapon);
		return false;
	};
	if (StExt_GetItemSeal(weap) > 0)
	{
		ai_printred(StExt_Str_Seal_AlreadySealed);
		return false;
	};
	if (!StExt_SetItemSeal(weap, spellId, power))
	{
		ai_printred(StExt_Str_Seal_CannotSeal);
		return false;
	};

	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(StExt_Str_Seal_Applied);
	return true;
};

// Call once per mod tick (StExt_ModController) - ticks the cooldown down.
func void StExt_ItemAbilitiesController()
{
	if (StExt_WeaponSkill_Cooldown <= 0) { return; };
	if (accelerationactive) { StExt_WeaponSkill_Cooldown -= accelerationratio; }
	else { StExt_WeaponSkill_Cooldown -= 1; };
	if (StExt_WeaponSkill_Cooldown < 0) { StExt_WeaponSkill_Cooldown = 0; };
};
