func string StExt_ConcatScrollmakingResources(var c_item itm, var int count)
{
	var string str;
	var string itemname;
	itemname = itm.name;
	str = concatstrings(itemname, " (");
	str = concatstrings(str, inttostring(count));
	str = concatstrings(str, "); ");
	return str;
};

func int StExt_CanMakeScrolls(var int masteryId, var int level)
{
	var int levelIsOk;
	var int masteryOk;
	if ((level <= 0) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_BasicScrolls]) { return true; };
	
	levelIsOk = false;
	masteryOk = false;
	if ((level == 1) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_AdvancedScrolls]) { levelIsOk = true; };
	if ((level >= 2) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_MasterScrolls]) { levelIsOk = true; };
	
	if ((masteryId == StExt_MasteryIndex_Fire) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Fire]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Ice) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Ice]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Electric) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Electro]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Air) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Air]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Earth) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Earth]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Light) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Light]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Dark) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Dark]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Death) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Death]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Life) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Life]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Golem) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Golem]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Demon) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Demon]) { masteryOk = true; };
	if ((masteryId == StExt_MasteryIndex_Necro) && StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Necro]) { masteryOk = true; };

	return (levelIsOk && masteryOk);
};

func int StExt_CreateScroll_CheckResources(var int spell, var int count) 
{
	var string str;
	var int canCreate;
	var int paper;
	var int nugget;
	var int gold;
	var int quartz;
	var int wing;
	var int pitch;
	var int sulfur;
	var int waranfiretongue;
	var int holywater;
	var int rockcrystal;
	var int goblinbone;
	var int health_herb_01;
	var int health_herb_02;
	var int lockpick;
	var int swampherb;
	var int stonegolemheart;
	var int firegolemheart;
	var int icegolemheart;
	var int swampgolemheart;
	var int darkpearl;
	var int skeletonbone;
	var int plazma;
	var int wolffur;
	var int aquamarine;
	var int zombiecorpse;
	var int pearl;
	var int demonheart;
	var int coal;	
	var int wargfur;
	var int shadowbeastfur;
	var int drgsnapperhorn;
	
	nugget = count;
	paper = count;
	gold = StExt_Null;
	quartz = StExt_Null;
	wing = StExt_Null;
	pitch = StExt_Null;
	sulfur = StExt_Null;
	waranfiretongue = StExt_Null;
	holywater = StExt_Null;
	rockcrystal = StExt_Null;
	goblinbone = StExt_Null;
	health_herb_01 = StExt_Null;
	health_herb_02 = StExt_Null;
	lockpick = StExt_Null;
	swampherb = StExt_Null;
	stonegolemheart = StExt_Null;
	firegolemheart = StExt_Null;
	icegolemheart = StExt_Null;
	swampgolemheart = StExt_Null;
	darkpearl = StExt_Null;
	skeletonbone = StExt_Null;
	plazma = StExt_Null;
	wolffur = StExt_Null;
	aquamarine = StExt_Null;
	zombiecorpse = StExt_Null;
	pearl = StExt_Null;
	coal = StExt_Null;
	demonheart = StExt_Null;
	wargfur = StExt_Null;
	shadowbeastfur = StExt_Null;
	drgsnapperhorn = StExt_Null;	
	
	if(spell == spl_pallight) { gold = count; holywater = count; };
    if(spell == spl_pallightheal) { holywater = count; health_herb_01 = 1; };
    if(spell == spl_palholybolt) { holywater = count; quartz = count; };
    if(spell == spl_palmediumheal) { holywater = count; health_herb_02 = count; };
    if(spell == spl_palrepelevil) { holywater = count; };
    if(spell == spl_palfullheal) { holywater = count; health_herb_02 = count; };
    if(spell == spl_paldestroyevil) { holywater = count; };
    if(spell == spl_light) { gold = count; };
    if(spell == spl_lightheal) { health_herb_01 = count; };
    if(spell == spl_unlockchest) { lockpick = count; };	
    if(spell == spl_summonwolf) { wolffur = count; };
    if(spell == spl_summongolem) { stonegolemheart = count; };
    if(spell == spl_mediumheal) { health_herb_02 = count; };
    if(spell == spl_destroyundead) { plazma = count; };
    if(spell == spl_fullheal) { health_herb_02 = count; };
    if(spell == spl_firebolt) { sulfur = count; };
	if(spell == spl_zap) { rockcrystal = count; };
	if(spell == spl_summonfiregolem) { firegolemheart = count; };
	if(spell == spl_charm) { swampherb = count; };
	if(spell == spl_sleep) { swampherb = count; };
	if(spell == spl_berzerk) { swampherb = count; quartz = count; };
	if(spell == spl_deathbolt) { pitch = count; };
	if(spell == spl_instantfireball) { pitch = count; sulfur = count; };
    if(spell == spl_firestorm) { pitch = count * 2; sulfur = count * 2; waranfiretongue = count; };	
    if(spell == spl_chargefireball) { pitch = count; sulfur = count; rockcrystal = count; };
	if(spell == spl_firelight) { pitch = count * 2; sulfur = count * 2; waranfiretongue = count; };
    if(spell == spl_pyrokinesis) { pitch = count; sulfur = count * 2; waranfiretongue = count; };
    if(spell == spl_firerain) { pitch = count * 2; sulfur = count * 2; waranfiretongue = count; firegolemheart = count; };
    if(spell == spl_firemeteor) { pitch = count * 2; sulfur = count * 2; waranfiretongue = count; firegolemheart = count; };
    if(spell == spl_firewave) { pitch = count * 2; sulfur = count; firegolemheart = count; };
	if(spell == spl_summonshoal) { wolffur = count * 3; };
	if(spell == spl_summonicegolem) { icegolemheart = count; };
	if(spell == spl_summongoblinskeleton) { goblinbone = count; };
	if(spell == spl_lightningsphere) { rockcrystal = count * 2; quartz = count * 2; };    
    if(spell == spl_icelance) { rockcrystal = count; quartz = count; };
    if(spell == spl_icebolt) { quartz = count; };
    if(spell == spl_icecube) { quartz = count; rockcrystal = count * 2; };
    if(spell == spl_chargezap) { rockcrystal = count * 2; };
    if(spell == spl_summonshoal) { wolffur = count * 3; };
	if(spell == spl_waterfist) { aquamarine = count; pearl = count; };
    if(spell == spl_lightningflash) { quartz = count * 2; rockcrystal = count * 2; };    
    if(spell == spl_icewave) { icegolemheart = count; quartz = count; rockcrystal = count * 2; };
    if(spell == spl_geyser) { icegolemheart = count; aquamarine = count; pearl = count; };
    if(spell == spl_thunderstorm) { icegolemheart = count; rockcrystal = count * 2; };   
    if(spell == spl_telekinesis) { darkpearl = count; };
    if(spell == spl_windfist) { wing = count; };
    if(spell == spl_fear) { swampherb = count; };
	if(spell == spl_greententacle) { swampherb = count; pitch = count; };
    if(spell == spl_summonswampgolem) { swampgolemheart = count; };
    if(spell == spl_severefetidity) { swampherb = count; aquamarine = count; };
    if(spell == spl_control) { swampherb = count * 3; darkpearl = count; };
    if(spell == spl_whirlwind) { wing = count * 2; rockcrystal = count; };    
    if(spell == spl_icerain) { icegolemheart = count; aquamarine = count * 2; pearl = count; };
	if(spell == spl_manaforlife) { zombiecorpse = count; swampherb = count; };
    if(spell == spl_summonzombie) { zombiecorpse = count; };	
    if(spell == spl_swarm) { wing = count; pitch = count; };
    if(spell == spl_summonskeleton) { skeletonbone = count;  };
    if(spell == spl_summonskeleton_archer) { skeletonbone = count;  };
    if(spell == spl_energyball) { quartz = count;  };
    if(spell == spl_iceexploision) { quartz = count; rockcrystal = count * 2; };
	if(spell == spl_summondemon) { demonheart = count;  };
    if(spell == spl_deathball) { pitch = count; skeletonbone = count; };
    if(spell == spl_armyofdarkness) { zombiecorpse = count; skeletonbone = count * 2; darkpearl = count; };
    if(spell == spl_massdeath) { demonheart = count; zombiecorpse = count; skeletonbone = count; };
    if(spell == spl_skull) { zombiecorpse = count; darkpearl = count; skeletonbone = count; };
    if(spell == spl_bloodrain) { demonheart = count; darkpearl = count; };
	if(spell == spl_concussionbolt) { darkpearl = count;  };
	if(spell == spl_guruwrath) { stonegolemheart = count; pitch = count; };
    if(spell == spl_magsphere) { swampherb = count * 2; pitch = count; };
    if(spell == spl_stonefirst) { pitch = count; quartz = count;  };
    if(spell == spl_rapidfirebolt) { sulfur = count * 2;  };
    if(spell == spl_magiccage) { pearl = count;  };
    if(spell == spl_explosion) { pitch = count; sulfur = count; coal = count; };
    if(spell == spl_rapidicebolt) { quartz = count * 2;  };
    if(spell == spl_adanosball) { quartz = count; pearl = count; };
	if(spell == spl_rage) { zombiecorpse = count;  };
    if(spell == spl_lacerate) { zombiecorpse = count; skeletonbone = count; };
    if(spell == spl_extricate) { zombiecorpse = count; coal = count; };
    if(spell == spl_elevate) { wing = count * 2; quartz = count; };
    if(spell == spl_acid) { swampherb = count * 2; sulfur = count; };	
    if(spell == spl_quake) { zombiecorpse = count; coal = count; swampgolemheart = count; };
	if(spell == spl_electrowave) { plazma = count; quartz = count * 2; rockcrystal = count * 2; };
    if(spell == spl_dot_first) { coal = count; };
    if(spell == spl_agro) { zombiecorpse = count; swampherb = count; };
    if(spell == spl_dot_second) { zombiecorpse = count; coal = count; };
    if(spell == spl_darksleep) { zombiecorpse = count; swampherb = count; };
    if(spell == spl_darkcontrol) { zombiecorpse = count; swampherb = count; };	
    if(spell == spl_dark_invis) { zombiecorpse = count; darkpearl = count; };
    if(spell == spl_darkball) { zombiecorpse = count; coal = count * 2; };
    if(spell == spl_massagro) { zombiecorpse = count; darkpearl = count; coal = count * 2; };
    if(spell == spl_massdot) { zombiecorpse = count; darkpearl = count; demonheart = count; };
	if(spell == spl_bigdarkball) { coal = count; pitch = count * 2; };
    if(spell == spl_darkspear) { darkpearl = count; };
    if(spell == spl_darkwave) { zombiecorpse = count; darkpearl = count; rockcrystal = count; demonheart = count; };	
    if(spell == spl_torture) { zombiecorpse = count; darkpearl = count; };	
	if(spell == spl_summondarkgolem) { darkpearl = count; };
	if(spell == spl_summondeathhound) { zombiecorpse = count; goblinbone = count * 2; };
	if(spell == spl_breathofdeath) { zombiecorpse = count; darkpearl = count; };
	if(spell == spl_blink) { quartz = count * 3; };	
	if(spell == spl_trfsheep) { health_herb_01 = count; };
	if(spell == spl_trfscavenger) { health_herb_01 = count; };
	if(spell == spl_trfgiantbug) { health_herb_01 = count; };	
	if(spell == spl_trfwolf) { health_herb_01 = count; wolffur = count; };
	if(spell == spl_trfwaran) { health_herb_01 = count; };
	if(spell == spl_trfsnapper) { health_herb_01 = count; };	
	if(spell == spl_trfwarg) { health_herb_01 = count; wargfur = count; };
	if(spell == spl_trffirewaran) { health_herb_01 = count; waranfiretongue = count; };
	if(spell == spl_trfshadowbeast) { health_herb_02 = count; shadowbeastfur = count; };	
	if(spell == spl_trfdragonsnapper) { health_herb_02 = count; drgsnapperhorn = count; };
	if(spell == spl_trfmeatbug) { health_herb_01 = count; };
	if(spell == spl_trflurker) { health_herb_01 = count; };
	if(spell == spl_ressurect) { health_herb_02 = count; };
	//if(spell == spl_sumkhub) { };	
	//if(spell == spl_summon_skeleton_uniq) { };	
	if(spell == spl_darkpetsummon) { darkpearl = count; };
	if(spell == spl_summon_skeleton_mage) { darkpearl = count; skeletonbone = count * 3; };	
	if(spell == spl_summon_hollywisp) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_summon_airgolem) { wing = count * 2; swampherb = count * 2; quartz = count; };	
	if(spell == spl_buff_protection) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_hp) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_stats) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_regen) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_damage) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_speed) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_dodge) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_es) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_buff_massrestore) { gold = count * 2; holywater = count * 2; quartz = count; };
	if(spell == spl_debuff_protection) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_stats) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_siphon) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_speed) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_lifetap) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_reflectdamage) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_extradamage) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_debuff_weaken) { zombiecorpse = count; skeletonbone = count; coal = count * 2; };
	if(spell == spl_summon_ghost) { plazma = count; skeletonbone = count; pitch = count * 2; };
	if(spell == spl_summon_bonegolem) { goblinbone = count * 2; skeletonbone = count * 2; pitch = count * 2; };
	if(spell == spl_summon_shadowbeast) { shadowbeastfur = count; health_herb_02 = count * 2; quartz = count * 2; };
	if(spell == spl_summon_shadowbeast_fire) { plazma = count; swampherb = count * 2; pitch = count * 2; };
	if(spell == spl_summon_troll) { wargfur = count * 2; health_herb_02 = count * 2; coal = count * 2; };
	if(spell == spl_summon_crawler) { health_herb_01 = count * 3; aquamarine = count; rockcrystal = count * 2; };
	if(spell == spl_summon_oster) { health_herb_01 = count * 3; skeletonbone = count; sulfur = count * 2; };	
	if(spell == spl_firecape) { coal = count * 3; pitch = count; sulfur = count * 2; };	
	if(spell == spl_icecape) { rockcrystal = count * 2; quartz = count; aquamarine = count * 2; };
	if(spell == spl_lightingcape) { rockcrystal = count * 2; quartz = count * 2; plazma = count; };	
	if(spell == spl_darkcape) { plazma = count; darkpearl = count; pitch = count * 2; };
	if(spell == spl_aircape) { wing = count * 2; swampherb = count * 3; rockcrystal = count; };	
	if(spell == spl_earthcape) { quartz = count * 2; swampherb = count * 3; rockcrystal = count; };	
	if(spell == spl_poisioncape) { sulfur = count * 2; swampherb = count * 3; zombiecorpse = count; };
	if(spell == spl_summon_electricgolem) { quartz = count * 2; rockcrystal = count * 3; sulfur = count; };

	canCreate = true;
	if((shadowbeastfur > 0) && (npc_hasitems(hero, itat_shadowfur) < shadowbeastfur)) { canCreate = false; };
	if((wargfur > 0) && (npc_hasitems(hero, itat_wargfur) < wargfur)) { canCreate = false; };
	if((coal > 0) && (npc_hasitems(hero, itmi_coal) < coal)) { canCreate = false; };
	if((demonheart > 0) && (npc_hasitems(hero, itat_demonheart) < demonheart)) { canCreate = false; };
	if((pearl > 0) && (npc_hasitems(hero, itmi_addon_whitepearl) < pearl)) { canCreate = false; };
	if((zombiecorpse > 0) && (npc_hasitems(hero, itmi_zombiecorpse) < zombiecorpse)) { canCreate = false; };
	if((aquamarine > 0) && (npc_hasitems(hero, itmi_aquamarine) < aquamarine)) { canCreate = false; };
	if((wolffur > 0) && (npc_hasitems(hero, itat_wolffur) < itat_wolffur)) { canCreate = false; };
	if((plazma > 0) &&(npc_hasitems(hero, itmi_plazma) < plazma)) { canCreate = false; };
	if((skeletonbone > 0) && (npc_hasitems(hero, itat_skeletonbone) < skeletonbone)) { canCreate = false; };
	if((darkpearl > 0) && (npc_hasitems(hero, itmi_darkpearl) < darkpearl)) { canCreate = false; };
	if((swampgolemheart > 0) && (npc_hasitems(hero, itat_swampgolemheart) < swampgolemheart)) { canCreate = false; };
	if((icegolemheart > 0) && (npc_hasitems(hero, itat_icegolemheart) < icegolemheart)) { canCreate = false; };
	if((firegolemheart > 0) && (npc_hasitems(hero, itat_firegolemheart) < firegolemheart)) { canCreate = false; };
	if((stonegolemheart > 0) && (npc_hasitems(hero, itat_stonegolemheart) < stonegolemheart)) { canCreate = false; };
	if((swampherb > 0) && (npc_hasitems(hero, itpl_swampherb) < swampherb)) { canCreate = false; };
	if((lockpick > 0) && (npc_hasitems(hero, itke_lockpick) < lockpick)) { canCreate = false; };
	if((health_herb_02 > 0) && (npc_hasitems(hero, itpl_health_herb_02) < health_herb_02)) { canCreate = false; };
	if((health_herb_01 > 0) && (npc_hasitems(hero, itpl_health_herb_01) < health_herb_01)) { canCreate = false; };
	if((goblinbone > 0) && (npc_hasitems(hero, itat_goblinbone) < goblinbone))  { canCreate = false; };
	if((rockcrystal > 0) && (npc_hasitems(hero, itmi_rockcrystal) < rockcrystal)) { canCreate = false; };
	if((holywater > 0) && (npc_hasitems(hero, itmi_holywater) < holywater)) { canCreate = false; };
	if((waranfiretongue > 0) && (npc_hasitems(hero, itat_waranfiretongue) < waranfiretongue)) { canCreate = false; };
	if((nugget > 0) && (npc_hasitems(hero, itmi_nugget) < nugget)) { canCreate = false; };
	if((gold > 0) && (npc_hasitems(hero, itmi_gold) < gold)) { canCreate = false; };
	if((quartz > 0) && (npc_hasitems(hero, itmi_quartz) < quartz)) { canCreate = false; };
	if((sulfur > 0) && (npc_hasitems(hero, itmi_sulfur) < sulfur)) { canCreate = false; };
	if((wing > 0) && (npc_hasitems(hero, itat_wing) < wing)) { canCreate = false; };
	if((pitch > 0) && (npc_hasitems(hero, itmi_pitch) < pitch)) { canCreate = false; };
	if((drgsnapperhorn > 0) && (npc_hasitems(hero, itat_drgsnapperhorn) < drgsnapperhorn)) { canCreate = false; };
	if((paper > 0) && (npc_hasitems(hero, itwr_magicpaper) < paper)) { canCreate = false; };

	if(canCreate == true)
	{
		if(shadowbeastfur > 0) { npc_removeinvitems(hero, itat_shadowfur, shadowbeastfur); };
		if(wargfur > 0) { npc_removeinvitems(hero, itat_wargfur, wargfur); };
		if(coal > 0) { npc_removeinvitems(hero, itmi_coal, coal); };
		if(demonheart > 0) { npc_removeinvitems(hero, itat_demonheart, demonheart); };
		if(pearl > 0) { npc_removeinvitems(hero, itmi_addon_whitepearl, pearl); };
		if(zombiecorpse > 0) { npc_removeinvitems(hero, itmi_zombiecorpse, zombiecorpse); };
		if(aquamarine > 0) { npc_removeinvitems(hero, itmi_aquamarine, aquamarine); };
		if(wolffur > 0) { npc_removeinvitems(hero, itat_wolffur, wolffur); };
		if(plazma > 0) { npc_removeinvitems(hero, itmi_plazma, plazma); };
		if(skeletonbone > 0) { npc_removeinvitems(hero, itat_skeletonbone, skeletonbone); };
		if(darkpearl > 0) { npc_removeinvitems(hero, itmi_darkpearl, darkpearl); };
		if(swampgolemheart > 0) { npc_removeinvitems(hero, itat_swampgolemheart, swampgolemheart); };
		if(icegolemheart > 0) { npc_removeinvitems(hero, itat_icegolemheart, icegolemheart); };
		if(firegolemheart > 0) { npc_removeinvitems(hero, itat_firegolemheart, firegolemheart); };
		if(stonegolemheart > 0) { npc_removeinvitems(hero, itat_stonegolemheart, stonegolemheart); };
		if(swampherb > 0) { npc_removeinvitems(hero, itpl_swampherb, swampherb); };
		if(lockpick > 0) { npc_removeinvitems(hero, itke_lockpick, lockpick); };
		if(health_herb_02 > 0) { npc_removeinvitems(hero, itpl_health_herb_02, health_herb_02); };
		if(health_herb_01 > 0) { npc_removeinvitems(hero, itpl_health_herb_01, health_herb_01); };
		if(goblinbone > 0) { npc_removeinvitems(hero, itat_goblinbone, goblinbone); };
		if(rockcrystal > 0) { npc_removeinvitems(hero, itmi_rockcrystal, rockcrystal); };
		if(holywater > 0) { npc_removeinvitems(hero, itmi_holywater, holywater); };
		if(waranfiretongue > 0) { npc_removeinvitems(hero, itat_waranfiretongue, waranfiretongue); };
		if(nugget > 0) { npc_removeinvitems(hero, itmi_nugget, nugget); };
		if(gold > 0) { npc_removeinvitems(hero, itmi_gold, gold); };
		if(quartz > 0) { npc_removeinvitems(hero, itmi_quartz, quartz); };
		if(sulfur > 0) { npc_removeinvitems(hero, itmi_sulfur, sulfur); };
		if(wing > 0) { npc_removeinvitems(hero, itat_wing, wing); };
		if(pitch > 0) { npc_removeinvitems(hero, itmi_pitch, pitch); };
		if(drgsnapperhorn > 0) { npc_removeinvitems(hero, itat_drgsnapperhorn, drgsnapperhorn); };		
		if(paper > 0) { npc_removeinvitems(hero, itwr_magicpaper, paper); };		
		
		return true;
	};
	
	ai_printred(StExt_Str_Scrollmaking_RequirePaper);		
	str = "";
	if(shadowbeastfur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_shadowfur, shadowbeastfur)); };
	if(wargfur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_wargfur, wargfur)); };
	if(coal > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_coal, coal)); };
	if(demonheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_demonheart, demonheart)); };
	if(pearl > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_addon_whitepearl, pearl)); };
	if(zombiecorpse > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_zombiecorpse, zombiecorpse)); };
	if(aquamarine > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_aquamarine, aquamarine)); };
	if(wolffur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_wolffur, wolffur)); };
	if(plazma > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_plazma, plazma)); };
	if(skeletonbone > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_skeletonbone, skeletonbone)); };
	if(darkpearl > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_darkpearl, darkpearl)); };
	if(swampgolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_swampgolemheart, swampgolemheart)); };
	if(icegolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_icegolemheart, icegolemheart)); };
	if(firegolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_firegolemheart, firegolemheart)); };
	if(stonegolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_stonegolemheart, stonegolemheart)); };
	if(swampherb > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itpl_swampherb, swampherb)); };
	if(lockpick > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itke_lockpick, lockpick)); };
	if(health_herb_02 > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itpl_health_herb_02, health_herb_02)); };
	if(health_herb_01 > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itpl_health_herb_01, health_herb_01)); };
	if(goblinbone > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_goblinbone, goblinbone)); };
	if(rockcrystal > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_rockcrystal, rockcrystal)); };
	if(holywater > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_holywater, holywater)); };
	if(waranfiretongue > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_waranfiretongue, waranfiretongue)); };
	if(nugget > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_nugget, nugget)); };
	if(gold > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_gold, gold)); };
	if(quartz > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_quartz, quartz)); };
	if(sulfur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_sulfur, sulfur)); };
	if(wing > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_wing, wing)); };
	if(pitch > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_pitch, pitch)); };
	if(drgsnapperhorn > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_drgsnapperhorn, drgsnapperhorn)); };
	if(paper > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itwr_magicpaper, paper)); };
	
	ai_printred(str);
	return false;
};

func int StExt_CreateScroll(var int spell, var int count) 
{
	var string str;
	var int IsCanCreateScroll;
	var c_item weap;
	IsCanCreateScroll = StExt_CreateScroll_CheckResources(spell, count);
    if (!IsCanCreateScroll) { return false; };
	if (StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_DoubleScrolls]) { count += count; };
	
    if(spell == spl_pallight) { createinvitems(hero, itsc_pallight, count); };
    if(spell == spl_pallightheal) { createinvitems(hero, itsc_pallightheal, count); };
    if(spell == spl_palholybolt) { createinvitems(hero, itsc_palholybolt, count); };
    if(spell == spl_palmediumheal) { createinvitems(hero, itsc_palmediumheal, count); };
    if(spell == spl_palrepelevil) { createinvitems(hero, itsc_palrepelevil, count); };
    if(spell == spl_palfullheal) { createinvitems(hero, itsc_palfullheal, count); };
    if(spell == spl_paldestroyevil) { createinvitems(hero, itsc_paldestroyevil, count); };
    if(spell == spl_palteleportsecret) { };
    if(spell == spl_teleportseaport) { };
    if(spell == spl_teleportmonastery) { };
    if(spell == spl_druidball) { };
    if(spell == spl_teleportxardas) { };
    if(spell == spl_teleportpassnw) { };
    if(spell == spl_summoncrait) { };
    if(spell == spl_sumdsnapper) { };
    if(spell == spl_teleportpassow) { };
    if(spell == spl_teleportdagot) { };
    if(spell == spl_teleportoc) { };
    if(spell == spl_light) { createinvitems(hero, itsc_light, count); };
    if(spell == spl_lightheal) { createinvitems(hero, itsc_light, count); };
    if(spell == spl_unlockchest) { createinvitems(hero, itsc_unlock, count); };
    if(spell == spl_summonwolf) { createinvitems(hero, itsc_sumwolf, count); };
    if(spell == spl_summongolem) { createinvitems(hero, itsc_sumgol, count); };
    if(spell == spl_mediumheal) { createinvitems(hero, itsc_mediumheal, count); };
    if(spell == spl_destroyundead) { createinvitems(hero, itsc_harmundead, count); };
    if(spell == spl_fullheal) { createinvitems(hero, itsc_fullheal, count); };
    if(spell == spl_firebolt) { createinvitems(hero, itsc_firebolt, count); };
    if(spell == spl_instantfireball) { createinvitems(hero, itsc_instantfireball, count); };
    if(spell == spl_firestorm) { createinvitems(hero, itsc_firestorm, count); };
    if(spell == spl_summonfiregolem) { createinvitems(hero, itsc_sumfiregol, count); };
    if(spell == spl_chargefireball) { createinvitems(hero, itsc_chargefireball, count); };
    if(spell == spl_firelight) { createinvitems(hero, itsc_firelight, count); };
    if(spell == spl_pyrokinesis) { createinvitems(hero, itsc_pyrokinesis, count); };
    if(spell == spl_firerain) { createinvitems(hero, itsc_firerain, count); };
    if(spell == spl_firemeteor) { createinvitems(hero, itsc_firemeteor, count); };
    if(spell == spl_firewave) { createinvitems(hero, itsc_firewave, count); };
    if(spell == spl_lightningsphere) { createinvitems(hero, itsc_lightningsphere, count); };
    if(spell == spl_zap) { createinvitems(hero, itsc_zap, count); };
    if(spell == spl_icelance) { createinvitems(hero, itsc_icelance, count); };
    if(spell == spl_icebolt) { createinvitems(hero, itsc_icebolt, count); };
    if(spell == spl_icecube) { createinvitems(hero, itsc_icecube, count); };
    if(spell == spl_chargezap) { createinvitems(hero, itsc_thunderball, count); };
    if(spell == spl_summonshoal) { createinvitems(hero, itsc_sumshoal, count); };
    if(spell == spl_waterfist) { createinvitems(hero, itsc_waterfist, count); };
    if(spell == spl_lightningflash) { createinvitems(hero, itsc_lightningflash, count); };
    if(spell == spl_summonicegolem) { createinvitems(hero, itsc_sumicegol, count); };
    if(spell == spl_icewave) { createinvitems(hero, itsc_icewave, count); };
    if(spell == spl_geyser) { createinvitems(hero, itsc_geyser, count); };
    if(spell == spl_thunderstorm) { createinvitems(hero, itsc_thunderstorm, count); };
    if(spell == spl_sleep) { createinvitems(hero, itsc_sleep, count); };
    if(spell == spl_berzerk) { createinvitems(hero, itsc_berzerk, count); };
    if(spell == spl_telekinesis) { createinvitems(hero, itsc_telekinesis, count); };
    if(spell == spl_windfist) { createinvitems(hero, itsc_windfist, count); };
    if(spell == spl_fear) { createinvitems(hero, itsc_fear, count); };
    if(spell == spl_charm) { createinvitems(hero, itsc_charm, count); };
    if(spell == spl_greententacle) { createinvitems(hero, itsc_greententacle, count); };
    if(spell == spl_summonswampgolem) { createinvitems(hero, itsc_sumswpgol, count); };
    if(spell == spl_severefetidity) { createinvitems(hero, itsc_severefetidity, count); };
    if(spell == spl_control) { createinvitems(hero, itsc_control, count); };
    if(spell == spl_whirlwind) { createinvitems(hero, itsc_whirlwind, count); };
    if(spell == spl_deathbolt) { createinvitems(hero, itsc_deathbolt, count); };
    if(spell == spl_icerain) { createinvitems(hero, itsc_icerain, count); };
    if(spell == spl_summongoblinskeleton) { createinvitems(hero, itsc_sumgobskel, count); };
    if(spell == spl_manaforlife) { createinvitems(hero, itsc_manaforlife, count); };
    if(spell == spl_summonzombie) { createinvitems(hero, itsc_sumzombie, count); };
    if(spell == spl_swarm) { createinvitems(hero, itsc_swarm, count); };
    if(spell == spl_summonskeleton) { createinvitems(hero, itsc_sumskel, count); };
    if(spell == spl_summonskeleton_archer) { createinvitems(hero, itsc_sumskelarcher, count); };
    if(spell == spl_energyball) { createinvitems(hero, itsc_energyball, count); };
    if(spell == spl_iceexploision) { createinvitems(hero, itsc_iceexploision, count); };
    if(spell == spl_summondemon) { createinvitems(hero, itsc_sumdemon, count); };
    if(spell == spl_deathball) { createinvitems(hero, itsc_deathball, count); };
    if(spell == spl_armyofdarkness) { createinvitems(hero, itsc_armyofdarkness, count); };
    if(spell == spl_massdeath) { createinvitems(hero, itsc_massdeath, count); };
    if(spell == spl_skull) { createinvitems(hero, itsc_skull, count); };
    if(spell == spl_bloodrain) { createinvitems(hero, itsc_bloodrain, count); };
    if(spell == spl_concussionbolt) { createinvitems(hero, itsc_guruwrath, count); };
	if(spell == spl_guruwrath) { createinvitems(hero, itsc_guruwrath, count); };
    if(spell == spl_magsphere) { createinvitems(hero, itsc_magsphere, count); };
    if(spell == spl_stonefirst) { createinvitems(hero, itsc_stonefirst, count); };
    if(spell == spl_rapidfirebolt) { createinvitems(hero, itsc_rapidfirebolt, count); };
    if(spell == spl_magiccage) { createinvitems(hero, itsc_magiccage, count); };
    if(spell == spl_explosion) { createinvitems(hero, itsc_explosion, count); };
    if(spell == spl_rapidicebolt) { createinvitems(hero, itsc_rapidicebolt, count); };
    if(spell == spl_adanosball) { createinvitems(hero, itsc_adanosball, count); };
    if(spell == spl_rage) { createinvitems(hero, itsc_rage, count); };
    if(spell == spl_lacerate) { createinvitems(hero, itsc_lacerate, count); };
    if(spell == spl_extricate) { createinvitems(hero, itsc_extricate, count); };
    if(spell == spl_elevate) { createinvitems(hero, itsc_elevate, count); };
    if(spell == spl_acid) { createinvitems(hero, itsc_acid, count); };
    if(spell == spl_quake) { createinvitems(hero, itsc_quake, count); };	
    if(spell == spl_electrowave) { createinvitems(hero, itsc_electrowave, count); };
    if(spell == spl_dot_first) { createinvitems(hero, itsc_dot_first, count); };
    if(spell == spl_agro) { createinvitems(hero, itsc_argo, count); };
    if(spell == spl_dot_second) { createinvitems(hero, itsc_dot_second, count); };
    if(spell == spl_darksleep) { createinvitems(hero, itsc_darkcsleep, count); };
    if(spell == spl_darkcontrol) { createinvitems(hero, itsc_darkcontrol, count); };
    if(spell == spl_dark_invis) { createinvitems(hero, itsc_darkinvis, count); };
    if(spell == spl_darkball) { createinvitems(hero, itsc_darkball, count); };
    if(spell == spl_massagro) { createinvitems(hero, itsc_massagro, count); };
    if(spell == spl_massdot) { createinvitems(hero, itsc_massdot, count); };
    if(spell == spl_bigdarkball) { createinvitems(hero, itsc_bigdarkball, count); };
    if(spell == spl_darkspear) { createinvitems(hero, itsc_darkspear, count); };
    if(spell == spl_darkwave) { createinvitems(hero, itsc_darkwave, count); };
    if(spell == spl_torture) { createinvitems(hero, itsc_torture, count); };	
	if(spell == spl_summondarkgolem) { createinvitems(hero, itsc_sumdarkgol, count); };
	if(spell == spl_summondeathhound) { createinvitems(hero, itsc_sumdeathhound, count); };
	if(spell == spl_breathofdeath) { createinvitems(hero, itsc_breathofdeath, count); };
	if(spell == spl_blink) { createinvitems(hero, itsc_blink, count); };
	if(spell == spl_trfsheep) { createinvitems(hero, itsc_trfsheep, count); };
	if(spell == spl_trfscavenger) { createinvitems(hero, itsc_trfscavenger, count); };
	if(spell == spl_trfgiantbug) { createinvitems(hero, itsc_trfgiantbug, count); };
	if(spell == spl_trfwolf) { createinvitems(hero, itsc_trfwolf, count); };
	if(spell == spl_trfwaran) { createinvitems(hero, itsc_trfwaran, count); };
	if(spell == spl_trfsnapper) { createinvitems(hero, itsc_trfsnapper, count); };
	if(spell == spl_trfwarg) { createinvitems(hero, itsc_trfwarg, count); };
	if(spell == spl_trffirewaran) { createinvitems(hero, itsc_trffirewaran, count); };
	if(spell == spl_trfshadowbeast) { createinvitems(hero, itsc_trfshadowbeast, count); };
	if(spell == spl_trfdragonsnapper) { createinvitems(hero, itsc_trfdragonsnapper, count); };
	if(spell == spl_trfmeatbug) { createinvitems(hero, itsc_trfmeatbug, count); };
	if(spell == spl_trflurker) { createinvitems(hero, itsc_trflurker, count); };
	if(spell == spl_sumkhub) { createinvitems(hero, itsc_sumkhub, count); };	
	if(spell == spl_summon_skeleton_uniq) { createinvitems(hero, itsc_sumskeluniq, count); };	
	if(spell == spl_darkpetsummon) { createinvitems(hero, itsc_sumdkpet, count); };
	if(spell == spl_summon_skeleton_mage) { createinvitems(hero, itsc_sumskelmage, count); };	
	if(spell == spl_ressurect) { createinvitems(hero, itsc_ressurect, count); };	
	if(spell == spl_summon_hollywisp) { createinvitems(hero, itsc_sumhollywisp, count); };
	if(spell == spl_summon_airgolem) { createinvitems(hero, itsc_summonairgolem, count); };	
	if(spell == spl_buff_protection) { createinvitems(hero, itsc_buff_protection, count); };
	if(spell == spl_buff_hp) { createinvitems(hero, itsc_buff_hp, count); };
	if(spell == spl_buff_stats) { createinvitems(hero, itsc_buff_stats, count); };
	if(spell == spl_buff_regen) { createinvitems(hero, itsc_buff_regen, count); };
	if(spell == spl_buff_damage) { createinvitems(hero, itsc_buff_damage, count); };
	if(spell == spl_buff_speed) { createinvitems(hero, itsc_buff_speed, count); };
	if(spell == spl_buff_dodge) { createinvitems(hero, itsc_buff_dodge, count); };
	if(spell == spl_buff_es) { createinvitems(hero, itsc_buff_es, count); };
	if(spell == spl_buff_massrestore) { createinvitems(hero, itsc_buff_massrestore, count); };
	if(spell == spl_debuff_protection) { createinvitems(hero, itsc_debuff_protection, count); };
	if(spell == spl_debuff_stats) { createinvitems(hero, itsc_debuff_stats, count); };
	if(spell == spl_debuff_siphon) { createinvitems(hero, itsc_debuff_siphon, count); };
	if(spell == spl_debuff_speed) { createinvitems(hero, itsc_debuff_speed, count); };
	if(spell == spl_debuff_lifetap) { createinvitems(hero, itsc_debuff_lifetap, count); };
	if(spell == spl_debuff_reflectdamage) { createinvitems(hero, itsc_debuff_reflectdamage, count); };
	if(spell == spl_debuff_extradamage) { createinvitems(hero, itsc_debuff_extradamage, count); };
	if(spell == spl_debuff_weaken) { createinvitems(hero, itsc_debuff_weaken, count); };
	if(spell == spl_summon_ghost) { createinvitems(hero, itsc_summon_ghost, count); };
	if(spell == spl_summon_bonegolem) { createinvitems(hero, itsc_summon_bonegolem, count); };
	if(spell == spl_summon_shadowbeast) { createinvitems(hero, itsc_summon_shadowbeast, count); };
	if(spell == spl_summon_shadowbeast_fire) { createinvitems(hero, itsc_summon_shadowbeast_fire, count); };
	if(spell == spl_summon_troll) { createinvitems(hero, itsc_summon_troll, count); };
	if(spell == spl_summon_crawler) { createinvitems(hero, itsc_summon_crawler, count); };
	if(spell == spl_summon_oster) { createinvitems(hero, itsc_summon_oster, count); };	
	if(spell == spl_summon_electricgolem) { createinvitems(hero, itsc_stext_summon_electricgolem, count); };
	if(spell == spl_poisioncape) { createinvitems(hero, itsc_stext_poisioncape, count); };
	if(spell == spl_earthcape) { createinvitems(hero, itsc_stext_earthcape, count); };
	if(spell == spl_aircape) { createinvitems(hero, itsc_stext_aircape, count); };
	if(spell == spl_darkcape) { createinvitems(hero, itsc_stext_darkcape, count); };
	if(spell == spl_lightingcape) { createinvitems(hero, itsc_stext_lightingcape, count); };
	if(spell == spl_icecape) { createinvitems(hero, itsc_stext_icecape, count); };
	if(spell == spl_firecape) { createinvitems(hero, itsc_stext_firecape, count); };
	
	weap = npc_getreadiedweapon(hero);
	StExt_ProcessDamageExp(hero, hero, weap, 50 * count, 0, StExt_GetSpellDamageFlags(spell));
	b_giveplayerxp(10 * count);
	str = concatstrings(" (x", inttostring(count));
	str = concatstrings(str, ")");
	str = concatstrings(StExt_Str_ScrollmakingDone, str);
	ai_print(str);
};

func string StExt_GetScrollmakingLine_x5(var string name)
{
	return concatstrings("(x5) ", name);
};

instance Dia_StExt_Scrollmaking_ExitDialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_ExitDialog_condition;
    information = Dia_StExt_Scrollmaking_ExitDialog_info;
    important = false;
    permanent = true;
    nr = 999;
    description = dialog_ende;
};
func int Dia_StExt_Scrollmaking_ExitDialog_condition() {
    if(StExt_DisplayScrollmakingMenu == true) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_ExitDialog_info() {
    StExt_DisplayScrollmakingMenu = false;
	ai_stopprocessinfos(hero);	
};

// FIRE
instance Dia_StExt_Scrollmaking_Fire_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Fire_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Fire_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingFire;
};
func int Dia_StExt_Scrollmaking_Fire_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Fire] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Fire, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Fire_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Fire_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, dialog_back, StExt_Scrollmaking_Fire_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_firebolt, Dia_StExt_Scrollmaking_Fire_firebolt);
	info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_firebolt), Dia_StExt_Scrollmaking_Fire_firebolt_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Fire] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Fire, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_instantfireball, Dia_StExt_Scrollmaking_Fire_instantfireball);	
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, txt_spells[spl_firecape], Dia_StExt_Scrollmaking_Fire_firecape);		
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_instantfireball), Dia_StExt_Scrollmaking_Fire_instantfireball_x5);	
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_firecape]), Dia_StExt_Scrollmaking_Fire_firecape_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Fire] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Fire, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_firestorm, Dia_StExt_Scrollmaking_Fire_firestorm);
        info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_summonfiregolem, Dia_StExt_Scrollmaking_Fire_summonfiregolem);		
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_firestorm), Dia_StExt_Scrollmaking_Fire_firestorm_x5);
        info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonfiregolem), Dia_StExt_Scrollmaking_Fire_summonfiregolem_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Fire] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_chargefireball, Dia_StExt_Scrollmaking_Fire_chargefireball);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_firewave, Dia_StExt_Scrollmaking_Fire_rapidfirebolt);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_firelight, Dia_StExt_Scrollmaking_Fire_firelight);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_explosion, Dia_StExt_Scrollmaking_Fire_explosion);		
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_chargefireball), Dia_StExt_Scrollmaking_Fire_chargefireball_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_firewave), Dia_StExt_Scrollmaking_Fire_rapidfirebolt_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_firelight), Dia_StExt_Scrollmaking_Fire_firelight_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_explosion), Dia_StExt_Scrollmaking_Fire_explosion_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Fire] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_pyrokinesis, Dia_StExt_Scrollmaking_Fire_pyrokinesis);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_firerain, Dia_StExt_Scrollmaking_Fire_firerain);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, name_spl_firemeteor, Dia_StExt_Scrollmaking_Fire_firemeteor);		
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_pyrokinesis), Dia_StExt_Scrollmaking_Fire_pyrokinesis_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_firerain), Dia_StExt_Scrollmaking_Fire_firerain_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Fire_Dialog, StExt_GetScrollmakingLine_x5(name_spl_firemeteor), Dia_StExt_Scrollmaking_Fire_firemeteor_x5);
	};	
};
func void StExt_Scrollmaking_Fire_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Fire_Dialog);
};
func void Dia_StExt_Scrollmaking_Fire_firebolt() { StExt_CreateScroll(spl_firebolt, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_instantfireball() { StExt_CreateScroll(spl_instantfireball, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firestorm() { StExt_CreateScroll(spl_firestorm, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_summonfiregolem() { StExt_CreateScroll(spl_summonfiregolem, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_chargefireball() { StExt_CreateScroll(spl_chargefireball, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_rapidfirebolt() { StExt_CreateScroll(spl_firewave, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firelight() { StExt_CreateScroll(spl_firelight, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_explosion() { StExt_CreateScroll(spl_explosion, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_pyrokinesis() { StExt_CreateScroll(spl_pyrokinesis, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firerain() { StExt_CreateScroll(spl_firerain, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firemeteor() { StExt_CreateScroll(spl_firemeteor, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firecape() { StExt_CreateScroll(spl_firecape, 1); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Fire_firecape_x5() { StExt_CreateScroll(spl_firecape, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firebolt_x5() { StExt_CreateScroll(spl_firebolt, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_instantfireball_x5() { StExt_CreateScroll(spl_instantfireball, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firestorm_x5() { StExt_CreateScroll(spl_firestorm, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_summonfiregolem_x5() { StExt_CreateScroll(spl_summonfiregolem, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_chargefireball_x5() { StExt_CreateScroll(spl_chargefireball, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_rapidfirebolt_x5() { StExt_CreateScroll(spl_firewave, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firelight_x5() { StExt_CreateScroll(spl_firelight, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_explosion_x5() { StExt_CreateScroll(spl_explosion, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_pyrokinesis_x5() { StExt_CreateScroll(spl_pyrokinesis, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firerain_x5() { StExt_CreateScroll(spl_firerain, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Fire_firemeteor_x5() { StExt_CreateScroll(spl_firemeteor, 5); Dia_StExt_Scrollmaking_Fire_Dialog_info(); };

// ICE
instance Dia_StExt_Scrollmaking_ice_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_ice_Dialog_condition;
    information = Dia_StExt_Scrollmaking_ice_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingIce;
};
func int Dia_StExt_Scrollmaking_ice_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Ice] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Ice, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_ice_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_ice_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, dialog_back, StExt_Scrollmaking_ice_back);	
	info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_icebolt, Dia_StExt_Scrollmaking_Ice_icebolt);	
	info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_icebolt), Dia_StExt_Scrollmaking_Ice_icebolt_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Ice] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Ice, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_icelance, Dia_StExt_Scrollmaking_Ice_icelance);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, txt_spells[spl_icecape], Dia_StExt_Scrollmaking_Ice_icecape);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_icelance), Dia_StExt_Scrollmaking_Ice_icelance_x5);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_icecape]), Dia_StExt_Scrollmaking_Ice_icecape_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Ice] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Ice, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_summonshoal, Dia_StExt_Scrollmaking_Ice_summonshoal);
        info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_icecube, Dia_StExt_Scrollmaking_Ice_icecube);		
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonshoal), Dia_StExt_Scrollmaking_Ice_summonshoal_x5);
        info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_icecube), Dia_StExt_Scrollmaking_Ice_icecube_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Ice] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_iceexploision, Dia_StExt_Scrollmaking_Ice_iceexploision);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_summonicegolem, Dia_StExt_Scrollmaking_Ice_summonicegolem);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_waterfist, Dia_StExt_Scrollmaking_Ice_waterfist);		
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_iceexploision), Dia_StExt_Scrollmaking_Ice_iceexploision_x5);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonicegolem), Dia_StExt_Scrollmaking_Ice_summonicegolem_x5);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_waterfist), Dia_StExt_Scrollmaking_Ice_waterfist_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Ice] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_icewave, Dia_StExt_Scrollmaking_Ice_icewave);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_geyser, Dia_StExt_Scrollmaking_Ice_geyser);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, name_spl_icerain, Dia_StExt_Scrollmaking_Ice_icerain);		
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_icewave), Dia_StExt_Scrollmaking_Ice_icewave_x5);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_geyser), Dia_StExt_Scrollmaking_Ice_geyser_x5);
		info_addchoice(Dia_StExt_Scrollmaking_ice_Dialog, StExt_GetScrollmakingLine_x5(name_spl_icerain), Dia_StExt_Scrollmaking_Ice_icerain_x5);
	};	
};
func void Dia_StExt_Scrollmaking_Ice_icebolt() { StExt_CreateScroll(spl_icebolt, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icelance() { StExt_CreateScroll(spl_icelance, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_summonshoal() { StExt_CreateScroll(spl_summonshoal, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icecube() { StExt_CreateScroll(spl_icecube, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_iceexploision() { StExt_CreateScroll(spl_iceexploision, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_summonicegolem() { StExt_CreateScroll(spl_summonicegolem, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_waterfist() { StExt_CreateScroll(spl_waterfist, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icewave() { StExt_CreateScroll(spl_icewave, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_geyser() { StExt_CreateScroll(spl_geyser, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icerain() { StExt_CreateScroll(spl_icerain, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icecape() { StExt_CreateScroll(spl_icecape, 1); Dia_StExt_Scrollmaking_ice_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Ice_icecape_x5() { StExt_CreateScroll(spl_icecape, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icebolt_x5() { StExt_CreateScroll(spl_icebolt, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icelance_x5() { StExt_CreateScroll(spl_icelance, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_summonshoal_x5() { StExt_CreateScroll(spl_summonshoal, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icecube_x5() { StExt_CreateScroll(spl_icecube, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_iceexploision_x5() { StExt_CreateScroll(spl_iceexploision, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_summonicegolem_x5() { StExt_CreateScroll(spl_summonicegolem, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_waterfist_x5() { StExt_CreateScroll(spl_waterfist, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icewave_x5() { StExt_CreateScroll(spl_icewave, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_geyser_x5() { StExt_CreateScroll(spl_geyser, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_icerain_x5() { StExt_CreateScroll(spl_icerain, 5); Dia_StExt_Scrollmaking_ice_Dialog_info(); };
func void StExt_Scrollmaking_ice_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_ice_Dialog);
};


// AIR
instance Dia_StExt_Scrollmaking_Air_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Air_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Air_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingAir;
};
func int Dia_StExt_Scrollmaking_Air_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Air] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Air, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Air_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Air_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, dialog_back, StExt_Scrollmaking_Air_back);
	info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_berzerk, Dia_StExt_Scrollmaking_Earth_berzerk);	
	info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_berzerk), Dia_StExt_Scrollmaking_Earth_berzerk_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_zap, Dia_StExt_Scrollmaking_Air_zap);	
	info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_zap), Dia_StExt_Scrollmaking_Air_zap_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Air] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Air, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_lightningflash, Dia_StExt_Scrollmaking_Air_lightningflash);
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_windfist, Dia_StExt_Scrollmaking_Air_Windfist);		
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_summon_airgolem, Dia_StExt_Scrollmaking_Air_AirGolem);	
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, txt_spells[spl_aircape], Dia_StExt_Scrollmaking_Air_aircape);	
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_aircape]), Dia_StExt_Scrollmaking_Air_aircape_x5);		
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summon_airgolem), Dia_StExt_Scrollmaking_Air_AirGolem_x5);		
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_lightningflash), Dia_StExt_Scrollmaking_Air_lightningflash_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_windfist), Dia_StExt_Scrollmaking_Air_Windfist_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Air] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Air, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_chargezap, Dia_StExt_Scrollmaking_Air_chargezap);
        info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_Str_ScrollmakingBlinkTxt, Dia_StExt_Scrollmaking_Air_blink);		
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_chargezap), Dia_StExt_Scrollmaking_Air_chargezap_x5);
        info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(StExt_Str_ScrollmakingBlinkTxt), Dia_StExt_Scrollmaking_Air_blink_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Air] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_lightningsphere, Dia_StExt_Scrollmaking_Air_lightningsphere);
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_whirlwind, Dia_StExt_Scrollmaking_Air_Whirlwind);		
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_lightningsphere), Dia_StExt_Scrollmaking_Air_lightningsphere_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_whirlwind), Dia_StExt_Scrollmaking_Air_Whirlwind_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Air] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, name_spl_thunderstorm, Dia_StExt_Scrollmaking_Air_thunderstorm);		
		info_addchoice(Dia_StExt_Scrollmaking_Air_Dialog, StExt_GetScrollmakingLine_x5(name_spl_thunderstorm), Dia_StExt_Scrollmaking_Air_thunderstorm_x5);
	};	
};
func void StExt_Scrollmaking_Air_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Air_Dialog);
};
func void Dia_StExt_Scrollmaking_Air_Whirlwind() { StExt_CreateScroll(spl_whirlwind, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_Windfist() { StExt_CreateScroll(spl_windfist, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_blink() { StExt_CreateScroll(spl_blink, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_zap() { StExt_CreateScroll(spl_zap, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_lightningflash() { StExt_CreateScroll(spl_lightningflash, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_chargezap() { StExt_CreateScroll(spl_chargezap, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_lightningsphere() { StExt_CreateScroll(spl_lightningsphere, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_thunderstorm() { StExt_CreateScroll(spl_thunderstorm, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_AirGolem() { StExt_CreateScroll(spl_summon_airgolem, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_aircape() { StExt_CreateScroll(spl_aircape, 1); Dia_StExt_Scrollmaking_Air_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Air_aircape_x5() { StExt_CreateScroll(spl_aircape, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_AirGolem_x5() { StExt_CreateScroll(spl_summon_airgolem, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_Whirlwind_x5() { StExt_CreateScroll(spl_whirlwind, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_Windfist_x5() { StExt_CreateScroll(spl_windfist, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_blink_x5() { StExt_CreateScroll(spl_blink, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_zap_x5() { StExt_CreateScroll(spl_zap, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_lightningflash_x5() { StExt_CreateScroll(spl_lightningflash, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_chargezap_x5() { StExt_CreateScroll(spl_chargezap, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_lightningsphere_x5() { StExt_CreateScroll(spl_lightningsphere, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Air_thunderstorm_x5() { StExt_CreateScroll(spl_thunderstorm, 5); Dia_StExt_Scrollmaking_Air_Dialog_info(); };


// ELECTRO
instance Dia_StExt_Scrollmaking_Electric_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Electric_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Electric_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingElectric;
};
func int Dia_StExt_Scrollmaking_Electric_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Electric] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Electric, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Electric_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Electric_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, dialog_back, StExt_Scrollmaking_Electric_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, name_spl_zap, Dia_StExt_Scrollmaking_Ice_zap);	
	info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(name_spl_zap), Dia_StExt_Scrollmaking_Ice_zap_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Electric] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Electric, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, txt_spells[spl_summon_electricgolem], Dia_StExt_Scrollmaking_Electro_summon_electricgolem);	
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, txt_spells[spl_lightingcape], Dia_StExt_Scrollmaking_Electro_lightingcape);	
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, name_spl_lightningflash, Dia_StExt_Scrollmaking_Ice_lightningflash);	
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_electricgolem]), Dia_StExt_Scrollmaking_Electro_summon_electricgolem_x5);		
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_lightingcape]), Dia_StExt_Scrollmaking_Electro_lightingcape_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(name_spl_lightningflash), Dia_StExt_Scrollmaking_Ice_lightningflash_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Electric] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Electric, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, name_spl_chargezap, Dia_StExt_Scrollmaking_Ice_summonshoal);
        info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_Str_ScrollmakingBlinkTxt, Dia_StExt_Scrollmaking_Electro_blink);		
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(name_spl_chargezap), Dia_StExt_Scrollmaking_Ice_summonshoal_x5);
        info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(StExt_Str_ScrollmakingBlinkTxt), Dia_StExt_Scrollmaking_Electro_blink_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Electric] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, name_spl_lightningsphere, Dia_StExt_Scrollmaking_Ice_lightningsphere);		
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(name_spl_lightningsphere), Dia_StExt_Scrollmaking_Ice_lightningsphere_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Electric] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, name_spl_electrowave, Dia_StExt_Scrollmaking_Ice_electrowave);
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, name_spl_thunderstorm, Dia_StExt_Scrollmaking_Ice_thunderstorm);		
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(name_spl_electrowave), Dia_StExt_Scrollmaking_Ice_electrowave_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Electric_Dialog, StExt_GetScrollmakingLine_x5(name_spl_thunderstorm), Dia_StExt_Scrollmaking_Ice_thunderstorm_x5);
	};	
};
func void StExt_Scrollmaking_Electric_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Electric_Dialog);
};
func void Dia_StExt_Scrollmaking_Ice_zap() { StExt_CreateScroll(spl_zap, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_lightningflash() { StExt_CreateScroll(spl_lightningflash, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_thunderball() { StExt_CreateScroll(spl_chargezap, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_lightningsphere() { StExt_CreateScroll(spl_lightningsphere, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_electrowave() { StExt_CreateScroll(spl_electrowave, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_thunderstorm() { StExt_CreateScroll(spl_thunderstorm, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Electro_blink() { StExt_CreateScroll(spl_blink, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Electro_summon_electricgolem() { StExt_CreateScroll(spl_summon_electricgolem, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Electro_lightingcape() { StExt_CreateScroll(spl_lightingcape, 1); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Electro_summon_electricgolem_x5() { StExt_CreateScroll(spl_summon_electricgolem, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Electro_lightingcape_x5() { StExt_CreateScroll(spl_lightingcape, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_zap_x5() { StExt_CreateScroll(spl_zap, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_lightningflash_x5() { StExt_CreateScroll(spl_lightningflash, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_thunderball_x5() { StExt_CreateScroll(spl_chargezap, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_lightningsphere_x5() { StExt_CreateScroll(spl_lightningsphere, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_electrowave_x5() { StExt_CreateScroll(spl_electrowave, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Ice_thunderstorm_x5() { StExt_CreateScroll(spl_thunderstorm, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Electro_blink_x5() { StExt_CreateScroll(spl_blink, 5); Dia_StExt_Scrollmaking_Electric_Dialog_info(); };


// EARTH
instance Dia_StExt_Scrollmaking_Earth_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Earth_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Earth_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingEarth;
};
func int Dia_StExt_Scrollmaking_Earth_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Earth] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Earth, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Earth_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Earth_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, dialog_back, StExt_Scrollmaking_Earth_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_berzerk, Dia_StExt_Scrollmaking_Earth_berzerk);	
	info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_berzerk), Dia_StExt_Scrollmaking_Earth_berzerk_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Earth] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Earth, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_stonefirst, Dia_StExt_Scrollmaking_Earth_stonefirst);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_unlockchest, Dia_StExt_Scrollmaking_Earth_unlock);		
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, txt_spells[spl_earthcape], Dia_StExt_Scrollmaking_Earth_earthcape);			
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_stonefirst), Dia_StExt_Scrollmaking_Earth_stonefirst_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_unlockchest), Dia_StExt_Scrollmaking_Earth_unlock_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_earthcape]), Dia_StExt_Scrollmaking_Earth_earthcape_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Earth] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Earth, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_extricate, Dia_StExt_Scrollmaking_Earth_extricate);
        info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_magsphere, Dia_StExt_Scrollmaking_Earth_magsphere);		
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_extricate), Dia_StExt_Scrollmaking_Earth_extricate_x5);
        info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_magsphere), Dia_StExt_Scrollmaking_Earth_magsphere_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Earth] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_summonswampgolem, Dia_StExt_Scrollmaking_Earth_summonswampgolem);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_acid, Dia_StExt_Scrollmaking_Earth_acid);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_severefetidity, Dia_StExt_Scrollmaking_Earth_severefetidity);		
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonswampgolem), Dia_StExt_Scrollmaking_Earth_summonswampgolem_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_acid), Dia_StExt_Scrollmaking_Earth_acid_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_severefetidity), Dia_StExt_Scrollmaking_Earth_severefetidity_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Earth] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_gururage, Dia_StExt_Scrollmaking_Earth_gururage);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, name_spl_quake, Dia_StExt_Scrollmaking_Earth_quake);		
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_gururage), Dia_StExt_Scrollmaking_Earth_gururage_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Earth_Dialog, StExt_GetScrollmakingLine_x5(name_spl_quake), Dia_StExt_Scrollmaking_Earth_quake_x5);
	};	
};
func void StExt_Scrollmaking_Earth_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Earth_Dialog);
};
func void Dia_StExt_Scrollmaking_Earth_berzerk() { StExt_CreateScroll(spl_berzerk, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_stonefirst() { StExt_CreateScroll(spl_stonefirst, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_extricate() { StExt_CreateScroll(spl_extricate, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_magsphere() { StExt_CreateScroll(spl_magsphere, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_summonswampgolem() { StExt_CreateScroll(spl_summonswampgolem, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_acid() { StExt_CreateScroll(spl_acid, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_severefetidity() { StExt_CreateScroll(spl_severefetidity, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_quake() { StExt_CreateScroll(spl_quake, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_gururage() { StExt_CreateScroll(spl_guruwrath, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_unlock() { StExt_CreateScroll(spl_unlockchest, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_earthcape() { StExt_CreateScroll(spl_earthcape, 1); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Earth_earthcape_x5() { StExt_CreateScroll(spl_earthcape, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_berzerk_x5() { StExt_CreateScroll(spl_berzerk, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_stonefirst_x5() { StExt_CreateScroll(spl_stonefirst, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_extricate_x5() { StExt_CreateScroll(spl_extricate, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_magsphere_x5() { StExt_CreateScroll(spl_magsphere, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_summonswampgolem_x5() { StExt_CreateScroll(spl_summonswampgolem, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_acid_x5() { StExt_CreateScroll(spl_acid, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_severefetidity_x5() { StExt_CreateScroll(spl_severefetidity, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_quake_x5() { StExt_CreateScroll(spl_quake, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_gururage_x5() { StExt_CreateScroll(spl_guruwrath, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Earth_unlock_x5() { StExt_CreateScroll(spl_unlockchest, 5); Dia_StExt_Scrollmaking_Earth_Dialog_info(); };


// LIGHT
instance Dia_StExt_Scrollmaking_Light_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Light_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Light_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingLight;
};
func int Dia_StExt_Scrollmaking_Light_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Light] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Light, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Light_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Light_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, dialog_back, StExt_Scrollmaking_Light_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_light, StExt_Scrollmaking_Light_Light);	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_protection], StExt_Scrollmaking_Light_buff_protection);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_hp], StExt_Scrollmaking_Light_buff_hp);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_stats], StExt_Scrollmaking_Light_buff_stats);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_regen], StExt_Scrollmaking_Light_buff_regen);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_damage], StExt_Scrollmaking_Light_buff_damage);	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_speed], StExt_Scrollmaking_Light_buff_speed);	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_dodge], StExt_Scrollmaking_Light_buff_dodge);	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_es], StExt_Scrollmaking_Light_buff_es);	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, txt_spells[spl_buff_massrestore], StExt_Scrollmaking_Light_buff_massrestore);
	
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_light), StExt_Scrollmaking_Light_Light_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_protection]), StExt_Scrollmaking_Light_buff_protection_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_hp]), StExt_Scrollmaking_Light_buff_hp_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_stats]), StExt_Scrollmaking_Light_buff_stats_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_regen]), StExt_Scrollmaking_Light_buff_regen_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_damage]), StExt_Scrollmaking_Light_buff_damage_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_speed]), StExt_Scrollmaking_Light_buff_speed_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_dodge]), StExt_Scrollmaking_Light_buff_dodge_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_es]), StExt_Scrollmaking_Light_buff_es_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_buff_massrestore]), StExt_Scrollmaking_Light_buff_massrestore_x5);
	
	if(StExt_Talent_Level[StExt_MasteryIndex_Light] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Light, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_pallight, StExt_Scrollmaking_Light_pLight);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_pallightheal, StExt_Scrollmaking_Light_lh);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_stext_sumhollywisp, StExt_Scrollmaking_Light_sumwisp);		
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_stext_sumhollywisp), StExt_Scrollmaking_Light_sumwisp_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_pallight), StExt_Scrollmaking_Light_pLight_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_pallightheal), StExt_Scrollmaking_Light_lh_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Light] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Light, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_palholybolt, StExt_Scrollmaking_Light_hb);
        info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_palmediumheal, StExt_Scrollmaking_Light_mh);		
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_palholybolt), StExt_Scrollmaking_Light_hb_x5);
        info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_palmediumheal), StExt_Scrollmaking_Light_mh_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Light] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_palrepelevil, StExt_Scrollmaking_Light_rev);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_palfullheal, StExt_Scrollmaking_Light_fh);		
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_palrepelevil), StExt_Scrollmaking_Light_rev_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_palfullheal), StExt_Scrollmaking_Light_fh_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Light] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, name_spl_paldestroyevil, StExt_Scrollmaking_Light_sedtroevil);
		info_addchoice(Dia_StExt_Scrollmaking_Light_Dialog, StExt_GetScrollmakingLine_x5(name_spl_paldestroyevil), StExt_Scrollmaking_Light_sedtroevil_x5);
	};	
};
func void StExt_Scrollmaking_Light_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Light_Dialog);
};
func void StExt_Scrollmaking_Light_Light() { StExt_CreateScroll(spl_light, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_pLight() { StExt_CreateScroll(spl_pallight, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_lh() { StExt_CreateScroll(spl_pallightheal, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_hb() { StExt_CreateScroll(spl_palholybolt, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_mh() { StExt_CreateScroll(spl_palmediumheal, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_rev() { StExt_CreateScroll(spl_palrepelevil, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_fh() { StExt_CreateScroll(spl_palfullheal, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_sedtroevil() { StExt_CreateScroll(spl_paldestroyevil, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_sumwisp() { StExt_CreateScroll(spl_summon_hollywisp, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_protection() { StExt_CreateScroll(spl_buff_protection, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_hp() { StExt_CreateScroll(spl_buff_hp, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_stats() { StExt_CreateScroll(spl_buff_stats, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_regen() { StExt_CreateScroll(spl_buff_regen, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_damage() { StExt_CreateScroll(spl_buff_damage, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_speed() { StExt_CreateScroll(spl_buff_speed, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_dodge() { StExt_CreateScroll(spl_buff_dodge, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_es() { StExt_CreateScroll(spl_buff_es, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_massrestore() { StExt_CreateScroll(spl_buff_massrestore, 1); Dia_StExt_Scrollmaking_Light_Dialog_info(); };

func void StExt_Scrollmaking_Light_sumwisp_x5() { StExt_CreateScroll(spl_summon_hollywisp, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_Light_x5() { StExt_CreateScroll(spl_light, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_pLight_x5() { StExt_CreateScroll(spl_pallight, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_lh_x5() { StExt_CreateScroll(spl_pallightheal, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_hb_x5() { StExt_CreateScroll(spl_palholybolt, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_mh_x5() { StExt_CreateScroll(spl_palmediumheal, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_rev_x5() { StExt_CreateScroll(spl_palrepelevil, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_fh_x5() { StExt_CreateScroll(spl_palfullheal, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_sedtroevil_x5() { StExt_CreateScroll(spl_paldestroyevil, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_protection_x5() { StExt_CreateScroll(spl_buff_protection, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_hp_x5() { StExt_CreateScroll(spl_buff_hp, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_stats_x5() { StExt_CreateScroll(spl_buff_stats, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_regen_x5() { StExt_CreateScroll(spl_buff_regen, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_damage_x5() { StExt_CreateScroll(spl_buff_damage, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_speed_x5() { StExt_CreateScroll(spl_buff_speed, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_dodge_x5() { StExt_CreateScroll(spl_buff_dodge, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_es_x5() { StExt_CreateScroll(spl_buff_es, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };
func void StExt_Scrollmaking_Light_buff_massrestore_x5() { StExt_CreateScroll(spl_buff_massrestore, 5); Dia_StExt_Scrollmaking_Light_Dialog_info(); };


// DARK
instance Dia_StExt_Scrollmaking_Dark_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Dark_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Dark_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingDark;
};
func int Dia_StExt_Scrollmaking_Dark_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Dark] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Dark, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Dark_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Dark_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, dialog_back, StExt_Scrollmaking_Dark_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_dot_first, Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_dot1);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_agro, Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_agro);	
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_protection], Dia_StExt_Scrollmaking_Dark_debuff_protection);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_stats], Dia_StExt_Scrollmaking_Dark_debuff_stats);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_siphon], Dia_StExt_Scrollmaking_Dark_debuff_siphon);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_speed], Dia_StExt_Scrollmaking_Dark_debuff_speed);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_lifetap], Dia_StExt_Scrollmaking_Dark_debuff_lifetap);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_reflectdamage], Dia_StExt_Scrollmaking_Dark_debuff_reflectdamage);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_extradamage], Dia_StExt_Scrollmaking_Dark_debuff_extradamage);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_debuff_weaken], Dia_StExt_Scrollmaking_Dark_debuff_weaken);
	
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_dot_first), Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_dot1_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_agro), Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_agro_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_protection]), Dia_StExt_Scrollmaking_Dark_debuff_protection_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_stats]), Dia_StExt_Scrollmaking_Dark_debuff_stats_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_siphon]), Dia_StExt_Scrollmaking_Dark_debuff_siphon_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_speed]), Dia_StExt_Scrollmaking_Dark_debuff_speed_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_lifetap]), Dia_StExt_Scrollmaking_Dark_debuff_lifetap_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_reflectdamage]), Dia_StExt_Scrollmaking_Dark_debuff_reflectdamage_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_extradamage]), Dia_StExt_Scrollmaking_Dark_debuff_extradamage_x5);
	info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_debuff_weaken]), Dia_StExt_Scrollmaking_Dark_debuff_weaken_x5);


	if(StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Dark, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_darkcontrol, Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_control);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_darksleep, Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_sleep);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_dot_second, Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_dot2);	
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, txt_spells[spl_darkcape], Dia_StExt_Scrollmaking_Dark_Dialog_darkcape);
		
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_darkcontrol), Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_control_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_darksleep), Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_sleep_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_dot_second), Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_dot2_x5);		
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_darkcape]), Dia_StExt_Scrollmaking_Dark_Dialog_darkcape_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Dark, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_dark_invis, Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_invis);
        info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_darkball, Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkball);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_summon_darkgolem, Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkgolem);		
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_dark_invis), Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_invis_x5);
        info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_darkball), Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkball_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summon_darkgolem), Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkgolem_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_bigdarkball, Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_bigdarkball);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_massagro, Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massagro);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_massdot, Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massdot);		
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_bigdarkball), Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_bigdarkball_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_massagro), Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massagro_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_massdot), Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massdot_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_darkspear, Dia_StExt_Scrollmaking_Dark_Dialog_5_spl_darkspear);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_darkwave, Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_darkwave);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, name_spl_torture, Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_torture);		
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_darkspear), Dia_StExt_Scrollmaking_Dark_Dialog_5_spl_darkspear_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_darkwave), Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_darkwave_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Dark_Dialog, StExt_GetScrollmakingLine_x5(name_spl_torture), Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_torture_x5);
	};	
};
func void StExt_Scrollmaking_Dark_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Dark_Dialog);
};
func void Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_dot1() { StExt_CreateScroll(spl_dot_first, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_agro() { StExt_CreateScroll(spl_agro, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_control() { StExt_CreateScroll(spl_darkcontrol, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_sleep() { StExt_CreateScroll(spl_darksleep, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_dot2() { StExt_CreateScroll(spl_dot_second, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_invis() { StExt_CreateScroll(spl_dark_invis, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkball() { StExt_CreateScroll(spl_darkball, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_bigdarkball() { StExt_CreateScroll(spl_bigdarkball, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massagro() { StExt_CreateScroll(spl_massagro, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massdot() { StExt_CreateScroll(spl_massdot, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_5_spl_darkspear() { StExt_CreateScroll(spl_darkspear, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_darkwave() { StExt_CreateScroll(spl_darkwave, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_torture() { StExt_CreateScroll(spl_torture, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkgolem() { StExt_CreateScroll(spl_summondarkgolem, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_protection() { StExt_CreateScroll(spl_debuff_protection, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_stats() { StExt_CreateScroll(spl_debuff_stats, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_siphon() { StExt_CreateScroll(spl_debuff_siphon, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_speed() { StExt_CreateScroll(spl_debuff_speed, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_lifetap() { StExt_CreateScroll(spl_debuff_lifetap, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_reflectdamage() { StExt_CreateScroll(spl_debuff_reflectdamage, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_extradamage() { StExt_CreateScroll(spl_debuff_extradamage, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_weaken() { StExt_CreateScroll(spl_debuff_weaken, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_darkcape() { StExt_CreateScroll(spl_darkcape, 1); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Dark_Dialog_darkcape_x5() { StExt_CreateScroll(spl_darkcape, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_dot1_x5() { StExt_CreateScroll(spl_dot_first, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_1_spl_agro_x5() { StExt_CreateScroll(spl_agro, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_control_x5() { StExt_CreateScroll(spl_darkcontrol, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_sleep_x5() { StExt_CreateScroll(spl_darksleep, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_2_spl_dot2_x5() { StExt_CreateScroll(spl_dot_second, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_invis_x5() { StExt_CreateScroll(spl_dark_invis, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkball_x5() { StExt_CreateScroll(spl_darkball, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_bigdarkball_x5() { StExt_CreateScroll(spl_bigdarkball, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massagro_x5() { StExt_CreateScroll(spl_massagro, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_4_spl_massdot_x5() { StExt_CreateScroll(spl_massdot, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_5_spl_darkspear_x5() { StExt_CreateScroll(spl_darkspear, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_darkwave_x5() { StExt_CreateScroll(spl_darkwave, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_6_spl_torture_x5() { StExt_CreateScroll(spl_torture, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_Dialog_3_spl_darkgolem_x5() { StExt_CreateScroll(spl_summondarkgolem, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_protection_x5() { StExt_CreateScroll(spl_debuff_protection, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_stats_x5() { StExt_CreateScroll(spl_debuff_stats, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_siphon_x5() { StExt_CreateScroll(spl_debuff_siphon, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_speed_x5() { StExt_CreateScroll(spl_debuff_speed, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_lifetap_x5() { StExt_CreateScroll(spl_debuff_lifetap, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_reflectdamage_x5() { StExt_CreateScroll(spl_debuff_reflectdamage, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_extradamage_x5() { StExt_CreateScroll(spl_debuff_extradamage, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Dark_debuff_weaken_x5() { StExt_CreateScroll(spl_debuff_weaken, 5); Dia_StExt_Scrollmaking_Dark_Dialog_info(); };


//NECRO
instance Dia_StExt_Scrollmaking_Necro_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Necro_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Necro_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingNecro;
};
func int Dia_StExt_Scrollmaking_Necro_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Necro] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Necro, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Necro_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Necro_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, dialog_back, StExt_Scrollmaking_Necro_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_summongoblinskeleton, Dia_StExt_Scrollmaking_Death_Dialog_1_spl_summongoblinskeleton);
	info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summongoblinskeleton), Dia_StExt_Scrollmaking_Death_Dialog_1_spl_summongoblinskeleton_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Necro, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_summonzombie, Dia_StExt_Scrollmaking_Death_Dialog_2_spl_summonzombie);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_summon_deathhound, Dia_StExt_Scrollmaking_Death_Dialog_2summon_deathhound);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonzombie), Dia_StExt_Scrollmaking_Death_Dialog_2_spl_summonzombie_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summon_deathhound), Dia_StExt_Scrollmaking_Death_Dialog_2summon_deathhound_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Necro, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_summonskeleton_archer, Dia_StExt_Scrollmaking_Death_Dialog_4_spl_archerskeleton);	
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_summonskeleton, Dia_StExt_Scrollmaking_Death_Dialog_3_spl_summonskeleton);	
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, txt_spells[spl_summon_bonegolem], Dia_StExt_Scrollmaking_Death_Dialog_summon_bonegolem);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonskeleton_archer), Dia_StExt_Scrollmaking_Death_Dialog_4_spl_archerskeleton_x5);			
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonskeleton), Dia_StExt_Scrollmaking_Death_Dialog_3_spl_summonskeleton_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_bonegolem]), Dia_StExt_Scrollmaking_Death_Dialog_summon_bonegolem_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 4)
	{	
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_summon_skeleton_mage, Dia_StExt_Scrollmaking_Death_Dialog_spl_sumskelmage);	
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summon_skeleton_mage), Dia_StExt_Scrollmaking_Death_Dialog_spl_sumskelmage_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, name_spl_armyofdarkness, Dia_StExt_Scrollmaking_Death_Dialog_5_spl_armyofdarkness);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, txt_spells[spl_summon_ghost], Dia_StExt_Scrollmaking_Death_Dialog_summon_ghost);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(name_spl_armyofdarkness), Dia_StExt_Scrollmaking_Death_Dialog_5_spl_armyofdarkness_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Necro_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_ghost]), Dia_StExt_Scrollmaking_Death_Dialog_summon_ghost_x5);
	};	
};
func void StExt_Scrollmaking_Necro_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Necro_Dialog);
};

//DEATH
instance Dia_StExt_Scrollmaking_Death_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Death_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Death_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingDeath;
};
func int Dia_StExt_Scrollmaking_Death_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Death] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Death, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Death_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Death_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, dialog_back, StExt_Scrollmaking_Death_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_deathbolt, Dia_StExt_Scrollmaking_Death_Dialog_1_spl_deathbolt);
	info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_deathbolt), Dia_StExt_Scrollmaking_Death_Dialog_1_spl_deathbolt_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Death] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Death, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_manaforlife, Dia_StExt_Scrollmaking_Death_Dialog_2_spl_suckenergy);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_lacerate, Dia_StExt_Scrollmaking_Death_Dialog_2_spl_lacerate);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_manaforlife), Dia_StExt_Scrollmaking_Death_Dialog_2_spl_suckenergy_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_lacerate), Dia_StExt_Scrollmaking_Death_Dialog_2_spl_lacerate_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Death] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Death, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_energyball, Dia_StExt_Scrollmaking_Death_Dialog_3_spl_energyball);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_energyball), Dia_StExt_Scrollmaking_Death_Dialog_3_spl_energyball_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Death] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_deathball, Dia_StExt_Scrollmaking_Death_Dialog_4_spl_deathball);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_massdeath, Dia_StExt_Scrollmaking_Death_Dialog_6_spl_massdeath);		
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_deathball), Dia_StExt_Scrollmaking_Death_Dialog_4_spl_deathball_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_massdeath), Dia_StExt_Scrollmaking_Death_Dialog_6_spl_massdeath_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Death] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_skull, Dia_StExt_Scrollmaking_Death_Dialog_6_spl_skull);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, name_spl_bloodrain, Dia_StExt_Scrollmaking_Death_Dialog_1_spl_rage);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_skull), Dia_StExt_Scrollmaking_Death_Dialog_6_spl_skull_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Death_Dialog, StExt_GetScrollmakingLine_x5(name_spl_bloodrain), Dia_StExt_Scrollmaking_Death_Dialog_1_spl_rage_x5);				
	};	
};
func void StExt_Scrollmaking_Death_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Death_Dialog);
};
func void Dia_StExt_Scrollmaking_Death_Dialog_spl_sumskelmage() { StExt_CreateScroll(spl_summon_skeleton_mage, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_spl_sumskelmage_x5() { StExt_CreateScroll(spl_summon_skeleton_mage, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_summuniqskell() { StExt_CreateScroll(spl_summon_skeleton_uniq, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_deathbolt() { StExt_CreateScroll(spl_deathbolt, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_summongoblinskeleton() { StExt_CreateScroll(spl_summongoblinskeleton, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2_spl_suckenergy() { StExt_CreateScroll(spl_manaforlife, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2_spl_lacerate() { StExt_CreateScroll(spl_lacerate, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2_spl_summonzombie() { StExt_CreateScroll(spl_summonzombie, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_3_spl_energyball() { StExt_CreateScroll(spl_energyball, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_3_spl_summonskeleton() { StExt_CreateScroll(spl_summonskeleton, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_4_spl_deathball() { StExt_CreateScroll(spl_deathball, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_4_spl_archerskeleton() { StExt_CreateScroll(spl_summonskeleton_archer, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_6_spl_skull() { StExt_CreateScroll(spl_skull, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_5_spl_armyofdarkness() { StExt_CreateScroll(spl_armyofdarkness, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_6_spl_massdeath() { StExt_CreateScroll(spl_massdeath, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_rage() { StExt_CreateScroll(spl_bloodrain, 1); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2summon_deathhound() { StExt_CreateScroll(spl_summondeathhound, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_summon_ghost() { StExt_CreateScroll(spl_summon_ghost, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_summon_bonegolem() { StExt_CreateScroll(spl_summon_bonegolem, 1); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };

func void Dia_StExt_Scrollmaking_Death_Dialog_summon_ghost_x5() { StExt_CreateScroll(spl_summon_ghost, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_summon_bonegolem_x5() { StExt_CreateScroll(spl_summon_bonegolem, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_summuniqskell_x5() { StExt_CreateScroll(spl_summon_skeleton_uniq, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_deathbolt_x5() { StExt_CreateScroll(spl_deathbolt, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_summongoblinskeleton_x5() { StExt_CreateScroll(spl_summongoblinskeleton, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2_spl_suckenergy_x5() { StExt_CreateScroll(spl_manaforlife, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2_spl_lacerate_x5() { StExt_CreateScroll(spl_lacerate, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2_spl_summonzombie_x5() { StExt_CreateScroll(spl_summonzombie, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_3_spl_energyball_x5() { StExt_CreateScroll(spl_energyball, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_3_spl_summonskeleton_x5() { StExt_CreateScroll(spl_summonskeleton, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_4_spl_deathball_x5() { StExt_CreateScroll(spl_deathball, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_4_spl_archerskeleton_x5() { StExt_CreateScroll(spl_summonskeleton_archer, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_6_spl_skull_x5() { StExt_CreateScroll(spl_skull, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_5_spl_armyofdarkness_x5() { StExt_CreateScroll(spl_armyofdarkness, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_6_spl_massdeath_x5() { StExt_CreateScroll(spl_massdeath, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_1_spl_rage_x5() { StExt_CreateScroll(spl_bloodrain, 5); Dia_StExt_Scrollmaking_Death_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Death_Dialog_2summon_deathhound_x5() { StExt_CreateScroll(spl_summondeathhound, 5); Dia_StExt_Scrollmaking_Necro_Dialog_info(); };

// LIFE
instance Dia_StExt_Scrollmaking_Life_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Life_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Life_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingLife;
};
func int Dia_StExt_Scrollmaking_Life_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Life] > 0 || StExt_CanMakeScrolls(StExt_MasteryIndex_Life, 0))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Life_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Life_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, dialog_back, StExt_Scrollmaking_Life_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_sleep, Dia_StExt_Scrollmaking_sleep);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_lightheal, Dia_StExt_Scrollmaking_lightheal);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfsheep, Dia_StExt_Scrollmaking_trfsheep);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_ressurect, Dia_StExt_Scrollmaking_ressurect);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_ressurect), Dia_StExt_Scrollmaking_ressurect_x5);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_sleep), Dia_StExt_Scrollmaking_sleep_x5);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_lightheal), Dia_StExt_Scrollmaking_lightheal_x5);	
	info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfsheep), Dia_StExt_Scrollmaking_trfsheep_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Life] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Life, 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_mediumheal, Dia_StExt_Scrollmaking_medheal);		
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfscavenger, Dia_StExt_Scrollmaking_trfsca);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfgiantbug, Dia_StExt_Scrollmaking_trfgb);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_charm, Dia_StExt_Scrollmaking_charm);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, txt_spells[spl_poisioncape], Dia_StExt_Scrollmaking_poisioncape);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, txt_spells[spl_summon_crawler], Dia_StExt_Scrollmaking_summon_crawler);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, txt_spells[spl_summon_oster], Dia_StExt_Scrollmaking_summon_oster);	

		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_mediumheal), Dia_StExt_Scrollmaking_medheal_x5);		
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfscavenger), Dia_StExt_Scrollmaking_trfsca_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfgiantbug), Dia_StExt_Scrollmaking_trfgb_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_charm), Dia_StExt_Scrollmaking_charm_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_poisioncape]), Dia_StExt_Scrollmaking_poisioncape_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_crawler]), Dia_StExt_Scrollmaking_summon_crawler_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_oster]), Dia_StExt_Scrollmaking_summon_oster_x5);
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Life] >= 3 || StExt_CanMakeScrolls(StExt_MasteryIndex_Life, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_fullheal, Dia_StExt_Scrollmaking_fh);		
        info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfmeatbug, Dia_StExt_Scrollmaking_trfmeatbug);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfwolf, Dia_StExt_Scrollmaking_trfwolf);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfwaran, Dia_StExt_Scrollmaking_trfwar);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trflurker, Dia_StExt_Scrollmaking_trflurk);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, txt_spells[spl_summon_shadowbeast], Dia_StExt_Scrollmaking_summon_shadowbeast);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, txt_spells[spl_summon_troll], Dia_StExt_Scrollmaking_summon_troll);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_fullheal), Dia_StExt_Scrollmaking_fh_x5);		
        info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfmeatbug), Dia_StExt_Scrollmaking_trfmeatbug_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfwolf), Dia_StExt_Scrollmaking_trfwolf_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfwaran), Dia_StExt_Scrollmaking_trfwar_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trflurker), Dia_StExt_Scrollmaking_trflurk_x5);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_shadowbeast]), Dia_StExt_Scrollmaking_summon_shadowbeast_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_troll]), Dia_StExt_Scrollmaking_summon_troll_x5);		
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Life] >= 4)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfwarg, Dia_StExt_Scrollmaking_trfwarg);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trffirewaran, Dia_StExt_Scrollmaking_trffwar);			
		//info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_control, Dia_StExt_Scrollmaking_control);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_telekinesis, Dia_StExt_Scrollmaking_telekinesis);			
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfwarg), Dia_StExt_Scrollmaking_trfwarg_x5);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trffirewaran), Dia_StExt_Scrollmaking_trffwar_x5);			
		//info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_control), Dia_StExt_Scrollmaking_control_x5);	
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_telekinesis), Dia_StExt_Scrollmaking_telekinesis_x5);	
	};
	if(StExt_Talent_Level[StExt_MasteryIndex_Life] >= 5)
	{
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfsnapper, Dia_StExt_Scrollmaking_trfsnap);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, name_spl_trfshadowbeast, Dia_StExt_Scrollmaking_trfbeast);		
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfsnapper), Dia_StExt_Scrollmaking_trfsnap_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Life_Dialog, StExt_GetScrollmakingLine_x5(name_spl_trfshadowbeast), Dia_StExt_Scrollmaking_trfbeast_x5);
	};	
};
func void Dia_StExt_Scrollmaking_control() { StExt_CreateScroll(spl_control, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_telekinesis() { StExt_CreateScroll(spl_telekinesis, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_sleep() { StExt_CreateScroll(spl_sleep, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_charm() { StExt_CreateScroll(spl_charm, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_lightheal() { StExt_CreateScroll(spl_lightheal, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfsheep() { StExt_CreateScroll(spl_trfsheep, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_medheal() { StExt_CreateScroll(spl_mediumheal, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfsca() { StExt_CreateScroll(spl_trfscavenger, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfgb() { StExt_CreateScroll(spl_trfgiantbug, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_fh() { StExt_CreateScroll(spl_fullheal, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfmeatbug() { StExt_CreateScroll(spl_trfmeatbug, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfwolf() { StExt_CreateScroll(spl_trfwolf, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfwar() { StExt_CreateScroll(spl_trfwaran, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trflurk() { StExt_CreateScroll(spl_trflurker, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfwarg() { StExt_CreateScroll(spl_trfwarg, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfsnap() { StExt_CreateScroll(spl_trfdragonsnapper, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfbeast() { StExt_CreateScroll(spl_trfshadowbeast, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trffwar() { StExt_CreateScroll(spl_trffirewaran, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_ressurect() { StExt_CreateScroll(spl_ressurect, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_poisioncape() { StExt_CreateScroll(spl_poisioncape, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_shadowbeast() { StExt_CreateScroll(spl_summon_shadowbeast, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_troll() { StExt_CreateScroll(spl_summon_troll, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_crawler() { StExt_CreateScroll(spl_summon_crawler, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_oster() { StExt_CreateScroll(spl_summon_oster, 1); Dia_StExt_Scrollmaking_Life_Dialog_info(); };

func void Dia_StExt_Scrollmaking_poisioncape_x5() { StExt_CreateScroll(spl_poisioncape, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_shadowbeast_x5() { StExt_CreateScroll(spl_summon_shadowbeast, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_troll_x5() { StExt_CreateScroll(spl_summon_troll, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_crawler_x5() { StExt_CreateScroll(spl_summon_crawler, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_oster_x5() { StExt_CreateScroll(spl_summon_oster, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_ressurect_x5() { StExt_CreateScroll(spl_ressurect, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_control_x5() { StExt_CreateScroll(spl_control, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_telekinesis_x5() { StExt_CreateScroll(spl_telekinesis, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_sleep_x5() { StExt_CreateScroll(spl_sleep, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_charm_x5() { StExt_CreateScroll(spl_charm, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_lightheal_x5() { StExt_CreateScroll(spl_lightheal, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfsheep_x5() { StExt_CreateScroll(spl_trfsheep, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_medheal_x5() { StExt_CreateScroll(spl_mediumheal, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfsca_x5() { StExt_CreateScroll(spl_trfscavenger, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfgb_x5() { StExt_CreateScroll(spl_trfgiantbug, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_fh_x5() { StExt_CreateScroll(spl_fullheal, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfmeatbug_x5() { StExt_CreateScroll(spl_trfmeatbug, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfwolf_x5() { StExt_CreateScroll(spl_trfwolf, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfwar_x5() { StExt_CreateScroll(spl_trfwaran, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trflurk_x5() { StExt_CreateScroll(spl_trflurker, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfwarg_x5() { StExt_CreateScroll(spl_trfwarg, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfsnap_x5() { StExt_CreateScroll(spl_trfdragonsnapper, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trfbeast_x5() { StExt_CreateScroll(spl_trfshadowbeast, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void Dia_StExt_Scrollmaking_trffwar_x5() { StExt_CreateScroll(spl_trffirewaran, 5); Dia_StExt_Scrollmaking_Life_Dialog_info(); };
func void StExt_Scrollmaking_Life_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Life_Dialog);
};


// GOLEMS
instance Dia_StExt_Scrollmaking_Golems_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Golems_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Golems_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingGolems;
};
func int Dia_StExt_Scrollmaking_Golems_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Golem] >= 1 || StExt_CanMakeScrolls(StExt_MasteryIndex_Golem, 1))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Golems_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Golems_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, dialog_back, StExt_Scrollmaking_Golems_back);	
	info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, name_spl_summongolem, Dia_StExt_Scrollmaking_StoneGolem);	
	info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summongolem), Dia_StExt_Scrollmaking_StoneGolem_x5);
	if(StExt_Talent_Level[StExt_MasteryIndex_Golem] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Golem, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, name_spl_summonicegolem, Dia_StExt_Scrollmaking_iStoneGolem);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, name_spl_summonfiregolem, Dia_StExt_Scrollmaking_fStoneGolem);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, name_spl_summonswampgolem, Dia_StExt_Scrollmaking_swpStoneGolem);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, name_spl_summon_darkgolem, Dia_StExt_Scrollmaking_darkGolem);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, txt_spells[spl_summon_electricgolem], Dia_StExt_Scrollmaking_summon_electricgolem);		
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonicegolem), Dia_StExt_Scrollmaking_iStoneGolem_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonfiregolem), Dia_StExt_Scrollmaking_fStoneGolem_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summonswampgolem), Dia_StExt_Scrollmaking_swpStoneGolem_x5);
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summon_darkgolem), Dia_StExt_Scrollmaking_darkGolem_x5);		
		info_addchoice(Dia_StExt_Scrollmaking_Golems_Dialog, StExt_GetScrollmakingLine_x5(txt_spells[spl_summon_electricgolem]), Dia_StExt_Scrollmaking_summon_electricgolem_x5);
	};	
};
func void Dia_StExt_Scrollmaking_StoneGolem() { StExt_CreateScroll(spl_summongolem, 1); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_darkGolem() { StExt_CreateScroll(spl_summondarkgolem, 1); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_iStoneGolem() { StExt_CreateScroll(spl_summonicegolem, 1); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_fStoneGolem() { StExt_CreateScroll(spl_summonfiregolem, 1); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_swpStoneGolem() { StExt_CreateScroll(spl_summonswampgolem, 1); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_summon_electricgolem() { StExt_CreateScroll(spl_summon_electricgolem, 1); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };

func void Dia_StExt_Scrollmaking_summon_electricgolem_x5() { StExt_CreateScroll(spl_summon_electricgolem, 5); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_StoneGolem_x5() { StExt_CreateScroll(spl_summongolem, 5); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_darkGolem_x5() { StExt_CreateScroll(spl_summondarkgolem, 5); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_iStoneGolem_x5() { StExt_CreateScroll(spl_summonicegolem, 5); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_fStoneGolem_x5() { StExt_CreateScroll(spl_summonfiregolem, 5); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void Dia_StExt_Scrollmaking_swpStoneGolem_x5() { StExt_CreateScroll(spl_summonswampgolem, 5); Dia_StExt_Scrollmaking_Golems_Dialog_info(); };
func void StExt_Scrollmaking_Golems_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Golems_Dialog);
};


// DEMONOLOG
instance Dia_StExt_Scrollmaking_Demonology_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Demonology_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Demonology_Dialog_info;
    important = false;
    permanent = true;
    nr = 10;
    description = StExt_Str_ScrollmakingDemonology;
};
func int Dia_StExt_Scrollmaking_Demonology_Dialog_condition() {
    if((StExt_DisplayScrollmakingMenu == true) && (StExt_Talent_Level[StExt_MasteryIndex_Demon] >= 1 || StExt_CanMakeScrolls(StExt_MasteryIndex_Demon, 1))) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Demonology_Dialog_info() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Demonology_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Demonology_Dialog, dialog_back, StExt_Scrollmaking_Demonology_back);
	//info_addchoice(Dia_StExt_Scrollmaking_Demonology_Dialog, stext_name_spl_summondemon_khub, Dia_StExt_Scrollmaking_DemonKhub);
	if(StExt_Talent_Level[StExt_MasteryIndex_Demon] >= 2 || StExt_CanMakeScrolls(StExt_MasteryIndex_Demon, 2))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Demonology_Dialog, name_spl_summondemonscr, Dia_StExt_Scrollmaking_Demon);
		info_addchoice(Dia_StExt_Scrollmaking_Demonology_Dialog, StExt_GetScrollmakingLine_x5(name_spl_summondemonscr), Dia_StExt_Scrollmaking_Demon_x5);
	};
	info_addchoice(Dia_StExt_Scrollmaking_Demonology_Dialog, name_spl_darkpetsummon, Dia_StExt_Scrollmaking_DemonDk);
	info_addchoice(Dia_StExt_Scrollmaking_Demonology_Dialog, StExt_GetScrollmakingLine_x5(name_spl_darkpetsummon), Dia_StExt_Scrollmaking_DemonDk_x5);	
};
func void StExt_Scrollmaking_Demonology_back() 
{
    info_clearchoices(Dia_StExt_Scrollmaking_Demonology_Dialog);
};
func void Dia_StExt_Scrollmaking_DemonDk() { StExt_CreateScroll(spl_darkpetsummon, 1); Dia_StExt_Scrollmaking_Demonology_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Demon() { StExt_CreateScroll(spl_summondemon, 1); Dia_StExt_Scrollmaking_Demonology_Dialog_info(); };
func void Dia_StExt_Scrollmaking_DemonKhub() { StExt_CreateScroll(spl_sumkhub, 1); Dia_StExt_Scrollmaking_Demonology_Dialog_info(); };
func void Dia_StExt_Scrollmaking_DemonDk_x5() { StExt_CreateScroll(spl_darkpetsummon, 5); Dia_StExt_Scrollmaking_Demonology_Dialog_info(); };
func void Dia_StExt_Scrollmaking_Demon_x5() { StExt_CreateScroll(spl_summondemon, 5); Dia_StExt_Scrollmaking_Demonology_Dialog_info(); };
func void Dia_StExt_Scrollmaking_DemonKhub_x5() { StExt_CreateScroll(spl_sumkhub, 5); Dia_StExt_Scrollmaking_Demonology_Dialog_info(); };


// RUNES
func int StExt_CreateRune_CheckResources(var int spell, var int count) 
{
	var string str;
	var int canCreate;
	var int paper;
	var int nugget;
	var int gold;
	var int quartz;
	var int wing;
	var int pitch;
	var int sulfur;
	var int waranfiretongue;
	var int holywater;
	var int rockcrystal;
	var int goblinbone;
	var int health_herb_01;
	var int health_herb_02;
	var int lockpick;
	var int swampherb;
	var int stonegolemheart;
	var int firegolemheart;
	var int icegolemheart;
	var int swampgolemheart;
	var int darkpearl;
	var int skeletonbone;
	var int plazma;
	var int wolffur;
	var int aquamarine;
	var int zombiecorpse;
	var int pearl;
	var int demonheart;
	var int coal;	
	var int wargfur;
	var int shadowbeastfur;
	var int drgsnapperhorn;
	var int runestone;
	
	nugget = count * 10;
	paper = count;
	runestone = count;
	gold = StExt_Null;
	quartz = StExt_Null;
	wing = StExt_Null;
	pitch = StExt_Null;
	sulfur = StExt_Null;
	waranfiretongue = StExt_Null;
	holywater = StExt_Null;
	rockcrystal = StExt_Null;
	goblinbone = StExt_Null;
	health_herb_01 = StExt_Null;
	health_herb_02 = StExt_Null;
	lockpick = StExt_Null;
	swampherb = StExt_Null;
	stonegolemheart = StExt_Null;
	firegolemheart = StExt_Null;
	icegolemheart = StExt_Null;
	swampgolemheart = StExt_Null;
	darkpearl = StExt_Null;
	skeletonbone = StExt_Null;
	plazma = StExt_Null;
	wolffur = StExt_Null;
	aquamarine = StExt_Null;
	zombiecorpse = StExt_Null;
	pearl = StExt_Null;
	coal = StExt_Null;
	demonheart = StExt_Null;
	wargfur = StExt_Null;
	shadowbeastfur = StExt_Null;
	drgsnapperhorn = StExt_Null;	
	
	if(spell == spl_summondarkgolem) { darkpearl = count * 3; };
	if(spell == spl_summondeathhound) { zombiecorpse = count * 10; goblinbone = count * 20; };
	if(spell == spl_summon_skeleton_mage) { darkpearl = count * 3; skeletonbone = count * 30; };	
	if(spell == spl_darkpetsummon) { darkpearl = count * 2; skeletonbone = count * 5; demonheart = count * 1; }; 
	if(spell == spl_summoncrait) { pearl = count * 2; health_herb_02 = count * 50; shadowbeastfur = count * 3; }; 
	if(spell == spl_sumdsnapper) { pearl = count * 2; health_herb_02 = count * 50; drgsnapperhorn = count * 3; }; 	
	if(spell == spl_rapidfirebolt) { sulfur = count * 2; pitch = count * 2; coal = count * 3; };
	if(spell == spl_rapidicebolt) { pearl = count * 2; quartz = count * 3; rockcrystal = count * 3; };
	if(spell == spl_elevate) { plazma = count * 2; swampherb = count * 15; wing = count * 3; };	
	if(spell == spl_summon_hollywisp) { plazma = count; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_summon_airgolem) { wing = count * 5; swampherb = count * 10; quartz = count * 3; };	
	if(spell == spl_buff_protection) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_hp) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_stats) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_regen) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_damage) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_speed) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_dodge) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_es) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_buff_massrestore) { gold = count * 20; holywater = count * 10; quartz = count * 3; };
	if(spell == spl_debuff_protection) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 2; };
	if(spell == spl_debuff_stats) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_debuff_siphon) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_debuff_speed) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_debuff_lifetap) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_debuff_reflectdamage) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_debuff_extradamage) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_debuff_weaken) { zombiecorpse = count * 3; skeletonbone = count * 3; coal = count * 7; };
	if(spell == spl_summon_ghost) { plazma = count * 3; skeletonbone = count * 3; pitch = count * 7; };
	if(spell == spl_summon_bonegolem) { goblinbone = count * 10; skeletonbone = count * 10; pitch = count * 10; };
	if(spell == spl_summon_shadowbeast) { shadowbeastfur = count * 3; health_herb_02 = count * 10; quartz = count * 10; };
	if(spell == spl_summon_shadowbeast_fire) { plazma = count * 3; swampherb = count * 20; pitch = count * 10; };
	if(spell == spl_summon_troll) { wargfur = count * 10; health_herb_02 = count * 10; coal = count * 10; };
	if(spell == spl_summon_crawler) { health_herb_01 = count * 15; aquamarine = count * 5; rockcrystal = count * 10; };
	if(spell == spl_summon_oster) { health_herb_01 = count * 15; skeletonbone = count * 5; sulfur = count * 10; };	
	if(spell == spl_firecape) { coal = count * 15; pitch = count * 5; sulfur = count * 10; };	
	if(spell == spl_icecape) { rockcrystal = count * 10; quartz = count * 5; aquamarine = count * 5; };
	if(spell == spl_lightingcape) { rockcrystal = count * 10; quartz = count * 5; plazma = count * 3; };	
	if(spell == spl_darkcape) { plazma = count * 3; darkpearl = count * 3; pitch = count * 10; };
	if(spell == spl_aircape) { wing = count * 10; swampherb = count * 15; rockcrystal = count * 5; };	
	if(spell == spl_earthcape) { quartz = count * 10; swampherb = count * 15; rockcrystal = count * 5; };	
	if(spell == spl_poisioncape) { sulfur = count * 10; swampherb = count * 15; zombiecorpse = count * 5; };
	if(spell == spl_summon_electricgolem) { quartz = count * 10; rockcrystal = count * 15; sulfur = count * 5; };
	
	canCreate = true;
	if((shadowbeastfur > 0) && (npc_hasitems(hero, itat_shadowfur) < shadowbeastfur)) { canCreate = false; };
	if((wargfur > 0) && (npc_hasitems(hero, itat_wargfur) < wargfur)) { canCreate = false; };
	if((coal > 0) && (npc_hasitems(hero, itmi_coal) < coal)) { canCreate = false; };
	if((demonheart > 0) && (npc_hasitems(hero, itat_demonheart) < demonheart)) { canCreate = false; };
	if((pearl > 0) && (npc_hasitems(hero, itmi_addon_whitepearl) < pearl)) { canCreate = false; };
	if((zombiecorpse > 0) && (npc_hasitems(hero, itmi_zombiecorpse) < zombiecorpse)) { canCreate = false; };
	if((aquamarine > 0) && (npc_hasitems(hero, itmi_aquamarine) < aquamarine)) { canCreate = false; };
	if((wolffur > 0) && (npc_hasitems(hero, itat_wolffur) < itat_wolffur)) { canCreate = false; };
	if((plazma > 0) &&(npc_hasitems(hero, itmi_plazma) < plazma)) { canCreate = false; };
	if((skeletonbone > 0) && (npc_hasitems(hero, itat_skeletonbone) < skeletonbone)) { canCreate = false; };
	if((darkpearl > 0) && (npc_hasitems(hero, itmi_darkpearl) < darkpearl)) { canCreate = false; };
	if((swampgolemheart > 0) && (npc_hasitems(hero, itat_swampgolemheart) < swampgolemheart)) { canCreate = false; };
	if((icegolemheart > 0) && (npc_hasitems(hero, itat_icegolemheart) < icegolemheart)) { canCreate = false; };
	if((firegolemheart > 0) && (npc_hasitems(hero, itat_firegolemheart) < firegolemheart)) { canCreate = false; };
	if((stonegolemheart > 0) && (npc_hasitems(hero, itat_stonegolemheart) < stonegolemheart)) { canCreate = false; };
	if((swampherb > 0) && (npc_hasitems(hero, itpl_swampherb) < swampherb)) { canCreate = false; };
	if((lockpick > 0) && (npc_hasitems(hero, itke_lockpick) < lockpick)) { canCreate = false; };
	if((health_herb_02 > 0) && (npc_hasitems(hero, itpl_health_herb_02) < health_herb_02)) { canCreate = false; };
	if((health_herb_01 > 0) && (npc_hasitems(hero, itpl_health_herb_01) < health_herb_01)) { canCreate = false; };
	if((goblinbone > 0) && (npc_hasitems(hero, itat_goblinbone) < goblinbone))  { canCreate = false; };
	if((rockcrystal > 0) && (npc_hasitems(hero, itmi_rockcrystal) < rockcrystal)) { canCreate = false; };
	if((holywater > 0) && (npc_hasitems(hero, itmi_holywater) < holywater)) { canCreate = false; };
	if((waranfiretongue > 0) && (npc_hasitems(hero, itat_waranfiretongue) < waranfiretongue)) { canCreate = false; };
	if((nugget > 0) && (npc_hasitems(hero, itmi_nugget) < nugget)) { canCreate = false; };
	if((gold > 0) && (npc_hasitems(hero, itmi_gold) < gold)) { canCreate = false; };
	if((quartz > 0) && (npc_hasitems(hero, itmi_quartz) < quartz)) { canCreate = false; };
	if((sulfur > 0) && (npc_hasitems(hero, itmi_sulfur) < sulfur)) { canCreate = false; };
	if((wing > 0) && (npc_hasitems(hero, itat_wing) < wing)) { canCreate = false; };
	if((pitch > 0) && (npc_hasitems(hero, itmi_pitch) < pitch)) { canCreate = false; };
	if((drgsnapperhorn > 0) && (npc_hasitems(hero, itat_drgsnapperhorn) < drgsnapperhorn)) { canCreate = false; };
	if((paper > 0) && (npc_hasitems(hero, itwr_magicpaper) < paper)) { canCreate = false; };
	if((runestone > 0) && (npc_hasitems(hero, itmi_highruneblank) < runestone)) { canCreate = false; };

	if(canCreate == true)
	{
		if(shadowbeastfur > 0) { npc_removeinvitems(hero, itat_shadowfur, shadowbeastfur); };
		if(wargfur > 0) { npc_removeinvitems(hero, itat_wargfur, wargfur); };
		if(coal > 0) { npc_removeinvitems(hero, itmi_coal, coal); };
		if(demonheart > 0) { npc_removeinvitems(hero, itat_demonheart, demonheart); };
		if(pearl > 0) { npc_removeinvitems(hero, itmi_addon_whitepearl, pearl); };
		if(zombiecorpse > 0) { npc_removeinvitems(hero, itmi_zombiecorpse, zombiecorpse); };
		if(aquamarine > 0) { npc_removeinvitems(hero, itmi_aquamarine, aquamarine); };
		if(wolffur > 0) { npc_removeinvitems(hero, itat_wolffur, wolffur); };
		if(plazma > 0) { npc_removeinvitems(hero, itmi_plazma, plazma); };
		if(skeletonbone > 0) { npc_removeinvitems(hero, itat_skeletonbone, skeletonbone); };
		if(darkpearl > 0) { npc_removeinvitems(hero, itmi_darkpearl, darkpearl); };
		if(swampgolemheart > 0) { npc_removeinvitems(hero, itat_swampgolemheart, swampgolemheart); };
		if(icegolemheart > 0) { npc_removeinvitems(hero, itat_icegolemheart, icegolemheart); };
		if(firegolemheart > 0) { npc_removeinvitems(hero, itat_firegolemheart, firegolemheart); };
		if(stonegolemheart > 0) { npc_removeinvitems(hero, itat_stonegolemheart, stonegolemheart); };
		if(swampherb > 0) { npc_removeinvitems(hero, itpl_swampherb, swampherb); };
		if(lockpick > 0) { npc_removeinvitems(hero, itke_lockpick, lockpick); };
		if(health_herb_02 > 0) { npc_removeinvitems(hero, itpl_health_herb_02, health_herb_02); };
		if(health_herb_01 > 0) { npc_removeinvitems(hero, itpl_health_herb_01, health_herb_01); };
		if(goblinbone > 0) { npc_removeinvitems(hero, itat_goblinbone, goblinbone); };
		if(rockcrystal > 0) { npc_removeinvitems(hero, itmi_rockcrystal, rockcrystal); };
		if(holywater > 0) { npc_removeinvitems(hero, itmi_holywater, holywater); };
		if(waranfiretongue > 0) { npc_removeinvitems(hero, itat_waranfiretongue, waranfiretongue); };
		if(nugget > 0) { npc_removeinvitems(hero, itmi_nugget, nugget); };
		if(gold > 0) { npc_removeinvitems(hero, itmi_gold, gold); };
		if(quartz > 0) { npc_removeinvitems(hero, itmi_quartz, quartz); };
		if(sulfur > 0) { npc_removeinvitems(hero, itmi_sulfur, sulfur); };
		if(wing > 0) { npc_removeinvitems(hero, itat_wing, wing); };
		if(pitch > 0) { npc_removeinvitems(hero, itmi_pitch, pitch); };
		if(drgsnapperhorn > 0) { npc_removeinvitems(hero, itat_drgsnapperhorn, drgsnapperhorn); };		
		if(paper > 0) { npc_removeinvitems(hero, itwr_magicpaper, paper); };
		if(runestone > 0) { npc_removeinvitems(hero, itmi_highruneblank, runestone); };		
		
		return true;
	};
	
	ai_printred(StExt_Str_Scrollmaking_RequirePaper);		
	str = "";
	if(shadowbeastfur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_shadowfur, shadowbeastfur)); };
	if(wargfur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_wargfur, wargfur)); };
	if(coal > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_coal, coal)); };
	if(demonheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_demonheart, demonheart)); };
	if(pearl > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_addon_whitepearl, pearl)); };
	if(zombiecorpse > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_zombiecorpse, zombiecorpse)); };
	if(aquamarine > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_aquamarine, aquamarine)); };
	if(wolffur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_wolffur, wolffur)); };
	if(plazma > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_plazma, plazma)); };
	if(skeletonbone > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_skeletonbone, skeletonbone)); };
	if(darkpearl > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_darkpearl, darkpearl)); };
	if(swampgolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_swampgolemheart, swampgolemheart)); };
	if(icegolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_icegolemheart, icegolemheart)); };
	if(firegolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_firegolemheart, firegolemheart)); };
	if(stonegolemheart > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_stonegolemheart, stonegolemheart)); };
	if(swampherb > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itpl_swampherb, swampherb)); };
	if(lockpick > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itke_lockpick, lockpick)); };
	if(health_herb_02 > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itpl_health_herb_02, health_herb_02)); };
	if(health_herb_01 > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itpl_health_herb_01, health_herb_01)); };
	if(goblinbone > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_goblinbone, goblinbone)); };
	if(rockcrystal > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_rockcrystal, rockcrystal)); };
	if(holywater > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_holywater, holywater)); };
	if(waranfiretongue > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_waranfiretongue, waranfiretongue)); };
	if(nugget > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_nugget, nugget)); };
	if(gold > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_gold, gold)); };
	if(quartz > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_quartz, quartz)); };
	if(sulfur > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_sulfur, sulfur)); };
	if(wing > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_wing, wing)); };
	if(pitch > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_pitch, pitch)); };
	if(drgsnapperhorn > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itat_drgsnapperhorn, drgsnapperhorn)); };
	if(paper > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itwr_magicpaper, paper)); };
	if(runestone > 0) { str = concatstrings(str, StExt_ConcatScrollmakingResources(itmi_highruneblank, runestone)); };
	ai_printred(str);
	return false;
};

instance Dia_StExt_Scrollmaking_Rune_Dialog(c_info) {
    npc = pc_hero;
    condition = Dia_StExt_Scrollmaking_Rune_Dialog_condition;
    information = Dia_StExt_Scrollmaking_Rune_Dialog_info;
    important = false;
    permanent = true;
    nr = 750;
    description = StExt_Str_ScrollmakingRune;
};
func int Dia_StExt_Scrollmaking_Rune_Dialog_condition() {
    if(StExt_DisplayScrollmakingMenu == true) {
        return true;
    };
};
func void Dia_StExt_Scrollmaking_Rune_Dialog_info() 
{
	var int circle; circle = npc_gettalentskill(hero, npc_talent_mage);
    info_clearchoices(Dia_StExt_Scrollmaking_Rune_Dialog);
    info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, dialog_back, StExt_Scrollmaking_Rune_back);
	
	if((atr_intellect >= 75) && (circle >= 1) && ((StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 2) || (StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 1))) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_sumdeathhound, dia_taliasan_sumdeathhound);
	};
	if((atr_intellect >= 150) && (circle >= 3) && ((StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 3) || (StExt_Talent_Level[StExt_MasteryIndex_Golem] >= 3))) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_sumdarkgol, dia_taliasan_sumdarkgol);
	};
	if((atr_intellect >= 400) && (circle >= 4) && (StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_sumskelmage, dia_taliasan_sumskelmage);
	};
	if((atr_intellect >= 150) && (circle >= 2) && (StExt_Talent_Level[StExt_MasteryIndex_Demon] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_DkPet, dia_stext_darkpetsummon);
	};
	if((atr_intellect >= 150) && (circle >= 2) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Crait, dia_stext_shadowmount);
	};
	if((atr_intellect >= 150) && (circle >= 2) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_DrSnapper, dia_stext_sumdrsnapper);
	};	
	if((atr_intellect >= 75) && (circle >= 1) && (StExt_Talent_Level[StExt_MasteryIndex_Fire] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_rapidfirebolt, dia_taliasan_rapidfirebolt);
	};
	if((atr_intellect >= 75) && (circle >= 1) && (StExt_Talent_Level[StExt_MasteryIndex_Ice] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_rapidicebolt, dia_taliasan_rapidicebolt);
	};
	if((atr_intellect >= 100) && (circle >= 2) && (StExt_Talent_Level[StExt_MasteryIndex_Air] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_elevate, dia_taliasan_elevate);
	};	
	if((atr_intellect >= 100) && (circle >= 1) && (StExt_Talent_Level[StExt_MasteryIndex_Light] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_hollywisp, dia_taliasan_hollywisp);
	};
	if((atr_intellect >= 200) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Air] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_airgolem, dia_taliasan_airgolem);
	};
	if((atr_intellect >= 200) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_SummonShadowbeast, dia_taliasan_summon_shadowbeast);
	};
	if((atr_intellect >= 100) && (circle >= 2) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 1)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_SummonCrawler, dia_taliasan_summon_crawler);
	};
	if((atr_intellect >= 100) && (circle >= 2) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 1)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_SummonOster, dia_taliasan_summon_oster);
	};
	if((atr_intellect >= 400) && (circle >= 4) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Summon_Troll, dia_taliasan_summon_shadowbeast);
	};	
	if((atr_intellect >= 400) && (circle >= 5) && (StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 4)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_SummonGhost, dia_taliasan_summon_ghost);
	};
	if((atr_intellect >= 300) && (circle >= 4) && (StExt_Talent_Level[StExt_MasteryIndex_Necro] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_SummonBoneGolem, dia_taliasan_summon_bonegolem);
	};
	if((atr_intellect >= 300) && (circle >= 4) && (StExt_Talent_Level[StExt_MasteryIndex_Shaman] >= 3)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_SummonShadowbeast_Fire, dia_taliasan_summon_shadowbeast_fire);
	};	
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Earth] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_EarthCape, dia_taliasan_earthcape);
	};
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_DarkCape, dia_taliasan_darkcape);
	};	
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Life] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_PoisionCape, dia_taliasan_poisioncape);
	};	
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Fire] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_FireCape, dia_taliasan_firecape);
	};
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Ice] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_IceCape, dia_taliasan_icecape);
	};
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Air] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_AirCape, dia_taliasan_aircape);
	};
	if((atr_intellect >= 150) && (circle >= 3) && ((StExt_Talent_Level[StExt_MasteryIndex_Electric] >= 3) || (StExt_Talent_Level[StExt_MasteryIndex_Golem] >= 3))) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Summon_Electricgolem, dia_taliasan_summon_electricgolem);
	};
	if((atr_intellect >= 250) && (circle >= 3) && (StExt_Talent_Level[StExt_MasteryIndex_Electric] >= 2)) {
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_LightingCape, dia_taliasan_lightingcape);
	};

	if((circle >= 1) && (StExt_Talent_Level[StExt_MasteryIndex_Light] >= 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Protection, dia_taliasan_buff_protection); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Hp, dia_taliasan_buff_hp); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Stats, dia_taliasan_buff_stats); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Regen, dia_taliasan_buff_regen); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Damage, dia_taliasan_buff_damage); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Speed, dia_taliasan_buff_speed); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Dodge, dia_taliasan_buff_dodge); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_Es, dia_taliasan_buff_es); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Buff_MassRestore, dia_taliasan_buff_massrestore); 
	};

	if((circle >= 1) && (StExt_Talent_Level[StExt_MasteryIndex_Dark] >= 1))
	{
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_Protection, dia_taliasan_debuff_protection); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_Stats, dia_taliasan_debuff_stats); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_Siphon, dia_taliasan_debuff_siphon); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_Speed, dia_taliasan_debuff_speed); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_Lifetap, dia_taliasan_debuff_lifetap); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_ReflectDamage, dia_taliasan_debuff_reflectdamage); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_ExtraDamage, dia_taliasan_debuff_extradamage); 
		info_addchoice(Dia_StExt_Scrollmaking_Rune_Dialog, StExt_Str_TalisanRunen_Debuff_Weaken, dia_taliasan_debuff_weaken); 
	};
};

func void StExt_Scrollmaking_Rune_back() { info_clearchoices(Dia_StExt_Scrollmaking_Rune_Dialog); };

func void dia_taliasan_createrune_generic(var int splId, var int runeId) 
{
	var c_item weap;
    if(StExt_CreateRune_CheckResources(splId, 1))
	{
		b_giveplayerxp(50);
		weap = npc_getreadiedweapon(hero);
		StExt_ProcessDamageExp(hero, hero, weap, 1000, 0, StExt_GetSpellDamageFlags(splId));
		createinvitems(hero, runeId, 1);
        info_clearchoices(Dia_StExt_Scrollmaking_Rune_Dialog);
    }
    else 
	{
        ai_print(StExt_Str_Scrolmaking_No);
        info_clearchoices(Dia_StExt_Scrollmaking_Rune_Dialog);
    };
};

func void dia_taliasan_icecape() { dia_taliasan_createrune_generic(spl_icecape, itru_stext_icecape); };
func void dia_taliasan_lightingcape() { dia_taliasan_createrune_generic(spl_lightingcape, itru_stext_lightingcape); };
func void dia_taliasan_darkcape() { dia_taliasan_createrune_generic(spl_darkcape, itru_stext_darkcape); };
func void dia_taliasan_aircape() { dia_taliasan_createrune_generic(spl_aircape, itru_stext_aircape); };
func void dia_taliasan_earthcape() { dia_taliasan_createrune_generic(spl_earthcape, itru_stext_earthcape); };
func void dia_taliasan_poisioncape() { dia_taliasan_createrune_generic(spl_poisioncape, itru_stext_poisioncape); };
func void dia_taliasan_firecape() { dia_taliasan_createrune_generic(spl_firecape, itru_stext_firecape); };
func void dia_taliasan_summon_electricgolem() { dia_taliasan_createrune_generic(spl_summon_electricgolem, itru_stext_summon_electricgolem); };

func void dia_taliasan_buff_protection() { dia_taliasan_createrune_generic(spl_buff_protection, itru_buff_protection); };
func void dia_taliasan_buff_hp() { dia_taliasan_createrune_generic(spl_buff_hp, itru_buff_hp); };
func void dia_taliasan_buff_stats() { dia_taliasan_createrune_generic(spl_buff_stats, itru_buff_stats); };
func void dia_taliasan_buff_regen() { dia_taliasan_createrune_generic(spl_buff_regen, itru_buff_regen); };
func void dia_taliasan_buff_damage() { dia_taliasan_createrune_generic(spl_buff_damage, itru_buff_damage); };
func void dia_taliasan_buff_speed() { dia_taliasan_createrune_generic(spl_buff_speed, itru_buff_speed); };
func void dia_taliasan_buff_dodge() { dia_taliasan_createrune_generic(spl_buff_dodge, itru_buff_dodge); };
func void dia_taliasan_buff_es() { dia_taliasan_createrune_generic(spl_buff_es, itru_buff_es); };
func void dia_taliasan_buff_massrestore() { dia_taliasan_createrune_generic(spl_buff_massrestore, itru_buff_massrestore); };

func void dia_taliasan_debuff_protection() { dia_taliasan_createrune_generic(spl_debuff_protection, itru_debuff_protection); };
func void dia_taliasan_debuff_stats() { dia_taliasan_createrune_generic(spl_debuff_stats, itru_debuff_stats); };
func void dia_taliasan_debuff_siphon() { dia_taliasan_createrune_generic(spl_debuff_siphon, itru_debuff_siphon); };
func void dia_taliasan_debuff_speed() { dia_taliasan_createrune_generic(spl_debuff_speed, itru_debuff_speed); };
func void dia_taliasan_debuff_lifetap() { dia_taliasan_createrune_generic(spl_debuff_lifetap, itru_debuff_lifetap); };
func void dia_taliasan_debuff_reflectdamage() { dia_taliasan_createrune_generic(spl_debuff_reflectdamage, itru_debuff_reflectdamage); };
func void dia_taliasan_debuff_extradamage() { dia_taliasan_createrune_generic(spl_debuff_extradamage, itru_debuff_extradamage); };
func void dia_taliasan_debuff_weaken() { dia_taliasan_createrune_generic(spl_debuff_weaken, itru_debuff_weaken); };

func void dia_taliasan_summon_ghost() { dia_taliasan_createrune_generic(spl_summon_ghost, itru_summon_ghost); };
func void dia_taliasan_summon_bonegolem() { dia_taliasan_createrune_generic(spl_summon_bonegolem, itru_summon_bonegolem); };
func void dia_taliasan_summon_shadowbeast() { dia_taliasan_createrune_generic(spl_summon_shadowbeast, itru_summon_shadowbeast); };
func void dia_taliasan_summon_shadowbeast_fire() { dia_taliasan_createrune_generic(spl_summon_shadowbeast_fire, itru_summon_shadowbeast_fire); };
func void dia_taliasan_summon_crawler() { dia_taliasan_createrune_generic(spl_summon_crawler, itru_summon_crawler); };
func void dia_taliasan_summon_troll() { dia_taliasan_createrune_generic(spl_summon_troll, itru_summon_troll); };
func void dia_taliasan_summon_oster() { dia_taliasan_createrune_generic(spl_summon_oster, itru_summon_oster); };
func void dia_taliasan_airgolem() { dia_taliasan_createrune_generic(spl_summon_airgolem, itru_summonairgolem); };
func void dia_taliasan_hollywisp() { dia_taliasan_createrune_generic(spl_summon_hollywisp, itru_sumhollywisp); };
func void dia_stext_sumdrsnapper() { dia_taliasan_createrune_generic(spl_sumdsnapper, itru_sumdsnapper); };
func void dia_stext_shadowmount() { dia_taliasan_createrune_generic(spl_summoncrait, itru_shadowmount); };
func void dia_stext_darkpetsummon()  { dia_taliasan_createrune_generic(spl_darkpetsummon, itru_darkpetsummon); };
func void dia_taliasan_sumdarkgol() { dia_taliasan_createrune_generic(spl_summondarkgolem, itru_sumdarkgol); };
func void dia_taliasan_sumdeathhound() { dia_taliasan_createrune_generic(spl_summondeathhound, itru_sumdeathhound); };
func void dia_taliasan_sumskelmage() { dia_taliasan_createrune_generic(spl_summon_skeleton_mage, itru_sumskelmage); };
func void dia_taliasan_rapidfirebolt() { dia_taliasan_createrune_generic(spl_rapidfirebolt, itru_rapidfirebolt); };
func void dia_taliasan_rapidicebolt() { dia_taliasan_createrune_generic(spl_rapidicebolt, itru_rapidicebolt); };
func void dia_taliasan_elevate() { dia_taliasan_createrune_generic(spl_elevate, itru_elevate); };
