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
func void StExt_OnPlayerParade_ActionHandler() {  };
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