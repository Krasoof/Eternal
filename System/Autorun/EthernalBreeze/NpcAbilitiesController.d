func void StExt_InitializeScriptAbilityDamageDesc(var c_npc atk, var C_ExtraDamageInfo desc, var C_NpcAbility ability, var int damageTotal)
{
	var int damagePerType;
	var int damageTypeCount;
	var int damageEnum;
	var int ticks;
	var int tier;

	tier = StExt_GetNpcVar(atk, StExt_AiVar_IsRandomized);
	damageEnum = ability.DamageEnum;
	if (damageEnum == dam_invalid) { damageEnum = StExt_GetTrueDamageType(ability.DamageType); };
	
	damageTypeCount = StExt_GetDamageTypesCount(damageEnum);
	if (damageTypeCount <= 0) { 
		damageTypeCount = 1; 
		damageEnum = damageEnum | dam_barrier;
	}
	else if (damageTypeCount > 7) { damageTypeCount = 7; };
	
	damagePerType = (damageTotal + StExt_MinDamage) / damageTypeCount;
	if (damagePerType < StExt_MinDamage) { damagePerType = StExt_MinDamage; };
	
	StExt_InitializeScriptDamageDesc(desc);
	desc.TotalDamage = StExt_IfInt(damageTotal < StExt_MinDamage, StExt_MinDamage * damageTypeCount, damageTotal);	
	desc.DamageType = ability.DamageType | StExt_DamageType_Ability;
	desc.DamageFlags = ability.DamageFlags;	
	desc.Radius = ability.Radius + StExt_CalcAoeDistance(atk, desc.DamageFlags);
	desc.MaxTargets = ability.MaxTargets + StExt_CalcAoeTargets(atk, desc.DamageFlags, tier);
	
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


func void StExt_UpdateSummonAbility(var C_NpcAbility ability, var int sum1, var int sum2, var int sum3) { ability.SummonsId[0] = sum1; ability.SummonsId[1] = sum2; ability.SummonsId[2] = sum3; };
func void StExt_UpdateAbility(var C_NpcAbility ability)
{
	var int id; id = ability.Id;
	//StExt_PrintDebugStack(concatstrings("StExt_UpdateSummonAbility(): Id: ", inttostring(id)));
	
	if (id == StExt_Npc_Ability_PassiveDemonOnDeath) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(demon_bosshelper), hlp_getinstanceid(demon), hlp_getinstanceid(demonlord)); }
	else if (id == StExt_Npc_Ability_PassiveCrawlersOnDeath) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(minecrawler), hlp_getinstanceid(minecrawlerwarrior), hlp_getinstanceid(minecrawlerwarrior_desert)); }
	else if (id == StExt_Npc_Ability_PassiveWolfsOnDeath) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(wolf), hlp_getinstanceid(wolfcanyon), hlp_getinstanceid(warg)); }
	else if (id == StExt_Npc_Ability_SummonGoblinSkeleton) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(gobbo_skeleton), hlp_getinstanceid(gobbo_skeleton), hlp_getinstanceid(gobbo_skeleton)); }
	else if (id == StExt_Npc_Ability_SummonFireGolem) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(StExt_Small_Firegolem), hlp_getinstanceid(StExt_Weak_Firegolem), hlp_getinstanceid(firegolem)); }
	else if (id == StExt_Npc_Ability_SummonIceGolem) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(StExt_Small_Icegolem), hlp_getinstanceid(StExt_Weak_Icegolem), hlp_getinstanceid(icegolem)); }
	else if (id == StExt_Npc_Ability_SummonGolem) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(StExt_Small_Stonegolem), hlp_getinstanceid(StExt_Weak_Stonegolem), hlp_getinstanceid(stonegolem)); }
	else if (id == StExt_Npc_Ability_SummonSkeleton) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(skeleton), hlp_getinstanceid(skeleton_warrior), hlp_getinstanceid(skeleton_warrior_dark)); }
	else if (id == StExt_Npc_Ability_SummonWolf) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(wolf), hlp_getinstanceid(warg), hlp_getinstanceid(shadowwolf)); }
	else if (id == StExt_Npc_Ability_SummonScavenger) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(scavenger), hlp_getinstanceid(scavenger_old), hlp_getinstanceid(scavenger_dc)); }
	else if (id == StExt_Npc_Ability_SummonRat) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(giant_rat), hlp_getinstanceid(swamprat), hlp_getinstanceid(giant_desertrat)); }
	else if (id == StExt_Npc_Ability_SummonKeiler) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(keiler), hlp_getinstanceid(keiler_elite), hlp_getinstanceid(keilervepr)); }
	else if (id == StExt_Npc_Ability_SummonDemon) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(demon_bosshelper), hlp_getinstanceid(demon), hlp_getinstanceid(demonlord)); }
	else if (id == StExt_Npc_Ability_SummonGuardian) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(stoneguardian), hlp_getinstanceid(stoneguardian_guard_pyra), hlp_getinstanceid(stoneguardian_guard_pyra)); }
	else if (id == StExt_Npc_Ability_SummonZombie) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(zombie01), hlp_getinstanceid(zombie02), hlp_getinstanceid(zombie04)); }
	else if (id == StExt_Npc_Ability_SummonSwampGolem) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(StExt_Small_Swampgolem), hlp_getinstanceid(swampgolem), hlp_getinstanceid(swampgolemstrong)); }
	else if (id == StExt_Npc_Ability_SummonTreant) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(StExt_Small_Swampgolem), hlp_getinstanceid(woodgolem), hlp_getinstanceid(woodgolem)); }
	else if (id == StExt_Npc_Ability_SummonSnapper) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(snapper), hlp_getinstanceid(oster), hlp_getinstanceid(dragonsnapper)); }
	else if (id == StExt_Npc_Ability_SummonBloodfly) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(bloodfly), hlp_getinstanceid(swampdrone), hlp_getinstanceid(death_fly)); }
	else if (id == StExt_Npc_Ability_SummonCrawler) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(minecrawler), hlp_getinstanceid(minecrawlerwarrior), hlp_getinstanceid(minecrawlerwarrior_desert)); }
	else if (id == StExt_Npc_Ability_SummonMolerat) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(molerat), hlp_getinstanceid(moleratold), hlp_getinstanceid(moleratstrong)); }
	else if (id == StExt_Npc_Ability_SummonSkeletonArcher) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(skeleton_bow_weak), hlp_getinstanceid(skeleton_bow), hlp_getinstanceid(skeleton_bow_strong)); }
	else if (id == StExt_Npc_Ability_SummonSkeletonMage) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(skeleton_mage_av), hlp_getinstanceid(skeleton_shadow_priest), hlp_getinstanceid(skeleton_mage_av_elite)); }
	else if (id == StExt_Npc_Ability_SummonBlatCrawler) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(blattcrawler_pack), hlp_getinstanceid(blattcrawler), hlp_getinstanceid(blattcrawler)); }
	else if (id == StExt_Npc_Ability_SummonBloodHound) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(gobbo_skeleton), hlp_getinstanceid(bloodhound), hlp_getinstanceid(argul)); }
	else if (id == StExt_Npc_Ability_SummonGiantBug) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(giant_bug), hlp_getinstanceid(giantbug_strong), hlp_getinstanceid(giantbug_strong)); }
	else if (id == StExt_Npc_Ability_SummonSpider) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(spider), hlp_getinstanceid(spider), hlp_getinstanceid(spider_mine)); }
	else if (id == StExt_Npc_Ability_SummonWaran) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(waran), hlp_getinstanceid(waranbig), hlp_getinstanceid(firewaran)); };
	//else if (id == yyyyy) { StExt_UpdateSummonAbility(ability, hlp_getinstanceid(xxxx), hlp_getinstanceid(xxxx), hlp_getinstanceid(xxxx)); }
};

func void StExt_UpdateAbility_Engine() { StExt_UpdateAbility(StExt_CurrentNpcAbility); };

//-------------------------------------------------------------------------------------------

func void StExt_CastBlinkAbility() { StExt_CastBlink(StExt_Self, StExt_Other, true); };
func void StExt_CastTeleportToSelfAbility() { StExt_CastBlink(StExt_Other, StExt_Self, false); };

func void StExt_CastMassHealAbility(var c_npc slf, var C_NpcAbility ability, var int basicPower) 
{ 
	var int targetsCount;
	var int radius;
	var int healPerc;
	var int tier;
	var int power;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "ability instance is null!", slf, StExt_NullNpc);
		return;
	};
	
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	healPerc = basicPower + (tier * 2);
	targetsCount = ability.MaxTargets + 2 + tier + StExt_GetNpcVar(slf, StExt_AiVar_ExtraAoeTargets);
	radius = ability.Radius + (StExt_CalcAoeDistance(slf, StExt_DamageFlag_Aoe) + 1) / 2;
	power = 10 + slf.level + StExt_GetNpcVar(slf, StExt_AiVar_ExtraBuffPower) + (tier * 100);
	
	StExt_CastMassHeal(slf, healPerc, power, targetsCount, radius);
};

func void StExt_CastMassHealAbility_Light() { StExt_CastMassHealAbility(StExt_Self, StExt_CurrentNpcAbility, 10); };
func void StExt_CastMassHealAbility_Medium() { StExt_CastMassHealAbility(StExt_Self, StExt_CurrentNpcAbility, 25); };
func void StExt_CastMassHealAbility_Full() { StExt_CastMassHealAbility(StExt_Self, StExt_CurrentNpcAbility, 50); };

func void StExt_CastMassHpRegenAbility(var c_npc slf, var C_NpcAbility ability, var int basicPower) 
{ 
	var int targetsCount;
	var int radius;
	var int healPerc;
	var int tier;
	var int power;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "ability instance is null!", slf, StExt_NullNpc);
		return;
	};
	
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	healPerc = basicPower + tier;
	targetsCount = ability.MaxTargets + 2 + tier + StExt_GetNpcVar(slf, StExt_AiVar_ExtraAoeTargets);
	radius = ability.Radius + (StExt_CalcAoeDistance(slf, StExt_DamageFlag_Aoe) + 1) / 5;
	power = 10 + slf.level + StExt_GetNpcVar(slf, StExt_AiVar_ExtraBuffPower) + (tier * 100);
	
	StExt_CastMassHpRegen(slf, healPerc, power, targetsCount, radius);
};

func void StExt_CastMassHpRegenAbility_Light() { StExt_CastMassHpRegenAbility(StExt_Self, StExt_CurrentNpcAbility, 1 + hlp_random(3)); };
func void StExt_CastMassHpRegenAbility_Medium() { StExt_CastMassHpRegenAbility(StExt_Self, StExt_CurrentNpcAbility, 2 + hlp_random(4)); };
func void StExt_CastMassHpRegenAbility_Full() { StExt_CastMassHpRegenAbility(StExt_Self, StExt_CurrentNpcAbility, 3 + hlp_random(5)); };

func void StExt_CastMassEsRegenAbility(var c_npc slf, var C_NpcAbility ability, var int basicPower) 
{ 
	var int targetsCount;
	var int radius;
	var int healPerc;
	var int tier;
	var int power;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_CastMassHeal()", "ability instance is null!", slf, StExt_NullNpc);
		return;
	};
	
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	healPerc = basicPower + tier;
	targetsCount = ability.MaxTargets + 2 + tier + StExt_GetNpcVar(slf, StExt_AiVar_ExtraAoeTargets);
	radius = ability.Radius + (StExt_CalcAoeDistance(slf, StExt_DamageFlag_Aoe) + 1) / 5;
	power = 10 + slf.level + StExt_GetNpcVar(slf, StExt_AiVar_ExtraBuffPower) + (tier * 100);
	
	StExt_CastMassEsRegen(slf, healPerc, power, targetsCount, radius);
};

func void StExt_CastMassEsRegenAbility_Light() { StExt_CastMassEsRegenAbility(StExt_Self, StExt_CurrentNpcAbility, 1 + hlp_random(3)); };
func void StExt_CastMassEsRegenAbility_Medium() { StExt_CastMassEsRegenAbility(StExt_Self, StExt_CurrentNpcAbility, 2 + hlp_random(4)); };
func void StExt_CastMassEsRegenAbility_Full() { StExt_CastMassEsRegenAbility(StExt_Self, StExt_CurrentNpcAbility, 3 + hlp_random(5)); };

func void StExt_CastSelfHealAbility(var c_npc slf, var int basicPower) 
{ 
	var int healPerc;
	var int tier;
	var int power;
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_CastSelfHealAbility()", "Self npc is null!", slf, StExt_NullNpc);
		return;
	};
	
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	healPerc = basicPower + (tier * 3);
	power = 10 + slf.level + StExt_GetNpcVar(slf, StExt_AiVar_ExtraBuffPower) + (tier * 150);
	
	StExt_CastSelfHeal(slf, healPerc, power);
};

func void StExt_CastSelfHealAbility_Light() { StExt_CastSelfHealAbility(StExt_Self, 15); };
func void StExt_CastSelfHealAbility_Medium() { StExt_CastSelfHealAbility(StExt_Self, 35); };
func void StExt_CastSelfHealAbility_Full() { StExt_CastSelfHealAbility(StExt_Self, 60); };

func void StExt_CastCapeAbility()
{
	var int tier;
	var int damage;
	var C_ExtraDamageInfo desc;
	
	if (!hlp_isvalidnpc(StExt_Self)) {
		StExt_PrintDebug("StExt_CastCapeAbility()", "Self npc is null!", StExt_Self, StExt_NullNpc);
		return;
	};
	if(Hlp_IsNULL(StExt_CurrentNpcAbility)) {
		StExt_PrintDebug("StExt_CastCapeAbility()", "ability instance is null!", StExt_Self, StExt_NullNpc);
		return;
	};
	
	tier = (StExt_GetNpcVar(StExt_Self, StExt_AiVar_IsRandomized) + 1) / 2;
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	damage = StExt_CurrentNpcAbility.DamageTotal + StExt_Npc_CalcAblityDamage(StExt_Self);
	damage = StExt_GetPercentFromValue(StExt_MinDamage + damage, 1 + hlp_random(1 + tier));
	if (damage <= 0) { damage = StExt_MinDamage; };
	
	StExt_InitializeScriptAbilityDamageDesc(StExt_Self, desc, StExt_CurrentNpcAbility, damage);
	StExt_CastAoeEffect(StExt_Self, StExt_CurrentNpcAbility.EffectName, desc);
	StExt_Struct_Free(desc);
};


//-------------------------------------------------------------------------------------------

func int StExt_Npc_UseSpellAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int isCasted; isCasted = false;
	var int isOthValid; isOthValid = hlp_isvalidnpc(oth);
	var int isOnDeath; isOnDeath = StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnDeath) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnDeath);
	var int isOnOffence; isOnOffence = StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnOffence) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnOffense);
	var int isOnDeffence; isOnDeffence = StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnDeffence) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnDeffense);
	var C_ExtraDamageInfo desc;
	var int damage;
	
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UseSpellAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	
	if (StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_UseSpell) && isOthValid)
	{
		damage = ability.DamageTotal + StExt_Npc_CalcSpellDamage(slf);
		isCasted = StExt_CastSpell(ability.SpellId, slf, oth, damage);
	}
	else if (!StExt_StringIsEmpty(ability.EffectName))
	{
		desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
		if (Hlp_IsNull(desc)) { StExt_PrintDebug("StExt_Npc_UseSpellAbility(...)", "Fail to create script damage descriptor!", slf, oth); return isCasted; };
	
		damage = ability.DamageTotal;
		if (isOnDeath) { damage += StExt_Npc_CalcOnDeathDamage(slf); }
		else { damage += StExt_Npc_CalcAblityDamage(slf); };
		
		if (isOnDeffence || isOnOffence) { damage = StExt_GetPercentFromValue(StExt_MinDamage + damage, 35 + hlp_random(15)); };
		if (damage < StExt_MinDamage) { damage = StExt_MinDamage; };
		
		if (StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_Aoe))
		{
			if (!isOnDeath) { damage = StExt_GetPercentFromValue(damage, 15 + hlp_random(25)); };
			if (damage < StExt_MinDamage) { damage = StExt_MinDamage; };			
			StExt_InitializeScriptAbilityDamageDesc(slf, desc, ability, damage);
			isCasted = StExt_CastAoeEffect(slf, ability.EffectName, desc);
		}
		else if (isOthValid)
		{
			StExt_InitializeScriptAbilityDamageDesc(slf, desc, ability, damage);
			isCasted = StExt_CastSpellEffect(slf, oth, ability.EffectName, desc);
		};
		
		StExt_Struct_Free(desc);
	};	

	if (!StExt_StringIsEmpty(ability.OnCast)) 
	{
		StExt_CallActorsFunc(ability.OnCast, slf, oth); 
		isCasted = true;
	};
	return isCasted;
};


func int StExt_Npc_UseThrowAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int isCasted; isCasted = false;
	var int isOthValid; isOthValid = hlp_isvalidnpc(oth);
	var int isSlotValid; isSlotValid = (abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities);
	var int damage; damage = StExt_MinDamage;
	
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UseThrowAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	
	if (isOthValid && !StExt_StringIsEmpty(ability.ItemInstanceName))
	{
		damage = ability.DamageTotal + StExt_GetNpcVar(slf, StExt_AiVar_ExtraRangeDamage) + (StExt_Npc_CalcExtraDamage(slf) + 1) / 2;
		damage += StExt_GetPercentFromValue(slf.attribute[4] + slf.attribute[5], 50);
		isCasted = StExt_ThrowItem(slf, oth, ability.ItemInstanceName, damage, ability.DamageEnum);
	};
	
	if(!StExt_StringIsEmpty(ability.OnCast)) {
		StExt_CallActorsFunc(ability.OnCast, slf, oth);
		isCasted = true; 
	};
	
	if (isCasted && !StExt_StringIsEmpty(ability.EffectName)) { rx_playeffect(ability.EffectName, slf); };
	return isCasted;
};


func int StExt_ProcessSummonId(var int summonId)
{
	var int rand;
	var int tier; tier = StExt_ValidateValueRange((kapitel + 1 + hlp_random(2)) / 2, 1, 3);

	if (summonId == StExt_NpcAbility_SummonPlaceholder_RandUndead)
	{
		if (tier <= 1) 
		{ 
			rand = hlp_random(17);
			if (rand == 0) { return hlp_getinstanceid(gobbo_skeleton); }
			else if (rand == 1) { return hlp_getinstanceid(zombie01); }
			else if (rand == 2) { return hlp_getinstanceid(zombie03); }
			else if (rand == 3) { return hlp_getinstanceid(skeleton); }
			else if (rand == 4) { return hlp_getinstanceid(skeleton_bow_weak); }
			else if (rand == 5) { return hlp_getinstanceid(skeleton_speer); }
			else if (rand == 6) { return hlp_getinstanceid(skeleton_shield); }
			else if (rand == 7) { return hlp_getinstanceid(skeleton_priest); }
			else if (rand == 8) { return hlp_getinstanceid(skeleton_capitan); }
			else if (rand == 9) { return hlp_getinstanceid(skeleton_sailor); }
			else if (rand == 10) { return hlp_getinstanceid(skeleton_mage_av); }
			else if (rand == 11) { return hlp_getinstanceid(skeletonmagepirate); }			
			else if (rand == 12) { return hlp_getinstanceid(psi_zombie_01); }
			else if (rand == 13) { return hlp_getinstanceid(psi_zombie_02); }
			else if (rand == 14) { return hlp_getinstanceid(psi_zombie_03); }
			else if (rand == 15) { return hlp_getinstanceid(psi_zombie_04); }
			else if (rand == 16) { return hlp_getinstanceid(psi_zombie_05); }
			else { return hlp_getinstanceid(skeleton); };
		}
		else if (tier <= 2) 
		{ 
			rand = hlp_random(24);
			if (rand == 0) { return hlp_getinstanceid(skeleton_warrior); }
			else if (rand == 1) { return hlp_getinstanceid(skeleton_bow); }
			else if (rand == 2) { return hlp_getinstanceid(skeleton_dark); }
			else if (rand == 3) { return hlp_getinstanceid(skeleton_bow_ancient); }
			else if (rand == 4) { return hlp_getinstanceid(skeleton_oc); }
			else if (rand == 5) { return hlp_getinstanceid(skeleton_shield_oc); }
			else if (rand == 6) { return hlp_getinstanceid(skeleton_warrior_oc); }
			else if (rand == 7) { return hlp_getinstanceid(skeleton_speer_oc); }
			else if (rand == 8) { return hlp_getinstanceid(skeleton_warrior_av); }
			else if (rand == 9) { return hlp_getinstanceid(skeleton_warrior_av_elite); }
			else if (rand == 10) { return hlp_getinstanceid(skeleton_warrior); }
			else if (rand == 11) { return hlp_getinstanceid(skeleton_shadow_priest); }
			else if (rand == 12) { return hlp_getinstanceid(zombie02); }
			else if (rand == 13) { return hlp_getinstanceid(zombie04); }
			else if (rand == 14) { return hlp_getinstanceid(skeletonmage); }
			else if (rand == 15) { return hlp_getinstanceid(bloodhound); }			
			else if (rand == 16) { return hlp_getinstanceid(pal_zombie01); }
			else if (rand == 17) { return hlp_getinstanceid(pal_zombie02); }
			else if (rand == 18) { return hlp_getinstanceid(pal_zombie03); }
			else if (rand == 19) { return hlp_getinstanceid(pal_zombie04); }
			else if (rand == 20) { return hlp_getinstanceid(mayazombie01); }
			else if (rand == 21) { return hlp_getinstanceid(mayazombie02); }
			else if (rand == 22) { return hlp_getinstanceid(mayazombie03); }
			else if (rand == 23) { return hlp_getinstanceid(mayazombie04); }			
			else { return hlp_getinstanceid(skeleton_warrior); };
		}
		else 
		{
			rand = hlp_random(14);
			if (rand == 0) { return hlp_getinstanceid(skeleton_dark_killer); }
			else if (rand == 1) { return hlp_getinstanceid(skeleton_bow_strong); }
			else if (rand == 2) { return hlp_getinstanceid(skeleton_bow_ancient_strong); }
			else if (rand == 3) { return hlp_getinstanceid(skeleton_bow_ancient); }
			else if (rand == 4) { return hlp_getinstanceid(skeleton_warrior_dark); }
			else if (rand == 5) { return hlp_getinstanceid(skeleton_warrior_dark_axe); }
			else if (rand == 6) { return hlp_getinstanceid(skeleton_warrior_dark_speer); }
			else if (rand == 7) { return hlp_getinstanceid(skeleton_warrior_dark_shield); }
			else if (rand == 8) { return hlp_getinstanceid(skeleton_warrior_dark_shield_oc); }
			else if (rand == 9) { return hlp_getinstanceid(skeleton_shadow_priestdt); }
			else if (rand == 10) { return hlp_getinstanceid(skeleton_warrior_dark_oc); }			
			else if (rand == 11) { return hlp_getinstanceid(argul); }
			else if (rand == 12) { return hlp_getinstanceid(shadowbeast_skeleton); }	
			else if (rand == 13) { return hlp_getinstanceid(skeleton_mage_av_elite); }		
			else { return hlp_getinstanceid(skeleton_warrior_dark); };
		};
	};
	
	if (summonId == StExt_NpcAbility_SummonPlaceholder_RandAnimal)
	{
		if (tier <= 1) 
		{
			rand = hlp_random(10);
			if (rand == 0) { return hlp_getinstanceid(giant_rat); }
			else if (rand == 1) { return hlp_getinstanceid(scavenger); }
			else if (rand == 2) { return hlp_getinstanceid(wolf); }
			else if (rand == 3) { return hlp_getinstanceid(lurker); }
			else if (rand == 4) { return hlp_getinstanceid(waran); }
			else if (rand == 5) { return hlp_getinstanceid(scavenger_mount); }
			else if (rand == 6) { return hlp_getinstanceid(wolfcanyon); }
			else if (rand == 7) { return hlp_getinstanceid(orcbiter); }
			else if (rand == 8) { return hlp_getinstanceid(swamprat); }
			else if (rand == 9) { return hlp_getinstanceid(swamprat_wc); }
			else { return hlp_getinstanceid(wolf); };
		}
		else if (tier <= 2) 
		{ 
			rand = hlp_random(11);
			if (rand == 0) { return hlp_getinstanceid(snapper); }
			else if (rand == 1) { return hlp_getinstanceid(keiler); }
			else if (rand == 2) { return hlp_getinstanceid(warg); }
			else if (rand == 3) { return hlp_getinstanceid(waranbig); }
			else if (rand == 4) { return hlp_getinstanceid(waranbignormalsize); }
			else if (rand == 5) { return hlp_getinstanceid(oster); }
			else if (rand == 6) { return hlp_getinstanceid(stonepuma); }
			else if (rand == 7) { return hlp_getinstanceid(harpie); }
			else if (rand == 8) { return hlp_getinstanceid(razor); }
			else if (rand == 9) { return hlp_getinstanceid(keiler_elite); }
			else if (rand == 10) { return hlp_getinstanceid(keilervepr); }
			else { return hlp_getinstanceid(warg); };
		}
		else 
		{
			rand = hlp_random(9);
			if (rand == 0) { return hlp_getinstanceid(dragonsnapper); }
			else if (rand == 1) { return hlp_getinstanceid(alligator); }
			else if (rand == 2) { return hlp_getinstanceid(shadowbeast); }
			else if (rand == 3) { return hlp_getinstanceid(firewaran); }
			else if (rand == 4) { return hlp_getinstanceid(desertshark); }
			else if (rand == 5) { return hlp_getinstanceid(swampshark); }
			else if (rand == 6) { return hlp_getinstanceid(swampsharkstrong); }
			else if (rand == 7) { return hlp_getinstanceid(shadowwolf); }
			else if (rand == 8) { return hlp_getinstanceid(drake); }
			else { return hlp_getinstanceid(shadowwolf); };
		};
	};
	
	if (summonId == StExt_NpcAbility_SummonPlaceholder_RandGolem)
	{
		if (tier <= 1) 
		{ 
			rand = hlp_random(5);
			if (rand == 0) { return hlp_getinstanceid(stoneguardian); }
			else if (rand == 1) { return hlp_getinstanceid(StExt_Small_Icegolem); }
			else if (rand == 2) { return hlp_getinstanceid(StExt_Small_Swampgolem); }
			else if (rand == 3) { return hlp_getinstanceid(StExt_Small_Firegolem); }
			else if (rand == 4) { return hlp_getinstanceid(StExt_Small_Stonegolem); }
			else { return hlp_getinstanceid(StExt_Small_Stonegolem); };
		}
		else if (tier <= 2) 
		{ 
			rand = hlp_random(7);
			if (rand == 0) { return hlp_getinstanceid(stoneguardian_guard_pyra); }
			else if (rand == 1) { return hlp_getinstanceid(woodgolem); }
			else if (rand == 2) { return hlp_getinstanceid(swampgolem); }
			else if (rand == 3) { return hlp_getinstanceid(swampgolem_valley); }
			else if (rand == 4) { return hlp_getinstanceid(StExt_Weak_Icegolem); }
			else if (rand == 5) { return hlp_getinstanceid(StExt_Weak_Firegolem); }
			else if (rand == 6) { return hlp_getinstanceid(StExt_Weak_Stonegolem); }
			else { return hlp_getinstanceid(StExt_Weak_Stonegolem); };
		}
		else 
		{
			rand = hlp_random(4);
			if (rand == 0) { return hlp_getinstanceid(swampgolemstrong); }
			else if (rand == 1) { return hlp_getinstanceid(icegolem); }
			else if (rand == 2) { return hlp_getinstanceid(firegolem); }
			else if (rand == 3) { return hlp_getinstanceid(stonegolem); }
			else { return hlp_getinstanceid(stonegolem); };
		};
	};
	
	if (summonId == StExt_NpcAbility_SummonPlaceholder_RandBug)
	{
		if (tier <= 1) 
		{ 
			rand = hlp_random(6);
			if (rand == 0) { return hlp_getinstanceid(bloodfly); }
			else if (rand == 1) { return hlp_getinstanceid(swarm); }
			else if (rand == 2) { return hlp_getinstanceid(crab); }
			else if (rand == 3) { return hlp_getinstanceid(giant_bug); }
			else if (rand == 4) { return hlp_getinstanceid(giantbug_strong); }
			else if (rand == 6) { return hlp_getinstanceid(blattcrawler_pack); }			
			else { return hlp_getinstanceid(bloodfly); };
		}
		else if (tier <= 2) 
		{ 
			rand = hlp_random(6);
			if (rand == 0) { return hlp_getinstanceid(bloodfly_poison); }
			else if (rand == 1) { return hlp_getinstanceid(swampdrone); }
			else if (rand == 2) { return hlp_getinstanceid(crab_strong); }
			else if (rand == 3) { return hlp_getinstanceid(blattcrawler); }
			else if (rand == 4) { return hlp_getinstanceid(minecrawler); }
			else if (rand == 5) { return hlp_getinstanceid(spider); }
			else { return hlp_getinstanceid(bloodfly_poison); };
		}
		else 
		{
			rand = hlp_random(5);
			if (rand == 0) { return hlp_getinstanceid(minecrawler_hram); }
			else if (rand == 1) { return hlp_getinstanceid(minecrawlerwarrior_desert); }
			else if (rand == 2) { return hlp_getinstanceid(minecrawlerwarrior); }
			else if (rand == 3) { return hlp_getinstanceid(spider_mine); }
			else if (rand == 4) { return hlp_getinstanceid(death_fly); }
			else { return hlp_getinstanceid(death_fly); };
		};
	};
	
	if (summonId == StExt_NpcAbility_SummonPlaceholder_RandGoblin)
	{
		if (tier <= 1) 
		{ 
			rand = hlp_random(3);
			if (rand == 0) { return hlp_getinstanceid(gobbo_green); }
			else if (rand == 1) { return hlp_getinstanceid(gobbo_black); }
			else if (rand == 2) { return hlp_getinstanceid(gobbo_mage); }
			else { return hlp_getinstanceid(gobbo_green); };
		}
		else if (tier <= 2) 
		{ 
			rand = hlp_random(4);
			if (rand == 0) { return hlp_getinstanceid(gobbo_mage); }
			else if (rand == 1) { return hlp_getinstanceid(gobbo_black); }
			else if (rand == 2) { return hlp_getinstanceid(gobbo_shaman); }
			else if (rand == 3) { return hlp_getinstanceid(gobbo_blackcanyon); }
			else { return hlp_getinstanceid(gobbo_black); };
		}
		else 
		{
			rand = hlp_random(2);
			if (rand == 0) { return hlp_getinstanceid(gobbo_desert); }
			else if (rand == 1) { return hlp_getinstanceid(gobbo_desert_shaman); }
			else { return hlp_getinstanceid(gobbo_desert); };
		};
	};
	
	if (summonId > 0) { return summonId; };
	return StExt_Null;
};

func int StExt_Npc_UseSummonAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int isCasted; isCasted = false;	
	var int count; count = 0;
	var int countMul; countMul = 0;
	var int summonId1; var int summonId2; var int summonId3;
	var int summonCount1; var int summonCount2; var int summonCount3;
	var int tier; tier = StExt_ValidateValueRange((kapitel + 1 + hlp_random(2)) / 2, 1, 3);
	
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UseSummonAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	if (StExt_Npc_IsSummoned(slf) && !StExt_Config_Npc_SummonsCanHaveOwnSummons) { return isCasted; };
	
	//StExt_UpdateSummonAbility(ability);
	summonId1 = StExt_Null; summonId2 = StExt_Null; summonId3 = StExt_Null;
	summonCount1 = 0; summonCount2 = 0; summonCount3 = 0;
	countMul = 100 + slf.level + (kapitel * 150) + (StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized) * 100) + StExt_GetNpcVar(slf, StExt_AiVar_SummonPower);
	countMul += StExt_Random((countMul + 1) / 2);
	
	if (StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_UseSummonPack))
	{
		summonId1 = StExt_ProcessSummonId(ability.SummonsId); 
		summonId2 = StExt_ProcessSummonId(ability.SummonsId[1]);
		summonId3 = StExt_ProcessSummonId(ability.SummonsId[2]); 
		
		summonCount1 = ability.SummonsCount + StExt_GetPermilleFromValue(ability.SummonsCount, countMul);
		summonCount2 = ability.SummonsCount[1] + StExt_GetPermilleFromValue(ability.SummonsCount[1], countMul);
		summonCount3 = ability.SummonsCount[2] + StExt_GetPermilleFromValue(ability.SummonsCount[2], countMul);
		
		if ((summonId1 == StExt_Null) && (summonId2 == StExt_Null) && (summonId3 == StExt_Null)) { return isCasted; };
		
		if ((summonId1 != StExt_Null) && (summonCount1 <= 0)) { summonCount1 = 1; };
		if ((summonId2 != StExt_Null) && (summonCount2 <= 0)) { summonCount2 = 1; };
		if ((summonId3 != StExt_Null) && (summonCount3 <= 0)) { summonCount3 = 1; };
	}
	else
	{
		if (tier <= 1) { summonId1 = StExt_ProcessSummonId(ability.SummonsId); count = ability.SummonsCount; }
		else if (tier <= 2) { summonId1 = StExt_ProcessSummonId(ability.SummonsId[1]); count = ability.SummonsCount[1]; }
		else { summonId1 = StExt_ProcessSummonId(ability.SummonsId[2]); count = ability.SummonsCount[2]; };
		
		if (summonId1 == StExt_Null) { return isCasted; };		
		count += StExt_GetPermilleFromValue(count, countMul);
		
		if (count <= 0) { count = 1; };
		summonCount1 = count;
	};	
	
	isCasted = StExt_SpawnSummons(slf, summonId1, summonId2, summonId3, summonCount1, summonCount2, summonCount3);	
	if (isCasted && !StExt_StringIsEmpty(ability.EffectName)) { rx_playeffect(ability.EffectName, slf); };
	return isCasted;
};

func int StExt_Npc_UseBuffAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int isCasted; isCasted = false;
	var int effectFlag; effectFlag = 0;
	var int effectTargetsCount; effectTargetsCount = 1;
	
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UseBuffAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	
	if ((ability.TimedEffectId > StExt_TimedEffect_Index_DotDamage) && (ability.TimedEffectId < StExt_TimedEffect_Index_Max))
	{
		if (StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_Aoe)) 
		{
			effectFlag = StExt_TimedEffect_Flag_Aoe;
			effectTargetsCount += 2 + hlp_random(3) + StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
		};		
		isCasted = StExt_ApplyTimedEffectEx(slf, slf, ability.TimedEffectId, 0, 0, 0, effectTargetsCount, effectFlag);		
	};
	
	if(!StExt_StringIsEmpty(ability.OnCast)) { StExt_CallActorsFunc(ability.OnCast, slf, oth); isCasted = true; };
	if (isCasted && !StExt_StringIsEmpty(ability.EffectName)) { rx_playeffect(ability.EffectName, slf); };
	return isCasted;
};

func int StExt_Npc_UseDebuffAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int isCasted; isCasted = false;	
	var int effectFlag; effectFlag = 0;
	var int effectTargetsCount; effectTargetsCount = 1;
	
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UseDebuffAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	
	if ((ability.TimedEffectId > StExt_TimedEffect_Index_DotDamage) && (ability.TimedEffectId < StExt_TimedEffect_Index_Max))
	{
		if (StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_Aoe)) 
		{
			effectFlag = StExt_TimedEffect_Flag_Aoe;
			effectTargetsCount += 1 + hlp_random(2) + StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
		};		
		isCasted = StExt_ApplyTimedEffectEx(slf, oth, ability.TimedEffectId, 0, 0, 0, effectTargetsCount, effectFlag);
	};
	
	if(!StExt_StringIsEmpty(ability.OnCast)) { StExt_CallActorsFunc(ability.OnCast, slf, oth); isCasted = true; };
	if (isCasted && !StExt_StringIsEmpty(ability.EffectName)) { rx_playeffect(ability.EffectName, slf); };
	return isCasted;
};


func int StExt_Npc_UsePassiveAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int isCasted; isCasted = false;
	var int tier; tier = 0;
	var int chance; chance = 0;
	var int isOthValid; isOthValid = false;
	
	if (Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UsePassiveAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	
	isOthValid = hlp_isvalidnpc(oth);
	tier = StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized);
	if (StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_UseChance))
	{
		chance = 1 + ability.Chance + (tier * 10) + hlp_random(10 + (tier * 10));
		chance += ((StExt_GetNpcVar(slf, StExt_AiVar_LuckBonus) + 10) / 5) + ((StExt_GetNpcVar(slf, StExt_AiVar_GoldBonus) + 10) / 7);
		if (!StExt_Chance(chance)) { return isCasted; };
	};
	
	
	if (StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnTick) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnTick))
	{ 
		if (!StExt_StringIsEmpty(ability.OnTick)) 
		{ 
			StExt_CallActorsFunc(ability.OnTick, slf, oth);
			isCasted = isCasted | true;
		};
	};
	
	if (isOthValid && StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnOffence) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnOffense)) 
	{ 
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Spell)) { isCasted = isCasted | StExt_Npc_UseSpellAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Throw)) { isCasted = isCasted | StExt_Npc_UsePassiveAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Debuff)) { isCasted = isCasted | StExt_Npc_UseDebuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Buff)) { isCasted = isCasted | StExt_Npc_UseBuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Summon)) { isCasted = isCasted | StExt_Npc_UseSummonAbility(slf, oth, ability, abilitySlot, eventType); };
		
		if (!StExt_StringIsEmpty(ability.OnOffence)) 
		{ 
			StExt_CallActorsFunc(ability.OnOffence, slf, oth);
			isCasted = isCasted | true;
		};
	};
	
	if (isOthValid && StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnDeffence) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnDeffense)) 
	{ 
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Spell)) { isCasted = isCasted | StExt_Npc_UseSpellAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Throw)) { isCasted = isCasted | StExt_Npc_UsePassiveAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Debuff)) { isCasted = isCasted | StExt_Npc_UseDebuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Buff)) { isCasted = isCasted | StExt_Npc_UseBuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Summon)) { isCasted = isCasted | StExt_Npc_UseSummonAbility(slf, oth, ability, abilitySlot, eventType); };
		
		if (!StExt_StringIsEmpty(ability.OnDeffence))
		{
			StExt_CallActorsFunc(ability.OnDeffence, slf, oth);
			isCasted = isCasted | true;
		};
	};
	
	if (StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnDeath) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnDeath))
	{
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Spell)) { isCasted = isCasted | StExt_Npc_UseSpellAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Throw)) { isCasted = isCasted | StExt_Npc_UsePassiveAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Debuff)) { isCasted = isCasted | StExt_Npc_UseDebuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Buff)) { isCasted = isCasted | StExt_Npc_UseBuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Summon)) { isCasted = isCasted | StExt_Npc_UseSummonAbility(slf, oth, ability, abilitySlot, eventType); };
		
		if (!StExt_StringIsEmpty(ability.OnDeath)) 
		{
			StExt_CallActorsFunc(ability.OnDeath, slf, oth);
			isCasted = isCasted | true;
		};
	};
	
	if (isCasted && !StExt_StringIsEmpty(ability.EffectName)) { rx_playeffect(ability.EffectName, slf); };
	return isCasted;
};


//-------------------------------------------------------------------------------------------

func int StExt_Npc_UseAbility(var c_npc slf, var c_npc oth, var C_NpcAbility ability, var int abilitySlot, var int eventType) 
{
	var int cooldown; cooldown = 0;
	var int isCasted; isCasted = false;
	var int isSlotValid; isSlotValid = (abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities);
	
	if (!hlp_isvalidnpc(slf)) {
		StExt_PrintDebug("StExt_Npc_UseAbility()", "slf instance is null!", slf, oth);
		return isCasted; 
	};
	if (slf.aivar[43] == id_totem) { return isCasted; };
	
	if(Hlp_IsNULL(ability)) {
		StExt_PrintDebug("StExt_Npc_UseAbility()", "ability instance is null!", slf, oth);
		return isCasted;
	};
	if (!isSlotValid) { 
		StExt_PrintDebug("StExt_Npc_UseAbility()", "ability slot is invalid!", slf, oth);
		return isCasted;
	};
	
	
	if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Passive)) {
		isCasted = isCasted | StExt_Npc_UsePassiveAbility(slf, oth, ability, abilitySlot, eventType);
	}	
	else if (StExt_ValueHasFlag(eventType, StExt_NpcAbility_Event_OnCastAbility) && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_OnCast))
	{
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Spell)) { isCasted = isCasted | StExt_Npc_UseSpellAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Throw)) { isCasted = isCasted | StExt_Npc_UsePassiveAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Debuff)) { isCasted = isCasted | StExt_Npc_UseDebuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Buff)) { isCasted = isCasted | StExt_Npc_UseBuffAbility(slf, oth, ability, abilitySlot, eventType); };		
		if (StExt_ValueHasFlag(ability.Type, StExt_NpcAbility_Type_Summon)) { isCasted = isCasted | StExt_Npc_UseSummonAbility(slf, oth, ability, abilitySlot, eventType); };
	};
	
	if (isCasted && isSlotValid && StExt_ValueHasFlag(ability.Flags, StExt_NpcAbility_Flag_UseCooldown)) 
	{ 
		cooldown = ability.Cooldown;
		if (ability.Cooldown > 0) {
			cooldown = 1 + StExt_GetPermilleFromValue(cooldown, 1000 - (StExt_GetNpcVar(slf, StExt_AiVar_IsRandomized) * 25)) + hlp_random(15);
		};
		if (cooldown <= 0) { cooldown = 1; };
		StExt_SetNpcVar(slf, StExt_AiVar_AbilityCooldown1 + abilitySlot, cooldown);
	};

	return isCasted;
};

func void StExt_Npc_PassiveAbilityHandler(var int abilitySlot)
{
	if (!hlp_isvalidnpc(StExt_Self)) {
		StExt_PrintDebug("StExt_Npc_PassiveAbilityHandler(var c_npc slf)", "slf instance is null!", StExt_Self, StExt_Other);
		return; 
	};
	if (c_npcisdown(StExt_Self)) { return; };
	StExt_Npc_UseAbility(StExt_Self, StExt_NullNpc, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnTick);
};
