
//===================================================================//
//		Droga Beliara - questline Mrocznych Rycerzy (GIL_DMT)		 //
//===================================================================//
// Returning ma grywalna gildie Mrocznych Rycerzy (sludzy Beliara) z mistrzem
// DMT_DARKTEACHER, ale bez wlasnych zadan - po wstapieniu jedzie trescia
// Xardasa/nekromanty. Ten plik dodaje jej samodzielny luk 5 zadan: cicha
// wojna z paladynami. Dialogi doczepiamy do BAZOWEGO npc DMT_DARKTEACHER
// (wzorzec StoryOverride.d - C_INFO na npc z bazy dziala, bo nasz Autorun
// parsuje sie PO skryptach bazy). Bramka: hero.guild == GIL_DMT.
//
// Cele to NASZE instancje (pasmo 99770-99783), guild = gil_bdt (sprawdzona
// wroga/zabijalna gildia ludzka), wizual paladyna (itar_pal_*). Dzieki temu
// FABULARNI paladyni (Hagen itd.) zostaja nietknieci - glowna fabula cala.
// Ids poza 99710-99725, wiec zero pasywek bossa i drabinki HP.
//
// PARSE ORDER (Daedalus single-pass): consts -> rutyny -> setup -> instancje
// -> progresja -> ai_ondead -> dialogi. Bezposrednie wywolania wymagaja
// callee wczesniej; tylko value-refy (daily_routine, ai_ondead nazwy) moga
// wskazywac w przod. Plik dopisany do EthernalBreeze.src PO Npc_HubSmith.d.

const string StExt_Topic_DarkKnights = "Droga Beliara";
const string StExt_Str_DarkTeacher_Name = "Mroczny Rycerz Beliara";	// token mowcy (Resolve-VoiceId matchuje "DarkTeacher")

// hero.guild grywalnego Mrocznego Rycerza w Returningu = 16 (USTALONE W GRZE
// diagnostykiem u DMT_DARKTEACHER). GIL_DMT(=11) to bazowa gildia Dementorow-NPC,
// NIE gracza. Uwaga: gdyby awans na wyzsza range (DK2/DK3) zmienil te wartosc,
// questy moglyby zniknac - wtedy odczytac nowe hero.guild i dodac.
const int StExt_DK_GuildId = 16;

// WP celow - rozrzucone po sprawdzonych punktach NEWWORLD (te same rodziny
// co quest Wiezy; zweryfikowane w waynecie runtime).
const string StExt_DK_WP_Q1 = "SHORE_MONSTER_03_01";
const string StExt_DK_WP_Q2 = "SHORE_MONSTER_02_01";
const string StExt_DK_WP_Q3 = "SHORE_MONSTER_04_01";
const string StExt_DK_WP_Q4 = "NW_FOREST_PATH_80_I_MOVEMENT8_012";
const string StExt_DK_WP_Q5 = "SHORE_MONSTER_03_01";

//--------------------------------------------------------------
// *** Rutyny (bez rutyny NPC to posag - brak percepcji) ***
//--------------------------------------------------------------
func void rtn_start_99770() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q1); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q1); };
func void rtn_start_99771() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q2); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q2); };
func void rtn_start_99772() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q2); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q2); };
func void rtn_start_99773() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q2); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q2); };
func void rtn_start_99774() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q3); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q3); };
func void rtn_start_99775() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q3); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q3); };
func void rtn_start_99776() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q4); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q4); };
func void rtn_start_99777() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q4); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q4); };
func void rtn_start_99778() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q4); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q4); };
func void rtn_start_99780() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q5); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q5); };
func void rtn_start_99781() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q5); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q5); };
func void rtn_start_99782() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q5); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q5); };
func void rtn_start_99783() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q5); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q5); };

//--------------------------------------------------------------
// *** Setup celu: staty jak boss, ALE bez konwersji na nieumarlego
//     i bez kitu zywiolow (paladyn ma byc paladynem, nie szkieletem
//     rzucajacym mrocznym ogniem). tier skaluje twardosc.
//--------------------------------------------------------------
func void StExt_DarkKnights_TargetSetup(var c_npc slf, var int tier)
{
	var int bsNb;
	var int twWeap;

	b_setattributestochapter(slf, kapitel);
	// HP: eskorta (tier 0-1) = trash, imienni (tier 2) solidni, lord (tier 4)
	// mini-boss - ponizej arenowych bossow (100k+), procenty/skalowanie nie flat.
	slf.attribute[1] = 3000 + (kapitel * 2500) + (hero.level * 250) + (tier * 6000);
	slf.attribute[0] = slf.attribute[1];
	// str/dex NIGDY ponizej bazy NB (podloga, nie nadpisanie)
	bsNb = slf.attribute[4];
	slf.attribute[4] = 100 + (kapitel * 30) + (tier * 20) + (hero.level * 2);
	if (slf.attribute[4] < bsNb) { slf.attribute[4] = bsNb; };
	bsNb = slf.attribute[5];
	slf.attribute[5] = 100 + (kapitel * 30) + (tier * 20) + (hero.level * 2);
	if (slf.attribute[5] < bsNb) { slf.attribute[5] = bsNb; };
	slf.level = 10 + (kapitel * 6) + tier + (hero.level / 2);
	b_setfightskills(slf, StExt_ValidateValueRange(60 + (kapitel * 8) + (tier * 5), 60, 100));

	// Protekcje - paladyni to ciezka piechota (procenty od rozdzialu/tiera)
	slf.protection[1] = 80 + (kapitel * 30) + (tier * 20) + (hero.level / 4);	// blunt
	slf.protection[2] = 80 + (kapitel * 30) + (tier * 20) + (hero.level / 4);	// edge
	slf.protection[6] = 80 + (kapitel * 30) + (tier * 20) + (hero.level / 4);	// point
	slf.protection[3] = 60 + (kapitel * 20) + (tier * 15);	// fire
	slf.protection[5] = 60 + (kapitel * 20) + (tier * 15);	// magic

	// Bron - TYLKO do plecaka (createinvitems), NIGDY npc_equipitem na swiezej
	// instancji dynamicznej (crash). AI walki dobiera z plecaka sama. Bazowa
	// (nie magiczna) - magia leci wylacznie z bossow (kanon ekonomii).
	twWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"), (hero.level * 7) + (kapitel * 40) + (tier * 80));
	if (twWeap > 0) { createinvitems(slf, twWeap, 1); };
};

// Dziennik: bramkowany wrapper (create-topic-on-first-use; surowy B_LogEntry
// bez utworzonego tematu ginie po cichu - lekcja z quest Wiezy).
func void StExt_DarkKnights_Log(var string entry)
{
	if (!StExt_DarkKnight_TopicMade)
	{
		Log_CreateTopic(StExt_Topic_DarkKnights, LOG_MISSION);
		Log_SetTopicStatus(StExt_Topic_DarkKnights, LOG_RUNNING);
		StExt_DarkKnight_TopicMade = true;
	};
	B_LogEntry(StExt_Topic_DarkKnights, entry);
};

//--------------------------------------------------------------
// *** Instancje (WSZYSTKIE najpierw) ***
//--------------------------------------------------------------
// Imienni (tier 2, lord tier 4) i eskorty (tier 0). guild = gil_bdt, wizual
// paladyna. Setup + bron w bloku instancji (wzorzec dzialajacej TrashSetup).
instance bdt_99770_PaladynAldric(npc_default)
{
    name = "Paladyn Aldric"; guild = gil_bdt; id = 99770; voice = 10; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99770_PaladynAldric, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99770_PaladynAldric, "Humans_Militia.mds");
    b_givenpctalents(bdt_99770_PaladynAldric); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99770;
    StExt_DarkKnights_TargetSetup(bdt_99770_PaladynAldric, 2);
};
instance bdt_99771_PaladynRoland(npc_default)
{
    name = "Paladyn Roland"; guild = gil_bdt; id = 99771; voice = 10; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99771_PaladynRoland, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99771_PaladynRoland, "Humans_Militia.mds");
    b_givenpctalents(bdt_99771_PaladynRoland); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99771;
    StExt_DarkKnights_TargetSetup(bdt_99771_PaladynRoland, 2);
};
instance bdt_99772_PaladynStraz1(npc_default)
{
    name = "Paladyn"; guild = gil_bdt; id = 99772; voice = 11; flags = 0; npctype = npctype_main; level = 22;
    b_setnpcvisual(bdt_99772_PaladynStraz1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99772_PaladynStraz1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99772_PaladynStraz1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99772;
    StExt_DarkKnights_TargetSetup(bdt_99772_PaladynStraz1, 0);
};
instance bdt_99773_PaladynStraz2(npc_default)
{
    name = "Paladyn"; guild = gil_bdt; id = 99773; voice = 11; flags = 0; npctype = npctype_main; level = 22;
    b_setnpcvisual(bdt_99773_PaladynStraz2, male, "Hum_Head_Fighter", face_n_deadpal, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99773_PaladynStraz2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99773_PaladynStraz2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99773;
    StExt_DarkKnights_TargetSetup(bdt_99773_PaladynStraz2, 0);
};
instance bdt_99774_PaladynGerhard(npc_default)
{
    name = "Paladyn Gerhard"; guild = gil_bdt; id = 99774; voice = 10; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99774_PaladynGerhard, male, "Hum_Head_Fighter", face_n_harlok, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99774_PaladynGerhard, "Humans_Militia.mds");
    b_givenpctalents(bdt_99774_PaladynGerhard); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99774;
    StExt_DarkKnights_TargetSetup(bdt_99774_PaladynGerhard, 2);
};
instance bdt_99775_PaladynVolker(npc_default)
{
    name = "Paladyn Volker"; guild = gil_bdt; id = 99775; voice = 10; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99775_PaladynVolker, male, "Hum_Head_Bald", face_n_caine, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99775_PaladynVolker, "Humans_Militia.mds");
    b_givenpctalents(bdt_99775_PaladynVolker); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99775;
    StExt_DarkKnights_TargetSetup(bdt_99775_PaladynVolker, 2);
};
instance bdt_99776_KapitanOrtwin(npc_default)
{
    name = "Kapitan Ortwin"; guild = gil_bdt; id = 99776; voice = 10; flags = 0; npctype = npctype_main; level = 32;
    b_setnpcvisual(bdt_99776_KapitanOrtwin, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99776_KapitanOrtwin, "Humans_Militia.mds");
    b_givenpctalents(bdt_99776_KapitanOrtwin); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99776;
    StExt_DarkKnights_TargetSetup(bdt_99776_KapitanOrtwin, 3);
};
instance bdt_99777_PaladynGwardia1(npc_default)
{
    name = "Paladyn"; guild = gil_bdt; id = 99777; voice = 11; flags = 0; npctype = npctype_main; level = 24;
    b_setnpcvisual(bdt_99777_PaladynGwardia1, male, "Hum_Head_Bald", face_n_deadpal, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99777_PaladynGwardia1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99777_PaladynGwardia1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99777;
    StExt_DarkKnights_TargetSetup(bdt_99777_PaladynGwardia1, 1);
};
instance bdt_99778_PaladynGwardia2(npc_default)
{
    name = "Paladyn"; guild = gil_bdt; id = 99778; voice = 11; flags = 0; npctype = npctype_main; level = 24;
    b_setnpcvisual(bdt_99778_PaladynGwardia2, male, "Hum_Head_Fighter", face_n_harlok, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99778_PaladynGwardia2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99778_PaladynGwardia2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99778;
    StExt_DarkKnights_TargetSetup(bdt_99778_PaladynGwardia2, 1);
};
instance bdt_99780_PaladynLordIsgaroth(npc_default)
{
    name = "Paladyn Lord Isgaroth"; guild = gil_bdt; id = 99780; voice = 10; flags = 0; npctype = npctype_main; level = 40;
    b_setnpcvisual(bdt_99780_PaladynLordIsgaroth, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99780_PaladynLordIsgaroth, "Humans_Militia.mds");
    b_givenpctalents(bdt_99780_PaladynLordIsgaroth); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99780;
    StExt_DarkKnights_TargetSetup(bdt_99780_PaladynLordIsgaroth, 4);
};
instance bdt_99781_PaladynHonor1(npc_default)
{
    name = "Paladyn Gwardii"; guild = gil_bdt; id = 99781; voice = 11; flags = 0; npctype = npctype_main; level = 26;
    b_setnpcvisual(bdt_99781_PaladynHonor1, male, "Hum_Head_Bald", face_n_caine, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99781_PaladynHonor1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99781_PaladynHonor1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99781;
    StExt_DarkKnights_TargetSetup(bdt_99781_PaladynHonor1, 1);
};
instance bdt_99782_PaladynHonor2(npc_default)
{
    name = "Paladyn Gwardii"; guild = gil_bdt; id = 99782; voice = 11; flags = 0; npctype = npctype_main; level = 26;
    b_setnpcvisual(bdt_99782_PaladynHonor2, male, "Hum_Head_Fighter", face_n_harlok, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99782_PaladynHonor2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99782_PaladynHonor2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99782;
    StExt_DarkKnights_TargetSetup(bdt_99782_PaladynHonor2, 1);
};
instance bdt_99783_PaladynHonor3(npc_default)
{
    name = "Paladyn Gwardii"; guild = gil_bdt; id = 99783; voice = 11; flags = 0; npctype = npctype_main; level = 26;
    b_setnpcvisual(bdt_99783_PaladynHonor3, male, "Hum_Head_Bald", face_n_deadpal, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99783_PaladynHonor3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99783_PaladynHonor3); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99783;
    StExt_DarkKnights_TargetSetup(bdt_99783_PaladynHonor3, 1);
};

//--------------------------------------------------------------
// *** Progresja (parsowana po instancjach, przed ai_ondead) ***
//--------------------------------------------------------------
// Liczy zabojstwa i melduje postep. NIE rusza stage - stage przesuwa dopiero
// dialog RAPORTU (cond: stage-aktywny && kills>=needed), inaczej raport nigdy
// by sie nie pokazal.
func void StExt_DarkKnights_Advance(var int quest, var int needed)
{
	StExt_DarkKnight_Kills += 1;
	ai_printbonus(concatstrings(concatstrings("Wrog Beliara martwy (", inttostring(StExt_ValidateValueRange(StExt_DarkKnight_Kills, 0, needed))), concatstrings("/", concatstrings(inttostring(needed), ")"))));
	if (StExt_DarkKnight_Kills >= needed) { ai_printbonus("Rzecz skonczona. Wroc do Mistrza."); };
};

//--------------------------------------------------------------
// *** ai_ondead (silnik wola po nazwie; tylko NASZE instancje) ***
//--------------------------------------------------------------
func void ai_ondead_bdt_99770_PaladynAldric() { if (StExt_DarkKnight_Stage == 1) { StExt_DarkKnights_Advance(1, 1); }; };
func void ai_ondead_bdt_99771_PaladynRoland()
{
	if (StExt_DarkKnight_Stage == 3)
	{
		StExt_DarkKnight_RelicTaken = true;
		createinvitems(hero, itmi_stext_desecrated_relic, 1);
		StExt_DarkKnights_Log("Rolanda juz nie ma. Relikwia paladynow lezy splugawiona w mojej sakwie.");
		StExt_DarkKnights_Advance(2, 1);
	};
};
func void ai_ondead_bdt_99772_PaladynStraz1() { };
func void ai_ondead_bdt_99773_PaladynStraz2() { };
func void ai_ondead_bdt_99774_PaladynGerhard() { if (StExt_DarkKnight_Stage == 5) { StExt_DarkKnights_Advance(3, 2); }; };
func void ai_ondead_bdt_99775_PaladynVolker() { if (StExt_DarkKnight_Stage == 5) { StExt_DarkKnights_Advance(3, 2); }; };
func void ai_ondead_bdt_99776_KapitanOrtwin() { if (StExt_DarkKnight_Stage == 7) { StExt_DarkKnights_Advance(4, 1); }; };
func void ai_ondead_bdt_99777_PaladynGwardia1() { };
func void ai_ondead_bdt_99778_PaladynGwardia2() { };
func void ai_ondead_bdt_99780_PaladynLordIsgaroth() { if (StExt_DarkKnight_Stage == 9) { StExt_DarkKnights_Advance(5, 1); }; };
func void ai_ondead_bdt_99781_PaladynHonor1() { };
func void ai_ondead_bdt_99782_PaladynHonor2() { };
func void ai_ondead_bdt_99783_PaladynHonor3() { };

//--------------------------------------------------------------
// *** Dialogi na BAZOWYM DMT_DARKTEACHER (nr 700+, bez kolizji) ***
//--------------------------------------------------------------
// Bramka wszedzie: hero.guild == GIL_DMT + stage. Kwestie przez StExt_Say
// (ton mistrza: arogancki, wladczy, oddany Beliarowi).

// Bramka czlonkostwa. Gracz-Rycerz trzyma hero.guild == StExt_DK_GuildId (16,
// ustalone w grze). Akceptujemy tez GIL_DMT(=11) jako belt-and-suspenders
// (parser-safe symbol). GIL_DMT1/2/3 NIE uzywac - crashuja parser (Unknown
// identifier). Non-Rycerz nigdy nie ma zadnej z tych gildii.
func int StExt_DK_IsMember() { return (hero.guild == StExt_DK_GuildId) || (hero.guild == GIL_DMT); };

// --- Q1: Krew na Dowod ---
instance dia_dmtteacher_stext_q1(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 700;
    condition = dia_dmtteacher_stext_q1_condition;
    information = dia_dmtteacher_stext_q1_info;
    permanent = false;
    description = "Czym moge sluzyc Beliarowi?";
};
func int dia_dmtteacher_stext_q1_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 0); };
func void dia_dmtteacher_stext_q1_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Sluzyc? Jeszcze niczym nie jestes. Ale masz w sobie ten sam glod, co my - glod, ktory karmi tylko krew wroga.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Na wybrzezu wciaz oddycha paladyn Aldric. Odbierz mu ten oddech. Po cichu, jak przystalo na sluge Beliara.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Wroc, gdy jego serce ucichnie.");
	StExt_DarkKnight_Stage = 1;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99770_PaladynAldric, StExt_DK_WP_Q1);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Mistrz zada dowodu. Paladyn Aldric ma zginac - cicho, na wybrzezu.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q1done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 701;
    condition = dia_dmtteacher_stext_q1done_condition;
    information = dia_dmtteacher_stext_q1done_info;
    permanent = false;
    description = "Aldric nie zyje.";
};
func int dia_dmtteacher_stext_q1done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 1) && (StExt_DarkKnight_Kills >= 1); };
func void dia_dmtteacher_stext_q1done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Czuje jego smierc na twoich rekach. Dobrze. Wez ten znak - Beliar juz na ciebie patrzy.");
	createinvitems(hero, itmi_stext_beliar_sigil, 1);
	StExt_DarkKnight_Stage = 2;
	StExt_DarkKnights_Log("Aldric martwy. Mistrz przyjal dowod. Beliar patrzy.");
	ai_stopprocessinfos(self);
};

// --- Q2: Zbezczeszczona Swiatynia ---
instance dia_dmtteacher_stext_q2(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 702;
    condition = dia_dmtteacher_stext_q2_condition;
    information = dia_dmtteacher_stext_q2_info;
    permanent = false;
    description = "Daj mi nastepny cel.";
};
func int dia_dmtteacher_stext_q2_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 2); };
func void dia_dmtteacher_stext_q2_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Paladyni strzega relikwii, ktora paruje ich swiatlem. Ich sila plynie ze swietosci - odbierzmy im ja.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zabij jej stroza, Paladyna Rolanda, i splugaw to swiadectwo. Niech poczuja, jak ich bog milczy.");
	StExt_DarkKnight_Stage = 3;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99771_PaladynRoland, StExt_DK_WP_Q2);
	wld_insertnpc(bdt_99772_PaladynStraz1, StExt_DK_WP_Q2);
	wld_insertnpc(bdt_99773_PaladynStraz2, StExt_DK_WP_Q2);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Relikwia lezy przy stroze Rolandzie. Zabij go i zabierz swietosc, by ja splugawic.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q2done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 703;
    condition = dia_dmtteacher_stext_q2done_condition;
    information = dia_dmtteacher_stext_q2done_info;
    permanent = false;
    description = "Relikwia jest splugawiona.";
};
func int dia_dmtteacher_stext_q2done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 3) && StExt_DarkKnight_RelicTaken; };
func void dia_dmtteacher_stext_q2done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Daj. Czujesz ten chlod? To ich bog odwraca wzrok. Zostaw ja tutaj - niech gnije u stop Beliara.");
	if (npc_hasitems(hero, itmi_stext_desecrated_relic) > 0) { npc_removeinvitems(hero, itmi_stext_desecrated_relic, 1); };
	StExt_DarkKnight_Stage = 4;
	StExt_DarkKnights_Log("Splugawiona relikwia spoczela u stop Beliara. Paladyni sa slabsi, niz byli.");
	ai_stopprocessinfos(self);
};

// --- Q3: Cisza Przed Switem (podwojne, stala smierc imiennych) ---
instance dia_dmtteacher_stext_q3(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 704;
    condition = dia_dmtteacher_stext_q3_condition;
    information = dia_dmtteacher_stext_q3_info;
    permanent = false;
    description = "Kto nastepny?";
};
func int dia_dmtteacher_stext_q3_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 4); };
func void dia_dmtteacher_stext_q3_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Dwaj bracia w bieli, Gerhard i Volker, poznali twoje imie. To blad, ktory naprawisz nozem.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Obaj maja zamilknac tej nocy. Na zawsze. Nikt, kto zna nasze twarze, nie doczeka switu.");
	StExt_DarkKnight_Stage = 5;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99774_PaladynGerhard, StExt_DK_WP_Q3);
	wld_insertnpc(bdt_99775_PaladynVolker, StExt_DK_WP_Q3);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Gerhard i Volker znaja moja twarz. Obaj maja zginac - obaj, bez wyjatku.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q3done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 705;
    condition = dia_dmtteacher_stext_q3done_condition;
    information = dia_dmtteacher_stext_q3done_info;
    permanent = false;
    description = "Obaj nie zyja.";
};
func int dia_dmtteacher_stext_q3done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 5) && (StExt_DarkKnight_Kills >= 2); };
func void dia_dmtteacher_stext_q3done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Cisza. Nareszcie. Dwa imiona wykreslone z ksiegi zywych - i nikt ich juz nie wpisze z powrotem.");
	StExt_DarkKnight_Stage = 6;
	StExt_DarkKnights_Log("Gerhard i Volker martwi na zawsze. Zaden paladyn juz ich nie wskrzesi.");
	ai_stopprocessinfos(self);
};

// --- Q4: Zdrajca w Bieli (kapitan) ---
instance dia_dmtteacher_stext_q4(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 706;
    condition = dia_dmtteacher_stext_q4_condition;
    information = dia_dmtteacher_stext_q4_info;
    permanent = false;
    description = "Wskaz kolejnego wroga.";
};
func int dia_dmtteacher_stext_q4_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 6); };
func void dia_dmtteacher_stext_q4_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Kapitan Ortwin zbiera ludzi przeciw nam. Rozetnij ten wezel u samego zrodla.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Reszta to tylko miecze bez reki. Zabij jego, a rozsypia sie sami.");
	StExt_DarkKnight_Stage = 7;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99776_KapitanOrtwin, StExt_DK_WP_Q4);
	wld_insertnpc(bdt_99777_PaladynGwardia1, StExt_DK_WP_Q4);
	wld_insertnpc(bdt_99778_PaladynGwardia2, StExt_DK_WP_Q4);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Kapitan Ortwin zbiera sily przeciw nam. Zabij dowodce - reszta rozsypie sie sama.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q4done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 707;
    condition = dia_dmtteacher_stext_q4done_condition;
    information = dia_dmtteacher_stext_q4done_info;
    permanent = false;
    description = "Ortwin padl.";
};
func int dia_dmtteacher_stext_q4done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 7) && (StExt_DarkKnight_Kills >= 1); };
func void dia_dmtteacher_stext_q4done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Bez glowy ciezko dowodzic. Ich zapal gasnie razem z nim. Zostal juz tylko jeden - najjasniejszy.");
	StExt_DarkKnight_Stage = 8;
	StExt_DarkKnights_Log("Ortwin martwy, jego ludzie w rozsypce. Zostal ostatni: paladyn lord.");
	ai_stopprocessinfos(self);
};

// --- Q5: Zmierzch Paladyna (finał) ---
instance dia_dmtteacher_stext_q5(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 708;
    condition = dia_dmtteacher_stext_q5_condition;
    information = dia_dmtteacher_stext_q5_info;
    permanent = false;
    description = "Wskaz ostatniego.";
};
func int dia_dmtteacher_stext_q5_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 8); };
func void dia_dmtteacher_stext_q5_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zostal jeden - Paladyn Lord Isgaroth, ich najjasniejszy plomien. Zgas go, a przestaniesz byc nikim.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Pojdzie z gwardia. Przebij sie i wbij mu ostrze pod serce. Dzis konczysz droge - a z tej drogi nie ma powrotu.");
	StExt_DarkKnight_Stage = 9;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99780_PaladynLordIsgaroth, StExt_DK_WP_Q5);
	wld_insertnpc(bdt_99781_PaladynHonor1, StExt_DK_WP_Q5);
	wld_insertnpc(bdt_99782_PaladynHonor2, StExt_DK_WP_Q5);
	wld_insertnpc(bdt_99783_PaladynHonor3, StExt_DK_WP_Q5);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Ostatni cel: Paladyn Lord Isgaroth, z gwardia. Zgas ich najjasniejszy plomien.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q5done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 709;
    condition = dia_dmtteacher_stext_q5done_condition;
    information = dia_dmtteacher_stext_q5done_info;
    permanent = false;
    description = "Isgaroth zgasl.";
};
func int dia_dmtteacher_stext_q5done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 9) && (StExt_DarkKnight_Kills >= 1); };
func void dia_dmtteacher_stext_q5done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Krew ich najjasniejszego wsiakla w twoje rece. Beliar cie widzi - a ja, po raz pierwszy, nie widze w tobie nikogo.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Wez to ostrze. Pije swiatlo tak, jak inni pija krew. Od dzis jestes Mroczna Reka Beliara.");
	createinvitems(hero, itmw_stext_beliar_reaper, 1);
	StExt_DarkKnight_Stage = 10;
	StExt_DarkKnights_Log("Isgaroth martwy. Bialy zakon zlamany po cichu, jeden po drugim. Mistrz nazwal mnie Mroczna Reka Beliara.");
	Log_SetTopicStatus(StExt_Topic_DarkKnights, LOG_SUCCESS);
	ai_stopprocessinfos(self);
};

// --- Powtarzalna wskazowka (samonaprawa sejwow z zagubionymi celami) ---
instance dia_dmtteacher_stext_hint(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 710;
    condition = dia_dmtteacher_stext_hint_condition;
    information = dia_dmtteacher_stext_hint_info;
    permanent = true;
    description = "Gdzie mam uderzyc?";
};
func int dia_dmtteacher_stext_hint_condition()
{
	return StExt_DK_IsMember() && ((StExt_DarkKnight_Stage == 1) || (StExt_DarkKnight_Stage == 3) || (StExt_DarkKnight_Stage == 5) || (StExt_DarkKnight_Stage == 7) || (StExt_DarkKnight_Stage == 9));
};
func void dia_dmtteacher_stext_hint_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Wskazalem raz. Nie kaz mi powtarzac - Beliar nie ceni tepych ostrzy.");
	rx_saveparservars();
	if (StExt_DarkKnight_Stage == 1) { wld_insertnpc(bdt_99770_PaladynAldric, StExt_DK_WP_Q1); ai_printbonus("Paladyn Aldric - wybrzeze. Zabij go."); }
	else if (StExt_DarkKnight_Stage == 3)
	{
		wld_insertnpc(bdt_99771_PaladynRoland, StExt_DK_WP_Q2);
		ai_printbonus("Stroz Roland przy relikwii - zabij go i zabierz swietosc.");
	}
	else if (StExt_DarkKnight_Stage == 5)
	{
		wld_insertnpc(bdt_99774_PaladynGerhard, StExt_DK_WP_Q3);
		wld_insertnpc(bdt_99775_PaladynVolker, StExt_DK_WP_Q3);
		ai_printbonus("Gerhard i Volker - obaj musza zginac.");
	}
	else if (StExt_DarkKnight_Stage == 7)
	{
		wld_insertnpc(bdt_99776_KapitanOrtwin, StExt_DK_WP_Q4);
		ai_printbonus("Kapitan Ortwin - zabij dowodce.");
	}
	else
	{
		wld_insertnpc(bdt_99780_PaladynLordIsgaroth, StExt_DK_WP_Q5);
		ai_printbonus("Paladyn Lord Isgaroth - ostatni. Zgas go.");
	};
	rx_restoreparservars();
	ai_stopprocessinfos(self);
};
