//===================================================================//
//   Wojna Beliara z Lowcami Demonow (GIL_DMT vs gildia lowcow)      //
//===================================================================//
// Jako Mroczny Rycerz (sluga Beliara) gracz jest w realnej wojnie z Lowcami
// Demonow (kanon Returninga: Mroczny Rycerz = ich wrog w kaplicy, przyzwany
// demon = pomiot Beliara). Mistrz Angel + lowcy w dworku za farma Onara.
//
// PRAWDZIWI lowcy (zero kopii): wojna gildii przez wld_setguildattitude sprawia,
// ze REALNE NPC lowcow atakuja gracza i sa zabijalni - realne konsekwencje.
// Gildia lowcow: kandydaci GIL_TPL (Templariusze) / GIL_PAL (Angel=paladyn) -
// ustawiam wrogosc dla OBU wzgledem hero.guild (gracz-Rycerz ma guild=16, nie
// GIL_DMT=11 - patrz Dark Knights), a diagnostyk potwierdzi ktora.
//
// CHARAKTER ITERACYJNY: gildia lowcow + zachowanie callbacku dworku ustalane w
// grze diagnostykiem (jak hero.guild). Ten plik = pierwszy inkrement (wojna +
// diagnostyk + test zaludnienia + szkielet questa).

const string StExt_DH_Topic = "Krucjata Beliara";
const string StExt_DH_WP = "NW_BIGFARM_FOREST_01";	// las za farma Onara (dworek lowcow)

// Wojna gildii (StExt_DH_SetGuildWar) zdefiniowana w ModController.d (parse-order:
// wolana z CheckGatedSpawns w pliku 54, ten plik = 76). Tu tylko ja wolamy.

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

//--------------------------------------------------------------
// *** DIAGNOSTYK (TYMCZASOWY - usunac po ustaleniu gildii lowcow) ***
//--------------------------------------------------------------
// Odczyt: gildia gracza, gildia Angela (jesli zaladowany), aktualne nastawienia
// hero<->TPL/PAL. Att w Gothicu: HOSTILE=0, ANGRY=1, NEUTRAL=2, FRIENDLY=3.
instance dia_dmtteacher_stext_dhdiag(c_info)
{
    npc = DMT_DARKTEACHER;
    nr = 730;
    condition = dia_dmtteacher_stext_dhdiag_condition;
    information = dia_dmtteacher_stext_dhdiag_info;
    permanent = true;
    description = "...(kim sa dla mnie lowcy demonow?)";
};
func int dia_dmtteacher_stext_dhdiag_condition() { return TRUE; };
func void dia_dmtteacher_stext_dhdiag_info()
{
	// Nazwy bazowych NPC rozwiazujemy po STRINGU w runtime (StExt_GetInstanceIdByName),
	// bo grep-hit w VDF NIE gwarantuje uzywalnego symbolu parsera (ANGEL i GIL_DMT3
	// wywalily start). Wynik <=0 = taka instancja nie istnieje.
	ai_printbonus(concatstrings(concatstrings("hero.guild=", inttostring(hero.guild)), concatstrings("  gildia Lowcow=", inttostring(StExt_DH_HunterGuild))));
	if (StExt_DH_HunterGuild > 0)
	{
		ai_printbonus(concatstrings("att Lowcy->ja = ", inttostring(wld_getguildattitude(StExt_DH_HunterGuild, hero.guild))));
	}
	else
	{
		ai_printbonus("Gildia Lowcow jeszcze nieodczytana - podejdz w poblize lowcow (port).");
	};
	// przelacz podglad gildii CELU: idz do lowcow, spojrz na jednego, odczytaj z ekranu
	if (StExt_DH_ShowFocusGuild)
	{
		StExt_DH_ShowFocusGuild = false;
		ai_printbonus("Podglad gildii celu: WYLACZONY");
	}
	else
	{
		StExt_DH_ShowFocusGuild = true;
		ai_printbonus("Podglad gildii celu: WLACZONY - spojrz na lowce demonow");
	};
	ai_stopprocessinfos(self);
};

// USUNIETO test zaludnienia dworku: wolanie bazowego callbacku RX_CALLBACK_DH_GOTOMANSION
// z WNETRZA dialogu zawieszalo rozmowe (ta sama klasa co crash auto-equip - nie ruszamy
// stanu swiata w trakcie dialogu). Do tego wszystkie zgadywane nazwy NPC daly -1, wiec
// event i tak nie mial czego przeniesc. Wracamy do tego dopiero po empirycznym
// zidentyfikowaniu lowcow skanerem (StExt_DH_ScanNearbyGuilds w menu debug).

// IDENTYFIKACJA LOWCOW: przelacznik podgladu gildii CELU (StExt_DH_ShowFocusGuild).
// Daedalus nie ma petli (mod nigdzie nie uzywa while), a zgadywanie nazw instancji
// zawiodlo (wszystkie -1). Wiec: wlaczasz podglad u Mistrza, idziesz do lowcow,
// patrzysz na jednego i czytasz jego gildie z ekranu. Rysowanie jest w ModControllerze
// (tick), bo w dialogu focusem jest rozmowca.

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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zagniezdzili sie w dworku za farma Onara, w lesie nad jeziorem. Wytnij ich gniazdo. Ich mistrz Angel ma pasc pierwszy.");
	StExt_DH_SetGuildWar();
	StExt_DH_Stage = 1;
	StExt_DH_Log("Lowcy demonow zajeli dworek za farma Onara. Mistrz Angel i jego lowcy maja zginac - Beliar zabierze im dom.");
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
	StExt_DH_Log("Mistrz lowcow martwy, gniazdo zniszczone. Dworek za farma Onara nalezy teraz do cienia. Ich kusza pije teraz swiatlo.");
	Log_SetTopicStatus(StExt_DH_Topic, LOG_SUCCESS);
	ai_stopprocessinfos(self);
};

// Powtarzalna wskazowka - samonaprawa, gdyby lowcy sie rozeszli/nie doszli do dworku.
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "W dworku za farma Onara, w lesie nad jeziorem. Zbiore ich tam dla ciebie - idz i skoncz to.");
	StExt_DH_Relocated = false;	// tick zwola ich na nowo
	ai_stopprocessinfos(self);
};
