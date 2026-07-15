func string StExt_GetDebugTime()
{
	var string text;
	text = "[";
	text = concatstrings(text, inttostring(wld_getday()));
	text = concatstrings(text, " ");
	text = concatstrings(text, inttostring(wld_gettimehour()));
	text = concatstrings(text, ":");
	if (wld_gettimemin() < 10) { text = concatstrings(text, "0"); };
	text = concatstrings(text, inttostring(wld_gettimemin()));
	text = concatstrings(text, "] - ");
	return text;
};

func string StExt_GetDebugInstanceName(var c_npc npc)
{
	var string text;
	text = "Null!";
	if (Hlp_IsNULL(npc)) { return text; };
	if (hlp_isvalidnpc(npc))
	{
		if (hlp_getinstanceid(npc) == hlp_getinstanceid(StExt_NullNpc) || Hlp_IsNULL(npc)) { return text; };
		if (hlp_getinstanceid(npc) == StExt_Null) 
		{
			text = "-= ??? =-";
			return text;
		}
		else if (npc_isplayer(npc)) { text = "Hero"; }
		else if (Hlp_StrCmp(npc.name, StExt_EmptyString)) { text = "-=No name=-"; }
		else { text = npc.name; };
		
		text = concatstrings(text, " [");
		text = concatstrings(text, inttostring(hlp_getinstanceid(npc)));
		text = concatstrings(text, " | UId: ");
		text = concatstrings(text, inttostring(rx_getnpcvar(npc, StExt_AiVar_Uid)));
		text = concatstrings(text, "]");
	};
	return text;
};

func void StExt_PrintDebug(var string funcId, var string msg, var c_npc slf, var c_npc oth)
{
	var string text;
	if(StExt_Config_DebugEnabled)
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "func call: ");
		text = concatstrings(text, funcId);
		text = concatstrings(text, "; msg: '");
		text = concatstrings(text, msg);
		text = concatstrings(text, "'; self: ");
		text = concatstrings(text, StExt_GetDebugInstanceName(slf));
		text = concatstrings(text, "; other: ");
		text = concatstrings(text, StExt_GetDebugInstanceName(oth));
		StExt_Cmd(text);
	};
};

func void StExt_PrintDebugStack(var string funcId)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "func call -> ");
		text = concatstrings(text, funcId);
		
		text = concatstrings(text, " (self: ");
		text = concatstrings(text, StExt_GetDebugInstanceName(self));
		text = concatstrings(text, "; other: ");
		text = concatstrings(text, StExt_GetDebugInstanceName(other));
		text = concatstrings(text, ")");
		StExt_Cmd(text);
	};
};

func void StExt_PrintDamageDebugStack(var string funcId)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "func call -> ");
		text = concatstrings(text, funcId);
		
		text = concatstrings(text, " (atk: ");
		text = concatstrings(text, StExt_GetDebugInstanceName(StExt_AttackNpc));
		text = concatstrings(text, "; target: ");
		text = concatstrings(text, StExt_GetDebugInstanceName(StExt_TargetNpc));
		text = concatstrings(text, ")");
		StExt_Cmd(text);
	};
};

func void StExt_PrintSumonDebug(var int max, var int alloc, var int now)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "SummonStats -> Max: ");
		text = concatstrings(text, inttostring(max));
		text = concatstrings(text, "; Now: '");
		text = concatstrings(text, inttostring(now));
		text = concatstrings(text, "'; Added: ");
		text = concatstrings(text, inttostring(alloc));		
		StExt_Cmd(text);
	};
};

func void StExt_PrintLootDebug(var string type, var int power, var int count)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "Generate Loot -> Type: ");
		text = concatstrings(text, type);
		text = concatstrings(text, "; Power: ");
		text = concatstrings(text, inttostring(power));
		text = concatstrings(text, "; ItemsCount: ");
		text = concatstrings(text, inttostring(count));		
		StExt_Cmd(text);
	};
};

func void StExt_PrintLootInitDebug(var string type, var int powerBonus, var int moneyBonus)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "Initialize Loot -> Source: ");
		text = concatstrings(text, type);
		text = concatstrings(text, "; Power: ");
		text = concatstrings(text, inttostring(powerBonus));
		text = concatstrings(text, "; Money: ");
		text = concatstrings(text, inttostring(moneyBonus));		
		StExt_Cmd(text);
	};
};

func void StExt_PrintTriggerComparerDebug(var int trigger, var int pTarget, var int pTargetSelf, var string action, var string msg)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "CompareTrigger - ");
		text = concatstrings(text, msg);
		text = concatstrings(text, " [");
		text = concatstrings(text, "TriggerId: ");
		text = concatstrings(text, inttostring(trigger));
		text = concatstrings(text, " pTargetUid: ");
		text = concatstrings(text, inttostring(pTarget));
		text = concatstrings(text, " pTriggerTargetUid: ");
		text = concatstrings(text, inttostring(pTargetSelf));
		text = concatstrings(text, " Action: '");
		text = concatstrings(text, action);
		text = concatstrings(text, "']");
		StExt_Cmd(text);
	};
};

func void StExt_PrintDaggetEffectDebug(var int id, var int val, var int ticks)
{
	var string text;
	if(StExt_Config_DebugEnabled) 
	{
		text = StExt_GetDebugTime();
		text = concatstrings(text, "ApplyDaggerEffect [id: ");
		text = concatstrings(text, inttostring(id));
		text = concatstrings(text, "; Value: ");
		text = concatstrings(text, inttostring(val));
		text = concatstrings(text, "; Time: ");
		text = concatstrings(text, inttostring(ticks));	
		text = concatstrings(text, ";]");
		StExt_Cmd(text);
	};
};

func void StExt_PrintDamageDebug(var string source)
{
	var string text;
	var string atkName;
	var string tarName;
    
	if(StExt_Config_DebugEnabled) 
	{
		atkName = StExt_GetDebugInstanceName(StExt_AttackNpc);
		tarName = StExt_GetDebugInstanceName(StExt_TargetNpc);
		
		StExt_Cmd(StExt_EmptyString);
		text = StExt_GetDebugTime();
		text = concatstrings(text, "(");
		text = concatstrings(text, source);
		text = concatstrings(text, ") ");		
		text = concatstrings(text, "Damage From: '");
		text = concatstrings(text, atkName);
		text = concatstrings(text, "' To: '");
		text = concatstrings(text, tarName);
		text = concatstrings(text, "' DamageTotal: ");
		text = concatstrings(text, inttostring(StExt_DamageInfo.TotalDamage));
		text = concatstrings(text, " RealDamage: ");
		text = concatstrings(text, inttostring(StExt_DamageInfo.RealDamage));
		StExt_Cmd(text);
		text = concatstrings("Damages[8] - ", inttostring(StExt_DamageInfo.Damage[0]));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[1])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[2])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[3])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[4])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[5])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[6])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_DamageInfo.Damage[7])));
		StExt_Cmd(text);
		text = concatstrings("DamageEnum: ", inttostring(StExt_DamageInfo.DamageEnum));
		text = concatstrings(text, concatstrings(", WeaponEnum: ", inttostring(StExt_DamageInfo.WeaponEnum)));
		text = concatstrings(text, concatstrings(", DamageType: ", inttostring(StExt_DamageInfo.DamageType)));
		text = concatstrings(text, concatstrings(", DamageFlags: ", inttostring(StExt_DamageInfo.DamageFlags)));
		StExt_Cmd(text);
		text = concatstrings("SpellId: ", inttostring(StExt_DamageInfo.SpellId));
		StExt_Cmd(text);
		StExt_Cmd(StExt_EmptyString);
	};
};

func void StExt_PrintExtraDamageDebug(var string source)
{
	var string text;
	var string atkName;
	var string tarName;
    
	if(StExt_Config_DebugEnabled) 
	{
		atkName = StExt_GetDebugInstanceName(StExt_AttackNpc);
		tarName = StExt_GetDebugInstanceName(StExt_TargetNpc);
		
		StExt_Cmd(StExt_EmptyString);
		text = StExt_GetDebugTime();
		text = concatstrings(text, "[ExtraDamage] (");
		text = concatstrings(text, source);
		text = concatstrings(text, ") ");		
		text = concatstrings(text, "Damage From: '");
		text = concatstrings(text, atkName);
		text = concatstrings(text, "' To: '");
		text = concatstrings(text, tarName);
		text = concatstrings(text, "' DamageTotal: ");
		text = concatstrings(text, inttostring(StExt_ExtraDamageInfo.TotalDamage));
		text = concatstrings(text, " MaxTargets: ");
		text = concatstrings(text, inttostring(StExt_ExtraDamageInfo.MaxTargets));
		StExt_Cmd(text);
		text = concatstrings("Damages[8] - ", inttostring(StExt_ExtraDamageInfo.Damage[0]));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[1])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[2])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[3])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[4])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[5])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[6])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.Damage[7])));
		StExt_Cmd(text);
		
		text = concatstrings("DotDamage[8] - ", inttostring(StExt_ExtraDamageInfo.DotDamage[0]));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[0])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[1])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[1])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[2])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[2])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[3])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[3])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[4])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[4])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[5])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[5])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[6])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[6])));		
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_ExtraDamageInfo.DotDamage[7])));
		text = concatstrings(text, concatstrings("/", inttostring(StExt_ExtraDamageInfo.Ticks[7])));
		StExt_Cmd(text);
		
		text = concatstrings("DamageType: ", inttostring(StExt_ExtraDamageInfo.DamageType));
		text = concatstrings(text, concatstrings(", DamageFlags: ", inttostring(StExt_ExtraDamageInfo.DamageFlags)));

		StExt_Cmd(text);
		StExt_Cmd(StExt_EmptyString);
	};
};

func void StExt_PrintIncomingDamageDebug(var string source)
{
	var string text;
	var string atkName;
	var string tarName;
    
	if(StExt_Config_DebugEnabled) 
	{
		atkName = StExt_GetDebugInstanceName(StExt_AttackNpc);
		tarName = StExt_GetDebugInstanceName(StExt_TargetNpc);
		
		StExt_Cmd(StExt_EmptyString);
		text = StExt_GetDebugTime();
		text = concatstrings(text, "(");
		text = concatstrings(text, source);
		text = concatstrings(text, ") ");		
		text = concatstrings(text, "Damage From: '");
		text = concatstrings(text, atkName);
		text = concatstrings(text, "' To: '");
		text = concatstrings(text, tarName);
		text = concatstrings(text, "' DamageTotal: ");
		text = concatstrings(text, inttostring(StExt_IncomingDamageInfo.DamageTotal));
		StExt_Cmd(text);
		
		text = concatstrings("Damages[8] - ", inttostring(StExt_IncomingDamageInfo.Damage[0]));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[1])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[2])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[3])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[4])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[5])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[6])));
		text = concatstrings(text, concatstrings(" | ", inttostring(StExt_IncomingDamageInfo.Damage[7])));
		StExt_Cmd(text);
		
		text = concatstrings("DamageType: ", inttostring(StExt_IncomingDamageInfo.DamageType));
		text = concatstrings(text, concatstrings(", DamageFlags: ", inttostring(StExt_IncomingDamageInfo.DamageFlags)));
		StExt_Cmd(text);
		
		text = concatstrings("Flags: ", inttostring(StExt_IncomingDamageInfo.Flags));
		text = concatstrings(text, concatstrings(", SpellId: ", inttostring(StExt_IncomingDamageInfo.SpellId)));
		StExt_Cmd(text);
		StExt_Cmd(StExt_EmptyString);
	};
};