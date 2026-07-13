
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
