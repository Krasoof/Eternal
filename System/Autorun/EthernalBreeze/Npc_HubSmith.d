
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
    ta_smith_sharp(8, 0, 22, 0, "SHORE_MONSTER_05_01");
    ta_smith_sharp(22, 0, 8, 0, "SHORE_MONSTER_05_01");
};

//--------------------------------------------------------------
// *** Usluga: przekucie (reroll) dobytej broni ***
//--------------------------------------------------------------
func int StExt_HubSmith_Cost()
{
	// tanieje z odzyskanym imieniem (fragmenty), rosnie z rozdzialem
	return (3000 + (kapitel * 1500)) - (StExt_SmithFragments * 800);
};

func void StExt_HubSmith_Reforge()
{
	var c_item weap;
	var int cost;
	var int power;
	var int newId;

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

	// moc rosnie z odzyskanym imieniem: pusty kowal kuje slabo, pelny - legendy
	power = (hero.level * 6) + (kapitel * 25) + (StExt_SmithFragments * 40);
	newId = StExt_RerollItemInPlace(weap, power);
	if (newId <= 0)
	{
		StExt_Say("Bezimienny Kowal", "Tego zelaza nie przekuje. Ono juz wie, czym jest.");
		ai_stopprocessinfos(self);
		return;
	};

	npc_removeinvitems(hero, itmi_gold, cost);
	StExt_Say("Bezimienny Kowal", "Mlot pamieta. Rece pamietaja. Odbierz - to juz nie jest ta sama bron.");
	ai_printbonus("Kowal przekuwa twoja bron.");
	ai_stopprocessinfos(self);
};

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
	ai_printbonus("Bezimienny Kowal dolaczyl do huba. Przekuwa bronie u siebie w wiezy.");
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
func void dia_none_99760_HubSmith_Reforge_info() { StExt_HubSmith_Reforge(); };

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
