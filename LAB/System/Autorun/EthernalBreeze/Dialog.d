func int StExt_ModMenuDia_Condition() { return StExt_DisplayModMenu; };

instance Dia_StExt_ModMenu_ExitDialog(c_info) 
{
    npc = pc_hero;
    condition = StExt_ModMenuDia_Condition;
    information = Dia_StExt_ModMenu_ExitDialog_info;
    important = false;
    permanent = true;
    nr = 999;
    description = dialog_ende;
};
func void Dia_StExt_ModMenu_ExitDialog_info() 
{
    StExt_DisplayModMenu = false;
	StExt_EnableUiMoving(StExt_Null);
	StExt_EnableConfigValueEdit(StExt_EmptyString, StExt_EmptyString, StExt_Null);
	ai_stopprocessinfos(hero);	
};

func int StExt_ModMenuDia_Condition() { return StExt_DisplayModMenu; };

instance Dia_StExt_ModMenu_AcceptHelpDialog(c_info) 
{
    npc = pc_hero;
    condition = Dia_StExt_ModMenu_AcceptHelpDialog_condition;
    information = Dia_StExt_ModMenu_AcceptHelpDialog_info;
    important = false;
    permanent = true;
    nr = 0;
    description = StExt_Str_AcceptHelp;
};
func int Dia_StExt_ModMenu_AcceptHelpDialog_condition() { return (StExt_DisplayModMenu && !StExt_ModHelpAccepted); };
func void Dia_StExt_ModMenu_AcceptHelpDialog_info() 
{
	StExt_ModHelpAccepted = true;
    Dia_StExt_ModMenu_ExitDialog_info();
};

//--------------------------------------------------------------
// 				*** Mod configs menu ***
//--------------------------------------------------------------

instance Dia_StExt_ModMenu_Configs(c_info) 
{
    npc = pc_hero;
    condition = StExt_ModMenuDia_Condition;
    information = Dia_StExt_ModMenu_Configs_info;
    important = false;
    permanent = true;
    nr = 900;
    description = StExt_Str_ModMenu_Configs;
};

func void Dia_StExt_ModMenu_Configs_info() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_Null);
	StExt_EnableConfigValueEdit(StExt_EmptyString, StExt_EmptyString, StExt_Null);
	StExt_CurrentEditValueSection = StExt_EmptyString;
	
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, StExt_DisplayModMenu_Configs_back);

	if (!StExt_Config_DebugAlwaysEnabled) {
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_DebugEnabled, Dia_StExt_ModMenu_Configs_DebugEnabled);
	};	
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_ExportCurrentConfigs, Dia_StExt_ModMenu_ExportCurrentConfigs); 
	if (!StExt_LockConfigs) 
	{ 
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_PresetsSection, Dia_StExt_ModMenu_PresetsSection); 
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_ItemGeneratorPresetsSection, Dia_StExt_ModMenu_ItemGeneratorPresetsSection); 
	};
	
	// ui settings
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Ui_Header, Dia_StExt_ModMenu_Configs_UiSettings);
	// misc settings
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Misk_Header, Dia_StExt_ModMenu_Configs_MiskSettings);
	if (!StExt_LockConfigs)
	{
		// randomization settings	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Header, Dia_StExt_ModMenu_Configs_RandomizationSettings);	
		// luck settings
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_Header, Dia_StExt_ModMenu_Configs_LuckSettings);	
		// npc settings
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Header, Dia_StExt_ModMenu_Configs_NpcSettings);	
		// diff settings
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Header, Dia_StExt_ModMenu_Configs_DiffSettings);
	};
};

func void StExt_DisplayModMenu_Configs_back() 
{
	StExt_EnableUiMoving(StExt_Null);
	StExt_EnableConfigValueEdit(StExt_EmptyString, StExt_EmptyString, StExt_Null);
    info_clearchoices(Dia_StExt_ModMenu_Configs);
};

var string StExt_BuildValueChangeMenu_Option;
var string StExt_BuildValueChangeMenu_OptionDesc;
var int StExt_BuildValueChangeMenu_Step;

func void StExt_BuildValueChangeMenu(var string option, var string optionDesc, var int step)
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	if (StExt_EnableConfigValueEdit(option, optionDesc, step))
	{
		StExt_BuildValueChangeMenu_Step = StExt_ConfigValueEditStep;
		StExt_BuildValueChangeMenu_Option = option;
		StExt_BuildValueChangeMenu_OptionDesc = optionDesc;

		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ValueEdit_Zero, StExt_BuildValueChangeMenu_Zero);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ValueEdit_Min, StExt_BuildValueChangeMenu_Min);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ValueEdit_Max, StExt_BuildValueChangeMenu_Max);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ValueEdit_No, StExt_BuildValueChangeMenu_Cancel);
	};	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ValueEdit_Yes, StExt_BuildValueChangeMenu_Back);
};

func void StExt_BuildValueChangeMenu_Back()
{
	StExt_EnableUiMoving(StExt_Null);
	StExt_EnableConfigValueEdit(StExt_EmptyString, StExt_EmptyString, StExt_Null);
    info_clearchoices(Dia_StExt_ModMenu_Configs);
	if (StExt_TryCallFunc(StExt_CurrentEditValueSection) == false) { Dia_StExt_ModMenu_Configs_info(); };
};

func void StExt_BuildValueChangeMenu_Cancel()
{
	StExt_CancelEditValueChanges();
	StExt_BuildValueChangeMenu(StExt_BuildValueChangeMenu_Option, StExt_BuildValueChangeMenu_OptionDesc, StExt_BuildValueChangeMenu_Step);
};

func void StExt_BuildValueChangeMenu_Zero()
{
	StExt_SetCurrentEditValue(0);
	StExt_BuildValueChangeMenu(StExt_BuildValueChangeMenu_Option, StExt_BuildValueChangeMenu_OptionDesc, StExt_BuildValueChangeMenu_Step);
};

func void StExt_BuildValueChangeMenu_Max()
{
	StExt_ChangeCurrentEditValue(9999);
	StExt_BuildValueChangeMenu(StExt_BuildValueChangeMenu_Option, StExt_BuildValueChangeMenu_OptionDesc, StExt_BuildValueChangeMenu_Step);
};

func void StExt_BuildValueChangeMenu_Min()
{
	StExt_ChangeCurrentEditValue(-9999);
	StExt_BuildValueChangeMenu(StExt_BuildValueChangeMenu_Option, StExt_BuildValueChangeMenu_OptionDesc, StExt_BuildValueChangeMenu_Step);
};

func void StExt_ChangeModConfig_BoolOption(var string option)
{
	var int parserId;
	var int symbolId;
	var int val;
	var string text;
	if (StExt_StringIsEmpty(option))
	{
		StExt_PrintDebug("StExt_ChangeModConfigOption(var string option)", "option string is null or empty!", self, other);
		return;
	};
	
	parserId = Par_GetParserID("Game");
	symbolId = Par_GetSymbolID(parserId, option);
	if (symbolId == StExt_Null)
	{
		StExt_PrintDebug("StExt_ChangeModConfigOption(var string option)", concatstrings("option symbolId is null! SymId: ", inttostring(symbolId)), self, other);
		return;
	};
	val = Par_GetSymbolValueInt(parserId, symbolId);
	option = StExt_TryGetValueName(option);
	text = concatstrings("StExt: ", option);
	text = concatstrings(text, " - ");
	if(val) 
	{ 
		val = false; 
		text = concatstrings(text, "OFF");
		ai_printred(text);
	}
	else 
	{ 
		val = true; 
		text = concatstrings(text, "ON");
		ai_printbonus(text);
	};
	Par_SetSymbolValueInt(val, parserId, symbolId);
	if (StExt_TryCallFunc(StExt_CurrentEditValueSection) == false) { Dia_StExt_ModMenu_Configs_info(); };
};

// Implement it here because dependency 
func event OnAuraCastKeyPress() { StExt_ChangeModConfig_BoolOption("StExt_DoCastAuras"); };

func void Dia_StExt_ModMenu_Configs_DebugEnabled() { StExt_ChangeModConfig_BoolOption("StExt_Config_DebugEnabled"); };
func void Dia_StExt_ModMenu_Configs_ShowNpcLevel() { StExt_ChangeModConfig_BoolOption("StExt_Config_ShowNpcLevel"); };
func void Dia_StExt_ModMenu_Configs_DisplayLuckMessage() { StExt_ChangeModConfig_BoolOption("StExt_Config_DisplayLuckMessage"); };
func void Dia_StExt_ModMenu_Configs_DisplayMasteryLevelUp() { StExt_ChangeModConfig_BoolOption("StExt_Config_DisplayMasteryLevelUp"); };

func void Dia_StExt_ModMenu_Configs_Aura_DisplayOnScreen() { StExt_ChangeModConfig_BoolOption("StExt_Config_Aura_DisplayOnScreen"); };
func void Dia_StExt_ModMenu_Configs_Alch_DisplayOnScreen() { StExt_ChangeModConfig_BoolOption("StExt_Config_Alch_DisplayOnScreen"); };
func void Dia_StExt_ModMenu_Configs_Artifact_DisplayOnScreen() { StExt_ChangeModConfig_BoolOption("StExt_Config_Artifact_DisplayOnScreen"); };
func void Dia_StExt_ModMenu_Configs_Artifact_ShowExpMessage() { StExt_ChangeModConfig_BoolOption("StExt_Config_Artifact_ShowExpMessage"); };
func void Dia_StExt_ModMenu_Configs_EsBar_DefaultPos() 
{
	StExt_EnableUiMoving(StExt_Null);
	StExt_ChangeModConfig_BoolOption("StExt_Config_EsBar_DefaultPos"); 
};

// Aura ui sub menu
func void Dia_StExt_ModMenu_Configs_Aura() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_UiIndex_Aura);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_UiSettings);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_Aura_DisplayOnScreen, Dia_StExt_ModMenu_Configs_Aura_DisplayOnScreen);
};

// Items info ui sub menu
func void Dia_StExt_ModMenu_Configs_ItemMenu() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_UiIndex_ItemMenu);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_UiSettings);	
};

// Alchemy ui sub menu
func void Dia_StExt_ModMenu_Configs_Alch() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_UiIndex_Alchemy);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_UiSettings);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_Alch_DisplayOnScreen, Dia_StExt_ModMenu_Configs_Alch_DisplayOnScreen);
};

// Artifact ui sub menu
func void Dia_StExt_ModMenu_Configs_Artifact() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_UiIndex_Artifact);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_UiSettings);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_Artifact_DisplayOnScreen, Dia_StExt_ModMenu_Configs_Artifact_DisplayOnScreen);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Artifact_ShowExpMessage, Dia_StExt_ModMenu_Configs_Artifact_ShowExpMessage);
};

// EsBar ui sub menu
func void Dia_StExt_ModMenu_Configs_EsBar() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_UiIndex_EsBar);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_UiSettings);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_EsBar_DefaultPos, Dia_StExt_ModMenu_Configs_EsBar_DefaultPos);
};

// EsBar ui sub menu
func void Dia_StExt_ModMenu_Configs_MsgTray() 
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	StExt_EnableUiMoving(StExt_UiIndex_MsgTray);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_UiSettings);
};

// Diff settings sub menu
func void Dia_StExt_ModMenu_Configs_DiffSettings() 
{
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_Configs_DiffSettings";
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_Duplication_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Count, Dia_StExt_ModMenu_Diff_Kapitel_Npc_Duplication_Count);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_MagicInfusion_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Power, Dia_StExt_ModMenu_Diff_Kapitel_Npc_MagicInfusion_Power);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomRangeWeapon_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_RandomShield_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomShield_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_RandomHelm_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomHelm_Chance);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_RandomScroll_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomScroll_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Npc_HealingScroll_Chance, Dia_StExt_ModMenu_Diff_Kapitel_Npc_HealingScroll_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_DailyHpMod, Dia_StExt_ModMenu_Diff_Kapitel_DailyHpMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_DailyPowerMod, Dia_StExt_ModMenu_Diff_Kapitel_DailyPowerMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_DailyProtMod, Dia_StExt_ModMenu_Diff_Kapitel_DailyProtMod);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Speed, Dia_StExt_ModMenu_Diff_Kapitel_Speed);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Prot, Dia_StExt_ModMenu_Diff_Kapitel_Prot);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Hp, Dia_StExt_ModMenu_Diff_Kapitel_Hp);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Kapitel_Power, Dia_StExt_ModMenu_Diff_Kapitel_Power);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_EnableKapitel, Dia_StExt_ModMenu_Diff_EnableKapitel);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Daily_Prot, Dia_StExt_ModMenu_Diff_Daily_Prot);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Daily_Hp, Dia_StExt_ModMenu_Diff_Daily_Hp);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Daily_Power, Dia_StExt_ModMenu_Diff_Daily_Power);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_EnableDaily, Dia_StExt_ModMenu_Diff_EnableDaily);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Static_Prot, Dia_StExt_ModMenu_Diff_Static_Prot);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Static_Hp, Dia_StExt_ModMenu_Diff_Static_Hp);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Static_Power, Dia_StExt_ModMenu_Diff_Static_Power);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_EnableStatic, Dia_StExt_ModMenu_Diff_EnableStatic);	
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_DuplicationChance, Dia_StExt_ModMenu_Diff_Level_DuplicationChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_CorruptionChance, Dia_StExt_ModMenu_Diff_Level_CorruptionChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_MagicInfusionChance, Dia_StExt_ModMenu_Diff_Level_MagicInfusionChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_MagicInfusionPower, Dia_StExt_ModMenu_Diff_Level_MagicInfusionPower);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_Speed, Dia_StExt_ModMenu_Diff_Level_Speed);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_Prot, Dia_StExt_ModMenu_Diff_Level_Prot);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_Hp, Dia_StExt_ModMenu_Diff_Level_Hp);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_Level_Power, Dia_StExt_ModMenu_Diff_Level_Power);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_EnableLevel, Dia_StExt_ModMenu_Diff_EnableLevel);	
};

func void Dia_StExt_ModMenu_Diff_EnableStatic() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableStatic"); };
func void Dia_StExt_ModMenu_Diff_EnableDaily() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableDaily"); };
func void Dia_StExt_ModMenu_Diff_EnableKapitel() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableKapitel"); };
func void Dia_StExt_ModMenu_Diff_EnableRot() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableRot"); };
func void Dia_StExt_ModMenu_Diff_EnableRot_NightEncounters() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableRot_NightEncounters"); };
func void Dia_StExt_ModMenu_Diff_EnableRot_Avengers() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableRot_Avengers"); };
func void Dia_StExt_ModMenu_Diff_EnableRot_Bandits() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableRot_Bandits"); };
func void Dia_StExt_ModMenu_Diff_EnableLevel() { StExt_ChangeModConfig_BoolOption("StExt_Config_Diff_EnableLevel"); };


func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_MagicInfusion_Power() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Power", StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Power, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance", StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance, 1); };
func void Dia_StExt_ModMenu_Diff_Level_Power() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_Power", StExt_Str_Config_Diff_Level_Power, 1); };
func void Dia_StExt_ModMenu_Diff_Level_Hp() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_Hp", StExt_Str_Config_Diff_Level_Hp, 1); };
func void Dia_StExt_ModMenu_Diff_Level_Prot() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_Prot", StExt_Str_Config_Diff_Level_Prot, 1); };
func void Dia_StExt_ModMenu_Diff_Level_Speed() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_Speed", StExt_Str_Config_Diff_Level_Speed, 1); };
func void Dia_StExt_ModMenu_Diff_Level_DuplicationChance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_DuplicationChance", StExt_Str_Config_Diff_Level_DuplicationChance, 1); };
func void Dia_StExt_ModMenu_Diff_Level_CorruptionChance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_CorruptionChance", StExt_Str_Config_Diff_Level_CorruptionChance, 1); };
func void Dia_StExt_ModMenu_Diff_Level_MagicInfusionChance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_MagicInfusionChance", StExt_Str_Config_Diff_Level_MagicInfusionChance, 1); };
func void Dia_StExt_ModMenu_Diff_Level_MagicInfusionPower() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Level_MagicInfusionPower", StExt_Str_Config_Diff_Level_MagicInfusionPower, 1); };

func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomShield_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_RandomShield_Chance", StExt_Str_Config_Diff_Kapitel_Npc_RandomShield_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomHelm_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_RandomHelm_Chance", StExt_Str_Config_Diff_Kapitel_Npc_RandomHelm_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Static_Power() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Static_Power", StExt_Str_Config_Diff_Static_Power, 1); };
func void Dia_StExt_ModMenu_Diff_Static_Hp() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Static_Hp", StExt_Str_Config_Diff_Static_Hp, 1); };
func void Dia_StExt_ModMenu_Diff_Static_Prot() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Static_Prot", StExt_Str_Config_Diff_Static_Prot, 1); };
func void Dia_StExt_ModMenu_Diff_Daily_Power() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Daily_Power", StExt_Str_Config_Diff_Daily_Power, 1); };
func void Dia_StExt_ModMenu_Diff_Daily_Hp() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Daily_Hp", StExt_Str_Config_Diff_Daily_Hp, 1); };
func void Dia_StExt_ModMenu_Diff_Daily_Prot() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Daily_Prot", StExt_Str_Config_Diff_Daily_Prot, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Power() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Power", StExt_Str_Config_Diff_Kapitel_Power, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Hp() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Hp", StExt_Str_Config_Diff_Kapitel_Hp, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Prot() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Prot", StExt_Str_Config_Diff_Kapitel_Prot, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Speed() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Speed", StExt_Str_Config_Diff_Kapitel_Speed, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_Duplication_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_Duplication_Chance", StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_Duplication_Count() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_Duplication_Count", StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Count, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_MagicInfusion_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_MagicInfusion_Chance", StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance", StExt_Str_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomRangeWeapon_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance", StExt_Str_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_RandomScroll_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_RandomScroll_Chance", StExt_Str_Config_Diff_Kapitel_Npc_RandomScroll_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_Npc_HealingScroll_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_Npc_HealingScroll_Chance", StExt_Str_Config_Diff_Kapitel_Npc_HealingScroll_Chance, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_DailyHpMod() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_DailyHpMod", StExt_Str_Config_Diff_Kapitel_DailyHpMod, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_DailyPowerMod() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_DailyPowerMod", StExt_Str_Config_Diff_Kapitel_DailyPowerMod, 1); };
func void Dia_StExt_ModMenu_Diff_Kapitel_DailyProtMod() { StExt_BuildValueChangeMenu("StExt_Config_Diff_Kapitel_DailyProtMod", StExt_Str_Config_Diff_Kapitel_DailyProtMod, 1); };

// Npc settings sub menu
func void Dia_StExt_ModMenu_Configs_NpcSettings() 
{
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_Configs_NpcSettings";
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_StatsRandomization_Damage, Dia_StExt_ModMenu_Npc_StatsRandomization_Damage);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_StatsRandomization_Protection, Dia_StExt_ModMenu_Npc_StatsRandomization_Protection);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_StatsRandomization_Stats, Dia_StExt_ModMenu_Npc_StatsRandomization_Stats);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_StatsRandomization_Hp, Dia_StExt_ModMenu_Npc_StatsRandomization_Hp);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_EnableStatsRandomization, Dia_StExt_ModMenu_Npc_EnableStatsRandomization);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_LevelBonus_Damage, Dia_StExt_ModMenu_Npc_LevelBonus_Damage);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_LevelBonus_Protection, Dia_StExt_ModMenu_Npc_LevelBonus_Protection);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_LevelBonus_Stats, Dia_StExt_ModMenu_Npc_LevelBonus_Stats);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_LevelBonus_Hp, Dia_StExt_ModMenu_Npc_LevelBonus_Hp);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_EnableLevelBonus, Dia_StExt_ModMenu_Npc_EnableLevelBonus);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_LevelThreshold, Dia_StExt_ModMenu_Npc_Duplication_LevelThreshold);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_CountMin, Dia_StExt_ModMenu_Npc_Duplication_CountMin);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_CountMax, Dia_StExt_ModMenu_Npc_Duplication_CountMax);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_Chance, Dia_StExt_ModMenu_Npc_Duplication_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_AllowBosses, Dia_StExt_ModMenu_Npc_Duplication_AllowBosses);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_AllowHumansBandits, Dia_StExt_ModMenu_Npc_Duplication_AllowHumansBandits);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_Duplication_AllowHumans, Dia_StExt_ModMenu_Npc_Duplication_AllowHumans);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_EnableDuplication, Dia_StExt_ModMenu_Npc_EnableDuplication);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_CorruptionChance, Dia_StExt_ModMenu_Npc_MagicInfusion_CorruptionChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_LevelThreshold, Dia_StExt_ModMenu_Npc_MagicInfusion_LevelThreshold);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_PowerMod, Dia_StExt_ModMenu_Npc_MagicInfusion_PowerMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_Chance, Dia_StExt_ModMenu_Npc_MagicInfusion_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_AllowHumans, Dia_StExt_ModMenu_Npc_MagicInfusion_AllowHumans);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_AllowBosses, Dia_StExt_ModMenu_Npc_MagicInfusion_AllowBosses);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_EnableMagicInfusion, Dia_StExt_ModMenu_Npc_EnableMagicInfusion);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusedAlwaysHasRandomEquipment, Dia_StExt_ModMenu_Npc_MagicInfusedAlwaysHasRandomEquipment);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_SummonsCanHaveOwnSummons, Dia_StExt_ModMenu_Npc_SummonsCanHaveOwnSummons);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_CantUseSpellAbilities, Dia_StExt_ModMenu_Npc_CantUseSpellAbilities);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_CantUseBuffAbilities, Dia_StExt_ModMenu_Npc_CantUseBuffAbilities);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_CantUseSummonAbilities, Dia_StExt_ModMenu_Npc_CantUseSummonAbilities);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_RandomHelm_Chance, Dia_StExt_ModMenu_Npc_RandomHelm_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_RandomShield_Chance, Dia_StExt_ModMenu_Npc_RandomShield_Chance);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_RandomMeleeWeapon_Chance, Dia_StExt_ModMenu_Npc_RandomMeleeWeapon_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_RandomRangeWeapon_Chance, Dia_StExt_ModMenu_Npc_RandomRangeWeapon_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_RandomScroll_Chance, Dia_StExt_ModMenu_Npc_RandomScroll_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_HealingScroll_Chance, Dia_StExt_ModMenu_Npc_HealingScroll_Chance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_EnableRandomEquipment, Dia_StExt_ModMenu_Npc_EnableRandomEquipment);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_LuckyFlagChance, Dia_StExt_ModMenu_Npc_LuckyFlagChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_RichFlagChance, Dia_StExt_ModMenu_Npc_RichFlagChance);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_GlobalHpMult, Dia_StExt_ModMenu_Npc_GlobalHpMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_GlobalStatMult, Dia_StExt_ModMenu_Npc_GlobalStatMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_GlobalProtMult, Dia_StExt_ModMenu_Npc_GlobalProtMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_GlobalDamMult, Dia_StExt_ModMenu_Npc_GlobalDamMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_GlobalEsMult, Dia_StExt_ModMenu_Npc_GlobalEsMult);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_InfusionHpMult, Dia_StExt_ModMenu_Npc_InfusionHpMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_InfusionEsMult, Dia_StExt_ModMenu_Npc_InfusionEsMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_InfusionStatMult, Dia_StExt_ModMenu_Npc_InfusionStatMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_InfusionProtMult, Dia_StExt_ModMenu_Npc_InfusionProtMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_InfusionDamMult, Dia_StExt_ModMenu_Npc_InfusionDamMult);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_HumansExtraChance, Dia_StExt_ModMenu_Npc_Infusion_HumansExtraChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Npc_MagicInfusion_BossesExtraChance, Dia_StExt_ModMenu_Npc_Infusion_BossesExtraChance);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Sum_GlobalHpMult, Dia_StExt_ModMenu_Sum_GlobalHpMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Sum_GlobalStatMult, Dia_StExt_ModMenu_Sum_GlobalStatMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Sum_GlobalProtMult, Dia_StExt_ModMenu_Sum_GlobalProtMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Sum_GlobalDamMult, Dia_StExt_ModMenu_Sum_GlobalDamMult);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_GlobalHpMult, Dia_StExt_ModMenu_NpcSum_GlobalHpMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_GlobalStatMult, Dia_StExt_ModMenu_NpcSum_GlobalStatMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_GlobalProtMult, Dia_StExt_ModMenu_NpcSum_GlobalProtMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_GlobalDamMult, Dia_StExt_ModMenu_NpcSum_GlobalDamMult);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_GlobalEsMult, Dia_StExt_ModMenu_NpcSum_GlobalEsMult);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_CanBeDuplicated, Dia_StExt_ModMenu_NpcSum_CanBeDuplicated);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcSum_CanBeInfused, Dia_StExt_ModMenu_NpcSum_CanBeInfused);
};

func void Dia_StExt_ModMenu_Npc_EnableStatsRandomization() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_EnableStatsRandomization"); };
func void Dia_StExt_ModMenu_Npc_EnableLevelBonus() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_EnableLevelBonus"); };
func void Dia_StExt_ModMenu_Npc_EnableDuplication() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_EnableDuplication"); };
func void Dia_StExt_ModMenu_Npc_EnableMagicInfusion() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_EnableMagicInfusion"); };
func void Dia_StExt_ModMenu_Npc_EnableRandomEquipment() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_EnableRandomEquipment"); };
func void Dia_StExt_ModMenu_Npc_MagicInfusedAlwaysHasRandomEquipment() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_MagicInfusedAlwaysHasRandomEquipment"); };
func void Dia_StExt_ModMenu_Npc_SummonsCanHaveOwnSummons() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_SummonsCanHaveOwnSummons"); };
func void Dia_StExt_ModMenu_Npc_CantUseSpellAbilities() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_CantUseSpellAbilities"); };
func void Dia_StExt_ModMenu_Npc_CantUseBuffAbilities() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_CantUseBuffAbilities"); };
func void Dia_StExt_ModMenu_Npc_CantUseSummonAbilities() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_CantUseSummonAbilities"); };
func void Dia_StExt_ModMenu_Npc_MagicInfusion_AllowHumans() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_MagicInfusion_AllowHumans"); };
func void Dia_StExt_ModMenu_Npc_MagicInfusion_AllowBosses() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_MagicInfusion_AllowBosses"); };
func void Dia_StExt_ModMenu_Npc_Duplication_AllowBosses() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_Duplication_AllowBosses"); };
func void Dia_StExt_ModMenu_Npc_Duplication_AllowHumans() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_Duplication_AllowHumans"); };
func void Dia_StExt_ModMenu_Npc_Duplication_AllowHumansBandits() { StExt_ChangeModConfig_BoolOption("StExt_Config_Npc_Duplication_AllowHumansBandits"); };
func void Dia_StExt_ModMenu_NpcSum_CanBeDuplicated() { StExt_ChangeModConfig_BoolOption("StExt_Config_NpcSum_CanBeDuplicated"); };
func void Dia_StExt_ModMenu_NpcSum_CanBeInfused() { StExt_ChangeModConfig_BoolOption("StExt_Config_NpcSum_CanBeInfused"); };

func void Dia_StExt_ModMenu_Npc_RandomHelm_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_RandomHelm_Chance", StExt_Str_Config_Npc_RandomHelm_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_RandomShield_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_RandomShield_Chance", StExt_Str_Config_Npc_RandomShield_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_StatsRandomization_Hp() { StExt_BuildValueChangeMenu("StExt_Config_Npc_StatsRandomization_Hp", StExt_Str_Config_Npc_StatsRandomization_Hp, 1); };
func void Dia_StExt_ModMenu_Npc_StatsRandomization_Stats() { StExt_BuildValueChangeMenu("StExt_Config_Npc_StatsRandomization_Stats", StExt_Str_Config_Npc_StatsRandomization_Stats, 1); };
func void Dia_StExt_ModMenu_Npc_StatsRandomization_Protection() { StExt_BuildValueChangeMenu("StExt_Config_Npc_StatsRandomization_Protection", StExt_Str_Config_Npc_StatsRandomization_Protection, 1); };
func void Dia_StExt_ModMenu_Npc_StatsRandomization_Damage() { StExt_BuildValueChangeMenu("StExt_Config_Npc_StatsRandomization_Damage", StExt_Str_Config_Npc_StatsRandomization_Damage, 1); };
func void Dia_StExt_ModMenu_Npc_LevelBonus_Hp() { StExt_BuildValueChangeMenu("StExt_Config_Npc_LevelBonus_Hp", StExt_Str_Config_Npc_LevelBonus_Hp, 1); };
func void Dia_StExt_ModMenu_Npc_LevelBonus_Stats() { StExt_BuildValueChangeMenu("StExt_Config_Npc_LevelBonus_Stats", StExt_Str_Config_Npc_LevelBonus_Stats, 1); };
func void Dia_StExt_ModMenu_Npc_LevelBonus_Protection() { StExt_BuildValueChangeMenu("StExt_Config_Npc_LevelBonus_Protection", StExt_Str_Config_Npc_LevelBonus_Protection, 1); };
func void Dia_StExt_ModMenu_Npc_LevelBonus_Damage() { StExt_BuildValueChangeMenu("StExt_Config_Npc_LevelBonus_Damage", StExt_Str_Config_Npc_LevelBonus_Damage, 1); };
func void Dia_StExt_ModMenu_Npc_Duplication_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_Duplication_Chance", StExt_Str_Config_Npc_Duplication_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_Duplication_CountMin() { StExt_BuildValueChangeMenu("StExt_Config_Npc_Duplication_CountMin", StExt_Str_Config_Npc_Duplication_CountMin, 1); };
func void Dia_StExt_ModMenu_Npc_Duplication_CountMax() { StExt_BuildValueChangeMenu("StExt_Config_Npc_Duplication_CountMax", StExt_Str_Config_Npc_Duplication_CountMax, 1); };
func void Dia_StExt_ModMenu_Npc_Duplication_LevelThreshold() { StExt_BuildValueChangeMenu("StExt_Config_Npc_Duplication_LevelThreshold", StExt_Str_Config_Npc_Duplication_LevelThreshold, 1); };
func void Dia_StExt_ModMenu_Npc_MagicInfusion_PowerMod() { StExt_BuildValueChangeMenu("StExt_Config_Npc_MagicInfusion_PowerMod", StExt_Str_Config_Npc_MagicInfusion_PowerMod, 1); };
func void Dia_StExt_ModMenu_Npc_MagicInfusion_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_MagicInfusion_Chance", StExt_Str_Config_Npc_MagicInfusion_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_MagicInfusion_LevelThreshold() { StExt_BuildValueChangeMenu("StExt_Config_Npc_MagicInfusion_LevelThreshold", StExt_Str_Config_Npc_MagicInfusion_LevelThreshold, 1); };
func void Dia_StExt_ModMenu_Npc_RandomMeleeWeapon_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_RandomMeleeWeapon_Chance", StExt_Str_Config_Npc_RandomMeleeWeapon_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_RandomRangeWeapon_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_RandomRangeWeapon_Chance", StExt_Str_Config_Npc_RandomRangeWeapon_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_RandomScroll_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_RandomScroll_Chance", StExt_Str_Config_Npc_RandomScroll_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_HealingScroll_Chance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_HealingScroll_Chance", StExt_Str_Config_Npc_HealingScroll_Chance, 1); };
func void Dia_StExt_ModMenu_Npc_MagicInfusion_CorruptionChance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_MagicInfusion_CorruptionChance", StExt_Str_Config_Npc_MagicInfusion_CorruptionChance, 1); };
func void Dia_StExt_ModMenu_Npc_LuckyFlagChance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_LuckyFlagChance", StExt_Str_Config_Npc_LuckyFlagChance, 1); };
func void Dia_StExt_ModMenu_Npc_RichFlagChance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_RichFlagChance", StExt_Str_Config_Npc_RichFlagChance, 1); };
func void Dia_StExt_ModMenu_Npc_GlobalHpMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_GlobalHpMult", StExt_Str_Config_Npc_GlobalHpMult, 1); };
func void Dia_StExt_ModMenu_Npc_GlobalEsMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_GlobalEsMult", StExt_Str_Config_Npc_GlobalEsMult, 1); };
func void Dia_StExt_ModMenu_Npc_GlobalStatMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_GlobalStatMult", StExt_Str_Config_Npc_GlobalStatMult, 1); };
func void Dia_StExt_ModMenu_Npc_GlobalProtMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_GlobalProtMult", StExt_Str_Config_Npc_GlobalProtMult, 1); };
func void Dia_StExt_ModMenu_Npc_GlobalDamMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_GlobalDamMult", StExt_Str_Config_Npc_GlobalDamMult, 1); };
func void Dia_StExt_ModMenu_Sum_GlobalHpMult() { StExt_BuildValueChangeMenu("StExt_Config_Sum_GlobalHpMult", StExt_Str_Config_Sum_GlobalHpMult, 1); };
func void Dia_StExt_ModMenu_Sum_GlobalStatMult() { StExt_BuildValueChangeMenu("StExt_Config_Sum_GlobalStatMult", StExt_Str_Config_Sum_GlobalStatMult, 1); };
func void Dia_StExt_ModMenu_Sum_GlobalProtMult() { StExt_BuildValueChangeMenu("StExt_Config_Sum_GlobalProtMult", StExt_Str_Config_Sum_GlobalProtMult, 1); };
func void Dia_StExt_ModMenu_Sum_GlobalDamMult() { StExt_BuildValueChangeMenu("StExt_Config_Sum_GlobalDamMult", StExt_Str_Config_Sum_GlobalDamMult, 1); };
func void Dia_StExt_ModMenu_NpcSum_GlobalHpMult() { StExt_BuildValueChangeMenu("StExt_Config_NpcSum_GlobalHpMult", StExt_Str_Config_NpcSum_GlobalHpMult, 1); };
func void Dia_StExt_ModMenu_NpcSum_GlobalEsMult() { StExt_BuildValueChangeMenu("StExt_Config_NpcSum_GlobalEsMult", StExt_Str_Config_NpcSum_GlobalEsMult, 1); };
func void Dia_StExt_ModMenu_NpcSum_GlobalStatMult() { StExt_BuildValueChangeMenu("StExt_Config_NpcSum_GlobalStatMult", StExt_Str_Config_NpcSum_GlobalStatMult, 1); };
func void Dia_StExt_ModMenu_NpcSum_GlobalProtMult() { StExt_BuildValueChangeMenu("StExt_Config_NpcSum_GlobalProtMult", StExt_Str_Config_NpcSum_GlobalProtMult, 1); };
func void Dia_StExt_ModMenu_NpcSum_GlobalDamMult() { StExt_BuildValueChangeMenu("StExt_Config_NpcSum_GlobalDamMult", StExt_Str_Config_NpcSum_GlobalDamMult, 1); };
func void Dia_StExt_ModMenu_Npc_InfusionHpMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_InfusionHpMult", StExt_Str_Config_Npc_InfusionHpMult, 1); };
func void Dia_StExt_ModMenu_Npc_InfusionEsMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_InfusionEsMult", StExt_Str_Config_Npc_InfusionEsMult, 1); };
func void Dia_StExt_ModMenu_Npc_InfusionStatMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_InfusionStatMult", StExt_Str_Config_Npc_InfusionStatMult, 1); };
func void Dia_StExt_ModMenu_Npc_InfusionProtMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_InfusionProtMult", StExt_Str_Config_Npc_InfusionProtMult, 1); };
func void Dia_StExt_ModMenu_Npc_InfusionDamMult() { StExt_BuildValueChangeMenu("StExt_Config_Npc_InfusionDamMult", StExt_Str_Config_Npc_InfusionDamMult, 1); };
func void Dia_StExt_ModMenu_Npc_Infusion_HumansExtraChance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_MagicInfusion_HumansExtraChance", StExt_Str_Config_Npc_MagicInfusion_HumansExtraChance, 1); };
func void Dia_StExt_ModMenu_Npc_Infusion_BossesExtraChance() { StExt_BuildValueChangeMenu("StExt_Config_Npc_MagicInfusion_BossesExtraChance", StExt_Str_Config_Npc_MagicInfusion_BossesExtraChance, 1); };
	

// Randomization settings sub menu
func void Dia_StExt_ModMenu_Configs_RandomizationSettings() 
{
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_Configs_RandomizationSettings";
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_TradersExtraItemsAddRate, Dia_StExt_ModMenu_WorldRandomization_TradersExtraItemsAddRate);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Item_SpawnCountMod, Dia_StExt_ModMenu_WorldRandomization_Item_SpawnCountMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Item_SpawnPowerMod, Dia_StExt_ModMenu_WorldRandomization_Item_SpawnPowerMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Item_SpawnChance, Dia_StExt_ModMenu_WorldRandomization_Item_SpawnChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Npc_SpawnCountMod, Dia_StExt_ModMenu_WorldRandomization_Npc_SpawnCountMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Npc_SpawnPowerMod, Dia_StExt_ModMenu_WorldRandomization_Npc_SpawnPowerMod);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Npc_SpawnChance, Dia_StExt_ModMenu_WorldRandomization_Npc_SpawnChance);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_MaxCooldown, Dia_StExt_ModMenu_WorldRandomization_MaxCooldown);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_MinCooldown, Dia_StExt_ModMenu_WorldRandomization_MinCooldown);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableWorldRandomization_Items, Dia_StExt_ModMenu_EnableWorldRandomization_Items);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableWorldRandomization_Npc, Dia_StExt_ModMenu_EnableWorldRandomization_Npc);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableWorldRandomization_ByTimeEvents, Dia_StExt_ModMenu_EnableWorldRandomization_ByTimeEvents);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Diff_EnableRot, Dia_StExt_ModMenu_Diff_EnableRot);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Npc_EnableSpawnSound, Dia_StExt_ModMenu_WorldRandomization_Npc_EnableSpawnSound);
};

func void Dia_StExt_ModMenu_EnableWorldRandomization_Items() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableWorldRandomization_Items"); };
func void Dia_StExt_ModMenu_EnableWorldRandomization_Npc() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableWorldRandomization_Npc"); };
func void Dia_StExt_ModMenu_EnableWorldRandomization_ByTimeEvents() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableWorldRandomization_ByTimeEvents"); };
func void Dia_StExt_ModMenu_WorldRandomization_Npc_EnableSpawnSound() { StExt_ChangeModConfig_BoolOption("StExt_Config_WorldRandomization_Npc_EnableSpawnSound"); };


func void Dia_StExt_ModMenu_WorldRandomization_TradersExtraItemsAddRate() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_TradersExtraItemsAddRate", StExt_Str_Config_WorldRandomization_TradersExtraItemsAddRate, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_MinCooldown() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_MinCooldown", StExt_Str_Config_WorldRandomization_MinCooldown, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_MaxCooldown() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_MaxCooldown", StExt_Str_Config_WorldRandomization_MaxCooldown, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_Npc_SpawnChance() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_Npc_SpawnChance", StExt_Str_Config_WorldRandomization_Npc_SpawnChance, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_Npc_SpawnPowerMod() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_Npc_SpawnPowerMod", StExt_Str_Config_WorldRandomization_Npc_SpawnPowerMod, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_Npc_SpawnCountMod() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_Npc_SpawnCountMod", StExt_Str_Config_WorldRandomization_Npc_SpawnCountMod, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_Item_SpawnChance() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_Item_SpawnChance", StExt_Str_Config_WorldRandomization_Item_SpawnChance, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_Item_SpawnPowerMod() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_Item_SpawnPowerMod", StExt_Str_Config_WorldRandomization_Item_SpawnPowerMod, 1); };
func void Dia_StExt_ModMenu_WorldRandomization_Item_SpawnCountMod() { StExt_BuildValueChangeMenu("StExt_Config_WorldRandomization_Item_SpawnCountMod", StExt_Str_Config_WorldRandomization_Item_SpawnCountMod, 1); };

// Luck settings sub menu
func void Dia_StExt_ModMenu_Configs_LuckSettings() 
{
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_Configs_LuckSettings";
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_WorldRandomization_Item_SpawnCountMod, Dia_StExt_ModMenu_WorldRandomization_Item_SpawnCountMod);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Food, Dia_StExt_ModMenu_Luck_RelativeDropChance_Food);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Alchemy, Dia_StExt_ModMenu_Luck_RelativeDropChance_Alchemy);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Magic, Dia_StExt_ModMenu_Luck_RelativeDropChance_Magic);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Misk, Dia_StExt_ModMenu_Luck_RelativeDropChance_Misk);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Munition, Dia_StExt_ModMenu_Luck_RelativeDropChance_Munition);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Armors, Dia_StExt_ModMenu_Luck_RelativeDropChance_Armors);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_Jewelry, Dia_StExt_ModMenu_Luck_RelativeDropChance_Jewelry);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_MagicWeapons, Dia_StExt_ModMenu_Luck_RelativeDropChance_MagicWeapons);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_MeeleWeapons, Dia_StExt_ModMenu_Luck_RelativeDropChance_MeeleWeapons);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RelativeDropChance_RangeWeapons, Dia_StExt_ModMenu_Luck_RelativeDropChance_RangeWeapons);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootQuantityMod_Food, Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Food);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootQuantityMod_Alchemy, Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Alchemy);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootQuantityMod_Magic, Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Magic);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootQuantityMod_Munition, Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Munition);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootQuantityMod_Misk, Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Misk);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Food, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Food);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Alchemy, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Alchemy);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Magic, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Magic);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Misk, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Misk);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Armor, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Armor);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Weapon, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Weapon);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLootPowerMod_Jewelry, Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Jewelry);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_ChanceForEnchantedDrop, Dia_StExt_ModMenu_Luck_ChanceForEnchantedDrop);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_Difficulty, Dia_StExt_ModMenu_Luck_Difficulty);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_Power, Dia_StExt_ModMenu_Luck_Power);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_Quantity, Dia_StExt_ModMenu_Luck_Quantity);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_Money, Dia_StExt_ModMenu_Luck_Money);

	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_RandomLoot_EnableUnHumanDrop, Dia_StExt_ModMenu_Luck_RandomLoot_EnableUnHumanDrop);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_EnableRandomLoot_Bodies, Dia_StExt_ModMenu_Luck_EnableRandomLoot_Bodies);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_Luck_EnableRandomLoot_Chests, Dia_StExt_ModMenu_Luck_EnableRandomLoot_Chests);
};

func void Dia_StExt_ModMenu_Luck_ChanceForEnchantedDrop() { StExt_BuildValueChangeMenu("StExt_Config_Luck_ChanceForEnchantedDrop", StExt_Str_Config_Luck_ChanceForEnchantedDrop, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Food() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Food", StExt_Str_Config_Luck_RelativeDropChance_Food, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Alchemy() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Alchemy", StExt_Str_Config_Luck_RelativeDropChance_Alchemy, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Magic() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Magic", StExt_Str_Config_Luck_RelativeDropChance_Magic, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Misk() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Misk", StExt_Str_Config_Luck_RelativeDropChance_Misk, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Munition() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Munition", StExt_Str_Config_Luck_RelativeDropChance_Munition, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Armors() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Armors", StExt_Str_Config_Luck_RelativeDropChance_Armors, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_Jewelry() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_Jewelry", StExt_Str_Config_Luck_RelativeDropChance_Jewelry, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_MagicWeapons() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_MagicWeapons", StExt_Str_Config_Luck_RelativeDropChance_MagicWeapons, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_MeeleWeapons() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_MeeleWeapons", StExt_Str_Config_Luck_RelativeDropChance_MeeleWeapons, 1); };
func void Dia_StExt_ModMenu_Luck_RelativeDropChance_RangeWeapons() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RelativeDropChance_RangeWeapons", StExt_Str_Config_Luck_RelativeDropChance_RangeWeapons, 1); };

func void Dia_StExt_ModMenu_Luck_EnableRandomLoot_Bodies() { StExt_ChangeModConfig_BoolOption("StExt_Config_Luck_EnableRandomLoot_Bodies"); };
func void Dia_StExt_ModMenu_Luck_EnableRandomLoot_Chests() { StExt_ChangeModConfig_BoolOption("StExt_Config_Luck_EnableRandomLoot_Chests"); };
func void Dia_StExt_ModMenu_Luck_RandomLoot_EnableUnHumanDrop() { StExt_ChangeModConfig_BoolOption("StExt_Config_Luck_RandomLoot_EnableUnHumanDrop"); };

func void Dia_StExt_ModMenu_Luck_Difficulty() { StExt_BuildValueChangeMenu("StExt_Config_Luck_Difficulty", StExt_Str_Config_Luck_Difficulty, 1); };
func void Dia_StExt_ModMenu_Luck_Power() { StExt_BuildValueChangeMenu("StExt_Config_Luck_Power", StExt_Str_Config_Luck_Power, 1); };
func void Dia_StExt_ModMenu_Luck_Quantity() { StExt_BuildValueChangeMenu("StExt_Config_Luck_Quantity", StExt_Str_Config_Luck_Quantity, 1); };
func void Dia_StExt_ModMenu_Luck_Money() { StExt_BuildValueChangeMenu("StExt_Config_Luck_Money", StExt_Str_Config_Luck_Money, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Food() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Food", StExt_Str_Config_Luck_RandomLootPowerMod_Food, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Alchemy() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Alchemy", StExt_Str_Config_Luck_RandomLootPowerMod_Alchemy, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Magic() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Magic", StExt_Str_Config_Luck_RandomLootPowerMod_Magic, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Misk() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Misk", StExt_Str_Config_Luck_RandomLootPowerMod_Misk, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Armor() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Armor", StExt_Str_Config_Luck_RandomLootPowerMod_Armor, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Weapon() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Weapon", StExt_Str_Config_Luck_RandomLootPowerMod_Weapon, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootPowerMod_Jewelry() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootPowerMod_Jewelry", StExt_Str_Config_Luck_RandomLootPowerMod_Jewelry, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Food() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootQuantityMod_Food", StExt_Str_Config_Luck_RandomLootQuantityMod_Food, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Alchemy() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootQuantityMod_Alchemy", StExt_Str_Config_Luck_RandomLootQuantityMod_Alchemy, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Magic() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootQuantityMod_Magic", StExt_Str_Config_Luck_RandomLootQuantityMod_Magic, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Munition() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootQuantityMod_Munition", StExt_Str_Config_Luck_RandomLootQuantityMod_Munition, 1); };
func void Dia_StExt_ModMenu_Luck_RandomLootQuantityMod_Misk() { StExt_BuildValueChangeMenu("StExt_Config_Luck_RandomLootQuantityMod_Misk", StExt_Str_Config_Luck_RandomLootQuantityMod_Misk, 1); };

// Misk settings sub menu
func void Dia_StExt_ModMenu_Configs_MiskSettings() 
{
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_Configs_MiskSettings";
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ExtraItemsDisplayMode, Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode);
	
	if (!StExt_LockConfigs)
	{
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_FoodBonusResetDay, Dia_StExt_ModMenu_Config_FoodBonusResetDay);
	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Fire, Dia_StExt_ModMenu_Config_MasteryExpMult_Fire);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Ice, Dia_StExt_ModMenu_Config_MasteryExpMult_Ice);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Electric, Dia_StExt_ModMenu_Config_MasteryExpMult_Electric);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Air, Dia_StExt_ModMenu_Config_MasteryExpMult_Air);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Earth, Dia_StExt_ModMenu_Config_MasteryExpMult_Earth);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Light, Dia_StExt_ModMenu_Config_MasteryExpMult_Light);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Dark, Dia_StExt_ModMenu_Config_MasteryExpMult_Dark);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Death, Dia_StExt_ModMenu_Config_MasteryExpMult_Death);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Life, Dia_StExt_ModMenu_Config_MasteryExpMult_Life);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Golem, Dia_StExt_ModMenu_Config_MasteryExpMult_Golem);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Demon, Dia_StExt_ModMenu_Config_MasteryExpMult_Demon);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Necro, Dia_StExt_ModMenu_Config_MasteryExpMult_Necro);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Shaman, Dia_StExt_ModMenu_Config_MasteryExpMult_Shaman);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_MartialArts, Dia_StExt_ModMenu_Config_MasteryExpMult_MartialArts);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Agile, Dia_StExt_ModMenu_Config_MasteryExpMult_Agile);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Archery, Dia_StExt_ModMenu_Config_MasteryExpMult_Archery);
		//info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Blood, Dia_StExt_ModMenu_Config_MasteryExpMult_Blood);
		//info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_FistFight, Dia_StExt_ModMenu_Config_MasteryExpMult_FistFight);
		//info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Aura, Dia_StExt_ModMenu_Config_MasteryExpMult_Aura);
		//info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Traps, Dia_StExt_ModMenu_Config_MasteryExpMult_Traps);
		//info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteryExpMult_Poision, Dia_StExt_ModMenu_Config_MasteryExpMult_Poision);		
	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_CorruptionTouchExp, Dia_StExt_ModMenu_Config_CorruptionTouchExp);	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRageExp, Dia_StExt_ModMenu_Config_BelliarRageExp);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_DamageReductionExpRate, Dia_StExt_ModMenu_Config_DamageReductionExpRate);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_PartyExp, Dia_StExt_ModMenu_Config_PartyExp);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_SncExp, Dia_StExt_ModMenu_Config_SncExp);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_GainExpMod, Dia_StExt_ModMenu_Config_GainExpMod);		
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExpMod, Dia_StExt_ModMenu_Config_ExpMod);	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NpcExp, Dia_StExt_ModMenu_Config_NpcExp);		
		
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRage_Active, Dia_StExt_ModMenu_Config_BelliarRage_Active);
		if (rx_beliarrageactive())
		{
			info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRage_SpawnMonsters, Dia_StExt_ModMenu_Config_BelliarRage_SpawnMonsters);
			info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRage_StaminaReduce, Dia_StExt_ModMenu_Config_BelliarRage_StaminaReduce);
			info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRage_AddDamageReduce, Dia_StExt_ModMenu_Config_BelliarRage_AddDamageReduce);
			info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRage_RegenEnemies, Dia_StExt_ModMenu_Config_BelliarRage_RegenEnemies);
			info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_BelliarRage_SoundEnable, Dia_StExt_ModMenu_Config_BelliarRage_SoundEnable);
		};
		
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MasteriesExpMult, Dia_StExt_ModMenu_Config_MasteriesExpMult);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_CorruptionExpMult, Dia_StExt_ModMenu_Config_CorruptionExpMult);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ArtifactsExpMult, Dia_StExt_ModMenu_Config_ArtifactsExpMult);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ArtifactsUpgradeCostMult, Dia_StExt_ModMenu_Config_ArtifactsUpgradeCostMult);	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EducationRequirementsMult, Dia_StExt_ModMenu_Config_EducationRequirementsMult);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EducationMoneyCostMult, Dia_StExt_ModMenu_Config_EducationMoneyCostMult);	
	};
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_NoChapterForMagicCircle, Dia_StExt_ModMenu_Config_NoChapterForMagicCircle);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_DisplayBuffEffects, Dia_StExt_ModMenu_Config_DisplayBuffEffects);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_DisplayEsEffects, Dia_StExt_ModMenu_Config_DisplayEsEffects);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_DisableEnchantedItemsEffects, Dia_StExt_ModMenu_Config_DisableEnchantedItemsEffects);
		
	if (!StExt_LockConfigs)
	{
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraLp, Dia_StExt_ModMenu_Config_ExtraLp);	
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraHpPerLevel, Dia_StExt_ModMenu_Config_ExtraHpPerLevel);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraMpPerLevel, Dia_StExt_ModMenu_Config_ExtraMpPerLevel);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraEsPerLevel, Dia_StExt_ModMenu_Config_ExtraEsPerLevel);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraStrPerLevel, Dia_StExt_ModMenu_Config_ExtraStrPerLevel);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraAgiPerLevel, Dia_StExt_ModMenu_Config_ExtraAgiPerLevel);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraIntPerLevel, Dia_StExt_ModMenu_Config_ExtraIntPerLevel);
		info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ExtraLuckPerLevel, Dia_StExt_ModMenu_Config_ExtraLuckPerLevel);
	};
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableSkeletonSkin_OnlyAtNight, Dia_StExt_ModMenu_Config_EnableSkeletonSkin_OnlyAtNight);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableSkeletonSkin, Dia_StExt_ModMenu_Config_EnableSkeletonSkin);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableFemaleLook_AlwaysWig, Dia_StExt_ModMenu_Config_EnableFemaleSkin_AlwaysWig);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableFemaleLook_DemonLook, Dia_StExt_ModMenu_Config_EnableFemaleSkin_DemonLook);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_EnableFemaleLook, Dia_StExt_ModMenu_Config_EnableFemaleSkin);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_HideHelm, Dia_StExt_ModMenu_Config_HideHelm);
};

func void Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode()
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_MiskSettings);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ExtraItemsDisplayModes[StExt_ExtraItemsDisplayMode_UnderArmor], Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_UnderArmor);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ExtraItemsDisplayModes[StExt_ExtraItemsDisplayMode_None], Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_None);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ExtraItemsDisplayModes[StExt_ExtraItemsDisplayMode_OverlayArmor], Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_OverlayArmor);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ExtraItemsDisplayModes[StExt_ExtraItemsDisplayMode_Always], Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_Always);	
};

func void Dia_StExt_ModMenu_Configs_SetExtraItemsDisplayMode(var int mode)
{
	StExt_Config_ExtraItemsDisplayMode = mode;
	Dia_StExt_ModMenu_Configs_MiskSettings();
};

func void Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_UnderArmor() { Dia_StExt_ModMenu_Configs_SetExtraItemsDisplayMode(StExt_ExtraItemsDisplayMode_UnderArmor); };
func void Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_None() { Dia_StExt_ModMenu_Configs_SetExtraItemsDisplayMode(StExt_ExtraItemsDisplayMode_None); };
func void Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_OverlayArmor() { Dia_StExt_ModMenu_Configs_SetExtraItemsDisplayMode(StExt_ExtraItemsDisplayMode_OverlayArmor); };
func void Dia_StExt_ModMenu_Configs_ExtraItemsDisplayMode_Always() { Dia_StExt_ModMenu_Configs_SetExtraItemsDisplayMode(StExt_ExtraItemsDisplayMode_Always); };

func void Dia_StExt_ModMenu_Configs_ShowNpcExtraInfo() { StExt_ChangeModConfig_BoolOption("StExt_Config_ShowNpcExtraInfo"); };
func void Dia_StExt_ModMenu_Configs_ShowNpcFlags() { StExt_ChangeModConfig_BoolOption("StExt_Config_ShowNpcFlags"); };
func void Dia_StExt_ModMenu_Configs_ShowNpcRank() { StExt_ChangeModConfig_BoolOption("StExt_Config_ShowNpcRank"); };
func void Dia_StExt_ModMenu_Configs_ShowNpcAbilities() { StExt_ChangeModConfig_BoolOption("StExt_Config_ShowNpcAbilities"); };
func void Dia_StExt_ModMenu_Config_EnableSkeletonSkin() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableSkeletonSkin"); StExt_UpdateSkin = true; };
func void Dia_StExt_ModMenu_Config_EnableSkeletonSkin_OnlyAtNight() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableSkeletonSkin_OnlyAtNight"); StExt_UpdateSkin = true; };
func void Dia_StExt_ModMenu_Config_EnableFemaleSkin() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableFemaleSkin"); StExt_UpdateSkin = true; };
func void Dia_StExt_ModMenu_Config_EnableFemaleSkin_AlwaysWig() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableFemaleSkin_AlwaysWig"); StExt_UpdateSkin = true; };
func void Dia_StExt_ModMenu_Config_EnableFemaleSkin_DemonLook() { StExt_ChangeModConfig_BoolOption("StExt_Config_EnableFemaleSkin_DemonLook"); StExt_UpdateSkin = true; };
func void Dia_StExt_ModMenu_Config_HideHelm() { StExt_ChangeModConfig_BoolOption("StExt_Config_HideHelm"); StExt_UpdateSkin = true; };
func void Dia_StExt_ModMenu_Config_NoChapterForMagicCircle() { StExt_ChangeModConfig_BoolOption("StExt_Config_NoChapterForMagicCircle"); };
func void Dia_StExt_ModMenu_Config_DisplayBuffEffects() { StExt_ChangeModConfig_BoolOption("StExt_Config_DisplayBuffEffects"); };
func void Dia_StExt_ModMenu_Config_DisplayEsEffects() { StExt_ChangeModConfig_BoolOption("StExt_Config_DisplayEsEffects"); };
func void Dia_StExt_ModMenu_Config_DisableEnchantedItemsEffects() { StExt_ChangeModConfig_BoolOption("StExt_Config_DisableEnchantedItemsEffects"); };


func void Dia_StExt_ModMenu_Config_BelliarRage_Active() { StExt_ChangeModConfig_BoolOption("StExt_Config_BelliarRage_Active"); };
func void Dia_StExt_ModMenu_Config_BelliarRage_SpawnMonsters() { StExt_ChangeModConfig_BoolOption("StExt_Config_BelliarRage_SpawnMonsters"); };
func void Dia_StExt_ModMenu_Config_BelliarRage_StaminaReduce() { StExt_ChangeModConfig_BoolOption("StExt_Config_BelliarRage_StaminaReduce"); };
func void Dia_StExt_ModMenu_Config_BelliarRage_AddDamageReduce() { StExt_ChangeModConfig_BoolOption("StExt_Config_BelliarRage_AddDamageReduce"); };
func void Dia_StExt_ModMenu_Config_BelliarRage_RegenEnemies() { StExt_ChangeModConfig_BoolOption("StExt_Config_BelliarRage_RegenEnemies"); };
func void Dia_StExt_ModMenu_Config_BelliarRage_SoundEnable() { StExt_ChangeModConfig_BoolOption("StExt_Config_BelliarRage_SoundEnable"); };


func void Dia_StExt_ModMenu_Config_FoodBonusResetDay() { StExt_BuildValueChangeMenu("StExt_Config_FoodBonusResetDay", StExt_Str_Config_FoodBonusResetDay, 1); };
func void Dia_StExt_ModMenu_Config_MenuTextWrapIndex() { StExt_BuildValueChangeMenu("StExt_Config_MenuTextWrapIndex", StExt_Str_Config_MenuTextWrapIndex, 1); };
func void Dia_StExt_ModMenu_Config_ExpMod() { StExt_BuildValueChangeMenu("StExt_Config_ExpMod", StExt_Str_Config_ExpMod, 1); };
func void Dia_StExt_ModMenu_Config_MasteriesExpMult() { StExt_BuildValueChangeMenu("StExt_Config_MasteriesExpMult", StExt_Str_Config_MasteriesExpMult, 1); };
func void Dia_StExt_ModMenu_Config_CorruptionExpMult() { StExt_BuildValueChangeMenu("StExt_Config_CorruptionExpMult", StExt_Str_Config_CorruptionExpMult, 1); };
func void Dia_StExt_ModMenu_Config_ArtifactsUpgradeCostMult() { StExt_BuildValueChangeMenu("StExt_Config_ArtifactsUpgradeCostMult", StExt_Str_Config_ArtifactsUpgradeCostMult, 1); };
func void Dia_StExt_ModMenu_Config_ArtifactsExpMult() { StExt_BuildValueChangeMenu("StExt_Config_ArtifactsExpMult", StExt_Str_Config_ArtifactsExpMult, 1); };
func void Dia_StExt_ModMenu_Config_EducationMoneyCostMult() { StExt_BuildValueChangeMenu("StExt_Config_EducationMoneyCostMult", StExt_Str_Config_EducationMoneyCostMult, 1); };
func void Dia_StExt_ModMenu_Config_EducationRequirementsMult() { StExt_BuildValueChangeMenu("StExt_Config_EducationRequirementsMult", StExt_Str_Config_EducationRequirementsMult, 1); };

func void Dia_StExt_ModMenu_Config_ExtraLp() { StExt_BuildValueChangeMenu("StExt_Config_ExtraLp", StExt_Str_Config_ExtraLp, 1); };
func void Dia_StExt_ModMenu_Config_ExtraHpPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraHpPerLevel", StExt_Str_Config_ExtraHpPerLevel, 1); };
func void Dia_StExt_ModMenu_Config_ExtraMpPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraMpPerLevel", StExt_Str_Config_ExtraMpPerLevel, 1); };
func void Dia_StExt_ModMenu_Config_ExtraEsPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraEsPerLevel", StExt_Str_Config_ExtraEsPerLevel, 1); };
func void Dia_StExt_ModMenu_Config_ExtraStrPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraStrPerLevel", StExt_Str_Config_ExtraStrPerLevel, 1); };
func void Dia_StExt_ModMenu_Config_ExtraAgiPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraAgiPerLevel", StExt_Str_Config_ExtraAgiPerLevel, 1); };
func void Dia_StExt_ModMenu_Config_ExtraIntPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraIntPerLevel", StExt_Str_Config_ExtraIntPerLevel, 1); };
func void Dia_StExt_ModMenu_Config_ExtraLuckPerLevel() { StExt_BuildValueChangeMenu("StExt_Config_ExtraLuckPerLevel", StExt_Str_Config_ExtraLuckPerLevel, 1); };

func void Dia_StExt_ModMenu_Config_SncExp() { StExt_BuildValueChangeMenu("StExt_Config_SncExp", StExt_Str_Config_SncExp, 1); };
func void Dia_StExt_ModMenu_Config_PartyExp() { StExt_BuildValueChangeMenu("StExt_Config_PartyExp", StExt_Str_Config_PartyExp, 1); };
func void Dia_StExt_ModMenu_Config_NpcExp() { StExt_BuildValueChangeMenu("StExt_Config_NpcExp", StExt_Str_Config_NpcExp, 1); };
func void Dia_StExt_ModMenu_Config_BelliarRageExp() { StExt_BuildValueChangeMenu("StExt_Config_BelliarRageExp", StExt_Str_Config_BelliarRageExp, 1); };
func void Dia_StExt_ModMenu_Config_GainExpMod() { StExt_BuildValueChangeMenu("StExt_Config_GainExpMod", StExt_Str_Config_GainExpMod, 1); };
func void Dia_StExt_ModMenu_Config_CorruptionTouchExp() { StExt_BuildValueChangeMenu("StExt_Config_CorruptionTouchExp", StExt_Str_Config_CorruptionTouchExp, 1); };
func void Dia_StExt_ModMenu_Config_DamageReductionExpRate() { StExt_BuildValueChangeMenu("StExt_Config_DamageReductionExpRate", StExt_Str_Config_DamageReductionExpRate, 1); };

func void Dia_StExt_ModMenu_Config_MasteryExpMult_Fire() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Fire", StExt_Str_Config_MasteryExpMult_Fire, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Ice() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Ice", StExt_Str_Config_MasteryExpMult_Ice, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Electric() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Electric", StExt_Str_Config_MasteryExpMult_Electric, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Air() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Air", StExt_Str_Config_MasteryExpMult_Air, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Earth() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Earth", StExt_Str_Config_MasteryExpMult_Earth, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Light() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Light", StExt_Str_Config_MasteryExpMult_Light, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Dark() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Dark", StExt_Str_Config_MasteryExpMult_Dark, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Death() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Death", StExt_Str_Config_MasteryExpMult_Death, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Life() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Life", StExt_Str_Config_MasteryExpMult_Life, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Golem() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Golem", StExt_Str_Config_MasteryExpMult_Golem, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Demon() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Demon", StExt_Str_Config_MasteryExpMult_Demon, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Necro() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Necro", StExt_Str_Config_MasteryExpMult_Necro, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Shaman() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Shaman", StExt_Str_Config_MasteryExpMult_Shaman, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_MartialArts() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_MartialArts", StExt_Str_Config_MasteryExpMult_MartialArts, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Agile() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Agile", StExt_Str_Config_MasteryExpMult_Agile, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Archery() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Archery", StExt_Str_Config_MasteryExpMult_Archery, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Blood() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Blood", StExt_Str_Config_MasteryExpMult_Blood, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_FistFight() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_FistFight", StExt_Str_Config_MasteryExpMult_FistFight, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Aura() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Aura", StExt_Str_Config_MasteryExpMult_Aura, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Traps() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Traps", StExt_Str_Config_MasteryExpMult_Traps, 1); };
func void Dia_StExt_ModMenu_Config_MasteryExpMult_Poision() { StExt_BuildValueChangeMenu("StExt_Config_MasteryExpMult_Poision", StExt_Str_Config_MasteryExpMult_Poision, 1); };


func void Dia_StExt_ModMenu_PresetsSection()
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_Configs_Reset, StExt_ModMenu_Configs_Reset);
	StExt_Info_BuildConfigPresetsChoices(Dia_StExt_ModMenu_Configs, "Dia_StExt_ModMenu_PresetsSection_Action");
};

func void StExt_ModMenu_Configs_Reset()
{
	StExt_CurrentUserConfigs = "StExt_ConfigPreset_Normal";
	StExt_Configure(false);
	StExt_DisplayModMenu_Configs_back();
};
func void Dia_StExt_ModMenu_PresetsSection_Action()
{
	StExt_ParsePresetName(StExt_ChoiceName);
	if(!StExt_ApplyConfig(StExt_ReturnString))
	{
		StExt_CurrentUserConfigs = "StExt_ConfigPreset_Normal";
		StExt_Configure(false);
	};
	StExt_DisplayModMenu_Configs_back();
};

// Ui settings sub menu
func void Dia_StExt_ModMenu_Configs_UiSettings() 
{
	StExt_EnableUiMoving(StExt_Null);
	StExt_CurrentEditValueSection = "Dia_StExt_ModMenu_Configs_UiSettings";
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ShowNpcLevel, Dia_StExt_ModMenu_Configs_ShowNpcLevel);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ShowNpcExtraInfo, Dia_StExt_ModMenu_Configs_ShowNpcExtraInfo);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ShowNpcFlags, Dia_StExt_ModMenu_Configs_ShowNpcFlags);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ShowNpcRank, Dia_StExt_ModMenu_Configs_ShowNpcRank);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_ShowNpcAbilities, Dia_StExt_ModMenu_Configs_ShowNpcAbilities);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_DisplayLuckMessage, Dia_StExt_ModMenu_Configs_DisplayLuckMessage);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_DisplayMasteryLevelUp, Dia_StExt_ModMenu_Configs_DisplayMasteryLevelUp);	
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MenuTextWrapIndex, Dia_StExt_ModMenu_Config_MenuTextWrapIndex);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MenuScaleX, Dia_StExt_ModMenu_Config_MenuScaleX);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MenuScaleY, Dia_StExt_ModMenu_Config_MenuScaleY);
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MenuPauseOnShow, Dia_StExt_ModMenu_Config_MenuPauseOnShow);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_Config_MenuScrollMult, Dia_StExt_ModMenu_Config_MenuScrollMult);	
	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_ItemsInfoUi, Dia_StExt_ModMenu_Configs_ItemMenu);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_AuraUi, Dia_StExt_ModMenu_Configs_Aura);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_AlchUi, Dia_StExt_ModMenu_Configs_Alch);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_ArtifactUi, Dia_StExt_ModMenu_Configs_Artifact);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_EsUi, Dia_StExt_ModMenu_Configs_EsBar);	
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_MsgTray, Dia_StExt_ModMenu_Configs_MsgTray);	
};

func void Dia_StExt_ModMenu_Config_MenuScaleX() { StExt_BuildValueChangeMenu("StExt_Config_MenuScaleX", StExt_Str_Config_MenuScaleX, 1); };
func void Dia_StExt_ModMenu_Config_MenuScaleY() { StExt_BuildValueChangeMenu("StExt_Config_MenuScaleY", StExt_Str_Config_MenuScaleY, 1); };

func void Dia_StExt_ModMenu_Config_MenuPauseOnShow() { StExt_ChangeModConfig_BoolOption("StExt_Config_MenuPauseOnShow"); };
func void Dia_StExt_ModMenu_Config_MenuScrollMult() { StExt_BuildValueChangeMenu("StExt_Config_MenuScrollMult", StExt_Str_Config_MenuScrollMult, 1); };


//*******************************************************************
// 					*** Corruption menu ***
//*******************************************************************
instance Dia_StExt_CorruptionMenu(c_info) 
{
    npc = pc_hero;
    condition = StExt_CorruptionMenu_Condition;
    information = Dia_StExt_CorruptionMenu_Info;
    important = false;
    permanent = true;
    nr = 1;
    description = StExt_Str_CorruptionMenu;
};

func int StExt_CorruptionMenu_Condition() { return StExt_DisplayCorruptionMenu; };

func void Dia_StExt_CorruptionMenu_ExitDialog() 
{
	StExt_DisplayCorruptionMenu = false;
	StExt_AddCorruptionExp(hero.exp);
	ai_stopprocessinfos(hero);	
};

func void Dia_StExt_CorruptionMenu_Info()
{
	info_clearchoices(Dia_StExt_CorruptionMenu);	
	info_addchoice(Dia_StExt_CorruptionMenu, dialog_ende, Dia_StExt_CorruptionMenu_ExitDialog);	
	info_addchoice(Dia_StExt_CorruptionMenu, StExt_Str_CorruptionName[1], StExt_CorruptionMenu_SelectMage);
	info_addchoice(Dia_StExt_CorruptionMenu, StExt_Str_CorruptionName[2], StExt_CorruptionMenu_SelectWarrior);
	info_addchoice(Dia_StExt_CorruptionMenu, StExt_Str_CorruptionName[3], StExt_CorruptionMenu_SelectRanger);
};

func void StExt_BecomeCorruptedEffect()
{
	rx_playeffect("SPELLFX_BELIARSHRINE", hero);
	rx_playeffect("SPELLFX_SKULL_COLLIDEFX", hero);
	rx_playeffect("spellFX_LIGHTSTAR_RingRitual", hero);	
	snd_play("MFX_FEAR_CAST");		
	ai_playani(hero, "T_INSANE");
	ai_printred(StExt_Str_CorruptionNotify);
	StExt_CorruptionPath_ExpNext = StExt_Corruption_ExpPerLevel;
};

func void StExt_CorruptionMenu_SelectMage()
{
	StExt_BecomeCorruptedEffect();	
	b_raiseattribute_bonus(hero, atr_mana_max, 10);
	rx_changeint(5);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraSpellDam, 25, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReservedHpPerc, 30, StExt_PcStat_Source_Perm);
	npc_removeinvitems(hero, itwr_StExt_CorruptionScroll, 1);
	StExt_CorruptionPath = StExt_Corruption_Mage;
	StExt_SetCorruptionLevel_Stats();
	Dia_StExt_CorruptionMenu_ExitDialog();
};

func void StExt_CorruptionMenu_SelectWarrior()
{
	StExt_BecomeCorruptedEffect();
	b_raiseattribute_bonus(hero, atr_hitpoints_max, 25);
	b_raiseattribute_bonus(hero, atr_strength, 5);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraMeleeDam, 25, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReservedMpPerc, 30, StExt_PcStat_Source_Perm);
	npc_removeinvitems(hero, itwr_StExt_CorruptionScroll, 1);
	StExt_CorruptionPath = StExt_Corruption_Warrior;
	StExt_SetCorruptionLevel_Stats();
	Dia_StExt_CorruptionMenu_ExitDialog();
};

func void StExt_CorruptionMenu_SelectRanger()
{
	StExt_BecomeCorruptedEffect();
	b_raiseattribute_bonus(hero, atr_dexterity, 5);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ExtraRangeDam, 25, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_DodgeChance, 50, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReservedHpPerc, 15, StExt_PcStat_Source_Perm);
	StExt_PlayerStat_OnApply(StExt_PcStats_Index_ReservedMpPerc, 15, StExt_PcStat_Source_Perm);
	npc_removeinvitems(hero, itwr_StExt_CorruptionScroll, 1);
	StExt_CorruptionPath = StExt_Corruption_Ranger;
	StExt_SetCorruptionLevel_Stats();
	Dia_StExt_CorruptionMenu_ExitDialog();
};

func void Dia_StExt_ModMenu_ExportCurrentConfigs()
{
	var string result;
	if (StExt_ExportCurrentConfigs()) 
	{
		result = concatstrings(StExt_ReturnString, " ");
		ai_printbonus(concatstrings(result, StExt_Str_Done));
	}
	else { ai_printred(StExt_Str_ExportCurrentConfigs_Failed); };
	Dia_StExt_ModMenu_Configs_info();
};

func void Dia_StExt_ModMenu_ItemGeneratorPresetsSection()
{
	info_clearchoices(Dia_StExt_ModMenu_Configs);
	info_addchoice(Dia_StExt_ModMenu_Configs, dialog_back, Dia_StExt_ModMenu_Configs_info);
	info_addchoice(Dia_StExt_ModMenu_Configs, StExt_Str_ModMenu_DefaultItemGeneratorPreset, Dia_StExt_ModMenu_ItemGeneratorPresetsSection_Reset);
	StExt_Info_BuildItemGeneratorPresetsChoices(Dia_StExt_ModMenu_Configs, "Dia_StExt_ModMenu_ItemGeneratorPresetsSection_Action");
};
func void Dia_StExt_ModMenu_ItemGeneratorPresetsSection_Action()
{
	var string msg;
	if (StExt_SetItemGeneratorConfigs(StExt_ChoiceName)) 
	{ 
		ai_printbonus(concatstrings(StExt_Str_LoadedConfig, StExt_ChoiceName));
		StExt_CurrentItemGeneratorConfigs = StExt_ChoiceName;		
	}
	else 
	{ 
		msg = StExt_Str_UserConfigsNotFound;
		msg = concatstrings(msg, " (");
		msg = concatstrings(msg, StExt_ChoiceName);
		msg = concatstrings(msg, ")");
		ai_printred(msg); 
	};
	Dia_StExt_ModMenu_Configs_info();
};
func void Dia_StExt_ModMenu_ItemGeneratorPresetsSection_Reset()
{
	ai_printbonus(concatstrings(StExt_Str_LoadedConfig, StExt_ChoiceName));
	StExt_ResetItemGeneratorConfigs();
	StExt_CurrentItemGeneratorConfigs = StExt_EmptyString;
	Dia_StExt_ModMenu_Configs_info();
};


//--------------------------------------------------------------
// 				*** Consume menu ***
//--------------------------------------------------------------

instance Dia_StExt_ModMenu_ConsumePerm(c_info) 
{
    npc = pc_hero;
    condition = StExt_ModMenuDia_Condition;
    information = Dia_StExt_ModMenu_ConsumePerm_info;
    important = false;
    permanent = true;
    nr = 500;
    description = StExt_Str_ModMenu_ConsumePerm;
};

func int Dia_StExt_ModMenu_ConsumePerm_BuildChoiseList_Loop(var int index)
{
	var string choiceName;
	var string choiceAction;
	var string itemInstance;
	var string itemName;
	var int itemsCount;
	var c_item itm;
	var int useCount;
	var int itemInstanceId;
	var int parserId;
	
	if (index >= StExt_ConsumePerm_Max) { return false; };
	
	itemInstance = StExt_Array_GetString("StExt_ConsumePerm_List", index);
	parserId = Par_GetParserID("Game");
	itemInstanceId = Par_GetSymbolID(parserId, itemInstance);
	
	itemsCount = npc_hasitems(other, itemInstanceId);
	if (itemsCount <= 0) { return (index < StExt_ConsumePerm_Max); };
	itm = StExt_GetItemById(itemInstanceId);
	
	if (hlp_isvaliditem(itm))
	{
		choiceAction = concatstrings("Dia_StExt_ModMenu_ConsumePerm_UsePerm_", inttostring(index));
		useCount = StExt_ValidateValueRange(itemsCount, 1, StExt_ConsumePerm_Batch_Max);
		itemName = itm.name;
		
		choiceName = concatstrings(StExt_Str_Dia_ConsumePerm, itemName);
		choiceName = concatstrings(choiceName, "' ");
		choiceName = concatstrings(choiceName, inttostring(useCount));
		choiceName = concatstrings(choiceName, StExt_Str_Pcs);
		
		StExt_Info_AddChoice(Dia_StExt_ModMenu_ConsumePerm, choiceName, choiceAction); 
	}
	else { StExt_PrintDebugStack(concatstrings("Dia_StExt_ModMenu_ConsumePerm_BuildChoiseList_Loop(var int index) -> Faul to create temp item! InstanceId: ", inttostring(itemInstanceId))); };
	
	StExt_DeleteTempItem(itm);
	return (index < StExt_ConsumePerm_Max);
};

var int Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback_Index;
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback()
{
	var string itemInstance;
	if ((Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback_Index >= 0) && (Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback_Index < StExt_ConsumePerm_Max))
	{
		itemInstance = StExt_Array_GetString("StExt_ConsumePerm_List", Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback_Index);
		StExt_Player_ItemBatchUse(itemInstance, StExt_ConsumePerm_Batch_Max);
	};
};

func void Dia_StExt_ModMenu_ConsumePerm_UsePerm(var int index)
{
	info_clearchoices(Dia_StExt_ModMenu_ConsumePerm);
	Dia_StExt_ModMenu_ExitDialog_info();
	
	if ((index >= 0) && (index < StExt_ConsumePerm_Max))
	{
		Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback_Index = index;
		rx_callbacknpc(hero, 1, Dia_StExt_ModMenu_ConsumePerm_UsePerm_Callback);
	};
};

func void Dia_StExt_ModMenu_ConsumePerm_info() 
{
	info_clearchoices(Dia_StExt_ModMenu_ConsumePerm);	
	info_addchoice(Dia_StExt_ModMenu_ConsumePerm, dialog_back, StExt_DisplayModMenu_ConsumePerm_back);
	StExt_While(Dia_StExt_ModMenu_ConsumePerm_BuildChoiseList_Loop);
};

func void StExt_DisplayModMenu_ConsumePerm_back() { info_clearchoices(Dia_StExt_ModMenu_Configs); };

func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_0() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(0); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_1()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(1); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_2()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(2); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_3()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(3); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_4()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(4); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_5()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(5); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_6()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(6); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_7()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(7); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_8()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(8); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_9()  { Dia_StExt_ModMenu_ConsumePerm_UsePerm(9); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_10() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(10); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_11() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(11); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_12() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(12); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_13() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(13); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_14() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(14); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_15() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(15); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_16() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(16); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_17() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(17); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_18() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(18); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_19() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(19); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_20() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(20); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_21() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(21); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_22() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(22); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_23() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(23); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_24() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(24); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_25() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(25); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_26() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(26); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_27() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(27); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_28() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(28); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_29() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(29); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_30() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(30); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_31() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(31); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_32() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(32); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_33() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(33); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_34() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(34); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_35() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(35); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_36() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(36); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_37() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(37); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_38() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(38); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_39() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(39); };
func void Dia_StExt_ModMenu_ConsumePerm_UsePerm_40() { Dia_StExt_ModMenu_ConsumePerm_UsePerm(40); };
