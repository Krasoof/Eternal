//StExt_OnPlayerAction_EventArgs

/*

const int StExt_PcActionType_Null = -1;
const int StExt_PcActionType_OnInput = 0;
const int StExt_PcActionType_OnSpellCast = 1;
const int StExt_PcActionType_OnAttackForward = 2;
const int StExt_PcActionType_OnAttackLeft = 3;
const int StExt_PcActionType_OnAttackRight = 4;
const int StExt_PcActionType_OnAttackRun = 5;
const int StExt_PcActionType_OnAttackFinish = 6;
const int StExt_PcActionType_OnParade = 7;
const int StExt_PcActionType_OnShootAt = 8;
const int StExt_PcActionType_OnDefend = 9;

const int StExt_PcActionFlag_None = 0;
const int StExt_PcActionFlag_HasInputData = 1;

*/

func void StExt_OnPlayerInput_ActionHandler() {  };
func void StExt_OnPlayerSpellCast_ActionHandler() {  };
func void StExt_OnPlayerAttackForward_ActionHandler() {  };
func void StExt_OnPlayerAttackLeft_ActionHandler() {  };
func void StExt_OnPlayerAttackRight_ActionHandler() {  };
func void StExt_OnPlayerAttackRun_ActionHandler() {  };
func void StExt_OnPlayerAttackFinish_ActionHandler() {  };
// Perfect Parry core: every parade action opens a short timing window (~25 frames
// at 60fps = ~0.4s). If an enemy MELEE hit arrives while the window is open
// (checked in StExt_Hero_BeforeDefenceHandler), it counts as a PERFECT PARRY:
// stamina refund + riposte window + negates the Zakon boss unblockable chip.
// Holding block gives nothing - only a parade timed right before the hit.
func void StExt_PerfectParry_CloseWindow() { if (StExt_PerfectParry_Window > 0) { StExt_PerfectParry_Window -= 1; }; };
func void StExt_Riposte_CloseWindow() { StExt_Riposte_Window = 0; };
func void StExt_ZakonPosture_CloseWindow() { StExt_ZakonPosture_Window = 0; };

func void StExt_OnPlayerParade_ActionHandler()
{
	StExt_PerfectParry_Window += 1;
	StExt_InitializeCallback(hero, hero, "StExt_PerfectParry_CloseWindow", 25);
};

// Called from the DLL (oCNpc::ProcessNpc hook) every time the engine confirms
// the player's parade ACTUALLY deflected a hit (oCNpc::didParade flag).
// Perfect = the parade key was pressed within the last ~25 frames (timing);
// anything else is a held-block deflect and burns real stamina instead.
func void StExt_OnPlayerParadeSuccess()
{
	if (StExt_PerfectParry_Window > 0)
	{
		StExt_PerfectParry_Window = 0;
		StExt_Riposte_Window = 1;
		StExt_InitializeCallback(hero, hero, "StExt_Riposte_CloseWindow", 90);
		// LAB POSTURE: a perfect parry also breaks boss poise for ~3s
		// (StExt_StunTarget guard limits the effect to Zakon bosses).
		StExt_ZakonPosture_Window = 1;
		StExt_InitializeCallback(hero, hero, "StExt_ZakonPosture_CloseWindow", 180);
		rx_restorestamina(StExt_GetPercentFromValue(atr_stamina_max, 4));
		printscreencolor("PERFEKCYJNA PARADA!", StExt_Null, 45, StExt_DefaultFont, 1, StExt_Color_Header);
	}
	else
	{
		// held block: deflecting costs 8% max stamina per parried hit -
		// a stamina item no longer buys an eternal shield wall.
		rx_restorestamina(-StExt_GetPercentFromValue(atr_stamina_max, 8));
	};
};
func void StExt_OnPlayerShootAt_ActionHandler() {  };
func void StExt_OnPlayerDefend_ActionHandler() {  };

func void StExt_OnPlayer_ActionHandler() 
{
};

// Call from engine, when hero generaly do attack/input actions.
// Do not hook this function, please. Just use events system instead...
func void StExt_OnPlayerAction()
{
	if(Hlp_IsNULL(StExt_OnPlayerAction_EventArgs))
	{
		StExt_PrintDebug("StExt_OnPlayerAction()", "StExt_OnPlayerAction_EventArgs is null!", hero, StExt_NullNpc);
		return;
	};
	
	if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnInput) { 
		StExt_OnPlayerInput_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerInput_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnSpellCast) { 
		StExt_OnPlayerSpellCast_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerSpellCast_Action"); };
	}	
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnAttackForward) { 
		StExt_OnPlayerAttackForward_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerAttackForward_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnAttackLeft) { 
		StExt_OnPlayerAttackLeft_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerAttackLeft_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnAttackRight) { 
		StExt_OnPlayerAttackRight_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerAttackRight_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnAttackRun) { 
		StExt_OnPlayerAttackRun_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerAttackRun_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnAttackFinish) { 
		StExt_OnPlayerAttackFinish_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerAttackFinish_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnParade) { 
		StExt_OnPlayerParade_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerParade_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnShootAt) { 
		StExt_OnPlayerShootAt_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerShootAt_Action"); };
	}
	else if (StExt_OnPlayerAction_EventArgs.Type == StExt_PcActionType_OnDefend) { 
		StExt_OnPlayerDefend_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayerDefend_Action"); };
	}
	else
	{
		StExt_OnPlayer_ActionHandler();
		if (!StExt_OnPlayerAction_EventArgs.IsHandled) { Hlp_DoEvent("StExt_Evt_OnPlayer_Action"); };
	};
};