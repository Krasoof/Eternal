
//===================================================================//
//		Glosy Wiezy - R1: Bezimienny Kowal (hub recruit)			 //
//===================================================================//
// Design: docs/DESIGN_HubSouls.md. DS-style: kowal, ktory oddal swoje
// imie za ogien, co nie gasnie - i zapomnial, kim byl. Znajdujesz go
// w ruinach wiezy; werbujesz do huba; usluga = przekuwanie broni.
// Watek: 3 okruchy imienia (StExt_SmithFragments) -> tier uslugi.
// Dialogi przez StExt_Say (natywne OU + dubbing ElevenLabs: Harry).
// Linie gracza: sentinel "HERO" (napisy bez glosu - kanon).
// Watek Ysolde (ujawnienie dlugu) zostaje w LAB do czasu promocji romansu.
// PARSE ORDER: instancja -> routine -> funkcje uslugi -> dialogi.

instance none_99760_HubSmith(npc_default)
{
    name = "Bezimienny Kowal";
    guild = gil_none;
    id = 99760;
    voice = 11;
    flags = 0;
    npctype = npctype_main;
    level = 30;
    attribute[atr_hitpoints_max] = 8000;
    attribute[atr_hitpoints] = 8000;
    b_setnpcvisual(none_99760_HubSmith, male, "Hum_Head_FatBald", face_n_tough_okyl, bodytex_n, itar_smith);
    mdl_setmodelfatness(none_99760_HubSmith, 1.0);
    mdl_applyoverlaymds(none_99760_HubSmith, "Humans_Tired.mds");
    b_givenpctalents(none_99760_HubSmith);
    daily_routine = rtn_none_99760_HubSmith;
};
func void rtn_none_99760_HubSmith()
{
    // Kowal stoi w hubie Zakonu (oboz na wybrzezu, StExt_ZakonHub_Wp =
    // SHORE_MONSTER_03_01) - razem z Mistrzem po jego relokacji. Na starym
    // sejwie, gdzie Kowal spawnowal sie na 02_01, ta rutyna sprowadzi go
    // do obozu po wczytaniu. ta_smith_sharp bez kowadla opada do stania.
    ta_smith_sharp(8, 0, 22, 0, StExt_ZakonHub_Wp);
    ta_smith_sharp(22, 0, 8, 0, StExt_ZakonHub_Wp);
};

//--------------------------------------------------------------
// *** Usluga: przekucie (reroll) dobytej broni ***
//--------------------------------------------------------------
func int StExt_HubSmith_Cost()
{
	// tanieje z odzyskanym imieniem (fragmenty), rosnie z rozdzialem
	return (3000 + (kapitel * 1500)) - (StExt_SmithFragments * 800);
};

// Przekucie z WYBOREM ZYWIOLU. element = StExt_MasteryIndex_Fire..Death
// albo StExt_Null (bez zywiolu - samo przelosowanie bonusow).
// Zywiol nakladamy na ROZSZERZENIE nowej instancji PRZED createinvitems
// (kontrakt setterow: ApplyItemExtension nalozy je przy tworzeniu itemu).
func void StExt_HubSmith_Reforge(var int element)
{
	var c_item weap;
	var int cost;
	var int power;
	var int newId;
	var int elemSpell;

	if (npc_hasreadiedmeleeweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };
	if (!hlp_isvaliditem(weap))
	{
		StExt_Say("Bezimienny Kowal", "Dobadz zelazo, ktore mam przekuc. Mlot nie bije w powietrze.");
		ai_stopprocessinfos(self);
		return;
	};

	cost = StExt_HubSmith_Cost();
	if (npc_hasitems(hero, itmi_gold) < cost)
	{
		StExt_Say("Bezimienny Kowal", concatstrings(concatstrings("Ogien kosztuje. ", inttostring(cost)), " sztuk zlota - albo odejdz."));
		ai_stopprocessinfos(self);
		return;
	};
	if (npc_hasitems(hero, itmi_stext_bosssoul) < StExt_HubSmith_SoulCost)
	{
		StExt_Say("Bezimienny Kowal", concatstrings(concatstrings("Sam ogien nie wystarczy. Przynies ", inttostring(StExt_HubSmith_SoulCost)), " dusz - one karmia palenisko."));
		ai_stopprocessinfos(self);
		return;
	};

	// moc rosnie z odzyskanym imieniem: pusty kowal kuje slabo, pelny - legendy
	power = (hero.level * 6) + (kapitel * 25) + (StExt_SmithFragments * 40);
	// BUFF FIZYKA: rezygnacja z zywiolu = mocniejsza stal. Kowal wklada cala
	// moc rytualu w samo ostrze, wiec baza rolluje sie duzo wyzej.
	if (element == StExt_Null) { power += StExt_GetPercentFromValue(power, StExt_HubSmith_PhysPowerBonus); };
	// ZWYKLA (niemagiczna) bron: enchant (baza->magic). JUZ magiczna: reroll
	// (RerollInPlace wymaga istniejacej ekstensji - na golej broni zwracalo
	// <=0 i "nic nie przekuwa"). To byl powod zgloszenia.
	if (StExt_ItemHasExtension(weap)) { newId = StExt_RerollItemInPlace(weap, power); }
	else { newId = StExt_EnchantItemInPlace(weap, power); };
	if (newId <= 0)
	{
		StExt_Say("Bezimienny Kowal", "Tego zelaza nie przekuje. Ono juz wie, czym jest.");
		ai_stopprocessinfos(self);
		return;
	};

	// BUG-FIX: dotad newId bylo liczone i IGNOROWANE - gracz placil, bron
	// sie nie zmieniala. Teraz pelny swap: stara out -> nowa in. NIE zakladamy
	// automatycznie: npc_equipitem na SWIEZO wygenerowanej instancji
	// dynamicznej (STEXT_GENERATED_*) w trakcie DIALOGU psuje stan konwersacji
	// i crashuje (access violation 3F800000 = 1.0f jako adres funkcji;
	// stara mina z broni bossow). Gracz zaklada z plecaka.
	StExt_Trace(concatstrings(concatstrings("KOWAL przekucie stara=", inttostring(hlp_getinstanceid(weap))), concatstrings(" -> nowa=", inttostring(newId))));

	// WYBRANY ZYWIOL: wtapiany w nowe ostrze zanim item powstanie.
	// StExt_RollElementSpell losuje konkretny czar z puli danego zywiolu,
	// wiec dwa ognisty miecze nie sa identyczne.
	if (element != StExt_Null)
	{
		elemSpell = StExt_RollElementSpell(element);
		if (elemSpell > 0) { StExt_SetGeneratedItemElement(newId, elemSpell, power); };
	};

	npc_removeinvitems(hero, itmi_gold, cost);
	npc_removeinvitems(hero, itmi_stext_bosssoul, StExt_HubSmith_SoulCost);
	npc_removeinvitems(hero, hlp_getinstanceid(weap), 1);
	b_playerfinditem_stext(newId, 1);
	if (element != StExt_Null)
	{
		StExt_Say("Bezimienny Kowal", "Zywiol siedzi w stali. Odbierz zelazo z sakwy i zaloz je.");
		ai_printbonus(concatstrings("Zelazo przyjelo zywiol: ", StExt_ElementBuildup_Name(element)));
	}
	else
	{
		StExt_Say("Bezimienny Kowal", "Zadnej magii - sama stal, kuta do konca. Takie ostrze nie zawodzi. Odbierz je z sakwy.");
		ai_printbonus("Ostrze przekute - stal mocniejsza niz zwykle.");
	};
	ai_stopprocessinfos(self);
};

// Menu wyboru zywiolu (parametrowe funkcje info_addchoice musza byc bezargumentowe)
func void StExt_HubSmith_Reforge_None()     { StExt_HubSmith_Reforge(StExt_Null); };
func void StExt_HubSmith_Reforge_Fire()     { StExt_HubSmith_Reforge(StExt_MasteryIndex_Fire); };
func void StExt_HubSmith_Reforge_Ice()      { StExt_HubSmith_Reforge(StExt_MasteryIndex_Ice); };
func void StExt_HubSmith_Reforge_Electric() { StExt_HubSmith_Reforge(StExt_MasteryIndex_Electric); };
func void StExt_HubSmith_Reforge_Air()      { StExt_HubSmith_Reforge(StExt_MasteryIndex_Air); };
func void StExt_HubSmith_Reforge_Earth()    { StExt_HubSmith_Reforge(StExt_MasteryIndex_Earth); };
func void StExt_HubSmith_Reforge_Light()    { StExt_HubSmith_Reforge(StExt_MasteryIndex_Light); };
func void StExt_HubSmith_Reforge_Dark()     { StExt_HubSmith_Reforge(StExt_MasteryIndex_Dark); };
func void StExt_HubSmith_Reforge_Death()    { StExt_HubSmith_Reforge(StExt_MasteryIndex_Death); };

//--------------------------------------------------------------
// *** Spotkanie / werbunek (DS) ***
//--------------------------------------------------------------
instance dia_none_99760_HubSmith_Meet(c_info)
{
    npc = none_99760_HubSmith;
    nr = 1;
    condition = dia_none_99760_HubSmith_Meet_condition;
    information = dia_none_99760_HubSmith_Meet_info;
    permanent = false;
    important = true;
    description = "Kim jestes?";
};
func int dia_none_99760_HubSmith_Meet_condition() { return (StExt_Hub_Smith == 0); };
func void dia_none_99760_HubSmith_Meet_info()
{
	StExt_Say("Bezimienny Kowal", "Nie pytaj o imie. Zostawilem je w ogniu, dawno temu. Ogien go nie oddal.");
	StExt_Say("HERO", "Kujesz w ruinie, dla umarlych?");
	StExt_Say("Bezimienny Kowal", "Kuje, bo rece pamietaja to, czego glowa nie. Mlot wie wiecej ode mnie.");
	StExt_Say("Bezimienny Kowal", "Ty smierdzisz duszami, wedrowcze. Tyle ich nosisz... a wciaz ci malo.");
	StExt_Hub_Smith = 1;
	ai_printbonus("Dziennik: Bezimienny Kowal - kuje w ruinach wiezy. Moze przydac sie Zakonowi.");
	ai_stopprocessinfos(self);
};

// Werbunek do huba
instance dia_none_99760_HubSmith_Recruit(c_info)
{
    npc = none_99760_HubSmith;
    nr = 2;
    condition = dia_none_99760_HubSmith_Recruit_condition;
    information = dia_none_99760_HubSmith_Recruit_info;
    permanent = false;
    description = "Kuj dla mnie. W wiezy jest ogien.";
};
func int dia_none_99760_HubSmith_Recruit_condition() { return (StExt_Hub_Smith == 1); };
func void dia_none_99760_HubSmith_Recruit_info()
{
	StExt_Say("HERO", "Chodz do wiezy. Bede ci przynosil dusze, ty bedziesz kul.");
	StExt_Say("Bezimienny Kowal", "Dusze... tak. Moze wsrod nich znajde okruch tego, czym bylem. Pojde. Ale niczego nie obiecuje.");
	StExt_Hub_Smith = 2;
	ai_printbonus("Bezimienny Kowal przystal do Zakonu. Kuje przy wiezy na wybrzezu.");
	ai_stopprocessinfos(self);
};

// Usluga przekucia (dostepna po werbunku)
instance dia_none_99760_HubSmith_Reforge(c_info)
{
    npc = none_99760_HubSmith;
    nr = 3;
    condition = dia_none_99760_HubSmith_Reforge_condition;
    information = dia_none_99760_HubSmith_Reforge_info;
    permanent = true;
    description = "Przekuj moja bron.";
};
func int dia_none_99760_HubSmith_Reforge_condition() { return (StExt_Hub_Smith >= 2); };
func void StExt_HubSmith_ReforgeExit() { info_clearchoices(dia_none_99760_HubSmith_Reforge); ai_stopprocessinfos(self); };
func void dia_none_99760_HubSmith_Reforge_info()
{
	StExt_Say("Bezimienny Kowal", concatstrings(concatstrings("Zelazo przyjmie jeden zywiol. Wybierz, ktory - i placz ", inttostring(StExt_HubSmith_Cost())), " sztuk zlota."));
	info_clearchoices(dia_none_99760_HubSmith_Reforge);
	info_addchoice(dia_none_99760_HubSmith_Reforge, dialog_back, StExt_HubSmith_ReforgeExit);
	info_addchoice(dia_none_99760_HubSmith_Reforge, "Bez zywiolu - tylko przekuj", StExt_HubSmith_Reforge_None);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Death, StExt_HubSmith_Reforge_Death);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Dark, StExt_HubSmith_Reforge_Dark);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Light, StExt_HubSmith_Reforge_Light);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Earth, StExt_HubSmith_Reforge_Earth);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Air, StExt_HubSmith_Reforge_Air);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Electric, StExt_HubSmith_Reforge_Electric);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Ice, StExt_HubSmith_Reforge_Ice);
	info_addchoice(dia_none_99760_HubSmith_Reforge, StExt_Str_El_Fire, StExt_HubSmith_Reforge_Fire);
};

// Wskazowka o okruchach imienia (hak pod questy-fragmenty)
instance dia_none_99760_HubSmith_Fragments(c_info)
{
    npc = none_99760_HubSmith;
    nr = 4;
    condition = dia_none_99760_HubSmith_Fragments_condition;
    information = dia_none_99760_HubSmith_Fragments_info;
    permanent = true;
    description = "Kim byles, zanim oddales imie?";
};
func int dia_none_99760_HubSmith_Fragments_condition() { return (StExt_Hub_Smith >= 2) && (StExt_SmithFragments < 3); };
func void dia_none_99760_HubSmith_Fragments_info()
{
	if (StExt_SmithFragments == 0)
	{
		StExt_Say("Bezimienny Kowal", "Nie wiem. Zostaly po mnie trzy rzeczy... rozsypane tam, gdzie umarli. Znajdz je, a moze i mnie znajdziesz.");
	}
	else
	{
		StExt_Say("Bezimienny Kowal", "Cos wraca. Twarz przy kowadle. Jeszcze dwa... jeszcze jeden... Przynies reszte.");
	};
	ai_printbonus(concatstrings("Okruchy imienia Kowala: ", concatstrings(inttostring(StExt_SmithFragments), "/3")));
	ai_stopprocessinfos(self);
};

// --- Sprzedaz zaleglych zbroi rozdzialowych (tylko te z gotowym modelem;
//     warianty bez modelu crashuja przy zalozeniu = pomijamy). Ceny wysokie
//     (50k wczesne / 100k pozne rozdzialy), anti-abuse. Bez dusz. ---
func void StExt_HubSmith_BuyArmor(var int armorId, var int price)
{
	if (npc_hasitems(hero, itmi_gold) < price) { ai_printred(concatstrings(StExt_Str_NeedGold, inttostring(price))); return; };
	npc_removeinvitems(hero, itmi_gold, price);
	createinvitems(hero, armorId, 1);
	StExt_Say("Bezimienny Kowal", "Bierz. Kuta nie moja reka, ale posluzy. Range podbijesz gdzie indziej.");
};
func void StExt_HubSmith_Buy_NovDark()  { StExt_HubSmith_BuyArmor(itar_stext_zakon_novdark, 50000); };
func void StExt_HubSmith_Buy_Royal()    { StExt_HubSmith_BuyArmor(itar_stext_zakon_royal, 50000); };
func void StExt_HubSmith_Buy_Templar()  { StExt_HubSmith_BuyArmor(itar_stext_zakon_templar, 100000); };
func void StExt_HubSmith_Buy_Guardian() { StExt_HubSmith_BuyArmor(itar_stext_zakon_guardian, 100000); };
func void StExt_HubSmith_Buy_Rustlord() { StExt_HubSmith_BuyArmor(itar_stext_zakon_rustlord, 100000); };
func void StExt_HubSmith_Buy_Crusader() { StExt_HubSmith_BuyArmor(itar_stext_zakon_crusader, 100000); };
func void StExt_HubSmith_BuyExit() { info_clearchoices(dia_none_99760_HubSmith_Buy); ai_stopprocessinfos(self); };

instance dia_none_99760_HubSmith_Buy(c_info)
{
    npc = none_99760_HubSmith;
    nr = 5;
    condition = dia_none_99760_HubSmith_Buy_condition;
    information = dia_none_99760_HubSmith_Buy_info;
    permanent = true;
    description = "Masz na zbyciu jakas zbroje?";
};
func int dia_none_99760_HubSmith_Buy_condition() { return (StExt_Hub_Smith >= 2); };
func void dia_none_99760_HubSmith_Buy_info()
{
	StExt_Say("Bezimienny Kowal", "Naklulem tego przez lata. Zaplac uczciwie, a wybierzesz, co chcesz.");
	info_clearchoices(dia_none_99760_HubSmith_Buy);
	info_addchoice(dia_none_99760_HubSmith_Buy, dialog_back, StExt_HubSmith_BuyExit);
	info_addchoice(dia_none_99760_HubSmith_Buy, "Zbroja Krzyzowca - 100000 zlota", StExt_HubSmith_Buy_Crusader);
	info_addchoice(dia_none_99760_HubSmith_Buy, "Zbroja Zardzewialego Lorda - 100000 zlota", StExt_HubSmith_Buy_Rustlord);
	info_addchoice(dia_none_99760_HubSmith_Buy, "Zbroja Straznika Chaosu - 100000 zlota", StExt_HubSmith_Buy_Guardian);
	info_addchoice(dia_none_99760_HubSmith_Buy, "Zbroja Templariusza - 100000 zlota", StExt_HubSmith_Buy_Templar);
	info_addchoice(dia_none_99760_HubSmith_Buy, "Zbroja Oficera - 50000 zlota", StExt_HubSmith_Buy_Royal);
	info_addchoice(dia_none_99760_HubSmith_Buy, "Mroczny Kaftan - 50000 zlota", StExt_HubSmith_Buy_NovDark);
};

//===================================================================//
//   Lancuch "Imie Kowala" - R3: "Mlot, ktory pamieta" (fragment 1)  //
//===================================================================//
// Trzy okruchy imienia (StExt_SmithFragments) dostaja wreszcie QUESTY -
// dialog nr 4 wyzej byl tylko hakiem. Fragmenty mechanicznie wzmacniaja
// kuznie (koszt/moc przekucia), wiec nagroda jest sama usluga.
// Stage lancucha: StExt_SmithQ_Stage (GlobalVars). R3: 0 -> 1 -> 2.

const string StExt_Topic_Smith = "Imie Kowala";
func void StExt_Smith_Log(var string entry)
{
	if (!StExt_SmithTopicMade)
	{
		Log_CreateTopic(StExt_Topic_Smith, LOG_MISSION);
		Log_SetTopicStatus(StExt_Topic_Smith, LOG_RUNNING);
		StExt_SmithTopicMade = true;
	};
	B_LogEntry(StExt_Topic_Smith, entry);
};

// Grasanci z ruin - zwykli ludzie (BEZ konwersji potworow z ZakonBoss_Setup;
// DK TargetSetup parsuje sie PO tym pliku, stad lokalna kopia formul).
func void StExt_HubSmith_ThugSetup(var c_npc slf, var int tier)
{
	var int bsNb;
	var int twWeap;
	b_setattributestochapter(slf, kapitel);
	slf.attribute[1] = 3000 + (kapitel * 2500) + (hero.level * 250) + (tier * 6000);
	slf.attribute[0] = slf.attribute[1];
	bsNb = slf.attribute[4];
	slf.attribute[4] = 100 + (kapitel * 30) + (tier * 20) + (hero.level * 2);
	if (slf.attribute[4] < bsNb) { slf.attribute[4] = bsNb; };
	bsNb = slf.attribute[5];
	slf.attribute[5] = 100 + (kapitel * 30) + (tier * 20) + (hero.level * 2);
	if (slf.attribute[5] < bsNb) { slf.attribute[5] = bsNb; };
	slf.level = 10 + (kapitel * 6) + tier + (hero.level / 2);
	b_setfightskills(slf, StExt_ValidateValueRange(60 + (kapitel * 8) + (tier * 5), 60, 100));
	slf.protection[1] = 70 + (kapitel * 25) + (tier * 15);
	slf.protection[2] = 70 + (kapitel * 25) + (tier * 15);
	slf.protection[6] = 70 + (kapitel * 25) + (tier * 15);
	slf.protection[3] = 50 + (kapitel * 18);
	slf.protection[5] = 50 + (kapitel * 18);
	twWeap = StExt_GetRegularItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"), (hero.level * 6) + (kapitel * 35) + (tier * 60));
	if (twWeap > 0) { createinvitems(slf, twWeap, 1); };
};

const string StExt_Smith_WP_Q1 = "NW_TROLLAREA_RUINS_01";	// ruiny nad droga (waynet zweryfikowany)
func void rtn_start_99740() { ta_stand_guarding(8, 0, 20, 0, StExt_Smith_WP_Q1); ta_stand_guarding(20, 0, 8, 0, StExt_Smith_WP_Q1); };
func void rtn_start_99741() { ta_stand_guarding(8, 0, 20, 0, StExt_Smith_WP_Q1); ta_stand_guarding(20, 0, 8, 0, StExt_Smith_WP_Q1); };
func void rtn_start_99742() { ta_stand_guarding(8, 0, 20, 0, StExt_Smith_WP_Q1); ta_stand_guarding(20, 0, 8, 0, StExt_Smith_WP_Q1); };

instance bdt_99740_HersztGrasantow(npc_default)
{
    name = "Herszt Grasantow"; guild = gil_bdt; id = 99740; voice = 10; flags = 0; npctype = npctype_main; level = 34;
    b_setnpcvisual(bdt_99740_HersztGrasantow, male, "Hum_Head_FatBald", face_n_tough_okyl, bodytex_n, itar_bdt_h);
    mdl_applyoverlaymds(bdt_99740_HersztGrasantow, "Humans_Militia.mds");
    b_givenpctalents(bdt_99740_HersztGrasantow); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99740;
    StExt_HubSmith_ThugSetup(bdt_99740_HersztGrasantow, 3);
};
instance bdt_99741_Grasant1(npc_default)
{
    name = "Grasant"; guild = gil_bdt; id = 99741; voice = 12; flags = 0; npctype = npctype_main; level = 24;
    b_setnpcvisual(bdt_99741_Grasant1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_bdt_m);
    mdl_applyoverlaymds(bdt_99741_Grasant1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99741_Grasant1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99741;
    StExt_HubSmith_ThugSetup(bdt_99741_Grasant1, 1);
};
instance bdt_99742_Grasant2(npc_default)
{
    name = "Grasant"; guild = gil_bdt; id = 99742; voice = 13; flags = 0; npctype = npctype_main; level = 24;
    b_setnpcvisual(bdt_99742_Grasant2, male, "Hum_Head_Fighter", face_n_caine, bodytex_n, itar_bdt_m);
    mdl_applyoverlaymds(bdt_99742_Grasant2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99742_Grasant2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99742;
    StExt_HubSmith_ThugSetup(bdt_99742_Grasant2, 1);
};

// Herszt nosi mlot mistrza - drop z ai_ondead (silnik wola po nazwie).
func void ai_ondead_bdt_99740_HersztGrasantow()
{
	if (StExt_SmithQ_Stage == 1)
	{
		createinvitems(self, itmi_stext_smith_hammer, 1);
		StExt_Smith_Log("Herszt nie zyje. Mlot Kowala lezy przy jego ciele - ciezszy, niz wyglada.");
		printscreencolor("Mlot Kowala - zabierz go z ciala herszta.", 62, 2, StExt_DefaultFont, 3, StExt_Color_Header);
	};
};

instance dia_none_99760_HubSmith_Q1(c_info)
{
    npc = none_99760_HubSmith;
    nr = 6;
    condition = dia_none_99760_HubSmith_Q1_condition;
    information = dia_none_99760_HubSmith_Q1_info;
    permanent = false;
    description = "Zaczne od poczatku. Co bylo pierwsze?";
};
func int dia_none_99760_HubSmith_Q1_condition()
{
	return (StExt_Hub_Smith >= 2) && (StExt_SmithQ_Stage == 0) && (kapitel >= 3);
};
func void dia_none_99760_HubSmith_Q1_info()
{
	StExt_Say("HERO", "Zaczne od poczatku. Co bylo pierwsze?");
	StExt_Say("Bezimienny Kowal", "Mlot. Zawsze jest mlot. Moj lezy tam, gdzie go rzucilem - w ruinach nad droga, przy trollowej dolinie.");
	StExt_Say("Bezimienny Kowal", "Gniezdzi sie tam teraz banda. Herszt kuje moim mlotem podkowy. PODKOWY. Przynies mi go, zanim calkiem go pohanbi.");
	StExt_SmithQ_Stage = 1;
	rx_saveparservars();
	wld_insertnpc(bdt_99740_HersztGrasantow, StExt_Smith_WP_Q1);
	wld_insertnpc(bdt_99741_Grasant1, StExt_Smith_WP_Q1);
	wld_insertnpc(bdt_99742_Grasant2, StExt_Smith_WP_Q1);
	rx_restoreparservars();
	StExt_Smith_Log("Kowal pamieta mlot - pierwsza z trzech rzeczy, ktore po nim zostaly. Lezy w ruinach przy trollowej dolinie, w rekach herszta grasantow. Mam go odzyskac.");
	ai_stopprocessinfos(self);
};

instance dia_none_99760_HubSmith_Q1Done(c_info)
{
    npc = none_99760_HubSmith;
    nr = 7;
    condition = dia_none_99760_HubSmith_Q1Done_condition;
    information = dia_none_99760_HubSmith_Q1Done_info;
    permanent = false;
    description = "Twoj mlot.";
};
func int dia_none_99760_HubSmith_Q1Done_condition()
{
	return (StExt_SmithQ_Stage == 1) && (npc_hasitems(hero, itmi_stext_smith_hammer) >= 1);
};
func void dia_none_99760_HubSmith_Q1Done_info()
{
	StExt_Say("HERO", "Twoj mlot.");
	StExt_Say("Bezimienny Kowal", "Rece go pamietaja. Trzon wytarl sie tam, gdzie zawsze. Wiec to bylo moje.");
	StExt_Say("Bezimienny Kowal", "Pierwszy okruch wrocil. Kuznia to poczuje - i ty poczujesz. Zostaly dwa.");
	npc_removeinvitems(hero, itmi_stext_smith_hammer, 1);
	StExt_SmithFragments = StExt_SmithFragments + 1;
	StExt_SmithQ_Stage = 2;
	ai_printbonus("Okruchy imienia Kowala: 1/3 - kuznia kuje mocniej i taniej");
	StExt_Smith_Log("Mlot wrocil do rak Kowala. Trzymal go tak, jakby nigdy go nie wypuszczal. Pierwszy okruch imienia odzyskany - zostaly dwa.");
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** Wyniesienie BRONI ku legendzie (zloto + dusze) ***
//--------------------------------------------------------------
// Bliznniak upgrade'u zbroi u Mistrza (Npc_SoulOrder.d nr 9), ale dla zalozonej
// BRONI biezacej - Kowal to kowal, bron nalezy do niego. Statyczna bron (rank 0,
// bez rozszerzenia): EnchantItemInPlace nadaje rozszerzenie (zachowuje wizual/
// obrazenia + dodaje magie), potem normalizacja rangi do +1. Juz rozszerzona:
// ChangeItemRank(+1) w miejscu (zachowuje seale). Cap na legendarnej (5).
instance dia_none_99760_HubSmith_WeaponRankUp(c_info)
{
    npc = none_99760_HubSmith;
    nr = 8;
    condition = dia_none_99760_HubSmith_WeaponRankUp_condition;
    information = dia_none_99760_HubSmith_WeaponRankUp_info;
    permanent = true;
    description = "Wynies moja bron ku legendzie.";
};
func int dia_none_99760_HubSmith_WeaponRankUp_condition() { return (StExt_Hub_Smith >= 2); };
func void dia_none_99760_HubSmith_WeaponRankUp_info()
{
	var c_item weap;
	var c_item work;
	var int rank;
	var int goldCost;
	var int soulCost;
	var int newId;
	var int power;
	var int delta;

	weap = npc_getequippedmeleeweapon(hero);
	if (!hlp_isvaliditem(weap))
	{
		StExt_Say("Bezimienny Kowal", "Pokaz mi ostrze, nie pusta dlon. Dobadz broni, ktora mam wyniesc.");
		ai_stopprocessinfos(self);
		return;
	};
	rank = StExt_GetItemRank(weap);
	if (rank >= StExt_ItemRankLegendary)
	{
		StExt_Say("Bezimienny Kowal", "Ta stal juz jest legenda. Wyzej nie pojdzie - nawet w moich rekach.");
		ai_stopprocessinfos(self);
		return;
	};
	goldCost = StExt_WeaponRankUp_GoldPerStep * (rank + 1);
	soulCost = StExt_WeaponRankUp_SoulBase + (rank * StExt_WeaponRankUp_SoulStep);
	if (npc_hasitems(hero, itmi_gold) < goldCost)
	{
		StExt_Say("Bezimienny Kowal", "Legenda kosztuje. Wroc ze zlotem.");
		ai_printred(concatstrings(StExt_Str_NeedGold, inttostring(goldCost)));
		ai_stopprocessinfos(self);
		return;
	};
	if (npc_hasitems(hero, itmi_stext_bosssoul) < soulCost)
	{
		StExt_Say("Bezimienny Kowal", "Ogien, co nie gasnie, karmi sie duszami. Przynies ich wiecej.");
		ai_printbonus(concatstrings("Potrzeba dusz poleglych: ", inttostring(soulCost)));
		ai_stopprocessinfos(self);
		return;
	};

	// Instancji NIE wolno przypisac do instancji (work = weap) - RHS musi byc
	// wywolaniem. Stad ponowny getter.
	work = npc_getequippedmeleeweapon(hero);
	if (!StExt_ItemHasExtension(weap))
	{
		power = StExt_OpenChest_GetMaxPower();
		newId = StExt_EnchantItemInPlace(weap, power);
		if (newId <= 0)
		{
			StExt_Say("Bezimienny Kowal", "Ta stal nie przyjmie legendy. Przynies inne ostrze.");
			ai_stopprocessinfos(self);
			return;
		};
		npc_removeinvitems(hero, hlp_getinstanceid(weap), 1);
		b_playerfinditem_stext(newId, 1);
		work = npc_getitembyid(hero, newId);
	};

	npc_removeinvitems(hero, itmi_gold, goldCost);
	npc_removeinvitems(hero, itmi_stext_bosssoul, soulCost);
	delta = (rank + 1) - StExt_GetItemRank(work);
	if (delta != 0) { StExt_ChangeItemRank(work, delta); };
	rx_playeffect("spellfx_incovation_violet", hero);
	StExt_Say("Bezimienny Kowal", "Czujesz? Stal ciezsza o jedna legende. Dobadz jej z plecaka, by poznac roznice.");
	ai_printbonus(concatstrings("Ranga broni: ", inttostring(StExt_GetItemRank(work))));
	ai_stopprocessinfos(self);
};

//===================================================================//
//   Lancuch "Imie Kowala" - R4: "Ruda z tamtej strony" (fragment 2) //
//===================================================================//
// Pierwsza wyprawa Kowala poza Khorinis: kopalnia w Gorniczej Dolinie.
// Zbojcy-wygnancy trzymaja stara sztolnie z magiczna zyla. Spawn KOTWICZONY
// na graczu przy wejsciu do GD (StExt_Smith_GDTrySpawn z rx_mainloop) -
// zero dropow na 0,0,0, jak przy celach Drogi Beliara w GD.
func void rtn_start_99746() { ta_stand_guarding(8, 0, 20, 0, StExt_Smith_GDWp); ta_stand_guarding(20, 0, 8, 0, StExt_Smith_GDWp); };
func void rtn_start_99747() { ta_stand_guarding(8, 0, 20, 0, StExt_Smith_GDWp); ta_stand_guarding(20, 0, 8, 0, StExt_Smith_GDWp); };
func void rtn_start_99748() { ta_stand_guarding(8, 0, 20, 0, StExt_Smith_GDWp); ta_stand_guarding(20, 0, 8, 0, StExt_Smith_GDWp); };

instance bdt_99746_SztygarWygnancow(npc_default)
{
    name = "Sztygar Wygnancow"; guild = gil_bdt; id = 99746; voice = 10; flags = 0; npctype = npctype_main; level = 40;
    b_setnpcvisual(bdt_99746_SztygarWygnancow, male, "Hum_Head_FatBald", face_n_tough_okyl, bodytex_n, itar_bdt_h);
    mdl_applyoverlaymds(bdt_99746_SztygarWygnancow, "Humans_Militia.mds");
    b_givenpctalents(bdt_99746_SztygarWygnancow); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99746;
    StExt_HubSmith_ThugSetup(bdt_99746_SztygarWygnancow, 4);
};
instance bdt_99747_Wygnaniec1(npc_default)
{
    name = "Wygnaniec"; guild = gil_bdt; id = 99747; voice = 11; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99747_Wygnaniec1, male, "Hum_Head_Bald", face_n_harlok, bodytex_n, itar_leather_l);
    mdl_applyoverlaymds(bdt_99747_Wygnaniec1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99747_Wygnaniec1); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99747;
    StExt_HubSmith_ThugSetup(bdt_99747_Wygnaniec1, 2);
};
instance bdt_99748_Wygnaniec2(npc_default)
{
    name = "Wygnaniec"; guild = gil_bdt; id = 99748; voice = 13; flags = 0; npctype = npctype_main; level = 28;
    b_setnpcvisual(bdt_99748_Wygnaniec2, male, "Hum_Head_Fighter", face_n_mud, bodytex_n, itar_leather_l);
    mdl_applyoverlaymds(bdt_99748_Wygnaniec2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99748_Wygnaniec2); fight_tactic = fai_human_master;
    aivar[6] = true;
    daily_routine = rtn_start_99748;
    StExt_HubSmith_ThugSetup(bdt_99748_Wygnaniec2, 2);
};

// Sztygar strzeze zyly - ruda spada z jego ciala.
func void ai_ondead_bdt_99746_SztygarWygnancow()
{
	if (StExt_SmithQ_Stage == 3)
	{
		createinvitems(self, itmi_stext_smith_ore, 1);
		StExt_Smith_Log("Sztygar padl. Ruda z magicznej zyly - ciepla mimo zimnego kamienia - lezy przy jego ciele.");
		printscreencolor("Ruda z magicznej zyly - zabierz ja z ciala sztygara.", 62, 2, StExt_DefaultFont, 3, StExt_Color_Header);
	};
};

// Spawn zbojcow kopalni w GD - kotwica na graczu (rx_mainloop, gate oldworld).
func void StExt_Smith_GDTrySpawn()
{
	var c_npc n;
	var string wp;
	if (StExt_Smith_GDSpawned) { return; };
	if (StExt_SmithQ_Stage != 3) { return; };
	if (currentlevel != oldworld_zen) { return; };
	wp = npc_getnearestwp(hero);
	if (!StExt_IsValidWp(wp)) { return; };
	StExt_Smith_GDWp = wp;
	rx_saveparservars();
	wld_insertnpc(bdt_99746_SztygarWygnancow, wp);
	wld_insertnpc(bdt_99747_Wygnaniec1, wp);
	wld_insertnpc(bdt_99748_Wygnaniec2, wp);
	n = hlp_getnpc(bdt_99746_SztygarWygnancow);	if (hlp_isvalidnpc(n)) { npc_exchangeroutine(n, "START"); };
	n = hlp_getnpc(bdt_99747_Wygnaniec1);		if (hlp_isvalidnpc(n)) { npc_exchangeroutine(n, "START"); };
	n = hlp_getnpc(bdt_99748_Wygnaniec2);		if (hlp_isvalidnpc(n)) { npc_exchangeroutine(n, "START"); };
	rx_restoreparservars();
	StExt_Smith_GDSpawned = true;
	ai_printbonus("Stara sztolnia z magiczna zyla - broni jej sztygar wygnancow. Zabij go i wez rude.");
};

instance dia_none_99760_HubSmith_Q2(c_info)
{
    npc = none_99760_HubSmith;
    nr = 9;
    condition = dia_none_99760_HubSmith_Q2_condition;
    information = dia_none_99760_HubSmith_Q2_info;
    permanent = false;
    description = "Co drugie?";
};
func int dia_none_99760_HubSmith_Q2_condition()
{
	return (StExt_Hub_Smith >= 2) && (StExt_SmithQ_Stage == 2) && (kapitel >= 4);
};
func void dia_none_99760_HubSmith_Q2_info()
{
	StExt_Say("HERO", "Co drugie?");
	StExt_Say("Bezimienny Kowal", "Ruda. Nie ta z tutejszych zyl - ta martwa. Zywa lezy za morzem, w Gorniczej Dolinie, w sztolni, ktora dawno porzucono.");
	StExt_Say("Bezimienny Kowal", "Trzymaja ja wygnancy - ludzie, ktorych i Khorinis, i Dolina wyplula. Sztygar sciska zyle jak wlasne dziecko. Przynies mi jej garsc, a przypomne sobie, jak sie kuje z zywego metalu.");
	StExt_SmithQ_Stage = 3;
	StExt_Smith_GDSpawned = false;
	StExt_Smith_Log("Kowal potrzebuje rudy z zywej, magicznej zyly - drugiego okrucha imienia. Lezy w porzuconej sztolni w Gorniczej Dolinie, w rekach wygnancow. Musze przejsc przelecz i ja zdobyc.");
	ai_stopprocessinfos(self);
};

instance dia_none_99760_HubSmith_Q2Done(c_info)
{
    npc = none_99760_HubSmith;
    nr = 10;
    condition = dia_none_99760_HubSmith_Q2Done_condition;
    information = dia_none_99760_HubSmith_Q2Done_info;
    permanent = false;
    description = "Twoja ruda.";
};
func int dia_none_99760_HubSmith_Q2Done_condition()
{
	return (StExt_SmithQ_Stage == 3) && (npc_hasitems(hero, itmi_stext_smith_ore) >= 1);
};
func void dia_none_99760_HubSmith_Q2Done_info()
{
	StExt_Say("HERO", "Twoja ruda.");
	StExt_Say("Bezimienny Kowal", "(Wazy ja w dloni, dlugo.) Zywa. Czuje, jak chce plynac. Dwadziescia lat nie trzymalem takiej.");
	StExt_Say("Bezimienny Kowal", "Drugi okruch. Zostal jeden - i to on boli najbardziej. Ale najpierw... pozwol, ze cos ci wykuje. Naleza ci sie.");
	npc_removeinvitems(hero, itmi_stext_smith_ore, 1);
	StExt_SmithFragments = StExt_SmithFragments + 1;
	StExt_SmithQ_Stage = 4;
	StExt_DarkKnights_GrantReward(0, 20);	// PN za wyprawe; zloto nie - Kowal placi kunsztem
	ai_printbonus("Okruchy imienia Kowala: 2/3 - kuznia jeszcze mocniej i taniej");
	StExt_Smith_Log("Ruda wrocila do rak Kowala. Wazyl ja tak, jakby trzymal wlasne serce. Drugi okruch odzyskany - zostal jeden, ten najciezszy.");
	ai_stopprocessinfos(self);
};

func void dia_none_99760_HubSmith_exit_info() { ai_stopprocessinfos(self); };
instance dia_none_99760_HubSmith_exit(c_info)
{
    npc = none_99760_HubSmith;
    nr = 999;
    condition = dia_none_99760_HubSmith_exit_condition;
    information = dia_none_99760_HubSmith_exit_info;
    permanent = true;
    description = dialog_back;
};
func int dia_none_99760_HubSmith_exit_condition() { return true; };
