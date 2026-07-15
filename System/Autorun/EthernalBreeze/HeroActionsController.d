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
func void StExt_Riposte_CloseWindow() { StExt_Riposte_Window = 0; };
func void StExt_ParryReady_Reset() { StExt_ParryHeld = 0; };
func void StExt_ParryDedupe_Reset() { StExt_ParryDedupe = 0; };

// Single parry handler, driven by whichever engine signal actually fires:
//   - StExt_OnPlayerParade_ActionHandler = EV_Parade deflect event (DLL hook)
//   - StExt_OnPlayerParadeSuccess        = OnDamage didParade flag (DLL hook)
// Deduped so if both fire for one parry only the first counts. Perfect vs held
// is a GAP heuristic: an isolated, well-timed parry (no parry in the last ~45
// frames) is PERFECT (refund + riposte); parries spammed while holding block
// through a combo just drain stamina. The trailing "src" tag is a TEMP on-screen
// debug so we can see which hook is live - remove once confirmed.
func void StExt_HandleParry(var string src)
{
	if (StExt_ParryDedupe) { return; };
	StExt_ParryDedupe = 1;
	StExt_InitializeCallback(hero, hero, "StExt_ParryDedupe_Reset", 3);

	// every deflect costs stamina - no more eternal shield wall on a regen item
	rx_restorestamina(-StExt_GetPercentFromValue(atr_stamina_max, 8));

	if (!StExt_ParryHeld)
	{
		// fresh, timed parry = PERFECT: refund the drain + 4% bonus + riposte
		rx_restorestamina(StExt_GetPercentFromValue(atr_stamina_max, 12));
		StExt_Riposte_Window = 1;
		StExt_InitializeCallback(hero, hero, "StExt_Riposte_CloseWindow", 90);
		printscreencolor("PERFEKCYJNA PARADA!", StExt_Null, 45, StExt_DefaultFont, 1, StExt_Color_Header);
	};
	StExt_ParryHeld = 1;
	StExt_InitializeCallback(hero, hero, "StExt_ParryReady_Reset", 45);

	printscreencolor(src, StExt_Null, 40, StExt_DefaultFont, 1, StExt_Color_Green);	// TEMP debug tag
};

func void StExt_OnPlayerParade_ActionHandler() { StExt_HandleParry("PAR-EV"); };
func void StExt_OnPlayerParadeSuccess() { StExt_HandleParry("PAR-DMG"); };
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