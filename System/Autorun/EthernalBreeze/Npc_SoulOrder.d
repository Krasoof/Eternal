
//===================================================================//
//				Zakon Dusz (Soul Order) - guild master				 //
//===================================================================//
// F1 scope: joining the order (irreversible choice of TWO sworn
// elements at 200% exp, all other elements locked to 0) and soul
// infusion moved here from the StonedTrader (members only; every
// infused soul also grants +1% elemental damage, cap 50).
// F2+ (map boss, 10 summons per chapter, chapter rewards) comes next.

instance none_99702_SoulMaster(npc_default)
{
    name = StExt_Str_SoulMaster_Name;
    guild = gil_none;
    id = 99702;
    voice = 14;
    flags = 0;
    npctype = npctype_main;
    aivar[93] = true;
    aivar[57] = true;
    aivar[51] = magic_always;
    level = 1;
    b_setattributestochapter(none_99702_SoulMaster, 6);
    attribute[3] = 1000;
    attribute[2] = 1000;
    attribute[1] = 100000;
    attribute = attribute[1];
    attribute[3] = 25000;
    attribute[2] = attribute[3];
    fight_tactic = fai_human_master;
    b_setnpcvisual(none_99702_SoulMaster, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_kdm_h_npc);
    mdl_setmodelfatness(none_99702_SoulMaster, 0.0);
    mdl_applyoverlaymds(none_99702_SoulMaster, "Humans_Mage.mds");
    b_givenpctalents(none_99702_SoulMaster);
    b_setfightskills(none_99702_SoulMaster, 100);
    daily_routine = rtn_none_99702_SoulMaster;
};
func void rtn_none_99702_SoulMaster()
{
    ta_stand_armscrossed(8, 0, 23, 0, "NW_BIGFARM_CHAPEL_03");
    ta_stand_armscrossed(23, 0, 8, 0, "NW_BIGFARM_CHAPEL_03");
};

//--------------------------------------------------------------
// *** Joining: two-stage element choice (irreversible) ***
//--------------------------------------------------------------
instance dia_none_99702_SoulMaster_Join(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 2;
    condition = dia_none_99702_SoulMaster_Join_condition;
    information = dia_none_99702_SoulMaster_Join_info;
    permanent = true;
    description = StExt_Str_SoulKnight_JoinOffer;
};
func int dia_none_99702_SoulMaster_Join_condition() { return !StExt_SoulKnight_Member; };

func void StExt_SoulOrder_FinishPick(var int el2)
{
	if (el2 == StExt_SoulKnight_PendingFirst)
	{
		ai_printred(StExt_Str_SoulKnight_SameElement);
		return;
	};
	StExt_SoulKnight_Join(StExt_SoulKnight_PendingFirst, el2);
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	ai_stopprocessinfos(self);
};

func void StExt_SoulOrder_Pick2_Fire() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Fire); };
func void StExt_SoulOrder_Pick2_Ice() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Ice); };
func void StExt_SoulOrder_Pick2_Electric() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Electric); };
func void StExt_SoulOrder_Pick2_Air() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Air); };
func void StExt_SoulOrder_Pick2_Earth() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Earth); };
func void StExt_SoulOrder_Pick2_Light() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Light); };
func void StExt_SoulOrder_Pick2_Dark() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Dark); };
func void StExt_SoulOrder_Pick2_Death() { StExt_SoulOrder_FinishPick(StExt_MasteryIndex_Death); };

func void StExt_SoulOrder_BuildSecondMenu()
{
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	ai_printbonus(StExt_Str_SoulKnight_PickSecond);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Fire, StExt_SoulOrder_Pick2_Fire);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Ice, StExt_SoulOrder_Pick2_Ice);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Electric, StExt_SoulOrder_Pick2_Electric);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Air, StExt_SoulOrder_Pick2_Air);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Earth, StExt_SoulOrder_Pick2_Earth);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Light, StExt_SoulOrder_Pick2_Light);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Dark, StExt_SoulOrder_Pick2_Dark);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Death, StExt_SoulOrder_Pick2_Death);
};

func void StExt_SoulOrder_StartPick(var int el1)
{
	StExt_SoulKnight_PendingFirst = el1;
	StExt_SoulOrder_BuildSecondMenu();
};

func void StExt_SoulOrder_Pick1_Fire() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Fire); };
func void StExt_SoulOrder_Pick1_Ice() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Ice); };
func void StExt_SoulOrder_Pick1_Electric() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Electric); };
func void StExt_SoulOrder_Pick1_Air() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Air); };
func void StExt_SoulOrder_Pick1_Earth() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Earth); };
func void StExt_SoulOrder_Pick1_Light() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Light); };
func void StExt_SoulOrder_Pick1_Dark() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Dark); };
func void StExt_SoulOrder_Pick1_Death() { StExt_SoulOrder_StartPick(StExt_MasteryIndex_Death); };

func void StExt_SoulOrder_CancelJoin()
{
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	ai_stopprocessinfos(self);
};

func void dia_none_99702_SoulMaster_Join_info()
{
	ai_printbonus(StExt_Str_SoulKnight_PickFirst);
	info_clearchoices(dia_none_99702_SoulMaster_Join);
	info_addchoice(dia_none_99702_SoulMaster_Join, dialog_back, StExt_SoulOrder_CancelJoin);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Fire, StExt_SoulOrder_Pick1_Fire);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Ice, StExt_SoulOrder_Pick1_Ice);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Electric, StExt_SoulOrder_Pick1_Electric);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Air, StExt_SoulOrder_Pick1_Air);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Earth, StExt_SoulOrder_Pick1_Earth);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Light, StExt_SoulOrder_Pick1_Light);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Dark, StExt_SoulOrder_Pick1_Dark);
	info_addchoice(dia_none_99702_SoulMaster_Join, StExt_Str_El_Death, StExt_SoulOrder_Pick1_Death);
};

//--------------------------------------------------------------
// *** Soul infusion (members only; moved from the StonedTrader) ***
//--------------------------------------------------------------
instance dia_none_99702_SoulMaster_Infuse(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 3;
    condition = dia_none_99702_SoulMaster_Infuse_condition;
    information = dia_none_99702_SoulMaster_Infuse_info;
    permanent = true;
    description = StExt_Str_SoulInfuse_Offer;
};
func int dia_none_99702_SoulMaster_Infuse_condition()
{
	return StExt_SoulKnight_Member && (npc_hasitems(hero, itmi_stext_bosssoul) > 0);
};
func void dia_none_99702_SoulMaster_Infuse_info()
{
	var c_item weap;

	if (npc_hasreadiedmeleeweapon(hero) || npc_hasreadiedrangedweapon(hero)) { weap = npc_getreadiedweapon(hero); }
	else { weap = npc_getequippedmeleeweapon(hero); };
	if (!hlp_isvaliditem(weap))
	{
		ai_printred(StExt_Str_Seal_NoWeapon);
		ai_stopprocessinfos(self);
		return;
	};
	if (npc_hasitems(hero, itmi_gold) < 1000)
	{
		ai_printred(StExt_Str_Enchant_NotEnoughGold);
		ai_stopprocessinfos(self);
		return;
	};

	if (StExt_GetItemProperty(weap, StExt_ItemProp_SealSpellId) > 0)
	{
		StExt_SetItemProperty(weap, StExt_ItemProp_SealPower, StExt_GetItemProperty(weap, StExt_ItemProp_SealPower) + 20);
	}
	else if (StExt_GetItemSeal(weap) > 0)
	{
		StExt_SetItemProperty(weap, StExt_ItemProp_PerkPower, StExt_GetItemProperty(weap, StExt_ItemProp_PerkPower) + 20);
	}
	else
	{
		ai_printred(StExt_Str_WeaponSkill_NoElement);
		ai_stopprocessinfos(self);
		return;
	};

	npc_removeinvitems(hero, itmi_stext_bosssoul, 1);
	npc_removeinvitems(hero, itmi_gold, 1000);
	StExt_SoulKnight_SoulsInfused += 1;
	rx_playeffect("spellfx_incovation_violet", hero);
	ai_printbonus(StExt_Str_SoulInfuse_Done);
	ai_stopprocessinfos(self);
};

instance dia_none_99702_SoulMaster_exit(c_info)
{
    npc = none_99702_SoulMaster;
    nr = 999;
    condition = dia_none_99702_SoulMaster_exit_condition;
    information = dia_none_99702_SoulMaster_exit_info;
    permanent = true;
    description = dialog_back;
};
func int dia_none_99702_SoulMaster_exit_condition() { return true; };
func void dia_none_99702_SoulMaster_exit_info() { ai_stopprocessinfos(self); };
