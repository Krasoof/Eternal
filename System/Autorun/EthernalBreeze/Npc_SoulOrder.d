
//===================================================================//
//				Zakon Dusz (Soul Order) - guild master				 //
//===================================================================//
// F1 scope: joining the order (irreversible choice of TWO sworn
// elements at 200% exp, all other elements locked to 0) and soul
// infusion moved here from the StonedTrader (members only; every
// infused soul also grants +1% elemental damage, cap 50).
// F2+ (map boss, 10 summons per chapter, chapter rewards) comes next.

instance none_99702_SoulMaster(npc_default)
{
    name = StExt_Str_SoulMaster_Name;
    guild = gil_none;
    id = 99702;
    voice = 12;	// bylo 14 ("tragiczny") -> 12, standardowy konkretny meski SVM
    flags = 0;
    npctype = npctype_main;
    aivar[93] = true;
    aivar[57] = true;
    aivar[51] = magic_always;
    level = 1;
    b_setattributestochapter(none_99702_SoulMaster, 6);
    attribute[3] = 1000;
    attribute[2] = 1000;
    attribute[1] = 100000;
    attribute = attribute[1];
    attribute[3] = 25000;
    attribute[2] = attribute[3];
    fight_tactic = fai_human_master;
    // Master wears the order's top armor (Straznik/ZAKON_CHAOS), not a mage robe
    b_setnpcvisual(none_99702_SoulMaster, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_stext_zakon_guardian);
    mdl_setmodelfatness(none_99702_SoulMaster, 0.0);
    mdl_applyoverlaymds(none_99702_SoulMaster, "Humans_Mage.mds");
    b_givenpctalents(none_99702_SoulMaster);
    b_setfightskills(none_99702_SoulMaster, 100);
    daily_routine = rtn_none_99702_SoulMaster;
};
func void rtn_none_99702_SoulMaster()
{
    // Po oczyszczeniu Wiezy Umarlych Zakon "przenosi sie o swicie" - Mistrz
    // staje w nowej siedzibie na wybrzezu (przy Kowalu). Rutyna trzyma go
    // tam takze po wczytaniu sejwa; jednorazowa relokacja biezacej sesji
    // robi StExt_CheckGatedSpawns (AI_Teleport).
    if (StExt_ZakonHub_Relocated)
    {
        ta_stand_armscrossed(8, 0, 23, 0, StExt_ZakonHub_Wp);
        ta_stand_armscrossed(23, 0, 8, 0, StExt_ZakonHub_Wp);
    }
    else
    {
        ta_stand_armscrossed(8, 0, 23, 0, "NW_BIGFARM_CHAPEL_03");
        ta_stand_armscrossed(23, 0, 8, 0, "NW_BIGFARM_CHAPEL_03");
    };
};

//--------------------------------------------------------------
// *** Joining: two-stage element choice (irreversible) ***
//--------------------------------------------------------------
//--------------------------------------------------------------
// *** Powitanie - Mistrz PRZEMAWIA (dymek z napisami przez StExt_Say) ***
//--------------------------------------------------------------
// PROOF systemu napisow: silnikowy AI_Output nie dziala (brak OU), wiec Mistrz
// mowi przez StExt_Say - tekst leci wprost do dymka, linia po linii. Ton:
// surowy mentor. Odpala sie raz przy pierwszej rozmowie (important, non-perm).
instance dia_none_99702_SoulMaster_Greet(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 1;
    condition = dia_none_99702_SoulMaster_Greet_condition;
    information = dia_none_99702_SoulMaster_Greet_info;
    permanent = false;
    important = true;
    description = "Kim jestescie?";
};
func int dia_none_99702_SoulMaster_Greet_condition() { return !StExt_SoulKnight_Member; };
func void dia_none_99702_SoulMaster_Greet_info()
{
	StExt_Say(StExt_Str_SoulMaster_Name, "Stoj. Czuje na tobie Zar - cudze smierci, ktore nosisz jak plaszcz. Wiekszosc ludzi nie czuje go, dopoki ich nie strawi.");
	StExt_Say(StExt_Str_SoulMaster_Name, "Nazywaja nas Rycerzami Dusz. Bledne miano. Nie jestesmy rycerzami. Jestesmy tymi, ktorzy nauczyli sie ZYWIC smiercia, zamiast przed nia uciekac.");
	StExt_Say(StExt_Str_SoulMaster_Name, "Chcesz mocy - widze to, kazdy chce. Ale moc Zakonu ma cene. Wiekszosc placi ja bez wahania... dopoki nie zrozumie, co oddala.");
	StExt_Say(StExt_Str_SoulMaster_Name, "Wroc, gdy bedziesz gotow zlozyc przysiege. I nie przychodz, jesli szukasz litosci. Tutaj jej nie ma.");
	ai_stopprocessinfos(self);
};

instance dia_none_99702_SoulMaster_Join(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 2;
    condition = dia_none_99702_SoulMaster_Join_condition;
    information = dia_none_99702_SoulMaster_Join_info;
    permanent = true;
    description = StExt_Str_SoulKnight_JoinOffer;
};
func int dia_none_99702_SoulMaster_Join_condition() { return !StExt_SoulKnight_Member; };

func void StExt_SoulOrder_FinishPick(var int el2)
{
	if (el2 == StExt_SoulKnight_PendingFirst)
	{
		ai_printred(StExt_Str_SoulKnight_SameElement);
		return;
	};
	StExt_SoulKnight_Join(StExt_SoulKnight_PendingFirst, el2);
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	ai_stopprocessinfos(self);
};

func void StExt_SoulOrder_Pick2_Fire() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Fire); };
func void StExt_SoulOrder_Pick2_Ice() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Ice); };
func void StExt_SoulOrder_Pick2_Electric() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Electric); };
func void StExt_SoulOrder_Pick2_Air() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Air); };
func void StExt_SoulOrder_Pick2_Earth() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Earth); };
func void StExt_SoulOrder_Pick2_Light() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Light); };
func void StExt_SoulOrder_Pick2_Dark() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Dark); };
func void StExt_SoulOrder_Pick2_Death() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Death); };

func void StExt_SoulOrder_BuildSecondMenu()
{
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	ai_printbonus(StExt_Str_SoulKnight_PickSecond);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Fire, StExt_SoulOrder_Pick2_Fire);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Ice, StExt_SoulOrder_Pick2_Ice);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Electric, StExt_SoulOrder_Pick2_Electric);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Air, StExt_SoulOrder_Pick2_Air);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Earth, StExt_SoulOrder_Pick2_Earth);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Light, StExt_SoulOrder_Pick2_Light);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Dark, StExt_SoulOrder_Pick2_Dark);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Death, StExt_SoulOrder_Pick2_Death);
};

func void StExt_SoulOrder_StartPick(var int el1)
{
	StExt_SoulKnight_PendingFirst = el1;
	StExt_SoulOrder_BuildSecondMenu();
};

func void StExt_SoulOrder_Pick1_Fire() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Fire); };
func void StExt_SoulOrder_Pick1_Ice() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Ice); };
func void StExt_SoulOrder_Pick1_Electric() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Electric); };
func void StExt_SoulOrder_Pick1_Air() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Air); };
func void StExt_SoulOrder_Pick1_Earth() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Earth); };
func void StExt_SoulOrder_Pick1_Light() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Light); };
func void StExt_SoulOrder_Pick1_Dark() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Dark); };
func void StExt_SoulOrder_Pick1_Death() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Death); };

func void StExt_SoulOrder_CancelJoin()
{
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	ai_stopprocessinfos(self);
};

func void dia_none_99702_SoulMaster_Join_info()
{
	StExt_Say(StExt_Str_SoulMaster_Name, "Wiec jednak wrociles. Dobrze. Sluchaj uwaznie, bo powtorze to tylko raz.");
	StExt_Say(StExt_Str_SoulMaster_Name, "Wybierzesz DWA zywioly. Tylko dwa. W nich urosniesz w sile, jakiej nie zaznasz nigdzie indziej. Reszte - zapomnisz. Na zawsze. Zakon nie znosi polowicznosci.");
	StExt_Say(StExt_Str_SoulMaster_Name, "Wybieraj rozwaznie. Tej przysiegi nie cofniesz - a ja nie bede sluchal skarg.");
	ai_printbonus(StExt_Str_SoulKnight_PickFirst);
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	info_addchoice(dia_none_99702_SoulMaster_Join, dialog_back, StExt_SoulOrder_CancelJoin);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Fire, StExt_SoulOrder_Pick1_Fire);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Ice, StExt_SoulOrder_Pick1_Ice);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Electric, StExt_SoulOrder_Pick1_Electric);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Air, StExt_SoulOrder_Pick1_Air);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Earth, StExt_SoulOrder_Pick1_Earth);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Light, StExt_SoulOrder_Pick1_Light);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Dark, StExt_SoulOrder_Pick1_Dark);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Death, StExt_SoulOrder_Pick1_Death);
};

//--------------------------------------------------------------
// *** Soul infusion (members only; moved from the StonedTrader) ***
//--------------------------------------------------------------
instance dia_none_99702_SoulMaster_Infuse(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 3;
    condition = dia_none_99702_SoulMaster_Infuse_condition;
    information = dia_none_99702_SoulMaster_Infuse_info;
    permanent = true;
    description = StExt_Str_SoulInfuse_Offer;
};
func int dia_none_99702_SoulMaster_Infuse_condition()
{
	return StExt_SoulKnight_Member && (npc_hasitems(hero, itmi_stext_bosssoul) > 0);
};
func void dia_none_99702_SoulMaster_Infuse_info()
{
	var c_item weap;

	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };
	if (!hlp_isvaliditem(weap))
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Z czym mam pracowac? Dobadz zelaza, ktore ma przyjac dusze.");
		ai_printred(StExt_Str_Seal_NoWeapon);
		ai_stopprocessinfos(self);
		return;
	};
	if (npc_hasitems(hero, itmi_gold) < 1000)
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Tysiac sztuk zlota. Rytual ma cene i nie ja ja ustalam.");
		ai_printred(StExt_Str_Enchant_NotEnoughGold);
		ai_stopprocessinfos(self);
		return;
	};

	if (StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId) > 0)
	{
		StExt_SetItemProperty(weap, StExt_ItemProp_SealPower, StExt_GetItemProperty(weap, StExt_ItemProp_SealPower) + 20);
	}
	else if (StExt_GetItemSeal(weap) > 0)
	{
		StExt_SetItemProperty(weap, StExt_ItemProp_PerkPower, StExt_GetItemProperty(weap, StExt_ItemProp_PerkPower) + 20);
	}
	else
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "To zelazo nie zna zywiolu. Dusza nie ma sie czego uchwycic - przynies bron z pieczecia albo perkiem.");
		ai_printred(StExt_Str_WeaponSkill_NoElement);
		ai_stopprocessinfos(self);
		return;
	};

	npc_removeinvitems(hero, itmi_stext_bosssoul, 1);
	npc_removeinvitems(hero, itmi_gold, 1000);
	StExt_SoulKnight_SoulsInfused += 1;
	rx_playeffect("spellfx_incovation_violet", hero);
	StExt_Say(StExt_Str_SoulMaster_Name, "Gotowe. Dusza wtopiona w ostrze - czujesz? Ono teraz pamieta, jak sie zabija.");
	ai_printbonus(StExt_Str_SoulInfuse_Done);
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** Wtapianie dusz w ZBROJE (nowa usluga - reuse enchant-in-place) ***
//--------------------------------------------------------------
// Analogicznie do broni, ale pancerz nie ma pieczeci - uzywa sprawdzonej
// maszynerii enchant/reroll-in-place (ta sama co dziala u Shivy na zbroi),
// tylko placonej DUSZAMI. Plain pancerz -> magiczny; magiczny -> mocniejszy
// przelosowany. Ten sam typ/mesh zachowany, po zamianie auto-equip.
instance dia_none_99702_SoulMaster_InfuseArmor(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 8;	// nr=5 kolidowalo z dia_none_99702_SoulMaster_Tower (Npc_ZakonTower) - opcja sie nie pokazywala
    condition = dia_none_99702_SoulMaster_InfuseArmor_condition;
    information = dia_none_99702_SoulMaster_InfuseArmor_info;
    permanent = true;
    description = "Wtop dusze w moj pancerz.";
};
func int dia_none_99702_SoulMaster_InfuseArmor_condition()
{
	return StExt_SoulKnight_Member && (npc_hasitems(hero, itmi_stext_bosssoul) > 0);
};
func void dia_none_99702_SoulMaster_InfuseArmor_info()
{
	var c_item armor;
	var int power;
	var int newId;

	armor = npc_getequippedarmor(hero);
	if (!hlp_isvaliditem(armor))
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Nagi rycerz to trup. Zaloz pancerz, w ktory mam wtopic dusze.");
		ai_printred(StExt_Str_Enchant_NoArmor);
		ai_stopprocessinfos(self);
		return;
	};
	if (npc_hasitems(hero, itmi_gold) < 1000)
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Tysiac sztuk zlota. Rytual ma cene i nie ja ja ustalam.");
		ai_printred(StExt_Str_Enchant_NotEnoughGold);
		ai_stopprocessinfos(self);
		return;
	};

	power = StExt_OpenChest_GetMaxPower();
	if (StExt_ItemHasExtension(armor)) { newId = StExt_RerollItemInPlace(armor, power); }
	else { newId = StExt_EnchantItemInPlace(armor, power); };
	if (newId <= 0)
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Ten pancerz nie przyjmie duszy.");
		ai_stopprocessinfos(self);
		return;
	};

	StExt_Trace(concatstrings(concatstrings("INFUZJA PANCERZ stara=", inttostring(hlp_getinstanceid(armor))), concatstrings(" -> nowa=", inttostring(newId))));
	npc_removeinvitems(hero, itmi_stext_bosssoul, 1);
	npc_removeinvitems(hero, itmi_gold, 1000);
	npc_removeinvitems(hero, hlp_getinstanceid(armor), 1);
	b_playerfinditem_stext(newId, 1);
	// bez auto-equip (crash 3F800000 na swiezej instancji w dialogu) - gracz zaklada
	StExt_SoulKnight_SoulsInfused += 1;
	rx_playeffect("spellfx_incovation_violet", hero);
	StExt_Say(StExt_Str_SoulMaster_Name, "Dusza wrosla w stal. Zaloz pancerz - broni cie teraz tak, jak bronil swojego pana.");
	ai_printbonus("Dusza wtopiona w pancerz - zaloz go z plecaka.");
	ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** Lore: the fallen order (journal, deepens with progress) ***
//--------------------------------------------------------------
// Each visit reveals the next fragment, up to what your hunt progress
// unlocks (fragment i needs StExt_ZakonHunt_Done >= i). Entries go to the
// journal under "Zakon Dusz" so they can be re-read.
func void StExt_ZakonLore_Reveal()
{
	if (StExt_ZakonLore_Stage > StExt_ZakonHunt_Done)
	{
		ai_printbonus(StExt_Str_ZakonLore_NothingNew);
		return;
	};

	Log_CreateTopic(StExt_Str_ZakonLore_Topic, LOG_NOTE);
	if (StExt_ZakonLore_Stage == 0) { B_LogEntry(StExt_Str_ZakonLore_Topic, StExt_Str_ZakonLore_0); }
	else if (StExt_ZakonLore_Stage == 1) { B_LogEntry(StExt_Str_ZakonLore_Topic, StExt_Str_ZakonLore_1); }
	else if (StExt_ZakonLore_Stage == 2) { B_LogEntry(StExt_Str_ZakonLore_Topic, StExt_Str_ZakonLore_2); }
	else if (StExt_ZakonLore_Stage == 3) { B_LogEntry(StExt_Str_ZakonLore_Topic, StExt_Str_ZakonLore_3); }
	else if (StExt_ZakonLore_Stage == 4) { B_LogEntry(StExt_Str_ZakonLore_Topic, StExt_Str_ZakonLore_4); }
	else { B_LogEntry(StExt_Str_ZakonLore_Topic, StExt_Str_ZakonLore_5); };

	StExt_ZakonLore_Stage += 1;
	ai_printbonus(StExt_Str_ZakonLore_Added);
};

instance dia_none_99702_SoulMaster_Lore(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 6;
    condition = dia_none_99702_SoulMaster_Lore_condition;
    information = dia_none_99702_SoulMaster_Lore_info;
    permanent = true;
    description = StExt_Str_ZakonLore_Offer;
};
func int dia_none_99702_SoulMaster_Lore_condition() { return StExt_SoulKnight_Member; };
func void dia_none_99702_SoulMaster_Lore_info()
{
	if (StExt_ZakonLore_Stage > StExt_ZakonHunt_Done)
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Nie dzis. Przeszlosc Zakonu placi sie krwia - przynies mi kolejna glowe, wtedy opowiem wiecej.");
	}
	else
	{
		StExt_Say(StExt_Str_SoulMaster_Name, "Sluchaj uwaznie. Rzadko o tym mowie, a dwa razy nie powtarzam. Zapisz to sobie, jesli musisz.");
	};
	StExt_ZakonLore_Reveal();
	ai_stopprocessinfos(self);
};

instance dia_none_99702_SoulMaster_exit(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 999;
    condition = dia_none_99702_SoulMaster_exit_condition;
    information = dia_none_99702_SoulMaster_exit_info;
    permanent = true;
    description = dialog_back;
};
func int dia_none_99702_SoulMaster_exit_condition() { return true; };
func void dia_none_99702_SoulMaster_exit_info() { ai_stopprocessinfos(self); };

//--------------------------------------------------------------
// *** Rycerz Dusz - knight perk tree, paid in BOSS SOULS ***
//--------------------------------------------------------------
// Souls stop being only elemental fuel: the Master teaches 5 knight arts.
// Costs escalate (2/3/5/8/12 souls). Effects live in DamageController /
// HeroActionsController and key off StExt_KnightPerk_* (GlobalVars).

instance dia_none_99702_SoulMaster_Knight(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 4;
    condition = dia_none_99702_SoulMaster_Knight_condition;
    information = dia_none_99702_SoulMaster_Knight_info;
    permanent = true;
    description = "Nauki Rycerza Dusz (placisz duszami)";
};
func int dia_none_99702_SoulMaster_Knight_condition() { return StExt_SoulKnight_Member; };

func int StExt_Knight_TryPay(var int cost)
{
	if (npc_hasitems(hero, itmi_stext_bosssoul) < cost)
	{
		ai_printred(concatstrings("Za malo dusz. Potrzeba: ", inttostring(cost)));
		return false;
	};
	npc_removeinvitems(hero, itmi_stext_bosssoul, cost);
	snd_play("LEVELUP");
	return true;
};

// Each purchase CLOSES the dialog (re-open to buy the next one) - this breaks
// the buy->menu->buy parse-order cycle; direct forward calls are parse fails.
func void StExt_Knight_Buy_Armor()    { if (StExt_Knight_TryPay(2))  { StExt_KnightPerk_Armor = true;    ai_printbonus("Pancerz Dusz: -8% obrazen wrecz."); }; info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };
func void StExt_Knight_Buy_Wrath()    { if (StExt_Knight_TryPay(3))  { StExt_KnightPerk_Wrath = true;    ai_printbonus("Gniew Rycerza: riposta +100%."); }; info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };
func void StExt_Knight_Buy_Stalwart() { if (StExt_Knight_TryPay(5))  { StExt_KnightPerk_Stalwart = true; ai_printbonus("Niezlomnosc: blok kosztuje polowe staminy."); }; info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };
func void StExt_Knight_Buy_Crush()    { if (StExt_Knight_TryPay(8))  { StExt_KnightPerk_Crush = true;    ai_printbonus("Miazdzacy Cios: co 4. trafienie +40%."); }; info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };
func void StExt_Knight_Buy_Pact()     { if (StExt_Knight_TryPay(12)) { StExt_KnightPerk_Pact = true;     ai_printbonus("Pakt Dusz: 2% obrazen wraca jako zycie."); }; info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };
// Blogoslawienstwo Cienia (integracja PotD): tylko dla WAMPIRA (globalny
// RX_VampireLevel z NB; odczyt globala jest bezpieczny niezaleznie od tego,
// czy plugin PotD aktywny - symbol siedzi w skompilowanym GOTHIC.DAT).
// Efekty: pragnienie krwi zerowane co tick (ModController), dzienna kara
// -15% kompensowana w naszym pipeline obrazen (DamageController).
func void StExt_Knight_Buy_Shadow()   { if (StExt_Knight_TryPay(3))  { StExt_KnightPerk_Shadow = true;   ai_printbonus("Blogoslawienstwo Cienia: slonce i pragnienie nie rozkazuja juz Rycerzowi."); }; info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };
func void StExt_Knight_Exit() { info_clearchoices(dia_none_99702_SoulMaster_Knight); ai_stopprocessinfos(self); };

func void StExt_Knight_BuildMenu()
{
	info_clearchoices(dia_none_99702_SoulMaster_Knight);
	ai_printbonus(concatstrings("Dusze poleglych: ", inttostring(npc_hasitems(hero, itmi_stext_bosssoul))));
	if (!StExt_KnightPerk_Armor)    { info_addchoice(dia_none_99702_SoulMaster_Knight, "Pancerz Dusz: -8% obrazen wrecz (2 dusze)", StExt_Knight_Buy_Armor); };
	if (!StExt_KnightPerk_Wrath)    { info_addchoice(dia_none_99702_SoulMaster_Knight, "Gniew Rycerza: 20% szansy na riposte po paradzie (3 dusze)", StExt_Knight_Buy_Wrath); };
	if (!StExt_KnightPerk_Stalwart) { info_addchoice(dia_none_99702_SoulMaster_Knight, "Niezlomnosc: blok za polowe staminy (5 dusz)", StExt_Knight_Buy_Stalwart); };
	if (!StExt_KnightPerk_Crush)    { info_addchoice(dia_none_99702_SoulMaster_Knight, "Miazdzacy Cios: co 4. trafienie +40% (8 dusz)", StExt_Knight_Buy_Crush); };
	if (!StExt_KnightPerk_Pact)     { info_addchoice(dia_none_99702_SoulMaster_Knight, "Pakt Dusz: lifesteal 2% (12 dusz)", StExt_Knight_Buy_Pact); };
	if ((RX_VampireLevel >= 1) && !StExt_KnightPerk_Shadow) { info_addchoice(dia_none_99702_SoulMaster_Knight, "Blogoslawienstwo Cienia: bez kar slonca, krew opcjonalna (3 dusze)", StExt_Knight_Buy_Shadow); };
	info_addchoice(dia_none_99702_SoulMaster_Knight, dialog_back, StExt_Knight_Exit);
};

func void dia_none_99702_SoulMaster_Knight_info()
{
	StExt_Say(StExt_Str_SoulMaster_Name, "Sztuki Rycerza Dusz. Placi sie duszami poleglych - zlota tu nie przyjmuje, zloto jest dla kupcow.");
	StExt_Knight_BuildMenu();
};
