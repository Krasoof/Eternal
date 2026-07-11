prototype itau_stext_base(c_item)
{
	mainflag = item_kat_magic;
    flags = item_mission;
    value = 5000;
	material = mat_leather;
    scemename = "MAP";
	text[5] = name_value;
    count[5] = value;
	inv_animate = 1;
	inv_zbias = 150;
    inv_rotz = 180;
    inv_rotx = 90;
	inv_roty = 180;
};

func void StExt_UseAura(var int auraId)
{
	if ((auraId < 0) || (auraId >= StExt_AuraIndex_Max))
	{
		StExt_PrintDebug("StExt_UseAura(var int auraId)", concatstrings("Incorrect aura id: ", inttostring(auraId)), self, other);
		return;
	};	
	StExt_ApplyAura(auraId);
};

/*
// Aura item template,
// just skip this one
instance itau_stext_[auraId_short](itau_stext_base) 
{
    name = StExt_Str_AuraName[[auraId]];
	description = name;
    visual = "ItAr_Rune_01.3ds";
	text[1] = StExt_Str_AuraDesc[[auraId]];
	text[2] = StExt_Str_AuraRequirements[[auraId]];
	text[3] = StExt_Str_AuraReservation[[auraId]];
    on_state = use_itau_stext_[auraId_short];
};
func void use_itau_stext_[auraId_short]() { StExt_UseAura([auraId]); };
*/

instance itau_stext_Concentrator(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Concentrator];
	description = name;
    visual = "itau_stext_Concentrator.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Concentrator];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Concentrator];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Concentrator];
    on_state = use_itau_stext_Concentrator;
};
func void use_itau_stext_Concentrator() { StExt_UseAura(StExt_AuraIndex_Concentrator); };

instance itau_stext_BisonHeart(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_BisonHeart];
	description = name;
    visual = "itau_stext_BisonHeart.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_BisonHeart];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_BisonHeart];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_BisonHeart];
    on_state = use_itau_stext_BisonHeart;
};
func void use_itau_stext_BisonHeart() { StExt_UseAura(StExt_AuraIndex_BisonHeart); };

instance itau_stext_AdanosWisdom(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AdanosWisdom];
	description = name;
    visual = "itau_stext_AdanosWisdom.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AdanosWisdom];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AdanosWisdom];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AdanosWisdom];
    on_state = use_itau_stext_AdanosWisdom;
};
func void use_itau_stext_AdanosWisdom() { StExt_UseAura(StExt_AuraIndex_AdanosWisdom); };

instance itau_stext_HidenKnowlege(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_HidenKnowlege];
	description = name;
    visual = "itau_stext_HidenKnowlege.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_HidenKnowlege];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_HidenKnowlege];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_HidenKnowlege];
    on_state = use_itau_stext_HidenKnowlege;
};
func void use_itau_stext_HidenKnowlege() { StExt_UseAura(StExt_AuraIndex_HidenKnowlege); };

instance itau_stext_BearStrength(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_BearStrength];
	description = name;
    visual = "itau_stext_BearStrength.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_BearStrength];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_BearStrength];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_BearStrength];
    on_state = use_itau_stext_BearStrength;
};
func void use_itau_stext_BearStrength() { StExt_UseAura(StExt_AuraIndex_BearStrength); };

instance itau_stext_PumaAgility(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_PumaAgility];
	description = name;
    visual = "itau_stext_PumaAgility.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_PumaAgility];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_PumaAgility];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_PumaAgility];
    on_state = use_itau_stext_PumaAgility;
};
func void use_itau_stext_PumaAgility() { StExt_UseAura(StExt_AuraIndex_PumaAgility); };

instance itau_stext_OwlHood(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_OwlHood];
	description = name;
    visual = "itau_stext_OwlHood.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_OwlHood];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_OwlHood];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_OwlHood];
    on_state = use_itau_stext_OwlHood;
};
func void use_itau_stext_OwlHood() { StExt_UseAura(StExt_AuraIndex_OwlHood); };

instance itau_stext_WolfRegeneration(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_WolfRegeneration];
	description = name;
    visual = "itau_stext_WolfRegeneration.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_WolfRegeneration];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_WolfRegeneration];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_WolfRegeneration];
    on_state = use_itau_stext_WolfRegeneration;
};
func void use_itau_stext_WolfRegeneration() { StExt_UseAura(StExt_AuraIndex_WolfRegeneration); };

instance itau_stext_CunningRaven(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_CunningRaven];
	description = name;
    visual = "itau_stext_CunningRaven.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_CunningRaven];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_CunningRaven];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_CunningRaven];
    on_state = use_itau_stext_CunningRaven;
};
func void use_itau_stext_CunningRaven() { StExt_UseAura(StExt_AuraIndex_CunningRaven); };

instance itau_stext_DogEndurance(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_DogEndurance];
	description = name;
    visual = "itau_stext_DogEndurance.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_DogEndurance];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_DogEndurance];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_DogEndurance];
    on_state = use_itau_stext_DogEndurance;
};
func void use_itau_stext_DogEndurance() { StExt_UseAura(StExt_AuraIndex_DogEndurance); };

instance itau_stext_Dreamer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Dreamer];
	description = name;
    visual = "itau_stext_Dreamer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Dreamer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Dreamer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Dreamer];
    on_state = use_itau_stext_Dreamer;
};
func void use_itau_stext_Dreamer() { StExt_UseAura(StExt_AuraIndex_Dreamer); };

instance itau_stext_CheetahSpeed(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_CheetahSpeed];
	description = name;
    visual = "itau_stext_CheetahSpeed.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_CheetahSpeed];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_CheetahSpeed];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_CheetahSpeed];
    on_state = use_itau_stext_CheetahSpeed;
};
func void use_itau_stext_CheetahSpeed() { StExt_UseAura(StExt_AuraIndex_CheetahSpeed); };

instance itau_stext_AstralFlow(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AstralFlow];
	description = name;
    visual = "itau_stext_AstralFlow.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AstralFlow];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AstralFlow];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AstralFlow];
    on_state = use_itau_stext_AstralFlow;
};
func void use_itau_stext_AstralFlow() { StExt_UseAura(StExt_AuraIndex_AstralFlow); };

instance itau_stext_SnakeFlexebility(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_SnakeFlexebility];
	description = name;
    visual = "itau_stext_SnakeFlexebility.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_SnakeFlexebility];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_SnakeFlexebility];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_SnakeFlexebility];
    on_state = use_itau_stext_SnakeFlexebility;
};
func void use_itau_stext_SnakeFlexebility() { StExt_UseAura(StExt_AuraIndex_SnakeFlexebility); };

instance itau_stext_Lich(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Lich];
	description = name;
    visual = "itau_stext_Lich2.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Lich];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Lich];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Lich];
    on_state = use_itau_stext_Lich;
};
func void use_itau_stext_Lich() { StExt_UseAura(StExt_AuraIndex_Lich); };

instance itau_stext_Mindflayer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Mindflayer];
	description = name;
    visual = "itau_stext_Mindflayer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Mindflayer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Mindflayer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Mindflayer];
    on_state = use_itau_stext_Mindflayer;
};
func void use_itau_stext_Mindflayer() { StExt_UseAura(StExt_AuraIndex_Mindflayer); };

instance itau_stext_SoulStealer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_SoulStealer];
	description = name;
    visual = "itau_stext_SoulStealer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_SoulStealer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_SoulStealer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_SoulStealer];
    on_state = use_itau_stext_SoulStealer;
};
func void use_itau_stext_SoulStealer() { StExt_UseAura(StExt_AuraIndex_SoulStealer); };

instance itau_stext_IronSkin(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_IronSkin];
	description = name;
    visual = "itau_stext_IronSkin.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_IronSkin];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_IronSkin];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_IronSkin];
    on_state = use_itau_stext_IronSkin;
};
func void use_itau_stext_IronSkin() { StExt_UseAura(StExt_AuraIndex_IronSkin); };

instance itau_stext_WindShield(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_WindShield];
	description = name;
    visual = "itau_stext_WindShield.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_WindShield];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_WindShield];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_WindShield];
    on_state = use_itau_stext_WindShield;
};
func void use_itau_stext_WindShield() { StExt_UseAura(StExt_AuraIndex_WindShield); };

instance itau_stext_SpellEater(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_SpellEater];
	description = name;
    visual = "itau_stext_SpellEater.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_SpellEater];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_SpellEater];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_SpellEater];
    on_state = use_itau_stext_SpellEater;
};
func void use_itau_stext_SpellEater() { StExt_UseAura(StExt_AuraIndex_SpellEater); };

instance itau_stext_Luck(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Luck];
	description = name;
    visual = "itau_stext_Luck.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Luck];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Luck];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Luck];
    on_state = use_itau_stext_Luck;
};
func void use_itau_stext_Luck() { StExt_UseAura(StExt_AuraIndex_Luck); };

instance itau_stext_Wealth(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Wealth];
	description = name;
    visual = "itau_stext_Wealth.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Wealth];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Wealth];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Wealth];
    on_state = use_itau_stext_Wealth;
};
func void use_itau_stext_Wealth() { StExt_UseAura(StExt_AuraIndex_Wealth); };

instance itau_stext_Thief(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Thief];
	description = name;
    visual = "itau_stext_Thief.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Thief];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Thief];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Thief];
    on_state = use_itau_stext_Thief;
};
func void use_itau_stext_Thief() { StExt_UseAura(StExt_AuraIndex_Thief); };

instance itau_stext_Necromancer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Necromancer];
	description = name;
    visual = "itau_stext_Necromancer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Necromancer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Necromancer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Necromancer];
    on_state = use_itau_stext_Necromancer;
};
func void use_itau_stext_Necromancer() { StExt_UseAura(StExt_AuraIndex_Necromancer); };

instance itau_stext_Graveyard(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Graveyard];
	description = name;
    visual = "itau_stext_Graveyard.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Graveyard];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Graveyard];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Graveyard];
    on_state = use_itau_stext_Graveyard;
};
func void use_itau_stext_Graveyard() { StExt_UseAura(StExt_AuraIndex_Graveyard); };

instance itau_stext_Forest(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Forest];
	description = name;
    visual = "itau_stext_Forest.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Forest];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Forest];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Forest];
    on_state = use_itau_stext_Forest;
};
func void use_itau_stext_Forest() { StExt_UseAura(StExt_AuraIndex_Forest); };

instance itau_stext_Hell(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Hell];
	description = name;
    visual = "itau_stext_Hell.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Hell];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Hell];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Hell];
    on_state = use_itau_stext_Hell;
};
func void use_itau_stext_Hell() { StExt_UseAura(StExt_AuraIndex_Hell); };

instance itau_stext_Golem(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Golem];
	description = name;
    visual = "itau_stext_Golem.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Golem];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Golem];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Golem];
    on_state = use_itau_stext_Golem;
};
func void use_itau_stext_Golem() { StExt_UseAura(StExt_AuraIndex_Golem); };

instance itau_stext_Thorns(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Thorns];
	description = name;
    visual = "itau_stext_Thorns.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Thorns];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Thorns];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Thorns];
    on_state = use_itau_stext_Thorns;
};
func void use_itau_stext_Thorns() { StExt_UseAura(StExt_AuraIndex_Thorns); };

instance itau_stext_MirrorShield(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_MirrorShield];
	description = name;
    visual = "itau_stext_MirrorShield.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_MirrorShield];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_MirrorShield];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_MirrorShield];
    on_state = use_itau_stext_MirrorShield;
};
func void use_itau_stext_MirrorShield() { StExt_UseAura(StExt_AuraIndex_MirrorShield); };

instance itau_stext_Summoner(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Summoner];
	description = name;
    visual = "itau_stext_Summoner.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Summoner];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Summoner];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Summoner];
    on_state = use_itau_stext_Summoner;
};
func void use_itau_stext_Summoner() { StExt_UseAura(StExt_AuraIndex_Summoner); };

instance itau_stext_Conjurer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Conjurer];
	description = name;
    visual = "itau_stext_Conjurer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Conjurer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Conjurer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Conjurer];
    on_state = use_itau_stext_Conjurer;
};
func void use_itau_stext_Conjurer() { StExt_UseAura(StExt_AuraIndex_Conjurer); };

instance itau_stext_Stuner(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Stuner];
	description = name;
    visual = "itau_stext_Stuner.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Stuner];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Stuner];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Stuner];
    on_state = use_itau_stext_Stuner;
};
func void use_itau_stext_Stuner() { StExt_UseAura(StExt_AuraIndex_Stuner); };

instance itau_stext_Burner(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Burner];
	description = name;
    visual = "itau_stext_Burner.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Burner];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Burner];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Burner];
    on_state = use_itau_stext_Burner;
};
func void use_itau_stext_Burner() { StExt_UseAura(StExt_AuraIndex_Burner); };

instance itau_stext_Frezer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Frezer];
	description = name;
    visual = "itau_stext_Frezer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Frezer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Frezer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Frezer];
    on_state = use_itau_stext_Frezer;
};
func void use_itau_stext_Frezer() { StExt_UseAura(StExt_AuraIndex_Frezer); };

instance itau_stext_Pray(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Pray];
	description = name;
    visual = "itau_stext_Pray.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Pray];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Pray];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Pray];
    on_state = use_itau_stext_Pray;
};
func void use_itau_stext_Pray() { StExt_UseAura(StExt_AuraIndex_Pray); };

instance itau_stext_Death(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Death];
	description = name;
    visual = "itau_stext_Death.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Death];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Death];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Death];
    on_state = use_itau_stext_Death;
};
func void use_itau_stext_Death() { StExt_UseAura(StExt_AuraIndex_Death); };

instance itau_stext_Poision(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Poision];
	description = name;
    visual = "itau_stext_Poision.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Poision];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Poision];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Poision];
    on_state = use_itau_stext_Poision;
};
func void use_itau_stext_Poision() { StExt_UseAura(StExt_AuraIndex_Poision); };

instance itau_stext_Shock(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Shock];
	description = name;
    visual = "itau_stext_Shock.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Shock];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Shock];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Shock];
    on_state = use_itau_stext_Shock;
};
func void use_itau_stext_Shock() { StExt_UseAura(StExt_AuraIndex_Shock); };

instance itau_stext_Curser(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Curser];
	description = name;
    visual = "itau_stext_Curser.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Curser];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Curser];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Curser];
    on_state = use_itau_stext_Curser;
};
func void use_itau_stext_Curser() { StExt_UseAura(StExt_AuraIndex_Curser); };

instance itau_stext_Crusher(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Crusher];
	description = name;
    visual = "itau_stext_Crusher.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Crusher];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Crusher];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Crusher];
    on_state = use_itau_stext_Crusher;
};
func void use_itau_stext_Crusher() { StExt_UseAura(StExt_AuraIndex_Crusher); };

instance itau_stext_Chopper(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Chopper];
	description = name;
    visual = "itau_stext_Chopper.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Chopper];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Chopper];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Chopper];
    on_state = use_itau_stext_Chopper;
};
func void use_itau_stext_Chopper() { StExt_UseAura(StExt_AuraIndex_Chopper); };

instance itau_stext_Piercer(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Piercer];
	description = name;
    visual = "itau_stext_Piercer.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Piercer];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Piercer];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Piercer];
    on_state = use_itau_stext_Piercer;
};
func void use_itau_stext_Piercer() { StExt_UseAura(StExt_AuraIndex_Piercer); };

instance itau_stext_WarriorTrance(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_WarriorTrance];
	description = name;
    visual = "itau_stext_WarriorTrance.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_WarriorTrance];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_WarriorTrance];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_WarriorTrance];
    on_state = use_itau_stext_WarriorTrance;
};
func void use_itau_stext_WarriorTrance() { StExt_UseAura(StExt_AuraIndex_WarriorTrance); };

instance itau_stext_Shooter(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Shooter];
	description = name;
    visual = "itau_stext_Shooter2.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Shooter];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Shooter];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Shooter];
    on_state = use_itau_stext_Shooter;
};
func void use_itau_stext_Shooter() { StExt_UseAura(StExt_AuraIndex_Shooter); };

instance itau_stext_Archmage(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Archmage];
	description = name;
    visual = "itau_stext_Archmage.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Archmage];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Archmage];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Archmage];
    on_state = use_itau_stext_Archmage;
};
func void use_itau_stext_Archmage() { StExt_UseAura(StExt_AuraIndex_Archmage); };

instance itau_stext_EthernalSkin(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_EthernalSkin];
	description = name;
    visual = "itau_stext_EthernalSkin.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_EthernalSkin];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_EthernalSkin];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_EthernalSkin];
    on_state = use_itau_stext_EthernalSkin;
};
func void use_itau_stext_EthernalSkin() { StExt_UseAura(StExt_AuraIndex_EthernalSkin); };

instance itau_stext_Strurdy(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Strurdy];
	description = name;
    visual = "itau_stext_Strurdy.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Strurdy];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Strurdy];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Strurdy];
    on_state = use_itau_stext_Strurdy;
};
func void use_itau_stext_Strurdy() { StExt_UseAura(StExt_AuraIndex_Strurdy); };

instance itau_stext_DeathFog(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_DeathFog];
	description = name;
    visual = "itau_stext_DeathFog.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_DeathFog];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_DeathFog];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_DeathFog];
    on_state = use_itau_stext_DeathFog;
};
func void use_itau_stext_DeathFog() { StExt_UseAura(StExt_AuraIndex_DeathFog); };

instance itau_stext_CursedLands(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_CursedLands];
	description = name;
    visual = "itau_stext_CursedLands.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_CursedLands];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_CursedLands];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_CursedLands];
    on_state = use_itau_stext_CursedLands;
};
func void use_itau_stext_CursedLands() { StExt_UseAura(StExt_AuraIndex_CursedLands); };

instance itau_stext_Blizzard(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Blizzard];
	description = name;
    visual = "itau_stext_Blizzard.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Blizzard];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Blizzard];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Blizzard];
    on_state = use_itau_stext_Blizzard;
};
func void use_itau_stext_Blizzard() { StExt_UseAura(StExt_AuraIndex_Blizzard); };

instance itau_stext_Thunderstorm(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Thunderstorm];
	description = name;
    visual = "itau_stext_Thunderstorm.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Thunderstorm];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Thunderstorm];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Thunderstorm];
    on_state = use_itau_stext_Thunderstorm;
};
func void use_itau_stext_Thunderstorm() { StExt_UseAura(StExt_AuraIndex_Thunderstorm); };

instance itau_stext_Miazma(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Miazma];
	description = name;
    visual = "itau_stext_Miazma.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Miazma];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Miazma];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Miazma];
    on_state = use_itau_stext_Miazma;
};
func void use_itau_stext_Miazma() { StExt_UseAura(StExt_AuraIndex_Miazma); };

instance itau_stext_Roots(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Roots];
	description = name;
    visual = "itau_stext_Roots.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Roots];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Roots];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Roots];
    on_state = use_itau_stext_Roots;
};
func void use_itau_stext_Roots() { StExt_UseAura(StExt_AuraIndex_Roots); };

instance itau_stext_Inferno(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Inferno];
	description = name;
    visual = "itau_stext_Inferno.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Inferno];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Inferno];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Inferno];
    on_state = use_itau_stext_Inferno;
};
func void use_itau_stext_Inferno() { StExt_UseAura(StExt_AuraIndex_Inferno); };

instance itau_stext_Earthquake(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Earthquake];
	description = name;
    visual = "itau_stext_Earthquake.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Earthquake];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Earthquake];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Earthquake];
    on_state = use_itau_stext_Earthquake;
};
func void use_itau_stext_Earthquake() { StExt_UseAura(StExt_AuraIndex_Earthquake); };

instance itau_stext_Preparation(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Preparation];
	description = name;
    visual = "itau_stext_Preparation.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Preparation];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Preparation];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Preparation];
    on_state = use_itau_stext_Preparation;
};
func void use_itau_stext_Preparation() { StExt_UseAura(StExt_AuraIndex_Preparation); };

instance itau_stext_AutoFireBall(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoFireBall];
	description = name;
    visual = "itau_stext_AutoFireBall.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoFireBall];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoFireBall];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoFireBall];
    on_state = use_itau_stext_AutoFireBall;
};
func void use_itau_stext_AutoFireBall() { StExt_UseAura(StExt_AuraIndex_AutoFireBall); };

instance itau_stext_AutoIcelance(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoIcelance];
	description = name;
    visual = "itau_stext_AutoIcelance.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoIcelance];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoIcelance];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoIcelance];
    on_state = use_itau_stext_AutoIcelance;
};
func void use_itau_stext_AutoIcelance() { StExt_UseAura(StExt_AuraIndex_AutoIcelance); };

instance itau_stext_AutoDarkBall(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoDarkBall];
	description = name;
    visual = "itau_stext_AutoDarkBall.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoDarkBall];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoDarkBall];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoDarkBall];
    on_state = use_itau_stext_AutoDarkBall;
};
func void use_itau_stext_AutoDarkBall() { StExt_UseAura(StExt_AuraIndex_AutoDarkBall); };

instance itau_stext_AutoDeathBall(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoDeathBall];
	description = name;
    visual = "itau_stext_AutoDeathBall.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoDeathBall];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoDeathBall];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoDeathBall];
    on_state = use_itau_stext_AutoDeathBall;
};
func void use_itau_stext_AutoDeathBall() { StExt_UseAura(StExt_AuraIndex_AutoDeathBall); };

instance itau_stext_AutoLighting(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoLighting];
	description = name;
    visual = "itau_stext_AutoLighting.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoLighting];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoLighting];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoLighting];
    on_state = use_itau_stext_AutoLighting;
};
func void use_itau_stext_AutoLighting() { StExt_UseAura(StExt_AuraIndex_AutoLighting); };

instance itau_stext_AutoAirFist(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoAirFist];
	description = name;
    visual = "itau_stext_AutoAirFist.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoAirFist];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoAirFist];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoAirFist];
    on_state = use_itau_stext_AutoAirFist;
};
func void use_itau_stext_AutoAirFist() { StExt_UseAura(StExt_AuraIndex_AutoAirFist); };

instance itau_stext_AutoPoisionBall(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoPoisionBall];
	description = name;
    visual = "itau_stext_AutoPoisionBall.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoPoisionBall];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoPoisionBall];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoPoisionBall];
    on_state = use_itau_stext_AutoPoisionBall;
};
func void use_itau_stext_AutoPoisionBall() { StExt_UseAura(StExt_AuraIndex_AutoPoisionBall); };

instance itau_stext_AutoStonedBolt(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AutoStonedBolt];
	description = name;
    visual = "itau_stext_AutoStonedBolt.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AutoStonedBolt];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AutoStonedBolt];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AutoStonedBolt];
    on_state = use_itau_stext_AutoStonedBolt;
};
func void use_itau_stext_AutoStonedBolt() { StExt_UseAura(StExt_AuraIndex_AutoStonedBolt); };

instance itau_stext_ShadowWarrior(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ShadowWarrior];
	description = name;
    visual = "itau_stext_ShadowWarrior.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ShadowWarrior];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ShadowWarrior];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ShadowWarrior];
    on_state = use_itau_stext_ShadowWarrior;
};
func void use_itau_stext_ShadowWarrior() { StExt_UseAura(StExt_AuraIndex_ShadowWarrior); };

instance itau_stext_Duration(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_Duration];
	description = name;
    visual = "itau_stext_Duration.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_Duration];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_Duration];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_Duration];
    on_state = use_itau_stext_Duaration;
};
func void use_itau_stext_Duaration() { StExt_UseAura(StExt_AuraIndex_Duration); };

instance itau_stext_ShamanMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ShamanMasteryPower];
	description = name;
    visual = "itau_stext_ShamanMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ShamanMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ShamanMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ShamanMasteryPower];
    on_state = use_itau_stext_ShamanMasteryPower;
};
func void use_itau_stext_ShamanMasteryPower() { StExt_UseAura(StExt_AuraIndex_ShamanMasteryPower); };

instance itau_stext_NecroMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_NecroMasteryPower];
	description = name;
    visual = "itau_stext_Lich.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_NecroMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_NecroMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_NecroMasteryPower];
    on_state = use_itau_stext_NecroMasteryPower;
};
func void use_itau_stext_NecroMasteryPower() { StExt_UseAura(StExt_AuraIndex_NecroMasteryPower); };

instance itau_stext_GolemMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_GolemMasteryPower];
	description = name;
    visual = "itau_stext_GolemMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_GolemMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_GolemMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_GolemMasteryPower];
    on_state = use_itau_stext_GolemMasteryPower;
};
func void use_itau_stext_GolemMasteryPower() { StExt_UseAura(StExt_AuraIndex_GolemMasteryPower); };

instance itau_stext_DemonMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_DemonMasteryPower];
	description = name;
    visual = "itau_stext_DemonMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_DemonMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_DemonMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_DemonMasteryPower];
    on_state = use_itau_stext_DemonMasteryPower;
};
func void use_itau_stext_DemonMasteryPower() { StExt_UseAura(StExt_AuraIndex_DemonMasteryPower); };

instance itau_stext_DeathMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_DeathMasteryPower];
	description = name;
    visual = "itau_stext_DeathMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_DeathMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_DeathMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_DeathMasteryPower];
    on_state = use_itau_stext_DeathMasteryPower;
};
func void use_itau_stext_DeathMasteryPower() { StExt_UseAura(StExt_AuraIndex_DeathMasteryPower); };

instance itau_stext_LifeMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_LifeMasteryPower];
	description = name;
    visual = "itau_stext_LifeMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_LifeMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_LifeMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_LifeMasteryPower];
    on_state = use_itau_stext_LifeMasteryPower;
};
func void use_itau_stext_LifeMasteryPower() { StExt_UseAura(StExt_AuraIndex_LifeMasteryPower); };

instance itau_stext_LightMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_LightMasteryPower];
	description = name;
    visual = "itau_stext_LightMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_LightMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_LightMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_LightMasteryPower];
    on_state = use_itau_stext_LightMasteryPower;
};
func void use_itau_stext_LightMasteryPower() { StExt_UseAura(StExt_AuraIndex_LightMasteryPower); };

instance itau_stext_DarkMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_DarkMasteryPower];
	description = name;
    visual = "itau_stext_DarkMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_DarkMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_DarkMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_DarkMasteryPower];
    on_state = use_itau_stext_DarkMasteryPower;
};
func void use_itau_stext_DarkMasteryPower() { StExt_UseAura(StExt_AuraIndex_DarkMasteryPower); };

instance itau_stext_ElectricMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ElectricMasteryPower];
	description = name;
    visual = "itau_stext_ElectricMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ElectricMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ElectricMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ElectricMasteryPower];
    on_state = use_itau_stext_ElectricMasteryPower;
};
func void use_itau_stext_ElectricMasteryPower() { StExt_UseAura(StExt_AuraIndex_ElectricMasteryPower); };

instance itau_stext_AirMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_AirMasteryPower];
	description = name;
    visual = "itau_stext_AirMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_AirMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_AirMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_AirMasteryPower];
    on_state = use_itau_stext_AirMasteryPower;
};
func void use_itau_stext_AirMasteryPower() { StExt_UseAura(StExt_AuraIndex_AirMasteryPower); };

instance itau_stext_EarthMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_EarthMasteryPower];
	description = name;
    visual = "itau_stext_EarthMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_EarthMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_EarthMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_EarthMasteryPower];
    on_state = use_itau_stext_EarthMasteryPower;
};
func void use_itau_stext_EarthMasteryPower() { StExt_UseAura(StExt_AuraIndex_EarthMasteryPower); };

instance itau_stext_IceMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_IceMasteryPower];
	description = name;
    visual = "itau_stext_IceMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_IceMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_IceMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_IceMasteryPower];
    on_state = use_itau_stext_IceMasteryPower;
};
func void use_itau_stext_IceMasteryPower() { StExt_UseAura(StExt_AuraIndex_IceMasteryPower); };

instance itau_stext_FireMasteryPower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_FireMasteryPower];
	description = name;
    visual = "itau_stext_FireMasteryPower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_FireMasteryPower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_FireMasteryPower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_FireMasteryPower];
    on_state = use_itau_stext_FireMasteryPower;
};
func void use_itau_stext_FireMasteryPower() { StExt_UseAura(StExt_AuraIndex_FireMasteryPower); };

instance itau_stext_WeaponThrower(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_WeaponThrower];
	description = name;
    visual = "itau_stext_WeaponThrower.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_WeaponThrower];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_WeaponThrower];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_WeaponThrower];
    on_state = use_itau_stext_WeaponThrower;
};
func void use_itau_stext_WeaponThrower() { StExt_UseAura(StExt_AuraIndex_WeaponThrower); };

instance itau_stext_DualMastery(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_DualMastery];
	description = name;
    visual = "itau_stext_DualMastery.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_DualMastery];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_DualMastery];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_DualMastery];
    on_state = use_itau_stext_DualMastery;
};
func void use_itau_stext_DualMastery() { StExt_UseAura(StExt_AuraIndex_DualMastery); };

instance itau_stext_CBowMastery(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_CBowMastery];
	description = name;
    visual = "itau_stext_CBowMastery.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_CBowMastery];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_CBowMastery];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_CBowMastery];
    on_state = use_itau_stext_CBowMastery;
};
func void use_itau_stext_CBowMastery() { StExt_UseAura(StExt_AuraIndex_CBowMastery); };

instance itau_stext_BowMastery(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_BowMastery];
	description = name;
    visual = "itau_stext_BowMastery.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_BowMastery];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_BowMastery];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_BowMastery];
    on_state = use_itau_stext_BowMastery;
};
func void use_itau_stext_BowMastery() { StExt_UseAura(StExt_AuraIndex_BowMastery); };

instance itau_stext_2hMastery(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_2hMastery];
	description = name;
    visual = "itau_stext_2hMastery.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_2hMastery];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_2hMastery];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_2hMastery];
    on_state = use_itau_stext_2hMastery;
};
func void use_itau_stext_2hMastery() { StExt_UseAura(StExt_AuraIndex_2hMastery); };

instance itau_stext_1hMastery(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_1hMastery];
	description = name;
    visual = "itau_stext_1hMastery.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_1hMastery];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_1hMastery];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_1hMastery];
    on_state = use_itau_stext_1hMastery;
};
func void use_itau_stext_1hMastery() { StExt_UseAura(StExt_AuraIndex_1hMastery); };

instance itau_stext_ReflectDamageAsBlunt(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsBlunt];
	description = name;
    visual = "itau_stext_ReflectDamageAsBlunt.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsBlunt];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsBlunt];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsBlunt];
    on_state = use_itau_stext_ReflectDamageAsBlunt;
};
func void use_itau_stext_ReflectDamageAsBlunt() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsBlunt); };

instance itau_stext_ReflectDamageAsEdge(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsEdge];
	description = name;
    visual = "itau_stext_ReflectDamageAsEdge.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsEdge];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsEdge];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsEdge];
    on_state = use_itau_stext_ReflectDamageAsEdge;
};
func void use_itau_stext_ReflectDamageAsEdge() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsEdge); };

instance itau_stext_ReflectDamageAsPoint(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsPoint];
	description = name;
    visual = "itau_stext_ReflectDamageAsPoint.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsPoint];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsPoint];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsPoint];
    on_state = use_itau_stext_ReflectDamageAsPoint;
};
func void use_itau_stext_ReflectDamageAsPoint() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsPoint); };

instance itau_stext_ReflectDamageAsFire(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsFire];
	description = name;
    visual = "itau_stext_ReflectDamageAsFire.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsFire];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsFire];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsFire];
    on_state = use_itau_stext_ReflectDamageAsFire;
};
func void use_itau_stext_ReflectDamageAsFire() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsFire); };

instance itau_stext_ReflectDamageAsFly(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsFly];
	description = name;
    visual = "itau_stext_ReflectDamageAsFly.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsFly];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsFly];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsFly];
    on_state = use_itau_stext_ReflectDamageAsFly;
};
func void use_itau_stext_ReflectDamageAsFly() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsFly); };

instance itau_stext_ReflectDamageAsMagic(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsMagic];
	description = name;
    visual = "itau_stext_ReflectDamageAsMagic.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsMagic];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsMagic];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsMagic];
    on_state = use_itau_stext_ReflectDamageAsMagic;
};
func void use_itau_stext_ReflectDamageAsMagic() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsMagic); };

instance itau_stext_ReflectDamageAsPoision(itau_stext_base) 
{
    name = StExt_Str_AuraName[StExt_AuraIndex_ReflectDamageAsPoision];
	description = name;
    visual = "itau_stext_ReflectDamageAsPoision.3ds";
	text[1] = StExt_Str_AuraDesc[StExt_AuraIndex_ReflectDamageAsPoision];
	text[2] = StExt_Str_AuraRequirements[StExt_AuraIndex_ReflectDamageAsPoision];
	text[3] = StExt_Str_AuraReservation[StExt_AuraIndex_ReflectDamageAsPoision];
    on_state = use_itau_stext_ReflectDamageAsPoision;
};
func void use_itau_stext_ReflectDamageAsPoision() { StExt_UseAura(StExt_AuraIndex_ReflectDamageAsPoision); };
