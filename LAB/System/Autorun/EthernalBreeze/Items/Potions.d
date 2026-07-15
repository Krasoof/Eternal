prototype itpo_stext_01_proto(c_item) 
{
    name = itpo_stext_potion_01_name;
    mainflag = item_kat_potions;
    flags = item_multi | item_mission;
    value = 50;
    material = mat_glas;
	on_state = StExt_UsePotion;
    scemename = "POTIONFAST";
    wear = wear_effect;
    description = name;
	text[4] = itpo_stext_potion_desc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

prototype itpo_stext_02_proto(c_item) 
{
    name = itpo_stext_potion_02_name;
    mainflag = item_kat_potions;
    flags = item_multi | item_mission;
    value = 150;
    material = mat_glas;
	on_state = StExt_UsePotion;
    scemename = "POTIONFAST";
    wear = wear_effect;
    description = name;
	text[4] = itpo_stext_potion_desc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

prototype itpo_stext_03_proto(c_item) 
{
    name = itpo_stext_potion_03_name;
    mainflag = item_kat_potions;
    flags = item_multi | item_mission;
    value = 250;
    material = mat_glas;
	on_state = StExt_UsePotion;
    scemename = "POTIONFAST";
    wear = wear_effect;
    description = name;
	text[4] = itpo_stext_potion_desc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};

prototype itpo_stext_04_proto(c_item) 
{
    name = itpo_stext_potion_04_name;
    mainflag = item_kat_potions;
    flags = item_multi | item_mission;
    value = 500;
    material = mat_glas;
	on_state = StExt_UsePotion;
    scemename = "POTIONFAST";
    wear = wear_effect;
    description = name;
	text[4] = itpo_stext_potion_desc;
    text[5] = name_value;
    count[5] = value;
    inv_animate = 1;
};


prototype itpo_stext_concentration_proto(c_item) 
{
	name = StExt_Str_ItPo_Concentration_01;
    mainflag = item_kat_potions;
    flags = item_multi | item_mission;
    value = value_speed;
    visual = "ITPO_SPEED_01_EX.3ds";
    material = mat_glas;
    scemename = "POTIONFAST";
    wear = wear_effect;
    description = name;	
    text[2] = StExt_Str_ItPo_Concentration_Desc;
	text[3] = StExt_Str_ItPo_Concentration_Power;
    text[4] = name_duration;    
    text[5] = name_value;	
	count[3] = 0;
	count[4] = 0;
    count[5] = value;
    inv_animate = 1;
};


instance itpo_stext_concentration_01(itpo_stext_concentration_proto) 
{
    name = StExt_Str_ItPo_Concentration_01;
	description = name;
	value = 100;
    visual = "ITPO_SPEED_01_EX.3ds";
	on_state = use_itpo_stext_concentration_01;	
	count[3] = 10;
    count[4] = 5;
    count[5] = value;
};
func void use_itpo_stext_concentration_01() 
{
    if (self.id == 0) 
	{ 
		snd_play3d(hero, "BOTTLE_OPEN");
		startchangeworldtime(5, 0.9);
	};
};

instance itpo_stext_concentration_02(itpo_stext_concentration_proto) 
{
    name = StExt_Str_ItPo_Concentration_02;
	description = name;
	value = 250;
    visual = "ITPO_SPEED_02_EX.3ds";
	on_state = use_itpo_stext_concentration_02;	
	count[3] = 25;
    count[4] = 7;
    count[5] = value;
};
func void use_itpo_stext_concentration_02() 
{
    if (self.id == 0) 
	{ 
		snd_play3d(hero, "BOTTLE_OPEN");
		startchangeworldtime(7, 0.75);
	};
};

instance itpo_stext_concentration_03(itpo_stext_concentration_proto) 
{
    name = StExt_Str_ItPo_Concentration_03;
	description = name;
	value = 500;
    visual = "ITPO_SPEED_03_EX.3ds";
	on_state = use_itpo_stext_concentration_03;	
	count[3] = 50;
    count[4] = 10;
    count[5] = value;
};
func void use_itpo_stext_concentration_03() 
{
    if (self.id == 0) 
	{ 
		snd_play3d(hero, "BOTTLE_OPEN");
		startchangeworldtime(10, 0.5);
	};
};

instance itpo_stext_01_1(itpo_stext_01_proto) { visual = "MMB_BlueVino.3ds"; };
instance itpo_stext_01_2(itpo_stext_01_proto) { visual = "MMB_BrownVino.3ds"; };
instance itpo_stext_01_3(itpo_stext_01_proto) { visual = "MMB_GreenVino.3ds"; };
instance itpo_stext_01_4(itpo_stext_01_proto) { visual = "MMB_LightBrownVino.3ds"; };
instance itpo_stext_01_5(itpo_stext_01_proto) { visual = "MMB_LilaVino.3ds"; };
instance itpo_stext_01_6(itpo_stext_01_proto) { visual = "MMB_RedVino.3ds"; };
instance itpo_stext_01_7(itpo_stext_01_proto) { visual = "MMB_RoseVino.3ds"; };
instance itpo_stext_01_8(itpo_stext_01_proto) { visual = "MMB_VioletVino.3ds"; };
instance itpo_stext_01_9(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_01.3ds"; };
instance itpo_stext_01_10(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_02.3ds"; };
instance itpo_stext_01_11(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_03.3ds"; };
instance itpo_stext_01_12(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_04.3ds"; };
instance itpo_stext_01_13(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_05.3ds"; };
instance itpo_stext_01_14(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_06.3ds"; };
instance itpo_stext_01_15(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_07.3ds"; };
instance itpo_stext_01_16(itpo_stext_01_proto) { visual = "G1NewPotions_Elixier_08.3ds"; };
instance itpo_stext_01_17(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_01.3ds"; };
instance itpo_stext_01_18(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_02.3ds"; };
instance itpo_stext_01_19(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_03.3ds"; };
instance itpo_stext_01_20(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_04.3ds"; };
instance itpo_stext_01_21(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_05.3ds"; };
instance itpo_stext_01_22(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_06.3ds"; };
instance itpo_stext_01_23(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_07.3ds"; };
instance itpo_stext_01_24(itpo_stext_01_proto) { visual = "G1NewPotions_Perm_Elixier_08.3ds"; };

instance itpo_stext_02_1(itpo_stext_02_proto) { visual = "MMB_BlueSphere.3ds"; };
instance itpo_stext_02_2(itpo_stext_02_proto) { visual = "MMB_BrownSphere.3ds"; };
instance itpo_stext_02_3(itpo_stext_02_proto) { visual = "MMB_GreenSphere.3ds"; };
instance itpo_stext_02_4(itpo_stext_02_proto) { visual = "MMB_LightBrownSphere.3ds"; };
instance itpo_stext_02_5(itpo_stext_02_proto) { visual = "MMB_LilaSphere.3ds"; };
instance itpo_stext_02_6(itpo_stext_02_proto) { visual = "MMB_RedSphere.3ds"; };
instance itpo_stext_02_7(itpo_stext_02_proto) { visual = "MMB_RoseSphere.3ds"; };
instance itpo_stext_02_8(itpo_stext_02_proto) { visual = "MMB_VioletSphere.3ds"; };

instance itpo_stext_02_9(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_01.3ds"; };
instance itpo_stext_02_10(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_02.3ds"; };
instance itpo_stext_02_11(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_03.3ds"; };
instance itpo_stext_02_12(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_04.3ds"; };
instance itpo_stext_02_13(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_05.3ds"; };
instance itpo_stext_02_14(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_06.3ds"; };
instance itpo_stext_02_15(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_07.3ds"; };
instance itpo_stext_02_16(itpo_stext_02_proto) { visual = "G1NewPotions_Extrakt_08.3ds"; };
instance itpo_stext_02_17(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_01.3ds"; };
instance itpo_stext_02_18(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_02.3ds"; };
instance itpo_stext_02_19(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_03.3ds"; };
instance itpo_stext_02_20(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_04.3ds"; };
instance itpo_stext_02_21(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_05.3ds"; };
instance itpo_stext_02_22(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_06.3ds"; };
instance itpo_stext_02_23(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_07.3ds"; };
instance itpo_stext_02_24(itpo_stext_02_proto) { visual = "G1NewPotions_Perm_Elixier_08.3ds"; };

instance itpo_stext_03_1(itpo_stext_03_proto) { visual = "MMB_BlueAlchemy.3ds"; };
instance itpo_stext_03_2(itpo_stext_03_proto) { visual = "MMB_BrownAlchemy.3ds"; };
instance itpo_stext_03_3(itpo_stext_03_proto) { visual = "MMB_GreenAlchemy.3ds"; };
instance itpo_stext_03_4(itpo_stext_03_proto) { visual = "MMB_LightBrownAlchemy.3ds"; };
instance itpo_stext_03_5(itpo_stext_03_proto) { visual = "MMB_LilaAlchemy.3ds"; };
instance itpo_stext_03_6(itpo_stext_03_proto) { visual = "MMB_RedAlchemy.3ds"; };
instance itpo_stext_03_7(itpo_stext_03_proto) { visual = "MMB_RoseAlchemy.3ds"; };
instance itpo_stext_03_8(itpo_stext_03_proto) { visual = "MMB_VioletAlchemy.3ds"; };

instance itpo_stext_03_9(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_01.3ds"; };
instance itpo_stext_03_10(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_02.3ds"; };
instance itpo_stext_03_11(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_03.3ds"; };
instance itpo_stext_03_12(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_04.3ds"; };
instance itpo_stext_03_13(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_05.3ds"; };
instance itpo_stext_03_14(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_06.3ds"; };
instance itpo_stext_03_15(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_07.3ds"; };
instance itpo_stext_03_16(itpo_stext_03_proto) { visual = "G1NewPotions_Essenz_08.3ds"; };
instance itpo_stext_03_17(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_03_18(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_02.3ds"; };
instance itpo_stext_03_19(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_03.3ds"; };
instance itpo_stext_03_20(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_04.3ds"; };
instance itpo_stext_03_21(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_05.3ds"; };
instance itpo_stext_03_22(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_06.3ds"; };
instance itpo_stext_03_23(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_07.3ds"; };
instance itpo_stext_03_24(itpo_stext_03_proto) { visual = "G1NewPotions_Perm_Essenz_08.3ds"; };

instance itpo_stext_04_1(itpo_stext_04_proto) { visual = "MMB_BlueCaraf.3ds"; };
instance itpo_stext_04_2(itpo_stext_04_proto) { visual = "MMB_BrownCaraf.3ds"; };
instance itpo_stext_04_3(itpo_stext_04_proto) { visual = "MMB_GreenCaraf.3ds"; };
instance itpo_stext_04_4(itpo_stext_04_proto) { visual = "MMB_LightBrownCaraf.3ds"; };
instance itpo_stext_04_5(itpo_stext_04_proto) { visual = "MMB_LilaCaraf.3ds"; };
instance itpo_stext_04_6(itpo_stext_04_proto) { visual = "MMB_RedCaraf.3ds"; };
instance itpo_stext_04_7(itpo_stext_04_proto) { visual = "MMB_RoseCaraf.3ds"; };
instance itpo_stext_04_8(itpo_stext_04_proto) { visual = "MMB_VioletCaraf.3ds"; };

instance itpo_stext_04_9(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_10(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_11(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_12(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_13(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_14(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_15(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_16(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Extrakt_01.3ds"; };
instance itpo_stext_04_17(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_18(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_19(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_20(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_21(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_22(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_23(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };
instance itpo_stext_04_24(itpo_stext_04_proto) { visual = "G1NewPotions_Perm_Essenz_01.3ds"; };


instance itpo_damageup_01(c_item) 
{
	itpo_damageup_01_old();
    text[1] = StExt_EmptyString;
	text[2] = StExt_Str_itpo_damageup_01_Desc;
	text[3] = StExt_Str_itpo_damageup_Time_Desc;	
    setitemvarfalse(itpo_damageup_01, bit_item_remove_trade);
};

func void use_itpo_damageup_01() 
{
    if (self.id == 0) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");
		if (StExt_DamageUpPotionPower <= 100)
		{
			StExt_DamageUpPotionPower = 100;
			StExt_DamageUpTimer = 600;
		};
    };
};


instance itpo_damageup_02(c_item) 
{
	itpo_damageup_02_old();
    text[1] = StExt_EmptyString;
	text[2] = StExt_Str_itpo_damageup_02_Desc;
	text[3] = StExt_Str_itpo_damageup_Time_Desc;	
    setitemvarfalse(itpo_damageup_02, bit_item_remove_trade);
};

func void use_itpo_damageup_02() 
{
    if (self.id == 0) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");
		if (StExt_DamageUpPotionPower <= 200)
		{
			StExt_DamageUpPotionPower = 200;
			StExt_DamageUpTimer = 600;
		};
    };
};


instance itpo_damageup_03(c_item) 
{
	itpo_damageup_03_old();
    text[1] = StExt_EmptyString;
	text[2] = StExt_Str_itpo_damageup_03_Desc;
	text[3] = StExt_Str_itpo_damageup_Time_Desc;	
    setitemvarfalse(itpo_damageup_03, bit_item_remove_trade);
};

func void use_itpo_damageup_03() 
{
    if (self.id == 0) 
	{
        snd_play3d(hero, "BOTTLE_OPEN");
		if (StExt_DamageUpPotionPower <= 300)
		{
			StExt_DamageUpPotionPower = 300;
			StExt_DamageUpTimer = 600;
		};
    };
};

