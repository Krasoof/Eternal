func void rx_setfoodhealthregen(var int time) 
{
    if(rx_isleg() || rx_isnightmarearena()) { rx_setfoodhealthregen_old(time); } 
    else 
	{
        rx_foodhealthbonus += time;
        if(rx_foodhealthbonus > ((60 * StExt_FoodPatch_FoodEffectDurationMult) + 1)) { rx_foodhealthbonus = (60 * StExt_FoodPatch_FoodEffectDurationMult) + 1; };
    };
};

func void StExt_FoodController()
{
	var int updateInvInfo;
	var int currentDay;
	currentDay = wld_getday();	
	if(currentDay == StExt_Food_CheckDay) { return; };	
	StExt_Food_CheckDay = currentDay;
	
	if(StExt_Food_ResetDay == 0) { StExt_Food_ResetDay = currentDay + StExt_Config_FoodBonusResetDay; };
	if(currentDay >= StExt_Food_ResetDay)
	{
		meetbonus = false;
		rx_meatragusoupcount = false;
		rx_friedbugmeatbonusgot = false;		
		rx_friedfishbonusgot = false;
		rx_serafisbonusgot = false;
		rx_serafisbonuscount = 0;
		rx_friedfishbonuscount = 0;
		rx_friedbugmeatbonuscount = 0;
		pi_bonus = false;
		fl_bonus = false;
		shellflesh_bonus = false;
		hammer_once = false;
		schlafhammer_once = false;
		ba_bonus = false;
		schildkroete_bonus = false;
		meetsoup_bonus = false;
		allmeet_bonus = false;
		nashsoup_bonus = false;
		fishbonus = false;
		fishsoup_bonus = 0;
		sa_bonus = false;
		be_bonus = false;
		bo_bonus = false;
		wi_bonus = false;
		meatbugragout_bonus = false;
		redswampbonus = false;
		rx_smokebonuspipe = false;
		beetbonus = false;
		
		updateitemsinfoininv();
		StExt_Food_ResetDay = currentDay + StExt_Config_FoodBonusResetDay; 
	};	
};