
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

	// Zakon Dusz overrides everything: two sworn elements at 200%,
	// every other element locked to 0. Irreversible by design.
	if (StExt_SoulKnight_Member)
	{
		if ((index == StExt_SoulKnight_Element1) || (index == StExt_SoulKnight_Element2)) { return baseMult * 2; };
		return 0;
	};

	if (StExt_ElementProfession_IsUniversal) { return StExt_GetPercentFromValue(baseMult, StExt_Config_ElementProfession_UniversalPenaltyPerc); };
	if (StExt_Array_GetInt("StExt_ElementProfession_Chosen", index)) { return baseMult; };
	return 0;
};

// Permanent elemental damage bonus from souls infused via the order
// (permille: 1% per soul, capped at 50%).
func int StExt_SoulKnight_BonusPermille()
{
	if (!StExt_SoulKnight_Member) { return 0; };
	return StExt_ValidateValueRange(StExt_SoulKnight_SoulsInfused, 0, 50) * 10;
};

// --- Zar Dusz (Embers) ---------------------------------------------------
// Boss souls you still CARRY (haven't infused) are "embers": they empower
// you but make you fragile - the classic souls "don't lose your souls".
// Infusing them (Soul Master) banks them into permanent element power AND
// clears the risk. Only Zakon members feel it. Capped so hoarding has a
// ceiling.
const int StExt_ZakonEmbers_Max = 20;
const int StExt_ZakonEmbers_OffencePerEmber = 15;	// +1.5% dealt / ember (cap +30%)
const int StExt_ZakonEmbers_DefencePerEmber = 25;	// +2.5% taken / ember (cap +50%) - risk > reward

func int StExt_ZakonEmbers_Count()
{
	if (!StExt_SoulKnight_Member) { return 0; };
	return StExt_ValidateValueRange(npc_hasitems(hero, itmi_stext_bosssoul), 0, StExt_ZakonEmbers_Max);
};

// Permille to ADD to outgoing hero damage from carried embers.
func int StExt_ZakonEmbers_OffencePermille()
{
	return StExt_ZakonEmbers_Count() * StExt_ZakonEmbers_OffencePerEmber;
};

// Permille to ADD to incoming hero damage from carried embers.
func int StExt_ZakonEmbers_DefencePermille()
{
	return StExt_ZakonEmbers_Count() * StExt_ZakonEmbers_DefencePerEmber;
};

// --- Profesje tab (Shift+T stats menu) -----------------------------------
func string StExt_ElementNameByIndex(var int idx)
{
	if (idx == StExt_MasteryIndex_Fire)     { return StExt_Str_El_Fire; };
	if (idx == StExt_MasteryIndex_Ice)      { return StExt_Str_El_Ice; };
	if (idx == StExt_MasteryIndex_Electric) { return StExt_Str_El_Electric; };
	if (idx == StExt_MasteryIndex_Air)      { return StExt_Str_El_Air; };
	if (idx == StExt_MasteryIndex_Earth)    { return StExt_Str_El_Earth; };
	if (idx == StExt_MasteryIndex_Light)    { return StExt_Str_El_Light; };
	if (idx == StExt_MasteryIndex_Dark)     { return StExt_Str_El_Dark; };
	if (idx == StExt_MasteryIndex_Death)    { return StExt_Str_El_Death; };
	return "-";
};

// Fills StExt_Str_ProfessionTab with the lines shown in the Shift+T "Profesje"
// tab. Called by the DLL (StatsWindow::InitProfesionTab) when the tab builds.
func void StExt_BuildProfessionTab()
{
	StExt_Str_ProfessionTab[0]  = "";
	StExt_Str_ProfessionTab[1]  = "";
	StExt_Str_ProfessionTab[2]  = "";
	StExt_Str_ProfessionTab[3]  = "";
	StExt_Str_ProfessionTab[4]  = "";
	StExt_Str_ProfessionTab[5]  = "";
	StExt_Str_ProfessionTab[6]  = "";
	StExt_Str_ProfessionTab[7]  = "";
	StExt_Str_ProfessionTab[8]  = "";
	StExt_Str_ProfessionTab[9]  = "";
	StExt_Str_ProfessionTab[10] = "";
	StExt_Str_ProfessionTab[11] = "";

	if (StExt_SoulKnight_Member)
	{
		StExt_Str_ProfessionTab[0] = StExt_Str_ProfTab_SoulKnight;
		StExt_Str_ProfessionTab[1] = concatstrings(StExt_Str_ProfTab_Sworn, concatstrings(StExt_ElementNameByIndex(StExt_SoulKnight_Element1), concatstrings(" + ", StExt_ElementNameByIndex(StExt_SoulKnight_Element2))));
		StExt_Str_ProfessionTab[2] = concatstrings(StExt_Str_ProfTab_Infused, concatstrings(inttostring(StExt_SoulKnight_SoulsInfused), concatstrings(StExt_Str_ProfTab_InfusedSuffix, concatstrings(inttostring(StExt_ValidateValueRange(StExt_SoulKnight_SoulsInfused, 0, 50)), "%)"))));
		StExt_Str_ProfessionTab[3] = concatstrings(StExt_Str_ProfTab_Embers, inttostring(StExt_ZakonEmbers_Count()));
	}
	else
	{
		StExt_Str_ProfessionTab[0] = StExt_Str_ProfTab_None;
	};
};

// Join the order with two sworn elements. One-way door.
func void StExt_SoulKnight_Join(var int el1, var int el2)
{
	if (StExt_SoulKnight_Member) { return; };
	if (!StExt_IsElementMasteryIndex(el1) || !StExt_IsElementMasteryIndex(el2)) { return; };
	if (el1 == el2) { return; };
	StExt_SoulKnight_Member = true;
	StExt_SoulKnight_Element1 = el1;
	StExt_SoulKnight_Element2 = el2;
	StExt_ClearAllElementProfessionSlots();
	StExt_ElementProfession_IsUniversal = false;
	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(StExt_Str_SoulKnight_Joined);
};

func int StExt_CanLearnElementProfession(var int index)
{
	if (!StExt_IsElementMasteryIndex(index)) { return false; };
	if (StExt_Array_GetInt("StExt_ElementProfession_Chosen", index)) { return false; };
	return StExt_ElementProfession_SlotsUsed() < StExt_Config_ElementProfession_MaxSlots;
};

func void StExt_LearnElementProfession(var int index)
{
	if (!StExt_CanLearnElementProfession(index)) { return; };
	StExt_Array_SetInt("StExt_ElementProfession_Chosen", index, true);
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
