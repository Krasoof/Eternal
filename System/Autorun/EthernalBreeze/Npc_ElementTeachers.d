
//===================================================================//
//			Element profession teachers (Fire, Dark - pilot)		 //
//===================================================================//
// Pattern to copy for the remaining elements: NPC instance + daily routine
// + spawn (ModController.d) + a handful of C_Info dialogs that call the
// shared functions in ElementProfessionController.d.

//--------------------------------------------------------------
// *** Fire teacher ***
//--------------------------------------------------------------
instance none_99700_FireMaster(npc_default)
{
    name = StExt_Str_FireMaster_Name;
    guild = gil_none;
    id = 99700;
    voice = 14;
    flags = 0;
    npctype = npctype_main;
    aivar[93] = true;
    aivar[57] = true;
    aivar[51] = magic_always;
    level = 1;
    b_setattributestochapter(none_99700_FireMaster, 6);
    attribute[3] = 1000;
    attribute[2] = 1000;
    attribute[1] = 100000;
    attribute = attribute[1];
    attribute[3] = 25000;
    attribute[2] = attribute[3];
    fight_tactic = fai_human_master;
    b_setnpcvisual(none_99700_FireMaster, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_stext_mage_novise);
    mdl_setmodelfatness(none_99700_FireMaster, 0.0);
    mdl_applyoverlaymds(none_99700_FireMaster, "Humans_Mage.mds");
    b_givenpctalents(none_99700_FireMaster);
    b_setfightskills(none_99700_FireMaster, 100);
    daily_routine = rtn_none_99700_FireMaster;
};
func void rtn_none_99700_FireMaster()
{
    ta_stand_armscrossed(8, 0, 23, 0, "OC_MAGE_CENTER");
    ta_stand_armscrossed(23, 0, 8, 0, "OC_MAGE_CENTER");
};

instance dia_none_99700_FireMaster_hi(C_Info)
{
    npc = none_99700_FireMaster;
    nr = 1;
    condition = dia_none_99700_FireMaster_hi_condition;
    information = dia_none_99700_FireMaster_hi_info;
    permanent = true;
    description = StExt_Str_FireMaster_Hi;
};
func int dia_none_99700_FireMaster_hi_condition() { return true; };
func void dia_none_99700_FireMaster_hi_info()
{
    AI_Output(self, other, "DIA_StExt_FireMaster_hi_01");
    if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Fire])
    {
        AI_Output(self, other, "DIA_StExt_FireMaster_hi_already_01");
    }
    else if (!StExt_CanLearnElementProfession(StExt_MasteryIndex_Fire))
    {
        AI_Output(self, other, "DIA_StExt_FireMaster_hi_slotsfull_01");
    }
    else
    {
        AI_Output(self, other, "DIA_StExt_FireMaster_hi_quest_01");
    };
    ai_stopprocessinfos(self);
};

instance dia_none_99700_FireMaster_turnin(C_Info)
{
    npc = none_99700_FireMaster;
    nr = 2;
    condition = dia_none_99700_FireMaster_turnin_condition;
    information = dia_none_99700_FireMaster_turnin_info;
    permanent = false;
    description = StExt_Str_FireMaster_Turnin;
};
func int dia_none_99700_FireMaster_turnin_condition()
{
    if (!StExt_CanLearnElementProfession(StExt_MasteryIndex_Fire)) { return false; };
    return npc_hasitems(hero, itmi_sulfur) >= 3;
};
func void dia_none_99700_FireMaster_turnin_info()
{
    AI_Output(other, self, "DIA_StExt_FireMaster_turnin_01");
    npc_removeinvitems(hero, itmi_sulfur, 3);
    StExt_LearnElementProfession(StExt_MasteryIndex_Fire);
    log_createtopic(StExt_Topic_ElementFire, log_mission);
    log_settopicstatus(StExt_Topic_ElementFire, log_success);
    b_logentry(StExt_Topic_ElementFire, StExt_Str_ElementFire_LogEntry_Done);
    AI_Output(self, other, "DIA_StExt_FireMaster_turnin_02");
    ai_stopprocessinfos(self);
};

instance dia_none_99700_FireMaster_universal(C_Info)
{
    npc = none_99700_FireMaster;
    nr = 3;
    condition = dia_none_99700_FireMaster_universal_condition;
    information = dia_none_99700_FireMaster_universal_info;
    permanent = true;
    description = StExt_Str_ElementProfession_UniversalOffer;
};
func int dia_none_99700_FireMaster_universal_condition() { return !StExt_ElementProfession_IsUniversal; };
func void dia_none_99700_FireMaster_universal_info()
{
    AI_Output(self, other, "DIA_StExt_ElementMaster_universal_01");
    StExt_LearnUniversalElementProfession();
    ai_stopprocessinfos(self);
};

instance dia_none_99700_FireMaster_reset(C_Info)
{
    npc = none_99700_FireMaster;
    nr = 4;
    condition = dia_none_99700_FireMaster_reset_condition;
    information = dia_none_99700_FireMaster_reset_info;
    permanent = true;
    description = StExt_Str_ElementProfession_ResetOffer;
};
func int dia_none_99700_FireMaster_reset_condition() { return (StExt_ElementProfession_SlotsUsed() > 0) || StExt_ElementProfession_IsUniversal; };
func void dia_none_99700_FireMaster_reset_info()
{
    AI_Output(self, other, "DIA_StExt_ElementMaster_reset_01");
    StExt_ResetElementProfession();
    ai_stopprocessinfos(self);
};

instance dia_none_99700_FireMaster_exit(C_Info)
{
    npc = none_99700_FireMaster;
    nr = 999;
    condition = dia_none_99700_FireMaster_exit_condition;
    information = dia_none_99700_FireMaster_exit_info;
    permanent = true;
    description = dialog_back;
};
func int dia_none_99700_FireMaster_exit_condition() { return true; };
func void dia_none_99700_FireMaster_exit_info() { ai_stopprocessinfos(self); };


//--------------------------------------------------------------
// *** Dark teacher ***
//--------------------------------------------------------------
instance none_99701_DarkMaster(npc_default)
{
    name = StExt_Str_DarkMaster_Name;
    guild = gil_none;
    id = 99701;
    voice = 13;	// bylo 14 (user: "tragiczny") -> 13, glebszy/mroczniejszy meski SVM
    flags = 0;
    npctype = npctype_main;
    aivar[93] = true;
    aivar[57] = true;
    aivar[51] = magic_always;
    level = 1;
    b_setattributestochapter(none_99701_DarkMaster, 6);
    attribute[3] = 1000;
    attribute[2] = 1000;
    attribute[1] = 100000;
    attribute = attribute[1];
    attribute[3] = 25000;
    attribute[2] = attribute[3];
    fight_tactic = fai_human_master;
    b_setnpcvisual(none_99701_DarkMaster, male, "Hum_Head_Psionic", face_n_corristo, bodytex_n, itar_stext_mage_novise);
    mdl_setmodelfatness(none_99701_DarkMaster, -0.5);
    mdl_applyoverlaymds(none_99701_DarkMaster, "Humans_Mage.mds");
    b_givenpctalents(none_99701_DarkMaster);
    b_setfightskills(none_99701_DarkMaster, 100);
    daily_routine = rtn_none_99701_DarkMaster;
};
func void rtn_none_99701_DarkMaster()
{
    ta_stand_armscrossed(8, 0, 23, 0, "NW_TAVERNE");
    ta_stand_armscrossed(23, 0, 8, 0, "NW_TAVERNE");
};

instance dia_none_99701_DarkMaster_hi(C_Info)
{
    npc = none_99701_DarkMaster;
    nr = 1;
    condition = dia_none_99701_DarkMaster_hi_condition;
    information = dia_none_99701_DarkMaster_hi_info;
    permanent = true;
    description = StExt_Str_DarkMaster_Hi;
};
func int dia_none_99701_DarkMaster_hi_condition() { return true; };
func void dia_none_99701_DarkMaster_hi_info()
{
    AI_Output(self, other, "DIA_StExt_DarkMaster_hi_01");
    if (StExt_ElementProfession_Chosen[StExt_MasteryIndex_Dark])
    {
        AI_Output(self, other, "DIA_StExt_DarkMaster_hi_already_01");
    }
    else if (!StExt_CanLearnElementProfession(StExt_MasteryIndex_Dark))
    {
        AI_Output(self, other, "DIA_StExt_DarkMaster_hi_slotsfull_01");
    }
    else
    {
        AI_Output(self, other, "DIA_StExt_DarkMaster_hi_quest_01");
    };
    ai_stopprocessinfos(self);
};

instance dia_none_99701_DarkMaster_turnin(C_Info)
{
    npc = none_99701_DarkMaster;
    nr = 2;
    condition = dia_none_99701_DarkMaster_turnin_condition;
    information = dia_none_99701_DarkMaster_turnin_info;
    permanent = false;
    description = StExt_Str_DarkMaster_Turnin;
};
func int dia_none_99701_DarkMaster_turnin_condition()
{
    if (!StExt_CanLearnElementProfession(StExt_MasteryIndex_Dark)) { return false; };
    return npc_hasitems(hero, itmi_darkpearl) >= 3;
};
func void dia_none_99701_DarkMaster_turnin_info()
{
    AI_Output(other, self, "DIA_StExt_DarkMaster_turnin_01");
    npc_removeinvitems(hero, itmi_darkpearl, 3);
    StExt_LearnElementProfession(StExt_MasteryIndex_Dark);
    log_createtopic(StExt_Topic_ElementDark, log_mission);
    log_settopicstatus(StExt_Topic_ElementDark, log_success);
    b_logentry(StExt_Topic_ElementDark, StExt_Str_ElementDark_LogEntry_Done);
    AI_Output(self, other, "DIA_StExt_DarkMaster_turnin_02");
    ai_stopprocessinfos(self);
};

instance dia_none_99701_DarkMaster_universal(C_Info)
{
    npc = none_99701_DarkMaster;
    nr = 3;
    condition = dia_none_99701_DarkMaster_universal_condition;
    information = dia_none_99701_DarkMaster_universal_info;
    permanent = true;
    description = StExt_Str_ElementProfession_UniversalOffer;
};
func int dia_none_99701_DarkMaster_universal_condition() { return !StExt_ElementProfession_IsUniversal; };
func void dia_none_99701_DarkMaster_universal_info()
{
    AI_Output(self, other, "DIA_StExt_ElementMaster_universal_01");
    StExt_LearnUniversalElementProfession();
    ai_stopprocessinfos(self);
};

instance dia_none_99701_DarkMaster_reset(C_Info)
{
    npc = none_99701_DarkMaster;
    nr = 4;
    condition = dia_none_99701_DarkMaster_reset_condition;
    information = dia_none_99701_DarkMaster_reset_info;
    permanent = true;
    description = StExt_Str_ElementProfession_ResetOffer;
};
func int dia_none_99701_DarkMaster_reset_condition() { return (StExt_ElementProfession_SlotsUsed() > 0) || StExt_ElementProfession_IsUniversal; };
func void dia_none_99701_DarkMaster_reset_info()
{
    AI_Output(self, other, "DIA_StExt_ElementMaster_reset_01");
    StExt_ResetElementProfession();
    ai_stopprocessinfos(self);
};

instance dia_none_99701_DarkMaster_exit(C_Info)
{
    npc = none_99701_DarkMaster;
    nr = 999;
    condition = dia_none_99701_DarkMaster_exit_condition;
    information = dia_none_99701_DarkMaster_exit_info;
    permanent = true;
    description = dialog_back;
};
func int dia_none_99701_DarkMaster_exit_condition() { return true; };
func void dia_none_99701_DarkMaster_exit_info() { ai_stopprocessinfos(self); };
