func int StExt_ReadExpMode()
{
	if(menu_readint("AST", "bOptionMonsterExp") == 0) { return 10; }
	else if(menu_readint("AST", "bOptionMonsterExp") == 1) { return 15; };
	return 10;
};

func string StExt_VersionToString(var int ver)
{
	var string result;
	var int major;
	var int minor;
	if (ver < 100) { major = 0; }
	else { major = ver / 100; };
	minor = ver - (major * 100);
	
	result = concatstrings(inttostring(major), ".");
	if (minor < 10) { result = concatstrings(result, "0"); };
	result = concatstrings(result, inttostring(minor));
	return result;
};

func string StExt_GetCurrentVersion() { return StExt_VersionToString(StExt_ModVersion); };
func void StExt_SetModVersionString() {	StExt_CurrentModVersionString = StExt_GetCurrentVersion(); };

func void StExt_InitializeUiSettings()
{
	StExt_PrintDebugStack("StExt_InitializeUiSettings()");
	
	StExt_Config_ModMenuKey = key_t;
	StExt_Config_ModCraftKey = key_c;
	StExt_Config_AuraCastKey = key_o;
	StExt_Config_ModOptionsKey = key_o;
	
	StExt_Config_PcMainActionKey = key_lcontrol;
	StExt_Config_PcSecondaryActionKey = key_lshift;
	StExt_Config_PcSupportActionKey = key_lmenu;

	StExt_Config_WeaponSkillKey = key_h;
	StExt_Config_WeaponSkill_CooldownSec = 8;
	StExt_Config_WeaponSkill_StaminaCostPerc = 30;
	StExt_Config_WeaponSkill_ManaCostPerc = 20;

	StExt_Config_ElementProfession_MaxSlots = 3;
	StExt_Config_ElementProfession_UniversalPenaltyPerc = 50;
	StExt_Config_ElementProfession_ResetCost = 500;

	StExt_Config_ShowNpcLevel = false;
	StExt_Config_ShowNpcExtraInfo = false;
	StExt_Config_ShowNpcFlags = true;
	StExt_Config_ShowNpcRank = true;
	StExt_Config_ShowNpcAbilities = true;
	StExt_Config_DisplayLuckMessage = true;
	StExt_Config_DisplayMasteryLevelUp = true;

	StExt_Config_Alch_DisplayOnScreen = false;
	StExt_Config_Alch_PosX = 1;
	StExt_Config_Alch_PosY = 92;

	StExt_Config_Artifact_DisplayOnScreen = true;
	StExt_Config_Artifact_ShowExpMessage = false;
	StExt_Config_Artifact_PosX = 7;
	StExt_Config_Artifact_PosY = 0;

	StExt_Config_Aura_DisplayOnScreen = false;
	StExt_Config_Aura_PosX = 1;
	StExt_Config_Aura_PosY = 92;

	StExt_Config_EsBar_DefaultPos = true;
	StExt_Config_EsBar_PosX = 1;
	StExt_Config_EsBar_PosY = 94;

	StExt_Config_MenuTextWrapIndex = 150;
	StExt_Config_MenuScaleX = 80;
	StExt_Config_MenuScaleY = 80;
	StExt_Config_MenuPauseOnShow = true;
	StExt_Config_MenuScrollMult = 100;

	StExt_Config_ItemMenu_PosX = 75;
	StExt_Config_ItemMenu_PosY = 75;

	StExt_Config_MsgTray_PosX = 75;
	StExt_Config_MsgTray_PosY = 75;
};

func void StExt_InitializeWorld()
{
	StExt_PrintDebugStack("StExt_InitializeWorld()");
	
	mob_createitems("XAR_CHEST", itut_stext_magicbook, 1);
	mob_createitems("XAR_CHEST", itut_stext_magicdagger, 1);
	mob_createitems("XAR_CHEST", itwr_stext_corruptionscroll, 1);
	mob_createitems("XAR_CHEST", itmi_stoned_wax, 1);
	mob_createitems("XAR_CHEST", itmi_feder, 1);
	mob_createitems("XAR_CHEST", itmi_nugget, 3 + hlp_random(5));
	mob_createitems("XAR_CHEST", itwr_magicpaper, 5 + hlp_random(5));
	
	mob_createitems("NW_CHEST_START_GOBLINCAVE", itru_stext_magicbolt, 1);
	mob_createitems("NW_CHEST_START_GOBLINCAVE", itpo_mana_01, 2 + hlp_random(2));
	
	if (!StExt_TraderAppear)
	{
		if (currentlevel == newworld_zen)
		{
			StExt_TraderAppear = true;
			rx_saveparservars();
			wld_insertnpc(none_99666_StonedTrader, "NW_BIGFARM_CHAPEL_03");
			rx_restoreparservars();
		};
	};
	if (!StExt_FireTeacherAppear)
	{
		if (currentlevel == newworld_zen)
		{
			StExt_FireTeacherAppear = true;
			rx_saveparservars();
			wld_insertnpc(none_99700_FireMaster, "OC_MAGE_CENTER");
			rx_restoreparservars();
		};
	};
	if (!StExt_DarkTeacherAppear)
	{
		if (currentlevel == newworld_zen)
		{
			StExt_DarkTeacherAppear = true;
			rx_saveparservars();
			wld_insertnpc(none_99701_DarkMaster, "NW_TAVERNE");
			rx_restoreparservars();
		};
	};
	if (!StExt_SoulMasterAppearV2)
	{
		if (currentlevel == newworld_zen)
		{
			StExt_SoulMasterAppearV2 = true;
			rx_saveparservars();
			wld_insertnpc(none_99702_SoulMaster, "NW_BIGFARM_CHAPEL_03");
			rx_restoreparservars();
		};
	};
	// Zakon hunted targets (incl. the ch1 heretic) spawn ON DEMAND via the
	// Soul Master's hunt dialog - no init-once spawn, works on old saves.
	StExt_InitializeWorldRandomizer();
};

// Spawny BRAMKOWANE stanem gracza (czlonkostwo/rozdzial) - MUSZA byc
// sprawdzane CYKLICZNIE, nie raz w StExt_InitializeWorld. Ten init leci
// TYLKO przy tworzeniu postaci (guard StExt_ModInitialized), gdy nikt nie
// jest jeszcze w Zakonie - dlatego Kowal nigdy sie nie spawnowal. Latch
// StExt_*Appear gwarantuje spawn dokladnie raz, w chwili spelnienia warunku.
// Wolane z ticku ModControllera i z OnLoadEnd. Save-safe (same latche).
// Wojna gildii Beliar vs Lowcy Demonow: prawdziwi lowcy (GIL_TPL/GIL_PAL) wrodzy
// gildii gracza-Rycerza. Definicja TU (nie w Npc_DemonHuntersMansion.d, plik 76),
// bo wolamy z CheckGatedSpawns (plik 54) - forward call = parse-fail. Inline check
// gildii gracza (literal 16 = StExt_DK_GuildId, || GIL_DMT; symboli z pliku 76 nie
// mozna referowac wstecz). GIL_ATTITUDES resetuje sie przy load - re-aplikacja co tick.
// Wrogosc pojedynczego lowcy (pewniak - dziala nawet gdy tabela gildii nie chwyta).
func void StExt_DH_MakeNpcHostile(var c_npc n)
{
	if (!hlp_isvalidnpc(n)) { return; };
	if (npc_isdead(n)) { return; };
	// ZDEJMIJ NIESMIERTELNOSC. Bazowi lowcy maja flage, ktora chroni ich przed
	// przypadkowa smiercia - przez nia nie dalo sie ich dobic. Mod tez ja honoruje
	// (Utils.d StExt_IsNpcImmortal: flags == npc_flag_immortal). Czyscimy tylko te
	// dwie flagi, zeby nie zgubic FRIEND/GHOST.
	if ((n.flags == npc_flag_immortal) || (n.flags == npc_flag_xaradrim)) { n.flags = npc_flag_none; };
	npc_setattitude(n, ATT_HOSTILE);
	npc_settempattitude(n, ATT_HOSTILE);
};

// Gildia lowcow NIE jest zgadywana - odczytujemy ja z mistrza lowcow (DH_MAINNPC)
// w runtime i zapamietujemy. Potwierdzone instancje NPC lowcow (maja AI_ONDEAD):
// DH_MAINNPC, DH_NPCSEVERIN, DH_VILANDNPC, DH_SLD_MERCENARY_01/02.
func void StExt_DH_SetGuildWar()
{
	var c_npc dhm;
	var c_npc n;
	if ((hero.guild != 16) && (hero.guild != GIL_DMT)) { return; };
	dhm = hlp_getnpc(DH_MAINNPC);
	if ((StExt_DH_HunterGuild <= 0) && hlp_isvalidnpc(dhm)) { StExt_DH_HunterGuild = dhm.guild; };
	if (StExt_DH_HunterGuild > 0)
	{
		wld_setguildattitude(hero.guild, StExt_DH_HunterGuild, ATT_HOSTILE);
		wld_setguildattitude(StExt_DH_HunterGuild, hero.guild, ATT_HOSTILE);
		StExt_DH_WarSet = true;
	};
	// UWAGA: w Daedalusie NIE wolno przekazac wyniku funkcji zwracajacej INSTANCJE
	// jako argumentu innej funkcji - parser wywala blad "Expected nawias zamykajacy".
	// Zagniezdzenia zwracajace int sa OK. Stad zmienna posrednia.
	StExt_DH_MakeNpcHostile(dhm);
	n = hlp_getnpc(DH_NPCSEVERIN);       StExt_DH_MakeNpcHostile(n);
	n = hlp_getnpc(DH_VILANDNPC);        StExt_DH_MakeNpcHostile(n);
	n = hlp_getnpc(DH_SLD_MERCENARY_01); StExt_DH_MakeNpcHostile(n);
	n = hlp_getnpc(DH_SLD_MERCENARY_02); StExt_DH_MakeNpcHostile(n);
};

// ODPALENIE BAZOWEGO EVENTU DWORKU: dworek zostaje odrestaurowany, a lowcy sami
// sie tam wprowadzaja - dokladnie tak, jak w ich wlasnym watku. To wlasciwa droga:
// AI_Teleport nie mial szans (komenda KOLEJKI AI, a NPC daleko od gracza nie tyka
// swojego AI - stad "lowcy dalej w porcie").
// DWA WARUNKI BEZPIECZENSTWA, oba wyniesione z wczesniejszych bledow:
//  1) wolamy z TICKU, nigdy z dialogu - wolanie eventu w trakcie rozmowy ja zawieszalo,
//  2) wolamy PO NAZWIE (StExt_InitializeCallback) - nie znamy arnosci tych funkcji,
//     a wywolanie wprost przy zlej arnosci = parse-fail calego moda.
// Kolejno (z odstepem klatek, by wykonaly sie po kolei): podmiana vobtree na
// odrestaurowany dworek -> oznaczenie go jako czysty -> przeprowadzka lowcow.
func void StExt_DH_RestoreMansion()
{
	if (StExt_DH_MansionDone) { return; };
	if (StExt_DH_Stage != 1) { return; };
	if (currentlevel != newworld_zen) { return; };
	StExt_DH_MansionDone = true;
	// KOLEJNOSC MA ZNACZENIE (zgloszenie: "na stare voby naszly nowe"). Stan idzie
	// od tego co jest -> CLEANED -> dopiero stan docelowy. Podmiana vobtree PRZED
	// oznaczeniem jako czysty nakladala nowe voby na stare.
	StExt_InitializeCallback(hero, hero, "RX_CALLBACK_MANSIONCLEAN", 1);
	StExt_InitializeCallback(hero, hero, "RX_CALLBACK_MANSIONUPDATECLEAN", 25);
	StExt_InitializeCallback(hero, hero, "RX_CALLBACK_MANSION_CHANGEVOBTREE", 50);
	StExt_InitializeCallback(hero, hero, "RX_CALLBACK_DH_GOTOMANSION", 75);
	ai_printbonus("Lowcy demonow odbudowali dworek za farma Onara i przenosza sie tam.");
};

// Spawn naszej obstawy + Belmonda. Instancje siedza w pliku 76, a ten kod parsuje
// sie jako 54, wiec wolamy PO NAZWIE (deferred) - inaczej forward ref = parse-fail.
// Z ticku, nie z dialogu przyjecia: dialog jest jednorazowy, wiec gracz z JUZ
// przyjetym zleceniem nigdy by obstawy nie zobaczyl (zgloszenie: "Belmonda nie ma").
func void StExt_DH_TriggerExtras()
{
	if (StExt_DH_ExtrasSpawned) { return; };
	if (StExt_DH_Stage != 1) { return; };
	if (currentlevel != newworld_zen) { return; };
	StExt_DH_ExtrasSpawned = true;	// latch TU, zeby nie spamowac callbackami
	StExt_InitializeCallback(hero, hero, "StExt_DH_SpawnExtras", 5);
};

// Dospawnowuje TYLKO tych lowcow, ktorych w danym zapisie w ogole nie ma (watek
// nieaktywny). Istniejacych NIE ruszamy - siedza w porcie i tam po nich idziemy.
// To nie kopie: gdy oryginalu nigdzie nie ma, wld_insertnpc powoluje te jedyna,
// prawdziwa instancje.
func void StExt_DH_EnsureHunters()
{
	var c_npc n;
	if (StExt_DH_Relocated) { return; };
	if (StExt_DH_Stage != 1) { return; };
	if (currentlevel != newworld_zen) { return; };
	StExt_DH_Relocated = true;
	rx_saveparservars();
	n = hlp_getnpc(DH_MAINNPC);          if (!hlp_isvalidnpc(n)) { wld_insertnpc(DH_MAINNPC, "NW_BIGFARM_FOREST_01"); };
	n = hlp_getnpc(DH_NPCSEVERIN);       if (!hlp_isvalidnpc(n)) { wld_insertnpc(DH_NPCSEVERIN, "NW_BIGFARM_FOREST_01"); };
	n = hlp_getnpc(DH_VILANDNPC);        if (!hlp_isvalidnpc(n)) { wld_insertnpc(DH_VILANDNPC, "NW_BIGFARM_FOREST_01"); };
	n = hlp_getnpc(DH_SLD_MERCENARY_01); if (!hlp_isvalidnpc(n)) { wld_insertnpc(DH_SLD_MERCENARY_01, "NW_BIGFARM_FOREST_01"); };
	n = hlp_getnpc(DH_SLD_MERCENARY_02); if (!hlp_isvalidnpc(n)) { wld_insertnpc(DH_SLD_MERCENARY_02, "NW_BIGFARM_FOREST_01"); };
	rx_restoreparservars();
};

func void StExt_CheckGatedSpawns()
{
	var c_npc zhMaster;
	// Wojna gildii Beliar vs Lowcy Demonow - re-aplikowana (GIL_ATTITUDES resetuje
	// sie przy wczytaniu). Setter zwraca od razu dla nie-Rycerza; globalne, wiec
	// przed bramka newworld. Idempotentne.
	StExt_DH_SetGuildWar();
	StExt_DH_EnsureHunters();	// dospawnuj brakujacych lowcow (istniejacych nie ruszamy)
	StExt_DH_RestoreMansion();	// odpal bazowy event: dworek odrestaurowany + przeprowadzka lowcow
	StExt_DH_TriggerExtras();	// dorzuc nasza obstawe + Belmonda (dziala tez przy juz przyjetym zleceniu)
	if (currentlevel != newworld_zen) { return; };
	// Bezimienny Kowal (hub R1) - kuje w ruinach wiezy na wybrzezu; dla
	// czlonka Zakonu od rozdz. 1 (spotkasz go idac na quest Wiezy Umarlych)
	if (!StExt_HubSmithAppear && StExt_SoulKnight_Member && (kapitel >= 1))
	{
		StExt_HubSmithAppear = true;
		rx_saveparservars();
		wld_insertnpc(none_99760_HubSmith, StExt_ZakonHub_Wp);
		rx_restoreparservars();
		ai_printbonus("Bezimienny Kowal osiadl w ruinach wiezy na wybrzezu.");
	};
	// Runa przeprowadzki - samonaprawa dla sejwow po oczyszczeniu wiezy
	// (Stage>=5) sprzed jej wprowadzenia. Latch = raz.
	if (!StExt_HubRuneGiven && (StExt_ZakonTower_Stage >= 5))
	{
		StExt_HubRuneGiven = true;
		if (npc_hasitems(hero, itmi_stext_hubrune) == 0)
		{
			createinvitems(hero, itmi_stext_hubrune, 1);
			ai_printbonus("Otrzymales: Runa Przeprowadzki Zakonu");
		};
	};
	// Relokacja Mistrza do nowej siedziby (Zakon "przenosi sie o swicie" po
	// oczyszczeniu wiezy). Latch + AI_Teleport dla biezacej sesji; rutyna
	// Mistrza trzyma go tam po wczytaniu.
	if (!StExt_ZakonHub_Relocated && (StExt_ZakonTower_Stage >= 5))
	{
		StExt_ZakonHub_Relocated = true;
		zhMaster = Hlp_GetNpc(none_99702_SoulMaster);
		if (hlp_isvalidnpc(zhMaster))
		{
			AI_Teleport(zhMaster, StExt_ZakonHub_Wp);
			ai_printbonus("Zakon przeniosl siedzibe na wybrzeze. Mistrz czeka tam.");
		};
	};
};

func void StExt_ValidateModValues()
{
	if (StExt_Config_WorldRandomization_TradersExtraItemsAddRate < 3) { StExt_Config_WorldRandomization_TradersExtraItemsAddRate = 3; };
	if (StExt_Config_WorldRandomization_EmptyChestsUpdateRate < 1) { StExt_Config_WorldRandomization_EmptyChestsUpdateRate = 1; };
	if (StExt_Config_WorldRandomization_EmptyChestsUpdateCount < 1) { StExt_Config_WorldRandomization_EmptyChestsUpdateCount = 1; };	
	if (StExt_Config_FoodBonusResetDay < 1) { StExt_Config_FoodBonusResetDay = 1; };
};

func void StExt_OverrideGameConfigsFile()
{
	menu_writeint("AST", "bEnableUnlockSt", 19385726);
	
	if (rx_beliarrageactive())
	{
		menu_writeint("BELIARS_RAGE", "RX_BeliarRage_Opt_MonstersExp", rx_beliarrage_opt_monstersexp);
		menu_writeint("BELIARS_RAGE", "RX_BeliarRage_Opt_SpawnMonsters", rx_beliarrage_opt_spawnmonsters);
		menu_writeint("BELIARS_RAGE", "RX_BeliarRage_Opt_StaminaReduce", rx_beliarrage_opt_staminareduce);
		menu_writeint("BELIARS_RAGE", "RX_BeliarRage_Opt_AddDamageReduce", rx_beliarrage_opt_adddamagereduce);
		menu_writeint("BELIARS_RAGE", "RX_BeliarRage_Opt_RegenEnemies", rx_beliarrage_opt_regenenemies);
		menu_writeint("BELIARS_RAGE", "RX_BeliarRage_Opt_RegenEnemies", rx_beliarragesoundenable);
	};
};

func void StExt_InitializeMod()
{
	StExt_PrintDebugStack("StExt_InitializeMod()");
	if (!StExt_ModInitialized)
	{
		StExt_Configure(false);
		StExt_ValidateModValues();
	
		menu_writeint("AST", "bEnableUnlockSt", 19385726);
		StExt_SncMode = menu_readint("AST", "bOptionSNC");
		StExt_DiffLevel = menu_readint("AST", "bMainDiff");
		StExt_DiffMode_Hp = rx_monsterhpratio;
		StExt_DiffMode_Pwr = rx_monsterpower;
		StExt_DiffMode_Prot = rx_monsterprotratio;		
		
		StExt_DiffMode_Exp = StExt_ReadExpMode();
		StExt_DiffMode_SncKoeff = rx_fullsnc_koef;
		StExt_DiffMode_PartyExp = rx_partyexp;
		StExt_DiffMode_BeliarRageNpcExp = rx_beliarrage_opt_monstersexp;		
		StExt_Config_SncExp = StExt_DiffMode_SncKoeff;
		StExt_Config_PartyExp = StExt_DiffMode_PartyExp;
		StExt_Config_BelliarRageExp = StExt_DiffMode_BeliarRageNpcExp;
		
		StExt_Config_BelliarRage_Active = StExt_IfInt(rx_beliarrageactive(), true, false);
		StExt_Config_BelliarRageExp = rx_beliarrage_opt_monstersexp;
		StExt_Config_BelliarRage_StaminaReduce = rx_beliarrage_opt_staminareduce;
		StExt_Config_BelliarRage_SpawnMonsters = rx_beliarrage_opt_spawnmonsters;
		StExt_Config_BelliarRage_AddDamageReduce = rx_beliarrage_opt_adddamagereduce;
		StExt_Config_BelliarRage_RegenEnemies = rx_beliarrage_opt_regenenemies;
		StExt_Config_BelliarRage_SoundEnable = rx_beliarragesoundenable;
		
		StExt_InitializeUiSettings();
		StExt_InitializeWorld();
		StExt_InitializeArtifacts();				
	
		StExt_IsLevelChanging = false;
		StExt_IsLoading = false;
		StExt_CurrentModVersion = StExt_ModVersion;
		StExt_ModInitialized = true;
		rx_callback(8.0, StExt_OverrideGameConfigsFile);
		
		ai_printbonus(StExt_Str_DisplayModInitialized);
		StExt_PrintDebugStack("StExt_InitializeMod() -> Mod initialized!");		
		Hlp_DoEvent("StExt_Evt_OnModInitialized");
	};
};

func void StExt_CalculateDiff()
{
	var int extra_diff_hp;
	var int extra_diff_power;
	var int extra_diff_prot;
	var int current_day;
	
	extra_diff_hp = 0;
	extra_diff_power = 0;
	extra_diff_prot = 0;
	current_day = wld_getday();

	if (StExt_Config_Diff_EnableKapitel)
	{	
		extra_diff_hp += StExt_Config_Diff_Kapitel_Hp * kapitel;
		extra_diff_power += StExt_Config_Diff_Kapitel_Power * kapitel;
		extra_diff_prot += StExt_Config_Diff_Kapitel_Prot * kapitel;
	};
	if (StExt_Config_Diff_EnableStatic)
	{	
		extra_diff_hp += StExt_Config_Diff_Static_Hp;
		extra_diff_power += StExt_Config_Diff_Static_Power;
		extra_diff_prot += StExt_Config_Diff_Static_Prot;
	};
	if (StExt_Config_Diff_EnableDaily)
	{	
		extra_diff_hp += current_day * (StExt_Config_Diff_Daily_Hp + (StExt_Config_Diff_Kapitel_DailyHpMod * kapitel));
		extra_diff_power += current_day * (StExt_Config_Diff_Daily_Power + (StExt_Config_Diff_Kapitel_DailyPowerMod * kapitel));
		extra_diff_prot += current_day * (StExt_Config_Diff_Daily_Prot + (StExt_Config_Diff_Kapitel_DailyProtMod * kapitel));
	};
	if (StExt_Config_Diff_EnableLevel)
	{	
		extra_diff_hp += hero.level * StExt_Config_Diff_Level_Hp;
		extra_diff_power += hero.level * StExt_Config_Diff_Level_Power;
		extra_diff_prot += hero.level * StExt_Config_Diff_Level_Prot;
	};
	
	rx_monsterhpratio = StExt_DiffMode_Hp + extra_diff_hp;
	rx_monsterprotratio = StExt_DiffMode_Prot + extra_diff_prot;
	rx_monsterpower = StExt_DiffMode_Pwr + extra_diff_power;	
	rx_fullsnc_koef = StExt_Config_SncExp;
	rx_partyexp = StExt_Config_PartyExp;
	
	rx_beliarrageactivevalue = StExt_IfInt(StExt_Config_BelliarRage_Active, 871034, false);	
	rx_beliarrage_opt_monstersexp = StExt_Config_BelliarRageExp;
	rx_beliarrage_opt_staminareduce = StExt_Config_BelliarRage_StaminaReduce;
	rx_beliarrage_opt_spawnmonsters = StExt_Config_BelliarRage_SpawnMonsters;
	rx_beliarrage_opt_adddamagereduce = StExt_Config_BelliarRage_AddDamageReduce;
	rx_beliarrage_opt_regenenemies = StExt_Config_BelliarRage_RegenEnemies;
	rx_beliarragesoundenable = StExt_Config_BelliarRage_SoundEnable;
	
	if (StExt_ArtifactEquipped > 0) { xp_per_victory = StExt_DiffMode_Exp + StExt_Config_ExpMod - 2; }
	else { xp_per_victory = StExt_DiffMode_Exp + StExt_Config_ExpMod; };
	
	if (rx_monsterprotratio < 100) { rx_monsterprotratio = 100; };
    if (rx_monsterhpratio < 50) { rx_monsterhpratio = 50; };
    if (rx_monsterpower < 100) { rx_monsterpower = 100; };
	if (xp_per_victory < 1) { xp_per_victory = 1; };
};

func void StExt_MigrateModVersion(var int currentVersion, var int newVersion)
{
	var string modStr;
	modStr = concatstrings(StExt_Str_NewVersionMigrateNotify, " [");
	modStr = concatstrings(modStr, StExt_VersionToString(currentVersion));
	modStr = concatstrings(modStr, " -> ");
	modStr = concatstrings(modStr, StExt_VersionToString(newVersion));
	modStr = concatstrings(modStr, "]");
	ai_printbonus(modStr);
	
	if (currentVersion < 308)
	{
		StExt_Config_WorldRandomization_EnableChestUpdate = true;		
		StExt_Config_WorldRandomization_EnableRandomBandits = true;
		StExt_Config_WorldRandomization_FamaleBanditChance = 35;
		StExt_Config_WorldRandomization_BanditsPacksSpawnRate = 3;
		StExt_Config_WorldRandomization_BanditsPacksPerSpawn = 1;
		StExt_Config_WorldRandomization_BanditsPowerMult = 100;
		StExt_Config_WorldRandomization_BanditsCountMin = 1;
		StExt_Config_WorldRandomization_BanditsCountMax = 3;
		StExt_Config_WorldRandomization_BanditsCountBonusPerKapitel = 1;
	};
	if (currentVersion < 305)
	{
		StExt_Config_DisplayMasteryLevelUp = true;
		StExt_Config_EnableWorldRandomization_ByTimeEvents = true;
		
		StExt_Config_MasteryExpMult_Fire = 100;
		StExt_Config_MasteryExpMult_Ice = 100;
		StExt_Config_MasteryExpMult_Electric = 100;
		StExt_Config_MasteryExpMult_Air = 100;
		StExt_Config_MasteryExpMult_Earth = 100;
		StExt_Config_MasteryExpMult_Light = 100;
		StExt_Config_MasteryExpMult_Dark = 100;
		StExt_Config_MasteryExpMult_Death = 100;
		StExt_Config_MasteryExpMult_Life = 100;
		StExt_Config_MasteryExpMult_Golem = 100;
		StExt_Config_MasteryExpMult_Demon = 100;
		StExt_Config_MasteryExpMult_Necro = 100;
		StExt_Config_MasteryExpMult_Shaman = 100;
		StExt_Config_MasteryExpMult_MartialArts = 100;
		StExt_Config_MasteryExpMult_Agile = 100;
		StExt_Config_MasteryExpMult_Archery = 100;
		StExt_Config_MasteryExpMult_Blood = 100;
		StExt_Config_MasteryExpMult_FistFight = 100;
		StExt_Config_MasteryExpMult_Aura = 100;
		StExt_Config_MasteryExpMult_Traps = 100;
		StExt_Config_MasteryExpMult_Poision = 100;
		
		StExt_ExtraSnCStat_EnergyShield_ExpNext = 500;
	};
	if (currentVersion < 304)
	{
		StExt_Config_DamageReductionExpRate = 50;
	};
	if (currentVersion < 301)
	{
		StExt_Config_Npc_InfusionHpMult = 100;
		StExt_Config_Npc_InfusionEsMult = 100;
		StExt_Config_Npc_InfusionStatMult = 100;
		StExt_Config_Npc_InfusionProtMult = 100;
		StExt_Config_Npc_InfusionDamMult = 100;
	};
};

func int StExt_CheckModVersion()
{
	var string modStr;
	if (StExt_CurrentModVersion < StExt_ModVersion)
	{
		modStr = concatstrings(StExt_Str_NewVersionNotify, " (");
		modStr = concatstrings(modStr, StExt_GetCurrentVersion());
		modStr = concatstrings(modStr, ")");
		ai_printbonus(modStr);
		
		StExt_MigrateModVersion(StExt_CurrentModVersion, StExt_ModVersion);
		StExt_ValidateConfigValues();
		StExt_CurrentModVersion = StExt_ModVersion;		
	};
	
	if (StExt_Config_ModMenuKey == 0) { StExt_Config_ModMenuKey = key_t; };
	if (StExt_Config_ModCraftKey == 0) { StExt_Config_ModCraftKey = key_c; };
	if (StExt_Config_AuraCastKey == 0) { StExt_Config_AuraCastKey = key_o; };
	if (StExt_Config_ModOptionsKey == 0) { StExt_Config_ModOptionsKey = key_o; };
	if (StExt_Config_WeaponSkillKey == 0) { StExt_Config_WeaponSkillKey = key_h; };
	
	if (StExt_Config_PcMainActionKey == 0) { StExt_Config_PcMainActionKey = key_lcontrol; };
	if (StExt_Config_PcSecondaryActionKey == 0) { StExt_Config_PcSecondaryActionKey = key_lshift; };
	if (StExt_Config_PcSupportActionKey == 0) { StExt_Config_PcSupportActionKey = key_lmenu; };
};

func void StExt_CheatController()
{
	if (!StExt_Config_CheatsEnabled)
	{
		Stext_Cheat_Immortal = false;
		Stext_Cheat_Invisible = false;
	};
};

func void StExt_RoTController()
{
	if ((!rx_rt_vobtree_1) && (currentlevel == newworld_zen)) 
	{
        rx_rt_vobtree_1 = true;
        rx_insertvobtree("VOBTREE/RX_VOBTREE_RT_START_1.ZEN");
        rx_insertvobtree("VOBTREE/RT_VOBTREE_DEXTER_RT.ZEN");
        rx_insertvobtree("VOBTREE/RT_VOBTREE_SPIDERS.ZEN");
        rx_insertvobtree("VOBTREE/RT_VOBTREE_SPIDERS_2.ZEN");
    };
	rx_rt_spawn();
    if (StExt_Config_Diff_EnableRot_Bandits) { rx_rt_banditsloop(); };
    if (StExt_Config_Diff_EnableRot_NightEncounters) { rx_rt_nightencounterloop(); };
    if (StExt_Config_Diff_EnableRot_Avengers) { rx_rt_avengersloop(); };
};

func void StExt_PcEsPostController()
{
	var int esCur; esCur = StExt_Npc_GetCurEs(hero);
	var int esMax; esMax = StExt_Npc_GetMaxEs(hero);
	var int esTmp; esTmp = StExt_PcEsBuffer - esCur;
	
	//StExt_PcEsNoRegenFlag	
	if (esTmp > 0) { StExt_Npc_ChangeEs(hero, esTmp + StExt_PcEsRegBuffer); }
	else if (StExt_PcEsNoRegenFlag > 1) { StExt_Npc_ChangeEs(hero, StExt_PcEsRegBuffer); };
	
	if (esCur >= esMax) { StExt_PcEsNoRegenFlag = 0; }
	else if (esCur < esMax) { StExt_PcEsNoRegenFlag += 1; }
	else { StExt_PcEsNoRegenFlag -= 1; };
	StExt_PcEsNoRegenFlag = StExt_ValidateValueRange(StExt_PcEsNoRegenFlag, 0, 3);
	StExt_PcEsBuffer = 0;
};

func void StExt_KarmaController()
{
	var int absInnos;
	var int absBeliar;
	var int avg;
	var int diff;
	
	StExt_InnosKarma = innospraycount - innoscrimecount;
	StExt_BeliarKarma = beliarpraycount;

	absInnos = StExt_Abs(StExt_InnosKarma);
	absBeliar = StExt_Abs(StExt_BeliarKarma);
	if (absInnos == 0 && absBeliar == 0) { StExt_AdanosKarma = StExt_AdanosKarmaBonus - StExt_AdanosKarmaPenalty; }
	else
	{
		avg = StExt_GetPercentFromValue(absInnos + absBeliar, 50);
		diff = StExt_Abs(absInnos - absBeliar);
		StExt_AdanosKarma = (avg - StExt_GetPercentFromValue(diff, 50) - StExt_AdanosKarmaPenalty) + StExt_AdanosKarmaBonus;
	};
};

func void StExt_TimeController()
{
	var int hour;
	var int day;
	hour = wld_gettimehour();
	day = wld_getday();
	StExt_CurrentDayPart = StExt_TimeBindingFlag_None;
	
	StExt_CurrentDay = day;
	StExt_CurrentKapitel = kapitel;
	StExt_CurrentHeroLevel = hero.level;
	
	if ((hour >= 0) && (hour < 4)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Midnight;
		if (StExt_TimeBindingEvtDay_Midnight < day) 
		{
			StExt_TimeBindingEvtDay_Midnight = day;
			Hlp_DoEvent("StExt_Evt_OnMidnight");			
		};
	};
	if ((hour >= 4) && (hour < 8)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Dawn; 
		if (StExt_TimeBindingEvtDay_Dawn < day) 
		{
			StExt_TimeBindingEvtDay_Dawn = day;
			Hlp_DoEvent("StExt_Evt_OnDawn");			
		};
	};
	if ((hour >= 6) && (hour < 10)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Morning;
		if ((StExt_TimeBindingEvtDay_Morning < day) && (hour >= 8))
		{
			StExt_TimeBindingEvtDay_Morning = day;
			Hlp_DoEvent("StExt_Evt_OnMorning");			
		};
	};
	if ((hour >= 10) && (hour < 14)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Noon;
		if ((StExt_TimeBindingEvtDay_Noon < day) && (hour >= 12))
		{
			StExt_TimeBindingEvtDay_Noon = day;
			Hlp_DoEvent("StExt_Evt_OnNoon");			
		};
	};
	if ((hour >= 14) && (hour < 18)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Afternoon;
		if ((StExt_TimeBindingEvtDay_Afternoon < day) && (hour >= 16))
		{
			StExt_TimeBindingEvtDay_Afternoon = day;
			Hlp_DoEvent("StExt_Evt_OnAfternoon");			
		};
	};
	if ((hour >= 18) && (hour < 20)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Dusk; 
		if (StExt_TimeBindingEvtDay_Dusk < day) 
		{
			StExt_TimeBindingEvtDay_Dusk = day;
			Hlp_DoEvent("StExt_Evt_OnDusk");			
		};
	};
	if ((hour >= 20) && (hour < 24)) 
	{ 
		StExt_CurrentDayPart = StExt_CurrentDayPart | StExt_TimeBindingFlag_Evening;
		if (StExt_TimeBindingEvtDay_Evening < day) 
		{
			StExt_TimeBindingEvtDay_Evening = day;
			Hlp_DoEvent("StExt_Evt_OnEvening");			
		}; 
	};
	
	if (StExt_TimeBindingEvtDay_NewDay < day)
	{
		StExt_TimeBindingEvtDay_NewDay = day;
		Hlp_DoEvent("StExt_Evt_OnNewDay");
	};
};

func void StExt_ShowHelpMsg()
{
	printscreencolor(StExt_Str_HelpStrings[0], StExt_Null, 38, StExt_DefaultFont, 1, StExt_Color_Header);
	printscreencolor(StExt_Str_HelpStrings[1], StExt_Null, 40, StExt_DefaultFont, 1, StExt_Color_Green);
	printscreencolor(StExt_Str_HelpStrings[2], StExt_Null, 42, StExt_DefaultFont, 1, StExt_Color_Green);
	printscreencolor(StExt_Str_HelpStrings[3], StExt_Null, 44, StExt_DefaultFont, 1, StExt_Color_Green);
	printscreencolor(StExt_Str_HelpStrings[4], StExt_Null, 46, StExt_DefaultFont, 1, StExt_Color_Green);
	printscreencolor(StExt_Str_HelpStrings[5], StExt_Null, 48, StExt_DefaultFont, 1, StExt_Color_Green);
	printscreencolor(StExt_Str_HelpStrings[6], StExt_Null, 50, StExt_DefaultFont, 1, StExt_Color_Green);
	printscreencolor(StExt_Str_HelpStrings[7], StExt_Null, 52, StExt_DefaultFont, 1, StExt_Color_Common);
};

// From here we call all other mod controllers
func void StExt_ModController()
{
	Hlp_DoEvent("StExt_Evt_MainLoop");
	if (StExt_GamePaused()) { return; };
	// Blogoslawienstwo Cienia: pragnienie krwi wampira PotD nigdy nie
	// wzbiera (prog 100% w RX_VampireThirstTimer to JEDYNY wyzwalacz kar;
	// picie krwi zostaje jako czysty buff).
	if (StExt_KnightPerk_Shadow) { RX_VampireThirstTimer = 0; };
	if (!StExt_ModInitialized) 
	{
		if (rx_herocreated && givepack) { StExt_InitializeMod(); }
		else { return; };
	};
	if (!rx_herocreated && !givepack) { return; };
	if (StExt_IsLevelChangingFlag)
	{
		StExt_IsLevelChangingFlag = false;
		StExt_PrintDebugStack("World changed. Resume mod loop");
		return;
	};
	StExt_CheckUid(hero);
	StExt_CheckGatedSpawns();

	StExt_CheckModVersion();
	StExt_CalculateDiff();
	StExt_CheatController();
	StExt_TimeController();
	
	StExt_LevelingOnTick();
	StExt_HeroController();	
	StExt_PotionsController();
	StExt_FoodController();
	StExt_AuraController();
	StExt_SpellController();
	
	StExt_ItemAbilitiesController();
	StExt_WorldRandomizerController();
	
	if (StExt_UpdateSkin) { StExt_SkinController(); };
	if (StExt_Config_Diff_EnableRot) { StExt_RoTController(); };
	if (!StExt_ModHelpAccepted && (rx_herocreated && givepack)) { StExt_ShowHelpMsg(); };
	
	// fix for es drop
	StExt_PcEsPostController();	
	StExt_UpdateEquipmentDamageInfo();
	StExt_KarmaController();	
	
	// Temp flags. Reset them just in case
	StExt_Damage_SkillCrtiticalShotDone = false;
	StExt_AuraOnTickProcessing = false;
	StExt_ReflectSpellAbility_InUse = false;
	StExt_Damage_SpellCastFrameOffset = 0;
	
	if (StExt_DisplayModMenu && infomanager_hasfinished())
	{
		StExt_DisplayModMenu = false;
		StExt_EnableUiMoving(StExt_Null);
		StExt_EnableConfigValueEdit(StExt_EmptyString, StExt_EmptyString, StExt_Null);
	};
};

var int StExt_ClearTriggers_Count;
func int StExt_ClearTriggers_Loop(var int index)
{
	var C_TimedEffect trigger;
	if (index >= StExt_ClearTriggers_Count) { return false; };
		
	trigger = StExt_GetTimedEffectByIndex(index);
	if (!Hlp_IsNULL(trigger))
	{
		if (trigger.SelfUId == StExt_HeroUid) 
		{
			StExt_PrintDebugStack(concatstrings("Skip hero trigger. Id: ", inttostring(index)));
			return (index < StExt_ClearTriggers_Count);
		};
		StExt_PrintDebugStack(concatstrings("Clear trigger id: ", inttostring(index)));

		// make difference from dot and regular triggert
		if (StExt_ValueHasFlag(trigger.Flags, StExt_TimedEffect_Flag_Dot))
		{
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_True] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Blunt] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Edge] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fire] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Fly] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Magic] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Point] = StExt_Null;
			trigger.AIVar[StExt_TimedEffect_AiVar_DamageTicks_Poison] = StExt_Null;
		}
		else { trigger.AIVar[StExt_TimedEffect_AiVar_Timer] = StExt_Null; };
	}
	else { StExt_PrintDebugStack(concatstrings("Trigger not found! Id: ", inttostring(index))); };
	return (index <= StExt_ClearTriggers_Count);
};
func void StExt_ClearTriggers()
{
	StExt_PrintDebugStack("Clear triggers...");
	StExt_ClearTriggers_Count = StExt_GetTimedEffectsCount();
	if (StExt_ClearTriggers_Count > 0)
	{
		StExt_PrintDebugStack(concatstrings("Triggers to clear: ", inttostring(StExt_ClearTriggers_Count)));
		StExt_While(StExt_ClearTriggers_Loop);
	};
	StExt_PrintDebugStack("Triggers cleared!");
};

// Calls from engine when level starts to change
func void StExt_OnLevelChange()
{
	if (!StExt_Config_DebugAlwaysEnabled) { StExt_Config_DebugEnabled = false; };
	StExt_PrintDebugStack("Start world change...");
	StExt_IsLevelChangingFlag = true;
	StExt_DisplayModMenu = false;
	StExt_ClearTriggers();
	
	// handle special summons counters
	StExt_KillAllSpecialSummons();
	Hlp_DoEvent("StExt_Evt_OnLevelChange");
};

func void StExt_LoadGlobalSymbols()
{
	StExt_GameParserIndex = Par_GetParserID("Game");
};

// Triggers when save generaly loading. Include new game...
// <slotIndex states>
// None: -3
// New game: -2
// Current: -1
// Quick: 0 //???
// Saved: 1-20

func void StExt_OnLoadEnd(var int slotIndex)
{
	if (!StExt_Config_DebugAlwaysEnabled) { StExt_Config_DebugEnabled = false; };
	StExt_PrintDebugStack("StExt_OnLoadEnd()");
	StExt_EvntArgs_CurrentSaveId = slotIndex;
	
	StExt_LoadSaveConfigs();
	StExt_ValidateConfigValues();
	StExt_ValidateModValues();
	StExt_KillAllSpecialSummons();
	StExt_LoadGlobalSymbols();
	StExt_MigrateMasteryPerkPointsV2();
	StExt_CheckGatedSpawns();	// Kowal itp. natychmiast po wczytaniu (nie czekaj na tick)
	StExt_StartUncaper();
	StExt_DisplayModMenu = false;
	
	RX_ToggleLootParts(StExt_Config_EnableEnemiesArmorLoot);
	Hlp_DoEvent("StExt_Evt_OnLoadEnd");
	rx_callback(15.0, StExt_OverrideGameConfigsFile);
};

func void StExt_OnFrameBegin() { };
func void StExt_OnFrameEnd() { };

// Triggers when user start make save
func void StExt_OnSaveGame(var int slotIndex) 
{
	StExt_PrintDebugStack("StExt_OnLoadEnd()");
	StExt_EvntArgs_CurrentSaveId = slotIndex;
	Hlp_DoEvent("StExt_Evt_OnSaveGame");
};

func int StExt_CanCallModMenu()
{
	if (StExt_GamePaused()) { return false; };
	if (!infomanager_hasfinished()) { return false; };
	if (!npc_isinfightmode(hero, fmode_none)) { return false; };
	if (npc_isinstate(hero, zs_dead) || (hero.attribute <= 0) || heroisdead) { return false; };
	if (player_mobsi_production != mobsi_none) { return false; };
	return true;
};

func int StExt_CanDrawEsBar()
{
	if (StExt_GamePaused()) { return false; };
	if (!infomanager_hasfinished()) { return false; };
	if (player_mobsi_production != mobsi_none) { return false; };
	return true;
};

func int StExt_IsHeroMovLocked()
{
	if (npc_isinstate(hero, zs_talk) || !infomanager_hasfinished() || endgamecredits || optioncheck || cammodeon || bheroisincutscene || (magespeechstart && (!magespeechendstop))) { return true; };
	if ((StExt_HeroStuned > 0) || StExt_DisplayModMenu) { return true; };
	if (player_mobsi_production != mobsi_none) { return true; };
	return false;
};

func void StExt_UpdateUiStatus()
{
	StExt_CanShowPcEsBar = StExt_CanDrawEsBar();
	StExt_CanShowModMenu = StExt_CanCallModMenu();
	StExt_BlockPcMovement = StExt_IsHeroMovLocked();
};


func int StExt_TestBonus_Loop(var int index)
{
	if (index >= 100) { return false; };
	StExt_ApplyPotionEffect(index, 10, 12 + hlp_random(12));
	return (index < 100);
};

// Just for tests purpouses
// If you look for a way to run some test scripts, here is exactly right spot to do it.
func void StExt_TestScriptFunc()
{
	ai_printbonus("StExt_Test: Script run...");
	
	// Do something...
	
	/*
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 600), 1);

	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Helm"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Helm"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Helm"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Helm"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Helm"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Helm"), 600), 1);
	
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Torso"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Torso"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Torso"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Torso"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Torso"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Torso"), 600), 1);
	
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Pants"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Pants"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Pants"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Pants"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Pants"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Pants"), 600), 1);
	
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Boots"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Boots"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Boots"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Boots"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Boots"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Boots"), 600), 1);
	
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Gloves"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Gloves"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Gloves"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Gloves"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Gloves"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Gloves"), 600), 1);
	
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 10), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 100), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 200), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 300), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 400), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 500), 1);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_1hWeapon"), 600), 1);
	
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 100), 10);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 200), 10);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 300), 10);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 400), 10);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 500), 10);
	b_playerfinditem_stext(StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 600), 10);
	*/
	
	//ai_printbonus(concatstrings("StExt_HeroUid: ", inttostring(StExt_HeroUid)));
	
	//var int tmp;
	//StExt_SetNpcVar(hero, 10, 666);
	//tmp = StExt_GetNpcVar(hero, 10);
	//ai_printbonus(concatstrings("Tmp: ", inttostring(tmp)));
	
	/*
	var C_ExtraDamageInfo desc;	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	StExt_InitializeScriptDamageDesc(desc);
	
	desc.TotalDamage = 8000;	
	desc.DamageType = StExt_DamageType_Ability;
	desc.DamageFlags = StExt_DamageFlag_Aoe;	
	desc.Radius = 2500;
	desc.MaxTargets = 32;
	
	desc.Damage = 1000;
	desc.Damage[dam_index_blunt] = 1000;
	desc.Damage[dam_index_edge] = 1000;
	desc.Damage[dam_index_fire] = 1000;
	desc.Damage[dam_index_fly] = 1000;
	desc.Damage[dam_index_magic] = 1000;
	desc.Damage[dam_index_point] = 1000;
	desc.Damage[dam_index_fall] = 1000;
	
	StExt_CastAoeEffect(hero, "spellfx_icewave", desc);
	StExt_Struct_Free(desc);
	*/
	
	StExt_GiveExtraArmorLoot(hero, 100, false);
	
	ai_printbonus("StExt_Test: Script done!");
};

// React to key events
func int StExt_HandleKeyEvent(var int ukey) 
{
	var int isShiftPressed;
	
	if (!givepack) { return false; };
	isShiftPressed = Hlp_KeyPressed(key_lshift) || Hlp_KeyPressed(key_rshift);
	
	if ((ukey == StExt_Config_ModMenuKey) && StExt_CanCallModMenu() && !isShiftPressed)
	{ 
		StExt_DisplayModMenu = true;
		ai_processinfos(hero); 
		return true;
	};
	if ((ukey == StExt_Config_AuraCastKey) && !isShiftPressed) { Hlp_DoEvent("OnAuraCastKeyPress"); return true; };
	if ((ukey == StExt_Config_WeaponSkillKey) && !isShiftPressed) { Hlp_DoEvent("OnWeaponSkillKeyPress"); return true; };
	if (StExt_Config_TestKeysEnabled && (ukey == key_k)) 
	{
		StExt_TestScriptFunc();
		return true;
	};
	return false;
};

// This waypoints prohibit from spawning monsters and items.
func void StExt_InitializeProhibitedWaypoints()
{
	StExt_ProhibitWp("HAFEN", 10000);
	StExt_ProhibitWp("DOWNTOWN", 10000);
	StExt_ProhibitWp("MARKT", 8500);
	StExt_ProhibitWp("SAVE_SPOT_MIL", 8500);
	StExt_ProhibitWp("REICH", 8500);
	StExt_ProhibitWp("FARM4", 6000);
	StExt_ProhibitWp("FARM3", 6000);
	StExt_ProhibitWp("NW_FARM2_BENCH_02", 5000);
	StExt_ProhibitWp("NW_FARM1_LOBART", 5000);
	StExt_ProhibitWp("BFARM", 8500);
	StExt_ProhibitWp("TP_KLOSTER", 8500);
	StExt_ProhibitWp("SAVE_SPOT_HUN", 3500);
	StExt_ProhibitWp("SAVE_SPOT_PSI", 4500);
	StExt_ProhibitWp("NW_TAVERNE", 5000);
	StExt_ProhibitWp("NW_SAGITTA_CAVE_07", 3000);
	StExt_ProhibitWp("START", 3000);
	StExt_ProhibitWp("OC_MAGE_CENTER", 5000);
	StExt_ProhibitWp("STRAND", 10000);
	StExt_ProhibitWp("PORTALTEMPEL", 5000);
	StExt_ProhibitWp("BANDIT", 5000);
	StExt_ProhibitWp("BL_RAVEN_01", 10000);
	StExt_ProhibitWp("NW_CITY_PIRATESCAMP_01", 1000);
	StExt_ProhibitWp("NW_CITY_PIRATESCAMP_02", 1000);
	StExt_ProhibitWp("NW_CITY_PIRATESCAMP_03", 1000);
	StExt_ProhibitWp("NW_CITY_PIRATESCAMP_04", 1000);
	StExt_ProhibitWp("NW_CITY_SAILORWAY_02", 3000);
	StExt_ProhibitWp("NW_CITY_SAILORWAY_03", 3000);
	StExt_ProhibitWp("NW_CITY_SAILORWAY_04", 3000);
	StExt_ProhibitWp("NW_CITY_SAILORWAY_05", 3000);
	StExt_ProhibitWp("NW_CITY_SAILORWAY_06", 3000);
	StExt_ProhibitWp("NW_XARDAS_TOWER_IN1_17", 2000);
	StExt_ProhibitWp("NW_XARDAS_TOWER_IN1_18", 2000);
	StExt_ProhibitWp("NW_XARDAS_TOWER_IN1_19", 2000);
	StExt_ProhibitWp("NW_XARDAS_TOWER_IN1_20", 2000);
	StExt_ProhibitWp("NW_PSICAMP_KAIN", 2500);
	StExt_ProhibitWp("NW_FRAM3_FIELD_03", 2500);
	StExt_ProhibitWp("NW_FRAM3_HOUSE_IN_NAVI_2", 2500);
	StExt_ProhibitWp("NW_FRAM3_HOUSE_IN_NAVI", 2500);
	StExt_ProhibitWp("NW_FRAM3_HOUSE_IN_2", 2500);
	StExt_ProhibitWp("NW_DARKFOREST_CAVE_02_01", 2000);
	StExt_ProhibitWp("NW_DARKFOREST_CAVE_02_02", 2000);
	StExt_ProhibitWp("NW_DARKFOREST_CAVE_02_03", 2000);
	StExt_ProhibitWp("NW_TROLLAREA_PORTALTEMPEL_SRTUDY_01", 3000);
	StExt_ProhibitWp("NW_TROLLAREA_PORTALTEMPEL_40", 3000);
	StExt_ProhibitWp("NW_TROLLAREA_PORTALTEMPEL_41", 3000);
	StExt_ProhibitWp("NW_TROLLAREA_PORTALTEMPEL_20", 3000);
	StExt_ProhibitWp("NW_TELEPORTSTATION_MAYA", 5000);
	StExt_ProhibitWp("NW_DARKFOREST_IN_01_119", 3000);
	StExt_ProhibitWp("NW_DARKFOREST_IN_01_106", 3000);
	StExt_ProhibitWp("NW_DARKFOREST_IN_01_100", 3000);
	StExt_ProhibitWp("NW_DARKFOREST_IN_01_120", 3000);
	StExt_ProhibitWp("NW_TROLLAREA_PATH_80", 1000);
	StExt_ProhibitWp("NW_TROLLAREA_PATH_71", 1000);
	StExt_ProhibitWp("NW_TROLLAREA_PATH_73", 1000);
	StExt_ProhibitWp("NW_TROLLLAKECAVE", 2000);
	StExt_ProhibitWp("NW_TROLLAREA_TROLLLAKECAVE_01", 2000);
	StExt_ProhibitWp("NW_CITY_JAEGER_SIT_99", 1000);
	StExt_ProhibitWp("NW_CITY_JAEGER_SIT", 1000);
	StExt_ProhibitWp("NW_CITY_JAEGER_07", 1000);
	StExt_ProhibitWp("NW_BIGFARM_ALLEE_HUT", 2000);
	StExt_ProhibitWp("NW_BIGFARM_HUT_01", 2000);
	StExt_ProhibitWp("NW_BIGFARM_ALLEE_10", 2000);
	StExt_ProhibitWp("CASTLEMINE", 4000);
	StExt_ProhibitWp("NW_CASTLEMINE_TOWER_HUT", 4000);
	StExt_ProhibitWp("NW_CASTLEMINE_TOWER_HUT_03", 4000);
	StExt_ProhibitWp("NW_CASTLEMINE_TOWER_D", 4000);
	StExt_ProhibitWp("NW_CASTLEMINE_TOWER_CAMPFIRE", 3000);
	StExt_ProhibitWp("NW_CASTLEMINE_NAVIGATION", 3000);
	StExt_ProhibitWp("NW_FORESTFORT", 15000);	
	StExt_ProhibitWp("NW_CITY_WAY_TO_SHIP_10", 4000);
	StExt_ProhibitWp("NW_CITY_WAY_TO_SHIP_022", 4000);
	StExt_ProhibitWp("NW_CITY_WAY_TO_SHIP_21", 4000);
	StExt_ProhibitWp("NW_CITY_WAY_TO_SHIP_118", 4000);
	StExt_ProhibitWp("NW_CITY_WAY_TO_SHIP_18", 4000);
	StExt_ProhibitWp("NW_CITY_WAY_TO_SHIP_23", 4000);	
	StExt_ProhibitWp("NW_FORESTFORT_12", 5000);	
	StExt_ProhibitWp("NW_CITY_UPTOWN_PATH_21", 2000);
	StExt_ProhibitWp("NW_CITY_UPTOWN_PATH_20", 2000);
	StExt_ProhibitWp("NW_CITY_CITYHALL_09", 2000);
	StExt_ProhibitWp("NW_CITY_CITYHALL_08", 2000);	
	StExt_ProhibitWp("NW_CHOSTCHAPPEL", 3000);
	StExt_ProhibitWp("NW_CHOSTCHAPPEL_00", 3000);
	StExt_ProhibitWp("NW_CHOSTCHAPPEL_01", 3000);
	StExt_ProhibitWp("NW_TROLLAREA_PATH_79", 1500);
	StExt_ProhibitWp("NW_TROLLAREA_PATH_80", 1500);
	StExt_ProhibitWp("NW_TROLLAREA_RITUALFOREST_11", 1500);	
	StExt_ProhibitWp("NW_PSICAMP_GUARDCAMP", 2000);
	StExt_ProhibitWp("NW_FOREST_PATH_PSIGROUP", 1500);
	StExt_ProhibitWp("NW_FOREST_ASS_ATTACK", 1000);
	StExt_ProhibitWp("NW_FOREST_ASS_START", 1500);	
	StExt_ProhibitWp("NW_FOREST_FORT", 1500);
	StExt_ProhibitWp("PALADIN_FORT", 1500);
	StExt_ProhibitWp("SAVE_SPOT_PAL", 2500);
	StExt_ProhibitWp("ORC_CITY_40", 15000);
	StExt_ProhibitWp("SAVE_SPOT_02", 5000);
	StExt_ProhibitWp("PW_TEMPLE_01", 10000);
};

func void StExt_InitializeCorruptionTouchStatsData()
{
	//StExt_SetCorruptionTouchStatData(statId, statPerPoint, statMax);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Hp, 25, 2500);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Mp, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_St, 2, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Es, 25, 2500);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Str, 5, 500);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Agi, 5, 500);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Int, 5, 500);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_HpReg, 2, 50);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_MpReg, 2, 50);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_StReg, 2, 50);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_EsReg, 2, 50);	
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtEdge, 5, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtBlunt, 5, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtFire, 5, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtMagic, 5, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtFly, 5, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtPoint, 5, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ProtFall, 5, 250);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_IncomingDamageReduction, 25, 1000);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistEdge, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistBlunt, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistFire, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistMagic, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistFly, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistPoison, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistPoint, 10, 100);	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistDot, 15, 150);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AoeResist, 15, 150);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ResistReflect, 15, 150);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ExtraMeleeDam, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ExtraRangeDam, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ExtraSpellDam, 10, 1000);	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ExtraWeaponSkillDam, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AimChance, 25, 1000);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_DotExtraTick, 1, 5);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_EffectDuration, 50, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_MagicPower, 1, 25);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ExtraSpeed, 1, 10);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SpellCritChance, 25, 250);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SpellDoubleCastChance, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_WeapDoubleDamageChance, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_StunChance, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_FreezeChance, 10, 100);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AuraPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AuraDist, 25, 500);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AuraChance, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AuraConsumptionReduction, 10, 100);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_FireMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_IceMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_EarthMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_AirMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ElectricMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_LightMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_LifeMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_DeathMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_DemonMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_GolemMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_NecroMasteryPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ShamanMasteryPower, 10, 1000);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SumGlobalPower, 5, 500);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SumStatsPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SumProtPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SumDamagePower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SumHpPower, 10, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_SumHpRegen, 2, 50);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_BuffPower, 25, 1000);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_DebuffPower, 25, 1000);
	
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_Luck, 10, 100);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_ChestLuck, 15, 300);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_BodyLuck, 15, 300);
	StExt_SetCorruptionTouchStatData(StExt_PcStats_Index_LuckGold, 20, 500);
};

func void StExt_InitializeRandomNpcData()
{
	//StExt_SetRandomNpcData("XXX", 0000, 1);
	
	StExt_SetRandomNpcData("bloodfly1", 10, 2);
	StExt_SetRandomNpcData("bloodfly", 35, 2);
	StExt_SetRandomNpcData("ygiant_bug", 25, 2);
	StExt_SetRandomNpcData("giant_bug", 30, 2);
	StExt_SetRandomNpcData("ygiant_rat", 10, 2);
	StExt_SetRandomNpcData("giant_rat", 25, 2);
	StExt_SetRandomNpcData("scavengeryoung", 10, 2);
	StExt_SetRandomNpcData("keiler_young", 50, 1);
	StExt_SetRandomNpcData("waran", 65, 1);
	StExt_SetRandomNpcData("wolf_young", 15, 2);
	StExt_SetRandomNpcData("swamprat", 45, 1);
	StExt_SetRandomNpcData("lurker_young_nw", 50, 1);
	StExt_SetRandomNpcData("crab", 65, 1);
	StExt_SetRandomNpcData("crab_strong", 85, 1);
	StExt_SetRandomNpcData("swampdrone", 75, 1);
	StExt_SetRandomNpcData("gobbo_green1", 15, 2);
	StExt_SetRandomNpcData("wolf", 60, 2);
	StExt_SetRandomNpcData("orcbiter", 150, 1);
	StExt_SetRandomNpcData("blattcrawler_pack", 150, 1);
	StExt_SetRandomNpcData("molerat_young", 10, 2);
	StExt_SetRandomNpcData("molerat", 20, 2);
	StExt_SetRandomNpcData("scavenger_rare", 125, 2);
	StExt_SetRandomNpcData("lurker", 100, 1);
	StExt_SetRandomNpcData("giant_desertrat_fat", 95, 1);
	StExt_SetRandomNpcData("scavenger_mount", 140, 2);
	StExt_SetRandomNpcData("waran_south", 65, 1);
	StExt_SetRandomNpcData("swamprat_wc", 125, 1);
	StExt_SetRandomNpcData("gobbo_fisher", 100, 1);
	StExt_SetRandomNpcData("gobbo_boss", 110, 1);
	StExt_SetRandomNpcData("scavenger", 40, 2);
	StExt_SetRandomNpcData("scavenger_old", 75, 2);
	StExt_SetRandomNpcData("scavenger_dc", 95, 2);
	StExt_SetRandomNpcData("moleratold", 85, 2);
	StExt_SetRandomNpcData("bloodfly_poison", 125, 1);
	StExt_SetRandomNpcData("minecrawler_mini", 100, 1);
	StExt_SetRandomNpcData("moleratstrong", 120, 2);
	StExt_SetRandomNpcData("blackwolf_wc", 165, 2);
	StExt_SetRandomNpcData("wolfcanyon", 75, 2);
	StExt_SetRandomNpcData("seasonedlurker", 95, 1);
	StExt_SetRandomNpcData("giantbug_strong", 75, 1);
	StExt_SetRandomNpcData("gobbo_green", 60, 2);
	StExt_SetRandomNpcData("gobbo_black", 120, 2);
	StExt_SetRandomNpcData("lesser_skeleton_dark", 220, 1);
	StExt_SetRandomNpcData("lesser_skeleton", 200, 1);
	StExt_SetRandomNpcData("keiler", 180, 1);
	StExt_SetRandomNpcData("firewaran", 270, 1);
	StExt_SetRandomNpcData("swampdrone_wc", 175, 1);
	StExt_SetRandomNpcData("alligator_young", 160, 1);
	StExt_SetRandomNpcData("blattcrawler", 210, 1);
	StExt_SetRandomNpcData("giant_desertrat", 140, 2);
	StExt_SetRandomNpcData("keiler_elite", 220, 1);
	StExt_SetRandomNpcData("razor", 250, 1);
	StExt_SetRandomNpcData("stonepuma", 300, 1);
	StExt_SetRandomNpcData("death_fly", 280, 1);
	StExt_SetRandomNpcData("egglurker_common", 260, 1);
	StExt_SetRandomNpcData("spider_tara", 130, 1);
	StExt_SetRandomNpcData("snapper", 185, 2);
	StExt_SetRandomNpcData("oster", 245, 1);
	StExt_SetRandomNpcData("waranbig", 140, 1);
	StExt_SetRandomNpcData("waranbignormalsize", 140, 1);
	StExt_SetRandomNpcData("warg", 200, 1);
	StExt_SetRandomNpcData("wargsleep", 250, 1);
	StExt_SetRandomNpcData("spider", 210, 1);
	StExt_SetRandomNpcData("gobbo_warrior", 190, 1);
	StExt_SetRandomNpcData("gobbo_desert", 270, 1);
	StExt_SetRandomNpcData("gobbo_shaman", 220, 1);
	StExt_SetRandomNpcData("gobbo_mage", 170, 2);
	StExt_SetRandomNpcData("gobbo_blackcanyon", 165, 2);
	StExt_SetRandomNpcData("scavenger_demon", 140, 2);
	StExt_SetRandomNpcData("harpie", 280, 1);
	StExt_SetRandomNpcData("alligator", 270, 1);
	StExt_SetRandomNpcData("stoneguardian", 210, 1);
	StExt_SetRandomNpcData("spider_mine", 310, 1);
	StExt_SetRandomNpcData("minecrawler", 200, 1);
	StExt_SetRandomNpcData("stext_small_icegolem", 290, 1);
	StExt_SetRandomNpcData("stext_small_swampgolem", 290, 1);
	StExt_SetRandomNpcData("stext_small_firegolem", 290, 1);
	StExt_SetRandomNpcData("stext_small_stonegolem", 290, 1);
	StExt_SetRandomNpcData("demon_bosshelper", 310, 1);
	StExt_SetRandomNpcData("orcdog", 270, 1);
	StExt_SetRandomNpcData("keilervepr", 240, 1);
	StExt_SetRandomNpcData("zombie01", 235, 1);
	StExt_SetRandomNpcData("zombie03", 235, 1);
	StExt_SetRandomNpcData("skeleton", 225, 1);
	StExt_SetRandomNpcData("gobbo_skeleton", 180, 1);
	StExt_SetRandomNpcData("skeleton_bow_weak", 225, 1);
	StExt_SetRandomNpcData("draconian_scout", 260, 1);
	StExt_SetRandomNpcData("egglurker_wc_swamp", 230, 1);
	StExt_SetRandomNpcData("skeleton_sailor", 210, 1);
	StExt_SetRandomNpcData("orcwarrior1r", 300, 1);
	StExt_SetRandomNpcData("orcwarrior2", 300, 1);
	StExt_SetRandomNpcData("orcwarrior3r", 300, 1);
	StExt_SetRandomNpcData("orcwarrior4", 300, 1);
	StExt_SetRandomNpcData("orcwarriorsnipper", 300, 1);	
	StExt_SetRandomNpcData("dragonsnapper", 420, 1);
	StExt_SetRandomNpcData("shadowbeast", 350, 1);
	StExt_SetRandomNpcData("swampshark", 330, 1);
	StExt_SetRandomNpcData("minecrawlerwarrior", 280, 1);
	StExt_SetRandomNpcData("bloodhound", 250, 1);
	StExt_SetRandomNpcData("shadowbeast_skeleton", 375, 1);
	StExt_SetRandomNpcData("wargblack", 320, 1);
	StExt_SetRandomNpcData("orebug", 320, 1);
	StExt_SetRandomNpcData("drake", 350, 1);
	StExt_SetRandomNpcData("troll_young", 400, 1);
	StExt_SetRandomNpcData("troll_young_pw", 410, 1);
	StExt_SetRandomNpcData("gobbo_desert_shaman", 300, 1);
	StExt_SetRandomNpcData("minecrawlerwarrior_desert", 330, 1);
	StExt_SetRandomNpcData("blackwolf", 350, 1);
	StExt_SetRandomNpcData("stoneguardian_guard_pyra", 370, 1);
	StExt_SetRandomNpcData("stext_weak_icegolem", 380, 1);
	StExt_SetRandomNpcData("stext_weak_firegolem", 380, 1);
	StExt_SetRandomNpcData("stext_weak_stonegolem", 380, 1);
	StExt_SetRandomNpcData("swampgolem_valley", 360, 1);
	StExt_SetRandomNpcData("swampgolem", 370, 1);
	StExt_SetRandomNpcData("orcelite_roam", 400, 1);
	StExt_SetRandomNpcData("orkelite_bowmenroam", 410, 1);
	StExt_SetRandomNpcData("orcshaman_roam", 420, 1);
	StExt_SetRandomNpcData("orcwarrior_roam", 410, 1);
	StExt_SetRandomNpcData("woodgolem", 350, 1);
	StExt_SetRandomNpcData("mayazombie01", 330, 1);
	StExt_SetRandomNpcData("mayazombie02", 335, 1);
	StExt_SetRandomNpcData("mayazombie03", 340, 1);
	StExt_SetRandomNpcData("mayazombie04", 345, 1);
	StExt_SetRandomNpcData("zombie02", 320, 1);
	StExt_SetRandomNpcData("zombie04", 310, 1);
	StExt_SetRandomNpcData("skeleton_bow", 360, 1);
	StExt_SetRandomNpcData("skeleton_priest", 340, 1);
	StExt_SetRandomNpcData("skeleton_speer", 350, 1);
	StExt_SetRandomNpcData("skeleton_shield", 350, 1);
	StExt_SetRandomNpcData("skeleton_dark", 350, 1);
	StExt_SetRandomNpcData("skeleton_mage_av", 390, 1);
	StExt_SetRandomNpcData("skeleton_capitan", 430, 1);
	StExt_SetRandomNpcData("skeletonmage", 450, 1);
	StExt_SetRandomNpcData("skeletonmagepirate", 385, 1);
	StExt_SetRandomNpcData("skeleton_shadow_priestdt", 370, 1);
	StExt_SetRandomNpcData("skeleton_warrior_av", 400, 1);
	StExt_SetRandomNpcData("icewolf", 380, 1);
	StExt_SetRandomNpcData("skeleton_warrior", 360, 1);
	StExt_SetRandomNpcData("draconian", 470, 1);
	StExt_SetRandomNpcData("skeleton_bow_ancient", 430, 1);
	StExt_SetRandomNpcData("skeleton_oc", 395, 1);
	StExt_SetRandomNpcData("skeleton_shield_oc", 405, 1);
	StExt_SetRandomNpcData("skeleton_warrior_oc", 405, 1);
	StExt_SetRandomNpcData("skeleton_speer_oc", 405, 1);
	StExt_SetRandomNpcData("skeleton_warrior_av_elite", 465, 1);
	StExt_SetRandomNpcData("ghost_lh", 475, 1);	
	StExt_SetRandomNpcData("orewarriorbug", 435, 1);
	StExt_SetRandomNpcData("osterhunter", 445, 1);
	StExt_SetRandomNpcData("desertshark", 465, 1);
	StExt_SetRandomNpcData("icewolf_oz", 425, 1);
	StExt_SetRandomNpcData("shadowwolf", 435, 1);
	StExt_SetRandomNpcData("dragonsnapperelite", 490, 1);
	StExt_SetRandomNpcData("troll", 510, 1);
	StExt_SetRandomNpcData("valley_troll", 505, 1);
	StExt_SetRandomNpcData("maya_troll", 500, 1);
	StExt_SetRandomNpcData("swampsharkstrong", 510, 1);
	StExt_SetRandomNpcData("trollicesmall", 520, 1);
	StExt_SetRandomNpcData("ogre", 530, 1);
	StExt_SetRandomNpcData("argul", 495, 1);
	StExt_SetRandomNpcData("bodygathererrare", 485, 1);
	StExt_SetRandomNpcData("swampgolemstrong", 525, 1);
	StExt_SetRandomNpcData("firegolem", 530, 1);	
	StExt_SetRandomNpcData("icegolem", 530, 1);
	StExt_SetRandomNpcData("stonegolem", 535, 1);
	StExt_SetRandomNpcData("demon", 550, 1);
	StExt_SetRandomNpcData("shadowbeast_addon_fire", 570, 1);
	StExt_SetRandomNpcData("muritan", 530, 1);
	StExt_SetRandomNpcData("draconian_elite", 540, 1);
	StExt_SetRandomNpcData("orcshaman_elite", 550, 1);
	StExt_SetRandomNpcData("orkelite_addon2r", 535, 1);
	StExt_SetRandomNpcData("orc_hram_roam", 525, 1);
	StExt_SetRandomNpcData("orkelite_addon2_di", 530, 1);
	StExt_SetRandomNpcData("orkelite_bowmenroam", 540, 1);
	StExt_SetRandomNpcData("orc_skeleton", 555, 1);
	StExt_SetRandomNpcData("skeleton_dark_killer", 545, 1);
	StExt_SetRandomNpcData("skeleton_bow_strong", 540, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark", 550, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_axe", 550, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_speer", 550, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_shield", 550, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_shield_oc", 550, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_oc", 550, 1);
	StExt_SetRandomNpcData("skeleton_mage_av_elite", 580, 1);
	StExt_SetRandomNpcData("ghost", 590, 1);
	StExt_SetRandomNpcData("pal_zombie01", 535, 1);
	StExt_SetRandomNpcData("pal_zombie02", 540, 1);
	StExt_SetRandomNpcData("pal_zombie03", 545, 1);
	StExt_SetRandomNpcData("pal_zombie04", 550, 1);
	StExt_SetRandomNpcData("shadowwolfirdorat", 535, 1);
	StExt_SetRandomNpcData("darkhound", 595, 1);
	StExt_SetRandomNpcData("blacksnapper", 565, 1);
	StExt_SetRandomNpcData("stonepuma_oz", 570, 1);
	StExt_SetRandomNpcData("cursedzombie", 565, 1);
	StExt_SetRandomNpcData("skeleton_archemage", 575, 1);
	StExt_SetRandomNpcData("stoneguardian_ashtar", 515, 1);
	StExt_SetRandomNpcData("stoneguardian_undead_tt", 550, 1);	
	StExt_SetRandomNpcData("firewaran_lv", 600, 1);
	StExt_SetRandomNpcData("drake_lv", 610, 1);
	StExt_SetRandomNpcData("shadowwolftemple", 590, 1);
	StExt_SetRandomNpcData("dragonsnapperelite", 625, 1);
	StExt_SetRandomNpcData("shadowwolfirdorat", 645, 1);
	StExt_SetRandomNpcData("shadowbeast_ice", 630, 1);
	StExt_SetRandomNpcData("demonlord", 745, 1);
	StExt_SetRandomNpcData("skeleton_demon_chaos", 645, 1);
	StExt_SetRandomNpcData("troll_cave", 700, 1);
	StExt_SetRandomNpcData("troll_black", 695, 1);
	StExt_SetRandomNpcData("troll_black_war", 705, 1);
	StExt_SetRandomNpcData("troll_black_age", 710, 1);
	StExt_SetRandomNpcData("draconian_elite_drt", 675, 1);
	StExt_SetRandomNpcData("draconianshaman", 685, 1);
	StExt_SetRandomNpcData("draconian_elite", 665, 1);
	StExt_SetRandomNpcData("troll_di", 720, 1);
	StExt_SetRandomNpcData("troll_ice", 735, 1);
	StExt_SetRandomNpcData("skeleton_warrior_lv_shield", 695, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_lv_speer", 700, 1);
	StExt_SetRandomNpcData("skeleton_warrior_lv", 705, 1);
	StExt_SetRandomNpcData("skeleton_warrior_lv_axe", 710, 1);
	StExt_SetRandomNpcData("skeleton_knight", 715, 1);
	StExt_SetRandomNpcData("skeleton_knight_shield", 720, 1);
	StExt_SetRandomNpcData("skeleton_lord", 750, 1);
	StExt_SetRandomNpcData("skeleton_archemagedungeon", 765, 1);
	StExt_SetRandomNpcData("ghost_lv", 775, 1);
	StExt_SetRandomNpcData("skeleton_lord_di", 800, 1);
	StExt_SetRandomNpcData("zombie_lv", 765, 1);
	StExt_SetRandomNpcData("skeleton_lord_champion", 805, 1);
	StExt_SetRandomNpcData("skeleton_knight_shield_di", 775, 1);
	StExt_SetRandomNpcData("skeleton_bow_ancient_strong", 745, 1);
	StExt_SetRandomNpcData("demoniac_skeleton_guard", 765, 1);
	StExt_SetRandomNpcData("demoniac_skeleton_polearm", 770, 1);
	StExt_SetRandomNpcData("demoniac_skeleton_knight", 775, 1);
	StExt_SetRandomNpcData("skeleton_bow_strong", 765, 1);
	StExt_SetRandomNpcData("skeleton_archemage", 750, 1);
	StExt_SetRandomNpcData("skeleton_knight_death", 785, 1);
	StExt_SetRandomNpcData("skeleton_warrior_dark_shield_master", 780, 1);
	StExt_SetRandomNpcData("skeleton_shadow_priestdt", 750, 1);
	StExt_SetRandomNpcData("vb_orkelite_01", 725, 1);
	StExt_SetRandomNpcData("vb_orkelite_02", 730, 1);
	StExt_SetRandomNpcData("orcshaman_elite", 740, 1);
	StExt_SetRandomNpcData("orcelite_roam_di", 710, 1);
	StExt_SetRandomNpcData("orkelite_addon3r", 715, 1);
	StExt_SetRandomNpcData("orkelite_addon4r", 720, 1);
	StExt_SetRandomNpcData("skeleton_chaos_lord", 750, 1);
	StExt_SetRandomNpcData("skeleton_shadow_priest_di", 760, 1);
	StExt_SetRandomNpcData("reaperusual", 750, 1);	
};

func void StExt_OnModLoaded()
{
	StExt_PrintDebugStack("StExt_OnModLoaded()");

	StExt_InitializeProhibitedWaypoints();
	StExt_InitializeRandomNpcData();
	StExt_InitializeCorruptionTouchStatsData();
	StExt_InitializeConfigsData();
	
	Hlp_DoEvent("StExt_Evt_OnModLoaded");
};