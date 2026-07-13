
//===================================================================//
//			Zakon Dusz - bosses (F2 map heretic + F3 arena)			 //
//===================================================================//
// All bosses are HUMANS (dark-souls style: fallen knights, heretics,
// necromancer acolytes) - per design, no monsters.
// F2: one heretic hidden in the world (spawned at new game, portal
//     temple ruins); killing him unlocks the arena summons.
// F3: the Soul Master summons challengers from a pool of 10, one at
//     a time; every kill counts for the CURRENT chapter and drops a
//     boss soul. After 10 kills in a chapter -> chapter reward (F4).

//--------------------------------------------------------------
// *** shared helpers ***
//--------------------------------------------------------------
func void StExt_ZakonBoss_OnKill()
{
	// chapter rollover resets the per-chapter counter
	if (StExt_ZakonBoss_Chapter != kapitel)
	{
		StExt_ZakonBoss_Chapter = kapitel;
		StExt_ZakonBoss_Killed = 0;
	};
	StExt_ZakonBoss_Killed += 1;
	StExt_ZakonBoss_Active = false;
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_bosssoul, 1); };
	if (StExt_ZakonBoss_Killed >= 10) { ai_printbonus(StExt_Str_ZakonBoss_ChapterDone); }
	else
	{
		ai_printbonus(concatstrings(concatstrings(StExt_Str_ZakonBoss_Killed_Pre, inttostring(StExt_ZakonBoss_Killed)), StExt_Str_ZakonBoss_Killed_Post));
	};
};

// Shared statting: human boss scaled by chapter and player level.
func void StExt_ZakonBoss_Setup(var c_npc slf, var int tier)
{
	b_setattributestochapter(slf, kapitel);
	slf.attribute[1] = 800 + (kapitel * 700) + (hero.level * 40) + (tier * 300);
	slf.attribute[0] = slf.attribute[1];
	slf.attribute[4] = 120 + (kapitel * 40) + (tier * 20);
	slf.attribute[5] = 120 + (kapitel * 40) + (tier * 20);
	slf.level = 10 + (kapitel * 8) + tier;
	b_setfightskills(slf, StExt_ValidateValueRange(40 + (kapitel * 10) + (tier * 5), 40, 100));
};

//--------------------------------------------------------------
// *** F2: the map heretic (unlocks the arena) ***
//--------------------------------------------------------------
instance bdt_99710_ZakonHeretic(npc_default)
{
    name = StExt_Str_ZakonHeretic_Name;
    guild = gil_bdt;
    id = 99710;
    voice = 13;
    flags = 0;
    npctype = npctype_main;
    level = 20;
    b_setnpcvisual(bdt_99710_ZakonHeretic, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99710_ZakonHeretic, "Humans_Militia.mds");
    b_givenpctalents(bdt_99710_ZakonHeretic);
    fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99710_ZakonHeretic;
    aivar[6] = true; // aggressive
    StExt_ZakonBoss_Setup(bdt_99710_ZakonHeretic, 2);
};
func void rtn_bdt_99710_ZakonHeretic()
{
    ta_stand_guarding(8, 0, 23, 0, "PORTALTEMPEL");
    ta_stand_guarding(23, 0, 8, 0, "PORTALTEMPEL");
};
func void ai_ondead_bdt_99710_ZakonHeretic()
{
	StExt_ZakonHeretic_Dead = true;
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_bosssoul, 1); };
	ai_printbonus(StExt_Str_ZakonHeretic_Dead);
};

//--------------------------------------------------------------
// *** F3: arena pool (10 human challengers) ***
//--------------------------------------------------------------
instance bdt_99711_ZakonBoss1(npc_default)
{
    name = StExt_Str_ZakonBoss1_Name; guild = gil_bdt; id = 99711; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99711_ZakonBoss1, male, "Hum_Head_FighterBald", face_n_corristo, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99711_ZakonBoss1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99711_ZakonBoss1); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99711_ZakonBoss1, 1);
};
func void ai_ondead_bdt_99711_ZakonBoss1() { StExt_ZakonBoss_OnKill(); };

instance bdt_99712_ZakonBoss2(npc_default)
{
    name = StExt_Str_ZakonBoss2_Name; guild = gil_bdt; id = 99712; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99712_ZakonBoss2, male, "Hum_Head_Pony", face_n_mud, bodytex_n, itar_darkknight_03);
    mdl_applyoverlaymds(bdt_99712_ZakonBoss2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99712_ZakonBoss2); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99712_ZakonBoss2, 1);
};
func void ai_ondead_bdt_99712_ZakonBoss2() { StExt_ZakonBoss_OnKill(); };

instance bdt_99713_ZakonBoss3(npc_default)
{
    name = StExt_Str_ZakonBoss3_Name; guild = gil_bdt; id = 99713; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99713_ZakonBoss3, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_demoniac_armor);
    mdl_applyoverlaymds(bdt_99713_ZakonBoss3, "Humans_Mage.mds");
    b_givenpctalents(bdt_99713_ZakonBoss3); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99713_ZakonBoss3, 1);
};
func void ai_ondead_bdt_99713_ZakonBoss3() { StExt_ZakonBoss_OnKill(); };

instance bdt_99714_ZakonBoss4(npc_default)
{
    name = StExt_Str_ZakonBoss4_Name; guild = gil_bdt; id = 99714; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99714_ZakonBoss4, male, "Hum_Head_FatBald", face_n_mud, bodytex_n, itar_oldsteelarmor);
    mdl_applyoverlaymds(bdt_99714_ZakonBoss4, "Humans_Militia.mds");
    b_givenpctalents(bdt_99714_ZakonBoss4); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99714_ZakonBoss4, 1);
};
func void ai_ondead_bdt_99714_ZakonBoss4() { StExt_ZakonBoss_OnKill(); };

instance bdt_99715_ZakonBoss5(npc_default)
{
    name = StExt_Str_ZakonBoss5_Name; guild = gil_bdt; id = 99715; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99715_ZakonBoss5, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_assasins_01);
    mdl_applyoverlaymds(bdt_99715_ZakonBoss5, "Humans_Militia.mds");
    b_givenpctalents(bdt_99715_ZakonBoss5); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99715_ZakonBoss5, 1);
};
func void ai_ondead_bdt_99715_ZakonBoss5() { StExt_ZakonBoss_OnKill(); };

instance bdt_99716_ZakonBoss6(npc_default)
{
    name = StExt_Str_ZakonBoss6_Name; guild = gil_bdt; id = 99716; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99716_ZakonBoss6, male, "Hum_Head_Thief", face_n_mud, bodytex_n, itar_sancuary_keeper);
    mdl_applyoverlaymds(bdt_99716_ZakonBoss6, "Humans_Mage.mds");
    b_givenpctalents(bdt_99716_ZakonBoss6); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99716_ZakonBoss6, 1);
};
func void ai_ondead_bdt_99716_ZakonBoss6() { StExt_ZakonBoss_OnKill(); };

instance bdt_99717_ZakonBoss7(npc_default)
{
    name = StExt_Str_ZakonBoss7_Name; guild = gil_bdt; id = 99717; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99717_ZakonBoss7, male, "Hum_Head_FighterBald", face_n_mud, bodytex_n, itar_dht_end_6);
    mdl_applyoverlaymds(bdt_99717_ZakonBoss7, "Humans_Militia.mds");
    b_givenpctalents(bdt_99717_ZakonBoss7); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99717_ZakonBoss7, 1);
};
func void ai_ondead_bdt_99717_ZakonBoss7() { StExt_ZakonBoss_OnKill(); };

instance bdt_99718_ZakonBoss8(npc_default)
{
    name = StExt_Str_ZakonBoss8_Name; guild = gil_bdt; id = 99718; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99718_ZakonBoss8, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_orcarmor_forged);
    mdl_applyoverlaymds(bdt_99718_ZakonBoss8, "Humans_Militia.mds");
    b_givenpctalents(bdt_99718_ZakonBoss8); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99718_ZakonBoss8, 1);
};
func void ai_ondead_bdt_99718_ZakonBoss8() { StExt_ZakonBoss_OnKill(); };

instance bdt_99719_ZakonBoss9(npc_default)
{
    name = StExt_Str_ZakonBoss9_Name; guild = gil_bdt; id = 99719; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99719_ZakonBoss9, male, "Hum_Head_Pony", face_n_mud, bodytex_n, itar_darkknight_01_cursed);
    mdl_applyoverlaymds(bdt_99719_ZakonBoss9, "Humans_Militia.mds");
    b_givenpctalents(bdt_99719_ZakonBoss9); fight_tactic = fai_human_master; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99719_ZakonBoss9, 1);
};
func void ai_ondead_bdt_99719_ZakonBoss9() { StExt_ZakonBoss_OnKill(); };

instance bdt_99720_ZakonBoss10(npc_default)
{
    name = StExt_Str_ZakonBoss10_Name; guild = gil_bdt; id = 99720; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99720_ZakonBoss10, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_darkknight_03_cursed);
    mdl_applyoverlaymds(bdt_99720_ZakonBoss10, "Humans_Mage.mds");
    b_givenpctalents(bdt_99720_ZakonBoss10); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99720_ZakonBoss10, 2);
};
func void ai_ondead_bdt_99720_ZakonBoss10() { StExt_ZakonBoss_OnKill(); };

//--------------------------------------------------------------
// *** Summon dialog at the Soul Master ***
//--------------------------------------------------------------
func void StExt_ZakonBoss_SummonNext()
{
	var int pick;

	if (StExt_ZakonBoss_Chapter != kapitel)
	{
		StExt_ZakonBoss_Chapter = kapitel;
		StExt_ZakonBoss_Killed = 0;
	};
	if (StExt_ZakonBoss_Killed >= 10)
	{
		ai_printbonus(StExt_Str_ZakonBoss_ChapterDone);
		return;
	};
	if (StExt_ZakonBoss_Active)
	{
		ai_printred(StExt_Str_ZakonBoss_StillAlive);
		return;
	};

	StExt_ZakonBoss_Active = true;
	pick = hlp_random(10);
	rx_saveparservars();
	if (pick == 0) { wld_insertnpc(bdt_99711_ZakonBoss1, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 1) { wld_insertnpc(bdt_99712_ZakonBoss2, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 2) { wld_insertnpc(bdt_99713_ZakonBoss3, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 3) { wld_insertnpc(bdt_99714_ZakonBoss4, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 4) { wld_insertnpc(bdt_99715_ZakonBoss5, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 5) { wld_insertnpc(bdt_99716_ZakonBoss6, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 6) { wld_insertnpc(bdt_99717_ZakonBoss7, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 7) { wld_insertnpc(bdt_99718_ZakonBoss8, "NW_BIGFARM_CHAPEL_03"); }
	else if (pick == 8) { wld_insertnpc(bdt_99719_ZakonBoss9, "NW_BIGFARM_CHAPEL_03"); }
	else { wld_insertnpc(bdt_99720_ZakonBoss10, "NW_BIGFARM_CHAPEL_03"); };
	rx_restoreparservars();
	ai_printbonus(StExt_Str_ZakonBoss_Summoned);
};

instance dia_none_99702_SoulMaster_Summon(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 4;
    condition = dia_none_99702_SoulMaster_Summon_condition;
    information = dia_none_99702_SoulMaster_Summon_info;
    permanent = true;
    description = StExt_Str_ZakonBoss_SummonOffer;
};
func int dia_none_99702_SoulMaster_Summon_condition()
{
	return StExt_SoulKnight_Member && StExt_ZakonHeretic_Dead;
};
func void dia_none_99702_SoulMaster_Summon_info()
{
	StExt_ZakonBoss_SummonNext();
	ai_stopprocessinfos(self);
};

// Hint dialog: where to find the heretic (before he is dead).
instance dia_none_99702_SoulMaster_Hint(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 5;
    condition = dia_none_99702_SoulMaster_Hint_condition;
    information = dia_none_99702_SoulMaster_Hint_info;
    permanent = true;
    description = StExt_Str_ZakonHeretic_HintOffer;
};
func int dia_none_99702_SoulMaster_Hint_condition()
{
	return StExt_SoulKnight_Member && !StExt_ZakonHeretic_Dead;
};
func void dia_none_99702_SoulMaster_Hint_info()
{
	ai_printbonus(StExt_Str_ZakonHeretic_Hint);
	ai_stopprocessinfos(self);
};
