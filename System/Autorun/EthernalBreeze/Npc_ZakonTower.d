
//===================================================================//
//		Zakon Dusz - "Wieza Umarlych" relocation quest (acts 1-3)	 //
//===================================================================//
// PotD injects the ruined shore tower into NEWWORLD at runtime; its
// waypoints (SHORE_MONSTER_*, NW_FOREST_PATH_80_I_MOVEMENT8_012) only
// resolve in a running game, never in the base waynet - that is expected,
// do not "fix" by swapping to base WPs.
// Stage flow (StExt_ZakonTower_Stage):
//   0 idle -> 1 road ambush -> 2 siege camp + Herold -> 3 tower floors
//   -> 4 cleared, report to Master -> 5 done.
// PARSE ORDER (Daedalus is single-pass): all instances first, then
// StExt_ZakonTower_WaveKill, then the ai_ondead_* funcs that CALL it,
// then dialogs. Direct calls need the callee parsed earlier; only
// value-references (daily_routine, engine-called ai_ondead names) may
// point forward.
// Strings are PL literals for now - move to Localization on the dubbing pass.

// Real journal topic - the quest lives in the game log like any NB quest.
const string StExt_Topic_ZakonTower = "Wieza Umarlych";

const string StExt_ZakonTower_WP_Road  = "NW_FOREST_PATH_80_I_MOVEMENT8_012";
const string StExt_ZakonTower_WP_Camp  = "SHORE_MONSTER_03_01";
const string StExt_ZakonTower_WP_Deco1 = "SHORE_MONSTER_02_01";
const string StExt_ZakonTower_WP_Deco2 = "SHORE_MONSTER_04_01";
const string StExt_ZakonTower_WP_Tower = "SHORE_MONSTER_05_01";

// Journal wrapper: creates the topic on first use so it works even on saves
// that started the quest before the journal existed (b_logentry to a missing
// topic is silently lost). Every log goes through here.
func void StExt_ZakonTower_Log(var string entry)
{
	if (!StExt_ZakonTower_TopicMade)
	{
		log_createtopic(StExt_Topic_ZakonTower, log_mission);
		log_settopicstatus(StExt_Topic_ZakonTower, log_running);
		StExt_ZakonTower_TopicMade = true;
	};
	b_logentry(StExt_Topic_ZakonTower, entry);
};

// Light statting for wave trash - the boss Setup would make 165k-HP mobs.
func void StExt_ZakonTower_TrashSetup(var c_npc slf)
{
	b_setattributestochapter(slf, kapitel);
	slf.attribute[1] = 5000 + (kapitel * 3000) + (hero.level * 250);
	slf.attribute[0] = slf.attribute[1];
	slf.attribute[4] = 80 + (kapitel * 25) + hero.level;
	slf.attribute[5] = slf.attribute[4];
	slf.level = 5 + (kapitel * 5) + (hero.level / 3);
	b_setfightskills(slf, StExt_ValidateValueRange(40 + (kapitel * 6), 40, 90));
};

//--------------------------------------------------------------
// *** Instances (all of them BEFORE any logic that spawns them) ***
//--------------------------------------------------------------
instance bdt_99730_ZakonTowerWraith1(npc_default)
{
    name = "Upior Garnizonu"; guild = gil_bdt; id = 99730; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99730_ZakonTowerWraith1, male, "Hum_Head_Bald", face_n_deadpal, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99730_ZakonTowerWraith1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99730_ZakonTowerWraith1); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99730_ZakonTowerWraith1);
};

instance bdt_99731_ZakonTowerWraith2(npc_default)
{
    name = "Upior Garnizonu"; guild = gil_bdt; id = 99731; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99731_ZakonTowerWraith2, male, "Hum_Head_Bald", face_n_normal_spassvogel, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99731_ZakonTowerWraith2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99731_ZakonTowerWraith2); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99731_ZakonTowerWraith2);
};

// id 99733 -> 99733 % 5 == 3 -> Darkwave/DarkBlink from the boss Setup kit.
// Deliberately OUTSIDE 99710-99725 so he does NOT get the full boss passives
// (chip/lifesteal/tempo) - he's a mini-boss, the real deal waits in the arena.
instance bdt_99733_ZakonTowerHerold(npc_default)
{
    name = "Herold Utopionego"; guild = gil_bdt; id = 99733; voice = 13; flags = 0; npctype = npctype_main; level = 30;
    b_setnpcvisual(bdt_99733_ZakonTowerHerold, male, "Hum_Head_Psionic", face_n_dementor, bodytex_n, itar_darkknight_03);
    mdl_applyoverlaymds(bdt_99733_ZakonTowerHerold, "Humans_Mage.mds");
    b_givenpctalents(bdt_99733_ZakonTowerHerold); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99733_ZakonTowerHerold, 2);
};

instance bdt_99734_ZakonTowerWraith3(npc_default)
{
    name = "Upior Garnizonu"; guild = gil_bdt; id = 99734; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99734_ZakonTowerWraith3, male, "Hum_Head_FatBald", face_n_mud, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99734_ZakonTowerWraith3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99734_ZakonTowerWraith3); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99734_ZakonTowerWraith3);
};

instance bdt_99735_ZakonTowerWraith4(npc_default)
{
    name = "Upior Garnizonu"; guild = gil_bdt; id = 99735; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99735_ZakonTowerWraith4, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99735_ZakonTowerWraith4, "Humans_Militia.mds");
    b_givenpctalents(bdt_99735_ZakonTowerWraith4); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99735_ZakonTowerWraith4);
};

instance bdt_99736_ZakonTowerKnight1(npc_default)
{
    name = "Upiorny Rycerz"; guild = gil_bdt; id = 99736; voice = 13; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99736_ZakonTowerKnight1, male, "Hum_Head_Fighter", face_n_deadpal, bodytex_n, itar_darkknight_02);
    mdl_applyoverlaymds(bdt_99736_ZakonTowerKnight1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99736_ZakonTowerKnight1); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99736_ZakonTowerKnight1);
};

instance bdt_99737_ZakonTowerKnight2(npc_default)
{
    name = "Upiorny Rycerz"; guild = gil_bdt; id = 99737; voice = 13; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99737_ZakonTowerKnight2, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_darkknight_02);
    mdl_applyoverlaymds(bdt_99737_ZakonTowerKnight2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99737_ZakonTowerKnight2); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99737_ZakonTowerKnight2);
};

instance bdt_99738_ZakonTowerKnight3(npc_default)
{
    name = "Upiorny Rycerz"; guild = gil_bdt; id = 99738; voice = 13; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99738_ZakonTowerKnight3, male, "Hum_Head_Fighter", face_n_harlok, bodytex_n, itar_darkknight_02);
    mdl_applyoverlaymds(bdt_99738_ZakonTowerKnight3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99738_ZakonTowerKnight3); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99738_ZakonTowerKnight3);
};

//--------------------------------------------------------------
// *** Wave progression (parsed AFTER instances, BEFORE ai_ondead) ***
//--------------------------------------------------------------
func void StExt_ZakonTower_WaveKill(var int wave)
{
	StExt_ZakonTower_WaveKills += 1;

	// Act 1 cleared -> spawn the siege camp (Herold + escort + zombie set dressing)
	if ((wave == 1) && (StExt_ZakonTower_Stage == 1) && (StExt_ZakonTower_WaveKills >= 2))
	{
		StExt_ZakonTower_Stage = 2;
		StExt_ZakonTower_WaveKills = 0;
		wld_insertnpc(bdt_99733_ZakonTowerHerold, StExt_ZakonTower_WP_Camp);
		wld_insertnpc(bdt_99734_ZakonTowerWraith3, StExt_ZakonTower_WP_Camp);
		wld_insertnpc(bdt_99735_ZakonTowerWraith4, StExt_ZakonTower_WP_Deco1);
		wld_insertnpc(zombie01, StExt_ZakonTower_WP_Deco1);
		wld_insertnpc(zombie01, StExt_ZakonTower_WP_Deco2);
		StExt_ZakonTower_Log("Droga wolna. Pod wieza stoi oboz umarlych - prowadzi go Herold Utopionego.");
	};
	// Act 3 cleared -> report to the Master
	if ((wave == 3) && (StExt_ZakonTower_Stage == 3) && (StExt_ZakonTower_WaveKills >= 3))
	{
		StExt_ZakonTower_Stage = 4;
		StExt_ZakonTower_Log("Wieza oczyszczona z umarlych. Mistrz Zakonu czeka na wiesci.");
	};
};

//--------------------------------------------------------------
// *** Death handlers (engine calls them BY NAME at runtime) ***
//--------------------------------------------------------------
func void ai_ondead_bdt_99730_ZakonTowerWraith1() { StExt_ZakonTower_WaveKill(1); };
func void ai_ondead_bdt_99731_ZakonTowerWraith2() { StExt_ZakonTower_WaveKill(1); };
func void ai_ondead_bdt_99734_ZakonTowerWraith3() {  };
func void ai_ondead_bdt_99735_ZakonTowerWraith4() {  };
func void ai_ondead_bdt_99736_ZakonTowerKnight1() { StExt_ZakonTower_WaveKill(3); };
func void ai_ondead_bdt_99737_ZakonTowerKnight2() { StExt_ZakonTower_WaveKill(3); };
func void ai_ondead_bdt_99738_ZakonTowerKnight3() { StExt_ZakonTower_WaveKill(3); };

func void ai_ondead_bdt_99733_ZakonTowerHerold()
{
	StExt_ZakonTower_Stage = 3;
	StExt_ZakonTower_WaveKills = 0;
	wld_insertnpc(bdt_99736_ZakonTowerKnight1, StExt_ZakonTower_WP_Tower);
	wld_insertnpc(bdt_99737_ZakonTowerKnight2, StExt_ZakonTower_WP_Tower);
	wld_insertnpc(bdt_99738_ZakonTowerKnight3, StExt_ZakonTower_WP_Camp);
	StExt_ZakonTower_Log("Herold Utopionego padl. Upiorny garnizon wciaz broni wiezy.");
};

//--------------------------------------------------------------
// *** Soul Master dialogs: start + report ***
//--------------------------------------------------------------
instance dia_none_99702_SoulMaster_Tower(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 5;
    condition = dia_none_99702_SoulMaster_Tower_condition;
    information = dia_none_99702_SoulMaster_Tower_info;
    permanent = false;
    description = "Wieza Umarlych (wyprawa Zakonu)";
};
func int dia_none_99702_SoulMaster_Tower_condition()
{
	return StExt_SoulKnight_Member && (StExt_ZakonTower_Stage == 0)
		&& ((StExt_ZakonHunt_Done >= 1) || StExt_ZakonBlackTroll_Dead());
};
func void dia_none_99702_SoulMaster_Tower_info()
{
	StExt_ZakonTower_Stage = 1;
	StExt_ZakonTower_WaveKills = 0;
	// ALL spawns AT the tower itself - the forest-road WP put mobs where the
	// player never found them; SHORE_MONSTER_* were verified in-game.
	wld_insertnpc(bdt_99730_ZakonTowerWraith1, StExt_ZakonTower_WP_Tower);
	wld_insertnpc(bdt_99731_ZakonTowerWraith2, StExt_ZakonTower_WP_Camp);
	snd_play("STEXT_VOICE_M1");	// Mistrz: "Zar przyciagnal umarlych..."
	StExt_ZakonTower_Log("Zar Dusz przyciagnal umarlych pod kaplice. Mistrz wybral nowy dom: stara wieze na wybrzezu. Upiory garnizonu czekaja W WIEZY - wytnij je.");
	ai_stopprocessinfos(self);
};

// Repeatable hint while the expedition runs (quest-UX: the player must
// always be able to re-ask WHERE to go - works on saves mid-quest too).
instance dia_none_99702_SoulMaster_TowerHint(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 7;
    condition = dia_none_99702_SoulMaster_TowerHint_condition;
    information = dia_none_99702_SoulMaster_TowerHint_info;
    permanent = true;
    description = "Gdzie mam isc? (Wieza Umarlych)";
};
func int dia_none_99702_SoulMaster_TowerHint_condition()
{
	return (StExt_ZakonTower_Stage >= 1) && (StExt_ZakonTower_Stage <= 3);
};
func void dia_none_99702_SoulMaster_TowerHint_info()
{
	snd_play("STEXT_VOICE_M3");	// sound test hook - Mistrz mruczy pod nosem
	// SELF-HEAL: asking for directions RE-SUMMONS the current wave at the
	// tower - repairs saves whose mobs got lost at the old road waypoint
	// (extra copies are harmless: ai_ondead counts kills either way).
	if (StExt_ZakonTower_Stage == 1)
	{
		wld_insertnpc(bdt_99730_ZakonTowerWraith1, StExt_ZakonTower_WP_Tower);
		wld_insertnpc(bdt_99731_ZakonTowerWraith2, StExt_ZakonTower_WP_Camp);
		StExt_ZakonTower_Log("Cel: dwa upiory garnizonu W STAREJ WIEZY na wybrzezu.");
		ai_printbonus("Upiory sa w starej wiezy na wybrzezu. Mistrz wskazal - ida tam ZNOWU.");
	}
	else if (StExt_ZakonTower_Stage == 2)
	{
		wld_insertnpc(bdt_99733_ZakonTowerHerold, StExt_ZakonTower_WP_Camp);
		StExt_ZakonTower_Log("Cel: Herold Utopionego przy wiezy - zabij go.");
		ai_printbonus("Herold Utopionego czeka przy wiezy - zabij go.");
	}
	else
	{
		wld_insertnpc(bdt_99736_ZakonTowerKnight1, StExt_ZakonTower_WP_Tower);
		wld_insertnpc(bdt_99737_ZakonTowerKnight2, StExt_ZakonTower_WP_Tower);
		wld_insertnpc(bdt_99738_ZakonTowerKnight3, StExt_ZakonTower_WP_Camp);
		StExt_ZakonTower_Log("Cel: wytnij upiorny garnizon w wiezy.");
		ai_printbonus("Upiorni rycerze bronia wiezy - wytnij ich do nogi.");
	};
	ai_stopprocessinfos(self);
};

instance dia_none_99702_SoulMaster_TowerDone(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 6;
    condition = dia_none_99702_SoulMaster_TowerDone_condition;
    information = dia_none_99702_SoulMaster_TowerDone_info;
    permanent = false;
    description = "Wieza stoi pusta.";
};
func int dia_none_99702_SoulMaster_TowerDone_condition() { return (StExt_ZakonTower_Stage == 4); };
func void dia_none_99702_SoulMaster_TowerDone_info()
{
	StExt_ZakonTower_Stage = 5;
	createinvitems(hero, itmi_stext_bosssoul, 2);
	snd_play("STEXT_VOICE_M2");	// Mistrz: "Wieza pamieta swojego pana..."
	StExt_ZakonTower_Log("Wieza nalezy do Zakonu. Mistrz mowi, ze wieza pamieta swojego pana - i ze trzeba bedzie go obudzic, by go zabic. Rytual dopiero przed nami.");
	log_settopicstatus(StExt_Topic_ZakonTower, log_success);
	ai_stopprocessinfos(self);
};
