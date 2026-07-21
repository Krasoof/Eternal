func void StExt_CheckNpcName(var c_npc slf)
{
	var string levelStr;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_CheckNpcName(var c_npc slf)", "slf instance is null!", slf, StExt_NullNpc);
		return; 
	};
	if (StExt_Npc_IsRandomized(slf) > 0) {
		if (StExt_StringIsEmpty(StExt_Array_GetString("slf.name", 3))) { StExt_BuildInfusedNpcName(slf); };
	};
	if (StExt_Config_ShowNpcLevel && StExt_StringIsEmpty(StExt_Array_GetString("slf.name", 2)))
	{
		levelStr = concatstrings(" (", inttostring(slf.level));
		levelStr = concatstrings(levelStr, ")");
		slf.name = concatstrings(slf.name, levelStr);
		slf.name[2] = levelStr;
	};
};

func int StExt_PreventNpcSummonFight(var c_npc slf, var c_npc oth)
{
	var int isSelfSummoned;
	var int isOtherSummoned;
	var int selfOwnerGuild;
	var int otherOwnerGuild;

	if (!hlp_isvalidnpc(slf) || !hlp_isvalidnpc(oth)) 
	{
		StExt_PrintDebug("StExt_PreventNpcSummonFight()", "Some actor is null", slf, oth);
		return false; 
	};
	
	if (StExt_IsHeroPatryNpc(oth)) { return false; };
	
	selfOwnerGuild = StExt_GetNpcVar(slf, StExt_AiVar_OwnerGuild);
	otherOwnerGuild = StExt_GetNpcVar(oth, StExt_AiVar_OwnerGuild);
	isSelfSummoned = StExt_Npc_IsSummoned(slf);
	isOtherSummoned = StExt_Npc_IsSummoned(oth);	
	
	if (isSelfSummoned && isOtherSummoned) { return (wld_getguildattitude(selfOwnerGuild, otherOwnerGuild) >= att_neutral); }
	else if (isSelfSummoned) { return (wld_getguildattitude(selfOwnerGuild, oth.guild) >= att_neutral); }
	else if (isOtherSummoned) { return (wld_getguildattitude(slf.guild, otherOwnerGuild) >= att_neutral); };

	return false;
};

func int StExt_CanCastAbility(var c_npc slf, var c_npc oth)
{
	var int abilitySlot;
	if (StExt_GamePaused()) { return false; };
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (!hlp_isvalidnpc(oth)) { return false; };
	if (c_npcisdown(oth)) { return false; };	
	
	if (rx_getnpcvar(slf, aivrx_reattack_slot) > 0) 
	{
        rx_canreattack(slf);
        if (rx_hasreattacknpc(slf) && rx_canreattacknow(slf)) { return false; };
    };

	if (rx_getnpcvar(oth, aivrx_this_npc_animals_dont_attack)) {
        if (rx_isanimal(slf) && (!npc_isplayer(oth))) { return false; };
    };
    if (rx_getnpcvar(oth, aivrx_dont_attack)) { return false; };
	
	if(StExt_IsSummonOrHero(slf))
	{
        if(StExt_IsSummonOrHero(oth)) { return false; };
        if(rx_isboss(oth)) {
            if(npc_isinstate(oth, zs_talk) || npc_isinstate(hero, zs_talk) || (!infomanager_hasfinished())) { return false; };
        };
        if(!infomanager_hasfinished()) { return false; };
    };
    if(oth.aivar[93] && (oth.attribute <= 1)) { return false; };
	
    if(npc_isplayer(oth)) 
	{
        if(rx_checkinvisiblehero(oth, slf)) { return false; };
        if(StExt_IsSummonOrHero(slf)) { return false; };
    };
	
	if ((slf.aivar[15] == true) && (oth.aivar[61] == true)) { return false; };
    if ((slf.aivar[15] == true) && (oth.flags == npc_flag_immortal) || (oth.flags == npc_flag_xaradrim) || (oth.flags == orctemplenpcflags)) { return false; };
    if (rx_checkinvisiblehero(oth, slf)) { return false; };	
	if (StExt_IsNpcImmortal(oth)) { return false; };
	if (StExt_PreventNpcSummonFight(slf, oth)) { return false; };
	
	abilitySlot = StExt_Npc_SearchAbility(slf, StExt_NpcAbility_Type_None, StExt_NpcAbility_Flag_OnCast);
	if ((abilitySlot <= StExt_Null) || (abilitySlot >= StExt_Npc_MaxNpcAbilities)) { return false; };
	
	return true;
};


// Check if npc has scroll
var int StExt_Npc_HasBattleScroll_Result;
var c_npc StExt_Npc_HasBattleScroll_Npc;
func int StExt_Npc_HasBattleScroll_Loop(var int index)
{
	var string scrollName;
	var int scroll;
	if (index >= StExt_BattleScrolls_Max) { return false; };
	
	scrollName = StExt_Array_GetString("StExt_BattleScrolls", index);
	scroll = StExt_GetInstanceIdByName(scrollName);
	if(npc_hasitems(StExt_Npc_HasBattleScroll_Npc, scroll) > 0)
	{
		StExt_Npc_HasBattleScroll_Result = true;
		return false;
	};
	return (index < StExt_BattleScrolls_Max);
};
func int StExt_Npc_HasBattleScroll(var c_npc slf)
{
	StExt_Npc_HasBattleScroll_Result = false;
	StExt_Npc_HasBattleScroll_Npc = StExt_GetNpc(slf);
	if (!hlp_isvalidnpc(StExt_Npc_HasBattleScroll_Npc)) 
	{ 
		StExt_PrintDebug("StExt_Npc_HasBattleScroll(...)", "Instance is Null!", StExt_Npc_HasBattleScroll_Npc, other); 
		return false; 
	};	
	StExt_While(StExt_Npc_HasBattleScroll_Loop);
	return StExt_Npc_HasBattleScroll_Result;
};

// Use battle scroll
var int StExt_Npc_UseBattleScroll_Result;
var c_npc StExt_Npc_UseBattleScroll_Npc;
func int StExt_Npc_UseBattleScroll_Loop(var int index)
{
	var string scrollName;
	var int scroll;
	var c_item scrollInst;
	if (index >= StExt_BattleScrolls_Max) { return false; };
	
	scrollName = StExt_Array_GetString("StExt_BattleScrolls", index);
	scroll = StExt_GetInstanceIdByName(scrollName);
	if((scroll != StExt_Null) && (npc_hasitems(StExt_Npc_UseBattleScroll_Npc, scroll) > 0))
	{
		scrollInst = StExt_GetItemById(scroll);
		StExt_Npc_UseBattleScroll_Result = scrollInst.spell;
		npc_removeinvitem(StExt_Npc_UseBattleScroll_Npc, scroll);
		StExt_DeleteTempItem(scrollInst);
		return false;
	};
	return (index < StExt_BattleScrolls_Max);
};
func int StExt_Npc_UseBattleScroll(var c_npc slf)
{
	StExt_Npc_UseBattleScroll_Result = StExt_Null;
	StExt_Npc_UseBattleScroll_Npc = StExt_GetNpc(slf);
	if (!hlp_isvalidnpc(StExt_Npc_UseBattleScroll_Npc)) 
	{ 
		StExt_PrintDebug("StExt_Npc_UseBattleScroll(...)", "Instance is Null!", StExt_Npc_UseBattleScroll_Npc, other); 
		return false; 
	};	
	StExt_While(StExt_Npc_UseBattleScroll_Loop);	
	return StExt_Npc_UseBattleScroll_Result;
};

// Use healing scroll
func int StExt_Npc_UseHealingScroll(var c_npc slf)
{
	if(npc_hasitems(slf, itsc_palfullheal) > 0) { npc_removeinvitem(slf, itsc_palfullheal); return spl_palfullheal; };
	if(npc_hasitems(slf, itsc_fullheal) > 0) { npc_removeinvitem(slf, itsc_fullheal); return spl_fullheal; };
	if(npc_hasitems(slf, itsc_palmediumheal) > 0) { npc_removeinvitem(slf, itsc_palmediumheal); return spl_palmediumheal; };
	if(npc_hasitems(slf, itsc_mediumheal) > 0) { npc_removeinvitem(slf, itsc_mediumheal); return spl_mediumheal; };	
	if(npc_hasitems(slf, itsc_pallightheal) > 0) { npc_removeinvitem(slf, itsc_pallightheal); return spl_pallightheal; };
	if(npc_hasitems(slf, itsc_lightheal) > 0) { npc_removeinvitem(slf, itsc_lightheal); return spl_lightheal; };
	return StExt_Null;
};


// In any case call this func to work passives and process timers
func void StExt_Npc_AbilityPassive_Loop()
{
	var int afix;
	var int sufix;	
	var int prefix;
	var int isPlayer;
	
	if (StExt_GamePaused()) { return; };
	if (!hlp_isvalidnpc(StExt_Self)) 
	{
		StExt_PrintDebug("StExt_Npc_AbilityPassive_Loop()", "StExt_Self instance is null!", StExt_Self, StExt_NullNpc);
		return; 
	};
	
	if ((StExt_Self.aivar[43] == id_totem) || (hlp_getinstanceid(StExt_Self) == hlp_getinstanceid(wisp_detector))) { return; };
	if (StExt_Self.aivar[43] == id_training_aim)
	{
		StExt_Self.attribute[1] = StExt_DummyHp;
		StExt_Self.attribute[0] = StExt_DummyHp;
		return;
	};
	if (rx_isnpc(StExt_Self, none_99666_StonedTrader)) { rx_restorehealth(StExt_Self, StExt_Self.attribute[1]); };
	if (rx_isnpc(StExt_Self, stext_bdt_random) && StExt_Npc_HasExtraFlag(StExt_Self, StExt_NpcFlag_RandomBandit) && Hlp_StrCmp(StExt_Self.name, "BDT")) { StExt_RestoreRandomBanditAppearance(StExt_Self); };
	
	isPlayer = npc_isplayer(StExt_Self);
	if (isPlayer) { return; };	

	StExt_Npc_ChangeCooldown(StExt_Self, StExt_AiVar_PassiveAbilityCooldown, -1);
	StExt_Npc_ChangeCooldown(StExt_Self, StExt_AiVar_ActiveAbilityCooldown, -1);
	StExt_Npc_ProcessAbilityCooldowns(StExt_Self);

	// Process passive abilities
	if (StExt_GetNpcVar(StExt_Self, StExt_AiVar_PassiveAbilityCooldown) <= 0)
	{
		StExt_CheckNpcName(StExt_Self);
		StExt_Npc_ChangeCooldown(StExt_Self, StExt_AiVar_PassiveAbilityCooldown, StExt_GetFramesFromSeconds(1));
		
		if (StExt_IsSummonOrTotem(StExt_Self)) { StExt_Summon_PassiveHandler(StExt_Self); }
		else if (!npc_isplayer(StExt_Self)) 
		{
			StExt_Npc_PassiveHandler(StExt_Self);
			if (!StExt_IsSummonOrTotem(StExt_Self) && (StExt_Self.aivar[15] == true) && StExt_HeroHasAnyAura) { StExt_Summon_AuraPassiveHandler(StExt_Self); };
			
			if (npc_getdisttonpc(StExt_Self, hero) < 4500) 
			{
				if (StExt_Config_Diff_EnableDaily || StExt_Config_Diff_EnableKapitel || StExt_Config_Diff_EnableLevel) { StExt_Npc_UpdateStats(StExt_Self); };
				StExt_Npc_ForEachAbility(StExt_Self, StExt_NpcAbility_Type_Passive, StExt_NpcAbility_Flag_OnTick, StExt_Npc_PassiveAbilityHandler);				
			};			
		};
	};
};

func int StExt_AbilityAttack_Loop(var c_npc slf, var c_npc oth) 
{
	var int dist;
	var int canSeeTarget;
	var int abilitySlot; abilitySlot = StExt_Null;
	var int abilityCasted; abilityCasted = false;

	if (StExt_GamePaused()) { return abilityCasted; };
	if (!hlp_isvalidnpc(slf)) { StExt_PrintDebug("StExt_AbilityAttack_Loop()", "self instance is null!", slf, oth); return abilityCasted; };
	if (!hlp_isvalidnpc(oth)) { StExt_PrintDebug("StExt_AbilityAttack_Loop()", "other instance is null!", slf, oth); return abilityCasted; };
	
	if (c_npcisdown(oth)) { return abilityCasted; };
	if (StExt_GetNpcVar(slf, StExt_AiVar_ActiveAbilityCooldown) > 0) { return abilityCasted; };
	
	ai_turntonpc(slf, oth);
	dist = npc_getdisttonpc(slf, oth);
	canSeeTarget = npc_canseenpc(slf, oth);
	
	if(!canSeeTarget || (dist > StExt_Npc_Ability_DistMax))
	{
		ai_gotonpc(slf, oth);
		return abilityCasted;
	};	
	
	abilitySlot = StExt_Npc_SelectAbility(slf, StExt_NpcAbility_Type_Summon, StExt_NpcAbility_Flag_OnCast, dist);
	if (!abilityCasted && ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities))) { 
		abilityCasted = StExt_Npc_UseAbility(slf, oth, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnCastAbility);
	};
	
	abilitySlot = StExt_Npc_SelectAbility(slf, StExt_NpcAbility_Type_Buff, StExt_NpcAbility_Flag_OnCast, dist);
	if (!abilityCasted && ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities))) { 
		abilityCasted = StExt_Npc_UseAbility(slf, oth, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnCastAbility);
	};
	
	abilitySlot = StExt_Npc_SelectAbility(slf, StExt_NpcAbility_Type_Debuff, StExt_NpcAbility_Flag_OnCast, dist);
	if (!abilityCasted && ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities))) { 
		abilityCasted = StExt_Npc_UseAbility(slf, oth, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnCastAbility);
	};
	
	if (canSeeTarget && (dist > StExt_Npc_Ability_DistMin))
	{	
		abilitySlot = StExt_Npc_SelectAbility(slf, StExt_NpcAbility_Type_Spell, StExt_NpcAbility_Flag_OnCast, dist);
		if (!abilityCasted && ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities))) { 
			StExt_PrintDebug("StExt_AbilityAttack_Loop()", "self instance try cast spell...", slf, oth);
			abilityCasted = StExt_Npc_UseAbility(slf, oth, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnCastAbility);
		};
		
		abilitySlot = StExt_Npc_SelectAbility(slf, StExt_NpcAbility_Type_Throw, StExt_NpcAbility_Flag_OnCast, dist);
		if (!abilityCasted && ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities))) { 
			abilityCasted = StExt_Npc_UseAbility(slf, oth, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnCastAbility);
		};
	};
	
	if (!abilityCasted) { StExt_Npc_AwaitAbilityCooldown(slf); };
	return abilityCasted;
};

// (Boss special moves are self-contained in DamageController - the old
// ability-loop callback that lived here was removed: it never fired for
// human bosses and left them unarmed.)

// Call from engine every frame from engine for any npc
func void StExt_OnAiState() { StExt_Npc_AbilityPassive_Loop(); };

func int b_selectspell(var c_npc slf, var c_npc oth) 
{
	var int result;
	var int spellId;
	var int dist;
	var int spellDmg;
	var int isCasting;
	
	if (!hlp_isvalidnpc(slf) || !hlp_isvalidnpc(oth)) 
	{
		StExt_PrintDebug("b_selectspell()", "slf or oth instance is null!", slf, oth);
		return false; 
	};
	if (npc_isdead(slf)) { return false; };
	
	isCasting = ((npc_isdrawingspell(slf) > 0) || (npc_getactivespell(slf) > 0));
	if (rx_isnpc(slf, stext_heroshadow)) 
	{ 
		spellId = rx_getnpcvar(slf, aivrx_npc_boss_use_spell_id);
		if ((slf.aivar[51] == magic_always) && (spellId > 0))
		{
			if (isCasting) { return true; };
			rx_readyspell(slf, spellId, 5);
			return true;
		};
		return false; 
	};	
	if (rx_isnpc(slf, summoned_skeleton_mage)) 
	{
		if (isCasting) { return true; };
        if(npc_gettalentskill(hero, npc_talent_mage) == 4) { rx_readyspell(slf, spl_energyball, 10); }
        else if(npc_gettalentskill(hero, npc_talent_mage) == 5) { rx_readyspell(slf, spl_deathball, 15); }
        else if(npc_gettalentskill(hero, npc_talent_mage) == 6) { rx_readyspell(slf, spl_skull, 20); }
        else { rx_readyspell(slf, spl_darkball, 10); };
        return true;
    };	
	if (rx_isnpc(slf, summoned_skeletonuniq) && (skeletonweapontype == 7)) 
	{
		if (isCasting) { return true; };
		if (slf.level >= 50) { rx_readyspell(slf, spl_skull, 20); }
		else if (slf.level >= 30) { rx_readyspell(slf, spl_deathball, 10); }
		else { rx_readyspell(slf, spl_darkball, 5); };
        return true;
    };	
	if (rx_isnpc(slf, none_99666_StonedTrader))
	{
		rx_readyspell(slf, spl_skull, 20);
		return true;
	};
	if (rx_isnpc(slf, stext_bdt_random) && (slf.aivar[51] == magic_always))
	{
		if (isCasting) { return true; };
		
		spellId = StExt_GetNpcVar(slf, StExt_AiVar_UseSpellRune);		
		if (spellId > 0)
		{
			if ((spellId == spl_firebolt) && !npc_hasitems(slf, itru_firebolt)) { createinvitems(slf, itru_firebolt, 1); };
			if ((spellId == spl_icebolt) && !npc_hasitems(slf, itru_icebolt)) { createinvitems(slf, itru_icebolt, 1); };
			if ((spellId == spl_zap) && !npc_hasitems(slf, itru_zap)) { createinvitems(slf, itru_zap, 1); };
			if ((spellId == spl_dot_first) && !npc_hasitems(slf, itru_dot_first)) { createinvitems(slf, itru_dot_first, 1); };
			if ((spellId == spl_dot_second) && !npc_hasitems(slf, itru_dot_second)) { createinvitems(slf, itru_dot_second, 1); };
			if ((spellId == spl_deathbolt) && !npc_hasitems(slf, itru_deathbolt)) { createinvitems(slf, itru_deathbolt, 1); };		
			if ((spellId == spl_deathball) && !npc_hasitems(slf, itru_deathball)) { createinvitems(slf, itru_deathball, 1); };
			if ((spellId == spl_darkball) && !npc_hasitems(slf, itru_darkball)) { createinvitems(slf, itru_darkball, 1); };
			if ((spellId == spl_darkspear) && !npc_hasitems(slf, itru_darkspear)) { createinvitems(slf, itru_darkspear, 1); };			
			if ((spellId == spl_waterfist) && !npc_hasitems(slf, itru_waterfist)) { createinvitems(slf, itru_waterfist, 1); };
			if ((spellId == spl_acid) && !npc_hasitems(slf, itru_acid)) { createinvitems(slf, itru_acid, 1); };
			if ((spellId == spl_greententacle) && !npc_hasitems(slf, itru_greententacle)) { createinvitems(slf, itru_greententacle, 1); };
			if ((spellId == spl_lacerate) && !npc_hasitems(slf, itru_lacerate)) { createinvitems(slf, itru_lacerate, 1); };
			if ((spellId == spl_instantfireball) && !npc_hasitems(slf, itru_instantfireball)) { createinvitems(slf, itru_instantfireball, 1); };
			if ((spellId == spl_lightningflash) && !npc_hasitems(slf, itru_lightningflash)) { createinvitems(slf, itru_lightningflash, 1); };
			if ((spellId == spl_chargezap) && !npc_hasitems(slf, itru_thunderball)) { createinvitems(slf, itru_thunderball, 1); };
			if ((spellId == spl_icelance) && !npc_hasitems(slf, itru_icelance)) { createinvitems(slf, itru_icelance, 1); };
			if ((spellId == spl_stonefirst) && !npc_hasitems(slf, itru_stonefirst)) { createinvitems(slf, itru_stonefirst, 1); };
			
			rx_readyspell(slf, spellId, 10);
			return true;
		};		
	};
	
	spellId = StExt_Null;
	dist = npc_getdisttonpc(slf, oth);
	if (rx_getnpcvar(slf, aivrx_spelldamagescale) < 1)
	{
		spellDmg = slf.level + 1 + (rx_monsterpower - 99) + ((StExt_GetNpcVar(slf, StExt_AiVar_ExtraMagicDamage) + 1) / 10);
		rx_setnpcvar(slf, aivrx_spelldamagescale, spellDmg);
	};	
	
	result = b_selectspell_old(slf, oth);
	if (rx_checkhealthpercent(slf, 25 + hlp_random(10)))
	{
		spellId = StExt_Npc_UseHealingScroll(slf);
		if (spellId >= 0)
		{
			wld_playeffect("spellfx_heal", slf, slf, 0, 0, 0, false);
			if(spellId == spl_palfullheal) { rx_restorehealthpercent(slf, 60 + hlp_random(30)); }
			else if(spellId == spl_fullheal) { rx_restorehealthpercent(slf, 50 + hlp_random(25)); }
			else if(spellId == spl_palmediumheal) { rx_restorehealthpercent(slf, 30 + hlp_random(20)); }
			else if(spellId == spl_mediumheal) { rx_restorehealthpercent(slf, 25 + hlp_random(15)); }
			else if(spellId == spl_pallightheal) { rx_restorehealthpercent(slf, 15 + hlp_random(10)); }
			else { rx_restorehealthpercent(slf, 10 + hlp_random(10)); };
		};
	};
	
	if (result == false)
	{
		if (isCasting) { return true; };
		
		if (StExt_Npc_HasBattleScroll(slf))
		{
			spellId = StExt_Npc_UseBattleScroll(slf);
			if ((dist >= StExt_Npc_Spell_DistMin) && (spellId >= 0))
			{
				StExt_PrintDebug("b_selectspell()", concatstrings("scroll found: ", inttostring(spellId)), slf, oth);
				if (npc_isinfightmode(slf, fmode_melee)) { ai_removeweapon(slf); };
				if (npc_isinfightmode(slf, fmode_far)) { ai_removeweapon(slf); };
				b_readyspell(slf, spellId, 1);
				return true;
			}
			else
			{
				if (npc_hasreadiedweapon(slf)) { return true; };
				if (npc_isinfightmode(slf, fmode_magic)) { ai_unreadyspell(slf); };
				
				if ((dist >= 500) && npc_hasequippedrangedweapon(slf))
				{
					b_createammo(slf);
					ai_removeweapon(slf);
					ai_readyrangedweapon(slf);
				}
				else
				{
					if(npc_isinfightmode(slf, fmode_far)) { ai_removeweapon(slf); };
					rx_setmeleemode(slf);
				};
				return true;
			};
		}
		else if ((dist >= 500) && npc_hasequippedrangedweapon(slf))
		{
			b_createammo(slf);
			if (npc_hasreadiedweapon(slf)) { return true; };			
			ai_removeweapon(slf);
			ai_readyrangedweapon(slf);
			return true;
		};
	};
	return result;
};

func int zs_mm_attack_loop() 
{
	if (rx_gamepaused || rx_gamevoting) { return loop_continue; };
    npc_gettarget(self);
	
	if (StExt_PreventNpcSummonFight(self, other)) { return loop_end; };
	if (StExt_NpcsIsAllies(self, other)) { return loop_end;	};
	
	if (StExt_CanCastAbility(self, other))
	{
		self.aivar[7] = hlp_getinstanceid(other);
		if (StExt_AbilityAttack_Loop(self, other))
		{
			ai_turntonpc(self, other);
			ai_playani(self, "T_WARN");
			ai_wait(self, 0.25);
		};		
	};	
	
	rx_restorenpchealthstop(self);
	return zs_mm_attack_loop_old();
};

func void b_mm_assessenemy() 
{
	if (StExt_PreventNpcSummonFight(self, other)) { return; };
	b_mm_assessenemy_old();
};

func int b_assessenemy()
{
	if (StExt_PreventNpcSummonFight(self, other)) { return false; };
	return b_assessenemy_old();
};

func void b_assessmurder() 
{
	if (hlp_isvalidnpc(victim)) 
	{
		if (c_npcishuman(victim))
		{
			if (victim.attribute[atr_hitpoints] > 0) { return; };
			if (c_bodystatecontains(victim, bs_unconscious)) { return; };
		};
	};
	b_assessmurder_old();
};

func void zs_dead() 
{
	var int abilitySlot;
	var int otherIsHero;
	var int sacreficeBonus;
	var int sacreficeSecondaryBonus;
	
	StExt_PrintDebugStack("OnDead()");
	if (!hlp_isvalidnpc(self)) { StExt_PrintDebugStack("OnDead() - Self instance is Null!"); return; };
	if (!hlp_isvalidnpc(other)) { StExt_PrintDebugStack("OnDead() - Other instance is Null!"); return; };
	
	// CELE WOJNY Z LOWCAMI DEMONOW MAJA UMIERAC NAPRAWDE.
	// Bazowi lowcy sa chronieni przed smiercia tak jak Lord Hagen - cos trzyma im
	// HP powyzej zera, wiec ponizsza galaz "falszywej smierci" stawiala ich z
	// powrotem na nogi (zgloszenie: "dobijasz, a on i tak wstaje"; innych NPC dalo
	// sie dobic normalnie). Zerujemy HP, zeby poszla zwykla sciezka smierci.
	// Tylko gdy zlecenie jest aktywne i tylko dla naszej obstawy (99790-99794)
	// albo NPC z gildii lowcow odczytanej w runtime.
	if ((StExt_DH_Stage == 1) && (self.attribute[atr_hitpoints] > 0))
	{
		if (((self.id >= 99790) && (self.id <= 99794)) || ((StExt_DH_HunterGuild > 0) && (self.guild == StExt_DH_HunterGuild)))
		{
			self.attribute[atr_hitpoints] = 0;
		};
	};

	if (self.attribute[atr_hitpoints] > 0)
	{
		StExt_PrintDebugStack("OnDead() -> false death detected!");
		if (self.guild <= gil_seperator_hum)
		{
			ext_removefromslot(self, "BIP01 R CLAVICLE");
			ext_removefromslot(self, "BIP01 SPINE");
			ext_removefromslot(self, "BIP01 L HAND");
			self.aivar[35] = false;
			mdl_removeoverlaymds(self, "HUMANS_NEWTORCH.MDS");			
			npc_removeinvitems(self, itlsfiretorch, npc_hasitems(self, itlsfiretorch));
		};
		npc_clearaiqueue(self);
		ai_standup(self);
		npc_perceiveall(self);
		
		if (self.guild <= gil_seperator_hum) { ai_playanibs(self, "T_STAND_2_WOUNDED", bs_unconscious); };
		ai_startstate(self, zs_unconscious, 0, "");
		return;
	};
	
	zs_dead_old();

	// GLOBAL BOSS LEGENDARY DROP: every boss in the world (rx_isboss covers
	// NB/Returning bosses; 99710-99740 covers our Zakon/tower ones) has a
	// FLAT 5% chance to drop one LEGENDARY item scaled to the hero's level.
	// Never armor - weapons and jewelry only (user call). This replaces the
	// old guaranteed legendary-jewelry drop on Zakon bosses.
	if (StExt_Npc_IsDead(self) && (rx_isboss(self) || ((self.id >= 99710) && (self.id <= 99740))))
	{
		if (StExt_Chance(50))
		{
			var int lgdType;
			var int lgdRoll; lgdRoll = hlp_random(4);
			if (lgdRoll == 0)      { lgdType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H"); }
			else if (lgdRoll == 1) { lgdType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"); }
			else if (lgdRoll == 2) { lgdType = StExt_SelectItemClassFromList("StExt_ItemClass_List_MagicWeapon"); }
			else                   { lgdType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Jewelry"); };
			var int lgdItm; lgdItm = StExt_GenerateRankedItem(lgdType, (hero.level * 7) + (kapitel * 30), StExt_ItemRankLegendary);
			StExt_CreateRandomItem(self, lgdItm, 1, false);
			printscreencolor("LEGENDARNY LUP!", 62, 8, StExt_DefaultFont, 2, StExt_Color_Header);
		};
	};

	otherIsHero = StExt_IsSummonOrHero(other) || rx_getnpcvar(other, aivrx_npc_control_agro) || rx_getnpcvar(other, aivrx_npc_darkcontrol);
	if (!StExt_Npc_IsDead(self))
	{
		if (rx_getnpcvar(self, aivrx_npc_kill_by_player) || otherIsHero)
		{
			if (c_npcishuman(self))
			{
				sacreficeBonus = StExt_GetPercentFromValueWithMin(self.level, 10 + hlp_random(10), 1);
				sacreficeSecondaryBonus = StExt_GetPercentFromValueWithMin(sacreficeBonus, 50, 1);
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Mage, StExt_CorruptPerkIndex_Mage_Sacrifice)) 
				{ 
					b_raiseattribute_bonus(hero, atr_hitpoints_max, sacreficeBonus);
					if (rx_getchance(50)) { b_raiseattribute_bonus(hero, atr_mana_max, sacreficeSecondaryBonus * 2); }
					else { rx_changeint(sacreficeSecondaryBonus); };
				};
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Sacrifice)) 
				{
					b_raiseattribute_bonus(hero, atr_mana_max, sacreficeBonus);
					if (rx_getchance(50)) { b_raiseattribute_bonus(hero, atr_hitpoints_max, sacreficeSecondaryBonus * 2); }
					else { b_raiseattribute_bonus(hero, atr_strength, sacreficeSecondaryBonus); };
				};
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Ranger, StExt_CorruptPerkIndex_Ranger_Sacrifice)) 
				{
					b_raiseattribute_bonus(hero, atr_hitpoints_max, sacreficeBonus);
					if (rx_getchance(25)) 
					{
						if (rx_getchance(50)) { b_raiseattribute_bonus(hero, atr_strength, sacreficeSecondaryBonus); }
						else if (rx_getchance(35)) { b_raiseattribute_bonus(hero, atr_mana_max, sacreficeSecondaryBonus); }
						else { b_raiseattribute_bonus(hero, atr_dexterity, sacreficeSecondaryBonus); };	
					}
					else { b_raiseattribute_bonus(hero, atr_dexterity, sacreficeSecondaryBonus); };				
				};
				
				if (StExt_IsCorruptionPerkLearned(StExt_Corruption_Warrior, StExt_CorruptPerkIndex_Warior_Cannibal)) { rx_restorehealthpercent(hero, 50); };
			};
			
			if (StExt_NpcIsLivingBeing(self) && npc_isplayer(other) && StExt_Chance(StExt_PcStats[StExt_PcStats_Index_ChanceToReanimate])) { StExt_DoReanimation(self); };
		};
		
		// Enemy-mob on-death effects (rolled by the blessed/nasycone MagicInfusion affix system, e.g. a
		// rain of fire when you kill a krwopijca) are DISABLED - they killed the player just for landing
		// the kill. On-death now fires ONLY for player summons (e.g. Mage MinionInstability perk). Nothing
		// is removed from data, so no crash and saves stay valid; the affix simply never triggers on-death
		// for enemies (its other bonuses still apply).
		if ((self.aivar[43] != id_totem) && StExt_IsSummonOrTotem(self))
		{
			abilitySlot = StExt_Npc_SelectAbility(self, StExt_NpcAbility_Type_Passive, StExt_NpcAbility_Flag_OnDeath, StExt_Null);
			if ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities)) {
				StExt_Npc_UseAbility(self, other, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnDeath);			
			};
		};
	};
	
	// Just some fallback in case
	if (rx_isnpc(self, stext_andriel) && !stext_andriel_isdead) {
		stext_andriel_isdead = true;
		b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_2);
	};
	
	if (rx_isnpc(self, stext_duriel) && !stext_duriel_isdead) {
		stext_duriel_isdead = true;
		b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_4);
	};
	
	if (rx_isnpc(self, stext_mephisto) && !stext_mephisto_isdead) {
		stext_mephisto_isdead = true;
		b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_6);
	};
	
	if (rx_isnpc(self, stext_diablo) && !stext_diablo_isdead) {
		stext_diablo_isdead = true;
		b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_8);
	};
	
	if (rx_isnpc(self, stext_baal) && !stext_baal_isdead) {
		stext_baal_isdead = true;
		b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_10);
	};
	
	StExt_Npc_SetExtraFlag(self, StExt_NpcFlag_IsDead, true);
};
