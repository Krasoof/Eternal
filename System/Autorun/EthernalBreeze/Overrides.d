//--------------------------------------------------------------
// *** Bossowie Zakonu ZABIJAJA, nie oglusza​ja ***
//--------------------------------------------------------------
// Silnik (oNpc_Damage.cpp, OnDamage_Condition) decyduje "smierc czy omdlenie"
// tak:  bUnconscious = (HP == 1);  a dla ludzkiego napastnika bronia sieczna
// bDamageNotLethal &= (bBlunt || bEdge || bDamageDontKill) - i jesli C_DropUnconscious
// przepusci, ustawia bIsUnconscious zamiast bIsDead. To jest oryginalna mechanika
// Gothica ("budzisz sie obrabowany") i przy wiesniakach jest w porzadku.
//
// Przy bossie jest katastrofa i wyszla na zywym tescie: Ciernie bossa zbijaja
// gracza do 1 HP, HP==1 => bUnconscious => KAZDY kolejny cios tylko odnawia
// omdlenie zamiast zabic. Gracz lezy nietykalny na 1 HP, boss mloci w nieskonczonosc.
// Zgloszenie: "nie mogl mnie zabic, dobic, caly czas bylem na 1 HP".
//
// Zakon to gildia dark-souls: jej bossowie maja zabijac. Ids 99710-99725 (kanon
// architektury bossow) nie ogluszaja NIGDY - ani gracza, ani nikogo.
func int C_DropUnconscious()
{
	if (hlp_isvalidnpc(other))
	{
		if ((other.id >= 99710) && (other.id <= 99725)) { return false; };
		// Garnizon Wiezy Umarlych (99730-99738): nieumarli NIE padaja
		// nieprzytomni. Nokaut nie odpala ai_ondead - gracz "zabijal"
		// rycerza, licznik questa stal w miejscu ("zabilem go i nic").
		if ((other.id >= 99730) && (other.id <= 99738)) { return false; };
	};
	if (hlp_isvalidnpc(self))
	{
		if ((self.id >= 99730) && (self.id <= 99738)) { return false; };
	};
	return C_DropUnconscious_old();
};

// Main loop...
func void rx_mainloop()
{
	StExt_ProcessPcStats_Overcap();
	rx_mainloop_old();
	StExt_ProcessPcStats_Overcap();
	StExt_ModController();
};

func void b_checkmenuoption() 
{
	var int interactive;
	interactive = rx_isinteractiveactive;
	rx_isinteractiveactive = 1;
	StExt_ProcessPcStats_Overcap();
	b_checkmenuoption_old();
	StExt_ProcessPcStats_Overcap();
	rx_isinteractiveactive = interactive;
};

// Frame loop
func void perframe() 
{
	if (StExt_Config_DebugAlwaysEnabled && !StExt_Config_DebugEnabled) { StExt_Config_DebugEnabled = true; };
	perframe_old();	
	StExt_ProcessHeroFastStats();
	StExt_DrawUi();
	
	StExt_Damage_SpellCastFrameOffset = 0;
};

func int rx_calcnpcexp(var c_npc slf, var c_npc oth) 
{
	var int result;
	result = rx_calcnpcexp_old(slf, oth);
	if ((result > 0) && (StExt_Config_NpcExp != 100)) 
	{ 
		result = StExt_GetPercentFromValue(result, StExt_Config_NpcExp); 
		if (result <= 0) { result = 1; };
	};
	return result;
};

//==================================================================
// 					Proccess Npc stats
//==================================================================

func void rx_updatemonsterprot(var c_npc slf) 
{
    if(rx_monsterprotratio <= 100) { return; };
    if(getvar2_value(slf, bit_prot_boost) == true) { return; };
    if(slf.protection[2] > 0) { slf.protection[2] = slf.protection[2] * rx_monsterprotratio / 100; };
    if(slf.protection[1] > 0) { slf.protection[1] = slf.protection[1] * rx_monsterprotratio / 100; };
    if(slf.protection[6] > 0) { slf.protection[6] = slf.protection[6] * rx_monsterprotratio / 100; };
    if(slf.protection[3] > 0) { slf.protection[3] = slf.protection[3] * rx_monsterprotratio / 100; };
    if(slf.protection[5] > 0) { slf.protection[5] = slf.protection[5] * rx_monsterprotratio / 100; };
	if(slf.protection[4] > 0) { slf.protection[4] = slf.protection[4] * rx_monsterprotratio / 100; };
    setvar2_true(slf, bit_prot_boost);
};

func void rx_applymonsterstats(var c_npc slf) 
{
    if((!rx_herocreated) || (slf.aivar[89] == true)) { return; };
    if(npc_isplayer(slf) || rx_issummonnpc(slf) || (slf.aivar[43] == id_training_aim) || rx_isnpc(slf, pc_heromul)) { return; };
    rx_updatemonsterprot(slf);
	
    if((slf.aivar[89] == false) && (slf.attribute[1] >= 1)) 
	{
        if((slf.aivar[90] == true) && (slf.aivar[43] != id_spider) && (slf.guild != gil_molerat) && (slf.guild != gil_minecrawler)) 
		{
            slf.bodystateinterruptableoverride = true;
            slf.protection[4] += 1000;
        };		
        if(rx_monsterhpratio != 100) 
		{
			slf.attribute[1] = StExt_CheckIntOverflow(slf.attribute[1], slf.attribute[1] * rx_monsterhpratio / 100);
            slf.attribute = slf.attribute[1];
        };
        if(rx_monsterpower != 100) 
		{
            slf.attribute[4] = (slf.attribute[4] + 1) * rx_monsterpower / 100;
			slf.attribute[5] = (slf.attribute[5] + 1) * rx_monsterpower / 100;
            if(slf.damage[1] > 0) { slf.damage[1] = slf.damage[1] * rx_monsterpower / 100; };
			if(slf.damage[2] > 0) { slf.damage[2] = slf.damage[2] * rx_monsterpower / 100; };
			if(slf.damage[3] > 0) { slf.damage[3] = slf.damage[3] * rx_monsterpower / 100; };
			if(slf.damage[4] > 0) { slf.damage[4] = slf.damage[4] * rx_monsterpower / 100; };
			if(slf.damage[5] > 0) { slf.damage[5] = slf.damage[5] * rx_monsterpower / 100; };
            if(slf.damage[6] > 0) { slf.damage[6] = slf.damage[6] * rx_monsterpower / 100; };
        };
		
        slf.aivar[89] = true;
		StExt_Npc_SaveBaseStats(slf);
    };
};

// Do any npc operations here (duplication, infusion, etc..)
func void rx_ast_updatemonsterstats() 
{
	if ((!rx_herocreated) || (!StExt_ModInitialized)) { return; };
	if (self.aivar[89] == true) 
	{ 
		StExt_CheckUid(self);
		return;
	}
    if (npc_isplayer(self) || rx_issummonnpc(self) || (self.aivar[43] == id_training_aim) || rx_isnpc(self, pc_heromul)) 
	{
		StExt_CheckUid(self);
		return; 
	};
	
	if (!npc_isdead(self))
	{
		StExt_PrintDebugStack("rx_ast_updatemonsterstats()");
		StExt_CheckUid(self);
		StExt_Npc_CheckStats(self);
		rx_applymonsterstats(self);
		StExt_Npc_Initialize(self);
		
		if(!StExt_IsSummonOrHero(self) && (self.aivar[43] != id_totem) && (self.aivar[43] != id_wisp) && (hlp_getinstanceid(self) != hlp_getinstanceid(wisp_detector)))
		{
			StExt_Npc_RandomizeStats(self);
			// Med-tier floor PRZED infuzja: infuzja mnozy sie na podlodze,
			// elita zostaje elita (patrz StExt_Npc_ApplyTierFloor).
			StExt_Npc_ApplyTierFloor(self);
			StExt_Npc_InfuseWithMagic(self);
			StExt_Npc_ApplyLevelBonus(self);
			StExt_Npc_InitializeExtraStats(self);
			StExt_Npc_RandomizeEquipment(self);			
			StExt_Npc_ApplyGlobalConfigs(self);
			StExt_CheckNpcName(self);
			StExt_Npc_Duplicate(self);
		};		
		//StExt_ValidateNpcPosition(self);
	};
};

func int rx_calcmonsterpower(var int initvalue) 
{
    var int result;
    result = initvalue * rx_monsterpower / 100;
    return result;
};
func int rx_calcmonsterdragon(var int initvalue) 
{
    var int result;
    result = initvalue * rx_monsterpower / 100;
    return result;
};
//==================================================================

// Override rave dungeon entrace
// Now everbody at any stats can enter
func int rx_dungeonraven_canenter() { return true; };

func void b_checkopenchest() 
{
    var int tempchestlvl;
    tempchestlvl = mob_getbreaknum();
    if(tempchestlvl == 0) { tempchestlvl = 3; };
	StExt_ChestLuckHandler();
	if(StExt_Config_Luck_EnableRandomLoot_Chests) { StExt_ChestLootHandler(tempchestlvl * (kapitel + hlp_random(5))); };
	b_checkopenchest_old();
};
func void rx_checkopenchest() 
{
    var int tempchestlvl;	
	
    tempchestlvl = mob_getbreaknum();
    if(tempchestlvl == 0) { tempchestlvl = 3; };
	StExt_ChestLuckHandler();
	if(StExt_Config_Luck_EnableRandomLoot_Chests) { StExt_ChestLootHandler(tempchestlvl * (kapitel + hlp_random(5))); };
	rx_checkopenchest_old();
};

func void b_giveextraloot(var c_npc slf) 
{
	b_giveextraloot_old(slf);
	if((StExt_Config_Luck_EnableRandomLoot_Bodies && !StExt_Npc_IsLooted(slf)) && !StExt_IsSummonOrHero(slf)) { StExt_BodyLootHandler(slf); };
	if(StExt_Npc_IsLooted(slf)) { StExt_BodyExtraLootHandler(slf); };
	
	if (rx_isnpc(slf, summoned_shadowbeast_skeleton)) { npc_clearinv(slf); };
};

func void zs_unconscious()
{
	// LOWCY DEMONOW MAJA UMIERAC, NIE MDLEC.
	// Zgloszenie "padaja, ale nie da sie ich dobic" bralo sie stad, ze silnik
	// przy HP == 1 wysyla NPC prosto w OMDLENIE - zs_dead nigdy nie jest wolane,
	// wiec caly fix "falszywej smierci" byl na slepym torze (sonda DH-FALSEDEAD
	// milczala w kazdym logu, mimo ze user ich powalal). Tutaj jest wlasciwe
	// miejsce: zamiast omdlenia zerujemy HP i puszczamy prawdziwa smierc.
	// Identyfikacja jak w bazie (Utils.d): hlp_getinstanceid po obu stronach.
	StExt_Trace(concatstrings(concatstrings("DH-UNCON inst=", inttostring(hlp_getinstanceid(self))), concatstrings(concatstrings(" guild=", inttostring(self.guild)), concatstrings(" id=", inttostring(self.id)))));

	if (((self.id >= 99790) && (self.id <= 99794))
		|| (hlp_getinstanceid(self) == hlp_getinstanceid(DH_MAINNPC))
		|| (hlp_getinstanceid(self) == hlp_getinstanceid(DH_NPCSEVERIN))
		|| (hlp_getinstanceid(self) == hlp_getinstanceid(DH_VILANDNPC))
		|| (hlp_getinstanceid(self) == hlp_getinstanceid(DH_SLD_MERCENARY_01))
		|| (hlp_getinstanceid(self) == hlp_getinstanceid(DH_SLD_MERCENARY_02)))
	{
		StExt_Trace("DH-UNCON -> nasz lowca: zamiast omdlenia PRAWDZIWA smierc");
		self.attribute[atr_hitpoints] = 0;
		self.flags = self.flags & (~npc_flag_immortal);
		self.flags = self.flags & (~npc_flag_xaradrim);
		ai_startstate(self, zs_dead, 0, "");
		return;
	};

	zs_unconscious_old();
	if((StExt_Config_Luck_EnableRandomLoot_Bodies && !StExt_Npc_IsLooted(self)) && !StExt_IsSummonOrHero(self)) { StExt_BodyLootHandler(self); };
};

func int rx_fullsnc_checkcircle(var int circle) 
{
	var int result;
	var int mana;
	mana = StExt_GetTruePcMana();	
	
	if ((!rx_heroismage()) && (circle > 3)) 
	{
		if(StExt_ValueInRange(circle, 4, 5) && StExt_HeroCanLearnAdvanceMagic()) 
		{
			if(circle == 4) 
			{
				if((atr_intellect < 400) || (mana < 750)) 
				{
					ai_printred(rx_str_snc_noskillreq);
					ai_printred(rx_getsncstatlearn(atr_mana_max, 750));
					ai_printred(rx_getsncstatlearn(atr_fake_int, 400));
					return false;
				};
			}
			else if(circle == 5) 
			{
				if((atr_intellect < 600) || (mana < 950)) 
				{
					ai_printred(rx_str_snc_noskillreq);
					ai_printred(rx_getsncstatlearn(atr_mana_max, 950));
					ai_printred(rx_getsncstatlearn(atr_fake_int, 600));
					return false;
				};
			};
			return true;
		};
        return false;
    };
	
    if (circle == 1) 
	{
        if ((atr_intellect < 50) || (mana < 100)) 
		{
            ai_printred(rx_str_snc_noskillreq);
            ai_printred(rx_getsncstatlearn(atr_mana_max, 100));
            ai_printred(rx_getsncstatlearn(atr_fake_int, 50));
            return false;
        };
    }
    else if (circle == 2) 
	{
        if ((atr_intellect < 100) || (mana < 250)) 
		{
            ai_printred(rx_str_snc_noskillreq);
            ai_printred(rx_getsncstatlearn(atr_mana_max, 250));
            ai_printred(rx_getsncstatlearn(atr_fake_int, 100));
            return false;
        };
    }
    else if (circle == 3) 
	{
        if ((atr_intellect < 250) || (mana < 450)) 
		{
            ai_printred(rx_str_snc_noskillreq);
            ai_printred(rx_getsncstatlearn(atr_mana_max, 450));
            ai_printred(rx_getsncstatlearn(atr_fake_int, 250));
            return false;
        };
    }
    else if (circle == 4) 
	{
        if ((atr_intellect < 400) || (mana < 750)) 
		{
            ai_printred(rx_str_snc_noskillreq);
            ai_printred(rx_getsncstatlearn(atr_mana_max, 750));
            ai_printred(rx_getsncstatlearn(atr_fake_int, 400));
            return false;
        };
    }
    else if (circle == 5) 
	{
        if ((atr_intellect < 600) || (mana < 950)) 
		{
            ai_printred(rx_str_snc_noskillreq);
            ai_printred(rx_getsncstatlearn(atr_mana_max, 950));
            ai_printred(rx_getsncstatlearn(atr_fake_int, 600));
            return false;
        };
    }
    else 
	{
        if (circle == 6) {
            if ((atr_intellect < 700) || (mana < 1200)) 
			{
                ai_printred(rx_str_snc_noskillreq);
                ai_printred(rx_getsncstatlearn(atr_mana_max, 1200));
                ai_printred(rx_getsncstatlearn(atr_fake_int, 700));
                return false;
            };
        };
    };
	
    return true;
};

func int rx_canlearnmagiccirclenext(var int circle) 
{
	var int kapitelOffset;
	var int mana;
	kapitelOffset = kapitel;
	mana = StExt_GetTruePcMana();
	if (StExt_Config_NoChapterForMagicCircle) { kapitelOffset += 7; };

    if (rx_isfullsnc()) 
	{
        if (rx_heroismage()) { return true; }
		else if (circle <= 3) { return true; }
		else if ((circle <= 5) && StExt_HeroCanLearnAdvanceMagic()) { return true; };
        return false;
    };
	
    if (circle == 1) { return true; };	
    if (rx_heroismage()) 
	{
        if ((circle == 2) && ((kapitelOffset >= 2) || (mana >= 200))) { return true; };
        if ((circle == 3) && (kapitelOffset >= 3)) { return true; };
        if ((circle == 3) && ((kapitelOffset >= 2) && (mana >= 400))) { return true; };
        if ((circle == 4) && (kapitelOffset >= 4)) { return true; };
        if ((circle == 4) && ((kapitelOffset >= 3) && (mana >= 600))) { return true; };
        if ((circle == 5) && (kapitelOffset >= 5)) { return true; };
        if ((circle == 5) && (mana >= 900) && (kapitelOffset >= 4)) { return true; };
        if ((circle == 6) && (kapitelOffset >= 5) && (mis_scknowswaytoirdorath == true)) { return true; };
        if ((circle == 6) && (kapitelOffset >= 4) && (mana >= 1200)) { return true; };
    };
	
	if ((circle == 2) && (kapitelOffset >= 1)) { return true; };
	if ((circle == 2) && (kapitelOffset >= 2)) { return true; };
    if ((circle == 3) && (kapitelOffset >= 3)) { return true; };
  	
	if (StExt_HeroCanLearnAdvanceMagic())
	{
		if((circle == 4) && ((kapitelOffset >= 3) || (mana >= 600))) { return true; };
		if((circle == 5) && ((kapitelOffset >= 4) || (mana >= 900))) { return true; };
	};	
	
    return false;
};

func void b_clearruneinv(var c_npc slf) 
{
    var c_npc her;
    her = hlp_getnpc(pc_hero);
    if(hlp_getinstanceid(slf) != hlp_getinstanceid(her)) 
	{
		npc_removeinvitems(slf, itru_bigdarkball, npc_hasitems(slf, itru_bigdarkball));
		npc_removeinvitems(slf, itru_berzerk, npc_hasitems(slf, itru_berzerk));		
	};
	b_clearruneinv_old(slf);
};

func void rx_onteleportcurrent(var string point) 
{
	rx_onteleportcurrent_old(point);
	Dia_StExt_ModMenu_ExitDialog_info();
};

// Fix guru staff death
func void equip_stab_gur() 
{
    if(self.id == 0) 
	{
        snd_play3d(hero, "EQUIP_WEAPON_02");
		rx_changeintquiet(bonusmana_stab_gur);
		rx_changerunedamagebonus(20);
		meleeweaponindex = 1;
		aiv_staff_04 = true;
		aiv_staff = true;
		equipedindex_2h = true;
		rx_applyanim_weapons(self, -1);
    };
};

/*
func void rx_checksavedtransformbonuses() 
{
	StExt_ProcessStatsOvecap();
	rx_checksavedtransformbonuses_old();
	StExt_ProcessStatsOvecap();
};
func void use_itpo_perm_stamina() 
{
	StExt_ProcessStaminaOvecap();
	use_itpo_perm_stamina_old();
	StExt_ProcessStaminaOvecap();
};
func void pc_prayidol_raiseattribute_stm() 
{
	StExt_ProcessStaminaOvecap();
	pc_prayidol_raiseattribute_stm_old();
	StExt_ProcessStaminaOvecap();
};
func void pc_prayshrine_raiseattribute_stm() 
{
	StExt_ProcessStaminaOvecap();
	pc_prayshrine_raiseattribute_stm_old();
	StExt_ProcessStaminaOvecap();
};

func void rx_innos(var int karma) 
{
	if (StExt_IgnoreHumanDamageNow) { return; };
	rx_innos_old(karma);
};

func void rx_beliar(var int karma) 
{
	if (StExt_IgnoreHumanDamageNow) { return; };
	rx_beliar_old(karma);
};
*/

func void b_logbeast(var c_npc beast) 
{
	b_logbeast_old(beast);
	if (!StExt_IsGenericPerkLearned(StExt_PerkIndex_SoulEater)) { return; };
	
    if ((beast.aivar[43] == id_gobbo_green) && gobbo_green_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Gobbo] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Gobbo], 100);
		if (gobbo_green_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Gobbo]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Gobbo] += 100;
			b_raiseattribute_bonus(hero, atr_dexterity, 1); 
		};
    }
    else if ((((beast.aivar[43] == id_scavenger) && (beast.guild != gil_meatbug)) && 
		(hlp_getinstanceid(beast) != hlp_getinstanceid(rabbit))) && (hlp_getinstanceid(beast) != hlp_getinstanceid(rabbit_02)) && scavenger_b3) 
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Scavanger] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Scavanger], 100);
		if (scavenger_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Scavanger]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Scavanger] += 100;
			b_raiseattribute(hero, atr_hitpoints_max, 3);
			npc_changeattribute(hero, atr_hitpoints, 3);
		};
    }
    else if ((beast.aivar[43] == id_wolf) && wolf_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Wolf] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Wolf], 50);
		if (wolf_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Wolf]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Wolf] += 50;
			b_raiseattribute(hero, atr_hitpoints_max, 3);
			npc_changeattribute(hero, atr_hitpoints, 3);
		};
	}
    else if ((beast.aivar[43] == id_snapper) && snapper_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Snapper] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Snapper], 50);
		if (snapper_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Snapper]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Snapper] += 50;
			b_raiseattribute_bonus(hero, atr_dexterity, 1); 
		};
    }
    else if ((beast.aivar[43] == id_shadowbeast) && shadowbeast_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Shadowbeast] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Shadowbeast], 25);
		if (shadowbeast_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Shadowbeast]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Shadowbeast] += 25;
            b_raiseprot_bonus(hero, prot_edge, 2);
		};
    }
    else if ((beast.aivar[43] == id_alligator) && alligator_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Alligator] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Alligator], 10);
		if (alligator_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Alligator]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Alligator] += 10;
            b_raiseattribute_bonus(hero, atr_dexterity, 1);
		};
    }
    else if ((beast.aivar[43] == id_blattcrawler) && blattcrawler_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Blatcrawler] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Blatcrawler], 50);
		if (blattcrawler_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Blatcrawler]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Blatcrawler] += 50;
			b_raiseattribute(hero, atr_hitpoints_max, 5);
			npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_bloodhound) && bloodhound_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Bloodhound] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Bloodhound], 10);
		if (bloodhound_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Bloodhound]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Bloodhound] += 10;
			b_raiseattribute(hero, atr_hitpoints_max, 5);
			npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_gobbo_black) && gobbo_black_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboBlack] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboBlack], 100);
		if (gobbo_black_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboBlack]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboBlack] += 100;
            b_raiseattribute_bonus(hero, atr_dexterity, 1);
		};    
	}
    else if ((beast.aivar[43] == id_icewolf) && icewolf_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceWolf] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceWolf], 25);
		if (icewolf_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceWolf]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceWolf] += 25;
			b_raiseattribute(hero, atr_hitpoints_max, 5);
			npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_keiler) && keiler_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Keiler] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Keiler], 50);
		if (keiler_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Keiler]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Keiler] += 50;
			b_raiseattribute_bonus(hero, atr_strength, 1);
		};
    }
    else if ((beast.aivar[43] == id_zombie) && zombie_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Zombie] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Zombie], 50);
		if (zombie_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Zombie]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Zombie] += 50;
            b_raiseattribute_bonus(hero, atr_mana_max, 1);
		};
    }
    else if ((beast.aivar[43] == id_orcbiter) && orcbiter_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Orcbiter] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Orcbiter], 25);
		if (orcbiter_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Orcbiter]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Orcbiter] += 25;
            rx_checkstaminabonusforhealth(1);
		};
    }
    else if ((beast.aivar[43] == id_razor) && razor_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Razor] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Razor], 25);
		if (razor_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Razor]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Razor] += 25;
            b_raiseattribute_bonus(hero, atr_dexterity, 1);
		};
    }
    else if ((beast.aivar[43] == id_ghost) && ghost_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ghost] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ghost], 10);
		if (ghost_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ghost]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ghost] += 10;
            b_raiseprot_bonus(hero, prot_magic, 1);
		};
    }
    else if ((beast.aivar[43] == id_stoneguardian) && stoneguardian_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGuardian] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGuardian], 25);
		if (stoneguardian_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGuardian]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGuardian] += 25;
			rx_checkstaminabonusforhealth(1);
		};
    }
    else if ((beast.aivar[43] == id_stonepuma) && stonepuma_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StonePuma] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StonePuma], 10);
		if (stonepuma_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StonePuma]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StonePuma] += 10;
			b_raiseattribute(hero, atr_hitpoints_max, 5);
			npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_swampdrone) && swampdrone_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampDrone] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampDrone], 25);
		if (swampdrone_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampDrone]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampDrone] += 25;
			b_raiseattribute(hero, atr_hitpoints_max, 5);
			npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_swampgolem) && swampgolem_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampGolem] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampGolem], 25);
		if (swampgolem_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampGolem]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampGolem] += 25;
			b_raiseattribute_bonus(hero, atr_strength, 1);
		};
    }
    else if ((beast.aivar[43] == id_bloodfly) && bloodfly_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_BloodFly] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_BloodFly], 100);
		if (bloodfly_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_BloodFly]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_BloodFly] += 100;
			b_raiseprot_bonus(hero, prot_point, 1);
		};
    }
    else if (((beast.aivar[43] == id_demon) || (beast.aivar[43] == id_demon_lord)) && demon_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Demon] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Demon], 25);
		if (demon_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Demon]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Demon] += 25;
            b_raiseprot_bonus(hero, prot_magic, 2);
		};
    }
    else if ((beast.aivar[43] == id_draconian) && draconian_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Draconian] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Draconian], 100);
		if (draconian_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Draconian]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Draconian] += 100;
            if (hero.hitchance[npc_talent_1h] >= hero.hitchance[npc_talent_2h]) 
			{
				b_raisefighttalent_bonus(hero, npc_talent_1h, 1);
				ai_printbonus(print_bonus1hfight);
			}
			else 
			{
				b_raisefighttalent_bonus(hero, npc_talent_2h, 1);
				ai_printbonus(print_bonus2hfight);
			};
		};
    }
    else if (((beast.aivar[43] == id_dragon_fire) || (beast.aivar[43] == id_dragon_black) || 
		(beast.aivar[43] == id_dragon_red) || (beast.aivar[43] == id_dragon_ice) || (beast.aivar[43] == id_dragon_rock) ||
		(beast.aivar[43] == id_dragon_swamp) || (beast.aivar[43] == id_dragon_undead)) && dragon_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Dragon] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Dragon], 5);
		if (dragon_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Dragon]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Dragon] += 1;
            b_raiseattribute(hero, atr_hitpoints_max, 25);
			npc_changeattribute(hero, atr_hitpoints, 25);
            b_raiseattribute_bonus(hero, atr_mana_max, 10);
		};
    }
    else if ((beast.aivar[43] == id_dragonsnapper) && dragonsnapper_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DragonSnapper] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DragonSnapper], 50);
		if (dragonsnapper_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DragonSnapper]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DragonSnapper] += 50;
			b_raiseprot_bonus(hero, prot_edge, 3);
		};
    }
    else if ((beast.aivar[43] == id_firegolem) && firegolem_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireGolem] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireGolem], 15);
		if (firegolem_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireGolem]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireGolem] += 15;
			b_raiseprot_bonus(hero, prot_fire, 3);
		};
    }
    else if ((beast.aivar[43] == id_firewaran) && firewaran_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireWaran] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireWaran], 25);
		if (firewaran_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireWaran]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_FireWaran] += 25;
			b_raiseprot_bonus(hero, prot_fire, 2);
		};
    }
    else if ((beast.aivar[43] == id_giant_bug) && giant_bug_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantBug] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantBug], 100);
		if (giant_bug_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantBug]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantBug] += 100;
			b_raiseattribute(hero, atr_hitpoints_max, 3);
			npc_changeattribute(hero, atr_hitpoints, 3);
		};
    }
    else if ((beast.aivar[43] == id_gobbo_mage) && gobbo_shaman_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboMage] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboMage], 5);
		if (gobbo_shaman_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboMage]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GobboMage] += 10;
			b_raiseattribute_bonus(hero, atr_mana_max, 1);
		};
    }
    else if ((beast.aivar[43] == id_harpy) && harpie_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Harpy] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Harpy], 25);
		if (harpie_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Harpy]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Harpy] += 25;
            b_raiseattribute_bonus(hero, atr_dexterity, 1);
		};
    }
    else if ((beast.aivar[43] == id_icegolem) && icegolem_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceGolem] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceGolem], 25);
		if (icegolem_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceGolem]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_IceGolem] += 25;
            b_raiseattribute_bonus(hero, atr_mana_max, 1);
		};
    }
    else if ((beast.aivar[43] == id_lurker) && lurker_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Lurker] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Lurker], 50);
		if (lurker_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Lurker]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Lurker] += 50;
            b_raiseattribute(hero, atr_hitpoints_max, 5);
            npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_minecrawler) && minecrawler_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawler] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawler], 100);
		if (minecrawler_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawler]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawler] += 100;
			b_raiseprot_bonus(hero, prot_point, 1);
		};
    }
    else if ((beast.aivar[43] == id_spider) && spider_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Spider] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Spider], 25);
		if (spider_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Spider]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Spider] += 25;
			b_raiseprot_bonus(hero, prot_point, 1);
		};
    }
    else if ((beast.aivar[43] == id_minecrawlerwarrior) && minecrawlerwarrior_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawlerWarrior] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawlerWarrior], 25);
		if (minecrawlerwarrior_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawlerWarrior]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_MineCrawlerWarrior] += 25;
			b_raiseprot_bonus(hero, prot_point, 1);
		};
    }
    else if ((beast.aivar[43] == id_orebug) && orebug_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OreBug] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OreBug], 50);
		if (orebug_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OreBug]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OreBug] += 50;
			b_raiseprot_bonus(hero, prot_edge, 1);
		};
    }
    else if ((beast.aivar[43] == id_molerat) && molerat_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Molerat] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Molerat], 50);
		if (molerat_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Molerat]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Molerat] += 50;
			b_raiseattribute(hero, atr_hitpoints_max, 3);
            npc_changeattribute(hero, atr_hitpoints, 3);
		};
    }
    else if ((beast.aivar[43] == id_skeleton_mage) && skeleton_mage_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonMage] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonMage], 25);
		if (skeleton_mage_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonMage]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonMage] += 25;
			b_raiseattribute_bonus(hero, atr_mana_max, 1);
		};
    }
    else if ((beast.aivar[43] == id_stonegolem) && stonegolem_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGolem] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGolem], 25);
		if (stonegolem_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGolem]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_StoneGolem] += 25;
            b_raiseprot_bonus(hero, prot_blunt, 2);
		};
    }
    else if (((beast.aivar[43] == id_swampshark) || (beast.aivar[43] == id_desertshark)) && swampshark_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampShark] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampShark], 25);
		if (swampshark_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampShark]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampShark] += 25;
            b_raiseattribute(hero, atr_hitpoints_max, 5);
            npc_changeattribute(hero, atr_hitpoints, 5);
		};
    }
    else if ((beast.aivar[43] == id_troll) && troll_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Troll] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Troll], 25);
		if (troll_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Troll]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Troll] += 25;
            rx_checkstaminabonusforhealth(1);
		};
    }
    else if ((beast.aivar[43] == id_ogre) && ogre_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ogre] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ogre], 25);
		if (ogre_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ogre]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Ogre] += 25;
            rx_checkstaminabonusforhealth(1);
		};
    }
    else if (((beast.aivar[43] == id_troll_black) || (beast.aivar[43] == id_troll_black_cave) || (beast.aivar[43] == id_troll_black_ice)) && troll_black_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_TrollBlack] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_TrollBlack], 15);
		if (troll_black_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_TrollBlack]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_TrollBlack] += 15;
            rx_checkstaminabonusforhealth(1);
		};
    }
    else if ((beast.aivar[43] == id_warg) && warg_b3)
	{	
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Warg] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Warg], 50);
		if (warg_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Warg]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Warg] += 50;
			b_raiseattribute(hero, atr_hitpoints_max, 5);
            npc_changeattribute(hero, atr_hitpoints, 5);
		};		
    }
    else if ((beast.aivar[43] == id_skeleton) && skeleton_b3)
	{
        if (((((((!rx_isnpc(beast, xardas_skeleton_servant_01)) && (!rx_isnpc(beast, xardas_skeleton_servant_02))) && (!rx_isnpc(beast, xardas_skeleton_guard_01))) && (!rx_isnpc(beast, xardas_skeleton_guard_02))) && (!rx_isnpc(beast, xardas_skeleton_guard_03))) && (!rx_isnpc(beast, xardas_skeleton_guard_04))) && (!rx_isnpc(beast, xardas_skeleton_guard_05))) 
		{
            StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Skeleton] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Skeleton], 100);
			if (skeleton_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Skeleton]) 
			{
				StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Skeleton] += 100;
				if (hero.hitchance[npc_talent_1h] >= hero.hitchance[npc_talent_2h])
				{
					b_raisefighttalent_bonus(hero, npc_talent_1h, 1);
					ai_printbonus(print_bonus1hfight);
				}
				else 
				{
					b_raisefighttalent_bonus(hero, npc_talent_2h, 1);
					ai_printbonus(print_bonus2hfight);
				};
			};	
        };
    }
    else if ((beast.aivar[43] == id_orcwarrior) && orcwarrior_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcWarrior] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcWarrior], 100);
		if (orcwarrior_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcWarrior]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcWarrior] += 100;
			if (hero.hitchance[npc_talent_1h] >= hero.hitchance[npc_talent_2h])
			{
				b_raisefighttalent_bonus(hero, npc_talent_1h, 1);
				ai_printbonus(print_bonus1hfight);
			}
			else 
			{
				b_raisefighttalent_bonus(hero, npc_talent_2h, 1);
				ai_printbonus(print_bonus2hfight);
			};
		};
    }
    else if ((beast.aivar[43] == id_skeleton_lord) && skeleton_lord_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonLord] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonLord], 50);
		if (skeleton_lord_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonLord]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonLord] += 50;
			if (hero.hitchance[npc_talent_1h] >= hero.hitchance[npc_talent_2h])
			{
				b_raisefighttalent_bonus(hero, npc_talent_1h, 1);
				ai_printbonus(print_bonus1hfight);
			}
			else 
			{
				b_raisefighttalent_bonus(hero, npc_talent_2h, 1);
				ai_printbonus(print_bonus2hfight);
			};
		};
    }
    else if ((beast.aivar[43] == id_skeleton_priest) && skeleton_priest_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonPriest] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonPriest], 25);
		if (skeleton_priest_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonPriest]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SkeletonPriest] += 25;
			b_raiseprot_bonus(hero, prot_magic, 1);
		};
    }
    else if ((beast.aivar[43] == id_darkguard) && darkguard_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DarkGuard] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DarkGuard], 25);
		if (darkguard_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DarkGuard]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_DarkGuard] += 25;
			b_raiseprot_bonus(hero, prot_magic, 1);
		};
    }
    else if ((beast.aivar[43] == id_waran) && waran_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Waran] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Waran], 50);
		if (waran_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Waran]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Waran] += 50;
			b_raiseattribute_bonus(hero, atr_dexterity, 1);
		};
    }
    else if ((beast.aivar[43] == id_orcelite) && orcelite_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcElite] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcElite], 50);
		if (orcelite_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcElite]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcElite] += 50;
			if (hero.hitchance[npc_talent_1h] >= hero.hitchance[npc_talent_2h])
			{
				b_raisefighttalent_bonus(hero, npc_talent_1h, 1);
				ai_printbonus(print_bonus1hfight);
			}
			else 
			{
				b_raisefighttalent_bonus(hero, npc_talent_2h, 1);
				ai_printbonus(print_bonus2hfight);
			};
		};
    }
    else if ((beast.aivar[43] == id_orcshaman) && orcshaman_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcShaman] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcShaman], 50);
		if (orcshaman_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcShaman]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_OrcShaman] += 50;
            b_raiseattribute_bonus(hero, atr_mana_max, 1);
		};
    }
    else if (((beast.aivar[43] == id_undeadorcwarrior) || (beast.aivar[43] == id_undeadorcshaman)) && undeadorcwarrior_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_UndeadOrc] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_UndeadOrc], 25);
		if (undeadorcwarrior_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_UndeadOrc]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_UndeadOrc] += 25;
            b_raiseattribute_bonus(hero, atr_mana_max, 1);
		};
    }
    else if ((beast.aivar[43] == id_swamprat) && swamprat_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampRat] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampRat], 25);
		if (swamprat_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampRat]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SwampRat] += 25;
            b_raiseattribute(hero, atr_hitpoints_max, 3);
            npc_changeattribute(hero, atr_hitpoints, 3);
		};
    }
    else if ((beast.aivar[43] == id_scavenger_demon) && scavenger_demon_b3) 
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_ScavangerDemon] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_ScavangerDemon], 50);
		if (scavenger_demon_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_ScavangerDemon]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_ScavangerDemon] += 50;
            b_raiseattribute(hero, atr_hitpoints_max, 3);
            npc_changeattribute(hero, atr_hitpoints, 3);
		};
    }
    else if ((beast.aivar[43] == id_giant_rat) && desertrat_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantRat] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantRat], 100);
		if (desertrat_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantRat]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_GiantRat] += 100;
            b_raiseattribute(hero, atr_hitpoints_max, 3);
            npc_changeattribute(hero, atr_hitpoints, 3);
		};
    }
    else if ((beast.aivar[43] == id_sandgolem) && sandgolem_b3)
	{
		StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SandGolem] = StExt_ValidateValueMin(StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SandGolem], 5);
		if (sandgolem_b1 >= StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SandGolem]) 
		{
			StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_SandGolem] += 3;
			b_raiseattribute_bonus(hero, atr_dexterity, 1);
		};
    };
};

func void StExt_CheckScrollmakingDialog()
{
	if(npc_hasitems(hero, itmi_feder) > 0)
	{
		StExt_DisplayScrollmakingMenu = true;
		ai_processinfos(hero);    
	}
	else
	{
		b_say(hero, hero, StExt_ImpossibleForMe);
		ai_print(StExt_Str_NeedFeather);
	};    
};
func void makescrolls_s1() 
{ 
	var c_npc her;
    her = hlp_getnpc(pc_hero);
    if(hlp_getinstanceid(self) == hlp_getinstanceid(her)) 
	{
		b_endproductiondialog();
		rx_callbacknpc(hero, 1, StExt_CheckScrollmakingDialog);
	};
};

/*
func void pc_makescrolls_itsc_info() 
{
	StExt_DisplayScrollmakingMenu = true;
	pc_makescrolls_itsc_info_old();
    info_clearchoices(pc_makescrolls_itsc);
	rx_callbacknpc(hero, 0.5, StExt_CheckScrollmakingDialog);
};

func void pc_makescrolls_end_info() 
{
    b_endproductiondialog();
	StExt_DisplayScrollmakingMenu = false;
};
*/

func void StExt_EquipPalArmor()
{
	if (npc_isplayer(self)) 
	{
		snd_play3d(hero, "EQUIP_ARMOR_01");
        chechweightarmor = true;
        if (hero.guild == gil_pal) 
		{
            rx_playeffect("spellFX_INCOVATION_WHITE", self);
            rx_playeffect("spellFX_Innoseye", self);
            rx_playeffect("spellFX_LIGHTSTAR_RED", self);
            rx_playeffect("FX_EarthQuake", self);
            ai_playani(hero, "T_MAGRUN_2_HEASHOOT");
            ai_wait(self, 3.0);
            npc_stopani(hero, "T_MAGRUN_2_HEASHOOT");
            snd_play("SFX_INNOSEYE");
        };
    };
};
func void equip_itar_pal_m_v2() { StExt_EquipPalArmor(); };
func void equip_itar_pal_h_v2() { StExt_EquipPalArmor(); };

func void equip_zauberstab_kdf() 
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_zauberstab_kdf_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_stab_kdf() 
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_stab_kdf_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_zauberstab_kdw()
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_zauberstab_kdw_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_stab_kdw()
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_stab_kdw_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_zauberstab_kdm() 
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_zauberstab_kdm_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_stab_kdm()
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_stab_kdm_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_zauberstab_gur() 
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_zauberstab_gur_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void equip_stab_gur()
{
	var int oldInteractive;
    if (self.id == 0) 
	{
		oldInteractive = rx_isinteractiveactive;
		rx_isinteractiveactive = true;
		equip_stab_gur_old();
		rx_isinteractiveactive = oldInteractive;
    };
};

func void rx_restorehealthinsleep(var int hours) 
{
	rx_restorehealthinsleep_old(hours);
	if (rx_heroismage()) { rx_restoremanapercent(hours * 5); };
};

func void rx_heroprocs(var c_npc atk, var c_npc target) 
{
	var int isSpiderWebActive;
	if ((!heroisdead || !herotrans || !StExt_HeroIsTransformed() || npc_isplayer(target)) && hlp_isvalidnpc(atk))
	{ 
		isSpiderWebActive = (rx_getnpcvar(atk, aivrx_special_attack) == 31);
		if (isSpiderWebActive) { additionalacceleration = StExt_PcCurrentAcceleration; };
	};
	rx_heroprocs_old(atk, target);
};

// Stamina tweaks

func void rx_checkstaminabonusforhealth(var int staminabonus) 
{
    var string concattext;
	var int delta;
	
	delta = (atr_stamina_max + staminabonus) - 100;
	StExt_UpdateUncaperStat(StExt_UncaperStatIndex_StamMax);	
	if ((atr_stamina_max >= 100) || (delta > 0))
	{		
		StExt_PlayerStat_OnApply(StExt_PcStats_Index_St, staminabonus, StExt_PcStat_Source_Perm);
		atr_stamina = atr_stamina + (staminabonus * 10);
		
		rx_staminateach += staminabonus;
        npc_settalentskill(hero, npc_talent_stamina, atr_stamina_max);
        concattext = concatstrings(print_learnstamina_max, inttostring(staminabonus * 10));
        concattext = concatstrings(concattext, StExt_Str_ExtraStaminaBonus_Toatal);
        concattext = concatstrings(concattext, inttostring(atr_stamina_max * 10));
        concattext = concatstrings(concattext, ")");
        ai_printbonus(concattext);		
		return;
	};
	rx_checkstaminabonusforhealth_old(staminabonus);
};

func void use_itpo_perm_stamina() 
{
    if (self.id == 0) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		rx_checkstaminabonusforhealth(1);
		snd_play("LevelUP");
		rx_used_poperm_stamina += 1;
    };
};

func void pc_prayidol_raiseattribute_stm() 
{
    if (beliarpraycount >= giftofthebeliar_getrecamountkarma()) 
	{
        b_say(self, self, "$BLESSED_STAMINA");
        rx_playeffect("SPELLFX_BELIARSHRINE", hero);
        snd_play("DEM_RITUAL_02");
        beliarpraycount = beliarpraycount - giftofthebeliar_getrecamountkarma();
		rx_checkstaminabonusforhealth(5);
        atr_stamina = atr_stamina + 100; 
        maxupgodbeliar += 1;
    }
    else if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, print_notenoughkarmabeliar, 2, 1); }
    else { ai_printclr(print_notenoughkarmabeliar, 177, 58, 17); };
    info_clearchoices(pc_prayidol_raiseattribute);
};

func void pc_prayshrine_raiseattribute_stm() 
{
    if ((innospraycount - innoscrimecount) >= giftoftheinnos_getrecamountkarma()) 
	{
        b_say(self, self, "$BLESSED_STAMINA");
        rx_playeffect("spellFX_Innoseye", hero);
        innospraycount = innospraycount - giftoftheinnos_getrecamountkarma();
        rx_checkstaminabonusforhealth(5);
        atr_stamina = atr_stamina + 100;
        rx_godpricegoteffect = true;
        maxupgodinnos += 1;
    }
    else if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, print_notenoughkarmainnos, 2, 1); }
    else { ai_printclr(print_notenoughkarmainnos, 177, 58, 17); };
    info_clearchoices(pc_prayshrine_raiseattribute);
};