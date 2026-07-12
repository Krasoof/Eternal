
//===================================================================//
//					Weapon element (perk) + H-skill					 //
//===================================================================//
// A weapon may carry an ELEMENT: a random offensive spell rolled at
// generation (DLL, chance = StExt_WeaponElementRollChance) or granted
// by a seal gem of that element. The element lives in the item
// extension (SpellId + SpellPower), so it persists in saves.
//
// H-skill: charges the weapon's OWN element (message if it has none);
// the next landed hit unleashes the burst and the weapon glows while
// charged. Seals also proc the element passively every N hits.

func int StExt_WeaponSkillUsesMana(var c_item weap)
{
	return StExt_WeaponIsMagicSword(weap) || StExt_WeaponIsStaff(weap);
};

// Element index (StExt_MasteryIndex_Fire..Death) of an offensive spell,
// derived from its damage flags. Returns StExt_Null for non-elemental.
func int StExt_GetSpellElementIndex(var int spellId)
{
	var int flags;
	if (spellId <= 0) { return StExt_Null; };
	flags = StExt_GetSpellDamageFlags(spellId);
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Fire)) { return StExt_MasteryIndex_Fire; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Ice)) { return StExt_MasteryIndex_Ice; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Electric)) { return StExt_MasteryIndex_Electric; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Air)) { return StExt_MasteryIndex_Air; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Earth)) { return StExt_MasteryIndex_Earth; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Light)) { return StExt_MasteryIndex_Light; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Dark)) { return StExt_MasteryIndex_Dark; };
	if (StExt_ValueHasFlag(flags, StExt_DamageType_Death)) { return StExt_MasteryIndex_Death; };
	return StExt_Null;
};

// Random offensive spell from the element's pool (seal gems roll here,
// so two Fire seals may grant different fire spells).
func int StExt_RollElementSpell(var int element)
{
	var int r;
	if (element == StExt_MasteryIndex_Fire)
	{
		r = hlp_random(4);
		if (r == 0) { return spl_firebolt; };
		if (r == 1) { return spl_chargefireball; };
		if (r == 2) { return spl_firestorm; };
		return spl_instantfireball;
	};
	if (element == StExt_MasteryIndex_Ice)
	{
		if (hlp_random(2) == 0) { return spl_icebolt; };
		return spl_icelance;
	};
	if (element == StExt_MasteryIndex_Electric)
	{
		r = hlp_random(3);
		if (r == 0) { return spl_zap; };
		if (r == 1) { return spl_thunderball; };
		return spl_lightningflash;
	};
	if (element == StExt_MasteryIndex_Air)
	{
		if (hlp_random(2) == 0) { return spl_windfist; };
		return spl_whirlwind;
	};
	if (element == StExt_MasteryIndex_Earth) { return spl_stonefirst; };
	if (element == StExt_MasteryIndex_Light) { return spl_palholybolt; };
	if (element == StExt_MasteryIndex_Dark) { return spl_darkball; };
	if (element == StExt_MasteryIndex_Death)
	{
		if (hlp_random(2) == 0) { return spl_deathbolt; };
		return spl_deathball;
	};
	return StExt_Null;
};

func int StExt_GetElementMasteryPowerStat(var int element)
{
	if (element == StExt_MasteryIndex_Fire) { return StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]; };
	if (element == StExt_MasteryIndex_Ice) { return StExt_PcStats[StExt_PcStats_Index_IceMasteryPower]; };
	if (element == StExt_MasteryIndex_Electric) { return StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower]; };
	if (element == StExt_MasteryIndex_Air) { return StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]; };
	if (element == StExt_MasteryIndex_Earth) { return StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]; };
	if (element == StExt_MasteryIndex_Light) { return StExt_PcStats[StExt_PcStats_Index_LightMasteryPower]; };
	if (element == StExt_MasteryIndex_Dark) { return StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]; };
	if (element == StExt_MasteryIndex_Death) { return StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower]; };
	return 0;
};

func int StExt_GetElementMasteryLevel(var int element)
{
	if (element == StExt_MasteryIndex_Fire) { return StExt_Talent_Progression[StExt_MasteryIndex_Fire]; };
	if (element == StExt_MasteryIndex_Ice) { return StExt_Talent_Progression[StExt_MasteryIndex_Ice]; };
	if (element == StExt_MasteryIndex_Electric) { return StExt_Talent_Progression[StExt_MasteryIndex_Electric]; };
	if (element == StExt_MasteryIndex_Air) { return StExt_Talent_Progression[StExt_MasteryIndex_Air]; };
	if (element == StExt_MasteryIndex_Earth) { return StExt_Talent_Progression[StExt_MasteryIndex_Earth]; };
	if (element == StExt_MasteryIndex_Light) { return StExt_Talent_Progression[StExt_MasteryIndex_Light]; };
	if (element == StExt_MasteryIndex_Dark) { return StExt_Talent_Progression[StExt_MasteryIndex_Dark]; };
	if (element == StExt_MasteryIndex_Death) { return StExt_Talent_Progression[StExt_MasteryIndex_Death]; };
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

// Shared burst formula for the H-skill and seal procs.
func int StExt_CalcWeaponBurstPower(var c_item weap, var int spellId, var int extraBase)
{
	var int power;
	var int element;
	element = StExt_GetSpellElementIndex(spellId);
	power = 20 + extraBase + StExt_CalcWeaponTotalDamage(weap);
	power += StExt_GetElementMasteryPowerStat(element) + (StExt_GetElementMasteryLevel(element) * 2);
	power += StExt_GetWeaponProficiency(weap);
	power += StExt_GetWeaponBurstStat(weap);
	return power;
};

func int StExt_HasAnyItemAbility() { return true; };

// Call from engine (bound to StExt_Config_WeaponSkillKey in StExt_HandleKeyEvent).
// Charges the weapon's OWN element; refuses if the weapon has none.
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
	if (!hlp_isvaliditem(weap)) { return; };

	spellId = StExt_GetItemSeal(weap);
	if (spellId <= 0)
	{
		ai_printred(StExt_Str_WeaponSkill_NoElement);
		return;
	};

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
	StExt_WeaponSkill_GlowTick = 0;
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
	spellId = StExt_GetItemSeal(weap);
	if (spellId <= 0) { return; };

	power = StExt_CalcWeaponBurstPower(weap, spellId, StExt_GetItemSealPower(weap));
	StExt_CastSpell(StExt_AbilityPrefix + spellId, atk, target, power);
};

//===================================================================//
//					Weapon seals (passive on-hit)					 //
//===================================================================//
// Seal gems grant/upgrade the weapon's element. The element procs
// passively every N hits (N depends on stored power) and costs mana
// (magic weapon) or stamina (physical).

// Strong element -> every hit; weak -> every 3-4 hits.
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

// Call from StExt_Hero_AfterOffenceHandler: passive element proc on hit.
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

// Apply a seal gem of the given ELEMENT to the hero's equipped weapon.
// Power scales with hero level. If the weapon already has an element,
// the seal must MATCH it and only upgrades when stronger.
// Returns true on success (caller consumes the seal item).
func int StExt_ApplySeal(var int element, var int tierPower)
{
	var c_item weap;
	var int existing;
	var int power;
	var int spellId;

	if (!hlp_isvalidnpc(hero)) { return false; };
	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };

	if (!hlp_isvaliditem(weap))
	{
		ai_printred(StExt_Str_Seal_NoWeapon);
		return false;
	};

	power = tierPower + hero.level;
	existing = StExt_GetItemSeal(weap);
	if (existing > 0)
	{
		if (StExt_GetSpellElementIndex(existing) != element)
		{
			ai_printred(StExt_Str_Seal_ElementMismatch);
			return false;
		};
		if (StExt_GetItemSealPower(weap) >= power)
		{
			ai_printred(StExt_Str_Seal_NotBetter);
			return false;
		};
	};

	spellId = StExt_RollElementSpell(element);
	if (spellId == StExt_Null) { return false; };
	if (!StExt_SetItemSeal(weap, spellId, power))
	{
		ai_printred(StExt_Str_Seal_CannotSeal);
		return false;
	};

	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(StExt_Str_Seal_Applied);
	return true;
};

// Call once per mod tick (StExt_ModController): cooldown + charged glow.
func void StExt_ItemAbilitiesController()
{
	if (StExt_WeaponSkill_Charged)
	{
		StExt_WeaponSkill_GlowTick -= 1;
		if (StExt_WeaponSkill_GlowTick <= 0)
		{
			rx_playeffect("spellfx_incovation_violet", hero);
			StExt_WeaponSkill_GlowTick = 2;
		};
	};

	if (StExt_WeaponSkill_Cooldown <= 0) { return; };
	if (accelerationactive) { StExt_WeaponSkill_Cooldown -= accelerationratio; }
	else { StExt_WeaponSkill_Cooldown -= 1; };
	if (StExt_WeaponSkill_Cooldown < 0) { StExt_WeaponSkill_Cooldown = 0; };
};
