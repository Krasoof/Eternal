//===================================================================//
//   Wojna Beliara z Lowcami Demonow (GIL_DMT vs gildia lowcow)      //
//===================================================================//
// Jako Mroczny Rycerz (sluga Beliara) gracz jest w realnej wojnie z Lowcami
// Demonow (kanon Returninga: Mroczny Rycerz = ich wrog w kaplicy, przyzwany
// demon = pomiot Beliara). Ich gniazdo jest w PORCIE - tam kieruje quest.
//
// PRAWDZIWI lowcy (zero kopii): wojna gildii przez wld_setguildattitude sprawia,
// ze REALNE NPC lowcow atakuja gracza i sa zabijalni - realne konsekwencje.
// Gildia lowcow: kandydaci GIL_TPL (Templariusze) / GIL_PAL (Angel=paladyn) -
// ustawiam wrogosc dla OBU wzgledem hero.guild (gracz-Rycerz ma guild=16, nie
// GIL_DMT=11 - patrz Dark Knights), a diagnostyk potwierdzi ktora.
//
// CHARAKTER ITERACYJNY: gildia lowcow ustalana w grze diagnostykiem (jak hero.guild),
// bo w plikach jej nie odczytamy. Quest: wojna gildii + zlecenie + nagroda.


const string StExt_DH_Topic = "Krucjata Beliara";
const string StExt_DH_WP = "NW_CITY_HABOUR_03";	// port - gniazdo lowcow (spawn brakujacych)

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
	var c_npc dhm;
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
		ai_printbonus("Gildia Lowcow jeszcze nieodczytana.");
	};
	// Czy mistrz lowcow w ogole ISTNIEJE w swiecie? Jesli nie - nie ma kogo
	// przenosic ani zabijac (ich zawartosc moze byc nieaktywna w tym zapisie).
	dhm = hlp_getnpc(DH_MAINNPC);
	if (hlp_isvalidnpc(dhm))
	{
		if (npc_isdead(dhm)) { ai_printbonus("Mistrz lowcow: ISTNIEJE, ale MARTWY"); }
		else { ai_printbonus(concatstrings("Mistrz lowcow: ZYJE, gildia=", inttostring(dhm.guild))); };
	}
	else
	{
		ai_printbonus("Mistrz lowcow: NIE ISTNIEJE w swiecie (ich watek nieaktywny)");
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

// IDENTYFIKACJA LOWCOW (historia): zgadywanie nazw instancji zawiodlo (wszystkie -1),
// dopiero ekstrakcja CALYCH tokenow z VDF dala prawdziwe: DH_MAINNPC, DH_NPCSEVERIN,
// DH_VILANDNPC, DH_SLD_MERCENARY_01/02 (kazda potwierdzona handlerem AI_ONDEAD_*).
// Podglad gildii CELU (StExt_DH_ShowFocusGuild) rysowany jest z ticku ModControllera,
// bo w dialogu focusem jest rozmowca. Daedalus nie ma petli - stad brak skanu po liscie.

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
	StExt_Say(StExt_Str_DarkTeacher_Name, "Zagniezdzili sie w porcie, przy nabrzezu. Wytnij ich gniazdo. Ich mistrz ma pasc pierwszy.");
	StExt_DH_SetGuildWar();
	StExt_DH_Stage = 1;
	StExt_DH_Log("Lowcy demonow trzymaja gniazdo w porcie, przy nabrzezu. Ich mistrz i jego ludzie maja zginac.");
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
	StExt_DH_Log("Mistrz lowcow martwy, gniazdo w porcie wyrzniete. Ich kusza pije teraz swiatlo.");
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
	StExt_Say(StExt_Str_DarkTeacher_Name, "W porcie, przy nabrzezu - tam trzymaja swoje gniazdo. Idz i skoncz to.");
	StExt_DH_Relocated = false;	// tick zwola ich na nowo
	ai_stopprocessinfos(self);
};
