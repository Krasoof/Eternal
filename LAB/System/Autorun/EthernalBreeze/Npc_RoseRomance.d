
//===================================================================//
//		"Roza Khorinis" - romans (LAB, Scena 1: Spotkanie)			 //
//===================================================================//
// Proof pipeline'u voiced-dialogu: Adela w kaplicy przy Bigfarm (tej
// zakonnej - swiat sie zazebia ze Zakonem Dusz). AI_Output z nazwami OU
// wg konwencji DIA_STEXT_ROSE_<POSTAC>_<SCENA>_<NN>; wav-y generowane
// piperem (gosia/mc_speech) leza w docs/dubbing/rose/. Do uslyszenia
// w grze wymagana odbudowa OU (OUINFO.INF/OU.BIN/OU.CSL - patrz
// docs/DESIGN_RoseRomance.md sekcja 2) LUB zParserExtender z generacja OU.
// Napisy ASCII (bez ogonkow) - dubbing niesie diakrytyke.

instance vlk_99750_RoseAdela(npc_default)
{
    name = "Adela";
    guild = gil_none;
    id = 99750;
    voice = 17;
    flags = 0;
    npctype = npctype_main;
    level = 1;
    attribute[atr_hitpoints_max] = 500;
    attribute[atr_hitpoints] = 500;
    b_setnpcvisual(vlk_99750_RoseAdela, female, "Hum_Head_Babe", facebabe_n_anne, bodytexbabe_n, itar_vlkbabe_h);
    b_givenpctalents(vlk_99750_RoseAdela);
    daily_routine = rtn_vlk_99750_RoseAdela;
};
func void rtn_vlk_99750_RoseAdela()
{
	// noca modli sie w kaplicy, za dnia "znika w miescie" (stoi z boku)
	ta_stand_armscrossed(20, 0, 8, 0, "NW_BIGFARM_CHAPEL_03");
	ta_stand_armscrossed(8, 0, 20, 0, "NW_BIGFARM_CHAPEL_03");
};

//--------------------------------------------------------------
// *** Scena 1: Spotkanie (kaplica, noc) ***
//--------------------------------------------------------------
instance dia_vlk_99750_RoseAdela_Meet(c_info)
{
    npc = vlk_99750_RoseAdela;
    nr = 1;
    condition = dia_vlk_99750_RoseAdela_Meet_condition;
    information = dia_vlk_99750_RoseAdela_Meet_info;
    permanent = false;
    important = false;
    description = "Modlisz sie w srodku nocy?";
};
func int dia_vlk_99750_RoseAdela_Meet_condition() { return (StExt_Rose_Scene < 1); };
func void dia_vlk_99750_RoseAdela_Meet_info()
{
	AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_00");	// Modlisz sie w nocy. Sama. To odwaga albo rozpacz.
	AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_01");	// A ty podgladasz w nocy. Obcych. To ciekawosc albo zle zamiary.
	AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_02");	// Zwa mnie roznie. Bezimienny wystarczy.
	AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_03");	// Adela. Corka lorda Aldwina. Modle sie o cud. Ale cuda omijaja Khorinis.
	AI_Output(other, self, "DIA_STEXT_ROSE_HERO_MEET_04");	// Jaki cud?
	AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_05");	// Za miesiac wychodze za czlowieka, ktorego nienawidze. Sir Roderyk. Umowa ojca. Dlugi. Honor. Wybierz sobie slowo.
	AI_Output(self, other, "DIA_STEXT_ROSE_ADELA_MEET_06");	// Idz juz. Jesli Roderyk sie dowie, ze rozmawiam z obcym... on nie wybacza nawet cieniom.
	StExt_Rose_Scene = 1;
	ai_printbonus("Dziennik: Adela, corka lorda Aldwina - przymuszona do slubu z Sir Roderykiem.");
	ai_stopprocessinfos(self);
};
