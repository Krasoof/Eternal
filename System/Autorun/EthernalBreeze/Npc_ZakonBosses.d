
//===================================================================//
//	Zakon Dusz - bosses (F2 hunt-per-chapter + F3 arena + F4 reward) //
//===================================================================//
// All bosses are HUMANS (dark-souls style: fallen knights, heretics,
// executioners) - per design, no monsters.
// F2: ONE hunted target per chapter, spawned ON DEMAND via the Soul
//     Master's hunt dialog (works on old saves - no init-once spawn).
//     Killing the current chapter's target unlocks the arena.
// F3: the Soul Master summons 10 CONCRETE challengers in FIXED order,
//     one at a time, escalating tiers; every kill drops a boss soul.
// F4: after the hunt + 10/10 arena kills -> chapter armor reward.

//--------------------------------------------------------------
// *** shared helpers ***
//--------------------------------------------------------------
// Migration: old saves flagged the chapter-1 heretic via a bool.
func void StExt_ZakonHunt_Migrate()
{
	if (StExt_ZakonHeretic_Dead) && (StExt_ZakonHunt_Done < 1) { StExt_ZakonHunt_Done = 1; };
};

func int StExt_ZakonHunt_CurChapter()
{
	if (kapitel > 5) { return 5; };
	if (kapitel < 1) { return 1; };
	return kapitel;
};

// Guaranteed boss loot: gold + one ENCHANTED item (weapon/jewelry/armor)
// scaled by hero level, chapter and boss tier. Tier 4 drops jewelry extra.
func void StExt_ZakonBoss_GiveLoot(var int tier)
{
	var int power;
	var int roll;
	var int itemType;
	var int itmId;
	var int wsub;

	if (!hlp_isvalidnpc(self)) { return; };
	// item power ~ hero level (so drops match you, not level-430 nonsense).
	power = (hero.level * 7) + (kapitel * 40) + (tier * 80);
	createinvitems(self, itmi_gold, 800 + hlp_random(400) + (kapitel * 300) + (tier * 250));

	roll = hlp_random(6);
	if (roll <= 1)
	{
		// Melee, but NEVER a basic club/stick/mace - only swords & axes, so a
		// boss always drops a proper weapon (random stats are still fine).
		wsub = hlp_random(5);
		if (wsub == 0)      { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H"); }
		else if (wsub == 1) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe2H"); }
		else if (wsub == 2) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"); }
		else if (wsub == 3) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe1H"); }
		else                { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_DexSword"); };
	}
	else if (roll == 2) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_RangeWeapon"); }
	else if (roll == 3) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_MagicWeapon"); }
	else if (roll == 4) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Jewelry"); }
	else { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_AnyChestArmor"); };
	itmId = StExt_GenerateRandomItem(itemType, power);
	StExt_CreateRandomItem(self, itmId, 1, false);
	// (guaranteed second legendary-jewelry drop REMOVED - legendaries now
	// come from the global 5% boss roll in zs_dead, weapons/jewelry only)
};

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
	StExt_ZakonBoss_ActiveSlot = 0;
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_bosssoul, 1); };	// (zwoj teleportu do Mistrza WYCIETY z dropow - definicja itemu zostaje dla starych sejwow)
	if (StExt_ZakonBoss_Killed >= 10) { ai_printbonus(StExt_Str_ZakonBoss_ChapterDone); }
	else
	{
		ai_printbonus(concatstrings(concatstrings(StExt_Str_ZakonBoss_Killed_Pre, inttostring(StExt_ZakonBoss_Killed)), StExt_Str_ZakonBoss_Killed_Post));
	};
};

// Hunted target killed: unlock the arena for its chapter.
func void StExt_ZakonHunt_OnKill(var int chapter)
{
	if (StExt_ZakonHunt_Done < chapter) { StExt_ZakonHunt_Done = chapter; };
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_bosssoul, 1); };	// (zwoj teleportu do Mistrza WYCIETY z dropow - definicja itemu zostaje dla starych sejwow)
	StExt_ZakonBoss_GiveLoot(3);
	ai_printbonus(StExt_Str_ZakonHunt_Dead);
};

// Shared statting: human boss scaled by chapter and player level.
// FIRST PASS balance - tune multipliers after in-game testing.
func void StExt_ZakonBoss_Setup(var c_npc slf, var int tier)
{
	b_setattributestochapter(slf, kapitel);
	// HP: 2.5x post-infusion-removal bump, then another +40% per feedback
	// ("dorzuc jeszcze 25-50%"): ~230k midgame, ~455k late.
	slf.attribute[1] = 35000 + (kapitel * 28000) + (hero.level * 2800) + (tier * 14000);
	slf.attribute[0] = slf.attribute[1];
	// str/dex now also scale with hero level (evened out) so the boss is a real
	// threat, not just an HP sponge. Kept gentler than HP to avoid one-shots.
	slf.attribute[4] = 120 + (kapitel * 40) + (tier * 30) + (hero.level * 2);
	slf.attribute[5] = 120 + (kapitel * 40) + (tier * 30) + (hero.level * 2);
	slf.level = 10 + (kapitel * 8) + tier + (hero.level / 2);
	b_setfightskills(slf, StExt_ValidateValueRange(60 + (kapitel * 8) + (tier * 5), 60, 100));

	// Passive "infusions" (no spells, no on-death): additional damage-type
	// resistances, evened across types and scaled by chapter/tier/level.
	slf.protection[1] = 100 + (kapitel * 40) + (tier * 40) + (hero.level / 3);	// blunt
	slf.protection[2] = 100 + (kapitel * 40) + (tier * 40) + (hero.level / 3);	// edge
	slf.protection[6] = 100 + (kapitel * 40) + (tier * 40) + (hero.level / 3);	// point
	slf.protection[3] = 80 + (kapitel * 30) + (tier * 30) + (hero.level / 4);	// fire
	slf.protection[4] = 80 + (kapitel * 30) + (tier * 30) + (hero.level / 4);	// fly
	slf.protection[5] = 80 + (kapitel * 30) + (tier * 30) + (hero.level / 4);	// magic

	// Chapter 1: bosses stay HUMAN brutes exactly as-is (user call).
	// Chapter 2+: the Zakon sends UNDEAD champions - skeleton rig + monster
	// guild + monster scheduler. Monsters natively run zs_mm_attack_loop, so
	// the NpcAbility kit (waves/blinks/self-buff) finally fires FOR REAL -
	// no synthetic shockwave needed. Passive id-hooks (lifesteal/chip/tempo/
	// ciernie) key off ids so they keep working regardless of guild.
	if (kapitel >= 2)
	{
		slf.guild = gil_skeleton;
		mdl_setvisual(slf, "HumanS.mds");
		mdl_setvisualbody(slf, "Ske_Body", default, default, "", default, default, -1);
		slf.start_aistate = zs_mm_allscheduler;

		var int elem; elem = slf.id % 5;
		if (elem == 0)      { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Firewave);    StExt_Npc_AddAbility(slf, StExt_Npc_Ability_FireBlink); }
		else if (elem == 1) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Icewave);     StExt_Npc_AddAbility(slf, StExt_Npc_Ability_IceBlink); }
		else if (elem == 2) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Electrowave); StExt_Npc_AddAbility(slf, StExt_Npc_Ability_ElectroBlink); }
		else if (elem == 3) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Darkwave);    StExt_Npc_AddAbility(slf, StExt_Npc_Ability_DarkBlink); }
		else                { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Quake);       StExt_Npc_AddAbility(slf, StExt_Npc_Ability_QuakeBlink); };
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_BuffSelfExtraSpeed);
		if (tier >= 3) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Whirlwind); };
		if (tier >= 4) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Berzerk); };
	};
};

//--------------------------------------------------------------
// *** F2: hunted targets - one per chapter, tracked in the wild ***
//--------------------------------------------------------------
// Chapter 1: the Heretic - portal temple ruins.
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
    StExt_ZakonBoss_Setup(bdt_99710_ZakonHeretic, 3);
};
func void rtn_bdt_99710_ZakonHeretic()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
};
func void ai_ondead_bdt_99710_ZakonHeretic()
{
	StExt_ZakonHeretic_Dead = true;
	StExt_ZakonHunt_OnKill(1);
};

// Chapter 2: the Hangman - lurking by Orlan's tavern.
instance bdt_99721_ZakonHunt2(npc_default)
{
    name = StExt_Str_ZakonHunt2_Name; guild = gil_bdt; id = 99721; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99721_ZakonHunt2, male, "Hum_Head_FatBald", face_n_mud, bodytex_n, itar_dht_end_6);
    mdl_applyoverlaymds(bdt_99721_ZakonHunt2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99721_ZakonHunt2); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99721_ZakonHunt2; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99721_ZakonHunt2, 3);
};
func void rtn_bdt_99721_ZakonHunt2()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TAVERNE");
    ta_stand_guarding(23, 0, 8, 0, "NW_TAVERNE");
};
func void ai_ondead_bdt_99721_ZakonHunt2() { StExt_ZakonHunt_OnKill(2); };

// Chapter 3: the Gravedigger - troll land paths.
instance bdt_99722_ZakonHunt3(npc_default)
{
    name = StExt_Str_ZakonHunt3_Name; guild = gil_bdt; id = 99722; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99722_ZakonHunt3, male, "Hum_Head_Bald", face_n_mud, bodytex_n, itar_oldsteelarmor);
    mdl_applyoverlaymds(bdt_99722_ZakonHunt3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99722_ZakonHunt3); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99722_ZakonHunt3; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99722_ZakonHunt3, 3);
};
func void rtn_bdt_99722_ZakonHunt3()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PATH_80");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PATH_80");
};
func void ai_ondead_bdt_99722_ZakonHunt3() { StExt_ZakonHunt_OnKill(3); };

// Chapter 4: the Blood Penitent - ritual forest.
instance bdt_99723_ZakonHunt4(npc_default)
{
    name = StExt_Str_ZakonHunt4_Name; guild = gil_bdt; id = 99723; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99723_ZakonHunt4, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_demoniac_armor);
    mdl_applyoverlaymds(bdt_99723_ZakonHunt4, "Humans_Mage.mds");
    b_givenpctalents(bdt_99723_ZakonHunt4); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99723_ZakonHunt4; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99723_ZakonHunt4, 3);
};
func void rtn_bdt_99723_ZakonHunt4()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_RITUALFOREST_11");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_RITUALFOREST_11");
};
func void ai_ondead_bdt_99723_ZakonHunt4() { StExt_ZakonHunt_OnKill(4); };

// Chapter 5 (finale): the Fallen Master - depths of the portal temple.
instance bdt_99724_ZakonHunt5(npc_default)
{
    name = StExt_Str_ZakonHunt5_Name; guild = gil_bdt; id = 99724; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99724_ZakonHunt5, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_darkknight_03_cursed);
    mdl_applyoverlaymds(bdt_99724_ZakonHunt5, "Humans_Mage.mds");
    b_givenpctalents(bdt_99724_ZakonHunt5); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99724_ZakonHunt5; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99724_ZakonHunt5, 4);
};
func void rtn_bdt_99724_ZakonHunt5()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
};
func void ai_ondead_bdt_99724_ZakonHunt5() { StExt_ZakonHunt_OnKill(5); };

// Spawns the CURRENT chapter's hunted target (once per chapter).
func void StExt_ZakonHunt_SpawnCurrent()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	if (StExt_ZakonHunt_SpawnedCh >= ch) { return; };
	StExt_ZakonHunt_SpawnedCh = ch;
	rx_saveparservars();
	if (ch <= 1) { wld_insertnpc(bdt_99710_ZakonHeretic, "NW_TROLLAREA_PORTALTEMPEL_40"); }
	else if (ch == 2) { wld_insertnpc(bdt_99721_ZakonHunt2, "NW_TAVERNE"); }
	else if (ch == 3) { wld_insertnpc(bdt_99722_ZakonHunt3, "NW_TROLLAREA_PATH_80"); }
	else if (ch == 4) { wld_insertnpc(bdt_99723_ZakonHunt4, "NW_TROLLAREA_RITUALFOREST_11"); }
	else { wld_insertnpc(bdt_99724_ZakonHunt5, "NW_TROLLAREA_PORTALTEMPEL_40"); };
	rx_restoreparservars();
};

// Chapter-specific hint text.
func void StExt_ZakonHunt_PrintHint()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	if (ch <= 1) { ai_printbonus(StExt_Str_ZakonHunt1_Hint); }
	else if (ch == 2) { ai_printbonus(StExt_Str_ZakonHunt2_Hint); }
	else if (ch == 3) { ai_printbonus(StExt_Str_ZakonHunt3_Hint); }
	else if (ch == 4) { ai_printbonus(StExt_Str_ZakonHunt4_Hint); }
	else { ai_printbonus(StExt_Str_ZakonHunt5_Hint); };
};

//--------------------------------------------------------------
// *** F3: arena - 10 concrete challengers, fixed order ***
//--------------------------------------------------------------
instance bdt_99711_ZakonBoss1(npc_default)
{
    name = StExt_Str_ZakonBoss1_Name; guild = gil_bdt; id = 99711; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99711_ZakonBoss1, male, "Hum_Head_Fighter", face_n_corristo, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99711_ZakonBoss1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99711_ZakonBoss1); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99711_ZakonBoss1, 1);
};
func void ai_ondead_bdt_99711_ZakonBoss1() { StExt_ZakonBoss_GiveLoot(1); StExt_ZakonBoss_OnKill(); };

instance bdt_99712_ZakonBoss2(npc_default)
{
    name = StExt_Str_ZakonBoss2_Name; guild = gil_bdt; id = 99712; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99712_ZakonBoss2, male, "Hum_Head_Pony", face_n_mud, bodytex_n, itar_darkknight_03);
    mdl_applyoverlaymds(bdt_99712_ZakonBoss2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99712_ZakonBoss2); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99712_ZakonBoss2, 1);
};
func void ai_ondead_bdt_99712_ZakonBoss2() { StExt_ZakonBoss_GiveLoot(1); StExt_ZakonBoss_OnKill(); };

instance bdt_99713_ZakonBoss3(npc_default)
{
    name = StExt_Str_ZakonBoss3_Name; guild = gil_bdt; id = 99713; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99713_ZakonBoss3, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_demoniac_armor);
    mdl_applyoverlaymds(bdt_99713_ZakonBoss3, "Humans_Mage.mds");
    b_givenpctalents(bdt_99713_ZakonBoss3); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99713_ZakonBoss3, 1);
};
func void ai_ondead_bdt_99713_ZakonBoss3() { StExt_ZakonBoss_GiveLoot(1); StExt_ZakonBoss_OnKill(); };

instance bdt_99714_ZakonBoss4(npc_default)
{
    name = StExt_Str_ZakonBoss4_Name; guild = gil_bdt; id = 99714; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99714_ZakonBoss4, male, "Hum_Head_FatBald", face_n_mud, bodytex_n, itar_oldsteelarmor);
    mdl_applyoverlaymds(bdt_99714_ZakonBoss4, "Humans_Militia.mds");
    b_givenpctalents(bdt_99714_ZakonBoss4); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99714_ZakonBoss4, 2);
};
func void ai_ondead_bdt_99714_ZakonBoss4() { StExt_ZakonBoss_GiveLoot(2); StExt_ZakonBoss_OnKill(); };

instance bdt_99715_ZakonBoss5(npc_default)
{
    name = StExt_Str_ZakonBoss5_Name; guild = gil_bdt; id = 99715; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99715_ZakonBoss5, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_assasins_01);
    mdl_applyoverlaymds(bdt_99715_ZakonBoss5, "Humans_Militia.mds");
    b_givenpctalents(bdt_99715_ZakonBoss5); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99715_ZakonBoss5, 2);
};
func void ai_ondead_bdt_99715_ZakonBoss5() { StExt_ZakonBoss_GiveLoot(2); StExt_ZakonBoss_OnKill(); };

instance bdt_99716_ZakonBoss6(npc_default)
{
    name = StExt_Str_ZakonBoss6_Name; guild = gil_bdt; id = 99716; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99716_ZakonBoss6, male, "Hum_Head_Thief", face_n_mud, bodytex_n, itar_sancuary_keeper);
    mdl_applyoverlaymds(bdt_99716_ZakonBoss6, "Humans_Mage.mds");
    b_givenpctalents(bdt_99716_ZakonBoss6); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99716_ZakonBoss6, 2);
};
func void ai_ondead_bdt_99716_ZakonBoss6() { StExt_ZakonBoss_GiveLoot(2); StExt_ZakonBoss_OnKill(); };

instance bdt_99717_ZakonBoss7(npc_default)
{
    name = StExt_Str_ZakonBoss7_Name; guild = gil_bdt; id = 99717; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99717_ZakonBoss7, male, "Hum_Head_Fighter", face_n_mud, bodytex_n, itar_dht_end_6);
    mdl_applyoverlaymds(bdt_99717_ZakonBoss7, "Humans_Militia.mds");
    b_givenpctalents(bdt_99717_ZakonBoss7); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99717_ZakonBoss7, 3);
};
func void ai_ondead_bdt_99717_ZakonBoss7() { StExt_ZakonBoss_GiveLoot(3); StExt_ZakonBoss_OnKill(); };

instance bdt_99718_ZakonBoss8(npc_default)
{
    name = StExt_Str_ZakonBoss8_Name; guild = gil_bdt; id = 99718; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99718_ZakonBoss8, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_orcarmor_forged);
    mdl_applyoverlaymds(bdt_99718_ZakonBoss8, "Humans_Militia.mds");
    b_givenpctalents(bdt_99718_ZakonBoss8); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99718_ZakonBoss8, 3);
};
func void ai_ondead_bdt_99718_ZakonBoss8() { StExt_ZakonBoss_GiveLoot(3); StExt_ZakonBoss_OnKill(); };

instance bdt_99719_ZakonBoss9(npc_default)
{
    name = StExt_Str_ZakonBoss9_Name; guild = gil_bdt; id = 99719; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99719_ZakonBoss9, male, "Hum_Head_Pony", face_n_mud, bodytex_n, itar_darkknight_01_cursed);
    mdl_applyoverlaymds(bdt_99719_ZakonBoss9, "Humans_Militia.mds");
    b_givenpctalents(bdt_99719_ZakonBoss9); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99719_ZakonBoss9, 3);
};
func void ai_ondead_bdt_99719_ZakonBoss9() { StExt_ZakonBoss_GiveLoot(3); StExt_ZakonBoss_OnKill(); };

instance bdt_99720_ZakonBoss10(npc_default)
{
    name = StExt_Str_ZakonBoss10_Name; guild = gil_bdt; id = 99720; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99720_ZakonBoss10, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_darkknight_03_cursed);
    mdl_applyoverlaymds(bdt_99720_ZakonBoss10, "Humans_Mage.mds");
    b_givenpctalents(bdt_99720_ZakonBoss10); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99720_ZakonBoss10, 4);
};
func void ai_ondead_bdt_99720_ZakonBoss10() { StExt_ZakonBoss_GiveLoot(4); StExt_ZakonBoss_OnKill(); };

//--------------------------------------------------------------
// *** Summon: FIXED order - boss (Killed+1) of 10 ***
//--------------------------------------------------------------
// Robust re-summon guard: only blocks if the LAST summoned boss really
// exists in the world and is alive. A crashed/failed spawn used to leave
// StExt_ZakonBoss_Active = true forever, blocking every future summon;
// StExt_ZakonBoss_ActiveSlot defaults to 0, so old stuck saves self-heal.
func int StExt_ZakonBoss_AliveNow()
{
	var c_npc n;
	var int slot;
	slot = StExt_ZakonBoss_ActiveSlot;
	if (slot <= 0) { return false; };
	if (slot == 1)      { n = Hlp_GetNpc(bdt_99711_ZakonBoss1); }
	else if (slot == 2) { n = Hlp_GetNpc(bdt_99712_ZakonBoss2); }
	else if (slot == 3) { n = Hlp_GetNpc(bdt_99713_ZakonBoss3); }
	else if (slot == 4) { n = Hlp_GetNpc(bdt_99714_ZakonBoss4); }
	else if (slot == 5) { n = Hlp_GetNpc(bdt_99715_ZakonBoss5); }
	else if (slot == 6) { n = Hlp_GetNpc(bdt_99716_ZakonBoss6); }
	else if (slot == 7) { n = Hlp_GetNpc(bdt_99717_ZakonBoss7); }
	else if (slot == 8) { n = Hlp_GetNpc(bdt_99718_ZakonBoss8); }
	else if (slot == 9) { n = Hlp_GetNpc(bdt_99719_ZakonBoss9); }
	else                { n = Hlp_GetNpc(bdt_99720_ZakonBoss10); };
	if (!hlp_isvalidnpc(n)) { return false; };
	if (n.attribute[atr_hitpoints] <= 0) { return false; };
	return true;
};

// Veteran gate: killing the world's Black Troll ALSO unlocks the arena
// (chapter 1 too - good fun for a maniac). Latched so it stays unlocked.
func int StExt_ZakonBlackTroll_Dead()
{
	var c_npc bt;
	if (StExt_ZakonBlackTrollDead) { return true; };
	bt = Hlp_GetNpc(Troll_Black);
	if (hlp_isvalidnpc(bt) && (bt.attribute[atr_hitpoints] <= 0)) { StExt_ZakonBlackTrollDead = true; };
	return StExt_ZakonBlackTrollDead;
};

// Arena bosses guard the fight spot - a guarding routine gives them active
// AI + perception so they actually engage the hero (a routineless human NPC
// just idles). They spawn at this same waypoint.
func void rtn_zakon_arena_guard()
{
	ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PATH_65");
	ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PATH_65");
};

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
	if (StExt_ZakonBoss_AliveNow())
	{
		ai_printred(StExt_Str_ZakonBoss_StillAlive);
		return;
	};

	StExt_ZakonBoss_Active = true;
	pick = StExt_ZakonBoss_Killed; // sequential: next in line
	rx_saveparservars();
	// Duels spawn away from the chapel hub (Shiva/traders) so fights don't
	// interrupt NPCs in inhabited areas - isolated trollarea path instead.
	if (pick == 0) { wld_insertnpc(bdt_99711_ZakonBoss1, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 1) { wld_insertnpc(bdt_99712_ZakonBoss2, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 2) { wld_insertnpc(bdt_99713_ZakonBoss3, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 3) { wld_insertnpc(bdt_99714_ZakonBoss4, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 4) { wld_insertnpc(bdt_99715_ZakonBoss5, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 5) { wld_insertnpc(bdt_99716_ZakonBoss6, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 6) { wld_insertnpc(bdt_99717_ZakonBoss7, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 7) { wld_insertnpc(bdt_99718_ZakonBoss8, "NW_TROLLAREA_PATH_65"); }
	else if (pick == 8) { wld_insertnpc(bdt_99719_ZakonBoss9, "NW_TROLLAREA_PATH_65"); }
	else { wld_insertnpc(bdt_99720_ZakonBoss10, "NW_TROLLAREA_PATH_65"); };
	rx_restoreparservars();
	StExt_ZakonBoss_ActiveSlot = pick + 1;	// remember who is out there (for the alive-check)
	// Deferred teleport: fires ~15 frames later, AFTER the dialog has fully
	// closed - teleporting the hero DURING the dialog left it stuck open.
	StExt_InitializeCallback(hero, hero, "StExt_ZakonArenaTeleport_Callback", 15);
	ai_printbonus(StExt_Str_ZakonBoss_Summoned);
};

func void StExt_ZakonArenaTeleport_Callback()
{
	AI_Teleport(hero, "NW_TROLLAREA_PATH_65");
};

//--------------------------------------------------------------
// *** F4: chapter armor reward ***
//--------------------------------------------------------------
func void StExt_ZakonReward_Give()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	StExt_ZakonReward_Chapter = kapitel;
	if (ch <= 1) { createinvitems(hero, itar_stext_zakon_novdark, 1); }
	else if (ch == 2) { createinvitems(hero, itar_stext_zakon_royal, 1); }
	else if (ch == 3) { createinvitems(hero, itar_stext_zakon_templar, 1); }
	else if (ch == 4) { createinvitems(hero, itar_stext_zakon_guardian, 1); }
	else { createinvitems(hero, itar_stext_zakon_crusader, 1); };
	ai_printbonus(StExt_Str_ZakonReward_Given);
};

// Chapter 1 / 3 rewards are a CHOICE from a user-curated armor pool
// (UAWR/ArmorExpansion looks; assets in STEXT_Assets.vdf). Picking an
// option marks the chapter as rewarded; closing the menu does not.
func void StExt_ZakonReward_Pick(var int itm)
{
	StExt_ZakonReward_Chapter = kapitel;
	createinvitems(hero, itm, 1);
	ai_printbonus(StExt_Str_ZakonReward_Given);
	info_clearchoices(dia_none_99702_SoulMaster_Reward);
	ai_stopprocessinfos(self);
};
func void StExt_ZakonReward_Pick_C1Pir1()  { StExt_ZakonReward_Pick(itar_stext_zakon_c1_pir1); };
func void StExt_ZakonReward_Pick_C1Pir2()  { StExt_ZakonReward_Pick(itar_stext_zakon_c1_pir2); };
func void StExt_ZakonReward_Pick_C1Thief() { StExt_ZakonReward_Pick(itar_stext_zakon_c1_thief); };
func void StExt_ZakonReward_Pick_C2Off()   { StExt_ZakonReward_Pick(itar_stext_zakon_royal); };
func void StExt_ZakonReward_Pick_C4Stew()  { StExt_ZakonReward_Pick(itar_stext_zakon_c4_stewark); };
func void StExt_ZakonReward_Pick_C4Cuir()  { StExt_ZakonReward_Pick(itar_stext_zakon_c4_cuirass); };
func void StExt_ZakonReward_Pick_C4Demon() { StExt_ZakonReward_Pick(itar_stext_zakon_c4_demon); };
func void StExt_ZakonReward_Pick_C4Ore()   { StExt_ZakonReward_Pick(itar_stext_zakon_c4_ore); };
func void StExt_ZakonReward_Pick_C5Wolf()  { StExt_ZakonReward_Pick(itar_stext_zakon_c5_wolf); };
func void StExt_ZakonReward_Pick_C5Arax()  { StExt_ZakonReward_Pick(itar_stext_zakon_c5_araxos); };
func void StExt_ZakonReward_Pick_C5Arx()   { StExt_ZakonReward_Pick(itar_stext_zakon_c5_arx); };
func void StExt_ZakonReward_Pick_C5Orc()   { StExt_ZakonReward_Pick(itar_stext_zakon_c5_orc); };
func void StExt_ZakonReward_Pick_C5Elite() { StExt_ZakonReward_Pick(itar_stext_zakon_c5_elite); };
func void StExt_ZakonReward_Pick_C3TplN()  { StExt_ZakonReward_Pick(itar_stext_zakon_c3_tplnew); };
func void StExt_ZakonReward_Pick_C3TplH()  { StExt_ZakonReward_Pick(itar_stext_zakon_c3_tplh); };
func void StExt_ZakonReward_Pick_C3Ket()   { StExt_ZakonReward_Pick(itar_stext_zakon_c3_ketpal); };
func void StExt_ZakonReward_Pick_C3Angel() { StExt_ZakonReward_Pick(itar_stext_zakon_c3_angel); };
func void StExt_ZakonReward_Pick_C3Brig()  { StExt_ZakonReward_Pick(itar_stext_zakon_c3_brig); };
func void StExt_ZakonReward_Pick_Exit()    { info_clearchoices(dia_none_99702_SoulMaster_Reward); ai_stopprocessinfos(self); };

//--------------------------------------------------------------
// *** Soul Master dialogs ***
//--------------------------------------------------------------
instance dia_none_99702_SoulMaster_Reward(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 3;
    condition = dia_none_99702_SoulMaster_Reward_condition;
    information = dia_none_99702_SoulMaster_Reward_info;
    permanent = true;
    description = StExt_Str_ZakonReward_Offer;
};
func int dia_none_99702_SoulMaster_Reward_condition()
{
	StExt_ZakonHunt_Migrate();
	return StExt_SoulKnight_Member
		&& (StExt_ZakonBoss_Chapter == kapitel) && (StExt_ZakonBoss_Killed >= 10)
		&& ((StExt_ZakonHunt_Done >= StExt_ZakonHunt_CurChapter()) || StExt_ZakonBlackTroll_Dead())
		&& (StExt_ZakonReward_Chapter < kapitel);
};
func void dia_none_99702_SoulMaster_Reward_info()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	if (ch <= 1)
	{
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Kaftan Korsarza", StExt_ZakonReward_Pick_C1Pir1);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Skorznia Wilka Morskiego", StExt_ZakonReward_Pick_C1Pir2);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Skora Nocnego Lowcy", StExt_ZakonReward_Pick_C1Thief);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else if (ch == 3)
	{
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Templariusza Dusz", StExt_ZakonReward_Pick_C3TplN);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Ciezki Pancerz Templariusza", StExt_ZakonReward_Pick_C3TplH);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Zbroja Krzyzowca Dusz", StExt_ZakonReward_Pick_C3Ket);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Aniola Smierci", StExt_ZakonReward_Pick_C3Angel);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Brygantyna Zakonna", StExt_ZakonReward_Pick_C3Brig);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else if (ch == 2)
	{
		// officer stays as an option + the 5 heavy-knight looks (user call:
		// "te z 5 maja isc na drugi"); protections tuned to royal level.
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Zbroja Oficera", StExt_ZakonReward_Pick_C2Off);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz z Wilczego Legowiska", StExt_ZakonReward_Pick_C5Wolf);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Zbroja Araxos", StExt_ZakonReward_Pick_C5Arax);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Arx", StExt_ZakonReward_Pick_C5Arx);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Orkowego Pogromcy", StExt_ZakonReward_Pick_C5Orc);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Elitarnego Rycerza", StExt_ZakonReward_Pick_C5Elite);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else if (ch == 4)
	{
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Stewarka", StExt_ZakonReward_Pick_C4Stew);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Gotycki Kirys Paladynski", StExt_ZakonReward_Pick_C4Cuir);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Demonicznego Rycerza", StExt_ZakonReward_Pick_C4Demon);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz z Magicznej Rudy", StExt_ZakonReward_Pick_C4Ore);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else
	{
		// ch5 = crusader PLACEHOLDER until custom Blender models happen (user call)
		StExt_ZakonReward_Give();
		ai_stopprocessinfos(self);
	};
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
	StExt_ZakonHunt_Migrate();
	return StExt_SoulKnight_Member && ((StExt_ZakonHunt_Done >= StExt_ZakonHunt_CurChapter()) || StExt_ZakonBlackTroll_Dead());
};
func void dia_none_99702_SoulMaster_Summon_info()
{
	StExt_ZakonBoss_SummonNext();
	ai_stopprocessinfos(self);
};

// Hunt dialog: spawns the current chapter's target and points at it.
instance dia_none_99702_SoulMaster_Hint(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 5;
    condition = dia_none_99702_SoulMaster_Hint_condition;
    information = dia_none_99702_SoulMaster_Hint_info;
    permanent = true;
    description = StExt_Str_ZakonHunt_Offer;
};
func int dia_none_99702_SoulMaster_Hint_condition()
{
	StExt_ZakonHunt_Migrate();
	return StExt_SoulKnight_Member && (StExt_ZakonHunt_Done < StExt_ZakonHunt_CurChapter());
};
func void dia_none_99702_SoulMaster_Hint_info()
{
	StExt_ZakonHunt_SpawnCurrent();
	StExt_ZakonHunt_PrintHint();
	ai_stopprocessinfos(self);
};
