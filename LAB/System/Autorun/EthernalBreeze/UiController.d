func void StExt_SetUiMovingPrefix(var int type)
{
	StExt_CurrentUiElementPrefix = StExt_EmptyString;
	if (type == StExt_UiIndex_EsBar) { StExt_CurrentUiElementPrefix = "StExt_Config_EsBar_Pos"; }
	else if (type == StExt_UiIndex_Alchemy) { StExt_CurrentUiElementPrefix = "StExt_Config_Alch_Pos"; }
	else if (type == StExt_UiIndex_Artifact) { StExt_CurrentUiElementPrefix = "StExt_Config_Artifact_Pos"; }
	else if (type == StExt_UiIndex_Aura) { StExt_CurrentUiElementPrefix = "StExt_Config_Aura_Pos"; }
	else if (type == StExt_UiIndex_MsgTray) { StExt_CurrentUiElementPrefix = "StExt_Config_MsgTray_Pos"; }
	else if (type == StExt_UiIndex_ItemMenu) { StExt_CurrentUiElementPrefix = "StExt_Config_ItemMenu_Pos"; };
	
	if (StExt_StringIsEmpty(StExt_CurrentUiElementPrefix)) {
		StExt_PrintDebug("StExt_SetUiMovingPrefix(var int type)", concatstrings("Ui type is incorrect! TypeId: ", inttostring(type)), self, other);
	};
};

func void StExt_EnableUiMoving(var int type)
{
	if ((type <= StExt_UiIndex_None) || (type >= StExt_UiIndex_Max))
	{
		StExt_UiMovingEnabled = false;
		StExt_CurrentUiElement = StExt_UiIndex_None;
		return;
	};
	
	StExt_SetUiMovingPrefix(type);
	StExt_CurrentUiElement = type;
	StExt_UiMovingEnabled = true;
};

func void StExt_PrintCurrentlyEditedValue()
{
	var string msg;
	if (!StExt_StringIsEmpty(StExt_CurrentEditValue) && StExt_SymbolExist(StExt_CurrentEditValue))
	{
		msg = "StExt: ";
		msg = concatstrings(msg, StExt_CurrentEditValueDesc);
		msg = concatstrings(msg, " - ");
		msg = concatstrings(msg, inttostring(StExt_GetIntValueByName(StExt_CurrentEditValue)));
		ai_print(msg);
	};
};

func int StExt_EnableConfigValueEdit(var string option, var string optionDesc, var int step)
{
	var int parserId;
	var int symbolId;
	if (StExt_StringIsEmpty(option) || !StExt_SymbolExist(option))
	{
		StExt_PrintCurrentlyEditedValue();
		StExt_CurrentEditValue = StExt_EmptyString;
		StExt_CurrentEditValueDesc  = StExt_EmptyString;
		StExt_ConfigValueEditEnabled = false;
		StExt_ConfigValueEditStep = 1;
		StExt_ConfigValueEditOld = StExt_CounterLimit;
		return false;
	};
	StExt_ConfigValueEditStep = StExt_ValidateValueRange(step, 1, 10);
	StExt_CurrentEditValue = option;
	StExt_CurrentEditValueDesc = optionDesc;
	if(StExt_ConfigValueEditOld == StExt_CounterLimit) { StExt_ConfigValueEditOld = StExt_GetIntValueByName(StExt_CurrentEditValue); };
	StExt_ConfigValueEditEnabled = true;
	return true;
};

func void StExt_Ui_MoveX(var int x)
{
	var string symbolName;
	symbolName = concatstrings(StExt_CurrentUiElementPrefix, "X");
	StExt_ChangeIntValueByNameWithRange(symbolName, x, 0, 100);
};

func void StExt_Ui_MoveY(var int y)
{
	var string symbolName;
	symbolName = concatstrings(StExt_CurrentUiElementPrefix, "Y");
	StExt_ChangeIntValueByNameWithRange(symbolName, y, 0, 100);
};

func int StExt_Ui_GetX()
{
	var string symbolName;
	symbolName = concatstrings(StExt_CurrentUiElementPrefix, "X");
	return StExt_GetIntValueByName(symbolName);
};

func int StExt_Ui_GetY()
{
	var string symbolName;
	symbolName = concatstrings(StExt_CurrentUiElementPrefix, "Y");
	return StExt_GetIntValueByName(symbolName);
};

func void StExt_ChangeCurrentEditValue(var int val) 
{ 
	StExt_ChangeIntValueByName(StExt_CurrentEditValue, val * StExt_ConfigValueEditStep);
	StExt_ValidateConfig(StExt_CurrentEditValue);
};

func void StExt_SetCurrentEditValue(var int val) 
{ 
	StExt_SetIntValueByName(StExt_CurrentEditValue, val);
	StExt_ValidateConfig(StExt_CurrentEditValue);
};

func void StExt_CancelEditValueChanges() { StExt_SetCurrentEditValue(StExt_ConfigValueEditOld); };

func int StExt_IsDirectionKey(var int key, var int dir)
{
	if(dir == StExt_Key_Right) { return (key == key_rightarrow); }
	if(dir == StExt_Key_Left) { return (key == key_leftarrow); }
	if(dir == StExt_Key_Up) { return (key == key_uparrow); }
	if(dir == StExt_Key_Down) { return (key == key_downarrow); };
	return false;
};

// Call from engine
// React to keys pressed in dialog menu
func int StExt_HandleUiButtom(var int ukey)
{
	if (StExt_UiMovingEnabled)
	{
		if ((StExt_CurrentUiElement <= StExt_UiIndex_None) || (StExt_CurrentUiElement >= StExt_UiIndex_Max)) { return false; };
		if (Hlp_KeyPressed(key_lshift))
		{
			if (StExt_IsDirectionKey(ukey, StExt_Key_Right)) { StExt_Ui_MoveX(10); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Left)) { StExt_Ui_MoveX(-10); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Up)) { StExt_Ui_MoveY(-10); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Down)) { StExt_Ui_MoveY(10); };
		}
		else
		{
			if (StExt_IsDirectionKey(ukey, StExt_Key_Right)) { StExt_Ui_MoveX(1); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Left)) { StExt_Ui_MoveX(-1); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Up)) { StExt_Ui_MoveY(-1); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Down)) { StExt_Ui_MoveY(1); };
		};
		
		return StExt_IsDirectionKey(ukey, StExt_Key_Right) || StExt_IsDirectionKey(ukey, StExt_Key_Left) || 
			StExt_IsDirectionKey(ukey, StExt_Key_Up) || StExt_IsDirectionKey(ukey, StExt_Key_Down);
	};
	if (StExt_ConfigValueEditEnabled)
	{
		if (StExt_IsDirectionKey(ukey, StExt_Key_Up)) { StExt_ConfigValueEditStep = StExt_ValidateValueRange(StExt_ConfigValueEditStep + 1, 1, 10); };
		if (StExt_IsDirectionKey(ukey, StExt_Key_Down)) { StExt_ConfigValueEditStep = StExt_ValidateValueRange(StExt_ConfigValueEditStep - 1, 1, 10); };
	
		if (Hlp_KeyPressed(key_lshift))
		{
			if (StExt_IsDirectionKey(ukey, StExt_Key_Left)) { StExt_ChangeCurrentEditValue(-10); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Right)) { StExt_ChangeCurrentEditValue(10); };
		}
		else
		{
			if (StExt_IsDirectionKey(ukey, StExt_Key_Left)) { StExt_ChangeCurrentEditValue(-1); };
			if (StExt_IsDirectionKey(ukey, StExt_Key_Right)) { StExt_ChangeCurrentEditValue(1); };
		};
		
		return StExt_IsDirectionKey(ukey, StExt_Key_Right) || StExt_IsDirectionKey(ukey, StExt_Key_Left) || 
			StExt_IsDirectionKey(ukey, StExt_Key_Up) || StExt_IsDirectionKey(ukey, StExt_Key_Down);
	};
	return false;
};

func void DrawPlaceholder()
{
	var string placeholder;
	var int x;
	var int y;
	if ((StExt_CurrentUiElement <= StExt_UiIndex_None) || (StExt_CurrentUiElement >= StExt_UiIndex_Max))
	{
		x = StExt_Null;
		y = StExt_Null;
		placeholder = StExt_UnknownString;
	}
	else
	{
		x = StExt_Ui_GetX();
		y = StExt_Ui_GetY();
		placeholder = StExt_Array_GetString("StExt_UiPlaceHolders", StExt_CurrentUiElement);
	};
	printscreen(StExt_Ui_MoveNotification, StExt_Null, StExt_Null, StExt_DefaultFont, 1);
	printscreen(placeholder, x, y, StExt_DefaultFont, 1);
};

func void StExt_DrawCurrentEditConfigValue()
{
	var string text;
	var string valName;
	var int val;
	var string color;
	if (StExt_SymbolExist(StExt_CurrentEditValue))
	{
		valName = StExt_CurrentEditValue;
		val = StExt_GetIntValueByName(StExt_CurrentEditValue);
	}
	else { valName = StExt_UnknownString; val = StExt_Null; };
	printscreencolor(StExt_CurrentEditValueDesc, StExt_Null, 42, StExt_DefaultFont, 1, StExt_Color_Header);
	
	if (val > 0) { color = StExt_Color_Green; }
	else if (val < 0) { color = StExt_Color_Red; }
	else { color = StExt_Color_Common; };
	text = concatstrings(valName, ": ");
	text = concatstrings(text, inttostring(val));
	printscreencolor(text, StExt_Null, 44, StExt_DefaultFont, 1, color);
	
	text = concatstrings(StExt_Ui_ValueEditNotification_Step, inttostring(StExt_ConfigValueEditStep));
	printscreencolor(text, StExt_Null, 46, StExt_DefaultFont, 1, StExt_Color_Common_Faded);
	printscreencolor(StExt_Ui_ValueEditNotification, StExt_Null, 50, StExt_DefaultFont, 1, StExt_Color_Common);
};

func void StExt_DrawArtifact()
{
	var string text;
	text = StExt_EmptyString;
	if ((StExt_ArtifactEquipped <= StExt_ArtifactIndex_None) || (StExt_ArtifactEquipped >= StExt_ArtifactIndex_Max)) { return; };
	
	if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Grimoir) 
	{
		text = concatstrings(StExt_Str_Grimmoire_Name, " ");
		text = concatstrings(text, inttostring(StExt_Grimoir_Level));
		text = concatstrings(text, " (");
		text = concatstrings(text, inttostring(StExt_Grimoir_ExpNow));
		text = concatstrings(text, "/");
		text = concatstrings(text, inttostring(StExt_Grimoir_ExpNext));
		text = concatstrings(text, ")");
	}
	else if (StExt_ArtifactEquipped == StExt_ArtifactIndex_Dagger) 
	{
		text = concatstrings(StExt_Str_Dagger_Name, " ");
		text = concatstrings(text, inttostring(StExt_Dagger_Level));
		text = concatstrings(text, " (");
		text = concatstrings(text, inttostring(StExt_Dagger_ExpNow));
		text = concatstrings(text, "/");
		text = concatstrings(text, inttostring(StExt_Dagger_ExpNext));
		text = concatstrings(text, ")");
	};
	printscreen(text, StExt_Config_Artifact_PosX, StExt_Config_Artifact_PosY, StExt_DefaultFont, 1);
};

func void StExt_DrawAura()
{
	var string text;	
	if (StExt_StringIsEmpty(StExt_ActiveAurasNames)) { return; };
	text = concatstrings(StExt_Str_ActiveAuras, StExt_ActiveAurasNames);
	printscreen(text, StExt_Config_Aura_PosX, StExt_Config_Aura_PosY, StExt_DefaultFont, 1);
};

func void StExt_DrawAlchemy()
{
};

func void StExt_DrawUi()
{
	if (StExt_GamePaused()) { return; };
	// edit ui place
	if (StExt_UiMovingEnabled) { DrawPlaceholder(); };
	if (StExt_ConfigValueEditEnabled) { StExt_DrawCurrentEditConfigValue(); };
	
	// regular ui display
	if (StExt_DisplayModMenu || (heronotmobsi == true) || c_bodystatecontains(hero, bs_mobinteract_interrupt) || bheroisincutscene || heroisdead || endgamecredits || (player_mobsi_production != mobsi_none) || optioncheck || cammodeon) { return; };
	if (StExt_Config_Artifact_DisplayOnScreen) { StExt_DrawArtifact(); };
	if (StExt_Config_Aura_DisplayOnScreen) { StExt_DrawAura(); };
	if (StExt_Config_Alch_DisplayOnScreen) { StExt_DrawAlchemy(); };
};