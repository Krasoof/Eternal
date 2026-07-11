instance none_99666_StonedTrader(npc_default) 
{
    name = StExt_Str_StonedTrader_Name;
    guild = gil_none;
    id = 99666;
    voice = 14;
    flags = 0;
    npctype = npctype_main;
	aivar[93] = true;
    aivar[57] = true;
	aivar[51] = magic_always;
	level = 1;
	b_setattributestochapter(none_99666_StonedTrader, 6);
	attribute[3] = 1000;
    attribute[2] = 1000;
    attribute[1] = 100000;
    attribute = attribute[1];
	attribute[3] = 25000;
    attribute[2] = attribute[3];    
	fight_tactic = fai_human_master;
    b_setnpcvisual(none_99666_StonedTrader, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_kdm_h_npc);
    mdl_setmodelfatness(none_99666_StonedTrader, -0.25);
    mdl_applyoverlaymds(none_99666_StonedTrader, "Humans_Mage.mds");
    b_givenpctalents(none_99666_StonedTrader);
    b_setfightskills(none_99666_StonedTrader, 100);
    daily_routine = rtn_none_99666_StonedTrader;
    rx_setnpcvar(none_99666_StonedTrader, aivrx_npc_is_trader, true);
};
func void ai_ondead_none_99666_StonedTrader() { if (hlp_isvalidnpc(self)) { npc_clearinv(self); }; };
func void ai_ongetdamage_none_99666_StonedTrader() 
{
	if (hlp_isvalidnpc(self)) 
	{
		wld_playeffect("SPELLFX_HEAL", self, self, 0, 0, 0, false);
		rx_restorehealth(self, self.attribute[1]);
	};
};
func void rtn_none_99666_StonedTrader() 
{
    ta_stand_armscrossed(8, 0, 23, 0, "NW_BIGFARM_CHAPEL_03");
    ta_stand_armscrossed(23, 0, 8, 0, "NW_BIGFARM_CHAPEL_03");
};

instance dia_none_99666_StonedTrader_trade(C_Info)
{
    npc 		= none_99666_StonedTrader;
    nr 			= 1;
    condition 	= none_99666_StonedTrader_trade_condition;
    information = none_99666_StonedTrader_trade_info;
    permanent	= true;
    trade 		= true;
    description = StExt_Str_StonedTrader_Trade;
};
func int none_99666_StonedTrader_trade_condition() { return true; }; 

func void StExt_GiveLootBox_Kapitel(var c_npc slf)
{
	var int bonus;
	bonus = 1 + StExt_GetPercentFromValue(StExt_TraderReputation, 25);
	createinvitems(slf, itmi_stext_lootchest_Shield, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Sword1h, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Sword2h, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Axe1h, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Axe2h, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Mace1h, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Mace2h, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_MagicSword, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Staff, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Rapier, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_DexSword, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Halleberd, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Spear, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Dual, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Bow, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_CrossBow, bonus + (kapitel * 20) + hlp_random(30));	
	createinvitems(slf, itmi_stext_lootchest_Helm, bonus + (kapitel * 20) + hlp_random(30));		
	createinvitems(slf, itmi_stext_lootchest_Pants, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Boots, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Gloves, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Torso, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Armor, bonus + (kapitel * 20) + hlp_random(30));	
	createinvitems(slf, itmi_stext_lootchest_Belt, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Amulet, bonus + (kapitel * 20) + hlp_random(30));
	createinvitems(slf, itmi_stext_lootchest_Ring, bonus + (kapitel * 20) + hlp_random(30));
	//createinvitems(slf, itmi_stext_lootchest_MagicStaff, bonus + (kapitel * 2) + hlp_random(3));
};

func void b_givetradeinv_shiva(var c_npc slf) 
{
	var int bonus;
	bonus = 1 + StExt_GetPercentFromValue(StExt_TraderReputation, 20);

	if (!StExt_TraderBarterAiv[StExt_ShivaTradeIndex_First])
	{
		createinvitems(slf, itwr_StExt_book_ice1, 1);
		createinvitems(slf, itwr_StExt_book_dark1, 1);
		createinvitems(slf, itwr_StExt_book_fire1, 1);
		createinvitems(slf, itwr_StExt_book_earth1, 1);
		createinvitems(slf, itwr_StExt_book_light1, 1);	
		createinvitems(slf, itwr_StExt_book_golems1, 1);
		createinvitems(slf, itwr_StExt_book_necromancy1, 1);
		createinvitems(slf, itwr_StExt_book_healing1, 1);
		createinvitems(slf, itwr_StExt_book_demonolog1, 1);	
		createinvitems(slf, itwr_StExt_book_electro1, 1);
		createinvitems(slf, itwr_StExt_book_air1, 1);
		createinvitems(slf, itwr_StExt_book_death1, 1);
		createinvitems(slf, itwr_StExt_book_shaman1, 1);
		createinvitems(slf, itwr_StExt_book_matrialarts1, 1);
		createinvitems(slf, itwr_StExt_book_agile1, 1);
		createinvitems(slf, itwr_StExt_book_archery1, 1);
	
		// add auras
		createinvitems(slf, itau_stext_Concentrator, 1);
		createinvitems(slf, itau_stext_BisonHeart, 1);
		createinvitems(slf, itau_stext_AdanosWisdom, 1);
		createinvitems(slf, itau_stext_HidenKnowlege, 1);
		createinvitems(slf, itau_stext_BearStrength, 1);
		createinvitems(slf, itau_stext_PumaAgility, 1);
		createinvitems(slf, itau_stext_OwlHood, 1);
		createinvitems(slf, itau_stext_WolfRegeneration, 1);
		createinvitems(slf, itau_stext_CunningRaven, 1);
		createinvitems(slf, itau_stext_DogEndurance, 1);
		createinvitems(slf, itau_stext_Dreamer, 1);
		createinvitems(slf, itau_stext_CheetahSpeed, 1);
		createinvitems(slf, itau_stext_AstralFlow, 1);
		createinvitems(slf, itau_stext_SnakeFlexebility, 1);
		createinvitems(slf, itau_stext_Lich, 1);
		createinvitems(slf, itau_stext_Mindflayer, 1);
		createinvitems(slf, itau_stext_SoulStealer, 1);
		createinvitems(slf, itau_stext_IronSkin, 1);
		createinvitems(slf, itau_stext_WindShield, 1);
		createinvitems(slf, itau_stext_SpellEater, 1);
		createinvitems(slf, itau_stext_Luck, 1);
		createinvitems(slf, itau_stext_Wealth, 1);
		createinvitems(slf, itau_stext_Thief, 1);
		createinvitems(slf, itau_stext_Necromancer, 1);
		createinvitems(slf, itau_stext_Graveyard, 1);
		createinvitems(slf, itau_stext_Forest, 1);
		createinvitems(slf, itau_stext_Hell, 1);
		createinvitems(slf, itau_stext_Golem, 1);
		createinvitems(slf, itau_stext_Thorns, 1);
		createinvitems(slf, itau_stext_MirrorShield, 1);
		createinvitems(slf, itau_stext_Summoner, 1);
		createinvitems(slf, itau_stext_Conjurer, 1);
		createinvitems(slf, itau_stext_Stuner, 1);
		createinvitems(slf, itau_stext_Burner, 1);
		createinvitems(slf, itau_stext_Frezer, 1);
		createinvitems(slf, itau_stext_Pray, 1);
		createinvitems(slf, itau_stext_Death, 1);
		createinvitems(slf, itau_stext_Poision, 1);
		createinvitems(slf, itau_stext_Shock, 1);
		createinvitems(slf, itau_stext_Curser, 1);
		createinvitems(slf, itau_stext_Crusher, 1);
		createinvitems(slf, itau_stext_Chopper, 1);
		createinvitems(slf, itau_stext_Piercer, 1);
		createinvitems(slf, itau_stext_WarriorTrance, 1);
		createinvitems(slf, itau_stext_Shooter, 1);
		createinvitems(slf, itau_stext_Archmage, 1);
		createinvitems(slf, itau_stext_EthernalSkin, 1);
		createinvitems(slf, itau_stext_Strurdy, 1);
		createinvitems(slf, itau_stext_DeathFog, 1);
		createinvitems(slf, itau_stext_CursedLands, 1);
		createinvitems(slf, itau_stext_Blizzard, 1);
		createinvitems(slf, itau_stext_Thunderstorm, 1);
		createinvitems(slf, itau_stext_Miazma, 1);
		createinvitems(slf, itau_stext_Roots, 1);
		createinvitems(slf, itau_stext_Inferno, 1);
		createinvitems(slf, itau_stext_Earthquake, 1);
		createinvitems(slf, itau_stext_Preparation, 1);
		createinvitems(slf, itau_stext_AutoFireBall, 1);
		createinvitems(slf, itau_stext_AutoIcelance, 1);
		createinvitems(slf, itau_stext_AutoDarkBall, 1);
		createinvitems(slf, itau_stext_AutoDeathBall, 1);
		createinvitems(slf, itau_stext_AutoLighting, 1);
		createinvitems(slf, itau_stext_AutoAirFist, 1);
		createinvitems(slf, itau_stext_AutoPoisionBall, 1);
		createinvitems(slf, itau_stext_AutoStonedBolt, 1);
		createinvitems(slf, itau_stext_ShadowWarrior, 1);
		createinvitems(slf, itau_stext_Duration, 1);

		createinvitems(slf, itau_stext_FireMasteryPower, 1);
		createinvitems(slf, itau_stext_NecroMasteryPower, 1);
		createinvitems(slf, itau_stext_ShamanMasteryPower, 1);
		createinvitems(slf, itau_stext_GolemMasteryPower, 1);
		createinvitems(slf, itau_stext_EarthMasteryPower, 1);
		createinvitems(slf, itau_stext_ElectricMasteryPower, 1);
		createinvitems(slf, itau_stext_AirMasteryPower, 1);
		createinvitems(slf, itau_stext_IceMasteryPower, 1);
		createinvitems(slf, itau_stext_DeathMasteryPower, 1);
		createinvitems(slf, itau_stext_DarkMasteryPower, 1);
		createinvitems(slf, itau_stext_LifeMasteryPower, 1);
		createinvitems(slf, itau_stext_DemonMasteryPower, 1);
		createinvitems(slf, itau_stext_LightMasteryPower, 1);
		createinvitems(slf, itau_stext_WeaponThrower, 1);
		createinvitems(slf, itau_stext_DualMastery, 1);
		createinvitems(slf, itau_stext_CBowMastery, 1);
		createinvitems(slf, itau_stext_BowMastery, 1);
		createinvitems(slf, itau_stext_1hMastery, 1);
		createinvitems(slf, itau_stext_2hMastery, 1);		
		createinvitems(slf, itau_stext_ReflectDamageAsBlunt, 1);
		createinvitems(slf, itau_stext_ReflectDamageAsEdge, 1);
		createinvitems(slf, itau_stext_ReflectDamageAsPoint, 1);
		createinvitems(slf, itau_stext_ReflectDamageAsFire, 1);
		createinvitems(slf, itau_stext_ReflectDamageAsFly, 1);
		createinvitems(slf, itau_stext_ReflectDamageAsPoision, 1);
		createinvitems(slf, itau_stext_ReflectDamageAsMagic, 1);
		
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_First] = true;
	};
	
    if (stext_andriel_reward && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss1]) 
	{
		createinvitems(slf, itwr_StExt_book_ice2, 1);
		createinvitems(slf, itwr_StExt_book_dark2, 1);
		createinvitems(slf, itwr_StExt_book_fire2, 1);
		createinvitems(slf, itwr_StExt_book_earth2, 1);
		createinvitems(slf, itwr_StExt_book_light2, 1);		
		createinvitems(slf, itwr_StExt_book_golems2, 1);
		createinvitems(slf, itwr_StExt_book_necromancy2, 1);
		createinvitems(slf, itwr_StExt_book_healing2, 1);
		createinvitems(slf, itwr_StExt_book_demonolog2, 1);		
		createinvitems(slf, itwr_StExt_book_electro2, 1);
		createinvitems(slf, itwr_StExt_book_air2, 1);
		createinvitems(slf, itwr_StExt_book_death2, 1);
		createinvitems(slf, itwr_StExt_book_shaman2, 1);
		createinvitems(slf, itwr_StExt_book_matrialarts2, 1);
		createinvitems(slf, itwr_StExt_book_agile2, 1);
		createinvitems(slf, itwr_StExt_book_archery2, 1);
		createinvitems(slf, itmi_potionpermblank, 1);
		
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss1] = true;
    };
    if (stext_duriel_reward && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss2]) 
	{
		createinvitems(slf, itwr_StExt_book_ice3, 1);
		createinvitems(slf, itwr_StExt_book_dark3, 1);
		createinvitems(slf, itwr_StExt_book_fire3, 1);
		createinvitems(slf, itwr_StExt_book_earth3, 1);
		createinvitems(slf, itwr_StExt_book_light3, 1);
		createinvitems(slf, itwr_StExt_book_golems3, 1);
		createinvitems(slf, itwr_StExt_book_necromancy3, 1);
		createinvitems(slf, itwr_StExt_book_healing3, 1);
		createinvitems(slf, itwr_StExt_book_demonolog3, 1);
		createinvitems(slf, itwr_StExt_book_electro3, 1);
		createinvitems(slf, itwr_StExt_book_air3, 1);
		createinvitems(slf, itwr_StExt_book_death3, 1);
		createinvitems(slf, itwr_StExt_book_shaman3, 1);
		createinvitems(slf, itwr_StExt_book_matrialarts3, 1);
		createinvitems(slf, itwr_StExt_book_agile3, 1);
		createinvitems(slf, itwr_StExt_book_archery3, 1);
		
		createinvitems(slf, itmi_stext_lootchest_Shield, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Sword1h, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Sword2h, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Axe1h, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Axe2h, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Mace1h, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Mace2h, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_MagicSword, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Staff, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Rapier, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_DexSword, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Halleberd, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Spear, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Dual, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Bow, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_CrossBow, 50 + hlp_random(50));		
		//createinvitems(slf, itmi_stext_lootchest_MagicStaff, 20);
		createinvitems(slf, itmi_potionpermblank, 2);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss2] = true;
    };
    if (stext_mephisto_reward && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss3]) 
	{
		createinvitems(slf, itwr_StExt_book_ice4, 1);
		createinvitems(slf, itwr_StExt_book_dark4, 1);
		createinvitems(slf, itwr_StExt_book_fire4, 1);
		createinvitems(slf, itwr_StExt_book_earth4, 1);
		createinvitems(slf, itwr_StExt_book_light4, 1);
		createinvitems(slf, itwr_StExt_book_golems4, 1);
		createinvitems(slf, itwr_StExt_book_necromancy4, 1);
		createinvitems(slf, itwr_StExt_book_healing4, 1);
		createinvitems(slf, itwr_StExt_book_demonolog4, 1);
		createinvitems(slf, itwr_StExt_book_electro4, 1);
		createinvitems(slf, itwr_StExt_book_air4, 1);		
		createinvitems(slf, itwr_StExt_book_death4, 1);
		createinvitems(slf, itwr_StExt_book_shaman4, 1);
		createinvitems(slf, itwr_StExt_book_matrialarts4, 1);
		createinvitems(slf, itwr_StExt_book_agile4, 1);
		createinvitems(slf, itwr_StExt_book_archery4, 1);
		
		createinvitems(slf, itmi_stext_lootchest_Helm, 50 + hlp_random(50));		
		createinvitems(slf, itmi_stext_lootchest_Pants, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Boots, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Gloves, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Torso, 50 + hlp_random(50));
		createinvitems(slf, itmi_potionpermblank, 3);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss3] = true;		
    };
    if (stext_diablo_reward && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss4]) 
	{
		createinvitems(slf, itwr_StExt_book_ice5, 1);
		createinvitems(slf, itwr_StExt_book_dark5, 1);
		createinvitems(slf, itwr_StExt_book_fire5, 1);
		createinvitems(slf, itwr_StExt_book_earth5, 1);
		createinvitems(slf, itwr_StExt_book_light5, 1);
		createinvitems(slf, itwr_StExt_book_golems5, 1);
		createinvitems(slf, itwr_StExt_book_necromancy5, 1);
		createinvitems(slf, itwr_StExt_book_healing5, 1);
		createinvitems(slf, itwr_StExt_book_demonolog5, 1);
		createinvitems(slf, itwr_StExt_book_electro5, 1);
		createinvitems(slf, itwr_StExt_book_air5, 1);
		createinvitems(slf, itwr_StExt_book_death5, 1);
		createinvitems(slf, itwr_StExt_book_shaman5, 1);
		createinvitems(slf, itwr_StExt_book_matrialarts5, 1);
		createinvitems(slf, itwr_StExt_book_agile5, 1);
		createinvitems(slf, itwr_StExt_book_archery5, 1);
		
		createinvitems(slf, itmi_stext_lootchest_Armor, 50 + hlp_random(50));
		createinvitems(slf, itmi_potionpermblank, 4);		
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss4] = true;
    };
	if (stext_baal_reward && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss5])
	{
		createinvitems(slf, itmi_stext_lootchest_Belt, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Amulet, 50 + hlp_random(50));
		createinvitems(slf, itmi_stext_lootchest_Ring, 50 + hlp_random(50));		
		createinvitems(slf, itmi_potionpermblank, 5);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Boss5] = true;
	};

	if ((kapitel >= 1) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap1])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap1] = true;
	};
	if ((kapitel >= 2) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap2])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_GiveLootBox_Kapitel(slf);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap2] = true;
	};
	if ((kapitel >= 3) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap3])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_GiveLootBox_Kapitel(slf);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap3] = true;
	};
	if ((kapitel >= 4) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap4])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_orestuck, 3 + hlp_random(2 + bonus));		
		createinvitems(slf, itmi_moonstone, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_diamod, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_emerald, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_ruby, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_sapphire, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_opal, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_topaz, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));		
		createinvitems(slf, itmi_zeitspalt_addon, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_GiveLootBox_Kapitel(slf);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap4] = true;
	};
	if ((kapitel >= 5) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap5])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_orestuck, 3 + hlp_random(2 + bonus));
		createinvitems(slf, itmi_moonstone, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_diamod, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_emerald, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_ruby, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_sapphire, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_opal, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_topaz, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));		
		createinvitems(slf, itmi_zeitspalt_addon, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_GiveLootBox_Kapitel(slf);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap5] = true;
	};
	if ((kapitel >= 6) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap6])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_orestuck, 3 + hlp_random(2 + bonus));
		createinvitems(slf, itmi_moonstone, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_diamod, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_emerald, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_ruby, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_sapphire, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_opal, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_topaz, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));		
		createinvitems(slf, itmi_zeitspalt_addon, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_GiveLootBox_Kapitel(slf);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap6] = true;
	};
	if ((kapitel >= 7) && !StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap7])
	{
		createinvitems(slf, itmi_nugget, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_silber, 10 + hlp_random(5 + bonus));
		createinvitems(slf, itwr_magicpaper, 20 + hlp_random(5 + bonus));
		createinvitems(slf, itmi_orestuck, 3 + hlp_random(2 + bonus));
		createinvitems(slf, itmi_moonstone, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_diamod, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_emerald, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_ruby, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_sapphire, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_opal, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		createinvitems(slf, itmi_topaz, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));		
		createinvitems(slf, itmi_zeitspalt_addon, 1 + StExt_GetPercentFromValue(hlp_random(StExt_TraderReputation + 5) + 5, 10));
		StExt_Traders_ExtraSpellComponents(slf, kapitel + bonus);
		StExt_GiveLootBox_Kapitel(slf);
		StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Kap7] = true;
	};
};

func void none_99666_StonedTrader_trade_info() { b_givetradeinv_shiva(self); };

instance dia_none_99666_StonedTrader_exit(c_info) {
    npc = none_99666_StonedTrader;
    nr = 999;
    condition = dia_none_99666_StonedTrader_exit_condition;
    information = dia_none_99666_StonedTrader_exit_info;
    permanent = true;
    description = dialog_ende;
};
func int dia_none_99666_StonedTrader_exit_condition() { return true; };
func void dia_none_99666_StonedTrader_exit_info() { ai_stopprocessinfos(self); };

instance dia_none_99666_StonedTrader_hi(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 1;
    condition = dia_none_99666_StonedTrader_hi_condition;
    information = dia_none_99666_StonedTrader_hi_info;
    permanent = true;
    description = StExt_Str_StonedTrader_Hi;
};
func int dia_none_99666_StonedTrader_hi_condition() 
{
	if(stext_mis_shiva == log_success) { return false; };
	return true; 
};
func void dia_none_99666_StonedTrader_hi_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_hi_01");			// Как дела, приятель?
	AI_Output(self, other, "DIA_StExt_Wisp_15_00");					// ...
	if(StExt_StonedTrader_MissionLetterGet == false)
	{
		StExt_StonedTrader_MissionLetterGet = true;
		B_GiveInvItems(self, other, itwr_stoned_shivaletter, 1);	
	};
	ai_stopprocessinfos(self); 
};

instance dia_none_99666_StonedTrader_AndrielReady(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_AndrielReady_condition;
    information = dia_none_99666_StonedTrader_AndrielReady_info;
    permanent = false;
    description = StExt_Str_StonedTrader_AndrielReady;
};
func int dia_none_99666_StonedTrader_AndrielReady_condition() 
{
	if((stext_mis_shiva == log_running) && (stext_andriel_isdead == false)) { return true; };
	return false; 
};
func void dia_none_99666_StonedTrader_AndrielReady_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_AndrielReady_01");		// Как я могу помочь тебе?
	AI_Output(self, other, "DIA_StExt_Wisp_15_00");							// ...
	b_giveplayerxp(100);
	StExt_TraderReputation += 5;
	B_GiveInvItems(self, other, itwr_stoned_andriel, 1);
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_1);
	ai_stopprocessinfos(self); 
};

instance dia_none_99666_StonedTrader_AndrielDone(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_AndrielDone_condition;
    information = dia_none_99666_StonedTrader_AndrielDone_info;
    permanent = true;
    description = StExt_Str_StonedTrader_AndrielDone;
};
func int dia_none_99666_StonedTrader_AndrielDone_condition() 
{
	if((stext_mis_shiva == log_running) && stext_andriel_isdead && (stext_andriel_reward == false)) { return true; };
	return false; 
};
func void dia_none_99666_StonedTrader_AndrielDone_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_AndrielDone_01");		// Я разобрался с Андриэль!
	AI_Output(self, other, "DIA_StExt_Wisp_15_00");							// (счастливоп перебивает) ...
	B_GiveInvItems(self, other, itwr_stoned_duriel, 1);
	var int itemInst;
	itemInst = StExt_GenerateRandomItem(StExt_ItemClass_Consumable_Potion, 150 + hero.level);
	B_GiveInvItems(self, other, itemInst, 15 + hlp_random(3));
	npc_removeinvitems(hero, itwr_stoned_andriel, 1);
	b_giveplayerxp(2500);
	StExt_TraderReputation += 10;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_3);
	stext_andriel_reward = true;
    ai_stopprocessinfos(self);
};

instance dia_none_99666_StonedTrader_DurielDone(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_DurielDone_condition;
    information = dia_none_99666_StonedTrader_DurielDone_info;
    permanent = true;
    description = StExt_Str_StonedTrader_DurielDone;
};
func int dia_none_99666_StonedTrader_DurielDone_condition() 
{
	if((stext_mis_shiva == log_running) && stext_duriel_isdead && (stext_duriel_reward == false)) { return true; };
	return false; 
};
func void dia_none_99666_StonedTrader_DurielDone_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_AndrielDone_01");		// С Дуриэль покончено!
	AI_Output(self, other, "DIA_StExt_Wisp_15_00");							// ...
    B_GiveInvItems(self, other, itwr_stoned_mephisto, 1);
	var int itemInst;
	itemInst = StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_AnyWeapon"), 150 + hero.level);
	B_GiveInvItems(self, other, itemInst, 1);
	npc_removeinvitems(hero, itwr_stoned_duriel, 1);
	b_giveplayerxp(5000);
	StExt_TraderReputation += 15;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_5);
	stext_duriel_reward = true;
    ai_stopprocessinfos(self);
};

instance dia_none_99666_StonedTrader_MephistoDone(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_MephistoDone_condition;
    information = dia_none_99666_StonedTrader_MephistoDone_info;
    permanent = true;
    description = StExt_Str_StonedTrader_MephistoDone;
};
func int dia_none_99666_StonedTrader_MephistoDone_condition() 
{
	if((stext_mis_shiva == log_running) && stext_mephisto_isdead && (stext_mephisto_reward == false)) { return true; };
	return false; 
};
func void dia_none_99666_StonedTrader_MephistoDone_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_MephistoDone_01");		// Мефисто повержен!
	AI_Output(self, other, "DIA_StExt_Wisp_15_00");							// ...
	B_GiveInvItems(self, other, itwr_stoned_diablo, 1);
	var int itemInst;
	itemInst = StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_AnyChestArmor"), 175 + hero.level);
	B_GiveInvItems(self, other, itemInst, 1);
	npc_removeinvitems(hero, itwr_stoned_mephisto, 1);
	b_giveplayerxp(10000);
	StExt_TraderReputation += 20;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_7);
	stext_mephisto_reward = true;
    ai_stopprocessinfos(self);
};

instance dia_none_99666_StonedTrader_DiabloDone(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_DiabloDone_condition;
    information = dia_none_99666_StonedTrader_DiabloDone_info;
    permanent = true;
    description = StExt_Str_StonedTrader_DiabloDone;
};
func int dia_none_99666_StonedTrader_DiabloDone_condition() 
{
	if((stext_mis_shiva == log_running) && stext_diablo_isdead && (stext_diablo_reward == false)) { return true; };
	return false; 
};
func void dia_none_99666_StonedTrader_DiabloDone_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_DiabloDone_01");			// Я уничтожил Диабло!
	AI_Output(self, other, "DIA_StExt_Wisp_15_00");							// ...
	B_GiveInvItems(self, other, itwr_stoned_baal, 1);
	var int itemInst;
	itemInst = StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_FullArmor"), 200 + hero.level);
	B_GiveInvItems(self, other, itemInst, 1);
	npc_removeinvitems(hero, itwr_stoned_diablo, 1);
	b_giveplayerxp(25000);
	StExt_TraderReputation += 25;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_9);
	stext_diablo_reward = true;
    ai_stopprocessinfos(self);
};

instance dia_none_99666_StonedTrader_BaalDone(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_BaalDone_condition;
    information = dia_none_99666_StonedTrader_BaalDone_info;
    permanent = true;
    description = StExt_Str_StonedTrader_BaalDone;
};
func int dia_none_99666_StonedTrader_BaalDone_condition() 
{
	if((stext_mis_shiva == log_running) && stext_baal_isdead && (stext_baal_reward == false)) { return true; };
	return false; 
};
func void dia_none_99666_StonedTrader_BaalDone_info() 
{
	AI_Output(other, self, "DIA_StExt_StonedTrader_BaalDone_01");			// Баал...
	AI_Output(self, other, "DIA_StExt_StonedTrader_BaalDone_02");			// Пал, я знаю! И спасибо тебе за твою самоотверженую помощь, герой.
	info_clearchoices(dia_none_99666_StonedTrader_BaalDone);
	var int itemInst;
	itemInst = StExt_GenerateRandomItem(StExt_SelectItemClassFromList("StExt_ItemClass_List_Jewelry"), 250 + hero.level);
	B_GiveInvItems(self, other, itemInst, 1);
    b_giveplayerxp(50000);
	StExt_TraderReputation += 30;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_11);
	npc_removeinvitems(hero, itwr_stoned_baal, 1);
	log_settopicstatus(StExt_topic_shivaletter, log_success);
	stext_mis_shiva = log_success;        
	stext_baal_reward = true;
    ai_stopprocessinfos(self);
};

func void StExt_BuildEnchntedItemsSellForm_BuildLoop()
{
	var int priceMult;
	priceMult = StExt_ShivaTrade_EnchantmentSellPriceMult + StExt_GetPercentFromValue(StExt_TraderReputation, 25);
	StExt_CraftInfo.Price = StExt_GetPercentFromValueWithMin(StExt_CraftInfo.Price, priceMult, 1);
	rx_craft_playersales_addtoproductlist(StExt_CraftInfo.ResultInstance, StExt_CraftInfo.Price);
};

func void dia_none_99666_StonedTrader_sellenchanted_weap_callback() 
{
	var C_IntArray array;
    rx_craft_playersales_clearproductlist();
	
	array = StExt_Struct_Alloc(StExt_SizeOf_Int * 21);
	if (Hlp_IsNULL(array)) { return; };
	
	StExt_Struct_Write(array, StExt_SizeOf_Int * 0, StExt_ItemClass_MeeleWeapon_Sword1H);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 1, StExt_ItemClass_MeeleWeapon_Axe1H);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 2, StExt_ItemClass_MeeleWeapon_Mace1H);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 3, StExt_ItemClass_MeeleWeapon_Dagger);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 4, StExt_ItemClass_MeeleWeapon_Rapier);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 5, StExt_ItemClass_MeeleWeapon_DexSword);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 6, StExt_ItemClass_MeeleWeapon_MagicSword);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 7, StExt_ItemClass_MeeleWeapon_Sword2H);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 8, StExt_ItemClass_MeeleWeapon_Mace2H);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 9, StExt_ItemClass_MeeleWeapon_Axe2H);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 10, StExt_ItemClass_MeeleWeapon_Staff);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 11, StExt_ItemClass_MeeleWeapon_Spear);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 12, StExt_ItemClass_MeeleWeapon_Halleberd);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 13, StExt_ItemClass_MeeleWeapon_OrcWeapon);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 14, StExt_ItemClass_MeeleWeapon_DualL);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 15, StExt_ItemClass_MeeleWeapon_DualR);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 16, StExt_ItemClass_MeeleWeapon_FistWeapon);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 17, StExt_ItemClass_RangeWeapon_LightBow);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 18, StExt_ItemClass_RangeWeapon_HeavyBow);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 19, StExt_ItemClass_RangeWeapon_LightCrossBow);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 20, StExt_ItemClass_RangeWeapon_HeavyCrossBow);	
	
	StExt_BuildEnchntedItemsSellForm(array, 21);
	StExt_Struct_Free(array);
    rx_opencraft_playersales(self);
};
func void dia_none_99666_StonedTrader_sellenchanted_weap() 
{
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.0, dia_none_99666_StonedTrader_sellenchanted_weap_callback);
};

func void dia_none_99666_StonedTrader_sellenchanted_armor_callback() 
{
	var C_IntArray array;
    rx_craft_playersales_clearproductlist();
	
	array = StExt_Struct_Alloc(StExt_SizeOf_Int * 23);
	if (Hlp_IsNULL(array)) { return; };
	
	StExt_Struct_Write(array, StExt_SizeOf_Int * 0, StExt_ItemClass_FullArmor_Clothing);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 1, StExt_ItemClass_FullArmor_LightArmor);	
	StExt_Struct_Write(array, StExt_SizeOf_Int * 2, StExt_ItemClass_FullArmor_MediumArmor);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 3, StExt_ItemClass_FullArmor_HeavyArmor);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 4, StExt_ItemClass_Helm_Hood);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 5, StExt_ItemClass_Helm_Circlet);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 6, StExt_ItemClass_Helm_LightHelm);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 7, StExt_ItemClass_Helm_MediumHelm);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 8, StExt_ItemClass_Helm_HeavyHelm);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 9, StExt_ItemClass_Gloves_Light);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 10, StExt_ItemClass_Boots_Light);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 11, StExt_ItemClass_Pants_Light);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 12, StExt_ItemClass_Pauldrons_Light);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 13, StExt_ItemClass_Gloves_Medium);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 14, StExt_ItemClass_Boots_Medium);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 15, StExt_ItemClass_Pants_Medium);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 16, StExt_ItemClass_Pauldrons_Medium);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 17, StExt_ItemClass_Gloves_Heavy);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 18, StExt_ItemClass_Boots_Heavy);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 19, StExt_ItemClass_Pants_Heavy);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 20, StExt_ItemClass_Pauldrons_Heavy);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 21, StExt_ItemClass_Shield_LightShield);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 22, StExt_ItemClass_Shield_HeavyShield);
	
	StExt_BuildEnchntedItemsSellForm(array, 23);
	StExt_Struct_Free(array);
    rx_opencraft_playersales(self);
};
func void dia_none_99666_StonedTrader_sellenchanted_armor() 
{
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.0, dia_none_99666_StonedTrader_sellenchanted_armor_callback);
};

func void dia_none_99666_StonedTrader_sellenchanted_jewelry_callback() 
{
	var C_IntArray array;
    rx_craft_playersales_clearproductlist();
	
	array = StExt_Struct_Alloc(StExt_SizeOf_Int * 10);
	if (Hlp_IsNULL(array)) { return; };
	
	
	StExt_Struct_Write(array, StExt_SizeOf_Int * 0, StExt_ItemClass_Amulet_Warrior);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 1, StExt_ItemClass_Amulet_Mage);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 2, StExt_ItemClass_Amulet_Archer);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 3, StExt_ItemClass_Ring_Warrior);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 4, StExt_ItemClass_Ring_Mage);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 5, StExt_ItemClass_Ring_Archer);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 6, StExt_ItemClass_Belt_Warrior);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 7, StExt_ItemClass_Belt_Mage);	
	StExt_Struct_Write(array, StExt_SizeOf_Int * 8, StExt_ItemClass_Belt_Archer);
	StExt_Struct_Write(array, StExt_SizeOf_Int * 9, StExt_ItemClass_Trophy);
	
	StExt_BuildEnchntedItemsSellForm(array, 10);
	StExt_Struct_Free(array);
    rx_opencraft_playersales(self);
};
func void dia_none_99666_StonedTrader_sellenchanted_jewelry() 
{
    ai_stopprocessinfos(self);
    rx_callbackdialog(self, 0.0, dia_none_99666_StonedTrader_sellenchanted_jewelry_callback);
};

instance dia_none_99666_StonedTrader_SellEnchanted(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_SellEnchanted_condition;
    information = dia_none_99666_StonedTrader_SellEnchanted_info;
    permanent = true;
    description = StExt_Str_StonedTrader_SellEnchanted;
};
func void dia_none_99666_StonedTrader_SellEnchanted_back() { info_clearchoices(dia_none_99666_StonedTrader_SellEnchanted); };

func int dia_none_99666_StonedTrader_SellEnchanted_condition() { return StExt_StonedTrader_MissionLetterGet; };
func void dia_none_99666_StonedTrader_SellEnchanted_info() 
{
	info_clearchoices(dia_none_99666_StonedTrader_SellEnchanted);
    info_addchoice(dia_none_99666_StonedTrader_SellEnchanted, dialog_back, dia_none_99666_StonedTrader_SellEnchanted_back);
    info_addchoice(dia_none_99666_StonedTrader_SellEnchanted, StExt_Str_StonedTrader_SellEnchanted_Weap, dia_none_99666_StonedTrader_sellenchanted_weap);
    info_addchoice(dia_none_99666_StonedTrader_SellEnchanted, StExt_Str_StonedTrader_SellEnchanted_Armor, dia_none_99666_StonedTrader_sellenchanted_armor);
	info_addchoice(dia_none_99666_StonedTrader_SellEnchanted, StExt_Str_StonedTrader_SellEnchanted_Jewelry, dia_none_99666_StonedTrader_sellenchanted_jewelry);
};

instance dia_none_99666_StonedTrader_IdentifyItems(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 10;
    condition = dia_none_99666_StonedTrader_IdentifyItems_condition;
    information = dia_none_99666_StonedTrader_IdentifyItems_info;
    permanent = true;
    description = StExt_Str_StonedTrader_IdentifyItems;
};

func int dia_none_99666_StonedTrader_IdentifyItems_condition() 
{
	var string desc;
	var int itemsCount;
	var int price;
	
	itemsCount = StExt_GetUndefinedItemsCount();
	if (itemsCount <= 0) { return false; };
	
	if (StExt_StonedTrader_MissionLetterGet)
	{
		desc = StExt_Str_StonedTrader_IdentifyItems;
		price = StExt_ValidateValueMin(StExt_ShivaTrade_IdentificationPrice - StExt_TraderReputation, 10);
		
		desc = concatstrings(desc, " (");
		desc = concatstrings(desc, inttostring(itemsCount));
		desc = concatstrings(desc, StExt_Str_Pcs);
		desc = concatstrings(desc, " | ");
		desc = concatstrings(desc, StExt_Str_StonedTrader_IdentifyItems_ItmPrice);		
		desc = concatstrings(desc, inttostring(price));
		desc = concatstrings(desc, " | ");
		desc = concatstrings(desc, StExt_Str_StonedTrader_IdentifyItems_ItmPriceTotal);
		desc = concatstrings(desc, inttostring(price * itemsCount));
		desc = concatstrings(desc, " ");
		desc = concatstrings(desc, StExt_Str_Required_Gold);		
		desc = concatstrings(desc, ")");
		
		rx_setdialogdescription(dia_none_99666_StonedTrader_IdentifyItems, desc);		
		return true;
	};
	return false;
};
func void dia_none_99666_StonedTrader_IdentifyItems_info() 
{
	var int itemsCount;
	var int price;
	var int priceTotal;

	price = StExt_ValidateValueMin(StExt_ShivaTrade_IdentificationPrice - StExt_TraderReputation, 10);
	itemsCount = StExt_GetUndefinedItemsCount();
	priceTotal = itemsCount * price;
	
	if (npc_hasitems(hero, itmi_gold) < priceTotal)	
	{
		ai_printred(concatstrings(StExt_Str_NeedGold, inttostring(priceTotal)));
		ai_stopprocessinfos(self);
		return;
	};
	
	ai_printbonus(concatstrings(StExt_Str_IdentifiedItems, concatstrings(inttostring(itemsCount), StExt_Str_Pcs)));
	npc_removeinvitems(hero, itmi_gold, priceTotal);
	StExt_IdentifyAllItems();
	ai_stopprocessinfos(self);
};


const int StExt_ShivaChestsList_Max = 25;
const string StExt_ShivaChestsList[StExt_ShivaChestsList_Max] =
{
	"itmi_stext_lootchest_Shield",
	"itmi_stext_lootchest_Sword1h",
	"itmi_stext_lootchest_Sword2h",
	"itmi_stext_lootchest_Axe1h",
	"itmi_stext_lootchest_Axe2h",
	"itmi_stext_lootchest_Mace1h",
	"itmi_stext_lootchest_Mace2h",
	"itmi_stext_lootchest_MagicSword",
	"itmi_stext_lootchest_Staff",
	"itmi_stext_lootchest_Rapier",
	"itmi_stext_lootchest_DexSword",
	"itmi_stext_lootchest_Halleberd",
	"itmi_stext_lootchest_Spear",
	"itmi_stext_lootchest_Dual",
	"itmi_stext_lootchest_Bow",
	"itmi_stext_lootchest_CrossBow",
	"itmi_stext_lootchest_Helm",
	"itmi_stext_lootchest_Pants",
	"itmi_stext_lootchest_Boots",
	"itmi_stext_lootchest_Gloves",
	"itmi_stext_lootchest_Torso",
	"itmi_stext_lootchest_Armor",
	"itmi_stext_lootchest_Belt",
	"itmi_stext_lootchest_Amulet",	
	"itmi_stext_lootchest_Ring"
};

var int StExt_ShivaOpenChest_OpenCount;

instance dia_none_99666_StonedTrader_OpenChests(c_info) 
{
    npc = none_99666_StonedTrader;
    nr = 998;
    condition = dia_none_99666_StonedTrader_OpenChests_condition;
    information = dia_none_99666_StonedTrader_OpenChests_info;
    permanent = true;
    description = StExt_Str_StonedTrader_OpenChests;
};

func int dia_none_99666_StonedTrader_OpenChests_condition() { return true; };

func int StExt_ShivaOpenChest_ListLoop(var int index)
{
	if (index >= StExt_ShivaChestsList_Max) { return false; };
	
	var string onUseFunc;
	var string chestType; chestType = StExt_Array_GetString("StExt_ShivaChestsList", index);
	var int chestTypeId; chestTypeId = StExt_GetInstanceIdByName(chestType);
	
	if (chestTypeId == StExt_Null) 
	{ 
		StExt_PrintDamageDebugStack(concatstrings("StExt_ShivaOpenChest_ListLoop() -> Instance not found: ", chestType));
		return true; 
	};
	
	var int chestsCount; chestsCount = npc_hasitems(hero, chestTypeId);
	if (chestsCount > 0)
	{
		StExt_PrintDamageDebugStack(concatstrings("StExt_ShivaOpenChest_ListLoop() -> Open chests: ", chestType));
		onUseFunc = concatstrings("use_", chestType);		
		StExt_CallFuncXTimes(onUseFunc, chestsCount);
		npc_removeinvitems(hero, chestTypeId, chestsCount);
		StExt_ShivaOpenChest_OpenCount += chestsCount;
		StExt_PrintDamageDebugStack(concatstrings("StExt_ShivaOpenChest_ListLoop() -> Opened chests: ", inttostring(chestsCount)));
	};
	return (index < StExt_ShivaChestsList_Max);
};

func void dia_none_99666_StonedTrader_OpenChests_callback()
{
	StExt_ShivaOpenChest_OpenCount = 0;
	StExt_While(StExt_ShivaOpenChest_ListLoop);
	if (StExt_ShivaOpenChest_OpenCount > 0) {
		ai_printbonus(concatstrings(StExt_Str_StonedTrader_OpenChests_Open, inttostring(StExt_ShivaOpenChest_OpenCount)));
	}
	else { ai_printred(StExt_Str_StonedTrader_OpenChests_Nothing); };
};

func void dia_none_99666_StonedTrader_OpenChests_info() 
{	
	ai_stopprocessinfos(self);
	rx_callbackdialog(self, 0.05, dia_none_99666_StonedTrader_OpenChests_callback);
};
