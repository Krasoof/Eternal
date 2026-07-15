func int StExt_BuffLoop_CanContinue(var c_npc slf)
{
	if (Hlp_IsNULL(StExt_CurrentTimedEffect)) 
	{ 
		StExt_PrintDebugStack("StExt_BuffLoop_CanContinue - StExt_CurrentTimedEffect is NULL!");
		return false; 
	};
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (npc_isdead(slf) || (slf.attribute < 0)) { return false; };
	return true;
};

func int StExt_Buff_CanInit(var c_npc slf)
{
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (npc_isdead(slf) || (slf.attribute < 0)) { return false; };
	return true;
};

func int StExt_BuffProt_CanInit(var c_npc slf, var int protIndex)
{
	var int prot;
	if (!hlp_isvalidnpc(slf)) { return false; };
	if (npc_isdead(slf) || (slf.attribute < 0)) { return false; };
	prot = StExt_Array_GetInt("slf.protection", protIndex);
	if (prot == immune) { return false; };
	return true;
};

// Buff initializer
var int StExt_Buff_Power;
var int StExt_Buff_Duration;
var c_npc StExt_Buff_Caster;
func void StExt_Buff_InitValues()
{
	if(!hlp_isvalidnpc(StExt_Self))
	{
		StExt_PrintDebug("StExt_Buff_InitValues()", "Instance is null!", StExt_Self, StExt_Other);
		return;
	};
	StExt_Buff_Caster = StExt_GetNpc(StExt_Self);
	StExt_Buff_Power = StExt_Self.level + 1 + hlp_random(25);
	StExt_Buff_Duration = StExt_ValidateValueRange(60 + StExt_Self.level + hlp_random(30), 60, 600);
};

func int StExt_Buff_Es_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_Buff_Es_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * (10 + hlp_random(10));
		StExt_Npc_ChangeMaxEs(self, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeEs(self, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeMaxEs(self, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeEs(self, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_Buff_Dodge_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_Buff_Dodge_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * 2, 50, 250);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] -= StExt_Npc_ChangeDodgeChance(self, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeDodgeChance(self, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_Buff_HpRegen_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_Buff_HpRegen_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value], 1, 100);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	self.attribute[atr_hitpoints] += StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
	if (self.attribute[atr_hitpoints] > self.attribute[atr_hitpoints_max]) { self.attribute[atr_hitpoints] = self.attribute[atr_hitpoints_max]; };
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) { return LOOP_END; };	
	return LOOP_CONTINUE;
};

func int StExt_Buff_Speed_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_Buff_Speed_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange((StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] + 1) / 2, 5, 100);		
		StExt_Npc_ChangeAiv(self, aivrx_npc_speed, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeAiv(self, aivrx_npc_speed, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_Buff_Damage_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_Buff_Damage_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * 5, 100, 2000);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMagicDamage, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMeleeDamage, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraRangeDamage, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMagicDamage, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMeleeDamage, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraRangeDamage, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Base loop for any protection buff
func int StExt_Buff_BaseProt_Loop(var string loopName, var int protIndex)
{
	var int prot;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, loopName, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		prot = StExt_Array_GetInt("self.protection", protIndex);		
		prot += StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
		StExt_Array_SetInt("self.protection", protIndex, prot);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		prot = StExt_Array_GetInt("self.protection", protIndex);
		prot -= StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
		if (prot < 0) { prot = 0; };
		StExt_Array_SetInt("self.protection", protIndex, prot);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Base loop for any attribute buff
func int StExt_Buff_BaseAttribute_Loop(var string loopName, var int atrIndex)
{
	var int atr;
	var int atrMax;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, loopName, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		atr = StExt_Array_GetInt("self.attribute", atrIndex);		
		atr += StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
		if (atrIndex == atr_hitpoints_max)
		{
			atrMax = StExt_Array_GetInt("self.attribute", atr_hitpoints_max);
			StExt_Array_SetInt("self.attribute", atr_hitpoints_max, atrMax + atr);
		}
		else if (atrIndex == atr_mana_max)
		{
			atrMax = StExt_Array_GetInt("self.attribute", atr_mana_max);
			StExt_Array_SetInt("self.attribute", atr_mana_max, atrMax + atr);
		};
		StExt_Array_SetInt("self.attribute", atrIndex, atr);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		atr = StExt_Array_GetInt("self.attribute", atrIndex);
		atr -= StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
		if (atrIndex == atr_hitpoints_max)
		{
			atrMax = StExt_Array_GetInt("self.attribute", atr_hitpoints_max);
			if (atrMax < 0) { atrMax = 0; };
			StExt_Array_SetInt("self.attribute", atr_hitpoints_max, atrMax - atr);
		}
		else if (atrIndex == atr_mana_max)
		{
			atrMax = StExt_Array_GetInt("self.attribute", atr_mana_max);
			if (atrMax < 0) { atrMax = 0; };
			StExt_Array_SetInt("self.attribute", atr_mana_max, atrMax - atr);
		}
		if (atr < 0) { atr = 0; };
		StExt_Array_SetInt("self.attribute", atrIndex, atr);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Base init func for any buff
func void StExt_Buff_Base(var c_npc target, var string loopName)
{
	var C_TimedEffect trigger;

	if (!hlp_isvalidnpc(target))
	{
		StExt_PrintDebug(loopName, "Instance is null!", target, target);
		return;
	};
	if(!StExt_Buff_CanInit(target)) { return; };
	
	trigger = GetTimedEffectByNpcAndAction(target, loopName);
	if (!Hlp_IsNULL(trigger)) { return; };
	StExt_PrintDebugStack(concatstrings("Start buff: ", loopName));
	
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellFX_HealShrine", target); };
	StExt_CheckUid(target);
	trigger = StExt_CreateTimedEffect(loopName, 1000, target, StExt_NullNpc);
	trigger.Flags = trigger.Flags | TriggerFlag_Buff;
	StExt_InitializeTimedEffect(trigger, target, StExt_Buff_Duration, StExt_Buff_Power);
	StExt_PrintTriggerDebug(target.name, loopName, StExt_Buff_Duration, StExt_Buff_Power);
};

// Base init func for any protection buff
func void StExt_Buff_BaseProt(var c_npc target, var int protIndex, var string loopName)
{
	var C_TimedEffect trigger;
	var int prot;

	if (!hlp_isvalidnpc(target))
	{
		StExt_PrintDebug(loopName, "Instance is null!", target, target);
		return;
	};
	if(!StExt_BuffProt_CanInit(target, protIndex)) { return; };
	
	trigger = GetTimedEffectByNpcAndAction(target, loopName);
	if (!Hlp_IsNULL(trigger)) { return; };
	StExt_PrintDebugStack(concatstrings("Start buff: ", loopName));
	
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellFX_HealShrine", target); };
	StExt_CheckUid(target);
	trigger = StExt_CreateTimedEffect(loopName, 1000, target, StExt_NullNpc);
	trigger.Flags = trigger.Flags | TriggerFlag_Buff;
	prot = StExt_ValidateValueRange(StExt_Buff_Power + hlp_random(50), 50, 1000);
	StExt_InitializeTimedEffect(trigger, target, StExt_Buff_Duration, prot);	
	StExt_PrintTriggerDebug(target.name, loopName, StExt_Buff_Duration, prot);
};

// Base init func for any attribute buff
func void StExt_Buff_BaseAttribute(var c_npc target, var int atrIndex, var string loopName)
{
	var C_TimedEffect trigger;
	var int atr;
	
	if (!hlp_isvalidnpc(target))
	{
		StExt_PrintDebug(loopName, "Instance is null!", target, target);
		return;
	};
	if(!StExt_Buff_CanInit(target)) { return; };	
	trigger = GetTimedEffectByNpcAndAction(target, loopName);
	if (!Hlp_IsNULL(trigger)) { return; };
	StExt_PrintDebugStack(concatstrings("Start buff: ", loopName));
	
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellFX_HealShrine", target); };
	StExt_CheckUid(target);
	trigger = StExt_CreateTimedEffect(loopName, 1000, target, StExt_NullNpc);
	trigger.Flags = trigger.Flags | TriggerFlag_Buff;
	
	if (atrIndex == atr_hitpoints_max) { atr = StExt_ValidateValueRange(StExt_Buff_Power * (10 + hlp_random(10)), 200, 10000); }
	else if (atrIndex == atr_mana_max) { atr = StExt_ValidateValueRange(StExt_Buff_Power * (5 + hlp_random(5)), 50, 5000); }
	else if ((atrIndex == atr_strength) || (atrIndex == atr_dexterity)) { atr = StExt_ValidateValueRange(StExt_Buff_Power * (3 + hlp_random(5)), 50, 1000); }
	else { atr = StExt_Buff_Power; };
	StExt_InitializeTimedEffect(trigger, target, StExt_Buff_Duration, atr);	
	StExt_PrintTriggerDebug(target.name, loopName, StExt_Buff_Duration, atr);
};

func void StExt_Buff_LightHeal()
{
	var int perc;

	if (!hlp_isvalidnpc(StExt_Self))
	{
		StExt_PrintDebug("StExt_Buff_LightHeal()", "Instance is null!", StExt_Self, StExt_Self);
		return;
	};	
	perc = 20 + hlp_random(10);
	wld_playeffect("spellfx_heal", StExt_Self, StExt_Self, 0, 0, 0, false);
	rx_restorehealthpercent(StExt_Self, perc);
};

func void StExt_Buff_MediumHeal()
{
	var int perc;

	if (!hlp_isvalidnpc(StExt_Self))
	{
		StExt_PrintDebug("StExt_Buff_MediumHeal()", "Instance is null!", StExt_Self, StExt_Self);
		return;
	};	
	perc = 40 + hlp_random(20);
	wld_playeffect("spellfx_heal", StExt_Self, StExt_Self, 0, 0, 0, false);
	rx_restorehealthpercent(StExt_Self, perc);
};

func void StExt_Buff_FullHeal()
{
	var int perc;

	if (!hlp_isvalidnpc(StExt_Self))
	{
		StExt_PrintDebug("StExt_Buff_FullHeal()", "Instance is null!", StExt_Self, StExt_Self);
		return;
	};	
	perc = 70 + hlp_random(30);
	wld_playeffect("spellfx_heal", StExt_Self, StExt_Self, 0, 0, 0, false);
	rx_restorehealthpercent(StExt_Self, perc);
};

func int StExt_Buff_ProtEdge_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtEdge_Loop", prot_edge); };
func int StExt_Buff_ProtBlunt_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtBlunt_Loop", prot_blunt); };
func int StExt_Buff_ProtPoint_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtPoint_Loop", prot_point); };
func int StExt_Buff_ProtFire_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtFire_Loop", prot_fire); };
func int StExt_Buff_ProtMagic_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtMagic_Loop", prot_magic); };
func int StExt_Buff_ProtFly_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtFly_Loop", prot_fly); };
func int StExt_Buff_ProtFall_Loop() { return StExt_Buff_BaseProt_Loop("StExt_Buff_ProtFall_Loop", prot_fall); };

func int StExt_Buff_AtrHp_Loop() { return StExt_Buff_BaseAttribute_Loop("StExt_Buff_AtrHp_Loop", atr_hitpoints_max); };
func int StExt_Buff_AtrMp_Loop() { return StExt_Buff_BaseAttribute_Loop("StExt_Buff_AtrMp_Loop", atr_mana_max); };
func int StExt_Buff_AtrStr_Loop() { return StExt_Buff_BaseAttribute_Loop("StExt_Buff_AtrStr_Loop", atr_strength); };
func int StExt_Buff_AtrAgi_Loop() { return StExt_Buff_BaseAttribute_Loop("StExt_Buff_AtrAgi_Loop", atr_dexterity); };

func void StExt_Buff_ProtEdge() { StExt_Buff_BaseProt(StExt_Self, prot_edge, "StExt_Buff_ProtEdge_Loop"); };
func void StExt_Buff_ProtBlunt() { StExt_Buff_BaseProt(StExt_Self, prot_blunt, "StExt_Buff_ProtBlunt_Loop"); };
func void StExt_Buff_ProtPoint() { StExt_Buff_BaseProt(StExt_Self, prot_point, "StExt_Buff_ProtPoint_Loop"); };
func void StExt_Buff_ProtFire() { StExt_Buff_BaseProt(StExt_Self, prot_fire, "StExt_Buff_ProtFire_Loop"); };
func void StExt_Buff_ProtMagic() { StExt_Buff_BaseProt(StExt_Self, prot_magic, "StExt_Buff_ProtMagic_Loop"); };
func void StExt_Buff_ProtFly() { StExt_Buff_BaseProt(StExt_Self, prot_fly, "StExt_Buff_ProtFly_Loop"); };
func void StExt_Buff_ProtFall() { StExt_Buff_BaseProt(StExt_Self, prot_fall, "StExt_Buff_ProtFall_Loop"); };

func void StExt_Buff_Es() { StExt_Buff_Base(StExt_Self, "StExt_Buff_Es_Loop"); };
func void StExt_Buff_Dodge() { StExt_Buff_Base(StExt_Self, "StExt_Buff_Dodge_Loop"); };
func void StExt_Buff_HpRegen() { StExt_Buff_Base(StExt_Self, "StExt_Buff_HpRegen_Loop"); };
func void StExt_Buff_Damage() { StExt_Buff_Base(StExt_Self, "StExt_Buff_Damage_Loop"); };
func void StExt_Buff_Speed() { StExt_Buff_Base(StExt_Self, "StExt_Buff_Speed_Loop"); };

func void StExt_Buff_AtrHp() { StExt_Buff_BaseAttribute(StExt_Self, atr_hitpoints_max, "StExt_Buff_AtrHp_Loop"); };
func void StExt_Buff_AtrMp() { StExt_Buff_BaseAttribute(StExt_Self, atr_mana_max, "StExt_Buff_AtrMp_Loop"); };
func void StExt_Buff_AtrStr() { StExt_Buff_BaseAttribute(StExt_Self, atr_strength, "StExt_Buff_AtrStr_Loop"); };
func void StExt_Buff_AtrAgi() { StExt_Buff_BaseAttribute(StExt_Self, atr_dexterity, "StExt_Buff_AtrAgi_Loop"); };

// Cast buffs from npc skill
func int StExt_CastBuffAbility(var c_npc slf, var int buffId)
{
	var int radius;
	var string condFunc;
	var string initFunc;
	if (!hlp_isvalidnpc(slf)) 
	{
		StExt_PrintDebug("StExt_CastBuffAbility()", "slf instance is null!", slf, other);
		return false; 
	};
	StExt_PrintDebug("StExt_CastBuffAbility(var c_npc slf, var int buffId)", concatstrings("Buff id: ", inttostring(buffId)), slf, other);
	radius = slf.level * (7 + hlp_random(5));
	radius = StExt_ValidateValueRange(radius, 500, 1500);
	if (StExt_IsSummonOrHero(slf)) { condFunc = "StExt_PcBuffSelector"; }
	else { condFunc = "StExt_EnemyBuffSelector"; };
	initFunc = "StExt_Buff_InitValues";
	
	if (buffId == StExt_Npc_Ability_BuffMassLightheal)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_LightHeal");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassMediumheal)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_MediumHeal");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassFullheal)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_FullHeal");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtEdge)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtEdge");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtBlunt)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtBlunt");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtFire)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtFire");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtFly)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtFly");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtMagic)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtMagic");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtPoint)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtPoint");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassProtPois)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_ProtFall");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraDodge)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_Dodge");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraDamage)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_Damage");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraEs)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_Es");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraStr)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_AtrStr");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraAgi)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_AtrAgi");
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraHp)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_AtrHp");
		return true;
	};	
	if (buffId == StExt_Npc_Ability_BuffMassHpRegen)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_HpRegen");
		return true;
	};	
	if (buffId == StExt_Npc_Ability_BuffSelfLightheal)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_LightHeal();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfMediumheal)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_MediumHeal();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfFullheal)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_FullHeal();
		return true;
	};	
	if (buffId == StExt_Npc_Ability_BuffSelfProtPois)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtFall();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfProtMagic)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtMagic();
		return true;
	};	
	if (buffId == StExt_Npc_Ability_BuffSelfProtPoint)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtPoint();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfProtFly)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtFly();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfProtFire)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtFire();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfProtBlunt)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtBlunt();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfProtEdge)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_ProtEdge();
		return true;
	};	
	if (buffId == StExt_Npc_Ability_BuffSelfExtraDodge)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_Dodge();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfExtraDamage)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_Damage();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfExtraEs)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_Es();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfExtraStr)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_AtrStr();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfExtraAgi)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_AtrAgi();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfExtraHp)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_AtrHp();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfHpRegen)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_HpRegen();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffSelfExtraSpeed)
	{
		StExt_Self = StExt_GetNpc(slf);
		StExt_Buff_InitValues();
		StExt_Buff_Speed();
		return true;
	};
	if (buffId == StExt_Npc_Ability_BuffMassExtraSpeed)
	{
		StExt_ForEachNpcInRadius(slf, radius, initFunc, condFunc, "StExt_Buff_Speed");
		return true;
	};

	StExt_Npc_ChangeCooldown(slf, StExt_AiVar_BuffAbilityCooldown, StExt_GetFramesFromSeconds(999));
	StExt_PrintDebug("StExt_CastBuffAbility()", concatstrings("Buff not found! AbilityId: ", inttostring(buffId)), slf, other);
	return false;
};

//*********************************************************
//					   Player buffs
//*********************************************************
var int StExt_PlayerBuff_Time;
var int StExt_PlayerBuff_Power;
var int StExt_PlayerBuff_Id;
var string StExt_PlayerBuff_Loop;

// Protection buff
func int StExt_PlayerBuff_Prot_Loop()
{
	var int prot;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Prot_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		prot = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 3, 10, 500);
		self.protection[prot_blunt] = StExt_ChangeValueIfPositive(self.protection[prot_blunt], prot);
		self.protection[prot_edge] = StExt_ChangeValueIfPositive(self.protection[prot_edge], prot);
		self.protection[prot_fire] = StExt_ChangeValueIfPositive(self.protection[prot_fire], prot);
		self.protection[prot_fly] = StExt_ChangeValueIfPositive(self.protection[prot_fly], prot);
		self.protection[prot_magic] = StExt_ChangeValueIfPositive(self.protection[prot_magic], prot);
		self.protection[prot_point] = StExt_ChangeValueIfPositive(self.protection[prot_point], prot);
		self.protection[prot_fall] = StExt_ChangeValueIfPositive(self.protection[prot_fall], prot);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue] = prot;
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		prot = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue];
		self.protection[prot_blunt] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_blunt], -prot, 0);
		self.protection[prot_edge] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_edge], -prot, 0);
		self.protection[prot_fire] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_fire], -prot, 0);
		self.protection[prot_fly] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_fly], -prot, 0);
		self.protection[prot_magic] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_magic], -prot, 0);
		self.protection[prot_point] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_point], -prot, 0);
		self.protection[prot_fall] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_fall], -prot, 0);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Hp buff
func int StExt_PlayerBuff_Hp_Loop()
{
	var int atr;
	var int atrMax;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Hp_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		atr = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * 5;
		self.attribute[atr_hitpoints_max] += atr;
		self.attribute[atr_hitpoints] += atr;
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue] = atr;
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		atr = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue];
		self.attribute[atr_hitpoints] = StExt_ValidateValueRange(self.attribute[atr_hitpoints] - atr, 100, StExt_MaxAtr);
		self.attribute[atr_hitpoints_max] = StExt_ValidateValueRange(self.attribute[atr_hitpoints_max] - atr, 100, StExt_MaxAtr);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Stats buff
func int StExt_PlayerBuff_Stats_Loop()
{
	var int atr;
	var int atrMax;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Stats_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		atr = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * 2;
		self.attribute[atr_strength] += atr;
		self.attribute[atr_dexterity] += atr;
		if (npc_isplayer(self)) { rx_changeint(atr); };
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue] = atr;
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		atr = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue];
		self.attribute[atr_strength] = StExt_ValidateValueRange(self.attribute[atr_strength] - atr, 5, StExt_MaxAtr);
		self.attribute[atr_dexterity] = StExt_ValidateValueRange(self.attribute[atr_dexterity] - atr, 5, StExt_MaxAtr);
		if (npc_isplayer(self)) { rx_changeint(-atr); };
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Regen buff
func int StExt_PlayerBuff_Regen_Loop()
{
	var int regVal;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Regen_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 10, 1, 500);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	
	regVal = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
	self.attribute[atr_hitpoints] = StExt_ValidateValueRange(self.attribute[atr_hitpoints] + regVal, 1, self.attribute[atr_hitpoints_max]);
	self.attribute[atr_mana] = StExt_ValidateValueRange(self.attribute[atr_mana] + regVal, 1, self.attribute[atr_mana_max]);
	StExt_Npc_ChangeEs(self, regVal); 
	if (npc_isplayer(self)) { rx_restorestamina(regVal * 5); };
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) { return LOOP_END; };	
	return LOOP_CONTINUE;
};

// Damage buff
func int StExt_PlayerBuff_Damage_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Damage_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * 3, 30, 1500);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMagicDamage, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMeleeDamage, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraRangeDamage, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMagicDamage, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraMeleeDamage, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeAiv(self, StExt_AiVar_ExtraRangeDamage, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Speed buff
func int StExt_PlayerBuff_Speed_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Speed_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 5, 5, 100);		
		StExt_Npc_ChangeAiv(self, aivrx_npc_speed, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeAiv(self, aivrx_npc_speed, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Dodge buff
func int StExt_PlayerBuff_Dodge_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Dodge_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 5, 50, 500);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] -= StExt_Npc_ChangeDodgeChance(self, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeDodgeChance(self, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Es buff
func int StExt_PlayerBuff_Es_Loop()
{
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_Es_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] * 10;
		StExt_Npc_ChangeMaxEs(self, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeEs(self, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeMaxEs(self, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_Npc_ChangeEs(self, -StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

// Restore buff
func int StExt_PlayerBuff_MassRestore_Loop()
{
	var int restoreVal;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerBuff_MassRestore_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	restoreVal = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 5, 10, 100);
	rx_restorehealthpercent(self, restoreVal);
	StExt_Npc_RestoreEsPerc(self, restoreVal); 
	if (npc_isplayer(self))
	{
		rx_restoremanapercent(restoreVal);
		rx_restorestaminapercent(restoreVal);
	};
	return LOOP_END;
};

func void StExt_PlayerBuff_Base(var c_npc target, var string loopName, var int buffId)
{
	var C_TimedEffect trigger;
	
	if (!hlp_isvalidnpc(target))
	{
		StExt_PrintDebug(loopName, "Instance is null!", target, target);
		return;
	};
	if(!StExt_Buff_CanInit(target)) { return; };
	
	trigger = GetTimedEffectByNpcAndAction(target, loopName);
	if (!Hlp_IsNULL(trigger)) { return; };
	StExt_PrintDebugStack(concatstrings("Start pc buff: ", loopName));
	
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellFX_HealShrine", target); };
	StExt_CheckUid(target);
	trigger = StExt_CreateTimedEffect(loopName, 1000, target, StExt_NullNpc);
	trigger.Flags = trigger.Flags | TriggerFlag_Buff;
	StExt_InitializeTimedEffect(trigger, target, StExt_PlayerBuff_Time, StExt_PlayerBuff_Power);
	
	if(npc_isplayer(target)) { StExt_AddBuffTimer(buffId, StExt_PlayerBuff_Time); };
	StExt_PrintTriggerDebug(target.name, loopName, StExt_PlayerBuff_Time, StExt_PlayerBuff_Power);	
};

func void StExt_PlayerBuff_Start() { StExt_PlayerBuff_Base(StExt_Self, StExt_PlayerBuff_Loop, StExt_PlayerBuff_Id); };

func void StExt_ApplyPlayerBuff(var string buffLoop, var int power, var int time, var int buffId)
{
	var int radius;
	StExt_PrintDebug("StExt_ApplyPlayerBuff(...)", buffLoop, self, other);
	if (hlp_strcmp(buffLoop, StExt_EmptyString))
	{
		StExt_PrintDebugStack("StExt_ApplyPlayerBuff(...) -> Buff loop is empty!");
		return;
	};	
	radius = 800 + StExt_PcStats[StExt_PcStats_Index_LightMasteryPower];
	StExt_PlayerBuff_Time = time;
	StExt_PlayerBuff_Power = power;
	StExt_PlayerBuff_Id = buffId;
	StExt_PlayerBuff_Loop = buffLoop;
	StExt_PlayerBuff_Base(hero, StExt_PlayerBuff_Loop, buffId);
	StExt_ForEachNpcInRadius(hero, radius, StExt_EmptyString, "StExt_PcBuffSelector", "StExt_PlayerBuff_Start");
	StExt_AddMasteryExp(StExt_MasteryIndex_Light, power * (7 + hlp_random(4)));
};

func int StExt_CastPlayerBuff(var int buffId, var int power, var int time)
{
	if (time <= 0) { StExt_PrintDebugStack("StExt_CastPlayerBuff(...) -> Buff time less than zero!"); return false; };
	if (power <= 0) { StExt_PrintDebugStack("StExt_CastPlayerBuff(...) -> Buff power less than zero!"); return false; };
	StExt_PrintDebug("StExt_CastPlayerBuff(...)", concatstrings("Buff id: ", inttostring(buffId)), self, other);
	time += StExt_GetPermilleFromValue(time, StExt_PcStats[StExt_PcStats_Index_EffectDuration]);
	
	if (buffId == StExt_PcBuff_Index_Protection)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Prot_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Hp)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Hp_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Stats)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Stats_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Regen)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Regen_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Damage)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Damage_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Speed)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Speed_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Dodge)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Dodge_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_Es)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_Es_Loop", power, time, buffId);
		return true;
	};
	if (buffId == StExt_PcBuff_Index_MassRestore)
	{
		StExt_ApplyPlayerBuff("StExt_PlayerBuff_MassRestore_Loop", power, time, buffId);
		return true;
	};

	StExt_PrintDebug("StExt_CastPlayerBuff(...)", concatstrings("Buff not found! BuffId: ", inttostring(buffId)), self, other);
	return false;
};

//*********************************************************
//					   Player debuffs
//*********************************************************
var int StExt_PlayerDebuff_Time;
var int StExt_PlayerDebuff_Power;
var string StExt_PlayerDebuff_Loop;

func int StExt_GetValidatedProtDifference(var int val, var int mod)
{
	if (val <= 0) { return 0; };
	if ((val - mod) < 0) { return val; };
	return mod;
};
func int StExt_PlayerDebuff_Prot_Loop()
{
	var int prot;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerDebuff_Prot_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		prot = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value], 10, 1000);
		StExt_CurrentTimedEffect.AIVariables[5] = StExt_GetValidatedProtDifference(self.protection[prot_blunt], prot);
		StExt_CurrentTimedEffect.AIVariables[6] = StExt_GetValidatedProtDifference(self.protection[prot_edge], prot);
		StExt_CurrentTimedEffect.AIVariables[7] = StExt_GetValidatedProtDifference(self.protection[prot_fire], prot);
		StExt_CurrentTimedEffect.AIVariables[8] = StExt_GetValidatedProtDifference(self.protection[prot_fly], prot);
		StExt_CurrentTimedEffect.AIVariables[9] = StExt_GetValidatedProtDifference(self.protection[prot_magic], prot);
		StExt_CurrentTimedEffect.AIVariables[10] = StExt_GetValidatedProtDifference(self.protection[prot_point], prot);
		StExt_CurrentTimedEffect.AIVariables[11] = StExt_GetValidatedProtDifference(self.protection[prot_fall], prot);		
		self.protection[prot_blunt] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_blunt], -StExt_CurrentTimedEffect.AIVariables[5], 0);
		self.protection[prot_edge] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_edge], -StExt_CurrentTimedEffect.AIVariables[6], 0);
		self.protection[prot_fire] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_fire], -StExt_CurrentTimedEffect.AIVariables[7], 0);
		self.protection[prot_fly] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_fly], -StExt_CurrentTimedEffect.AIVariables[8], 0);
		self.protection[prot_magic] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_magic], -StExt_CurrentTimedEffect.AIVariables[9], 0);
		self.protection[prot_point] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_point], -StExt_CurrentTimedEffect.AIVariables[10], 0);
		self.protection[prot_fall] = StExt_ChangeValueIfPositiveWithMin(self.protection[prot_fall], -StExt_CurrentTimedEffect.AIVariables[11], 0);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue] = prot;
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		prot = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue];
		self.protection[prot_blunt] = StExt_ChangeValueIfPositive(self.protection[prot_blunt], StExt_CurrentTimedEffect.AIVariables[5]);
		self.protection[prot_edge] = StExt_ChangeValueIfPositive(self.protection[prot_edge], StExt_CurrentTimedEffect.AIVariables[6]);
		self.protection[prot_fire] = StExt_ChangeValueIfPositive(self.protection[prot_fire], StExt_CurrentTimedEffect.AIVariables[7]);
		self.protection[prot_fly] = StExt_ChangeValueIfPositive(self.protection[prot_fly], StExt_CurrentTimedEffect.AIVariables[8]);
		self.protection[prot_magic] = StExt_ChangeValueIfPositive(self.protection[prot_magic], StExt_CurrentTimedEffect.AIVariables[9]);
		self.protection[prot_point] = StExt_ChangeValueIfPositive(self.protection[prot_point], StExt_CurrentTimedEffect.AIVariables[10]);
		self.protection[prot_fall] = StExt_ChangeValueIfPositive(self.protection[prot_fall], StExt_CurrentTimedEffect.AIVariables[11]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_PlayerDebuff_Siphon_Loop()
{
	var int damage;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerDebuff_Siphon_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 5, 1, 50);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	
	damage = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value];
	if (damage >= self.attribute) { damage = self.attribute - 1; };
	self.attribute -= damage;
	StExt_AddMasteryExp(StExt_MasteryIndex_Dark, damage);
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) { return LOOP_END; };	
	return LOOP_CONTINUE;
};

func int StExt_GetValidatedAtrDifference(var int val, var int mod)
{
	var int tmp;
	if (val <= 1) { return 0; };
	tmp = StExt_GetPermilleFromValue(val, mod);
	if ((tmp - mod) < 1) { return val - 1; };
	return tmp;
};
func int StExt_PlayerDebuff_Stats_Loop()
{
	var int atr;
	var int atrMax;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerDebuff_Stats_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		atr = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value], 10, 750);
		StExt_CurrentTimedEffect.AIVariables[5] = StExt_GetValidatedAtrDifference(self.attribute[atr_strength], atr);
		StExt_CurrentTimedEffect.AIVariables[6] = StExt_GetValidatedAtrDifference(self.attribute[atr_dexterity], atr);
		self.attribute[atr_strength] -= StExt_CurrentTimedEffect.AIVariables[5];
		self.attribute[atr_dexterity] -= StExt_CurrentTimedEffect.AIVariables[6];
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_ExtraValue] = atr;
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		self.attribute[atr_strength] += StExt_CurrentTimedEffect.AIVariables[5];
		self.attribute[atr_dexterity] += StExt_CurrentTimedEffect.AIVariables[6];
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_PlayerDebuff_Speed_Loop()
{
	var int speed;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, "StExt_PlayerDebuff_Speed_Loop", StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = StExt_ValidateValueRange(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] / 5, 5, 100);
		speed = rx_getnpcvar(self, aivrx_npc_speed);
		if ((speed - StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]) < 25) { speed -= 25; }
		else { speed = StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]; };
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] = speed;
		StExt_Npc_ChangeAiv(self, aivrx_npc_speed, -speed);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_ChangeAiv(self, aivrx_npc_speed, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_PlayerDebuff_Flagged_Loop(var int flag, var string loopName)
{
	var int speed;
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_BuffLoop_CanContinue(self)) { return LOOP_END; };
	if (StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value] <= 0) { return LOOP_END; };	
	StExt_PrintTriggerLoopDebug(self.name, loopName, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer], StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
	
	// Initialize buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] == false) 
	{
		StExt_Npc_ApplyDebuff(self, flag, StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Value]);
		StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Initialized] = true;
	};
	StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] -= 1;
	
	// Finish buff
	if(StExt_CurrentTimedEffect.AIVariables[TriggerAiv_Index_Timer] <= 0) 
	{
		StExt_Npc_RemoveDebuff(self, flag);
		return LOOP_END; 
	};	
	return LOOP_CONTINUE;
};

func int StExt_PlayerDebuff_LifeTap_Loop() { return StExt_PlayerDebuff_Flagged_Loop(StExt_DebuffFlag_LifeTap, "StExt_PlayerDebuff_LifeTap_Loop"); };
func int StExt_PlayerDebuff_ReflectDamage_Loop() { return StExt_PlayerDebuff_Flagged_Loop(StExt_DebuffFlag_ReflectDamage, "StExt_PlayerDebuff_ReflectDamage_Loop"); };
func int StExt_PlayerDebuff_ExtraDamage_Loop() { return StExt_PlayerDebuff_Flagged_Loop(StExt_DebuffFlag_ExtraDamage, "StExt_PlayerDebuff_ExtraDamage_Loop"); };
func int StExt_PlayerDebuff_Weaken_Loop() { return StExt_PlayerDebuff_Flagged_Loop(StExt_DebuffFlag_Weaken, "StExt_PlayerDebuff_Weaken_Loop"); };

func void StExt_PlayerDebuff_Base(var c_npc target, var string loopName)
{
	var C_TimedEffect trigger;

	if (!hlp_isvalidnpc(target))
	{
		StExt_PrintDebug(loopName, "Instance is null!", target, target);
		return;
	};
	if(!StExt_Buff_CanInit(target)) { return; };
	
	trigger = GetTimedEffectByNpcAndAction(target, loopName);
	if (!Hlp_IsNULL(trigger)) { return; };
	StExt_PrintDebugStack(concatstrings("Start pc debuff: ", loopName));
	
	if (StExt_Config_DisplayBuffEffects) { rx_playeffect("spellfx_beliarshrine", target); };
	StExt_CheckUid(target);
	trigger = StExt_CreateTimedEffect(loopName, 1000, target, StExt_NullNpc);
	trigger.Flags = trigger.Flags | TriggerFlag_Debuff;
	StExt_InitializeTimedEffect(trigger, target, StExt_PlayerDebuff_Time, StExt_PlayerDebuff_Power);
	StExt_PrintTriggerDebug(target.name, loopName, StExt_PlayerDebuff_Time, StExt_PlayerDebuff_Power);	
};

func void StExt_PlayerDebuff_Start() { StExt_PlayerDebuff_Base(StExt_Self, StExt_PlayerDebuff_Loop); };

func void StExt_ApplyPlayerDebuff(var string debuffLoop, var int power, var int time)
{
	var int radius;
	StExt_PrintDebug("StExt_ApplyPlayerDebuff(...)", debuffLoop, self, other);
	if (hlp_strcmp(debuffLoop, StExt_EmptyString))
	{
		StExt_PrintDebugStack("StExt_ApplyPlayerDebuff(...) -> Deuff loop is empty!");
		return;
	};	
	radius = 1200 + (5 * StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower]);
	StExt_PlayerDebuff_Time = time;
	StExt_PlayerDebuff_Power = power;
	StExt_PlayerDebuff_Loop = debuffLoop;
	StExt_ForEachNpcInRadius(hero, radius, StExt_EmptyString, "StExt_PcDebuffSelector", "StExt_PlayerDebuff_Start");
	StExt_AddMasteryExp(StExt_MasteryIndex_Dark, StExt_PlayerDebuff_Power * (7 + hlp_random(4)));
};

func int StExt_CastPlayerDebuff(var int debuffId, var int power, var int time)
{
	if (time <= 0) { StExt_PrintDebugStack("StExt_CastPlayerDebuff(...) -> Debuff time less than zero!"); return false; };
	if (power <= 0) { StExt_PrintDebugStack("StExt_CastPlayerDebuff(...) -> Debuff power less than zero!"); return false; };
	StExt_PrintDebug("StExt_CastPlayerDebuff(...)", concatstrings("Debuff id: ", inttostring(debuffId)), self, other);
	time += StExt_GetPermilleFromValue(time, StExt_PcStats[StExt_PcStats_Index_EffectDuration]);
	
	if (debuffId == StExt_PcDeBuff_Index_Protection)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_Prot_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Stats)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_Stats_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Siphon)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_Siphon_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Speed)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_Speed_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_LifeTap)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_LifeTap_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_ReflectDamage)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_ReflectDamage_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_ExtraDamage)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_ExtraDamage_Loop", power, time);
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Weaken)
	{
		StExt_ApplyPlayerDebuff("StExt_PlayerDebuff_Weaken_Loop", power, time);
		return true;
	};

	StExt_PrintDebug("StExt_CastPlayerDebuff(...)", concatstrings("Deuff not found! DeuffId: ", inttostring(debuffId)), self, other);
	return false;
};

func int StExt_CastPlayerDebuffSingle(var int debuffId, var int power, var int time, var c_npc target)
{
	if (time <= 0) { StExt_PrintDebugStack("StExt_CastPlayerDebuffSingle(...) -> Debuff time less than zero!"); return false; };
	if (power <= 0) { StExt_PrintDebugStack("StExt_CastPlayerDebuffSingle(...) -> Debuff power less than zero!"); return false; };
	time += StExt_GetPermilleFromValue(time, StExt_PcStats[StExt_PcStats_Index_EffectDuration]);
	
	if (!hlp_isvalidnpc(target)) 
	{
		StExt_PrintDebug("StExt_CastPlayerDebuffSingle()", "target instance is null!", target, other);
		return false; 
	};
	
	StExt_PrintDebug("StExt_CastPlayerDebuffSingle(...)", concatstrings("Debuff id: ", inttostring(debuffId)), self, other);
	StExt_PlayerDebuff_Time = time;
	StExt_PlayerDebuff_Power = power;
	
	if (debuffId == StExt_PcDeBuff_Index_Protection)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_Prot_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Stats)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_Stats_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Siphon)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_Siphon_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Speed)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_Speed_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_LifeTap)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_LifeTap_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_ReflectDamage)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_ReflectDamage_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_ExtraDamage)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_ExtraDamage_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};
	if (debuffId == StExt_PcDeBuff_Index_Weaken)
	{
		StExt_PlayerDebuff_Loop = "StExt_PlayerDebuff_Weaken_Loop";
		StExt_Self = StExt_GetNpc(target);
		StExt_PlayerDebuff_Start();
		return true;
	};

	StExt_PrintDebug("StExt_CastPlayerDebuffSingle(...)", concatstrings("Deuff not found! DeuffId: ", inttostring(debuffId)), self, other);
	return false;
};

func int StExt_CastPlayerRandomDebuff(var int power, var int time)
{
	var int debuffId;
	debuffId = hlp_random(8);
	return StExt_CastPlayerDebuff(debuffId, power, time);
};