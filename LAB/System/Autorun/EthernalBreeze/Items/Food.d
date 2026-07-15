instance itfo_StExt_Cider(c_item) 
{
    name = StExt_Str_BoozeCiderName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 50;
    visual = "ItFo_Wine_New_01.3DS";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Cider;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 50;
    text[2] = name_bonus_mana;
    count[2] = 25;
    text[3] = name_bonus_staproc;
    count[3] = 20;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Cider() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 50);
		npc_changeattribute(self, atr_mana, 25);
		rx_restorestaminapercent(20);
        rx_setthirst(3);
		StExt_CiderUsed += 1;
		if(StExt_CiderUsed >= StExt_CiderUsedNext)
		{
			StExt_CiderUsedNext += 10;
			b_raiseattribute_bonus(self, atr_hitpoints_max, 3);
		};
    };
};

instance itfo_StExt_Mead(c_item) 
{
    name = StExt_Str_BoozeMeadName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 50;
    visual = "ItFo_Wine.3DS";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Mead;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 40;
    text[2] = name_bonus_mana;
    count[2] = 50;
    text[3] = name_bonus_staproc;
    count[3] = 15;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Mead() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 40);
		npc_changeattribute(self, atr_mana, 50);
		rx_restorestaminapercent(15);
        rx_setthirst(3);
		StExt_MeadUsed += 1;
		if(StExt_MeadUsed >= StExt_MeadUsedNext)
		{
			StExt_MeadUsedNext += 10;
			b_raiseattribute_bonus(self, atr_mana_max, 3);
		};
    };
};

instance itfo_StExt_Vodka(c_item) 
{
    name = StExt_Str_BoozeVodkaName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 75;
    visual = "ItFo_Booze_New_01.3DS";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Vodka;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 100;
    text[2] = name_bonus_mana;
    count[2] = 10;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Vodka() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 100);
		npc_changeattribute(self, atr_mana, 10);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_VodkaUsed += 1;
		if(StExt_VodkaUsed >= StExt_VodkaUsedNext)
		{
			StExt_VodkaUsedNext += 10;
			b_raiseattribute_bonus(self, atr_strength, 1);
		};
    };
};

instance itfo_StExt_Whiskey(c_item) 
{
    name = StExt_Str_BoozeWhiskeyName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItMi_Rum_02.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Whiskey;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 75;
    text[2] = name_bonus_mana;
    count[2] = 25;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Whiskey() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 75);
		npc_changeattribute(self, atr_mana, 25);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_WhiskeyUsed += 1;
		if(StExt_WhiskeyUsed >= StExt_WhiskeyUsedNext)
		{
			StExt_WhiskeyUsedNext += 10;
			b_raiseattribute_bonus(self, atr_hitpoints_max, 5);
		};
    };
};

instance itfo_StExt_Cognac(c_item) 
{
    name = StExt_Str_BoozeCognacName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItMi_BlackBrendi.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Cognac;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 50;
    text[2] = name_bonus_mana;
    count[2] = 50;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Cognac() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 50);
		npc_changeattribute(self, atr_mana, 50);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_CognacUsed += 1;
		if(StExt_CognacUsed >= StExt_CognacUsedNext)
		{
			StExt_CognacUsedNext += 10;
			b_raiseattribute_bonus(self, atr_dexterity, 1);
		};
    };
};

instance itfo_StExt_Brendy(c_item) 
{
    name = StExt_Str_BoozeBrendyName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItMi_BlackBrendi.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Brendy;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 50;
    text[2] = name_bonus_mana;
    count[2] = 50;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Brendy() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 50);
		npc_changeattribute(self, atr_mana, 50);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_BrendyUsed += 1;
		if(StExt_BrendyUsed >= StExt_BrendyUsedNext)
		{
			StExt_BrendyUsedNext += 10;
			b_raiseattribute_bonus(self, atr_dexterity, 1);
		};
    };
};

instance itfo_StExt_Absinth(c_item) 
{
    name = StExt_Str_BoozeAbsinthName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 250;
    visual = "ITPO_PERM_DEX_EX.3DS";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Absinth;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 50;
    text[2] = name_bonus_mana;
    count[2] = 100;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Absinth() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 50);
		npc_changeattribute(self, atr_mana, 100);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_AbsinthUsed += 1;
		if(StExt_AbsinthUsed >= StExt_AbsinthUsedNext)
		{
			StExt_AbsinthUsedNext += 10;
			rx_changeint(1);
		};
    };
};


instance itfo_StExt_Tequila(c_item) 
{
    name = StExt_Str_BoozeTequilaName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 150;
    visual = "ItMi_Rum_01.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Tequila;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 75;
    text[2] = name_bonus_mana;
    count[2] = 50;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Tequila() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 75);
		npc_changeattribute(self, atr_mana, 50);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_TequilaUsed += 1;
		if(StExt_TequilaUsed >= StExt_TequilaUsedNext)
		{
			StExt_TequilaUsedNext += 10;
			b_raiseattribute_bonus(self, atr_strength, 1);
		};
    };
};


instance itfo_StExt_Scotch(c_item) 
{
    name = StExt_Str_BoozeScotchName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 100;
    visual = "ItMi_Rum_01.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Scotch;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 100;
    text[2] = name_bonus_mana;
    count[2] = 25;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Scotch() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 100);
		npc_changeattribute(self, atr_mana, 25);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_ScotchUsed += 1;
		if(StExt_ScotchUsed >= StExt_ScotchUsedNext)
		{
			StExt_ScotchUsedNext += 10;
			self.protection[3] += 1;
		};
    };
};

instance itfo_StExt_Grappa(c_item) 
{
    name = StExt_Str_BoozeGrappaName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 75;
    visual = "ItFo_Booze_New_01.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    on_state = use_StExt_Grappa;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 50;
    text[2] = name_bonus_mana;
    count[2] = 75;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_BoozeDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Grappa() 
{
    if(npc_isplayer(self)) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");		
		npc_changeattribute(self, atr_hitpoints, 50);
		npc_changeattribute(self, atr_mana, 75);
		rx_restorestaminapercent(10);
        rx_setthirst(1);
		StExt_GrappaUsed += 1;
		if(StExt_GrappaUsed >= StExt_GrappaUsedNext)
		{
			StExt_GrappaUsedNext += 10;
			self.protection[5] += 1;
		};
    };
};

instance itfo_StExt_Banana(c_item) 
{
    name = StExt_Str_BananaName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 20;
    visual = "ItFo_Banana.3ds";
    material = mat_leather;
    scemename = "FOOD";
    on_state = use_StExt_Banana;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 15;
    text[2] = name_bonus_mana;
    count[2] = 5;
    text[3] = name_bonus_staproc;
    count[3] = 10;
    text[4] = StExt_Str_FruitsDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};
func void use_StExt_Banana() 
{
    if(npc_isplayer(self)) 
	{	
		npc_changeattribute(self, atr_hitpoints, 15);
		npc_changeattribute(self, atr_mana, 5);
		rx_restorestaminapercent(10);
        rx_sethunger(2);
		StExt_BananaUsed += 1;
		if(StExt_BananaUsed >= StExt_BananaUsedNext)
		{
			StExt_BananaUsedNext += 10;
			b_raiseattribute_bonus(self, atr_hitpoints_max, 1);
		};
    };
};

instance itfo_StExt_Cocount(c_item) 
{
    name = StExt_Str_CocountName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 50;
    visual = "ItFo_Coconut.3ds";
    material = mat_leather;
    scemename = "FOOD";
    on_state = use_StExt_Cocount;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 25;
    text[2] = name_bonus_mana;
    count[2] = 25;
    text[3] = name_bonus_staproc;
    count[3] = 20;
    text[4] = StExt_Str_FruitsDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
	inv_rotx = 90;
};
func void use_StExt_Cocount() 
{
    if(npc_isplayer(self)) 
	{	
		npc_changeattribute(self, atr_hitpoints, 25);
		npc_changeattribute(self, atr_mana, 25);
		rx_restorestaminapercent(20);
        rx_sethunger(1);
		rx_setthirst(2);
		StExt_CocountUsed += 1;
		if(StExt_CocountUsed >= StExt_CocountUsedNext)
		{
			StExt_CocountUsedNext += 10;
			b_raiseattribute_bonus(self, atr_hitpoints_max, 1);
		};
    };
};

instance itfo_StExt_Pear(c_item) 
{
    name = StExt_Str_PearName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 50;
    visual = "ItFo_Pear.3ds";
    material = mat_leather;
    scemename = "FOOD";
    on_state = use_StExt_Pear;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 25;
    text[2] = name_bonus_mana;
    count[2] = 15;
    text[3] = name_bonus_staproc;
    count[3] = 20;
    text[4] = StExt_Str_FruitsDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
	inv_rotx = 90;
	inv_roty = 90;
	inv_rotz = 90;
};
func void use_StExt_Pear() 
{
    if(npc_isplayer(self)) 
	{	
		npc_changeattribute(self, atr_hitpoints, 25);
		npc_changeattribute(self, atr_mana, 15);
		rx_restorestaminapercent(20);
        rx_sethunger(1);
		rx_setthirst(1);
		StExt_PearUsed += 1;
		if(StExt_PearUsed >= StExt_PearUsedNext)
		{
			StExt_PearUsedNext += 10;
			b_raiseattribute_bonus(self, atr_hitpoints_max, 1);
		};
    };
};

instance itfo_StExt_PineApple(c_item) 
{
    name = StExt_Str_PineAppleName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 50;
    visual = "ItFo_PineApple.3ds";
    material = mat_leather;
    scemename = "FOOD";
    on_state = use_StExt_PineApple;
    description = name;
    text[1] = name_bonus_hp;
    count[1] = 50;
    text[2] = name_bonus_mana;
    count[2] = 25;
    text[3] = name_bonus_staproc;
    count[3] = 20;
    text[4] = StExt_Str_FruitsDesc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
	inv_rotx = 90;
	inv_roty = 90;
	inv_rotz = 90;
};
func void use_StExt_PineApple() 
{
    if(npc_isplayer(self)) 
	{	
		npc_changeattribute(self, atr_hitpoints, 50);
		npc_changeattribute(self, atr_mana, 25);
		rx_restorestaminapercent(20);
        rx_sethunger(2);
		rx_setthirst(2);
		StExt_PineAppleUsed += 1;
		if(StExt_PineAppleUsed >= StExt_PineAppleUsedNext)
		{
			StExt_PineAppleUsedNext += 10;
			b_raiseattribute_bonus(self, atr_hitpoints_max, 1);
		};
    };
};

instance itpl_stext_clover(c_item) 
{
    name = StExt_PlantCloverName;
    mainflag = item_kat_food;
    flags = item_multi | item_mission;
    value = 1000;
    visual = "ItPl_DarkClover_New.3DS";
    material = mat_leather;
    description = name;
	text[3] = StExt_PlantCloverDesc1;
    text[4] = StExt_PlantCloverDesc2;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 0;
    scemename = "FOOD";
	on_state = useitpl_stext_clover;
	setitemvartrue(itpl_stext_clover, bit_item_no_hotbar);
};
func void useitpl_stext_clover()
{
	if(npc_isplayer(self)) 
	{
		ai_printbonus(StExt_Str_print_luckinfobonus);
		StExt_PcStats_Perm[StExt_PcStats_Index_Luck] += 2;
		StExt_PcStats_Perm[StExt_PcStats_Index_ChestLuck] += 1;
		StExt_PcStats_Perm[StExt_PcStats_Index_BodyLuck] += 1;
		StExt_PcStats_Perm[StExt_PcStats_Index_LuckGold] += 2;
    };
};