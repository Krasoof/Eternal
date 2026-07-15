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
// FINAL parry design (user call): NB/Returning's native parry system IS the
// parry system - we add nothing on top except (1) the block stamina economy
// and (2) a perk-driven riposte. No "perfect parry" layer, no debug tags -
// the fresh-vs-held heuristic misfired on every block (enemy swings arrive
// slower than any sane window).
func void StExt_HandleParry()
{
	// COMBAT GATE: EV_Parade fires on pressing block - count only with a
	// readied weapon and a live hostile in your face.
	if (!npc_hasreadiedmeleeweapon(hero) && !npc_hasreadiedrangedweapon(hero)) { return; };
	if (!hlp_isvalidnpc(StExt_FocusNpc)) { return; };
	if (c_npcisdown(StExt_FocusNpc)) { return; };
	if (npc_getdisttonpc(hero, StExt_FocusNpc) > 400) { return; };

	if (StExt_ParryDedupe) { return; };
	StExt_ParryDedupe = 1;
	StExt_InitializeCallback(hero, hero, "StExt_ParryDedupe_Reset", 3);

	// block economy: every parade costs stamina - no eternal shield wall on
	// a regen item. Niezlomnosc (knight tree) halves the drain.
	if (StExt_KnightPerk_Stalwart) { rx_restorestamina(-StExt_GetPercentFromValue(atr_stamina_max, 4)); }
	else { rx_restorestamina(-StExt_GetPercentFromValue(atr_stamina_max, 8)); };

	// Gniew Rycerza: 20% chance per parade to open a riposte window - the
	// next melee hit within ~1.5s deals +100%. Perk-only, mirrors Returning's
	// native small riposte, stacks with it instead of replacing it.
	if (StExt_KnightPerk_Wrath && StExt_Chance(20))
	{
		StExt_Riposte_Window = 1;
		StExt_InitializeCallback(hero, hero, "StExt_Riposte_CloseWindow", 90);
		printscreencolor("RIPOSTA GOTOWA!", StExt_Null, 45, StExt_DefaultFont, 1, StExt_Color_Header);
	};
};

func void StExt_OnPlayerParade_ActionHandler() { StExt_HandleParry(); };
func void StExt_OnPlayerParadeSuccess() { StExt_HandleParry(); };
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