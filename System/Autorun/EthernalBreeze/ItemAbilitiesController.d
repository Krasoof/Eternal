
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
	if (spellId >= 9000) { return StExt_Null; };	// physical seal sentinel, not a spell
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
// Rdzen SKALARNY (same inty): wolany przez runtime ORAZ tooltip (DLL ->
// CallFunc) - jedno zrodlo prawdy. Selekcja proficiency/atrybutu z flag
// broni odtwarza 1:1 StExt_GetWeaponProficiency/GetWeaponBurstStat.
func int StExt_CalcBurstPowerScalar(var int spellId, var int extraBase, var int weaponDmg, var int weaponFlags, var int usesMana)
{
	var int power;
	var int element;
	element = StExt_GetSpellElementIndex(spellId);
	power = 20 + extraBase + weaponDmg;
	power += StExt_GetElementMasteryPowerStat(element) + (StExt_GetElementMasteryLevel(element) * 2);
	// proficiency (1h/2h/bow/xbow)
	if (StExt_ValueHasFlag(weaponFlags, item_bow)) { power += StExt_PcStats[StExt_PcStats_Index_BowMastery]; }
	else if (StExt_ValueHasFlag(weaponFlags, item_crossbow)) { power += StExt_PcStats[StExt_PcStats_Index_CBowMastery]; }
	else if (StExt_ValueHasFlag(weaponFlags, item_2hd_axe) || StExt_ValueHasFlag(weaponFlags, item_2hd_swd)) { power += StExt_PcStats[StExt_PcStats_Index_2hMastery]; }
	else { power += StExt_PcStats[StExt_PcStats_Index_1hMastery]; };
	// attribute: magic -> int + moc magiczna; bow/xbow/dagger -> dex; else str
	if (usesMana) { power += atr_intellect + StExt_PcStats[StExt_PcStats_Index_MagicPower]; }
	else if (StExt_ValueHasFlag(weaponFlags, item_bow) || StExt_ValueHasFlag(weaponFlags, item_crossbow) || StExt_ValueHasFlag(weaponFlags, item_dag)) { power += hero.attribute[5]; }
	else { power += hero.attribute[4]; };
	power += StExt_GetPermilleFromValue(power, StExt_SoulKnight_BonusPermille());
	// jewelry affixes: weapon SEAL/rune damage (flat + capped %)
	power += StExt_GetPcStat(StExt_PcStats_Index_ExtraWeapSealDam);
	power += StExt_GetPermilleFromValue(power, StExt_ValidateValueRange(StExt_GetPcStat(StExt_PcStats_Index_ExtraWeapSealDamPerc), 0, 150));
	return power;
};

func int StExt_CalcWeaponBurstPower(var c_item weap, var int spellId, var int extraBase)
{
	return StExt_CalcBurstPowerScalar(spellId, extraBase, StExt_CalcWeaponTotalDamage(weap), weap.flags, StExt_WeaponSkillUsesMana(weap));
};

// Jedno zrodlo prawdy dla zywiolu na broni: TEN wzor liczy bonus per hit
// i TEN SAM wzor wola tooltip (DLL -> CallFunc). Zmieniasz tu - zmienia
// sie i cios, i opis na broni.
// INT + moc magiczna zasilaja zywiol na KAZDEJ broni (lustro sily w
// fizycznym ciosie) - wczesniej fizyczny topor mial z 550 INT rowne zero.
func int StExt_CalcElementHitAmount(var int element, var int sealPower, var int realDamage, var int usesMana)
{
	var int amount;
	var int mLvl;

	if ((element < StExt_MasteryIndex_Fire) || (element > StExt_MasteryIndex_Death)) { return 0; };
	mLvl = StExt_GetElementMasteryLevel(element);

	amount = sealPower / 2;
	amount += StExt_GetElementMasteryPowerStat(element) / 6;
	amount += mLvl * 5;
	amount += (atr_intellect / 10) + (StExt_PcStats[StExt_PcStats_Index_MagicPower] / 10);
	amount += StExt_GetPermilleFromValue(realDamage, StExt_ValidateValueRange((mLvl * 4) + (atr_intellect / 5), 0, 350));
	amount += StExt_GetPermilleFromValue(amount, StExt_SoulKnight_BonusPermille());
	// magic weapons empower the element further (dawny czlon atr_intellect/20
	// wchlonal wspolny skladnik INT powyzej)
	if (usesMana) { amount += amount / 2; };
	// Spellblade perk "Ostrze Zywiolow": +30% weapon element damage
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_ElementBlade)) { amount += StExt_GetPermilleFromValue(amount, 300); };
	// Mastery spellblade (slot 16): +25% zywiolu tego drzewka
	if (StExt_IsSpellbladePerk(element, StExt_MasteryPerkIndex_Element_Blade)) { amount += StExt_GetPermilleFromValue(amount, 250); };
	// jewelry affixes: weapon ELEMENT damage (flat + capped %)
	amount += StExt_GetPcStat(StExt_PcStats_Index_ExtraWeapElementDam);
	amount += StExt_GetPermilleFromValue(amount, StExt_ValidateValueRange(StExt_GetPcStat(StExt_PcStats_Index_ExtraWeapElementDamPerc), 0, 150));
	return amount;
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

// Add elemental damage straight into the current hit's PIERCE channels.
// Zywiol PRZEBIJA pancerz (decyzja 2026-07-18): DLL aplikuje PierceDamage
// PO odjeciu protekcji; immunitet (protection < 0) nadal respektowany.
func void StExt_AddElementHitDamage(var int element, var int amount)
{
	if (amount <= 0) { return; };
	if (element == StExt_MasteryIndex_Fire) { StExt_ExtraDamageInfo.PierceDamage[dam_index_fire] += amount; return; };
	if (element == StExt_MasteryIndex_Air) { StExt_ExtraDamageInfo.PierceDamage[dam_index_fly] += amount; return; };
	if (element == StExt_MasteryIndex_Earth) { StExt_ExtraDamageInfo.PierceDamage[dam_index_blunt] += amount; return; };
	// ice / electric / light / dark / death -> magic channel
	StExt_ExtraDamageInfo.PierceDamage[dam_index_magic] += amount;
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
	StExt_ElementBuildup_Feed(target, StExt_GetSpellElementIndex(spellId), power);
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

// Strong seal -> every 2 hits; weak -> every 6. Never every single hit.
// Wzor wolany takze przez tooltip (DLL -> CallFunc) - jedno zrodlo prawdy.
func int StExt_GetSealProcInterval(var int sealPower, var int element)
{
	var int n;
	// /110 (bylo /80): floor 2 dobijany dopiero przy mocy 440 - endgame
	// pieczeci lvl ~50+, nie polowa rozdzialu 2 (krzywa 60-poziomowa).
	n = 6 - (sealPower / 110);
	// Mastery spellblade (slot 17): proc o jeden hit wczesniej
	if (StExt_IsSpellbladePerk(element, StExt_MasteryPerkIndex_Element_Seal)) { n -= 1; };
	return StExt_ValidateValueRange(n, 2, 6);
};

// Deduct the per-proc cost of an ELEMENTAL seal. It casts a spell, so it
// always costs MANA regardless of weapon type; no mana means no proc (the
// weapon still swings). Physical seals pay stamina in their own branch.
// Koszt = % MAX many (kanon: nigdy flat) - stary flat 10+moc/10 byl
// niewidzialny przy poznogrowych pulach many ("runy broni nie jedza
// many"). Moc 160 -> 3.5% max many per proc, floor 10 pkt.
func int StExt_PaySealCost(var c_item weap, var int sealPower)
{
	var int cost;
	// /12 clamp 80 (bylo /8 clamp 60): koszt rosnie wolniej, ale sufit
	// wyzej (8% max many) - wysoko wlevelowana pieczec ma byc DROGA.
	cost = StExt_GetPermilleFromValue(hero.attribute[atr_mana_max], StExt_ValidateValueRange(15 + (sealPower / 12), 15, 80));
	// Mastery spellblade (slot 18, Conduit): -25% kosztu many zywiolu broni
	if (StExt_IsSpellbladePerk(StExt_GetSpellElementIndex(StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId)), StExt_MasteryPerkIndex_Element_Conduit)) { cost -= StExt_GetPercentFromValue(cost, 25); };
	cost = StExt_ValidateValueMin(cost, 10);
	if (hero.attribute[atr_mana] < cost) { return false; };
	hero.attribute[atr_mana] = hero.attribute[atr_mana] - cost;
	// TEMP DIAG (runy broni maja jesc mane): rachunek kazdego procu.
	StExt_Trace(concatstrings(concatstrings("SEAL proc: koszt=", inttostring(cost)), concatstrings(" manaTeraz=", inttostring(hero.attribute[atr_mana]))));
	return true;
};

// Seal leveling: every successful proc grants xp.
// Krzywa 60-poziomowa (2026-07-19): stara krzywa byla z ery capu 10 -
// prog 12+lvl*10 dawal ~18.4k procow do 60, a moc +4+lvl sypala +2070
// (martwa progresja: interwal floorowal przy lvl ~15, mana capowala tuz
// za nim). Teraz: prog 20+lvl*3 (~6.5k procow do 60, levelowanie w
// KAZDYM akcie gry), moc +2+lvl/6 (+250 do 60 - sufity wzorow dobijane
// dopiero w prawdziwym endgame). Czlon +0.5%/lvl w obrazeniach procu
// wchodzi z Faza 5 (DLL, arg tooltipa).
func void StExt_SealGainXp(var c_item weap)
{
	var int lvl;
	var int xp;

	lvl = StExt_GetItemProperty(weap, StExt_ItemProp_SealLevel);
	if (lvl >= StExt_SealLevelMax) { return; };
	xp = StExt_GetItemProperty(weap, StExt_ItemProp_SealXp) + 1;
	if (xp < (20 + (lvl * 3)))
	{
		StExt_SetItemProperty(weap, StExt_ItemProp_SealXp, xp);
		return;
	};
	lvl += 1;
	StExt_SetItemProperty(weap, StExt_ItemProp_SealLevel, lvl);
	StExt_SetItemProperty(weap, StExt_ItemProp_SealXp, 0);
	StExt_SetItemProperty(weap, StExt_ItemProp_SealPower, StExt_GetItemProperty(weap, StExt_ItemProp_SealPower) + 2 + (lvl / 6));
	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(concatstrings(StExt_Str_Seal_LevelUp, inttostring(lvl)));
};

// Channeling an element through your weapon slowly trains that element's
// mastery. Gated inside StExt_AddMasteryExp by profession (Soul Knights
// only grow their two sworn elements; 0 for everyone the profession blocks).
// Deliberately RARE - a chance per hit/proc for a single exp point - because
// this is meant to trickle over a 100h+ playthrough, not grind out fast.
func void StExt_GainElementMasteryFromUse(var int element, var int chance)
{
	if (element < 0) { return; };
	if (hlp_random(100) < chance) { StExt_AddMasteryExp(element, 1); };
};

// Pelna moc procu pieczeci zywiolowej (rdzen skalarny; runtime + tooltip).
// Baza pieczeci jest POLOWIONA (weapon dmg + masteria juz siedza w
// CalcBurstPowerScalar - pelne sealPower liczyloby sie podwojnie), calosc
// skalowana +60%, potem czlon POZIOMU pieczeci (+0.5%/lvl, do +30% przy
// 60 - krzywa 60-poziomowa: sam level ma znaczyc, nie tylko moc), perki.
func int StExt_CalcSealProcPower(var int sealSpell, var int sealPower, var int sealLvl, var int weaponDmg, var int weaponFlags, var int usesMana)
{
	var int power;
	power = StExt_CalcBurstPowerScalar(sealSpell, sealPower / 2, weaponDmg, weaponFlags, usesMana);
	power = StExt_ApplyPercentToValue(power, 60);
	power += StExt_GetPermilleFromValue(power, StExt_ValidateValueRange(sealLvl * 5, 0, 300));
	// Spellblade perk "Mistrz Pieczeci": +30% elemental seal spell damage
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SealMaster)) { power += StExt_GetPermilleFromValue(power, 300); };
	// Mastery spellblade (slot 17): +20% mocy procu pieczeci tego zywiolu
	if (StExt_IsSpellbladePerk(StExt_GetSpellElementIndex(sealSpell), StExt_MasteryPerkIndex_Element_Seal)) { power += StExt_GetPermilleFromValue(power, 200); };
	// Costly perk "Splot Many": elemental seal also scales with max mana
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SealManaScale)) { power += hero.attribute[atr_mana_max] / 5; };
	return power;
};

// Baza krwawienia per tick (bez czlonu %maxHP celu - ten dolicza runtime).
func int StExt_CalcBleedTickBase(var int sealPower, var int sealLvl)
{
	var int physStat;
	physStat = hero.attribute[4];
	if (hero.attribute[5] > physStat) { physStat = hero.attribute[5]; };
	return (physStat / 10) + (sealPower / 12) + (sealLvl * 3);
};

// Permille ciosu ignorujace pancerz (pieczec Przebicia); cap 70%.
func int StExt_CalcPiercePermille(var int sealPower, var int sealLvl)
{
	var int physStat;
	physStat = hero.attribute[4];
	if (hero.attribute[5] > physStat) { physStat = hero.attribute[5]; };
	return StExt_ValidateValueRange(40 + (physStat / 4) + (sealPower / 8) + (sealLvl * 4), 40, 700);
};

//===================================================================//
//		Tooltip (DLL -> CallFunc): TE SAME wzory co runtime			 //
//===================================================================//
// ItemInfoPanel wola te funkcje zamiast utrzymywac reczne lustra wzorow
// w C++ (lustra rozjezdzaly sie z runtime - "dziwne liczby na broni").
// Kontrakt CallFunc: argumenty i zwrot wylacznie int.

// Realny cios per postac: projekcja obrazen PO naszych skalowaniach -
// silnikowa baza (bron + statystyka wiodaca wg typu) + flat/procentowe
// bonusy melee/range + bonus klasy broni (DLL, PcStats 319-324 przez
// GetPcStat - indeksow 311+ parser nie czyta wprost). SZACUNEK: bez
// crita, bez pancerza celu, bez zywiolu/pieczeci (maja wlasne linie);
// dex-miecze NB (bit_item_pierce_damage) licza tu jak STR - przyblizenie.
func int StExt_Tooltip_RealHit(var int weaponDmg, var int weaponFlags, var int hasSpell)
{
	var int proj;
	var int prc;

	proj = weaponDmg;
	if (StExt_ValueHasFlag(weaponFlags, item_dag) || StExt_ValueHasFlag(weaponFlags, item_bow) || StExt_ValueHasFlag(weaponFlags, item_crossbow)) { proj += hero.attribute[5]; }
	else if (hasSpell) { proj += atr_intellect; }
	else { proj += hero.attribute[4]; };

	if (StExt_ValueHasFlag(weaponFlags, item_bow) || StExt_ValueHasFlag(weaponFlags, item_crossbow))
	{
		proj += StExt_PcStats[StExt_PcStats_Index_ExtraDamage] + StExt_PcStats[StExt_PcStats_Index_ExtraRangeDam];
		if (StExt_ValueHasFlag(weaponFlags, item_bow)) { proj += StExt_PcStats[StExt_PcStats_Index_BowExtraDam]; }
		else { proj += StExt_PcStats[StExt_PcStats_Index_CBowExtraDam]; };
		prc = StExt_PcStats[StExt_PcStats_Index_ExtraDamagePerc] + StExt_PcStats[StExt_PcStats_Index_ExtraRangeDamPerc] + (3 * StExt_Talent_Progression[StExt_MasteryIndex_Archery]);
	}
	else
	{
		proj += StExt_PcStats[StExt_PcStats_Index_ExtraDamage] + StExt_PcStats[StExt_PcStats_Index_ExtraMeleeDam];
		if (StExt_ValueHasFlag(weaponFlags, item_swd) || StExt_ValueHasFlag(weaponFlags, item_axe) || StExt_ValueHasFlag(weaponFlags, item_dag)) { proj += StExt_PcStats[StExt_PcStats_Index_1hExtraDam]; };
		if (StExt_ValueHasFlag(weaponFlags, item_2hd_swd) || StExt_ValueHasFlag(weaponFlags, item_2hd_axe)) { proj += StExt_PcStats[StExt_PcStats_Index_2hExtraDam]; };
		prc = StExt_PcStats[StExt_PcStats_Index_ExtraDamagePerc] + StExt_PcStats[StExt_PcStats_Index_ExtraMeleeDamPerc] + (3 * StExt_Talent_Progression[StExt_MasteryIndex_MartialArts]);
		// bonus klasy broni z DLL: miecz 319/320, topor 321/322, sztylet 323/324 (flat/permille)
		if (StExt_ValueHasFlag(weaponFlags, item_dag)) { proj += StExt_GetPcStat(323); prc += StExt_GetPcStat(324); }
		else if (StExt_ValueHasFlag(weaponFlags, item_axe) || StExt_ValueHasFlag(weaponFlags, item_2hd_axe)) { proj += StExt_GetPcStat(321); prc += StExt_GetPcStat(322); }
		else { proj += StExt_GetPcStat(319); prc += StExt_GetPcStat(320); };
	};
	proj += StExt_GetPermilleFromValue(proj, prc);
	return proj;
};

func int StExt_Tooltip_ElementPerHit(var int spellId, var int sealPower, var int weaponDmg, var int usesMana)
{
	return StExt_CalcElementHitAmount(StExt_GetSpellElementIndex(spellId), sealPower, weaponDmg, usesMana);
};

func int StExt_Tooltip_SealProcInterval(var int sealSpell, var int sealPower)
{
	return StExt_GetSealProcInterval(sealPower, StExt_GetSpellElementIndex(sealSpell));
};

func int StExt_Tooltip_BurstPower(var int spellId, var int extraBase, var int weaponDmg, var int weaponFlags, var int usesMana)
{
	return StExt_CalcBurstPowerScalar(spellId, extraBase, weaponDmg, weaponFlags, usesMana);
};

// Stary wrapper zostaje (symboli parsera nie usuwamy) - liczy bez czlonu
// poziomu. DLL uzywa wersji L z poziomem pieczeci.
func int StExt_Tooltip_SealProcDamage(var int sealSpell, var int sealPower, var int weaponDmg, var int weaponFlags, var int usesMana)
{
	return StExt_CalcSealProcPower(sealSpell, sealPower, 0, weaponDmg, weaponFlags, usesMana);
};

func int StExt_Tooltip_SealProcDamageL(var int sealSpell, var int sealPower, var int sealLvl, var int weaponDmg, var int weaponFlags, var int usesMana)
{
	return StExt_CalcSealProcPower(sealSpell, sealPower, sealLvl, weaponDmg, weaponFlags, usesMana);
};

func int StExt_Tooltip_BleedTick(var int sealPower, var int sealLvl)
{
	var int amount;
	amount = StExt_CalcBleedTickBase(sealPower, sealLvl);
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_BloodSeal)) { amount += StExt_GetPermilleFromValue(amount, 300); };
	if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SealStaminaScale)) { amount += atr_stamina / 6; };
	amount += StExt_GetPermilleFromValue(amount, StExt_ValidateValueRange(StExt_GetPcStat(StExt_PcStats_Index_BleedingPowerPerc), 0, 250));
	return amount;
};

func int StExt_Tooltip_PiercePermille(var int sealPower, var int sealLvl)
{
	return StExt_CalcPiercePermille(sealPower, sealLvl);
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
	var int physStat;
	var int sealLvl;

	if (!hlp_isvaliditem(weap)) { return; };
	if (!hlp_isvalidnpc(target) || c_npcisdown(target)) { return; };

	// --- PERK: flat elemental damage every hit, COSTS MANA to manifest ---
	// No mana -> the weapon still swings for its physical damage, but the
	// element does NOT ignite this hit. Magic weapons empower it further.
	perkSpell = StExt_GetItemSeal(weap);
	if (perkSpell > 0)
	{
		element = StExt_GetSpellElementIndex(perkSpell);
		// %-based mana cost per hit (flat was free with a big pool): scales
		// with the weapon's damage AND the seal/perk power. 0.8% floor,
		// capped at 12% of max mana per landed hit.
		manaCost = StExt_GetPermilleFromValue(hero.attribute[atr_mana_max],
			StExt_ValidateValueRange(8 + (weap.damagetotal / 5) + (StExt_GetItemSealPower(weap) / 10), 8, 120));
		// Mastery spellblade (slot 18, Conduit): -25% kosztu many zywiolu
		if (StExt_IsSpellbladePerk(element, StExt_MasteryPerkIndex_Element_Conduit)) { manaCost -= StExt_GetPercentFromValue(manaCost, 25); };
		manaCost = StExt_ValidateValueMin(manaCost, 1);
		if (hero.attribute[atr_mana] >= manaCost)
		{
			hero.attribute[atr_mana] = hero.attribute[atr_mana] - manaCost;

			// Pelny wzor w StExt_CalcElementHitAmount (jedno zrodlo prawdy,
			// wolane tez przez tooltip). Skaluje z INT/moca magiczna na
			// KAZDEJ broni + masteria zywiolu + % realnego ciosu.
			amount = StExt_CalcElementHitAmount(element, StExt_GetItemSealPower(weap), StExt_DamageInfo.RealDamage, StExt_WeaponSkillUsesMana(weap));
			StExt_AddElementHitDamage(element, amount);
			StExt_ElementBuildup_Feed(target, element, amount);
			// slow mastery trickle from channeling the weapon's element
			StExt_GainElementMasteryFromUse(element, 4);
		};
	};

	// --- SEAL: spell proc every X hits / physical effect every hit ---
	sealSpell = StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId);
	if (sealSpell <= 0) { return; };
	sealPower = StExt_GetItemProperty(weap, StExt_ItemProp_SealPower);

	// physical seals: work every hit for a %-based resource cost (flat was
	// free with a big pool). Scales with weapon damage AND seal level;
	// magic weapons pay from max mana, the rest from max stamina.
	if (sealSpell >= 9000)
	{
		sealLvl = StExt_GetItemProperty(weap, StExt_ItemProp_SealLevel);
		if (StExt_WeaponSkillUsesMana(weap))
		{
			manaCost = StExt_GetPermilleFromValue(hero.attribute[atr_mana_max],
				StExt_ValidateValueRange(8 + (weap.damagetotal / 5) + sealLvl, 8, 120));
			manaCost = StExt_ValidateValueMin(manaCost, 1);
			if (hero.attribute[atr_mana] < manaCost) { return; };
			hero.attribute[atr_mana] = hero.attribute[atr_mana] - manaCost;
		}
		else
		{
			manaCost = StExt_GetPermilleFromValue(atr_stamina_max,
				StExt_ValidateValueRange(8 + (weap.damagetotal / 5) + sealLvl, 8, 120));
			manaCost = StExt_ValidateValueMin(manaCost, 1);
			if (atr_stamina < manaCost) { return; };
			rx_restorestamina(-manaCost);
		};

		// Physical seals scale MAINLY from the dominant physical stat (STR
		// or DEX, whichever is higher) - baza w StExt_CalcBleedTickBase /
		// StExt_CalcPiercePermille (wspolne z tooltipem).
		physStat = hero.attribute[4];
		if (hero.attribute[5] > physStat) { physStat = hero.attribute[5]; };

		if (sealSpell == StExt_PhysSeal_Bleed)
		{
			// bleeding: per-tick flat (STR/DEX + seal power) PLUS a % of the
			// target's MAX HP that grows with seal level. The %-max-HP term keeps
			// bleed relevant against 100k-300k HP bosses without one-shotting
			// trash (0.5%/tick at lvl 10 -> 3%/tick at lvl 60, capped 30 permille).
			amount = StExt_CalcBleedTickBase(sealPower, sealLvl);
			amount += StExt_GetPermilleFromValue(target.attribute[atr_hitpoints_max], StExt_ValidateValueRange(sealLvl / 2, 0, 30));
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_BloodSeal)) { amount += StExt_GetPermilleFromValue(amount, 300); };
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SealStaminaScale)) { amount += atr_stamina / 6; };
			// jewelry affix: bleeding amplifier (cap +25%)
			amount += StExt_GetPermilleFromValue(amount, StExt_ValidateValueRange(StExt_GetPcStat(StExt_PcStats_Index_BleedingPowerPerc), 0, 250));
			StExt_AddDotDamageToExtraDamageInfo(StExt_ExtraDamageInfo, StExt_Npc_CalcDotDuration(atk), amount, dam_index_point);
		};
		if (sealSpell == StExt_PhysSeal_Pierce)
		{
			// armor piercing: % of the hit ignores protection (true damage).
			// scales with STR/DEX, seal power AND seal level; capped at 70%.
			amount = StExt_GetPermilleFromValue(StExt_DamageInfo.RealDamage, StExt_CalcPiercePermille(sealPower, sealLvl));
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_BloodSeal)) { amount += StExt_GetPermilleFromValue(amount, 300); };
			if (StExt_IsGenericPerkLearned(StExt_PerkIndex_SealStaminaScale)) { amount += atr_stamina / 8; };
			StExt_ExtraDamageInfo.Damage += amount;
		};
		// Pieczecie fizyczne dzialaja CO CIOS (elementarne co 2-6) - XP co
		// 3. proc wyrownuje tempo levelowania obu rodzin do wspolnej krzywej.
		StExt_PhysSealXp_Counter += 1;
		if (StExt_PhysSealXp_Counter >= 3)
		{
			StExt_PhysSealXp_Counter = 0;
			StExt_SealGainXp(weap);
		};
		return;
	};

	StExt_WeaponSeal_HitCounter += 1;
	if (StExt_WeaponSeal_HitCounter < StExt_GetSealProcInterval(sealPower, StExt_GetSpellElementIndex(sealSpell))) { return; };
	// unpaid proc stays pending: counter is only reset after payment
	if (!StExt_PaySealCost(weap, sealPower)) { return; };
	StExt_WeaponSeal_HitCounter = 0;

	// Pelny wzor (baza polowiona, +60%, czlon poziomu, perki) w
	// StExt_CalcSealProcPower - jedno zrodlo prawdy, wolane tez przez tooltip.
	sealLvl = StExt_GetItemProperty(weap, StExt_ItemProp_SealLevel);
	power = StExt_CalcSealProcPower(sealSpell, sealPower, sealLvl, StExt_CalcWeaponTotalDamage(weap), weap.flags, StExt_WeaponSkillUsesMana(weap));
	StExt_CastSpell(StExt_AbilityPrefix + sealSpell, atk, target, power);
	StExt_ElementBuildup_Feed(target, StExt_GetSpellElementIndex(sealSpell), power);
	StExt_SealGainXp(weap);
	// slow mastery trickle from actively casting the seal's element
	StExt_GainElementMasteryFromUse(StExt_GetSpellElementIndex(sealSpell), 12);
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

// Apply a PHYSICAL seal (bleed / armor pierce) - fits any weapon,
// no element matching; replacing still requires a stronger seal.
func int StExt_ApplyPhysSeal(var int sentinelId, var int tierPower)
{
	var c_item weap;
	var int existingSeal;
	var int power;

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
	existingSeal = StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId);
	if (existingSeal > 0)
	{
		if (StExt_GetItemProperty(weap, StExt_ItemProp_SealPower) >= power)
		{
			ai_printred(StExt_Str_Seal_NotBetter);
			return false;
		};
	};

	StExt_SetItemProperty(weap, StExt_ItemProp_SealSpellId, sentinelId);
	StExt_SetItemProperty(weap, StExt_ItemProp_SealPower, power);

	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(StExt_Str_Seal_Applied);
	return true;
};

// Element glow. Fire/Ice/Electric use RETURNING'S OWN enchant visuals - the same
// ones Gallahad / the Adanos-warrior enchant put on a blade, so they are proven to
// cover the whole weapon with the right colour. Our home-made SPELLFX_STEXT_WGLOW_*
// only ever lit the hilt: a "MESH"-shaped emitter with no shpMesh_S has no geometry
// to sample, so every particle spawned at the vob origin.
// The remaining five elements have no base equivalent and still use our own FX until
// they are rebuilt on the base template (see docs/DESIGN_WeaponGlow notes).
func string StExt_GetElementGlowFx(var int element)
{
	// All eight elements run our own FX again. The Adanos-warrior enchants were a
	// detour: they light the HILT by design, which is exactly the look we were
	// trying to get rid of. Ours carry the per-element colours and now land on the
	// blade (see emadjustshptoorigin in VisualEffects.d).
	if (element == StExt_MasteryIndex_Fire) { return "SPELLFX_STEXT_WGLOW_FIRE"; };
	if (element == StExt_MasteryIndex_Ice) { return "SPELLFX_STEXT_WGLOW_ICE"; };
	if (element == StExt_MasteryIndex_Electric) { return "SPELLFX_STEXT_WGLOW_ELECTRIC"; };
	if (element == StExt_MasteryIndex_Air) { return "SPELLFX_STEXT_WGLOW_AIR"; };
	if (element == StExt_MasteryIndex_Earth) { return "SPELLFX_STEXT_WGLOW_EARTH"; };
	if (element == StExt_MasteryIndex_Light) { return "SPELLFX_STEXT_WGLOW_LIGHT"; };
	if (element == StExt_MasteryIndex_Dark) { return "SPELLFX_STEXT_WGLOW_DARK"; };
	if (element == StExt_MasteryIndex_Death) { return "SPELLFX_STEXT_WGLOW_DEATH"; };
	return "";
};

// Elemental glow played at the weapon hand (ZS_RIGHTHAND anchored VFX).
func void StExt_PlayWeaponElementGlow(var int element)
{
	var string fx;
	fx = StExt_GetElementGlowFx(element);
	if (StExt_StringIsEmpty(fx)) { return; };
	rx_playeffect(fx, hero);
};

//===================================================================//
//			Equipped armor / jewelry element perks					 //
//===================================================================//
// Legendary/epic armor and jewelry can roll an element perk (DLL).
// Offence: each equipped perk adds flat elemental damage to hits.
// Defence (Aegis): chance to retaliate with the perk's spell.

func void StExt_ApplyEquippedPerkHit(var int slot)
{
	var int spell;
	var int power;
	var int element;
	var int amount;

	spell = StExt_GetEquippedPerk(hero, slot, 0);
	if (spell <= 0) { return; };
	element = StExt_GetSpellElementIndex(spell);
	if (element == StExt_Null) { return; };
	power = StExt_GetEquippedPerk(hero, slot, 1);
	amount = (power / 6) + (StExt_GetElementMasteryPowerStat(element) / 12);
	StExt_AddElementHitDamage(element, amount);
};

// Call from StExt_Hero_AfterOffenceHandler (after weapon triggers).
func void StExt_TriggerEquippedPerksOnHit(var c_npc atk, var c_npc target)
{
	if (!hlp_isvalidnpc(target) || c_npcisdown(target)) { return; };
	StExt_ApplyEquippedPerkHit(0);
	StExt_ApplyEquippedPerkHit(1);
	StExt_ApplyEquippedPerkHit(2);
	StExt_ApplyEquippedPerkHit(3);
	StExt_ApplyEquippedPerkHit(4);
	StExt_ApplyEquippedPerkHit(5);
};

func void StExt_ApplyAegisSlot(var int slot, var c_npc atk)
{
	var int spell;
	var int power;
	var int element;

	spell = StExt_GetEquippedPerk(hero, slot, 0);
	if (spell <= 0) { return; };
	element = StExt_GetSpellElementIndex(spell);
	if (element == StExt_Null) { return; };
	power = StExt_GetEquippedPerk(hero, slot, 1);
	if (!StExt_Chance(10 + (power / 10))) { return; };
	StExt_CastSpell(spell, hero, atk, (power / 2) + (StExt_GetElementMasteryPowerStat(element) / 4) + StExt_GetElementMasteryLevel(element));
};

// Call from StExt_Hero_AfterDefenceHandler: elemental retaliation.
func void StExt_TriggerAegisOnDefence(var c_npc atk)
{
	if (!hlp_isvalidnpc(atk) || c_npcisdown(atk)) { return; };
	if (!hlp_isvalidnpc(hero) || c_npcisdown(hero)) { return; };
	StExt_ApplyAegisSlot(0, atk);
	StExt_ApplyAegisSlot(1, atk);
	StExt_ApplyAegisSlot(2, atk);
	StExt_ApplyAegisSlot(3, atk);
	StExt_ApplyAegisSlot(4, atk);
	StExt_ApplyAegisSlot(5, atk);
};

// Call once per mod tick (StExt_ModController): cooldown + weapon glow.
// Charged: bright pulse every tick. Perk/seal on equipped weapon:
// subtle elemental shimmer every 3rd tick.
func void StExt_ItemAbilitiesController()
{
	var c_item weap;
	var int glowSpell;
	var int element;

	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };
	if (hlp_isvaliditem(weap))
	{
		glowSpell = StExt_GetItemSeal(weap);
		if (glowSpell <= 0) { glowSpell = StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId); };
		element = StExt_GetSpellElementIndex(glowSpell);
		if (element != StExt_Null)
		{
			// persistent glow attached to the weapon itself (item effect,
			// same engine feature as burning swords); refresh if it differs
			// TEMP DIAG: crash zglaszany DOKLADNIE przy podniesieniu broni bossa.
			// To jest ta linia - moment, w ktorym doczepiamy efekt do broni. Od
			// 17.07 te efekty maja emadjustshptoorigin=1, czyli silnik siega po
			// SIATKE tej broni (oVisFx.cpp: CalcPFXMesh -> shpMesh = origin->GetVisual()).
			// Jesli vob broni znika w tym samym czasie (podnoszenie = usuniecie ze
			// swiata), emiter zostaje z wiszacym wskaznikiem. Log ma to rozstrzygnac.
			if (!hlp_strcmp(weap.effect, StExt_GetElementGlowFx(element)))
			{
				StExt_Trace(concatstrings(concatstrings(">> glow: naklada '", StExt_GetElementGlowFx(element)), concatstrings("' na bron, element=", inttostring(element))));
				weap.effect = StExt_GetElementGlowFx(element);
				StExt_Trace("<< glow: nalozony OK");
			};

			// Charged: bright pulse. NO periodic shimmer otherwise - the
			// repeated point-light FX stuck to the hero's hand and left a
			// trail of glowing dots behind him; the persistent weap.effect
			// glow above is enough.
			if (StExt_WeaponSkill_Charged) { StExt_PlayWeaponElementGlow(element); };
		};
	};

	// OLD legendary armor/jewelry element aura: DISABLED (not deleted - items
	// keep their rolled perk props, saves stay valid). Replaced by the proper
	// legendary bonus catalog (prop 28, rolled/aggregated by the DLL scan).
	// glowSpell = StExt_GetEquippedPerk(hero, 0, 0); ... aura fx removed

	// Legendary jewelry catalog: DLL rolls missing bonuses on equipped
	// legendary rings/amulets/belts and returns the active-bonus bitmask.
	// (no reveal prints here - re-equipping spammed them; the item card
	// shows "Moc legendarna" now, rendered by the DLL from prop 28)
	StExt_LegendJewelryMask = StExt_ScanLegendJewelry(hero);

	// LEGENDARY ARMOR AURA: subtle golden body glitter while a rank-5 armor
	// is worn (replay every 2 ticks; short particle life, so no dot trails).
	var c_item laArm; laArm = npc_getequippedarmor(hero);
	if (hlp_isvaliditem(laArm))
	{
		if (StExt_GetItemRank(laArm) >= StExt_ItemRankLegendary)
		{
			StExt_ArmorAura_Tick -= 1;
			if (StExt_ArmorAura_Tick <= 0)
			{
				rx_playeffect("SPELLFX_STEXT_LEGENDARMOR", hero);
				StExt_ArmorAura_Tick = 2;
			};
		};
	};

	if (StExt_WeaponSkill_Cooldown <= 0) { return; };
	if (accelerationactive) { StExt_WeaponSkill_Cooldown -= accelerationratio; }
	else { StExt_WeaponSkill_Cooldown -= 1; };
	if (StExt_WeaponSkill_Cooldown < 0) { StExt_WeaponSkill_Cooldown = 0; };
};
