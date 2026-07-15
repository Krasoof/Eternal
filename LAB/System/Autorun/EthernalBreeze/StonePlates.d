func void pc_psionicquest_templatedialog_249_info() 
{
	pc_psionicquest_templatedialog_249_info_old();
	if(player_talent_foreignlanguage[2] == true) 
	{
		if(npc_hasitems(hero, itwr_manastoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_Mana, rx_learnancienttablet_mana2);
        };
		if(npc_hasitems(hero, itwr_manastoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_ManaMax, rx_learnancienttablet_mana3);
        };		
		if(npc_hasitems(hero, itwr_hitpointstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_Hp, rx_learnancienttablet_health2);
        };
		if(npc_hasitems(hero, itwr_hitpointstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_HpMax, rx_learnancienttablet_health3);
        };		
		if(npc_hasitems(hero, itwr_strstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_Str, rx_learnancienttablet_str2);
        };
		if(npc_hasitems(hero, itwr_strstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_StrMax, rx_learnancienttablet_str3);
        };		
        if(npc_hasitems(hero, itwr_dexstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_Agi, rx_learnancienttablet_dex2);
        };
		if(npc_hasitems(hero, itwr_dexstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_AgiMax, rx_learnancienttablet_dex3);
        };		
		if(npc_hasitems(hero, itwr_onehstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_1h, rx_learnancienttablet_1h2);
        };
		if(npc_hasitems(hero, itwr_onehstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_1hMax, rx_learnancienttablet_1h3);
        };
        if(npc_hasitems(hero, itwr_twohstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_2h, rx_learnancienttablet_2h2);
        };
		if(npc_hasitems(hero, itwr_twohstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_2hMax, rx_learnancienttablet_2h3);
        };		
        if(npc_hasitems(hero, itwr_bowstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_Bow, rx_learnancienttablet_bow2);
        };
		if(npc_hasitems(hero, itwr_bowstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_BowMax, rx_learnancienttablet_bow3);
        };		
        if(npc_hasitems(hero, itwr_crsbowstoneplate2_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_CrsBow, rx_learnancienttablet_cbow2);
        };
		if(npc_hasitems(hero, itwr_crsbowstoneplate3_addon) > 0) {
            info_addchoice(pc_psionicquest_templatedialog_249, StExt_StonePlateDia_CrsBowMax, rx_learnancienttablet_cbow3);
        };
    };
};


func void rx_learnancienttablet_health() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_hitpointstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_hitpointstoneplate1_addon, 1);
    };
    b_raiseattribute(hero, atr_hitpoints_max, rx_platehealthbonus);
    rx_healthbonusteach += rx_platehealthbonus;
    rx_usedplatehealth += 1;
    npc_changeattribute(hero, atr_hitpoints, rx_platehealthbonus);
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_health2() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_hitpointstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_hitpointstoneplate2_addon, 1);
    };
    b_raiseattribute(hero, atr_hitpoints_max, 15);
    rx_healthbonusteach += 15;
    rx_usedplatehealth += 1;
    npc_changeattribute(hero, atr_hitpoints, 15);
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_health3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_hitpointstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_hitpointstoneplate3_addon, 1);
    };
    b_raiseattribute(hero, atr_hitpoints_max, 25);
    rx_healthbonusteach += 25;
    rx_usedplatehealth += 1;
    npc_changeattribute(hero, atr_hitpoints, 25);
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_str() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_strstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_strstoneplate1_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_strength, 1);
    rx_usedplatestr += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_str2() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_strstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_strstoneplate2_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_strength, 1);
    rx_usedplatestr += 2;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_str3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_strstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_strstoneplate3_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_strength, 3);
    rx_usedplatestr += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_dex() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_dexstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_dexstoneplate1_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_dexterity, 1);
    rx_usedplatedex += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_dex2() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_dexstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_dexstoneplate2_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_dexterity, 2);
    rx_usedplatedex += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_dex3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_dexstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_dexstoneplate3_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_dexterity, 3);
    rx_usedplatedex += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_1h() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_onehstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_onehstoneplate1_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_1h, 1);
    rx_used_1h += 1;
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learn1h, "+");
    concattext = concatstrings(concattext, inttostring(1));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_1h2() 
{
    b_giveplayerxp(25);
	if(npc_hasitems(hero, itwr_onehstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_onehstoneplate2_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_1h, 2);
    rx_used_1h += 1;
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learn1h, "+");
    concattext = concatstrings(concattext, inttostring(2));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_1h3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_onehstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_onehstoneplate3_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_1h, 3);
    rx_used_1h += 1;
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learn1h, "+");
    concattext = concatstrings(concattext, inttostring(3));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_2h() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_twohstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_twohstoneplate1_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_2h, 1);
    rx_used_2h += 1;
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learn2h, "+");
    concattext = concatstrings(concattext, inttostring(1));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_2h2() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_twohstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_twohstoneplate2_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_2h, 2);
    rx_used_2h += 1;
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learn2h, "+");
    concattext = concatstrings(concattext, inttostring(2));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_2h3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_twohstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_twohstoneplate3_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_2h, 3);
    rx_used_2h += 1;
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learn2h, "+");
    concattext = concatstrings(concattext, inttostring(3));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_bow() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_bowstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_bowstoneplate1_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_bow, 1);
    snd_play("SFX_HealObsession");
    rx_used_bow += 1;
    concattext = concatstrings(print_learnbow, "+");
    concattext = concatstrings(concattext, inttostring(1));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_bow2() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_bowstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_bowstoneplate2_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_bow, 2);
    snd_play("SFX_HealObsession");
    rx_used_bow += 1;
    concattext = concatstrings(print_learnbow, "+");
    concattext = concatstrings(concattext, inttostring(2));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_bow3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_bowstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_bowstoneplate3_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_bow, 3);
    snd_play("SFX_HealObsession");
    rx_used_bow += 1;
    concattext = concatstrings(print_learnbow, "+");
    concattext = concatstrings(concattext, inttostring(3));
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_cbow() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_crsbowstoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_crsbowstoneplate1_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_crossbow, 1);
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learncrossbow, "+");
    concattext = concatstrings(concattext, inttostring(1));
    rx_used_cb += 1;
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_cbow2()
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_crsbowstoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_crsbowstoneplate2_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_crossbow, 2);
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learncrossbow, "+");
    concattext = concatstrings(concattext, inttostring(2));
    rx_used_cb += 1;
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_cbow3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_crsbowstoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_crsbowstoneplate3_addon, 1);
    };
    b_raisefighttalent_bonus(hero, npc_talent_crossbow, 3);
    snd_play("SFX_HealObsession");
    concattext = concatstrings(print_learncrossbow, "+");
    concattext = concatstrings(concattext, inttostring(3));
    rx_used_cb += 1;
    ai_printbonus(concattext);
    pc_psionicquest_templatedialog_249_info();
};


func void rx_learnancienttablet_mana() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_manastoneplate1_addon) > 0) {
        npc_removeinvitems(hero, itwr_manastoneplate1_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_mana_max, 2);
    npc_changeattribute(hero, atr_mana, 2);
    rx_usedplatemana += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_mana2() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_manastoneplate2_addon) > 0) {
        npc_removeinvitems(hero, itwr_manastoneplate2_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_mana_max, 3);
    npc_changeattribute(hero, atr_mana, 3);
    rx_usedplatemana += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};
func void rx_learnancienttablet_mana3() 
{
    b_giveplayerxp(25);
    if(npc_hasitems(hero, itwr_manastoneplate3_addon) > 0) {
        npc_removeinvitems(hero, itwr_manastoneplate3_addon, 1);
    };
    b_raiseattribute_bonus(hero, atr_mana_max, 5);
    npc_changeattribute(hero, atr_mana, 5);
    rx_usedplatemana += 1;
    snd_play("SFX_HealObsession");
    pc_psionicquest_templatedialog_249_info();
};