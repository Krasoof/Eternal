// NPC Extra
instance bdt_1014_bandit_l(c_npc) 
{
	bdt_1014_bandit_l_old();
    createinvitems(bdt_1014_bandit_l, itam_stext_luckycharm, 1);
};

//========================================
// 				 Bandits
//========================================

instance stext_bdt_random(npc_default) 
{
    name = "BDT";
    guild = gil_bdt;
    id = 99665;
    voice = 1;
    flags = 0;
    npctype = npctype_ambient;
	fight_tactic = fai_human_coward;
	b_setattributestochapter(stext_bdt_random, 2);
	b_givenpctalents(stext_bdt_random);
	b_setfightskills(stext_bdt_random, 30);	
	b_createambientinv(stext_bdt_random);
	b_setnpcvisual(stext_bdt_random, male, "Hum_Head_Fatbald", face_n_mud, bodytex_n, no_armor);
	start_aistate = zs_bandit;
	
	// make callback or something to restore appearance...
	// but first - check if such measures required
};

//========================================
// 				Shiva boses
//========================================

// Andriel
instance stext_andriel(npc_default) 
{
	name = stext_str_andriel_name;
    guild = gil_bdt;
    voice = 6;
    flags = 0;
    id = 99667;
    npctype = npctype_main;
	aivar[94] = npc_legend;
	aivar[17] = female;	
    aivar[57] = true;
    aivar[25] = true;
    b_setattributestochapter(stext_andriel, 5);
	level = 50;
    attribute[4] = 150;
    attribute[5] = 250;
    attribute[2] = 1000;
    attribute[3] = 1000;
    attribute = 7500;
    attribute[1] = 7500;
    protection[1] = 150;
    protection[2] = 150;
    protection[6] = 150;
    protection[3] = 200;
    protection[4] = 200;
    protection[5] = 200;
	b_givenpctalents(stext_andriel);
    b_setfightskillssimple(stext_andriel, 100);
	updatespeed(self, 1.1);	
    fight_tactic = fai_human_master;
    mdl_setvisual(stext_andriel, "SRN_GLM.MDS");
    mdl_setvisualbody(stext_andriel, "SRNGLM_BODY_NAKED0", -1, -1, "Demoness_head", -1, 0, armr_g1_v3);
	mdl_setmodelfatness(stext_andriel, 0.1);
    mdl_setmodelscale(stext_andriel, 1.0, 1.0, 1.1);
    equipitem(stext_andriel, itmw_stext_andriel_dagger);
    start_aistate = zs_bandit;	
	bodystateinterruptableoverride = true;
	rx_setnpcvar(stext_andriel, aivrx_npc_not_check_weapon_on_refresh, true);
    rx_setnpcvar(stext_andriel, aivrx_npc_lp, 1);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Acid);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassivePoisioner);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassivePoisionDotDamage);
	StExt_Npc_SetExtraFlag(self, StExt_NpcFlag_OverrideConfigInhibitions, true);
};
func void ai_ondead_stext_andriel() 
{
	StExt_PrintDebugStack("ai_ondead_stext_andriel()");
    stext_andriel_isdead = true;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_2);
};

// Duriel
instance stext_duriel(mst_default_minecrawlerwarrior) 
{
    name = stext_str_duriel_name;
    level = 100;
    aivar[90] = true;
    aivar[94] = npc_legend;
	aivar[27] = followtime_foreever;
    attribute[4] = 400;
    attribute[5] = 250;
    attribute[1] = 15000;
    attribute = 15000;
    attribute[3] = 1000;
    attribute[2] = 1000;
    protection[1] = 250;
    protection[2] = 250;
    protection[6] = 400;
    protection[3] = 125;
    protection[4] = 300;
    protection[5] = 150;
	updatespeed(self, 1.15);
    b_setvisuals_minecrawlerwarrior_desert();
    npc_settofistmode(stext_duriel);
    mdl_setmodelscale(stext_duriel, 1.5, 1.5, 1.5);
    createinvitems(stext_duriel, itat_crawlerplate, 15);   
    rx_setnpcvar(stext_duriel, aivrx_npc_lp, 2);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_SummonCrawler);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_SummonBloodfly);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassivePoisioner);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassivePoisionDotDamage);
	StExt_Npc_SetExtraFlag(self, StExt_NpcFlag_OverrideConfigInhibitions, true);
};
func void ai_ondead_stext_duriel() 
{
	StExt_PrintDebugStack("ai_ondead_stext_duriel()");
    stext_duriel_isdead = true;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_4);
};

// Mephisto
instance stext_mephisto(mst_skeleton_lord_mage) 
{
    name = stext_str_mephisto_name;
    level = 200;
    aivar[90] = true;
    aivar[94] = npc_legend;
	aivar[27] = followtime_foreever;
    attribute[1] = 20000;
    attribute = 20000;
    protection[1] = 50;
    protection[2] = 300;
    protection[6] = 400;
    protection[3] = 200;
    protection[4] = 50;
    protection[5] = 200;
	updatespeed(self, 1.2);
	effect = "spellfx_swampdragon";
	npc_settalentskill(self, npc_talent_mage, 6);
    equipitem(stext_mephisto, itmw_shadowpriest_elite);
    bodystateinterruptableoverride = true;
    b_setvisuals_skeleton_mage();
	mdl_setmodelscale(stext_mephisto, 1.15, 1.15, 1.15);
    createinvitems(stext_mephisto, itmi_oldcoin, hlp_random(100) + 100);
    rx_setnpcvar(stext_mephisto, aivrx_npc_lp, 3);
	StExt_Npc_ChangeMaxEs(self, 10000);
	StExt_Npc_SetEs(self, 10000);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_SummonArmyOfDarkness);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Deathball);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Bloodrain);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveEsRegen);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveEsLich);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveCurser);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveBloodRainOnDeath);
	StExt_Npc_SetExtraFlag(self, StExt_NpcFlag_OverrideConfigInhibitions, true);
};
func void ai_ondead_stext_mephisto() 
{
	StExt_PrintDebugStack("ai_ondead_stext_mephisto()");
    stext_mephisto_isdead = true;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_6);
};

// Diablo
instance stext_diablo(mst_default_demonlord) 
{
	name = stext_str_diablo_name;
    level = 300;
    aivar[90] = true;
    aivar[94] = npc_legend;
	aivar[27] = followtime_foreever;
	attribute[4] = 1250;
    attribute[5] = 750;
    attribute[1] = 30000;
    attribute = 30000;
    attribute[3] = 400;
    attribute[2] = 400;
    protection[1] = 300;
    protection[2] = 300;
    protection[6] = 350;
    protection[3] = 450;
    protection[4] = 450;
    protection[5] = 450;
	updatespeed(self, 1.25);
    bodystateinterruptableoverride = true;
    effect = "SPELLFX_REDFLAME_SMOKE_FULL";
    b_setvisuals_demonlord_elite_extra();
	mdl_setmodelscale(stext_diablo, 1.25, 1.25, 1.25);
    npc_settofistmode(stext_diablo);
    rx_setnpcvar(stext_diablo, aivrx_npc_lp, 4);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveHpRegen);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Firewave);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Firerain);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Firestorm);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveFireDamage);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveFireDotDamage);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_SummonDemon);
	StExt_Npc_SetExtraFlag(self, StExt_NpcFlag_OverrideConfigInhibitions, true);
};
func void ai_ondead_stext_diablo() 
{
	StExt_PrintDebugStack("ai_ondead_stext_diablo()");
    stext_diablo_isdead = true;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_8);
};

// Baal
instance stext_baal(mst_default_sleeper) 
{
	name = stext_str_baal_name;
    level = 500;
	guild = gil_demon;
    aivar[90] = true;
    aivar[94] = npc_legend;
	aivar[27] = followtime_foreever;
	attribute[4] = 1500;
    attribute[5] = 1250;
    attribute[1] = 50000;
    attribute = 50000;
    attribute[3] = 1500;
    attribute[2] = 1500;
    protection[1] = 500;
    protection[2] = 500;
    protection[6] = 450;
    protection[3] = 550;
    protection[4] = 550;
    protection[5] = 650;
	damagetype = dam_magic;
    damage[5] = 1000;
	updatespeed(self, 1.25);
    bodystateinterruptableoverride = true;
    effect = "SPELLFX_MAGIC_SMOKE";
    b_setvisuals_sleeper_old();
	mdl_setmodelscale(stext_baal, 1.15, 1.15, 1.15);
    equipitem(stext_baal, itmw_ds_monweapon_exelite);	
    rx_setnpcvar(stext_baal, aivrx_npc_lp, 5);
	StExt_Npc_ChangeMaxEs(self, 15000);
	StExt_Npc_SetEs(self, 15000);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Darkwave);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Darkspear);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Blink);
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveEsRegen);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveCurser);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_PassiveMagicDotDamage);	
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_SummonDemon);
	StExt_Npc_SetExtraFlag(self, StExt_NpcFlag_OverrideConfigInhibitions, true);
};
func void ai_ondead_stext_baal() 
{
	StExt_PrintDebugStack("ai_ondead_stext_baal()");
    stext_baal_isdead = true;
	b_logentry(StExt_topic_shivaletter, StExt_str_shivaletter_LogEntry_10);
};

instance aim(C_Npc) 
{
	aim_old();
    attribute[atr_hitpoints_max] = StExt_DummyHp;
    attribute[atr_hitpoints] = attribute[atr_hitpoints_max];
};

instance aim2(C_Npc) 
{
    aim2_old();
    attribute[atr_hitpoints_max] = StExt_DummyHp;
    attribute[atr_hitpoints] = attribute[atr_hitpoints_max];
};

instance aim_100(C_Npc) 
{
    aim_100_old();
    attribute[atr_hitpoints_max] = StExt_DummyHp;
    attribute[atr_hitpoints] = attribute[atr_hitpoints_max];
};

instance aim_300(C_Npc) 
{
    aim_300_old();
    attribute[atr_hitpoints_max] = StExt_DummyHp;
    attribute[atr_hitpoints] = attribute[atr_hitpoints_max];
};

instance aim_600(C_Npc) 
{
    aim_600_old();
    attribute[atr_hitpoints_max] = StExt_DummyHp;
    attribute[atr_hitpoints] = attribute[atr_hitpoints_max];
};


instance StExt_Small_Stonegolem(mst_default_stonegolem) 
{
    name = StExt_Str_Small_Stonegolem;
    level = 10;
    attribute[atr_strength] = 250;
    attribute[atr_dexterity] = 40;
    attribute[atr_hitpoints_max] = 850;
    attribute[atr_hitpoints] = 850;
    attribute[atr_mana_max] = 100;
    attribute[atr_mana] = 100;
    bodystateinterruptableoverride = true;
    protection[prot_blunt] = 1;
    protection[prot_edge] = 250;
    protection[prot_point] = 350;
    protection[prot_fire] = 35;
    protection[prot_fly] = 35;
    protection[prot_magic] = 10;
    b_setvisuals_stonegolem();
	mdl_setmodelscale(StExt_Small_Stonegolem, 0.6, 0.6, 0.6);
    npc_settofistmode(StExt_Small_Stonegolem);
};

instance StExt_Weak_Stonegolem(mst_default_stonegolem) 
{
    name = StExt_Str_Weak_Stonegolem;
    level = 20;
    attribute[atr_strength] = 350;
    attribute[atr_dexterity] = 80;
    attribute[atr_hitpoints_max] = 2000;
    attribute[atr_hitpoints] = 2000;
    attribute[atr_mana_max] = 100;
    attribute[atr_mana] = 100;
    bodystateinterruptableoverride = true;
    protection[prot_blunt] = 10;
    protection[prot_edge] = 350;
    protection[prot_point] = 500;
    protection[prot_fire] = 75;
    protection[prot_fly] = 75;
    protection[prot_magic] = 25;
    b_setvisuals_stonegolem();
	mdl_setmodelscale(StExt_Weak_Stonegolem, 0.8, 0.8, 0.8);
    npc_settofistmode(StExt_Weak_Stonegolem);
};

instance StExt_Small_Firegolem(mst_default_firegolem) 
{
    name = StExt_Str_Small_Firegolem;
    level = 10;
    bodystateinterruptableoverride = true;
    attribute[atr_strength] = 125;
    attribute[atr_dexterity] = 85;
    attribute[atr_hitpoints_max] = 750;
    attribute[atr_hitpoints] = 750;
    attribute[atr_mana_max] = 100;
    attribute[atr_mana] = 100;
    protection[prot_blunt] = 35;
    protection[prot_edge] = 250;
    protection[prot_point] = 350;
    protection[prot_fire] = 150;
    protection[prot_fly] = 25;
    protection[prot_magic] = 25;
	b_setvisuals_fire_elemental();
    mdl_setmodelscale(StExt_Small_Firegolem, 0.6, 0.6, 0.6);
    npc_settofistmode(StExt_Small_Firegolem);
};

instance StExt_Weak_Firegolem(mst_default_firegolem) 
{
    name = StExt_Str_Weak_Firegolem;
    level = 20;
    bodystateinterruptableoverride = true;
    attribute[atr_strength] = 250;
    attribute[atr_dexterity] = 120;
    attribute[atr_hitpoints_max] = 2500;
    attribute[atr_hitpoints] = 2500;
    attribute[atr_mana_max] = 100;
    attribute[atr_mana] = 100;
    protection[prot_blunt] = 75;
    protection[prot_edge] = 300;
    protection[prot_point] = 400;
    protection[prot_fire] = 200;
    protection[prot_fly] = 35;
    protection[prot_magic] = 35;
    b_setvisuals_firegolem();
	mdl_setmodelscale(StExt_Weak_Firegolem, 0.8, 0.8, 0.8);
    npc_settofistmode(StExt_Weak_Firegolem);
};

instance StExt_Small_Swampgolem(mst_default_addon_swampgolem)
{
    name = StExt_Str_Small_Swampgolem;
    level = 10;
    attribute[atr_strength] = 100;
    attribute[atr_dexterity] = 50;
    attribute[atr_hitpoints_max] = 750;
    attribute[atr_hitpoints] = 750;
    attribute[atr_mana_max] = 0;
    attribute[atr_mana] = 0;
    protection[prot_blunt] = 125;
    protection[prot_edge] = 35;
    protection[prot_point] = 150;
    protection[prot_fire] = 50;
    protection[prot_fly] = 75;
    protection[prot_magic] = 50;
    b_setvisuals_swampgolem();
    npc_settofistmode(StExt_Small_Swampgolem);
    mdl_setmodelscale(StExt_Small_Swampgolem, 0.7, 0.7, 0.7);
};

instance StExt_Small_Icegolem(mst_default_icegolem) 
{
    name = StExt_Str_Small_Icegolem;
    level = 10;
    bodystateinterruptableoverride = true;
    attribute[atr_strength] = 150;
    attribute[atr_dexterity] = 40;
    attribute[atr_hitpoints_max] = 750;
    attribute[atr_hitpoints] = 750;
    attribute[atr_mana_max] = 100;
    attribute[atr_mana] = 100;
    protection[prot_blunt] = 40;
    protection[prot_edge] = 80;
    protection[prot_point] = 100;
    protection[prot_fire] = 0;
    protection[prot_fly] = 15;
    protection[prot_magic] = 50;
    b_setvisuals_ice_elemental();
    mdl_setmodelscale(icegolem_dragon, 0.6, 0.6, 0.6);
    npc_settofistmode(StExt_Small_Icegolem);
};

instance StExt_Weak_Icegolem(mst_default_icegolem) 
{
    name = StExt_Str_Weak_Icegolem;
    level = 20;
    bodystateinterruptableoverride = true;
    attribute[atr_strength] = 200;
    attribute[atr_dexterity] = 75;
    attribute[atr_hitpoints_max] = 2500;
    attribute[atr_hitpoints] = 2500;
    attribute[atr_mana_max] = 100;
    attribute[atr_mana] = 100;
    protection[prot_blunt] = 60;
    protection[prot_edge] = 200;
    protection[prot_point] = 250;
    protection[prot_fire] = 0;
    protection[prot_fly] = 50;
    protection[prot_magic] = 150;    
	b_setvisuals_icegolem();
	mdl_setmodelscale(StExt_Weak_Icegolem, 0.8, 0.8, 0.8);
    npc_settofistmode(StExt_Weak_Icegolem);
};
