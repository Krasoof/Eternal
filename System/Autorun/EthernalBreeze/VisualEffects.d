META
{
  Parser = VFX;
};

// DarkGolem Spell visuals
instance spellfx_summondarkgolem(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summondarkgolem_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summondarkgolem_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summondarkgolem_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summondarkgolem_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Death Hound
instance spellfx_summondeathhound(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summondeathhound_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summondeathhound_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summondeathhound_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
};

instance spellfx_summondeathhound_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};


//MagicBolt
instance spellfx_stextmagicbolt(cfx_base_proto) 
{
    visname_s = "MFX_STEXTMAGICBOLT_INIT";
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    emtrjloopmode_s = "NONE";
    emtrjeasefunc_s = "LINEAR";
    emactioncollstat_s = "COLLIDE CREATE";
    emactioncolldyn_s = "COLLIDE CREATEONCE";
    emfxcollstat_s =  "SPELLFX_STEXTMAGICBOLT_COLLIDEFX";
    emfxcolldyn_s = "SPELLFX_STEXTMAGICBOLT_COLLIDEFX";
    emtrjtargetrange = 20.0;
    emtrjtargetelev = 0.0;
    emfxcreatedowntrj = 0;
};

instance spellfx_stextmagicbolt_key_open(c_particlefxemitkey) {
    lightrange = 0.001;
};

instance spellfx_stextmagicbolt_key_init(c_particlefxemitkey) {
    lightrange = 0.001;
};

instance spellfx_stextmagicbolt_key_cast(c_particlefxemitkey) {
    visname_s = "MFX_STEXTMAGICBOLT_CAST";
    emtrjmode_s = "TARGET";
    emtrjeasevel = 1800.0;
    lightrange = 100.0;
    emcheckcollision = 1;
    sfxid = "MFX_Thunderbolt_Cast";
};

instance spellfx_stextmagicbolt_key_collide(c_particlefxemitkey) {
    visname_s = "";
    emtrjeasevel = 1.0E-6;
};

instance spellfx_stextmagicbolt_collidefx(cfx_base_proto) {
    visname_s = "MFX_STEXTMAGICBOLT_COLLIDE";
    visalpha = 1.0;
    emtrjmode_s = "FOLLOW TARGET";
    sfxid = "MFX_Thunderball_Collide1";
};

// SkelMage Spell visuals
instance spellfx_summon_skeleton_mage(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};
instance spellfx_summon_skeleton_mage_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};
instance spellfx_summon_skeleton_mage_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};
instance spellfx_summon_skeleton_mage_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};
instance spellfx_summon_skeleton_mage_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};








// Summon Holly Wisp
instance spellfx_summon_hollywisp(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_hollywisp_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_hollywisp_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_hollywisp_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_hollywisp_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Air Golem
instance spellfx_summon_airgolem(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_airgolem_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_airgolem_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_airgolem_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_airgolem_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Ghost
instance spellfx_summon_ghost(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_ghost_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_ghost_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_ghost_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_ghost_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Bone Golem
instance spellfx_summon_bonegolem(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_bonegolem_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_bonegolem_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_bonegolem_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_bonegolem_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Shadow Beast
instance spellfx_summon_shadowbeast(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_shadowbeast_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_shadowbeast_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_shadowbeast_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_shadowbeast_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Shadow Beast Fire
instance spellfx_summon_shadowbeast_fire(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_shadowbeast_fire_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_shadowbeast_fire_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_shadowbeast_fire_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_shadowbeast_fire_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Troll
instance spellfx_summon_troll(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_troll_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_troll_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_troll_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_troll_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Crawler
instance spellfx_summon_crawler(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_crawler_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_crawler_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_crawler_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_crawler_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon Oster
instance spellfx_summon_oster(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_oster_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_oster_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_oster_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_oster_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

// Summon electricgolem
instance spellfx_summon_electricgolem(cfx_base_proto) {
    visname_s = "MFX_ArmyOfDarkness_INIT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
    emtrjoriginnode = "ZS_RIGHTHAND";
    lightpresetname = "AURA";
};

instance spellfx_summon_electricgolem_key_open(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_electricgolem_key_init(c_particlefxemitkey) {
    lightrange = 0.01;
};

instance spellfx_summon_electricgolem_key_invest_1(c_particlefxemitkey) {
    lightrange = 200.0;
    emcreatefxid = "FX_EarthQuake";
};

instance spellfx_summon_electricgolem_key_cast(c_particlefxemitkey) {
    emcreatefxid = "spellFX_SummonCreature_ORIGIN";
    pfx_ppsisloopingchg = 1;
};

instance spellfx_weakglimmer_stextcyan(cfx_base_proto) 
{
    visname_s = "WEAK_GLIMMER_STEXTCYAN";
    visalpha = 1.0;
    visalphablendfunc_s = "ADD";
    emtrjmode_s = "FIXED";
    emtrjloopmode_s = "NONE";
    emtrjeasefunc_s = "LINEAR";
    emtrjdynupdatedelay = 2000000.0;
    emfxlifespan = -1.0;
    emselfrotvel_s = "0 0 0";
    secsperdamage = -1.0;
    emadjustshptoorigin = 1;
};

instance spellfx_weakglimmer_stextviolet(cfx_base_proto) 
{
    visname_s = "WEAK_GLIMMER_STEXTVIOLET";
    visalpha = 1.0;
    visalphablendfunc_s = "ADD";
    emtrjmode_s = "FIXED";
    emtrjloopmode_s = "NONE";
    emtrjeasefunc_s = "LINEAR";
    emtrjdynupdatedelay = 2000000.0;
    emfxlifespan = -1.0;
    emselfrotvel_s = "0 0 0";
    secsperdamage = -1.0;
    emadjustshptoorigin = 1;
};

instance spellfx_weakglimmer_stextorange(cfx_base_proto) 
{
    visname_s = "WEAK_GLIMMER_STEXTORANGE";
    visalpha = 1.0;
    visalphablendfunc_s = "ADD";
    emtrjmode_s = "FIXED";
    emtrjloopmode_s = "NONE";
    emtrjeasefunc_s = "LINEAR";
    emtrjdynupdatedelay = 2000000.0;
    emfxlifespan = -1.0;
    emselfrotvel_s = "0 0 0";
    secsperdamage = -1.0;
    emadjustshptoorigin = 1;
};

instance spellfx_weakglimmer_stextgreen(cfx_base_proto) 
{
    visname_s = "WEAK_GLIMMER_STEXTGREEN";
    visalpha = 1.0;
    visalphablendfunc_s = "ADD";
    emtrjmode_s = "FIXED";
    emtrjloopmode_s = "NONE";
    emtrjeasefunc_s = "LINEAR";
    emtrjdynupdatedelay = 2000000.0;
    emfxlifespan = -1.0;
    emselfrotvel_s = "0 0 0";
    secsperdamage = -1.0;
    emadjustshptoorigin = 1;
};

instance spellfx_stext_wglow_fire(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_FIRE";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_ice(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_ICE";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_electric(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_ELECTRIC";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_air(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_AIR";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_earth(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_EARTH";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_light(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_LIGHT";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_dark(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_DARK";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

instance spellfx_stext_wglow_death(cfx_base_proto)
{
    visname_s = "MFX_STEXT_WGLOW_DEATH";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};

// Legendary armor aura (no light preset - lights were the dot-trail culprit)
instance spellfx_stext_legendarmor(cfx_base_proto)
{
    visname_s = "MFX_STEXT_LEGENDARMOR";
    visalpha = 1.0;
    emtrjmode_s = "FIXED";
};
