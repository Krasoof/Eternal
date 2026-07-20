/*
	//==================================================================================
	//						*** External defined functions ***
	// 					(onlys signature description, do not compile)
	//==================================================================================
	func void StExt_Cmd(var string message);
	
	func int StExt_Array_GetInt(var string name, var int index);
	func float StExt_Array_GetFloat(var string name, var int index);
	func string StExt_Array_GetString(var string name, var int index);

	func void StExt_Array_SetInt(var string name, var int index, var int value);
	func void StExt_Array_SetFloat(var string name, var int index, var float value);
	func void StExt_Array_SetString(var string name, var int index, var string value);

	// TRUE = LOOP_CONTINUE
	// FALSE = LOOP_END
	func int StExt_While(var int func(var int index) loop);

	func void StExt_Array_FillInt(var string name, var int value);
	func void StExt_Array_FillFloat(var string name, var float value);
	func void StExt_Array_FillString(var string name, var string value);

	func void StExt_Array_ForEachInt(var string name, var void func(var int index, var int value) loop);
	func void StExt_Array_ForEachFloat(var string name, var void func(var int index, var float value) loop);
	func void StExt_Array_ForEachStr(var string name, var void func(var int index, var string value) loop);

	func void StExt_Array_AlterEachInt(var string name, var int func(var int index, var int value) loop);
	func void StExt_Array_AlterEachFloat(var string name, var float func(var int index, var float value) loop);
	func void StExt_Array_AlterEachStr(var string name, var string func(var int index, var string value) loop);
	
	func int StExt_Array_GetSize(var string name);
	
	func float StExt_FloatMult(var float m1, var float m2);
	func float StExt_FloatPow(var float m1, var float m2);
	func int StExt_IntPow(var int m1, int float m2);
	func int StExt_FloatPowAsInt(var int m1, var float m2);	
	
	func int StExt_GetPercentBasedOnValue(var int arg1, var int arg2);
	func int StExt_GetInstanceIdByName(var string name);
	func int StExt_UpdatePcStats();
	func int StExt_GetPcStat(var int idx);
// TEMP DIAG: cicha linia do stext_trace.log (flush natychmiastowy, przezywa crash).
// ai_print* spamuje ekran, DEBUG_MSG jest wycinany w Release - to jedyna droga.
func void StExt_Trace(var string msg);

// Kwestia dialogowa NPC moda. v2: DLL rejestruje wpis OU w runtime
// (STEXT_SAY_<CRC32 tekstu>) i wrzuca natywny EV_OUTPUT do kolejki NPC -
// dymek jest silnikowy (skip, zamkniecie z dialogiem). Dubbing: wystarczy
// WAV o nazwie OU w Sound/Speech. speaker zostaje w API (imie i tak
// pokazuje silnik). Uzywac zamiast AI_Output w calym modzie.
func void StExt_Say(var string speaker, var string text);

// Czy sesja dialogowa (InfoManager) nadal trwa - akcje "po dialogu"
// (teleporty itp.) maja na tym czekac, bo linie Say graja sekundami.
func int StExt_IsDialogActive();
	
	func void StExt_Info_AddChoice(var int menu, var string optName, var string optFunc);
	func void StExt_Info_BuildItemGeneratorPresetsChoices(var int menu, var string optFunc);
	func int StExt_SetItemGeneratorConfigs(var string configName);
	func void StExt_ResetItemGeneratorConfigs();
	
	func int StExt_RegistrateConfigsPreset(var string configName);
	func C_ConfigPreset StExt_GetConfigsPreset(var string configName);	
	func void StExt_Info_BuildConfigPresetsChoices(var int menu, var string optFunc);
	func string StExt_ParsePresetName(var string input);

	func C_AuraData StExt_GetAuraData(var int index);

	func C_Npc StExt_GetNpc(var c_npc npc);
	func void StExt_SpawnNpcWithFunc(var int instanceId, var int count, var string waypoint, var string initFunc);
	func void StExt_ForEachNpcInRadius(var c_npc center, var int radius, var string initFunc, var string condFunc, var string execFunc);
	
	func int StExt_FindTargetInRadius(var c_npc center, var int radius, var string condFunc);
	func C_MagicInfusionData StExt_InfuseNpcWithMagic(var c_npc slf, var int tier);
	func C_MagicInfusionData StExt_DisposeNpcInfusion(var C_MagicInfusionData infusion);

	func void StExt_InitializeExtraDamage();
	func void StExt_InitializeDotDamage();
	func void StExt_InitializeReflectDamage();
	
	func void StExt_FinalizeExtraDamage();
	func void StExt_FinalizeDotDamage();
	func void StExt_FinalizeReflectDamage();
	
    func void StExt_ApplyExtraDamage(var c_npc atk, var c_npc target);
	func void StExt_ApplyDotDamage(var c_npc atk, var c_npc target);
	func void StExt_ApplyReflectDamage(var c_npc atk, var c_npc target);	
	func void StExt_ApplyScriptDamage(var c_npc atk, var c_npc target, var C_ExtraDamageInfo desc, var func damageSelector);
	func void StExt_ApplyScriptPendingDamage(var c_npc atk, var c_npc target, var C_ExtraDamageInfo desc, var func damageSelector);
	
	func int StExt_CastScriptSpell(var string proj, var c_npc atk, var c_npc target, var int damage, var int damType, var C_ExtraDamageInfo desc);

	
	// return TRUE if func was found and executed.
	// otherwise return FALSE
	func int StExt_TryCallFunc(var string funcName);	
	func int StExt_OverrideFunc(var string origFuncName, var string newFuncName);
	func int StExt_OverrideDialog(var int dialogInstance, var string infoFuncName, var string condFuncName);	
	func int StExt_OverrideConst(var int newValue, var string constName);  
	func void StExt_RegtisterScriptPlugin(var string modName, var string modVersion, var string modAuthor);
	
	// This functions allow create 'dynamic' classes defined only in scripts
	// But be carefull with potential memory leaks.
	// Warning: objects memory pool is 1Mb! (See Dynamic classes below)
	func int StExt_Struct_Sizeof(var string className);
	func class StExt_Struct_Alloc(var int size);
	func void StExt_Struct_Free(var class obj);
	func void StExt_Struct_IsEmpty(var class obj);
	func int StExt_Struct_Read(var C_IntArray ptr, var int offset);
	func int StExt_Struct_Write(var C_IntArray ptr, var int offset, var int value);
	
	func int StExt_GetTimedEffectsCount();
	func C_TimedEffect StExt_GetTimedEffectByIndex(var int npcUid); 
	func C_TimedEffect StExt_GetTimedEffectByNpc(var int npcUid, var int effectId); 
	func C_TimedEffect StExt_CreateTimedEffect(var string funcName, var int delay, var c_npc self, var c_npc other); 
	
	func int StExt_GetNextNpcUid();
	func C_Npc StExt_GetNpcByUid(var int npcUId);
	func int StExt_IsUidRegistered(var int npcUId);
	func int StExt_RegisterNpc(var c_npc npc, var int npcUId);
	
	func int StExt_GetNpcVar(var c_npc npc, var int index);
	func void StExt_SetNpcVar(var c_npc npc, var int index, var int value);
	
	func int StExt_GenerateRandomItem(var int type, var int power);
	func int StExt_GenerateRankedItem(var int type, var int power, var int rank);
// Unikaty bossow: generacja z wymuszona ranga ORAZ zywiolem (symbol spella);
// settery nazwy wlasnej i mesha dzialaja na wygenerowanym itemie i MUSZA byc
// wolane PRZED createinvitems (ApplyItemExtension naklada je przy inicjalizacji).
	func int StExt_GenerateUniqueItem(var int type, var int power, var int rank, var string elemSpellSym);
	func int StExt_SetGeneratedItemName(var int itmIndex, var string name);
	func int StExt_SetGeneratedItemVisual(var int itmIndex, var string visual);
// Wymuszony zywiol wygenerowanego itemu (wybor gracza u Kowala). Wolac PRZED
// createinvitems - ustawia SpellId/SpellPower na rozszerzeniu.
	func int StExt_SetGeneratedItemElement(var int itmIndex, var int spellId, var int power);
	func int StExt_GetRegularItem(var int type, var int power);
	func void StExt_UseEnchantedItem();

	// Weapon seals (offensive spell + power stored on a weapon's item extension).
	func int StExt_ItemHasExtension(var c_item itm);
	func int StExt_GetItemProperty(var c_item itm, var int index);
	// Slot reader of element perks on EQUIPPED non-weapon items (armor/jewelry).
	// which: 0 = spell id, 1 = perk power. Returns 0 past the last slot.
	func int StExt_GetEquippedPerk(var c_npc npc, var int slot, var int which);
	// In-place enchant: upgrades the ACTUAL item with a rolled magic extension.
	// Returns new dynamic instance id (swap old item for it) or -1 on fail.
	func int StExt_EnchantItemInPlace(var c_item itm, var int power);
	// Reroll ("stat mix") for an already-magic item: fresh roll on the SAME base item.
	func int StExt_RerollItemInPlace(var c_item itm, var int power);
	func int StExt_SetItemProperty(var c_item itm, var int index, var int value);
	func int StExt_GetItemSeal(var c_item itm);
	func int StExt_GetItemSealPower(var c_item itm);
	func int StExt_GetItemRank(var c_item itm);
	func int StExt_ScanLegendJewelry(var instance npc);
	func int StExt_SetItemSeal(var c_item itm, var int spellId, var int power);
	
	func string StExt_StatValueToString(var int statId, var int statVal);
	func string StExt_FormatIntToString(var int value, var int valueType);
	
	func string StExt_GetItemNameById(var int instanceId);	
	func C_Item StExt_GetItemById(var int instanceId);
	func void StExt_DeleteTempItem(var C_Item itmPtr);
	
	func int StExt_ThrowItem(var c_npc attaker, var c_npc target, var string item, var int damage, var int damageType);
	
	func void StExt_TeleportToNpc(var c_npc atk, var c_npc target);
	func void StExt_ValidateNpcPosition(var c_npc npc);
	
	func void StExt_PrintMessageToTray(var string text, var string color);
	
	func string StExt_TryGetSymbolDescriptionText(var string symName);
	
	func void StExt_ProhibitWp(var string wp, var int radius);
	func int StExt_IsNpcInProhibitedPlace(var c_npc slf);
	func void StExt_BuildEnchntedItemsSellForm(var C_IntArray array, var int size);
	func int StExt_GetUndefinedItemsCount();
	func void StExt_IdentifyAllItems();
	func void StExt_BuildItemsSellForm(var int mainFlag, var int flags, var int allowGenerated, var int priceMult);
	
	func void StExt_StartUncaper();
	func void StExt_UpdateUncaper();
	func void StExt_UpdateUncaperStat(var int index);
	
	func string StExt_GetItemInstanceName(var c_item item);
	
	func int StExt_CopyNpcLook(var c_npc slf, var c_npc originalNpc);
	
	func void StExt_RegisterConfig(var string valueSymbol, var string descSymbol, var int configGroup, var int minValue, var int maxValue, var int displayType, var int isVisible, var int isEditable, var int isExportable);
	func void StExt_ValidateConfigs();
	func void StExt_ValidateConfig(var string configName);

	func int StExt_ExportCurrentConfigs();
	func void StExt_UpdateTradeVars(var int sellMult);
	
	func string StExt_GetRandomWp();
	func string StExt_GetRandomEmptyChest(var int onlyEmpty);
	func void StExt_LockChest(var string chestName, var int combPower);
	
	func void StExt_Player_ItemBatchUse(var string itemInstance, var int maxCount);
	
	func void StExt_CallActorFunc(var string funcName, var c_npc slf);
	func void StExt_CallActorsFunc(var string funcName, var c_npc slf, var c_npc oth);
	
	
	func instance StExt_InitializeCallback(var instance a0, var instance a1, var string a2, var int a3);
	func instance StExt_GetTimedEffectData(var int effectIndex);

	func int StExt_GetRandomAbility(var instance npc);
	func void StExt_Npc_ProcessAbilityCooldowns(var instance npc);
	func void StExt_Npc_ResetAllAbilityCooldowns(var instance npc);
	func void StExt_Npc_ForEachAbility(var instance npc, var int p1, var int p2, var int p3);
	func int StExt_Npc_SelectAbility(var instance npc, var int p1, var int p2, var int p3);
	func int StExt_Npc_SearchAbility(var instance npc, var int p1, var int p2);
	func int StExt_Npc_HasAbility(var instance npc, var int abilityId);
	
	func void StExt_SetCorruptionTouchStatData(var int statId, var int statPerPoint, var int statMax);
	
	func void StExt_SetRandomNpcData(var string instanceName, var int power, var int count);
	func C_RandomNpcData StExt_GetRandomNpcData(var int powerMin, var int powerMax);
	
	func float StExt_GetRandFloatRange(var float min, var float max);
	
	//==================================================================================
	//						*** Events ***
	//==================================================================================
	StExt_Evt_MainLoop - triggers every second
	StExt_Evt_OnModInitialized - triggers after Xardas dialog
	StExt_Evt_OnLevelChange - triggers on level change
	StExt_Evt_OnLoadEnd - triggers on load end (save/new game/level change)
	StExt_Evt_OnModLoaded - triggers on mod initialization
	StExt_Evt_OnLevelUp - triggers on PC level up
	StExt_Evt_OnCorruptionLevelUp - triggers on PC corruption level up
	StExt_Evt_OnHeroInitialized - occurs once when hero is initialized
	StExt_Evt_OnSpellCast - occurs when spell casted
	
	// *** Time events *** //
	StExt_Evt_OnMidnight
	StExt_Evt_OnDawn
	StExt_Evt_OnMorning
	StExt_Evt_OnNoon
	StExt_Evt_OnAfternoon
	StExt_Evt_OnDusk
	StExt_Evt_OnEvening
	StExt_Evt_OnNewDay
	
	// *** Pc events *** //
	StExt_Evt_OnPlayerInput_Action
	StExt_Evt_OnPlayerSpellCast_Action
	StExt_Evt_OnPlayerAttackForward_Action
	StExt_Evt_OnPlayerAttackLeft_Action
	StExt_Evt_OnPlayerAttackRight_Action
	StExt_Evt_OnPlayerAttackRun_Action
	StExt_Evt_OnPlayerAttackFinish_Action
	StExt_Evt_OnPlayerParade_Action
	StExt_Evt_OnPlayerShootAt_Action
	StExt_Evt_OnPlayerDefend_Action
	StExt_Evt_OnPlayer_Action
*/

class C_PlayerActionEventArgs
{
	var int Type;
	var int Flags;
	var int Result;	
	var int IsHandled;

	var int MouseLButtonClicked;
	var int MouseRButtonClicked;
	var int MouseMButtonClicked;

	var int ControlKeyPressed;
	var int ShiftKeyPressed;
	var int AltKeyPressed;

	var int MainActionKeyPressed;
	var int SecondaryActionKeyPressed;
	var int SupportActionKeyPressed;

	var int WeaponMode;
	var int BodyState;
	var int CanDoAni;
};

// Not used
class C_Trigger
{
    var int Delay; 				// defines the frequency (in milliseconds) at which the function will be called.
    var int Enabled; 			// determines if the trigger is active. If the value is equal to zero, the trigger is destroyed.
    var int AIVariables[16]; 	// user data, which can be set independently when creating trigger.	
	/*
	var func Func;				// The function that the trigger will call.
	var c_npc Self;				// The NPC that will be placed in `self` when the function is called.
	var c_npc Other;			// An NPC that will be placed in `other` when the function is called.
	var c_npc Victim;			// The NPC that will be placed in `victim` when the function is called.
	*/
};

class C_AuraData
{
	var int Id;                 // Id of aura
	var int Flags;              // Flags
	var int ReservedAtr;        // Index of reserved attribute
	var int ReservedValue;      // Initial value for reservation
	var int Duration;           // Initial duration
	var int Chance;             // Base chance to apply effect
	var int PowerRatio;			// Moddifier for applied aura power
	var int CondAtr[3];         // Index of required stat to equipment
	var int CondValue[3];       // Required stat amount
	var int StatId[5];          // Index of applied effect. Used for stats system only
	var int StatValue[5];       // Initial effect values
	var int MasteryId[3];		// Masteries, wich recieves bonus while aura equiped
	var string OnOffence;		// Func name, which invokes when player/summon do damage
	var string OnDeffence;		// Func name, which invokes when plyaer/summon get damage
	var string OnTick;			// Func name, which invokes every tick
	var string BoundedItem;		// Item name, which contains aura
	var string Effect;			// SpellFx effect on activation	
};

class C_DamageInfo
{
	var int Damage[8];
	var int TotalDamage;
	var int RealDamage;
	var int SpellId;
	var int DamageEnum;
	var int WeaponEnum;
	var int DamageType;
	var int DamageFlags;
	var int BlockDamage;
	var int StopProcess;
	var int IsInitial;
	var int StopAoe;
};

class C_ExtraDamageInfo
{
	var int Damage[8];
	var int DotDamage[8];
	var int Ticks[8];
	var int TotalDamage;
	var int TotalDotDamage;
	var int DamageType;
	var int DamageFlags;
	var int MaxTargets;
	var int Radius;
    var int IsProcessed;
	// Kanaly przebijajace: aplikowane w DLL PO odjeciu protekcji (zywioly
	// przebijaja pancerz - decyzja 2026-07-18). Immunitet (protection<0)
	// nadal respektowany. NOWE POLA TYLKO NA KONCU (lustro C++ w Damage.h).
	var int PierceDamage[8];
};

class C_IncomingDamageInfo
{
	var int Flags;
	var int DamageType;
	var int DamageFlags;
	var int Damage[8];
	var int DamageTotal;
	var int SpellId;
};


class C_MagicInfusionData
{
	// System values
	var int Id;
	var int Tier;
	var int AffixId;
	var int SuffixId;
	var int PreffixId;
	// Npc mods
	var int NpcFlags;
	var float Size;
	var int SpeedMod;
	var int ExtraLevel;
	var int ExtraLevelMult;
	var string Effect;
	// Attribute mods
	var int ExtraHp;
	var int ExtraEs;
	var int ExtraStr;
	var int ExtraAgi;
	var int ExtraHpMult;
	var int ExtraEsMult;
	var int ExtraStrMult;
	var int ExtraAgiMult;
	// Damage mods
	var int ExtraBluntDam;
	var int ExtraEdgeDam;
	var int ExtraFireDam;
	var int ExtraFlyDam;
	var int ExtraMagicDam;
	var int ExtraPointDam;
	var int ExtraPoisonDam;
	var int ExtraHitchances;
	// Protection mods
	var int ExtraDodgeChance;
	var int ExtraBluntProt;
	var int ExtraEdgeProt;
	var int ExtraFireProt;
	var int ExtraFlyProt;
	var int ExtraMagicProt;
	var int ExtraPointProt;
	var int ExtraProtAllMult;
	var int ResistEdge;
	var int ResistBlunt;
	var int ResistPoint;
	var int ResistMagic;
	var int ResistFire;
	var int ResistFly;
	var int ResistPois;	
	// Abilities
	var int LowAbilityId;
	var int MedAbilityId;
	var int TopAbilityId;
	var int SummonAbilityId;
	var int PassiveAbilityId;
	var int BuffAbilityId;
	var int DebuffAbilityId;
	var int Abilities[10];
	var int LuckBonus;
	var int GoldBonus;
};

class C_TimedEffect
{
	var int Delay; 				// defines the frequency (in milliseconds) at which the function will be called.
    var int Enabled; 			// determines if the trigger is active. If the value is equal to zero, the trigger is destroyed.
	var int SelfUId;			// Uid of self npc
	var int OtherUId;			// Uid of other npc
    var int AIVar[32]; 			// user data, which can be set independently when creating trigger.	
	var int Flags;				// extra flags for effect
	var int EffectId;
};

class C_TimedEffectData
{
	var int Id;
	var int Flags;
	var int Duration;
	var int Range;
	var int Targets;
	var int BaseValue;
	var int MinValue;
	var int MaxValue;
	var int PowerRatio;
	var string Name;
	
	var string LoopName;
	var string OnInit;
	var string OnUpdate;
};

class C_ScriptCallbackParams
{
	var int IntParam[16];
	var float FloatParam[8];
	var string StringParam[8];
};

class C_ConfigPreset
{
	var string Name;
	var string Text;
	var string TextColor;
	var string OnApply;
};

class C_ExtraStatData
{
	var int Id;
	var int ValueType;
	var int StatGroup;
	var int SortIndex;
	var int MinCap;
	var int MaxCap;

	var int RollChance;
	var int RollMinCap;
	var int RollMaxCap;
	var float RollMinPower;
	var float RollMaxPower;
	var float CostPerStat;
};

class C_UncapedStat
{
	var int Id;
	var int Now;
	var int Was;
	var int Max;
	var int BonusWas;
	var int BonusNow;
};

class C_SoundOverride
{
	var string OrigSound;
	var string NewSound;
};

class C_SpellInfo
{
	var int SpellId;
	var int SpellType;
	var int SpellFlags;
	var int SpellLevel;
	
	var int IsScroll;
	var int IsAoe;
	var int IsDot;
	var int IsStream;
	var int ManaCost;
	// Faktyczna inwestycja many wg SILNIKA (oCSpell.manaInvested, ustawiane
	// w DLL przed StExt_OnSpellCast). Pomiar delty bywa zerowy (NO_MANADEC),
	// silnik wie lepiej. NOWE POLA TYLKO NA KONCU (lustro w StExt_Classes.h).
	var int EngineManaInvested;
};

class C_NpcAbility
{
	var int Id;
	var int Type;
	var int Flags;
	var int AiVars[32];
	
	var int DamageType;
	var int DamageFlags;
	var int DamageEnum;
	var int DamageTotal;
	
	var int Duration;
	var int Radius;
	var int Chance;	
	var int RangeMin;
	var int RangeMax;
	var int Cooldown;
	var int MaxTargets;
	
	var int SummonsId[3];
	var int SummonsCount[3];
	var int TimedEffectId;
	var string ItemInstanceName;
	var int SpellId;
	
	var string Name;
	var string EffectName;
	var string OnCast;
	var string OnOffence;
	var string OnDeffence;
	var string OnTick;
	var string OnDeath;
};

class C_RandomNpcData
{
	var int Power;
	var int Count;
	var string InstanceName;
};

//-------------------------------------------------------------------------------
// 								Items abilities 
//-------------------------------------------------------------------------------

// Type basically is scheme when and how apply these items abilities 
const int StExt_ItemAbilityType_Passive = 0;				// Ability check and pulled by scripts in appropriated place. MANUALY!

const int StExt_ItemAbilityType_Offensive = 1;				// Processed when npc attack other npc. Ability select from npc weapon + all other equipment (hero/summons only, except other weapon).
															// Then scripts/engine AUTOMATICALLY build effect projectile. WORKS ONLY in damage handling.
															
const int StExt_ItemAbilityType_Defensive = 2;				// Processed when hero get damage from other npc. Same as offencive, but for deffencive, lol)

const int StExt_ItemAbilityType_Сontinuous = 3;				// Constantly active ability. Try invoke 'OnApply()' every tick, if triggers not setted. 
															// Otherwise handle all matching abilities to corresponding events in the loop.
															// 'OnApply()' here is ESSENTIAL! Ability wouldn't do anything in this scheme if apply func not setted!

// Extra flags
const int StExt_ItemAbilityFlag_None = 0;
const int StExt_ItemAbilityFlag_ForceApplyFunc = 1;				// Required to invoke 'OnApply()' instead default actions for offencive/deffencive abilities.
const int StExt_ItemAbilityFlag_UseTimeBinding = 2;				// Ability applied only if time is appropriate. Otherwise, without this flags time of day doesn't matter.
const int StExt_ItemAbilityFlag_SummonsOnly = 4;				// Ability works for summons only (kind of redirect abilities to them)
const int StExt_ItemAbilityFlag_AlwaysSuccessChance = 8;		// Ignore chance variable on ability selection
const int StExt_ItemAbilityFlag_ManualMasteryExp = 16;			// ??? Force to give exp to binded masteries on applying.

//const int StExt_ItemAbilityFlag_ = ;
/*
const int StExt_ItemAbility_TriggerFlag_None = ;
const int StExt_ItemAbility_TriggerFlag_OnTimeChange = ;
const int StExt_ItemAbility_TriggerFlag_OnDeath = ;
const int StExt_ItemAbility_TriggerFlag_OnStealDone = ;
const int StExt_ItemAbility_TriggerFlag_OnStealFail = ;
const int StExt_ItemAbility_TriggerFlag_OnChestOpen = ;
const int StExt_ItemAbility_TriggerFlag_OnLevelUp = ;
*/
class C_ItemAbility
{
	var int Id;							// Unique ability Id
	var string Name;					// Displayed name
	
	var int Type;						// General handling scheme. (look comments to StExt_ItemAbilityType_***)
	var int Flags;						// Additional behaviour flags. (look comments to StExt_ItemAbilityFlag_***)
	var int TimeBindingFlags;			// Parts of the day, when ability can be selected/invoked.
	var int TriggerFlags;				// Used by continuous abilities only. Show how to process abilities (by every second or specified events)

	var int AiVars[16];
	var int DamageType;
    var int DamageFlags;
	var int MasteryExpPowerRatio;
	var int MasteryId[3];
	
	var string Effect;
	var string Condition;					
	var string OnApply;
};

class C_ItemAbilityRecord
{
	var int Id;
	var int Value;
	var int Duration;
	var int Chance;
	var int IsFromWeapon;
};

//---------------------------------------------------------------------------
//							Craft classes
//---------------------------------------------------------------------------

// What for this junk?!
class C_CraftData
{
	var int Flags;
	var int Price;
	var int ExpBonus;
	var int CraftBonus;
	var int Count;
	var int IngredientId[16];
	var int IngredientCount[16];
	var string ConditionFunc;
	var string ResultInstance;
};

const int StExt_ReceiptInfo_Slots_Max = 8;
const int StExt_ReceiptInfo_Vars_Max = 16;

class C_ReceiptDescriptor
{

};

class C_ReceiptInfo
{

};

//---------------------------------------------------------------------------
//							'Dynamic' classes
//
// Instances of such classes didn't managed by engine, but scripts insted!
// This mean you can define whatever class you want (mind Daedlaus syntax)
// and create instance of it later anywhere in scripts!
//
// (!) But be aware - The life span of these objects is totaly on you! 
// When create object and when delete it is your choice (and responsibility), but remember about memory.
// (!) Second beware - Memory buffer designated to store such instances is 1MB only!
// Remember this when work with dynamic classes.
//
// Related funcs:
//func int StExt_Struct_Sizeof(var string className);
//func class StExt_Struct_Alloc(var int size);
//func void StExt_Struct_Free(var class obj);
//func void StExt_Struct_IsEmpty(var class obj);
//---------------------------------------------------------------------------

class C_NpcBaseStats
{
	var int Hp;
	var int Str;
	var int Agi;
	var int Es;
	
	var int ProtBlunt;
	var int ProtEdge;
	var int ProtFire;
	var int ProtFly;
	var int ProtMagic;
	var int ProtPoint;
	var int ProtFall;
	
	var int DamBlunt;
	var int DamEdge;
	var int DamFire;
	var int DamFly;
	var int DamMagic;
	var int DamPoint;
	var int DamFall;
	var int DamTotal;
	
	var int DodgeChance;
	var int Speed;
};

class C_NpcRandomBanditStats
{
	var int Type;
	var int Flags;
	var int Power;
	
	var int IsFemale;
	var int VoiceIndex;
	var int NameIndex;
	
	var int HeadMeshIndex;
	var int HeadMeshExtraIndex;
	var int BodyMeshIndex;
	var int AnimSetIndex;
	var int HeadTexIndex;
	var int BodyTexIndex;
	var int SkinToneIndex;
	var int ArmorInstIndex;
	
	var int 1hMastery;
	var int 2hMastery;
	var int BowMastery;
	var int CBowMastery;
	var int FightTactic;
	
	var int Level;	
	var int Hp;
	var int Str;
	var int Agi;
	var int Es;
	var int Speed;
	var int DodgeChance;
	
	var int SpellDamage;
	var int MeleeBonusDamage;
	var int RangeBonusDamage;
	var int SpellBonusDamage;
	
	var int ProtBlunt;
	var int ProtEdge;
	var int ProtFire;
	var int ProtFly;
	var int ProtMagic;
	var int ProtPoint;
	var int ProtFall;
};

class C_IntArray { var int Ptr; };