func void StExt_ChangeCheat_Notify(var string option, var int val)
{
	var string text;
	text = concatstrings("StExt: ", option);
	text = concatstrings(text, " - ");
	if(val) 
	{ 
		text = concatstrings(text, "ON");
		ai_printbonus(text);
	}
	else 
	{ 
		text = concatstrings(text, "OFF");
		ai_printred(text);
	};
};

instance Dia_StExt_ModMenu_Debug(c_info) 
{
    npc = pc_hero;
    condition = StExt_ModMenuDia_Debug_Condition;
    information = Dia_StExt_ModMenu_Debug_info;
    important = false;
    permanent = true;
    nr = 990;
    description = "(Debug Menu)";
};
func void StExt_DisplayModMenu_Debug_back() { info_clearchoices(Dia_StExt_ModMenu_Debug); };
func int StExt_ModMenuDia_Debug_Condition() { return (StExt_DisplayModMenu && StExt_Config_CheatsEnabled); };

func void Dia_StExt_ModMenu_Debug_info()
{
	info_clearchoices(Dia_StExt_ModMenu_Debug);
	info_addchoice(Dia_StExt_ModMenu_Debug, dialog_back, StExt_DisplayModMenu_Debug_back);
	
	info_addchoice(Dia_StExt_ModMenu_Debug, "Teleport to...", StExt_Debug_Teleport);	
	
	if (true) { info_addchoice(Dia_StExt_ModMenu_Debug, "Compile items", StExt_Debug_CompileItems); };
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add artifacts upgrade kit", Dia_StExt_ModMenu_Configs_Debug_ArtifactUpgradeKit);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add random Misk", Dia_StExt_ModMenu_Configs_Debug_RandomMisk);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add random Food", Dia_StExt_ModMenu_Configs_Debug_RandomFood);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add random Alchemy", Dia_StExt_ModMenu_Configs_Debug_RandomAlchemy);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add random Magic", Dia_StExt_ModMenu_Configs_Debug_RandomMagic);	
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add all mastery books", Dia_StExt_ModMenu_Configs_Debug_MasteryBooks);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add all auras", Dia_StExt_ModMenu_Configs_Debug_Auras);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add all runes", Dia_StExt_ModMenu_Configs_Debug_Runes);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add gold (1000000)", Dia_StExt_ModMenu_Configs_Debug_Gold100);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add gold (100000)", Dia_StExt_ModMenu_Configs_Debug_Gold10);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add gold (10000)", Dia_StExt_ModMenu_Configs_Debug_Gold);
	
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add luck (1%)", Dia_StExt_ModMenu_Configs_Debug_Luck);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add corruption exp (1000)", Dia_StExt_ModMenu_Configs_Debug_CorruptionExp);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add masteries exp (1000)", Dia_StExt_ModMenu_Configs_Debug_MasteriesExp);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add exp (1000)", Dia_StExt_ModMenu_Configs_Debug_Exp);
	
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add corruption points (10)", Dia_StExt_ModMenu_Configs_Debug_CorruptionLp);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add masteries points (10)", Dia_StExt_ModMenu_Configs_Debug_MasteriesLp);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Add lp (10)", Dia_StExt_ModMenu_Configs_Debug_Lp);
	
	info_addchoice(Dia_StExt_ModMenu_Debug, "Cheat: Make reflective", Dia_StExt_ModMenu_Configs_Debug_MakeReflective);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Cheat: Add extra damage", Dia_StExt_ModMenu_Configs_Debug_AddExtraDamage);

	info_addchoice(Dia_StExt_ModMenu_Debug, "Cheat: Superman", Dia_StExt_ModMenu_Configs_Debug_Superman);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Cheat: Invisible", Dia_StExt_ModMenu_Configs_Debug_Invisible);
	info_addchoice(Dia_StExt_ModMenu_Debug, "Cheat: Immortal", Dia_StExt_ModMenu_Configs_Debug_Immortal);
	
	//info_addchoice(Dia_StExt_ModMenu_Debug, "DialogTest", Dia_StExt_ModMenu_Configs_Debug_DialogTest);
};

func void Dia_StExt_ModMenu_Configs_Debug_DialogTest()
{
	info_clearchoices(Dia_StExt_ModMenu_Debug);
	info_addchoice(Dia_StExt_ModMenu_Debug, dialog_back, StExt_DisplayModMenu_Debug_back);
	info_addchoice(Dia_StExt_ModMenu_Debug, "YES", Dia_StExt_ModMenu_Configs_Debug_DialogTestAction);
	info_addchoice(Dia_StExt_ModMenu_Debug, "NO", Dia_StExt_ModMenu_Configs_Debug_DialogTestAction);
};
func void Dia_StExt_ModMenu_Configs_Debug_DialogTestAction()
{
	ai_printbonus(StExt_ChoiceName);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_ArtifactUpgradeKit()
{
	StExt_Grimoir_Lp += 10;
	StExt_Dagger_Lp += 10;
	
	createinvitems(hero, itmi_rockcrystal, 100);
	createinvitems(hero, itmi_addon_whitepearl, 100);
	createinvitems(hero, itmi_aquamarine, 100);
	createinvitems(hero, itmi_coal, 100);
	createinvitems(hero, itmi_pitch, 100);
	createinvitems(hero, itmi_quartz, 100);
	createinvitems(hero, itmi_sulfur, 100);
	createinvitems(hero, itmi_nugget, 100);
	
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_RandomMisk() 
{
	StExt_GiveExtraMiskLoot(hero, 100, false);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_RandomFood() 
{
	StExt_GiveExtraFoodLoot(hero, 100, false);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_RandomAlchemy() 
{
	StExt_GiveExtraAlchemyLoot(hero, 100, false);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_RandomMagic() 
{
	StExt_GiveExtraMagicLoot(hero, 100, false);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_MasteryBooks() 
{
	createinvitems(hero, itwr_StExt_book_ice1, 1);
	createinvitems(hero, itwr_StExt_book_dark1, 1);
	createinvitems(hero, itwr_StExt_book_fire1, 1);
	createinvitems(hero, itwr_StExt_book_earth1, 1);
	createinvitems(hero, itwr_StExt_book_light1, 1);
	createinvitems(hero, itwr_StExt_book_golems1, 1);
	createinvitems(hero, itwr_StExt_book_necromancy1, 1);
	createinvitems(hero, itwr_StExt_book_healing1, 1);
	createinvitems(hero, itwr_StExt_book_demonolog1, 1);
	createinvitems(hero, itwr_StExt_book_electro1, 1);
	createinvitems(hero, itwr_StExt_book_air1, 1);
	createinvitems(hero, itwr_StExt_book_death1, 1);
	createinvitems(hero, itwr_StExt_book_shaman1, 1);
	createinvitems(hero, itwr_StExt_book_matrialarts1, 1);
	createinvitems(hero, itwr_StExt_book_agile1, 1);
	createinvitems(hero, itwr_StExt_book_archery1, 1);

	createinvitems(hero, itwr_StExt_book_ice2, 1);
	createinvitems(hero, itwr_StExt_book_dark2, 1);
	createinvitems(hero, itwr_StExt_book_fire2, 1);
	createinvitems(hero, itwr_StExt_book_earth2, 1);
	createinvitems(hero, itwr_StExt_book_light2, 1);
	createinvitems(hero, itwr_StExt_book_golems2, 1);
	createinvitems(hero, itwr_StExt_book_necromancy2, 1);
	createinvitems(hero, itwr_StExt_book_healing2, 1);
	createinvitems(hero, itwr_StExt_book_demonolog2, 1);
	createinvitems(hero, itwr_StExt_book_electro2, 1);
	createinvitems(hero, itwr_StExt_book_air2, 1);
	createinvitems(hero, itwr_StExt_book_death2, 1);
	createinvitems(hero, itwr_StExt_book_shaman2, 1);
	createinvitems(hero, itwr_StExt_book_matrialarts2, 1);
	createinvitems(hero, itwr_StExt_book_agile2, 1);
	createinvitems(hero, itwr_StExt_book_archery2, 1);

	createinvitems(hero, itwr_StExt_book_ice3, 1);
	createinvitems(hero, itwr_StExt_book_dark3, 1);
	createinvitems(hero, itwr_StExt_book_fire3, 1);
	createinvitems(hero, itwr_StExt_book_earth3, 1);
	createinvitems(hero, itwr_StExt_book_light3, 1);
	createinvitems(hero, itwr_StExt_book_golems3, 1);
	createinvitems(hero, itwr_StExt_book_necromancy3, 1);
	createinvitems(hero, itwr_StExt_book_healing3, 1);
	createinvitems(hero, itwr_StExt_book_demonolog3, 1);
	createinvitems(hero, itwr_StExt_book_electro3, 1);
	createinvitems(hero, itwr_StExt_book_air3, 1);
	createinvitems(hero, itwr_StExt_book_death3, 1);
	createinvitems(hero, itwr_StExt_book_shaman3, 1);
	createinvitems(hero, itwr_StExt_book_matrialarts3, 1);
	createinvitems(hero, itwr_StExt_book_agile3, 1);
	createinvitems(hero, itwr_StExt_book_archery3, 1);

	createinvitems(hero, itwr_StExt_book_ice4, 1);
	createinvitems(hero, itwr_StExt_book_dark4, 1);
	createinvitems(hero, itwr_StExt_book_fire4, 1);
	createinvitems(hero, itwr_StExt_book_earth4, 1);
	createinvitems(hero, itwr_StExt_book_light4, 1);
	createinvitems(hero, itwr_StExt_book_golems4, 1);
	createinvitems(hero, itwr_StExt_book_necromancy4, 1);
	createinvitems(hero, itwr_StExt_book_healing4, 1);
	createinvitems(hero, itwr_StExt_book_demonolog4, 1);
	createinvitems(hero, itwr_StExt_book_electro4, 1);
	createinvitems(hero, itwr_StExt_book_air4, 1);	
	createinvitems(hero, itwr_StExt_book_death4, 1);
	createinvitems(hero, itwr_StExt_book_shaman4, 1);
	createinvitems(hero, itwr_StExt_book_matrialarts4, 1);
	createinvitems(hero, itwr_StExt_book_agile4, 1);
	createinvitems(hero, itwr_StExt_book_archery4, 1);

	createinvitems(hero, itwr_StExt_book_ice5, 1);
	createinvitems(hero, itwr_StExt_book_dark5, 1);
	createinvitems(hero, itwr_StExt_book_fire5, 1);
	createinvitems(hero, itwr_StExt_book_earth5, 1);
	createinvitems(hero, itwr_StExt_book_light5, 1);
	createinvitems(hero, itwr_StExt_book_golems5, 1);
	createinvitems(hero, itwr_StExt_book_necromancy5, 1);
	createinvitems(hero, itwr_StExt_book_healing5, 1);
	createinvitems(hero, itwr_StExt_book_demonolog5, 1);
	createinvitems(hero, itwr_StExt_book_electro5, 1);
	createinvitems(hero, itwr_StExt_book_air5, 1);
	createinvitems(hero, itwr_StExt_book_death5, 1);
	createinvitems(hero, itwr_StExt_book_shaman5, 1);
	createinvitems(hero, itwr_StExt_book_matrialarts5, 1);
	createinvitems(hero, itwr_StExt_book_agile5, 1);
	createinvitems(hero, itwr_StExt_book_archery5, 1);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Auras() 
{
	createinvitems(hero, itau_stext_Concentrator, 1);
	createinvitems(hero, itau_stext_BisonHeart, 1);
	createinvitems(hero, itau_stext_AdanosWisdom, 1);
	createinvitems(hero, itau_stext_HidenKnowlege, 1);
	createinvitems(hero, itau_stext_BearStrength, 1);
	createinvitems(hero, itau_stext_PumaAgility, 1);
	createinvitems(hero, itau_stext_OwlHood, 1);
	createinvitems(hero, itau_stext_WolfRegeneration, 1);
	createinvitems(hero, itau_stext_CunningRaven, 1);
	createinvitems(hero, itau_stext_DogEndurance, 1);
	createinvitems(hero, itau_stext_Dreamer, 1);
	createinvitems(hero, itau_stext_CheetahSpeed, 1);
	createinvitems(hero, itau_stext_AstralFlow, 1);
	createinvitems(hero, itau_stext_SnakeFlexebility, 1);
	createinvitems(hero, itau_stext_Lich, 1);
	createinvitems(hero, itau_stext_Mindflayer, 1);
	createinvitems(hero, itau_stext_SoulStealer, 1);
	createinvitems(hero, itau_stext_IronSkin, 1);
	createinvitems(hero, itau_stext_WindShield, 1);
	createinvitems(hero, itau_stext_SpellEater, 1);
	createinvitems(hero, itau_stext_Luck, 1);
	createinvitems(hero, itau_stext_Wealth, 1);
	createinvitems(hero, itau_stext_Thief, 1);
	createinvitems(hero, itau_stext_Necromancer, 1);
	createinvitems(hero, itau_stext_Graveyard, 1);
	createinvitems(hero, itau_stext_Forest, 1);
	createinvitems(hero, itau_stext_Hell, 1);
	createinvitems(hero, itau_stext_Golem, 1);
	createinvitems(hero, itau_stext_Thorns, 1);
	createinvitems(hero, itau_stext_MirrorShield, 1);
	createinvitems(hero, itau_stext_Summoner, 1);
	createinvitems(hero, itau_stext_Conjurer, 1);
	createinvitems(hero, itau_stext_Stuner, 1);
	createinvitems(hero, itau_stext_Burner, 1);
	createinvitems(hero, itau_stext_Frezer, 1);
	createinvitems(hero, itau_stext_Pray, 1);
	createinvitems(hero, itau_stext_Death, 1);
	createinvitems(hero, itau_stext_Poision, 1);
	createinvitems(hero, itau_stext_Shock, 1);
	createinvitems(hero, itau_stext_Curser, 1);
	createinvitems(hero, itau_stext_Crusher, 1);
	createinvitems(hero, itau_stext_Chopper, 1);
	createinvitems(hero, itau_stext_Piercer, 1);
	createinvitems(hero, itau_stext_WarriorTrance, 1);
	createinvitems(hero, itau_stext_Shooter, 1);
	createinvitems(hero, itau_stext_Archmage, 1);
	createinvitems(hero, itau_stext_EthernalSkin, 1);
	createinvitems(hero, itau_stext_Strurdy, 1);
	createinvitems(hero, itau_stext_DeathFog, 1);
	createinvitems(hero, itau_stext_CursedLands, 1);
	createinvitems(hero, itau_stext_Blizzard, 1);
	createinvitems(hero, itau_stext_Thunderstorm, 1);
	createinvitems(hero, itau_stext_Miazma, 1);
	createinvitems(hero, itau_stext_Roots, 1);
	createinvitems(hero, itau_stext_Inferno, 1);
	createinvitems(hero, itau_stext_Earthquake, 1);
	createinvitems(hero, itau_stext_Preparation, 1);
	createinvitems(hero, itau_stext_AutoFireBall, 1);
	createinvitems(hero, itau_stext_AutoIcelance, 1);
	createinvitems(hero, itau_stext_AutoDarkBall, 1);
	createinvitems(hero, itau_stext_AutoDeathBall, 1);
	createinvitems(hero, itau_stext_AutoLighting, 1);
	createinvitems(hero, itau_stext_AutoAirFist, 1);
	createinvitems(hero, itau_stext_AutoPoisionBall, 1);
	createinvitems(hero, itau_stext_AutoStonedBolt, 1);
	createinvitems(hero, itau_stext_ShadowWarrior, 1);
	createinvitems(hero, itau_stext_Duration, 1);	
	createinvitems(hero, itau_stext_FireMasteryPower, 1);
	createinvitems(hero, itau_stext_NecroMasteryPower, 1);
	createinvitems(hero, itau_stext_ShamanMasteryPower, 1);
	createinvitems(hero, itau_stext_GolemMasteryPower, 1);
	createinvitems(hero, itau_stext_EarthMasteryPower, 1);
	createinvitems(hero, itau_stext_ElectricMasteryPower, 1);
	createinvitems(hero, itau_stext_AirMasteryPower, 1);
	createinvitems(hero, itau_stext_IceMasteryPower, 1);
	createinvitems(hero, itau_stext_DeathMasteryPower, 1);
	createinvitems(hero, itau_stext_DarkMasteryPower, 1);
	createinvitems(hero, itau_stext_LifeMasteryPower, 1);
	createinvitems(hero, itau_stext_DemonMasteryPower, 1);
	createinvitems(hero, itau_stext_LightMasteryPower, 1);	
	createinvitems(hero, itau_stext_WeaponThrower, 1);
	createinvitems(hero, itau_stext_DualMastery, 1);
	createinvitems(hero, itau_stext_CBowMastery, 1);
	createinvitems(hero, itau_stext_BowMastery, 1);
	createinvitems(hero, itau_stext_1hMastery, 1);
	createinvitems(hero, itau_stext_2hMastery, 1);	
	createinvitems(hero, itau_stext_ReflectDamageAsBlunt, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsEdge, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsPoint, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsFire, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsFly, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsPoision, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsMagic, 1);

	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Runes() 
{
	createinvitems(hero, itru_orcteleport, 1);
	createinvitems(hero, itru_palteleportsecret, 1);
	createinvitems(hero, itru_pallight, 1);
	createinvitems(hero, itru_pallightheal, 1);
	createinvitems(hero, itru_palmediumheal, 1);
	createinvitems(hero, itru_palfullheal, 1);
	createinvitems(hero, itru_palholybolt, 1);
	createinvitems(hero, itru_palrepelevil, 1);
	createinvitems(hero, itru_paldestroyevil, 1);
	createinvitems(hero, itru_light, 1);
	createinvitems(hero, itru_light_pyr, 1);
	createinvitems(hero, itru_lightheal, 1);
	createinvitems(hero, itru_firebolt, 1);
	createinvitems(hero, itru_zap, 1);
	createinvitems(hero, itru_icebolt, 1);
	createinvitems(hero, itru_sleep, 1);
	createinvitems(hero, itru_berzerk, 1);
	createinvitems(hero, itru_deathbolt, 1);
	createinvitems(hero, itru_sumgobskel, 1);
	createinvitems(hero, itru_sumwolf, 1);
	createinvitems(hero, itru_mediumheal, 1);
	createinvitems(hero, itru_harmundead, 1);
	createinvitems(hero, itru_instantfireball, 1);
	createinvitems(hero, itru_stonefirst, 1);
	createinvitems(hero, itru_icelance, 1);
	createinvitems(hero, itru_sumshoal, 1);
	createinvitems(hero, itru_windfist, 1);
	createinvitems(hero, itru_telekinesis, 1);
	createinvitems(hero, itru_greententacle, 1);
	createinvitems(hero, itru_manaforlife, 1);
	createinvitems(hero, itru_summonzombie, 1);
	createinvitems(hero, itru_fullheal, 1);
	createinvitems(hero, itru_firestorm, 1);
	createinvitems(hero, itru_icecube, 1);
	createinvitems(hero, itru_thunderball, 1);
	createinvitems(hero, itru_fear, 1);
	createinvitems(hero, itru_magsphere, 1);
	createinvitems(hero, itru_charm, 1);
	createinvitems(hero, itru_swarm, 1);
	createinvitems(hero, itru_sumdarkaura, 1);
	createinvitems(hero, itru_sumdarkaura_02, 1);
	createinvitems(hero, itru_sumdarkaura_03, 1);
	createinvitems(hero, itru_sumdarkaura_04, 1);
	createinvitems(hero, itru_sumdarkaura_05, 1);
	createinvitems(hero, itru_sumdarksummonheal, 1);
	createinvitems(hero, itru_sumskelgoblinnecro, 1);
	createinvitems(hero, itru_sumskeluniq, 1);
	createinvitems(hero, itru_sumskelshadowbeast, 1);
	createinvitems(hero, itru_sumskel, 1);
	createinvitems(hero, itru_sumskelarcher, 1);
	createinvitems(hero, itru_sumskelspear, 1);
	createinvitems(hero, itru_beliarsrage, 1);
	createinvitems(hero, itru_iceexploision, 1);
	createinvitems(hero, itru_summonguardian, 1);
	createinvitems(hero, itru_sumgol, 1);
	createinvitems(hero, itru_sumfiregol, 1);
	createinvitems(hero, itru_acid, 1);
	createinvitems(hero, itru_sumswpgol, 1);
	createinvitems(hero, itru_chargefireball, 1);
	createinvitems(hero, itru_firelight, 1);
	createinvitems(hero, itru_lightningflash, 1);
	createinvitems(hero, itru_lightningsphere, 1);
	createinvitems(hero, itru_electrowave, 1);
	createinvitems(hero, itru_sumicegol, 1);
	createinvitems(hero, itru_sumdemon, 1);
	createinvitems(hero, itru_sumdemonhub, 1);
	createinvitems(hero, itru_sumdemon_01, 1);
	createinvitems(hero, itru_sumdemon_02, 1);
	createinvitems(hero, itru_sumdemon_03, 1);
	createinvitems(hero, itru_sumdemon_04, 1);
	createinvitems(hero, itru_sumdemon_05, 1);
	createinvitems(hero, itru_sumdemon_06, 1);
	createinvitems(hero, itru_deathball, 1);
	createinvitems(hero, itru_breathofdeath, 1);
	createinvitems(hero, itru_eligordemons, 1);
	createinvitems(hero, itru_beliarsuperrune, 1);
	createinvitems(hero, itru_orcfireball, 1);
	createinvitems(hero, itru_pyrokinesis, 1);
	createinvitems(hero, itru_waterfist, 1);
	createinvitems(hero, itru_icewave, 1);
	createinvitems(hero, itru_control, 1);
	createinvitems(hero, itru_armyofdarkness, 1);
	createinvitems(hero, itru_severefetidity, 1);
	createinvitems(hero, itru_whirlwind, 1);
	createinvitems(hero, itru_firerain, 1);
	createinvitems(hero, itru_firemeteor, 1);
	createinvitems(hero, itru_geyser, 1);
	createinvitems(hero, itru_thunderstorm, 1);
	createinvitems(hero, itru_icerain, 1);
	createinvitems(hero, itru_massdeath, 1);
	createinvitems(hero, itru_skull, 1);
	createinvitems(hero, itru_bloodrain, 1);
	createinvitems(hero, itru_guruwrath, 1);
	createinvitems(hero, itru_abyssspell, 1);
	createinvitems(hero, itru_masterofdisaster, 1);
	createinvitems(hero, itru_concussionbolt, 1);
	createinvitems(hero, itru_tplheal_00, 1);
	createinvitems(hero, itru_tplheal_01, 1);
	createinvitems(hero, itru_tplheal_02, 1);
	createinvitems(hero, itru_tplheal_03, 1);
	createinvitems(hero, itru_tplstrike_00, 1);
	createinvitems(hero, itru_tplstrike_01, 1);
	createinvitems(hero, itru_tplstrike_02, 1);
	createinvitems(hero, itru_tplstrike_03, 1);
	createinvitems(hero, itru_beliarsrune01, 1);
	createinvitems(hero, itru_beliarsrune02, 1);
	createinvitems(hero, itru_beliarsrune03, 1);
	createinvitems(hero, itru_beliarsrune04, 1);
	createinvitems(hero, itru_beliarsrune05, 1);
	createinvitems(hero, itru_beliarsrune06, 1);
	createinvitems(hero, itru_moraulartu, 1);
	createinvitems(hero, itru_crestelements, 1);
	createinvitems(hero, itru_pyrorune, 1);
	createinvitems(hero, itru_druidrunequest, 1);
	createinvitems(hero, itru_destroyguardians, 1);
	createinvitems(hero, itru_sumtreant, 1);
	createinvitems(hero, itru_trfbloodfly, 1);
	createinvitems(hero, itru_trffirewaran, 1);
	createinvitems(hero, itru_trfwarg, 1);
	createinvitems(hero, itru_trfshadowbeast, 1);
	createinvitems(hero, itru_trfdragonsnapper, 1);
	createinvitems(hero, itru_trftroll, 1);
	createinvitems(hero, itru_shadowmount, 1);
	createinvitems(hero, itru_sumdsnapper, 1);
	createinvitems(hero, itru_sumjina, 1);
	createinvitems(hero, itru_globalteleport, 1);
	createinvitems(hero, itru_teleportmonastery, 1);
	createinvitems(hero, itru_druidball, 1);
	createinvitems(hero, itru_teleportxardas, 1);
	createinvitems(hero, itru_teleportpassnw, 1);
	createinvitems(hero, itru_teleporthiddenpassnw, 1);
	createinvitems(hero, itru_teleporttaverne, 1);
	createinvitems(hero, itru_teleportpsicamp, 1);
	createinvitems(hero, itru_teleportpassow, 1);
	createinvitems(hero, itru_teleportoc, 1);
	createinvitems(hero, itru_teleportowdemontower, 1);
	createinvitems(hero, itru_unlock, 1);
	createinvitems(hero, itru_rapidfirebolt, 1);
	createinvitems(hero, itru_magiccage, 1);
	createinvitems(hero, itru_explosion, 1);
	createinvitems(hero, itru_firewave, 1);
	createinvitems(hero, itru_rapidicebolt, 1);
	createinvitems(hero, itru_rage, 1);
	createinvitems(hero, itru_lacerate, 1);
	createinvitems(hero, itru_extricate, 1);
	createinvitems(hero, itru_elevate, 1);
	createinvitems(hero, itru_quake, 1);
	createinvitems(hero, itru_adanosball, 1);
	createinvitems(hero, itru_greenstrike, 1);
	createinvitems(hero, itru_firelance, 1);
	createinvitems(hero, itru_deathstrike, 1);
	createinvitems(hero, itru_necrobolt, 1);
	createinvitems(hero, itru_gurumass, 1);
	createinvitems(hero, itru_darkheal, 1);
	createinvitems(hero, itru_blink, 1);
	createinvitems(hero, itru_vatrashelprune, 1);
	createinvitems(hero, itru_agro, 1);
	createinvitems(hero, itru_dot_first, 1);
	createinvitems(hero, itru_dot_second, 1);
	createinvitems(hero, itru_dark_invis, 1);
	createinvitems(hero, itru_darkcontrol, 1);
	createinvitems(hero, itru_darksleep, 1);
	createinvitems(hero, itru_massagro, 1);
	createinvitems(hero, itru_massdot, 1);
	createinvitems(hero, itru_darkball, 1);
	createinvitems(hero, itru_bigdarkball, 1);
	createinvitems(hero, itru_darkspear, 1);
	createinvitems(hero, itru_darkcloud, 1);
	createinvitems(hero, itru_darkwave, 1);
	createinvitems(hero, itru_torture, 1);
	createinvitems(hero, itru_darkpetsummon, 1);
	createinvitems(hero, itru_darkrune_steal, 1);
	createinvitems(hero, itru_darkrune_defense, 1);
	createinvitems(hero, itru_darkrune_illness, 1);
	createinvitems(hero, itru_darkrune_healpet, 1);
	createinvitems(hero, itru_darkrune_absorb, 1);
	createinvitems(hero, itru_darkrune_lord, 1);
	createinvitems(hero, itru_darkstatsup, 1);
	createinvitems(hero, itru_darkrune_elementaldefence, 1);
	createinvitems(hero, itru_sumdarkgol, 1);
	createinvitems(hero, itru_stext_magicbolt, 1);
	createinvitems(hero, itru_sumskelmage, 1);
	createinvitems(hero, itru_sumhollywisp, 1);
	createinvitems(hero, itru_summonairgolem, 1);
	createinvitems(hero, itru_debuff_protection, 1);
	createinvitems(hero, itru_debuff_stats, 1);
	createinvitems(hero, itru_debuff_siphon, 1);
	createinvitems(hero, itru_debuff_speed, 1);
	createinvitems(hero, itru_debuff_lifetap, 1);
	createinvitems(hero, itru_debuff_reflectdamage, 1);
	createinvitems(hero, itru_debuff_extradamage, 1);
	createinvitems(hero, itru_debuff_weaken, 1);
	createinvitems(hero, itru_buff_massrestore, 1);
	createinvitems(hero, itru_buff_es, 1);
	createinvitems(hero, itru_buff_dodge, 1);
	createinvitems(hero, itru_buff_speed, 1);
	createinvitems(hero, itru_buff_damage, 1);
	createinvitems(hero, itru_buff_regen, 1);
	createinvitems(hero, itru_buff_stats, 1);
	createinvitems(hero, itru_buff_hp, 1);
	createinvitems(hero, itru_buff_protection, 1);
	createinvitems(hero, itru_summon_ghost, 1);
	createinvitems(hero, itru_summon_bonegolem, 1);
	createinvitems(hero, itru_summon_shadowbeast, 1);
	createinvitems(hero, itru_summon_shadowbeast_fire, 1);
	createinvitems(hero, itru_summon_troll, 1);
	createinvitems(hero, itru_summon_crawler, 1);
	createinvitems(hero, itru_summon_oster, 1);
	createinvitems(hero, itru_stext_firecape, 1);
	createinvitems(hero, itru_stext_icecape, 1);
	createinvitems(hero, itru_stext_lightingcape, 1);
	createinvitems(hero, itru_stext_darkcape, 1);
	createinvitems(hero, itru_stext_aircape, 1);
	createinvitems(hero, itru_stext_earthcape, 1);
	createinvitems(hero, itru_stext_poisioncape, 1);
	createinvitems(hero, itru_stext_summon_electricgolem, 1);

	
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Gold() 
{
	createinvitems(hero, itmi_gold, 10000);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Gold10() 
{
	createinvitems(hero, itmi_gold, 100000);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Gold100() 
{
	createinvitems(hero, itmi_gold, 1000000);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Luck() 
{
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_Luck, 10, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ChestLuck, 10, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_BodyLuck, 10, StExt_PcStat_Source_Perm);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_CorruptionExp() 
{
	StExt_AddCorruptionExp(1000);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_MasteriesExp() 
{
	StExt_AddMasteryExp(0, 1000);
	StExt_AddMasteryExp(1, 1000);
	StExt_AddMasteryExp(2, 1000);
	StExt_AddMasteryExp(3, 1000);
	StExt_AddMasteryExp(4, 1000);
	StExt_AddMasteryExp(5, 1000);
	StExt_AddMasteryExp(6, 1000);
	StExt_AddMasteryExp(7, 1000);
	StExt_AddMasteryExp(8, 1000);
	StExt_AddMasteryExp(9, 1000);
	StExt_AddMasteryExp(10, 1000);
	StExt_AddMasteryExp(11, 1000);
	StExt_AddMasteryExp(12, 1000);
	StExt_AddMasteryExp(13, 1000);
	StExt_AddMasteryExp(14, 1000);
	StExt_AddMasteryExp(15, 1000);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Exp() 
{
	b_giveplayerxp(1000);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_CorruptionLp() 
{
	StExt_CorruptionPath_SkillPoints += 10;
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_MasteriesLp() 
{
	StExt_ChangeMasteryPerkPoints(0, 10);
	StExt_ChangeMasteryPerkPoints(1, 10);
	StExt_ChangeMasteryPerkPoints(2, 10);
	StExt_ChangeMasteryPerkPoints(3, 10);
	StExt_ChangeMasteryPerkPoints(4, 10);
	StExt_ChangeMasteryPerkPoints(5, 10);
	StExt_ChangeMasteryPerkPoints(6, 10);
	StExt_ChangeMasteryPerkPoints(7, 10);
	StExt_ChangeMasteryPerkPoints(8, 10);
	StExt_ChangeMasteryPerkPoints(9, 10);
	StExt_ChangeMasteryPerkPoints(10, 10);
	StExt_ChangeMasteryPerkPoints(11, 10);
	StExt_ChangeMasteryPerkPoints(12, 10);
	StExt_ChangeMasteryPerkPoints(13, 10);
	StExt_ChangeMasteryPerkPoints(14, 10);
	StExt_ChangeMasteryPerkPoints(15, 10);
	StExt_CorruptedPerk_DamagePoints += 100;
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Lp() 
{
	hero.lp += 10;
	Dia_StExt_ModMenu_Debug_info();
};


func void Dia_StExt_ModMenu_Configs_Debug_AddExtraDamage() 
{
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraMeleeDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraRangeDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraSpellDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraDamagePerc] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraMeleeDamPerc] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraRangeDamPerc] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraSpellDamPerc] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraWeaponSkillDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraWeaponSkillDamPerc] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraBluntDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraEdgeDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraFireDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraFlyDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraMagicDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraPointDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_ExtraPoisonDam] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_EdgeDotDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_BluntDotDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_FireDotDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_FlyDotDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_MagicDotDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_PointDotDamage] = 100;
	StExt_PcStats_Perm[StExt_PcStats_Index_PoisDotDamage] = 100;
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_MakeReflective() 
{
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsBlunt, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsEdge, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsPoint, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsFire, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsFly, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsMagic, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsPoision, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsBluntPerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsEdgePerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsPointPerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsFirePerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsFlyPerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsMagicPerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsPoisionPerc, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsBluntDot, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsEdgeDot, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsPointDot, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsFireDot, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsFlyDot, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsMagicDot, 100, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReflectDamageAsPoisionDot, 100, StExt_PcStat_Source_Perm);
	
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Superman() 
{
	hero.attribute[1] = 100000;
    hero.attribute[0] = hero.attribute[1];
    hero.attribute[3] = 10000;
    hero.attribute[2] = hero.attribute[3];
	hero.attribute[4] = 1000;
    hero.attribute[5] = 1000;
	atr_intellect = 25000;
	atr_stamina_max = 250;
	atr_stamina = 2500;
    npc_settalentskill(self, npc_talent_intellect, atr_intellect);
	npc_settalentskill(hero, npc_talent_mage, 6);	
	b_raisefighttalent(hero, npc_talent_1h, 200);
	b_raisefighttalent(hero, npc_talent_2h, 200);
	b_raisefighttalent(hero, npc_talent_bow, 200);
	b_raisefighttalent(hero, npc_talent_crossbow, 200);
	countlearnspell = 1000;
	
	StExt_PcStats_Perm[StExt_PcStats_Index_EsRegPerc] = 10;
	StExt_Npc_ChangeMaxEs(hero, 13666);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Invisible() 
{
	Stext_Cheat_Invisible = StExt_IfInt(Stext_Cheat_Invisible, false, true);	
	StExt_ChangeCheat_Notify("Invisibility", Stext_Cheat_Invisible);
	Dia_StExt_ModMenu_Debug_info();
};

func void Dia_StExt_ModMenu_Configs_Debug_Immortal() 
{
	Stext_Cheat_Immortal = StExt_IfInt(Stext_Cheat_Immortal, false, true);
	StExt_ChangeCheat_Notify("Immortality", Stext_Cheat_Immortal);
	Dia_StExt_ModMenu_Debug_info();
};

func void StExt_Debug_Teleport() 
{
    info_clearchoices(Dia_StExt_ModMenu_Debug);
    if(currentlevel == newworld_zen) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_darkcave", pc_teleport_on_darkcave);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_druid", pc_teleport_on_druid);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_mansion", pc_teleport_on_mansion);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_base", pc_teleport_on_base);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_river", pc_teleport_on_river);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_fingers", pc_teleport_on_fingers);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_vinocave", pc_teleport_on_vinocave);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_sagitta", pc_teleport_on_sagitta);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_suncircle", pc_teleport_on_suncircle);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_blacktroll", pc_teleport_on_blacktroll);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_adwruins", pc_teleport_on_adwruins);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_psi", pc_teleport_on_psi);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_hunt", pc_teleport_on_hunt);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_taverne", pc_teleport_on_taverne);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_passow", pc_teleport_on_passow);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_kloster", pc_teleport_on_kloster);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_bigfarm", pc_teleport_on_bigfarm);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_town", pc_teleport_on_town);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_port", pc_teleport_on_port);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_gates", pc_teleport_on_gates);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_upper", pc_teleport_on_upper);
    }
    else if(currentlevel == addonworld_zen) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_adw_oldcanyon", pc_teleport_on_adw_oldcanyon);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_adw_library", pc_teleport_on_adw_library);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_adw", pc_teleport_on_adw);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_piratcamp", pc_teleport_on_piratcamp);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_watercamp", pc_teleport_on_watercamp);
    }
    else if(currentlevel == oldworld_zen) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_diego", pc_teleport_on_diego);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_krushak", pc_teleport_on_krushak);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_sklep", pc_teleport_on_sklep);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_oldpsi", pc_teleport_on_oldpsi);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_oldfort", pc_teleport_on_oldfort);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_darktower", pc_teleport_on_darktower);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_freemine", pc_teleport_on_freemine);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_ice", pc_teleport_on_ice);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_netbek", pc_teleport_on_netbek);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_passnw", pc_teleport_on_passnw);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_castle", pc_teleport_on_castle);
    }
    else if(currentlevel == adanosvalley_zen) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_plato_raven", pc_teleport_on_plato_raven);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_complex", pc_teleport_on_complex);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_lifecircle", pc_teleport_on_lifecircle);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_passav", pc_teleport_on_passav);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_pyramide", pc_teleport_on_pyramide);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_tearhram", pc_teleport_on_tearhram);
    }
    else if((currentlevel == westcoast_zen) && rx_isdruidupdate) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_wc_swamp", pc_teleport_on_wc_swamp);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_wc_green", pc_teleport_on_wc_green);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_wc_island", pc_teleport_on_wc_island);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_wc_pirates", pc_teleport_on_wc_pirates);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_wc_druid", pc_teleport_on_wc_druid);
    }
    else if((currentlevel == arenaloc_zen) && rx_isarenaupdate)
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_al_farm", pc_teleport_on_al_farm);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_al_arena", pc_teleport_on_al_arena);
    }
    else if(currentlevel == dawncoast_zen) { info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_dc_hermit", pc_teleport_on_dc_hermit); }
    else if(currentlevel == orcmountain_zen) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orcmountain", pc_teleport_on_orcmountain);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orcmountain_enter", pc_teleport_on_orcmountain_enter);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orcmountain_lake", pc_teleport_on_orcmountain_lake);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orcmountain_orcs", pc_teleport_on_orcmountain_orcs);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orcmountain_yanus", pc_teleport_on_orcmountain_yanus);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orcmountain_mage", pc_teleport_on_orcmountain_mage);
    }
    else if(currentlevel == shvalley_zen) 
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_shvalley_dale", pc_teleport_on_shvalley_dale);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_shvalley_cave", pc_teleport_on_shvalley_cave);
    }
    else if(currentlevel == paladinfort_zen)
	{
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_fort_wood", pc_teleport_on_fort_wood);
		info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_fort_fort", pc_teleport_on_fort_fort);
    }
    else if(currentlevel == ashtartemple_zen) { info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_as_dragon", pc_teleport_on_as_dragon); }
    else if(currentlevel == orccity_zen) 
	{
        info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orccity_mine", pc_teleport_on_orccity_mine);
        info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orccity_lider", pc_teleport_on_orccity_lider);
        info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orccity_shaman", pc_teleport_on_orccity_shaman);
        info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orccity_enter", pc_teleport_on_orccity_enter);
        info_addchoice(Dia_StExt_ModMenu_Debug, "pc_teleport_on_orccity_center", pc_teleport_on_orccity_center);
    };
    info_addchoice(Dia_StExt_ModMenu_Debug, dialog_back, Dia_StExt_ModMenu_Debug_info);
};

func void StExt_Debug_CompileItems() 
{
/*
	createinvitems(hero, itpo_stext_01_9, 1);
	createinvitems(hero, itpo_stext_01_10, 1);
	createinvitems(hero, itpo_stext_01_11, 1);
	createinvitems(hero, itpo_stext_01_12, 1);
	createinvitems(hero, itpo_stext_01_13, 1);
	createinvitems(hero, itpo_stext_01_14, 1);
	createinvitems(hero, itpo_stext_01_15, 1);
	createinvitems(hero, itpo_stext_01_16, 1);
	createinvitems(hero, itpo_stext_01_17, 1);
	createinvitems(hero, itpo_stext_01_18, 1);
	createinvitems(hero, itpo_stext_01_19, 1);
	createinvitems(hero, itpo_stext_01_20, 1);
	createinvitems(hero, itpo_stext_01_21, 1);
	createinvitems(hero, itpo_stext_01_22, 1);
	createinvitems(hero, itpo_stext_01_23, 1);
	createinvitems(hero, itpo_stext_01_24, 1);
	createinvitems(hero, itpo_stext_02_9, 1);
	createinvitems(hero, itpo_stext_02_10, 1);
	createinvitems(hero, itpo_stext_02_11, 1);
	createinvitems(hero, itpo_stext_02_12, 1);
	createinvitems(hero, itpo_stext_02_13, 1);
	createinvitems(hero, itpo_stext_02_14, 1);
	createinvitems(hero, itpo_stext_02_15, 1);
	createinvitems(hero, itpo_stext_02_16, 1);
	createinvitems(hero, itpo_stext_02_17, 1);
	createinvitems(hero, itpo_stext_02_18, 1);
	createinvitems(hero, itpo_stext_02_19, 1);
	createinvitems(hero, itpo_stext_02_20, 1);
	createinvitems(hero, itpo_stext_02_21, 1);
	createinvitems(hero, itpo_stext_02_22, 1);
	createinvitems(hero, itpo_stext_02_23, 1);
	createinvitems(hero, itpo_stext_02_24, 1);
	createinvitems(hero, itpo_stext_03_9, 1);
	createinvitems(hero, itpo_stext_03_10, 1);
	createinvitems(hero, itpo_stext_03_11, 1);
	createinvitems(hero, itpo_stext_03_12, 1);
	createinvitems(hero, itpo_stext_03_13, 1);
	createinvitems(hero, itpo_stext_03_14, 1);
	createinvitems(hero, itpo_stext_03_15, 1);
	createinvitems(hero, itpo_stext_03_16, 1);
	createinvitems(hero, itpo_stext_03_17, 1);
	createinvitems(hero, itpo_stext_03_18, 1);
	createinvitems(hero, itpo_stext_03_19, 1);
	createinvitems(hero, itpo_stext_03_20, 1);
	createinvitems(hero, itpo_stext_03_21, 1);
	createinvitems(hero, itpo_stext_03_22, 1);
	createinvitems(hero, itpo_stext_03_23, 1);
	createinvitems(hero, itpo_stext_03_24, 1);
	createinvitems(hero, itpo_stext_04_9, 1);
	createinvitems(hero, itpo_stext_04_10, 1);
	createinvitems(hero, itpo_stext_04_11, 1);
	createinvitems(hero, itpo_stext_04_12, 1);
	createinvitems(hero, itpo_stext_04_13, 1);
	createinvitems(hero, itpo_stext_04_14, 1);
	createinvitems(hero, itpo_stext_04_15, 1);
	createinvitems(hero, itpo_stext_04_16, 1);
	createinvitems(hero, itpo_stext_04_17, 1);
	createinvitems(hero, itpo_stext_04_18, 1);
	createinvitems(hero, itpo_stext_04_19, 1);
	createinvitems(hero, itpo_stext_04_20, 1);
	createinvitems(hero, itpo_stext_04_21, 1);
	createinvitems(hero, itpo_stext_04_22, 1);
	createinvitems(hero, itpo_stext_04_23, 1);
	createinvitems(hero, itpo_stext_04_24, 1);
	createinvitems(hero, itmw_stext_halleberde_bronze, 1);
	createinvitems(hero, itmw_stext_spear_bronze, 1);
	createinvitems(hero, itmw_stext_bronze_axe, 1);
	createinvitems(hero, itmw_stext_bronze_waraxe, 1);
	createinvitems(hero, itmw_stext_bronze_warhammer, 1);
	createinvitems(hero, itmw_stext_bronze_mace, 1);
	createinvitems(hero, itmw_stext_bronze_shortsword, 1);
	createinvitems(hero, itmw_stext_bronze_broadsword, 1);
	createinvitems(hero, itmw_stext_bronze_longsword, 1);
	createinvitems(hero, itmw_stext_axe1, 1);
	createinvitems(hero, itmw_stext_axe2, 1);
	createinvitems(hero, itmw_stext_1h_bastard_meryl, 1);
	createinvitems(hero, itmw_stext_1h_bastard_sword, 1);
	createinvitems(hero, itmw_stext_1h_cutlass, 1);
	createinvitems(hero, itmw_stext_1h_bastard_sword1, 1);
	createinvitems(hero, itmw_stext_1h_bastard_sword2, 1);
	createinvitems(hero, itmw_stext_1h_sword_heavy, 1);
	createinvitems(hero, itmw_stext_1h_sword_long, 1);
	createinvitems(hero, itmw_stext_1h_warsickle, 1);
	createinvitems(hero, itmw_stext_2h_axe, 1);
	createinvitems(hero, itmw_stext_spear_1, 1);
	createinvitems(hero, itmw_stext_spear_2, 1);
	createinvitems(hero, itmw_stext_2h_scimitar, 1);
	createinvitems(hero, itmw_stext_spear_3, 1);
	createinvitems(hero, itmw_stext_2h_sword, 1);
	createinvitems(hero, itmw_stext_axe3, 1);
	createinvitems(hero, itmw_stext_axe4, 1);
	createinvitems(hero, itmw_stext_1h_crawlerschreck, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Bastard_Smith_01, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Bastard_Smith_02, 1);
	createinvitems(hero, itmw_stext_1h_Sword_Broad_Rep_02, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Broad_Smith_01, 1);
	createinvitems(hero, itmw_stext_1h_Sword_Broad_Smith_02, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Long_Mission, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Long_Smith_01, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Long_Smith_02, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Rep_01, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Rep_02, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Smith_01, 1);
	createinvitems(hero, itmw_stext_1H_Sword_Smith_02, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Heavy_Smith_01, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Heavy_Smith_02, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Light_Smith_01, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Light_Smith_02, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Smith_02, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Smith_01, 1);
	createinvitems(hero, itmw_stext_rapier, 1);
	createinvitems(hero, itmw_stext_2H_Glaubensbringer, 1);
	createinvitems(hero, itar_StExt_greathelm, 1);
	createinvitems(hero, itar_StExt_ancienthelm, 1);
	createinvitems(hero, itar_stext_hat_beliar, 1);
	createinvitems(hero, itar_stext_hat_mage_grey, 1);
	createinvitems(hero, itar_stext_kapalin_1, 1);
	createinvitems(hero, itar_stext_kapalin_2, 1);
	createinvitems(hero, itar_stext_kapalin_3, 1);
	createinvitems(hero, itar_stext_kapalin_4, 1);
	createinvitems(hero, itmw_stext_iron_axe, 1);
	createinvitems(hero, itmw_stext_iron_broadsword, 1);
	createinvitems(hero, itmw_stext_iron_claymore, 1);
	createinvitems(hero, itmw_stext_iron_club, 1);
	createinvitems(hero, itmw_stext_iron_dagger, 1);
	createinvitems(hero, itmw_stext_iron_heavyclaymore, 1);
	createinvitems(hero, itmw_stext_iron_longsword, 1);
	createinvitems(hero, itmw_stext_iron_mace, 1);
	createinvitems(hero, itmw_stext_iron_mastersword, 1);
	createinvitems(hero, itmw_stext_iron_shortsword, 1);
	createinvitems(hero, itmw_stext_iron_waraxe, 1);
	createinvitems(hero, itmw_stext_iron_warhammer, 1);
	createinvitems(hero, itmw_stext_2h_SleeperEye, 1);
	createinvitems(hero, itmw_stext_2H_Sword_Blaise, 1);
	createinvitems(hero, itmw_stext_new_stl_broadsword, 1);
	createinvitems(hero, itmw_stext_new_stl_claymore, 1);
	createinvitems(hero, itmw_stext_new_stl_dagger, 1);
	createinvitems(hero, itmw_stext_new_stl_greatsword, 1);
	createinvitems(hero, itmw_stext_new_stl_handaxe, 1);
	createinvitems(hero, itmw_stext_new_stl_mastersword, 1);
	createinvitems(hero, itmw_stext_new_stl_waraxe, 1);
	createinvitems(hero, itmw_stext_new_stl_wingsword, 1);
	createinvitems(hero, itmw_stext_Novizenhueter, 1);
	createinvitems(hero, itar_stext_shield_NTARCZA33, 1);
	createinvitems(hero, itmw_stext_palasz, 1);
	createinvitems(hero, itmw_stext_palasz2, 1);
	createinvitems(hero, itmw_stext_PALKA2, 1);
	createinvitems(hero, itmw_stext_Saber_01, 1);
	createinvitems(hero, itmw_stext_Saber_02, 1);
	createinvitems(hero, itmw_stext_Saber_03, 1);
	createinvitems(hero, itmw_stext_Saber_04_01, 1);
	createinvitems(hero, itmw_stext_Saber_04_02_01, 1);
	createinvitems(hero, itmw_stext_Saber_04_02_02, 1);
	createinvitems(hero, itmw_stext_Saber_05, 1);
	createinvitems(hero, itar_stext_collar, 1);
	createinvitems(hero, itmw_stext_steel_axe, 1);
	createinvitems(hero, itmw_stext_steel_broadsword, 1);
	createinvitems(hero, itmw_stext_steel_claymore, 1);
	createinvitems(hero, itmw_stext_steel_club, 1);
	createinvitems(hero, itmw_stext_steel_dagger, 1);
	createinvitems(hero, itmw_stext_steel_heavyclaymore, 1);
	createinvitems(hero, itmw_stext_steel_longsword, 1);
	createinvitems(hero, itmw_stext_steel_mace, 1);
	createinvitems(hero, itmw_stext_steel_mastersword, 1);
	createinvitems(hero, itmw_stext_steel_shortsword, 1);
	createinvitems(hero, itmw_stext_steel_waraxe, 1);
	createinvitems(hero, itmw_stext_steel_warhammer, 1);
	
	createinvitems(hero, ItAr_StExt_Boots_Low_00, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_01, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_02, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_03, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_04, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_05, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_06, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_07, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_08, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_09, 1);
	createinvitems(hero, ItAr_StExt_Boots_Low_10, 1);

	createinvitems(hero, ItAr_StExt_Boots_Med_00, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_01, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_02, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_03, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_04, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_05, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_06, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_07, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_08, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_09, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_10, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_11, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_12, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_13, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_14, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_15, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_16, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_17, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_18, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_19, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_20, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_21, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_22, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_23, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_24, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_25, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_26, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_27, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_28, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_29, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_30, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_31, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_32, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_33, 1);
	createinvitems(hero, ItAr_StExt_Boots_Med_34, 1);

	createinvitems(hero, ItAr_StExt_Boots_Top_00, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_01, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_02, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_03, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_04, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_05, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_06, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_07, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_08, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_09, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_10, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_11, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_12, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_13, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_14, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_15, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_16, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_17, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_18, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_19, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_20, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_21, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_22, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_23, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_24, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_25, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_26, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_27, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_28, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_29, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_30, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_31, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_32, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_33, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_34, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_35, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_36, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_37, 1);
	createinvitems(hero, ItAr_StExt_Boots_Top_38, 1);

	createinvitems(hero, ItAr_StExt_Gloves_Low_00, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_01, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_02, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_03, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_04, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_05, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_06, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_07, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_08, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_09, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_10, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_11, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_12, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_13, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_14, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_15, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_16, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_17, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_18, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Low_19, 1);

	createinvitems(hero, ItAr_StExt_Gloves_Med_00, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_01, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_02, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_03, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_04, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_05, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_06, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_07, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_08, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_09, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_10, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_11, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_12, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_13, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_14, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_15, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_16, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_17, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_18, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_19, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_20, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_21, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_22, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_23, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_24, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_25, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_26, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_27, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_28, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_29, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_30, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_31, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_32, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_33, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_34, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_35, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_36, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_37, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_38, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_39, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_40, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_41, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_42, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_43, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_44, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_45, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_46, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_47, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_48, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Med_49, 1);

	createinvitems(hero, ItAr_StExt_Gloves_Top_00, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_01, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_02, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_03, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_04, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_05, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_06, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_07, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_08, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_09, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_10, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_11, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_12, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_13, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_14, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_15, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_16, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_17, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_18, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_19, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_20, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_21, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_22, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_23, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_24, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_25, 1);
	createinvitems(hero, ItAr_StExt_Gloves_Top_26, 1);

	createinvitems(hero, ItAr_StExt_Pants_Low_00, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_01, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_02, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_03, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_04, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_05, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_06, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_07, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_08, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_09, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_10, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_11, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_12, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_13, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_14, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_15, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_16, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_17, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_18, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_19, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_20, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_21, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_22, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_23, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_24, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_25, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_26, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_27, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_28, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_29, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_30, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_31, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_32, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_33, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_34, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_35, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_36, 1);
	createinvitems(hero, ItAr_StExt_Pants_Low_37, 1);

	createinvitems(hero, ItAr_StExt_Pants_Med_00, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_01, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_02, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_03, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_04, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_05, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_06, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_07, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_08, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_09, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_10, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_11, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_12, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_13, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_14, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_15, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_16, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_17, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_18, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_19, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_20, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_21, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_22, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_23, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_24, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_25, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_26, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_27, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_28, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_29, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_30, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_31, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_32, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_33, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_34, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_35, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_36, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_37, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_38, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_39, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_40, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_41, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_42, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_43, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_44, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_45, 1);
	createinvitems(hero, ItAr_StExt_Pants_Med_46, 1);

	createinvitems(hero, ItAr_StExt_Pants_Top_00, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_01, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_02, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_03, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_04, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_05, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_06, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_07, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_08, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_09, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_10, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_11, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_12, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_13, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_14, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_15, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_16, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_17, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_18, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_19, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_20, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_21, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_22, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_23, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_24, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_25, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_26, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_27, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_28, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_29, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_30, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_31, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_32, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_33, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_34, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_35, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_36, 1);
	createinvitems(hero, ItAr_StExt_Pants_Top_37, 1);

	createinvitems(hero, ItAr_StExt_Torso_Low_00, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_01, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_02, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_03, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_04, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_05, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_06, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_07, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_08, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_09, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_10, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_11, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_12, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_13, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_14, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_15, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_16, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_17, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_18, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_19, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_20, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_21, 1);
	createinvitems(hero, ItAr_StExt_Torso_Low_22, 1);

	createinvitems(hero, ItAr_StExt_Torso_Med_00, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_01, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_02, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_03, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_04, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_05, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_06, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_07, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_08, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_09, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_10, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_11, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_12, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_13, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_14, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_15, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_16, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_17, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_18, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_19, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_20, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_21, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_22, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_23, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_24, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_25, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_26, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_27, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_28, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_29, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_30, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_31, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_32, 1);
	createinvitems(hero, ItAr_StExt_Torso_Med_33, 1);

	createinvitems(hero, ItAr_StExt_Torso_Top_00, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_01, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_02, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_03, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_04, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_05, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_06, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_07, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_08, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_09, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_10, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_11, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_12, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_13, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_14, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_15, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_16, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_17, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_18, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_19, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_20, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_21, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_22, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_23, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_24, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_25, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_26, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_27, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_28, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_29, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_30, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_31, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_32, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_33, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_34, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_35, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_36, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_37, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_38, 1);
	createinvitems(hero, ItAr_StExt_Torso_Top_39, 1);
	
	createinvitems(hero, itse_erzfisch, 10);
	createinvitems(hero, itse_goldfisch, 10);
	createinvitems(hero, itse_ringfisch, 10);
	createinvitems(hero, itse_stext_poitionfish, 10);
	createinvitems(hero, itse_stext_magicfish, 10);
	createinvitems(hero, itse_stext_miscfish, 10);	

	createinvitems(hero, itrw_stext_bow_l_01, 1);
	createinvitems(hero, itrw_stext_bow_l_02, 1);
	createinvitems(hero, itrw_stext_bow_l_03, 1);
	createinvitems(hero, itrw_stext_bow_l_04, 1);
	
	createinvitems(hero, itrw_stext_bow_m_01, 1);
	createinvitems(hero, itrw_stext_bow_m_02, 1);
	createinvitems(hero, itrw_stext_bow_m_03, 1);
	createinvitems(hero, itrw_stext_bow_m_04, 1);
	createinvitems(hero, itrw_stext_bow_m_05, 1);
	createinvitems(hero, itrw_stext_bow_m_06, 1);
	createinvitems(hero, itrw_stext_bow_m_07, 1);
	createinvitems(hero, itrw_stext_bow_m_08, 1);
	
	createinvitems(hero, itrw_stext_bow_h_01, 1);
	createinvitems(hero, itrw_stext_bow_h_02, 1);
	createinvitems(hero, itrw_stext_bow_h_03, 1);
	createinvitems(hero, itrw_stext_bow_h_04, 1);
	
	createinvitems(hero, itar_stext_hat_mage_01, 1);
	createinvitems(hero, itar_stext_hat_mage_02, 1);
	createinvitems(hero, itar_stext_hat_mage_03, 1);
	createinvitems(hero, itar_stext_hat_mage_04, 1);
	createinvitems(hero, itar_stext_hat_mage_05, 1);
	createinvitems(hero, itar_stext_hat_mage_06, 1);
	createinvitems(hero, itar_stext_hat_mage_07, 1);
	createinvitems(hero, itar_stext_hat_mage_08, 1);
	createinvitems(hero, itar_stext_hat_mage_09, 1);
	createinvitems(hero, itar_StExt_hut, 1);
	
	createinvitems(hero, itau_stext_ReflectDamageAsBlunt, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsEdge, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsPoint, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsFire, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsFly, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsPoision, 1);
	createinvitems(hero, itau_stext_ReflectDamageAsMagic, 1);
*/
/*
	createinvitems(hero, itmw_stext_effects_test_1, 1);
	createinvitems(hero, itmw_stext_effects_test_2, 1);
	createinvitems(hero, itmw_stext_effects_test_3, 1);
	createinvitems(hero, itmw_stext_effects_test_4, 1);
	createinvitems(hero, itmw_stext_effects_test_5, 1);
	createinvitems(hero, itmw_stext_effects_test_6, 1);
	createinvitems(hero, itmw_stext_effects_test_7, 1);
	createinvitems(hero, itmw_stext_effects_test_8, 1);
	createinvitems(hero, itmw_stext_effects_test_9, 1);
	createinvitems(hero, itmw_stext_effects_test_10, 1);
	createinvitems(hero, itmw_stext_effects_test_11, 1);
	createinvitems(hero, itmw_stext_effects_test_12, 1);
	createinvitems(hero, itmw_stext_effects_test_13, 1);
	createinvitems(hero, itmw_stext_effects_test_14, 1);
	createinvitems(hero, itmw_stext_effects_test_15, 1);
	createinvitems(hero, itmw_stext_effects_test_16, 1);
	createinvitems(hero, itmw_stext_effects_test_17, 1);
	createinvitems(hero, itmw_stext_effects_test_18, 1);
	createinvitems(hero, itmw_stext_effects_test_19, 1);
	createinvitems(hero, itmw_stext_effects_test_20, 1);
	createinvitems(hero, itmw_stext_effects_test_21, 1);
	createinvitems(hero, itmw_stext_effects_test_22, 1);
	createinvitems(hero, itmw_stext_effects_test_23, 1);
	createinvitems(hero, itmw_stext_effects_test_24, 1);
	createinvitems(hero, itmw_stext_effects_test_25, 1);
	createinvitems(hero, itmw_stext_effects_test_26, 1);
	createinvitems(hero, itmw_stext_effects_test_27, 1);
*/
	Dia_StExt_ModMenu_Debug_info();
};