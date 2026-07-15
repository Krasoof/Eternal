
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
// Ritual defense, HQ relocation and the ARENA_BOSS_NECRO finale come in
// the next round (see docs/DESIGN_ZakonTowerQuest.md).
// Strings are PL literals for now - move to Localization on the dubbing pass.

const string StExt_ZakonTower_WP_Road  = "NW_FOREST_PATH_80_I_MOVEMENT8_012";
const string StExt_ZakonTower_WP_Camp  = "SHORE_MONSTER_03_01";
const string StExt_ZakonTower_WP_Deco1 = "SHORE_MONSTER_02_01";
const string StExt_ZakonTower_WP_Deco2 = "SHORE_MONSTER_04_01";
const string StExt_ZakonTower_WP_Tower = "SHORE_MONSTER_05_01";

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
// *** Act 1: road ambush (2 wraiths of the old garrison) ***
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
func void ai_ondead_bdt_99730_ZakonTowerWraith1() { StExt_ZakonTower_WaveKill(1); };

instance bdt_99731_ZakonTowerWraith2(npc_default)
{
    name = "Upior Garnizonu"; guild = gil_bdt; id = 99731; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99731_ZakonTowerWraith2, male, "Hum_Head_Bald", face_n_normal_spassvogel, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99731_ZakonTowerWraith2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99731_ZakonTowerWraith2); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99731_ZakonTowerWraith2);
};
func void ai_ondead_bdt_99731_ZakonTowerWraith2() { StExt_ZakonTower_WaveKill(1); };

//--------------------------------------------------------------
// *** Act 2: siege camp - Herold Utopionego (dark kit) + escort ***
//--------------------------------------------------------------
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
func void ai_ondead_bdt_99733_ZakonTowerHerold()
{
	StExt_ZakonTower_Stage = 3;
	StExt_ZakonTower_WaveKills = 0;
	wld_insertnpc(bdt_99736_ZakonTowerKnight1, StExt_ZakonTower_WP_Tower);
	wld_insertnpc(bdt_99737_ZakonTowerKnight2, StExt_ZakonTower_WP_Tower);
	wld_insertnpc(bdt_99738_ZakonTowerKnight3, StExt_ZakonTower_WP_Camp);
	ai_printbonus("Herold padl. Garnizon broni wiezy - wytnij ich.");
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
func void ai_ondead_bdt_99734_ZakonTowerWraith3() {  };

instance bdt_99735_ZakonTowerWraith4(npc_default)
{
    name = "Upior Garnizonu"; guild = gil_bdt; id = 99735; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99735_ZakonTowerWraith4, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99735_ZakonTowerWraith4, "Humans_Militia.mds");
    b_givenpctalents(bdt_99735_ZakonTowerWraith4); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99735_ZakonTowerWraith4);
};
func void ai_ondead_bdt_99735_ZakonTowerWraith4() {  };

//--------------------------------------------------------------
// *** Act 3: the tower floors - wraith knights of the keep ***
//--------------------------------------------------------------
instance bdt_99736_ZakonTowerKnight1(npc_default)
{
    name = "Upiorny Rycerz"; guild = gil_bdt; id = 99736; voice = 13; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99736_ZakonTowerKnight1, male, "Hum_Head_Fighter", face_n_deadpal, bodytex_n, itar_darkknight_02);
    mdl_applyoverlaymds(bdt_99736_ZakonTowerKnight1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99736_ZakonTowerKnight1); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99736_ZakonTowerKnight1);
};
func void ai_ondead_bdt_99736_ZakonTowerKnight1() { StExt_ZakonTower_WaveKill(3); };

instance bdt_99737_ZakonTowerKnight2(npc_default)
{
    name = "Upiorny Rycerz"; guild = gil_bdt; id = 99737; voice = 13; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99737_ZakonTowerKnight2, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_darkknight_02);
    mdl_applyoverlaymds(bdt_99737_ZakonTowerKnight2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99737_ZakonTowerKnight2); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99737_ZakonTowerKnight2);
};
func void ai_ondead_bdt_99737_ZakonTowerKnight2() { StExt_ZakonTower_WaveKill(3); };

instance bdt_99738_ZakonTowerKnight3(npc_default)
{
    name = "Upiorny Rycerz"; guild = gil_bdt; id = 99738; voice = 13; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99738_ZakonTowerKnight3, male, "Hum_Head_Fighter", face_n_harlok, bodytex_n, itar_darkknight_02);
    mdl_applyoverlaymds(bdt_99738_ZakonTowerKnight3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99738_ZakonTowerKnight3); fight_tactic = fai_human_master;
    aivar[6] = true;
    StExt_ZakonTower_TrashSetup(bdt_99738_ZakonTowerKnight3);
};
func void ai_ondead_bdt_99738_ZakonTowerKnight3() { StExt_ZakonTower_WaveKill(3); };

//--------------------------------------------------------------
// *** Wave progression ***
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
		ai_printbonus("Droga wolna. Pod wieza stoi oboz umarlych - prowadzi Herold Utopionego.");
	};
	// Act 3 cleared -> report to the Master
	if ((wave == 3) && (StExt_ZakonTower_Stage == 3) && (StExt_ZakonTower_WaveKills >= 3))
	{
		StExt_ZakonTower_Stage = 4;
		ai_printbonus("Wieza oczyszczona. Wroc do Mistrza Zakonu.");
	};
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
	wld_insertnpc(bdt_99730_ZakonTowerWraith1, StExt_ZakonTower_WP_Road);
	wld_insertnpc(bdt_99731_ZakonTowerWraith2, StExt_ZakonTower_WP_Road);
	ai_printbonus("Mistrz: Zar przyciagnal umarlych. Kaplica pada.");
	ai_printbonus("Mistrz: Idziemy po nowy dom - przez trupy. Stara wieza na wybrzezu.");
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
	ai_printbonus("Mistrz: Wieza pamieta swojego pana. Obudzimy go - i zabijemy.");
	ai_printbonus("(Rytual, przenosiny i Pan Wiezy - w nastepnej rundzie.)");
	ai_stopprocessinfos(self);
};
