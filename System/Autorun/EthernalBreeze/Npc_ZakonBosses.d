
//===================================================================//
//	Zakon Dusz - bosses (F2 hunt-per-chapter + F3 arena + F4 reward) //
//===================================================================//
// All bosses are HUMANS (dark-souls style: fallen knights, heretics,
// executioners) - per design, no monsters.
// F2: ONE hunted target per chapter, spawned ON DEMAND via the Soul
//     Master's hunt dialog (works on old saves - no init-once spawn).
//     Killing the current chapter's target unlocks the arena.
// F3: the Soul Master summons 10 CONCRETE challengers in FIXED order,
//     one at a time, escalating tiers; every kill drops a boss soul.
// F4: after the hunt + 10/10 arena kills -> chapter armor reward.

//--------------------------------------------------------------
// *** shared helpers ***
//--------------------------------------------------------------
// Migration: old saves flagged the chapter-1 heretic via a bool.
func void StExt_ZakonHunt_Migrate()
{
	if (StExt_ZakonHeretic_Dead) && (StExt_ZakonHunt_Done < 1) { StExt_ZakonHunt_Done = 1; };
};

func int StExt_ZakonHunt_CurChapter()
{
	if (kapitel > 5) { return 5; };
	if (kapitel < 1) { return 1; };
	return kapitel;
};

// Guaranteed boss loot: gold + one ENCHANTED item (weapon/jewelry/armor)
// scaled by hero level, chapter and boss tier. Tier 4 drops jewelry extra.
func void StExt_ZakonBoss_GiveLoot(var int tier)
{
	var int power;
	var int roll;
	var int itemType;
	var int itmId;
	var int wsub;

	if (!hlp_isvalidnpc(self)) { return; };
	// TEMP DIAG (crash-on-looting): every step of the boss drop goes to the
	// trace so we can see whether the game dies while GENERATING the loot
	// (here, at death) or later, while DISPLAYING it (DLL: ItemInfoPanel).
	StExt_Trace(concatstrings(">> ZakonBoss_GiveLoot tier=", inttostring(tier)));
	// item power ~ hero level (so drops match you, not level-430 nonsense).
	power = (hero.level * 7) + (kapitel * 40) + (tier * 80);
	createinvitems(self, itmi_gold, 800 + hlp_random(400) + (kapitel * 300) + (tier * 250));
	StExt_Trace(concatstrings("   .. zloto ok, power=", inttostring(power)));

	roll = hlp_random(6);
	if (roll <= 1)
	{
		// Melee, but NEVER a basic club/stick/mace - only swords & axes, so a
		// boss always drops a proper weapon (random stats are still fine).
		wsub = hlp_random(5);
		if (wsub == 0)      { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H"); }
		else if (wsub == 1) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe2H"); }
		else if (wsub == 2) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"); }
		else if (wsub == 3) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe1H"); }
		else                { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_DexSword"); };
	}
	else if (roll == 2) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_RangeWeapon"); }
	else if (roll == 3) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_MagicWeapon"); }
	else if (roll == 4) { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Jewelry"); }
	else { itemType = StExt_SelectItemClassFromList("StExt_ItemClass_List_AnyChestArmor"); };
	StExt_Trace(concatstrings("   .. GenerateRandomItem type=", inttostring(itemType)));
	itmId = StExt_GenerateRandomItem(itemType, power);
	StExt_Trace(concatstrings("   .. wygenerowany itmId=", inttostring(itmId)));
	StExt_CreateRandomItem(self, itmId, 1, false);
	StExt_Trace("<< ZakonBoss_GiveLoot OK");
	// (guaranteed second legendary-jewelry drop REMOVED - legendaries now
	// come from the global 5% boss roll in zs_dead, weapons/jewelry only)
};

// *** Unikatowe relikty Zakonu: 10 nazwanych legend, po jednej na slot ***
// Pierwszy kill danego slotu areny = GWARANTOWANY unikat rangi 5 (legendarny)
// z zywiolem bossa, nazwa wlasna i epickim meshem - pelna integracja z
// systemami (pieczecie, ranking, przekuwanie u Kowala). Kolejne kille tego
// slotu = normalny random loot. Maska bitowa slotow globalna przez cala gre.
func void StExt_ZakonBoss_GiveUnique()
{
	var int slot;
	var int bit;
	var int uTier;
	var int classId;
	var int power;
	var int itm;

	if (!hlp_isvalidnpc(self)) { return; };
	if ((self.id < 99711) || (self.id > 99720)) { return; };
	slot = self.id - 99710;
	bit = StExt_IntPow(2, slot - 1);
	if (StExt_ValueHasFlag(StExt_ZakonUnique_DroppedMask, bit)) { return; };
	StExt_ZakonUnique_DroppedMask = StExt_ZakonUnique_DroppedMask | bit;

	// tier arenowy bez TierById (tamta funkcja parsuje sie PONIZEJ OnKill,
	// a Daedalus jest single-pass): sloty 1-3 t1, 4-6 t2, 7-9 t3, 10 t4.
	uTier = 1 + ((slot - 1) / 3);
	power = (hero.level * 7) + (kapitel * 40) + (uTier * 80);
	itm = 0;

	if (slot == 1)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_ICELANCE");
		StExt_SetGeneratedItemName(itm, "Szept Zimy");
		StExt_SetGeneratedItemVisual(itm, "ItMw_GhostSword_01.3DS");
	}
	else if (slot == 2)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_LIGHTNINGFLASH");
		StExt_SetGeneratedItemName(itm, "Gniew Burzy");
		StExt_SetGeneratedItemVisual(itm, "ITMW_DOOMCREST.3DS");
	}
	else if (slot == 3)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_DARKBALL");
		StExt_SetGeneratedItemName(itm, "Calun Heretyka");
		StExt_SetGeneratedItemVisual(itm, "ITMW_BREATH_OF_BELLIAR.3DS");
	}
	else if (slot == 4)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe2H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_STONEFIRST");
		StExt_SetGeneratedItemName(itm, "Kamienny Wyrok");
		StExt_SetGeneratedItemVisual(itm, "ITMW_2H_DOOMAXE.3DS");
	}
	else if (slot == 5)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_INSTANTFIREBALL");
		StExt_SetGeneratedItemName(itm, "Zar Pokutnika");
		StExt_SetGeneratedItemVisual(itm, "ITMW_1H_G3A_DAEMONBLADE_01.3DS");
	}
	else if (slot == 6)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_ICELANCE");
		StExt_SetGeneratedItemName(itm, "Lodowa Litania");
		StExt_SetGeneratedItemVisual(itm, "ITMW_2H_HROMUNDCURSE.3DS");
	}
	else if (slot == 7)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_LIGHTNINGFLASH");
		StExt_SetGeneratedItemName(itm, "Piorunowy Psalm");
		StExt_SetGeneratedItemVisual(itm, "ItMw_2H_GodBane_01.3ds");
	}
	else if (slot == 8)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_DARKBALL");
		StExt_SetGeneratedItemName(itm, "Pozeracz Dusz");
		StExt_SetGeneratedItemVisual(itm, "ItMw_2H_DarkSoul.3DS");
	}
	else if (slot == 9)
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_STONEFIRST");
		StExt_SetGeneratedItemName(itm, "Kosa Grobowca");
		StExt_SetGeneratedItemVisual(itm, "ItMw_2H_IzgulScy.3DS");
	}
	else
	{
		classId = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H");
		itm = StExt_GenerateUniqueItem(classId, power, 5, "SPL_INSTANTFIREBALL");
		StExt_SetGeneratedItemName(itm, "Ostatnia Modlitwa");
		StExt_SetGeneratedItemVisual(itm, "ITMW_1H_DEATHBRINGER_NEW.3DS");
	};

	if (itm > 0)
	{
		StExt_CreateRandomItem(self, itm, 1, false);
		printscreencolor("RELIKT ZAKONU!", 62, 2, StExt_DefaultFont, 3, StExt_Color_Header);
		StExt_Trace(concatstrings("RELIKT ZAKONU wypadl: slot=", inttostring(slot)));
	};
};

func void StExt_ZakonBoss_OnKill()
{
	// chapter rollover resets the per-chapter counter
	if (StExt_ZakonBoss_Chapter != kapitel)
	{
		StExt_ZakonBoss_Chapter = kapitel;
		StExt_ZakonBoss_Killed = 0;
	};
	StExt_ZakonBoss_Killed += 1;
	StExt_ZakonBoss_Active = false;
	StExt_ZakonBoss_ActiveSlot = 0;
	StExt_ZakonBoss_GiveUnique();
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_bosssoul, 1); };
	// Jednorazowa runa powrotna do kaplicy - PRZYWROCONA do dropu: arena jest
	// teraz w krypcie i powrot na nogach bylby wedrowka przez pol mapy.
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_zakon_rune, 1); };
	if (StExt_ZakonBoss_Killed >= 10) { ai_printbonus(StExt_Str_ZakonBoss_ChapterDone); }
	else
	{
		ai_printbonus(concatstrings(concatstrings(StExt_Str_ZakonBoss_Killed_Pre, inttostring(StExt_ZakonBoss_Killed)), StExt_Str_ZakonBoss_Killed_Post));
	};
};

// Hunted target killed: unlock the arena for its chapter.
func void StExt_ZakonHunt_OnKill(var int chapter)
{
	if (StExt_ZakonHunt_Done < chapter) { StExt_ZakonHunt_Done = chapter; };
	if (hlp_isvalidnpc(self)) { createinvitems(self, itmi_stext_bosssoul, 1); };	// (zwoj teleportu do Mistrza WYCIETY z dropow - definicja itemu zostaje dla starych sejwow)
	StExt_ZakonBoss_GiveLoot(3);
	ai_printbonus(StExt_Str_ZakonHunt_Dead);
};

// Kit bossa per zywiol (id%5): fala + blink-strike + self-speed + summon
// (pod zagrywke fazy 50%) + pasywka on-hit + peleryna-aura (tozsamosc
// wizualna kazdego slotu). Max 8 z 10 slotow ability na NPC.
// ZAKAZ kanoniczny: zadnych rodzin on-death, zadnych infuzji-czarow.
func void StExt_ZakonBoss_ApplyKit(var c_npc slf, var int tier)
{
	var int elem; elem = slf.id % 5;
	if (elem == 0)
	{	// OGIEN
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Firewave);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_FireBlink);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_SummonFireGolem);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveFireDamage);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveFireCape);
	}
	else if (elem == 1)
	{	// LOD
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Icewave);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_IceBlink);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_SummonIceGolem);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveFreeze);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveIceCape);
	}
	else if (elem == 2)
	{	// BLYSKAWICE
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Electrowave);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_ElectroBlink);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_SummonSkeletonArcher);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveStun);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveElectricCape);
	}
	else if (elem == 3)
	{	// MROK
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Darkwave);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_DarkBlink);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_SummonZombie);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveCurser);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveDarkCape);
	}
	else
	{	// ZIEMIA
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Quake);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_QuakeBlink);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_SummonGolem);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveEarthQuake);
		StExt_Npc_AddAbility(slf, StExt_Npc_Ability_PassiveEarthCape);
	};
	StExt_Npc_AddAbility(slf, StExt_Npc_Ability_BuffSelfExtraSpeed);
	if (tier >= 3) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Whirlwind); };
	if (tier >= 4) { StExt_Npc_AddAbility(slf, StExt_Npc_Ability_Berzerk); };
};

// Shared statting: human boss scaled by chapter and player level.
// FIRST PASS balance - tune multipliers after in-game testing.
func void StExt_ZakonBoss_Setup(var c_npc slf, var int tier)
{
	b_setattributestochapter(slf, kapitel);
	// HP climbs the arena ladder: each boss carries +10% over the previous one,
	// so slot 10 ends up at +90% of slot 1 instead of every boss in a chapter
	// sharing one flat number. Ids 99711..99720 ARE the ladder (slot = id-99710);
	// hunt targets sit off it and stay at base. The base is the old formula / 1.4,
	// which puts slot 5 exactly on the value every boss used to get - so the ladder
	// now spreads around the old number instead of starting at it.
	var int bSlot;
	bSlot = 1;
	if ((slf.id >= 99711) && (slf.id <= 99720)) { bSlot = slf.id - 99710; };
	var int bBaseHp;
	bBaseHp = 25000 + (kapitel * 20000) + (hero.level * 2000) + (tier * 10000);
	slf.attribute[1] = (bBaseHp * (100 + ((bSlot - 1) * 10))) / 100;
	slf.attribute[0] = slf.attribute[1];
	// str/dex: NIGDY ponizej bazy NB (zgloszenie: "fanatyk bil dobrze, boss po 10").
	// b_setattributestochapter zna krzywa pancerza gracza - to strojenie autorow
	// Returninga. Nasz wzor NADPISYWAL ja w dol (~260 przy hero lvl 35), wiec boss
	// wychodzil slabszy od zwyklego fanatyka z tego samego rozdzialu. Teraz wzor
	// jest tylko PODLOGA: bierzemy wieksza z dwoch wartosci.
	var int bsNb;
	bsNb = slf.attribute[4];
	slf.attribute[4] = 120 + (kapitel * 40) + (tier * 30) + (hero.level * 2);
	if (slf.attribute[4] < bsNb) { slf.attribute[4] = bsNb; };
	bsNb = slf.attribute[5];
	slf.attribute[5] = 120 + (kapitel * 40) + (tier * 30) + (hero.level * 2);
	if (slf.attribute[5] < bsNb) { slf.attribute[5] = bsNb; };
	slf.level = 10 + (kapitel * 8) + tier + (hero.level / 2);
	b_setfightskills(slf, StExt_ValidateValueRange(60 + (kapitel * 8) + (tier * 5), 60, 100));

	// Passive "infusions" (no spells, no on-death): additional damage-type
	// resistances, evened across types and scaled by chapter/tier/level.
	slf.protection[1] = 100 + (kapitel * 40) + (tier * 40) + (hero.level / 3);	// blunt
	slf.protection[2] = 100 + (kapitel * 40) + (tier * 40) + (hero.level / 3);	// edge
	slf.protection[6] = 100 + (kapitel * 40) + (tier * 40) + (hero.level / 3);	// point
	slf.protection[3] = 80 + (kapitel * 30) + (tier * 30) + (hero.level / 4);	// fire
	slf.protection[4] = 80 + (kapitel * 30) + (tier * 30) + (hero.level / 4);	// fly
	slf.protection[5] = 80 + (kapitel * 30) + (tier * 30) + (hero.level / 4);	// magic

	// Kuratorowana infuzja per zywiol (PROCENTY od bazy, kanon): +30%
	// protekcji wlasnego zywiolu, -20% przeciwnego = celowa slabosc
	// (counterplay: bij bossa zywiolem, ktorego nienawidzi). Dziala na
	// bazowa bron i SPELLE gracza; zywiol na broni idzie kanalem pierce
	// i protekcji nie widzi - slabosc czuja glownie casterzy, tak ma byc.
	var int bzElem; bzElem = slf.id % 5;
	if (bzElem == 0)      { slf.protection[3] += StExt_GetPercentFromValue(slf.protection[3], 30); slf.protection[5] -= StExt_GetPercentFromValue(slf.protection[5], 20); }
	else if (bzElem == 1) { slf.protection[5] += StExt_GetPercentFromValue(slf.protection[5], 30); slf.protection[3] -= StExt_GetPercentFromValue(slf.protection[3], 20); }
	else if (bzElem == 2) { slf.protection[5] += StExt_GetPercentFromValue(slf.protection[5], 30); slf.protection[4] -= StExt_GetPercentFromValue(slf.protection[4], 20); }
	else if (bzElem == 3) { slf.protection[5] += StExt_GetPercentFromValue(slf.protection[5], 30); slf.protection[3] -= StExt_GetPercentFromValue(slf.protection[3], 20); }
	else                  { slf.protection[1] += StExt_GetPercentFromValue(slf.protection[1], 30); slf.protection[4] -= StExt_GetPercentFromValue(slf.protection[4], 20); };

	// BRON PRZENIESIONA POZA INSTANCJE - patrz StExt_ZakonBoss_GiveWeapon nizej.
	// Bylo tu StExt_GetRegularItem(...), czyli tworzenie DYNAMICZNEJ INSTANCJI
	// przedmiotu w srodku inicjalizacji instancji NPC-a. Parser budowal jeden
	// obiekt, a my kazalismy mu w tym samym momencie zbudowac drugi. Efekt
	// (zgloszony z zywej gry): bron bossa miala 0 obrazen (staty nigdy nie
	// doszly) i WYWALALA GRE przy probie podniesienia jej z trupa.
	// Dowod z boku: StExt_ZakonBoss_GiveLoot robi to samo (GenerateRandomItem)
	// i dziala bez zarzutu - bo leci z ai_ondead, czyli z normalnego kontekstu.
	// Jedyna roznica byl MOMENT wywolania.

	// Chapter 1: bosses stay HUMAN brutes exactly as-is (user call).
	// Chapter 2+: the Zakon sends UNDEAD champions - skeleton rig + monster
	// guild + monster scheduler. Monsters natively run zs_mm_attack_loop, so
	// the NpcAbility kit (waves/blinks/self-buff) finally fires FOR REAL -
	// no synthetic shockwave needed. Passive id-hooks (lifesteal/chip/tempo/
	// ciernie) key off ids so they keep working regardless of guild.
	if (kapitel >= 2)
	{
		slf.guild = gil_skeleton;
		mdl_setvisual(slf, "HumanS.mds");
		mdl_setvisualbody(slf, "Ske_Body", default, default, "", default, default, -1);
		slf.start_aistate = zs_mm_allscheduler;

		// Pelny kit per slot (fala/blink/summon/pasywka/aura) - patrz
		// StExt_ZakonBoss_ApplyKit wyzej.
		StExt_ZakonBoss_ApplyKit(slf, tier);
	};
};

// Bron bossa - nadawana PO wstawieniu NPC-a do swiata, nigdy z bloku instancji.
// Musi byc wolana zaraz za kazdym wld_insertnpc(boss) - patrz oba miejsca spawnu.
// Idempotentna: jak boss juz cos trzyma, nie dokladamy drugiej.
func void StExt_ZakonBoss_GiveWeapon(var c_npc slf, var int tier)
{
	var int bWeapType;
	var int bWeapItm;
	var int bWeapRoll;

	if (!hlp_isvalidnpc(slf)) { return; };
	if (npc_hasequippedmeleeweapon(slf)) { return; };	// juz uzbrojony

	// Generowana bron przez ten sam item-class system, ktorego uzywa CALY loot
	// w tym modzie (GiveLoot, Herold/Fanatyk w Npc_ZakonTower.d - dziala od
	// dawna bez zarzutu). Twarde ID (ITMW_ZWEIHAENDER1 itd, poprzednia proba)
	// byly zle: dzialaly w rece NPC podczas walki, ale crashowaly przy
	// renderowaniu w oknie lootu - user zglosil crash na "lekkim mieczu
	// dwurecznym" mimo ze to byla "bezpieczna" statyczna instancja. Root cause
	// crashu lezy w silniku (oInventory.cpp Draw()/DrawItemInfo, patrz fix w
	// DrawItemInfo_StExt/Draw_StExt w DLL) - nie w WYBORZE konkretnej broni.
	// Prawdziwa naprawa jest tam; tutaj wracamy do sprawdzonego mechanizmu
	// zamiast improwizowac wlasne ID i walczyc z silnikiem po omacku.
	bWeapRoll = slf.id % 4;
	if (bWeapRoll == 0)      { bWeapType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword2H"); }
	else if (bWeapRoll == 1) { bWeapType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe2H"); }
	else if (bWeapRoll == 2) { bWeapType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Sword1H"); }
	else                     { bWeapType = StExt_SelectItemClassFromList("StExt_ItemClass_List_Axe1H"); };
	bWeapItm = StExt_GetRegularItem(bWeapType, (hero.level * 7) + (kapitel * 40) + (tier * 80));
	if (bWeapItm > 0)
	{
		// TYLKO do plecaka - BEZ npc_equipitem (hipoteza usera, potwierdzona
		// tropem z trace'a). Force-equip podczepial wizual swiezo wygenerowanej
		// dynamicznej instancji pod wezel modelu bossa (plecy/pas); smierc
		// odczepiala, a podniesienie z ziemi czytalo residuum -> crash (deferred,
		// po zakonczeniu DoTakeVob, ItemClassData byl WAZNY wiec to nie on).
		// Bez equip: AI walki dobiera bron z plecaka sama, standardowym wzorcem
		// Gothica - dokladnie jak zwykly NPC, ktorego bron podnosi sie bez crasha.
		createinvitems(slf, bWeapItm, 1);
	};
	StExt_Trace(concatstrings("<< GiveWeapon(inv-only) id=", inttostring(slf.id)));
	StExt_Trace(concatstrings("   .. sila bossa: ", inttostring(slf.attribute[4])));
};

// Tier po id - Setup dostaje go parametrem, ale spawn juz nie, a nie chcemy
// drugiego zrodla prawdy. Odwzorowuje dokladnie wywolania StExt_ZakonBoss_Setup.
func int StExt_ZakonBoss_TierById(var int id)
{
	if (id == 99720) { return 4; };					// slot 10
	if ((id >= 99717) && (id <= 99719)) { return 3; };	// sloty 7-9
	if ((id >= 99714) && (id <= 99716)) { return 2; };	// sloty 4-6
	if ((id >= 99711) && (id <= 99713)) { return 1; };	// sloty 1-3
	if (id == 99724) { return 4; };					// cel lowow ch5
	return 3;										// pozostale cele lowow
};

//--------------------------------------------------------------
// *** F2: hunted targets - one per chapter, tracked in the wild ***
//--------------------------------------------------------------
// Chapter 1: the Heretic - portal temple ruins.
instance bdt_99710_ZakonHeretic(npc_default)
{
    name = StExt_Str_ZakonHeretic_Name;
    guild = gil_bdt;
    id = 99710;
    voice = 13;
    flags = 0;
    npctype = npctype_main;
    level = 20;
    b_setnpcvisual(bdt_99710_ZakonHeretic, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99710_ZakonHeretic, "Humans_Militia.mds");
    b_givenpctalents(bdt_99710_ZakonHeretic);
    fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99710_ZakonHeretic;
    aivar[6] = true; // aggressive
    StExt_ZakonBoss_Setup(bdt_99710_ZakonHeretic, 3);
};
func void rtn_bdt_99710_ZakonHeretic()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
};
func void ai_ondead_bdt_99710_ZakonHeretic()
{
	StExt_ZakonHeretic_Dead = true;
	StExt_ZakonHunt_OnKill(1);
};

// Chapter 2: the Hangman - lurking by Orlan's tavern.
instance bdt_99721_ZakonHunt2(npc_default)
{
    name = StExt_Str_ZakonHunt2_Name; guild = gil_bdt; id = 99721; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99721_ZakonHunt2, male, "Hum_Head_FatBald", face_n_mud, bodytex_n, itar_dht_end_6);
    mdl_applyoverlaymds(bdt_99721_ZakonHunt2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99721_ZakonHunt2); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99721_ZakonHunt2; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99721_ZakonHunt2, 3);
};
func void rtn_bdt_99721_ZakonHunt2()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TAVERNE");
    ta_stand_guarding(23, 0, 8, 0, "NW_TAVERNE");
};
func void ai_ondead_bdt_99721_ZakonHunt2() { StExt_ZakonHunt_OnKill(2); };

// Chapter 3: the Gravedigger - troll land paths.
instance bdt_99722_ZakonHunt3(npc_default)
{
    name = StExt_Str_ZakonHunt3_Name; guild = gil_bdt; id = 99722; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99722_ZakonHunt3, male, "Hum_Head_Bald", face_n_mud, bodytex_n, itar_oldsteelarmor);
    mdl_applyoverlaymds(bdt_99722_ZakonHunt3, "Humans_Militia.mds");
    b_givenpctalents(bdt_99722_ZakonHunt3); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99722_ZakonHunt3; aivar[6] = true;
    StExt_ZakonBoss_Setup(bdt_99722_ZakonHunt3, 3);
};
func void rtn_bdt_99722_ZakonHunt3()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PATH_80");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PATH_80");
};
func void ai_ondead_bdt_99722_ZakonHunt3() { StExt_ZakonHunt_OnKill(3); };

// Chapter 4: the Blood Penitent - ritual forest.
instance bdt_99723_ZakonHunt4(npc_default)
{
    name = StExt_Str_ZakonHunt4_Name; guild = gil_bdt; id = 99723; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99723_ZakonHunt4, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_demoniac_armor);
    mdl_applyoverlaymds(bdt_99723_ZakonHunt4, "Humans_Mage.mds");
    b_givenpctalents(bdt_99723_ZakonHunt4); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99723_ZakonHunt4; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99723_ZakonHunt4, 3);
};
func void rtn_bdt_99723_ZakonHunt4()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_RITUALFOREST_11");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_RITUALFOREST_11");
};
func void ai_ondead_bdt_99723_ZakonHunt4() { StExt_ZakonHunt_OnKill(4); };

// Chapter 5 (finale): the Fallen Master - depths of the portal temple.
instance bdt_99724_ZakonHunt5(npc_default)
{
    name = StExt_Str_ZakonHunt5_Name; guild = gil_bdt; id = 99724; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99724_ZakonHunt5, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_darkknight_03_cursed);
    mdl_applyoverlaymds(bdt_99724_ZakonHunt5, "Humans_Mage.mds");
    b_givenpctalents(bdt_99724_ZakonHunt5); fight_tactic = fai_human_master;
    daily_routine = rtn_bdt_99724_ZakonHunt5; aivar[6] = true; aivar[51] = magic_always;
    StExt_ZakonBoss_Setup(bdt_99724_ZakonHunt5, 4);
};
func void rtn_bdt_99724_ZakonHunt5()
{
    ta_stand_guarding(8, 0, 23, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
    ta_stand_guarding(23, 0, 8, 0, "NW_TROLLAREA_PORTALTEMPEL_40");
};
func void ai_ondead_bdt_99724_ZakonHunt5() { StExt_ZakonHunt_OnKill(5); };

// Spawns the CURRENT chapter's hunted target (once per chapter).
func void StExt_ZakonHunt_SpawnCurrent()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	if (StExt_ZakonHunt_SpawnedCh >= ch) { return; };
	StExt_ZakonHunt_SpawnedCh = ch;
	rx_saveparservars();
	if (ch <= 1) { wld_insertnpc(bdt_99710_ZakonHeretic, "NW_TROLLAREA_PORTALTEMPEL_40"); }
	else if (ch == 2) { wld_insertnpc(bdt_99721_ZakonHunt2, "NW_TAVERNE"); }
	else if (ch == 3) { wld_insertnpc(bdt_99722_ZakonHunt3, "NW_TROLLAREA_PATH_80"); }
	else if (ch == 4) { wld_insertnpc(bdt_99723_ZakonHunt4, "NW_TROLLAREA_RITUALFOREST_11"); }
	else { wld_insertnpc(bdt_99724_ZakonHunt5, "NW_TROLLAREA_PORTALTEMPEL_40"); };

	// Bron DOPIERO TERAZ - po wstawieniu, poza instancja (generowanie w bloku
	// instancji dawalo bron 0-dmg + crash przy podnoszeniu). WEWNATRZ okna
	// rx_saveparservars: GetRegularItem smieci w rejestrach parsera - wywolany
	// poza oknem zabieral dialogowi 'self' i dialog przestawal sie zamykac.
	var c_npc hn;
	if (ch <= 1) { hn = Hlp_GetNpc(bdt_99710_ZakonHeretic); }
	else if (ch == 2) { hn = Hlp_GetNpc(bdt_99721_ZakonHunt2); }
	else if (ch == 3) { hn = Hlp_GetNpc(bdt_99722_ZakonHunt3); }
	else if (ch == 4) { hn = Hlp_GetNpc(bdt_99723_ZakonHunt4); }
	else { hn = Hlp_GetNpc(bdt_99724_ZakonHunt5); };
	if (hlp_isvalidnpc(hn)) { StExt_ZakonBoss_GiveWeapon(hn, StExt_ZakonBoss_TierById(hn.id)); };
	rx_restoreparservars();
};

// Chapter-specific hint text.
func void StExt_ZakonHunt_PrintHint()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	if (ch <= 1) { ai_printbonus(StExt_Str_ZakonHunt1_Hint); }
	else if (ch == 2) { ai_printbonus(StExt_Str_ZakonHunt2_Hint); }
	else if (ch == 3) { ai_printbonus(StExt_Str_ZakonHunt3_Hint); }
	else if (ch == 4) { ai_printbonus(StExt_Str_ZakonHunt4_Hint); }
	else { ai_printbonus(StExt_Str_ZakonHunt5_Hint); };
};

//--------------------------------------------------------------
// *** F3: arena - 10 concrete challengers, fixed order ***
//--------------------------------------------------------------
instance bdt_99711_ZakonBoss1(npc_default)
{
    name = StExt_Str_ZakonBoss1_Name; guild = gil_bdt; id = 99711; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99711_ZakonBoss1, male, "Hum_Head_Fighter", face_n_corristo, bodytex_n, itar_darkknight_01);
    mdl_applyoverlaymds(bdt_99711_ZakonBoss1, "Humans_Militia.mds");
    b_givenpctalents(bdt_99711_ZakonBoss1); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99711_ZakonBoss1, 1);
};
func void ai_ondead_bdt_99711_ZakonBoss1() { StExt_ZakonBoss_GiveLoot(1); StExt_ZakonBoss_OnKill(); };

instance bdt_99712_ZakonBoss2(npc_default)
{
    name = StExt_Str_ZakonBoss2_Name; guild = gil_bdt; id = 99712; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99712_ZakonBoss2, male, "Hum_Head_Pony", face_n_mud, bodytex_n, itar_darkknight_03);
    mdl_applyoverlaymds(bdt_99712_ZakonBoss2, "Humans_Militia.mds");
    b_givenpctalents(bdt_99712_ZakonBoss2); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99712_ZakonBoss2, 1);
};
func void ai_ondead_bdt_99712_ZakonBoss2() { StExt_ZakonBoss_GiveLoot(1); StExt_ZakonBoss_OnKill(); };

instance bdt_99713_ZakonBoss3(npc_default)
{
    name = StExt_Str_ZakonBoss3_Name; guild = gil_bdt; id = 99713; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99713_ZakonBoss3, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_demoniac_armor);
    mdl_applyoverlaymds(bdt_99713_ZakonBoss3, "Humans_Mage.mds");
    b_givenpctalents(bdt_99713_ZakonBoss3); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99713_ZakonBoss3, 1);
};
func void ai_ondead_bdt_99713_ZakonBoss3() { StExt_ZakonBoss_GiveLoot(1); StExt_ZakonBoss_OnKill(); };

instance bdt_99714_ZakonBoss4(npc_default)
{
    name = StExt_Str_ZakonBoss4_Name; guild = gil_bdt; id = 99714; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99714_ZakonBoss4, male, "Hum_Head_FatBald", face_n_mud, bodytex_n, itar_oldsteelarmor);
    mdl_applyoverlaymds(bdt_99714_ZakonBoss4, "Humans_Militia.mds");
    b_givenpctalents(bdt_99714_ZakonBoss4); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99714_ZakonBoss4, 2);
};
func void ai_ondead_bdt_99714_ZakonBoss4() { StExt_ZakonBoss_GiveLoot(2); StExt_ZakonBoss_OnKill(); };

instance bdt_99715_ZakonBoss5(npc_default)
{
    name = StExt_Str_ZakonBoss5_Name; guild = gil_bdt; id = 99715; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99715_ZakonBoss5, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_assasins_01);
    mdl_applyoverlaymds(bdt_99715_ZakonBoss5, "Humans_Militia.mds");
    b_givenpctalents(bdt_99715_ZakonBoss5); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99715_ZakonBoss5, 2);
};
func void ai_ondead_bdt_99715_ZakonBoss5() { StExt_ZakonBoss_GiveLoot(2); StExt_ZakonBoss_OnKill(); };

instance bdt_99716_ZakonBoss6(npc_default)
{
    name = StExt_Str_ZakonBoss6_Name; guild = gil_bdt; id = 99716; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99716_ZakonBoss6, male, "Hum_Head_Thief", face_n_mud, bodytex_n, itar_sancuary_keeper);
    mdl_applyoverlaymds(bdt_99716_ZakonBoss6, "Humans_Mage.mds");
    b_givenpctalents(bdt_99716_ZakonBoss6); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99716_ZakonBoss6, 2);
};
func void ai_ondead_bdt_99716_ZakonBoss6() { StExt_ZakonBoss_GiveLoot(2); StExt_ZakonBoss_OnKill(); };

instance bdt_99717_ZakonBoss7(npc_default)
{
    name = StExt_Str_ZakonBoss7_Name; guild = gil_bdt; id = 99717; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99717_ZakonBoss7, male, "Hum_Head_Fighter", face_n_mud, bodytex_n, itar_dht_end_6);
    mdl_applyoverlaymds(bdt_99717_ZakonBoss7, "Humans_Militia.mds");
    b_givenpctalents(bdt_99717_ZakonBoss7); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99717_ZakonBoss7, 3);
};
func void ai_ondead_bdt_99717_ZakonBoss7() { StExt_ZakonBoss_GiveLoot(3); StExt_ZakonBoss_OnKill(); };

instance bdt_99718_ZakonBoss8(npc_default)
{
    name = StExt_Str_ZakonBoss8_Name; guild = gil_bdt; id = 99718; voice = 12; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99718_ZakonBoss8, male, "Hum_Head_Bald", face_n_corristo, bodytex_n, itar_orcarmor_forged);
    mdl_applyoverlaymds(bdt_99718_ZakonBoss8, "Humans_Militia.mds");
    b_givenpctalents(bdt_99718_ZakonBoss8); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99718_ZakonBoss8, 3);
};
func void ai_ondead_bdt_99718_ZakonBoss8() { StExt_ZakonBoss_GiveLoot(3); StExt_ZakonBoss_OnKill(); };

instance bdt_99719_ZakonBoss9(npc_default)
{
    name = StExt_Str_ZakonBoss9_Name; guild = gil_bdt; id = 99719; voice = 11; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99719_ZakonBoss9, male, "Hum_Head_Pony", face_n_mud, bodytex_n, itar_darkknight_01_cursed);
    mdl_applyoverlaymds(bdt_99719_ZakonBoss9, "Humans_Militia.mds");
    b_givenpctalents(bdt_99719_ZakonBoss9); fight_tactic = fai_human_master; aivar[6] = true; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99719_ZakonBoss9, 3);
};
func void ai_ondead_bdt_99719_ZakonBoss9() { StExt_ZakonBoss_GiveLoot(3); StExt_ZakonBoss_OnKill(); };

instance bdt_99720_ZakonBoss10(npc_default)
{
    name = StExt_Str_ZakonBoss10_Name; guild = gil_bdt; id = 99720; voice = 13; flags = 0; npctype = npctype_main; level = 20;
    b_setnpcvisual(bdt_99720_ZakonBoss10, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_darkknight_03_cursed);
    mdl_applyoverlaymds(bdt_99720_ZakonBoss10, "Humans_Mage.mds");
    b_givenpctalents(bdt_99720_ZakonBoss10); fight_tactic = fai_human_master; aivar[6] = true; aivar[51] = magic_always; daily_routine = rtn_zakon_arena_guard;
    StExt_ZakonBoss_Setup(bdt_99720_ZakonBoss10, 4);
};
func void ai_ondead_bdt_99720_ZakonBoss10() { StExt_ZakonBoss_GiveLoot(4); StExt_ZakonBoss_OnKill(); };

//--------------------------------------------------------------
// *** Summon: FIXED order - boss (Killed+1) of 10 ***
//--------------------------------------------------------------
// Robust re-summon guard: only blocks if the LAST summoned boss really
// exists in the world and is alive. A crashed/failed spawn used to leave
// StExt_ZakonBoss_Active = true forever, blocking every future summon;
// StExt_ZakonBoss_ActiveSlot defaults to 0, so old stuck saves self-heal.
// Slot (1-10) -> instancja bossa. Jedno miejsce z tym mapowaniem: uzywa go
// i AliveNow, i nadawanie broni po spawnie. Dwie kopie by sie rozjechaly.
func c_npc StExt_ZakonBoss_BySlot(var int slot)
{
	var c_npc n;
	if (slot == 1)      { n = Hlp_GetNpc(bdt_99711_ZakonBoss1); }
	else if (slot == 2) { n = Hlp_GetNpc(bdt_99712_ZakonBoss2); }
	else if (slot == 3) { n = Hlp_GetNpc(bdt_99713_ZakonBoss3); }
	else if (slot == 4) { n = Hlp_GetNpc(bdt_99714_ZakonBoss4); }
	else if (slot == 5) { n = Hlp_GetNpc(bdt_99715_ZakonBoss5); }
	else if (slot == 6) { n = Hlp_GetNpc(bdt_99716_ZakonBoss6); }
	else if (slot == 7) { n = Hlp_GetNpc(bdt_99717_ZakonBoss7); }
	else if (slot == 8) { n = Hlp_GetNpc(bdt_99718_ZakonBoss8); }
	else if (slot == 9) { n = Hlp_GetNpc(bdt_99719_ZakonBoss9); }
	else                { n = Hlp_GetNpc(bdt_99720_ZakonBoss10); };
	return n;
};

func int StExt_ZakonBoss_AliveNow()
{
	var c_npc n;
	var int slot;
	slot = StExt_ZakonBoss_ActiveSlot;
	if (slot <= 0) { return false; };
	if (slot == 1)      { n = Hlp_GetNpc(bdt_99711_ZakonBoss1); }
	else if (slot == 2) { n = Hlp_GetNpc(bdt_99712_ZakonBoss2); }
	else if (slot == 3) { n = Hlp_GetNpc(bdt_99713_ZakonBoss3); }
	else if (slot == 4) { n = Hlp_GetNpc(bdt_99714_ZakonBoss4); }
	else if (slot == 5) { n = Hlp_GetNpc(bdt_99715_ZakonBoss5); }
	else if (slot == 6) { n = Hlp_GetNpc(bdt_99716_ZakonBoss6); }
	else if (slot == 7) { n = Hlp_GetNpc(bdt_99717_ZakonBoss7); }
	else if (slot == 8) { n = Hlp_GetNpc(bdt_99718_ZakonBoss8); }
	else if (slot == 9) { n = Hlp_GetNpc(bdt_99719_ZakonBoss9); }
	else                { n = Hlp_GetNpc(bdt_99720_ZakonBoss10); };
	if (!hlp_isvalidnpc(n)) { return false; };
	if (n.attribute[atr_hitpoints] <= 0) { return false; };
	return true;
};

// Veteran gate: killing the world's Black Troll ALSO unlocks the arena
// (chapter 1 too - good fun for a maniac). Latched so it stays unlocked.
func int StExt_ZakonBlackTroll_Dead()
{
	var c_npc bt;
	if (StExt_ZakonBlackTrollDead) { return true; };
	bt = Hlp_GetNpc(Troll_Black);
	if (hlp_isvalidnpc(bt) && (bt.attribute[atr_hitpoints] <= 0)) { StExt_ZakonBlackTrollDead = true; };
	return StExt_ZakonBlackTrollDead;
};

// Arena bosses guard the fight spot - a guarding routine gives them active
// AI + perception so they actually engage the hero (a routineless human NPC
// just idles). They spawn at this same waypoint.
func void rtn_zakon_arena_guard()
{
	ta_stand_guarding(8, 0, 23, 0, StExt_ZakonArena_Wp);
	ta_stand_guarding(23, 0, 8, 0, StExt_ZakonArena_Wp);
};

func void StExt_ZakonBoss_SummonNext()
{
	var int pick;

	if (StExt_ZakonBoss_Chapter != kapitel)
	{
		StExt_ZakonBoss_Chapter = kapitel;
		StExt_ZakonBoss_Killed = 0;
	};
	if (StExt_ZakonBoss_Killed >= 10)
	{
		ai_printbonus(StExt_Str_ZakonBoss_ChapterDone);
		return;
	};
	if (StExt_ZakonBoss_AliveNow())
	{
		ai_printred(StExt_Str_ZakonBoss_StillAlive);
		return;
	};

	StExt_ZakonBoss_Active = true;
	pick = StExt_ZakonBoss_Killed; // sequential: next in line
	rx_saveparservars();
	// Pojedynki w KRYPCIE (StExt_ZakonArena_Wp): zamknieta podziemna komora
	// z dala od huba, klimat Zakonu Dusz; leash pilnuje, zeby gracz nie uciekl.
	if (pick == 0) { wld_insertnpc(bdt_99711_ZakonBoss1, StExt_ZakonArena_Wp); }
	else if (pick == 1) { wld_insertnpc(bdt_99712_ZakonBoss2, StExt_ZakonArena_Wp); }
	else if (pick == 2) { wld_insertnpc(bdt_99713_ZakonBoss3, StExt_ZakonArena_Wp); }
	else if (pick == 3) { wld_insertnpc(bdt_99714_ZakonBoss4, StExt_ZakonArena_Wp); }
	else if (pick == 4) { wld_insertnpc(bdt_99715_ZakonBoss5, StExt_ZakonArena_Wp); }
	else if (pick == 5) { wld_insertnpc(bdt_99716_ZakonBoss6, StExt_ZakonArena_Wp); }
	else if (pick == 6) { wld_insertnpc(bdt_99717_ZakonBoss7, StExt_ZakonArena_Wp); }
	else if (pick == 7) { wld_insertnpc(bdt_99718_ZakonBoss8, StExt_ZakonArena_Wp); }
	else if (pick == 8) { wld_insertnpc(bdt_99719_ZakonBoss9, StExt_ZakonArena_Wp); }
	else { wld_insertnpc(bdt_99720_ZakonBoss10, StExt_ZakonArena_Wp); };
	StExt_ZakonBoss_ActiveSlot = pick + 1;	// remember who is out there (for the alive-check)

	// Bron DOPIERO TERAZ - po wstawieniu do swiata, poza blokiem instancji
	// (generowanie itemu w instancji dawalo bron 0-dmg + crash przy podnoszeniu).
	// UWAGA: wciaz WEWNATRZ okna rx_saveparservars! GetRegularItem tworzy
	// dynamiczna instancje i smieci w rejestrach parsera - wywolany poza oknem
	// zabieral dialogowi 'self' i "podejmij probe" przestawalo sie zamykac.
	var c_npc bn;
	bn = StExt_ZakonBoss_BySlot(StExt_ZakonBoss_ActiveSlot);
	if (hlp_isvalidnpc(bn)) { StExt_ZakonBoss_GiveWeapon(bn, StExt_ZakonBoss_TierById(bn.id)); };
	rx_restoreparservars();
	// Deferred teleport: fires ~15 frames later, AFTER the dialog has fully
	// closed - teleporting the hero DURING the dialog left it stuck open.
	StExt_InitializeCallback(hero, hero, "StExt_ZakonArenaTeleport_Callback", 15);
	ai_printbonus(StExt_Str_ZakonBoss_Summoned);
};

func void StExt_ZakonArenaTeleport_Callback()
{
	// Linie Say graja teraz natywnie (sekundy) - sztywne 15 klatek strzelalo
	// teleportem w POLOWIE kwestii Mistrza i wieszalo okno dialogu. Czekamy,
	// az sesja dialogowa realnie sie skonczy, dopiero wtedy teleport.
	if (StExt_IsDialogActive())
	{
		StExt_InitializeCallback(hero, hero, "StExt_ZakonArenaTeleport_Callback", 15);
		return;
	};
	AI_Teleport(hero, StExt_ZakonArena_Wp);
	// Czyszczenie krypty z rezydentow (skan sejwa: szkielet 8 m i 5 wilkow
	// 15 m od ringu!) - wokol BOSSA (on juz stoi w krypcie; gracz dopiero
	// doleci AI-kolejka). Walka ma byc boss vs gracz.
	var c_npc bnClear;
	bnClear = StExt_ZakonBoss_BySlot(StExt_ZakonBoss_ActiveSlot);
	if (hlp_isvalidnpc(bnClear))
	{
		StExt_ForEachNpcInRadius(bnClear, 3000, "StExt_ZakonArena_ClearInit", "StExt_ZakonArena_ClearCond", "StExt_ZakonArena_ClearResident");
	};
	StExt_InitializeCallback(hero, hero, "StExt_ZakonArenaLeash_Callback", 30);
};

// Rezydent krypty -> teleport na cmentarne pole NW_CRYPT_MONSTER05 (98 m
// od areny; realny WP wg skanu). Filtr pomija gracza, NPC Zakonu/huba,
// summony i trupy. Zero zabijania = zero exploitow XP/lootu.
func void StExt_ZakonArena_ClearInit() { };
func int StExt_ZakonArena_ClearCond() { return true; };
func void StExt_ZakonArena_ClearResident()
{
	if (!hlp_isvalidnpc(StExt_Self)) { return; };
	if (npc_isplayer(StExt_Self)) { return; };
	if ((StExt_Self.id >= 99700) && (StExt_Self.id <= 99799)) { return; };
	if (StExt_IsSummonOrHero(StExt_Self)) { return; };
	if (npc_isdead(StExt_Self)) { return; };
	AI_Teleport(StExt_Self, "NW_CRYPT_MONSTER05");
	StExt_Trace(concatstrings("ARENA clear: rezydent wyproszony id=", inttostring(StExt_Self.id)));
};

// Leash krypty: proba ucieczki z areny = warp-back do bossa. Deterministycznie
// (zero RNG), co 30 klatek; lancuch samo-rozbraja sie, gdy boss nie zyje -
// miedzy walkami nie kreci sie zaden callback.
func void StExt_ZakonArenaLeash_Callback()
{
	var c_npc bn;
	if (!StExt_ZakonBoss_AliveNow()) { return; };
	bn = StExt_ZakonBoss_BySlot(StExt_ZakonBoss_ActiveSlot);
	if (hlp_isvalidnpc(bn) && !StExt_IsDialogActive())
	{
		if (npc_getdisttonpc(hero, bn) > StExt_ZakonArena_LeashDist)
		{
			AI_Teleport(hero, StExt_ZakonArena_Wp);
			printscreencolor("ZAKON NIE UZNAJE UCIECZKI!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
			StExt_Trace("ARENA leash: warp-back gracza do krypty");
		};
	};
	StExt_InitializeCallback(hero, hero, "StExt_ZakonArenaLeash_Callback", 30);
};

//--------------------------------------------------------------
// *** FAZY BOSSA (75/50/25% HP) ***
//--------------------------------------------------------------
// Trigger w DamageController (boss obrywa, prog przekroczony -> latch w
// NpcVar StExt_AiVar_BossPhase + 1-klatkowy callback tutaj). Zagrywki sa
// DETERMINISTYCZNE (zero RNG w triggerach - kanon), a wspolna sygnatura
// to wstrzas ekranu jak u Kruka z Returninga (FX_EarthQuake).
// CH1 = fazy-lite (bossy-ludzie bez kitu abilities): wstrzas + tempo +
// heal na 25%. Pelne zagrywki (fala/summon/buff z kitu) od CH2, gdzie
// Setup konwertuje bossa na nieumarlego z dzialajacym kitem.

// Zagrywka z kitu: zdejmij cooldowny i odpal gotowa ability wybranego
// typu. Brak pasujacej (np. gracz poza zasiegiem) = lagodna degradacja
// do samego wstrzasu+tempa, odnotowana w trace.
func void StExt_ZakonBossPhase_CastFromKit(var c_npc bn, var int abilityType)
{
	var int dist;
	var int abilitySlot;

	StExt_Npc_ResetAllAbilityCooldowns(bn);
	dist = npc_getdisttonpc(bn, hero);
	abilitySlot = StExt_Npc_SelectAbility(bn, abilityType, StExt_NpcAbility_Flag_OnCast, dist);
	if ((abilitySlot > StExt_Null) && (abilitySlot < StExt_Npc_MaxNpcAbilities))
	{
		StExt_Npc_UseAbility(bn, hero, StExt_CurrentNpcAbility, abilitySlot, StExt_NpcAbility_Event_OnCastAbility);
	}
	else
	{
		StExt_Trace(concatstrings("BOSS faza: brak ability typu ", inttostring(abilityType)));
	};
};

func void StExt_ZakonBossPhase_Callback()
{
	var c_npc bn;
	var int phase;

	bn = Hlp_GetNpc(StExt_BossAbilityTrigger_InstId);
	if (!hlp_isvalidnpc(bn)) { return; };
	if (c_npcisdown(bn)) { return; };
	phase = StExt_GetNpcVar(bn, StExt_AiVar_BossPhase);

	// wspolna sygnatura fazy: wstrzas kamery (patent Kruka) + quake na bossie
	rx_playeffect("FX_EarthQuake", hero);
	rx_playeffect("spellfx_quake", bn);
	StExt_Trace(concatstrings(concatstrings("BOSS faza=", inttostring(phase)), concatstrings(" id=", inttostring(bn.id))));

	if (phase == 1)
	{
		// 75%: STALY skok tempa +150 + fala zywiolu z kitu
		StExt_Npc_ChangeAiv(bn, aivrx_npc_speed, 150 - rx_getnpcvar(bn, aivrx_npc_speed));
		printscreencolor("WROG PRZYSPIESZA!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		if (kapitel >= 2) { StExt_ZakonBossPhase_CastFromKit(bn, StExt_NpcAbility_Type_Spell); };
	}
	else if (phase == 2)
	{
		// 50%: drugi staly krok tempa +225 + przyzwanie z kitu
		StExt_Npc_ChangeAiv(bn, aivrx_npc_speed, 225 - rx_getnpcvar(bn, aivrx_npc_speed));
		printscreencolor("WROG WZYWA POMOC!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		if (kapitel >= 2) { StExt_ZakonBossPhase_CastFromKit(bn, StExt_NpcAbility_Type_Summon); };
	}
	else
	{
		// 25%: JEDYNY self-heal walki (latch faz gwarantuje 1x na walke;
		// kazde przyzwanie wstawia swiezego NPC = naturalny reset latcha)
		StExt_CastSelfHeal(bn, 35, 0);
		printscreencolor("WROG SIE LECZY!", 62, 2, StExt_DefaultFont, 2, StExt_Color_Header);
		if (kapitel >= 2) { StExt_ZakonBossPhase_CastFromKit(bn, StExt_NpcAbility_Type_Buff); };
	};
};

//--------------------------------------------------------------
// *** F4: chapter armor reward ***
//--------------------------------------------------------------
// Daje statyczna zbroje jako LEGENDARNA: nadaje jej rozszerzenie przez
// EnchantItemInPlace (zachowuje nazwe/wyglad/protekcje + dodaje magie), swap,
// potem ChangeItemRank do rangi 5. Fallback: jesli enchant sie nie uda, gracz
// dostaje zwykla statyczna zbroje (nadal uzyteczna). Bezpieczne w dialogu
// (wzorzec infuzji pancerza - bez auto-equip).
func void StExt_ZakonReward_GiveLegendary(var int armorInstance)
{
	var c_item armor;
	var int newId;
	var c_item work;
	var int power;
	var int delta;
	createinvitems(hero, armorInstance, 1);
	armor = npc_getitembyid(hero, armorInstance);
	if (!hlp_isvaliditem(armor)) { return; };
	power = (hero.level * 7) + (kapitel * 40) + 300;
	newId = StExt_EnchantItemInPlace(armor, power);
	if (newId <= 0) { return; };
	npc_removeinvitems(hero, armorInstance, 1);
	b_playerfinditem_stext(newId, 1);
	work = npc_getitembyid(hero, newId);
	if (!hlp_isvaliditem(work)) { return; };
	delta = StExt_ItemRankLegendary - StExt_GetItemRank(work);
	if (delta > 0) { StExt_ChangeItemRank(work, delta); };
};

func void StExt_ZakonReward_Give()
{
	var int ch;
	ch = StExt_ZakonHunt_CurChapter();
	StExt_ZakonReward_Chapter = kapitel;
	if (ch <= 1) { StExt_ZakonReward_GiveLegendary(itar_stext_zakon_novdark); }
	else if (ch == 2) { StExt_ZakonReward_GiveLegendary(itar_stext_zakon_royal); }
	else if (ch == 3) { StExt_ZakonReward_GiveLegendary(itar_stext_zakon_templar); }
	else if (ch == 4) { StExt_ZakonReward_GiveLegendary(itar_stext_zakon_guardian); }
	else { StExt_ZakonReward_GiveLegendary(itar_stext_zakon_crusader); };
	ai_printbonus(StExt_Str_ZakonReward_Given);
};

// Chapter 1 / 3 rewards are a CHOICE from a user-curated armor pool
// (UAWR/ArmorExpansion looks; assets in STEXT_Assets.vdf). Picking an
// option marks the chapter as rewarded; closing the menu does not.
func void StExt_ZakonReward_Pick(var int itm)
{
	StExt_ZakonReward_Chapter = kapitel;
	StExt_ZakonReward_GiveLegendary(itm);
	ai_printbonus(StExt_Str_ZakonReward_Given);
	info_clearchoices(dia_none_99702_SoulMaster_Reward);
	ai_stopprocessinfos(self);
};
func void StExt_ZakonReward_Pick_C1Pir1()  { StExt_ZakonReward_Pick(itar_stext_zakon_c1_pir1); };
func void StExt_ZakonReward_Pick_C1Pir2()  { StExt_ZakonReward_Pick(itar_stext_zakon_c1_pir2); };
func void StExt_ZakonReward_Pick_C1Thief() { StExt_ZakonReward_Pick(itar_stext_zakon_c1_thief); };
func void StExt_ZakonReward_Pick_C2Off()   { StExt_ZakonReward_Pick(itar_stext_zakon_royal); };
func void StExt_ZakonReward_Pick_C4Stew()  { StExt_ZakonReward_Pick(itar_stext_zakon_c4_stewark); };
func void StExt_ZakonReward_Pick_C4Cuir()  { StExt_ZakonReward_Pick(itar_stext_zakon_c4_cuirass); };
func void StExt_ZakonReward_Pick_C4Demon() { StExt_ZakonReward_Pick(itar_stext_zakon_c4_demon); };
func void StExt_ZakonReward_Pick_C4Ore()   { StExt_ZakonReward_Pick(itar_stext_zakon_c4_ore); };
func void StExt_ZakonReward_Pick_C5Wolf()  { StExt_ZakonReward_Pick(itar_stext_zakon_c5_wolf); };
func void StExt_ZakonReward_Pick_C5Arax()  { StExt_ZakonReward_Pick(itar_stext_zakon_c5_araxos); };
func void StExt_ZakonReward_Pick_C5Arx()   { StExt_ZakonReward_Pick(itar_stext_zakon_c5_arx); };
func void StExt_ZakonReward_Pick_C5Orc()   { StExt_ZakonReward_Pick(itar_stext_zakon_c5_orc); };
func void StExt_ZakonReward_Pick_C5Elite() { StExt_ZakonReward_Pick(itar_stext_zakon_c5_elite); };
func void StExt_ZakonReward_Pick_C3TplN()  { StExt_ZakonReward_Pick(itar_stext_zakon_c3_tplnew); };
func void StExt_ZakonReward_Pick_C3TplH()  { StExt_ZakonReward_Pick(itar_stext_zakon_c3_tplh); };
func void StExt_ZakonReward_Pick_C3Ket()   { StExt_ZakonReward_Pick(itar_stext_zakon_c3_ketpal); };
func void StExt_ZakonReward_Pick_C3Angel() { StExt_ZakonReward_Pick(itar_stext_zakon_c3_angel); };
func void StExt_ZakonReward_Pick_C3Brig()  { StExt_ZakonReward_Pick(itar_stext_zakon_c3_brig); };
func void StExt_ZakonReward_Pick_C3PalL() { StExt_ZakonReward_Pick(itar_stext_zakon_c3_pallight); };
func void StExt_ZakonReward_Pick_Exit()    { info_clearchoices(dia_none_99702_SoulMaster_Reward); ai_stopprocessinfos(self); };

//--------------------------------------------------------------
// *** Soul Master dialogs ***
//--------------------------------------------------------------
instance dia_none_99702_SoulMaster_Reward(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 3;
    condition = dia_none_99702_SoulMaster_Reward_condition;
    information = dia_none_99702_SoulMaster_Reward_info;
    permanent = true;
    description = StExt_Str_ZakonReward_Offer;
};
func int dia_none_99702_SoulMaster_Reward_condition()
{
	StExt_ZakonHunt_Migrate();
	return StExt_SoulKnight_Member
		&& (StExt_ZakonBoss_Chapter == kapitel) && (StExt_ZakonBoss_Killed >= 10)
		&& ((StExt_ZakonHunt_Done >= StExt_ZakonHunt_CurChapter()) || StExt_ZakonBlackTroll_Dead())
		&& (StExt_ZakonReward_Chapter < kapitel);
};
func void dia_none_99702_SoulMaster_Reward_info()
{
	var int ch;
	StExt_Say(StExt_Str_SoulMaster_Name, "Dziesieciu padlo z twojej reki. Zakon placi swoje dlugi - wybierz pancerz i nos go tak, zeby nastepna dziesiatka bala sie go z daleka.");
	ch = StExt_ZakonHunt_CurChapter();
	if (ch <= 1)
	{
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Kaftan Korsarza", StExt_ZakonReward_Pick_C1Pir1);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Skorznia Wilka Morskiego", StExt_ZakonReward_Pick_C1Pir2);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Skora Nocnego Lowcy", StExt_ZakonReward_Pick_C1Thief);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else if (ch == 3)
	{
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Templariusza Dusz", StExt_ZakonReward_Pick_C3TplN);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Ciezki Pancerz Templariusza", StExt_ZakonReward_Pick_C3TplH);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Zbroja Krzyzowca Dusz", StExt_ZakonReward_Pick_C3Ket);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Aniola Smierci", StExt_ZakonReward_Pick_C3Angel);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Brygantyna Zakonna", StExt_ZakonReward_Pick_C3Brig);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Jasny Pancerz Paladynski", StExt_ZakonReward_Pick_C3PalL);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else if (ch == 2)
	{
		// officer stays as an option + the 5 heavy-knight looks (user call:
		// "te z 5 maja isc na drugi"); protections tuned to royal level.
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Zbroja Oficera", StExt_ZakonReward_Pick_C2Off);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz z Wilczego Legowiska", StExt_ZakonReward_Pick_C5Wolf);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Zbroja Araxos", StExt_ZakonReward_Pick_C5Arax);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Arx", StExt_ZakonReward_Pick_C5Arx);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Orkowego Pogromcy", StExt_ZakonReward_Pick_C5Orc);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Elitarnego Rycerza", StExt_ZakonReward_Pick_C5Elite);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else if (ch == 4)
	{
		ai_printbonus("Wybierz pancerz Zakonu:");
		info_clearchoices(dia_none_99702_SoulMaster_Reward);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Stewarka", StExt_ZakonReward_Pick_C4Stew);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Gotycki Kirys Paladynski", StExt_ZakonReward_Pick_C4Cuir);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz Demonicznego Rycerza", StExt_ZakonReward_Pick_C4Demon);
		info_addchoice(dia_none_99702_SoulMaster_Reward, "Pancerz z Magicznej Rudy", StExt_ZakonReward_Pick_C4Ore);
		info_addchoice(dia_none_99702_SoulMaster_Reward, dialog_back, StExt_ZakonReward_Pick_Exit);
	}
	else
	{
		// ch5 = crusader PLACEHOLDER until custom Blender models happen (user call)
		StExt_ZakonReward_Give();
		ai_stopprocessinfos(self);
	};
};

instance dia_none_99702_SoulMaster_Summon(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 4;
    condition = dia_none_99702_SoulMaster_Summon_condition;
    information = dia_none_99702_SoulMaster_Summon_info;
    permanent = true;
    description = StExt_Str_ZakonBoss_SummonOffer;
};
func int dia_none_99702_SoulMaster_Summon_condition()
{
	StExt_ZakonHunt_Migrate();
	return StExt_SoulKnight_Member && ((StExt_ZakonHunt_Done >= StExt_ZakonHunt_CurChapter()) || StExt_ZakonBlackTroll_Dead());
};
func void dia_none_99702_SoulMaster_Summon_info()
{
	StExt_Say(StExt_Str_SoulMaster_Name, "Zakon wzywa - ty zabijasz. Taki jest uklad. Arena czeka na wybrzezu.");
	StExt_ZakonBoss_SummonNext();
	ai_stopprocessinfos(self);
};

// Hunt dialog: spawns the current chapter's target and points at it.
instance dia_none_99702_SoulMaster_Hint(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 5;
    condition = dia_none_99702_SoulMaster_Hint_condition;
    information = dia_none_99702_SoulMaster_Hint_info;
    permanent = true;
    description = StExt_Str_ZakonHunt_Offer;
};
func int dia_none_99702_SoulMaster_Hint_condition()
{
	StExt_ZakonHunt_Migrate();
	return StExt_SoulKnight_Member && (StExt_ZakonHunt_Done < StExt_ZakonHunt_CurChapter());
};
func void dia_none_99702_SoulMaster_Hint_info()
{
	StExt_Say(StExt_Str_SoulMaster_Name, "Cel na ten rozdzial jest wybrany. Znajdz go, zabij i przynies mi jego dusze. Bez duszy nie wracaj.");
	StExt_ZakonHunt_SpawnCurrent();
	StExt_ZakonHunt_PrintHint();
	ai_stopprocessinfos(self);
};
