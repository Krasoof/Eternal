
//===================================================================//
//					Element profession (specialization)			 //
//===================================================================//
// Player must pick element profession(s) (via a teacher NPC/quest) before
// the matching elemental mastery (Fire..Death) can gain any exp at all.
// Alternative: "Universal" profession unlocks all elements at once, but
// with an exp penalty. See StExt_GetMasteryExpMult in TimedEffectsController.d
// for the actual exp gate hook.

func int StExt_IsElementMasteryIndex(var int index)
{
	return (index >= StExt_MasteryIndex_Fire) && (index <= StExt_MasteryIndex_Death);
};

func int StExt_ElementProfession_SlotsUsed()
{
	var int count;
	count = 0;
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Fire]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Ice]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Electric]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Air]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Earth]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Light]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Dark]) { count += 1; };
	if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Death]) { count += 1; };
	return count;
};

func void StExt_ClearAllElementProfessionSlots()
{
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Fire] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Ice] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Electric] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Air] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Earth] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Light] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Dark] = false;
	StExt_ElementProfession_Chosen[StExt_MasteryIndex_Death] = false;
};

// Call from StExt_GetMasteryExpMult for the 8 elemental indices only.
func int StExt_GetElementMasteryExpMult(var int index, var int baseMult)
{
	if (baseMult <= 0) { return 0; };
	if (StExt_ElementProfession_IsUniversal) { return StExt_GetPercentFromValue(baseMult, StExt_Config_ElementProfession_UniversalPenaltyPerc); };
	if (StExt_ElementProfession_Chosen[index]) { return baseMult; };
	return 0;
};

func int StExt_CanLearnElementProfession(var int index)
{
	if (!StExt_IsElementMasteryIndex(index)) { return false; };
	if (StExt_ElementProfession_Chosen[index]) { return false; };
	return StExt_ElementProfession_SlotsUsed() < StExt_Config_ElementProfession_MaxSlots;
};

func void StExt_LearnElementProfession(var int index)
{
	if (!StExt_CanLearnElementProfession(index)) { return; };
	StExt_ElementProfession_Chosen[index] = true;
	StExt_ElementProfession_IsUniversal = false;
	ai_printbonus(StExt_Str_ElementProfession_Learned);
};

func void StExt_LearnUniversalElementProfession()
{
	StExt_ClearAllElementProfessionSlots();
	StExt_ElementProfession_IsUniversal = true;
	ai_printbonus(StExt_Str_ElementProfession_LearnedUniversal);
};

func void StExt_ResetElementProfession()
{
	if (npc_hasitems(hero, itmi_gold) < StExt_Config_ElementProfession_ResetCost)
	{
		ai_printred(StExt_Str_ElementProfession_NotEnoughGold);
		return;
	};
	npc_removeinvitems(hero, itmi_gold, StExt_Config_ElementProfession_ResetCost);
	StExt_ClearAllElementProfessionSlots();
	StExt_ElementProfession_IsUniversal = false;
	ai_printbonus(StExt_Str_ElementProfession_Reset);
};
