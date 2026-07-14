const int StExt_ModVersion = 308;

// Chance (%) that a generated magic weapon rolls a random elemental perk (read by the DLL).
const int StExt_WeaponElementRollChance = 20;

// Item extension property slots (DLL ItemProperty enum) used by scripts.
// Perk element (rolled at generation): SpellId + SpellPower.
// Seal gem (player-applied, procs a spell every X hits): SpellCost + SpellCharges.
const int StExt_ItemProp_PerkSpellId = 12;
const int StExt_ItemProp_SealSpellId = 14;
const int StExt_ItemProp_SealPower = 15;
const int StExt_ItemProp_PerkPower = 16;

// Physical seal sentinel ids (stored in SealSpellId; >= 9000 = not a spell).
const int StExt_PhysSeal_Bleed = 9001;
const int StExt_PhysSeal_Pierce = 9002;

// Seal leveling (free item property slots): each successful proc grants xp;
// level-ups grow SealPower with accelerating steps (dark-souls-like growth).
const int StExt_ItemProp_SealLevel = 26;
const int StExt_ItemProp_SealXp = 27;
const int StExt_SealLevelMax = 60;	// seals level across the whole game (early/mid/late), not maxed in chapter 1
const int StExt_Config_DebugAlwaysEnabled = false;
const int StExt_Config_CheatsEnabled = false;
const int StExt_Config_TestKeysEnabled = false;

const int StExt_Config_NpcStatsUi_TopOffset = 0;
const int StExt_Config_NpcStatsUi_HideTags = false;
const int StExt_Config_DisableThiefLuck = false;
const int StExt_Config_DisableElementalExpFromDamage = false;
const int StExt_Config_EnableOldDamageOutput = false;
const int StExt_Config_EnableEnemiesArmorLoot = false;
const int StExt_Config_ExtraSncStatsAlwaysEnabled = true;
const int StExt_Config_WorldRandomizer_UseNewWpSearch = true;
const int StExt_Config_StreamSpellDamageMult = 10;
const float StExt_Config_Ui_EmbdedPanelsScale = 1.0;
const float StExt_Config_Ui_Mouse_MoveSensitivity = 10.0;
const float StExt_Config_Ui_Mouse_ScrollSensitivity = 5.0;

const int StExt_Config_FemaleVoice_Enable = true;
const int StExt_Config_FemaleVoice_Rate = 1;
const int StExt_Config_FemaleVoice_Volume = 200;
const int StExt_Config_FemaleVoice_Language = 1;
const int StExt_Config_FemaleVoice_CodePage = 1;
const string StExt_Config_FemaleVoice_LanguageId = "";

const int StExt_Config_UseOldSkillLearnSystem = false;

const int StExt_CounterLimit = 999999;
const int StExt_Null = (-1);
const int StExt_SizeOf_Int = 4;
var C_Npc StExt_NullNpc;
var C_Item StExt_NullItem;

const int StExt_Byte_Max = 255;
const int StExt_Int_Max = 2147483647;
const int StExt_Int_Max_Safe = StExt_Int_Max - 1;


// *** Strings
const string StExt_EmptyString = "";
const string StExt_UnknownString = "-= ??? =-";
const string StExt_ImpossibleForMe = "$IMPOSSIBLEFORME";
const string StExt_LvlUpSound = "LevelUP";
const string StExt_PcStatsArrayName = "StExt_PcStats";
const string StExt_PcStats_AurasArrayName = "StExt_PcStats_Auras";
const string StExt_WorldRandimizer_WaypointsArrayName = "StExt_WorldRandimizer_Waypoint";


// *** Colors ***
const string StExt_Color_Header = "#D9D026";
const string StExt_Color_Common = "#FDFDFD";
const string StExt_Color_Common_Faded = "#B4B4B4";
const string StExt_Color_Damage_Summon = "#6478A0";
const string StExt_Color_Damage_Dot = "#B4B450";
const string StExt_Color_Damage_Reflect = "#804080";
const string StExt_Color_Corruption = "#DB1BE1";
const string StExt_Color_Green = "#00F000";
const string StExt_Color_Red = "#F00000";
const string StExt_Color_Blue = "#0000F0";
const string StExt_Color_Gold = "#FF7F50";
const string StExt_Color_Orange = "#FF8000";

// 		*** Ui ***
const int StExt_UiIndex_None = 0;
const int StExt_UiIndex_EsBar = 1;
const int StExt_UiIndex_Alchemy = 2;
const int StExt_UiIndex_Artifact = 3;
const int StExt_UiIndex_Aura = 4;
const int StExt_UiIndex_ItemMenu = 5;
const int StExt_UiIndex_MsgTray = 6;
const int StExt_UiIndex_Max = 7;

const int StExt_Key_None = 0;
const int StExt_Key_Right = 1;
const int StExt_Key_Left = 2;
const int StExt_Key_Up = 3;
const int StExt_Key_Down = 4;


const string StExt_UiPlaceHolders[StExt_UiIndex_Max] = 
{
	"[ ??? ]",
	"[ ES BAR ]",
	"[ ALCHEMY ]",
	"[ ARTIFACT ]",
	"[ AURA ]",
	"[ ITEMS INFO ]",
	"[ MESSAGE TRAY BOTTOM ]"
};
const string StExt_DefaultFont = "FONT_OLD_10_WHITE.tga";

const int StExt_DamageMessageType_Default = 0;
const int StExt_DamageMessageType_Dot = 2;
const int StExt_DamageMessageType_Reflect = 4;

// *** Configs preset index ***
const int StExt_ConfigIndex_None = 0;
const int StExt_ConfigIndex_Normal = 1;
const int StExt_ConfigIndex_Nightmare = 2;
const int StExt_ConfigIndex_Hell = 3;
const int StExt_ConfigIndex_User = 4;
const int StExt_ConfigIndex_Export = 5;

// *** Damage extension ***
const int StExt_DamageType_Unknown = 0;
const int StExt_DamageType_Melee = 1;
const int StExt_DamageType_Range = 2;
const int StExt_DamageType_Spell = 4;
const int StExt_DamageType_Ability = 8;
const int StExt_DamageType_Fire = 16;
const int StExt_DamageType_Ice = 32;
const int StExt_DamageType_Electric = 64;
const int StExt_DamageType_Air = 128;
const int StExt_DamageType_Earth = 256;
const int StExt_DamageType_Light = 512;
const int StExt_DamageType_Dark = 1024;
const int StExt_DamageType_Death = 2048;
const int StExt_DamageType_Life = 4096;
const int StExt_DamageType_Poision = 8192;
const int StExt_DamageType_True = 16384;
const int StExt_DamageType_Blood = 32768;
const int StExt_DamageType_Necro = 65536;
const int StExt_DamageType_Golem = 131072;
const int StExt_DamageType_Demon = 262144;
const int StExt_DamageType_Fist = 524288;
const int StExt_DamageType_Trap = 1048576;

const int StExt_DamageFlag_None = 0;
const int StExt_DamageFlag_Aura = 1;
const int StExt_DamageFlag_Dot = 2;
const int StExt_DamageFlag_Aoe = 4;
const int StExt_DamageFlag_Heal = 8;
const int StExt_DamageFlag_Summon = 16;
const int StExt_DamageFlag_Support = 32;
const int StExt_DamageFlag_Unlock = 64;
const int StExt_DamageFlag_Blink = 128;
const int StExt_DamageFlag_Buff = 256;
const int StExt_DamageFlag_Debuff = 512;
const int StExt_DamageFlag_Timed = 1024;
const int StExt_DamageFlag_Transform = 2048;
const int StExt_DamageFlag_Golem = 4096;
const int StExt_DamageFlag_Demon = 8192;
const int StExt_DamageFlag_Undead = 16384;
const int StExt_DamageFlag_Reflect = 32768;
const int StExt_DamageFlag_Human = 65536;
const int StExt_DamageFlag_Potion = 131072;
const int StExt_DamageFlag_Orc = 262144;
const int StExt_DamageFlag_Animal = 524288;
const int StExt_DamageFlag_Target = 1048576;
const int StExt_DamageFlag_Totem = 2097152;
const int StExt_DamageFlag_Single = 4194304;
const int StExt_DamageFlag_Freeze = 8388608;
const int StExt_DamageFlag_Stun = 16777216;
const int StExt_DamageFlag_Roots = 33554432;
const int StExt_DamageFlag_Chain = 67108864;
const int StExt_DamageFlag_Stream = 134217728;
const int StExt_DamageFlag_OnDeath = 268435456;

const int StExt_DamageBlockReason_None = 0;
const int StExt_DamageBlockReason_Dodge = 1;
const int StExt_DamageBlockReason_Ignored = 2;
const int StExt_DamageBlockReason_ArrowDeclined = 4;
const int StExt_DamageBlockReason_SpellAbsorbed = 8;
const int StExt_DamageBlockReason_SpellReflected = 16;
const int StExt_DamageBlockReason_FriendlyFier = 32;

const int StExt_NpcRelation_Unknown = -1;
const int StExt_NpcRelation_Enemy = 0;
const int StExt_NpcRelation_Neutral = 1;
const int StExt_NpcRelation_Ally = 2;

const int StExt_MinDamage = 1;
const int StExt_MaxDotTime = 15;
const int StExt_MaxProt = 999999;
const int StExt_MaxAtr = 999999;
const int StExt_MaxAdanosKarmaDiff = 95;


const int StExt_IncomingDamageFlag_Index_None = 0;
const int StExt_IncomingDamageFlag_Index_HasAttacker = 1;
const int StExt_IncomingDamageFlag_Index_HasWeapon = 2;
const int StExt_IncomingDamageFlag_Index_ExtraDamage = 4;
const int StExt_IncomingDamageFlag_Index_DontKill = 8;
const int StExt_IncomingDamageFlag_Index_DotDamage = 16;
const int StExt_IncomingDamageFlag_Index_ReflectDamage = 32;
const int StExt_IncomingDamageFlag_Index_AoeDamage = 64;
const int StExt_IncomingDamageFlag_Index_Contextual = 128;

// *** Masteries index ***
const int StExt_CorruptionPerk_Max = 20;
const int StExt_MasteryIndex_Max = 16;
const int StExt_MasteryPerk_Max = 16;
const int StExt_Perk_Max = 42;
const int StExt_ArtifactSkill_Max = 16;
const int StExt_Mastery_ExpPerLevel = 1000;

const int StExt_MasteryIndex_Fire = 0;				// Pyromancy. Responsible for all outcoming fire damage and protection. 
const int StExt_MasteryIndex_Ice = 1;				// Cryomancy. Responsible for all outcoming ice/water damage and protection.
const int StExt_MasteryIndex_Electric = 2;			// Electromancy. Responsible for all outcoming electric damage and protection.
const int StExt_MasteryIndex_Air = 3;				// Airomancy. Responsible for all outcoming air damage and protection.
const int StExt_MasteryIndex_Earth = 4;				// Earth. Responsible for all outcoming earth damage and protection.
const int StExt_MasteryIndex_Light = 5;				// Ligth magic. Responsible for all outcoming light/holly damage and evil protection.
const int StExt_MasteryIndex_Dark = 6;				// Dark magic. Responsible for all outcoming dark damage and debuffs.
const int StExt_MasteryIndex_Death = 7;				// Death magic. Responsible for all outcoming death damage and protection.
const int StExt_MasteryIndex_Life = 8;				// Life. Responsible for all outcoming life/poision damage and buff/heal power.
const int StExt_MasteryIndex_Golem = 9;				// Artifactory. Responsible for all golem summons and util spells.
const int StExt_MasteryIndex_Demon = 10;			// Demonology. Responsible for all demons summons.
const int StExt_MasteryIndex_Necro = 11;			// Necromancy. Responsible for all necro summons.
const int StExt_MasteryIndex_Shaman = 12;			// Shamanism. Responsible for all totems and etc.
const int StExt_MasteryIndex_MartialArts = 13;		// MartialArts. Responsible for all outcoming melee damage.
const int StExt_MasteryIndex_Agile = 14;			// Agile. Responsible for defence abilities (protection, dodge), life and stamina bonus, actions speed.
const int StExt_MasteryIndex_Archery = 15;			// Archery. Responsible for all outcoming range damage.
// Not implemented yet
const int StExt_MasteryIndex_Blood = 16;			// Blood
const int StExt_MasteryIndex_FistFight = 17;		// FistFight
const int StExt_MasteryIndex_Aura = 18;				// Auramancer
const int StExt_MasteryIndex_Traps = 19;			// Assasins traps
const int StExt_MasteryIndex_Poision = 20;			// Poision mastery

const string StExt_MasteryArrayIndex_Progress = "StExt_Talent_Progression";
const string StExt_MasteryArrayIndex_ExpNow = "StExt_Talent_ExpNow";
const string StExt_MasteryArrayIndex_ExpNext = "StExt_Talent_ExpNext";
const string StExt_MasteryArrayIndex_Level = "StExt_Talent_Level";
const string StExt_MasteryArrayIndex_PerkPoints = "StExt_Talent_PerkPoints";

const int StExt_Perk_Cost[StExt_Perk_Max] = 
{
	15000, 15000, 15000, 15000, 10000, 15000,
	15000, 10000, 10000, 10000, 5000, 10000,
	25000, 25000, 15000, 15000, 15000, 25000,
	7500, 15000, 15000, 20000, 20000, 20000,
	20000, 20000, 20000, 20000, 20000, 30000,
	25000, 25000, 25000, 100, 10000, 15000,
	15000, 15000, 20000, 20000, 10000, 15000
};

const int StExt_Corruption_Perk_Mage_Cost[StExt_CorruptionPerk_Max] = { 3, 3, 5, 10, 10, 10, 5, 5, 7, 7, 10, 5, 5, 10, 5, 10, 5, 5, 7, 10 };
const int StExt_Corruption_Perk_Warrior_Cost[StExt_CorruptionPerk_Max] = { 3, 3, 7, 3, 5, 10, 5, 5, 10, 10, 10, 7, 5, 3, 10, 7, 5, 5, 5, 10 };
const int StExt_Corruption_Perk_Ranger_Cost[StExt_CorruptionPerk_Max] = { 3, 10, 10, 5, 10, 5, 3, 10, 5, 5, 10, 5, 5, 10, 5, 5, 7, 7, 7, 10 };

// *** Talents levels ***
const int StExt_TalentLevel_None = 0;
const int StExt_TalentLevel_Apprentice = 1;
const int StExt_TalentLevel_Adept = 2;
const int StExt_TalentLevel_Expert = 3;
const int StExt_TalentLevel_Master = 4;
const int StExt_TalentLevel_Archmage = 5;
const int StExt_TalentLevel_Ultimate = 6;
const int StExt_TalentLevel_Max = 7;

// *** Summon type index ***
const int StExt_SummonType_Undead = 0;
const int StExt_SummonType_Demon = 1;
const int StExt_SummonType_Golem = 2;
const int StExt_SummonType_Beast = 3;
const int StExt_SummonType_Other = 4;
const int StExt_SummonType_Totem = 5;
const int StExt_SummonType_Holly = 6;

const int StExt_SummonGolemType_None = (-1);
const int StExt_SummonGolemType_Stone = 0;
const int StExt_SummonGolemType_Fire = 1;
const int StExt_SummonGolemType_Ice = 2;
const int StExt_SummonGolemType_Magic = 3;
const int StExt_SummonGolemType_Swamp = 4;
const int StExt_SummonGolemType_Wood = 5;
const int StExt_SummonGolemType_Air = 6;
const int StExt_SummonGolemType_Bone = 7;
const int StExt_SummonGolemType_Electric = 8;

const int StExt_SpecialSummonType_Max = 5;
const int StExt_SpecialSummonType_Zombie = 0;
const int StExt_SpecialSummonType_Golem = 1;
const int StExt_SpecialSummonType_Demon = 2;
const int StExt_SpecialSummonType_Wolf = 3;
const int StExt_SpecialSummonType_Shadow = 4;

// *** Stat reservation type index ***
const int StExt_StatReservationType_None = 0;
const int StExt_StatReservationType_Hp = 1;
const int StExt_StatReservationType_Mp = 2;
const int StExt_StatReservationType_St = 3;
const int StExt_StatReservationType_Es = 4;
const int StExt_StatReservationType_Max = 5;

// *** Spell constants ***
const int spl_cost_summondarkgolem = 150;
const int spl_cost_summon_skeleton_mage = 200;
const int spl_cost_summondeathhound = 50;	
const int spl_damage_stextmagicbolt = 30;
const int spl_cost_stextmagicbolt = 5;
const int spl_cost_summon_ghost = 250;
const int spl_cost_summon_bonegolem = 200;
const int spl_cost_summon_shadowbeast = 150;
const int spl_cost_summon_shadowbeast_fire = 150;
const int spl_cost_summon_troll = 200;
const int spl_cost_summon_crawler = 100;
const int spl_cost_summon_oster = 50;
const int spl_cost_summonelectricgolem = 150;
const int spl_cost_timedaoe = 250;

// Old max spell
// const int max_spell = 180->186->192->193;
const int StExt_OldMaxSpells = 193;
const int StExt_NewSpellsCount = 38;
const int StExt_OldMaxSpells_Offset = StExt_OldMaxSpells - 1;

const int max_spell = StExt_NewSpellsCount + StExt_OldMaxSpells;
const int StExt_AbilityPrefix = 1000;

const int spl_ressurect = 999;
const int spl_summondarkgolem = StExt_OldMaxSpells_Offset + 1;
const int spl_summondeathhound = StExt_OldMaxSpells_Offset + 2;
const int spl_stextmagicbolt = StExt_OldMaxSpells_Offset + 3;
const int spl_summon_skeleton_mage = StExt_OldMaxSpells_Offset + 4;
const int spl_summon_hollywisp = StExt_OldMaxSpells_Offset + 5;
const int spl_summon_airgolem = StExt_OldMaxSpells_Offset + 6;
const int spl_buff_protection = StExt_OldMaxSpells_Offset + 7;
const int spl_buff_hp = StExt_OldMaxSpells_Offset + 8;
const int spl_buff_stats = StExt_OldMaxSpells_Offset + 9;
const int spl_buff_regen = StExt_OldMaxSpells_Offset + 10;
const int spl_buff_damage = StExt_OldMaxSpells_Offset + 11;
const int spl_buff_speed = StExt_OldMaxSpells_Offset + 12;
const int spl_buff_dodge = StExt_OldMaxSpells_Offset + 13;
const int spl_buff_es = StExt_OldMaxSpells_Offset + 14;
const int spl_buff_massrestore = StExt_OldMaxSpells_Offset + 15;
const int spl_debuff_protection = StExt_OldMaxSpells_Offset + 16;
const int spl_debuff_stats = StExt_OldMaxSpells_Offset + 17;
const int spl_debuff_siphon = StExt_OldMaxSpells_Offset + 18;
const int spl_debuff_speed = StExt_OldMaxSpells_Offset + 19;
const int spl_debuff_lifetap = StExt_OldMaxSpells_Offset + 20;
const int spl_debuff_reflectdamage = StExt_OldMaxSpells_Offset + 21;
const int spl_debuff_extradamage = StExt_OldMaxSpells_Offset + 22;
const int spl_debuff_weaken = StExt_OldMaxSpells_Offset + 23;
const int spl_summon_ghost = StExt_OldMaxSpells_Offset + 24;
const int spl_summon_bonegolem = StExt_OldMaxSpells_Offset + 25;
const int spl_summon_shadowbeast = StExt_OldMaxSpells_Offset + 26;
const int spl_summon_shadowbeast_fire = StExt_OldMaxSpells_Offset + 27;
const int spl_summon_troll = StExt_OldMaxSpells_Offset + 28;
const int spl_summon_crawler = StExt_OldMaxSpells_Offset + 29;
const int spl_summon_oster = StExt_OldMaxSpells_Offset + 30;
const int spl_firecape = StExt_OldMaxSpells_Offset + 31;
const int spl_icecape = StExt_OldMaxSpells_Offset + 32;
const int spl_lightingcape = StExt_OldMaxSpells_Offset + 33;
const int spl_darkcape = StExt_OldMaxSpells_Offset + 34;
const int spl_aircape = StExt_OldMaxSpells_Offset + 35;
const int spl_earthcape = StExt_OldMaxSpells_Offset + 36;
const int spl_poisioncape = StExt_OldMaxSpells_Offset + 37;
const int spl_summon_electricgolem = StExt_OldMaxSpells_Offset + 38;

const int rx_maxdamrunbon = 9999;
const int rx_khubasoftcaplevel = 100;

const string spellfxinstancenames[max_spell] = 
{
    "PalLight", "PalHeal", "PalHolyBolt", "PalHeal", "PalRepelEvil", "PalHeal", "PalDestroyEvil", "Teleport", "GreenStrike", "Teleport", "Druidball", "Teleport", "Teleport", "Teleport", 
    "Teleport", "Teleport", "Teleport", "TplHeal", "Light", "Firebolt", "Icebolt", "Heal", "SummonGoblinSkeleton", "InstantFireball", "Zap", "SummonWolf", "WindFist", "Sleep", 
    "Heal", "LightningFlash", "ChargeFireball", "SummonSkeleton", "Fear", "Icecube", "ChargeZap", "SummonGolem", "DestroyUndead", "Pyrokinesis", "Firestorm", "Icewave", "SummonDemon", "Heal", 
    "Firerain", "BreathOfDeath", "MassDeath", "ArmyOfDarkness", "Shrink", "Transform", "Transform", "Transform", "Transform", "Transform", "Transform", "Transform", "Transform", "Transform", 
    "Transform", "Transform", "Transform", "Charm", "MasterOfDisaster", "Deathbolt", "Deathball", "Concussionbolt", "Teleport", "BeliarRune", "Teleport", "TPLMEDIUMHEAL", "TPLHEAVYHEAL", "TPLSUPERHEAL", 
    "Thunderstorm", "Whirlwind", "Waterfist", "IceLance", "Inflate", "Geyser", "Waterwall", "tpllightstrike", "TPLMEDIUMSTRIKE", "TplHeavyStrike", "SummonFireGolem", "Swarm", "Greententacle", "Telekinesis", 
    "SummonGuardian", "Energyball", "ManaForLife", "Skull", "SummonZombie", "SummonIceGolem", "SummonMud", "SummonEligor", "TplSuperStrike", "FireLight", "Control", "Berzerk", "SevereFetidity", "SummonCrait", 
    "SummonShoal", "UnlockChest", "SummonSwampGolem", "DestroyGuardians", "SummonTreant", "FireMeteor", "TplSuperStrike", "OrcFireball", "Transform", "RapidFirebolt", "RapidIcebolt", "Rage", "Quake", "MagicCage", 
    "Lacerate", "Extricate", "Explosion", "Elevate", "AdanosBall", "Acid", "LIGHTNINGSPHERE", "ELECTROWAVE", "FIREWAVE", "BLOODRAIN", "ICEEXPLOISION", "ICERAIN", "ABYSSSPELL", "MAGSPHERE", 
    "STONEFIRST", "GREENSTRIKE", "FIRELANCE", "DEATHSTRIKE", "NECROBOLT", "GURUMASS", "CrestOfElements", "BLINK", "SUMKHUB", "AGRO", "DOT_FIRST", "DARK_INVIS", "DARKCONTROL", "DARKSLEEP", 
    "MASSAGRO", "MASSDOT", "DOT_SECOND", "DARKBALL", "DARKSPEAR", "BIGDARKBALL", "DARKWAVE", "TORTURE", "SUMDSNAPPER", "DARKPETSUMMON", "DARKRUNE_STEAL", "DARKRUNE_DEFENSE", "DARKRUNE_ILLNESS", "DARKRUNE_HEALPET", 
    "DARKRUNE_ABSORB", "DARKRUNE_LORD", "DARKSTATSUP", "DARKRUNE_EDEFENSE", "DRUIDRUNEQUEST", "SUMMONSKELETON_ARCHER", "SUMMONSKELETON_SPEAR", "SUMJINA", "SUMMON_REALGOBLIN", "AURA_SUMMON", "SUMMON_SKELETON_UNIQ", "SUMMON_SKELETON_SHADOWBEAST", "HELPRUNE", "AURA_SUMMON_02", 
    "AURA_SUMMON_03", "AURA_SUMMON_04", "AURA_SUMMON_05", "SUMMON_HEAL", "VAMPIRE_TOUCH", "VAMPIRE_UNDEAD_TOUCH", "BLOOD_STREAM", "DARK_TENTACLES", "NIGHTVISION", "STEAL_BLOOD", "SUM_FAMILIAR", "SUM_MAGIC_CLOUD", "FIRE_STREAM", "FIRE_WALL", 
    "FIRE_HOLE", "FIRE_WEAPON", "FIRE_COLLAPSE", "FIRE_DASH", "FIREMAGE_STREAM", "WATERMAGE_STREAM", "WATERMAGE_ELECTRO_STREAM", "GURUMAGE_STREAM", "NECROMAGE_STREAM", "DARKMAGE_STREAM", "HOLYFIRE",
	/*End of game defaults*/
	"summondarkgolem", "summondeathhound", "stextmagicbolt", "summon_skeleton_mage", "summon_hollywisp", "summonairgolem",
	/*buffs*/
	"buff_protection", "buff_hp", "buff_stats", "buff_regen", "buff_damage", "buff_speed", "buff_dodge", "buff_es", "buff_massrestore",
	/*debuffs*/
	"debuff_protection", "debuff_stats", "debuff_siphon", "debuff_speed", "debuff_lifetap", "debuff_reflectdamage", "debuff_extradamage", "debuff_weaken",
	"summon_ghost", "summon_bonegolem", "summon_shadowbeast", "summon_shadowbeast_fire", "summon_troll", "summon_crawler", "summon_oster",
	/*Timed effects*/
	"firecape", "icecape", "lightingcape", "darkcape", "aircape", "earthcape", "poisioncape", "summon_electricgolem"
};

const string spellfxaniletters[max_spell] = 
{
    "SLE", "SLE", "FBT", "SLE", "FBT", "SLE", "FBT", "HEA", "FIB", "HEA", "FIB", "HEA", "HEA", "HEA", 
    "HEA", "HEA", "HEA", "SLE", "SLE", "FBT", "FBT", "SLE", "SUM", "FBT", "FBT", "SUM", "WND", "SLE", 
    "SLE", "FBT", "FIB", "SUM", "FEA", "FRZ", "FIB", "SUM", "FIB", "FIB", "FIB", "FEA", "SUM", "SLE", 
    "FEA", "FBT", "MSD", "SUM", "SLE", "SUM", "TRF", "TRF", "TRF", "TRF", "TRF", "TRF", "TRF", "TRF", 
    "TRF", "TRF", "TRF", "FIB", "FIB", "FBT", "FBT", "FBT", "SUM", "FBT", "HEA", "SLE", "SLE", "SLE", 
    "FEA", "FBT", "FBT", "FBT", "FIB", "FBT", "FEA", "FBT", "FBT", "FBT", "SUM", "FBT", "FRZ", "FRZ", 
    "SUM", "FBT", "SAC", "WND", "SUM", "SUM", "SUM", "SUM", "FBT", "FEA", "CON", "FBT", "FBT", "SUM", 
    "SUM", "FIB", "SUM", "FIB", "SUM", "WND", "FBT", "FBT", "TRF", "RPF", "RPF", "FEA", "FOT", "FRZ", 
    "FBT", "EXP", "FBT", "SUM", "WND", "FBT", "FBT", "FBT", "FEA", "FEA", "FBT", "FEA", "FBT", "FBT", 
    "FBT", "FBT", "FBT", "FBT", "FBT", "FBT", "FIB", "FBT", "SUM", "FBT", "FBT", "FBT", "FBT", "FBT", 
    "FBT", "FBT", "FBT", "FBT", "FBT", "FBT", "WND", "FBT", "SUM", "SUM", "FEA", "FEA", "FEA", "FBT", 
    "FBT", "FEA", "SLE", "FEA", "FBT", "SUM", "SUM", "SUM", "SUM", "FBT", "SUM", "SUM", "FBT", "FBT", 
    "FBT", "FBT", "FBT", "FBT", "FIB", "FIB", "FIB", "FIB", "FIB", "FRZ", "SUM", "SUM", "FIB", "FEA", 
    "FOT", "SLE", "FBT", "EXP", "PYR", "FIB", "FIB", "PYR", "FIB", "PYR", "FBT",
	/*End of game defaults*/
	"SUM", "SUM", "FBT", "SUM", "SUM", "SUM",
	/*buffs*/
	"SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SLE",
	/*debuffs*/
	"SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SLE",
	"SUM", "SUM", "SUM", "SUM", "SUM", "SUM", "SUM",
	/*Timed effects*/
	"SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SLE", "SUM"
};

const int StExt_SpellDamageFlags[max_spell] =
{
/*0		PalLight*/					(StExt_DamageType_Light),
/*1		PalHeal*/					(StExt_DamageType_Light | StExt_DamageType_Life),
/*2		PalHolyBolt*/				(StExt_DamageType_Light),
/*3		PalHeal*/					(StExt_DamageType_Light | StExt_DamageType_Life),
/*4		PalRepelEvil*/				(StExt_DamageType_Light),
/*5		PalHeal*/					(StExt_DamageType_Light | StExt_DamageType_Life),
/*6		PalDestroyEvil*/			(StExt_DamageType_Light),
/*7		Teleport*/					(StExt_DamageType_Unknown),
/*8		GreenStrike*/				(StExt_DamageType_Unknown),
/*9		Teleport*/					(StExt_DamageType_Unknown),
/*10	Druidball*/					(StExt_DamageType_Unknown),
/*11	Teleport*/					(StExt_DamageType_Unknown),
/*12	Teleport*/					(StExt_DamageType_Unknown),
/*13	Teleport*/					(StExt_DamageType_Unknown),
/*14	Teleport*/					(StExt_DamageType_Unknown),
/*15	Teleport*/					(StExt_DamageType_Unknown),
/*16	Teleport*/					(StExt_DamageType_Unknown),
/*17	TplHeal*/					(StExt_DamageType_Light | StExt_DamageType_Life),
/*18	Light*/						(StExt_DamageType_Light),
/*19	Firebolt*/					(StExt_DamageType_Fire),
/*20	Icebolt*/					(StExt_DamageType_Ice),
/*21	Heal*/						(StExt_DamageType_Life),
/*22	SummonGoblinSkeleton*/		(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*23	InstantFireball*/			(StExt_DamageType_Fire),
/*24	Zap*/						(StExt_DamageType_Electric | StExt_DamageType_Air),
/*25	SummonWolf*/				(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*26	WindFist*/					(StExt_DamageType_Air),
/*27	Sleep*/						(StExt_DamageType_Unknown),
/*28	Heal*/						(StExt_DamageType_Life),
/*29	LightningFlash*/			(StExt_DamageType_Electric),
/*30	ChargeFireball*/			(StExt_DamageType_Fire),
/*31	SummonSkeleton*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*32	Fear*/						(StExt_DamageType_Unknown),
/*33	Icecube*/					(StExt_DamageType_Ice),
/*34	ChargeZap*/					(StExt_DamageType_Electric),
/*35	SummonGolem*/				(StExt_DamageType_Unknown | StExt_DamageType_Earth),
/*36	DestroyUndead*/				(StExt_DamageType_Light),
/*37	Pyrokinesis*/				(StExt_DamageType_Fire),
/*38	Firestorm*/					(StExt_DamageType_Fire),
/*39	Icewave*/					(StExt_DamageType_Ice),
/*40	SummonDemon*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*41	Heal*/						(StExt_DamageType_Life),
/*42	Firerain*/					(StExt_DamageType_Fire | StExt_DamageType_Air),
/*43	BreathOfDeath*/				(StExt_DamageType_Death | StExt_DamageType_Air),
/*44	MassDeath*/					(StExt_DamageType_Death),
/*45	ArmyOfDarkness*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*46	Shrink*/					(StExt_DamageType_Life),
/*47	Transform*/					(StExt_DamageType_Life),
/*48	Transform*/					(StExt_DamageType_Life),
/*49	Transform*/					(StExt_DamageType_Life),
/*50	Transform*/					(StExt_DamageType_Life),
/*51	Transform*/					(StExt_DamageType_Life),
/*52	Transform*/					(StExt_DamageType_Life),
/*53	Transform*/					(StExt_DamageType_Life),
/*54	Transform*/					(StExt_DamageType_Life),
/*55	Transform*/					(StExt_DamageType_Life),
/*56	Transform*/					(StExt_DamageType_Life),
/*57	Transform*/					(StExt_DamageType_Life),
/*58	Transform*/					(StExt_DamageType_Life),
/*59	Charm*/						(StExt_DamageType_Unknown),
/*60	MasterOfDisaster*/			(StExt_DamageType_Light | StExt_DamageType_Fire),
/*61	Deathbolt*/					(StExt_DamageType_Death),
/*62	Deathball*/					(StExt_DamageType_Death),
/*63	Concussionbolt*/			(StExt_DamageType_True | StExt_DamageType_Air),
/*64	Teleport*/					(StExt_DamageType_Unknown),
/*65	BeliarRune*/				(StExt_DamageType_True | StExt_DamageType_Death | StExt_DamageType_Dark),
/*66	Teleport*/					(StExt_DamageType_Unknown),
/*67	Tplmediumheal*/				(StExt_DamageType_Light | StExt_DamageType_Life),
/*68	Tplheavyheal*/				(StExt_DamageType_Light | StExt_DamageType_Life),
/*69	Tplsuperheal*/				(StExt_DamageType_Light | StExt_DamageType_Life),
/*70	Thunderstorm*/				(StExt_DamageType_Electric | StExt_DamageType_Air),
/*71	Whirlwind*/					(StExt_DamageType_Air),
/*72	Waterfist*/					(StExt_DamageType_Ice),
/*73	IceLance*/					(StExt_DamageType_Ice),
/*74	Inflate*/					(StExt_DamageType_True | StExt_DamageType_Fire),
/*75	Geyser*/					(StExt_DamageType_Ice),
/*76	Waterwall*/					(StExt_DamageType_True | StExt_DamageType_Death | StExt_DamageType_Dark),
/*77	Tpllightstrike*/			(StExt_DamageType_Light | StExt_DamageType_Air),
/*78	Tplmediumstrike*/			(StExt_DamageType_Light | StExt_DamageType_Air),
/*79	TplHeavyStrike*/			(StExt_DamageType_Light | StExt_DamageType_Air),
/*80	SummonFireGolem*/			(StExt_DamageType_Unknown | StExt_DamageType_Fire),
/*81	Swarm*/						(StExt_DamageType_Death | StExt_DamageType_Life),
/*82	Greententacle*/				(StExt_DamageType_Earth | StExt_DamageType_Life),
/*83	Telekinesis*/				(StExt_DamageType_True | StExt_DamageType_Life | StExt_DamageType_Dark),
/*84	SummonGuardian*/			(StExt_DamageType_Unknown | StExt_DamageType_Earth),
/*85	Energyball*/				(StExt_DamageType_Dark | StExt_DamageType_Death),
/*86	ManaForLife*/				(StExt_DamageType_True | StExt_DamageType_Life | StExt_DamageType_Dark),
/*87	Skull*/						(StExt_DamageType_Dark | StExt_DamageType_Death | StExt_DamageType_Air),
/*88	SummonZombie*/				(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*89	SummonIceGolem*/			(StExt_DamageType_Unknown | StExt_DamageType_Ice),
/*90	SummonMud*/					(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*91	SummonEligor*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*92	TplSuperStrike*/			(StExt_DamageType_Light | StExt_DamageType_Air),
/*93	FireLight*/					(StExt_DamageType_Fire),
/*94	Control*/					(StExt_DamageType_Unknown),
/*95	Berzerk*/					(StExt_DamageType_Earth | StExt_DamageType_Air),
/*96	SevereFetidity*/			(StExt_DamageType_Poision),
/*97	SummonCrait*/				(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*98	SummonShoal*/				(StExt_DamageType_Unknown | StExt_DamageType_Life | StExt_DamageType_Ice),
/*99	UnlockChest*/				(StExt_DamageType_Unknown),
/*100	SummonSwampGolem*/			(StExt_DamageType_Unknown | StExt_DamageType_Earth),
/*101	DestroyGuardians*/			(StExt_DamageType_True),
/*102	SummonTreant*/				(StExt_DamageType_Unknown | StExt_DamageType_Earth | StExt_DamageType_Life),
/*103	FireMeteor*/				(StExt_DamageType_Fire),
/*104	TplSuperStrike*/			(StExt_DamageType_True | StExt_DamageType_Air),
/*105	OrcFireball*/				(StExt_DamageType_Fire),
/*106	Transform*/					(StExt_DamageType_Life),
/*107	RapidFirebolt*/				(StExt_DamageType_Fire),
/*108	RapidIcebolt*/				(StExt_DamageType_Ice),
/*109	Rage*/						(StExt_DamageType_Unknown),
/*110	Quake*/						(StExt_DamageType_Earth),
/*111	MagicCage*/					(StExt_DamageType_Fire),
/*112	Lacerate*/					(StExt_DamageType_Death | StExt_DamageType_Dark),
/*113	Extricate*/					(StExt_DamageType_Earth | StExt_DamageType_Air),
/*114	Explosion*/					(StExt_DamageType_Fire | StExt_DamageType_Air),
/*115	Elevate*/					(StExt_DamageType_Earth | StExt_DamageType_Air),
/*116	AdanosBall*/				(StExt_DamageType_True),
/*117	Acid*/						(StExt_DamageType_Poision | StExt_DamageType_Life),
/*118	Lightningsphere*/			(StExt_DamageType_Electric),
/*119	Electrowave*/				(StExt_DamageType_Electric),
/*120	Firewave*/					(StExt_DamageType_Fire),
/*121	Bloodrain*/					(StExt_DamageType_Death | StExt_DamageType_Air),
/*122	Iceexploision*/				(StExt_DamageType_Ice),
/*123	Icerain*/					(StExt_DamageType_Ice | StExt_DamageType_Air),
/*124	Abyssspell*/				(StExt_DamageType_True),
/*125	Magsphere*/					(StExt_DamageType_True),
/*126	Stonefirst*/				(StExt_DamageType_Earth),
/*127	Greenstrike*/				(StExt_DamageType_Death | StExt_DamageType_Dark),
/*128	Firelance*/					(StExt_DamageType_Fire),
/*129	Deathstrike*/				(StExt_DamageType_Death),
/*130	Necrobolt*/					(StExt_DamageType_Death | StExt_DamageType_Dark),
/*131	Gurumass*/					(StExt_DamageType_True | StExt_DamageType_Air),
/*132	CrestOfElements*/			(StExt_DamageType_True),
/*133	Blink*/						(StExt_DamageType_Unknown),
/*134	Sumkhub*/					(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*135	Agro*/						(StExt_DamageType_Unknown),
/*136	Dot_First*/					(StExt_DamageType_Dark),
/*137	Dark_Invis*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*138	Darkcontrol*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*139	Darksleep*/					(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*140	Massagro*/					(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*141	Massdot*/					(StExt_DamageType_Dark),
/*142	Dot_Second*/				(StExt_DamageType_Dark),
/*143	Darkball*/					(StExt_DamageType_Dark),
/*144	Darkspear*/					(StExt_DamageType_Dark),
/*145	Bigdarkball*/				(StExt_DamageType_Dark),
/*146	Darkwave*/					(StExt_DamageType_Dark),
/*147	Torture*/					(StExt_DamageType_Dark),
/*148	Sumdsnapper*/				(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*149	Darkpetsummon*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*150	Darkrune_Steal*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*151	Darkrune_Defense*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*152	Darkrune_Illness*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*153	Darkrune_Healpet*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*154	Darkrune_Absorb*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*155	Darkrune_Lord*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*156	Darkstatsup*/				(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*157	Darkrune_Edefense*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*158	Druidrunequest*/			(StExt_DamageType_True),
/*159	Summonskeleton_Archer*/ 	(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*160	Summonskeleton_Spear*/		(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*161	Sumjina*/					(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*162	Summon_Realgoblin*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*163	Aura_Summon*/				(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*164	Summon_Skeleton_Uniq*/		(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*165	Summon_Skel_Shadowbeast*/	(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*166	Helprune*/					(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*167	Aura_Summon_02*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*168	Aura_Summon_03*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*169	Aura_Summon_04*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*170	Aura_Summon_05*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*171	Summon_Heal*/				(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*172	VAMPIRE_TOUCH*/				(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*173	VAMPIRE_UNDEAD_TOUCH*/		(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*174	BLOOD_STREAM*/ 				(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*175	DARK_TENTACLES*/			(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*176	NIGHTVISION*/				(StExt_DamageType_Unknown),
/*177	STEAL_BLOOD*/ 				(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*178	SUM_FAMILIAR*/ 				(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*179	SUM_MAGIC_CLOUD*/			(StExt_DamageType_Blood | StExt_DamageType_Dark | StExt_DamageType_Death),
/*180	FIRE_STREAM*/				(StExt_DamageType_Fire),
/*181	FIRE_WALL*/					(StExt_DamageType_Fire),
/*182	FIRE_HOLE*/					(StExt_DamageType_Fire),
/*183	FIRE_WEAPON*/				(StExt_DamageType_Fire),
/*184	FIRE_COLLAPSE*/				(StExt_DamageType_Fire),
/*185	FIRE_DASH*/					(StExt_DamageType_Fire),
/*186	FIREMAGE_STREAM*/			(StExt_DamageType_Fire),
/*187	WATERMAGE_STREAM*/			(StExt_DamageType_Ice),
/*188	WATERMAGE_ELECTRO_STREAM*/	(StExt_DamageType_Electric),
/*189	GURUMAGE_STREAM*/			(StExt_DamageType_Air),
/*190	NECROMAGE_STREAM*/			(StExt_DamageType_Death),
/*191	DARKMAGE_STREAM*/			(StExt_DamageType_Dark),
/*192	HOLYFIRE*/					(StExt_DamageType_Fire | StExt_DamageType_Light),

		/* -= End of game default spells  =- */
/*xxx	Summondarkgolem*/			(StExt_DamageType_Unknown | StExt_DamageType_Dark),
/*xxx	Summondeathhound*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*xxx	Stext_Magicbolt*/			(StExt_DamageType_True),
/*xxx	Summon_Skeleton_Mage*/		(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*xxx	Summon_HollyWisp*/			(StExt_DamageType_Unknown | StExt_DamageType_Light),
/*xxx	Summon_AirGolem*/			(StExt_DamageType_Unknown | StExt_DamageType_Air),
/*xxx	spl_buff_protection*/		(StExt_DamageType_Unknown),
/*xxx	spl_buff_hp*/				(StExt_DamageType_Unknown),
/*xxx	spl_buff_stats*/			(StExt_DamageType_Unknown),
/*xxx	spl_buff_regen*/			(StExt_DamageType_Unknown),
/*xxx	spl_buff_damage*/			(StExt_DamageType_Unknown),
/*xxx	spl_buff_speed*/			(StExt_DamageType_Unknown),
/*xxx	spl_buff_dodge*/			(StExt_DamageType_Unknown),
/*xxx	spl_buff_es*/				(StExt_DamageType_Unknown),
/*xxx	spl_buff_massrestore*/		(StExt_DamageType_Unknown),
/*xxx	spl_debuff_protection*/		(StExt_DamageType_Unknown),
/*xxx	spl_debuff_stats*/			(StExt_DamageType_Unknown),
/*xxx	spl_debuff_siphon*/			(StExt_DamageType_Unknown),
/*xxx	spl_debuff_speed*/			(StExt_DamageType_Unknown),
/*xxx	spl_debuff_lifetap*/		(StExt_DamageType_Unknown),
/*xxx	spl_debuff_reflectdamage*/	(StExt_DamageType_Unknown),
/*xxx	spl_debuff_extradamage*/	(StExt_DamageType_Unknown),
/*xxx	spl_debuff_weaken*/			(StExt_DamageType_Unknown),
/*xxx	spl_summon_ghost*/			(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*xxx	spl_summon_bonegolem*/		(StExt_DamageType_Unknown | StExt_DamageType_Death),
/*xxx	spl_summon_shadowbeast*/	(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*xxx	spl_summon_shadowbeast_fire*/ (StExt_DamageType_Unknown | StExt_DamageType_Fire | StExt_DamageType_True),
/*xxx	spl_summon_troll*/			(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*xxx	spl_summon_crawler*/		(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*xxx	spl_summon_oster*/			(StExt_DamageType_Unknown | StExt_DamageType_Life),
/*xxx	spl_firecape*/				(StExt_DamageType_Fire),
/*xxx	spl_icecape*/				(StExt_DamageType_Ice),
/*xxx	spl_lightingcape*/			(StExt_DamageType_Electric),
/*xxx	spl_darkcape*/				(StExt_DamageType_Dark),
/*xxx	spl_aircape*/				(StExt_DamageType_Air),
/*xxx	spl_earthcape*/				(StExt_DamageType_Earth),
/*xxx	spl_poisioncape*/			(StExt_DamageType_Poision),
/*xxx	spl_summon_electricgolem*/	(StExt_DamageType_Unknown)
};

const int StExt_SpellEffectFlags[max_spell] =
{
/*0		PalLight*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff),
/*1		PalHeal*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*2		PalHolyBolt*/				(StExt_DamageFlag_Single),
/*3		PalHeal*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*4		PalRepelEvil*/				(StExt_DamageFlag_Single),
/*5		PalHeal*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*6		PalDestroyEvil*/			(StExt_DamageFlag_Single),
/*7		Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*8		GreenStrike*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*9		Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*10	Druidball*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*11	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*12	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*13	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*14	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*15	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*16	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*17	TplHeal*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*18	Light*/						(StExt_DamageFlag_Support | StExt_DamageFlag_Timed),
/*19	Firebolt*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*20	Icebolt*/					(StExt_DamageFlag_Single),
/*21	Heal*/						(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*22	SummonGoblinSkeleton*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*23	InstantFireball*/			(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*24	Zap*/						(StExt_DamageFlag_Single),
/*25	SummonWolf*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*26	WindFist*/					(StExt_DamageFlag_Single),
/*27	Sleep*/						(StExt_DamageFlag_Timed | StExt_DamageFlag_Debuff),
/*28	Heal*/						(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*29	LightningFlash*/			(StExt_DamageFlag_Single),
/*30	ChargeFireball*/			(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*31	SummonSkeleton*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*32	Fear*/						(StExt_DamageFlag_Timed | StExt_DamageFlag_Debuff),
/*33	Icecube*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Timed),
/*34	ChargeZap*/					(StExt_DamageFlag_Single),
/*35	SummonGolem*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*36	DestroyUndead*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe),
/*37	Pyrokinesis*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot | StExt_DamageFlag_Target),
/*38	Firestorm*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot | StExt_DamageFlag_Target),
/*39	Icewave*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Timed),
/*40	SummonDemon*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Demon),
/*41	Heal*/						(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*42	Firerain*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot),
/*43	BreathOfDeath*/				(StExt_DamageFlag_Aoe),
/*44	MassDeath*/					(StExt_DamageFlag_Aoe),
/*45	ArmyOfDarkness*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*46	Shrink*/					(StExt_DamageFlag_Timed | StExt_DamageFlag_Debuff),
/*47	Transform*/					(StExt_DamageFlag_Transform),
/*48	Transform*/					(StExt_DamageFlag_Transform),
/*49	Transform*/					(StExt_DamageFlag_Transform),
/*50	Transform*/					(StExt_DamageFlag_Transform),
/*51	Transform*/					(StExt_DamageFlag_Transform),
/*52	Transform*/					(StExt_DamageFlag_Transform),
/*53	Transform*/					(StExt_DamageFlag_Transform),
/*54	Transform*/					(StExt_DamageFlag_Transform),
/*55	Transform*/					(StExt_DamageFlag_Transform),
/*56	Transform*/					(StExt_DamageFlag_Transform),
/*57	Transform*/					(StExt_DamageFlag_Transform),
/*58	Transform*/					(StExt_DamageFlag_Transform),
/*59	Charm*/						(StExt_DamageFlag_Timed | StExt_DamageFlag_Debuff),
/*60	MasterOfDisaster*/			(StExt_DamageFlag_Single),
/*61	Deathbolt*/					(StExt_DamageFlag_Single),
/*62	Deathball*/					(StExt_DamageFlag_Single),
/*63	Concussionbolt*/			(StExt_DamageFlag_Single),
/*64	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*65	BeliarRune*/				(StExt_DamageFlag_Single),
/*66	Teleport*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*67	Tplmediumheal*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*68	Tplheavyheal*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*69	Tplsuperheal*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*70	Thunderstorm*/				(StExt_DamageFlag_Aoe),
/*71	Whirlwind*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Single),
/*72	Waterfist*/					(StExt_DamageFlag_Single),
/*73	IceLance*/					(StExt_DamageFlag_Single),
/*74	Inflate*/					(StExt_DamageFlag_Single),
/*75	Geyser*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe),
/*76	Waterwall*/					(StExt_DamageFlag_Debuff),
/*77	Tpllightstrike*/			(StExt_DamageFlag_Single),
/*78	Tplmediumstrike*/			(StExt_DamageFlag_Single),
/*79	TplHeavyStrike*/			(StExt_DamageFlag_Single),
/*80	SummonFireGolem*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*81	Swarm*/						(StExt_DamageFlag_Single | StExt_DamageFlag_Timed),
/*82	Greententacle*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Timed),
/*83	Telekinesis*/				(StExt_DamageFlag_Single),
/*84	SummonGuardian*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*85	Energyball*/				(StExt_DamageFlag_Single),
/*86	ManaForLife*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Timed | StExt_DamageFlag_Debuff),
/*87	Skull*/						(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe),
/*88	SummonZombie*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*89	SummonIceGolem*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*90	SummonMud*/					(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*91	SummonEligor*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Demon),
/*92	TplSuperStrike*/			(StExt_DamageFlag_Single),
/*93	FireLight*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*94	Control*/					(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*95	Berzerk*/					(StExt_DamageFlag_Single),
/*96	SevereFetidity*/			(StExt_DamageFlag_Support | StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*97	SummonCrait*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*98	SummonShoal*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*99	UnlockChest*/				(StExt_DamageFlag_Support),
/*100	SummonSwampGolem*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*101	DestroyGuardians*/			(StExt_DamageFlag_Single),
/*102	SummonTreant*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*103	FireMeteor*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot | StExt_DamageFlag_Target),
/*104	TplSuperStrike*/			(StExt_DamageFlag_Single),
/*105	OrcFireball*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe),
/*106	Transform*/					(StExt_DamageFlag_Transform),
/*107	RapidFirebolt*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*108	RapidIcebolt*/				(StExt_DamageFlag_Single),
/*109	Rage*/						(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*110	Quake*/						(StExt_DamageFlag_Aoe),
/*111	MagicCage*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*112	Lacerate*/					(StExt_DamageFlag_Single),
/*113	Extricate*/					(StExt_DamageFlag_Aoe),
/*114	Explosion*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot),
/*115	Elevate*/					(StExt_DamageFlag_Support),
/*116	AdanosBall*/				(StExt_DamageFlag_Single),
/*117	Acid*/						(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*118	Lightningsphere*/			(StExt_DamageFlag_Single),
/*119	Electrowave*/				(StExt_DamageFlag_Aoe),
/*120	Firewave*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot),
/*121	Bloodrain*/					(StExt_DamageFlag_Aoe),
/*122	Iceexploision*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe),
/*123	Icerain*/					(StExt_DamageFlag_Aoe),
/*124	Abyssspell*/				(StExt_DamageFlag_Single),
/*125	Magsphere*/					(StExt_DamageFlag_Single),
/*126	Stonefirst*/				(StExt_DamageFlag_Single),
/*127	Greenstrike*/				(StExt_DamageFlag_Single),
/*128	Firelance*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*129	Deathstrike*/				(StExt_DamageFlag_Single),
/*130	Necrobolt*/					(StExt_DamageFlag_Single),
/*131	Gurumass*/					(StExt_DamageFlag_Aoe),
/*132	Crestofelements*/			(StExt_DamageFlag_Single),
/*133	Blink*/						(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*134	Sumkhub*/					(StExt_DamageFlag_Summon | StExt_DamageFlag_Demon),
/*135	Agro*/						(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*136	Dot_First*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*137	Dark_Invis*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Heal),
/*138	Darkcontrol*/				(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*139	Darksleep*/					(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*140	Massagro*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*141	Massdot*/					(StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot),
/*142	Dot_Second*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*143	Darkball*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*144	Darkspear*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*145	Bigdarkball*/				(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*146	Darkwave*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot | StExt_DamageFlag_Target),
/*147	Torture*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),
/*148	Sumdsnapper*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*149	Darkpetsummon*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Demon),
/*150	Darkrune_Steal*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*151	Darkrune_Defense*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*152	Darkrune_Illness*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*153	Darkrune_Healpet*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*154	Darkrune_Absorb*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*155	Darkrune_Lord*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*156	Darkstatsup*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*157	Darkrune_Edefense*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Demon | StExt_DamageFlag_Buff),
/*158	Druidrunequest*/			(StExt_DamageFlag_Aoe),
/*159	Summonskeleton_Archer*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*160	Summonskeleton_Spear*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*161	Sumjina*/					(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*162	Summon_Realgoblin*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*163	Aura_Summon*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*164	Summon_Skeleton_Uniq*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*165	Summon_Skel_Shadowbeast*/	(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*166	Helprune*/					(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*167	Aura_Summon_02*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*168	Aura_Summon_03*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*169	Aura_Summon_04*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*170	Aura_Summon_05*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*171	Summon_Heal*/				(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*172	VAMPIRE_TOUCH*/				(StExt_DamageFlag_Single),
/*173	VAMPIRE_UNDEAD_TOUCH*/		(StExt_DamageFlag_Single),
/*174	BLOOD_STREAM*/ 				(StExt_DamageFlag_Single | StExt_DamageFlag_Stream),
/*175	DARK_TENTACLES*/			(StExt_DamageFlag_Single),
/*176	NIGHTVISION*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*177	STEAL_BLOOD*/ 				(StExt_DamageFlag_Single | StExt_DamageFlag_Support | StExt_DamageFlag_Debuff),
/*178	SUM_FAMILIAR*/ 				(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead | StExt_DamageFlag_Undead),
/*179	SUM_MAGIC_CLOUD*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Support | StExt_DamageFlag_Undead | StExt_DamageFlag_Buff),
/*180	FIRE_STREAM*/				(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*181	FIRE_WALL*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Debuff),
/*182	FIRE_HOLE*/					(StExt_DamageFlag_Single),
/*183	FIRE_WEAPON*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff),
/*184	FIRE_COLLAPSE*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed),
/*185	FIRE_DASH*/					(StExt_DamageFlag_Support | StExt_DamageFlag_Blink),
/*186	FIREMAGE_STREAM*/			(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*187	WATERMAGE_STREAM*/			(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*188	WATERMAGE_ELECTRO_STREAM*/	(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*189	GURUMAGE_STREAM*/			(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*190	NECROMAGE_STREAM*/			(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*191	DARKMAGE_STREAM*/			(StExt_DamageFlag_Stream | StExt_DamageFlag_Single),
/*192	HOLYFIRE*/					(StExt_DamageFlag_Single | StExt_DamageFlag_Dot),

		/* -= End of game default spells  =- */
/*xxx	Summondarkgolem*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*xxx	Summondeathhound*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*xxx	Stext_Magicbolt*/			(StExt_DamageFlag_Single),
/*xxx	Summon_Skeleton_Mage*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*xxx	Summon_HollyWisp*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Totem),
/*xxx	Summon_AirGolem*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem),
/*xxx	spl_buff_protection*/		(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_hp*/				(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_stats*/			(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_regen*/			(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_damage*/			(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_speed*/			(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_dodge*/			(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_es*/				(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_buff_massrestore*/		(StExt_DamageFlag_Buff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_protection*/		(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_stats*/			(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_siphon*/			(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_speed*/			(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_lifetap*/		(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_reflectdamage*/	(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_extradamage*/	(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_debuff_weaken*/			(StExt_DamageFlag_Debuff | StExt_DamageFlag_Timed),
/*xxx	spl_summon_ghost*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*xxx	spl_summon_bonegolem*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Undead),
/*xxx	spl_summon_shadowbeast*/	(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*xxx	spl_summon_shadowbeast_fire*/ (StExt_DamageFlag_Summon | StExt_DamageFlag_Totem),
/*xxx	spl_summon_troll*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*xxx	spl_summon_crawler*/		(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*xxx	spl_summon_oster*/			(StExt_DamageFlag_Summon | StExt_DamageFlag_Animal),
/*xxx	spl_firecape*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_icecape*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_lightingcape*/			(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_darkcape*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_aircape*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_earthcape*/				(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_poisioncape*/			(StExt_DamageFlag_Support | StExt_DamageFlag_Timed | StExt_DamageFlag_Buff | StExt_DamageFlag_Aoe),
/*xxx	spl_summon_electricgolem*/	(StExt_DamageFlag_Summon | StExt_DamageFlag_Golem)
};

// *** PreHistory indexes ***
const int StExt_PreHistoryMode_Empty = 0;
const int StExt_PreHistoryMode_None = 1;
const int StExt_PreHistoryMode_OldCamp = 2;
const int StExt_PreHistoryMode_NewCamp = 3;
const int StExt_PreHistoryMode_PsiCamp = 4;
const int StExt_PreHistoryMode_FireMage = 5;
const int StExt_PreHistoryMode_WaterMage = 6;
const int StExt_PreHistoryMode_Guru = 7;
const int StExt_PreHistoryMode_Necro = 8;
const int StExt_PreHistoryMode_Baron = 9;
const int StExt_PreHistoryMode_Miner = 10;
const int StExt_PreHistoryMode_Max = 11;

// *** Corruption ***
const int StExt_Corruption_ExpPerLevel = 500;
const int StExt_Corruption_ExpReduction = 10;

const int StExt_Corruption_None = 0;
const int StExt_Corruption_Mage = 1;
const int StExt_Corruption_Warrior = 2;
const int StExt_Corruption_Ranger = 3;
const int StExt_Corruption_Max = 4;

// *** Corruption touch skill ***
const int StExt_CorruptionTouch_ExpPerLevel = 2500;
const int StExt_CorruptionTouch_SkillCost = 1;
const int StExt_CorruptionTouch_ExpReduction = 25;

const int StExt_ExtraSnCStat_EnergyShield_ExpPerLevel = 2500;

// *** Food controller settings ***
const int StExt_Food_FoodRegenMaxTime = 12; 
const int StExt_Food_FoodEffectResetDays = 7; 

// *** Craftsman settings ***
const int StExt_Craftsman_StudyGoldMult = 100;
const int StExt_Craftsman_CanSellItems = true;

// *** Economy configs ***
const float StExt_ItemBasicPriceMult = 1.0;
const int StExt_BaseTradeMul = 50;
const int StExt_TradeMulPerRhetorik = 1;
const int StExt_RhetorikMaxLevel = 200;

//===================================================================//
//							Npc AIVars								 //
//===================================================================//

const int StExt_AiVar_Uid = 399;

// NPC Flags
const int StExt_AiVar_IsRandomized = 0;
const int StExt_AiVar_Afix = 1;
const int StExt_AiVar_Prefix = 2;
const int StExt_AiVar_Sufix = 3;

const int StExt_AiVar_ExtraFlags = 4;
const int StExt_AiVar_GoldBonus = 5;
const int StExt_AiVar_LuckBonus = 6;
const int StExt_AiVar_OwnerGuild = 7;

// Extended Stats
const int StExt_AiVar_EsCur = 10;
const int StExt_AiVar_EsMax = 11;
const int StExt_AiVar_EsReg = 12;
const int StExt_AiVar_DodgeChance = 13;

const int StExt_AiVar_ResistAll = 14;
const int StExt_AiVar_ResistAoe = 15;
const int StExt_AiVar_ResistDot = 16;
const int StExt_AiVar_ResistEdge = 17;
const int StExt_AiVar_ResistBlunt = 18;
const int StExt_AiVar_ResistPoint = 19;
const int StExt_AiVar_ResistMagic = 20;
const int StExt_AiVar_ResistFire = 21;
const int StExt_AiVar_ResistFly = 22;
const int StExt_AiVar_ResistPois = 23;

const int StExt_AiVar_ExtraMagicDamage = 24;
const int StExt_AiVar_ExtraMeleeDamage = 25;
const int StExt_AiVar_ExtraRangeDamage = 26;

const int StExt_AiVar_TrueDamage = 27;
const int StExt_AiVar_BluntDamage = 28;
const int StExt_AiVar_EdgeDamage = 29;
const int StExt_AiVar_FireDamage = 30;
const int StExt_AiVar_FlyDamage = 31;
const int StExt_AiVar_MagicDamage = 32;
const int StExt_AiVar_PointDamage = 33;
const int StExt_AiVar_PoisionDamage = 34;

const int StExt_AiVar_ExtraDotTicks = 35;
const int StExt_AiVar_DotTrueDamage = 36;
const int StExt_AiVar_DotBluntDamage = 37;
const int StExt_AiVar_DotEdgeDamage = 38;
const int StExt_AiVar_DotFireDamage = 39;
const int StExt_AiVar_DotFlyDamage = 40;
const int StExt_AiVar_DotMagicDamage = 41;
const int StExt_AiVar_DotPointDamage = 42;
const int StExt_AiVar_DotPoisionDamage = 43;

const int StExt_AiVar_ExtraBuffPower = 44;
const int StExt_AiVar_ExtraDebuffPower = 45;
const int StExt_AiVar_ExtraAoeTargets = 46;

const int StExt_AiVar_ReflectTrueDamage = 47;
const int StExt_AiVar_ReflectBluntDamage = 48;
const int StExt_AiVar_ReflectEdgeDamage = 49;
const int StExt_AiVar_ReflectFireDamage = 50;
const int StExt_AiVar_ReflectFlyDamage = 51;
const int StExt_AiVar_ReflectMagicDamage = 52;
const int StExt_AiVar_ReflectPointDamage = 53;
const int StExt_AiVar_ReflectPoisionDamage = 54;

const int StExt_AiVar_ExtraAimChance = 55;
const int StExt_AiVar_ResistReflect = 56;
const int StExt_AiVar_SummonPower = 56;

const int StExt_AiVar_BaseStatsInitialized = 57;
const int StExt_AiVar_LastUpdateDay = 58;
const int StExt_AiVar_LastUpdateHeroLevel = 59;
const int StExt_AiVar_LastUpdateKapitel = 60;

const int StExt_AiVar_BaseLevel = 61;
const int StExt_AiVar_BaseHp = 62;
const int StExt_AiVar_BaseStr = 63;
const int StExt_AiVar_BaseAgi = 64;
const int StExt_AiVar_BaseDamEdge = 65;
const int StExt_AiVar_BaseDamBlunt = 66;
const int StExt_AiVar_BaseDamPoint = 67;
const int StExt_AiVar_BaseDamFire = 68;
const int StExt_AiVar_BaseDamMagic = 69;
const int StExt_AiVar_BaseDamFly = 70;
const int StExt_AiVar_BaseDamFall = 71;
const int StExt_AiVar_BaseProtEdge = 72;
const int StExt_AiVar_BaseProtBlunt = 73;
const int StExt_AiVar_BaseProtPoint = 74;
const int StExt_AiVar_BaseProtFire = 75;
const int StExt_AiVar_BaseProtMagic = 76;
const int StExt_AiVar_BaseProtFly = 77;
const int StExt_AiVar_BaseProtFall = 78;

const int StExt_AiVar_AppliedCurseFlags = 95;
const int StExt_AiVar_AppliedCursePower = 96;

// NPC Abilities
const int StExt_AiVar_AbilitiesCount = 99;

const int StExt_AiVar_AbilityData1 = 100;
const int StExt_AiVar_AbilityData2 = 101;
const int StExt_AiVar_AbilityData3 = 102;
const int StExt_AiVar_AbilityData4 = 103;
const int StExt_AiVar_AbilityData5 = 104;
const int StExt_AiVar_AbilityData6 = 105;
const int StExt_AiVar_AbilityData7 = 106;
const int StExt_AiVar_AbilityData8 = 107;
const int StExt_AiVar_AbilityData9 = 108;
const int StExt_AiVar_AbilityData10 = 109;

const int StExt_AiVar_AbilityCooldown1 = 110;
const int StExt_AiVar_AbilityCooldown2 = 111;
const int StExt_AiVar_AbilityCooldown3 = 112;
const int StExt_AiVar_AbilityCooldown4 = 113;
const int StExt_AiVar_AbilityCooldown5 = 114;
const int StExt_AiVar_AbilityCooldown6 = 115;
const int StExt_AiVar_AbilityCooldown7 = 116;
const int StExt_AiVar_AbilityCooldown8 = 117;
const int StExt_AiVar_AbilityCooldown9 = 118;
const int StExt_AiVar_AbilityCooldown10 = 119;

const int StExt_AiVar_PassiveAbilityCooldown = 120;
const int StExt_AiVar_ActiveAbilityCooldown = 121;
const int StExt_AiVar_UseSpellRune = 122;
const int StExt_AiVar_LastAtkPtr = 123;

const int StExt_AiVar_Appearence_Gender = 150;
const int StExt_AiVar_Appearence_NameIndex = 151;
const int StExt_AiVar_Appearence_AnimSetIndex = 152;
const int StExt_AiVar_Appearence_BodyMeshIndex = 153;
const int StExt_AiVar_Appearence_BodyTexIndex = 154;
const int StExt_AiVar_Appearence_HeadMeshIndex = 155;
const int StExt_AiVar_Appearence_HeadTexIndex = 156;
const int StExt_AiVar_Appearence_TypeIndex = 157;
const int StExt_AiVar_Appearence_SkinToneIndex = 158;
const int StExt_AiVar_Appearence_HeadMeshExtraIndex = 159;
const int StExt_AiVar_Appearence_ArmorInstanceIndex = 160;
const int StExt_AiVar_Appearence_VoiceIndex = 161;

//===================================================================//
// Npc item conditions stats

const int StExt_Item_Cond_Hp = atr_hitpoints_max;
const int StExt_Item_Cond_Mp = atr_mana_max;
const int StExt_Item_Cond_Str = atr_strength;
const int StExt_Item_Cond_Agi = atr_dexterity;
const int StExt_Item_Cond_Stam = aivrx_npc_atr_stamina;
const int StExt_Item_Cond_Shield = aivrx_npc_atr_shield;
const int StExt_Item_Cond_Bow = aivrx_npc_atr_bow;
const int StExt_Item_Cond_CrossBow = aivrx_npc_atr_crossbow;
const int StExt_Item_Cond_Separator = 1000;
const int StExt_Item_Cond_OneHanded = 1001;
const int StExt_Item_Cond_TwoHanded = 1002;
const int StExt_Item_Cond_Int = 1003;
const int StExt_Item_Cond_Level = 1004;
const int StExt_Item_Cond_BeliarKarma = 1005;
const int StExt_Item_Cond_InnosKarma = 1006;
const int StExt_Item_Cond_AdanosKarma = 1007;

// NPC extra flags
const int StExt_NpcFlag_None = 0;
const int StExt_NpcFlag_LootProcessed = 1;
const int StExt_NpcFlag_IsDead = 2;
const int StExt_NpcFlag_Duplicated = 4;
const int StExt_NpcFlag_Summoned = 8;
const int StExt_NpcFlag_Corrupted = 16;
const int StExt_NpcFlag_Lucky = 32;
const int StExt_NpcFlag_Rich = 64;
const int StExt_NpcFlag_Original = 128;
const int StExt_NpcFlag_ScrollUser = 256;
const int StExt_NpcFlag_Summoner = 512;
const int StExt_NpcFlag_Priest = 1024;
const int StExt_NpcFlag_Curser = 2048;
const int StExt_NpcFlag_OverrideConfigInhibitions = 4096;
const int StExt_NpcFlag_UberBoss = 8192;
const int StExt_NpcFlag_ExtraNpc = 16384;
const int StExt_NpcFlag_WasDefeated = 32768;
const int StExt_NpcFlag_RandomBandit = 65536;

const int StExt_BattleScrolls_Max = 32;
const string StExt_BattleScrolls[StExt_BattleScrolls_Max] =
{
	"itsc_skull", "itsc_firestorm", "itsc_whirlwind", "itsc_pyrokinesis", "itsc_lightningflash",
	"itsc_icewave", "itsc_geyser", "itsc_energyball", "itsc_thunderball", "itsc_darkspear",
	"itsc_instantfireball", "itsc_icelance", "itsc_icelance", "itsc_bigdarkball",
	"itsc_lacerate", "itsc_palholybolt", "itsc_stonefirst", "itsc_greententacle", "itsc_lacerate",
	"itsc_acid", "itsc_waterfist", "itsc_palholybolt", "itsc_dot_second", "itsc_deathball",
	"itsc_firebolt", "itsc_zap", "itsc_icebolt", "itsc_deathbolt", "itsc_chargefireball", "itsc_dot_first",
	"itsc_adanosball", "itsc_chargefireball"
};

//===================================================================//
//							Timed effects							 //
//===================================================================//

const int StExt_TimedEffect_Index_Max = 81;

const int StExt_TimedEffect_Flag_None = 0;
const int StExt_TimedEffect_Flag_Dot = 1;
const int StExt_TimedEffect_Flag_Aoe = 2;
const int StExt_TimedEffect_Flag_Buff = 4;
const int StExt_TimedEffect_Flag_DeBuff = 8;
const int StExt_TimedEffect_Flag_Spell = 16;
const int StExt_TimedEffect_Flag_OtherIsHero = 32;
const int StExt_TimedEffect_Flag_OtherIsSummon = 64;
const int StExt_TimedEffect_Flag_CanUpdate = 128;

const int StExt_DebuffFlag_None = 0;
const int StExt_DebuffFlag_LifeTap = 1;
const int StExt_DebuffFlag_IronMaiden = 2;
const int StExt_DebuffFlag_AmplifyDamage = 4;
const int StExt_DebuffFlag_Weaken = 8;


// ---------------------------------------------------
//				Timed Effect AiVars

const int StExt_TimedEffect_AiVar_IsInit = 0;
const int StExt_TimedEffect_AiVar_Timer = 1;
const int StExt_TimedEffect_AiVar_Power = 2;

const int StExt_TimedEffect_AiVar_Value_1 = 3;
const int StExt_TimedEffect_AiVar_Value_2 = 4;
const int StExt_TimedEffect_AiVar_Value_3 = 5;
const int StExt_TimedEffect_AiVar_Value_4 = 6;

const int StExt_TimedEffect_AiVar_InitialValue_1 = 7;
const int StExt_TimedEffect_AiVar_InitialValue_2 = 8;
const int StExt_TimedEffect_AiVar_InitialValue_3 = 9;
const int StExt_TimedEffect_AiVar_InitialValue_4 = 10;

const int StExt_TimedEffect_AiVar_Radius = 11;
const int StExt_TimedEffect_AiVar_DamageTotal = 12;
const int StExt_TimedEffect_AiVar_DamageEnum = 13;
const int StExt_TimedEffect_AiVar_DamageType = 14;
const int StExt_TimedEffect_AiVar_DamageFlags = 15;

// ---------------------------------------------------
// 				Dot damage layout

const int StExt_TimedEffect_AiVar_Damage_True = 16;
const int StExt_TimedEffect_AiVar_Damage_Blunt = 17;
const int StExt_TimedEffect_AiVar_Damage_Edge = 18;
const int StExt_TimedEffect_AiVar_Damage_Fire = 19;
const int StExt_TimedEffect_AiVar_Damage_Fly = 20;
const int StExt_TimedEffect_AiVar_Damage_Magic = 21;
const int StExt_TimedEffect_AiVar_Damage_Point = 22;
const int StExt_TimedEffect_AiVar_Damage_Poison = 23;

const int StExt_TimedEffect_AiVar_DamageTicks_True = 24;
const int StExt_TimedEffect_AiVar_DamageTicks_Blunt = 25;
const int StExt_TimedEffect_AiVar_DamageTicks_Edge = 26;
const int StExt_TimedEffect_AiVar_DamageTicks_Fire = 27;
const int StExt_TimedEffect_AiVar_DamageTicks_Fly = 28;
const int StExt_TimedEffect_AiVar_DamageTicks_Magic = 29;
const int StExt_TimedEffect_AiVar_DamageTicks_Point = 30;
const int StExt_TimedEffect_AiVar_DamageTicks_Poison = 31;

//===================================================================//
//						Pc extra stats								 //
//===================================================================//
const int StExt_PcStats_Index_Max = 311;
const int StExt_PcStat_Source_Max = 11;
const string StExt_PcStat_SourceIndex[StExt_PcStat_Source_Max] = 
{
	"StExt_PcStats_Perm",
	"StExt_PcStats_Items",
	"StExt_PcStats_Talismans",
	"StExt_PcStats_Alchemy",
	"StExt_PcStats_Buffs",
	"StExt_PcStats_Auras",
	"StExt_PcStats_Grimoir",
	"StExt_PcStats_Dagger",
	"StExt_PcStats_Dynamic",
	"StExt_PcStats_Abilities",
	"StExt_PcStats_Other"
};
const int StExt_PcStat_Source_Perm = 0;
const int StExt_PcStat_Source_Items = 1;
const int StExt_PcStat_Source_Talismans = 2;
const int StExt_PcStat_Source_Alchemy = 3;
const int StExt_PcStat_Source_Buffs = 4;
const int StExt_PcStat_Source_Auras = 5;
const int StExt_PcStat_Source_Grimoir = 6;
const int StExt_PcStat_Source_Dagger = 7;
const int StExt_PcStat_Source_Dynamic = 8;
const int StExt_PcStat_Source_Abilities = 9;
const int StExt_PcStat_Source_Other = 10;

const int StExt_ArtifactIndex_None = 0;
const int StExt_ArtifactIndex_Grimoir = 1;
const int StExt_ArtifactIndex_Dagger = 2;
const int StExt_ArtifactIndex_Max = 3;
const int StExt_ArtifactExpPerLevel = 100;

const int StExt_PcStat_PercentIndex_Hp = 0;
const int StExt_PcStat_PercentIndex_Mp = 1;
const int StExt_PcStat_PercentIndex_Es = 2;
const int StExt_PcStat_PercentIndex_Stam = 3;
const int StExt_PcStat_PercentIndex_HpReg = 4;
const int StExt_PcStat_PercentIndex_MpReg = 5;
const int StExt_PcStat_PercentIndex_EsReg = 6;
const int StExt_PcStat_PercentIndex_StamReg = 7;
const int StExt_PcStat_PercentIndex_ProtEdge = 8;
const int StExt_PcStat_PercentIndex_ProtBlunt = 9;
const int StExt_PcStat_PercentIndex_ProtFire = 10;
const int StExt_PcStat_PercentIndex_ProtFly = 11;
const int StExt_PcStat_PercentIndex_ProtMagic = 12;
const int StExt_PcStat_PercentIndex_ProtPoint = 13;
const int StExt_PcStat_PercentIndex_Int = 14;
const int StExt_PcStat_PercentIndex_Str = 15;
const int StExt_PcStat_PercentIndex_Agi = 16;
const int StExt_PcStat_PercentIndex_ProtFall = 17;

// *** Stat caps ***
const int StExt_ActionsSpeed_HardCap = 300;
const int StExt_StatReservation_HardCap = 95;
const int StExt_Protection_HardCap = 5000;
const int StExt_MagicPower_HardCap = 2000;
const int StExt_Resists_SoftCap = 500;
const int StExt_Resists_HardCap = 750;
const int StExt_Dodge_HardCap = 750;
const int StExt_StunChance_HardCap = 750;
const int StExt_AurasCount_HardCap = 16;
const int StExt_AurasPower_Base = 10;
const int StExt_AurasChance_Base = 10;
const int StExt_AurasDistance_Base = 500;
const int StExt_AurasDistance_HardCap = 3000;
const int StExt_AurasCount_Base = 1;
const int StExt_AurasPowerMult = 100;
const int StExt_AurasConsumptionReduction_HardCap = 750;
const int StExt_Npc_ExtraDamage_HardCap = 9999;
const int StExt_Npc_OnDeadDamage_Cap = 5000;
const int StExt_MasteriesCountBase = 1;
const int StExt_Npc_WeaponMastery_HardCap = 1000;
const int StExt_DynamicBonusForMasteryRank = 3;
const int StExt_DummyHp = 1000000;
const int StExt_TopItemChanceMod = 10;
const int StExt_SummonsCountBase = 3;

const int StExt_ChainTargetsBase = 2;
const int StExt_AoeTargetsBase = 5;

const int StExt_NpcAoeDistance_Min = 100;
const int StExt_NpcAoeDistance_Max = 2000;

const int StExt_ChestLuck_RelativeMult = 200;
const int StExt_BodyLuck_RelativeMult = 0;

const int StExt_ForgetPerks_ReturnGoldMult = 50;

const int StExt_PcStat_CondIndex_Hp = 1;
const int StExt_PcStat_CondIndex_Mp = 2;
const int StExt_PcStat_CondIndex_St = 3;
const int StExt_PcStat_CondIndex_Str = 4;
const int StExt_PcStat_CondIndex_Agi = 5;
const int StExt_PcStat_CondIndex_Int = 6;
const int StExt_PcStat_CondIndex_Level = 7;
const int StExt_PcStat_CondIndex_Es = 8;

const int StExt_UncaperStatIndex_Max = 7;
const int StExt_UncaperStatIndex_StamMax = 0;
const int StExt_UncaperStatIndex_StamCur = 1;
const int StExt_UncaperStatIndex_LearnSpells = 2;
const int StExt_UncaperStatIndex_BowTalent = 3;
const int StExt_UncaperStatIndex_CBowTalent = 4;
const int StExt_UncaperStatIndex_1hTalent = 5;
const int StExt_UncaperStatIndex_2hTalent = 6;

const int StExt_StatGroup_Skills = 0;
const int StExt_StatGroup_Protection = 1;
const int StExt_StatGroup_Attack = 2;
const int StExt_StatGroup_Auras = 3;
const int StExt_StatGroup_Summons = 4;
const int StExt_StatGroup_Other = 5;
const int StExt_StatGroup_Characteristics = 6;
  

//===================================================================//
// 							Extra stats
const int StExt_PcStats_Index_Hp = 0;							// Hp bonus
const int StExt_PcStats_Index_Mp = 1;							// Mp bonus
const int StExt_PcStats_Index_St = 2;							// Max stamina bonus
const int StExt_PcStats_Index_HpReg = 3;						// Hp regen bonus
const int StExt_PcStats_Index_MpReg = 4;						// Mp regen bonus
const int StExt_PcStats_Index_StReg = 5;						// Stamiona regen bonus
const int StExt_PcStats_Index_Str = 6;							// Strength bonus
const int StExt_PcStats_Index_Agi = 7;							// Agility bonus
const int StExt_PcStats_Index_Int = 8;							// Intellect bonus
const int StExt_PcStats_Index_MagicPower = 9;					// Spell power
const int StExt_PcStats_Index_1hMastery = 10;					// 1h mastery
const int StExt_PcStats_Index_2hMastery = 11;					// 2h mastery
const int StExt_PcStats_Index_BowMastery = 12;					// Bow mastery
const int StExt_PcStats_Index_CBowMastery = 13;					// CBow mastery
const int StExt_PcStats_Index_HpPerc = 14;						// Hp % bonus
const int StExt_PcStats_Index_MpPerc = 15;						// Mp % bonus
const int StExt_PcStats_Index_StPerc = 16;						// St % bonus
const int StExt_PcStats_Index_StrPerc = 17;						// Strength % bonus
const int StExt_PcStats_Index_AgiPerc = 18;						// Agility % bonus
const int StExt_PcStats_Index_IntPerc = 19;						// Intellect % bonus
const int StExt_PcStats_Index_HpRegPerc = 20;					// Hp % regen bonus
const int StExt_PcStats_Index_MpRegPerc = 21;					// Mp % regen bonus
const int StExt_PcStats_Index_StRegPerc = 22;					// Stamina % regen bonus
const int StExt_PcStats_Index_Es = 23;							// Max energy shield bonus
const int StExt_PcStats_Index_EsPerc = 24;						// Max energy shield % bonus
const int StExt_PcStats_Index_EsReg = 25;						// Es regen bonus
const int StExt_PcStats_Index_EsRegPerc = 26;					// Es % regen bonus
const int StExt_PcStats_Index_DodgeChance = 27;					// Dodge chance (works separetly from NB)
const int StExt_PcStats_Index_ProtEdge = 28;					// Edge protection
const int StExt_PcStats_Index_ProtBlunt = 29;					// Blunt protection
const int StExt_PcStats_Index_ProtFire = 30;					// Fire protection
const int StExt_PcStats_Index_ProtMagic = 31;					// Magic protection
const int StExt_PcStats_Index_ProtFly = 32;						// Fly protection
const int StExt_PcStats_Index_ProtPoint = 33;					// Point protection
const int StExt_PcStats_Index_ProtEdgePerc = 34;				// Edge % protection
const int StExt_PcStats_Index_ProtBluntPerc = 35;				// Blunt % protection
const int StExt_PcStats_Index_ProtFirePerc = 36;				// Fire % protection
const int StExt_PcStats_Index_ProtMagicPerc = 37;				// Magic % protection
const int StExt_PcStats_Index_ProtFlyPerc = 38;					// Fly % protection
const int StExt_PcStats_Index_ProtPointPerc = 39;				// Point % protection
const int StExt_PcStats_Index_ResistEdge = 40;					// Edge dam resist %
const int StExt_PcStats_Index_ResistBlunt = 41;					// Blunt dam resist %
const int StExt_PcStats_Index_ResistFire = 42;					// Fire dam resist %
const int StExt_PcStats_Index_ResistMagic = 43;					// Magic dam resist %
const int StExt_PcStats_Index_ResistFly = 44;					// Fly dam resist %
const int StExt_PcStats_Index_ResistPoint = 45;					// Point dam resist %
const int StExt_PcStats_Index_ResistPoison = 46;				// Poison dam resist %
const int StExt_PcStats_Index_AoeResist = 47;					// Percent of aoe damage reduction
const int StExt_PcStats_Index_MaxDodgeChance = 48;				// Max dodge cap
const int StExt_PcStats_Index_MaxResistEdge = 49;				// Max edge dam resist %
const int StExt_PcStats_Index_MaxResistBlunt = 50;				// Max blunt dam resist %
const int StExt_PcStats_Index_MaxResistFire = 51;				// Max fire dam resist %
const int StExt_PcStats_Index_MaxResistMagic = 52;				// Max magic dam resist %
const int StExt_PcStats_Index_MaxResistFly = 53;				// Max fly dam resist %
const int StExt_PcStats_Index_MaxResistPoint = 54;				// Max point dam resist %
const int StExt_PcStats_Index_MaxResistPoison = 55;				// Max poison dam resist %
const int StExt_PcStats_Index_MaxAoeResist = 56;				// Max aoe dam resist %
const int StExt_PcStats_Index_IgnoreDamageChance = 57;			// Chance to ignore damage
const int StExt_PcStats_Index_ReflectDamageChance = 58;			// Chance to reflect 5% weap/melee/range damage to enemy 
const int StExt_PcStats_Index_ReflectSpellChance = 59;			// Chance to reflect spell to caster
const int StExt_PcStats_Index_AbsorbSpellChance = 60;			// Chance % to absorb spell
const int StExt_PcStats_Index_ArrowsDeclineChance = 61;			// Chance to decline arrow
const int StExt_PcStats_Index_PoisionResist = 62;				// Poision full resist
const int StExt_PcStats_Index_CurseResist = 63;					// Curse full resist
const int StExt_PcStats_Index_WeaknessResist = 64;				// Weakness full resist
const int StExt_PcStats_Index_HpRecouped = 65;					// Restore % of damage as life
const int StExt_PcStats_Index_MpRecouped = 66;					// Restore % of damage as mana
const int StExt_PcStats_Index_EsRecouped = 67;					// Restore % of damage as es
const int StExt_PcStats_Index_StRecouped = 68;					// Restore % of damage as stamina
const int StExt_PcStats_Index_ExtraDamage = 69;					// Add damage to any source
const int StExt_PcStats_Index_ExtraMeleeDam = 70;				// Add damage to any melee weapon source
const int StExt_PcStats_Index_ExtraRangeDam = 71;				// Add damage to any range weapon source
const int StExt_PcStats_Index_ExtraSpellDam = 72;				// Add damage to any magic source
const int StExt_PcStats_Index_ExtraDamagePerc = 73;				// Add % damage to any source
const int StExt_PcStats_Index_ExtraMeleeDamPerc = 74;			// Add % damage to any melee weapon source
const int StExt_PcStats_Index_ExtraRangeDamPerc = 75;			// Add % damage to any range weapon source
const int StExt_PcStats_Index_ExtraSpellDamPerc = 76;			// Add % damage to any magic source
const int StExt_PcStats_Index_ExtraWeaponSkillDam = 77;			// Extra damage for weapon skills
const int StExt_PcStats_Index_ExtraWeaponSkillDamPerc = 78;		// Extra % damage for weapon skills
const int StExt_PcStats_Index_ExtraBluntDam = 79;				// Add blunt damage to any source
const int StExt_PcStats_Index_ExtraEdgeDam = 80;				// Add edge damage to any source
const int StExt_PcStats_Index_ExtraFireDam = 81;				// Add fire damage to any source
const int StExt_PcStats_Index_ExtraFlyDam = 82;					// Add fly damage to any source
const int StExt_PcStats_Index_ExtraMagicDam = 83;				// Add magic damage to any source
const int StExt_PcStats_Index_ExtraPointDam = 84;				// Add point damage to any source
const int StExt_PcStats_Index_ExtraPoisonDam = 85;				// Add pois damage to any source
const int StExt_PcStats_Index_EdgeDotDamage = 86;				// Edge dot
const int StExt_PcStats_Index_BluntDotDamage = 87;				// Blunt dot
const int StExt_PcStats_Index_FireDotDamage = 88;				// Fire dot
const int StExt_PcStats_Index_FlyDotDamage = 89;				// Fly dot
const int StExt_PcStats_Index_MagicDotDamage = 90;				// Magic dot
const int StExt_PcStats_Index_PointDotDamage = 91;				// Point dot
const int StExt_PcStats_Index_PoisDotDamage = 92;				// Pois dot
const int StExt_PcStats_Index_DotExtraTick = 93;				// Add dot extra ticks
const int StExt_PcStats_Index_1hExtraDam = 94;					// 1h extra damage
const int StExt_PcStats_Index_2hExtraDam = 95;					// 2h extra damage
const int StExt_PcStats_Index_BowExtraDam = 96;					// Bow extra damage
const int StExt_PcStats_Index_CBowExtraDam = 97;				// CBow extra damage
const int StExt_PcStats_Index_DualExtraDam = 98;				// Dual extra damage
const int StExt_PcStats_Index_1hExtraDamPerc = 99;				// 1h extra % damage
const int StExt_PcStats_Index_2hExtraDamPerc = 100;				// 2h extra % damage
const int StExt_PcStats_Index_BowExtraDamPerc = 101;			// Bow extra % damage
const int StExt_PcStats_Index_CBowExtraDamPerc = 102;			// CBow extra % damage
const int StExt_PcStats_Index_DualExtraDamPerc = 103;			// Dual extra % damage
const int StExt_PcStats_Index_AddBluntDamPerc = 104;			// Add blunt damage % to any blunt source
const int StExt_PcStats_Index_AddEdgeDamPerc = 105;				// Add edge damage % to any edge source
const int StExt_PcStats_Index_AddFireDamPerc = 106;				// Add fire damage % to any fire source
const int StExt_PcStats_Index_AddFlyDamPerc = 107;				// Add fly damage % to any fly source
const int StExt_PcStats_Index_AddPointDamPerc = 108;			// Add point damage % to any point source
const int StExt_PcStats_Index_AddPoisonDamPerc = 109;			// Add pois damage % to any pois source
const int StExt_PcStats_Index_AddMagicDamPerc = 110;			// Add fire damage % to any fire source
const int StExt_PcStats_Index_AoeExtraDamage = 111;				// Extra aoe damage
const int StExt_PcStats_Index_AoeExtraDamagePerc = 112;			// Extra aoe damage %
const int StExt_PcStats_Index_AoeExtraMagicDamage = 113;		// Extra aoe magic damage
const int StExt_PcStats_Index_AoeExtraMagicDamagePerc = 114;	// Extra aoe magic damage %
const int StExt_PcStats_Index_AoeExtraWeapDamage = 115;			// Extra aoe weap damage
const int StExt_PcStats_Index_AoeExtraWeapDamagePerc = 116;		// Extra aoe weap damage %
const int StExt_PcStats_Index_HumanExtraDam = 117;				// Extra human damage
const int StExt_PcStats_Index_OrcExtraDam = 118;				// Extra orc damage
const int StExt_PcStats_Index_EvilExtraDam = 119;				// Extra demon damage
const int StExt_PcStats_Index_UndeadExtraDam = 120;				// Extra undead damage
const int StExt_PcStats_Index_AnimalExtraDam = 121;				// Extra animal damage
const int StExt_PcStats_Index_GolemExtraDam = 122;				// Extra golem damage
const int StExt_PcStats_Index_HumanExtraDamPerc = 123;			// Extra human % damage
const int StExt_PcStats_Index_OrcExtraDamPerc = 124;			// Extra orc % damage
const int StExt_PcStats_Index_EvilExtraDamPerc = 125;			// Extra demon % damage
const int StExt_PcStats_Index_UndeadExtraDamPerc = 126;			// Extra undead % damage
const int StExt_PcStats_Index_AnimalExtraDamPerc = 127;			// Extra animal % damage
const int StExt_PcStats_Index_GolemExtraDamPerc = 128;			// Extra golem % damage
const int StExt_PcStats_Index_SpellCritChance = 129;			// Chance % to make crit by spell
const int StExt_PcStats_Index_SpellCritChanceMult = 130;		// Multiplier of spell crit
const int StExt_PcStats_Index_SpellConsumptionReduction = 131;	// Spell cost reduction
const int StExt_PcStats_Index_WeapDoubleDamageChance = 132;		// Chance to do double damage with weapons
const int StExt_PcStats_Index_SpellDoubleCastChance = 133;		// Chance to cast spell again for free
const int StExt_PcStats_Index_StunChance = 134;					// Chance to stun target
const int StExt_PcStats_Index_FreezeChance = 135;				// Chance to freeze target
const int StExt_PcStats_Index_HpPerHit = 136;					// Restore hp per hit
const int StExt_PcStats_Index_MpPerHit = 137;					// Restore mp per hit
const int StExt_PcStats_Index_StPerHit = 138;					// Restore stamina per hit
const int StExt_PcStats_Index_EsPerHit = 139;					// Restore es per hit
const int StExt_PcStats_Index_StealLife = 140;					// Steal hp from target per hit
const int StExt_PcStats_Index_SteaMana = 141;					// Steal mp from target per hit
const int StExt_PcStats_Index_StealEs = 142;					// Steal es from target per hit
const int StExt_PcStats_Index_StealLifePerc = 143;				// Steal hp % from target per hit
const int StExt_PcStats_Index_StealManaPerc = 144;				// Steal mp % from target per hit
const int StExt_PcStats_Index_StealEsPerc = 145;				// Steal es % from target per hit
const int StExt_PcStats_Index_FireMasteryPower = 146;			// Fire mastery power
const int StExt_PcStats_Index_IceMasteryPower = 147;			// Ice mastery power
const int StExt_PcStats_Index_EarthMasteryPower = 148;			// Earth mastery power
const int StExt_PcStats_Index_AirMasteryPower = 149;			// Air mastery power
const int StExt_PcStats_Index_ElectricMasteryPower = 150;		// Electric mastery power
const int StExt_PcStats_Index_DarkMasteryPower = 151;			// Dark mastery power
const int StExt_PcStats_Index_LightMasteryPower = 152;			// Light mastery power
const int StExt_PcStats_Index_LifeMasteryPower = 153;			// Life mastery power
const int StExt_PcStats_Index_DeathMasteryPower = 154;			// Death mastery power
const int StExt_PcStats_Index_DemonMasteryPower = 155;			// Demon mastery power
const int StExt_PcStats_Index_GolemMasteryPower = 156;			// Golem mastery power
const int StExt_PcStats_Index_NecroMasteryPower = 157;			// Necro mastery power
const int StExt_PcStats_Index_AuraCountMax = 158;				// Extra aura slots
const int StExt_PcStats_Index_AuraPower = 159;					// Aura power
const int StExt_PcStats_Index_AuraPowerPerc = 160;				// Aura power % bonus
const int StExt_PcStats_Index_AuraDist = 161;					// Aura dist
const int StExt_PcStats_Index_AuraDistPerc = 162;				// Aura dist % bonus
const int StExt_PcStats_Index_AuraChance = 163;					// Extra chance for auras
const int StExt_PcStats_Index_AuraConsumptionReduction = 164;	// Aura consumption reduction
const int StExt_PcStats_Index_AuraMpConsumReduction = 165;		// Aura mana consumption decrease %
const int StExt_PcStats_Index_AuraStConsumReduction = 166;		// Aura stamina consumption decrease %
const int StExt_PcStats_Index_AuraHpConsumReduction = 167;		// Aura stamina consumption decrease %
const int StExt_PcStats_Index_ReservedHpPerc = 168;				// % of reserved hp
const int StExt_PcStats_Index_ReservedMpPerc = 169;				// % of reserved mp
const int StExt_PcStats_Index_ReservedStPerc = 170;				// % of reserved stam
const int StExt_PcStats_Index_ReservedEsPerc = 171;				// % of reserved es
const int StExt_PcStats_Index_ChanceToReanimate = 172;			// Chance % to reanimate dead target as gobbo skeleton
const int StExt_PcStats_Index_MaxSummonsCount = 173;			// Extra cap of summons
const int StExt_PcStats_Index_SumGlobalPower = 174;				// Global mult of summons power
const int StExt_PcStats_Index_SumStatsPower = 175;				// Global mult of summons stats
const int StExt_PcStats_Index_SumProtPower = 176;				// Global mult of summons protection
const int StExt_PcStats_Index_SumDamagePower = 177;				// Global mult of summons damage
const int StExt_PcStats_Index_SumHpPower = 178;					// Global mult of summons hp
const int StExt_PcStats_Index_SumHpRegen = 179;					// Summon hp regen
const int StExt_PcStats_Index_SumEsRegen = 180;					// Summon es regen
const int StExt_PcStats_Index_SumExtraHp = 181;					// Summon extra hp
const int StExt_PcStats_Index_SumExtraEs = 182;					// Summon extra es
const int StExt_PcStats_Index_SumExtraStr = 183;				// Summon extra str
const int StExt_PcStats_Index_SumExtraAgi = 184;				// Summon extra agi
const int StExt_PcStats_Index_SumExtraDodge = 185;				// Summon extra dodge chance
const int StExt_PcStats_Index_SumExtraProtAll = 186;			// Summon extra protection
const int StExt_PcStats_Index_SumProtEdge = 187;				// Summon extra edge protection
const int StExt_PcStats_Index_SumProtBlunt = 188;				// Summon extra blunt protection
const int StExt_PcStats_Index_SumProtFire = 189;				// Summon extra fire protection
const int StExt_PcStats_Index_SumProtMagic = 190;				// Summon extra magic protection
const int StExt_PcStats_Index_SumProtFly = 191;					// Summon extra fly protection
const int StExt_PcStats_Index_SumProtPoint = 192;				// Summon extra point protection
const int StExt_PcStats_Index_SumResistEdge = 193;				// Summon edge dam resist %
const int StExt_PcStats_Index_SumResistBlunt = 194;				// Summon blunt dam resist %
const int StExt_PcStats_Index_SumResistFire = 195;				// Summon fire dam resist %
const int StExt_PcStats_Index_SumResistMagic = 196;				// Summon magic dam resist %
const int StExt_PcStats_Index_SumResistFly = 197;				// Summon fly dam resist %
const int StExt_PcStats_Index_SumResistPoint = 198;				// Summon point dam resist %
const int StExt_PcStats_Index_SumResistPois = 199;				// Summon pois dam resist %
const int StExt_PcStats_Index_SumExtraDamage = 200;				// Extra damage to any summon's source
const int StExt_PcStats_Index_SumAddBluntDam = 201;				// Add blunt damage to summon's any source
const int StExt_PcStats_Index_SumAddEdgeDam = 202;				// Add edge damage to summon's any source
const int StExt_PcStats_Index_SumAddFireDam = 203;				// Add fire damage to summon's any source
const int StExt_PcStats_Index_SumAddFlyDam = 204;				// Add fly damage to summon's any source
const int StExt_PcStats_Index_SumAddPointDam = 205;				// Add point damage to summon's any source
const int StExt_PcStats_Index_SumAddPoisDam = 206;				// Add pois damage to summon's any source
const int StExt_PcStats_Index_SumAddMagicDam = 207;				// Add magic damage to summon's any source
const int StExt_PcStats_Index_SumUndeadGlobalPower = 208;		// Global mult of undead summons power
const int StExt_PcStats_Index_SumUndeadStatsPower = 209;		// Global mult of undead summons stats
const int StExt_PcStats_Index_SumUndeadProtPower = 210;			// Global mult of undead summons protection
const int StExt_PcStats_Index_SumUndeadDamagePower = 211;		// Global mult of undead summons damage
const int StExt_PcStats_Index_SumAnimalGlobalPower = 212;		// Global mult of animal summons power
const int StExt_PcStats_Index_SumAnimalStatsPower = 213;		// Global mult of animal summons stats
const int StExt_PcStats_Index_SumAnimalProtPower = 214;			// Global mult of animal summons protection
const int StExt_PcStats_Index_SumAnimalDamagePower = 215;		// Global mult of animal summons damage
const int StExt_PcStats_Index_SumGolemGlobalPower = 216;		// Global mult of golem summons power
const int StExt_PcStats_Index_SumGolemStatsPower = 217;			// Global mult of golem summons stats
const int StExt_PcStats_Index_SumGolemProtPower = 218;			// Global mult of golem summons protection
const int StExt_PcStats_Index_SumGolemDamagePower = 219;		// Global mult of golem summons damage
const int StExt_PcStats_Index_SumDemonGlobalPower = 220;		// Global mult of demon summons power
const int StExt_PcStats_Index_SumDemonStatsPower = 221;			// Global mult of demon summons stats
const int StExt_PcStats_Index_SumDemonProtPower = 222;			// Global mult of demon summons protection
const int StExt_PcStats_Index_SumDemonDamagePower = 223;		// Global mult of demon summons damage
const int StExt_PcStats_Index_SumAnimalHpPower = 224;			// Global mult of animal summons hp
const int StExt_PcStats_Index_SumUndeadHpPower = 225;			// Global mult of undead summons hp
const int StExt_PcStats_Index_SumGolemHpPower = 226;			// Global mult of golem summons hp
const int StExt_PcStats_Index_SumDemonHpPower = 227;			// Global mult of demon summons hp
const int StExt_PcStats_Index_SumTotemGlobalPower = 228;		// Global mult of totem summons power
const int StExt_PcStats_Index_SumTotemStatsPower = 229;			// Global mult of totem summons stats
const int StExt_PcStats_Index_SumTotemProtPower = 230;			// Global mult of totem summons protection
const int StExt_PcStats_Index_SumTotemDamagePower = 231;		// Global mult of totem summons damage
const int StExt_PcStats_Index_SumTotemHpPower = 232;			// Global mult of totem summons hp
const int StExt_PcStats_Index_SumTotemHealing = 233;			// Healing totem hp per sec
const int StExt_PcStats_Index_SumHealing = 234;					// Healing summons hp per sec
const int StExt_PcStats_Index_SumGolemHealing = 235;			// Healing summon golem hp per sec
const int StExt_PcStats_Index_SumUndeadHealing = 236;			// Healing summon undead hp per sec
const int StExt_PcStats_Index_SumDemonHealing = 237;			// Healing summon demon hp per sec
const int StExt_PcStats_Index_SumAnimalHealing = 238;			// Healing summon animal hp per sec
const int StExt_PcStats_Index_Luck = 239;						// Total luck
const int StExt_PcStats_Index_ChestLuck = 240;					// Luck bonus for chests
const int StExt_PcStats_Index_BodyLuck = 241;					// Luck bonus for enemies
const int StExt_PcStats_Index_LuckGold = 242;					// Luck applied to gold
const int StExt_PcStats_Index_PickPocketChance = 243;			// Extra chance to pickpocket
const int StExt_PcStats_Index_ChanceToInvis = 244;				// Chance % to become invisible per hit or when get damage
const int StExt_PcStats_Index_EffectDuration = 245;				// Bonus % to effects duration
const int StExt_PcStats_Index_ExtraSpeed = 246;					// Extra actions speed
const int StExt_PcStats_Index_StealStam = 247;
const int StExt_PcStats_Index_StealStamPerc = 248;
const int StExt_PcStats_Index_ShamanMasteryPower = 249;			// Shaman mastery power
const int StExt_PcStats_Index_ProtFall = 250;
const int StExt_PcStats_Index_ProtFallPerc = 251;
const int StExt_PcStats_Index_AuraEsConsumReduction = 252;		// Aura es consumption decrease %
const int StExt_PcStats_Index_ReflectDamageAsBlunt = 253;
const int StExt_PcStats_Index_ReflectDamageAsEdge = 254;
const int StExt_PcStats_Index_ReflectDamageAsPoint = 255;
const int StExt_PcStats_Index_ReflectDamageAsFire = 256;
const int StExt_PcStats_Index_ReflectDamageAsFly = 257;
const int StExt_PcStats_Index_ReflectDamageAsMagic = 258;
const int StExt_PcStats_Index_ReflectDamageAsPoision = 259;
const int StExt_PcStats_Index_ReflectDamageAsBluntPerc = 260;
const int StExt_PcStats_Index_ReflectDamageAsEdgePerc = 261;
const int StExt_PcStats_Index_ReflectDamageAsPointPerc = 262;
const int StExt_PcStats_Index_ReflectDamageAsFirePerc = 263;
const int StExt_PcStats_Index_ReflectDamageAsFlyPerc = 264;
const int StExt_PcStats_Index_ReflectDamageAsMagicPerc = 265;
const int StExt_PcStats_Index_ReflectDamageAsPoisionPerc = 266;
const int StExt_PcStats_Index_ReflectDamageAsBluntDot = 267;
const int StExt_PcStats_Index_ReflectDamageAsEdgeDot = 268;
const int StExt_PcStats_Index_ReflectDamageAsPointDot = 269;
const int StExt_PcStats_Index_ReflectDamageAsFireDot = 270;
const int StExt_PcStats_Index_ReflectDamageAsFlyDot = 271;
const int StExt_PcStats_Index_ReflectDamageAsMagicDot = 272;
const int StExt_PcStats_Index_ReflectDamageAsPoisionDot = 273;
const int StExt_PcStats_Index_IncomingDamageReduction = 274;
const int StExt_PcStats_Index_IncomingDamageReductionPerc = 275;
const int StExt_PcStats_Index_AimChance = 276;
const int StExt_PcStats_Index_AimChancePerc = 277;
const int StExt_PcStats_Index_SummonAimChance = 278;
const int StExt_PcStats_Index_SummonAimChancePerc = 279;
const int StExt_PcStats_Index_ResistDot = 280;
const int StExt_PcStats_Index_BuffPower = 281;
const int StExt_PcStats_Index_DebuffPower = 282;
const int StExt_PcStats_Index_ResistReflect = 283;
const int StExt_PcStats_Index_MaxDotResist = 284;
const int StExt_PcStats_Index_MaxReflectResist = 285;
const int StExt_PcStats_Index_SumExtraDotDamage = 286;
const int StExt_PcStats_Index_SumBluntExtraDotDamage = 287;
const int StExt_PcStats_Index_SumEdgeExtraDotDamage = 288;
const int StExt_PcStats_Index_SumFireExtraDotDamage = 289;
const int StExt_PcStats_Index_SumFlyExtraDotDamage = 290;
const int StExt_PcStats_Index_SumMagicExtraDotDamage = 291;
const int StExt_PcStats_Index_SumPointExtraDotDamage = 292;
const int StExt_PcStats_Index_SumPoisonExtraDotDamage = 293;
const int StExt_PcStats_Index_SumResistAoe = 294;
const int StExt_PcStats_Index_SumResistDot = 295;
const int StExt_PcStats_Index_SumResistReflect = 296;
const int StExt_PcStats_Index_SumReflectDamageAsBlunt = 297;
const int StExt_PcStats_Index_SumReflectDamageAsEdge = 298;
const int StExt_PcStats_Index_SumReflectDamageAsPoint = 299;
const int StExt_PcStats_Index_SumReflectDamageAsFire = 300;
const int StExt_PcStats_Index_SumReflectDamageAsFly = 301;
const int StExt_PcStats_Index_SumReflectDamageAsMagic = 302;
const int StExt_PcStats_Index_SumReflectDamageAsPoision = 303;
const int StExt_PcStats_Index_SumReflectDamageAsBluntDot = 304;
const int StExt_PcStats_Index_SumReflectDamageAsEdgeDot = 305;
const int StExt_PcStats_Index_SumReflectDamageAsPointDot = 306;
const int StExt_PcStats_Index_SumReflectDamageAsFireDot = 307;
const int StExt_PcStats_Index_SumReflectDamageAsFlyDot = 308;
const int StExt_PcStats_Index_SumReflectDamageAsMagicDot = 309;
const int StExt_PcStats_Index_SumReflectDamageAsPoisionDot = 310;


// Extra SnC progressing stats
const int StExt_ExtraSnC_StatId_EnergyShield = 1;

//===================================================================//
//							Auras indexes							 //
//===================================================================//
const int StExt_AuraIndex_Max = 93;
const int StExt_AuraAutoCast_Cost = 5;
const int StExt_TimedEffectCast_Cost = 10;

const int StExt_AuraIndex_Concentrator = 0;		// +200 aura power / cons 10% stam
const int StExt_AuraIndex_BisonHeart = 1;		// Add hp - 5 per 1 aura power. req 200 stam / cons 15% stam
const int StExt_AuraIndex_AdanosWisdom = 2;		// Add mp - 3 per 1 aura power. req int 100 / cons 25% stam
const int StExt_AuraIndex_HidenKnowlege = 3;	// Add int - 1 per 1 aura power. req 200 int / cons 20% mana
const int StExt_AuraIndex_BearStrength = 4;		// Add str - 1 per 1 aura power. req 200 stam / 100 str / cons 15% stam
const int StExt_AuraIndex_PumaAgility = 5;		// Add agi - 1 per 1 aura power. req 200 stam / 100 agi / cons 15% stam
const int StExt_AuraIndex_OwlHood = 6;			// Add es - 5 per 1 aura pwer. req 200 int / cons 30% mana
const int StExt_AuraIndex_WolfRegeneration = 7;	// add hp regeneration - 0.1% per 10 aura power. req 200 stam / cons 25% stamina
const int StExt_AuraIndex_CunningRaven = 8;		// Add es regeneration - 0.1% per 10 aura power. req 200 int / cons 30% mana
const int StExt_AuraIndex_DogEndurance = 9;		// Add stam regeneration - 0.1% per 5 aura power. req 150 stam / cons 10% stamina
const int StExt_AuraIndex_Dreamer = 10;			// Add mana regeneration - 0.1% per 10 aura power. req 100 int / cons 15% mana
const int StExt_AuraIndex_CheetahSpeed = 11;	// Add action speed - 1% per 10 aura power. req 250 stam / 75 agi / cons 30% stamina
const int StExt_AuraIndex_AstralFlow = 12;		// Increase spell power - 1 per 10 aura power. req 250 int / cons 40% mana
const int StExt_AuraIndex_SnakeFlexebility = 13;// Add dodge chance - 1% per 10 aura power. req 200 stam / 100 agi / cons 30% stamina
const int StExt_AuraIndex_Lich = 14;			// Lich hp - 0.1% from damage per 10 aura power. req 500 hp / cons 20% stamina
const int StExt_AuraIndex_Mindflayer = 15;		// Lich mp - 0.1% from damage per 10 aura power. req 500 mp / cons 20% mana
const int StExt_AuraIndex_SoulStealer = 16;		// Lich es - 0.1% from damage per 10 aura power. req 500 es / cons 20% es
const int StExt_AuraIndex_IronSkin = 17;		// Add weapon protection - 1 per 2 aura power. req 500 hp / cons 25% stamina
const int StExt_AuraIndex_WindShield = 18;		// Add chance to decline arrow - 1 per 20 aura power. req 300 hp / cons 25% stamina
const int StExt_AuraIndex_SpellEater = 19;		// Add chance to absorb spell - 1 per 20 aura power. req 250 int / 300 mp / cons 35% mana
const int StExt_AuraIndex_Luck = 20;			// Add luck - 1 per 10 aura power.
const int StExt_AuraIndex_Wealth = 21;			// Add luck gold - 1 per 10 aura power.
const int StExt_AuraIndex_Thief = 22;			// Add thief chance - 1% per 10 aura power. req 50 agi / cons 5% stamina
const int StExt_AuraIndex_Necromancer = 23;		// Add chance to reanimate as skeleton. 0.1% per 10 aura power. req 250 int / 600 mp / cons 35% mana
const int StExt_AuraIndex_Graveyard = 24;		// Always keep one summoned zombie protector. req 300 int / cons 35% mana
const int StExt_AuraIndex_Forest = 25;			// Always keep one summoned wolf protector and one more for every 200 aura power. req 300 int / cons 35% mana
const int StExt_AuraIndex_Hell = 26;			// Always keep one summoned demon protector. req 500 int / cons 45% mana
const int StExt_AuraIndex_Golem = 27;			// Always keep one summoned golem protector. req 400 int / cons 40% mana
const int StExt_AuraIndex_Thorns = 28;			// Reflect 0.1% of damage per 1 aura power. req 300 stamina / cons 20% stamina
const int StExt_AuraIndex_MirrorShield = 29;	// Reglect spell chance - 0.1% per aura power. req 300 int / 500 mp / cons 35% mana
const int StExt_AuraIndex_Summoner = 30;		// Add summon global power - 1% per 10 aura power. req 200 int / cons 25% mana
const int StExt_AuraIndex_Conjurer = 31;		// Add summon slot - 1 per 250 aura power. req 350 int / 500 mp / cons 50% mana
const int StExt_AuraIndex_Stuner = 32;			// Add chance to stun target. - 0.1% per 1 aura power. req 150str / cons 20% stam
const int StExt_AuraIndex_Burner = 33;			// Add chance to burn target - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 mp / cons 25% mana
const int StExt_AuraIndex_Frezer = 34;			// Add 0.1% chance to freeze target and deal 1 magic damage per 1 aura power. req 200 mp / cons 25% mana
const int StExt_AuraIndex_Pray = 35;			// 1 fire damage against evil and undead per 1 aura power every tick. req 350mp / cons 30% mana
const int StExt_AuraIndex_Death = 36;			// Damage against humans, animals and orcs - 1 per 1 aura power. req 250 stamina / cons 15% stamina
const int StExt_AuraIndex_Poision = 37;			// Add chance to poision target - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 stamina / cons 20% stamina
const int StExt_AuraIndex_Shock = 38;			// Add chance to stun target and deal magic damage - 2dmg per 1 aura power && 1% chance per 10 aura power. req 200 mp / cons 20% mana
const int StExt_AuraIndex_Curser = 39;			// Add chance to add magic dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 mp / cons 20% mana
const int StExt_AuraIndex_Crusher = 40;			// Add chance to add blunt dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 str / cons 20% stam
const int StExt_AuraIndex_Chopper = 41;			// Add chance to add edge dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 stam / cons 20% stam
const int StExt_AuraIndex_Piercer = 42;			// Add chance to add point dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 agi / cons 20% stam
const int StExt_AuraIndex_WarriorTrance = 43;	// Add melee weap damage. 0.1% per 1 aura power. req 300 stam / cons 25% stamina
const int StExt_AuraIndex_Shooter = 44;			// Add range weap damage. 0.1% per 1 aura power. req 300 stam / cons 25% stamina
const int StExt_AuraIndex_Archmage = 45;		// Add range rune damage. 0.1% per 1 aura power. req 300 mp / cons 25% mp
const int StExt_AuraIndex_EthernalSkin = 46;	// Add magic protection - 1 per 2 aura power. req 300 mp / cons 25% mana
const int StExt_AuraIndex_Strurdy = 47;			// Add fly protection - 1 per 2 aura power. req 300 stam / 500 hp / cons 20% stam
const int StExt_AuraIndex_DeathFog = 48;		// On hit get - cast death fog and deal 2 magic dmg per 1 aura power. req 400 int / 600mp / cons 25% mana  
const int StExt_AuraIndex_CursedLands = 49;		// On hit get - cast dark wave and deal 1 magic dot dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Blizzard = 50;		// On hit get - cast ice wave and deal 1 magic dmg per 1 aura power and freeze targets(chance). req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Thunderstorm = 51;	// On hit get - cast electric wave and deal 2 magic dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Miazma = 52;			// On hit get - cast poision wave and deal 1 magic dot dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Roots = 53;			// On hit get - cast poision wave and deal 1 magic dot dmg per 1 aura power and root enemies(chance). req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Inferno = 54;			// On hit get - cast fire wave and deal 1 fire dot dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Earthquake = 55;		// On hit get - cast earth quake and deal 3 blunt dmg per 1 aura power and stun (chance) target. req 400 int / 600mp / cons 25% mana
const int StExt_AuraIndex_Preparation = 56;		// On hit get - become immortal for short time. req 500 stam / 1000 hp / cons 25% stamina
const int StExt_AuraIndex_AutoFireBall = 57;
const int StExt_AuraIndex_AutoIcelance = 58;
const int StExt_AuraIndex_AutoDarkBall = 59;
const int StExt_AuraIndex_AutoDeathBall = 60;
const int StExt_AuraIndex_AutoLighting = 61;
const int StExt_AuraIndex_AutoAirFist = 62;
const int StExt_AuraIndex_AutoPoisionBall = 63;
const int StExt_AuraIndex_AutoStonedBolt = 64;
const int StExt_AuraIndex_ShadowWarrior = 65;
const int StExt_AuraIndex_Duration = 66;
const int StExt_AuraIndex_ShamanMasteryPower = 67;
const int StExt_AuraIndex_NecroMasteryPower = 68;
const int StExt_AuraIndex_GolemMasteryPower = 69;
const int StExt_AuraIndex_DemonMasteryPower = 70;
const int StExt_AuraIndex_DeathMasteryPower = 71;
const int StExt_AuraIndex_LifeMasteryPower = 72;
const int StExt_AuraIndex_LightMasteryPower = 73;
const int StExt_AuraIndex_DarkMasteryPower = 74;
const int StExt_AuraIndex_ElectricMasteryPower = 75;
const int StExt_AuraIndex_AirMasteryPower = 76;
const int StExt_AuraIndex_EarthMasteryPower = 77;
const int StExt_AuraIndex_IceMasteryPower = 78;
const int StExt_AuraIndex_FireMasteryPower = 79;
const int StExt_AuraIndex_1hMastery = 80;
const int StExt_AuraIndex_2hMastery = 81;
const int StExt_AuraIndex_BowMastery = 82;
const int StExt_AuraIndex_CBowMastery = 83;
const int StExt_AuraIndex_WeaponThrower = 84;
const int StExt_AuraIndex_DualMastery = 85;
const int StExt_AuraIndex_ReflectDamageAsBlunt = 86;
const int StExt_AuraIndex_ReflectDamageAsEdge = 87;
const int StExt_AuraIndex_ReflectDamageAsPoint = 88;
const int StExt_AuraIndex_ReflectDamageAsFire = 89;
const int StExt_AuraIndex_ReflectDamageAsFly = 90;
const int StExt_AuraIndex_ReflectDamageAsMagic = 91;
const int StExt_AuraIndex_ReflectDamageAsPoision = 92;

//===================================================================//
//							Magic infusion							 //
//===================================================================//
const int StExt_MagicInfusionAffix_Max = 200;
const int StExt_MagicInfusionPreffix_Max = 200;
const int StExt_MagicInfusionSuffix_Max = 222;
const int StExt_MagicInfusion_TierIndex_Common = 0;
const int StExt_MagicInfusion_TierIndex_Uncommon = 1;
const int StExt_MagicInfusion_TierIndex_Magic = 2;
const int StExt_MagicInfusion_TierIndex_Rare = 3;
const int StExt_MagicInfusion_TierIndex_Legend = 4;
const int StExt_MagicInfusion_TierIndex_Unique = 5;
const int StExt_MagicInfusion_VisualEffectsMax = 18;

const string StExt_MagicInfusion_VisualEffects[StExt_MagicInfusion_VisualEffectsMax] =
{
	"spellfx_light_smoke",
	"spellfx_fires_smoke",
	"spellfx_snow_smoke",
	"spellfx_stonesphere",
	"spellfx_magic_smoke",
	"spellfx_swampdragon",
	"spellfx_warcandle",
	"spellfx_firebow",
	"spellfx_crossbow",
	"spellfx_enchant_ice",
	"spellfx_watersphere",
	"spellfx_fireswordblack",
	"spellfx_evillight",
	"spellfx_moon_smoke",
	"spellfx_firearmor",
	"spellfx_sand_smoke",
	"spellfx_redflame_smoke_full",
	"spellfx_fog_smoke"
};

const int StExt_Npc_MaxNpcAbilities = 10;
const int StExt_Npc_Ability_Index_Max = 277;

const int StExt_NpcAbility_Type_None = 0;
const int StExt_NpcAbility_Type_Passive = 1;
const int StExt_NpcAbility_Type_Spell = 2;
const int StExt_NpcAbility_Type_Throw = 4;
const int StExt_NpcAbility_Type_Debuff = 8;
const int StExt_NpcAbility_Type_Buff = 16;
const int StExt_NpcAbility_Type_Summon = 32;

const int StExt_NpcAbility_Flag_None = 0;
const int StExt_NpcAbility_Flag_OnTick = 1;
const int StExt_NpcAbility_Flag_OnCast = 2;
const int StExt_NpcAbility_Flag_OnOffense = 4;
const int StExt_NpcAbility_Flag_OnDeffense = 8;
const int StExt_NpcAbility_Flag_OnDeath = 16;
const int StExt_NpcAbility_Flag_Target = 32;
const int StExt_NpcAbility_Flag_Aoe = 64;
const int StExt_NpcAbility_Flag_UseSummonPack = 128;
const int StExt_NpcAbility_Flag_UseDistance = 256;
const int StExt_NpcAbility_Flag_UseCooldown = 512;
const int StExt_NpcAbility_Flag_UseSpell = 1024;
const int StExt_NpcAbility_Flag_UseChance = 2048;

const int StExt_NpcAbility_Event_OnTick = 1;
const int StExt_NpcAbility_Event_OnCastAbility = 2;
const int StExt_NpcAbility_Event_OnOffence = 4;
const int StExt_NpcAbility_Event_OnDeffence = 8;
const int StExt_NpcAbility_Event_OnDeath = 16;

const int StExt_NpcAbility_SummonPlaceholder_RandUndead = -2;
const int StExt_NpcAbility_SummonPlaceholder_RandAnimal = -3;
const int StExt_NpcAbility_SummonPlaceholder_RandGolem = -4;
const int StExt_NpcAbility_SummonPlaceholder_RandBug = -5;
const int StExt_NpcAbility_SummonPlaceholder_RandGoblin = -6;

const int StExt_Npc_Spell_DistMin = 550;
const int StExt_Npc_Ability_DistMin = 200;
const int StExt_Npc_Ability_DistMax = 2800;
const int StExt_Npc_Ability_RadiusMax = 1200;

const int StExt_NpcAbility_Projectile_MinRange = 300;
const int StExt_NpcAbility_Projectile_MaxRange = 1800;
const int StExt_NpcAbility_Projectile_Cooldown = 120;
const int StExt_NpcAbility_Projectile_LowDamage = 50;
const int StExt_NpcAbility_Projectile_MedDamage = 125;
const int StExt_NpcAbility_Projectile_TopDamage = 250;
const int StExt_NpcAbility_Projectile_UltDamage = 500;

const int StExt_NpcAbility_Blink_Cooldown = 600;

const int StExt_NpcAbility_Throw_MinRange = 200;
const int StExt_NpcAbility_Throw_MaxRange = 1500;
const int StExt_NpcAbility_Throw_Cooldown = 120;
const int StExt_NpcAbility_Throw_Damage = 50;

const int StExt_NpcAbility_Aoe_MinRange = 0;
const int StExt_NpcAbility_Aoe_MaxRange = 750;
const int StExt_NpcAbility_Aoe_Cooldown = 1800;
const int StExt_NpcAbility_Aoe_Damage = 50;

const int StExt_NpcAbility_Buff_Cooldown = 3600;
const int StExt_NpcAbility_OnDeffence_Aoe_Damage = 15;
const int StExt_NpcAbility_OnDeffence_Aoe_Cooldown = 600;
const int StExt_NpcAbility_OnOffence_Aoe_Damage = 15;
const int StExt_NpcAbility_OnDeath_Aoe_Damage = 100;
const int StExt_NpcAbility_OnTick_Aoe_Damage = 5;

const int StExt_NpcAbility_Summon_Cooldown = 18000;

// *** Food controller constants ***
const int StExt_FoodPatch_FoodEffectResetDays = 7;
const int StExt_FoodPatch_FoodEffectDurationMult = 15;


// *** World randomizer constants ***
const int StExt_WorldRandomizer_MaxSlots = 3;

const int StExt_WorldRandomizer_NpcMinPowerCap = 675;
const int StExt_WorldRandomizer_NpcMaxPowerCap = 1250;

const int StExt_WorldRandomizer_RandomBandit_MaxPower = 9999;

const int StExt_WorldRandomizer_RandomBanditType_Default = 0;
const int StExt_WorldRandomizer_RandomBanditType_Warrior = 1;
const int StExt_WorldRandomizer_RandomBanditType_Ranger = 2;
const int StExt_WorldRandomizer_RandomBanditType_Mage = 3;
const int StExt_WorldRandomizer_RandomBanditType_Max = 4;

const int StExt_WorldRandomizer_RandomBanditMaxNameIndex = 20;
const int StExt_WorldRandomizer_RandomBanditNameOffset = 5;

const int StExt_WorldRandomizer_RandomBanditMaxWeaponPower = 1000;
const int StExt_WorldRandomizer_RandomBanditRunesMax = 18;
const int StExt_WorldRandomizer_RandomBanditRunes[StExt_WorldRandomizer_RandomBanditRunesMax] = 
{
	spl_firebolt, spl_icebolt, spl_zap,	spl_dot_second,	spl_dot_first, spl_darkball, spl_darkspear,
	spl_deathball, spl_deathbolt, spl_waterfist, spl_acid, spl_greententacle, spl_lacerate,	spl_instantfireball,
	spl_lightningflash,	spl_chargezap, spl_icelance, spl_stonefirst
};

const string StExt_RandNpc_HeadMesh_MN[3] = { "Hum_Head_Pony", "Hum_Head_Thief", "Hum_Head_Fighter" };
const string StExt_RandNpc_HeadMesh_MB[3] = { "Hum_Head_Bald", "Hum_Head_FatBald", "Hum_Head_Psionic" };

const int StExt_RandNpc_BodyTex_Max = 4;
const int StExt_RandNpc_BodyTex_M[StExt_RandNpc_BodyTex_Max] = { bodytex_p, bodytex_n, bodytex_l, bodytex_b };
const int StExt_RandNpc_BodyTex_F[StExt_RandNpc_BodyTex_Max] = { bodytexbabe_p, bodytexbabe_n, bodytexbabe_f, bodytexbabe_s };

const int StExt_RandNpc_FaceTex_M_HN[85] = 
{
	face_npc_trigo, face_npc_arenatavern, face_main_vampire, face_n_zahr, face_n_weak_herek, face_n_weak05, face_n_weak_orry,
	face_n_weak_asghan, face_n_weak_markus_kark, face_n_weak_cipher_alt, face_n_normalbart_swiney, face_n_weak12, face_n_weak_ulbert,
	face_n_normalbart16, face_n_normalbart17, face_n_normalbart_huno, face_n_normalbart_grim, face_n_normalbart20, face_n_normalbart21,
	face_n_normalbart22, face_n_normalbart05, face_n_normalbart06, face_n_normalbart_senyan, face_n_normalbart08, face_n_normalbart09,
	face_n_normalbart10, face_n_normalbart11, face_n_normalbart12, face_n_normalbart_dexter, face_n_normalbart_graham, face_n_normal_sly,
	face_n_normal16, face_n_normal17, face_n_normal18, face_n_normal19, face_n_normal20, face_n_normalbart01, face_n_normalbart02,
	face_n_normalbart03, face_n_normalbart04, face_n_normal14, face_n_normal08, face_n_normal_blade, face_n_normal07, face_n_normal_erpresser,
	face_n_normal06, face_n_normal_stone, face_n_normal05, face_n_normal04, face_n_normal03, face_n_normal02, face_n_normal_olli_kahn,
	face_n_normal_cord, face_n_normal01, face_n_tough_okyl, face_n_toughbart01, face_p_normal_fletcher, face_p_normal03, face_p_normalbart01,
	face_p_normalbart_cronos, face_p_normalbart_nefarius, face_p_normalbart_riordian, face_p_oldman_gravo, face_p_weak_cutter, face_p_fregal,
	face_n_tough_lee_dhnlich, face_n_importantold, face_n_importantgrey, face_n_important_arto, face_p_tough_rodriguez, face_p_tough_torrez,
	face_p_tough_drago, face_p_gilbert, face_n_bartholo, face_n_snaf, face_n_mordrag, face_n_lefty, face_n_wolf, face_n_fingers, face_n_lee,
	face_n_mud, face_n_raven, face_n_milten, face_n_scar, face_n_coolpock
};

const int StExt_RandNpc_FaceTex_M_HB[26] = 
{
	face_n_falk, face_b_normal_sharky, face_b_normal01, face_b_normal_kirgo, face_b_tough_pacho, face_b_tough_silas, face_l_normalbart01,
	face_l_normalbart02, face_l_toughbald01, face_l_tough01, face_l_tough_santino, face_l_toughbart_quentin, face_l_jackal, face_l_diego,
	face_l_ian, face_b_cavalorn, face_n_mud, face_n_homer, face_n_cipher_neu, face_b_gorn, face_l_ratford, face_n_lares, face_n_bloodwyn,
	face_n_corristo, face_b_thorus, face_n_bullit
};

const int StExt_RandNpc_FaceTex_M_BN[39] = 
{
	face_n_oldbald_jeremiah, face_n_weak_baalnetbek, face_n_fortuno, face_n_idolorun, face_n_caine, face_n_sektant_2, face_n_harlok,
	face_n_talas, face_n_gornatot, face_n_idolnamib, face_n_idoltyon, face_n_idolparvez, face_n_templer_2, face_n_templer_3, face_n_templer_4,
	face_n_templer_5, face_n_kreol, face_n_sektant_4, face_n_sektant_5, face_n_idolcadar, face_n_idolkorgalom, face_n_gornavid, face_n_viran,
	face_n_templer_1, face_n_face_n_sektant_6, face_n_zahr, face_p_greg, face_n_pirat01, face_n_tough_skip, face_p_toughbald, face_p_normalbald,
	face_p_toughbald_nek, face_p_normal02, face_p_normal01, face_n_madpsi, face_p_lester, face_n_ricelord, face_n_richter, face_n_drax
};

const int StExt_RandNpc_FaceTex_M_BB[45] = 
{
	face_b_corangar, face_l_tough02, face_b_saturas, face_b_normal_orik, face_b_normal_kharim, face_l_normal_gornabar, face_n_idolorun,
	face_n_sektant_1, face_n_sektant_3, face_n_idolcadar, face_n_gornakosh, face_n_gornavid, face_n_viran, face_n_templer_1, face_n_face_n_sektant_6,
	face_assasin, face_masiaf_01, face_masiaf_02, face_masiaf_03, face_masiaf_04, face_prior_rage, face_prior_rock, face_prior_poison, face_masiaf_01_demon,
	face_masiaf_02_demon, face_n_falk, face_b_normal_sharky, face_b_normal01, face_b_normal_kirgo, face_b_tough_pacho, face_b_tough_silas, face_l_normalbart01,
	face_l_normalbart02, face_l_toughbald01, face_l_tough01, face_l_tough_santino, face_l_toughbart_quentin, face_l_scatty, face_n_whistler, face_n_madpsi,
	face_n_torlof, face_n_ricelord, face_n_richter, face_b_gorn, face_b_thorus
};

const int StExt_RandNpc_FaceTex_F[21] = 
{ 
	face_n_normal_spassvogel, facebabe_n_oldblonde, facebabe_n_whitecloth, facebabe_n_greycloth, facebabe_n_brown,
	facebabe_n_vlkblonde, facebabe_n_baublonde, facebabe_n_youngblonde, facebabe_p_midblonde, facebabe_n_blackhair,
	facebabe_n_blondie, facebabe_l_charlotte, facebabe_n_oldbrown, facebabe_n_anne, facebabe_n_hure, facebabe_n_lilo,
	facebabe_n_midbaublonde, face_n_horatio, face_n_abigeil, facebabe_l_charlotte2, face_l_normalbart_rufus
};

const string StExt_RandNpc_Armor_M_0[19] = 
{
	"itar_leather_npc", "itar_sekbed", "itar_bdt_m", "itar_bdt_h", "itar_sld_l", "itar_bdt_f", "itar_bdt_w",
	"itar_bdt_v", "itar_pir_l_addon", "itar_pir_m_addon", "itar_aborigen_clothes", "itar_aborigen_armor", "itar_poor",
	"itar_adventure", "itar_atilla", "itar_jesper", "itar_huntarmor_npc", "itar_huntarmor_m_npc", "itar_her_m"
};

const string StExt_RandNpc_Armor_M_1[22] = 
{
	"itar_leather_m", "itar_sld_l", "itar_sld_m", "itar_bdt_f", "itar_bdt_fs", "itar_bdt_h", "itar_bdt_w", "itar_bdt_v", "itar_ranger_addon", 
	"itar_pir_h_addon", "itar_pir_n_addon", "itar_djg_crawler", "itar_grd_l", "itar_bloodwyn_addon", "itar_thorus_addon", "itar_bloodwyn_armor",
	"itar_tpl_lst", "itar_tpl_l", "itar_prisonerghost", "itar_diego", "itar_diegoreal", "itar_stext_assasins_01"
};

const string StExt_RandNpc_Armor_M_2[27] = 
{
	"itar_leather_npc", "itar_leather_unick", "itar_bdt_m", "itar_bdt_h", "itar_sld_l", "itar_bdt_f", "itar_bdt_w", "itar_bdt_v",
	"itar_kil_l", "itar_kil_sl", "itar_asmal", "itar_ranger_addon", "itar_pir_l_addon", "itar_pir_m_addon", "itar_djg_crawler",
	"itar_adventure", "itar_atilla", "itar_jesper", "itar_huntarmor_npc", "itar_huntarmor_m_npc", "itar_huntarmor_h_npc", "itar_prisonerghost",
	"itar_diego", "itar_ramirez", "itar_her_n", "itar_assasins_03", "itar_assasins_04"
};

const string StExt_RandNpc_Armor_M_3[21] = 
{
	"itar_sekbed", "itar_lester", "itar_ndw_l", "itar_nov_l", "itar_ndm_l_npc", "itar_gur_l", "itar_kdw_l_addon", "itar_kdf_l",
	"itar_kdf_m_npc", "itar_kdf_m_new", "itar_dmt_l", "itar_summoner_1", "itar_darkmage_robe1", "itar_xardas_lowlevelnpc",
	"itar_dementor", "itar_mage", "itar_mage_teacher", "itar_mage_adrian", "itar_maya_priest", "itar_assasins_03", "itar_stext_assasins_02"
};

const string StExt_RandNpc_Armor_F_0[21] = 
{
	"itar_priscilla", "itar_w2_ves", "ItAr_StExt_FEM_HERO", "ItAr_StExt_FEM_PRIS", "ItAr_StExt_FEM_Digger_M", "ItAr_StExt_FEM_Digger_L",
	"ItAr_StExt_FEM_Digger_L2", "ItAr_StExt_FEM_LEATHER_L", "ItAr_StExt_FEM_LEATHER", "ItAr_StExt_FEM_BDT_L", "ItAr_StExt_FEM_BDT_H", "ItAr_StExt_FEM_PIR",
	"ItAr_StExt_FEM_PIR_L", "ItAr_StExt_FEM_PIR_M", "ItAr_StExt_FEM_SLD_L", "ItAr_StExt_FEM_SLD_M", "ItAr_StExt_FEM_SEK_L", "ItAr_StExt_FEM_SEK_M",
	"ItAr_StExt_FEM_SECT_NOV_L", "ItAr_StExt_DJG_CRW_VEL", "ItAr_StExt_FEM_TPL_L"
};

const string StExt_RandNpc_Armor_F_1[23] = 
{
	"ItAr_StExt_FEM_STTL", "ItAr_StExt_FEM_STT_L", "ItAr_StExt_FEM_STTM", "ItAr_StExt_FEM_LEATHER", "ItAr_StExt_FEM_BDT_L",
	"ItAr_StExt_FEM_BDT_H", "ItAr_StExt_FEM_RANGER_L", "ItAr_StExt_FEM_RANGER_H", "ItAr_StExt_FEM_GRD_L", "ItAr_StExt_FEM_GRD_M", "ItAr_StExt_FEM_TPL_H",
	"ItAr_StExt_FEM_DJG_L", "ItAr_StExt_Armor_DJG_W_L", "ItAr_StExt_FEM_GRD_H", "ItAr_StExt_Armor_DJG_W_H", "ItAr_StExt_FEM_BARON", "ItAr_StExt_FEM_TPL_S",
	"ItAr_StExt_FEM_SLD_L", "ItAr_StExt_FEM_SLD_M", "ItAr_StExt_FEM_SLD_H", "ItAr_StExt_DJG_CRW_VEL", "ItAr_StExt_FEM_TPL_M", "ItAr_StExt_FEM_TPL_L"
};

const string StExt_RandNpc_Armor_F_2[20] = 
{
	"itar_priscilla", "itar_w2_ves", "ItAr_StExt_FEM_STTL", "ItAr_StExt_FEM_STT_L", "ItAr_StExt_FEM_LEATHER_L", "ItAr_StExt_FEM_LEATHER",
	"ItAr_StExt_FEM_BDT_L", "ItAr_StExt_FEM_BDT_H", "ItAr_StExt_FEM_RANGER_L", "ItAr_StExt_FEM_PIR", "ItAr_StExt_FEM_PIR_L", "ItAr_StExt_FEM_PIR_M",
	"ItAr_StExt_FEM_BARON", "ItAr_StExt_FEM_SLD_L", "ItAr_StExt_FEM_SLD_M", "ItAr_StExt_FEM_SLD_H", "ItAr_StExt_DJG_CRW_VEL", "ItAr_StExt_FEM_RANGER_H",
	"ItAr_StExt_FEM_DJG_L", "ItAr_StExt_FEM_TPL_L"
};

const string StExt_RandNpc_Armor_F_3[23] = 
{
	"itar_priscilla", "itar_w2_ves", "ItAr_StExt_FEM_KDW_N", "ItAr_StExt_FEM_KDF_N", "ItAr_StExt_FEM_KDM_N", "ItAr_StExt_FEM_KDF_L",
	"ItAr_StExt_FEM_KDW_L", "ItAr_StExt_FEM_KDM_L", "ItAr_StExt_FEM_KDF_H", "ItAr_StExt_FEM_KDF_SH", "ItAr_StExt_FEM_KDW_H", "ItAr_StExt_FEM_KDW_SH",
	"ItAr_StExt_FEM_KDM_H", "ItAr_StExt_FEM_KDM_SH", "ItAr_StExt_FEM_SEK_L", "ItAr_StExt_FEM_SEK_M", "ItAr_StExt_FEM_SECT_NOV_L", "ItAr_StExt_FEM_GUR_L",
	"ItAr_StExt_FEM_GUR_M", "ItAr_StExt_FEM_GUR_H", "ItAr_StExt_FEM_SECT_GUR_S", "ItAr_StExt_FEM_SECT_GUR_M", "ItAr_StExt_FEM_MAYAPRIEST"
};


// *** Item constants ***

const int wear_separator = 64;
const int wear_gloves 	 = 128;
const int wear_boots 	 = 256;
const int wear_pants 	 = 512;
const int wear_breast	 = 1024;
const int wear_earings   = 2048;
const int wear_braclets  = 4096;
const int wear_collar    = 8192;
const int wear_artifact  = 16384;
const int wear_pauldrons  = 32768;

const string StExt_WearSlot_Gloves = "StExt_Gear_128";
const string StExt_WearSlot_Boots = "StExt_Gear_256";
const string StExt_WearSlot_Pants = "StExt_Gear_512";
const string StExt_WearSlot_Torso = "StExt_Gear_1024";
const string StExt_WearSlot_Earings = "StExt_Gear_2048";
const string StExt_WearSlot_Collar = "StExt_Gear_8192";
const string StExt_WearSlot_Artifact = "StExt_Gear_16384";
const string StExt_WearSlot_Pauldrons = "StExt_Gear_32768";

const int StExt_ItemRankMax = 6;
const int StExt_ItemRankCommon = 0;
const int StExt_ItemRankUncommon = 1;
const int StExt_ItemRankRare = 2;
const int StExt_ItemRankUniq = 3;
const int StExt_ItemRankEpic = 4;
const int StExt_ItemRankLegendary = 5;


// Items classes Id definitions.
// Calculate them like
// (itemType << 16) | (itemClass << 8) | (itemSubClass)
// or simple calc expression: (T * 65536) + (C * 256) + S

const int StExt_ItemClass_None = 0;								//0x00000000
const int StExt_ItemClass_Error = (-1);							//0xFFFFFFFF

// -------------------------- Armors --------------------------
const int StExt_ItemClass_FullArmor_Clothing = 65793;			// 0x010101
const int StExt_ItemClass_FullArmor_LightArmor = 65794;			// 0x010102
const int StExt_ItemClass_FullArmor_MediumArmor = 65795;		// 0x010103
const int StExt_ItemClass_FullArmor_HeavyArmor = 65796;			// 0x010104

const int StExt_ItemClass_Helm_Hood = 66053;					// 0x010205
const int StExt_ItemClass_Helm_Circlet = 66054;					// 0x010206
const int StExt_ItemClass_Helm_LightHelm = 66055;				// 0x010207
const int StExt_ItemClass_Helm_MediumHelm = 66056;				// 0x010208
const int StExt_ItemClass_Helm_HeavyHelm = 66057;				// 0x010209

const int StExt_ItemClass_Torso_Clothing = 66305;				// 0x010301
const int StExt_ItemClass_Gloves_Clothing = 66817;				// 0x010501
const int StExt_ItemClass_Boots_Clothing = 67073;				// 0x010601
const int StExt_ItemClass_Pants_Clothing = 66561;				// 0x010401
const int StExt_ItemClass_Pauldrons_Clothing = 67329;			// 0x010701

const int StExt_ItemClass_Torso_Light = 66306;					// 0x010302
const int StExt_ItemClass_Gloves_Light = 66818;					// 0x010502
const int StExt_ItemClass_Boots_Light = 67074;					// 0x010602
const int StExt_ItemClass_Pants_Light = 66562;					// 0x010402
const int StExt_ItemClass_Pauldrons_Light = 67330;				// 0x010702

const int StExt_ItemClass_Torso_Medium = 66307;					// 0x010303
const int StExt_ItemClass_Gloves_Medium = 66819;				// 0x010503
const int StExt_ItemClass_Boots_Medium = 67075;					// 0x010603
const int StExt_ItemClass_Pants_Medium = 66563;					// 0x010403
const int StExt_ItemClass_Pauldrons_Medium = 67331;				// 0x010703

const int StExt_ItemClass_Torso_Heavy = 66308;					// 0x010304
const int StExt_ItemClass_Gloves_Heavy = 66820;					// 0x010504
const int StExt_ItemClass_Boots_Heavy = 67076;					// 0x010604
const int StExt_ItemClass_Pants_Heavy = 66564;					// 0x010404
const int StExt_ItemClass_Pauldrons_Heavy = 67332;				// 0x010704

const int StExt_ItemClass_Shield_LightShield = 67594;			// 0x01080A
const int StExt_ItemClass_Shield_HeavyShield = 67595;			// 0x01080B

// -------------------------- Jewelry --------------------------
const int StExt_ItemClass_Amulet_Warrior = 202033;				// 0x031531
const int StExt_ItemClass_Amulet_Mage = 202034;					// 0x031532
const int StExt_ItemClass_Amulet_Archer = 202035;				// 0x031533

const int StExt_ItemClass_Ring_Warrior = 202289;				// 0x031631
const int StExt_ItemClass_Ring_Mage = 202290;					// 0x031632
const int StExt_ItemClass_Ring_Archer = 202291;					// 0x031633

const int StExt_ItemClass_Belt_Warrior = 203057;				// 0x031931
const int StExt_ItemClass_Belt_Mage = 203058;					// 0x031932
const int StExt_ItemClass_Belt_Archer = 203059;					// 0x031933

const int StExt_ItemClass_Trophy = 203520;						// 0x031B00

// -------------------------- Melee Weapon --------------------------
const int StExt_ItemClass_MeeleWeapon_Sword1H = 133909;			// 0x020B15
const int StExt_ItemClass_MeeleWeapon_Axe1H = 133910;			// 0x020B16
const int StExt_ItemClass_MeeleWeapon_Mace1H = 133911;			// 0x020B17
const int StExt_ItemClass_MeeleWeapon_Dagger = 133912;			// 0x020B18
const int StExt_ItemClass_MeeleWeapon_Rapier = 133913;			// 0x020B19
const int StExt_ItemClass_MeeleWeapon_DexSword = 133914;		// 0x020B1A
const int StExt_ItemClass_MeeleWeapon_MagicSword = 133915;		// 0x020B1B
const int StExt_ItemClass_MeeleWeapon_Sword2H = 133916;			// 0x020B1C
const int StExt_ItemClass_MeeleWeapon_Mace2H = 133917;			// 0x020B1D
const int StExt_ItemClass_MeeleWeapon_Axe2H = 133918;			// 0x020B1E
const int StExt_ItemClass_MeeleWeapon_Staff = 133919;			// 0x020B1F
const int StExt_ItemClass_MeeleWeapon_Spear = 133920;			// 0x020B20
const int StExt_ItemClass_MeeleWeapon_Halleberd = 133921;		// 0x020B21
const int StExt_ItemClass_MeeleWeapon_OrcWeapon = 133922;		// 0x020B22
const int StExt_ItemClass_MeeleWeapon_DualL = 133923;			// 0x020B23
const int StExt_ItemClass_MeeleWeapon_DualR = 133924;			// 0x020B24
const int StExt_ItemClass_MeeleWeapon_FistWeapon = 133925;		// 0x020B25

// ---------------------- Range Weapon ----------------------
const int StExt_ItemClass_RangeWeapon_LightBow = 134186;		// 0x020C2A
const int StExt_ItemClass_RangeWeapon_HeavyBow = 134187;		// 0x020C2B
const int StExt_ItemClass_RangeWeapon_LightCrossBow = 134188;	// 0x020C2C
const int StExt_ItemClass_RangeWeapon_HeavyCrossBow = 134189;	// 0x020C2D

// ---------------------- Cast Weapon ----------------------
const int StExt_ItemClass_CastWeapon_Rune = 134447;				// 0x020D2F
const int StExt_ItemClass_CastWeapon_Scroll = 134446;			// 0x020D2E
const int StExt_ItemClass_CastWeapon_Wand = 134448;				// 0x020D30‬

// ---------------------- Consumable ----------------------
const int StExt_ItemClass_Consumable_Potion = 270080;			// 0x041F00
const int StExt_ItemClass_Consumable_Scroll = 270336;			// 0x042000
const int StExt_ItemClass_Consumable_Food = 270592;				// 0x042100

// ---------------------- Munition ----------------------
const int StExt_ItemClass_Munition = 327680;					// 0x050000


// ---------------------- Classes lists ----------------------

const int StExt_ItemClass_List_AnyArmor[23] = 
{
	StExt_ItemClass_Helm_Hood, StExt_ItemClass_Helm_Circlet, StExt_ItemClass_Helm_LightHelm, StExt_ItemClass_Helm_MediumHelm, StExt_ItemClass_Helm_HeavyHelm,
	StExt_ItemClass_Torso_Clothing, StExt_ItemClass_Gloves_Clothing, StExt_ItemClass_Boots_Clothing, StExt_ItemClass_Pants_Clothing,
	StExt_ItemClass_Torso_Light, StExt_ItemClass_Gloves_Light, StExt_ItemClass_Boots_Light, StExt_ItemClass_Pants_Light,
	StExt_ItemClass_Torso_Medium, StExt_ItemClass_Gloves_Medium, StExt_ItemClass_Boots_Medium, StExt_ItemClass_Pants_Medium, 
	StExt_ItemClass_Torso_Heavy, StExt_ItemClass_Gloves_Heavy, StExt_ItemClass_Boots_Heavy, StExt_ItemClass_Pants_Heavy,
	StExt_ItemClass_Shield_LightShield, StExt_ItemClass_Shield_HeavyShield
};

const int StExt_ItemClass_List_AnyChestArmor[27] = 
{
	StExt_ItemClass_FullArmor_Clothing, StExt_ItemClass_FullArmor_LightArmor, StExt_ItemClass_FullArmor_MediumArmor, StExt_ItemClass_FullArmor_HeavyArmor,
	StExt_ItemClass_Helm_Hood, StExt_ItemClass_Helm_Circlet, StExt_ItemClass_Helm_LightHelm, StExt_ItemClass_Helm_MediumHelm, StExt_ItemClass_Helm_HeavyHelm,
	StExt_ItemClass_Torso_Clothing, StExt_ItemClass_Gloves_Clothing, StExt_ItemClass_Boots_Clothing, StExt_ItemClass_Pants_Clothing,
	StExt_ItemClass_Torso_Light, StExt_ItemClass_Gloves_Light, StExt_ItemClass_Boots_Light, StExt_ItemClass_Pants_Light,
	StExt_ItemClass_Torso_Medium, StExt_ItemClass_Gloves_Medium, StExt_ItemClass_Boots_Medium, StExt_ItemClass_Pants_Medium, 
	StExt_ItemClass_Torso_Heavy, StExt_ItemClass_Gloves_Heavy, StExt_ItemClass_Boots_Heavy, StExt_ItemClass_Pants_Heavy,
	StExt_ItemClass_Shield_LightShield, StExt_ItemClass_Shield_HeavyShield
};

const int StExt_ItemClass_List_FullArmor[4] = { StExt_ItemClass_FullArmor_Clothing, StExt_ItemClass_FullArmor_LightArmor, StExt_ItemClass_FullArmor_MediumArmor, StExt_ItemClass_FullArmor_HeavyArmor };
const int StExt_ItemClass_List_Helm[5] = { StExt_ItemClass_Helm_Hood, StExt_ItemClass_Helm_Circlet, StExt_ItemClass_Helm_LightHelm, StExt_ItemClass_Helm_MediumHelm, StExt_ItemClass_Helm_HeavyHelm };
const int StExt_ItemClass_List_Torso[4] = { StExt_ItemClass_Torso_Clothing, StExt_ItemClass_Torso_Light, StExt_ItemClass_Torso_Medium, StExt_ItemClass_Torso_Heavy };
const int StExt_ItemClass_List_Pants[4] = { StExt_ItemClass_Pants_Clothing, StExt_ItemClass_Pants_Light, StExt_ItemClass_Pants_Medium, StExt_ItemClass_Pants_Heavy };
const int StExt_ItemClass_List_Boots[4] = { StExt_ItemClass_Boots_Clothing, StExt_ItemClass_Boots_Light, StExt_ItemClass_Boots_Medium, StExt_ItemClass_Boots_Heavy };
const int StExt_ItemClass_List_Gloves[4] = { StExt_ItemClass_Gloves_Clothing, StExt_ItemClass_Gloves_Light, StExt_ItemClass_Gloves_Medium, StExt_ItemClass_Gloves_Heavy };
const int StExt_ItemClass_List_Shield[2] = { StExt_ItemClass_Shield_LightShield, StExt_ItemClass_Shield_HeavyShield };


const int StExt_ItemClass_List_Jewelry[9] = 
{
	StExt_ItemClass_Amulet_Warrior, StExt_ItemClass_Amulet_Mage, StExt_ItemClass_Amulet_Archer,
	StExt_ItemClass_Ring_Warrior, StExt_ItemClass_Ring_Mage, StExt_ItemClass_Ring_Archer,
	StExt_ItemClass_Belt_Warrior, StExt_ItemClass_Belt_Mage, StExt_ItemClass_Belt_Archer
};
const int StExt_ItemClass_List_Amulet[3] = { StExt_ItemClass_Amulet_Warrior, StExt_ItemClass_Amulet_Mage, StExt_ItemClass_Amulet_Archer };
const int StExt_ItemClass_List_Ring[3] = { StExt_ItemClass_Ring_Warrior, StExt_ItemClass_Ring_Mage, StExt_ItemClass_Ring_Archer };
const int StExt_ItemClass_List_Belt[3] = { StExt_ItemClass_Belt_Warrior, StExt_ItemClass_Belt_Mage, StExt_ItemClass_Belt_Archer };


const int StExt_ItemClass_List_AnyWeapon[20] = 
{
	StExt_ItemClass_MeeleWeapon_Sword1H, StExt_ItemClass_MeeleWeapon_Axe1H, StExt_ItemClass_MeeleWeapon_Mace1H, StExt_ItemClass_MeeleWeapon_Dagger,
	StExt_ItemClass_MeeleWeapon_Rapier, StExt_ItemClass_MeeleWeapon_DexSword, StExt_ItemClass_MeeleWeapon_MagicSword, StExt_ItemClass_MeeleWeapon_Sword2H,
	StExt_ItemClass_MeeleWeapon_Mace2H, StExt_ItemClass_MeeleWeapon_Axe2H, StExt_ItemClass_MeeleWeapon_Staff, StExt_ItemClass_MeeleWeapon_Spear,
	StExt_ItemClass_MeeleWeapon_Halleberd, StExt_ItemClass_MeeleWeapon_OrcWeapon, StExt_ItemClass_MeeleWeapon_DualL, StExt_ItemClass_MeeleWeapon_DualR,
	StExt_ItemClass_RangeWeapon_LightBow, StExt_ItemClass_RangeWeapon_HeavyBow, StExt_ItemClass_RangeWeapon_LightCrossBow, StExt_ItemClass_RangeWeapon_HeavyCrossBow
};

const int StExt_ItemClass_List_MeleeWeapon[16] = 
{
	StExt_ItemClass_MeeleWeapon_Sword1H, StExt_ItemClass_MeeleWeapon_Axe1H, StExt_ItemClass_MeeleWeapon_Mace1H, StExt_ItemClass_MeeleWeapon_Dagger,
	StExt_ItemClass_MeeleWeapon_Rapier, StExt_ItemClass_MeeleWeapon_DexSword, StExt_ItemClass_MeeleWeapon_MagicSword, StExt_ItemClass_MeeleWeapon_Sword2H,
	StExt_ItemClass_MeeleWeapon_Mace2H, StExt_ItemClass_MeeleWeapon_Axe2H, StExt_ItemClass_MeeleWeapon_Staff, StExt_ItemClass_MeeleWeapon_Spear,
	StExt_ItemClass_MeeleWeapon_Halleberd, StExt_ItemClass_MeeleWeapon_OrcWeapon, StExt_ItemClass_MeeleWeapon_DualL, StExt_ItemClass_MeeleWeapon_DualR
};
const int StExt_ItemClass_List_RangeWeapon[4] = { StExt_ItemClass_RangeWeapon_LightBow, StExt_ItemClass_RangeWeapon_HeavyBow, StExt_ItemClass_RangeWeapon_LightCrossBow, StExt_ItemClass_RangeWeapon_HeavyCrossBow };
const int StExt_ItemClass_List_MagicWeapon[2] = { StExt_ItemClass_MeeleWeapon_Staff, StExt_ItemClass_MeeleWeapon_MagicSword };

const int StExt_ItemClass_List_1hWeapon[6] = 
{
	StExt_ItemClass_MeeleWeapon_Sword1H, StExt_ItemClass_MeeleWeapon_Axe1H, StExt_ItemClass_MeeleWeapon_Mace1H, 
	StExt_ItemClass_MeeleWeapon_Dagger,	StExt_ItemClass_MeeleWeapon_Rapier, StExt_ItemClass_MeeleWeapon_DexSword
};
const int StExt_ItemClass_List_2hWeapon[5] = 
{
	StExt_ItemClass_MeeleWeapon_Sword2H, StExt_ItemClass_MeeleWeapon_Mace2H, StExt_ItemClass_MeeleWeapon_Axe2H, 
	StExt_ItemClass_MeeleWeapon_Spear, StExt_ItemClass_MeeleWeapon_Halleberd
};
const int StExt_ItemClass_List_BowWeapon[2] = { StExt_ItemClass_RangeWeapon_LightBow, StExt_ItemClass_RangeWeapon_HeavyBow };
const int StExt_ItemClass_List_CBowWeapon[2] = { StExt_ItemClass_RangeWeapon_LightCrossBow, StExt_ItemClass_RangeWeapon_HeavyCrossBow };
const int StExt_ItemClass_List_Sword1H[2] = { StExt_ItemClass_MeeleWeapon_Sword1H, StExt_ItemClass_MeeleWeapon_Sword1H };
const int StExt_ItemClass_List_Axe1H[2] = { StExt_ItemClass_MeeleWeapon_Axe1H, StExt_ItemClass_MeeleWeapon_Axe1H };
const int StExt_ItemClass_List_Mace1H[2] = { StExt_ItemClass_MeeleWeapon_Mace1H, StExt_ItemClass_MeeleWeapon_Mace1H };
const int StExt_ItemClass_List_Rapier[2] = { StExt_ItemClass_MeeleWeapon_Rapier, StExt_ItemClass_MeeleWeapon_Rapier };
const int StExt_ItemClass_List_DexSword[2] = { StExt_ItemClass_MeeleWeapon_DexSword, StExt_ItemClass_MeeleWeapon_DexSword };
const int StExt_ItemClass_List_MagicSword[2] = { StExt_ItemClass_MeeleWeapon_MagicSword, StExt_ItemClass_MeeleWeapon_MagicSword };
const int StExt_ItemClass_List_Sword2H[2] = { StExt_ItemClass_MeeleWeapon_Sword2H, StExt_ItemClass_MeeleWeapon_Sword2H };
const int StExt_ItemClass_List_Mace2H[2] = { StExt_ItemClass_MeeleWeapon_Mace2H, StExt_ItemClass_MeeleWeapon_Mace2H };
const int StExt_ItemClass_List_Axe2H[2] = { StExt_ItemClass_MeeleWeapon_Axe2H, StExt_ItemClass_MeeleWeapon_Axe2H };
const int StExt_ItemClass_List_Staff[2] = { StExt_ItemClass_MeeleWeapon_Staff, StExt_ItemClass_MeeleWeapon_Staff };
const int StExt_ItemClass_List_Spear[2] = { StExt_ItemClass_MeeleWeapon_Spear, StExt_ItemClass_MeeleWeapon_Spear };
const int StExt_ItemClass_List_Halleberd[2] = { StExt_ItemClass_MeeleWeapon_Halleberd, StExt_ItemClass_MeeleWeapon_Halleberd };
const int StExt_ItemClass_List_Dual[2] = { StExt_ItemClass_MeeleWeapon_DualL, StExt_ItemClass_MeeleWeapon_DualR };


const int StExt_ExtraItemsDisplayMode_UnderArmor = 0;		// Overlay extra items by armor
const int StExt_ExtraItemsDisplayMode_None = 1;				// Never display such items
const int StExt_ExtraItemsDisplayMode_OverlayArmor = 2;		// Hide original armor and display only such items
const int StExt_ExtraItemsDisplayMode_Always = 3;			// Displa this items anyway

const int StExt_CorruptionBonus_Max = 6;
const int StExt_CorruptionBonus_Hp = 0;
const int StExt_CorruptionBonus_Mp = 1;
const int StExt_CorruptionBonus_Int = 2;
const int StExt_CorruptionBonus_Str = 3;
const int StExt_CorruptionBonus_Agi = 4;
const int StExt_CorruptionBonus_Dodge = 5;

const int StExt_ShivaTrade_EnchantmentSellPriceMult = 10;
const int StExt_ShivaTrade_IdentificationPrice = 100;

const int StExt_ShivaTradeIndex_Max = 14;
const int StExt_ShivaTradeIndex_Repeating = 0;
const int StExt_ShivaTradeIndex_Kap1 = 1;
const int StExt_ShivaTradeIndex_Kap2 = 2;
const int StExt_ShivaTradeIndex_Kap3 = 3;
const int StExt_ShivaTradeIndex_Kap4 = 4;
const int StExt_ShivaTradeIndex_Kap5 = 5;
const int StExt_ShivaTradeIndex_Kap6 = 6;
const int StExt_ShivaTradeIndex_Kap7 = 7;
const int StExt_ShivaTradeIndex_Boss1 = 8;
const int StExt_ShivaTradeIndex_Boss2 = 9;
const int StExt_ShivaTradeIndex_Boss3 = 10;
const int StExt_ShivaTradeIndex_Boss4 = 11;
const int StExt_ShivaTradeIndex_Boss5 = 12;
const int StExt_ShivaTradeIndex_First = 13;

const int StExt_BeastsBonusIndex_Max = 56;
const int StExt_BeastsBonusIndex_Gobbo = 0;
const int StExt_BeastsBonusIndex_Scavanger = 1;
const int StExt_BeastsBonusIndex_Wolf = 2;
const int StExt_BeastsBonusIndex_Snapper = 3;
const int StExt_BeastsBonusIndex_Shadowbeast = 4;
const int StExt_BeastsBonusIndex_Alligator = 5;
const int StExt_BeastsBonusIndex_Blatcrawler = 6;
const int StExt_BeastsBonusIndex_Bloodhound = 7;
const int StExt_BeastsBonusIndex_GobboBlack = 8;
const int StExt_BeastsBonusIndex_IceWolf = 9;
const int StExt_BeastsBonusIndex_Keiler = 10;
const int StExt_BeastsBonusIndex_Zombie = 11;
const int StExt_BeastsBonusIndex_Orcbiter = 12;
const int StExt_BeastsBonusIndex_Razor = 13;
const int StExt_BeastsBonusIndex_Ghost = 14;
const int StExt_BeastsBonusIndex_StoneGuardian = 15;
const int StExt_BeastsBonusIndex_StonePuma = 16;
const int StExt_BeastsBonusIndex_SwampDrone = 17;
const int StExt_BeastsBonusIndex_SwampGolem = 18;
const int StExt_BeastsBonusIndex_BloodFly = 19;
const int StExt_BeastsBonusIndex_Demon = 20;
const int StExt_BeastsBonusIndex_Draconian = 21;
const int StExt_BeastsBonusIndex_Dragon = 22;
const int StExt_BeastsBonusIndex_DragonSnapper = 23;
const int StExt_BeastsBonusIndex_FireGolem = 24;
const int StExt_BeastsBonusIndex_FireWaran = 25;
const int StExt_BeastsBonusIndex_GiantBug = 26;
const int StExt_BeastsBonusIndex_GobboMage = 27;
const int StExt_BeastsBonusIndex_Harpy = 28;
const int StExt_BeastsBonusIndex_IceGolem = 29;
const int StExt_BeastsBonusIndex_Lurker = 30;
const int StExt_BeastsBonusIndex_MineCrawler = 31;
const int StExt_BeastsBonusIndex_Spider = 32;
const int StExt_BeastsBonusIndex_MineCrawlerWarrior = 33;
const int StExt_BeastsBonusIndex_OreBug = 34;
const int StExt_BeastsBonusIndex_Molerat = 35;
const int StExt_BeastsBonusIndex_SkeletonMage = 36;
const int StExt_BeastsBonusIndex_StoneGolem = 37;
const int StExt_BeastsBonusIndex_SwampShark = 38;
const int StExt_BeastsBonusIndex_Troll = 39;
const int StExt_BeastsBonusIndex_Ogre = 40;
const int StExt_BeastsBonusIndex_TrollBlack = 41;
const int StExt_BeastsBonusIndex_Warg = 42;
const int StExt_BeastsBonusIndex_Skeleton = 43;
const int StExt_BeastsBonusIndex_OrcWarrior = 44;
const int StExt_BeastsBonusIndex_SkeletonLord = 45;
const int StExt_BeastsBonusIndex_SkeletonPriest = 46;
const int StExt_BeastsBonusIndex_DarkGuard = 47;
const int StExt_BeastsBonusIndex_Waran = 48;
const int StExt_BeastsBonusIndex_OrcElite = 49;
const int StExt_BeastsBonusIndex_OrcShaman = 50;
const int StExt_BeastsBonusIndex_UndeadOrc = 51;
const int StExt_BeastsBonusIndex_SwampRat = 52;
const int StExt_BeastsBonusIndex_ScavangerDemon = 53;
const int StExt_BeastsBonusIndex_GiantRat = 54;
const int StExt_BeastsBonusIndex_SandGolem = 55;

const int StExt_ProfessionIndex_Scrollmaking = 0;
const int StExt_ProfessionIndex_Alchemy = 1;
const int StExt_ProfessionIndex_Enchantment = 2;
const int StExt_ProfessionIndex_Max = 3;

const int StExt_ScrollmakingSkillIndex_Max = 16;

const int StExt_Scrollmaking_SkillCost[StExt_ScrollmakingSkillIndex_Max] = 
{
	1000,	3000,	7500,	7500,
	3000,	3000,	3000,	3000,
	3000,	3000,	3000,	3000,
	3000,	3000,	3000,	3000
};

//==========================================================================
// 							Time controller flags
//==========================================================================

const int StExt_TimeBindingFlag_None = 0;			// Any time
const int StExt_TimeBindingFlag_Midnight = 1;		// 0000 - 0400			
const int StExt_TimeBindingFlag_Dawn = 2;			// 0400 - 0800
const int StExt_TimeBindingFlag_Morning = 4;		// 0600 - 1000
const int StExt_TimeBindingFlag_Noon = 8;			// 1000 - 1400
const int StExt_TimeBindingFlag_Afternoon = 16;		// 1400 - 1800
const int StExt_TimeBindingFlag_Dusk = 32;			// 1800 - 2000
const int StExt_TimeBindingFlag_Evening = 64;		// 2000 - 0000

const int StExt_TimeBindingFlag_DayTime = StExt_TimeBindingFlag_Morning | StExt_TimeBindingFlag_Noon | StExt_TimeBindingFlag_Afternoon | StExt_TimeBindingFlag_Dusk;
const int StExt_TimeBindingFlag_NightTime = StExt_TimeBindingFlag_Evening | StExt_TimeBindingFlag_Midnight | StExt_TimeBindingFlag_Dawn;
const int StExt_TimeBindingFlag_Sunrise = StExt_TimeBindingFlag_Dawn | StExt_TimeBindingFlag_Morning;
const int StExt_TimeBindingFlag_Sunset = StExt_TimeBindingFlag_Dusk | StExt_TimeBindingFlag_Evening;


const int StExt_ConsumePerm_Max = 41;
const string StExt_ConsumePerm_List[StExt_ConsumePerm_Max] = 
{
	"itpo_perm_str",
	"itpo_perm_str_start",
	"itpo_perm_dex",
	"itpo_perm_dex_start",
	"itpo_perm_health",
	"itpo_perm_health_craft",
	"itpo_perm_mana",
	"itpo_perm_mana_start",
	"itpo_perm_mana_craft",
	"itpo_perm_manarit",
	"itpo_amunsu",
	"itpo_perm_stamina",
	"itpo_perm_def",
	"itpo_perm_def_stonnos",
	"itpo_megadrink",
	"itpo_eligorfire",
	"itpo_waterfire",
	"itpo_megapotionskill",
	"itpo_magdefence",
	"itpo_intellect",
	"itpo_firedefence",
	"itpo_perm_dex_super",
	"itpo_ancientpotion",
	"itpo_dragonmind_epic",
	"itpo_demonblood",
	"itpo_soulpotion",
	"itpo_np_stats",
	"itfo_specwine_hp",
	"itfo_ealbalzam",
	"itfo_ealbalzamtwo",
	"itfo_pottage_mushroom",
	"itfo_pottage_mushroom_black",
	"itfo_compote_00",
	"itfo_compote_01",
	"itfo_cake_apple",
	"itfo_cake_meat",
	"itfo_cake_mushroom",
	"itfo_cake_fish",
	"itfo_cake_honey",
	"itfo_hildastew",
	"itfo_wine_gritta"
};
const int StExt_ConsumePerm_Batch_Max = 100;


const int StExt_ConfigCat_Index_Difficulty = 0;
const int StExt_ConfigCat_Index_Npc = 1;
const int StExt_ConfigCat_Index_Luck = 2;
const int StExt_ConfigCat_Index_WorldRandomization = 3;
const int StExt_ConfigCat_Index_Exp = 4;
const int StExt_ConfigCat_Index_Ui = 5;
const int StExt_ConfigCat_Index_Other = 6;

const int StExt_Value_DisplayType_Default = 0;
const int StExt_Value_DisplayType_Permille = 1;
const int StExt_Value_DisplayType_Bool = 2;
const int StExt_Value_DisplayType_Percent = 3;
const int StExt_Value_DisplayType_DeciPercent = 4;


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

//-------------------------------------------------------------
//							CRAFT
//-------------------------------------------------------------

const int StExt_ReceiptIndex_Max = 10;
const int StExt_ReceiptInfo_Slots_Max = 8;
const int StExt_ReceiptInfo_Vars_Max = 16;
const int StExt_ReceiptDescriptor_Vars_Max = 16;

const int StExt_ReceiptType_None = StExt_Null;
const int StExt_ReceiptType_Misk = 0;
const int StExt_ReceiptType_Armor = 1;
const int StExt_ReceiptType_MeleeWeapon = 2;
const int StExt_ReceiptType_RangeWeapon = 3;
const int StExt_ReceiptType_Jewelry = 4;
const int StExt_ReceiptType_Magic = 5;
const int StExt_ReceiptType_Max = 6;

const int StExt_ReceiptFlag_None = 0;
const int StExt_ReceiptFlag_NoReceiptRequired = 1;			// No need to know receipt for craft 
const int StExt_ReceiptFlag_NoLevelRequired = 2;			// Skip profession level check
const int StExt_ReceiptFlag_NoExp = 4;						// Receipt not give exp
const int StExt_ReceiptFlag_UseChances = 8;					// Use chance system. Otherwise always success. 
const int StExt_ReceiptFlag_SaveItemsOnFail = 16;			// Keep items in inventory if craft was unsuccessfull
const int StExt_ReceiptFlag_DisableLuck = 32;				// Skips luck bonuses / mechanic

const int StExt_ReceiptDescriptor_State_Unknown = StExt_Null;
const int StExt_ReceiptDescriptor_State_Started = 0;
const int StExt_ReceiptDescriptor_State_Failed = 1;
const int StExt_ReceiptDescriptor_State_Success = 2;