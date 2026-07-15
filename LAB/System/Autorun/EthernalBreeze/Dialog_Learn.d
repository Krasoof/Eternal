//--------------------------------------------------------------
// 				*** Mod education menu ***
//--------------------------------------------------------------
var int StExt_BuildMasteryPerksChoiseList_MasteryId;
func int StExt_ModMenu_Education_BuildMasteryPerksChoiseList_Loop(var int index)
{
	var string choiceName;
	var string choiceAction;
	if (index >= StExt_MasteryPerk_Max) { return false; };
	
	if (!StExt_IsMasteryPerkLearned(StExt_BuildMasteryPerksChoiseList_MasteryId, index)) 
	{
		choiceName = StExt_GetMasteryPerkName(StExt_BuildMasteryPerksChoiseList_MasteryId, index);
		choiceName = concatstrings(choiceName, ": ");
		choiceName = concatstrings(choiceName, StExt_GetMasteryPerkDescription(StExt_BuildMasteryPerksChoiseList_MasteryId, index));
		
		choiceAction = concatstrings("StExt_ModMenu_Education_LearnMasteryPerk_", inttostring(StExt_BuildMasteryPerksChoiseList_MasteryId));
		choiceAction = concatstrings(choiceAction, "_");
		choiceAction = concatstrings(choiceAction, inttostring(index));
		
		StExt_Info_AddChoice(Dia_StExt_ModMenu_Education, choiceName, choiceAction); 
	};
	return (index < StExt_MasteryPerk_Max);
};

func void StExt_ModMenu_Education_BuildMasteryPerksChoiseList(var int masteryId)
{
	var string resetAction;
	info_clearchoices(Dia_StExt_ModMenu_Education);
	info_addchoice(Dia_StExt_ModMenu_Education, dialog_back, Dia_StExt_ModMenu_Education_info);

	if ((masteryId <= StExt_Null) || (masteryId >= StExt_MasteryIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_ModMenu_Education_BuildMasteryPerksChoiseList(...) -> Mastery index out of range! Index: ", inttostring(masteryId)));
		return;
	};
	resetAction = concatstrings("StExt_ModMenu_Education_ForgetMasteryPerks_", inttostring(masteryId));
	StExt_Info_AddChoice(Dia_StExt_ModMenu_Education, StExt_Str_ForgetPerks, resetAction); 
	
	if (StExt_GetMasteryPerkPoints(masteryId) <= 0) { return; };
	
	StExt_BuildMasteryPerksChoiseList_MasteryId = masteryId;
	StExt_While(StExt_ModMenu_Education_BuildMasteryPerksChoiseList_Loop);
};

func int StExt_ModMenu_Education_BuildGenericPerksChoiseList_Loop(var int index)
{
	var string choiceName;
	var string choiceAction;
	if (index >= StExt_Perk_Max) { return false; };	
	
	if (!StExt_IsGenericPerkLearned(index)) 
	{
		choiceName = StExt_GetGenericPerkName(index);
		choiceName = concatstrings(choiceName, " (");
		if (StExt_SncMode != 3)
		{
			choiceName = concatstrings(choiceName, inttostring(StExt_GetGenericPerkLpCost(index)));
			choiceName = concatstrings(choiceName, " ");
			choiceName = concatstrings(choiceName, StExt_Str_Required_Lp);
			choiceName = concatstrings(choiceName, "; ");			
		};
		choiceName = concatstrings(choiceName, inttostring(StExt_GetGenericPerkCost(index)));
		choiceName = concatstrings(choiceName, " ");
		choiceName = concatstrings(choiceName, StExt_Str_Required_Gold);
		choiceName = concatstrings(choiceName, "): ");
		choiceName = concatstrings(choiceName, StExt_Array_GetString("StExt_Str_Perk_Desc", index));

		choiceAction = concatstrings("StExt_ModMenu_Education_LearnGenericPerk_", inttostring(index));	
		
		StExt_Info_AddChoice(Dia_StExt_ModMenu_Education, choiceName, choiceAction); 
	};
	return (index < StExt_Perk_Max);
};

func void StExt_ModMenu_Education_BuildGenericPerksChoiseList()
{
	info_clearchoices(Dia_StExt_ModMenu_Education);
	info_addchoice(Dia_StExt_ModMenu_Education, dialog_back, Dia_StExt_ModMenu_Education_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_ForgetPerks, StExt_ModMenu_Education_ResetGenericPerks);
	StExt_While(StExt_ModMenu_Education_BuildGenericPerksChoiseList_Loop);
};

func void StExt_ModMenu_Education_ResetGenericPerks()
{
	StExt_ResetGenericPerks();
	StExt_ModMenu_Education_BuildGenericPerksChoiseList();
};

func int StExt_ModMenu_Education_BuildCorruptionPerksChoiseList_Loop(var int index)
{
	var string choiceName;
	var string choiceAction;
	var int perkCost;
	if (index >= StExt_CorruptionPerk_Max) { return false; };	
	
	if (!StExt_IsCorruptionPerkLearned(StExt_CorruptionPath, index)) 
	{ 
		perkCost = StExt_GetCorruptionPerkCost(StExt_CorruptionPath, index);
		
		choiceName = StExt_GetCorruptionPerkName(StExt_CorruptionPath, index);
		choiceName = concatstrings(choiceName, " (");
		choiceName = concatstrings(choiceName, StExt_Str_Lp);
		choiceName = concatstrings(choiceName, inttostring(perkCost));		
		choiceName = concatstrings(choiceName, "): ");
		choiceName = concatstrings(choiceName, StExt_GetCorruptionPerkDescription(StExt_CorruptionPath, index));
		
		choiceAction = concatstrings("StExt_ModMenu_Education_LearnCorruptionPerk_", inttostring(StExt_CorruptionPath));
		choiceAction = concatstrings(choiceAction, "_");
		choiceAction = concatstrings(choiceAction, inttostring(index));
		
		StExt_Info_AddChoice(Dia_StExt_ModMenu_Education, choiceName, choiceAction); 
	};
	return (index < StExt_CorruptionPerk_Max);
};

func void StExt_ModMenu_Education_BuildCorruptionPerksChoiseList()
{
	info_clearchoices(Dia_StExt_ModMenu_Education);
	info_addchoice(Dia_StExt_ModMenu_Education, dialog_back, Dia_StExt_ModMenu_Education_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_ForgetPerks, StExt_ModMenu_Education_ResetCorruptionPerks);	
	StExt_While(StExt_ModMenu_Education_BuildCorruptionPerksChoiseList_Loop);
};

func void StExt_ModMenu_Education_ResetCorruptionPerks()
{
	StExt_ResetCorruptionPerks();
	StExt_ModMenu_Education_BuildGenericPerksChoiseList();
};

// Learning dialog root
instance Dia_StExt_ModMenu_Education(c_info) 
{
    npc = pc_hero;
    condition = Dia_StExt_ModMenu_Education_Condition;
    information = Dia_StExt_ModMenu_Education_Info;
    important = false;
    permanent = true;
    nr = 100;
    description = StExt_Str_ModMenu_Education;
};

func int Dia_StExt_ModMenu_Education_Condition()
{
	if (!StExt_Config_UseOldSkillLearnSystem) { return false; };
	return StExt_ModMenuDia_Condition();
};

func void Dia_StExt_ModMenu_Education_Info()
{
	var string optName;
	info_clearchoices(Dia_StExt_ModMenu_Education);
	info_addchoice(Dia_StExt_ModMenu_Education, dialog_back, StExt_ModMenu_Education_back);

	// mastery perks
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[15], Dia_StExt_ModMenu_Education_Archery_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[14], Dia_StExt_ModMenu_Education_Agile_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[13], Dia_StExt_ModMenu_Education_MartialArts_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[12], Dia_StExt_ModMenu_Education_Shaman_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[11], Dia_StExt_ModMenu_Education_Necro_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[10], Dia_StExt_ModMenu_Education_Demon_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[9], Dia_StExt_ModMenu_Education_Golem_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[8], Dia_StExt_ModMenu_Education_Life_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[7], Dia_StExt_ModMenu_Education_Death_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[6], Dia_StExt_ModMenu_Education_Dark_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[5], Dia_StExt_ModMenu_Education_Light_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[4], Dia_StExt_ModMenu_Education_Earth_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[3], Dia_StExt_ModMenu_Education_Air_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[2], Dia_StExt_ModMenu_Education_Electric_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[1], Dia_StExt_ModMenu_Education_Ice_info);
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_MasteryNames[0], Dia_StExt_ModMenu_Education_Fire_info);

	// generic perks
	info_addchoice(Dia_StExt_ModMenu_Education, StExt_Str_ModMenu_Learning_GenericPerks, Dia_StExt_ModMenu_Education_GenericPerks_info);
	
	// corruption perks
	if ((StExt_CorruptionPath > StExt_Corruption_None) && (StExt_CorruptionPath < StExt_Corruption_Max))
	{
		optName = StExt_Array_GetString("StExt_Str_CorruptionName", StExt_CorruptionPath);
		info_addchoice(Dia_StExt_ModMenu_Education, optName, Dia_StExt_ModMenu_Education_CorruptionPerks_info);
	};
};

func void StExt_ModMenu_Education_back() { info_clearchoices(Dia_StExt_ModMenu_Education); };

func void StExt_ModMenu_Education_LearnMasteryPerk(var int masteryId, var int perkId)
{
	var string text;
	text = concatstrings("StExt_ModMenu_Education_LearnMasteryPerk(", inttostring(masteryId));
	text = concatstrings(text, ", ");
	text = concatstrings(text, inttostring(perkId));
	text = concatstrings(text, ")");
	StExt_PrintDebugStack(text);
	
	StExt_LearnMasteryPerk(masteryId, perkId);
	Dia_StExt_ModMenu_Education_info();
};

func void StExt_ModMenu_Education_LearnGenericPerk(var int perkId)
{
	var string text;
	text = concatstrings("StExt_ModMenu_Education_LearnGenericPerk(", inttostring(perkId));
	text = concatstrings(text, ")");
	StExt_PrintDebugStack(text);
	
	if(StExt_CanLearnGenericPerk(perkId, false)) { StExt_LearnGenericPerk(perkId); };
	Dia_StExt_ModMenu_Education_info();
};

func void StExt_ModMenu_Education_LearnCorruptionPerk(var int corruptionId, var int perkId)
{
	var string text;
	text = concatstrings("StExt_ModMenu_Education_LearnCorruptionPerk(", inttostring(corruptionId));
	text = concatstrings(text, ", ");
	text = concatstrings(text, inttostring(perkId));
	text = concatstrings(text, ")");
	StExt_PrintDebugStack(text);
	
	if (StExt_CanLearnCorruptionPerk(corruptionId, perkId, false)) { StExt_LearnCorruptionPerk(corruptionId, perkId); };
	Dia_StExt_ModMenu_Education_info();
};

func void Dia_StExt_ModMenu_Education_Fire_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Fire); };
func void Dia_StExt_ModMenu_Education_Ice_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Ice); };
func void Dia_StExt_ModMenu_Education_Electric_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Electric); };
func void Dia_StExt_ModMenu_Education_Air_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Air); };
func void Dia_StExt_ModMenu_Education_Earth_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Earth); };
func void Dia_StExt_ModMenu_Education_Light_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Light); };
func void Dia_StExt_ModMenu_Education_Dark_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Dark); };
func void Dia_StExt_ModMenu_Education_Death_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Death); };
func void Dia_StExt_ModMenu_Education_Life_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Life); };
func void Dia_StExt_ModMenu_Education_Golem_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Golem); };
func void Dia_StExt_ModMenu_Education_Demon_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Demon); };
func void Dia_StExt_ModMenu_Education_Necro_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Necro); };
func void Dia_StExt_ModMenu_Education_Shaman_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Shaman); };
func void Dia_StExt_ModMenu_Education_MartialArts_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_MartialArts); };
func void Dia_StExt_ModMenu_Education_Agile_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Agile); };
func void Dia_StExt_ModMenu_Education_Archery_info() { StExt_ModMenu_Education_BuildMasteryPerksChoiseList(StExt_MasteryIndex_Archery); };

func void Dia_StExt_ModMenu_Education_GenericPerks_info() { StExt_ModMenu_Education_BuildGenericPerksChoiseList(); };

func void Dia_StExt_ModMenu_Education_CorruptionPerks_info() { StExt_ModMenu_Education_BuildCorruptionPerksChoiseList(); };
//--------------------------------------------------------------
// 			*** Mod education menu - Generated ***
//--------------------------------------------------------------

// Mastery learn perk action template 
// func void StExt_ModMenu_Education_LearnMasteryPerk_[MasteryId]_[PerkId]() { StExt_ModMenu_Education_LearnMasteryPerk([MasteryId], [PerkId]); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_0() { StExt_ModMenu_Education_LearnMasteryPerk(0, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_1() { StExt_ModMenu_Education_LearnMasteryPerk(0, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_2() { StExt_ModMenu_Education_LearnMasteryPerk(0, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_3() { StExt_ModMenu_Education_LearnMasteryPerk(0, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_4() { StExt_ModMenu_Education_LearnMasteryPerk(0, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_5() { StExt_ModMenu_Education_LearnMasteryPerk(0, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_6() { StExt_ModMenu_Education_LearnMasteryPerk(0, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_7() { StExt_ModMenu_Education_LearnMasteryPerk(0, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_8() { StExt_ModMenu_Education_LearnMasteryPerk(0, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_9() { StExt_ModMenu_Education_LearnMasteryPerk(0, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_10() { StExt_ModMenu_Education_LearnMasteryPerk(0, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_11() { StExt_ModMenu_Education_LearnMasteryPerk(0, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_12() { StExt_ModMenu_Education_LearnMasteryPerk(0, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_13() { StExt_ModMenu_Education_LearnMasteryPerk(0, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_14() { StExt_ModMenu_Education_LearnMasteryPerk(0, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_0_15() { StExt_ModMenu_Education_LearnMasteryPerk(0, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_0() { StExt_ModMenu_Education_LearnMasteryPerk(1, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_1() { StExt_ModMenu_Education_LearnMasteryPerk(1, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_2() { StExt_ModMenu_Education_LearnMasteryPerk(1, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_3() { StExt_ModMenu_Education_LearnMasteryPerk(1, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_4() { StExt_ModMenu_Education_LearnMasteryPerk(1, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_5() { StExt_ModMenu_Education_LearnMasteryPerk(1, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_6() { StExt_ModMenu_Education_LearnMasteryPerk(1, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_7() { StExt_ModMenu_Education_LearnMasteryPerk(1, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_8() { StExt_ModMenu_Education_LearnMasteryPerk(1, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_9() { StExt_ModMenu_Education_LearnMasteryPerk(1, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_10() { StExt_ModMenu_Education_LearnMasteryPerk(1, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_11() { StExt_ModMenu_Education_LearnMasteryPerk(1, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_12() { StExt_ModMenu_Education_LearnMasteryPerk(1, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_13() { StExt_ModMenu_Education_LearnMasteryPerk(1, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_14() { StExt_ModMenu_Education_LearnMasteryPerk(1, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_1_15() { StExt_ModMenu_Education_LearnMasteryPerk(1, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_0() { StExt_ModMenu_Education_LearnMasteryPerk(2, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_1() { StExt_ModMenu_Education_LearnMasteryPerk(2, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_2() { StExt_ModMenu_Education_LearnMasteryPerk(2, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_3() { StExt_ModMenu_Education_LearnMasteryPerk(2, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_4() { StExt_ModMenu_Education_LearnMasteryPerk(2, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_5() { StExt_ModMenu_Education_LearnMasteryPerk(2, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_6() { StExt_ModMenu_Education_LearnMasteryPerk(2, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_7() { StExt_ModMenu_Education_LearnMasteryPerk(2, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_8() { StExt_ModMenu_Education_LearnMasteryPerk(2, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_9() { StExt_ModMenu_Education_LearnMasteryPerk(2, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_10() { StExt_ModMenu_Education_LearnMasteryPerk(2, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_11() { StExt_ModMenu_Education_LearnMasteryPerk(2, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_12() { StExt_ModMenu_Education_LearnMasteryPerk(2, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_13() { StExt_ModMenu_Education_LearnMasteryPerk(2, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_14() { StExt_ModMenu_Education_LearnMasteryPerk(2, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_2_15() { StExt_ModMenu_Education_LearnMasteryPerk(2, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_0() { StExt_ModMenu_Education_LearnMasteryPerk(3, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_1() { StExt_ModMenu_Education_LearnMasteryPerk(3, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_2() { StExt_ModMenu_Education_LearnMasteryPerk(3, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_3() { StExt_ModMenu_Education_LearnMasteryPerk(3, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_4() { StExt_ModMenu_Education_LearnMasteryPerk(3, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_5() { StExt_ModMenu_Education_LearnMasteryPerk(3, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_6() { StExt_ModMenu_Education_LearnMasteryPerk(3, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_7() { StExt_ModMenu_Education_LearnMasteryPerk(3, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_8() { StExt_ModMenu_Education_LearnMasteryPerk(3, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_9() { StExt_ModMenu_Education_LearnMasteryPerk(3, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_10() { StExt_ModMenu_Education_LearnMasteryPerk(3, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_11() { StExt_ModMenu_Education_LearnMasteryPerk(3, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_12() { StExt_ModMenu_Education_LearnMasteryPerk(3, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_13() { StExt_ModMenu_Education_LearnMasteryPerk(3, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_14() { StExt_ModMenu_Education_LearnMasteryPerk(3, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_3_15() { StExt_ModMenu_Education_LearnMasteryPerk(3, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_0() { StExt_ModMenu_Education_LearnMasteryPerk(4, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_1() { StExt_ModMenu_Education_LearnMasteryPerk(4, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_2() { StExt_ModMenu_Education_LearnMasteryPerk(4, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_3() { StExt_ModMenu_Education_LearnMasteryPerk(4, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_4() { StExt_ModMenu_Education_LearnMasteryPerk(4, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_5() { StExt_ModMenu_Education_LearnMasteryPerk(4, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_6() { StExt_ModMenu_Education_LearnMasteryPerk(4, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_7() { StExt_ModMenu_Education_LearnMasteryPerk(4, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_8() { StExt_ModMenu_Education_LearnMasteryPerk(4, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_9() { StExt_ModMenu_Education_LearnMasteryPerk(4, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_10() { StExt_ModMenu_Education_LearnMasteryPerk(4, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_11() { StExt_ModMenu_Education_LearnMasteryPerk(4, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_12() { StExt_ModMenu_Education_LearnMasteryPerk(4, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_13() { StExt_ModMenu_Education_LearnMasteryPerk(4, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_14() { StExt_ModMenu_Education_LearnMasteryPerk(4, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_4_15() { StExt_ModMenu_Education_LearnMasteryPerk(4, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_0() { StExt_ModMenu_Education_LearnMasteryPerk(5, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_1() { StExt_ModMenu_Education_LearnMasteryPerk(5, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_2() { StExt_ModMenu_Education_LearnMasteryPerk(5, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_3() { StExt_ModMenu_Education_LearnMasteryPerk(5, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_4() { StExt_ModMenu_Education_LearnMasteryPerk(5, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_5() { StExt_ModMenu_Education_LearnMasteryPerk(5, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_6() { StExt_ModMenu_Education_LearnMasteryPerk(5, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_7() { StExt_ModMenu_Education_LearnMasteryPerk(5, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_8() { StExt_ModMenu_Education_LearnMasteryPerk(5, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_9() { StExt_ModMenu_Education_LearnMasteryPerk(5, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_10() { StExt_ModMenu_Education_LearnMasteryPerk(5, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_11() { StExt_ModMenu_Education_LearnMasteryPerk(5, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_12() { StExt_ModMenu_Education_LearnMasteryPerk(5, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_13() { StExt_ModMenu_Education_LearnMasteryPerk(5, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_14() { StExt_ModMenu_Education_LearnMasteryPerk(5, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_5_15() { StExt_ModMenu_Education_LearnMasteryPerk(5, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_0() { StExt_ModMenu_Education_LearnMasteryPerk(6, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_1() { StExt_ModMenu_Education_LearnMasteryPerk(6, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_2() { StExt_ModMenu_Education_LearnMasteryPerk(6, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_3() { StExt_ModMenu_Education_LearnMasteryPerk(6, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_4() { StExt_ModMenu_Education_LearnMasteryPerk(6, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_5() { StExt_ModMenu_Education_LearnMasteryPerk(6, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_6() { StExt_ModMenu_Education_LearnMasteryPerk(6, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_7() { StExt_ModMenu_Education_LearnMasteryPerk(6, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_8() { StExt_ModMenu_Education_LearnMasteryPerk(6, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_9() { StExt_ModMenu_Education_LearnMasteryPerk(6, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_10() { StExt_ModMenu_Education_LearnMasteryPerk(6, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_11() { StExt_ModMenu_Education_LearnMasteryPerk(6, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_12() { StExt_ModMenu_Education_LearnMasteryPerk(6, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_13() { StExt_ModMenu_Education_LearnMasteryPerk(6, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_14() { StExt_ModMenu_Education_LearnMasteryPerk(6, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_6_15() { StExt_ModMenu_Education_LearnMasteryPerk(6, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_0() { StExt_ModMenu_Education_LearnMasteryPerk(7, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_1() { StExt_ModMenu_Education_LearnMasteryPerk(7, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_2() { StExt_ModMenu_Education_LearnMasteryPerk(7, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_3() { StExt_ModMenu_Education_LearnMasteryPerk(7, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_4() { StExt_ModMenu_Education_LearnMasteryPerk(7, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_5() { StExt_ModMenu_Education_LearnMasteryPerk(7, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_6() { StExt_ModMenu_Education_LearnMasteryPerk(7, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_7() { StExt_ModMenu_Education_LearnMasteryPerk(7, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_8() { StExt_ModMenu_Education_LearnMasteryPerk(7, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_9() { StExt_ModMenu_Education_LearnMasteryPerk(7, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_10() { StExt_ModMenu_Education_LearnMasteryPerk(7, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_11() { StExt_ModMenu_Education_LearnMasteryPerk(7, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_12() { StExt_ModMenu_Education_LearnMasteryPerk(7, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_13() { StExt_ModMenu_Education_LearnMasteryPerk(7, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_14() { StExt_ModMenu_Education_LearnMasteryPerk(7, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_7_15() { StExt_ModMenu_Education_LearnMasteryPerk(7, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_0() { StExt_ModMenu_Education_LearnMasteryPerk(8, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_1() { StExt_ModMenu_Education_LearnMasteryPerk(8, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_2() { StExt_ModMenu_Education_LearnMasteryPerk(8, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_3() { StExt_ModMenu_Education_LearnMasteryPerk(8, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_4() { StExt_ModMenu_Education_LearnMasteryPerk(8, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_5() { StExt_ModMenu_Education_LearnMasteryPerk(8, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_6() { StExt_ModMenu_Education_LearnMasteryPerk(8, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_7() { StExt_ModMenu_Education_LearnMasteryPerk(8, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_8() { StExt_ModMenu_Education_LearnMasteryPerk(8, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_9() { StExt_ModMenu_Education_LearnMasteryPerk(8, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_10() { StExt_ModMenu_Education_LearnMasteryPerk(8, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_11() { StExt_ModMenu_Education_LearnMasteryPerk(8, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_12() { StExt_ModMenu_Education_LearnMasteryPerk(8, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_13() { StExt_ModMenu_Education_LearnMasteryPerk(8, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_14() { StExt_ModMenu_Education_LearnMasteryPerk(8, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_8_15() { StExt_ModMenu_Education_LearnMasteryPerk(8, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_0() { StExt_ModMenu_Education_LearnMasteryPerk(9, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_1() { StExt_ModMenu_Education_LearnMasteryPerk(9, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_2() { StExt_ModMenu_Education_LearnMasteryPerk(9, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_3() { StExt_ModMenu_Education_LearnMasteryPerk(9, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_4() { StExt_ModMenu_Education_LearnMasteryPerk(9, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_5() { StExt_ModMenu_Education_LearnMasteryPerk(9, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_6() { StExt_ModMenu_Education_LearnMasteryPerk(9, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_7() { StExt_ModMenu_Education_LearnMasteryPerk(9, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_8() { StExt_ModMenu_Education_LearnMasteryPerk(9, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_9() { StExt_ModMenu_Education_LearnMasteryPerk(9, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_10() { StExt_ModMenu_Education_LearnMasteryPerk(9, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_11() { StExt_ModMenu_Education_LearnMasteryPerk(9, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_12() { StExt_ModMenu_Education_LearnMasteryPerk(9, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_13() { StExt_ModMenu_Education_LearnMasteryPerk(9, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_14() { StExt_ModMenu_Education_LearnMasteryPerk(9, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_9_15() { StExt_ModMenu_Education_LearnMasteryPerk(9, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_0() { StExt_ModMenu_Education_LearnMasteryPerk(10, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_1() { StExt_ModMenu_Education_LearnMasteryPerk(10, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_2() { StExt_ModMenu_Education_LearnMasteryPerk(10, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_3() { StExt_ModMenu_Education_LearnMasteryPerk(10, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_4() { StExt_ModMenu_Education_LearnMasteryPerk(10, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_5() { StExt_ModMenu_Education_LearnMasteryPerk(10, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_6() { StExt_ModMenu_Education_LearnMasteryPerk(10, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_7() { StExt_ModMenu_Education_LearnMasteryPerk(10, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_8() { StExt_ModMenu_Education_LearnMasteryPerk(10, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_9() { StExt_ModMenu_Education_LearnMasteryPerk(10, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_10() { StExt_ModMenu_Education_LearnMasteryPerk(10, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_11() { StExt_ModMenu_Education_LearnMasteryPerk(10, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_12() { StExt_ModMenu_Education_LearnMasteryPerk(10, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_13() { StExt_ModMenu_Education_LearnMasteryPerk(10, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_14() { StExt_ModMenu_Education_LearnMasteryPerk(10, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_10_15() { StExt_ModMenu_Education_LearnMasteryPerk(10, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_0() { StExt_ModMenu_Education_LearnMasteryPerk(11, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_1() { StExt_ModMenu_Education_LearnMasteryPerk(11, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_2() { StExt_ModMenu_Education_LearnMasteryPerk(11, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_3() { StExt_ModMenu_Education_LearnMasteryPerk(11, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_4() { StExt_ModMenu_Education_LearnMasteryPerk(11, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_5() { StExt_ModMenu_Education_LearnMasteryPerk(11, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_6() { StExt_ModMenu_Education_LearnMasteryPerk(11, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_7() { StExt_ModMenu_Education_LearnMasteryPerk(11, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_8() { StExt_ModMenu_Education_LearnMasteryPerk(11, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_9() { StExt_ModMenu_Education_LearnMasteryPerk(11, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_10() { StExt_ModMenu_Education_LearnMasteryPerk(11, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_11() { StExt_ModMenu_Education_LearnMasteryPerk(11, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_12() { StExt_ModMenu_Education_LearnMasteryPerk(11, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_13() { StExt_ModMenu_Education_LearnMasteryPerk(11, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_14() { StExt_ModMenu_Education_LearnMasteryPerk(11, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_11_15() { StExt_ModMenu_Education_LearnMasteryPerk(11, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_0() { StExt_ModMenu_Education_LearnMasteryPerk(12, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_1() { StExt_ModMenu_Education_LearnMasteryPerk(12, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_2() { StExt_ModMenu_Education_LearnMasteryPerk(12, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_3() { StExt_ModMenu_Education_LearnMasteryPerk(12, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_4() { StExt_ModMenu_Education_LearnMasteryPerk(12, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_5() { StExt_ModMenu_Education_LearnMasteryPerk(12, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_6() { StExt_ModMenu_Education_LearnMasteryPerk(12, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_7() { StExt_ModMenu_Education_LearnMasteryPerk(12, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_8() { StExt_ModMenu_Education_LearnMasteryPerk(12, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_9() { StExt_ModMenu_Education_LearnMasteryPerk(12, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_10() { StExt_ModMenu_Education_LearnMasteryPerk(12, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_11() { StExt_ModMenu_Education_LearnMasteryPerk(12, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_12() { StExt_ModMenu_Education_LearnMasteryPerk(12, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_13() { StExt_ModMenu_Education_LearnMasteryPerk(12, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_14() { StExt_ModMenu_Education_LearnMasteryPerk(12, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_12_15() { StExt_ModMenu_Education_LearnMasteryPerk(12, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_0() { StExt_ModMenu_Education_LearnMasteryPerk(13, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_1() { StExt_ModMenu_Education_LearnMasteryPerk(13, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_2() { StExt_ModMenu_Education_LearnMasteryPerk(13, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_3() { StExt_ModMenu_Education_LearnMasteryPerk(13, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_4() { StExt_ModMenu_Education_LearnMasteryPerk(13, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_5() { StExt_ModMenu_Education_LearnMasteryPerk(13, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_6() { StExt_ModMenu_Education_LearnMasteryPerk(13, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_7() { StExt_ModMenu_Education_LearnMasteryPerk(13, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_8() { StExt_ModMenu_Education_LearnMasteryPerk(13, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_9() { StExt_ModMenu_Education_LearnMasteryPerk(13, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_10() { StExt_ModMenu_Education_LearnMasteryPerk(13, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_11() { StExt_ModMenu_Education_LearnMasteryPerk(13, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_12() { StExt_ModMenu_Education_LearnMasteryPerk(13, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_13() { StExt_ModMenu_Education_LearnMasteryPerk(13, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_14() { StExt_ModMenu_Education_LearnMasteryPerk(13, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_13_15() { StExt_ModMenu_Education_LearnMasteryPerk(13, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_0() { StExt_ModMenu_Education_LearnMasteryPerk(14, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_1() { StExt_ModMenu_Education_LearnMasteryPerk(14, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_2() { StExt_ModMenu_Education_LearnMasteryPerk(14, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_3() { StExt_ModMenu_Education_LearnMasteryPerk(14, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_4() { StExt_ModMenu_Education_LearnMasteryPerk(14, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_5() { StExt_ModMenu_Education_LearnMasteryPerk(14, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_6() { StExt_ModMenu_Education_LearnMasteryPerk(14, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_7() { StExt_ModMenu_Education_LearnMasteryPerk(14, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_8() { StExt_ModMenu_Education_LearnMasteryPerk(14, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_9() { StExt_ModMenu_Education_LearnMasteryPerk(14, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_10() { StExt_ModMenu_Education_LearnMasteryPerk(14, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_11() { StExt_ModMenu_Education_LearnMasteryPerk(14, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_12() { StExt_ModMenu_Education_LearnMasteryPerk(14, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_13() { StExt_ModMenu_Education_LearnMasteryPerk(14, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_14() { StExt_ModMenu_Education_LearnMasteryPerk(14, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_14_15() { StExt_ModMenu_Education_LearnMasteryPerk(14, 15); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_0() { StExt_ModMenu_Education_LearnMasteryPerk(15, 0); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_1() { StExt_ModMenu_Education_LearnMasteryPerk(15, 1); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_2() { StExt_ModMenu_Education_LearnMasteryPerk(15, 2); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_3() { StExt_ModMenu_Education_LearnMasteryPerk(15, 3); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_4() { StExt_ModMenu_Education_LearnMasteryPerk(15, 4); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_5() { StExt_ModMenu_Education_LearnMasteryPerk(15, 5); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_6() { StExt_ModMenu_Education_LearnMasteryPerk(15, 6); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_7() { StExt_ModMenu_Education_LearnMasteryPerk(15, 7); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_8() { StExt_ModMenu_Education_LearnMasteryPerk(15, 8); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_9() { StExt_ModMenu_Education_LearnMasteryPerk(15, 9); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_10() { StExt_ModMenu_Education_LearnMasteryPerk(15, 10); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_11() { StExt_ModMenu_Education_LearnMasteryPerk(15, 11); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_12() { StExt_ModMenu_Education_LearnMasteryPerk(15, 12); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_13() { StExt_ModMenu_Education_LearnMasteryPerk(15, 13); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_14() { StExt_ModMenu_Education_LearnMasteryPerk(15, 14); };
func void StExt_ModMenu_Education_LearnMasteryPerk_15_15() { StExt_ModMenu_Education_LearnMasteryPerk(15, 15); };

func void StExt_ModMenu_Education_ForgetMasteryPerks_0() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Fire);
	Dia_StExt_ModMenu_Education_Fire_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_1() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Ice);
	Dia_StExt_ModMenu_Education_Ice_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_2() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Electric);
	Dia_StExt_ModMenu_Education_Electric_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_3() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Air);
	Dia_StExt_ModMenu_Education_Air_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_4() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Earth);
	Dia_StExt_ModMenu_Education_Earth_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_5() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Light);
	Dia_StExt_ModMenu_Education_Light_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_6() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Dark);
	Dia_StExt_ModMenu_Education_Dark_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_7() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Death);
	Dia_StExt_ModMenu_Education_Death_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_8() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Life);
	Dia_StExt_ModMenu_Education_Life_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_9() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Golem);
	Dia_StExt_ModMenu_Education_Golem_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_10() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Demon);
	Dia_StExt_ModMenu_Education_Demon_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_11() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Necro);
	Dia_StExt_ModMenu_Education_Necro_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_12() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Shaman);
	Dia_StExt_ModMenu_Education_Shaman_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_13() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_MartialArts);
	Dia_StExt_ModMenu_Education_MartialArts_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_14() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Agile);
	Dia_StExt_ModMenu_Education_Agile_info();
};
func void StExt_ModMenu_Education_ForgetMasteryPerks_15() 
{
	StExt_ResetMasteryPerks(StExt_MasteryIndex_Archery);
	Dia_StExt_ModMenu_Education_Archery_info();
};


// Generic perk learn action template 
//func void StExt_ModMenu_Education_LearnGenericPerk_[PerkId]() { StExt_ModMenu_Education_LearnGenericPerk([PerkId]); };
func void StExt_ModMenu_Education_LearnGenericPerk_0() { StExt_ModMenu_Education_LearnGenericPerk(0); };
func void StExt_ModMenu_Education_LearnGenericPerk_1() { StExt_ModMenu_Education_LearnGenericPerk(1); };
func void StExt_ModMenu_Education_LearnGenericPerk_2() { StExt_ModMenu_Education_LearnGenericPerk(2); };
func void StExt_ModMenu_Education_LearnGenericPerk_3() { StExt_ModMenu_Education_LearnGenericPerk(3); };
func void StExt_ModMenu_Education_LearnGenericPerk_4() { StExt_ModMenu_Education_LearnGenericPerk(4); };
func void StExt_ModMenu_Education_LearnGenericPerk_5() { StExt_ModMenu_Education_LearnGenericPerk(5); };
func void StExt_ModMenu_Education_LearnGenericPerk_6() { StExt_ModMenu_Education_LearnGenericPerk(6); };
func void StExt_ModMenu_Education_LearnGenericPerk_7() { StExt_ModMenu_Education_LearnGenericPerk(7); };
func void StExt_ModMenu_Education_LearnGenericPerk_8() { StExt_ModMenu_Education_LearnGenericPerk(8); };
func void StExt_ModMenu_Education_LearnGenericPerk_9() { StExt_ModMenu_Education_LearnGenericPerk(9); };
func void StExt_ModMenu_Education_LearnGenericPerk_10() { StExt_ModMenu_Education_LearnGenericPerk(10); };
func void StExt_ModMenu_Education_LearnGenericPerk_11() { StExt_ModMenu_Education_LearnGenericPerk(11); };
func void StExt_ModMenu_Education_LearnGenericPerk_12() { StExt_ModMenu_Education_LearnGenericPerk(12); };
func void StExt_ModMenu_Education_LearnGenericPerk_13() { StExt_ModMenu_Education_LearnGenericPerk(13); };
func void StExt_ModMenu_Education_LearnGenericPerk_14() { StExt_ModMenu_Education_LearnGenericPerk(14); };
func void StExt_ModMenu_Education_LearnGenericPerk_15() { StExt_ModMenu_Education_LearnGenericPerk(15); };
func void StExt_ModMenu_Education_LearnGenericPerk_16() { StExt_ModMenu_Education_LearnGenericPerk(16); };
func void StExt_ModMenu_Education_LearnGenericPerk_17() { StExt_ModMenu_Education_LearnGenericPerk(17); };
func void StExt_ModMenu_Education_LearnGenericPerk_18() { StExt_ModMenu_Education_LearnGenericPerk(18); };
func void StExt_ModMenu_Education_LearnGenericPerk_19() { StExt_ModMenu_Education_LearnGenericPerk(19); };
func void StExt_ModMenu_Education_LearnGenericPerk_20() { StExt_ModMenu_Education_LearnGenericPerk(20); };
func void StExt_ModMenu_Education_LearnGenericPerk_21() { StExt_ModMenu_Education_LearnGenericPerk(21); };
func void StExt_ModMenu_Education_LearnGenericPerk_22() { StExt_ModMenu_Education_LearnGenericPerk(22); };
func void StExt_ModMenu_Education_LearnGenericPerk_23() { StExt_ModMenu_Education_LearnGenericPerk(23); };
func void StExt_ModMenu_Education_LearnGenericPerk_24() { StExt_ModMenu_Education_LearnGenericPerk(24); };
func void StExt_ModMenu_Education_LearnGenericPerk_25() { StExt_ModMenu_Education_LearnGenericPerk(25); };
func void StExt_ModMenu_Education_LearnGenericPerk_26() { StExt_ModMenu_Education_LearnGenericPerk(26); };
func void StExt_ModMenu_Education_LearnGenericPerk_27() { StExt_ModMenu_Education_LearnGenericPerk(27); };
func void StExt_ModMenu_Education_LearnGenericPerk_28() { StExt_ModMenu_Education_LearnGenericPerk(28); };
func void StExt_ModMenu_Education_LearnGenericPerk_29() { StExt_ModMenu_Education_LearnGenericPerk(29); };
func void StExt_ModMenu_Education_LearnGenericPerk_30() { StExt_ModMenu_Education_LearnGenericPerk(30); };
func void StExt_ModMenu_Education_LearnGenericPerk_31() { StExt_ModMenu_Education_LearnGenericPerk(31); };
func void StExt_ModMenu_Education_LearnGenericPerk_32() { StExt_ModMenu_Education_LearnGenericPerk(32); };
func void StExt_ModMenu_Education_LearnGenericPerk_33() { StExt_ModMenu_Education_LearnGenericPerk(33); };
func void StExt_ModMenu_Education_LearnGenericPerk_34() { StExt_ModMenu_Education_LearnGenericPerk(34); };
func void StExt_ModMenu_Education_LearnGenericPerk_35() { StExt_ModMenu_Education_LearnGenericPerk(35); };
func void StExt_ModMenu_Education_LearnGenericPerk_36() { StExt_ModMenu_Education_LearnGenericPerk(36); };
func void StExt_ModMenu_Education_LearnGenericPerk_37() { StExt_ModMenu_Education_LearnGenericPerk(37); };
func void StExt_ModMenu_Education_LearnGenericPerk_38() { StExt_ModMenu_Education_LearnGenericPerk(38); };
func void StExt_ModMenu_Education_LearnGenericPerk_39() { StExt_ModMenu_Education_LearnGenericPerk(39); };
func void StExt_ModMenu_Education_LearnGenericPerk_40() { StExt_ModMenu_Education_LearnGenericPerk(40); };
func void StExt_ModMenu_Education_LearnGenericPerk_41() { StExt_ModMenu_Education_LearnGenericPerk(41); };

// Corruption perk learn action template
// func void StExt_ModMenu_Education_LearnCorruptionPerk_[CorruptionId]_[PerkId]() { StExt_ModMenu_Education_LearnCorruptionPerk([CorruptionId], [PerkId]); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_0() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 0); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_1() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 1); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_2() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 2); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_3() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 3); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_4() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 4); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_5() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 5); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_6() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 6); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_7() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 7); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_8() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 8); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_9() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 9); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_10() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 10); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_11() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 11); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_12() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 12); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_13() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 13); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_14() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 14); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_15() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 15); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_16() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 16); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_17() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 17); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_18() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 18); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_0_19() { StExt_ModMenu_Education_LearnCorruptionPerk(0, 19); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_0() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 0); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_1() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 1); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_2() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 2); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_3() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 3); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_4() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 4); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_5() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 5); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_6() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 6); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_7() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 7); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_8() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 8); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_9() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 9); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_10() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 10); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_11() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 11); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_12() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 12); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_13() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 13); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_14() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 14); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_15() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 15); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_16() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 16); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_17() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 17); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_18() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 18); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_1_19() { StExt_ModMenu_Education_LearnCorruptionPerk(1, 19); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_0() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 0); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_1() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 1); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_2() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 2); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_3() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 3); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_4() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 4); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_5() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 5); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_6() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 6); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_7() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 7); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_8() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 8); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_9() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 9); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_10() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 10); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_11() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 11); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_12() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 12); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_13() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 13); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_14() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 14); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_15() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 15); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_16() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 16); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_17() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 17); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_18() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 18); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_2_19() { StExt_ModMenu_Education_LearnCorruptionPerk(2, 19); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_0() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 0); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_1() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 1); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_2() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 2); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_3() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 3); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_4() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 4); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_5() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 5); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_6() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 6); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_7() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 7); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_8() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 8); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_9() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 9); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_10() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 10); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_11() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 11); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_12() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 12); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_13() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 13); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_14() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 14); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_15() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 15); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_16() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 16); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_17() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 17); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_18() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 18); };
func void StExt_ModMenu_Education_LearnCorruptionPerk_3_19() { StExt_ModMenu_Education_LearnCorruptionPerk(3, 19); };

//********************************************************************
//					Corrupted touch perk menu
//********************************************************************

func void StExt_BuildCorruptTouch_StatChoice(var string statName, var int statVal, var int statMax)
{
	var int statId;
	var int statNow;
	var string choiceName;
	var string choiceAction;
	var string statBonus;
	
	if(!StExt_SymbolExist(statName))
	{
		StExt_PrintDebugStack(concatstrings("StExt_BuildArtifact_StatChoice() -> incorrect statName: ", statName));
		return;
	};
	
	statId = StExt_GetIntValueByName(statName);
	if ((statId <= StExt_Null) || (statId >= StExt_PcStats_Index_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_BuildArtifact_StatChoice() -> incorrect statId: ", inttostring(statId)));
		return;
	};

	statNow = StExt_Array_GetInt("StExt_PcStats_Other", statId);
	if (statNow >= statMax) { return; };
	
	StExt_StatValueToString(statId, statVal);
	choiceName = StExt_Array_GetString("StExt_PcStats_Desc", statId);
	choiceName = concatstrings(choiceName, " +");
	choiceName = concatstrings(choiceName, StExt_ReturnString);
	
	choiceAction = "StExt_Dia_CorruptTouchStat_";
	choiceAction = concatstrings(choiceAction, inttostring(statId));	
	StExt_Info_AddChoice(Dia_StExt_ModMenu_CorruptedTouch, choiceName, choiceAction);	
};

instance Dia_StExt_ModMenu_CorruptedTouch(c_info) 
{
    npc = pc_hero;
    condition = StExt_ModMenuDia_CorruptedTouch_Condition;
    information = Dia_StExt_ModMenu_CorruptedTouch_Info;
    important = false;
    permanent = true;
    nr = 699;
    description = StExt_Str_Menu_CorruptedTouch;
};

func void Dia_StExt_ModMenu_CorruptedTouch_Back() 
{
	ai_printpos_clear();
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch); 
};

func int StExt_ModMenuDia_CorruptedTouch_Condition() { return (StExt_DisplayModMenu && StExt_IsGenericPerkLearned(StExt_PerkIndex_CorruptTouch)); };

func void StExt_ModMenu_CorruptedTouch_PrintStats()
{	
	var string tmp;
	var int time; time = 1000 * 300;
	
	ai_printpos_clear();
	tmp = concatstrings(StExt_Str_CorruptedPerk_DamagePoints, inttostring(StExt_CorruptedPerk_DamagePoints));
	tmp = concatstrings(tmp, " / ");
	tmp = concatstrings(tmp, inttostring(StExt_CorruptedPerk_DamageLevel));
	ai_printpos(tmp, 3800, 4500, StExt_Color_Header, time, true);
	
	tmp = concatstrings(StExt_Str_CorruptedPerk_DamageExp, inttostring(StExt_CorruptedPerk_DamageNow));
	tmp = concatstrings(tmp, " / ");
	tmp = concatstrings(tmp, inttostring(StExt_CorruptedPerk_DamageNext));
	ai_printpos(tmp, 3800, 4700, StExt_Color_Common, time, true);
	
	tmp = concatstrings(StExt_Str_CorruptionTouchExp, inttostring(StExt_Config_CorruptionTouchExp));
	tmp = concatstrings(tmp, "%");
	ai_printpos(tmp, 3800, 5000, StExt_Color_Common, time, true);
	
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = StExt_EmptyString;
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Back);

	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Luck, Dia_StExt_ModMenu_CorruptedTouch_Info_Luck);
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Aura, Dia_StExt_ModMenu_CorruptedTouch_Info_Aura);
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Masteries, Dia_StExt_ModMenu_CorruptedTouch_Info_Masteries);	
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Summons, Dia_StExt_ModMenu_CorruptedTouch_Info_Summons);
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Protection, Dia_StExt_ModMenu_CorruptedTouch_Info_Protection);
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Damage, Dia_StExt_ModMenu_CorruptedTouch_Info_Damage);
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, StExt_Str_Menu_CorruptedTouch_Stats, Dia_StExt_ModMenu_CorruptedTouch_Info_Stats);
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Luck()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Luck";
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Luck", 10, 100);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ChestLuck", 15, 100);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_BodyLuck", 15, 100);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_LuckGold", 20, 200);
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Aura()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Aura";
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraPower", 10, 100);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraDist", 50, 1000);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraChance", 5, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraMpConsumReduction", 10, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraStConsumReduction", 10, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraHpConsumReduction", 10, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AuraEsConsumReduction", 10, 50);
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Stats()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Stats";	
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_MpReg", 1, 25);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_HpReg", 1, 25);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_StReg", 1, 25);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Hp", 30, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Mp", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_St", 1, 25);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Str", 5, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Agi", 5, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Int", 5, 250);	
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_HpPerHit", 5, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_StPerHit", 10, 100);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_MpPerHit", 5, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EsPerHit", 10, 50);
	
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Protection()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Protection";
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtEdge", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtBlunt", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtFire", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtMagic", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtFly", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtPoint", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ProtFall", 5, 150);	
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistEdge", 10, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistBlunt", 10, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistFire", 10, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistMagic", 10, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistFly", 10, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistPoison", 10, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ResistPoint", 10, 300);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EsReg", 4, 40);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_Es", 30, 500);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_DodgeChance", 1, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AbsorbSpellChance", 20, 300);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ReflectSpellChance", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ReflectDamageChance", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ArrowsDeclineChance", 20, 300);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_HpRecouped", 5, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_MpRecouped", 5, 50);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EsRecouped", 5, 50);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_StRecouped", 5, 50);	
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Damage()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Damage";
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_DotExtraTick", 1, 7);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EffectDuration", 50, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_MagicPower", 1, 20);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraSpeed", 1, 20);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SpellCritChance", 20, 200);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SpellDoubleCastChance", 20, 200);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_WeapDoubleDamageChance", 20, 200);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_StunChance", 20, 200);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_FreezeChance", 20, 200);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraMeleeDam", 7, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraRangeDam", 7, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraSpellDam", 7, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraWeaponSkillDam", 10, 500);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraBluntDam", 15, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraEdgeDam", 15, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraFireDam", 15, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraFlyDam", 15, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraMagicDam", 15, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraPointDam", 15, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ExtraPoisonDam", 15, 500);

	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EdgeDotDamage", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_BluntDotDamage", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_FireDotDamage", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_FlyDotDamage", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_MagicDotDamage", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_PointDotDamage", 5, 150);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_PoisDotDamage", 5, 150);	
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_1hExtraDam", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_2hExtraDam", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_BowExtraDam", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_CBowExtraDam", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_DualExtraDam", 10, 500);

	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_HumanExtraDam", 20, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_OrcExtraDam", 20, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EvilExtraDam", 20, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_UndeadExtraDam", 20, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AnimalExtraDam", 20, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_GolemExtraDam", 20, 500);
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Masteries()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Masteries";
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_FireMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_IceMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_EarthMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_AirMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ElectricMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_LightMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_LifeMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_DeathMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_DemonMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_GolemMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_NecroMasteryPower", 10, 500);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_ShamanMasteryPower", 10, 500);
};

func void Dia_StExt_ModMenu_CorruptedTouch_Info_Summons()
{
	StExt_ModMenu_CorruptedTouch_PrintStats();
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_CorruptedTouch_Info_Summons";
	info_clearchoices(Dia_StExt_ModMenu_CorruptedTouch);		
	info_addchoice(Dia_StExt_ModMenu_CorruptedTouch, dialog_back, Dia_StExt_ModMenu_CorruptedTouch_Info);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumTotemHpPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumTotemDamagePower", 10, 250);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumTotemProtPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumTotemStatsPower", 10, 250);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumDemonHpPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumDemonDamagePower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumDemonProtPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumDemonStatsPower", 10, 250);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumGolemHpPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumGolemDamagePower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumGolemProtPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumGolemStatsPower", 10, 250);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumUndeadHpPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumUndeadDamagePower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumUndeadProtPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumUndeadStatsPower", 10, 250);	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAnimalHpPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAnimalDamagePower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAnimalProtPower", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAnimalStatsPower", 10, 250);
	
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddBluntDam", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddEdgeDam", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddFireDam", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddFlyDam", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddPointDam", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddPoisDam", 10, 250);
	StExt_BuildCorruptTouch_StatChoice("StExt_PcStats_Index_SumAddMagicDam", 10, 250);	
};

func void StExt_AddCorruptedTouchStat_Dia(var string statName, var int statValue)
{
	StExt_AddCorruptTouchStat(statName, statValue);	
	if (StExt_TryCallFunc(StExt_CurrentEditValueSection) == false) { Dia_StExt_ModMenu_CorruptedTouch_Info(); };
};

func void StExt_Dia_CorruptTouchStat_0() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Hp", 30); };
func void StExt_Dia_CorruptTouchStat_1() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Mp", 10); };
func void StExt_Dia_CorruptTouchStat_2() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_St", 1); };
func void StExt_Dia_CorruptTouchStat_3() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HpReg", 1); };
func void StExt_Dia_CorruptTouchStat_4() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MpReg", 1); };
func void StExt_Dia_CorruptTouchStat_5() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StReg", 1); };
func void StExt_Dia_CorruptTouchStat_6() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Str", 5); };
func void StExt_Dia_CorruptTouchStat_7() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Agi", 5); };
func void StExt_Dia_CorruptTouchStat_8() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Int", 5); };
func void StExt_Dia_CorruptTouchStat_9() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MagicPower", 1); };
func void StExt_Dia_CorruptTouchStat_10() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_1hMastery", 1); };
func void StExt_Dia_CorruptTouchStat_11() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_2hMastery", 1); };
func void StExt_Dia_CorruptTouchStat_12() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_BowMastery", 1); };
func void StExt_Dia_CorruptTouchStat_13() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_CBowMastery", 1); };
func void StExt_Dia_CorruptTouchStat_14() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HpPerc", 1); };
func void StExt_Dia_CorruptTouchStat_15() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MpPerc", 1); };
func void StExt_Dia_CorruptTouchStat_16() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StPerc", 1); };
func void StExt_Dia_CorruptTouchStat_17() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StrPerc", 1); };
func void StExt_Dia_CorruptTouchStat_18() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AgiPerc", 1); };
func void StExt_Dia_CorruptTouchStat_19() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_IntPerc", 1); };
func void StExt_Dia_CorruptTouchStat_20() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HpRegPerc", 1); };
func void StExt_Dia_CorruptTouchStat_21() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MpRegPerc", 1); };
func void StExt_Dia_CorruptTouchStat_22() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StRegPerc", 1); };
func void StExt_Dia_CorruptTouchStat_23() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Es", 30); };
func void StExt_Dia_CorruptTouchStat_24() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EsPerc", 1); };
func void StExt_Dia_CorruptTouchStat_25() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EsReg", 4); };
func void StExt_Dia_CorruptTouchStat_26() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EsRegPerc", 1); };
func void StExt_Dia_CorruptTouchStat_27() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DodgeChance", 5); };
func void StExt_Dia_CorruptTouchStat_28() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtEdge", 5); };
func void StExt_Dia_CorruptTouchStat_29() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtBlunt", 5); };
func void StExt_Dia_CorruptTouchStat_30() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtFire", 5); };
func void StExt_Dia_CorruptTouchStat_31() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtMagic", 5); };
func void StExt_Dia_CorruptTouchStat_32() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtFly", 5); };
func void StExt_Dia_CorruptTouchStat_33() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtPoint", 5); };
func void StExt_Dia_CorruptTouchStat_34() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtEdgePerc", 5); };
func void StExt_Dia_CorruptTouchStat_35() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtBluntPerc", 5); };
func void StExt_Dia_CorruptTouchStat_36() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtFirePerc", 5); };
func void StExt_Dia_CorruptTouchStat_37() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtMagicPerc", 5); };
func void StExt_Dia_CorruptTouchStat_38() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtFlyPerc", 5); };
func void StExt_Dia_CorruptTouchStat_39() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtPointPerc", 5); };
func void StExt_Dia_CorruptTouchStat_40() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistEdge", 10); };
func void StExt_Dia_CorruptTouchStat_41() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistBlunt", 10); };
func void StExt_Dia_CorruptTouchStat_42() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistFire", 10); };
func void StExt_Dia_CorruptTouchStat_43() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistMagic", 10); };
func void StExt_Dia_CorruptTouchStat_44() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistFly", 10); };
func void StExt_Dia_CorruptTouchStat_45() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistPoint", 10); };
func void StExt_Dia_CorruptTouchStat_46() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ResistPoison", 10); };
func void StExt_Dia_CorruptTouchStat_47() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeResist", 3); };
func void StExt_Dia_CorruptTouchStat_48() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxDodgeChance", 1); };
func void StExt_Dia_CorruptTouchStat_49() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistEdge", 1); };
func void StExt_Dia_CorruptTouchStat_50() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistBlunt", 1); };
func void StExt_Dia_CorruptTouchStat_51() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistFire", 1); };
func void StExt_Dia_CorruptTouchStat_52() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistMagic", 1); };
func void StExt_Dia_CorruptTouchStat_53() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistFly", 1); };
func void StExt_Dia_CorruptTouchStat_54() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistPoint", 1); };
func void StExt_Dia_CorruptTouchStat_55() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxResistPoison", 1); };
func void StExt_Dia_CorruptTouchStat_56() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxAoeResist", 1); };
func void StExt_Dia_CorruptTouchStat_57() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_IgnoreDamageChance", 5); };
func void StExt_Dia_CorruptTouchStat_58() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ReflectDamageChance", 10); };
func void StExt_Dia_CorruptTouchStat_59() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ReflectSpellChance", 10); };
func void StExt_Dia_CorruptTouchStat_60() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AbsorbSpellChance", 20); };
func void StExt_Dia_CorruptTouchStat_61() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ArrowsDeclineChance", 20); };
func void StExt_Dia_CorruptTouchStat_62() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_PoisionResist", 1); };
func void StExt_Dia_CorruptTouchStat_63() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_CurseResist", 1); };
func void StExt_Dia_CorruptTouchStat_64() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_WeaknessResist", 1); };
func void StExt_Dia_CorruptTouchStat_65() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HpRecouped", 5); };
func void StExt_Dia_CorruptTouchStat_66() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MpRecouped", 5); };
func void StExt_Dia_CorruptTouchStat_67() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EsRecouped", 5); };
func void StExt_Dia_CorruptTouchStat_68() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StRecouped", 5); };
func void StExt_Dia_CorruptTouchStat_69() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraDamage", 10); };
func void StExt_Dia_CorruptTouchStat_70() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraMeleeDam", 7); };
func void StExt_Dia_CorruptTouchStat_71() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraRangeDam", 7); };
func void StExt_Dia_CorruptTouchStat_72() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraSpellDam", 7); };
func void StExt_Dia_CorruptTouchStat_73() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraDamagePerc", 1); };
func void StExt_Dia_CorruptTouchStat_74() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraMeleeDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_75() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraRangeDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_76() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraSpellDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_77() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraWeaponSkillDam", 10); };
func void StExt_Dia_CorruptTouchStat_78() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraWeaponSkillDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_79() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraBluntDam", 15); };
func void StExt_Dia_CorruptTouchStat_80() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraEdgeDam", 15); };
func void StExt_Dia_CorruptTouchStat_81() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraFireDam", 15); };
func void StExt_Dia_CorruptTouchStat_82() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraFlyDam", 15); };
func void StExt_Dia_CorruptTouchStat_83() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraMagicDam", 15); };
func void StExt_Dia_CorruptTouchStat_84() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraPointDam", 15); };
func void StExt_Dia_CorruptTouchStat_85() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraPoisonDam", 15); };
func void StExt_Dia_CorruptTouchStat_86() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EdgeDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_87() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_BluntDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_88() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_FireDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_89() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_FlyDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_90() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MagicDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_91() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_PointDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_92() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_PoisDotDamage", 5); };
func void StExt_Dia_CorruptTouchStat_93() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DotExtraTick", 1); };
func void StExt_Dia_CorruptTouchStat_94() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_1hExtraDam", 10); };
func void StExt_Dia_CorruptTouchStat_95() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_2hExtraDam", 10); };
func void StExt_Dia_CorruptTouchStat_96() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_BowExtraDam", 10); };
func void StExt_Dia_CorruptTouchStat_97() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_CBowExtraDam", 10); };
func void StExt_Dia_CorruptTouchStat_98() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DualExtraDam", 10); };
func void StExt_Dia_CorruptTouchStat_99() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_1hExtraDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_100() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_2hExtraDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_101() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_BowExtraDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_102() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_CBowExtraDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_103() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DualExtraDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_104() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddBluntDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_105() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddEdgeDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_106() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddFireDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_107() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddFlyDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_108() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddPointDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_109() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddPoisonDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_110() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AddMagicDamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_111() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeExtraDamage", 10); };
func void StExt_Dia_CorruptTouchStat_112() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeExtraDamagePerc", 1); };
func void StExt_Dia_CorruptTouchStat_113() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeExtraMagicDamage", 10); };
func void StExt_Dia_CorruptTouchStat_114() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeExtraMagicDamagePerc", 1); };
func void StExt_Dia_CorruptTouchStat_115() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeExtraWeapDamage", 10); };
func void StExt_Dia_CorruptTouchStat_116() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AoeExtraWeapDamagePerc", 1); };
func void StExt_Dia_CorruptTouchStat_117() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HumanExtraDam", 20); };
func void StExt_Dia_CorruptTouchStat_118() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_OrcExtraDam", 20); };
func void StExt_Dia_CorruptTouchStat_119() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EvilExtraDam", 20); };
func void StExt_Dia_CorruptTouchStat_120() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_UndeadExtraDam", 20); };
func void StExt_Dia_CorruptTouchStat_121() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AnimalExtraDam", 20); };
func void StExt_Dia_CorruptTouchStat_122() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_GolemExtraDam", 20); };
func void StExt_Dia_CorruptTouchStat_123() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HumanExtraDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_124() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_OrcExtraDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_125() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EvilExtraDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_126() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_UndeadExtraDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_127() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AnimalExtraDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_128() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_GolemExtraDamPerc", 10); };
func void StExt_Dia_CorruptTouchStat_129() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SpellCritChance", 20); };
func void StExt_Dia_CorruptTouchStat_130() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SpellCritChanceMult", 20); };
func void StExt_Dia_CorruptTouchStat_131() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SpellConsumptionReduction", 1); };
func void StExt_Dia_CorruptTouchStat_132() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_WeapDoubleDamageChance", 20); };
func void StExt_Dia_CorruptTouchStat_133() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SpellDoubleCastChance", 20); };
func void StExt_Dia_CorruptTouchStat_134() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StunChance", 20); };
func void StExt_Dia_CorruptTouchStat_135() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_FreezeChance", 20); };
func void StExt_Dia_CorruptTouchStat_136() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_HpPerHit", 5); };
func void StExt_Dia_CorruptTouchStat_137() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MpPerHit", 5); };
func void StExt_Dia_CorruptTouchStat_138() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StPerHit", 10); };
func void StExt_Dia_CorruptTouchStat_139() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EsPerHit", 10); };
func void StExt_Dia_CorruptTouchStat_140() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealLife", 5); };
func void StExt_Dia_CorruptTouchStat_141() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SteaMana", 5); };
func void StExt_Dia_CorruptTouchStat_142() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealEs", 5); };
func void StExt_Dia_CorruptTouchStat_143() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealLifePerc", 1); };
func void StExt_Dia_CorruptTouchStat_144() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealManaPerc", 1); };
func void StExt_Dia_CorruptTouchStat_145() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealEsPerc", 1); };
func void StExt_Dia_CorruptTouchStat_146() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_FireMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_147() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_IceMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_148() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EarthMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_149() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AirMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_150() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ElectricMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_151() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DarkMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_152() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_LightMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_153() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_LifeMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_154() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DeathMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_155() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_DemonMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_156() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_GolemMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_157() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_NecroMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_158() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraCountMax", 1); };
func void StExt_Dia_CorruptTouchStat_159() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraPower", 10); };
func void StExt_Dia_CorruptTouchStat_160() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraPowerPerc", 1); };
func void StExt_Dia_CorruptTouchStat_161() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraDist", 50); };
func void StExt_Dia_CorruptTouchStat_162() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraDistPerc", 5); };
func void StExt_Dia_CorruptTouchStat_163() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraChance", 5); };
func void StExt_Dia_CorruptTouchStat_164() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraConsumptionReduction", 10); };
func void StExt_Dia_CorruptTouchStat_165() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraMpConsumReduction", 10); };
func void StExt_Dia_CorruptTouchStat_166() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraStConsumReduction", 10); };
func void StExt_Dia_CorruptTouchStat_167() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraHpConsumReduction", 10); };
func void StExt_Dia_CorruptTouchStat_168() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ReservedHpPerc", 0); };
func void StExt_Dia_CorruptTouchStat_169() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ReservedMpPerc", 0); };
func void StExt_Dia_CorruptTouchStat_170() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ReservedStPerc", 0); };
func void StExt_Dia_CorruptTouchStat_171() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ReservedEsPerc", 0); };
func void StExt_Dia_CorruptTouchStat_172() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ChanceToReanimate", 10); };
func void StExt_Dia_CorruptTouchStat_173() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_MaxSummonsCount", 1); };
func void StExt_Dia_CorruptTouchStat_174() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGlobalPower", 10); };
func void StExt_Dia_CorruptTouchStat_175() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumStatsPower", 10); };
func void StExt_Dia_CorruptTouchStat_176() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtPower", 10); };
func void StExt_Dia_CorruptTouchStat_177() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDamagePower", 10); };
func void StExt_Dia_CorruptTouchStat_178() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumHpPower", 10); };
func void StExt_Dia_CorruptTouchStat_179() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumHpRegen", 1); };
func void StExt_Dia_CorruptTouchStat_180() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumEsRegen", 1); };
func void StExt_Dia_CorruptTouchStat_181() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraHp", 20); };
func void StExt_Dia_CorruptTouchStat_182() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraEs", 20); };
func void StExt_Dia_CorruptTouchStat_183() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraStr", 10); };
func void StExt_Dia_CorruptTouchStat_184() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraAgi", 10); };
func void StExt_Dia_CorruptTouchStat_185() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraDodge", 5); };
func void StExt_Dia_CorruptTouchStat_186() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraProtAll", 5); };
func void StExt_Dia_CorruptTouchStat_187() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtEdge", 10); };
func void StExt_Dia_CorruptTouchStat_188() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtBlunt", 10); };
func void StExt_Dia_CorruptTouchStat_189() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtFire", 10); };
func void StExt_Dia_CorruptTouchStat_190() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtMagic", 10); };
func void StExt_Dia_CorruptTouchStat_191() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtFly", 10); };
func void StExt_Dia_CorruptTouchStat_192() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumProtPoint", 10); };
func void StExt_Dia_CorruptTouchStat_193() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistEdge", 5); };
func void StExt_Dia_CorruptTouchStat_194() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistBlunt", 5); };
func void StExt_Dia_CorruptTouchStat_195() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistFire", 5); };
func void StExt_Dia_CorruptTouchStat_196() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistMagic", 5); };
func void StExt_Dia_CorruptTouchStat_197() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistFly", 5); };
func void StExt_Dia_CorruptTouchStat_198() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistPoint", 5); };
func void StExt_Dia_CorruptTouchStat_199() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumResistPois", 5); };
func void StExt_Dia_CorruptTouchStat_200() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumExtraDamage", 10); };
func void StExt_Dia_CorruptTouchStat_201() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddBluntDam", 10); };
func void StExt_Dia_CorruptTouchStat_202() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddEdgeDam", 10); };
func void StExt_Dia_CorruptTouchStat_203() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddFireDam", 10); };
func void StExt_Dia_CorruptTouchStat_204() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddFlyDam", 10); };
func void StExt_Dia_CorruptTouchStat_205() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddPointDam", 10); };
func void StExt_Dia_CorruptTouchStat_206() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddPoisDam", 10); };
func void StExt_Dia_CorruptTouchStat_207() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAddMagicDam", 10); };
func void StExt_Dia_CorruptTouchStat_208() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumUndeadGlobalPower", 10); };
func void StExt_Dia_CorruptTouchStat_209() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumUndeadStatsPower", 10); };
func void StExt_Dia_CorruptTouchStat_210() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumUndeadProtPower", 10); };
func void StExt_Dia_CorruptTouchStat_211() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumUndeadDamagePower", 10); };
func void StExt_Dia_CorruptTouchStat_212() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAnimalGlobalPower", 10); };
func void StExt_Dia_CorruptTouchStat_213() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAnimalStatsPower", 10); };
func void StExt_Dia_CorruptTouchStat_214() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAnimalProtPower", 10); };
func void StExt_Dia_CorruptTouchStat_215() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAnimalDamagePower", 10); };
func void StExt_Dia_CorruptTouchStat_216() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGolemGlobalPower", 10); };
func void StExt_Dia_CorruptTouchStat_217() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGolemStatsPower", 10); };
func void StExt_Dia_CorruptTouchStat_218() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGolemProtPower", 10); };
func void StExt_Dia_CorruptTouchStat_219() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGolemDamagePower", 10); };
func void StExt_Dia_CorruptTouchStat_220() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDemonGlobalPower", 10); };
func void StExt_Dia_CorruptTouchStat_221() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDemonStatsPower", 10); };
func void StExt_Dia_CorruptTouchStat_222() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDemonProtPower", 10); };
func void StExt_Dia_CorruptTouchStat_223() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDemonDamagePower", 10); };
func void StExt_Dia_CorruptTouchStat_224() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAnimalHpPower", 10); };
func void StExt_Dia_CorruptTouchStat_225() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumUndeadHpPower", 10); };
func void StExt_Dia_CorruptTouchStat_226() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGolemHpPower", 10); };
func void StExt_Dia_CorruptTouchStat_227() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDemonHpPower", 10); };
func void StExt_Dia_CorruptTouchStat_228() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumTotemGlobalPower", 10); };
func void StExt_Dia_CorruptTouchStat_229() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumTotemStatsPower", 10); };
func void StExt_Dia_CorruptTouchStat_230() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumTotemProtPower", 10); };
func void StExt_Dia_CorruptTouchStat_231() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumTotemDamagePower", 10); };
func void StExt_Dia_CorruptTouchStat_232() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumTotemHpPower", 10); };
func void StExt_Dia_CorruptTouchStat_233() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumTotemHealing", 1); };
func void StExt_Dia_CorruptTouchStat_234() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumHealing", 1); };
func void StExt_Dia_CorruptTouchStat_235() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumGolemHealing", 1); };
func void StExt_Dia_CorruptTouchStat_236() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumUndeadHealing", 1); };
func void StExt_Dia_CorruptTouchStat_237() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumDemonHealing", 1); };
func void StExt_Dia_CorruptTouchStat_238() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_SumAnimalHealing", 1); };
func void StExt_Dia_CorruptTouchStat_239() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_Luck", 10); };
func void StExt_Dia_CorruptTouchStat_240() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ChestLuck", 15); };
func void StExt_Dia_CorruptTouchStat_241() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_BodyLuck", 15); };
func void StExt_Dia_CorruptTouchStat_242() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_LuckGold", 20); };
func void StExt_Dia_CorruptTouchStat_243() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_PickPocketChance", 1); };
func void StExt_Dia_CorruptTouchStat_244() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ChanceToInvis", 1); };
func void StExt_Dia_CorruptTouchStat_245() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_EffectDuration", 50); };
func void StExt_Dia_CorruptTouchStat_246() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ExtraSpeed", 1); };
func void StExt_Dia_CorruptTouchStat_247() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealStam", 10); };
func void StExt_Dia_CorruptTouchStat_248() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_StealStamPerc", 1); };
func void StExt_Dia_CorruptTouchStat_249() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ShamanMasteryPower", 10); };
func void StExt_Dia_CorruptTouchStat_250() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtFall", 3); };
func void StExt_Dia_CorruptTouchStat_251() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_ProtFallPerc", 1); };
func void StExt_Dia_CorruptTouchStat_252() { StExt_AddCorruptedTouchStat_Dia("StExt_PcStats_Index_AuraEsConsumReduction", 10); };
