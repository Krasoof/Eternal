const string StExt_UncaperStatsIndexArray[StExt_UncaperStatIndex_Max] =
{
	"StExt_StatUncaper_StamMax",
	"StExt_StatUncaper_StamCur",
	"StExt_StatUncaper_LearnSpells",
	"StExt_StatUncaper_BowTalent",
	"StExt_StatUncaper_CBowTalent",
	"StExt_StatUncaper_1hTalent",
	"StExt_StatUncaper_2hTalent"
};

prototype StExt_BaseStatUncaper(C_UncapedStat)
{
	Id = StExt_Null;
	Now = StExt_Null;
	Was = StExt_Null;
	Max = StExt_Null;
	BonusWas = StExt_Null;
	BonusNow = StExt_Null;
};

instance StExt_StatUncaper_StamMax(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_StamMax;
	Max = 100;
};

instance StExt_StatUncaper_StamCur(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_StamCur;
	Max = 1000;
};

instance StExt_StatUncaper_LearnSpells(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_LearnSpells;
	Max = 150;
};

instance StExt_StatUncaper_BowTalent(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_BowTalent;
	Max = 150;
};

instance StExt_StatUncaper_CBowTalent(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_CBowTalent;
	Max = 150;
};

instance StExt_StatUncaper_1hTalent(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_1hTalent;
	Max = 100;
};

instance StExt_StatUncaper_2hTalent(StExt_BaseStatUncaper)
{
	Id = StExt_UncaperStatIndex_2hTalent;
	Max = 100;
};


func int StExt_StatUncaper_GetValue(var int index)
{
	if (index == StExt_UncaperStatIndex_StamMax) { return atr_stamina_max; } 
	else if (index == StExt_UncaperStatIndex_StamCur) { return atr_stamina; } 
	else if (index == StExt_UncaperStatIndex_LearnSpells) { return countlearnspell; } 
	else if (index == StExt_UncaperStatIndex_BowTalent) { return hero.hitchance[3]; } 
	else if (index == StExt_UncaperStatIndex_CBowTalent) { return hero.hitchance[4]; } 
	else if (index == StExt_UncaperStatIndex_1hTalent) { return hero.hitchance[1]; } 
	else if (index == StExt_UncaperStatIndex_2hTalent) { return hero.hitchance[2]; };
	
	StExt_PrintDebugStack(concatstrings("StExt_StatUncaper_GetValue() -> invalid index: ", inttostring(index)));
	return StExt_Null;
};

func void StExt_StatUncaper_SetValue(var int index, var int value)
{
	if (index == StExt_UncaperStatIndex_StamMax) { atr_stamina_max = value; } 
	else if (index == StExt_UncaperStatIndex_StamCur) { atr_stamina = StExt_ValidateValueRange(value, 0, (atr_stamina_max * 10) - StExt_StaminaReserved); } 
	else if (index == StExt_UncaperStatIndex_LearnSpells) { countlearnspell = value; } 
	else if (index == StExt_UncaperStatIndex_BowTalent) { hero.hitchance[3] = value; } 
	else if (index == StExt_UncaperStatIndex_CBowTalent) { hero.hitchance[4] = value; } 
	else if (index == StExt_UncaperStatIndex_1hTalent) { hero.hitchance[1] = value; } 
	else if (index == StExt_UncaperStatIndex_2hTalent) { hero.hitchance[2] = value; } 
	else { StExt_PrintDebugStack(concatstrings("StExt_StatUncaper_SetValue() -> invalid index: ", inttostring(index))); };
};

func void StExt_ProcessPcStats_Overcap()
{
	StExt_UpdateUncaper();
	hero.aivar[84] = hero.hitchance[1];
	hero.aivar[85] = hero.hitchance[2];
	hero.aivar[86] = hero.hitchance[3];
	hero.aivar[87] = hero.hitchance[4];
	rx_setnpcvar(hero, aivrx_npc_atr_crossbow, hero.hitchance[4]);	
	rx_setnpcvar(hero, aivrx_npc_atr_bow, hero.hitchance[3]);
	rx_setnpcvar(hero, aivrx_npc_atr_stamina, atr_stamina_max);	
};
