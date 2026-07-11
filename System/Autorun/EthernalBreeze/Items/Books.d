prototype itwr_StExt_book_agile(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_gold.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_archery(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_martial(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_shaman(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_brombeer.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_necro(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_necro.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_demon(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_black.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_golem(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_gold.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_life(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_green.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_death(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_blue.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_dark(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_black_shiny.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_light(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_white.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_earth(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_braun.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_air(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_lightblue.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_fire(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_red.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_ice(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_blue.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};
prototype itwr_StExt_book_electric(c_item) 
{
    mainflag = item_kat_docs;
    flags = item_mission;
    visual = "LoA_Book5_lightblue.3ds";
    material = mat_leather;
    scemename = "MAP";
    description = name;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
    inv_animate = 1;
};

func void StExt_ReadMateryBook(var int bookItm, var int masteryIndex, var int masteryLevel)
{
	var int perksPoints;
	snd_play(StExt_LvlUpSound);
	if (masteryLevel >= StExt_TalentLevel_Master) { perksPoints = 2; }
	else { perksPoints = 1; };
	StExt_LearnMasteryLevel(masteryIndex, masteryLevel);
	StExt_ChangeMasteryPerkPoints(masteryIndex, perksPoints);
	StExt_PrintLearnedMastery(masteryIndex);
	npc_removeinvitems(hero, bookItm, npc_hasitems(hero, bookItm));
};

func void StExt_ImpossibleToReadMasteryBook()
{
	b_say(self, self, StExt_ImpossibleForMe);
	ai_printred(StExt_Str_ImpossibleToReadMasteryBook);
};

//================ICE===================//
instance itwr_StExt_book_ice1(itwr_StExt_book_ice) 
{
    name = itwr_StExt_book_ice1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_ice1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Ice];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_ice1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Ice, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_ice1, StExt_MasteryIndex_Ice, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_ice2(itwr_StExt_book_ice) 
{
    name = itwr_StExt_book_ice2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_ice2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Ice];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_ice2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Ice, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_ice2, StExt_MasteryIndex_Ice, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_ice3(itwr_StExt_book_ice) 
{
    name = itwr_StExt_book_ice3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_ice3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Ice];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_ice3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Ice, StExt_TalentLevel_Expert)) 
	{
		StExt_ReadMateryBook(itwr_StExt_book_ice3, StExt_MasteryIndex_Ice, StExt_TalentLevel_Expert);   
		StExt_CanLearnWatermage = true;
		nefarius_addon_teachrunes = true;
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_ice4(itwr_StExt_book_ice) 
{
    name = itwr_StExt_book_ice4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_ice4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Ice];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_ice4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Ice, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_ice4, StExt_MasteryIndex_Ice, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_ice5(itwr_StExt_book_ice) 
{
    name = itwr_StExt_book_ice5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_ice5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Ice];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_ice5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Ice, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_ice5, StExt_MasteryIndex_Ice, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================ELECTRO===================//
instance itwr_StExt_book_electro1(itwr_StExt_book_electric) 
{
    name = itwr_StExt_book_electro1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_electro1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Electric];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_electro1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Electric, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_electro1, StExt_MasteryIndex_Electric, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_electro2(itwr_StExt_book_electric) 
{
    name = itwr_StExt_book_electro2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_electro2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Electric];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_electro2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Electric, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_electro2, StExt_MasteryIndex_Electric, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_electro3(itwr_StExt_book_electric) 
{
    name = itwr_StExt_book_electro3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_electro3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Electric];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_electro3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Electric, StExt_TalentLevel_Expert)) 
	{
		StExt_ReadMateryBook(itwr_StExt_book_electro3, StExt_MasteryIndex_Electric, StExt_TalentLevel_Expert);
		StExt_CanLearnWatermage = true;
		nefarius_addon_teachrunes = true;    
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_electro4(itwr_StExt_book_electric) 
{
    name = itwr_StExt_book_electro4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_electro4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Electric];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_electro4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Electric, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_electro4, StExt_MasteryIndex_Electric, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_electro5(itwr_StExt_book_electric) 
{
    name = itwr_StExt_book_electro5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_electro5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Electric];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_electro5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Electric, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_electro5, StExt_MasteryIndex_Electric, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================DARK===================//
instance itwr_StExt_book_dark1(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_dark1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_dark1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Dark];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_dark1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Dark, StExt_TalentLevel_Apprentice)) 
	{
		StExt_IsFakeDarkmage = true;
		StExt_ReadMateryBook(itwr_StExt_book_dark1, StExt_MasteryIndex_Dark, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_dark2(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_dark2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_dark2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Dark];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_dark2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Dark, StExt_TalentLevel_Adept)) 
	{
		StExt_IsFakeDarkmage = true;
		StExt_ReadMateryBook(itwr_StExt_book_dark2, StExt_MasteryIndex_Dark, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_dark3(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_dark3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_dark3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Dark];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_dark3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Dark, StExt_TalentLevel_Expert)) 
	{
		StExt_IsFakeDarkmage = true;
		xardas_teachrunes = true;
		StExt_CanLearnDarkmage = true;
		StExt_ReadMateryBook(itwr_StExt_book_dark3, StExt_MasteryIndex_Dark, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_dark4(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_dark4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_dark4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Dark];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_dark4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Dark, StExt_TalentLevel_Master)) 
	{
		StExt_IsFakeDarkmage = true;
		StExt_ReadMateryBook(itwr_StExt_book_dark4, StExt_MasteryIndex_Dark, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_dark5(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_dark5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_dark5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Dark];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_dark5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Dark, StExt_TalentLevel_Archmage)) 
	{
		StExt_IsFakeDarkmage = true;
		StExt_ReadMateryBook(itwr_StExt_book_dark5, StExt_MasteryIndex_Dark, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================FIRE===================//
instance itwr_StExt_book_fire1(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_fire1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_fire1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Fire];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_fire1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Fire, StExt_TalentLevel_Apprentice))	{
		StExt_ReadMateryBook(itwr_StExt_book_fire1, StExt_MasteryIndex_Fire, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_fire2(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_fire2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_fire2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Fire];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_fire2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Fire, StExt_TalentLevel_Adept))	{
		StExt_ReadMateryBook(itwr_StExt_book_fire2, StExt_MasteryIndex_Fire, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_fire3(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_fire3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_fire3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Fire];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_fire3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Fire, StExt_TalentLevel_Expert))	
	{
		StExt_CanLearnFiremage = true;
		StExt_ReadMateryBook(itwr_StExt_book_fire3, StExt_MasteryIndex_Fire, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_fire4(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_fire4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_fire4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Fire];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_fire4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Fire, StExt_TalentLevel_Master))	{
		StExt_ReadMateryBook(itwr_StExt_book_fire4, StExt_MasteryIndex_Fire, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_fire5(itwr_StExt_book_dark) 
{
    name = itwr_StExt_book_fire5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_fire5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Fire];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_fire5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Fire, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_fire5, StExt_MasteryIndex_Fire, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================Air===================//
instance itwr_StExt_book_air1(itwr_StExt_book_air) 
{
    name = itwr_StExt_book_air1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_air1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Air];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_air1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Air, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_air1, StExt_MasteryIndex_Air, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_air2(itwr_StExt_book_air) 
{
    name = itwr_StExt_book_air2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_air2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Air];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_air2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Air, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_air2, StExt_MasteryIndex_Air, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_air3(itwr_StExt_book_air) 
{
    name = itwr_StExt_book_air3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_air3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Air];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_air3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Air, StExt_TalentLevel_Expert)) 
	{
		StExt_CanLearnGuru = true;
		baalnamib_teachrunes = true;
		StExt_ReadMateryBook(itwr_StExt_book_air3, StExt_MasteryIndex_Air, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_air4(itwr_StExt_book_air) 
{
    name = itwr_StExt_book_air4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_air4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Air];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_air4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Air, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_air4, StExt_MasteryIndex_Air, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_air5(itwr_StExt_book_air) 
{
    name = itwr_StExt_book_air5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_air5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Air];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_air5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Air, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_air5, StExt_MasteryIndex_Air, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================EARTH===================//
instance itwr_StExt_book_earth1(itwr_StExt_book_earth) 
{
    name = itwr_StExt_book_earth1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_earth1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Earth];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_earth1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Earth, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_earth1, StExt_MasteryIndex_Earth, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_earth2(itwr_StExt_book_earth) 
{
    name = itwr_StExt_book_earth2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_earth2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Earth];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_earth2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Earth, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_earth2, StExt_MasteryIndex_Earth, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_earth3(itwr_StExt_book_earth) 
{
    name = itwr_StExt_book_earth3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_earth3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Earth];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_earth3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Earth, StExt_TalentLevel_Expert)) 
	{
		StExt_CanLearnGuru = true;
		baalnamib_teachrunes = true;
		StExt_ReadMateryBook(itwr_StExt_book_earth3, StExt_MasteryIndex_Earth, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_earth4(itwr_StExt_book_earth) 
{
    name = itwr_StExt_book_earth4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_earth4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Earth];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_earth4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Earth, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_earth4, StExt_MasteryIndex_Earth, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_earth5(itwr_StExt_book_earth) 
{
    name = itwr_StExt_book_earth5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_earth5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Earth];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_earth5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Earth, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_earth5, StExt_MasteryIndex_Earth, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================LIGHT===================//
instance itwr_StExt_book_light1(itwr_StExt_book_light) 
{
    name = itwr_StExt_book_light1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_light1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Light];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_light1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Light, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_light1, StExt_MasteryIndex_Light, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_light2(itwr_StExt_book_light) 
{
    name = itwr_StExt_book_light2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_light2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Light];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_light2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Light, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_light2, StExt_MasteryIndex_Light, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_light3(itwr_StExt_book_light) 
{
    name = itwr_StExt_book_light3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_light3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Light];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_light3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Light, StExt_TalentLevel_Expert))
	{
		player_talent_runes[36] = true;
		player_talent_runes_36 = true;
		StExt_CanLearnPaladin = true;
		StExt_ReadMateryBook(itwr_StExt_book_light3, StExt_MasteryIndex_Light, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_light4(itwr_StExt_book_light) 
{
    name = itwr_StExt_book_light4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_light4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Light];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_light4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Light, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_light4, StExt_MasteryIndex_Light, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_light5(itwr_StExt_book_light) 
{
    name = itwr_StExt_book_light5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_light5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Light];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_light5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Light, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_light5, StExt_MasteryIndex_Light, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================GOLEMS===================//
instance itwr_StExt_book_golems1(itwr_StExt_book_golem) 
{
    name = itwr_StExt_book_golems1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_golems1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Golem];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_golems1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Golem, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_golems1, StExt_MasteryIndex_Golem, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_golems2(itwr_StExt_book_golem) 
{
    name = itwr_StExt_book_golems2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_golems2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Golem];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_golems2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Golem, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_golems2, StExt_MasteryIndex_Golem, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_golems3(itwr_StExt_book_golem) 
{
    name = itwr_StExt_book_golems3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_golems3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Golem];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_golems3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Golem, StExt_TalentLevel_Expert)) {
		StExt_ReadMateryBook(itwr_StExt_book_golems3, StExt_MasteryIndex_Golem, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_golems4(itwr_StExt_book_golem) 
{
    name = itwr_StExt_book_golems4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_golems4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Golem];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_golems4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Golem, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_golems4, StExt_MasteryIndex_Golem, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_golems5(itwr_StExt_book_golem) 
{
    name = itwr_StExt_book_golems5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_golems5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Golem];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_golems5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Golem, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_golems5, StExt_MasteryIndex_Golem, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================NECROMANCY===================//
instance itwr_StExt_book_necromancy1(itwr_StExt_book_necro) 
{
    name = itwr_StExt_book_necromancy1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_necromancy1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Necro];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_necromancy1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Necro, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_necromancy1, StExt_MasteryIndex_Necro, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_necromancy2(itwr_StExt_book_necro) 
{
    name = itwr_StExt_book_necromancy2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_necromancy2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Necro];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_necromancy2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Necro, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_necromancy2, StExt_MasteryIndex_Necro, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_necromancy3(itwr_StExt_book_necro) 
{
    name = itwr_StExt_book_necromancy3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_necromancy3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Necro];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_necromancy3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Necro, StExt_TalentLevel_Expert)) 
	{
		xardas_teachrunes = true;
		StExt_CanLearnNecro = true;
		StExt_ReadMateryBook(itwr_StExt_book_necromancy3, StExt_MasteryIndex_Necro, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_necromancy4(itwr_StExt_book_necro) 
{
    name = itwr_StExt_book_necromancy4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_necromancy4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Necro];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_necromancy4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Necro, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_necromancy4, StExt_MasteryIndex_Necro, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_necromancy5(itwr_StExt_book_necro) 
{
    name = itwr_StExt_book_necromancy5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_necromancy5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Necro];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_necromancy5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Necro, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_necromancy5, StExt_MasteryIndex_Necro, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================LIFE===================//
instance itwr_StExt_book_healing1(itwr_StExt_book_life) 
{
    name = itwr_StExt_book_healing1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_healing1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Life];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_healing1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Life, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_healing1, StExt_MasteryIndex_Life, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_healing2(itwr_StExt_book_life) 
{
    name = itwr_StExt_book_healing2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_healing2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Life];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_healing2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Life, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_healing2, StExt_MasteryIndex_Life, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_healing3(itwr_StExt_book_life) 
{
    name = itwr_StExt_book_healing3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_healing3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Life];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_healing3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Life, StExt_TalentLevel_Expert)) {
		StExt_ReadMateryBook(itwr_StExt_book_healing3, StExt_MasteryIndex_Life, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_healing4(itwr_StExt_book_life) 
{
    name = itwr_StExt_book_healing4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_healing4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Life];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_healing4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Life, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_healing4, StExt_MasteryIndex_Life, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_healing5(itwr_StExt_book_life) 
{
    name = itwr_StExt_book_healing5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_healing5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Life];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_healing5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Life, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_healing5, StExt_MasteryIndex_Life, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================DEMONOLOGY===================//
instance itwr_StExt_book_demonolog1(itwr_StExt_book_demon) 
{
    name = itwr_StExt_book_demonolog1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_demonolog1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Demon];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_demonolog1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Demon, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_demonolog1, StExt_MasteryIndex_Demon, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_demonolog2(itwr_StExt_book_demon) 
{
    name = itwr_StExt_book_demonolog2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_demonolog2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Demon];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_demonolog2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Demon, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_demonolog2, StExt_MasteryIndex_Demon, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_demonolog3(itwr_StExt_book_demon) 
{
    name = itwr_StExt_book_demonolog3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_demonolog3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Demon];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_demonolog3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Demon, StExt_TalentLevel_Expert))
	{
		xardas_teachrunes = true;
		StExt_CanLearnDemon = true;
		StExt_ReadMateryBook(itwr_StExt_book_demonolog3, StExt_MasteryIndex_Demon, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_demonolog4(itwr_StExt_book_demon) 
{
    name = itwr_StExt_book_demonolog4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_demonolog4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Demon];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_demonolog4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Demon, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_demonolog4, StExt_MasteryIndex_Demon, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_demonolog5(itwr_StExt_book_demon) 
{
    name = itwr_StExt_book_demonolog5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_demonolog5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Demon];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_demonolog5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Demon, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_demonolog5, StExt_MasteryIndex_Demon, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================DEATH===================//
instance itwr_StExt_book_death1(itwr_StExt_book_death) 
{
    name = itwr_StExt_book_death1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_death1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Death];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_death1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Death, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_death1, StExt_MasteryIndex_Death, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_death2(itwr_StExt_book_death) 
{
    name = itwr_StExt_book_death2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_death2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Death];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_death2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Death, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_death2, StExt_MasteryIndex_Death, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_death3(itwr_StExt_book_death) 
{
    name = itwr_StExt_book_death3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_death3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Death];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_death3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Death, StExt_TalentLevel_Expert))
	{
		xardas_teachrunes = true;
		StExt_CanLearnDeath = true;
		StExt_ReadMateryBook(itwr_StExt_book_death3, StExt_MasteryIndex_Death, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_death4(itwr_StExt_book_death) 
{
    name = itwr_StExt_book_death4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_death4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Death];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_death4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Death, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_death4, StExt_MasteryIndex_Death, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_death5(itwr_StExt_book_death) 
{
    name = itwr_StExt_book_death5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_death5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Death];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_death5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Death, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_death5, StExt_MasteryIndex_Death, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================SHAMAN===================//
instance itwr_StExt_book_shaman1(itwr_StExt_book_shaman) 
{
    name = itwr_StExt_book_shaman1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_shaman1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Shaman];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_shaman1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Shaman, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_shaman1, StExt_MasteryIndex_Shaman, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_shaman2(itwr_StExt_book_shaman) 
{
    name = itwr_StExt_book_shaman2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_shaman2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Shaman];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_shaman2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Shaman, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_shaman2, StExt_MasteryIndex_Shaman, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_shaman3(itwr_StExt_book_shaman) 
{
    name = itwr_StExt_book_shaman3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_shaman3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Shaman];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_shaman3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Shaman, StExt_TalentLevel_Expert)) {
		StExt_ReadMateryBook(itwr_StExt_book_shaman3, StExt_MasteryIndex_Shaman, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_shaman4(itwr_StExt_book_shaman) 
{
    name = itwr_StExt_book_shaman4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_shaman4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Shaman];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_shaman4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Shaman, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_shaman4, StExt_MasteryIndex_Shaman, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_shaman5(itwr_StExt_book_shaman) 
{
    name = itwr_StExt_book_shaman5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_shaman5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Shaman];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_shaman5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Shaman, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_shaman5, StExt_MasteryIndex_Shaman, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================MATRIAL ARTS===================//
instance itwr_StExt_book_matrialarts1(itwr_StExt_book_martial) 
{
    name = itwr_StExt_book_matrialarts1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_matrialarts1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_MartialArts];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_matrialarts1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_matrialarts1, StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_matrialarts2(itwr_StExt_book_martial) 
{
    name = itwr_StExt_book_matrialarts2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_matrialarts2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_MartialArts];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_matrialarts2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_matrialarts2, StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_matrialarts3(itwr_StExt_book_martial) 
{
    name = itwr_StExt_book_matrialarts3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_matrialarts3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_MartialArts];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_matrialarts3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Expert)) {
		StExt_ReadMateryBook(itwr_StExt_book_matrialarts3, StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_matrialarts4(itwr_StExt_book_martial) 
{
    name = itwr_StExt_book_matrialarts4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_matrialarts4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_MartialArts];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_matrialarts4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_matrialarts4, StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_matrialarts5(itwr_StExt_book_martial) 
{
    name = itwr_StExt_book_matrialarts5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_matrialarts5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_MartialArts];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_matrialarts5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_matrialarts5, StExt_MasteryIndex_MartialArts, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};


//================AGILE===================//
instance itwr_StExt_book_agile1(itwr_StExt_book_agile) 
{
    name = itwr_StExt_book_agile1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_agile1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Agile];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_agile1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Agile, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_agile1, StExt_MasteryIndex_Agile, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_agile2(itwr_StExt_book_agile) 
{
    name = itwr_StExt_book_agile2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_agile2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Agile];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_agile2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Agile, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_agile2, StExt_MasteryIndex_Agile, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_agile3(itwr_StExt_book_agile) 
{
    name = itwr_StExt_book_agile3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_agile3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Agile];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_agile3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Agile, StExt_TalentLevel_Expert)) {
		StExt_ReadMateryBook(itwr_StExt_book_agile3, StExt_MasteryIndex_Agile, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_agile4(itwr_StExt_book_agile) 
{
    name = itwr_StExt_book_agile4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_agile4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Agile];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_agile4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Agile, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_agile4, StExt_MasteryIndex_Agile, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_agile5(itwr_StExt_book_agile) 
{
    name = itwr_StExt_book_agile5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_agile5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Agile];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_agile5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Agile, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_agile5, StExt_MasteryIndex_Agile, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

//================ARCHERY===================//
instance itwr_StExt_book_archery1(itwr_StExt_book_archery) 
{
    name = itwr_StExt_book_archery1_name;
	description = name;
	value = 5000;
	on_state = use_itwr_StExt_book_archery1;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Archery];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_archery1()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Archery, StExt_TalentLevel_Apprentice)) {
		StExt_ReadMateryBook(itwr_StExt_book_archery1, StExt_MasteryIndex_Archery, StExt_TalentLevel_Apprentice);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_archery2(itwr_StExt_book_archery) 
{
    name = itwr_StExt_book_archery2_name;
	description = name;
	value = 10000;
	on_state = use_itwr_StExt_book_archery2;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Archery];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_archery2()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Archery, StExt_TalentLevel_Adept)) {
		StExt_ReadMateryBook(itwr_StExt_book_archery2, StExt_MasteryIndex_Archery, StExt_TalentLevel_Adept);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_archery3(itwr_StExt_book_archery) 
{
    name = itwr_StExt_book_archery3_name;
	description = name;
	value = 25000;
	on_state = use_itwr_StExt_book_archery3;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Archery];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_archery3()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Archery, StExt_TalentLevel_Expert)) {
		StExt_ReadMateryBook(itwr_StExt_book_archery3, StExt_MasteryIndex_Archery, StExt_TalentLevel_Expert);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_archery4(itwr_StExt_book_archery) 
{
    name = itwr_StExt_book_archery4_name;
	description = name;
	value = 50000;
	on_state = use_itwr_StExt_book_archery4;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Archery];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_archery4()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Archery, StExt_TalentLevel_Master)) {
		StExt_ReadMateryBook(itwr_StExt_book_archery4, StExt_MasteryIndex_Archery, StExt_TalentLevel_Master);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};

instance itwr_StExt_book_archery5(itwr_StExt_book_archery) 
{
    name = itwr_StExt_book_archery5_name;
	description = name;
	value = 100000;
	on_state = use_itwr_StExt_book_archery5;    
	text[4] = StExt_Str_MasteryDescription[StExt_MasteryIndex_Archery];	
    text[5] = name_value;
    count[5] = value;    
};
func void use_itwr_StExt_book_archery5()
{
	if(npc_isplayer(self) && StExt_CanLearnNextMasteryLevel(StExt_MasteryIndex_Archery, StExt_TalentLevel_Archmage)) {
		StExt_ReadMateryBook(itwr_StExt_book_archery5, StExt_MasteryIndex_Archery, StExt_TalentLevel_Archmage);        
    }
	else { StExt_ImpossibleToReadMasteryBook(); };
};