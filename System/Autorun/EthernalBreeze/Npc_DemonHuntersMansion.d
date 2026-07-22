//===================================================================//
//   Wojna Beliara z Lowcami Demonow (GIL_DMT vs gildia lowcow)      //
//===================================================================//
// Jako Mroczny Rycerz (sluga Beliara) gracz jest w realnej wojnie z Lowcami
// Demonow (kanon Returninga: Mroczny Rycerz = ich wrog w kaplicy, przyzwany
// demon = pomiot Beliara).
//
// DWOREK: quest odpala ICH WLASNY bazowy event (RX_CALLBACK_MANSION_* +
// RX_CALLBACK_DH_GOTOMANSION) - dworek za farma Onara zostaje odrestaurowany,
// a lowcy sami sie tam sciagaja, dokladnie jak w ich watku. Wolane z TICKU i PO
// NAZWIE (ModController.d) - z dialogu zawieszalo rozmowe, a wprost grozilo
// parse-failem przy nieznanej arnosci. Do tego nasza obstawa (4 lowcow + imienny
// Belmond ponizej), zeby wyciecie gniazda nie bylo trywialne.
//
// PRAWDZIWI lowcy (zero kopii): wojna gildii przez wld_setguildattitude sprawia,
// ze REALNE NPC lowcow atakuja gracza i sa zabijalni - realne konsekwencje.
// Gildia lowcow NIE jest zgadywana - odczytujemy ja w runtime z DH_MAINNPC.guild
// (gracz-Rycerz ma guild=16, nie GIL_DMT=11 - patrz Dark Knights).

const string StExt_DH_Topic = "Krucjata Beliara";
const string StExt_DH_WP = "NW_BIGFARM_FOREST_01";	// dworek za farma Onara (las nad jeziorem)

//--------------------------------------------------------------
// *** Dodatkowi lowcy - zeby wyciecie gniazda nie bylo trywialne ***
//--------------------------------------------------------------
// Bazowy event sciaga do dworku PRAWDZIWYCH lowcow; ci ponizej to nasza obstawa
// dorzucona na wyrazna prosbe usera. Wzorzec 1:1 z Npc_DarkKnights: rutyna (bez
// niej NPC to posag), gil_bdt (zabijalni), wizual lowcy, bron do PLECAKA przez
// createinvitems - nigdy npc_equipitem na swiezej instancji (klasa crashu).
func void rtn_start_99790() { ta_stand_guarding(8, 0, 20, 0, StExt_DH_WP); ta_stand_guarding(20, 0, 8, 0, StExt_DH_WP); };
func void rtn_start_99791() { ta_stand_guarding(8, 0, 20, 0, StExt_DH_WP); ta_stand_guarding(20, 0, 8, 0, StExt_DH_WP); };
func void rtn_start_99792() { ta_stand_guarding(8, 0, 20, 0, StExt_DH_WP); ta_stand_guarding(20, 0, 8, 0, StExt_DH_WP); };
func void rtn_start_99793() { ta_stand_guarding(8, 0, 20, 0, StExt_DH_WP); ta_stand_guarding(20, 0, 8, 0, StExt_DH_WP); };
func void rtn_start_99794() { ta_stand_guarding(8, 0, 20, 0, StExt_DH_WP); ta_stand_guarding(20, 0, 8, 0, StExt_DH_WP); };

func void StExt_DH_ExtraSetup(var c_npc slf, var int tier)
{
	var int bsNb;
	var int twWeap;
	b_setattributestochapter(slf, kapitel);
	slf.attribute[1] = 2500 + (kapitel * 2000) + (hero.level * 200) + (tier * 4000);
	slf.attribute[0] = slf.attribute[1];
	bsNb = slf.attribute[4];
	slf.attribute[4] = 90 + (kapitel * 25) + (tier * 20) + (hero.level * 2);
	if (slf.attribute[4] < bsNb) { slf.attribute[4] = bsNb; };
	bsNb = slf.attribute[5];
	slf.attribute[5] = 90 + (kapitel * 25) + (tier * 20) + (hero.level * 2);
	if (slf.attribute[5] < bsNb) { slf.attribute[5] = bsNb; };
	slf.level = 10 + (kapitel * 5) + tier + (hero.level / 2);
	b_setfightskills(slf, StExt_ValidateValueRange(60 + (kapitel * 8) + (tier * 5), 60, 100));
	slf.protection[1] = 70 + (kapitel * 25) + (tier * 15);
	slf.protection[2] = 70 + (kapitel * 25) + (tier * 15);
	slf.protection[6] = 70 + (kapitel * 25) + (tier * 15);
	slf.protection[3] = 50 + (kapitel * 18);
	slf.protection[5] = 50 + (kapitel * 18);
	twWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"), (hero.level * 6) + (kapitel * 35) + (tier * 60));
	if (twWeap > 0) { createinvitems(slf, twWeap, 1); };
};

instance bdt_99790_LowcaDemonow1(npc_default)
{
    name = "Lowca Demonow"; guild = gil_bdt; id = 99790; voice = 11; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99790_LowcaDemonow1, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_demonhunter_01_npc);
    mdl_applyoverlaymds(bdt_99790_LowcaDemonow1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99790_LowcaDemonow1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99790;
    StExt_DH_ExtraSetup(bdt_99790_LowcaDemonow1, 1);
};
instance bdt_99791_LowcaDemonow2(npc_default)
{
    name = "Lowca Demonow"; guild = gil_bdt; id = 99791; voice = 12; flags = 0; npctype = npctype_main; level = 25;
    b_setnpcvisual(bdt_99791_LowcaDemonow2, male, "Hum_Head_Bald", face_n_balor, bodytex_n, itar_demonhunter_01_npc);
    mdl_applyoverlaymds(bdt_99791_LowcaDemonow2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99791_LowcaDemonow2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99791;
    StExt_DH_ExtraSetup(bdt_99791_LowcaDemonow2, 1);
};
instance bdt_99792_LowcaDemonow3(npc_default)
{
    name = "Starszy Lowca"; guild = gil_bdt; id = 99792; voice = 10; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99792_LowcaDemonow3, male, "Hum_Head_Fighter", face_n_harlok, bodytex_n, itar_demonhunter_01_npc);
    mdl_applyoverlaymds(bdt_99792_LowcaDemonow3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99792_LowcaDemonow3); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99792;
    StExt_DH_ExtraSetup(bdt_99792_LowcaDemonow3, 2);
};
instance bdt_99793_LowcaDemonow4(npc_default)
{
    name = "Starszy Lowca"; guild = gil_bdt; id = 99793; voice = 13; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99793_LowcaDemonow4, male, "Hum_Head_Bald", face_n_deadpal, bodytex_n, itar_demonhunter_01_npc);
    mdl_applyoverlaymds(bdt_99793_LowcaDemonow4, "Humans_Militia.mds");
    b_givenpctalents(bdt_99793_LowcaDemonow4); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99793;
    StExt_DH_ExtraSetup(bdt_99793_LowcaDemonow4, 2);
};

// BELMOND - imienny lowca w ICH najlepszej zbroi. User: bazowy dowodca lowcow jest
// za slaby, wiec prawdziwym ostrzem gniazda jest ten NPC (tier 5 = mini-boss).
instance bdt_99794_Belmond(npc_default)
{
    name = "Belmond"; guild = gil_bdt; id = 99794; voice = 10; flags = 0; npctype = npctype_main; level = 40;
    b_setnpcvisual(bdt_99794_Belmond, male, "Hum_Head_Fighter", face_n_balor, bodytex_n, itar_dht_end_6_forged);
    mdl_applyoverlaymds(bdt_99794_Belmond, "Humans_Militia.mds");
    b_givenpctalents(bdt_99794_Belmond); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99794;
    StExt_DH_ExtraSetup(bdt_99794_Belmond, 5);
};

// Belmond dropi LEGENDARNY naszyjnik (rank 5). Wzorzec StExt_ZakonBoss_GiveUnique:
// generujemy unikat, nadajemy imie i wrzucamy do jego ekwipunku, wiec gracz go zlupi.
func void ai_ondead_bdt_99794_Belmond()
{
	var int itm;
	var c_item amu;
	itm = StExt_GenerateUniqueItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Amulet"), (hero.level * 7) + (kapitel * 40) + 380, StExt_ItemRankLegendary, "SPL_DARKBALL");
	if (itm > 0)
	{
		StExt_SetGeneratedItemName(itm, "Kolia Zrodzonego z Mroku");
		StExt_CreateRandomItem(self, itm, 1, false);
		// Bonus UNIKATOWY (id 49 = +10% obrazen demonom). Pula losowana to 41..48,
		// a DLL przepuszcza 49 nietkniete, wiec skan bizuterii go nie rerolluje.
		amu = npc_getitembyid(self, itm);
		if (hlp_isvaliditem(amu)) { StExt_SetItemProperty(amu, StExt_ItemProp_LegendBonus, StExt_LegendBonus_DemonBane); };
		printscreencolor("Swiatlo Belmonda zgaslo - cos po nim zostalo.", 62, 2, StExt_DefaultFont, 3, StExt_Color_Header);
	};
};

// Wojna gildii (StExt_DH_SetGuildWar) zdefiniowana w ModController.d (parse-order:
// wolana z CheckGatedSpawns w pliku 54, ten plik = 76). Tu tylko ja wolamy.

// Spawn obstawy + Belmonda. Wolane z TICKU przez StExt_InitializeCallback PO NAZWIE -
// tick siedzi w pliku 54, a te instancje w 76, wiec bezposrednie wolanie = parse-fail.
// Dzieki temu obstawa pojawi sie takze wtedy, gdy zlecenie bylo przyjete WCZESNIEJ
// (dialog przyjecia jest jednorazowy i juz sie nie odpali).
// IDEMPOTENTNY: kazdy NPC wstawiany tylko gdy NIE istnieje w swiecie. Dzieki temu
// mozna go wolac wielokrotnie (np. po zdjeciu latcha wskazowka) bez duplikatow -
// i naprawia sejwy, w ktorych latch ustawil sie przy starej wersji, a obstawa
// nigdy nie weszla (zgloszenie: "nie ma Belmonda").
func void StExt_DH_SpawnExtras()
{
	var c_npc n;
	rx_saveparservars();
	n = hlp_getnpc(bdt_99790_LowcaDemonow1); if (!hlp_isvalidnpc(n)) { wld_insertnpc(bdt_99790_LowcaDemonow1, StExt_DH_WP); };
	n = hlp_getnpc(bdt_99791_LowcaDemonow2); if (!hlp_isvalidnpc(n)) { wld_insertnpc(bdt_99791_LowcaDemonow2, StExt_DH_WP); };
	n = hlp_getnpc(bdt_99792_LowcaDemonow3); if (!hlp_isvalidnpc(n)) { wld_insertnpc(bdt_99792_LowcaDemonow3, StExt_DH_WP); };
	n = hlp_getnpc(bdt_99793_LowcaDemonow4); if (!hlp_isvalidnpc(n)) { wld_insertnpc(bdt_99793_LowcaDemonow4, StExt_DH_WP); };
	n = hlp_getnpc(bdt_99794_Belmond);       if (!hlp_isvalidnpc(n)) { wld_insertnpc(bdt_99794_Belmond, StExt_DH_WP); };
	rx_restoreparservars();
	ai_printbonus("Lowcy demonow obstawili dworek. Belmond jest wsrod nich.");
};

//--------------------------------------------------------------
// *** Dziennik (guarded wrapper) ***
//--------------------------------------------------------------
func void StExt_DH_Log(var string entry)
{
	if (!StExt_DH_TopicMade)
	{
		Log_CreateTopic(StExt_DH_Topic, LOG_MISSION);
		Log_SetTopicStatus(StExt_DH_Topic, LOG_RUNNING);
		StExt_DH_TopicMade = true;
	};
	B_LogEntry(StExt_DH_Topic, entry);
};

// IDENTYFIKACJA LOWCOW (historia): zgadywanie nazw instancji zawiodlo (wszystkie -1),
// dopiero ekstrakcja CALYCH tokenow z VDF dala prawdziwe: DH_MAINNPC, DH_NPCSEVERIN,
// DH_VILANDNPC, DH_SLD_MERCENARY_01/02 (kazda potwierdzona handlerem AI_ONDEAD_*).
// (diagnostyka usunieta - psula immersje).


//--------------------------------------------------------------
// *** Zlecenie: wybij lowcow (szkielet, do finalizacji po diagnostyku) ***
//--------------------------------------------------------------
instance dia_dmtteacher_stext_dhhunt(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 732;
    condition = dia_dmtteacher_stext_dhhunt_condition;
    information = dia_dmtteacher_stext_dhhunt_info;
    permanent = false;
    description = "Lowcy demonow - gdzie ich znajde?";
};
func int dia_dmtteacher_stext_dhhunt_condition() { return StExt_DK_IsMember() && (StExt_DH_Stage == 0); };
func void dia_dmtteacher_stext_dhhunt_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Lowcy demonow poluja na wszystko, co nosi cien Beliara - a ty niesiesz go jak sztandar.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Odbudowali stary dworek za farma Onara, w lesie nad jeziorem, i wlasnie sie tam sciagaja. Wytnij to gniazdo - ich mistrz ma pasc pierwszy.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "I strzez sie jednego. Ich dowodca to tylko glos, ale Belmond to ostrze - jego zbroja pamieta wiecej demonow niz ty ludzi. Przy nim nosi cos, co warto zabrac.");
	StExt_DH_SetGuildWar();
	StExt_DH_Stage = 1;
	// Obstawa NIE jest spawnowana tutaj - robi to tick (StExt_DH_TriggerExtras),
	// zeby zadzialala takze u graczy, ktorzy zlecenie przyjeli wczesniej.
	StExt_DH_Log("Lowcy demonow odbudowali dworek za farma Onara i sciagaja tam sily. Ich mistrz i jego ludzie maja zginac. Najgrozniejszy jest Belmond - nosi przy sobie cos cennego.");
	ai_stopprocessinfos(self);
};

instance dia_dmtteacher_stext_dhhunt_done(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 733;
    condition = dia_dmtteacher_stext_dhhunt_done_condition;
    information = dia_dmtteacher_stext_dhhunt_done_info;
    permanent = false;
    description = "Gniazdo lowcow wyrzniete.";
};
// Detekcja na PRAWDZIWYM mistrzu lowcow: DH_MAINNPC to potwierdzona instancja NPC
// (ma AI_ONDEAD_DH_MAINNPC). Nazwe znaleziono ekstrakcja calych tokenow z VDF.
func int dia_dmtteacher_stext_dhhunt_done_condition()
{
	var c_npc dhm;
	if (!StExt_DK_IsMember() || (StExt_DH_Stage != 1)) { return false; };
	dhm = hlp_getnpc(DH_MAINNPC);
	return hlp_isvalidnpc(dhm) && npc_isdead(dhm);
};
func void dia_dmtteacher_stext_dhhunt_done_info()
{
	var int itm;
	StExt_Say(StExt_Str_DarkTeacher_Name, "Ich mistrz martwy, gniazdo wyrzniete. Krzyz nie ochronil ich przed Beliarem.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Wez ich wlasna kusze. Przekulem ja w ogniu - teraz pije swiatlo, ktoremu sluzyla.");
	StExt_DH_Stage = 2;
	// Legendarna nagroda: kusza lowcow przekuta dla Beliara (wzorzec GiveUnique).
	itm = StExt_GenerateUniqueItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_CBowWeapon"), (hero.level * 7) + (kapitel * 40) + 320, StExt_ItemRankLegendary, "SPL_DARKBALL");
	if (itm > 0)
	{
		StExt_SetGeneratedItemName(itm, "Zdrada Swiatla");
		b_playerfinditem_stext(itm, 1);
	};
	StExt_DarkKnights_GrantBeliarKarma(150);
	StExt_DarkKnights_GrantReward(8000, 15);
	StExt_DH_Log("Mistrz lowcow martwy, gniazdo w dworku wyrzniete. Ich kusza pije teraz swiatlo.");
	Log_SetTopicStatus(StExt_DH_Topic, LOG_SUCCESS);
	ai_stopprocessinfos(self);
};

// Powtarzalna wskazowka - przypomina gdzie sa i dospawnowuje brakujacych lowcow.
// Zdejmuje latch, wiec tick zwola ich ponownie (AI_Teleport, poza dialogiem).
instance dia_dmtteacher_stext_dhhint(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 734;
    condition = dia_dmtteacher_stext_dhhint_condition;
    information = dia_dmtteacher_stext_dhhint_info;
    permanent = true;
    description = "Gdzie sa ci lowcy?";
};
func int dia_dmtteacher_stext_dhhint_condition() { return StExt_DK_IsMember() && (StExt_DH_Stage == 1); };
func void dia_dmtteacher_stext_dhhint_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "W dworku za farma Onara, w lesie nad jeziorem. Tam sie sciagneli - idz i skoncz to.");
	// Spawn obstawy BEZPOSREDNIO tutaj - to jedyna sciezka o ktorej WIEMY, ze
	// dziala (questy Drogi Beliara spawnia cele w dialogach i user je gral).
	// Callback z ticku zawodzil (Belmond nie wchodzil mimo dwoch podejsc);
	// SpawnExtras jest idempotentny, wiec wielokrotne klikniecie = zero duplikatow.
	StExt_DH_SpawnExtras();
	ai_stopprocessinfos(self);
};
