func void spell_cast_palheal() 
{
	spell_cast_palheal_old();
	StExt_GiveMasteryExpBySpell(spl_pallightheal, 1000 + (hero.level * 100));
};

func void spell_cast_tplheal() 
{
    spell_cast_tplheal_old();
    StExt_HandleHealingSpell(self);
	StExt_GiveMasteryExpBySpell(spl_tpllightheal, 500 + (hero.level * 50));
};

func void spell_cast_tplmediumheal() 
{
    spell_cast_tplmediumheal_old();
    StExt_HandleHealingSpell(self);
	StExt_GiveMasteryExpBySpell(spl_tplmediumheal, 750 + (hero.level * 100));
};

func void spell_cast_tplheavyheal() 
{
    spell_cast_tplheavyheal_old();
    StExt_HandleHealingSpell(self);
	StExt_GiveMasteryExpBySpell(spl_tplheavyheal, 1000 + (hero.level * 100));
};

func void spell_cast_tplsuperheal() 
{
    spell_cast_tplsuperheal_old();
    StExt_HandleHealingSpell(self);
	StExt_GiveMasteryExpBySpell(spl_tplsuperheal, 1500 + (hero.level * 150));
};

func void spell_cast_heal() 
{
	spell_cast_heal_old();
    StExt_HandleHealingSpell(self);
	StExt_GiveMasteryExpBySpell(spl_lightheal, 1000 + (hero.level * 100));	
};

// -= New Spells Logic =-
instance spell_summondarkgolem (C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_summondarkgolem (var int manaInvested)
{
    if (sactanomeprogress == true) { sactanomeprogress = false; };
    if (npc_isplayer(self) && rx_isshaman()) 
	{
        ai_print(StExt_Str_ShamansCantSummon);
        return spl_sendstop;
    };
    if (!StExt_CanSummon(2))
	{
        if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); }
        else { ai_print(StExt_Str_MaxSummonCount); };
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_summondarkgolem) { return spl_sendcast; }
    else if (npc_isplayer(self) && (xardas_knowssactanome == true) && (sactanomeprogress == false)) 
	{
        sactanomeprogress = true;
        return spl_sendcast;
    }
    else { return spl_sendstop; };
    return spl_sendstop;
};  
func void spell_cast_summondarkgolem()
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (sactanomeprogress == true) 
	{
        if (npc_getactivespellisscroll(self))
		{
            if (self.attribute[2] >= spl_cost_scroll2) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
            else { self.attribute = self.attribute - (spl_cost_scroll2 * 2); };
        }
        else if (self.attribute[2] >= spl_cost_summondarkgolem) { self.attribute[2] = self.attribute[2] - spl_cost_summondarkgolem; }
        else { self.attribute = self.attribute - (spl_cost_summondarkgolem * 2); };
        sactanomeprogress = false;
    }
    else if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_summondarkgolem; };
    if (npc_isplayer(self)) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            rx_summoncount += 2;
            wld_spawnnpcrange(self, summoned_darkgolem, 1, 500.0);
        }
        else if ((npc_gettalentskill(hero, npc_talent_mage) >= 3) || (rx_isinteractiveactive > 0)) 
		{
			if (rx_keypressed("KEY_NONTARGET_ACTION", false, false)) { spawntotarget(summoned_darkgolem, 1, 500.0); }
			else 
			{
				wld_spawnnpcrange(self, summoned_darkgolem, 1, 500.0);
				rx_summoncount += 2;
			};
        }
		else { b_say(self, self, "$DONTWORK"); };
        if (sactanomeprogress != true) { self.attribute[2] = self.attribute[2] + spl_cost_summondarkgolem; }
        else if (npc_getactivespellisscroll(self)) { self.attribute = self.attribute + (spl_cost_scroll2 * 2); }
        else { self.attribute = self.attribute + (spl_cost_summondarkgolem * 2); };
    }
    else { wld_spawnnpcrange(self, stonegolem, 1, 700.0); };
    rx_runeroutine(self);
};	

instance spell_summondeathhound (C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  

func int spell_logic_summondeathhound (var int manaInvested)
{
    if (sactanomeprogress == true) { sactanomeprogress = false; };
    if (npc_isplayer(self) && rx_isshaman()) 
	{
		ai_print(StExt_Str_ShamansCantSummon);
		return spl_sendstop;
    };
    if (!StExt_CanSummon(1)) 
	{
        if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); }
        else { ai_print(StExt_Str_MaxSummonCount); };
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll3)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_summondeathhound) { return spl_sendcast; }
    else if (npc_isplayer(self) && (xardas_knowssactanome == true) && (sactanomeprogress == false)) 
	{
        sactanomeprogress = true;
        return spl_sendcast;
    }
    else { return spl_sendstop; };
    return spl_sendstop;
};  
func void spell_cast_summondeathhound()
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (sactanomeprogress == true) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            if (self.attribute[2] >= spl_cost_scroll3) { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; }
            else { self.attribute = self.attribute - (spl_cost_scroll3 * 2); };
        }
        else if (self.attribute[2] >= spl_cost_summondeathhound) { self.attribute[2] = self.attribute[2] - spl_cost_summondeathhound; }
        else { self.attribute = self.attribute - (spl_cost_summondeathhound * 2); };
        sactanomeprogress = false;
    }
    else if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_summondeathhound; };
    if (npc_isplayer(self)) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            rx_summoncount += 1;
            wld_spawnnpcrange(self, summoned_shadowbeast_skeleton, 1, 500.0);
        }
        else if ((npc_gettalentskill(hero, npc_talent_mage) >= 1) || (rx_isinteractiveactive > 0)) 
		{
			if (rx_keypressed("KEY_NONTARGET_ACTION", false, false)) 
			{ 
				spawntotarget(summoned_shadowbeast_skeleton, 1, 500.0);
			}
			else 
			{
				wld_spawnnpcrange(self, summoned_shadowbeast_skeleton, 1, 500.0);
				rx_summoncount += 1;
			};
        }
		else { b_say(self, self, "$DONTWORK"); };
        if (sactanomeprogress != true) { self.attribute[2] = self.attribute[2] + spl_cost_summondeathhound; }
        else if (npc_getactivespellisscroll(self)) { self.attribute = self.attribute + (spl_cost_scroll3 * 2); }
        else { self.attribute = self.attribute + (spl_cost_summondeathhound * 2); };
    }
    else { wld_spawnnpcrange(self, shadowbeast_skeleton, 1, 700.0); };
    rx_runeroutine(self);
};	

instance spell_stextmagicbolt(c_spell_proto) 
{
    time_per_mana = 0.0;
    damage_per_level = spl_damage_stextmagicbolt;
    damagetype = dam_magic;
};
func int spell_logic_stextmagicbolt(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_stextmagicbolt) { return spl_sendcast; }
    else { return spl_sendstop; };
    return spl_sendstop;
};
func void spell_cast_stextmagicbolt(var int spelllevel) 
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_stextmagicbolt; };
    rx_runeroutine(self);
};

instance spell_summon_skeleton_mage (C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_summon_skeleton_mage (var int manaInvested)
{
    if (sactanomeprogress == true) { sactanomeprogress = false; };
    if (npc_isplayer(self) && rx_isshaman()) 
	{
        ai_print(StExt_Str_ShamansCantSummon);
        return spl_sendstop;
    };
    if (!StExt_CanSummon(2)) 
	{
        if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); }
        else { ai_print(StExt_Str_MaxSummonCount); };
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_summon_skeleton_mage) { return spl_sendcast; }
    else if (npc_isplayer(self) && (xardas_knowssactanome == true) && (sactanomeprogress == false))
	{
        sactanomeprogress = true;
        return spl_sendcast;
    }
    else { return spl_sendstop; };
    return spl_sendstop;
};  
func void spell_cast_summon_skeleton_mage()
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (sactanomeprogress == true) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            if (self.attribute[2] >= spl_cost_scroll2) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
            else { self.attribute = self.attribute - (spl_cost_scroll2 * 2); };
        }
        else if (self.attribute[2] >= spl_cost_summon_skeleton_mage) { self.attribute[2] = self.attribute[2] - spl_cost_summon_skeleton_mage; }
        else { self.attribute = self.attribute - (spl_cost_summon_skeleton_mage * 2); };
        sactanomeprogress = false;
    }
    else if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_summon_skeleton_mage; };
    if (npc_isplayer(self)) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            rx_summoncount += 2;
            wld_spawnnpcrange(self, summoned_skeleton_stonedmage, 1, 500.0);
        }
        else if (npc_gettalentskill(hero, npc_talent_mage) >= 4)
		{
			if (rx_keypressed("KEY_NONTARGET_ACTION", false, false)) 
			{
				spawntotarget(summoned_skeleton_stonedmage, 1, 500.0);
				rx_summoncount += 2;
			}
			else 
			{
				wld_spawnnpcrange(self, summoned_skeleton_stonedmage, 1, 500.0);
				rx_summoncount += 2;
			};
        }
		else { b_say(self, self, "$DONTWORK"); };
        if (sactanomeprogress != true) { self.attribute[2] = self.attribute[2] + spl_cost_summon_skeleton_mage; }
        else if (npc_getactivespellisscroll(self)) { self.attribute = self.attribute + (spl_cost_scroll2 * 2); }
        else { self.attribute = self.attribute + (spl_cost_summon_skeleton_mage * 2); };
    }
    else { wld_spawnnpcrange(self, skeletonmage, 1, 700.0); };
    rx_runeroutine(self);
};	

func int spell_logic_agro(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll3)) {
        return spl_sendcast;
    };
    return spell_logic_agro_old(manaInvested);
};
func void spell_cast_agro() 
{
	spell_cast_agro_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; };
	StExt_GiveMasteryExpBySpell(spl_agro, 1000 + (hero.level * 100));
};

func int spell_logic_dot_first(var int manainvested) {
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll)) { return spl_sendcast; };
    return spell_logic_dot_first_old(manaInvested);
};

func void spell_cast_dot_first() 
{
	spell_cast_dot_first_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll; };    
};

func int spell_logic_dark_invis(var int manainvested) {
    if (rx_darkruneinvis_cd > 0) 
	{
        ai_printmiddle(StExt_Str_NotTimeNotify);
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll5)) {
        return spl_sendcast;
    };
    return spell_logic_dark_invis_old(manaInvested);
};
func void spell_cast_dark_invis() 
{
	spell_cast_dark_invis_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll5; };
	StExt_GiveMasteryExpBySpell(spl_dark_invis, 1000 + (hero.level * 100));
};

func int spell_logic_darkcontrol(var int manainvested) 
{
    if ((!rx_isdarkmage()) && (rx_isinteractiveactive <= 0)) { return spl_sendstop; };
    if (rx_isshaman()) 
	{
        ai_print(StExt_Str_ShamansCantSummon);
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll4)) { return spl_sendcast; };
    return spell_logic_darkcontrol_old(manaInvested);
};
func void spell_cast_darkcontrol()
{
    spell_cast_darkcontrol_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll4; };
	StExt_GiveMasteryExpBySpell(spl_darkcontrol, 1000 + (hero.level * 100));
};

func int spell_logic_darksleep(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll)) 
	{ 
		StExt_GiveMasteryExpBySpell(spl_darksleep, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
    return spell_logic_darksleep_old(manaInvested);
};

func int spell_logic_massagro(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll6)) { return spl_sendcast; };
    return spell_logic_massagro_old(manaInvested);
};
func void spell_cast_massagro() 
{
    spell_cast_massagro_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll6; };
	StExt_GiveMasteryExpBySpell(spl_massagro, 1000 + (hero.level * 100));
};

func int spell_logic_massdot(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll6)) { return spl_sendcast; };
    return spell_logic_massdot_old(manaInvested);
};
func void spell_cast_massdot() 
{
    spell_cast_massdot_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll6; };
};

func int spell_logic_dot_second(var int manainvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; };
    return spell_logic_dot_second_old(manaInvested);
};
func void spell_cast_dot_second()
{
    spell_cast_dot_second_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; };
};

func int spell_logic_darkball(var int manainvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll3)) { return spl_sendcast; };
    return spell_logic_darkball_old(manaInvested);
};
func void spell_cast_darkball()
{
    spell_cast_darkball_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; };
};

func int spell_logic_darkspear(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll3)) { return spl_sendcast; };
    return spell_logic_darkspear_old(manaInvested);
};
func void spell_cast_darkspear()
{
    spell_cast_darkspear_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; };
};

func int spell_logic_bigdarkball(var int manainvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll4)) { return spl_sendcast; };
    return spell_logic_bigdarkball_old(manaInvested);
};
func void spell_cast_bigdarkball()
{
    spell_cast_bigdarkball_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll4; };
};

func int spell_logic_darkwave(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll5)) { return spl_sendcast; };
    return spell_logic_darkwave_old(manaInvested);
};
func void spell_cast_darkwave() 
{
    spell_cast_darkwave_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll5; };
};

func int spell_logic_torture(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll5)) { return spl_sendcast; };
    return spell_logic_torture_old(manaInvested);
};
func void spell_cast_torture()
{
    spell_cast_torture_old();
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll5; };
};

func int spell_logic_summon_skeleton_uniq(var int manainvested) 
{
	if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) 
	{ 
		StExt_GiveMasteryExpBySpell(spl_summon_skeleton_uniq, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
    return spell_logic_summon_skeleton_uniq_old(manaInvested);
};

func int spell_logic_darkpetsummon(var int manainvested) 
{
	if (self.attribute[atr_mana_max] < 10) { return spl_sendstop; };
	if (darkpetisup) { return spl_sendstop; };
	if (!StExt_CanSummon(2)) 
	{
		ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1);
		return spl_sendstop;
	};
  
	spl_cost_darkpetsummon = StExt_GetPercentFromValue(hero.attribute[atr_mana_max], 33);	
	if (self.attribute[atr_mana] >= spl_cost_darkpetsummon) { return spl_sendcast; }
	else if (npc_getactivespellisscroll(self) && (self.attribute[atr_mana] >= spl_cost_scroll2)) { return spl_sendcast; }
	else { return spl_sendstop; };
    return spl_sendstop;
};

func void spell_cast_darkpetsummon() 
{
	spell_cast_darkpetsummon_old();
	rx_summoncount = StExt_ValidateValueMin(rx_summoncount - 2, 0);
	StExt_GiveMasteryExpBySpell(spl_darkpetsummon, 1000 + (hero.level * 100));
};

func void spell_cast_firelight() 
{
	if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };	
    spell_cast_firelight_old();
	StExt_GiveMasteryExpBySpell(spl_firelight, 1000 + (hero.level * 100));
    if (npc_getactivespellisscroll(self)) 
	{
        fireshieldisup = true;
        tempfireshieldtick = 0;
        rx_playeffect("VOB_MAGICBURN_NOSND", self);
    }
	else if (StExt_CanLearnFiremage)
	{
		fireshieldisup = true;
        tempfireshieldtick = 0;
        rx_playeffect("VOB_MAGICBURN_NOSND", self);
	};
};

func int spell_logic_sumkhub(var int manainvested) 
{
	var int result;	
	if ((self.attribute[2] >= spl_cost_sumkhub) && StExt_CanSummon(1) && rx_demonhub_learned && (!rx_demonhub_active)) 
	{ 
		StExt_GiveMasteryExpBySpell(spl_sumkhub, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	result = spell_logic_sumkhub_old(manainvested);
	return result;
};

func int spell_logic_darkrune_lord(var int manainvested) 
{
	var int result;
	result = spell_logic_darkrune_lord_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_lord) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_lord, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkrune_illness(var int manainvested)
{
	var int result;
	result = spell_logic_darkrune_illness_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_illness) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_illness, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkrune_steal(var int manainvested)
{
    var int result;
	result = spell_logic_darkrune_steal_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_steal) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_steal, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkrune_defense(var int manainvested)
{
    var int result;
	result = spell_logic_darkrune_defense_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_defense) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_defense, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkstatsup(var int manainvested)
{
	var int result;
	result = spell_logic_darkstatsup_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkstatsup) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkstatsup, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkrune_absorb(var int manainvested)
{
    var int result;
	result = spell_logic_darkrune_absorb_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_absorb) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_absorb, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkrune_edefense(var int manainvested)
{
	var int result;
	result = spell_logic_darkrune_edefense_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_edefense) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_edefense, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};
func int spell_logic_darkrune_healpet(var int manainvested)
{
    var int result;
	result = spell_logic_darkrune_healpet_old(manainvested);
	if ((self.attribute[2] >= spl_cost_darkrune_healpet) && (StExt_CanLearnDemon == true))
	{ 
		StExt_GiveMasteryExpBySpell(spl_darkrune_healpet, 1000 + (hero.level * 100));
		return spl_sendcast; 
	};
	return result;
};

func int spell_logic_summoncrait(var int manainvested) 
{
	var int result;	
	result = spell_logic_summoncrait_old(manainvested);
	if (rx_crchanged || rx_use_itpo_mud) { return spl_sendstop; };
	if (rx_checkandshowarenapet()) { return spl_sendstop; };
	if (craitisup) { return spl_sendstop; };
	if ((self.attribute[2] >= spl_cost_trfrune) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 2)) { return spl_sendcast; };
	if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_trfrune)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_trfrune) { return spl_sendcast; };
    return result;
};

func int spell_logic_sumdsnapper(var int manainvested) 
{
	var int result;
	result = spell_logic_sumdsnapper_old(manainvested);   
	if (dsnapperisup) { return  spl_sendstop; };
	if (rx_checkandshowarenapet()) { return spl_sendstop; };
	if ((self.attribute[2] >= spl_cost_dsnapper) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 2)) { result = spl_sendcast; };	
    return result;
};

func int spell_logic_armyofdarkness(var int manainvested)
{
    var int slotsleft;
    if (sactanomeprogress == true) { sactanomeprogress = false; };
    if (npc_isplayer(self) && rx_isshaman())
	{
        ai_print(StExt_Str_ShamansCantSummon);
        return spl_sendstop;
    };
    slotsleft = getsummoncountmax() - rx_summoncount;
    if (rx_checkandshowarenaspell()) { return spl_sendstop; };
    if (npc_getactivespellisscroll(self)) 
	{
        if (self.attribute[2] >= spl_cost_scroll6)
		{
            if (StExt_CanSummon(3)) { return spl_sendcast; }
            else { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); };
        }
        else { return spl_sendcast; };
    }
    else if ((self.attribute[2] >= rx_getarmyofdarknessmana()) && StExt_CanSummon(3)) { return spl_sendcast; }
    else if (npc_isplayer(self) && (xardas_knowssactanome == true) && (sactanomeprogress == false))
	{
        sactanomeprogress = true;
        return spl_sendcast;
    }
    else { return spl_sendstop; };
    return spl_sendstop;
};

func int spell_logic_rapidicebolt(var int manainvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2) && (hlp_getinstanceid(self) == hlp_getinstanceid(hero))) {
        return spl_sendcast;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_icecube) { return spl_sendcast; }
    else { return spl_sendstop; };
    return spl_sendstop;
};

func void spell_cast_rapidicebolt()
{
	if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_icecube; };
    rx_runeroutine(self);
};

func int spell_logic_rapidfirebolt(var int manainvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_instantfireball) { return spl_sendcast; }
    else { return spl_sendstop ; };
    return spl_sendstop;
};

func void spell_cast_rapidfirebolt()
{
	if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_instantfireball; };
    rx_runeroutine(self);
};

func int spell_logic_elevate(var int manainvested) 
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= (self.attribute[3] + 1) / 3)) { return spl_sendcast; }
    else if (self.attribute[2] >= self.attribute[3] / 2) { return spl_sendcast; }
    else { return spl_sendstop; };
    return spl_sendstop;
};

func void spell_cast_elevate(var int spelllevel) 
{
	var int elevateBonus;
	if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_isplayer(self))	{
		StExt_ApplyTimedEffect(self, self, StExt_TimedEffect_Index_Elevation);
	};
    rx_runeroutine(self);
};

func int spell_logic_pallight(var int manainvested) 
{
	if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_pallight) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) 
	{
		StExt_GiveMasteryExpBySpell(spl_pallight, 1000 + (hero.level * 100));
		return spl_sendcast;
    };
	return spell_logic_pallight_old(manainvested);
};

func int spell_logic_pallightheal(var int manainvested) 
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };	
    if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_pallightheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) 
	{ 
		StExt_GiveMasteryExpBySpell(spl_pallightheal, 1000 + (hero.level * 100));
		return spl_sendcast;
    };
	return spell_logic_pallightheal_old(manainvested);
};

func int spell_logic_palmediumheal(var int manainvested) 
{
    if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_palmediumheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) 
	{
		StExt_GiveMasteryExpBySpell(spl_palmediumheal, 1000 + (hero.level * 100));
        return spl_sendcast;
    };
	return spell_logic_palmediumheal_old(manainvested);
};

func int spell_logic_palfullheal(var int manainvested) 
{
    if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_palfullheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) 
	{
		StExt_GiveMasteryExpBySpell(spl_palfullheal, 1000 + (hero.level * 100));
        return spl_sendcast;
    };
	return spell_logic_palfullheal_old(manainvested);
};

func int spell_logic_tpllightheal(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tpllightheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
		return spl_sendcast;
	};
    return spell_logic_tpllightheal_old(manainvested);
};

func int spell_logic_tplmediumheal(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tplmediumheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_tplmediumheal_old(manainvested);
};

func int spell_logic_tplheavyheal(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tplheavyheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_tplheavyheal_old(manainvested);
};

func int spell_logic_tplsuperheal(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tplsuperheal) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_tplsuperheal_old(manainvested);
};

func int spell_logic_tpllightstrike(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tpllightstrike) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0))	{
        return spl_sendcast;
    };
    return spell_logic_tpllightstrike_old(manainvested);
};

func int spell_logic_tplmediumstrike(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tplmediumstrike) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_tplmediumstrike_old(manainvested);
};

func int spell_logic_tplheavystrike(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tplheavystrike) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_tplheavystrike_old(manainvested);
};

func int spell_logic_tplsuperstrike(var int manainvested) 
{
    if (npc_isplayer(self) && (self.attribute[2] >= spl_cost_tplsuperstrike) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0))	{
        return spl_sendcast;
    };
    return spell_logic_tplsuperstrike_old(manainvested);
};

func int spell_logic_paldestroyevil(var int manainvested) 
{
    if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_paldestroyevil) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_paldestroyevil_old(manainvested);
};

func int spell_logic_palholybolt(var int manainvested) 
{
    if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_palholybolt) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_palholybolt_old(manainvested);
};

func int spell_logic_palrepelevil(var int manainvested) 
{
    if (!npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_palrepelevil) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0)) {
        return spl_sendcast;
    };
    return spell_logic_palrepelevil_old(manainvested);
};

instance spell_summon_hollywisp(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_summon_hollywisp(var int manaInvested)
{
    if (!StExt_CanSummon(1)) 
	{
        if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); }
        else { ai_print(StExt_Str_MaxSummonCount); };
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_scroll4) { return spl_sendcast; };
    return spl_sendstop;
};  
func void spell_cast_summon_hollywisp()
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll2; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_scroll4; };
    if (npc_isplayer(self)) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            rx_summoncount += 1;
            wld_spawnnpcrange(self, stext_hollywisp, 1, 500.0);
        }
        else if (npc_gettalentskill(hero, npc_talent_mage) >= 1)
		{
			if (rx_keypressed("KEY_NONTARGET_ACTION", false, false)) {
				spawntotarget(stext_hollywisp, 1, 500.0);
				rx_summoncount += 1;
			}
			else {
				wld_spawnnpcrange(self, stext_hollywisp, 1, 500.0);
				rx_summoncount += 1;
			};
        }
		else { b_say(self, self, "$DONTWORK"); };
    };
    rx_runeroutine(self);
};

instance spell_summonairgolem(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_summonairgolem(var int manaInvested)
{
    if (!StExt_CanSummon(2)) 
	{
        if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); }
        else { ai_print(StExt_Str_MaxSummonCount); };
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll4)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_scroll5) { return spl_sendcast; };
    return spl_sendstop;
};  
func void spell_cast_summonairgolem()
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - spl_cost_scroll4; }
    else { self.attribute[2] = self.attribute[2] - spl_cost_scroll5; };
    if (npc_isplayer(self)) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            rx_summoncount += 2;
            wld_spawnnpcrange(self, summoned_airgolem, 1, 500.0);
        }
        else if (npc_gettalentskill(hero, npc_talent_mage) >= 1)
		{
			if (rx_keypressed("KEY_NONTARGET_ACTION", false, false)) {
				spawntotarget(summoned_airgolem, 1, 500.0);
				rx_summoncount += 2;
			}
			else {
				wld_spawnnpcrange(self, summoned_airgolem, 1, 500.0);
				rx_summoncount += 2;
			};
        }
		else { b_say(self, self, "$DONTWORK"); };
    };
    rx_runeroutine(self);
};

func int StExt_Buff_Spell_Logic(var int manaInvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_scroll3) { return spl_sendcast; };
    return spl_sendstop;
};
func void StExt_Buff_Spell_Cast(var int effectId)
{
	var int power;
	var int time;
	var int radius;
	var int targetsCount;
	
    if (npc_isplayer(self)) 
	{
		if ((playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
		
		power = 50 + atr_intellect + StExt_PcStats[StExt_PcStats_Index_LightMasteryPower] + StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_BuffPower);
		power += StExt_GetPercentFromValue(power, countlearnspell);
		targetsCount = 2 + (power / 100);
		radius = 250 + power;
		time = 300 + StExt_PcStats[StExt_PcStats_Index_LightMasteryPower];

		if (npc_getactivespellisscroll(self)) 
		{
			time = time / 2;
			power = power / 2;
			self.attribute[2] = self.attribute[2] - spl_cost_scroll2; 
		}
		else { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; };
		
		StExt_ApplyTimedEffectEx(self, self, effectId, power, time, radius, targetsCount, 0);
		StExt_ApplyTimedEffectEx(self, StExt_NullNpc, effectId, power, time, radius, targetsCount, StExt_TimedEffect_Flag_Aoe);
	};
    rx_runeroutine(self);
};

instance spell_buff_protection(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_protection(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_protection() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_ProtAllBonus); };

instance spell_buff_hp(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_hp(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_hp() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_HpBonus); };

instance spell_buff_stats(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_stats(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_stats() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_StatsAllBonus); };

instance spell_buff_regen(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_regen(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_regen() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_RegenAllBonus); };

instance spell_buff_damage(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_damage(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_damage() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_DamageAllBonus); };

instance spell_buff_speed(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_speed(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_speed() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_SpeedBonus); };

instance spell_buff_dodge(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_dodge(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_dodge() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_DodgeBonus); };

instance spell_buff_es(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_es(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_es() { StExt_Buff_Spell_Cast(StExt_TimedEffect_Index_EsBonus); };

instance spell_buff_massrestore(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_buff_massrestore(var int manaInvested) { return StExt_Buff_Spell_Logic(manaInvested); };
func void spell_cast_buff_massrestore() 
{ 
	var int power;
	var int time;
	var int radius;
	var int targetsCount;
	
	if (npc_isplayer(self)) 
	{
		if ((playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
		
		power = 50 + atr_intellect + StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] + StExt_Array_GetInt(StExt_PcStatsArrayName, StExt_PcStats_Index_BuffPower);
		power += StExt_GetPercentFromValue(power, countlearnspell) + (StExt_PcStats[StExt_PcStats_Index_LightMasteryPower] + 1) / 2;
		targetsCount = 2 + npc_gettalentskill(self, npc_talent_mage);
		radius = 250 + power;

		if (npc_getactivespellisscroll(self)) 
		{
			time = time / 2;
			power = power / 2;
			self.attribute[2] = self.attribute[2] - spl_cost_scroll2; 
		}
		else { self.attribute[2] = self.attribute[2] - spl_cost_scroll3; };
		
		StExt_CastSelfHeal(self, 15, power);
		StExt_CastMassHeal(self, 10, power, targetsCount, radius);
	};
    rx_runeroutine(self);
};

func int StExt_DeBuff_Spell_Logic(var int manaInvested)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll2)) { return spl_sendcast; }
    else if (self.attribute[2] >= spl_cost_scroll3) { return spl_sendcast; };
    return spl_sendstop;
};
func void StExt_DeBuff_Spell_Cast(var int deBuffId)
{
	var int radius;
	var int targets;
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
    if (npc_isplayer(self))
	{
		targets = 1 + StExt_CalcAoeTargets(self, StExt_DamageFlag_Aoe, npc_gettalentskill(self, npc_talent_mage));
		radius = StExt_CalcAoeDistance(self, StExt_DamageFlag_Aoe);
		StExt_ApplyTimedEffectEx(self, self, deBuffId, 0, 0, radius, targets, StExt_TimedEffect_Flag_Aoe); 
	};
    rx_runeroutine(self);
};

instance spell_debuff_protection(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_protection(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_protection() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_ProtectionCurse); };

instance spell_debuff_stats(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_stats(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_stats() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_StatsCurse); };

instance spell_debuff_siphon(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_siphon(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_siphon() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_SiphonCurse); };

instance spell_debuff_speed(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_speed(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_speed() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_SpeedCurse); };

instance spell_debuff_lifetap(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_lifetap(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_lifetap() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_LifeTapCurse); };

instance spell_debuff_reflectdamage(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_reflectdamage(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_reflectdamage() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_ReflectDamageCurse); };

instance spell_debuff_extradamage(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_extradamage(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_extradamage() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_ExtraDamageCurse); };

instance spell_debuff_weaken(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
};  
func int spell_logic_debuff_weaken(var int manaInvested) { return StExt_DeBuff_Spell_Logic(manaInvested); };
func void spell_cast_debuff_weaken() { StExt_DeBuff_Spell_Cast(StExt_TimedEffect_Index_WeakenCurse); };


func int spell_logic_summon_generic(var int manaInvested, var int summonCount, var int manaCost)
{
    if (!StExt_CanSummon(summonCount)) 
	{
        if (rx_newmes) { ai_printiteminfo(StExt_Str_Info, StExt_Str_Info_MaxSummonCount, 1, 1); }
        else { ai_print(StExt_Str_MaxSummonCount); };
        return spl_sendstop;
    };
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= StExt_CalcScrollMana(manaCost))) { return spl_sendcast; }
    else if (self.attribute[2] >= manaCost) { return spl_sendcast; };
    return spl_sendstop;
};  
func void spell_cast_summon_generic(var int summonInstance, var int summonCount, var int manaCost)
{
    if (npc_isplayer(self) && (playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
	
    if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - StExt_CalcScrollMana(manaCost); }
    else { self.attribute[2] = self.attribute[2] - manaCost; };
	
    if (npc_isplayer(self)) 
	{
        if (npc_getactivespellisscroll(self)) 
		{
            rx_summoncount += summonCount;
            wld_spawnnpcrange(self, summonInstance, 1, 500.0);
        }
        else if (npc_gettalentskill(hero, npc_talent_mage) >= 1)
		{
			if (rx_keypressed("KEY_NONTARGET_ACTION", false, false)) {
				spawntotarget(summonInstance, 1, 500.0);
				rx_summoncount += summonCount;
			}
			else 
			{
				wld_spawnnpcrange(self, summonInstance, 1, 500.0);
				rx_summoncount += summonCount;
			};
        }
		else { b_say(self, self, "$DONTWORK"); };
    };
    rx_runeroutine(self);
};

instance spell_summon_ghost(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_ghost(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 2, spl_cost_summon_ghost); };
func void spell_cast_summon_ghost() { spell_cast_summon_generic(stext_summonedghost, 2, spl_cost_summon_ghost); };

instance spell_summon_bonegolem(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_bonegolem(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 2, spl_cost_summon_bonegolem); };
func void spell_cast_summon_bonegolem() { spell_cast_summon_generic(stext_summoned_bonegolem, 2, spl_cost_summon_bonegolem); };

instance spell_summon_shadowbeast(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_shadowbeast(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 2, spl_cost_summon_shadowbeast); };
func void spell_cast_summon_shadowbeast() { spell_cast_summon_generic(stext_summoned_shadowbeast, 2, spl_cost_summon_shadowbeast); };

instance spell_summon_shadowbeast_fire(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_shadowbeast_fire(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 2, spl_cost_summon_shadowbeast_fire); };
func void spell_cast_summon_shadowbeast_fire() { spell_cast_summon_generic(stext_summoned_shadowbeast_fire, 2, spl_cost_summon_shadowbeast_fire); };

instance spell_summon_troll(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_troll(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 2, spl_cost_summon_troll); };
func void spell_cast_summon_troll() { spell_cast_summon_generic(stext_summoned_troll, 2, spl_cost_summon_troll); };

instance spell_summon_crawler(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_crawler(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 1, spl_cost_summon_crawler); };
func void spell_cast_summon_crawler() { spell_cast_summon_generic(stext_summoned_crawler, 1, spl_cost_summon_crawler); };

instance spell_summon_oster(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_oster(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 1, spl_cost_summon_oster); };
func void spell_cast_summon_oster() { spell_cast_summon_generic(stext_summoned_oster, 1, spl_cost_summon_oster); };

instance spell_summon_electricgolem(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_summon_electricgolem(var int manaInvested) { return spell_logic_summon_generic(manaInvested, 2, spl_cost_summonelectricgolem); };
func void spell_cast_summon_electricgolem() { spell_cast_summon_generic(stext_summoned_electricgolem, 2, spl_cost_summonelectricgolem); };


func int StExt_TimedEffect_Buff_BaseCape_Loop(var string effectName)
{
	var C_ExtraDamageInfo desc;
	var int damageTotal;
	var int damageType;
	var int damageFlags;
	var c_item weap;
	var int castCost;
	var int doCast;	
	
	if (StExt_GamePaused_TimedEffect()) { return LOOP_CONTINUE; };
	if (!StExt_TimedEffect_Loop_CanContinue()) { return LOOP_END; };
	
	doCast = true;
	StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] -= 1;
	
	damageTotal = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageTotal];
	damageType = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageType];
	damageFlags = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_DamageFlags];

	if (npc_isplayer(StExt_Self))
	{
		castCost = StExt_TimedEffectCast_Cost;
		if (StExt_IsGenericPerkLearned(StExt_PerkIndex_Archmage)) { castCost += castCost; };
		
		if (StExt_DoCastAuras && (StExt_Self.attribute[2] >= castCost))
		{
			StExt_Self.attribute[2] -= castCost;
			weap = npc_getreadiedweapon(StExt_Self);
			StExt_ProcessDamageExp(StExt_Self, StExt_Self, weap, damageType, damageFlags, damageTotal);
		}
		else { doCast = false; };
	};
		
	if (doCast)
	{
		rx_playeffect(effectName, StExt_Self);		
		desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
		if (Hlp_IsNull(desc)) {
			return LOOP_CONTINUE;
		};
		
		StExt_InitializeScriptDamageDesc(desc);		
		desc.TotalDamage = damageTotal;
		desc.DamageType = damageType;
		desc.DamageFlags = damageFlags;
		desc.MaxTargets = 8;
		desc.Radius = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Radius];
		
		desc.Damage = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_True];
		desc.Damage[dam_index_blunt] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Blunt];
		desc.Damage[dam_index_edge] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Edge];
		desc.Damage[dam_index_fire] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fire];
		desc.Damage[dam_index_fly] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Fly];
		desc.Damage[dam_index_magic] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Magic];
		desc.Damage[dam_index_point] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Point];
		desc.Damage[dam_index_fall] = StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Damage_Poison];
		
		StExt_ApplyScriptDamage(StExt_Self, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
		StExt_Struct_Free(desc);
	};
	
	if(StExt_CurrentTimedEffect.AIVar[StExt_TimedEffect_AiVar_Timer] <= 0) { return LOOP_END; };	
	return LOOP_CONTINUE;	
};

func int StExt_TimedEffect_Loop_Firecape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_firestorm_spread"); };
func int StExt_TimedEffect_Loop_Icecape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_iceexploision_spread"); };
func int StExt_TimedEffect_Loop_Lightingcape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_lightningsphere_spread"); };
func int StExt_TimedEffect_Loop_Darkcape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_massagro_spread"); };
func int StExt_TimedEffect_Loop_Aircape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_whirlwind_spread"); };
func int StExt_TimedEffect_Loop_Earthcape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_stonefirst_spread"); };
func int StExt_TimedEffect_Loop_Poisioncape() { return StExt_TimedEffect_Buff_BaseCape_Loop("spellfx_greenstrike_collidefx"); };

func int StExt_TimedSpell_Logic(var int manaInvested, var int manaCost)
{
    if (npc_getactivespellisscroll(self) && (self.attribute[2] >= (manaCost + 1) / 2)) { return spl_sendcast; }
    else if (self.attribute[2] >= manaCost) { return spl_sendcast; };
    return spl_sendstop;
};
func void StExt_TimedSpell_Cast(var int effectId, var int manaCost)
{
	var int power;
	var int time;
	var int dist;
	var int damType;
	var int damFlags;
    
    if (npc_isplayer(self)) 
	{ 
		if ((playeristransfer == true) && (playeristransferdone == false)) { b_transferback(self); };
		StExt_ApplyTimedEffect(self, self, effectId);
		
		if (npc_getactivespellisscroll(self)) { self.attribute[2] = self.attribute[2] - (manaCost + 1) / 2; }
		else { self.attribute[2] = self.attribute[2] - manaCost; };
	};
    rx_runeroutine(self);
};

instance spell_firecape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_firecape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_firecape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Firecape, spl_cost_timedaoe); };

instance spell_icecape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_icecape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_icecape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Icecape, spl_cost_timedaoe); };

instance spell_lightingcape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_lightingcape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_lightingcape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Lightingcape, spl_cost_timedaoe); };

instance spell_darkcape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_darkcape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_darkcape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Darkcape, spl_cost_timedaoe); };

instance spell_aircape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_aircape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_aircape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Aircape, spl_cost_timedaoe); };

instance spell_earthcape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_earthcape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_earthcape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Earthcape, spl_cost_timedaoe); };

instance spell_poisioncape(C_SPELL_PROTO)
{
    time_per_mana = 0.0;
    targetcollectalgo = target_collect_none;
    spelltype = spell_neutral;
};  
func int spell_logic_poisioncape(var int manaInvested) { return StExt_TimedSpell_Logic(manaInvested, spl_cost_timedaoe); };
func void spell_cast_poisioncape() { StExt_TimedSpell_Cast(StExt_TimedEffect_Index_Poisioncape, spl_cost_timedaoe); };


func void stext_spell_specialprocess(var int activespell) { };

func int spell_processmana(var int manainvested) 
{
	var int result;
	var int activespell;
    activespell = npc_getactivespell(self);
	result = spell_processmana_old(manainvested);
	
	if (activespell == spl_summondarkgolem) { result = spell_logic_summondarkgolem(manainvested); };
    if (activespell == spl_summondeathhound) { result = spell_logic_summondeathhound(manainvested); };
	if (activespell == spl_stextmagicbolt) { result = spell_logic_stextmagicbolt(manainvested); };
	if (activespell == spl_summon_skeleton_mage) { result = spell_logic_summon_skeleton_mage(manainvested); };	
	if (activespell == spl_summon_hollywisp) { result = spell_logic_summon_hollywisp(manainvested); };	
	if (activespell == spl_summon_airgolem) { result = spell_logic_summonairgolem(manainvested); };	
	
	if (activespell == spl_buff_protection) { result = spell_logic_buff_protection(manainvested); };	
	if (activespell == spl_buff_hp) { result = spell_logic_buff_hp(manainvested); };	
	if (activespell == spl_buff_stats) { result = spell_logic_buff_stats(manainvested); };	
	if (activespell == spl_buff_regen) { result = spell_logic_buff_regen(manainvested); };	
	if (activespell == spl_buff_damage) { result = spell_logic_buff_damage(manainvested); };	
	if (activespell == spl_buff_speed) { result = spell_logic_buff_speed(manainvested); };	
	if (activespell == spl_buff_dodge) { result = spell_logic_buff_dodge(manainvested); };	
	if (activespell == spl_buff_es) { result = spell_logic_buff_es(manainvested); };	
	if (activespell == spl_buff_massrestore) { result = spell_logic_buff_massrestore(manainvested); };	
	
	if (activespell == spl_debuff_protection) { result = spell_logic_debuff_protection(manainvested); };
	if (activespell == spl_debuff_stats) { result = spell_logic_debuff_stats(manainvested); };
	if (activespell == spl_debuff_siphon) { result = spell_logic_debuff_siphon(manainvested); };
	if (activespell == spl_debuff_speed) { result = spell_logic_debuff_speed(manainvested); };
	if (activespell == spl_debuff_lifetap) { result = spell_logic_debuff_lifetap(manainvested); };
	if (activespell == spl_debuff_reflectdamage) { result = spell_logic_debuff_reflectdamage(manainvested); };
	if (activespell == spl_debuff_extradamage) { result = spell_logic_debuff_extradamage(manainvested); };
	if (activespell == spl_debuff_weaken) { result = spell_logic_debuff_weaken(manainvested); };
	
	if (activespell == spl_summon_ghost) { result = spell_logic_summon_ghost(manainvested); };
	if (activespell == spl_debuff_weaken) { result = spell_logic_debuff_weaken(manainvested); };
	if (activespell == spl_summon_bonegolem) { result = spell_logic_summon_bonegolem(manainvested); };
	if (activespell == spl_summon_shadowbeast) { result = spell_logic_summon_shadowbeast(manainvested); };
	if (activespell == spl_summon_shadowbeast_fire) { result = spell_logic_summon_shadowbeast_fire(manainvested); };
	if (activespell == spl_summon_troll) { result = spell_logic_summon_troll(manainvested); };
	if (activespell == spl_summon_crawler) { result = spell_logic_summon_crawler(manainvested); };
	if (activespell == spl_summon_oster) { result = spell_logic_summon_oster(manainvested); };
	if (activespell == spl_summon_electricgolem) { result = spell_logic_summon_electricgolem(manainvested); };
	
	if (activespell == spl_firecape) { result = spell_logic_firecape(manainvested); };
	if (activespell == spl_icecape) { result = spell_logic_icecape(manainvested); };
	if (activespell == spl_lightingcape) { result = spell_logic_lightingcape(manainvested); };
	if (activespell == spl_darkcape) { result = spell_logic_darkcape(manainvested); };
	if (activespell == spl_aircape) { result = spell_logic_aircape(manainvested); };
	if (activespell == spl_earthcape) { result = spell_logic_earthcape(manainvested); };
	if (activespell == spl_poisioncape) { result = spell_logic_poisioncape(manainvested); };
	
	if ((result == spl_sendcast) && npc_isplayer(self))	{
		stext_spell_specialprocess(activespell);
	};
	if ((result != spl_sendcast) && (rx_isnpc(self, summoned_skeleton_mage) || rx_isnpc(self, stext_heroshadow) || rx_isnpc(self, summoned_skeletonuniq))) { result = spl_sendcast; };
	return result;
};

func int spell_processmana_release(var int manainvested) 
{
	var int result;	
	var int activespell;
	
	result = spell_processmana_release_old(manainvested);
	if ((result == spl_sendcast) && npc_isplayer(self))
	{		
		activespell = npc_getactivespell(self);
		stext_spell_specialprocess(activespell);
	};
	if ((result != spl_sendcast) && (rx_isnpc(self, summoned_skeleton_mage) || rx_isnpc(self, stext_heroshadow) || rx_isnpc(self, summoned_skeletonuniq))) { result = spl_sendcast; };
	return result;
};
