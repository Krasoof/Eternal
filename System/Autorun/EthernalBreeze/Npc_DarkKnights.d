
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
// Cele ROZRZUCONE po rozpoznawalnych landmarkach NEWWORLD (standardowe waypointy
// G2, zweryfikowane w waynecie AB_Worlds.vdf). Mistrz nazywa miejsce w odprawie,
// zeby dalo sie trafic - to bylo sedno "gdzie jest ten paladyn": wewnetrzny WP
// bez orientacji. Kazdy pasuje tematycznie do celu.
const string StExt_DK_WP_Q1 = "NW_CITY_TO_LIGHTHOUSE_01";		// latarnia morska (patrol na wybrzezu)
const string StExt_DK_WP_Q2 = "NW_FOREST_CROSS_MONASTERY";		// rozstaj pod klasztorem (stroz relikwii)
const string StExt_DK_WP_Q3 = "NW_FARM1_LOBART";				// farma Lobarta u bram miasta (dwaj bracia)
const string StExt_DK_WP_Q4 = "NW_BIGMILL_01";					// wielki mlyn (kapitan zbiera ludzi)
const string StExt_DK_WP_Q5 = "NW_FARM4_SEKOB";					// odludna farma Sekoba (ostatni lord)
const string StExt_DK_WP_Q6 = "NW_TAVERNE_01";					// tawerna przy trakcie (inkwizytor czeka na CIEBIE)
const string StExt_DK_WP_Q7 = "NW_CITY_HABOUR_05";				// port (ucho Innosa - informator w tlumie)
// Q8 (Gornicza Dolina) NIE ma stalego WP: cele kotwicza sie na pozycji gracza
// przy wejsciu do GD (npc_getnearestwp - gracz stoi na waynecie, WP zawsze wazny).
// To ta sama technika, ktora domknela spawn lowcow demonow (zero dropow na 0,0,0).
const string StExt_DK_WP_Q9 = "NW_FOREST_PATH_23";				// lesny trakt (konwoj relikwii)

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
func void rtn_start_99784() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q6); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q6); };
func void rtn_start_99785() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q6); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q6); };
func void rtn_start_99786() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q6); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q6); };
func void rtn_start_99787() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q7); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q7); };
func void rtn_start_99788() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q7); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q7); };
func void rtn_start_99789() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q7); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q7); };
// Q8 (GD): rutyny warty na WP kotwicy gracza (ustawiany w StExt_DK_GDTrySpawn
// przez npc_exchangeroutine po insercie - jak przy lowcach demonow).
func void rtn_start_99743() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_GDWp); ta_stand_guarding(20, 0, 8, 0, StExt_DK_GDWp); };
func void rtn_start_99744() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_GDWp); ta_stand_guarding(20, 0, 8, 0, StExt_DK_GDWp); };
func void rtn_start_99745() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_GDWp); ta_stand_guarding(20, 0, 8, 0, StExt_DK_GDWp); };
// Q9 (R4, NW): konwoj relikwii na lesnym trakcie.
func void rtn_start_99749() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q9); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q9); };
func void rtn_start_99750() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q9); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q9); };
func void rtn_start_99751() { ta_stand_guarding(8, 0, 20, 0, StExt_DK_WP_Q9); ta_stand_guarding(20, 0, 8, 0, StExt_DK_WP_Q9); };

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

// Karma Beliara = bazowy licznik beliarpraycount. To ta sama Karma, ktora
// zbiera sie do Pazura Beliara (400 na mistrzostwo) i steruje Droga Beliara.
//
// KOREKTA (2026-07-22): wczesniejsza wersja pisala do wlasnego StExt_BeliarKarmaQuest,
// bo "baza nadpisuje beliarpraycount co tick". To zalozenie bylo BLEDNE - dowod:
// mechanika daru Beliara (Overrides.d giftofthebeliar) WYDAJE beliarpraycount
// (odejmuje od niego), co jest mozliwe tylko dla trwalego akumulatora, nie dla
// zmiennej zerowanej co klatke. Osobny licznik byl wiec workaroundem na nieistniejacy
// problem, a przy okazji: (a) nie wliczal sie do natywnej Drogi Beliara/gildii,
// (b) globale Autorun nie maja gwarancji persystencji przez wlasny mechanizm.
// Piszemy wprost do zrodla - karma sumuje sie natywnie WSZEDZIE (panel B, gildia,
// dary, wymagania przedmiotow) i przezywa zapis jak kazda karma bazowa.
func void StExt_DarkKnights_GrantBeliarKarma(var int amount)
{
	beliarpraycount = beliarpraycount + amount;
	ai_printbonus(concatstrings("Beliar patrzy laskawiej (+", concatstrings(inttostring(amount), " Karmy Beliara)")));
};

// Namacalna nagroda za zadanie: zloto + PN (hero.lp przez rx_givelp). Domyka
// petle: questy finansuja nauke aur Beliara u Nauczyciela (koszt PN+zloto).
func void StExt_DarkKnights_GrantReward(var int gold, var int lp)
{
	if (gold > 0) { createinvitems(hero, itmi_gold, gold); };
	if (lp > 0) { rx_givelp(lp); };
	ai_printbonus(concatstrings(concatstrings("Zaplata Beliara: ", inttostring(gold)), concatstrings(" zlota, ", concatstrings(inttostring(lp), " PN"))));
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

// --- R3 "Ogien za ogien": Kosciol Innosa przysyla rachunek za krucjate ---
// Inkwizytor = caster (aivar[51] + Mage overlay, wzorzec celow polowan Zakonu);
// zbroje magow ognia (itar_kdf_* - tokeny potwierdzone w uzyciu w modzie).
instance bdt_99784_InkwizytorMalachiasz(npc_default)
{
    name = "Inkwizytor Malachiasz"; guild = gil_bdt; id = 99784; voice = 10; flags = 0; npctype = npctype_main; level = 42;
    b_setnpcvisual(bdt_99784_InkwizytorMalachiasz, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_kdf_h_npc);
    mdl_applyoverlaymds(bdt_99784_InkwizytorMalachiasz, "Humans_Mage.mds");
    b_givenpctalents(bdt_99784_InkwizytorMalachiasz); fight_tactic = fai_human_master;
    aivar[6] = true; aivar[51] = magic_always;
    daily_routine = rtn_start_99784;
    StExt_DarkKnights_TargetSetup(bdt_99784_InkwizytorMalachiasz, 4);
};
instance bdt_99785_Egzorcysta1(npc_default)
{
    name = "Egzorcysta"; guild = gil_bdt; id = 99785; voice = 11; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99785_Egzorcysta1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_kdf_m_npc);
    mdl_applyoverlaymds(bdt_99785_Egzorcysta1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99785_Egzorcysta1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99785;
    StExt_DarkKnights_TargetSetup(bdt_99785_Egzorcysta1, 1);
};
instance bdt_99786_Egzorcysta2(npc_default)
{
    name = "Egzorcysta"; guild = gil_bdt; id = 99786; voice = 13; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99786_Egzorcysta2, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_kdf_m_npc);
    mdl_applyoverlaymds(bdt_99786_Egzorcysta2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99786_Egzorcysta2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99786;
    StExt_DarkKnights_TargetSetup(bdt_99786_Egzorcysta2, 1);
};

// --- R3 Q7 "Ucho Innosa": informator Kosciola w porcie + dwa najete ostrza ---
instance bdt_99787_BratKasjan(npc_default)
{
    name = "Brat Kasjan"; guild = gil_bdt; id = 99787; voice = 10; flags = 0; npctype = npctype_main; level = 36;
    b_setnpcvisual(bdt_99787_BratKasjan, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_kdf_m_npc);
    mdl_applyoverlaymds(bdt_99787_BratKasjan, "Humans_Militia.mds");
    b_givenpctalents(bdt_99787_BratKasjan); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99787;
    StExt_DarkKnights_TargetSetup(bdt_99787_BratKasjan, 3);
};
instance bdt_99788_NajemneOstrze1(npc_default)
{
    name = "Najemne Ostrze"; guild = gil_bdt; id = 99788; voice = 11; flags = 0; npctype = npctype_main; level = 26;
    b_setnpcvisual(bdt_99788_NajemneOstrze1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_bdt_m);
    mdl_applyoverlaymds(bdt_99788_NajemneOstrze1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99788_NajemneOstrze1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99788;
    StExt_DarkKnights_TargetSetup(bdt_99788_NajemneOstrze1, 1);
};
instance bdt_99789_NajemneOstrze2(npc_default)
{
    name = "Najemne Ostrze"; guild = gil_bdt; id = 99789; voice = 13; flags = 0; npctype = npctype_main; level = 26;
    b_setnpcvisual(bdt_99789_NajemneOstrze2, male, "Hum_Head_Fighter", face_n_mud, bodytex_n, itar_bdt_m);
    mdl_applyoverlaymds(bdt_99789_NajemneOstrze2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99789_NajemneOstrze2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99789;
    StExt_DarkKnights_TargetSetup(bdt_99789_NajemneOstrze2, 1);
};

// --- R3 Q8 "Kaznodzieja w Dolinie": ocalali fanatycy uciekli do Gorniczej
//     Doliny. Spawn KOTWICZONY na graczu przy wejsciu do GD (patrz
//     StExt_DK_GDTrySpawn) - brak stalego WP = brak dropu na 0,0,0. ---
instance bdt_99743_KaznodziejaEzechiel(npc_default)
{
    name = "Kaznodzieja Ezechiel"; guild = gil_bdt; id = 99743; voice = 10; flags = 0; npctype = npctype_main; level = 44;
    b_setnpcvisual(bdt_99743_KaznodziejaEzechiel, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_kdf_h_npc);
    mdl_applyoverlaymds(bdt_99743_KaznodziejaEzechiel, "Humans_Mage.mds");
    b_givenpctalents(bdt_99743_KaznodziejaEzechiel); fight_tactic = fai_human_master;
    aivar[6] = true; aivar[51] = magic_always;
    daily_routine = rtn_start_99743;
    StExt_DarkKnights_TargetSetup(bdt_99743_KaznodziejaEzechiel, 4);
};
instance bdt_99744_Fanatyk1(npc_default)
{
    name = "Fanatyk"; guild = gil_bdt; id = 99744; voice = 11; flags = 0; npctype = npctype_main; level = 30;
    b_setnpcvisual(bdt_99744_Fanatyk1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_kdf_m_npc);
    mdl_applyoverlaymds(bdt_99744_Fanatyk1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99744_Fanatyk1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99744;
    StExt_DarkKnights_TargetSetup(bdt_99744_Fanatyk1, 2);
};
instance bdt_99745_Fanatyk2(npc_default)
{
    name = "Fanatyk"; guild = gil_bdt; id = 99745; voice = 13; flags = 0; npctype = npctype_main; level = 30;
    b_setnpcvisual(bdt_99745_Fanatyk2, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_kdf_m_npc);
    mdl_applyoverlaymds(bdt_99745_Fanatyk2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99745_Fanatyk2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99745;
    StExt_DarkKnights_TargetSetup(bdt_99745_Fanatyk2, 2);
};

// --- R4 Q9 "Konwoj Swiatla": eskorta paladynow wiezie relikwie Innosa ---
instance bdt_99749_KapitanEskorty(npc_default)
{
    name = "Kapitan Eskorty"; guild = gil_bdt; id = 99749; voice = 10; flags = 0; npctype = npctype_main; level = 44;
    b_setnpcvisual(bdt_99749_KapitanEskorty, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_pal_h);
    mdl_applyoverlaymds(bdt_99749_KapitanEskorty, "Humans_Militia.mds");
    b_givenpctalents(bdt_99749_KapitanEskorty); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99749;
    StExt_DarkKnights_TargetSetup(bdt_99749_KapitanEskorty, 4);
};
instance bdt_99750_PaladynEskorty1(npc_default)
{
    name = "Paladyn Eskorty"; guild = gil_bdt; id = 99750; voice = 11; flags = 0; npctype = npctype_main; level = 32;
    b_setnpcvisual(bdt_99750_PaladynEskorty1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99750_PaladynEskorty1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99750_PaladynEskorty1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99750;
    StExt_DarkKnights_TargetSetup(bdt_99750_PaladynEskorty1, 2);
};
instance bdt_99751_PaladynEskorty2(npc_default)
{
    name = "Paladyn Eskorty"; guild = gil_bdt; id = 99751; voice = 13; flags = 0; npctype = npctype_main; level = 32;
    b_setnpcvisual(bdt_99751_PaladynEskorty2, male, "Hum_Head_Fighter", face_n_deadpal, bodytex_n, itar_pal_m);
    mdl_applyoverlaymds(bdt_99751_PaladynEskorty2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99751_PaladynEskorty2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99751;
    StExt_DarkKnights_TargetSetup(bdt_99751_PaladynEskorty2, 2);
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
// R3 Q6: cala zasadzka musi pasc (3/3) - inkwizytor i obaj egzorcysci.
func void ai_ondead_bdt_99784_InkwizytorMalachiasz() { if (StExt_DarkKnight_Stage == 11) { StExt_DarkKnights_Advance(6, 3); }; };
func void ai_ondead_bdt_99785_Egzorcysta1() { if (StExt_DarkKnight_Stage == 11) { StExt_DarkKnights_Advance(6, 3); }; };
func void ai_ondead_bdt_99786_Egzorcysta2() { if (StExt_DarkKnight_Stage == 11) { StExt_DarkKnights_Advance(6, 3); }; };
// R3 Q7: informator + dwa ostrza (3/3).
func void ai_ondead_bdt_99787_BratKasjan() { if (StExt_DarkKnight_Stage == 13) { StExt_DarkKnights_Advance(7, 3); }; };
func void ai_ondead_bdt_99788_NajemneOstrze1() { if (StExt_DarkKnight_Stage == 13) { StExt_DarkKnights_Advance(7, 3); }; };
func void ai_ondead_bdt_99789_NajemneOstrze2() { if (StExt_DarkKnight_Stage == 13) { StExt_DarkKnights_Advance(7, 3); }; };
// R3 Q8: kaznodzieja + dwaj fanatycy w GD (3/3).
func void ai_ondead_bdt_99743_KaznodziejaEzechiel() { if (StExt_DarkKnight_Stage == 15) { StExt_DarkKnights_Advance(8, 3); }; };
func void ai_ondead_bdt_99744_Fanatyk1() { if (StExt_DarkKnight_Stage == 15) { StExt_DarkKnights_Advance(8, 3); }; };
func void ai_ondead_bdt_99745_Fanatyk2() { if (StExt_DarkKnight_Stage == 15) { StExt_DarkKnights_Advance(8, 3); }; };
// R4 Q9: konwoj - kapitan niesie relikwie (drop), cala eskorta 3/3.
func void ai_ondead_bdt_99749_KapitanEskorty()
{
	if (StExt_DarkKnight_Stage == 17)
	{
		createinvitems(hero, itmi_stext_innos_relic, 1);
		StExt_DarkKnights_Log("Kapitan eskorty padl. Relikwia Innosa - zimna szkatula, ktora parzy - lezy przy jego ciele.");
		StExt_DarkKnights_Advance(9, 3);
	};
}
func void ai_ondead_bdt_99750_PaladynEskorty1() { if (StExt_DarkKnight_Stage == 17) { StExt_DarkKnights_Advance(9, 3); }; };
func void ai_ondead_bdt_99751_PaladynEskorty2() { if (StExt_DarkKnight_Stage == 17) { StExt_DarkKnights_Advance(9, 3); }; };

// Spawn celow Q8 w Gorniczej Dolinie - kotwiczony na pozycji gracza (wejscie
// do GD). Wolane z rx_mainloop (Overrides .src 82; ModController .src 54 nie
// dosiega tego pliku .src 75). Gracz stoi na waynecie, wiec WP zawsze wazny;
// npc_exchangeroutine przepina rutyny warty na ten WP (jak przy lowcach demonow).
func void StExt_DK_GDTrySpawn()
{
	var c_npc n;
	var string wp;
	if (StExt_DK_GDSpawned) { return; };
	if (StExt_DarkKnight_Stage != 15) { return; };
	if (currentlevel != oldworld_zen) { return; };
	wp = npc_getnearestwp(hero);
	if (!StExt_IsValidWp(wp)) { return; };
	StExt_DK_GDWp = wp;
	rx_saveparservars();
	wld_insertnpc(bdt_99743_KaznodziejaEzechiel, wp);
	wld_insertnpc(bdt_99744_Fanatyk1, wp);
	wld_insertnpc(bdt_99745_Fanatyk2, wp);
	n = hlp_getnpc(bdt_99743_KaznodziejaEzechiel);	if (hlp_isvalidnpc(n)) { npc_exchangeroutine(n, "START"); };
	n = hlp_getnpc(bdt_99744_Fanatyk1);				if (hlp_isvalidnpc(n)) { npc_exchangeroutine(n, "START"); };
	n = hlp_getnpc(bdt_99745_Fanatyk2);				if (hlp_isvalidnpc(n)) { npc_exchangeroutine(n, "START"); };
	rx_restoreparservars();
	StExt_DK_GDSpawned = true;
	ai_printbonus("Kaznodzieja Ezechiel glosi swoje kazania gdzies w poblizu. Ucisz go.");
};

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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Na wybrzezu, przy latarni morskiej, wciaz oddycha paladyn Aldric. Odbierz mu ten oddech. Po cichu, jak przystalo na sluge Beliara.");
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
	StExt_DarkKnights_GrantBeliarKarma(40);
	StExt_DarkKnights_GrantReward(2500, 5);
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zabij jej stroza, Paladyna Rolanda - stoi przy rozstaju drog pod klasztorem. Splugaw to swiadectwo, niech poczuja, jak ich bog milczy.");
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
	StExt_DarkKnights_GrantBeliarKarma(50);
	StExt_DarkKnights_GrantReward(3500, 7);
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Dwaj bracia w bieli, Gerhard i Volker, zaszyli sie na farmie Lobarta u bram miasta. Poznali twoje imie - to blad, ktory naprawisz nozem.");
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
	StExt_DarkKnights_GrantBeliarKarma(60);
	StExt_DarkKnights_GrantReward(5000, 10);
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Kapitan Ortwin zbiera ludzi przeciw nam przy wielkim mlynie. Rozetnij ten wezel u samego zrodla.");
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
	StExt_DarkKnights_GrantBeliarKarma(70);
	StExt_DarkKnights_GrantReward(6500, 13);
	StExt_DarkKnights_Log("Ortwin martwy, jego ludzie w rozsypce. Zostal ostatni: paladyn lord.");
	ai_stopprocessinfos(self);
};

// --- Q5: Zmierzch Paladyna (final) ---
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zostal jeden - Paladyn Lord Isgaroth, ich najjasniejszy plomien. Zaszyl sie na odludnej farmie Sekoba, na poludniu. Zgas go, a przestaniesz byc nikim.");
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
	StExt_DarkKnights_GrantBeliarKarma(100);
	StExt_DarkKnights_GrantReward(10000, 20);
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
	return StExt_DK_IsMember() && ((StExt_DarkKnight_Stage == 1) || (StExt_DarkKnight_Stage == 3) || (StExt_DarkKnight_Stage == 5) || (StExt_DarkKnight_Stage == 7) || (StExt_DarkKnight_Stage == 9) || (StExt_DarkKnight_Stage == 11) || (StExt_DarkKnight_Stage == 13) || (StExt_DarkKnight_Stage == 15) || (StExt_DarkKnight_Stage == 17));
};
func void dia_dmtteacher_stext_hint_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Wskazalem raz. Nie kaz mi powtarzac - Beliar nie ceni tepych ostrzy.");
	rx_saveparservars();
	if (StExt_DarkKnight_Stage == 1) { wld_insertnpc(bdt_99770_PaladynAldric, StExt_DK_WP_Q1); ai_printbonus("Paladyn Aldric - przy latarni morskiej, na wybrzezu."); }
	else if (StExt_DarkKnight_Stage == 3)
	{
		wld_insertnpc(bdt_99771_PaladynRoland, StExt_DK_WP_Q2);
		ai_printbonus("Stroz Roland - rozstaj drog pod klasztorem.");
	}
	else if (StExt_DarkKnight_Stage == 5)
	{
		wld_insertnpc(bdt_99774_PaladynGerhard, StExt_DK_WP_Q3);
		wld_insertnpc(bdt_99775_PaladynVolker, StExt_DK_WP_Q3);
		ai_printbonus("Gerhard i Volker - na farmie Lobarta, u bram miasta.");
	}
	else if (StExt_DarkKnight_Stage == 7)
	{
		wld_insertnpc(bdt_99776_KapitanOrtwin, StExt_DK_WP_Q4);
		ai_printbonus("Kapitan Ortwin - przy wielkim mlynie.");
	}
	else if (StExt_DarkKnight_Stage == 9)
	{
		wld_insertnpc(bdt_99780_PaladynLordIsgaroth, StExt_DK_WP_Q5);
		ai_printbonus("Paladyn Lord Isgaroth - na odludnej farmie Sekoba, na poludniu.");
	}
	else if (StExt_DarkKnight_Stage == 11)
	{
		wld_insertnpc(bdt_99784_InkwizytorMalachiasz, StExt_DK_WP_Q6);
		ai_printbonus("Inkwizytor Malachiasz - w tawernie przy trakcie. Czeka na ciebie.");
	}
	else if (StExt_DarkKnight_Stage == 13)
	{
		wld_insertnpc(bdt_99787_BratKasjan, StExt_DK_WP_Q7);
		ai_printbonus("Brat Kasjan - w porcie, wsrod zebrakow przy nabrzezu.");
	}
	else if (StExt_DarkKnight_Stage == 15)
	{
		// GD: celow NIE respawnujemy z Khorinis (inny swiat). Zdejmujemy latch -
		// StExt_DK_GDTrySpawn wstawi ich, gdy wejdziesz do GD.
		StExt_DK_GDSpawned = false;
		ai_printbonus("Kaznodzieja Ezechiel - w Gorniczej Dolinie. Przejdz przelecz i szukaj go w glebi.");
	}
	else
	{
		wld_insertnpc(bdt_99749_KapitanEskorty, StExt_DK_WP_Q9);
		ai_printbonus("Konwoj Kosciola - na lesnym trakcie. Rozbij go i zabierz relikwie.");
	};
	rx_restoreparservars();
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** R3 "Ogien za ogien" (stage 10 -> 12, od rozdzialu 3) ***
//--------------------------------------------------------------
// Odwrocenie roli po Drodze Beliara: dotad to gracz polowal - teraz Kosciol
// Innosa przysyla rachunek. Inkwizytor NIE jest celem do znalezienia: on czeka
// na CIEBIE. Wzorzec Advance/report bez zmian.
instance dia_dmtteacher_stext_q6(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 736;
    condition = dia_dmtteacher_stext_q6_condition;
    information = dia_dmtteacher_stext_q6_info;
    permanent = false;
    description = "Ktos o mnie pyta?";
};
func int dia_dmtteacher_stext_q6_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 10) && (kapitel >= 3); };
func void dia_dmtteacher_stext_q6_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zgasiles ich najjasniejszy plomien - i swiatlo to poczulo. Innos przyslal rachunek: inkwizytor Malachiasz zszedl ze statku i pyta o czlowieka z twoja twarza.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Rozsiadl sie w tawernie przy trakcie, z dwoma egzorcystami. Czeka, az przyjdziesz sie tlumaczyc. Idz. Wytlumacz mu sie ostrzem - wszystkim trzem.");
	StExt_DarkKnight_Stage = 11;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99784_InkwizytorMalachiasz, StExt_DK_WP_Q6);
	wld_insertnpc(bdt_99785_Egzorcysta1, StExt_DK_WP_Q6);
	wld_insertnpc(bdt_99786_Egzorcysta2, StExt_DK_WP_Q6);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Inkwizytor Malachiasz przybyl na wyspe po moja glowe. Czeka w tawernie przy trakcie z dwoma egzorcystami. Mistrz kazal wytlumaczyc sie ostrzem - wszystkim trzem.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q6done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 737;
    condition = dia_dmtteacher_stext_q6done_condition;
    information = dia_dmtteacher_stext_q6done_info;
    permanent = false;
    description = "Inkwizycja umilkla.";
};
func int dia_dmtteacher_stext_q6done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 11) && (StExt_DarkKnight_Kills >= 3); };
func void dia_dmtteacher_stext_q6done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Przyslali ogien, a wrocil im popiol. Dobrze. Niech nastepny statek wiezie juz tylko strach.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Beliar patrzy na ciebie coraz dluzej. Czuje, jak twoja aura ciemnieje - nos ja z duma.");
	StExt_DarkKnight_Stage = 12;
	StExt_DarkKnights_GrantBeliarKarma(120);
	StExt_DarkKnights_GrantReward(12000, 25);
	// Nagroda mocy: trwale +50 do mocy aur (wzorzec z powtarzalnego ulepszenia).
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_AuraPower, 50, StExt_PcStat_Source_Perm);
	ai_printbonus("Moc aur wzrosla (+50)");
	StExt_DarkKnights_Log("Malachiasz i jego egzorcysci nie wroca na kontynent. Mistrz mowi, ze moja aura ciemnieje - czuje to i ja.");
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** R3 Q7 "Ucho Innosa" (stage 12 -> 14) ***
//--------------------------------------------------------------
// Inkwizytor nie przybyl po omacku - ktos w miescie karmil Kosciol. Brat
// Kasjan slucha w porcie i sprzedaje twoje kroki. Uciszasz zrodlo.
instance dia_dmtteacher_stext_q7(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 738;
    condition = dia_dmtteacher_stext_q7_condition;
    information = dia_dmtteacher_stext_q7_info;
    permanent = false;
    description = "Skad wiedzieli, gdzie mnie szukac?";
};
func int dia_dmtteacher_stext_q7_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 12); };
func void dia_dmtteacher_stext_q7_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Inkwizytor nie spadl z nieba. Ktos mu ciebie wskazal - ucho Innosa w porcie. Brat Kasjan, przebrany za zebraka, liczy twoje kroki i sprzedaje je za odpust.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Najal dwa ostrza, bo wie, ze po niego przyjdziesz. Ucisz wszystkich trzech - martwe ucho nie slyszy.");
	StExt_DarkKnight_Stage = 13;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99787_BratKasjan, StExt_DK_WP_Q7);
	wld_insertnpc(bdt_99788_NajemneOstrze1, StExt_DK_WP_Q7);
	wld_insertnpc(bdt_99789_NajemneOstrze2, StExt_DK_WP_Q7);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Brat Kasjan - ucho Innosa w porcie - sprzedawal moje kroki inkwizycji. Najal dwa ostrza. Wszyscy trzej maja zamilknac.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q7done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 739;
    condition = dia_dmtteacher_stext_q7done_condition;
    information = dia_dmtteacher_stext_q7done_info;
    permanent = false;
    description = "Ucho ogluchlo.";
};
func int dia_dmtteacher_stext_q7done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 13) && (StExt_DarkKnight_Kills >= 3); };
func void dia_dmtteacher_stext_q7done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Port znowu twoj. Ale jeden im uciekl - kaznodzieja Ezechiel wsiadl na lodz nim domkneles siec.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Poplynal do Gorniczej Doliny, do wygnancow ze starych kopalni. Buduje tam tlum. Nie skonczyles - skonczysz tam.");
	StExt_DarkKnight_Stage = 14;
	StExt_DarkKnights_GrantBeliarKarma(130);
	StExt_DarkKnights_GrantReward(13000, 25);
	StExt_DarkKnights_Log("Ucho Innosa ogluchlo. Ale kaznodzieja Ezechiel uciekl lodzia do Gorniczej Doliny - tam zbiera wygnancow. Musze za nim.");
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** R3 Q8 "Kaznodzieja w Dolinie" (stage 14 -> 16, GORNICZA DOLINA) ***
//--------------------------------------------------------------
// Pierwszy quest Drogi Beliara poza Khorinis. Zlecenie u Mistrza, cele
// kotwicza sie na graczu przy wejsciu do GD (StExt_DK_GDTrySpawn z ticku).
instance dia_dmtteacher_stext_q8(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 740;
    condition = dia_dmtteacher_stext_q8_condition;
    information = dia_dmtteacher_stext_q8_info;
    permanent = false;
    description = "Ezechiel. Doliny.";
};
func int dia_dmtteacher_stext_q8_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 14); };
func void dia_dmtteacher_stext_q8_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Gornicza Dolina to nie Khorinis. Tam nie ma murow ani straznikow - jest kamien, ork i ludzie, ktorych swiat juz raz wyrzucil. Ezechiel obiecuje im niebo za twoja glowe.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Przejdz przelecz i znajdz go. Bedzie z fanatykami, gleboko, gdzie echo niesie kazania. Zgas go - i niech Dolina zapamieta, czyj to teraz cien.");
	StExt_DarkKnight_Stage = 15;
	StExt_DarkKnight_Kills = 0;
	StExt_DK_GDSpawned = false;
	StExt_DarkKnights_Log("Kaznodzieja Ezechiel zbiera fanatykow w Gorniczej Dolinie. Mam przejsc przelecz, znalezc go w glebi i uciszyc razem z jego owieczkami.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q8done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 741;
    condition = dia_dmtteacher_stext_q8done_condition;
    information = dia_dmtteacher_stext_q8done_info;
    permanent = false;
    description = "Dolina umilkla.";
};
func int dia_dmtteacher_stext_q8done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 15) && (StExt_DarkKnight_Kills >= 3); };
func void dia_dmtteacher_stext_q8done_info()
{
	var int itm;
	StExt_Say(StExt_Str_DarkTeacher_Name, "Kazanie ucichlo w pol slowa. Slyszalem to az tutaj - a raczej Beliar slyszal, i podzielil sie ze mna.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Kosciol wyslal na ciebie ogien, ucho i glos. Zgasiles wszystkie trzy. Odtad to nie ty sie kryjesz - to oni. Wez to ostrze; nasiaklo ich strachem.");
	StExt_DarkKnight_Stage = 16;
	itm = StExt_GenerateUniqueItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H"), (hero.level * 7) + (kapitel * 40) + 340, StExt_ItemRankLegendary, "SPL_INSTANTFIREBALL");
	if (itm > 0)
	{
		StExt_SetGeneratedItemName(itm, "Kazanie Popiolu");
		b_playerfinditem_stext(itm, 1);
	};
	StExt_DarkKnights_GrantBeliarKarma(160);
	StExt_DarkKnights_GrantReward(16000, 30);
	StExt_DarkKnights_Log("Ezechiel martwy, Dolina ucichla. Kosciol Innosa wyslal na mnie ogien, ucho i glos - zgasilem wszystkie trzy. Mistrz dal mi ostrze, ktore nasiaklo ich strachem.");
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** R4 Q9 "Konwoj Swiatla" (stage 16 -> 18, od rozdzialu 4) ***
//--------------------------------------------------------------
// Ofensywa. Kosciol wiezie relikwie traktem - przechwytujesz konwoj, a Mistrz
// plugawi lup. Relikwia = przedmiot misyjny (drop z kapitana), oddany w raporcie.
instance dia_dmtteacher_stext_q9(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 742;
    condition = dia_dmtteacher_stext_q9_condition;
    information = dia_dmtteacher_stext_q9_info;
    permanent = false;
    description = "Czas przestac sie bronic.";
};
func int dia_dmtteacher_stext_q9_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 16) && (kapitel >= 4); };
func void dia_dmtteacher_stext_q9_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Dosc broni. Teraz ty uderzasz w ich wiare. Kosciol wiezie traktem relikwie - kosc jakiegos swietego w zimnej szkatule. Eskorta paladynow, kapitan na czele.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Rozbij konwoj i przynies mi te kosc. Beliar chce ja... przywitac. Pokazemy Innosowi, ze jego swieci tez gnija.");
	StExt_DarkKnight_Stage = 17;
	StExt_DarkKnight_Kills = 0;
	rx_saveparservars();
	wld_insertnpc(bdt_99749_KapitanEskorty, StExt_DK_WP_Q9);
	wld_insertnpc(bdt_99750_PaladynEskorty1, StExt_DK_WP_Q9);
	wld_insertnpc(bdt_99751_PaladynEskorty2, StExt_DK_WP_Q9);
	rx_restoreparservars();
	StExt_DarkKnights_Log("Kosciol wiezie relikwie traktem lesnym. Mam rozbic konwoj, zabic eskorte i przyniesc Mistrzowi relikwie do splugawienia.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_q9done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 743;
    condition = dia_dmtteacher_stext_q9done_condition;
    information = dia_dmtteacher_stext_q9done_info;
    permanent = false;
    description = "Mam ich relikwie.";
};
func int dia_dmtteacher_stext_q9done_condition() { return StExt_DK_IsMember() && (StExt_DarkKnight_Stage == 17) && (StExt_DarkKnight_Kills >= 3) && (npc_hasitems(hero, itmi_stext_innos_relic) >= 1); };
func void dia_dmtteacher_stext_q9done_info()
{
	var int itm;
	StExt_Say(StExt_Str_DarkTeacher_Name, "Daj. (Bierze szkatule bez leku - parzy go, ale sie nie cofa.) Slyszysz ten skwir? To swiety krzyczy, choc umarl dwiescie lat temu.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Splugawiona. Od dzis to relikwia Beliara. A ty - wez to ostrze, wykute z klamki ich kaplicy. Niech otwiera tylko groby.");
	npc_removeinvitems(hero, itmi_stext_innos_relic, 1);
	StExt_DarkKnight_Stage = 18;
	itm = StExt_GenerateUniqueItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"), (hero.level * 7) + (kapitel * 40) + 360, StExt_ItemRankLegendary, "SPL_DARKBALL");
	if (itm > 0)
	{
		StExt_SetGeneratedItemName(itm, "Klucz do Grobow");
		b_playerfinditem_stext(itm, 1);
	};
	StExt_DarkKnights_GrantBeliarKarma(150);
	StExt_DarkKnights_GrantReward(15000, 28);
	StExt_DarkKnights_Log("Konwoj rozbity, relikwia splugawiona. Mistrz nazwal to darem dla Beliara. Dostalem ostrze wykute z klamki ich kaplicy - Klucz do Grobow.");
	ai_stopprocessinfos(self);
};

//===================================================================//
//   Moce Beliara - Nauczyciel uczy AUR zamiast martwych run.        //
//===================================================================//
// Runy Mrocznego Rycerza sa pod stary system magii (nie dzialaja w NB).
// Zamiast nich Nauczyciel przekazuje ISTNIEJACE, dzialajace aury moda,
// podane jako moce Beliara. Koszt = PN (hero.lp) + zloto (itmi_gold),
// wzorzec z LevelingController. Bez dusz - to nie ta gildia. Aury sa
// przedmiotami (kamieniami) - gracz je zaklada uzyciem, jak reszte aur.

func int StExt_DK_CanAfford(var int lpCost, var int goldCost)
{
	if ((StExt_SncMode != 3) && (hero.lp < lpCost)) { ai_printred(concatstrings(StExt_Str_NeedLp, inttostring(lpCost))); return false; };
	if (npc_hasitems(hero, itmi_gold) < goldCost) { ai_printred(concatstrings(StExt_Str_NeedGold, inttostring(goldCost))); return false; };
	return true;
};
func void StExt_DK_Charge(var int lpCost, var int goldCost)
{
	npc_removeinvitems(hero, itmi_gold, goldCost);
	if (StExt_SncMode != 3) { hero.lp -= lpCost; };
};

// --- Gniew Beliara (WarriorTrance: + obrazenia broni bialej) ---
instance dia_dmtteacher_stext_aura_rage(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 720;
    condition = dia_dmtteacher_stext_aura_rage_condition;
    information = dia_dmtteacher_stext_aura_rage_info;
    permanent = true;
    description = "Moc: Gniew Beliara - mocniejsze ciosy bronia (15 PN, 3000 zlota)";
};
func int dia_dmtteacher_stext_aura_rage_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_WarriorTrance) == 0); };
func void dia_dmtteacher_stext_aura_rage_info()
{
	if (!StExt_DK_CanAfford(15, 3000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(15, 3000);
	createinvitems(hero, itau_stext_WarriorTrance, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Gniew Beliara wstepuje w twoje ramie. Zaloz ten kamien, a kazdy cios stanie sie ciezszy.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Gniew Beliara - moc zamknieta w kamieniu aury.");
	ai_stopprocessinfos(self);
};

// --- Cierun Grzechu (Thorns: odbicie obrazen wrecz) ---
instance dia_dmtteacher_stext_aura_thorns(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 721;
    condition = dia_dmtteacher_stext_aura_thorns_condition;
    information = dia_dmtteacher_stext_aura_thorns_info;
    permanent = true;
    description = "Moc: Ciern Grzechu - odbija obrazenia wrecz (15 PN, 3000 zlota)";
};
func int dia_dmtteacher_stext_aura_thorns_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_Thorns) == 0); };
func void dia_dmtteacher_stext_aura_thorns_info()
{
	if (!StExt_DK_CanAfford(15, 3000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(15, 3000);
	createinvitems(hero, itau_stext_Thorns, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Kto cie tknie, sam sie zrani. Beliar nie wybacza dotyku.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Ciern Grzechu - obrazenia wracaja do tego, kto mnie uderzy.");
	ai_stopprocessinfos(self);
};

// --- Skora Grzesznika (IronSkin: + pancerz na bron) ---
instance dia_dmtteacher_stext_aura_iron(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 722;
    condition = dia_dmtteacher_stext_aura_iron_condition;
    information = dia_dmtteacher_stext_aura_iron_info;
    permanent = true;
    description = "Moc: Skora Grzesznika - wiekszy pancerz na bron (20 PN, 4000 zlota)";
};
func int dia_dmtteacher_stext_aura_iron_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_IronSkin) == 0); };
func void dia_dmtteacher_stext_aura_iron_info()
{
	if (!StExt_DK_CanAfford(20, 4000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(20, 4000);
	createinvitems(hero, itau_stext_IronSkin, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Twoja skora stwardnieje jak sumienie grzesznika. Ostrza beda sie na niej lamac.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Skore Grzesznika - twardsza obrona przed broni bialej.");
	ai_stopprocessinfos(self);
};

// --- Zwierciadlo Mroku (MirrorShield: odbicie czarow) ---
instance dia_dmtteacher_stext_aura_mirror(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 723;
    condition = dia_dmtteacher_stext_aura_mirror_condition;
    information = dia_dmtteacher_stext_aura_mirror_info;
    permanent = true;
    description = "Moc: Zwierciadlo Mroku - odbija czary (20 PN, 5000 zlota)";
};
func int dia_dmtteacher_stext_aura_mirror_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_MirrorShield) == 0); };
func void dia_dmtteacher_stext_aura_mirror_info()
{
	if (!StExt_DK_CanAfford(20, 5000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(20, 5000);
	createinvitems(hero, itau_stext_MirrorShield, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Niech ich czary wroca do nich. Mrok jest lustrem, ktore nie klamie.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Zwierciadlo Mroku - szansa na odbicie wrogich czarow.");
	ai_stopprocessinfos(self);
};

// --- Klatwa Beliara (Curser: magiczny DOT przy trafieniu) ---
instance dia_dmtteacher_stext_aura_curse(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 724;
    condition = dia_dmtteacher_stext_aura_curse_condition;
    information = dia_dmtteacher_stext_aura_curse_info;
    permanent = true;
    description = "Moc: Klatwa Beliara - twoje ciosy zra rane w czasie (25 PN, 6000 zlota)";
};
func int dia_dmtteacher_stext_aura_curse_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_Curser) == 0); };
func void dia_dmtteacher_stext_aura_curse_info()
{
	if (!StExt_DK_CanAfford(25, 6000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(25, 6000);
	createinvitems(hero, itau_stext_Curser, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Twoje ciosy zostawia klatwe, ktora zerze od srodka. Beliar lubi powolne konanie.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Klatwe Beliara - trafienia nakladaja niszczaca klatwe.");
	ai_stopprocessinfos(self);
};

// --- Tchnienie Smierci (Death: + obrazenia wobec ludzi/zwierzat/orkow) ---
instance dia_dmtteacher_stext_aura_death(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 725;
    condition = dia_dmtteacher_stext_aura_death_condition;
    information = dia_dmtteacher_stext_aura_death_info;
    permanent = true;
    description = "Moc: Tchnienie Smierci - wiecej obrazen ludziom, zwierzetom i orkom (25 PN, 6000 zlota)";
};
func int dia_dmtteacher_stext_aura_death_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_Death) == 0); };
func void dia_dmtteacher_stext_aura_death_info()
{
	if (!StExt_DK_CanAfford(25, 6000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(25, 6000);
	createinvitems(hero, itau_stext_Death, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Wszystko, co zyje, sluzy Beliarowi jako pozywienie. Twoje ostrze bedzie glodniejsze.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Tchnienie Smierci - wieksze obrazenia wobec zywych.");
	ai_stopprocessinfos(self);
};

// --- Zastep Beliara (Hell: przyzwanie demona-straznika) ---
instance dia_dmtteacher_stext_aura_hell(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 726;
    condition = dia_dmtteacher_stext_aura_hell_condition;
    information = dia_dmtteacher_stext_aura_hell_info;
    permanent = true;
    description = "Moc: Zastep Beliara - przyzywa demona-straznika (35 PN, 10000 zlota)";
};
func int dia_dmtteacher_stext_aura_hell_condition() { return StExt_DK_IsMember() && (npc_hasitems(hero, itau_stext_Hell) == 0); };
func void dia_dmtteacher_stext_aura_hell_info()
{
	if (!StExt_DK_CanAfford(35, 10000)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(35, 10000);
	createinvitems(hero, itau_stext_Hell, 1);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Otworz brame, a stanie przy tobie demon. To najwyzszy dar - i najciezszy ciezar.");
	StExt_DarkKnights_Log("Nauczyciel dal mi Zastep Beliara - u boku walczy przyzwany demon.");
	ai_stopprocessinfos(self);
};

// --- Wzmocnienie (repeatable: + Moc Aury na stale) ---
instance dia_dmtteacher_stext_aura_upgrade(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 727;
    condition = dia_dmtteacher_stext_aura_upgrade_condition;
    information = dia_dmtteacher_stext_aura_upgrade_info;
    permanent = true;
    description = "Wzmocnij moce Beliara - wszystkie aury dzialaja mocniej (10 PN, 2500 zlota)";
};
func int dia_dmtteacher_stext_aura_upgrade_condition() { return StExt_DK_IsMember(); };
func void dia_dmtteacher_stext_aura_upgrade_info()
{
	if (!StExt_DK_CanAfford(10, 2500)) { ai_stopprocessinfos(self); return; };
	StExt_DK_Charge(10, 2500);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_AuraPower, 25, StExt_PcStat_Source_Perm);
	StExt_Say(StExt_Str_DarkTeacher_Name, "Twoje aury pija wiecej mroku. Kazda z nich uderza teraz mocniej.");
	ai_printbonus("Moc Aury +25");
	ai_stopprocessinfos(self);
};
