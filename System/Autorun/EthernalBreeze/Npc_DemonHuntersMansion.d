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
	ai_printbonus(concatstrings("hero.guild = ", inttostring(hero.guild)));
	ai_printbonus(concatstrings(concatstrings("att hero->TPL=", inttostring(wld_getguildattitude(hero.guild, GIL_TPL))), concatstrings(" hero->PAL=", inttostring(wld_getguildattitude(hero.guild, GIL_PAL)))));
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Lowcy demonow polują na wszystko, co nosi cień Beliara - a ty niesiesz go jak sztandar.");
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zagnieździli się w dworku za farmą Onara, w lesie nad jeziorem. Wytnij ich gniazdo. Ich mistrz Angel ma paść pierwszy.");
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
    description = "Gniazdo lowcow wyrznięte.";
};
// Detekcja po konkretnym NPC czeka na potwierdzone nazwy instancji z diagnostyka
// (ANGEL okazal sie nieuzywalnym symbolem). Na razie raport zgloszeniowy.
func int dia_dmtteacher_stext_dhhunt_done_condition()
{
	return StExt_DK_IsMember() && (StExt_DH_Stage == 1);
};
func void dia_dmtteacher_stext_dhhunt_done_info()
{
	StExt_Say(StExt_Str_DarkTeacher_Name, "Angel martwy, gniazdo wyrżnięte. Ich krzyż nie ochronił ich przed Beliarem. Dobrze.");
	StExt_DH_Stage = 2;
	StExt_DarkKnights_GrantBeliarKarma(150);
	StExt_DarkKnights_GrantReward(8000, 15);
	StExt_DH_Log("Angel martwy, gniazdo lowcow zniszczone. Dworek za farma Onara nalezy teraz do cienia.");
	Log_SetTopicStatus(StExt_DH_Topic, LOG_SUCCESS);
	ai_stopprocessinfos(self);
};
