const string StExt_TimedEffectData_IndexArray[StExt_TimedEffect_Index_Max] =
{
	"StExt_TimedEffectData_DotDamage",
	"StExt_TimedEffectData_HpRegen",
	"StExt_TimedEffectData_MpRegen",
	"StExt_TimedEffectData_EsRegen",
	"StExt_TimedEffectData_StRegen",
	"StExt_TimedEffectData_HpBonus",
	"StExt_TimedEffectData_MpBonus",
	"StExt_TimedEffectData_EsBonus",
	"StExt_TimedEffectData_StBonus",
	"StExt_TimedEffectData_StrBonus",
	"StExt_TimedEffectData_AgiBonus",
	"StExt_TimedEffectData_SpeedBonus",
	"StExt_TimedEffectData_ProtAllBonus",
	"StExt_TimedEffectData_ProtBluntBonus",
	"StExt_TimedEffectData_ProtEdgeBonus",
	"StExt_TimedEffectData_ProtFireBonus",
	"StExt_TimedEffectData_ProtFlyBonus",
	"StExt_TimedEffectData_ProtMagicBonus",
	"StExt_TimedEffectData_ProtPointBonus",
	"StExt_TimedEffectData_ProtFallBonus",
	"StExt_TimedEffectData_ResistAllBonus",
	"StExt_TimedEffectData_ResistAoeBonus",
	"StExt_TimedEffectData_ResistBluntBonus",
	"StExt_TimedEffectData_ResistEdgeBonus",
	"StExt_TimedEffectData_ResistFireBonus",
	"StExt_TimedEffectData_ResistFlyBonus",
	"StExt_TimedEffectData_ResistMagicBonus",
	"StExt_TimedEffectData_ResistPointBonus",
	"StExt_TimedEffectData_ResistFallBonus",
	"StExt_TimedEffectData_DodgeBonus",
	"StExt_TimedEffectData_AimBonus",
	"StExt_TimedEffectData_DamageBluntBonus",
	"StExt_TimedEffectData_DamageEdgeBonus",
	"StExt_TimedEffectData_DamageFireBonus",
	"StExt_TimedEffectData_DamageFlyBonus",
	"StExt_TimedEffectData_DamageMagicBonus",
	"StExt_TimedEffectData_DamagePointBonus",
	"StExt_TimedEffectData_DamageFallBonus",
	"StExt_TimedEffectData_DamageMeleeBonus",
	"StExt_TimedEffectData_DamageRangeBonus",
	"StExt_TimedEffectData_DamageSpellBonus",
	"StExt_TimedEffectData_DotDurationBonus",
	"StExt_TimedEffectData_DamageDotBluntBonus",
	"StExt_TimedEffectData_DamageDotEdgeBonus",
	"StExt_TimedEffectData_DamageDotFireBonus",
	"StExt_TimedEffectData_DamageDotFlyBonus",
	"StExt_TimedEffectData_DamageDotMagicBonus",
	"StExt_TimedEffectData_DamageDotPointBonus",
	"StExt_TimedEffectData_DamageDotFallBonus",
	"StExt_TimedEffectData_IntBonus",
	"StExt_TimedEffectData_DamageTrueBonus",
	"StExt_TimedEffectData_DamageDotTrueBonus",
	"StExt_TimedEffectData_ReflectTrueBonus",
	"StExt_TimedEffectData_ReflectBluntBonus",
	"StExt_TimedEffectData_ReflectEdgeBonus",
	"StExt_TimedEffectData_ReflectFireBonus",
	"StExt_TimedEffectData_ReflectFlyBonus",
	"StExt_TimedEffectData_ReflectMagicBonus",
	"StExt_TimedEffectData_ReflectPointBonus",
	"StExt_TimedEffectData_ReflectFallBonus",
	"StExt_TimedEffectData_ResistDotBonus",
	"StExt_TimedEffectData_ResistReflectBonus",
	"StExt_TimedEffectData_Elevation",
	"StExt_TimedEffectData_Firecape",
	"StExt_TimedEffectData_Icecape",
	"StExt_TimedEffectData_Lightingcape",
	"StExt_TimedEffectData_Darkcape",
	"StExt_TimedEffectData_Aircape",
	"StExt_TimedEffectData_Earthcape",
	"StExt_TimedEffectData_Poisioncape",
	"StExt_TimedEffectData_RegenAll",
	"StExt_TimedEffectData_DamageAll",
	"StExt_TimedEffectData_StatsAllBonus",	
	"StExt_TimedEffectData_ProtectionCurse",
	"StExt_TimedEffectData_StatsCurse",
	"StExt_TimedEffectData_LifeSiphonCurse",
	"StExt_TimedEffectData_SpeedCurse",
	"StExt_TimedEffectData_LifeTapCurse",
	"StExt_TimedEffectData_ReflectDamageCurse",
	"StExt_TimedEffectData_ExtraDamageCurse",
	"StExt_TimedEffectData_WeakenCurse"
};

prototype StExt_BaseTimedEffectData(C_TimedEffectData)
{
	Id = StExt_Null;
	Name = StExt_EmptyString;
	Flags = StExt_TimedEffect_Flag_None;
	Duration = 60;
	Range = 500;
	Targets = 5;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 1000;
	PowerRatio = 100;
	
	LoopName = StExt_EmptyString;
	OnInit = StExt_EmptyString;
	OnUpdate = StExt_EmptyString;
};


instance StExt_TimedEffectData_DotDamage(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DotDamage;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DotDamage];
	Flags = StExt_TimedEffect_Flag_Dot | StExt_TimedEffect_Flag_CanUpdate;
	LoopName = "StExt_OnDotDamage_Loop";
	OnInit = "StExt_OnDotDamage_Init";
	OnUpdate = "StExt_OnDotDamage_Update";
};

//---------------------------------------------------------------------------------

instance StExt_TimedEffectData_HpRegen(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_HpRegen;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_HpRegen];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 100;
	PowerRatio = 10;
	LoopName = "StExt_TimedEffect_Loop_HpRegen";
	OnInit = "StExt_TimedEffect_Init_HpRegen";
};

instance StExt_TimedEffectData_MpRegen(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_MpRegen;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_MpRegen];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 100;
	PowerRatio = 10;
	LoopName = "StExt_TimedEffect_Loop_MpRegen";
	OnInit = "StExt_TimedEffect_Init_MpRegen";
};

instance StExt_TimedEffectData_EsRegen(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_EsRegen;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_EsRegen];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 100;
	PowerRatio = 10;
	LoopName = "StExt_TimedEffect_Loop_EsRegen";
	OnInit = "StExt_TimedEffect_Init_EsRegen";
};

instance StExt_TimedEffectData_StRegen(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_StRegen;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_StRegen];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 2;
	MaxValue = 200;
	PowerRatio = 15;
	LoopName = "StExt_TimedEffect_Loop_StRegen";
	OnInit = "StExt_TimedEffect_Init_StRegen";
};

instance StExt_TimedEffectData_HpBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_HpBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_HpBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_HpBonus";
	OnInit = "StExt_TimedEffect_Init_HpBonus";
};

instance StExt_TimedEffectData_MpBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_MpBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_MpBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_MpBonus";
	OnInit = "StExt_TimedEffect_Init_MpBonus";
};

instance StExt_TimedEffectData_EsBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_EsBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_EsBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_EsBonus";
	OnInit = "StExt_TimedEffect_Init_EsBonus";
};

instance StExt_TimedEffectData_StBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_StBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_StBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	MaxValue = 250;
	LoopName = "StExt_TimedEffect_Loop_StBonus";
	OnInit = "StExt_TimedEffect_Init_StBonus";
};

instance StExt_TimedEffectData_StrBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_StrBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_StrBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	LoopName = "StExt_TimedEffect_Loop_StrBonus";
	OnInit = "StExt_TimedEffect_Init_StrBonus";
};

instance StExt_TimedEffectData_AgiBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_AgiBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_AgiBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	LoopName = "StExt_TimedEffect_Loop_AgiBonus";
	OnInit = "StExt_TimedEffect_Init_AgiBonus";
};

instance StExt_TimedEffectData_IntBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_IntBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_IntBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	LoopName = "StExt_TimedEffect_Loop_IntBonus";
	OnInit = "StExt_TimedEffect_Init_IntBonus";
};

instance StExt_TimedEffectData_SpeedBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_SpeedBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_SpeedBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 25;
	PowerRatio = 1;
	LoopName = "StExt_TimedEffect_Loop_SpeedBonus";
	OnInit = "StExt_TimedEffect_Init_SpeedBonus";
};

instance StExt_TimedEffectData_ProtAllBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtAllBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtAllBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 125;
	PowerRatio = 10;
	LoopName = "StExt_TimedEffect_Loop_ProtAllBonus";
	OnInit = "StExt_TimedEffect_Init_ProtAllBonus";
};

instance StExt_TimedEffectData_ProtBluntBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtBluntBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtBluntBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtBluntBonus";
	OnInit = "StExt_TimedEffect_Init_ProtBluntBonus";
};

instance StExt_TimedEffectData_ProtEdgeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtEdgeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtEdgeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtEdgeBonus";
	OnInit = "StExt_TimedEffect_Init_ProtEdgeBonus";
};

instance StExt_TimedEffectData_ProtFireBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtFireBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtFireBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtFireBonus";
	OnInit = "StExt_TimedEffect_Init_ProtFireBonus";
};

instance StExt_TimedEffectData_ProtFlyBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtFlyBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtFlyBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtFlyBonus";
	OnInit = "StExt_TimedEffect_Init_ProtFlyBonus";
};

instance StExt_TimedEffectData_ProtMagicBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtMagicBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtMagicBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtMagicBonus";
	OnInit = "StExt_TimedEffect_Init_ProtMagicBonus";
};

instance StExt_TimedEffectData_ProtPointBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtPointBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtPointBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtPointBonus";
	OnInit = "StExt_TimedEffect_Init_ProtPointBonus";
};

instance StExt_TimedEffectData_ProtFallBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtFallBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtFallBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ProtFallBonus";
	OnInit = "StExt_TimedEffect_Init_ProtFallBonus";
};

instance StExt_TimedEffectData_ResistAllBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistAllBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistAllBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 50;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_ResistAllBonus";
	OnInit = "StExt_TimedEffect_Init_ResistAllBonus";
};

instance StExt_TimedEffectData_ResistAoeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistAoeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistAoeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistAoeBonus";
	OnInit = "StExt_TimedEffect_Init_ResistAoeBonus";
};

instance StExt_TimedEffectData_ResistBluntBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistBluntBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistBluntBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistBluntBonus";
	OnInit = "StExt_TimedEffect_Init_ResistBluntBonus";
};

instance StExt_TimedEffectData_ResistEdgeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistEdgeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistEdgeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistEdgeBonus";
	OnInit = "StExt_TimedEffect_Init_ResistEdgeBonus";
};

instance StExt_TimedEffectData_ResistFireBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistFireBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistFireBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistFireBonus";
	OnInit = "StExt_TimedEffect_Init_ResistFireBonus";
};

instance StExt_TimedEffectData_ResistFlyBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistFlyBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistFlyBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistFlyBonus";
	OnInit = "StExt_TimedEffect_Init_ResistFlyBonus";
};

instance StExt_TimedEffectData_ResistMagicBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistMagicBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistMagicBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistMagicBonus";
	OnInit = "StExt_TimedEffect_Init_ResistMagicBonus";
};

instance StExt_TimedEffectData_ResistPointBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistPointBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistPointBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistPointBonus";
	OnInit = "StExt_TimedEffect_Init_ResistPointBonus";
};

instance StExt_TimedEffectData_ResistFallBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistFallBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistFallBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_Loop_ResistFallBonus";
	OnInit = "StExt_TimedEffect_Init_ResistFallBonus";
};

instance StExt_TimedEffectData_DodgeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DodgeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DodgeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 150;
	PowerRatio = 10;
	LoopName = "StExt_TimedEffect_Loop_DodgeBonus";
	OnInit = "StExt_TimedEffect_Init_DodgeBonus";
};

instance StExt_TimedEffectData_AimBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_AimBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_AimBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	LoopName = "StExt_TimedEffect_Loop_AimBonus";
	OnInit = "StExt_TimedEffect_Init_AimBonus";
};

instance StExt_TimedEffectData_DamageBluntBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageBluntBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageBluntBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageBluntBonus";
	OnInit = "StExt_TimedEffect_Init_DamageBluntBonus";
};

instance StExt_TimedEffectData_DamageEdgeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageEdgeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageEdgeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageEdgeBonus";
	OnInit = "StExt_TimedEffect_Init_DamageEdgeBonus";
};

instance StExt_TimedEffectData_DamageFireBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageFireBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageFireBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageFireBonus";
	OnInit = "StExt_TimedEffect_Init_DamageFireBonus";
};

instance StExt_TimedEffectData_DamageFlyBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageFlyBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageFlyBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageFlyBonus";
	OnInit = "StExt_TimedEffect_Init_DamageFlyBonus";
};

instance StExt_TimedEffectData_DamageMagicBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageMagicBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageMagicBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageMagicBonus";
	OnInit = "StExt_TimedEffect_Init_DamageMagicBonus";
};

instance StExt_TimedEffectData_DamagePointBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamagePointBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamagePointBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamagePointBonus";
	OnInit = "StExt_TimedEffect_Init_DamagePointBonus";
};

instance StExt_TimedEffectData_DamageFallBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageFallBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageFallBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageFallBonus";
	OnInit = "StExt_TimedEffect_Init_DamageFallBonus";
};

instance StExt_TimedEffectData_DamageMeleeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageMeleeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageMeleeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageMeleeBonus";
	OnInit = "StExt_TimedEffect_Init_DamageMeleeBonus";
};

instance StExt_TimedEffectData_DamageRangeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageRangeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageRangeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageRangeBonus";
	OnInit = "StExt_TimedEffect_Init_DamageRangeBonus";
};

instance StExt_TimedEffectData_DamageSpellBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageSpellBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageSpellBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageSpellBonus";
	OnInit = "StExt_TimedEffect_Init_DamageSpellBonus";
};

instance StExt_TimedEffectData_DotDurationBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DotDurationBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DotDurationBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 10;
	PowerRatio = 1;
	LoopName = "StExt_TimedEffect_Loop_DotDurationBonus";
	OnInit = "StExt_TimedEffect_Init_DotDurationBonus";
};

instance StExt_TimedEffectData_DamageDotBluntBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotBluntBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotBluntBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotBluntBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotBluntBonus";
};

instance StExt_TimedEffectData_DamageDotEdgeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotEdgeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotEdgeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotEdgeBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotEdgeBonus";
};

instance StExt_TimedEffectData_DamageDotFireBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotFireBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotFireBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotFireBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotFireBonus";
};

instance StExt_TimedEffectData_DamageDotFlyBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotFlyBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotFlyBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotFlyBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotFlyBonus";
};

instance StExt_TimedEffectData_DamageDotMagicBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotMagicBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotMagicBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotMagicBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotMagicBonus";
};

instance StExt_TimedEffectData_DamageDotPointBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotPointBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotPointBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotPointBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotPointBonus";
};

instance StExt_TimedEffectData_DamageDotFallBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotFallBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotFallBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotFallBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotFallBonus";
};

instance StExt_TimedEffectData_DamageTrueBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageTrueBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageTrueBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_DamageTrueBonus";
	OnInit = "StExt_TimedEffect_Init_DamageTrueBonus";
};

instance StExt_TimedEffectData_DamageDotTrueBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageDotTrueBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageDotTrueBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 50;
	LoopName = "StExt_TimedEffect_Loop_DamageDotTrueBonus";
	OnInit = "StExt_TimedEffect_Init_DamageDotTrueBonus";
};

instance StExt_TimedEffectData_ReflectTrueBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectTrueBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectTrueBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectTrueBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectTrueBonus";
};

instance StExt_TimedEffectData_ReflectBluntBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectBluntBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectBluntBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectBluntBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectBluntBonus";
};

instance StExt_TimedEffectData_ReflectEdgeBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectEdgeBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectEdgeBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectEdgeBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectEdgeBonus";
};

instance StExt_TimedEffectData_ReflectFireBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectFireBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectFireBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectFireBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectFireBonus";
};

instance StExt_TimedEffectData_ReflectFlyBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectFlyBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectFlyBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectFlyBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectFlyBonus";
};

instance StExt_TimedEffectData_ReflectMagicBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectMagicBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectMagicBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectMagicBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectMagicBonus";
};

instance StExt_TimedEffectData_ReflectPointBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectPointBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectPointBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectPointBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectPointBonus";
};

instance StExt_TimedEffectData_ReflectFallBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectFallBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectFallBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 5;
	MinValue = 1;
	MaxValue = 250;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_DamageReflectFallBonus";
	OnInit = "StExt_TimedEffect_Init_DamageReflectFallBonus";
};

instance StExt_TimedEffectData_ResistDotBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistDotBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistDotBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 150;
	PowerRatio = 15;
	LoopName = "StExt_TimedEffect_Loop_ResistDotBonus";
	OnInit = "StExt_TimedEffect_Init_ResistDotBonus";
};

instance StExt_TimedEffectData_ResistReflectBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ResistReflectBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ResistReflectBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 150;
	PowerRatio = 15;
	LoopName = "StExt_TimedEffect_Loop_ResistReflectBonus";
	OnInit = "StExt_TimedEffect_Init_ResistReflectBonus";
};

instance StExt_TimedEffectData_Elevation(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Elevation;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Elevation];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 100;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_Loop_Elevation";
	OnInit = "StExt_TimedEffect_Init_Elevation";
};

instance StExt_TimedEffectData_Firecape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Firecape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Firecape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Firecape";
	OnInit = "StExt_TimedEffect_Init_Firecape";
};

instance StExt_TimedEffectData_Icecape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Icecape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Icecape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Icecape";
	OnInit = "StExt_TimedEffect_Init_Icecape";
};

instance StExt_TimedEffectData_Lightingcape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Lightingcape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Lightingcape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Lightingcape";
	OnInit = "StExt_TimedEffect_Init_Lightingcape";
};

instance StExt_TimedEffectData_Darkcape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Darkcape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Darkcape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Darkcape";
	OnInit = "StExt_TimedEffect_Init_Darkcape";
};

instance StExt_TimedEffectData_Aircape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Aircape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Aircape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Aircape";
	OnInit = "StExt_TimedEffect_Init_Aircape";
};

instance StExt_TimedEffectData_Earthcape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Earthcape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Earthcape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Earthcape";
	OnInit = "StExt_TimedEffect_Init_Earthcape";
};

instance StExt_TimedEffectData_Poisioncape(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_Poisioncape;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Poisioncape];
	Flags = StExt_TimedEffect_Flag_Buff | StExt_TimedEffect_Flag_Spell | StExt_TimedEffect_Flag_CanUpdate;
	BaseValue = 10;
	MinValue = 10;
	MaxValue = 10000;
	PowerRatio = 100;
	Duration = 60;
	Range = 200;
	LoopName = "StExt_TimedEffect_Loop_Poisioncape";
	OnInit = "StExt_TimedEffect_Init_Poisioncape";
};

instance StExt_TimedEffectData_RegenAll(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_RegenAllBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_RegenAllBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 100;
	PowerRatio = 10;
	LoopName = "StExt_TimedEffect_Loop_AllRegen";
	OnInit = "StExt_TimedEffect_Init_AllRegen";
};

instance StExt_TimedEffectData_DamageAll(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_DamageAllBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_DamageAllBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	BaseValue = 10;
	MinValue = 1;
	MaxValue = 2500;
	LoopName = "StExt_TimedEffect_Loop_AllDamageBonus";
	OnInit = "StExt_TimedEffect_Init_AllDamageBonus";
};

instance StExt_TimedEffectData_StatsAllBonus(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_StatsAllBonus;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_StatsAllBonus];
	Flags = StExt_TimedEffect_Flag_Buff;
	LoopName = "StExt_TimedEffect_Loop_AllStatsBonus";
	OnInit = "StExt_TimedEffect_Init_AllStatsBonus";
};

instance StExt_TimedEffectData_ProtectionCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ProtectionCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ProtectionCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	BaseValue = 15;
	MinValue = 1;
	MaxValue = 350;
	PowerRatio = 25;
	LoopName = "StExt_TimedEffect_ProtDeBuff_Loop";
	OnInit = "StExt_TimedEffect_ProtDeBuff_Init";
};

instance StExt_TimedEffectData_StatsCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_StatsCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_StatsCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	BaseValue = 15;
	MinValue = 1;
	MaxValue = 500;
	PowerRatio = 35;
	LoopName = "StExt_TimedEffect_StatDeBuff_Loop";
	OnInit = "StExt_TimedEffect_StatDeBuff_Init";
};

instance StExt_TimedEffectData_LifeSiphonCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_SiphonCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_SiphonCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 100;
	PowerRatio = 5;
	LoopName = "StExt_TimedEffect_LifeSiphonDeBuff_Loop";
	OnInit = "StExt_TimedEffect_LifeSiphonDeBuff_Init";
};

instance StExt_TimedEffectData_SpeedCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_SpeedCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_SpeedCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	BaseValue = 1;
	MinValue = 1;
	MaxValue = 20;
	PowerRatio = 1;
	LoopName = "StExt_TimedEffect_SpeedDeBuff_Loop";
	OnInit = "StExt_TimedEffect_SpeedDeBuff_Init";
};

instance StExt_TimedEffectData_LifeTapCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_LifeTapCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_LifeTapCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	LoopName = "StExt_TimedEffect_FlaggedDeBuff_Loop";
	OnInit = "StExt_TimedEffect_LifeTapCurse_Init";
};

instance StExt_TimedEffectData_ReflectDamageCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ReflectDamageCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ReflectDamageCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	LoopName = "StExt_TimedEffect_FlaggedDeBuff_Loop";
	OnInit = "StExt_TimedEffect_ReflectDamageCurse_Init";
};

instance StExt_TimedEffectData_ExtraDamageCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_ExtraDamageCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_ExtraDamageCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	LoopName = "StExt_TimedEffect_FlaggedDeBuff_Loop";
	OnInit = "StExt_TimedEffect_ExtraDamageCurse_Init";
};

instance StExt_TimedEffectData_WeakenCurse(StExt_BaseTimedEffectData)
{
	Id = StExt_TimedEffect_Index_WeakenCurse;
	Name = StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_WeakenCurse];
	Flags = StExt_TimedEffect_Flag_DeBuff | StExt_TimedEffect_Flag_Spell;
	LoopName = "StExt_TimedEffect_FlaggedDeBuff_Loop";
	OnInit = "StExt_TimedEffect_WeakenCurse_Init";
};
