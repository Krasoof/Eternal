
//===================================================================//
//					Weapon element (perk) + H-skill					 //
//===================================================================//
// A weapon may carry an ELEMENT: a random offensive spell rolled at
// generation (DLL, chance = StExt_WeaponElementRollChance) or granted
// by a seal gem of that element. The element lives in the item
// extension (SpellId + SpellPower), so it persists in saves.
//
// H-skill: charges the weapon element; the next landed hit gets a flat
// elemental damage BOOST and the weapon glows while charged. The element
// also adds passive elemental damage to EVERY hit (no cost, no casts).

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
		if (r == 1) { return spl_chargezap; };
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

// Add elemental damage straight into the current hit's damage channels.
func void StExt_AddElementHitDamage(var int element, var int amount)
{
	if (amount <= 0) { return; };
	if (element == StExt_MasteryIndex_Fire) { StExt_ExtraDamageInfo.Damage[dam_index_fire] += amount; return; };
	if (element == StExt_MasteryIndex_Air) { StExt_ExtraDamageInfo.Damage[dam_index_fly] += amount; return; };
	if (element == StExt_MasteryIndex_Earth) { StExt_ExtraDamageInfo.Damage[dam_index_blunt] += amount; return; };
	// ice / electric / light / dark / death -> magic channel
	StExt_ExtraDamageInfo.Damage[dam_index_magic] += amount;
};

// Call from StExt_Hero_AfterOffenceHandler on the hero's next landed hit:
// the charged element is released as a flat damage BOOST on this hit.
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
	StExt_AddElementHitDamage(StExt_GetSpellElementIndex(spellId), power);
	ai_printbonus(StExt_Str_WeaponSkill_Released);
};

//===================================================================//
//		Weapon element: perk (flat dmg) + seal (spell proc)			 //
//===================================================================//
// PERK (rolled at generation, prop SpellId/SpellPower): flat elemental
// damage on EVERY hit. Magic weapons pay a small mana surcharge per
// hit and in return the element is EMPOWERED (+50% and int bonus).
// SEAL (gem, prop SealSpellId/SealPower): casts its spell every X hits
// (X from seal power); each proc costs mana (magic) / stamina (else).

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

// Call from StExt_Hero_AfterOffenceHandler on every landed hit.
func void StExt_TriggerWeaponSealOnHit(var c_npc atk, var c_npc target, var c_item weap)
{
	var int perkSpell;
	var int sealSpell;
	var int sealPower;
	var int element;
	var int amount;
	var int manaCost;
	var int power;

	if (!hlp_isvaliditem(weap)) { return; };
	if (!hlp_isvalidnpc(target) || c_npcisdown(target)) { return; };

	// --- PERK: flat elemental damage every hit ---
	perkSpell = StExt_GetItemSeal(weap);
	if (perkSpell > 0)
	{
		element = StExt_GetSpellElementIndex(perkSpell);
		amount = StExt_GetItemSealPower(weap) / 3;
		amount += StExt_GetElementMasteryPowerStat(element) / 10;
		amount += StExt_GetElementMasteryLevel(element) / 2;

		// magic weapons: small mana surcharge empowers the element
		if (StExt_WeaponSkillUsesMana(weap))
		{
			manaCost = 3 + (StExt_GetItemSealPower(weap) / 25);
			if (hero.attribute[atr_mana] >= manaCost)
			{
				hero.attribute[atr_mana] = hero.attribute[atr_mana] - manaCost;
				amount += (amount / 2) + (atr_intellect / 20);
			};
		};
		StExt_AddElementHitDamage(element, amount);
	};

	// --- SEAL: spell proc every X hits ---
	sealSpell = StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId);
	if (sealSpell <= 0) { return; };
	sealPower = StExt_GetItemProperty(weap, StExt_ItemProp_SealPower);

	StExt_WeaponSeal_HitCounter += 1;
	if (StExt_WeaponSeal_HitCounter < StExt_GetSealProcInterval(sealPower)) { return; };
	// unpaid proc stays pending: counter is only reset after payment
	if (!StExt_PaySealCost(weap, sealPower)) { return; };
	StExt_WeaponSeal_HitCounter = 0;

	power = StExt_CalcWeaponBurstPower(weap, sealSpell, sealPower);
	StExt_CastSpell(StExt_AbilityPrefix + sealSpell, atk, target, power);
};

// Apply a seal gem of the given ELEMENT to the hero's equipped weapon.
// Power scales with hero level. If the weapon already has an element,
// the seal must MATCH it and only upgrades when stronger.
// Returns true on success (caller consumes the seal item).
func int StExt_ApplySeal(var int element, var int tierPower)
{
	var c_item weap;
	var int perkSpell;
	var int existingSeal;
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
	if (!StExt_ItemHasExtension(weap))
	{
		ai_printred(StExt_Str_Seal_CannotSeal);
		return false;
	};

	power = tierPower + hero.level;

	// if the weapon has an element perk, the seal must match its element
	perkSpell = StExt_GetItemSeal(weap);
	if (perkSpell > 0)
	{
		if (StExt_GetSpellElementIndex(perkSpell) != element)
		{
			ai_printred(StExt_Str_Seal_ElementMismatch);
			return false;
		};
	};

	// replacing an existing seal requires a stronger one
	existingSeal = StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId);
	if (existingSeal > 0)
	{
		if (StExt_GetItemProperty(weap, StExt_ItemProp_SealPower) >= power)
		{
			ai_printred(StExt_Str_Seal_NotBetter);
			return false;
		};
	};

	spellId = StExt_RollElementSpell(element);
	if (spellId == StExt_Null) { return false; };
	StExt_SetItemProperty(weap, StExt_ItemProp_SealSpellId, spellId);
	StExt_SetItemProperty(weap, StExt_ItemProp_SealPower, power);

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
