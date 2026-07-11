//=== UNDEAD ===
instance summoned_gobbo_skeleton(C_Npc) 
{
    summoned_gobbo_skeleton_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_gobbo_skeleton_dark(C_Npc) 
{
	summoned_gobbo_skeleton_dark_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_scroll(C_Npc)
 {	
	summoned_skeleton_scroll_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton(C_Npc) 
{
    summoned_skeleton_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeletonadvanced(C_Npc) 
{
    summoned_skeletonadvanced_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeletonboss(C_Npc) 
{
    summoned_skeletonboss_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_warrior(C_Npc)
 {
    summoned_skeleton_warrior_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_warrioradvanced(C_Npc)
 {
    summoned_skeleton_warrioradvanced_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_warriorboss(C_Npc) 
{
    summoned_skeleton_warriorboss_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_speer_ocsummon(C_Npc) 
{
    skeleton_speer_ocsummon_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_shield_ocsummon(C_Npc) 
{
    skeleton_shield_ocsummon_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_guard(C_Npc) 
{
    summoned_skeleton_guard_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_guard_1(C_Npc) 
{
    summoned_skeleton_guard_1_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_guard_2(C_Npc) 
{
    summoned_skeleton_guard_2_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_guard_3(C_Npc)
 {
    summoned_skeleton_guard_3_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_nimble_fighter_1(C_Npc) 
{
    skeleton_nimble_fighter_1_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_nimble_fighter_2(C_Npc) 
{
    skeleton_nimble_fighter_2_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_nimble_fighter_3(C_Npc) 
{
    skeleton_nimble_fighter_3_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_mighty_fighter_1(C_Npc) 
{
    skeleton_mighty_fighter_1_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_mighty_fighter_2(C_Npc)
 {
    skeleton_mighty_fighter_2_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_mighty_fighter_3(C_Npc) 
{
    skeleton_mighty_fighter_3_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_master_archer_1(C_Npc) 
{
    summoned_skeleton_master_archer_1_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_master_archer_2(C_Npc)
 {
    summoned_skeleton_master_archer_2_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_warrior_chosen(C_Npc)
 {
    summoned_skeleton_warrior_chosen_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_archer_1(C_Npc)
{
	summoned_skeleton_archer_1_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_archer_2(C_Npc)
 {
    summoned_skeleton_archer_2_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_archer_3(C_Npc) 
{
    summoned_skeleton_archer_3_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_summon_spear1(C_Npc) 
{
    skeleton_summon_spear1_old();
	StExt_UpdateSummonStats_Undead(self);    
};

instance skeleton_summon_spear2(C_Npc) 
{
    skeleton_summon_spear2_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance skeleton_summon_spear3(C_Npc) 
{
    skeleton_summon_spear3_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_zombie(C_Npc) 
{
    summoned_zombie_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_zombie_proteсtor(mst_default_mud) 
{
    name = StExt_Str_SummonZombieProtector_Name;
    guild = gil_summoned_skeleton;
	aivar[91] = rx_summon_id;
    aivar[43] = id_summonedzombie;
	aivar[28] = false;
    aivar[15] = true;
	setvar2_true(summoned_zombie_proteсtor, bit_can_at_boss);
    b_setattitude(summoned_zombie_proteсtor, att_friendly);
    start_aistate = zs_mm_rtn_summoned;		
    b_setvisuals_mud();
    npc_settofistmode(summoned_zombie_proteсtor);	
	level = 0;
    attribute[4] = 150 + (atr_intellect * 70 / 100);
    attribute[5] = 50 + (atr_intellect / 2);
    attribute[1] = 1000 + (atr_intellect * 2);
    attribute = 1000 + (atr_intellect * 2);
    attribute[3] = 1;
    attribute[2] = 1;
    protection[1] = 170 + (atr_intellect / 5);
    protection[2] = 100 + (atr_intellect / 5);
    protection[6] = 200 + (atr_intellect / 5);
    protection[3] = 10 + (atr_intellect / 10);
    protection[4] = 50 + (atr_intellect / 5);
    protection[5] = 70 + (atr_intellect / 10);
	StExt_UpdateSummonStats_MasteryBonus(self, StExt_PcStats[StExt_PcStats_Index_AuraPower]);
	StExt_UpdateSummonStats_Undead(self);
	StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Zombie, 1);
};
func void ai_ondead_summoned_zombie_proteсtor() { StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Zombie, -1); };

instance summoned_zombie_advanced(C_Npc) 
{
    summoned_zombie_advanced_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_zombie_boss(C_Npc) 
{
    summoned_zombie_boss_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeletonuniq(C_Npc) { summoned_skeletonuniq_old(); };

instance summoned_shadowbeast_skeleton(mst_default_shadowbeast_skeleton_sum) 
{
    name = StExt_Str_SummonBoneHound_Name;
    level = 0;
    senses_range = 3000;
	start_aistate = zs_mm_rtn_summoned;
	mdl_setmodelscale(summoned_shadowbeast_skeleton, 0.75, 0.75, 0.75);
	set_argul_visuals();
	b_setattitude(summoned_shadowbeast_skeleton, att_friendly);
    npc_settofistmode(summoned_shadowbeast_skeleton);
	setvar2_true(summoned_shadowbeast_skeleton, bit_can_at_boss);
	attribute[4] = 150 + (atr_intellect / 3);
    attribute[5] = 120 + (atr_intellect / 3);
    attribute[1] = 600 + (atr_intellect);
    attribute = 600 + (atr_intellect);
    attribute[3] = 1;
    attribute[2] = 1;
    protection[1] = 50 + (atr_intellect / 4);
    protection[2] = 50 + (atr_intellect / 4);
    protection[6] = 120 + (atr_intellect / 5);
    protection[3] = 20 + (atr_intellect / 5);
    protection[4] = 20 + (atr_intellect / 5);
    protection[5] = 20 + (atr_intellect / 5);
	StExt_UpdateSummonStats_Undead(self);
};
func void ai_ondead_summoned_shadowbeast_skeleton() { npc_clearinv(self); };

instance shadowbeast_skeleton_summon(C_Npc) 
{
	shadowbeast_skeleton_summon_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_mage_new(c_npc) 
{
	summoned_skeleton_mage_new_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_mage(c_npc) 
{
	summoned_skeleton_mage_old();
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_stonedmage(summoned_skeleton_a) 
{
    name = StExt_Str_SummonBoneMage_Name;
    level = 0;   
	aivar[43] = id_summoned_skeleton_mage;
    aivar[51] = magic_always;
	attribute[4] = 50 + (atr_intellect / 3);
    attribute[5] = 50 + (atr_intellect / 3);
    attribute[1] = 1000 + atr_intellect;
    attribute = 1000 + atr_intellect;
    attribute[3] = 3;
    attribute[2] = 3;
    protection[1] = 100 + (atr_intellect / 10);
    protection[2] = 100 + (atr_intellect / 10);
    protection[6] = 200 + (atr_intellect / 10);
    protection[3] = 250 + (atr_intellect / 10);
    protection[4] = 100 + (atr_intellect / 10);
    protection[5] = 300 + (atr_intellect / 10);
	senses_range = perc_dist_monster_active_max;
	b_setvisuals_lesser_skeleton();
	mdl_setvisualbody(self, "Ske_Body", default, default, "Ske_Head", default, default, itar_mage_av);
	setvar2_true(summoned_skeleton_stonedmage, bit_can_at_boss);
	rx_setnpcvar(self, aivrx_spelldamagescale, 50 + StExt_GetPercentFromValue(atr_intellect, 5));
	StExt_UpdateSummonStats_Undead(self);
};

instance summoned_skeleton_orc(c_npc) 
{
	summoned_skeleton_orc_old();
    StExt_UpdateSummonStats_Undead(self);
};

// === DEMONS ===
instance summoned_demon_protector(mst_default_demon) 
{
	name = StExt_Str_SummonDemonProtector_Name;
    guild = gil_summoned_demon;
    aivar[43] = id_summoned_demon;
    aivar[91] = rx_summon_id;
    level = 0;
	attribute[4] = 150 + (atr_intellect / 3);
    attribute[5] = 150 + (atr_intellect / 3);
    attribute[1] = 1500 + (atr_intellect);
    attribute = 1500 + (atr_intellect);
    attribute[3] = 2;
    attribute[2] = 2;
    protection[1] = 50 + (atr_intellect / 5);
    protection[2] = 50 + (atr_intellect / 5);
    protection[6] = 100 + (atr_intellect / 5);
    protection[3] = 50 + (atr_intellect / 5);
    protection[4] = 50 + (atr_intellect / 5);
    protection[5] = 50 + (atr_intellect / 5);	
    aivar[15] = true;
    b_setattitude(summoned_demon_protector, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    senses_range = 3000;
    setvar2_true(summoned_demon_protector, bit_can_at_boss);
    b_setvisuals_demon();
    mdl_setmodelscale(summoned_demon_protector, 0.6, 0.6, 0.6);
    npc_settofistmode(summoned_demon_protector);
	StExt_UpdateSummonStats_MasteryBonus(self, StExt_PcStats[StExt_PcStats_Index_AuraPower]);
	StExt_UpdateSummonStats_Demon(self);
	StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Demon, 1);
};
func void ai_ondead_summoned_demon_protector() { StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Demon, -1); };

instance summoned_demon_low(C_Npc) {
    summoned_demon_low_old();
	StExt_UpdateSummonStats_Demon(self);
};
instance summoned_demon(C_Npc) {
    summoned_demon_old();
	StExt_UpdateSummonStats_Demon(self);
};
instance summoned_demon_up_01(C_Npc) {
    summoned_demon_up_01_old();
	StExt_UpdateSummonStats_Demon(self);
};
instance summoned_demon_up_02(C_Npc) {
    summoned_demon_up_02_old();
	StExt_UpdateSummonStats_Demon(self);
};
instance summoned_demonlord(C_Npc) {
    summoned_demonlord_old();
	StExt_UpdateSummonStats_Demon(self);
};
instance summoned_demonlord_up_01(C_Npc) {
    summoned_demonlord_up_01_old();
	StExt_UpdateSummonStats_Demon(self);
};
instance summoned_demonlord_up_02(C_Npc) {
    summoned_demonlord_up_02_old();
	StExt_UpdateSummonStats_Demon(self);
};

instance dk_pet(C_Npc) 
{
    dk_pet_old();
	//StExt_UpdateSummonStats_DkDemon(dk_pet);
};


// === GOLEMS ===
func void StExt_ModGolemProtector()
{
	var int rnd;
	rnd = hlp_random(7);
	if (rnd == StExt_SummonGolemType_Stone)
	{
		self.damage[1] += 150;
		self.protection[1] += 200;
		b_setvisuals_stonegolem();
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Stone);
	}
	else if (rnd == StExt_SummonGolemType_Fire)
	{
		self.damage[3] += 100;
		self.protection[3] += 200;
		self.damagetype = dam_blunt | dam_fire | dam_fly;
		b_setvisuals_firegolem();
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Fire);
	}
	else if (rnd == StExt_SummonGolemType_Ice)
	{
		self.damage[5] += 100;
		self.protection[5] += 100;
		self.damagetype = dam_blunt | dam_magic | dam_fly;
		b_setvisuals_icegolem();
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Ice);
	}
	else if (rnd == StExt_SummonGolemType_Magic)
	{
		self.damage[5] += 100;
		self.protection[5] += 100;
		self.damagetype = dam_blunt | dam_magic | dam_fly;
		b_setvisuals_stonegolem_osta();
		self.effect = "SPELLFX_MAGIC_SMOKE";
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Magic);
	}
	else if (rnd == StExt_SummonGolemType_Swamp)
	{
		self.damage[4] += 150;
		self.protection[4] += 200;
		b_setvisuals_swampgolem();
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Swamp);
	}
	else if (rnd == StExt_SummonGolemType_Wood)
	{
		self.attribute[1] += 1000;
		self.attribute = self.attribute[1];
		self.damagetype = dam_blunt | dam_point | dam_fly;
		b_setvisuals_woodgolem();
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Wood);
	}
	else if (rnd == StExt_SummonGolemType_Air)
	{
		self.flags = npc_flag_ghost;	
		self.damagetype = dam_blunt | dam_fly;
		self.damage[4] += 250;
		self.protection[4] += 600;
		b_setvisuals_stonegolem();
		self.effect = "SPELLFX_SAND_SMOKE";
		StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Air);
	};
};
instance summoned_golem_protector(mst_default_stonegolem) 
{
    name = StExt_Str_SummonGolemProtector_Name;
    guild = gil_summoned_golem;
    aivar[43] = id_summoned_golem;
    aivar[91] = rx_summon_id;
	aivar[15] = true;
    level = 0;
	senses_range = 2500;
    attribute[4] = 150 + (atr_intellect / 2);
    attribute[5] = 150 + (atr_intellect / 2);
    attribute[1] = 2500 + (atr_intellect * 2);
    attribute = 2500 + (atr_intellect * 2);
    attribute[3] = 2;
    attribute[2] = 2;
    protection[1] = 100 + (atr_intellect / 3);
    protection[2] = 300 + (atr_intellect / 2);
    protection[6] = 1000;
    protection[3] = 50 + (atr_intellect / 3);
    protection[4] = 100 + (atr_intellect / 3);
    protection[5] = 50 + (atr_intellect / 3);    
	damage[1] += 150 + (atr_intellect / 4);
    damage[4] += 100 + (atr_intellect / 8);    
    b_setattitude(summoned_golem_protector, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
	npc_settofistmode(summoned_golem_protector);
	mdl_setmodelscale(summoned_golem_protector, 0.6, 0.6, 0.6);
	StExt_UpdateSummonStats_MasteryBonus(self, StExt_PcStats[StExt_PcStats_Index_AuraPower]);
	StExt_ModGolemProtector();	
	setvar2_true(summoned_golem_protector, bit_can_at_boss);
	StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Golem, 1);
};
func void ai_ondead_summoned_golem_protector() { StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Golem, -1); };

instance summoned_golem(C_Npc) 
{
    summoned_golem_old();
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Stone);
};
instance summoned_swampgolem(C_Npc) 
{
    summoned_swampgolem_old();
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Swamp);
};
instance summoned_firegolem(C_Npc) {
    summoned_firegolem_old();
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Fire);
};
instance summoned_icegolem(C_Npc) {
    summoned_icegolem_old();
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Ice);
};

instance summoned_darkgolem(mst_default_stonegolem) 
{
    name = StExt_Str_SummonDarkGolem_Name;
    guild = gil_summoned_golem;
    aivar[43] = id_summoned_golem;
    aivar[91] = rx_summon_id;
	aivar[15] = true;
    level = 0;
    attribute[4] = 240 + (atr_intellect / 2);
    attribute[5] = 240 + (atr_intellect / 2);
    attribute[1] = 3500 + (atr_intellect * 2);
    attribute = 3500 + (atr_intellect * 2);
    attribute[3] = 4;
    attribute[2] = 4;
    protection[1] = 300 + (atr_intellect / 2);
    protection[2] = 300 + (atr_intellect / 2);
    protection[6] = 1000 + (atr_intellect);
    protection[3] = 100 + (atr_intellect);
    protection[4] = 100 + (atr_intellect);
    protection[5] = 100 + (atr_intellect);
	rx_setgolemstats(summoned_darkgolem);    
    damagetype = dam_blunt | dam_magic | dam_fly;
    damage[1] += 250 + (atr_intellect / 4);
    damage[5] += 200 + (atr_intellect / 4);
    damage[4] += 100 + (atr_intellect / 8);  	
    b_setattitude(summoned_darkgolem, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    b_setvisuals_stonegolem_osta();
	effect = "SPELLFX_MAGIC_SMOKE";
    npc_settofistmode(summoned_darkgolem);	
	setvar2_true(summoned_darkgolem, bit_can_at_boss);
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Magic);
};

instance summoned_airgolem(mst_default_stonegolem) 
{
    name = StExt_Str_SummonAirGolem_Name;
    guild = gil_summoned_golem;
    aivar[43] = id_summoned_golem;
    aivar[91] = rx_summon_id;
	aivar[15] = true;
    level = 0;
	flags = npc_flag_ghost;	
    attribute[4] = 240 + (atr_intellect / 2);
    attribute[5] = 240 + (atr_intellect / 2);
    attribute[1] = 3000 + (atr_intellect * 2);
    attribute = 3000 + (atr_intellect * 2);
    attribute[3] = 4;
    attribute[2] = 4;
    protection[1] = 300 + (atr_intellect / 2);
    protection[2] = 300 + (atr_intellect / 2);
    protection[6] = 1000 + (atr_intellect);
    protection[3] = 100 + (atr_intellect);
    protection[4] = 500 + (atr_intellect);
    protection[5] = 100 + (atr_intellect);
	rx_setgolemstats(summoned_airgolem);    
    damagetype = dam_blunt | dam_fly;
    damage[1] += 250 + (atr_intellect / 4);
    damage[4] += 250 + (atr_intellect / 3);  	
    b_setattitude(summoned_airgolem, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    b_setvisuals_stonegolem();
	effect = "SPELLFX_SAND_SMOKE";
    npc_settofistmode(summoned_airgolem);	
	setvar2_true(summoned_airgolem, bit_can_at_boss);
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Air);
};

instance stext_summoned_electricgolem(mst_default_stonegolem) 
{
    name = StExt_Str_SummonElectricGolem_Name;
    guild = gil_summoned_golem;
    aivar[43] = id_summoned_golem;
    aivar[91] = rx_summon_id;
	aivar[15] = true;
    level = 0;
	flags = npc_flag_ghost;	
    attribute[4] = 240 + (atr_intellect / 2);
    attribute[5] = 240 + (atr_intellect / 2);
    attribute[1] = 3000 + (atr_intellect * 2);
    attribute = 3000 + (atr_intellect * 2);
    attribute[3] = 4;
    attribute[2] = 4;
    protection[1] = 300 + (atr_intellect / 2);
    protection[2] = 300 + (atr_intellect / 2);
    protection[6] = 1000 + (atr_intellect);
    protection[3] = 100 + (atr_intellect);
    protection[4] = 500 + (atr_intellect);
    protection[5] = 100 + (atr_intellect);
	rx_setgolemstats(stext_summoned_electricgolem);    
    damagetype = dam_blunt | dam_fly | dam_magic;
    damage[1] += 150 + (atr_intellect / 4);
    damage[4] += 200 + (atr_intellect / 4);	
    damage[5] += 200 + (atr_intellect / 4); 
    b_setattitude(stext_summoned_electricgolem, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    b_setvisuals_stonegolem();
	effect = "spellfx_weakglimmer_stextcyan";
    npc_settofistmode(stext_summoned_electricgolem);	
	setvar2_true(stext_summoned_electricgolem, bit_can_at_boss);
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Electric);
};

// === ANIMALS ===
instance summoned_wolf(C_Npc) 
{
    summoned_wolf_old();
	StExt_UpdateSummonStats_Animal(self);
};
instance summoned_warg_scroll(C_Npc) 
{
    summoned_warg_scroll_old();
	StExt_UpdateSummonStats_Animal(self);
};
instance summoned_warg(C_Npc) 
{
    summoned_warg_old();
	StExt_UpdateSummonStats_Animal(self);
};
instance summoned_warg1(C_Npc) 
{
    summoned_warg1_old();
	StExt_UpdateSummonStats_Animal(self);
};
instance summoned_warg2(C_Npc) 
{
    summoned_warg2_old();
	StExt_UpdateSummonStats_Animal(self);
};
instance summoned_warg3(C_Npc) 
{
    summoned_warg3_old();
	StExt_UpdateSummonStats_Animal(self);
};
instance summoned_wolf_protector(mst_default_wolf) 
{
    name = StExt_Str_SummonWolfProtector_Name;
    guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[91] = rx_summon_id;
    level = 0;
	attribute[4] = 100 + (atr_intellect / 3);
    attribute[5] = 100 + (atr_intellect / 3);
    attribute[1] = 600 + (atr_intellect);
    attribute = 600 + (atr_intellect);
    attribute[3] = 1;
    attribute[2] = 1;
    protection[1] = 50 + (atr_intellect / 4);
    protection[2] = 50 + (atr_intellect / 4);
    protection[6] = 20 + (atr_intellect / 5);
    protection[3] = 10 + (atr_intellect / 5);
    protection[4] = 10 + (atr_intellect / 5);
    protection[5] = 10 + (atr_intellect / 5);
    aivar[15] = true;
	setwargstats(summoned_wolf_protector);
    b_setattitude(summoned_wolf_protector, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
	setvar2_true(summoned_wolf_protector, bit_can_at_boss);
    b_setvisuals_wolf();
	StExt_UpdateSummonStats_MasteryBonus(self, StExt_PcStats[StExt_PcStats_Index_AuraPower]);
	StExt_UpdateSummonStats_Animal(self);
	StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Wolf, 1);
};
func void ai_ondead_summoned_wolf_protector() { StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Wolf, -1); };

instance dsnapper(C_Npc) 
{
	dsnapper_old();
	//StExt_UpdateSummonStats_Animal(self);
};

instance treant(C_Npc) 
{
	treant_old();
	//StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Wood);
};

instance summoned_swampdrone(C_Npc) 
{
    summoned_swampdrone_old();
	StExt_UpdateSummonStats_Animal(self);
};

instance summoned_dragon(C_Npc) {
    summoned_dragon_old();
	StExt_UpdateSummonStats_Animal(self);
};

instance pet_jina(C_Npc) 
{
	pet_jina_old();
	//StExt_UpdateSummonStats_Animal(pet_jina);
};

// === OTHER ===
/*
instance hero_totem_vob(C_Npc) 
{
	hero_totem_vob_old();
	StExt_UpdateSummonStats_Totem(self);
};
*/

instance summoned_wolf_shaman(C_Npc) 
{
	summoned_wolf_shaman_old();
	StExt_UpdateSummonStats_Totem(self);
};

// === TRANSFORMATION ===

instance bloodfly_rune(C_Npc)
{
    bloodfly_rune_old();
    StExt_UpdateTransformStats(self);
};
instance zombie02(C_Npc)
{
    zombie02_old();
    StExt_UpdateTransformStats(self);
};
instance stonegolem(C_Npc)
{
    stonegolem_old();
    StExt_UpdateTransformStats(self);
};
instance wolf(C_Npc)
{
    wolf_old();
    StExt_UpdateTransformStats(self);
};
instance waran(C_Npc)
{
    waran_old();
    StExt_UpdateTransformStats(self);
};
instance snapper(C_Npc)
{
    snapper_old();
    StExt_UpdateTransformStats(self);
};
instance warg_rune(C_Npc)
{
    warg_rune_old();
    StExt_UpdateTransformStats(self);
};
instance firewaran_rune(C_Npc)
{
    firewaran_rune_old();
    StExt_UpdateTransformStats(self);
};
instance lurker(C_Npc)
{
    lurker_old();
    StExt_UpdateTransformStats(self);
};
instance shadowbeast_rune(C_Npc)
{
    shadowbeast_rune_old();
    StExt_UpdateTransformStats(self);
};
instance dragonsnapper_rune(C_Npc)
{
    dragonsnapper_rune_old();
    StExt_UpdateTransformStats(self);
};
instance draconian_trf_druid(C_Npc)
{
	draconian_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance wolf_trf_druid(C_Npc)
{
	wolf_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance warg_trf_druid(C_Npc)
{
	warg_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance snapper_trf_druid(C_Npc)
{
	snapper_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance firewaran_trf_druid(C_Npc)
{
	firewaran_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance rabbit_trf_druid(C_Npc)
{
	rabbit_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance spider_trf_druid(C_Npc)
{
	spider_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance skeleton_bow_trf_druid(C_Npc)
{
	skeleton_bow_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance keiler_trf_druid(C_Npc)
{
	keiler_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance dragonsnapper_trf_druid(C_Npc)
{
	dragonsnapper_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance harpie_trf_druid(C_Npc)
{
	harpie_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance stonegolem_trf_druid(C_Npc)
{
	stonegolem_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance firegolem_trf_druid(C_Npc)
{
	firegolem_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance icegolem_trf_druid(C_Npc)
{
	icegolem_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance swampgolem_trf_druid(C_Npc)
{
	swampgolem_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance skeleton_trf_druid(C_Npc)
{
	skeleton_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance skeleton_warrior_trf_druid(C_Npc)
{
	skeleton_warrior_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance drake_trf_druid(C_Npc)
{
	drake_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance gobbo_shaman_trf_druid(C_Npc)
{
	gobbo_shaman_trf_druid_old();
	StExt_UpdateTransformStats(self);
};
instance skeleton_bow_trf(C_Npc)
{
	skeleton_bow_trf_old();
	StExt_UpdateTransformStats(self);
};
instance keiler_trf(C_Npc)
{
	keiler_trf_old();
	StExt_UpdateTransformStats(self);
};
instance swampgolem_trf(C_Npc)
{
	swampgolem_trf_old();
	StExt_UpdateTransformStats(self);
};
instance dragonsnapper_trf(C_Npc)
{
	dragonsnapper_trf_old();
	StExt_UpdateTransformStats(self);
};
instance firewaran_trf(C_Npc)
{
	firewaran_trf_old();
	StExt_UpdateTransformStats(self);
};
instance meatbug_trf(C_Npc)
{
	meatbug_trf_old();
	StExt_UpdateTransformStats(self);
};
instance crawler_trf(C_Npc)
{
	crawler_trf_old();
	StExt_UpdateTransformStats(self);
};
instance shadowbeast_trf(C_Npc)
{
	shadowbeast_trf_old();
	StExt_UpdateTransformStats(self);
};
instance snapper_trf(C_Npc)
{
	snapper_trf_old();
	StExt_UpdateTransformStats(self);
};
instance stonegolem_trf(C_Npc)
{
	stonegolem_trf_old();
	StExt_UpdateTransformStats(self);
};
instance troll_trf(C_Npc)
{
	troll_trf_old();
	StExt_UpdateTransformStats(self);
};
instance warg_trf(C_Npc)
{
	warg_trf_old();
	StExt_UpdateTransformStats(self);
};
instance wolf_trf(C_Npc)
{
	wolf_trf_old();
	StExt_UpdateTransformStats(self);
};
instance zombie_trf(C_Npc)
{
	zombie_trf_old();
	StExt_UpdateTransformStats(self);
};

func void StExt_UpdateShadowEquipment(var c_npc slf)
{
	var c_item heroRangeWeap;
	var c_item heroMeeleWeap;
	var c_item shield;
	var c_item leftHandItem;
	var int isRanger;
	var int isMage;
	var int hasShield;
	var int topHitchance;
	var int spellId;
	if (!hlp_isvalidnpc(hero)) { return; };

	if (npc_hasreadiedmeleeweapon(hero)) { heroMeeleWeap = npc_getreadiedweapon(hero); }
	else { heroMeeleWeap = npc_getequippedmeleeweapon(hero); };	
	if (npc_hasreadiedrangedweapon(hero)) { heroRangeWeap = npc_getreadiedweapon(hero); }
	else { heroRangeWeap = npc_getequippedrangedweapon(hero); };
	
	shield = hlp_getslotitem(hero, "ZS_SHIELD");
	leftHandItem = npc_getlefthanditem(hero);
	
	hasShield = false;
	isRanger = false;
	isMage = (rx_heroismage() && rx_getchance(35));
	topHitchance = StExt_GetMaxValue(hero.hitchance[1], hero.hitchance[2], hero.hitchance[3], hero.hitchance[4]);	
	if ((topHitchance == 3) || (topHitchance == 4)) { isRanger = true; }
	else if (!hlp_isvaliditem(heroMeeleWeap) && !isMage) { isRanger = true; }
	else if ((topHitchance == 0) && rx_getchance(50)) { isRanger = true; };
	
	if (isMage)
	{
		if (hero.guild == gil_kdf)
		{
			if(npc_gettalentskill(hero, npc_talent_mage) >= 4) { spellId = spl_firestorm; }
			else if(npc_gettalentskill(hero, npc_talent_mage) >= 2) { spellId = spl_instantfireball; }
			else { spellId = spl_firebolt; };
		}
		else if (hero.guild == gil_kdw)
		{
			if(npc_gettalentskill(hero, npc_talent_mage) >= 4) { spellId = spl_iceexploision; }
			else if(npc_gettalentskill(hero, npc_talent_mage) >= 2) 
			{
				if(rx_getchance(50)) { spellId = spl_icelance; }
				else { spellId = spl_lightningflash; };			
			}
			else 
			{ 
				if(rx_getchance(50)) { spellId = spl_icebolt; }
				else { spellId = spl_zap; };
			};
		}
		else if (hero.guild == gil_kdm)
		{
			if (rx_isdarkmage())
			{
				if(npc_gettalentskill(hero, npc_talent_mage) >= 4) { spellId = spl_massdot; }
				else if(npc_gettalentskill(hero, npc_talent_mage) >= 2) { spellId = spl_darkball; }
				else { spellId = spl_dot_first; };
			}
			else
			{
				if(npc_gettalentskill(hero, npc_talent_mage) >= 4) { spellId = spl_skull; }
				else if(npc_gettalentskill(hero, npc_talent_mage) >= 2) { spellId = spl_deathball; }
				else { spellId = spl_necrobolt; };
			};
		}
		else if (hero.guild == gil_gur)
		{
			if(npc_gettalentskill(hero, npc_talent_mage) >= 4) { spellId = spl_stonefirst; }
			else if(npc_gettalentskill(hero, npc_talent_mage) >= 2) 
			{
				if(rx_getchance(50)) { spellId = spl_whirlwind; }
				else { spellId = spl_windfist; };
			}
			else { spellId = spl_berzerk; };
		}
		else 
		{ 
			if(npc_gettalentskill(hero, npc_talent_mage) >= 4) { spellId = spl_magsphere; }
			else if(npc_gettalentskill(hero, npc_talent_mage) >= 2) { spellId = spl_energyball; }
			else { spellId = spl_stextmagicbolt; };
		};
		
		slf.aivar[51] = magic_always;
		rx_setnpcvar(slf, aivrx_npc_boss_use_spell_id, spellId);
		
		createinvitems(slf, itru_firebolt, 1);
		createinvitems(slf, itru_zap, 1);
		createinvitems(slf, itru_icebolt, 1);
		createinvitems(slf, itru_berzerk, 1);
		createinvitems(slf, itru_deathbolt, 1);
		createinvitems(slf, itru_instantfireball, 1);
		createinvitems(slf, itru_stonefirst, 1);
		createinvitems(slf, itru_icelance, 1);
		createinvitems(slf, itru_windfist, 1);
		createinvitems(slf, itru_firestorm, 1);
		createinvitems(slf, itru_icecube, 1);
		createinvitems(slf, itru_thunderball, 1);
		createinvitems(slf, itru_magsphere, 1);		
		createinvitems(slf, itru_iceexploision, 1);
		createinvitems(slf, itru_acid, 1);
		createinvitems(slf, itru_chargefireball, 1);
		createinvitems(slf, itru_firelight, 1);
		createinvitems(slf, itru_lightningflash, 1);
		createinvitems(slf, itru_lightningsphere, 1);
		createinvitems(slf, itru_deathball, 1);
		createinvitems(slf, itru_breathofdeath, 1);
		createinvitems(slf, itru_orcfireball, 1);
		createinvitems(slf, itru_pyrokinesis, 1);
		createinvitems(slf, itru_waterfist, 1);
		createinvitems(slf, itru_whirlwind, 1);
		createinvitems(slf, itru_firemeteor, 1);
		createinvitems(slf, itru_geyser, 1);
		createinvitems(slf, itru_skull, 1);
		createinvitems(slf, itru_guruwrath, 1);
		createinvitems(slf, itru_abyssspell, 1);
		createinvitems(slf, itru_masterofdisaster, 1);
		createinvitems(slf, itru_concussionbolt, 1);
		createinvitems(slf, itru_pyrorune, 1);
		createinvitems(slf, itru_druidrunequest, 1);
		createinvitems(slf, itru_druidball, 1);
		createinvitems(slf, itru_rapidfirebolt, 1);
		createinvitems(slf, itru_magiccage, 1);
		createinvitems(slf, itru_explosion, 1);
		createinvitems(slf, itru_firewave, 1);
		createinvitems(slf, itru_rapidicebolt, 1);
		createinvitems(slf, itru_lacerate, 1);
		createinvitems(slf, itru_extricate, 1);
		createinvitems(slf, itru_adanosball, 1);
		createinvitems(slf, itru_greenstrike, 1);
		createinvitems(slf, itru_firelance, 1);
		createinvitems(slf, itru_deathstrike, 1);
		createinvitems(slf, itru_necrobolt, 1);
		createinvitems(slf, itru_gurumass, 1);
		createinvitems(slf, itru_vatrashelprune, 1);
		createinvitems(slf, itru_dot_first, 1);
		createinvitems(slf, itru_dot_second, 1);
		createinvitems(slf, itru_massagro, 1);
		createinvitems(slf, itru_massdot, 1);
		createinvitems(slf, itru_darkball, 1);
		createinvitems(slf, itru_bigdarkball, 1);
		createinvitems(slf, itru_darkspear, 1);
		createinvitems(slf, itru_darkcloud, 1);
		createinvitems(slf, itru_darkwave, 1);
		createinvitems(slf, itru_torture, 1);
		createinvitems(slf, itru_stext_magicbolt, 1);		
		StExt_PrintDebug("StExt_UpdateShadowEquipment(...)", concatstrings("SpellId: ", inttostring(spellId)), slf, StExt_NullNpc);
		return;
	}
	else if (hlp_isvaliditem(heroRangeWeap) && isRanger)
	{
		if (StExt_ValueHasFlag(heroRangeWeap.flags, item_crossbow)) { createinvitems(slf, itrw_bolt, 100 + (hero.level * 10)); }
		else { createinvitems(slf, itrw_arrow, 100 + (hero.level * 10)); };		
		rx_setnpcvar(slf, aivrx_is_monster_archer, true);
		rx_setnpcvar(slf, aivrx_npc_range_only, true);
		equipitem(slf, hlp_getinstanceid(heroRangeWeap));
		StExt_PrintDebug("StExt_UpdateShadowEquipment(...)", concatstrings("RangeWeapId: ", inttostring(hlp_getinstanceid(heroRangeWeap))), slf, StExt_NullNpc);
	};
	
	if (hlp_isvaliditem(heroMeeleWeap) && !isRanger)
	{
		if (getitemvarvalue(heroMeeleWeap, bit_item_hellebarde) || getitemvarvalue(heroMeeleWeap, bit_item_speer))
		{
			mdl_removeoverlaymds(slf, "humans_2hST1.MDS");
			mdl_removeoverlaymds(slf, "humans_2hST2.MDS");
			mdl_removeoverlaymds(slf, "humans_2hST3.MDS");
			mdl_applyoverlaymds(slf, "HUMANS_AXEST2.MDS");
		}		
		else if (StExt_ValueHasFlag(heroMeeleWeap.flags, item_dag) && hlp_isvaliditem(leftHandItem))
		{
			mdl_applyoverlaymds(slf, "Humans_Militia.mds");
			mdl_applyoverlaymds(slf, "humans_skeleton.mds");
			rx_setnpcvar(slf, aivrx_isdualwarrior, 1);
			equipitem(slf, hlp_getinstanceid(leftHandItem));
			StExt_PrintDebug("StExt_UpdateShadowEquipment(...)", concatstrings("LeftWeapId: ", inttostring(hlp_getinstanceid(leftHandItem))), slf, StExt_NullNpc);
		}
		else if ((StExt_ValueHasFlag(heroMeeleWeap.flags, item_swd) || StExt_ValueHasFlag(heroMeeleWeap.flags, item_axe)) && hlp_isvaliditem(shield))
		{
			equipitem(slf, hlp_getinstanceid(shield));			
			StExt_PrintDebug("StExt_UpdateShadowEquipment(...)", concatstrings("ShieldId: ", inttostring(hlp_getinstanceid(shield))), slf, StExt_NullNpc);
		};
		
		equipitem(slf, hlp_getinstanceid(heroMeeleWeap));
		StExt_PrintDebug("StExt_UpdateShadowEquipment(...)", concatstrings("MeeleWeapId: ", inttostring(hlp_getinstanceid(heroMeeleWeap))), slf, StExt_NullNpc);
	};
};

func void StExt_UpdateShadowStats(var c_npc slf)
{
	var int masteryBonus;
	var int consumption;
	var int es;
	
	b_setattitude(slf, att_friendly);
    b_givenpctalents(slf);
	setvar2_true(stext_heroshadow, bit_can_at_boss);
	
	if (!hlp_isvalidnpc(hero)) 
	{
        slf.attribute[atr_strength] = 10 + hlp_random(10);
        slf.aivar[81] = slf.attribute[atr_strength];
        slf.attribute[atr_dexterity] = 10 + hlp_random(10);
        slf.aivar[82] = slf.attribute[atr_dexterity];
        slf.attribute[atr_mana_max] = 1;
        slf.aivar[83] = 1000;
        slf.attribute[atr_mana] = 1;
        slf.attribute[atr_hitpoints_max] = 150 + hlp_random(25);
        slf.attribute[atr_hitpoints] = slf.attribute[atr_hitpoints_max];
		rx_setnpcvar(slf, aivrx_npc_atr_stamina, 1000);
		rx_setnpcvar(slf, aivrx_npc_atr_shield, 150);
		return; 
	};

    slf.attribute[1] = hero.attribute[1];
    slf.attribute[0] = slf.attribute[1];   
	slf.attribute[4] = hero.attribute[4];
    slf.attribute[5] = hero.attribute[5];
	es = StExt_Npc_GetMaxEs(hero);
	
	slf.aivar[81] = hero.attribute[atr_strength];
	slf.aivar[82] = hero.attribute[atr_dexterity];
	slf.aivar[83] = hero.attribute[atr_mana_max];
	
	if (slf.attribute[5] > 300)
	{
		mdl_applyoverlaymds(slf, "HUMANS_SPRINT.MDS");
		rx_setnpcvar(slf, aivrx_npc_sprint, true);	
	};
	
	consumption = hero.attribute[4] + hero.attribute[5] + ((hero.attribute[3] + hero.attribute[1] + es + 1) / 2) + 10;
	consumption = StExt_GetPermilleFromValue(consumption, 1);
	consumption = StExt_ValidateValueRange(consumption, 1, 10);
	slf.attribute[3] = consumption;
    slf.attribute[2] = consumption;
	
	rx_setnpcvar(slf, aivrx_npc_atr_stamina, 1000);
	rx_setnpcvar(slf, aivrx_npc_atr_shield, 150);
	b_raisefighttalent(slf, npc_talent_1h, hero.hitchance[1]);
	b_raisefighttalent(slf, npc_talent_2h, hero.hitchance[2]);
	b_raisefighttalent(slf, npc_talent_bow, hero.hitchance[3]);
	b_raisefighttalent(slf, npc_talent_crossbow, hero.hitchance[4]);
	StExt_Npc_ChangeAiv(slf, aivrx_spelldamagescale, 100 + hero.level + countlearnspell + 10);
	StExt_Npc_ChangeAivEx(slf, StExt_AiVar_ExtraMagicDamage, atr_intellect);	
	StExt_Npc_ChangeMaxEs(slf, es);
	StExt_Npc_ChangeEs(slf, es);
	
	masteryBonus = StExt_PcStats[StExt_PcStats_Index_AuraPower];
	masteryBonus += hero.level * 2 + ((StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower] + StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower] + 1) / 2);
	StExt_UpdateSummonStats_Heroshadow(slf, masteryBonus);	
};

func void StExt_UpdateShadowVisual(var c_npc slf)
{
	mdl_setvisual(slf, "HumanS.mds");
    mdl_applyoverlaymds(slf, "humans_1hST1.mds");
    mdl_applyoverlaymds(slf, "humans_2hST1.mds");
    mdl_applyoverlaymds(slf, "humans_BowT1.mds");
    mdl_applyoverlaymds(slf, "humans_CBowT1.mds");
    mdl_applyoverlaymds(slf, "humans_skeleton.mds");
    mdl_applyoverlaymds(slf, "Skeleton_Wait.mds");
	
	if (!StExt_CopyNpcLook(slf, hero)) 
	{
		mdl_setvisualbody(slf, "Ske_Body", default, default, "Ske_Head", 6, 6, no_armor);
		StExt_PrintDebugStack("StExt_UpdateShadowVisual(...) -> StExt_CopyNpcLook(slf, hero) call failed?!");
	};
};

instance stext_heroshadow(summoned_skeleton_a) 
{
	name = StExt_Str_SummonShadow_Name;
	flags = npc_flag_ghost;
    guild = gil_summoned_skeleton;
	npctype = npctype_friend;
	level = 0;
    aivar[91] = rx_summon_id;
    aivar[43] = id_summoned_skeleton;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
	fight_tactic = fai_human_master;
    senses = sense_hear | sense_see | sense_smell;
    senses_range = 3000;  
	start_aistate = zs_mm_rtn_summoned;
	bodystateinterruptableoverride = true;
	StExt_UpdateShadowStats(self);
	StExt_UpdateShadowVisual(self);	
    StExt_UpdateShadowEquipment(self);
	StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Shadow, 1);
};
func void ai_ondead_stext_heroshadow() 
{ 
	StExt_ChangeSpecialSummonCount(StExt_SpecialSummonType_Shadow, -1);
	npc_clearinv(self);
};

instance stext_hollywisp(mst_default_wisp)
{
	name = StExt_Str_SummonHollyWisp_Name;
	guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[15] = true;
	aivar[91] = rx_summon_id;	
	attribute[4] = 50 + (atr_intellect / 3);
    attribute[5] = 50 + (atr_intellect / 3);
    attribute[1] = 1000 + atr_intellect;
    attribute = 1000 + atr_intellect;
    attribute[3] = 1;
    attribute[2] = 1;
    protection[1] = 1000 + (atr_intellect / 5);
    protection[2] = 1000 + (atr_intellect / 5);
    protection[6] = 2000 + (atr_intellect / 5);
    protection[3] = 250 + (atr_intellect / 10);
    protection[4] = 250 + (atr_intellect / 10);
    protection[5] = 250 + (atr_intellect / 10);
	protection[7] = 2000 + (atr_intellect / 5);
    b_setvisuals_wisp();
    mdl_setmodelscale(stext_hollywisp, 1.5, 1.5, 1.5);
    npc_settofistmode(stext_hollywisp);	
    start_aistate = zs_mm_rtn_summoned;    
	StExt_Npc_AddAbility(self, StExt_Npc_Ability_Holybolt);
	StExt_UpdateSummonStats_Holly(self);
};

instance stext_summonedghost(summoned_skeleton_a)
{
	name = StExt_Str_SummonGhost_Name;
    level = 0;
	flags = npc_flag_ghost;
    guild = gil_summoned_skeleton;
	npctype = npctype_friend;
    aivar[91] = rx_summon_id;
    aivar[43] = id_summoned_skeleton;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
	bodystateinterruptableoverride = true;
	fight_tactic = fai_human_master;
    senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
	
	attribute[4] = 250 + (atr_intellect / 3);
    attribute[5] = 250 + (atr_intellect / 3);
    attribute[1] = 2000 + atr_intellect;
    attribute = 2000 + atr_intellect;
    attribute[3] = 5;
    attribute[2] = 5;
    protection[1] = 1000 + (atr_intellect / 5);
    protection[2] = 1000 + (atr_intellect / 5);
    protection[6] = 2000 + (atr_intellect / 5);
    protection[3] = 50 + (atr_intellect / 10);
    protection[4] = 50 + (atr_intellect / 10);
    protection[5] = 50 + (atr_intellect / 10);
	damagetype = dam_magic;
    damage[5] = 10 + (atr_intellect / 10);
	
	b_setvisuals_skeleton_mage();
	equipitem(stext_summonedghost, itmw_2h_summonstrongelite);
	
	setvar2_true(stext_summonedghost, bit_can_at_boss);
	StExt_UpdateSummonStats_Undead(self);
};

instance stext_summoned_bonegolem(c_npc) 
{
    name = StExt_Str_SummonBoneGolem_Name;
    guild = gil_summoned_golem;
    aivar[91] = rx_summon_id;
    aivar[43] = id_summoned_golem;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
    bodystateinterruptableoverride = true;
    level = 0;
	
    attribute[4] = 300 + (atr_intellect / 3);
    attribute[5] = 350 + (atr_intellect / 3);
    attribute[1] = 3500 + atr_intellect;
    attribute = attribute[1];
    attribute[3] = 4;
    attribute[2] = 4;
	
    protection[1] = 170 + (atr_intellect / 5);
    protection[2] = 250 + (atr_intellect / 5);
    protection[6] = 1000 + (atr_intellect / 5);
    protection[3] = 150 + (atr_intellect / 5);
    protection[4] = 110 + (atr_intellect / 5);
    protection[5] = 120 + (atr_intellect / 5);
	
	damagetype = dam_blunt | dam_fly;
    damage[1] += 250 + (atr_intellect / 4);
    damage[4] += 250 + (atr_intellect / 3);  

    hitchance[1] = 100;
    hitchance[2] = 100;
    hitchance[3] = 100;
    hitchance[4] = 100;
    fight_tactic = fai_human_master;
    senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
   
    b_setattitude(self, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    b_setvisuals_orc_skeleton();	
	mdl_setmodelscale(self, 1.25, 1.25, 1.25);
	mdl_setmodelfatness(self, 1.5);
    npc_settofistmode(self);
	setvar2_true(stext_summoned_bonegolem, bit_can_at_boss);
	StExt_UpdateSummonStats_Gol(self, StExt_SummonGolemType_Bone);
};

instance stext_summoned_shadowbeast(c_npc) 
{
	name = StExt_Str_SummonShadowbeast_Name;
    guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[91] = rx_summon_id;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
    level = 0;
	senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
	fight_tactic = fai_shadowbeast;
	attribute[4] = 300 + (atr_intellect / 3);
    attribute[5] = 350 + (atr_intellect / 3);
    attribute[1] = 1500 + (atr_intellect);
    attribute = attribute[1];
    attribute[3] = 3;
    attribute[2] = 3;
    protection[1] = 150 + (atr_intellect / 4);
    protection[2] = 150 + (atr_intellect / 4);
    protection[6] = 120 + (atr_intellect / 5);
    protection[3] = 70 + (atr_intellect / 5);
    protection[4] = 70 + (atr_intellect / 5);
    protection[5] = 70 + (atr_intellect / 5);
	damagetype = dam_edge;
    b_setvisuals_shadowbeast_2();	
    mdl_setmodelscale(self, 0.9, 0.9, 0.9);
    b_setattitude(stext_summoned_shadowbeast, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    npc_settofistmode(stext_summoned_shadowbeast);
	setvar2_true(stext_summoned_shadowbeast, bit_can_at_boss);
	StExt_UpdateSummonStats_Animal(self);
};

instance stext_summoned_shadowbeast_fire(c_npc) 
{
	name = StExt_Str_SummonShadowbeast_Fire_Name;
    guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[91] = rx_summon_id;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
	flags = npc_flag_ghost;
    level = 0;
	senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
	fight_tactic = fai_shadowbeast;
	attribute[4] = 300 + (atr_intellect / 3);
    attribute[5] = 350 + (atr_intellect / 3);
    attribute[1] = 2500 + (atr_intellect);
    attribute = attribute[1];
    attribute[3] = 5;
    attribute[2] = 5;
    protection[1] = 250 + (atr_intellect / 4);
    protection[2] = 250 + (atr_intellect / 4);
    protection[6] = 220 + (atr_intellect / 5);
    protection[3] = 170 + (atr_intellect / 5);
    protection[4] = 170 + (atr_intellect / 5);
    protection[5] = 170 + (atr_intellect / 5);
	damagetype = dam_edge;
    b_setvisuals_shadowbeast_2();
    mdl_setmodelscale(self, 0.9, 0.9, 0.9);
	effect = "SPELLFX_FIREARMOR";
    b_setattitude(stext_summoned_shadowbeast_fire, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    npc_settofistmode(stext_summoned_shadowbeast_fire);
	setvar2_true(stext_summoned_shadowbeast_fire, bit_can_at_boss);	
	StExt_UpdateSummonStats_Totem(self);
};

instance stext_summoned_troll(c_npc) 
{
	name = StExt_Str_Summon_Troll_Name;
    guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[91] = rx_summon_id;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
	bodystateinterruptableoverride = true;
    level = 0;
	senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
	fight_tactic = fai_troll;
	attribute[4] = 600 + (atr_intellect / 3);
    attribute[5] = 350 + (atr_intellect / 3);
    attribute[1] = 4500 + (atr_intellect);
    attribute = attribute[1];
    attribute[3] = 6;
    attribute[2] = 6;
    protection[1] = 350 + (atr_intellect / 4);
    protection[2] = 350 + (atr_intellect / 4);
    protection[6] = 370 + (atr_intellect / 5);
    protection[3] = 170 + (atr_intellect / 5);
    protection[4] = 170 + (atr_intellect / 5);
    protection[5] = 170 + (atr_intellect / 5);
	damagetype = dam_blunt | dam_fly;
    damage[1] = 400;
    damage[4] = 150;
    b_setvisuals_troll();
    mdl_setmodelscale(self, 0.8, 0.8, 0.8);
    b_setattitude(stext_summoned_troll, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    npc_settofistmode(stext_summoned_troll);
	setvar2_true(stext_summoned_troll, bit_can_at_boss);	
	StExt_UpdateSummonStats_Animal(self);
};

instance stext_summoned_crawler(c_npc) 
{
	name = StExt_Str_SummonCrawler_Name;
    guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[91] = rx_summon_id;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
    level = 0;
	senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
	fight_tactic = fai_minecrawler;
	attribute[4] = 200 + (atr_intellect / 3);
    attribute[5] = 200 + (atr_intellect / 3);
    attribute[1] = 1000 + (atr_intellect);
    attribute = attribute[1];
    attribute[3] = 2;
    attribute[2] = 2;
    protection[1] = 120 + (atr_intellect / 4);
    protection[2] = 120 + (atr_intellect / 4);
    protection[6] = 180 + (atr_intellect / 4);
    protection[3] = 10 + (atr_intellect / 5);
    protection[4] = 70 + (atr_intellect / 5);
    protection[5] = 20 + (atr_intellect / 5);
	damagetype = dam_point;
	
	if (StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] > 200) 
	{
		mdl_setvisual(self, "Crawler.mds");
        mdl_setvisualbody(self, "Cr2_Body", 1, 1, "", default, default, -1);
	}
	else { b_setvisuals_palecrawler(); };
	
    b_setattitude(stext_summoned_crawler, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    npc_settofistmode(stext_summoned_crawler);
	setvar2_true(stext_summoned_crawler, bit_can_at_boss);
	StExt_UpdateSummonStats_Animal(self);
};

instance stext_summoned_oster(c_npc) 
{
	name = StExt_Str_SummonOster_Name;
    guild = gil_summoned_wolf;
    aivar[43] = id_summoned_wolf;
    aivar[91] = rx_summon_id;
	aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
    level = 0;
	senses = sense_hear | sense_see | sense_smell;
    senses_range = perc_dist_monster_active_max;
	fight_tactic = fai_snapper;
	attribute[4] = 300 + (atr_intellect / 3);
    attribute[5] = 500 + (atr_intellect / 3);
    attribute[1] = 1000 + (atr_intellect);
    attribute = attribute[1];
    attribute[3] = 2;
    attribute[2] = 2;
    protection[1] = 80 + (atr_intellect / 4);
    protection[2] = 80 + (atr_intellect / 4);
    protection[6] = 60 + (atr_intellect / 4);
    protection[3] = 10 + (atr_intellect / 5);
    protection[4] = 70 + (atr_intellect / 5);
    protection[5] = 20 + (atr_intellect / 5);
	damagetype = dam_edge;
    
	if (StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] > 200) 
	{
		mdl_setvisual(self, "Oster.mds");
        mdl_setvisualbody(self, "Sno_Body", 1, 1, "", default, default, -1);
	}
	else { b_setvisuals_snapper(); };
	
    b_setattitude(stext_summoned_oster, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    npc_settofistmode(stext_summoned_oster);
	setvar2_true(stext_summoned_oster, bit_can_at_boss);
	StExt_UpdateSummonStats_Animal(self);
};

instance stext_summoned_gobbo_skeleton(c_npc) 
{
    name = StExt_Str_Summoned_Gobbo_Skeleton_Name;
    guild = gil_summoned_gobbo_skeleton;
    aivar[43] = id_summoned_gobbo_skeleton;
    aivar[91] = rx_summon_id;
    level = 0;
    attribute[atr_strength] = 80 + (atr_intellect / 10);
    attribute[atr_dexterity] = 150 + (atr_intellect / 10);
    attribute[atr_hitpoints_max] = 200 + (atr_intellect / 2);
    attribute[atr_hitpoints] = 200 + (atr_intellect / 2);
    attribute[atr_mana_max] = 1;
    attribute[atr_mana] = 1;
    protection[prot_blunt] = 50;
    protection[prot_edge] = 75;
    protection[prot_point] = 225;
    protection[prot_fire] = 40;
    protection[prot_fly] = 10;
    protection[prot_magic] = 10;
    damagetype = dam_edge;
    fight_tactic = fai_gobbo;
    senses = (sense_hear | sense_see) | sense_smell;
    senses_range = perc_dist_monster_active_max;
    aivar[27] = followtime_long;
    aivar[28] = false;
    aivar[15] = true;
    b_setattitude(self, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    aivar[32] = onlyroutine;
    b_setvisuals_gobbo_skeleton();
	npc_settofightmode(stext_summoned_gobbo_skeleton, itmw_1h_misc_sword_sum);
	StExt_UpdateSummonStats_Undead(self);
};

instance stext_summoned_skeleton(c_npc) 
{
    name = StExt_Str_Summoned_Skeleton_Name;
    guild = gil_summoned_skeleton;
    aivar[91] = rx_summon_id;
    aivar[43] = id_summoned_skeleton;
    level = 0;
    attribute[atr_strength] = 100 + (atr_intellect / 6);
    attribute[atr_dexterity] = 100 + (atr_intellect / 6);
    attribute[atr_hitpoints_max] = 650 + (atr_intellect / 2);
    attribute[atr_hitpoints] = 650 + (atr_intellect / 2);
    attribute[atr_mana_max] = 1;
    attribute[atr_mana] = 1;
    protection[prot_blunt] = 40;
    protection[prot_edge] = 75;
    protection[prot_point] = 450;
    protection[prot_fire] = 40;
    protection[prot_fly] = 10;
    protection[prot_magic] = 10;
    fight_tactic = fai_human_strong;
    senses = (sense_hear | sense_see) | sense_smell;
    senses_range = 2900;
    aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
    b_setattitude(self, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
	StExt_UpdateSummonStats_Undead(self);	
	b_setfightskills(stext_summoned_skeleton, 45);
    b_setvisuals_lesser_skeleton();
    equipitem(stext_summoned_skeleton, itmw_1h_misc_sword_sum_scroll);
	StExt_UpdateSummonStats_Undead(self);
};

instance stext_summoned_skeleton_orc(c_npc) 
{
    name = StExt_Str_Summoned_SkeletonOrc_Name;
    guild = gil_summoned_skeleton;
    aivar[91] = rx_summon_id;
    aivar[43] = id_summoned_skeleton;
    level = 0;
    attribute[atr_strength] = 300 + (atr_intellect / 4);
    attribute[atr_dexterity] = 350 + (atr_intellect / 4);
    attribute[atr_hitpoints_max] = 1500 + (atr_intellect / 2);
    attribute[atr_hitpoints] = 1500 + (atr_intellect / 2);
    attribute[atr_mana_max] = 1;
    attribute[atr_mana] = 1;
    protection[prot_blunt] = 70;
    protection[prot_edge] = 150;
    protection[prot_point] = 1000;
    protection[prot_fire] = 50;
    protection[prot_fly] = 10;
    protection[prot_magic] = 20;
    bodystateinterruptableoverride = true;
    hitchance[npc_talent_1h] = 100;
    hitchance[npc_talent_2h] = 100;
    hitchance[npc_talent_bow] = 100;
    hitchance[npc_talent_crossbow] = 100;
    fight_tactic = fai_human_master;
    senses = (sense_hear | sense_see) | sense_smell;
    senses_range = perc_dist_monster_active_max;
    aivar[27] = followtime_medium;
    aivar[28] = false;
    aivar[15] = true;
    b_setattitude(self, att_friendly);
    start_aistate = zs_mm_rtn_summoned;
    b_setvisuals_orc_skeleton();
    equipitem(self, itmw_2h_draconsword_dead_sum);
};