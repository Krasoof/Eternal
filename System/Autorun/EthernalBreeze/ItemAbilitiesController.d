
//===================================================================//
//					Weapon skills (active abilities)				 //
//===================================================================//
// Player presses StExt_Config_WeaponSkillKey to "charge" the currently
// readied weapon's skill (paying stamina or mana + starting a cooldown).
// The charge is consumed and unleashed as bonus elemental damage on the
// hero's next successful hit (see StExt_TriggerWeaponSkillOnHit, called
// from StExt_Hero_AfterOffenceHandler in DamageController.d).

func c_item StExt_GetHeroWeaponForSkill()
{
	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { return npc_getreadiedweapon(hero); };
	return npc_getequippedmeleeweapon(hero);
};

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

	weap = StExt_GetHeroWeaponForSkill();
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
	rx_playeffect("SPELLFX_CAST_INSTANTFIREBALL", hero);
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

	power = 20 + StExt_GetWeaponSkillMasteryPower(spellId) + StExt_CalcWeaponTotalDamage(weap);
	StExt_CastSpell(StExt_AbilityPrefix + spellId, atk, target, power);
};

// Call once per mod tick (StExt_ModController) - ticks the cooldown down.
func void StExt_ItemAbilitiesController()
{
	if (StExt_WeaponSkill_Cooldown <= 0) { return; };
	if (accelerationactive) { StExt_WeaponSkill_Cooldown -= accelerationratio; }
	else { StExt_WeaponSkill_Cooldown -= 1; };
	if (StExt_WeaponSkill_Cooldown < 0) { StExt_WeaponSkill_Cooldown = 0; };
};
