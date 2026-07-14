// *** System values
var int StExt_CurrentModVersion;
var int StExt_ModInitialized;
var int StExt_SelectedConfigsIndex;
var string StExt_CurrentModVersionString;
var int StExt_IsLevelChanging;
var int StExt_IsLevelChangingFlag;
var int StExt_IsLoading;
var int StExt_Fps;
var int StExt_LockConfigs;
var int StExt_LockConsole;

var int StExt_CanShowPcEsBar;
var int StExt_CanShowModMenu;
var int StExt_BlockPcMovement;

var int StExt_GameParserIndex;
var int StExt_NpcUidCounter;

var string StExt_ReturnString;
var string StExt_ChoiceName;

var C_Npc StExt_FocusNpc;
var C_Npc StExt_Self;
var C_Npc StExt_Other;
var C_Npc StExt_AttackNpc;
var C_Npc StExt_TargetNpc;
var C_Item StExt_AttackWeapon;
var C_Item StExt_Item;

var C_AuraData StExt_CurrentAura;
var C_NpcAbility StExt_CurrentNpcAbility;
var C_TimedEffect StExt_CurrentTimedEffect;
var C_TimedEffect StExt_CreatedTimedEffect;
var C_TimedEffectData StExt_CurrentTimedEffectData;

var C_DamageInfo StExt_DamageInfo;
var C_ExtraDamageInfo StExt_ExtraDamageInfo;
var C_ExtraDamageInfo StExt_ReflectDamageInfo;
var C_ExtraDamageInfo StExt_DotDamageInfo;
var C_ExtraDamageInfo StExt_ExtraDamageInfoPtr;

var C_IncomingDamageInfo StExt_IncomingDamageInfo;
var C_CraftData StExt_CraftInfo;

var C_NpcBaseStats StExt_CurrentSummonStats;

var C_Npc StExt_CurrentItemAbility_Self;
var C_Npc StExt_CurrentItemAbility_Other;
var C_ItemAbility StExt_CurrentItemAbility;
var C_ItemAbilityRecord StExt_CurrentItemAbility_Stats;

var C_ReceiptDescriptor StExt_ReceiptDescriptor;
var C_ReceiptInfo StExt_ReceiptInfo;
var C_SpellInfo StExt_SpellInfo;

var C_ScriptCallbackParams StExt_CallbackParams;

var int StExt_FuncArgs_Int[8];
var string StExt_FuncArgs_String[8];
var float StExt_FuncArgs_Float[8];

var int StExt_IgnoreHumanDamageNow;							// Required to fix double damage reaction
var int StExt_InnosKarma;
var int StExt_AdanosKarma;
var int StExt_BeliarKarma;
var int StExt_AdanosKarmaPenalty;
var int StExt_AdanosKarmaBonus;

var int StExt_DotDamage_DamageType;
var int StExt_DotDamage_DamageFlags;
var int StExt_DotDamage_FromPlayer;

var int StExt_Damage_SkillCrtiticalShotDone;
var int StExt_Damage_MadWhirlwindSplashInUse;
var int StExt_Damage_MadWhirlwindSkipTargetUid;
var int StExt_Damage_SpellCastFrameOffset;

var int StExt_SncExpDamage;

// *** Original diff values
var int StExt_SncMode;
var int StExt_DiffLevel;
var int StExt_DiffMode_Hp;
var int StExt_DiffMode_Pwr;
var int StExt_DiffMode_Prot;

var int StExt_DiffMode_Exp;
var int StExt_DiffMode_SncKoeff;
var int StExt_DiffMode_PartyExp;
var int StExt_DiffMode_BeliarRageNpcExp;

// *** Misk flags ***
var int StExt_TraderAppear;
var int StExt_TraderReputation;
var int StExt_TraderBarterAiv[StExt_ShivaTradeIndex_Max];

var int StExt_FireTeacherAppear;
var int StExt_DarkTeacherAppear;
var int StExt_SoulMasterAppear;
var int StExt_SoulMasterAppearV2;
var int StExt_ZakonHereticAppear;
var int StExt_ZakonHeretic_Dead;
var int StExt_ZakonBoss_Chapter;
var int StExt_ZakonBoss_Killed;
var int StExt_ZakonBoss_Active;
var int StExt_ZakonBoss_ActiveSlot;	// 1..10 = which arena boss is summoned & should be alive (0 = none). Robust re-summon guard.
var int StExt_ZakonBlackTrollDead;	// latched: the world's Black Troll was killed (veteran gate + arena spot)
var int StExt_ZakonHunt_Done;		// last chapter whose hunted target died
var int StExt_ZakonHunt_SpawnedCh;	// last chapter whose target was spawned
var int StExt_ZakonReward_Chapter;	// last chapter rewarded (F4)
var int StExt_ZakonLore_Stage;		// how many lore fragments revealed (journal)
var string StExt_Str_ProfessionTab[12];	// lines rendered in the Shift+T "Profesje" tab (built by StExt_BuildProfessionTab)

var int StExt_LuckProcGlobal;
var int StExt_AuraMasterBonusTimer;
var int StExt_AuraOnTickProcessing;
var int StExt_AuraOvercapCounter;

var int StExt_HeroHasAnyAura;
var int StExt_DoCastAuras;
var int StExt_PcEsNoRegenFlag;
var int StExt_ReflectSpellAbility_InUse;
var int StExt_DoReanimation_Cd;

var int StExt_SncExpDamage;

var int StExt_MeeleDamageInfo;
var int StExt_RangeDamageInfo;
var int StExt_RuneDamageInfo;

var int StExt_CurrentDay;
var int StExt_CurrentKapitel;
var int StExt_CurrentHeroLevel;

var int StExt_CurrentDayPart;
var int StExt_TimeBindingEvtDay_Midnight;		// 0000 - 0400			
var int StExt_TimeBindingEvtDay_Dawn;			// 0400 - 0800
var int StExt_TimeBindingEvtDay_Morning;		// 0600 - 1000
var int StExt_TimeBindingEvtDay_Noon;			// 1000 - 1400
var int StExt_TimeBindingEvtDay_Afternoon;		// 1400 - 1800
var int StExt_TimeBindingEvtDay_Dusk;			// 1800 - 2000
var int StExt_TimeBindingEvtDay_Evening;		// 2000 - 0000
var int StExt_TimeBindingEvtDay_NewDay;

var int StExt_ReturnSelectedIndex;

// *** Dialog flags ***
var int StExt_DisplayModMenu;
var int StExt_DisplayScrollmakingMenu;
var int StExt_DisplayCorruptionMenu;

// *** Ui flags ***
var int StExt_UiMovingEnabled;
var int StExt_CurrentUiElement;
var string StExt_CurrentUiElementPrefix;
var int StExt_ConfigValueEditEnabled;
var int StExt_ConfigValueEditStep;
var int StExt_ConfigValueEditOld;
var string StExt_CurrentEditValue;
var string StExt_CurrentEditValueDesc;
var string StExt_CurrentEditValueSection;
var int StExt_ConfigValueEditUpdateTimer;

var string StExt_ActiveAurasNames;

var int StExt_ModHelpAccepted;

// *** Food counters ***
var int StExt_Food_CheckDay;
var int StExt_Food_ResetDay;

var int StExt_BluntSmoked;
var int StExt_CiderUsed;
var int StExt_MeadUsed;
var int StExt_VodkaUsed;
var int StExt_WhiskeyUsed;
var int StExt_CognacUsed;
var int StExt_BrendyUsed;
var int StExt_AbsinthUsed;
var int StExt_TequilaUsed;
var int StExt_ScotchUsed;
var int StExt_GrappaUsed;

var int StExt_CiderUsedNext;
var int StExt_MeadUsedNext;
var int StExt_VodkaUsedNext;
var int StExt_WhiskeyUsedNext;
var int StExt_CognacUsedNext;
var int StExt_BrendyUsedNext;
var int StExt_AbsinthUsedNext;
var int StExt_TequilaUsedNext;
var int StExt_ScotchUsedNext;
var int StExt_GrappaUsedNext;

var int StExt_BananaUsed;
var int StExt_BananaUsedNext;
var int StExt_CocountUsed;
var int StExt_CocountUsedNext;
var int StExt_PearUsed;
var int StExt_PearUsedNext;
var int StExt_PineAppleUsed;
var int StExt_PineAppleUsedNext;

var int StExt_DamageUpPotionPower;
var int StExt_DamageUpTimer;

// *** Quests flags and variables ***
var int StExt_StonedTrader_MissionLetterGet;
var int Stext_Mis_Shiva;
var int Stext_Andriel_Reward;
var int Stext_Duriel_Reward;
var int Stext_Mephisto_Reward;
var int Stext_Diablo_Reward;
var int Stext_Baal_Reward;

// *** Special bosses flags ***
var int Stext_Andriel_Isdead;
var int Stext_Duriel_Isdead;
var int Stext_Mephisto_Isdead;
var int Stext_Diablo_Isdead;
var int Stext_Baal_Isdead;

var int Stext_SpecialSummons[StExt_SpecialSummonType_Max];
var string StExt_FocusNpcInfo[5];
var int StExt_FocusNpcRank;

var int Stext_Cheat_Immortal;
var int Stext_Cheat_Invisible;

// *** World randomization vars ***
var int StExt_WorldRandimizer_LevelId;
var int StExt_WorldRandimizer_Cooldown[StExt_WorldRandomizer_MaxSlots];
var string StExt_WorldRandimizer_Waypoint[StExt_WorldRandomizer_MaxSlots];
var int StExt_RandomTradersLootDay;
var int StExt_RandomTradersLootDay_Adw;
var int StExt_RandomChestLootDay;
var int StExt_RandomChestGenerateLoot;
var int StExt_RandomChestsCount;
var string StExt_RandomChestName;
var int StExt_RandomBanditsDay;
var int StExt_RandomBanditsPacksCount;

// *** Skin controller ***
var int StExt_CollarOn;
var int StExt_ArmorBackUpRef;
var string StExt_ArmorVisualBackup;
var int StExt_UpdateSkin;

var string StExt_CurrentItemGeneratorConfigs;
var string StExt_CurrentUserConfigs;

// *** Global Event Args ***
var C_Npc StExt_EventArgs_Target;
var int StExt_EvntArgs_CurrentSaveId;
var C_PlayerActionEventArgs StExt_OnPlayerAction_EventArgs;

prototype BaseInfusion(C_MagicInfusionData)
{
	// System values
	Id = StExt_Null;
	Tier = 0;
	AffixId = StExt_Null;
	SuffixId = StExt_Null;
	PreffixId = StExt_Null;
	// Npc mods
	NpcFlags = 0;
	Size = 0.05;
	SpeedMod = 1;
	ExtraLevel = 3;
	ExtraLevelMult = 5;
	Effect = StExt_EmptyString;
	// Attribute mods
	ExtraHp = 100;
	ExtraEs = 0;
	ExtraStr = 15;
	ExtraAgi = 15;
	ExtraHpMult = 10;
	ExtraEsMult = 0;
	ExtraStrMult = 5;
	ExtraAgiMult = 5;
	// Damage mods
	ExtraBluntDam = 0;
	ExtraEdgeDam = 0;
	ExtraFireDam = 0;
	ExtraFlyDam = 0;
	ExtraMagicDam = 0;
	ExtraPointDam = 0;
	ExtraPoisonDam = 0;
	ExtraHitchances = 0;
	// Protection mods
	ExtraDodgeChance = 0;
	ExtraBluntProt = 0;
	ExtraEdgeProt = 0;
	ExtraFireProt = 0;
	ExtraFlyProt = 0;
	ExtraMagicProt = 0;
	ExtraPointProt = 0;
	ExtraProtAllMult = 3;
	ResistEdge = 0;
	ResistBlunt = 0;
	ResistPoint = 0;
	ResistMagic = 0;
	ResistFire = 0;
	ResistFly = 0;
	ResistPois = 0;
	// Abilities
	LowAbilityId = StExt_Null;
	MedAbilityId = StExt_Null;
	TopAbilityId = StExt_Null;
	SummonAbilityId = StExt_Null;
	PassiveAbilityId = StExt_Null;
	BuffAbilityId = StExt_Null;
	DebuffAbilityId = StExt_Null;	
	Abilities[0] = StExt_Null;
	Abilities[1] = StExt_Null;
	Abilities[2] = StExt_Null;
	Abilities[3] = StExt_Null;
	Abilities[4] = StExt_Null;
	Abilities[5] = StExt_Null;
	Abilities[6] = StExt_Null;
	Abilities[7] = StExt_Null;
	Abilities[8] = StExt_Null;
	Abilities[9] = StExt_Null;	
	LuckBonus = 0;
	GoldBonus = 0;
};
