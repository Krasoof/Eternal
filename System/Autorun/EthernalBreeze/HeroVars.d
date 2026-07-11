//===================================================================//
//					 Hero skills and talents						 //
//===================================================================//
var int StExt_Talent_Level[StExt_MasteryIndex_Max];
var int StExt_Talent_Progression[StExt_MasteryIndex_Max];
var int StExt_Talent_ExpNow[StExt_MasteryIndex_Max];
var int StExt_Talent_ExpNext[StExt_MasteryIndex_Max];
var int StExt_Talent_PerkPoints[StExt_MasteryIndex_Max];

// Number at the end is mastery index
var int StExt_Perk_0[StExt_MasteryPerk_Max];
var int StExt_Perk_1[StExt_MasteryPerk_Max];
var int StExt_Perk_2[StExt_MasteryPerk_Max];
var int StExt_Perk_3[StExt_MasteryPerk_Max];
var int StExt_Perk_4[StExt_MasteryPerk_Max];
var int StExt_Perk_5[StExt_MasteryPerk_Max];
var int StExt_Perk_6[StExt_MasteryPerk_Max];
var int StExt_Perk_7[StExt_MasteryPerk_Max];
var int StExt_Perk_8[StExt_MasteryPerk_Max];
var int StExt_Perk_9[StExt_MasteryPerk_Max];
var int StExt_Perk_10[StExt_MasteryPerk_Max];
var int StExt_Perk_11[StExt_MasteryPerk_Max];
var int StExt_Perk_12[StExt_MasteryPerk_Max];
var int StExt_Perk_13[StExt_MasteryPerk_Max];
var int StExt_Perk_14[StExt_MasteryPerk_Max];
var int StExt_Perk_15[StExt_MasteryPerk_Max];

// Other perks
var int StExt_Perk[StExt_Perk_Max];

// Professions
var int StExt_Profession_Level[StExt_ProfessionIndex_Max];
var int StExt_Profession_Skill_Scrollmaking[StExt_ScrollmakingSkillIndex_Max];
var int StExt_Profession_Skill_Alchemy[StExt_AlchemySkillIndex_Max];
var int StExt_Profession_Skill_Enchantment[StExt_EnchantmentSkillIndex_Max];

//===================================================================//
//					 	Hero extra stats							 //
//===================================================================//
var int StExt_PcStats[StExt_PcStats_Index_Max];					// Result value, readonly!
var int StExt_PcStats_Perm[StExt_PcStats_Index_Max];			// Bonus stack from player
var int StExt_PcStats_Items[StExt_PcStats_Index_Max];			// Bonus stack from items
var int StExt_PcStats_Talismans[StExt_PcStats_Index_Max];		// Bonus stack from 
var int StExt_PcStats_Abilities[StExt_PcStats_Index_Max];		// Bonus stack from abilities
var int StExt_PcStats_Dynamic[StExt_PcStats_Index_Max];			// Bonus stack from dynamic calculate otions. Calculates in scripts!
var int StExt_PcStats_Other[StExt_PcStats_Index_Max];			// Bonus stack from other sources

// Alchemy source
var int StExt_PcStats_Alchemy[StExt_PcStats_Index_Max];			// Bonus stack from potions
var int StExt_PcStats_Alchemy_Value[StExt_PcStats_Index_Max];
var int StExt_PcStats_Alchemy_Cooldown[StExt_PcStats_Index_Max];

// Buffs source
var int StExt_PcStats_Buffs[StExt_PcStats_Index_Max];			// Bonus stack from buffs
var int StExt_PcStats_Buffs_Value[StExt_PcStats_Index_Max];
var int StExt_PcStats_Buffs_Cooldown[StExt_PcStats_Index_Max];

// *** Artifacts
// Grimoir source
var int StExt_PcStats_Grimoir[StExt_PcStats_Index_Max];			// Bonus stack from grimoir 
var int StExt_Grimoir_Skill[StExt_ArtifactSkill_Max];
var int StExt_Grimoir_Skill_Value[StExt_ArtifactSkill_Max];
var int StExt_Grimoir_Skill_Cooldown[StExt_ArtifactSkill_Max];
var int StExt_Grimoir_Level;
var int StExt_Grimoir_Lp;
var int StExt_Grimoir_ExpNow;
var int StExt_Grimoir_ExpNext;

// Dagger source
var int StExt_PcStats_Dagger[StExt_PcStats_Index_Max];			// Bonus stack from dagger
var int StExt_Dagger_Skill[StExt_ArtifactSkill_Max];
var int StExt_Dagger_Skill_Value[StExt_ArtifactSkill_Max];
var int StExt_Dagger_Skill_Cooldown[StExt_ArtifactSkill_Max];
var int StExt_Dagger_Level;
var int StExt_Dagger_Lp;
var int StExt_Dagger_ExpNow;
var int StExt_Dagger_ExpNext;

// Aura sorce
var int StExt_PcStats_Auras[StExt_PcStats_Index_Max];			// Bonus stack from auras
var int StExt_Aura_Slot[StExt_AurasCount_HardCap];
var int StExt_Aura_Cooldown[StExt_AuraIndex_Max];
var int StExt_Aura_Consumption[StExt_AuraIndex_Max];
var int StExt_Aura_TmpValue1[StExt_AuraIndex_Max];
var int StExt_Aura_TmpValue2[StExt_AuraIndex_Max];
var int StExt_Aura_TmpValue3[StExt_AuraIndex_Max];
var int StExt_Aura_TmpValue4[StExt_AuraIndex_Max];
var int StExt_Aura_TmpValue5[StExt_AuraIndex_Max];

// True percent values
var int StExt_PcStats_PercentValues[20];

// Stats reservation data
var int StExt_LifeReserved;
var int StExt_ManaReserved;
var int StExt_StaminaReserved;
var int StExt_EsReserved;
var int StExt_LifeReservedMax;
var int StExt_ManaReservedMax;
var int StExt_StaminaReservedMax;
var int StExt_EsReservedMax;

// Corruption data
var int StExt_CorruptionPath;
var int StExt_CorruptionPath_ExpNow;
var int StExt_CorruptionPath_ExpNext;
var int StExt_CorruptionPath_Level;
var int StExt_CorruptionPath_SkillPoints;
var int StExt_Corruption_Perk_Mage[StExt_CorruptionPerk_Max];
var int StExt_Corruption_Perk_Warrior[StExt_CorruptionPerk_Max];
var int StExt_Corruption_Perk_Ranger[StExt_CorruptionPerk_Max];

var int StExt_Corruption_BonusNext[StExt_CorruptionBonus_Max];
var int StExt_Corruption_BonusCount[StExt_CorruptionBonus_Max];

var int StExt_CorruptedPerk_DamageNow;
var int StExt_CorruptedPerk_DamageNext;
var int StExt_CorruptedPerk_DamagePoints;
var int StExt_CorruptedPerk_DamageLevel;

var int StExt_BeastsBonusCounter[StExt_BeastsBonusIndex_Max];

//===================================================================//
//					 		Hero flags								 //
//===================================================================//
var int StExt_HeroInitialized;
var int StExt_PreHistoryMode;
var int StExt_HeroUid;

var int StExt_ArtifactEquipped;

var int StExt_ArcanePath_BookChoshen;
var int StExt_HeroSkinMode;
var int StExt_FemaleSkin_AlwaysWig;
var int StExt_FemaleSkin_Horns;
var int StExt_FemaleSkin_Wings;

var int StExt_IsFakeDarkmage;
var int StExt_DefaultKdmFix;

var int StExt_CanLearnDarkmage;
var int StExt_CanLearnFiremage;
var int StExt_CanLearnWatermage;
var int StExt_CanLearnGuru;
var int StExt_CanLearnDemon;
var int StExt_CanLearnDeath;
var int StExt_CanLearnNecro;
var int StExt_CanLearnPaladin;
var int StExt_CanLearnBlood;

var int StExt_CanLearn_Constantino;
var int StExt_CanLearn_Bosper;
var int StExt_CanLearn_Harad;

// *** Stats uncapper values ***
//UncaperStatIndex
var int StExt_PcStatsUncaper_Now[StExt_UncaperStatIndex_Max];
var int StExt_PcStatsUncaper_Was[StExt_UncaperStatIndex_Max];
var int StExt_PcStatsUncaper_BonusNow[StExt_UncaperStatIndex_Max];
var int StExt_PcStatsUncaper_BonusWas[StExt_UncaperStatIndex_Max];

var int StExt_ImmortalFlagTime;

var int StExt_PickpocketSuccessAttempts;
var int StExt_PickpocketBonusCount;
var int StExt_ChestOpenCounter;

var int StExt_HeroLevel;
var int StExt_HeroStuned;

var int StExt_HeroMasteriesLearned;
var int StExt_HeroMasteriesMax;
var int StExt_HeroActiveAuras;
var int StExt_HeroActiveAurasMax;

var int StExt_PcEsBuffer;
var int StExt_PcEsRegBuffer;

var int StExt_PcCurrentAcceleration;
var int StExt_PcAccelerationDelta;
var int StExt_IsPcAccelerationChanged;
var int StExt_PcPreCastMana;
var int StExt_PcCastManaSpent;
var int StExt_PcWasTransformed;

var int StExt_InvisibleStatCooldown;

var int StExt_ElementAffinity_Fire;
var int StExt_ElementAffinity_Ice;
var int StExt_ElementAffinity_Electric;
var int StExt_ElementAffinity_Air;
var int StExt_ElementAffinity_Earth;
var int StExt_ElementAffinity_Light;
var int StExt_ElementAffinity_Dark;
var int StExt_ElementAffinity_Death;
var int StExt_ElementAffinity_Life;
var int StExt_ElementAffinity_Shaman;
var int StExt_ElementAffinity_Blood;

var int StExt_WeaponSkill_Charged;
var int StExt_WeaponSkill_Cooldown;

var int StExt_HitProtPotion_Trail;

var int StExt_ExtraSnCStat_EnergyShield_BonusCount;
var int StExt_ExtraSnCStat_EnergyShield_ExpNow;
var int StExt_ExtraSnCStat_EnergyShield_ExpNext;
