// This array required for initialization of all auras instances
// in case if aura instance not included here it will not be initialized!
const string StExt_AurasIndexArray[StExt_AuraIndex_Max] =
{
	"StExt_Aura_Concentrator",
	"StExt_Aura_BisonHeart",
	"StExt_Aura_AdanosWisdom",
	"StExt_Aura_HidenKnowlege",
	"StExt_Aura_BearStrength",
	"StExt_Aura_PumaAgility",
	"StExt_Aura_OwlHood",
	"StExt_Aura_WolfRegeneration",
	"StExt_Aura_CunningRaven",
	"StExt_Aura_DogEndurance",
	"StExt_Aura_Dreamer",
	"StExt_Aura_CheetahSpeed",
	"StExt_Aura_AstralFlow",
	"StExt_Aura_SnakeFlexebility",
	"StExt_Aura_Lich",
	"StExt_Aura_Mindflayer",
	"StExt_Aura_SoulStealer",
	"StExt_Aura_IronSkin",
	"StExt_Aura_WindShield",
	"StExt_Aura_SpellEater",
	"StExt_Aura_Luck",
	"StExt_Aura_Wealth",
	"StExt_Aura_Thief",
	"StExt_Aura_Necromancer",
	"StExt_Aura_Graveyard",
	"StExt_Aura_Forest",
	"StExt_Aura_Hell",
	"StExt_Aura_Golem",
	"StExt_Aura_Thorns",
	"StExt_Aura_MirrorShield",
	"StExt_Aura_Summoner",
	"StExt_Aura_Conjurer",
	"StExt_Aura_Stuner",
	"StExt_Aura_Burner",
	"StExt_Aura_Frezer",
	"StExt_Aura_Pray",
	"StExt_Aura_Death",
	"StExt_Aura_Poision",
	"StExt_Aura_Shock",
	"StExt_Aura_Curser",
	"StExt_Aura_Crusher",
	"StExt_Aura_Chopper",
	"StExt_Aura_Piercer",
	"StExt_Aura_WarriorTrance",
	"StExt_Aura_Shooter",
	"StExt_Aura_Archmage",
	"StExt_Aura_EthernalSkin",
	"StExt_Aura_Strurdy",
	"StExt_Aura_DeathFog",
	"StExt_Aura_CursedLands",
	"StExt_Aura_Blizzard",
	"StExt_Aura_Thunderstorm",
	"StExt_Aura_Miazma",
	"StExt_Aura_Roots",
	"StExt_Aura_Inferno",
	"StExt_Aura_Earthquake",
	"StExt_Aura_Preparation",
	"StExt_Aura_AutoFireBall",
	"StExt_Aura_AutoIcelance",
	"StExt_Aura_AutoDarkBall",
	"StExt_Aura_AutoDeathBall",
	"StExt_Aura_AutoLighting",
	"StExt_Aura_AutoAirFist",
	"StExt_Aura_AutoPoisionBall",
	"StExt_Aura_AutoStonedBolt",
	"StExt_Aura_ShadowWarrior",
	"StExt_Aura_Duration",
	"StExt_Aura_ShamanMasteryPower",
	"StExt_Aura_NecroMasteryPower",
	"StExt_Aura_GolemMasteryPower",
	"StExt_Aura_DemonMasteryPower",
	"StExt_Aura_DeathMasteryPower",
	"StExt_Aura_LifeMasteryPower",
	"StExt_Aura_LightMasteryPower",
	"StExt_Aura_DarkMasteryPower",
	"StExt_Aura_ElectricMasteryPower",
	"StExt_Aura_AirMasteryPower",
	"StExt_Aura_EarthMasteryPower",
	"StExt_Aura_IceMasteryPower",
	"StExt_Aura_FireMasteryPower",
	"StExt_Aura_1hMastery",
	"StExt_Aura_2hMastery",
	"StExt_Aura_BowMastery",
	"StExt_Aura_CBowMastery",
	"StExt_Aura_WeaponThrower",
	"StExt_Aura_DualMastery",	
	"StExt_Aura_ReflectDamageAsBlunt",
	"StExt_Aura_ReflectDamageAsEdge",
	"StExt_Aura_ReflectDamageAsPoint",
	"StExt_Aura_ReflectDamageAsFire",
	"StExt_Aura_ReflectDamageAsFly",
	"StExt_Aura_ReflectDamageAsMagic",
	"StExt_Aura_ReflectDamageAsPoision"
};

func int StExt_CheckAuraMana(var int min) { return (hero.attribute[2] >= min); };

prototype StExt_BaseAura(C_AuraData)
{
	Id = StExt_Null;
	Flags = 0;
	ReservedAtr = StExt_StatReservationType_None;
	ReservedValue = 0;
	Duration = 0;
	Chance = 0;
	PowerRatio = 100;
	CondAtr[0] = StExt_Null;
	CondAtr[1] = StExt_Null;
	CondAtr[2] = StExt_Null;	
	CondValue[0] = 0;
	CondValue[1] = 0;
	CondValue[2] = 0;
	StatId[0] = StExt_Null;
	StatId[1] = StExt_Null;
	StatId[2] = StExt_Null;
	StatId[3] = StExt_Null;
	StatId[4] = StExt_Null;	
	StatValue[0] = 0;
	StatValue[1] = 0;
	StatValue[2] = 0;
	StatValue[3] = 0;
	StatValue[4] = 0;
	MasteryId[0] = StExt_Null;
	MasteryId[1] = StExt_Null;
	MasteryId[2] = StExt_Null;
	OnOffence = StExt_EmptyString;
	OnDeffence = StExt_EmptyString;
	OnTick = StExt_EmptyString;
	BoundedItem = StExt_EmptyString;
	Effect = StExt_EmptyString;
};

// +100 aura power / cons 10% stam
instance StExt_Aura_Concentrator(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Concentrator;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_AuraPower;
	StatValue[0] = 100;
	BoundedItem = "itau_stext_Concentrator";
};

// Add hp - 5 per 1 aura power. req 200 stam / cons 15% stam
instance StExt_Aura_BisonHeart(StExt_BaseAura)
{
	Id = StExt_AuraIndex_BisonHeart;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 15;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_Hp;
	StatValue[0] = 5;
	BoundedItem = "itau_stext_BisonHeart";
	MasteryId[0] = StExt_MasteryIndex_Life;
};

// Add mp - 2 per 1 aura power. req int 100 / cons 25% stam
instance StExt_Aura_AdanosWisdom(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AdanosWisdom;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	StatId[0] = StExt_PcStats_Index_Mp;
	StatValue[0] = 2;
	BoundedItem = "itau_stext_AdanosWisdom";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
};

// Add int - 1 per 1 aura power. req 200 int / cons 20% mana
instance StExt_Aura_HidenKnowlege(StExt_BaseAura)
{
	Id = StExt_AuraIndex_HidenKnowlege;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_Int;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_HidenKnowlege";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
};

// Add str - 1 per 1 aura power. req 200 stam / 100 str / cons 15% stam
instance StExt_Aura_BearStrength(StExt_BaseAura)
{
	Id = StExt_AuraIndex_BearStrength;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 15;
	CondAtr[0] = StExt_PcStat_CondIndex_Str;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_St;
	CondValue[1] = 200;
	StatId[0] = StExt_PcStats_Index_Str;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_BearStrength";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_MartialArts;
	MasteryId[2] = StExt_MasteryIndex_FistFight;
};

// Add agi - 1 per 1 aura power. req 200 stam / 100 agi / cons 15% stam
instance StExt_Aura_PumaAgility(StExt_BaseAura)
{
	Id = StExt_AuraIndex_PumaAgility;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 15;
	CondAtr[0] = StExt_PcStat_CondIndex_Agi;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_St;
	CondValue[1] = 200;
	StatId[0] = StExt_PcStats_Index_Agi;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_PumaAgility";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Agile;
	MasteryId[2] = StExt_MasteryIndex_Archery;
};

// Add es - 5 per 1 aura pwer. req 200 int / cons 30% mana
instance StExt_Aura_OwlHood(StExt_BaseAura)
{
	Id = StExt_AuraIndex_OwlHood;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_Es;
	StatValue[0] = 5;
	BoundedItem = "itau_stext_OwlHood";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
};

// add hp regeneration - 0.1% per 10 aura power. req 200 stam / cons 25% stamina
instance StExt_Aura_WolfRegeneration(StExt_BaseAura)
{
	Id = StExt_AuraIndex_WolfRegeneration;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 25;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_HpRegPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_WolfRegeneration";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Blood;
};

// Add es regeneration - 0.1% per 10 aura power. req 200 int / cons 25% mana
instance StExt_Aura_CunningRaven(StExt_BaseAura)
{
	Id = StExt_AuraIndex_CunningRaven;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_EsRegPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_CunningRaven";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

// Add stam regeneration - 0.1% per 5 aura power. req 150 stam / cons 10% stamina
instance StExt_Aura_DogEndurance(StExt_BaseAura)
{
	Id = StExt_AuraIndex_DogEndurance;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 10;
	PowerRatio = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 150;
	StatId[0] = StExt_PcStats_Index_StRegPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_DogEndurance";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_MartialArts;
	MasteryId[2] = StExt_MasteryIndex_Archery;
};

// Add mana regeneration - 0.1% per 10 aura power. req 100 int / cons 15% mana
instance StExt_Aura_Dreamer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Dreamer;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 15;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	StatId[0] = StExt_PcStats_Index_MpRegPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Dreamer";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
	MasteryId[1] = StExt_MasteryIndex_Life;
};

// Add action speed - 1% per 10 aura power. req 250 stam / 75 agi / cons 35% stamina
instance StExt_Aura_CheetahSpeed(StExt_BaseAura)
{
	Id = StExt_AuraIndex_CheetahSpeed;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 35;
	PowerRatio = 5;
	CondAtr[0] = StExt_PcStat_CondIndex_Agi;
	CondValue[0] = 75;
	CondAtr[1] = StExt_PcStat_CondIndex_St;
	CondValue[1] = 250;
	StatId[0] = StExt_PcStats_Index_ExtraSpeed;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_CheetahSpeed";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Agile;
	MasteryId[2] = StExt_MasteryIndex_Archery;
};

// Increase spell power - 1 per 10 aura power. req 250 int / cons 40% mana
instance StExt_Aura_AstralFlow(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AstralFlow;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 40;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 250;
	StatId[0] = StExt_PcStats_Index_MagicPower;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_AstralFlow";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
};

// Add dodge chance - 1% per 10 aura power. req 200 stam / 100 agi / cons 35% stamina
instance StExt_Aura_SnakeFlexebility(StExt_BaseAura)
{
	Id = StExt_AuraIndex_SnakeFlexebility;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 35;
	PowerRatio = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Agi;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_St;
	CondValue[1] = 200;
	StatId[0] = StExt_PcStats_Index_DodgeChance;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_SnakeFlexebility";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Archery;
	MasteryId[2] = StExt_MasteryIndex_Agile;
};

// Lich hp - 0.1% from damage per 10 aura power. req 500 hp / cons 20% stamina
instance StExt_Aura_Lich(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Lich;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Hp;
	CondValue[0] = 500;
	StatId[0] = StExt_PcStats_Index_StealLifePerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Lich";
	MasteryId[0] = StExt_MasteryIndex_Blood;
	MasteryId[1] = StExt_MasteryIndex_Dark;
	MasteryId[2] = StExt_MasteryIndex_Death;
};

// Lich mp - 0.1% from damage per 10 aura power. req 500 mp / cons 20% mana
instance StExt_Aura_Mindflayer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Mindflayer;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 500;
	StatId[0] = StExt_PcStats_Index_StealManaPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Mindflayer";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
	MasteryId[1] = StExt_MasteryIndex_Death;
	MasteryId[2] = StExt_MasteryIndex_Dark;
};

// Lich es - 0.1% from damage per 10 aura power. req 500 es / cons 15% es
instance StExt_Aura_SoulStealer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_SoulStealer;
	ReservedAtr = StExt_StatReservationType_Es;
	ReservedValue = 15;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Es;
	CondValue[0] = 500;
	StatId[0] = StExt_PcStats_Index_StealEsPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_SoulStealer";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
	MasteryId[1] = StExt_MasteryIndex_Dark;
	MasteryId[2] = StExt_MasteryIndex_Death;
};

// Add weapon protection - 1 per 2 aura power. req 500 hp / cons 25% stamina
instance StExt_Aura_IronSkin(StExt_BaseAura)
{
	Id = StExt_AuraIndex_IronSkin;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 25;
	PowerRatio = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Hp;
	CondValue[0] = 500;	
	StatId[0] = StExt_PcStats_Index_ProtBlunt;
	StatValue[0] = 1;
	StatId[1] = StExt_PcStats_Index_ProtEdge;
	StatValue[1] = 1;
	StatId[2] = StExt_PcStats_Index_ProtPoint;
	StatValue[2] = 1;
	BoundedItem = "itau_stext_IronSkin";
	MasteryId[0] = StExt_MasteryIndex_Agile;
};

// Add chance to decline arrow - 0.5% per 10 aura power. req 300 hp / cons 35% stamina
instance StExt_Aura_WindShield(StExt_BaseAura)
{
	Id = StExt_AuraIndex_WindShield;
	ReservedAtr = StExt_StatReservationType_Es;
	ReservedValue = 35;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Hp;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ArrowsDeclineChance;
	StatValue[0] = 5;
	BoundedItem = "itau_stext_WindShield";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Air;
};

// Add chance to absorb spell - 0.5% per 10 aura power. req 250 int / 300 mp / cons 35% mana
instance StExt_Aura_SpellEater(StExt_BaseAura)
{
	Id = StExt_AuraIndex_SpellEater;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 35;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ArrowsDeclineChance;
	StatValue[0] = 5;
	BoundedItem = "itau_stext_SpellEater";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Shaman;
};

// Add luck - 0.5% per 10 aura power.
instance StExt_Aura_Luck(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Luck;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 15;
	PowerRatio = 10;
	StatId[0] = StExt_PcStats_Index_Luck;
	StatValue[0] = 5;
	BoundedItem = "itau_stext_Luck";
};

// Add luck gold - 1% per 10 aura power.
instance StExt_Aura_Wealth(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Wealth;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 15;
	PowerRatio = 10;
	StatId[0] = StExt_PcStats_Index_LuckGold;
	StatValue[0] = 10;
	BoundedItem = "itau_stext_Wealth";
};

// Add thief chance - 1% per 10 aura power. req 50 agi / cons 5% stamina
instance StExt_Aura_Thief(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Thief;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 5;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Agi;
	CondValue[0] = 50;
	StatId[0] = StExt_PcStats_Index_PickPocketChance;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Thief";
};

// Add chance to reanimate as skeleton. 0.1% per 10 aura power. req 250 int / 600 mp / cons 35% mana
instance StExt_Aura_Necromancer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Necromancer;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 35;
	PowerRatio = 10;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 250;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	StatId[0] = StExt_PcStats_Index_ChanceToReanimate;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Necromancer";
	MasteryId[0] = StExt_MasteryIndex_Death;
	MasteryId[1] = StExt_MasteryIndex_Necro;
};

// Always keep one summoned zombie protector. req 300 int / cons 35% mana
instance StExt_Aura_Graveyard(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Graveyard;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 35;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 300;
	OnTick = "StExt_Aura_Graveyard_OnTick";
	BoundedItem = "itau_stext_Graveyard";
	MasteryId[0] = StExt_MasteryIndex_Death;
	MasteryId[1] = StExt_MasteryIndex_Necro;
};
func void StExt_Aura_Graveyard_OnTick()
{
	var int count;
	count = 1;
	if (!StExt_CheckAuraMana(10)) { return; }
	if (!StExt_DoCastAuras) { return; };
	if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 200) { count += StExt_PcStats[StExt_PcStats_Index_AuraPower] / 200; };
	if (StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower] >= 300) { count += StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower] / 300; };
	if (Stext_SpecialSummons[StExt_SpecialSummonType_Zombie] < count) 
	{
		rx_saveparservars();
		wld_spawnnpcrange(hero, StExt_GetInstanceIdByName("summoned_zombie_proteсtor"), 1, 500.0);
		rx_restoreparservars();
	};
};

// Always keep one summoned wolf protector and one more for every 200 aura power. req 300 int / cons 35% mana
instance StExt_Aura_Forest(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Forest;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 35;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 300;
	OnTick = "StExt_Aura_Forest_OnTick";
	BoundedItem = "itau_stext_Forest";
	MasteryId[0] = StExt_MasteryIndex_Life;
};
func void StExt_Aura_Forest_OnTick()
{
	var int count;
	count = 1;
	if (!StExt_CheckAuraMana(10)) { return; }	
	if (!StExt_DoCastAuras) { return; };
	if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 100) { count += StExt_PcStats[StExt_PcStats_Index_AuraPower] / 100; };
	if (StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] >= 150) { count += StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower] / 150; };	
	if (Stext_SpecialSummons[StExt_SpecialSummonType_Wolf] < count) 
	{
		rx_saveparservars();
		wld_spawnnpcrange(hero, StExt_GetInstanceIdByName("summoned_wolf_protector"), 1, 500.0);
		rx_restoreparservars();
	};
};

// Always keep one summoned demon protector. req 500 int / cons 45% mana
instance StExt_Aura_Hell(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Hell;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 40;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 500;
	OnTick = "StExt_Aura_Hell_OnTick";
	BoundedItem = "itau_stext_Hell";
	MasteryId[0] = StExt_MasteryIndex_Dark;
	MasteryId[1] = StExt_MasteryIndex_Demon;
};
func void StExt_Aura_Hell_OnTick()
{
	var int count;
	count = 1;
	if (!StExt_CheckAuraMana(20)) { return; }
	if (!StExt_DoCastAuras) { return; };
	if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { count += StExt_PcStats[StExt_PcStats_Index_AuraPower] / 500; };
	if (StExt_PcStats[StExt_PcStats_Index_DemonMasteryPower] >= 500) { count += StExt_PcStats[StExt_PcStats_Index_DemonMasteryPower] / 500; };
	if (Stext_SpecialSummons[StExt_SpecialSummonType_Demon] < count) 
	{
		rx_saveparservars();
		wld_spawnnpcrange(hero, StExt_GetInstanceIdByName("summoned_demon_protector"), 1, 500.0);
		rx_restoreparservars();
	};
};

// Always keep one summoned golem protector. req 400 int / cons 40% mana
instance StExt_Aura_Golem(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Golem;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 40;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	OnTick = "StExt_Aura_Golem_OnTick";
	BoundedItem = "itau_stext_Golem";
	MasteryId[0] = StExt_MasteryIndex_Golem;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};
func void StExt_Aura_Golem_OnTick()
{
	var int count;
	count = 1;
	if (!StExt_CheckAuraMana(20)) { return; }
	if (!StExt_DoCastAuras) { return; };
	if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { count += StExt_PcStats[StExt_PcStats_Index_AuraPower] / 500; };
	if (StExt_PcStats[StExt_PcStats_Index_GolemMasteryPower] >= 500) { count += StExt_PcStats[StExt_PcStats_Index_GolemMasteryPower] / 500; };
	if (Stext_SpecialSummons[StExt_SpecialSummonType_Golem] < count) 
	{
		rx_saveparservars();
		wld_spawnnpcrange(hero, StExt_GetInstanceIdByName("summoned_golem_protector"), 1, 500.0);
		rx_restoreparservars();
	};
};

// Reflect 0.1% of damage per 1 aura power. req 300 stamina / cons 20% stamina
instance StExt_Aura_Thorns(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Thorns;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ReflectDamageChance;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Thorns";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

// Reflect spell chance - 0.1% per aura power. req 300 int / 500 mp / cons 20% mana
instance StExt_Aura_MirrorShield(StExt_BaseAura)
{
	Id = StExt_AuraIndex_MirrorShield;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 500;
	CondAtr[1] = StExt_PcStat_CondIndex_Int;
	CondValue[1] = 300;
	StatId[0] = StExt_PcStats_Index_ReflectSpellChance;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_MirrorShield";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Shaman;
};

// Add summon global power - 0.1% per aura power. req 200 int / cons 25% mana
instance StExt_Aura_Summoner(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Summoner;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_SumGlobalPower;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Summoner";
};

// Add summon slot - 1 per 100 aura power. req 350 int / 500 mp / cons 60% mana
instance StExt_Aura_Conjurer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Conjurer;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 60;
	PowerRatio = 1;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 500;
	CondAtr[1] = StExt_PcStat_CondIndex_Int;
	CondValue[1] = 350;
	StatId[0] = StExt_PcStats_Index_MaxSummonsCount;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Conjurer";
};

// Add chance to stun target. - 0.1% per 1 aura power. req 150str / cons 20% stam
instance StExt_Aura_Stuner(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Stuner;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	CondAtr[1] = StExt_PcStat_CondIndex_Str;
	CondValue[1] = 150;
	StatId[0] = StExt_PcStats_Index_StunChance;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Stuner";
	MasteryId[0] = StExt_MasteryIndex_Archery;
	MasteryId[1] = StExt_MasteryIndex_MartialArts;
	MasteryId[2] = StExt_MasteryIndex_FistFight;
};

// Add chance to burn target - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 mp / cons 25% mana
instance StExt_Aura_Burner(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Burner;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_FireDotDamage;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Burner";
	MasteryId[0] = StExt_MasteryIndex_Fire;
};

// Add 0.1% chance to freeze target and deal 1 magic damage per 1 aura power. req 200 mp / cons 25% mana
instance StExt_Aura_Frezer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Frezer;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_FreezeChance;
	StatValue[0] = 1;
	StatId[1] = StExt_PcStats_Index_ExtraMagicDam;
	StatValue[1] = 1;
	BoundedItem = "itau_stext_Frezer";
	MasteryId[0] = StExt_MasteryIndex_Ice;
	MasteryId[1] = StExt_MasteryIndex_Air;
};

// 1 fire damage against evil and undead per 1 aura power every tick. req 350mp / cons 30% mana
instance StExt_Aura_Pray(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Pray;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 350;
	OnTick = "StExt_Aura_Pray_OnTick";
	BoundedItem = "itau_stext_Pray";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Light;
	MasteryId[2] = StExt_MasteryIndex_Life;
};

var int StExt_Aura_Pray_OnTick_ExpDamage;
func int StExt_Aura_Pray_OnTick_DamageSelector()
{
	if(!hlp_isvalidnpc(StExt_Other)) {
		StExt_PrintDebug("StExt_Aura_Pray_OnTick_DamageSelector()", "Instance is null!", StExt_Self, StExt_Other);
		return false;
	};
	if (!StExt_NpcsIsEnemies(StExt_Self, StExt_Other)) { return false; };
	if ((c_npcisevil(StExt_Other) || c_npcisundead(StExt_Other)) && (StExt_Self.attribute[2] > 1))
	{
		rx_playeffect("SPELLFX_DESTROYUNDEAD_COLLIDE", StExt_Other);
		StExt_AddMasteryExp(StExt_MasteryIndex_Light, StExt_Aura_Pray_OnTick_ExpDamage);
		StExt_Self.attribute[2] -= 1;
		return true;
	};
	return false;
};
func void StExt_Aura_Pray_OnTick()
{
	var int tmpMana;
	var C_ExtraDamageInfo desc;
	
	if (!StExt_CheckAuraMana(1)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if(!Hlp_IsNULL(StExt_CurrentAura))
	{
		desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
		if (Hlp_IsNull(desc)) { return; };
		
		StExt_InitializeScriptDamageDesc(desc);		
		
		desc.TotalDamage = 50 + (hero.level) + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_LightMasteryPower];
		desc.DamageType = StExt_DamageType_Light;
		desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe;
		desc.MaxTargets = 8 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
		desc.Radius = 300 + StExt_PcStats[StExt_PcStats_Index_AuraDist];
		
		desc.Damage[dam_index_fire] = StExt_GetPercentFromValue(desc.TotalDamage, 70);
		desc.Damage[dam_index_magic] = StExt_GetPercentFromValue(desc.TotalDamage, 30);
		
		StExt_Aura_Pray_OnTick_ExpDamage = desc.TotalDamage;
		StExt_ApplyScriptDamage(hero, StExt_NullNpc, desc, StExt_Aura_Pray_OnTick_DamageSelector);
		StExt_Struct_Free(desc);
	};
};

// Damage against humans, animals and orcs - 1 per 1 aura power. req 250 stamina / cons 15% stamina
instance StExt_Aura_Death(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Death;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 250;
	StatId[0] = StExt_PcStats_Index_HumanExtraDam;
	StatValue[0] = 1;
	StatId[1] = StExt_PcStats_Index_OrcExtraDam;
	StatValue[1] = 1;
	StatId[2] = StExt_PcStats_Index_AnimalExtraDam;
	StatValue[2] = 1;
	BoundedItem = "itau_stext_Death";
	MasteryId[0] = StExt_MasteryIndex_Death;
	MasteryId[1] = StExt_MasteryIndex_Necro;
	MasteryId[2] = StExt_MasteryIndex_Dark;
};

// Add chance to poision target - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 stamina / cons 20% stamina
instance StExt_Aura_Poision(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Poision;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 200;
	StatId[0] = StExt_PcStats_Index_PoisDotDamage;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Poision";
	MasteryId[0] = StExt_MasteryIndex_Life;
};

// Add chance to stun target and deal magic damage - 2dmg per 1 aura power && 1% chance per 10 aura power. req 200 mp / cons 20% mana
instance StExt_Aura_Shock(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Shock;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 250;
	StatId[0] = StExt_PcStats_Index_ExtraMagicDam;
	StatValue[0] = 1;
	StatId[1] = StExt_PcStats_Index_StunChance;
	StatValue[1] = 1;
	BoundedItem = "itau_stext_Shock";
	MasteryId[0] = StExt_MasteryIndex_Electric;
};

// Add chance to add magic dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 mp / cons 20% mana
instance StExt_Aura_Curser(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Curser;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 250;
	StatId[0] = StExt_PcStats_Index_MagicDotDamage;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Curser";
	MasteryId[0] = StExt_MasteryIndex_Dark;
};

// Add chance to add blunt dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 str / cons 20% stam
instance StExt_Aura_Crusher(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Crusher;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_BluntDotDamage;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Crusher";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Archery;
};

// Add chance to add edge dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 stam / cons 20% stam
instance StExt_Aura_Chopper(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Chopper;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_EdgeDotDamage;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Chopper";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Archery;
};

// Add chance to add point dot - 1dmg per 1 aura power && 1% chance per 10 aura power. req 200 agi / cons 20% stam
instance StExt_Aura_Piercer(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Piercer;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_PointDotDamage;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Piercer";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Archery;
};

// Add melee weap damage. 0.1% per 1 aura power. req 300 stam / cons 25% stamina
instance StExt_Aura_WarriorTrance(StExt_BaseAura)
{
	Id = StExt_AuraIndex_WarriorTrance;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ExtraMeleeDamPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_WarriorTrance";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
};

// Add range weap damage. 0.1% per 1 aura power. req 300 stam / cons 25% stamina
instance StExt_Aura_Shooter(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Shooter;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ExtraRangeDamPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Shooter";
	MasteryId[0] = StExt_MasteryIndex_Archery;
};

// Add range rune damage. 0.1% per 1 aura power. req 300 mp / cons 25% mp
instance StExt_Aura_Archmage(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Archmage;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ExtraSpellDamPerc;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Archmage";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
};

// Add magic protection - 1 per 2 aura power. req 300 mp / cons 25% mana
instance StExt_Aura_EthernalSkin(StExt_BaseAura)
{
	Id = StExt_AuraIndex_EthernalSkin;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	PowerRatio = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Mp;
	CondValue[0] = 300;
	StatId[0] = StExt_PcStats_Index_ProtFire;
	StatValue[0] = 1;
	StatId[1] = StExt_PcStats_Index_ProtMagic;
	StatValue[1] = 1;
	BoundedItem = "itau_stext_EthernalSkin";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Shaman;
};

// Add fly protection - 1 per aura power. req 300 stam / 500 hp / cons 20% stam
instance StExt_Aura_Strurdy(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Strurdy;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	CondAtr[1] = StExt_PcStat_CondIndex_Hp;
	CondValue[1] = 500;
	StatId[0] = StExt_PcStats_Index_ProtFly;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Strurdy";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Life;
};

// On hit get - cast death fog and deal 2 magic dmg per 1 aura power. req 400 int / 600mp / cons 25% mana  
instance StExt_Aura_DeathFog(StExt_BaseAura)
{
	Id = StExt_AuraIndex_DeathFog;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_DeathFog_OnApply";
	OnOffence = "StExt_Aura_DeathFog_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_DeathFog";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Death;
	MasteryId[2] = StExt_MasteryIndex_Necro;
};

func void StExt_Aura_DeathFog_OnApply()
{	
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);	

	desc.TotalDamage = 2 * (StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower] + StExt_PcStats[StExt_PcStats_Index_NecroMasteryPower]) + atr_intellect + StExt_MinDamage;
	desc.DamageType = StExt_DamageType_Dark | StExt_DamageType_Death;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_magic] = desc.TotalDamage;
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Death, desc.TotalDamage);
	StExt_AddMasteryExp(StExt_MasteryIndex_Necro, desc.TotalDamage);
	rx_playeffect("spellfx_massdeath", hero);
};

// On hit get - cast dark wave and deal 1 magic dot dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
instance StExt_Aura_CursedLands(StExt_BaseAura)
{
	Id = StExt_AuraIndex_CursedLands;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_CursedLands_OnApply";
	OnOffence = "StExt_Aura_CursedLands_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_CursedLands";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Death;
	MasteryId[2] = StExt_MasteryIndex_Demon;
};

func void StExt_Aura_CursedLands_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);	

	desc.TotalDamage = ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower] + StExt_PcStats[StExt_PcStats_Index_DemonMasteryPower]) + atr_intellect + StExt_MinDamage) / 2;
	desc.TotalDotDamage = desc.TotalDamage;
	desc.DamageType = StExt_DamageType_Dark | StExt_DamageType_Death;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_magic] = desc.TotalDamage;
	desc.DotDamage[dam_index_magic] = desc.TotalDotDamage;
	desc.Ticks[dam_index_magic] = 2 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 1) / 200);
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Death, desc.TotalDamage * 3);
	StExt_AddMasteryExp(StExt_MasteryIndex_Demon, desc.TotalDamage * 3);
	rx_playeffect("spellfx_darkwave", hero);
};

// On hit get - cast ice wave and deal 1 magic dmg per 1 aura power and freeze targets(chance). req 400 int / 600mp / cons 25% mana
instance StExt_Aura_Blizzard(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Blizzard;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_Blizzard_OnApply";
	OnOffence = "StExt_Aura_Blizzard_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_Blizzard";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Air;
	MasteryId[2] = StExt_MasteryIndex_Ice;
};

func void StExt_Aura_Blizzard_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);

	desc.TotalDamage = 2 * (StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_IceMasteryPower] + StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]) + atr_intellect + StExt_MinDamage;
	desc.DamageType = StExt_DamageType_Ice | StExt_DamageType_Air;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_magic] = desc.TotalDamage;
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Air, desc.TotalDamage);
	StExt_AddMasteryExp(StExt_MasteryIndex_Ice, desc.TotalDamage);
	rx_playeffect("spellfx_icewave", hero);
};

// On hit get - cast electric wave and deal 2 magic dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
instance StExt_Aura_Thunderstorm(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Thunderstorm;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_Thunderstorm_OnApply";
	OnOffence = "StExt_Aura_Thunderstorm_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_Thunderstorm";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Electric;
	MasteryId[2] = StExt_MasteryIndex_Air;
};

func void StExt_Aura_Thunderstorm_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);

	desc.TotalDamage = 2 * (StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower] + StExt_PcStats[StExt_PcStats_Index_AirMasteryPower]) + atr_intellect + StExt_MinDamage;
	desc.DamageType = StExt_DamageType_Electric | StExt_DamageType_Air;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_magic] = desc.TotalDamage;
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Air, desc.TotalDamage);
	StExt_AddMasteryExp(StExt_MasteryIndex_Electric, desc.TotalDamage);
	rx_playeffect("spellfx_electrowave", hero);
};

// On hit get - cast poision wave and deal 1 magic dot dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
instance StExt_Aura_Miazma(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Miazma;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_Miazma_OnApply";
	OnOffence = "StExt_Aura_Miazma_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_Miazma";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

func void StExt_Aura_Miazma_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);

	desc.TotalDamage = ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]) + atr_intellect + StExt_MinDamage) / 2;
	desc.TotalDotDamage = desc.TotalDamage;
	desc.DamageType = StExt_DamageType_Poision | StExt_DamageType_Life;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_fall] = desc.TotalDamage;
	desc.DotDamage[dam_index_fall] = desc.TotalDotDamage;
	desc.Ticks[dam_index_fall] = 2 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 1) / 200);
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Life, desc.TotalDamage * 3);
	rx_playeffect("spellfx_incovation_green", hero);
};

// On hit get - cast poision wave and deal 1 magic dot dmg per 1 aura power and root enemies(chance). req 400 int / 600mp / cons 25% mana
instance StExt_Aura_Roots(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Roots;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_Roots_OnApply";
	OnOffence = "StExt_Aura_Roots_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_Roots";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

func void StExt_Aura_Roots_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);

	desc.TotalDamage = ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower]) + atr_intellect + StExt_MinDamage) / 2;
	desc.TotalDotDamage = desc.TotalDamage;
	desc.DamageType = StExt_DamageType_Poision | StExt_DamageType_Life;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_fall] = desc.TotalDamage;
	desc.DotDamage[dam_index_fall] = desc.TotalDotDamage;
	desc.Ticks[dam_index_fall] = 2 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 1) / 200);
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Life, desc.TotalDamage * 3);
	rx_playeffect("spellfx_incovation_green", hero);
};

// On hit get - cast fire wave and deal 1 fire dot dmg per 1 aura power. req 400 int / 600mp / cons 25% mana
instance StExt_Aura_Inferno(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Inferno;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_Inferno_OnApply";
	OnOffence = "StExt_Aura_Inferno_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_Inferno";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Air;
	MasteryId[2] = StExt_MasteryIndex_Fire;
};

func void StExt_Aura_Inferno_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);

	desc.TotalDamage = ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_FireMasteryPower]) + atr_intellect + StExt_MinDamage) / 2;
	desc.TotalDotDamage = desc.TotalDamage;
	desc.DamageType = StExt_DamageType_Air | StExt_DamageType_Fire;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_fire] = desc.TotalDamage;
	desc.DotDamage[dam_index_fire] = desc.TotalDotDamage;
	desc.Ticks[dam_index_fire] = 2 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 1) / 200);
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Air, desc.TotalDamage * 3);
	StExt_AddMasteryExp(StExt_MasteryIndex_Fire, desc.TotalDamage * 3);
	rx_playeffect("spellfx_firewave", hero);
};

// On hit get - cast earth quake and deal 3 blunt dmg per 1 aura power and stun (chance) target. req 400 int / 600mp / cons 25% mana
instance StExt_Aura_Earthquake(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Earthquake;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 25;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 400;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 600;
	OnDeffence = "StExt_Aura_Earthquake_OnApply";
	OnOffence = "StExt_Aura_Earthquake_OnApply";
	Chance = 100;
	BoundedItem = "itau_stext_Earthquake";
	MasteryId[0] = StExt_MasteryIndex_Agile;
	MasteryId[1] = StExt_MasteryIndex_Earth;
};

func void StExt_Aura_Earthquake_OnApply()
{
	var C_ExtraDamageInfo desc;
	if(Hlp_IsNULL(StExt_CurrentAura)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (!StExt_Chance(StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance])) { return; };
	
	desc = StExt_Struct_Alloc(StExt_Struct_Sizeof("C_ExtraDamageInfo"));
	if (Hlp_IsNull(desc)) { return; };
	
	StExt_InitializeScriptDamageDesc(desc);

	desc.TotalDamage = 2 *(StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower]) + atr_intellect + StExt_MinDamage;
	desc.DamageType = StExt_DamageType_Air | StExt_DamageType_Earth;
	desc.DamageFlags = StExt_DamageFlag_Aura | StExt_DamageFlag_Aoe | StExt_DamageFlag_Dot;
	desc.MaxTargets = 12 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 10) / 50);
	desc.Radius = StExt_ValidateValueRange(200 + ((StExt_PcStats[StExt_PcStats_Index_AuraDist] + 1) / 2), 200, 1500);
	desc.Damage[dam_index_fly] = desc.TotalDamage;
	
	StExt_ApplyScriptPendingDamage(hero, StExt_NullNpc, desc, StExt_NpcsIsEnemies_Engine);
	StExt_Struct_Free(desc);
	
	StExt_AddMasteryExp(StExt_MasteryIndex_Air, desc.TotalDamage);
	StExt_AddMasteryExp(StExt_MasteryIndex_Earth, desc.TotalDamage);	
	rx_playeffect("spellfx_quake", hero);
};

// On hit get - become immortal for short time. req 500 stam / 1000 hp / cons 25% stamina
instance StExt_Aura_Preparation(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Preparation;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 30;
	CondAtr[0] = StExt_PcStat_CondIndex_Hp;
	CondValue[0] = 1000;
	CondAtr[1] = StExt_PcStat_CondIndex_St;
	CondValue[1] = 500;
	OnDeffence = "StExt_Aura_Preparation_OnDeffence";
	Chance = 100;
	BoundedItem = "itau_stext_Preparation";
	MasteryId[0] = StExt_MasteryIndex_Life;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};
func void StExt_Aura_Preparation_OnDeffence()
{
	var int chance;
	var int damage;
	if(!Hlp_IsNULL(StExt_CurrentAura))
	{
		chance = StExt_CurrentAura.Chance + StExt_PcStats[StExt_PcStats_Index_AuraChance];
		if (StExt_Chance(chance))
		{
			rx_playeffect("spellFX_LIGHTSTAR_VIOLET", hero);			
			snd_play("SFX_HealObsession");
			StExt_ImmortalFlagTime += 3 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 1) / 200);
			hero.flags = npc_flag_immortal;
		};
	};
};

instance StExt_Aura_AutoFireBall(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoFireBall;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoFireBall_OnTick";
	BoundedItem = "itau_stext_AutoFireBall";
	MasteryId[0] = StExt_MasteryIndex_Fire;
};
func void StExt_Aura_AutoFireBall_OnTick()
{
	var int damage;
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 100 + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_FireMasteryPower];		
		StExt_AddMasteryExp(StExt_MasteryIndex_Fire, (damage + 1) / 2);
		StExt_CastSpell(spl_instantfireball, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 150) { StExt_CastSpell(spl_instantfireball, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 300) { StExt_CastSpell(spl_instantfireball, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_instantfireball, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoIcelance(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoIcelance;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoIcelance_OnTick";
	BoundedItem = "itau_stext_AutoIcelance";
	MasteryId[0] = StExt_MasteryIndex_Ice;
};
func void StExt_Aura_AutoIcelance_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 100 + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_IceMasteryPower];		
		StExt_AddMasteryExp(StExt_MasteryIndex_Ice, (damage + 1) / 2);
		StExt_CastSpell(spl_icelance, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 150) { StExt_CastSpell(spl_icelance, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 300) { StExt_CastSpell(spl_icelance, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_icelance, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoDarkBall(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoDarkBall;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoDarkBall_OnTick";
	BoundedItem = "itau_stext_AutoDarkBall";
	MasteryId[0] = StExt_MasteryIndex_Dark;
};
func void StExt_Aura_AutoDarkBall_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 100 + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower];		
		StExt_AddMasteryExp(StExt_MasteryIndex_Dark, (damage + 1) / 2);
		StExt_CastSpell(spl_darkball, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 150) { StExt_CastSpell(spl_darkball, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 300) { StExt_CastSpell(spl_darkball, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_darkball, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoDeathBall(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoDeathBall;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoDeathBall_OnTick";
	BoundedItem = "itau_stext_AutoDeathBall";
	MasteryId[0] = StExt_MasteryIndex_Death;
};
func void StExt_Aura_AutoDeathBall_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 100 + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_DeathMasteryPower];		
		StExt_AddMasteryExp(StExt_MasteryIndex_Death, (damage + 1) / 2);
		StExt_CastSpell(spl_deathball, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 150) { StExt_CastSpell(spl_deathball, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 300) { StExt_CastSpell(spl_deathball, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_deathball, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoLighting(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoLighting;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoLighting_OnTick";
	BoundedItem = "itau_stext_AutoLighting";
	MasteryId[0] = StExt_MasteryIndex_Electric;
};
func void StExt_Aura_AutoLighting_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 100 + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_ElectricMasteryPower];		
		StExt_AddMasteryExp(StExt_MasteryIndex_Electric, (damage + 1) / 2);
		StExt_CastSpell(spl_chargezap, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 150) { StExt_CastSpell(spl_chargezap, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 300) { StExt_CastSpell(spl_chargezap, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_chargezap, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoAirFist(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoAirFist;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoAirFist_OnTick";
	BoundedItem = "itau_stext_AutoAirFist";
	MasteryId[0] = StExt_MasteryIndex_Air;
};
func void StExt_Aura_AutoAirFist_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 5 + (StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_AirMasteryPower] + 1) / 2;		
		StExt_AddMasteryExp(StExt_MasteryIndex_Air, (damage + 1) / 2);
		StExt_CastSpell(spl_windfist, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_windfist, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoPoisionBall(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoPoisionBall;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoPoisionBall_OnTick";
	BoundedItem = "itau_stext_AutoPoisionBall";
	MasteryId[0] = StExt_MasteryIndex_Life;
};
func void StExt_Aura_AutoPoisionBall_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 100 + StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_LifeMasteryPower];		
		StExt_AddMasteryExp(StExt_MasteryIndex_Life, (damage + 1) / 2);
		StExt_CastSpell(spl_acid, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 150) { StExt_CastSpell(spl_acid, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 300) { StExt_CastSpell(spl_acid, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_acid, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_AutoStonedBolt(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AutoStonedBolt;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 50;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;
	CondAtr[1] = StExt_PcStat_CondIndex_Mp;
	CondValue[1] = 200;
	OnTick = "StExt_Aura_AutoStonedBolt_OnTick";
	BoundedItem = "itau_stext_AutoStonedBolt";
	MasteryId[0] = StExt_MasteryIndex_Earth;
};
func void StExt_Aura_AutoStonedBolt_OnTick()
{
	var int damage;
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_CheckAuraMana(StExt_AuraAutoCast_Cost)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 5 + (StExt_PcStats[StExt_PcStats_Index_AuraPower] + StExt_PcStats[StExt_PcStats_Index_EarthMasteryPower] + 1) / 2;		
		StExt_AddMasteryExp(StExt_MasteryIndex_Earth, (damage + 1) / 2);
		StExt_CastSpell(spl_stonefirst, hero, StExt_Other, damage);
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 250) { StExt_CastSpell(spl_stonefirst, hero, StExt_Other, damage); };
		if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { StExt_CastSpell(spl_stonefirst, hero, StExt_Other, damage); };
	};
};

instance StExt_Aura_ShadowWarrior(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ShadowWarrior;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Hp;
	CondValue[0] = 500;
	OnTick = "StExt_Aura_ShadowWarrior_OnTick";
	BoundedItem = "itau_stext_ShadowWarrior";
	MasteryId[0] = StExt_MasteryIndex_Dark;
	MasteryId[1] = StExt_MasteryIndex_Necro;
};
func void StExt_Aura_ShadowWarrior_OnTick()
{
	var int count;
	count = 1;
	if (!StExt_CheckAuraMana(15)) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (StExt_PcStats[StExt_PcStats_Index_AuraPower] >= 500) { count += StExt_PcStats[StExt_PcStats_Index_AuraPower] / 500; };
	if (StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower] >= 500) { count += StExt_PcStats[StExt_PcStats_Index_DarkMasteryPower] / 500; };
	if (Stext_SpecialSummons[StExt_SpecialSummonType_Shadow] < count) 
	{
		rx_saveparservars();
		wld_spawnnpcrange(hero, StExt_GetInstanceIdByName("stext_heroshadow"), 1, 500.0);
		rx_restoreparservars();
	};
};

// Add magic protection - 1 per 2 aura power. req 300 mp / cons 25% mana
instance StExt_Aura_Duration(StExt_BaseAura)
{
	Id = StExt_AuraIndex_Duration;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 15;
	PowerRatio = 100;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;
	StatId[0] = StExt_PcStats_Index_EffectDuration;
	StatValue[0] = 1;
	BoundedItem = "itau_stext_Duration";
};

instance StExt_Aura_FireMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_FireMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_FireMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_FireMasteryPower";	
	MasteryId[0] = StExt_MasteryIndex_Fire;
};

instance StExt_Aura_IceMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_IceMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_IceMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_IceMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Ice;
};

instance StExt_Aura_EarthMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_EarthMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_EarthMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_EarthMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Earth;
};

instance StExt_Aura_AirMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_AirMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_AirMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_AirMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Air;
};

instance StExt_Aura_ElectricMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ElectricMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_ElectricMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_ElectricMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Electric;
};

instance StExt_Aura_DarkMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_DarkMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_DarkMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_DarkMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Dark;
};

instance StExt_Aura_LightMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_LightMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_LightMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_LightMasteryPower";	
	MasteryId[0] = StExt_MasteryIndex_Light;
};

instance StExt_Aura_LifeMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_LifeMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_LifeMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_LifeMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Life;
};

instance StExt_Aura_DeathMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_DeathMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_DeathMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_DeathMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Death;
};

instance StExt_Aura_DemonMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_DemonMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_DemonMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_DemonMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Demon;
};

instance StExt_Aura_GolemMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_GolemMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_GolemMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_GolemMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Golem;
};

instance StExt_Aura_NecroMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_NecroMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_NecroMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_NecroMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Necro;
};

instance StExt_Aura_ShamanMasteryPower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ShamanMasteryPower;
	ReservedAtr = StExt_StatReservationType_Mp;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_Int;
	CondValue[0] = 100;	
	PowerRatio = 75;
	StatId[0] = StExt_PcStats_Index_ShamanMasteryPower;
	StatValue[0] = 1;	
	BoundedItem = "itau_stext_ShamanMasteryPower";
	MasteryId[0] = StExt_MasteryIndex_Shaman;
};

instance StExt_Aura_1hMastery(StExt_BaseAura)
{
	Id = StExt_AuraIndex_1hMastery;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_1hExtraDam;
	StatValue[0] = 3;	
	BoundedItem = "itau_stext_1hMastery";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
};

instance StExt_Aura_2hMastery(StExt_BaseAura)
{
	Id = StExt_AuraIndex_2hMastery;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_2hExtraDam;
	StatValue[0] = 3;	
	BoundedItem = "itau_stext_2hMastery";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
};

instance StExt_Aura_BowMastery(StExt_BaseAura)
{
	Id = StExt_AuraIndex_BowMastery;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_BowExtraDam;
	StatValue[0] = 3;	
	BoundedItem = "itau_stext_BowMastery";
	MasteryId[0] = StExt_MasteryIndex_Archery;
};

instance StExt_Aura_CBowMastery(StExt_BaseAura)
{
	Id = StExt_AuraIndex_CBowMastery;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_CBowExtraDam;
	StatValue[0] = 3;	
	BoundedItem = "itau_stext_CBowMastery";
	MasteryId[0] = StExt_MasteryIndex_Archery;
};

instance StExt_Aura_WeaponThrower(StExt_BaseAura)
{
	Id = StExt_AuraIndex_WeaponThrower;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 35;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 300;
	OnTick = "StExt_Aura_WeaponThrower_OnTick";
	BoundedItem = "itau_stext_WeaponThrower";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Archery;
};
func void StExt_Aura_WeaponThrower_OnTick()
{
	var int damage;
	var string weaponInstanceName;
	var c_item weap;
	
	if (!infomanager_hasfinished() || !rx_notindialog(hero) || StExt_GamePaused()) { return; };
	if (!StExt_DoCastAuras) { return; };
	if (atr_stamina <= 15) { return; };
	
	weap = npc_getequippedmeleeweapon(hero);
	if (!hlp_isvaliditem(weap)) { weap = npc_getreadiedweapon(hero); };
	
	if (hlp_isvaliditem(weap) && StExt_FindTargetInRadius(hero, StExt_PcStats[StExt_PcStats_Index_AuraDist], "StExt_PcDebuffSelector"))
	{
		damage = 5 + ((StExt_PcStats[StExt_PcStats_Index_AuraPower] + 1) / 2);
		damage += StExt_GetPercentFromValue(5 + hero.attribute[4] + hero.attribute[5], 35);
		damage += (StExt_Talent_Progression[StExt_MasteryIndex_MartialArts] + StExt_Talent_Progression[StExt_MasteryIndex_Archery]) * 2;
		damage += (1 + weap.damagetotal + StExt_CalcWeaponTotalDamage(weap)) / 2;
		
		StExt_GetItemInstanceName(weap);
		weaponInstanceName = StExt_ReturnString;
		
		if (StExt_ThrowItem(hero, StExt_Other, weaponInstanceName, damage, weap.damagetype))
		{
			rx_restorestamina(-15);
			StExt_AddMasteryExp(StExt_MasteryIndex_MartialArts, (damage + 1) / 2);
			StExt_AddMasteryExp(StExt_MasteryIndex_Archery, (damage + 1) / 2);
		}
		else { StExt_PrintDebug("StExt_Aura_WeaponThrower_OnTick(...)", "Fail to throw item...", hero, StExt_Other); };				
	};
};

instance StExt_Aura_DualMastery(StExt_BaseAura)
{
	Id = StExt_AuraIndex_DualMastery;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_DualExtraDam;
	StatValue[0] = 3;	
	BoundedItem = "itau_stext_DualMastery";
	MasteryId[0] = StExt_MasteryIndex_Archery;
	MasteryId[1] = StExt_MasteryIndex_MartialArts;
};

instance StExt_Aura_ReflectDamageAsBlunt(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsBlunt;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsBlunt;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsBlunt";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

instance StExt_Aura_ReflectDamageAsEdge(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsEdge;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsEdge;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsEdge";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

instance StExt_Aura_ReflectDamageAsPoint(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsPoint;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsPoint;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsPoint";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

instance StExt_Aura_ReflectDamageAsFire(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsFire;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsFire;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsFire";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

instance StExt_Aura_ReflectDamageAsFly(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsFly;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsFly;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsFly";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

instance StExt_Aura_ReflectDamageAsMagic(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsMagic;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsMagic;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsMagic";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};

instance StExt_Aura_ReflectDamageAsPoision(StExt_BaseAura)
{
	Id = StExt_AuraIndex_ReflectDamageAsPoision;
	ReservedAtr = StExt_StatReservationType_St;
	ReservedValue = 20;
	CondAtr[0] = StExt_PcStat_CondIndex_St;
	CondValue[0] = 100;	
	PowerRatio = 100;
	StatId[0] = StExt_PcStats_Index_ReflectDamageAsPoision;
	StatValue[0] = 5;	
	BoundedItem = "itau_stext_ReflectDamageAsPoision";
	MasteryId[0] = StExt_MasteryIndex_MartialArts;
	MasteryId[1] = StExt_MasteryIndex_Agile;
};
