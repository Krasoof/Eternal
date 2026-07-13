// ============================================================================
//  SZABLON: voiced NPC + scena dialogowa (watek "Roza Khorinis")
//  To jest WZORZEC referencyjny (lezy w docs/, NIE w .src - nie kompiluje sie).
//  Kopiujesz sekcje do Npc_RoseRomance.d i podmieniasz nazwy.
// ============================================================================
//
//  ZASADY:
//  - Kazda wypowiedziana linia = jedna Output-Unit (OU) + jeden plik .wav
//    o TEJ SAMEJ nazwie w _work\Data\Sound\Speech\<OU>.wav
//  - Bezimienny mowi:  AI_Output(other, self, "OU");  // other = bohater
//  - NPC mowi:         AI_Output(self, other, "OU");  // self  = ten NPC
//  - Napis po '//' to tekst, ktory karmi generator glosu (manifest OU.csv).
//  - Nazwy OU: DIA_STEXT_ROSE_<POSTAC>_<SCENA>_<NN>
//  - Postep watku trzymamy w jednej zmiennej-etapie: StExt_Rose_Stage.
//
// ----------------------------------------------------------------------------
//  1) NPC  (instancja postaci, wstawiana do swiata przez ModController)
// ----------------------------------------------------------------------------
instance none_99730_Adela(npc_default)
{
    name        = StExt_Str_Rose_Adela_Name;   // "Dama Adela"
    guild       = gil_none;
    id          = 99730;
    voice       = 17;                            // glos bazowy (fallback bez wav)
    flags       = 0;
    npctype     = npctype_main;
    level       = 5;
    b_setattributestochapter(none_99730_Adela, 1);
    // wizual: uzyj gotowego modelu szlachcianki z NB (przyklad):
    b_setnpcvisual(none_99730_Adela, female, "Hum_Head_Babe", face_n_carol, bodytex_n, itar_vlk_l);
    mdl_setmodelfatness(none_99730_Adela, 0.0);
    mdl_applyoverlaymds(none_99730_Adela, "Humans_Babe.mds");
    b_givenpctalents(none_99730_Adela);
    daily_routine = rtn_none_99730_Adela;
};
// rutyna = gdzie stoi. Na start ISTNIEJACY waypoint (bez nowej lokacji).
func void rtn_none_99730_Adela()
{
    ta_stand_armscrossed(8, 0, 22, 0, "NW_CITY_CANYON_TO_UPPERTOWN");  // <- podmienic na wybrany
    ta_sleep(22, 0, 8, 0, "NW_CITY_CANYON_TO_UPPERTOWN");
};

// ----------------------------------------------------------------------------
//  2) SCENA (dialog gated etapem watku)  -- przyklad: Scena 1 "Spotkanie"
// ----------------------------------------------------------------------------
instance dia_none_99730_Adela_Meet(c_info)
{
    npc         = none_99730_Adela;
    nr          = 1;
    condition   = dia_none_99730_Adela_Meet_condition;
    information = dia_none_99730_Adela_Meet_info;
    permanent   = false;                          // scena jednorazowa
    description = StExt_Str_Rose_Adela_MeetOffer; // "Wybacz, pani..."
};
func int dia_none_99730_Adela_Meet_condition()
{
    return StExt_Rose_Stage == StExt_RoseStage_Start;   // gate etapem
};
func void dia_none_99730_Adela_Meet_info()
{
    AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_00");  //Bezimienny: Wybacz, pani. Nie chcialem przeszkadzac w modlitwie.
    AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_01"); //Adela: Modlitwa to jedyne, co mi jeszcze zostalo. Kim jestes, przybyszu?
    AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_02");  //Bezimienny: Wedrowcem. A ty niesiesz smutek jak ciezka zbroje.
    AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_03"); //Adela: Za trzy dni oddadza mnie Sir Roderykowi. Nie z milosci - z dlugu.

    // wpis do dziennika (misja)
    Log_CreateTopic(StExt_Str_Rose_Topic, LOG_MISSION);
    Log_SetTopicStatus(StExt_Str_Rose_Topic, LOG_RUNNING);
    B_LogEntry(StExt_Str_Rose_Topic, StExt_Str_Rose_Log_Meet);

    StExt_Rose_Stage = StExt_RoseStage_Courting;   // pchamy watek dalej
    ai_stopprocessinfos(self);
};

// ----------------------------------------------------------------------------
//  3) Manifest OU dla tej sceny (do docs/RoseRomance_OU.csv):
//     OU_NAME ; MOWCA ; KWESTIA
//     DIA_STEXT_ROSE_HERO_MEET_00 ; Bezimienny ; Wybacz, pani...
//     DIA_STEXT_ROSE_ADELA_MEET_01 ; Adela ; Modlitwa to jedyne...
//     ... (generujemy wav dla kazdej linii, nazwa pliku = OU_NAME.wav)
// ----------------------------------------------------------------------------
//  4) Zmienne/stringi do zadeklarowania osobno:
//     GlobalVars:  var int StExt_Rose_Stage;
//     Constants:   const int StExt_RoseStage_Start = 0; _Courting = 1; ...
//     Localization: StExt_Str_Rose_* (nazwa, oferty, napisy logu) - ASCII!
//     ModController: jednorazowy spawn none_99730_Adela na wybranym waypoint.
//     .src: dodac EthernalBreeze\Npc_RoseRomance.d (po Npc_ZakonBosses.d).
// ============================================================================
