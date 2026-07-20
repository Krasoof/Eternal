
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
