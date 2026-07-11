
// Call this when receipt was selected.
// Here we fill some context data, precalcate chances and exp for future craft.
func int StExt_InitializeCraftContext()
{
	
	return true;
};






// Call from engine every receipt craft, after it's own condition.
// Good for global receipts check
func int StExt_OnReceiptCraft_Check() { return true; };



// Calculate if reciept chance roll was successfull
// Call from engine...
func int StExt_OnReceiptCraft_DiceRoll()
{ 
	// ToDo - compleate func
	return true; 
};

// Extra handlers for success/fail outcomes of craft
// Called before 'End' func but after receipt delegate was called.
// Of course them are same called from engine, yeah... 
func void StExt_OnReceiptCraft_Success()
{
};

func void StExt_OnReceiptCraft_Fail()
{
};

// Call from engine at the end of receipt craft pipeline.
// Here we calculate exp and generaly finalize flow.
func void StExt_OnReceiptCraft_End()
{
};

//--------------------------------------------------------------
// 				*** Scrollmaking perks ***
//--------------------------------------------------------------
func int StExt_GetScrollmakingSkillCost(var int perkId)
{
	var int cost;
	if ((perkId <= StExt_Null) || (perkId >= StExt_ScrollmakingSkillIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetScrollmakingSkillCost(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return 0;
	};
	cost = StExt_Array_GetInt("StExt_Scrollmaking_SkillCost", perkId);
	if (StExt_SncMode == 3) { cost += StExt_GetPercentFromValue(cost, 50); };
	cost = StExt_GetPercentFromValueWithMin(cost, StExt_Config_EducationMoneyCostMult, 500);
	return cost;
};

func int StExt_GetScrollmakingSkillLpCost(var int perkId)
{
	var int cost;
	if ((perkId <= StExt_Null) || (perkId >= StExt_ScrollmakingSkillIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_GetScrollmakingSkillLpCost(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return 0;
	};
	if (StExt_SncMode == 3) { return 0; };
	cost = (StExt_Array_GetInt("StExt_Scrollmaking_SkillCost", perkId) + 1) / 3000;
	cost = StExt_GetPercentFromValueWithMin(cost, StExt_Config_EducationRequirementsMult, 1);
	return cost;
};

func void StExt_LearnScrollmakingSkill(var int perkId)
{
	if ((perkId <= StExt_Null) || (perkId >= StExt_ScrollmakingSkillIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_LearnGenericPerk(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return;
	};
	StExt_Array_SetInt("StExt_Profession_Skill_Scrollmaking", perkId, true);
	npc_removeinvitems(hero, itmi_gold, StExt_GetScrollmakingSkillCost(perkId));
	if (StExt_SncMode != 3)	{ hero.lp -= StExt_GetScrollmakingSkillLpCost(perkId); };
	countlearnspell += 1;
	rx_changeintquiet(1);
	StExt_Profession_Level[StExt_ProfessionIndex_Scrollmaking] += 5;
	ai_printbonus(concatstrings(StExt_Str_Learned, StExt_Array_GetString("StExt_Str_Profession_Skill_Scrollmaking_Name", perkId)));
};

func string StExt_BuildScrollmakingSkillLearnText(var int perkId)
{
	var string choiceName;
	if ((perkId <= StExt_Null) || (perkId >= StExt_ScrollmakingSkillIndex_Max))
	{
		StExt_PrintDebugStack(concatstrings("StExt_BuildScrollmakingSkillLearnText(var int perkId) -> Perk index out of range! Index: ", inttostring(perkId)));
		return StExt_UnknownString;
	};
	
	choiceName = StExt_Array_GetString("StExt_Str_Profession_Skill_Scrollmaking_Name", perkId);	
	choiceName = concatstrings(choiceName, " (");
	if (StExt_SncMode != 3)
	{
		choiceName = concatstrings(choiceName, inttostring(StExt_GetScrollmakingSkillLpCost(perkId)));
		choiceName = concatstrings(choiceName, " ");
		choiceName = concatstrings(choiceName, StExt_Str_Required_Lp);
		choiceName = concatstrings(choiceName, "; ");			
	};
	choiceName = concatstrings(choiceName, inttostring(StExt_GetScrollmakingSkillCost(perkId)));
	choiceName = concatstrings(choiceName, " ");
	choiceName = concatstrings(choiceName, StExt_Str_Required_Gold);
	choiceName = concatstrings(choiceName, ")");
	return choiceName;
};