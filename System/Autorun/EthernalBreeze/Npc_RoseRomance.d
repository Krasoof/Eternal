
//===================================================================//
//		"Roza Khorinis" - watek romantyczno-rycerski (voiced)		 //
//===================================================================//
// Fabularny watek (BEZ mechanik): rycerska milosc dworska. Budowany
// scena po scenie na galezi feature/rose-order. Kazda wypowiedziana
// linia = Output-Unit + plik glosu Sound\Speech\<OU>.wav (dubbing AI).
// Postep trzymamy w StExt_Rose_Stage.
//
// UWAGA: waypoint TYMCZASOWY (istniejace wnetrze), docelowo wlasny ZEN.

const int StExt_RoseStage_Start    = 0;	// przed poznaniem Adeli
const int StExt_RoseStage_Courting = 1;	// zaloty / dowody
const int StExt_RoseStage_Favor    = 2;	// zdobyta wstega
const int StExt_RoseStage_Rival    = 3;	// pojedynek z Roderykiem
const int StExt_RoseStage_Crisis   = 4;	// kryzys / ratunek
const int StExt_RoseStage_Finale   = 5;	// finał / wybor
const int StExt_RoseStage_Done     = 6;	// zamkniete

//--------------------------------------------------------------
// *** Dama Adela ***
//--------------------------------------------------------------
instance none_99730_Adela(npc_default)
{
    name        = StExt_Str_Rose_Adela_Name;
    guild       = gil_none;
    id          = 99730;
    voice       = 17;
    flags       = 0;
    npctype     = npctype_main;
    level       = 5;
    b_setattributestochapter(none_99730_Adela, 1);
    b_setnpcvisual(none_99730_Adela, female, "Hum_Head_Babe0", facebabe_n_youngblonde, bodytexbabe_n, itar_priscilla);
    mdl_setmodelfatness(none_99730_Adela, 0.0);
    mdl_applyoverlaymds(none_99730_Adela, "Humans_Babe.mds");
    b_givenpctalents(none_99730_Adela);
    daily_routine = rtn_none_99730_Adela;
};
func void rtn_none_99730_Adela()
{
    // TEMP: kaplica przy farmie (istniejacy waypoint). Docelowo dwor (ZEN).
    ta_stand_armscrossed(8, 0, 22, 0, "NW_BIGFARM_CHAPEL_03");
    ta_stand_armscrossed(22, 0, 8, 0, "NW_BIGFARM_CHAPEL_03");
};

//--------------------------------------------------------------
// *** Scena 1: Spotkanie ***
//--------------------------------------------------------------
instance dia_none_99730_Adela_Meet(c_info)
{
    npc         = none_99730_Adela;
    nr          = 1;
    condition   = dia_none_99730_Adela_Meet_condition;
    information = dia_none_99730_Adela_Meet_info;
    permanent   = false;
    description = StExt_Str_Rose_Adela_MeetOffer;
};
func int dia_none_99730_Adela_Meet_condition()
{
    return StExt_Rose_Stage == StExt_RoseStage_Start;
};
func void dia_none_99730_Adela_Meet_info()
{
    AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_00");  //Wybacz, pani. Nie chcialem przeszkadzac w modlitwie.
    AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_01"); //Modlitwa to jedyne, co mi jeszcze zostalo. Kim jestes, przybyszu?
    AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_02");  //Wedrowcem bez ziemi i pana. A ty niesiesz smutek jak ciezka zbroje.
    AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_03"); //Bystre oko. Za trzy dni oddadza mnie Sir Roderykowi. Nie z milosci - dla splaty dlugu mego ojca.
    AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_04");  //Trzy dni to duzo czasu dla kogos, kto umie trzymac miecz.
    AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_05"); //Slowa taniej niz stal, wedrowcze. Ale... gdybys mowil powaznie, wroc do mnie. Jestem Adela.

    Log_CreateTopic(StExt_Str_Rose_Topic, LOG_MISSION);
    Log_SetTopicStatus(StExt_Str_Rose_Topic, LOG_RUNNING);
    B_LogEntry(StExt_Str_Rose_Topic, StExt_Str_Rose_Log_Meet);

    StExt_Rose_Stage = StExt_RoseStage_Courting;
    ai_stopprocessinfos(self);
};

//--------------------------------------------------------------
// *** Wyjscie ***
//--------------------------------------------------------------
instance dia_none_99730_Adela_exit(c_info)
{
    npc         = none_99730_Adela;
    nr          = 999;
    condition   = dia_none_99730_Adela_exit_condition;
    information = dia_none_99730_Adela_exit_info;
    permanent   = true;
    description = dialog_back;
};
func int dia_none_99730_Adela_exit_condition() { return true; };
func void dia_none_99730_Adela_exit_info() { ai_stopprocessinfos(self); };
