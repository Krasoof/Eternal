META
{
    Mod = EthernalBreeze.vdf;
};
// DO NOT edit or change meta-block above!
// DO NOT place any symbols, coments or even empty line/space before this code.

/* 
	How to localize mods content:
	First of all make sure that encoding and codepage is valid for your language! 
	For example for russian it's 'Windows-1251' for other languages I don't know, just be ready to experiment
	
	So, after you set and done with encoding do next
	Copy all text from archive EthernalBreeze.vdf -> Localization.d
	And paste below
	Do translation and save.
	
	This file must be placed in GothicII/System/Autorun folder
*/

const string txt_spells[max_spell] = 
{
    "Holy Light", "Healing Touch", "Holy Arrow", "Purification by Fire", "Dispel Darkness", "Light of Innos", "Banish Demons", "Teleport", "Breath of Life", "Teleport to Monastery", "Teleport to Onar's Farm", "Teleportation", "To the Passage in the Valley of Mines", "Teleportation", 
    "To the Castle of Ore Barons", "Teleportation", "To Orlan's Tavern", "Heal Wounds", "Light", "Fire Arrow", "Ice Arrow", "Healing", "Summon Skeleton", "Fireball", "Lightning", "Summon Wolf", "Fist of Wind", "Sleep", 
    "Purifying Light", "Lightning Strike", "Great Fireball", "Summon Skeleton Warrior", "Fear", "Ice Block", "Ball Lightning", "Summon Stone Golem", "Destroy Undead", "Fire Storm", "Fire Tempest", "Ice Wave", "Summon Demon", "Surge of Vigor", 
    "Fire Rain", "Wave of Death of Uriziel", "Black Fog", "Army of Darkness", "Shrink", "Transform into Zombie", "Transform into Hornet", "Transform into Meat Bug", "Transform into Golem", "Transform into Wolf", "Transform into Lizard", "Transform into Glorhk", "Transform into Warg", "Transform into Fire Lizard", 
    "Transform into Sniffler", "Transform into Shadowbeast", "Transform into Dragon Snapper", "Oblivion", "Gaze of Innos", "Arrow of Darkness", "Ball of Death", "Energy Vortex", "Orc Teleport", "Claw of Beliar", "Teleport to Brotherhood Camp", "Purifying Wind", "Unbreakable Will", "Guardian Protector", 
    "Storm", "Tornado", "Fist of Water", "Ice Spear", "Rune of Pyrokar", "Geyser", "Mora Ulartu", "Path of the Warrior", "Voice of the Guardian", "Wave of Wrath", "Summon Fire Golem", "Swarm", "Entangle Roots", "Spirit Absorption", 
    "Summon Stone Guardian", "Spear of Darkness", "Soul Rend", "Cry of the Dead", "Summon Zombie", "Summon Ice Golem", "Gates of the Keepers", "Summon Legion Demon", "Guardian Keeper", "Fire Shroud", "Hypnosis", "Phantom Arrow", "Terrible Stench", "Summon Krait", 
    "Summon Snow Pack", "Magic Lockpick", "Summon Swamp Golem", "Wrath of the Creators", "Summon Forest Guardian", "Wrath of Innos", "Energy Vortex", "Tar Shat", "Druid Rune", "Fire Flash", "Ice Flash", "Possession", "Earthquake", "Fire Cage", 
    "Exhaustion", "Shockwave", "Fire Explosion", "Ascension", "Hand of Chaos", "Poisonous Bite", "Thunder Sphere", "Electric Wave", "Wave of Fire", "Red Storm", "Ice Explosion", "Blizzard", "Howl of the Abyss", "Magic Sphere", 
    "Stone Explosion", "Spear of Corruption", "Fire Flash", "RESERVED", "Arrow of Darkness", "Magic Vortex", "Cross of Elements", "Leap", "Summon Demon", "Thirst for Killing", "Weak Curse of Darkness", "Veil of Darkness", "Mind Control", "Dark Sleep", 
    "Bloodlust", "Advanced Curse of Darkness", "Enhanced Curse of Darkness", "Ball of Darkness", "Spear of Darkness", "Great Ball of Darkness", "Wave of Darkness", "Dark Agony", "Summon Tesvall", "Summon Servant", "Rune of Life Stealing", "Rune of Protection", "Rune of Plague", "Rune of Servant Healing", 
    "Rune of Absorption", "Rune 'Master'", "Rune 'Darkness Enhancement'", "Rune of Elemental Protection", "Rune of Magic Explosion", "Summon Skeleton Archer", "Summon Skeleton Spearman", "Summon Djinn", "Summon Goblin Skeleton", "Aura of Strong Bones", "Summon Skeleton Servant", "Summon Shadowbeast Skeleton", "Magic Arrow", "Aura of Bone Mastery", 
    "Aura of Swift Bones", "Aura of Viscous Darkness", "Aura of Enchanted Weapons", "Healing Summoned Creatures", "Blood Thread", "Stream of Darkness", "Blood Stream", "Tentacles of Darkness", "Night Vision", "Blood Stealing", "Summon Familiar", "Summon Blood Essence", "Fire Stream", "Fire Wall", 
    "Fire Pool", "Fire Weapon", "Fire Collapse", "Dash", "Pyrokinesis", "Frost Binding", "Electrokinesis", "Strangulation", "Mortification", "Suppression", "Magic Fire Arrow",
	/*End of game defaults*/
	"Summon Shadow Golem", "Summon Bone Hound", "Magic Arrow", "Summon Skeleton Mage", "Summon Holy Wisp", "Summon Air Golem",
	/*buffs*/
	"Blessing - Protection", "Blessing - Vitality", "Blessing - Attributes", "Blessing - Regeneration", "Blessing - Damage",
	"Blessing - Speed", "Blessing - Evasion", "Blessing - Energy Shield", "Mass Healing",
	/*debuffs*/
	"Curse - Vulnerabilities", "Curse - Weakening", "Curse - Life Siphon", "Curse - Slowdown", "Curse - Life Plug",
	"Curse - Iron Maiden", "Curse - More Damage", "Curse - Damage Weakening",
	"Summon Ghost", "Summon Bone Golem", "Summon Shadowbeast", "Summon Fire Spirit", "Summon Troll", "Summon Crawler", "Summon Snapper",
	/*Timed effects*/
	"Aegis of Fire", "Aegis of Ice", "Aegis of Lightning", "Aegis of Darkness", "Aegis of Air", "Aegis of Earth", "Aegis of Poison", "Summon Ethereal Golem"
};

const string StExt_Str_DiffLevel[5] =
{
	" ??? ",
	"Normal",
	"Nightmare",
	"Hell",
	"Custom"
};

const string StExt_Str_Prehistory[StExt_PreHistoryMode_Max] =
{
	" ??? ",
	"Nobody",
	"Guard in the Old Camp",
	"Mercenary in the New Camp",
	"Guard in the Swamp Camp",
	"Fire Mage",
	"Water Mage",
	"Guru",
	"Necromancer",
	"Ore Baron",
	"Ore Digger"
};

const string StExt_Str_Learned = "Learned: ";
const string StExt_Str_Random = "Randomly";
const string StExt_Str_UnknownConfig = "Unknown settings preset detected!";
const string StExt_Str_LoadedConfig = "Loaded settings preset - ";
const string StExt_Str_UserConfigsNotFound = "Custom settings preset not found!";

const string StExt_Str_CorruptionName[StExt_Corruption_Max] =
{
	"Uncorrupted",
	"Corrupted Mage",
	"Corrupted Warrior",
	"Corrupted Archer"
};

const string StExt_Str_CorruptionDesc[StExt_Corruption_Max] =
{
	"Corruption of the soul allows acquiring unique features of body and mind, at the cost of significant sacrifice...",
	"The corrupted mage is no longer just a wizard, but the embodiment of magic itself. Having rejected the flesh, the mage delved into the study of the essence of magic and the unknown. Sacrificing the health of the body and his very essence, he gained incredible magical potential in return. His spells are an extension of his will, and pure energy flows through his veins instead of blood. And only good old steel can stop this embodiment of magic, easily destroying the flesh...",
	"The corrupted warrior embodies the very concept of 'living rock'. Having rejected his spiritual part, and then directing it to the development of the bodily shell, he became almost invulnerable. All the spiritual essence of such a warrior was embodied in the physical world in the form of a huge reserve of vital forces. But in return, the path of magic is almost closed to him.",
	"The corrupted archer is a ranged combat specialist who, like the corrupted warrior, invested his entire soul in the development of the body. However, instead of transforming his energy into huge reserves of vital forces, he took a different path - speed and reaction. Thanks to his superhuman dexterity, he can avoid many attacks, and inhuman accuracy allows him to strike opponents at a distance even before they realize their doom. However, such metamorphoses did not come without a price - the reserve of spiritual and vital forces suffered somewhat in favor of agility and attack speed."
};

//		*** Talents strings ***
const string StExt_Str_Talents_Header = "--- * Schools of Magic and Martial Arts * ---";
const string StExt_Str_Talents_Progress = "Current Level: ";
const string StExt_Str_Talents_Exp = "Experience: ";
const string StExt_Str_Talents_Lp = "Learning Points: ";

const string StExt_Str_MasteryNames[StExt_MasteryIndex_Max] = 
{
	"Pyromancy", "Hydromancy", "Electromancy", "Aeromancy",
	"Geomancy", "Light Magic", "Dark Magic", "Death Magic", "Life Magic",
	"Golem Crafting", "Demonology", "Necromancy", "Spirit Magic",
	"Art of War", "Art of Defense", "Art of Archery"
};

const string StExt_Str_MasteryLevels[StExt_TalentLevel_Max] = 
{ "Untrained", "Apprentice", "Adept", "Expert", "Master", "Magister", "Grand Master" };

const string StExt_Str_MasteryDescription[StExt_MasteryIndex_Max] = 
{
	"Pyromancy - The Art of Controlling the Element of Fire",
	"Hydromancy - The Art of Controlling the Element of Water and Ice",
	"Electromancy - The Art of Controlling the Element of Lightning",
	"Aeromancy - The Art of Controlling the Element of Air",
	"Geomancy - The Art of Controlling the Element of Earth",
	"Light Magic - The Art of Light Magic and Blessings",
	"Dark Magic - The Art of Dark Magic and Curses",
	"Death Magic - The Art of Controlling the Element of Death",
	"Life Magic - The Art of Healing, Summoning Beasts, and Transformation",
	"Golem Crafting - The Art of Creating and Improving Golems",
	"Demonology - The Art of Summoning Demons",
	"Necromancy - The Art of Creating Undead Servants",
	"Spirit Magic - The Art of Magical Combat and Protection",
	"Art of War - The Art of Handling Melee Weapons",
	"Art of Defense - The Art of Fighting with Armor and Without",
	"Art of Archery - The Art of Handling Ranged Weapons"
};


/* *** Status menu ui strings *** 	*/
const string StExt_StatsMenu_TabName[5] = { "Statistics", "Attributes", "Skills", "Professions", "Bonuses" };
const string StExt_PcStats_SectionDesc[7] = { "Skills", "Protection", "Attack", "Auras", "Summon", "Miscellaneous",  "Attributes"};
const string StExt_PcStats_Desc[StExt_PcStats_Index_Max] = 
{
	"Health:",
	"Mana:",
	"Stamina:",
	"Health Regeneration:",
	"Mana Regeneration:",
	"Stamina Regeneration:",
	"Strength:",
	"Dexterity:",
	"Intelligence:",
	"Magic Power:",
	"One-Handed Proficiency:",
	"Two-Handed Proficiency:",
	"Bow Proficiency:",
	"Crossbow Proficiency:",
	"Health(%):",
	"Mana(%):",
	"Stamina(%):",
	"Strength(%):",
	"Dexterity(%):",
	"Intelligence(%):",
	"Health Regeneration(%):",
	"Mana Regeneration(%):",
	"Stamina Regeneration(%):",
	"Energy Shield:",
	"Energy Shield(%):",
	"Energy Shield Regeneration (per sec.):",
	"Energy Shield Regeneration (% per sec.):",
	"Dodge Chance:",
	"Slashing Protection:",
	"Blunt Protection:",
	"Fire Protection:",
	"Magic Protection:",
	"Knockback Protection:",
	"Piercing Protection:",
	"Slashing Protection(%):",
	"Blunt Protection(%):",
	"Fire Protection(%):",
	"Magic Protection(%):",
	"Knockback Protection(%):",
	"Piercing Protection(%):",
	"Slashing Damage Resistance(%):",
	"Blunt Damage Resistance(%):",
	"Fire Damage Resistance(%):",
	"Magic Damage Resistance(%):",
	"Knockback Damage Resistance(%):",
	"Piercing Damage Resistance(%):",
	"Poison Resistance(%):",
	"Area Damage Resistance(%):",
	"Maximum Dodge Chance(%):",
	"Maximum Slashing Damage Resistance(%):",
	"Maximum Blunt Damage Resistance(%):",
	"Maximum Fire Damage Resistance(%):",
	"Maximum Magic Damage Resistance(%):",
	"Maximum Knockback Damage Resistance(%):",
	"Maximum Piercing Damage Resistance(%):",
	"Maximum Poison Resistance(%):",
	"Maximum Area Damage Resistance(%):",
	"Chance to Ignore Damage(%):",
	"Chance to Reflect Part of Damage(%):",
	"Chance to Reflect Spell(%):",
	"Chance to Absorb Spell(%):",
	"Chance to Deflect Projectile(%):",
	"Immunity to Poison:",
	"Immunity to Curses:",
	"Immunity to Weakness:",
	"Restore Part of Vital Forces(%) from Received Damage:",
	"Restore Part of Magical Forces(%) from Received Damage:",
	"Restore Part of Energy Shield(%) from Received Damage:",
	"Restore Part of Stamina(%) from Received Damage:",
	"Additional Damage:",
	"Additional Melee Damage:",
	"Additional Ranged Damage:",
	"Additional Magic Damage:",
	"Additional Damage(%):",
	"Additional Melee Damage(%):",
	"Additional Ranged Damage(%):",
	"Additional Magic Damage(%):",
	"Additional Weapon Skill Damage:",
	"Additional Weapon Skill Damage(%):",
	"Additional Blunt Damage:",
	"Additional Slashing Damage:",
	"Additional Fire Damage:",
	"Additional Knockback Damage:",
	"Additional Magic Damage:",
	"Additional Piercing Damage:",
	"Additional Poison Damage:",
	"Additional Continuous Slashing Damage:",
	"Additional Continuous Blunt Damage:",
	"Additional Continuous Fire Damage:",
	"Additional Continuous Knockback Damage:",
	"Additional Continuous Magic Damage:",
	"Additional Continuous Piercing Damage:",
	"Additional Continuous Poison Damage:",
	"Additional Damage Duration:",
	"Additional One-Handed Weapon Damage:",
	"Additional Two-Handed Weapon Damage:",
	"Additional Bow Damage:",
	"Additional Crossbow Damage:",
	"Additional Dual Weapon Damage:",
	"Additional One-Handed Weapon Damage(%):",
	"Additional Two-Handed Weapon Damage(%):",
	"Additional Bow Damage(%):",
	"Additional Crossbow Damage(%):",
	"Additional Dual Weapon Damage(%):",
	"Additional Blunt Damage(%):",
	"Additional Slashing Damage(%):",
	"Additional Fire Damage(%):",
	"Additional Knockback Damage(%):",
	"Additional Piercing Damage(%):",
	"Additional Poison Damage(%):",
	"Additional Magic Damage(%):",
	"Additional Area Damage:",
	"Additional Area Damage(%):",
	"Additional Magic Area Damage:",
	"Additional Magic Area Damage(%):",
	"Additional Weapon Area Damage:",
	"Additional Weapon Area Damage(%):",
	"Additional Damage to Humans:",
	"Additional Damage to Orcs:",
	"Additional Damage to Evil:",
	"Additional Damage to Undead:",
	"Additional Damage to Animals:",
	"Additional Damage to Golems:",
	"Additional Damage to Humans(%):",
	"Additional Damage to Orcs(%):",
	"Additional Damage to Evil(%):",
	"Additional Damage to Undead(%):",
	"Additional Damage to Animals(%):",
	"Additional Damage to Golems(%):",
	"Critical Spell Damage Chance(%):",
	"Critical Spell Damage Modifier(%):",
	"Spell Cost Reduction(%):",
	"Double Weapon Damage Chance(%):",
	"Repeat Spell Cast Chance(%):",
	"Stun Chance(%):",
	"Freeze Chance(%):",
	"Vital Forces Restoration per Hit:",
	"Magical Forces Restoration per Hit:",
	"Stamina Restoration per Hit:",
	"Energy Shield Restoration per Hit:",
	"Vital Forces Steal per Hit:",
	"Magical Forces Steal per Hit:",
	"Energy Shield Steal per Hit:",
	"Vital Forces Steal per Hit(%):",
	"Magical Forces Steal per Hit(%):",
	"Energy Shield Steal per Hit(%):",
	"Fire Magic Power:",
	"Ice Magic Power:",
	"Earth Magic Power:",
	"Air Magic Power:",
	"Electricity Magic Power:",
	"Dark Magic Power:",
	"Light Magic Power:",
	"Life Magic Power:",
	"Death Magic Power:",
	"Demonology Power:",
	"Golem Crafting Power:",
	"Necromancy Power:",
	"Number of Auras:",
	"Aura Power:",
	"Aura Power(%):",
	"Aura Distance:",
	"Aura Distance(%):",
	"Additional Aura Trigger Chance:",
	"Aura Resource Reservation Reduction(%):",
	"Aura Mana Reservation Reduction(%):",
	"Aura Stamina Reservation Reduction(%):",
	"Aura Life Reservation Reduction(%):",
	"Reserved Life(%):",
	"Reserved Mana(%):",
	"Reserved Stamina(%):",
	"Reserved Energy Shield(%):",
	"Chance to Turn Killed Opponent into Skeleton(%):",
	"Additional Summoned Creatures:",
	"Summoned Creatures Power(%):",
	"Additional Summoned Creatures Attributes(%):",
	"Additional Summoned Creatures Protection(%):",
	"Additional Summoned Creatures Damage(%):",
	"Additional Summoned Creatures Vital Forces(%):",
	"Summoned Creatures Vital Forces Regeneration:",
	"Summoned Creatures Energy Shield Regeneration:",
	"Additional Summoned Creatures Vital Forces:",
	"Additional Summoned Creatures Energy Shield:",
	"Additional Summoned Creatures Strength:",
	"Additional Summoned Creatures Dexterity:",
	"Additional Summoned Creatures Dodge Chance(%):",
	"Additional Summoned Creatures Protection:",
	"Additional Summoned Creatures Slashing Protection:",
	"Additional Summoned Creatures Blunt Protection:",
	"Additional Summoned Creatures Fire Protection:",
	"Additional Summoned Creatures Magic Protection:",
	"Additional Summoned Creatures Knockback Protection:",
	"Additional Summoned Creatures Piercing Protection:",
	"Additional Summoned Creatures Slashing Damage Resistance(%):",
	"Additional Summoned Creatures Blunt Damage Resistance(%):",
	"Additional Summoned Creatures Fire Damage Resistance(%):",
	"Additional Summoned Creatures Magic Damage Resistance(%):",
	"Additional Summoned Creatures Knockback Damage Resistance(%):",
	"Additional Summoned Creatures Piercing Damage Resistance(%):",
	"Additional Summoned Creatures Poison Resistance(%):",
	"Additional Summoned Creatures Damage:",
	"Additional Summoned Creatures Blunt Damage:",
	"Additional Summoned Creatures Slashing Damage:",
	"Additional Summoned Creatures Fire Damage:",
	"Additional Summoned Creatures Knockback Damage:",
	"Additional Summoned Creatures Piercing Damage:",
	"Additional Summoned Creatures Poison Damage:",
	"Additional Summoned Creatures Magic Damage:",
	"Summoned Undead Power(%):",
	"Additional Summoned Undead Attributes(%):",
	"Additional Summoned Undead Protection(%):",
	"Additional Summoned Undead Damage(%):",
	"Summoned Animals Power(%):",
	"Additional Summoned Animals Attributes(%):",
	"Additional Summoned Animals Protection(%):",
	"Additional Summoned Animals Damage(%):",
	"Summoned Golems Power(%):",
	"Additional Summoned Golems Attributes(%):",
	"Additional Summoned Golems Protection(%):",
	"Additional Summoned Golems Damage(%):",
	"Summoned Demons Power(%):",
	"Additional Summoned Demons Attributes(%):",
	"Additional Summoned Demons Protection(%):",
	"Additional Summoned Demons Damage(%):",
	"Additional Summoned Animals Vital Forces(%):",
	"Additional Summoned Undead Vital Forces(%):",
	"Additional Summoned Golems Vital Forces(%):",
	"Additional Summoned Demons Vital Forces(%):",
	"Summoned Totems Power(%):",
	"Additional Summoned Totems Attributes(%):",
	"Additional Summoned Totems Protection(%):",
	"Additional Summoned Totems Damage(%):",
	"Additional Summoned Totems Vital Forces(%):",
	"Summoned Totems Healing(per sec.):",
	"Summoned Creatures Healing(per sec.):",
	"Summoned Golems Healing(per sec.):",
	"Summoned Undead Healing(per sec.):",
	"Summoned Demons Healing(per sec.):",
	"Summoned Animals Healing(per sec.):",
	"Luck:",
	"Additional Luck (Chests):",
	"Additional Luck (Opponents):",
	"Additional Luck (Gold):",
	"Additional Steal Chance(%):",
	"Chance to Hide on Hit:",
	"Additional Effect Duration(%):",
	"Additional Action Speed:",
	"Stamina Steal per Damage:",
	"Stamina Steal per Damage(%):",
	"Spirit Magic Power:",
	"Fall / Poison Protection:",
	"Fall / Poison Protection(%):",
	"Aura Energy Shield Reservation Reduction(%):",
	"Reflected Blunt Damage:",
    "Reflected Slashing Damage:",
    "Reflected Piercing Damage:",
    "Reflected Fire Damage:",
    "Reflected Knockback Damage:",
    "Reflected Magic Damage:",
    "Reflected Poison Damage:",	
	"Reflected Blunt Damage(%):",
    "Reflected Slashing Damage(%):",
    "Reflected Piercing Damage(%):",
    "Reflected Fire Damage(%):",
    "Reflected Knockback Damage(%):",
    "Reflected Magic Damage(%):",
    "Reflected Poison Damage(%):",
	"Reflected Blunt Damage(DoT):",
    "Reflected Slashing Damage(DoT):",
    "Reflected Piercing Damage(DoT):",
    "Reflected Fire Damage(DoT):",
    "Reflected Knockback Damage(DoT):",
    "Reflected Magic Damage(DoT):",
    "Reflected Poison Damage(DoT):",	
	"Received Damage Reduction:",
	"Received Damage Reduction(%):",
	"Accuracy:",
	"Accuracy(%):",
	"Minions Accuracy:",
	"Minions Accuracy(%):",
	"Damage Over Time Resistance (%):",
	"Blessing Power:",
	"Curse Power:",
	"Reflected Damage Resistance (%):",
	"Maximum Damage Over Time Resistance (%):",
	"Maximum Reflected Damage Resistance (%):",
	"Additional Summoned Damage Over Time:",
	"Additional Summoned Smashing Damage Over Time:",
	"Additional Summoned Slashing Damage Over Time:",
	"Additional Summoned Fire Damage Over Time:",
	"Additional Summoned Knockback Damage Over Time:",
	"Additional Summoned Magic Damage Over Time:",
	"Additional Summoned Piercing Damage Over Time:",
	"Additional Summoned Poison Damage Over Time:",
	"Summoned AoE Resistance (%):",
	"Summoned Summoned Damage Over Time Resistance (%):",
	"Summoned Summoned Resistance Reflected Damage (%):",
	"Returned Summoned Crushing Damage:",
	"Returned Summoned Slashing Damage:",
	"Returned Summoned Piercing Damage:",
	"Returned Summoned Fire Damage:",
	"Returned Knockback Damage:",
	"Returned Summoned Magic Damage:",
	"Returned Summoned Poison Damage:",
	"Returned Summoned Crushing Damage (Dot):",
	"Returned Slashing Damage (Dot):",
	"Returned Summoned Piercing Damage (Dot):",
	"Returned Summoned Fire Damage (Dot):",
	"Returned Knockback Damage (Dot):",
	"Returned Summoned Magic Damage (Dot):",
	"Returned Poison Damage (Dot) summoned creatures:"
};

// Infusion->Affix
const string StExt_MagicInfusionAffix_Name[StExt_MagicInfusionAffix_Max] = 
{
	"Beast",
	"Scoundrel",
	"Dog",
	"Dead Man",
	"Cockroach",
	"Goliath",
	"Ichthyander",
	"Bastard",
	"Genius",
	"Ghoul",
	"Blind Man",
	"Vagabond",
	"Demon",
	"Golem",
	"Reptile",
	"Cadaver",
	"Hanged Man",
	"Imp",
	"Fox",
	"Beggar",
	"Summoner",
	"Scorpion",
	"Seal",
	"Drowned Man",
	"Spirit",
	"Wind",
	"Monster",
	"Pus",
	"Smith",
	"Degenerate",
	"Punisher",
	"Villain",
	"Shepherd",
	"Champion",
	"Elf",
	"Cannibal",
	"Brain Eater",
	"Man Eater",
	"Construct",
	"Cat",
	"Lord",
	"Bat",
	"Killer",
	"Colossus",
	"Parasite",
	"Worm",
	"Beetle",
	"Tapeworm",
	"Undead",
	"Hero",
	"Scum",
	"Lizard",
	"Vegetable",
	"Thief",
	"Scholar",
	"Beaver",
	"Bubble",
	"Cripple",
	"Jackal",
	"Prospector",
	"Priest",
	"Rascal",
	"Ghoul",
	"Oak",
	"Paranoid",
	"Executioner",
	"Overlord",
	"Wanderer",
	"Necromancer",
	"Sage",
	"Ignoramus",
	"Mutant",
	"Donkey",
	"Guard",
	"Outcast",
	"Hunter",
	"Sorcerer",
	"Drum",
	"Hammer",
	"Plane",
	"Tick",
	"Swindler",
	"Fraudster",
	"Bull",
	"Blade",
	"Broadsword",
	"Sergeant",
	"General",
	"Spit",
	"Miscarriage",
	"Boss",
	"Rogue",
	"Bite",
	"Stub",
	"Invalid",
	"Eye",
	"Ghost",
	"Alchemist",
	"Wizard",
	"Pest",
	"Savior",
	"Dung",
	"Mushroom",
	"Slime",
	"Scamp",
	"Vampire",
	"Chest",
	"Mole",
	"Mage",
	"Fat",
	"Crown",
	"Gust",
	"Calm",
	"Abscess",
	"Atheist",
	"Armadillo",
	"Rabbit",
	"Boar",
	"Spy",
	"God",
	"Merchant",
	"Senile",
	"Termite",
	"Warrior",
	"Hero",	
	"Guru",
	"Master",
	"Order",
	"Moose",
	"Troll",
	"Fighter",
	"Compote",
	"Sprout",
	"Child",
	"Boot",
	"Fist",
	"King",
	"Prince",
	"Count",
	"Goldsmith",
	"Baron",
	"Miner",
	"Stinker",
	"Thorn",
	"Cap",
	"Monarch",
	"Leader",
	"Dwarf",
	"Giant",
	"Bearer",	
	"Perfectionist",
	"Scar",
	"Cut",
	"Idiot",
	"Experiment",
	"Coffin",
	"Horse",
	"Dance",
	"Tuna",
	"Down",
	"Caprice",
	"Coachman",
	"Bow",
	"Sword",
	"Axe",
	"Dagger",
	"Crossbow",
	"Archer",
	"Scout",
	"Delirium",
	"Cancer",
	"Don",
	"Pony",
	"Messenger",
	"Hump",
	"Skull",
	"Cross",
	"Bamboo",
	"Robber",
	"Thrombosis",
	"Horn",
	"Threshold",
	"Horcrux",
	"Surprise",
	"Weathervane",
	"Attic",
	"Mess",
	"Chest",
	"Skunk",
	"Crucian",
	"Ball",
	"Square",
	"Rhombus",
	"Judge",
	"Godfather",
	"Matchmaker",
	"Ram",
	"Court",
	"Pike",
	"Donkey"
};

// Infusion->Preffix
const string StExt_MagicInfusionPreffix_Name[StExt_MagicInfusionPreffix_Max] = 
{
	"Unusual",
	"Huge",
	"Healthy",
	"Evil",
	"Beastly",
	"Resilient",
	"Stone",
	"Furious",
	"Swift",
	"Tenacious",
	"Indestructible",
	"Mighty",
	"Infernal",
	"Strong",
	"Dexterous",
	"Lucky",
	"Greedy",
	"Epic",
	"Intangible",
	"Stingy",
	"Alien",
	"Unseen",
	"Huge",
	"Destructive",
	"Sinister",
	"Frightening",
	"Resistant",
	"Whispering",
	"Brilliant",
	"Shining",
	"Monumental",
	"Corpse",
	"Alluring",
	"Blazing",
	"Sturdy",
	"Ribbed",
	"Unforeseen",
	"Astral",
	"Blessing",
	"Cursing",
	"Possessed",
	"Stinking",
	"Dangerous",
	"Rich",
	"Cunning",
	"Hateful",
	"Impudent",
	"Frozen",
	"Insane",
	"Steel",
	"Iron",
	"Wild",
	"Vile",
	"Thorny",
	"Aggressive",
	"Thick",
	"Bony",
	"Nasty",
	"Rusty",
	"Leaky",
	"Dung",
	"Bloody",
	"Piercing",
	"Penetrating",
	"Enchanted",
	"Sorcerous",
	"Shining",
	"Bright",
	"Dark",
	"Blessed",
	"Golden",
	"Magic",
	"Unbridled",
	"Godlike",
	"Demonic",
	"Sticky",
	"Elemental",
	"Crooked",
	"Thorny",
	"Parasitic",
	"Rainbow",
	"Punctual",
	"Hairy",
	"Bald",
	"Poisonous",
	"Agile",
	"Ghostly",
	"Fast",
	"Sour",
	"Sweet",
	"Bitter",
	"Flowing",
	"Solid",
	"Soft",
	"Pious",
	"Desecrated",
	"Deep",
	"Moral",
	"Blunt",
	"Sharp",
	"Cleaving",
	"Thorough",
	"Lousy",
	"Excellent",
	"Unsuccessful",
	"Aerial",
	"Lead",
	"Hot",
	"Cold",
	"Cool",
	"Scorching",
	"Capricious",
	"Bearded",
	"Expensive",
	"Cheap",
	"Reliable",
	"Elite",
	"Senile",
	"Educated",
	"Smart",
	"Intellectual",
	"Pus-filled",
	"Stunning",
	"Paralyzing",
	"Cursed",
	"Goring",
	"Crystalline",
	"Crystal",
	"Crunchy",
	"Fat",
	"Skinny",
	"Dense",
	"Worthless",
	"Hunchbacked",
	"Ramming",
	"Commodity",
	"Embalmed",
	"Fizzy",
	"Whining",
	"Screaming",
	"Wailing",
	"Sleeping",
	"Crazed",
	"Burnt",
	"Rotten",
	"Witch's",
	"Driven",
	"Mysterious",
	"Unearthed",
	"Afterlife",
	"Wet",
	"Dry",
	"Deaf",
	"Blind",
	"Bay",
	"Gray",
	"Bad",
	"Intoxicating",
	"Uniting",
	"Sweaty",
	"Underground",
	"Heavenly",
	"Fluffy",
	"Wayward",
	"Killed",
	"Furious",
	"Spiritual",
	"Stuffy",
	"Pink",
	"Green",
	"Red",
	"Blue",
	"Yellow",
	"Bitten",
	"Treacherous",
	"Thievish",
	"Marine",
	"Torn",
	"Raging",
	"Stinking",
	"Dirty",
	"Tense",
	"Vicious",
	"Durable",
	"Drunk",
	"Drinking",
	"Swollen",
	"Winged",
	"Flea-ridden",
	"Sinewy",
	"Dystrophic",
	"Sick",
	"Cheerful",
	"Feral",
	"Lousy",
	"Unwashed",
	"Mute",
	"Formidable",
	"Running",
	"Squint"
};

// Infusion->Suffix
const string StExt_MagicInfusionSuffix_Name[StExt_MagicInfusionSuffix_Max] = 
{
	"Chaos",
	"Life",
	"Dexterity",
	"Strength",
	"Protection",
	"Attack",
	"Fire",
	"Lava",
	"Cold",
	"Ice",
	"North",
	"Magic",
	"Darkness",
	"Poison",
	"Blood",
	"Pain",
	"Wind",
	"Stone",
	"Forest",
	"Slime",
	"Ailment",
	"Necromancy",
	"Heat",
	"Poisoning",
	"Corruption",
	"Cuts",
	"Unknown",
	"Miasma",
	"Explosion",
	"Thorns",
	"Ritual",
	"Afterlife",
	"Judgment Day",
	"Heavens",
	"Withering",
	"Despondency",
	"Healing",
	"Shamanism",
	"Decay",
	"Eruption",
	"Thorns",
	"Spell",
	"Graves",
	"Apocalypse",
	"Firmament",
	"Losses",
	"Hopelessness",
	"Corruption",
	"Troll",
	"Cunning",
	"Elders",
	"Resistance",
	"Development",
	"Burning",
	"Salamander",
	"Freezing",
	"Frost",
	"Runes",
	"Nonexistence",
	"Loathing",
	"Battle",
	"Repulse",
	"Hurricane",
	"Mountains",
	"Nature",
	"Suffocation",
	"Perdition",
	"Entropy",
	"Desert",
	"Illness",
	"Blood Loss",
	"Mysticism",
	"Reflection",
	"Vampirism",
	"Leakage",
	"Leadership",
	"Unity",
	"Wisdom",
	"Inspiration",
	"Ether",
	"Slander",
	"Earth",
	"Mud",
	"Dove",
	"Metal",
	"Enslavement",
	"Promises",
	"Mind",
	"Violence",
	"Heritage",
	"Good",
	"Bad Weather",
	"Granite",
	"Growth",
	"Sorrow",
	"Gain",
	"Misfortune",
	"Madness",
	"Abyss",
	"Swamp",
	"Cadaver",
	"Abomination",
	"Puddle",
	"Battering Ram",
	"Adanos",
	"Beliar",
	"Innos",
	"Stonos",
	"Toadstool",
	"Steam",
	"Punishment",
	"Decay",
	"Captivity",
	"Foam",
	"Grief",
	"Night",
	"Tick",
	"Sulfur",
	"Crystal",
	"Scythe",
	"Fly",
	"Comb",
	"Will",
	"Cell",
	"Block",
	"Pride",
	"Harpy",
	"Golem",
	"Corpse",
	"Cemetery",
	"Herbs",
	"Bushes",
	"Storm",
	"Swampman",
	"Execution",
	"Torture",
	"Failure",
	"Dance",
	"End",
	"Reward",
	"War",
	"Balance",
	"Bull",
	"Adversity",
	"Demon",
	"Dragon",
	"Goat",
	"Uriziel",
	"Mora",
	"Curse",
	"Charge",
	"Freedom",
	"Amanita",
	"Shield",
	"Catharsis",
	"Comet",
	"Guile",
	"Goose",
	"Hail",
	"Reflexes",
	"Agility",
	"Slyness",
	"Atrocity",
	"Goblin",
	"Scavenger",
	"Puncture",
	"Beating",
	"Genius",
	"Sniffer",
	"Rapier",
	"Snail",
	"Coals",
	"Hive",
	"Quartz",
	"Resin",
	"Sound",
	"Victory",
	"Power",
	"Blessing",
	"Slime",
	"Infinity",
	"Stupidity",
	"Numbness",
	"Freezing",
	"Persistence",
	"Hatred",
	"Nightmare",
	"Mosquito",
	"Barter",
	"Sand",
	"Ambrosia",
	"Amphibian",
	"Cockroach",
	"Spider",
	"Wind",
	"Insect",
	"Ant",
	"Fog",
	"Rat",
	"Bee",
	"Field",
	"Universe",
	"Plague",
	"Existence",
	"Miracle",
	"Thunder",
	"Ash",
	"Fin",
	"Darkness",
	"Cruelty",
	"Silence",
	"Meanness",
	"Suffering",
	"Water",
	"Steel",
	"Spirit",
	"Fear",
	"Web",
	"Passion",
	"Time",
	"Crow",
	"Beetle"
};

// 				*** Mastery perks names ***
// Fire
const string StExt_Str_MasteryPerk_Name_0[StExt_MasteryPerk_Max] =
{
	"Herald of Ashes",
	"Arsonist",
	"Kinship with Fire",
	"Lava Cover",
	"Fiery Spirit",
	"Breath of Flame",
	"Burning",
	"Breath of Fire",
	"Pyromancer",
	"Burning Heart",
	"Gift of Agni",
	"Fire Legion",
	"Basalt Sculptor",
	"Firewalker",
	"Magma Strike",
	"Fire Eater",
	"Blazing Edge",
	"Seal of Flames",
	"Fire Conduit",
	"Fire Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_0[StExt_MasteryPerk_Max] =
{
	"+3 fire damage to any weapon or magic per level of pyromancy",
	"+1 burning damage to any weapon or magic per pyromancy level",
	"+0.3% fire resistance per pyromancy level",
	"+1 fire resistance for each level of pyromancy",
	"-10% mana cost for spells with a fire component",
	"+1% to ongoing fire damage per pyromancy level",
	"+50% to Fire Damage Duration",
	"+25% to any fire damage",
	"+150 fire damage to any weapon or magic",
	"+50 burning damage to any weapon or magic",
	"Grants a 10% chance to cast Fireball when attacking.",
	"Minions gain the ability to cast Firebolt.",
	"Fire golems are 0.5% more powerful per level of pyromancy.",
	"+5% to fire resistance and +10% to maximum fire resistance",
	"Adds 50% of weapon damage as fire damage.",
	"Restores health equal to 20% of fire damage taken.",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Ice
const string StExt_Str_MasteryPerk_Name_1[StExt_MasteryPerk_Max] =
{
	"The Herald of Ice",
	"Icing",
	"Winter's Embrace",
	"Frosty Spirit",
	"Kinship with the Cold",
	"Ice Cover",
	"Breath of Winter",
	"Hydromancer",
	"The Gift of Adanos",
	"Snow Legion",
	"Ice Sculptor",
	"Frozen Heart",
	"Ice drift",
	"Ice crust",
	"Water Cover",
	"Frost",
	"Frozen Edge",
	"Seal of Frost",
	"Ice Conduit",
	"Ice Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_1[StExt_MasteryPerk_Max] =
{
	"+3 magic damage to any type of ice damage per level of hydromancy",
	"+1 continuous magic damage from ice damage per level of hydromancy",
	"+0.1% chance to freeze the enemy when attacking for each level of Hydromancy",
	"-10% mana cost for spells with an ice component",
	"+0.3% magic resistance per level of hydromancy",
	"+1 to magic defense for each level of hydromancy",
	"+1% to ongoing magic damage from ice damage per level of Hydromancy",
	"+25% to damage of spells with an ice component",
	"Grants a 10% chance to cast Ice Lance when attacking.",
	"Minions gain the ability to cast Frostbolt.",
	"Ice Golems are 0.5% more powerful for each level of Hydromancy.",
	"+150 magic damage to any weapon or magic",
	"+5% magic resistance and +10% to maximum magic resistance",
	"Adds 50% of weapon damage as magic damage.",
	"10% of damage taken is restored as mana",
	"10% chance to freeze the melee attacker",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Electric
const string StExt_Str_MasteryPerk_Name_2[StExt_MasteryPerk_Max] =
{
	"Herald of Sparks",
	"Shock",
	"Taser",
	"Electric Spirit",
	"Breakdown",
	"Charged Shield",
	"Transformer",
	"Electromancer",
	"Ampera's Gift",
	"Electric Legion",
	"Conductor",
	"Charged Strike",
	"Spark",
	"Inductor",
	"Capacitor",
	"Breakdown",
	"Sparking Edge",
	"Seal of Storms",
	"Storm Conduit",
	"Storm Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_2[StExt_MasteryPerk_Max] =
{
	"+3 magic damage to any type of electrical damage per level of Electromancy",
	"+1 continuous magic damage from electrical damage per level of Electromancy",
	"+0.1% chance to stun an enemy when attacking for each level of Electromancy",
	"-10% mana cost for spells with an electrical component",
	"5% of damage is stolen as energy shield",
	"+10 to energy shield for each level of electromancy",
	"+1% to ongoing magic damage from electrical damage per level of Electromancy",
	"+25% damage to spells with an electrical component",
	"Grants a 10% chance to cast Lightning Bolt when attacking.",
	"Minions gain the ability to cast Lesser Lightning.",
	"1 to 3 Electric Damage chained, +1 for every 25 Mastery levels.",
	"Grants +300 initial and +1 magic damage per attack per mastery level.",
	"+5% to the speed of all actions",
	"The attacking enemy takes 1-5 damage for each level of Electromancy.",
	"10% of damage taken is restored as energy shield",
	"Deals 25% of weapon damage as chain lightning damage.",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Air
const string StExt_Str_MasteryPerk_Name_3[StExt_MasteryPerk_Max] =
{
	"Herald of the Storm",
	"Suffocation",
	"Air Spirit",
	"Air Flow",
	"Hypoxia",
	"Frivolity",
	"The Center of the Storm",
	"Hurricane",
	"Aeromant",
	"Gift from Heaven",
	"Air Legion",
	"The Hurricane Sculptor",
	"A Gust of Wind",
	"Air Shield",
	"Fair Wind",
	"Vacuum",
	"Gale Edge",
	"Seal of Gales",
	"Wind Conduit",
	"Wind Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_3[StExt_MasteryPerk_Max] =
{
	"+3 knockback damage to any weapon or magic for each level of Aeromancy",
	"+1 choke damage to any weapon or magic for each level of aeromancy",
	"-10% mana cost of spells with an air component",
	"+150 knockback damage to any weapon or magic",
	"+1% to ongoing suffocation damage per Aeromatism level",
	"+0.1% chance to dodge a hit for each level of Aeromancy",
	"+1% to suffocation duration for each level of aeromatism",
	"+25% area damage",
	"+25% damage to spells with an air component",
	"10% chance to cast Tornado when attacking",
	"Minions gain the ability to cast Tornado.",
	"Air golems are 0.5% more powerful for each level of Aeromathy.",
	"Adds 50% of weapon damage as knockback damage.",
	"+0.2% chance to deflect a projectile per Aeromancy level",
	"1% Life and Mana Regeneration while sprinting",
	"+50 choke damage to all weapons and magic",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Earth
const string StExt_Str_MasteryPerk_Name_4[StExt_MasteryPerk_Max] =
{
	"Fortitude",
	"Stone Skin",
	"Spirit of the Earth",
	"Shake",
	"Stone Sculptor",
	"Crushing",
	"Stone Fist",
	"Geomancer",
	"The Gift of Stonos",
	"Stone Legion",
	"The Power of the Earth",
	"The Turning Point",
	"Earth Shield",
	"Granite Armor",
	"Weighting agent",
	"Recoil",
	"Stone Edge",
	"Seal of Stone",
	"Earth Conduit",
	"Earth Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_4[StExt_MasteryPerk_Max] =
{
	"+2 to knockback protection for each level of geomancy",
	"+0.1% resistance to crushing, slashing, and piercing damage for each level of geomancy",
	"-10% mana cost of spells with a stone component",
	"+0.1% stun the enemy for each level of geomancy",
	"Stone and Swamp Golems are 0.5% more powerful for each level of Geomancy.",
	"+1 crushing damage to any weapon or magic for each level of geomancy",
	"+3 bludgeoning damage to any weapon or magic for each level of geomancy",
	"+25% damage to spells with a stone component",
	"Grants a 10% chance to cast Stone Fist when attacking.",
	"Minions gain the ability to cast Stone Fist.",
	"+150 bludgeoning damage to any weapon and magic",
	"+50 crushing damage to any weapon and magic",
	"+1 to protection against crushing and cutting damage for each level of geomancy",
	"The attacking enemy takes 3 melee bludgeoning damage for each level of Geomancy.",
	"Adds 50% of weapon damage as blunt damage.",
	"10% chance to stun the attacking enemy",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Light
const string StExt_Str_MasteryPerk_Name_5[StExt_MasteryPerk_Max] =
{
	"Righteousness",
	"Pious",
	"Holy Spirit",
	"Holiness",
	"Shield of Faith",
	"Blessing",
	"Strong Faith",
	"The Gift of Innos",
	"Righteous Army",
	"Dogmatism",
	"Patronage",
	"Stubbornness",
	"Amulet",
	"Inspiration",
	"Unwaveringness",
	"Leadership",
	"Radiant Edge",
	"Seal of Radiance",
	"Light Conduit",
	"Light Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_5[StExt_MasteryPerk_Max] =
{
	"Attacking undead and evil enemies take 20% of reflected damage as Fire damage.",
	"+25% damage against undead and evil",
	"-10% mana cost of spells with a holy component",
	"+25% damage to spells with a holy component",
	"+10 to energy shield for each level of light magic",
	"+0.3% life and energy shield regeneration per second",
	"10% of damage taken from undead is restored as energy shield and life.",
	"Grants a 10% chance to cast Holy Arrow when attacking.",
	"Minions gain the ability to cast 'Holy Arrow'",
	"Grants +50 at the start and +3 thereafter to damage against undead and evil for each level of light magic.",
	"The attacking enemy takes 5 fire damage for each level of holy magic.",
	"+5% resistance to any type of damage",
	"When attacking, there is a 10% chance that you and your allies will gain +3 to defense against everything for each level of light magic.",
	"When attacking, there is a 10% chance that you and your allies will gain +10 life for each level of light magic.",
	"When attacking, there is a 10% chance that you and your allies will receive +3 to stat regeneration for each level of Light Magic.",
	"When attacking, there is a 10% chance that you and your allies will receive +3 damage for each level of Light Magic.",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Dark
const string StExt_Str_MasteryPerk_Name_6[StExt_MasteryPerk_Max] =
{
	"Agony",
	"Depravity",
	"Dark Spirit",
	"Lord of Darkness",
	"Oppression",
	"The Curser",
	"Cover of Darkness",
	"Enslaver",
	"The Dark Sculptor",
	"Demonic Gift",
	"Dark Legion",
	"The Hand of Beliar",
	"The Siphon of Life",
	"Decline",
	"Vulnerability",
	"Filth",
	"Umbral Edge",
	"Seal of Shadow",
	"Dark Conduit",
	"Dark Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_6[StExt_MasteryPerk_Max] =
{
	"+3 Dark Magic Damage per Mastery Level",
	"+1 ongoing Darkness damage per mastery level",
	"-10% mana cost for spells with a dark component",
	"+25% to damage of spells with a dark component",
	"+50% to duration of ongoing Darkness damage",
	"+1% to Darkness spell duration per mastery level",
	"10% chance to curse nearby enemies with a random curse",
	"+0.3% chance to enslave the target's consciousness when attacking for each level of Dark Magic",
	"Shadow golems are 0.5% more powerful for each level of dark magic.",
	"Grants a 10% chance to cast Darkness Ball when attacking.",
	"Minions gain the ability to cast Dark Arrow.",
	"When attacking, the attacker transfers 0.5% of their health to you.",
	"When attacking, there is a 10% chance to cast a curse that steals 1 life point from the enemy for every 5 levels of dark magic.",
	"When attacking, there is a 10% chance to inflict a curse that weakens the target's stats by 0.5% for each level of dark magic.",
	"When attacking, there is a 10% chance to cast a curse that weakens the target's defense by 3 for each level of dark magic.",
	"Adds 50% of weapon damage as ongoing dark magic damage.",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Death
const string StExt_Str_MasteryPerk_Name_7[StExt_MasteryPerk_Max] =
{
	"The Messenger of Doom",
	"Withering",
	"The Spirit of the Graveyard",
	"Dead Man's Hand",
	"Funeral Bell",
	"Call of the Grave",
	"The Deathly Hallows",
	"Legions of Death",
	"The Will of the Lich",
	"Death Eater",
	"Mass Death",
	"The Grim Reaper",
	"Death Mage",
	"Bone Aegis",
	"Choir of the Dead",
	"Sacrificial Blade",
	"Deathly Edge",
	"Seal of Rot",
	"Death Conduit",
	"Death Cataclysm"
};
const string StExt_Str_MasteryPerk_Desc_7[StExt_MasteryPerk_Max] =
{
	"+3 death magic damage per mastery level",
	"+1 ongoing death magic damage per mastery level",
	"-10% mana cost of spells with a death component",
	"+150 magic damage to any weapon or magic",
	"0.1% of damage is stolen as health for each level of Death Magic.",
	"+25% damage against animals, humans, and orcs from any type of weapon",
	"Grants a 10% chance to cast Death Ball when attacking.",
	"Minions gain the ability to cast Death Bolt.",
	"Attacking living enemies takes 5 death magic damage per mastery level.",
	"20% of damage taken from death spells is restored as life.",
	"All death spells gain additional area damage.",
	"Death spells deal an additional +1% magic damage against living enemies per mastery level.",
	"Death spells are 25% more powerful.",
	"+1 to magic defense for each level of death magic",
	"Adds 50% of the damage dealt by Death spells as magic damage over time.",
	"Adds 50% of weapon damage as bonus magic damage against living enemies.",
	"Spellblade: +25% weapon element damage. Works with any weapon - the element scales with INT, magic power and mastery.",
	"Spellblade: this element's seal procs 1 hit sooner (min. every 2) and hits +20% harder.",
	"Spellblade: +50% element buildup rate, -25% weapon element mana cost.",
	"Spellblade: this element's eruption deals +30% more."
};
// Life
const string StExt_Str_MasteryPerk_Name_8[StExt_MasteryPerk_Max] =
{
	"Recovery",
	"Animal Lover",
	"Lord of the Swarm",
	"Vet",
	"Leader of the Pack",
	"The Keeper of the Den",
	"Caring owner",
	"Trainer",
	"Freshness",
	"Werewolf",
	"Bear's health",
	"Lionheart",
	"Bison Skin",
	"Wolf Bite",
	"Bee Sting",
	"Snake's Fang",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_8[StExt_MasteryPerk_Max] =
{
	"Healing spells grant an additional 0.1% of life regeneration per second for each level of Life Magic.",
	"Summoned animals are 1% more powerful for each level of Life Magic.",
	"Summoned animals have +5 poison damage per level of life magic.",
	"Summoned animals have 50% more health.",
	"Summoned animals have 25% more stats",
	"Summoned animals have 25% more defense.",
	"Summoned animals regenerate 0.1% of life for each level of Life Magic.",
	"Summoned animals gain an additional +0.1% chance to dodge attacks for each level of Life Magic.",
	"Life and stamina regeneration +1% per second",
	"Animal transformation is 1% more powerful for each level of Life Magic.",
	"Animal transformations gain 50% more health.",
	"Animal transformations gain 25% more stats.",
	"Animal transformations gain 25% more defense.",
	"Animal transformation has +5 cutting damage for each level of life magic.",
	"Animal transformation has +5 piercing damage for each level of life magic.",
	"Animal transformation deals +5 poison damage per level of Life Magic.",
	"",
	"",
	"",
	""
};
// Golem
const string StExt_Str_MasteryPerk_Name_9[StExt_MasteryPerk_Max] =
{
	"Sculptor",
	"Eternity of the Mountains",
	"The Apogee of the Craft",
	"Flint Peak",
	"Granite Limit",
	"Self-repair",
	"Rune Stone",
	"Mercury Mine",
	"Sulfur Mines",
	"Crystal Gorge",
	"High Ridge",
	"Cast Iron Fist",
	"Hammer Strike",
	"Stunned",
	"Accumulation",
	"Shake",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_9[StExt_MasteryPerk_Max] =
{
	"Summoned golems are 1% more powerful for each level of golemcrafting.",
	"Summoned golems gain 50% more health.",
	"Summoned golems gain 25% more stats.",
	"Summoned golems take 25% more damage.",
	"Summoned golems gain 25% more defense.",
	"Summoned golems regenerate +1% health per second",
	"Summoned golems gain energy shield equal to 25% of their maximum health.",
	"Summoned golems are 0.3% faster per level of golemcrafting.",
	"Summoned golems gain an additional +3 fire damage per level of golemcrafting.",
	"Summoned golems gain an additional +3 to magic damage for each level of golemcrafting.",
	"Summoned golems gain an additional +3 knockback damage per level of golemcrafting.",
	"Summoned golems gain an additional +3 to bludgeoning damage for each level of golemcrafting.",
	"Summoned golems deal +3 crushing damage per level of golemcrafting.",
	"Summoned golems have a 0.3% chance to stun the enemy per level of Golemcrafting.",
	"Summoned golems restore health equal to 20% of the damage taken.",
	"Summoned golems gain the 'Concussion' ability.",
	"",
	"",
	"",
	""
};
// Demon
const string StExt_Str_MasteryPerk_Name_10[StExt_MasteryPerk_Max] =
{
	"Demonologist",
	"Hellish health",
	"Demonic Legacy",
	"The Power of Eligor",
	"Devil's Patronage",
	"Connection with Inferno",
	"Ethereal Essence",
	"Eligor's Flame",
	"Sharp Claws",
	"The Enchanted Fang",
	"Soul Rupture",
	"Unholy Ritual",
	"Demoralization",
	"The Hand of Nergal",
	"Hand of Hell",
	"Materialization",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_10[StExt_MasteryPerk_Max] =
{
	"Summoned demons are 1% more powerful for each level of demonology.",
	"Summoned demons gain 50% more health.",
	"Summoned demons gain 25% more stats.",
	"Summoned demons take 25% more damage.",
	"Summoned demons gain 25% more defense.",
	"Summoned demons regenerate +0.5% health per second",
	"Summoned demons gain energy shield equal to 25% of their maximum health.",
	"Summoned demons gain an additional +3 fire damage per level of demonology.",
	"Summoned demons gain an additional +3 to slashing damage for each level of demonology.",
	"Summoned demons gain an additional +3 magic damage for each level of demonology.",
	"Summoned demons steal 5% of damage dealt as health.",
	"When attacking, demons can inflict a curse that weakens the target's stats by 0.5% for each level of demonology.",
	"When attacking, demons have a chance to inflict a curse that weakens the target's defense by 0.5% for each level of demonology.",
	"Demons gain the ability to cast 'Darkness Ball'",
	"Demons gain the ability to cast 'Fireball'",
	"Demons gain the ability to cast 'Blink'",
	"",
	"",
	"",
	""
};
// Necro
const string StExt_Str_MasteryPerk_Name_11[StExt_MasteryPerk_Max] =
{
	"Necromancer",
	"Embalming",
	"Dance of Death",
	"Fury of the Dead",
	"Strengthening bones",
	"Connection with the churchyard",
	"Rune Flesh",
	"Fist of Flesh",
	"Fatal Cut",
	"Bone Spike",
	"Enchanted Flesh",
	"Ptomaine",
	"Vampirism",
	"Bone Shield",
	"Dead Dexterity",
	"Finger of Death",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_11[StExt_MasteryPerk_Max] =
{
	"Summoned undead are 1% more powerful for each level of necromancy.",
	"Summoned undead gain 50% more health.",
	"Summoned undead gain 25% more stats",
	"Summoned undead take 25% more damage.",
	"Summoned undead gain 25% more defense.",
	"Summoned undead regenerate +0.5% health per second",
	"Summoned undead gain energy shield equal to 25% of their maximum health.",
	"Summoned undead gain an additional +3 to bludgeoning damage for each level of necromancy.",
	"Summoned undead gain an additional +3 to slashing damage for each level of necromancy.",
	"Summoned undead gain an additional +3 to piercing damage for each level of necromancy.",
	"Summoned undead gain an additional +3 to magic damage for each level of necromancy.",
	"Summoned undead take +3 poison damage per level of necromancy.",
	"Summoned undead steal 5% of damage dealt as health.",
	"Summoned undead reflect 5% of damage taken back",
	"Summoned undead are 0.3% faster per level of necromancy.",
	"Summoned undead gain the ability to cast 'Death Ball'",
	"",
	"",
	"",
	""
};
// Shaman
const string StExt_Str_MasteryPerk_Name_12[StExt_MasteryPerk_Max] =
{
	"Energy barrier",
	"Spiritual flesh",
	"Astral trance",
	"Rune Ligation",
	"Foresight",
	"Thriftyness",
	"The Enchanter",
	"The Elementalist",
	"Witchcraft weapon",
	"The Sorcerer's Tool",
	"Saving",
	"Deep Meditation",
	"Ethereal Vampirism",
	"Shaman",
	"Ancestral Fury",
	"Spiritual Connection",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_12[StExt_MasteryPerk_Max] =
{
	"+500 to maximum energy shield",
	"+5 to maximum energy shield for each level of spirit magic",
	"+0.1% energy shield regeneration for each level of spirit magic",
	"The amount of magical protection for robes is added as an additional energy shield,",
	"10% of damage taken is restored as energy shield",
	"10% of damage taken is restored as mana",
	"+1% damage to magic weapons for each level of spirit magic",
	"+1% to elemental and magical weapon damage for each level of spirit magic",
	"+25% damage with magic blades",
	"+25% damage with magic staves",
	"-10% mana cost for all spells",
	"+1% mana regeneration",
	"Steals 0.1% of energy shield and mana for each level of spirit magic.",
	"+1% to totem power for each level of spirit magic",
	"+10 additional fire totem damage per level of spirit magic",
	"Totems gain the ability to cast 'Mass Heal'",
	"",
	"",
	"",
	""
};
// MartialArts
const string StExt_Str_MasteryPerk_Name_13[StExt_MasteryPerk_Max] =
{
	"Two-handed fan",
	"One-handed fan",
	"Double Fan",
	"Ram attack",
	"The Hammer Fighter",
	"Executioner",
	"Spearman",
	"Crazy Whirlwind",
	"Two-handed fighter",
	"One-handed fighter",
	"Paired Fighter",
	"Mercenary",
	"The Guard",
	"Assassin",
	"Veteran Fighter",
	"Fighter",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_13[StExt_MasteryPerk_Max] =
{
	"+1% damage with two-handed weapons per Warrior Mastery level",
	"+1% damage with one-handed weapons per Warrior Mastery level",
	"+1% damage with dual wielding weapons per Warrior Mastery level",
	"+0.1% chance to stun an enemy when attacking per Warrior Mastery level",
	"+5 melee bludgeoning damage per Warrior Mastery level",
	"+5 melee slashing damage per Warrior Mastery level",
	"+5 melee piercing damage per Warrior Mastery level",
	"Melee weapon damage also applies to nearby targets",
	"+25% damage with two-handed weapons", 
	"+25% damage with one-handed weapons",
	"+25% damage with dual wielding weapons", 
	"+3 melee slash damage per Warrior Mastery level",
	"+3 melee cleave damage per Warrior Mastery level",
	"+3 melee pierce damage per Warrior Mastery level",
	"Each melee weapon proficiency level above 100% increases damage by 1%",
	"+0.5% melee damage per Warrior Mastery level",
	"",
	"",
	"",
	""
};

// Agile
const string StExt_Str_MasteryPerk_Name_14[StExt_MasteryPerk_Max] =
{
	"Protection from crushing",
	"Protection from cutting",
	"Fire Protection",
	"Protection from rejection",
	"Protection from Magic",
	"Protection against stabbing",
	"Latnik",
	"Shield Bearer",
	"Agility",
	"Counterattack",
	"Sustainability",
	"Preparation",
	"Rune Tempering",
	"Inaccessibility",
	"Besieged",
	"Grace",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_14[StExt_MasteryPerk_Max] =
{
	"+1 to bludgeoning damage defense for each level of defense mastery",
	"+1 to defense against cutting damage for each level of defense mastery",
	"+1 to Fire Damage Defense for each Defense Mastery level",
	"+1 to knockback damage resistance per level of Defense Mastery",
	"+1 to magic damage protection for each level of defense mastery",
	"+1 to piercing damage defense for each level of defense mastery",
	"Armor is 25% more effective",
	"When wearing shields, defense increases by 0.5% per skill level.",
	"+0.1% chance to dodge an attack for each level of Defense Mastery",
	"The attacker receives 5% of the reflected damage.",
	"+10% to maximum all resistances and +0.1% to all resistances for each level of Defense Mastery",
	"20% of damage taken is restored as health",
	"+0.1% chance to absorb a spell per level of Defense Mastery",
	"+10% chance to block all damage while holding a shield",
	"+0.5% chance to stun the attacker for each level of Defense Mastery while holding a shield",
	"+0.1% chance to deflect projectiles",
	"",
	"",
	"",
	""
};
// Archery
const string StExt_Str_MasteryPerk_Name_15[StExt_MasteryPerk_Max] =
{
	"Shooter",
	"Bow Fan",
	"Crossbow Fan",
	"Crushing Shot",
	"Veteran Archer",
	"Piercing Shot",
	"Poisoned Arrow",
	"Volley",
	"Ricochet",
	"Accurate Shot",
	"Skill",
	"Hunter",
	"Killer",
	"Orc Slayer",
	"To destroy evil",
	"Golem Slayer",
	"",
	"",
	"",
	""
};
const string StExt_Str_MasteryPerk_Desc_15[StExt_MasteryPerk_Max] =
{
	"+0.5% ranged damage per level of shooting mastery",
	"+1% bow damage per level of archery mastery",
	"+1% to crossbow damage for each level of shooting mastery",
	"+3 to ranged bludgeoning damage per level of Marksmanship Mastery",
	"Each level of ranged weapon proficiency above 100% increases damage by 1%",
	"+3 to ranged pierce damage per level of marksmanship",
	"+3 to ranged poison damage per level of marksmanship",
	"+10% chance to deal double ranged damage",
	"Arrow damage is also applied to nearby targets around it.",
	"+0.3% chance to stun an enemy with a ranged attack per level of Marksmanship Mastery",
	"+10% to the speed of all actions",
	"+1% damage against animals in ranged combat for each level of shooting mastery",
	"+1% damage against humans in ranged combat for each level of shooting mastery",
	"+1% damage against Orcs in ranged combat for each level of shooting mastery",
	"+1% damage against undead and evil in ranged combat for each level of marksmanship mastery",
	"+1% damage against ranged golems per level of marksmanship",
	"",
	"",
	"",
	""
};

// generic perks
const string StExt_Str_Perk_Name[StExt_Perk_Max] =
{
	"Student",
	"Ritualist",
	"Thick Skin",
	"Heritage of the Ancestors",
	"Athlete",
	"Replenishment",
	"Versatility",
	"Generosity",
	"Steel Will",
	"Rich aura",
	"Horizon",
	"Battle Mage",
	"Greedy",
	"Lucky one",
	"The Novice Fighter",
	"The Novice Shooter",
	"The Beginning Magician",
	"Mind over matter",
	"Pickpocket",
	"Attribute of a sorcerer",
	"Magic Guide",
	"The Swordsman",
	"Executioner",
	"Swordsman",
	"Spearman",
	"Halberdier",
	"Ambidexterity",
	"Archer",
	"Crossbowman",
	"Agility",
	"Double Shot",
	"Archmage",
	"Experienced swordsman",
	"Touch of Corruption",
	"Essence Devourer",
	"Hardening",
	"Veteran Mage",
	"Paladin",
	"Mirror durability",
	"Eternal Fortitude",
	"Magic Charge",
	"Pain Eater"
};
const string StExt_Str_Perk_Desc[StExt_Perk_Max] =
{
	"+1 to the maximum number of magic schools or martial arts studied",
	"+1 to maximum summoned creatures and another +1 for every 500 intelligence",
	"+0.5% vitality regeneration per second",
	"+0.5% magical power regeneration per second",
	"+0.5% stamina regeneration per second",
	"+0.5% energy shield regeneration per second",
	"+1 to the maximum active auras and another +1 for every 35 hero levels",
	"Auras work the same on summoned creatures and allies.",
	"+5 to aura power for each hero level",
	"Reduced resource reservation by auras by 25%",
	"+5 to aura range for each hero level",
	"+10% chance to deal critical damage with spells. Spell critical damage is increased by 25%.",
	"+25% to gold find",
	"+5% to luck",
	"+100 melee damage and another +5 for each level",
	"+100 ranged damage and another +5 for each level",
	"+100 magic damage and another +5 for each level",
	"Damage is taken from mana first instead of health",
	"+10% chance of successful theft",
	"Summoned creatures are 0.1% more powerful for each point of damage dealt by a magic weapon in their hands.",
	"+0.1% magic damage for each point of damage dealt by a magic weapon in your hands",
	"+25% extra damage with swords",
	"+25% extra damage with axes",
	"+25% additional damage with rapiers and light swords",
	"+25% extra damage with spears",
	"+25% extra damage with halberds",
	"+25% additional damage with dual wielding weapons",
	"+25% extra damage with bows",
	"+25% additional damage with crossbows",
	"+10% to the speed of all actions",
	"10% chance to fire a bow or crossbow twice (on hit)",
	"Spells consume twice as much mana. Spells gain an additional bonus based on your current mana.",
	"Weapon damage consumes additional stamina on impact. Weapon damage receives a bonus based on your current stamina.",
	"Unlocks the ability to upgrade your hero based on damage dealt. -25% of experience gained.",
	"Bonuses for killing monsters continue to be awarded after the main bonus has been received.",
	"+10% damage reduction and another +0.1% for each hero level.",
	"The spell damage bonus from wearing a robe is always active with or without any armor.",
	"General armor protection is added as an additional energy shield.",
	"+50% Reflected Damage Resistance.",
	"+50% Damage over Time Resistance.",
	"Spends up to 5% of mana on additional magical weapon damage.",
	"Damage is taken from stamina first instead of health."
};

// corruption perks
const string StExt_Corruption_Perk_Name_Mage[StExt_CorruptionPerk_Max] =
{
	"Sacrificial Ritual",
	"Internal reserves",
	"Shelter",
	"Resourcefulness",
	"The Sorcerer",
	"Essence Infusion",
	"The Unholy Guardian",
	"Dreamer",
	"Foresight",
	"Foresight",
	"Echo of Magic",
	"Soul Thief",
	"Thinker",
	"Inspiration by pain",
	"The Fanatic's Vow",
	"Mystical Accumulator",
	"Monk",
	"Adept",
	"Willpower",
	"Minions' Instability"
};
const string StExt_Corruption_Perk_Name_Warrior[StExt_CorruptionPerk_Max] =
{
	"Sacrificial Ritual",
	"Internal reserves",
	"Goliath",
	"Athlete",
	"Adrenalin",
	"Invincibility",
	"Bloodless",
	"Eternal Youth",
	"The Way of the Warrior",
	"Barbarism",
	"Discipline",
	"Preparation",
	"Healthy Body",
	"Cannibal",
	"Diamond Skin",
	"The Madness of Battle",
	"Army training",
	"The Slayer",
	"Parry",
	"Balance"
};
const string StExt_Corruption_Perk_Name_Ranger[StExt_CorruptionPerk_Max] =
{
	"Sacrificial Ritual",
	"Ghost Dance",
	"Resourcefulness",
	"Powerful Piercing",
	"Ballistics",
	"Field Medicine",
	"Athlete",
	"Lightfoot",
	"Bloodlust",
	"Quiet Steps",
	"Split Shot",
	"Primordial Power",
	"Cloak of Thorns",
	"Grace",
	"Deadly Toxins",
	"Witch Arrow",
	"Stab in the back",
	"Will of the Blades",
	"A True Strike",
	"Equilibrium"
};

const string StExt_Corruption_Perk_Desc_Mage[StExt_CorruptionPerk_Max] =
{
	"Killing people is rewarded with +1 to vitality.",
	"When mana is low, it is replenished by vitality.",
	"30% of your maximum life force is added as energy shield",
	"+1% chance to critically hit with spells per level of defilement",
	"+2% magic damage per level of desecration",
	"+2% to the power of summoned creatures for each level of desecration",
	"+0.5% chance to reflect a spell per level of desecration",
	"+1% mana regeneration per second",
	"Reduces mana reservation of auras by 25%",
	"20% of damage taken is restored as energy shield",
	"+1% spell recast chance per level of desecration",
	"10% of damage is stolen as energy shield",
	"10% increase to maximum mana",
	"+50% magic damage when low on health",
	"Instead of health, the energy shield is regenerated.",
	"Adds 50% of your maximum mana to your energy shield.",
	"+1% damage to magic weapons for each level of desecration",
	"+10% Spell Cost Reduction",
	"+3% to duration of effects for each level of desecration",
	"When minions die, they explode, dealing 30% of their maximum health as Fire damage."
};
const string StExt_Corruption_Perk_Desc_Warrior[StExt_CorruptionPerk_Max] =
{
	"Killing people is rewarded with +1 to magical powers.",
	"When your vitality is low, it is replenished using mana.",
	"+50 to maximum life force for each level of desecration",
	"+0.1% stamina regeneration per level of desecration",
	"+5% health regeneration when low on vitality",
	"+2 to protection from everything for each level of desecration",
	"20% of damage taken is restored as health.",
	"+2% to life force regeneration per second",
	"+2% melee damage per level of desecration",
	"+1% chance to deal double damage per level of desecration",
	"+ 1 to maximum active auras",
	"Reduced resource reservation by auras by 25%",
	"10% increase to maximum health",
	"Killing an enemy fully restores health.",
	"+10% resistance to all damage",
	"+0.5% stun the enemy for each level of desecration",
	"+1% crossbow damage per level of desecration",
	"+1% damage with two-handed weapons per level of desecration",
	"+1% damage with one-handed weapons per level of desecration",
	"30% of your strength is added as extra agility."
};
const string StExt_Corruption_Perk_Desc_Ranger[StExt_CorruptionPerk_Max] =
{
	"Killing people is rewarded with +1 to vitality.",
	"+1% chance to gain 3 seconds of invisibility per level of desecration",
	"+0.5% chance to dodge per level of desecration",
	"+10 pierce damage per level of desecration",
	"+2% ranged damage per level of desecration",
	"+1% vitality regeneration per second",
	"+0.1% stamina regeneration per level of desecration",
	"+1% to all action speed for every 2 levels of desecration (50% maximum)",
	"10% of damage taken is stolen as life force and stamina",
	"You deal double damage to enemies who can't see you.",
	"+1% chance to re-fire per level of desecration",
	"+1% to elemental, magical, and poison damage per level of desecration",
	"Reflects 10% of damage taken as piercing damage.",
	"When sprinting, +50% chance to dodge attacks",
	"+5 poison damage during ranged combat for each level of defilement",
	"+5 continuous magic damage during ranged combat for each level of desecration",
	"+1% damage with rapiers and light swords for each level of desecration",
	"+1% damage with dual wielding weapons per level of desecration",
	"+1% damage with spears per level of desecration",
	"30% of your agility is added as extra strength."
};

const string StExt_Str_Yes = "Yes";
const string StExt_Str_No = "No";
const string StExt_Str_Learned_Yes = "Learned";
const string StExt_Str_Learned_No = "Not trained";
const string StExt_Str_Seconds = "second";
const string StExt_Str_Pts = "units";
const string StExt_Str_EvilBossApears = "Evil has come into this world...";

// *** Difficulty configs strings ***
const string StExt_Str_Config_Diff_Header = "--- * Difficulty settings * ---";
const string StExt_Str_Config_Diff_EnableStatic = "Enable static difficulty increase";
const string StExt_Str_Config_Diff_Static_Power = "Static increase to NPC power";
const string StExt_Str_Config_Diff_Static_Hp = "Static increase to NPC life";
const string StExt_Str_Config_Diff_Static_Prot = "Static increase to NPC defense";

const string StExt_Str_Config_Diff_EnableDaily = "Enable daily difficulty increase";
const string StExt_Str_Config_Diff_Daily_Power = "Daily increase in NPC power";
const string StExt_Str_Config_Diff_Daily_Hp = "Daily growth of NPC life";
const string StExt_Str_Config_Diff_Daily_Prot = "Daily increase in NPC defense";

const string StExt_Str_Config_Diff_EnableKapitel = "Enable difficulty increase by chapter";
const string StExt_Str_Config_Diff_Kapitel_Power = "NPC power growth by chapter";
const string StExt_Str_Config_Diff_Kapitel_Hp = "NPC life growth by chapter";
const string StExt_Str_Config_Diff_Kapitel_Prot = "NPC defense growth by chapter";
const string StExt_Str_Config_Diff_Kapitel_Speed = "Increase in additional speed of NPCs by chapter";

const string StExt_Str_Config_Diff_EnableLevel = "Enable difficulty increase based on hero level";
const string StExt_Str_Config_Diff_Level_Power = "NPC power growth from hero level";
const string StExt_Str_Config_Diff_Level_Hp = "NPC life growth from hero level";
const string StExt_Str_Config_Diff_Level_Prot = "NPC defense growth depending on hero level";
const string StExt_Str_Config_Diff_Level_Speed = "NPC additional speed increase (%) from hero level";
const string StExt_Str_Config_Diff_Level_DuplicationChance = "Additional increase in the chance of NPC duplication depending on the hero's level";
const string StExt_Str_Config_Diff_Level_CorruptionChance = "Additional increase in the chance of corruption of NPC magical saturation depending on the hero's level";
const string StExt_Str_Config_Diff_Level_MagicInfusionChance = "Additional increase in the chance of magical infusion of NPCs depending on the hero's level";
const string StExt_Str_Config_Diff_Level_MagicInfusionPower = "Additional increase in the power of NPC magical infusion from the hero's level";

const string StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Chance = "Additional increase in the chance of NPC duplication from the leader";
const string StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Count = "Additional increase in the number of duplicated NPCs from the chapter";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = "Additional increase in the chance of magical infusion of NPCs from the head";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Power = "Additional increase in the power of magical infusion of NPCs from the head";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance = "Additional increase in the chance of corruption of the magical saturation of NPCs from the head";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange = "Offset of the NPC's magical infusion rank from the leader";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = "Additional increase in the chance of NPCs from the leader having a magical melee weapon";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = "Additional increase in the chance of NPCs from the leader having a ranged magic weapon";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomShield_Chance = "Additional increase in the chance of NPCs getting a shield from the leader";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomHelm_Chance = "Additional increase in the chance of a helmet appearing on an NPC from the leader";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomScroll_Chance = "Additional increase in the chance of a war scroll appearing on an NPC from the leader";
const string StExt_Str_Config_Diff_Kapitel_Npc_HealingScroll_Chance = "Additional increase in the chance of a healing scroll appearing on an NPC from the leader";
const string StExt_Str_Config_Diff_Kapitel_DailyHpMod = "Additional bonus to daily NPC life growth from the chapter";
const string StExt_Str_Config_Diff_Kapitel_DailyPowerMod = "Additional bonus to daily NPC power growth from the chapter";
const string StExt_Str_Config_Diff_Kapitel_DailyProtMod = "Additional bonus to daily growth of NPC defense from the leader";

const string StExt_Str_Config_Diff_EnableRot = "Enable spawn from 'Road of Trials'";

// *** Npc configs strings ***
const string StExt_Str_Config_Npc_Header = "--- * NPC settings * ---";
const string StExt_Str_Config_Npc_EnableStatsRandomization = "Enable NPC stats randomization";
const string StExt_Str_Config_Npc_StatsRandomization_Hp = "NPC life randomization";
const string StExt_Str_Config_Npc_StatsRandomization_Stats = "NPC stats randomization";
const string StExt_Str_Config_Npc_StatsRandomization_Protection = "NPC protection randomization";
const string StExt_Str_Config_Npc_StatsRandomization_Damage = "NPC damage spread";

const string StExt_Str_Config_Npc_EnableLevelBonus = "Enable NPC level bonus";
const string StExt_Str_Config_Npc_LevelBonus_Hp = "Additional NPC HP per level";
const string StExt_Str_Config_Npc_LevelBonus_Stats = "Additional NPC stats per level";
const string StExt_Str_Config_Npc_LevelBonus_Protection = "Additional NPC protection per level";
const string StExt_Str_Config_Npc_LevelBonus_Damage = "Additional NPC damage per level";

const string StExt_Str_Config_Npc_EnableDuplication = "Enable NPC duplication";
const string StExt_Str_Config_Npc_Duplication_Chance = "Base chance of NPC duplication";
const string StExt_Str_Config_Npc_Duplication_CountMin = "Minimum number of duplicated NPCs";
const string StExt_Str_Config_Npc_Duplication_CountMax = "Maximum number of duplicated NPCs";
const string StExt_Str_Config_Npc_Duplication_AllowBosses = "Allow duplicating bosses";
const string StExt_Str_Config_Npc_Duplication_AllowHumans = "Allow duplication of humans";
const string StExt_Str_Config_Npc_Duplication_AllowHumansBandits = "Allow duplication of human bandits";
const string StExt_Str_Config_Npc_Duplication_LevelThreshold = "Minimum hero level to start duplication";

const string StExt_Str_Config_Npc_EnableMagicInfusion = "Enable magical infusion of NPCs";
const string StExt_Str_Config_Npc_MagicInfusion_Chance = "Base chance of magical infusion of NPCs";
const string StExt_Str_Config_Npc_MagicInfusion_LevelThreshold = "Minimum hero level to start magical infusion";
const string StExt_Str_Config_Npc_MagicInfusion_PowerMod = "Magic Infusion Power Modifier";
const string StExt_Str_Config_Npc_MagicInfusion_AllowHumans = "Allow magical infusion for humans";
const string StExt_Str_Config_Npc_MagicInfusion_AllowBosses = "Allow magical infusion for bosses";
const string StExt_Str_Config_Npc_MagicInfusion_CorruptionChance = "Chance of corruption of NPC affixes";

const string StExt_Str_Config_Npc_EnableRandomEquipment = "Enable random NPC equipment";
const string StExt_Str_Config_Npc_RandomMeleeWeapon_Chance = "Base chance of NPCs having a magical melee weapon";
const string StExt_Str_Config_Npc_RandomRangeWeapon_Chance = "Base chance of NPCs having a magical ranged weapon";
const string StExt_Str_Config_Npc_RandomScroll_Chance = "Base chance of an NPC getting a combat scroll";
const string StExt_Str_Config_Npc_HealingScroll_Chance = "Base chance of an NPC getting a healing scroll";
const string StExt_Str_Config_Npc_RandomShield_Chance = "Base chance of an NPC having a shield";
const string StExt_Str_Config_Npc_RandomHelm_Chance = "Base chance of an NPC having a helmet";

const string StExt_Str_Config_Npc_MagicInfusedAlwaysHasRandomEquipment = "Magically infused NPCs always receive mag. weapons";

const string StExt_Str_Config_Npc_LuckyFlagChance = "Chance of lucky NPCs appearing";
const string StExt_Str_Config_Npc_RichFlagChance = "Chance of rich NPCs appearing";

const string StExt_Str_Config_Npc_GlobalHpMult = "Final modifier of NPC vitality";
const string StExt_Str_Config_Npc_GlobalStatMult = "Final modifier of NPC characteristics";
const string StExt_Str_Config_Npc_GlobalProtMult = "Final NPC protection modifier";
const string StExt_Str_Config_Npc_GlobalDamMult = "Final NPC damage modifier";
const string StExt_Str_Config_Npc_GlobalEsMult = "Final modifier of the NPC energy shield";

const string StExt_Str_Config_NpcSum_CanBeDuplicated = "Summoned NPCs can be duplicated";
const string StExt_Str_Config_NpcSum_CanBeInfused = "Summoned NPCs can be magically infused";
const string StExt_Str_Config_NpcSum_GlobalHpMult = "Final modifier of the vitality of summoned NPCs";
const string StExt_Str_Config_NpcSum_GlobalStatMult = "Final modifier of the characteristics of summoned NPCs";
const string StExt_Str_Config_NpcSum_GlobalProtMult = "Final protection modifier for summoned NPCs";
const string StExt_Str_Config_NpcSum_GlobalDamMult = "Final damage modifier for summoned NPCs";
const string StExt_Str_Config_NpcSum_GlobalEsMult = "Final modifier of the energy shield of summoned NPCs";

const string StExt_Str_Config_Sum_GlobalHpMult = "Final modifier of the vitality of summoned creatures";
const string StExt_Str_Config_Sum_GlobalStatMult = "Final modifier of the characteristics of summoned creatures";
const string StExt_Str_Config_Sum_GlobalProtMult = "Final defense modifier of summoned creatures";
const string StExt_Str_Config_Sum_GlobalDamMult = "Final damage modifier for summoned creatures";

// *** Luck configs strings ***
const string StExt_Str_Config_Luck_Header = "--- * Luck settings * ---";
const string StExt_Str_Config_Luck_Difficulty = "Base luck difficulty modifier";
const string StExt_Str_Config_Luck_Power = "Base item power modifier";
const string StExt_Str_Config_Luck_Quantity = "Base item quantity modifier";
const string StExt_Str_Config_Luck_Money = "Base gold amount modifier";

const string StExt_Str_Config_Luck_EnableRandomLoot_Bodies = "Enable luck on defeated NPCs";
const string StExt_Str_Config_Luck_EnableRandomLoot_Chests = "Enable luck in chests";
const string StExt_Str_Config_Luck_RandomLoot_EnableUnHumanDrop = "Enable luck on non-human NPCs";

const string StExt_Str_Config_Luck_RandomLootPowerMod_Food = "Luck power modifier for food";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Alchemy = "Luck power modifier for alchemy";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Magic = "Luck power modifier for magic";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Misk = "Luck power modifier for various items";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Armor = "Luck power modifier for armor";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Weapon = "Luck power modifier for weapons";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Jewelry = "Luck power modifier for jewelry";

const string StExt_Str_Config_Luck_RandomLootQuantityMod_Food = "Food quantity modifier";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Alchemy = "Alchemy quantity modifier";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Magic = "Quantity modifier for magic";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Munition = "Quantity modifier for arrows and bolts";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Misk = "Quantity modifier for different items";

// *** World randomization configs strings ***
const string StExt_Str_Config_WorldRandomization_Header = "--- * World randomization settings * ---";
const string StExt_Str_Config_EnableWorldRandomization_Items = "Enable random appearance of items in the world";
const string StExt_Str_Config_EnableWorldRandomization_Npc = "Enable random appearance of NPCs in the world";
const string StExt_Str_Config_WorldRandomization_MinCooldown = "Minimum cooldown of world randomization";
const string StExt_Str_Config_WorldRandomization_MaxCooldown = "World randomization maximum cooldown";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnChance = "Chance of random NPCs appearing in the world";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPowerMod = "Random NPC power modifier";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnCountMod = "Random NPC spawn count modifier";
const string StExt_Str_Config_WorldRandomization_Item_SpawnChance = "Chance of random items appearing in the world";
const string StExt_Str_Config_WorldRandomization_Item_SpawnPowerMod = "Random item power modifier";
const string StExt_Str_Config_WorldRandomization_Item_SpawnCountMod = "Random item count modifier";

const string StExt_Str_Config_WorldRandomization_TradersExtraItemsAddRate = "Frequency of adding random items to traders";
const string StExt_Str_Config_WorldRandomization_EmptyChestsUpdateRate = "Empty chests update rate";
const string StExt_Str_Config_WorldRandomization_Npc_EnableSpawnSound = "Enable sound notification when NPC spawns by the randomizer";

// *** Other configs strings ***
const string StExt_Str_Config_Misk_Header = "--- * Other settings * ---";
const string StExt_Str_Config_EnableSkeletonSkin = "Enable undead skin";
const string StExt_Str_Config_EnableSkeletonSkin_OnlyAtNight = "Undead skin is active only at night";
const string StExt_Str_Config_EnableFemaleLook = "Enable female skin";
const string StExt_Str_Config_EnableFemaleLook_AlwaysWig = "Enable female skin - wig";
const string StExt_Str_Config_EnableFemaleLook_HideHelm = "Replace helmet with wig (female skin)";
const string StExt_Str_Config_EnableFemaleLook_DemonLook = "Female skin - demon look";

const string StExt_Str_Config_GainExpMod = "Experience gain modifier";
const string StExt_Str_Config_ExpMod = "General modifier of experience gained (Setting from the original)";
const string StExt_Str_Config_SncExp = "Absolute SNC Development Modifier";
const string StExt_Str_Config_PartyExp = "Experience gained with allies";
const string StExt_Str_Config_NpcExp = "Experience gained from NPCs";
const string StExt_Str_Config_BelliarRageExp = "Modifier for experience gained from enemies (Beliar's Wrath)";

const string StExt_Str_Config_BelliarRage_Active = "Beliar's Rage - Mod active";
const string StExt_Str_Config_BelliarRage_SpawnMonsters = "Beliar's Rage - Random spawn of monsters with the hero";
const string StExt_Str_Config_BelliarRage_StaminaReduce = "Beliar's Rage - Increase Stamina Requirements";
const string StExt_Str_Config_BelliarRage_AddDamageReduce = "Beliar's Wrath - Reduce all additional damage";
const string StExt_Str_Config_BelliarRage_RegenEnemies = "Beliar's Wrath - Regenerates health in enemies";
const string StExt_Str_Config_BelliarRage_SoundEnable = "Beliar's Rage - Enable Sound";

const string StExt_Str_Config_ExtraLp = "Extra learning points per level";
const string StExt_Str_Config_ExtraHpPerLevel = "Extra lives per level";
const string StExt_Str_Config_ExtraMpPerLevel = "Extra mana per level";
const string StExt_Str_Config_ExtraEsPerLevel = "Additional energy shield per level";
const string StExt_Str_Config_ExtraStrPerLevel = "Extra strength per level";
const string StExt_Str_Config_ExtraAgiPerLevel = "Extra Agility Per Level";
const string StExt_Str_Config_ExtraIntPerLevel = "Extra Intelligence Per Level";
const string StExt_Str_Config_ExtraLuckPerLevel = "Extra luck per level";

const string StExt_Str_Config_MasteriesExpMult = "Mastery experience modifier";
const string StExt_Str_Config_CorruptionExpMult = "Corruption experience modifier";
const string StExt_Str_Config_ArtifactsExpMult = "Artifact experience modifier";
const string StExt_Str_Config_EducationMoneyCostMult = "Gold modifier for skill training";
const string StExt_Str_Config_EducationRequirementsMult = "Skill training requirements modifier";
const string StExt_Str_Config_NoChapterForMagicCircle = "Disable chapter requirements for magic circle training";
const string StExt_Str_Config_ShowNpcLevel = "Show NPC level";
const string StExt_Str_Config_DisplayLuckMessage = "Display luck messages";
const string StExt_Str_Config_DisplayMasteryLevelUp = "Display messages about mastery development";
const string StExt_Str_Configs_Education = "[Learn special skills]";

const string StExt_Str_Config_Ui_Header = "--- * Interface settings * ---";
const string StExt_Str_Config_MenuScaleX = "Menu width (mod)";
const string StExt_Str_Config_MenuScaleY = "Menu height (mode)";
const string StExt_Str_Config_DisplayBuffEffects = "Display buff/debuff effects";
const string StExt_Str_Config_DisplayEsEffects = "Display Energy Shield effect";
const string StExt_Str_Config_MenuTextWrapIndex = "Index of text wrapping in the menu";
const string StExt_Str_GeneralPerks_Header = "General Skills";

/* *** Aura strings *** */
const string StExt_Str_AuraName[StExt_AuraIndex_Max] =
{
	"Concentrator",
	"Heart of the Bison",
	"The Wisdom of Adanos",
	"Secret knowledge",
	"The Power of the Bear",
	"Puma Agility",
	"The Owl's Den",
	"Wolf Regeneration",
	"The Cunning of the Raven",
	"Dog Endurance",
	"The Dreamer's Dream",
	"Cheetah Speed",
	"Astral Stream",
	"Snake's Agility",
	"Leech",
	"Illithid",
	"Soul Thief",
	"Iron Skin",
	"Air Shield",
	"Spell Eater",
	"Luck",
	"Wealth",
	"Thief",
	"Witch",
	"Cemetery",
	"Forest Thicket",
	"Doomsday",
	"Bastion",
	"Thorn",
	"Mirror Shield",
	"The Summoner",
	"Overlord",
	"Assertive",
	"The Inquisitor",
	"Touch of the North",
	"Prayer",
	"The Servant of Death",
	"Poisoner",
	"Charge",
	"Damn",
	"Crusher",
	"Woodcutter",
	"The Impaler",
	"Warrior's Trance",
	"Trans Arrow",
	"The Sorcerer's Trance",
	"Ethereal Skin",
	"Strengthening",
	"The Veil of Death",
	"The Unholy Cloak",
	"Ice Cloak",
	"Storm Cloak",
	"Poison Cloak",
	"Cloak of Thorns",
	"Fiery Cloak",
	"Stone Cloak",
	"Cloak of Readiness",
	"Raging Flame",
	"Ice bolide",
	"Creeping Darkness",
	"Breath of the Eternal",
	"Hand of the Storm",
	"Wind of Change",
	"The Basilisk's Gaze",
	"Stumbling Block",
	"Shadow Helper",
	"Extension",
	"Lord of the Astral",
	"Lord of the Dead",
	"The Golem Lord",
	"Demon Lord",
	"Lord of Death",
	"Lord of Life",
	"Lord of Light",
	"Lord of Darkness",
	"Lord of Lightning",
	"Lord of the Air",
	"Lord of the Earth",
	"The Lord of Ice",
	"Lord of Fire",
	"Warrior's Inspiration",
	"The Mercenary's Inspiration",
	"Hunter's Inspiration",
	"Shooter's Inspiration",
	"Living weapon",
	"Assassin's Inspiration",
	"The Mace's Retribution",
	"Blade's Retribution",
	"The Retribution of the Bow",
	"Retribution of Fire",
	"The Wind's Retribution",
	"Retribution of Magic",
	"Vengeance of Poison"
};

const string StExt_Str_AuraDesc[StExt_AuraIndex_Max] =
{
	"+200 to Aura Power",
	"+5 to vitality for each aura power",
	"+2 to magical power for each aura power",
	"+1 to intelligence for each aura power",
	"+1 to strength for each aura power",
	"+1 to agility for each aura power",
	"+5 to energy shield for each aura power",
	"+0.1% health regeneration for every 10 aura power",
	"+0.1% energy shield regeneration for every 10 aura power",
	"+0.1% stamina regeneration for every 5 aura power",
	"+0.1% mana regeneration for every 10 aura power",
	"+1% action speed for every 20 aura power",
	"+1 to magical power for every 10 units of aura power",
	"+0.25% chance to dodge a hit for every 10 aura power",
	"+0.1% life steal per 10 aura power",
	"+0.1% mana steal per 10 aura power",
	"+0.1% shield steal for every 10 aura power",
	"+1 to physical defense for every 2 units of aura power",
	"0.5% chance to deflect an arrow for every 10 aura power",
	"0.5% spell absorption for every 10 aura power",
	"+0.5% luck for every 10 units of aura power",
	"+1% bonus gold found per 10 aura power",
	"+1% steal chance for every 10 aura power",
	"+0.1% chance to turn a killed enemy into a skeleton for every 10 aura power",
	"Summons one zombie guardian while the aura is active. The zombie also benefits from the aura's power.",
	"Summons one Guardian Wolf, plus 1 more for every 200 Aura Power. Wolves also benefit from Aura Power.",
	"Summons one demon guardian while the aura is active. The demon also benefits from the aura's power.",
	"Summons one guardian golem while the aura is active. The golem also benefits from the aura's power.",
	"+0.1% chance to reflect damage per aura power",
	"+0.1% chance to reflect magic for each aura power",
	"+0.1% to the total power of summoned creatures for each aura power",
	"+1 to maximum summoned creatures for every 100 Aura Power",
	"+0.1% chance to stun the enemy for each aura power",
	"+1 burning damage per aura power",
	"+0.1% chance to freeze the enemy and deal 1 damage per aura power",
	"Undead and evil units in a small radius take 1 fire damage per aura power.",
	"+1 magic damage against living targets for each aura power",
	"+1 poison damage (dot) for each aura power",
	"+0.1% chance to stun an enemy and deal 1 damage per aura power",
	"+1 to DoT damage for each aura power",
	"+1 bludgeoning damage (dot) for each aura power",
	"+1 damage to slashing (dot) for each aura power",
	"+1 piercing damage (dot) for each aura power",
	"+0.1% melee weapon damage per aura power",
	"+0.1% ranged weapon damage per aura power",
	"+0.1% magic damage per aura power",
	"+1 to fire and magic resistance for every 2 points of aura power",
	"+1 to knockback protection for each aura power",
	"10% base chance to trigger Death Fog, deals 2 damage per aura power.",
	"10% base chance to trigger a Dark Wave, dealing 1 DoT damage per aura power.",
	"10% base chance to trigger a Cold Wave, dealing 1 damage per aura power and can freeze enemies.",
	"10% base chance to trigger an Electric Wave, dealing 1 damage per aura power and can stun enemies.",
	"10% base chance to trigger a Poison Wave, dealing 1 poison damage per aura power.",
	"10% base chance to trigger a Root Wave, dealing 1 poison damage per aura power and entangling enemies in roots.",
	"10% base chance to trigger a Fire Wave, dealing 2 damage per aura power.",
	"10% base chance to trigger Earthquake, deals 1 damage per aura power and can stun enemies.",
	"10% base chance to gain temporary invulnerability when taking damage, chance and duration depend on the aura's strength.",
	"Shoots a Fireball at the enemy every second.",
	"Shoots an Ice Spear at the enemy every second.",
	"Shoots a Darkness Ball at the enemy every second.",
	"Shoots a Death Ball at the enemy every second.",
	"Shoots Lightning at the enemy every second.",
	"Shoots a Fist of Air at the enemy every second.",
	"Shoots a Poison Arrow at the enemy every second.",
	"Shoots a Stone Arrow at the enemy every second.",
	"Summon a shadow copy of yourself, possessing your abilities. The shadow also gains bonuses from your aura strength and hero level.",
	"+0.1% to effect duration for each aura power",
	"+1 to Spirit Magic Power for each Aura Power",
	"+1 to Necromantic Power for each Aura Power",
	"+1 Golemcraft Power for each Aura Power",
	"+1 to Demonology Power for each Aura Power",
	"+1 to Death Magic Power for each Aura Power",
	"+1 to Life Magic Power for each Aura Power",
	"+1 to Light Magic Power for each Aura Power",
	"+1 to Dark Magic Power for each Aura Power",
	"+1 Electromancy Power for each Aura Power",
	"+1 Aeromancy Power for each Aura Power",
	"+1 to Geomancy Power for each Aura Power",
	"+1 to Hydromancy Power for each Aura Power",
	"+1 to Pyromancy Power for each Aura Power",
	"+3 damage with one-handed weapons for each aura power",
	"+3 damage with two-handed weapons for each aura power",
	"+3 bow damage per aura power",
	"+3 crossbow damage per aura power",
	"Throws the current melee weapon at nearby enemies.",
	"+3 damage with dual wielding weapons per aura power",
	"+5 to returned crushing damage for each aura power",
	"+5 to returned slashing damage for each aura power",
	"+5 to returned piercing damage for each aura power",
	"+5 to fire damage returned for each aura power",
	"+5 to return knockback damage for each aura power",
	"+5 to magic damage returned for each aura power",
	"+5 to poison damage returned per aura power"
};

const string StExt_Str_AuraRequirements[StExt_AuraIndex_Max] =
{
	"Requires: 300 Stamina",
	"Requires: 200 Stamina",
	"Requires: 100 Intelligence",
	"Requires: 200 Intelligence",
	"Requires: 200 Stamina | 100 Strength",
	"Requires: 200 Stamina | 100 Dexterity",
	"Requires: 200 Intelligence",
	"Requires: 200 Stamina",
	"Requires: 200 Intelligence",
	"Requires: 150 Stamina",
	"Requires: 100 Intelligence",
	"Requires: 250 Stamina | 75 Dexterity",
	"Requires: 250 Intelligence",
	"Requires: 200 Stamina | 100 Dexterity",
	"Requires: 500 Vitality",
	"Requires: 500 Mana",
	"Requires: 500 Energy Shield",
	"Requires: 500 Vitality",
	"Requires: 300 Vitality",
	"Requires: 200 Intelligence | 500 Mana",
	"Requires: ",
	"Requires: ",
	"Requires: 50 Dexterity",
	"Requires: 250 Intelligence | 600 Mana",
	"Requires: 300 Intelligence",
	"Requires: 300 Intelligence",
	"Requires: 500 Intelligence",
	"Requires: 400 Intelligence",
	"Requires: 300 Stamina",
	"Requires: 300 Intelligence | 500 Mana",
	"Requires: 200 Intelligence",
	"Requires: 350 Intelligence | 500 Mana",
	"Requires: 150 Strength | 300 Stamina",
	"Requires: 200 Mana",
	"Requires: 200 Mana",
	"Requires: 350 Mana",
	"Requires: 250 Stamina",
	"Requires: 250 Stamina",
	"Requires: 250 Mana",
	"Requires: 250 Mana",
	"Requires: 300 Stamina",
	"Requires: 300 Stamina",
	"Requires: 300 Stamina",
	"Requires: 300 Stamina",
	"Requires: 300 Stamina",
	"Requires: 300 Mana",
	"Requires: 500 Mana",
	"Requires: 300 Stamina | 500 Vitality",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 400 Intelligence | 600 Mana",
	"Requires: 500 Stamina | 1000 Vitality",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 100 Intelligence | 200 Mana",
	"Requires: 500 Vitality",
	"Requires: 100 Stamina",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Intelligence",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 300 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina",
	"Requires: 100 Stamina"
};

const string StExt_Str_AuraReservation[StExt_AuraIndex_Max] =
{
	"Reserves: 10% Stamina",
	"Reserves: 15% Stamina",
	"Reserves: 25% Stamina",
	"Reserves: 20% Mana",
	"Reserves: 15% Stamina",
	"Reserves: 15% Stamina",
	"Reserves: 30% Mana",
	"Reserves: 25% Stamina",
	"Reserves: 25% Mana",
	"Reserves: 10% Stamina",
	"Reserves: 15% Mana",
	"Reserves: 35% Stamina",
	"Reserves: 40% Mana",
	"Reserves: 35% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Mana",
	"Reserves: 15% of Energy Shield",
	"Reserves: 25% Stamina",
	"Reserves: 35% Stamina",
	"Reserves: 35% Mana",
	"Reserves: 15% Stamina",
	"Reserves: 15% Stamina",
	"Reserves: 5% Stamina",
	"Reserves: 35% Mana",
	"Reserves: 35% Mana",
	"Reserves: 35% Mana",
	"Reserves: 40% Mana",
	"Reserves: 40% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 20% Mana",
	"Reserves: 25% Mana",
	"Reserves: 60% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 25% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 15% Stamina",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 25% Stamina",
	"Reserves: 25% Stamina",
	"Reserves: 25% Mana",
	"Reserves: 25% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Mana",
	"Reserves: 30% Stamina",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 50% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 15% Stamina",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Mana",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 35% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina",
	"Reserves: 20% Stamina"
};

const string StExt_Str_NotEnoughtLpMessagePart = "Learning Points!";
const string StExt_Str_Auras_NoSlot = "The limit on the number of active auras has been reached!";
const string StExt_Str_Auras_NoMana = "Aura requirements exceed human limit!";
const string StExt_Str_Auras_NoStats = "Aura requirements not met!";
const string StExt_Str_Auras_CantEquip = "Cannot activate aura!";
const string StExt_Str_print_Aura = "Aura: ";
const string StExt_Str_DisplayManaReq = "Mana required: ";
const string StExt_Str_DisplayStrReq = "Force required: ";
const string StExt_Str_DisplayAgiReq = "Dexterity required: ";
const string StExt_Str_DisplayHpReq = "Lives required: ";
const string StExt_Str_DisplayStamReq = "Stamina required: ";
const string StExt_Str_DisplayBowReq = "Bow skill required: ";
const string StExt_Str_DisplayCBowReq = "Required crossbow skill: ";
const string StExt_Str_DisplayShieldReq = "Shield skill required: ";
const string StExt_Str_DisplayShieldProtWeap = "Weapon protection: ";
const string StExt_Str_DisplayShieldProtPoint = "Arrow protection: ";
const string StExt_Str_PotionEffect_Header = "Potion effects:";

const string StExt_Str_CorruptionScrollName = "Scroll of the Mysterious Ritual";
const string StExt_Str_CorruptionScrollTxt1 = "This describes a very dark ritual for gaining special powers...";
const string StExt_Str_CorruptionScrollTxt2 = "Maybe it's better to leave this scroll alone?";
const string StExt_Str_CorruptionScrollTxt3 = "Only has an effect on weakened targets (up to level 15)";

/* *** Books strings *** */
const string itwr_StExt_book_ice1_name = "Grimoire of Hydromancy - Apprentice";
const string itwr_StExt_book_ice2_name = "Grimoire of Hydromancy - Adept";
const string itwr_StExt_book_ice3_name = "Grimoire of Hydromancy - Expert";
const string itwr_StExt_book_ice4_name = "Grimoire of Hydromancy - Master";
const string itwr_StExt_book_ice5_name = "Grimoire of Hydromancy - Grandmaster";

const string itwr_StExt_book_electro1_name = "Grimoire of Electromancy - Apprentice";
const string itwr_StExt_book_electro2_name = "Grimoire of Electromancy - Adept";
const string itwr_StExt_book_electro3_name = "Grimoire of Electromancy - Expert";
const string itwr_StExt_book_electro4_name = "Grimoire of Electromancy - Master";
const string itwr_StExt_book_electro5_name = "Grimoire of Electromancy - Grandmaster";

const string itwr_StExt_book_dark1_name = "Grimoire of Dark Magic - Apprentice";
const string itwr_StExt_book_dark2_name = "Grimoire of Dark Magic - Adept";
const string itwr_StExt_book_dark3_name = "Grimoire of Dark Magic - Expert";
const string itwr_StExt_book_dark4_name = "Grimoire of Dark Magic - Master";
const string itwr_StExt_book_dark5_name = "Grimoire of Dark Magic - Grandmaster";

const string itwr_StExt_book_fire1_name = "Grimoire of Pyromancy - Apprentice";
const string itwr_StExt_book_fire2_name = "Grimoire of Pyromancy - Adept";
const string itwr_StExt_book_fire3_name = "Grimoire of Pyromancy - Expert";
const string itwr_StExt_book_fire4_name = "Grimoire of Pyromancy - Master";
const string itwr_StExt_book_fire5_name = "Grimoire of Pyromancy - Grandmaster";

const string itwr_StExt_book_air1_name = "Grimoire of Aeromancy - Apprentice";
const string itwr_StExt_book_air2_name = "Grimoire of Aeromancy - Adept";
const string itwr_StExt_book_air3_name = "Grimoire of Aeromancy - Expert";
const string itwr_StExt_book_air4_name = "Grimoire of Aeromancy - Master";
const string itwr_StExt_book_air5_name = "Grimoire of Aeromancy - Grandmaster";

const string itwr_StExt_book_earth1_name = "Grimoire of Geomancy - Apprentice";
const string itwr_StExt_book_earth2_name = "Grimoire of Geomancy - Adept";
const string itwr_StExt_book_earth3_name = "Grimoire of Geomancy - Expert";
const string itwr_StExt_book_earth4_name = "Grimoire of Geomancy - Master";
const string itwr_StExt_book_earth5_name = "Grimoire of Geomancy - Grandmaster";

const string itwr_StExt_book_light1_name = "Grimoire of Light Magic - Apprentice";
const string itwr_StExt_book_light2_name = "Grimoire of Light Magic - Adept";
const string itwr_StExt_book_light3_name = "Grimoire of Light Magic - Expert";
const string itwr_StExt_book_light4_name = "Grimoire of Light Magic - Master";
const string itwr_StExt_book_light5_name = "Grimoire of Light Magic - Grandmaster";

const string itwr_StExt_book_golems1_name = "Grimoire of Golem Construction - Apprentice";
const string itwr_StExt_book_golems2_name = "Grimoire of Golemcraft - Adept";
const string itwr_StExt_book_golems3_name = "Grimoire of Golemcraft - Expert";
const string itwr_StExt_book_golems4_name = "Grimoire of Golemcraft - Master";
const string itwr_StExt_book_golems5_name = "Grimoire of Golemcraft - Grandmaster";

const string itwr_StExt_book_necromancy1_name = "Grimoire of Necromancy - Apprentice";
const string itwr_StExt_book_necromancy2_name = "Grimoire of Necromancy - Adept";
const string itwr_StExt_book_necromancy3_name = "Grimoire of Necromancy - Expert";
const string itwr_StExt_book_necromancy4_name = "Grimoire of Necromancy - Master";
const string itwr_StExt_book_necromancy5_name = "Grimoire of Necromancy - Grandmaster";

const string itwr_StExt_book_healing1_name = "Grimoire of Life Magic - Apprentice";
const string itwr_StExt_book_healing2_name = "Grimoire of Life Magic - Adept";
const string itwr_StExt_book_healing3_name = "Grimoire of Life Magic - Expert";
const string itwr_StExt_book_healing4_name = "Grimoire of Life Magic - Master";
const string itwr_StExt_book_healing5_name = "Grimoire of Life Magic - Grandmaster";

const string itwr_StExt_book_demonolog1_name = "Grimoire of Demonology - Apprentice";
const string itwr_StExt_book_demonolog2_name = "Grimoire of Demonology - Adept";
const string itwr_StExt_book_demonolog3_name = "Grimoire of Demonology - Expert";
const string itwr_StExt_book_demonolog4_name = "Grimoire of Demonology - Master";
const string itwr_StExt_book_demonolog5_name = "Grimoire of Demonology - Grandmaster";

const string itwr_StExt_book_death1_name = "Grimoire of Death Magic - Apprentice";
const string itwr_StExt_book_death2_name = "Grimoire of Death Magic - Adept";
const string itwr_StExt_book_death3_name = "Grimoire of Death Magic - Expert";
const string itwr_StExt_book_death4_name = "Grimoire of Death Magic - Master";
const string itwr_StExt_book_death5_name = "Grimoire of Death Magic - Grandmaster";

const string itwr_StExt_book_shaman1_name = "Grimoire of Spirit Magic - Apprentice";
const string itwr_StExt_book_shaman2_name = "Grimoire of Spirit Magic - Adept";
const string itwr_StExt_book_shaman3_name = "Grimoire of Spirit Magic - Expert";
const string itwr_StExt_book_shaman4_name = "Grimoire of Spirit Magic - Master";
const string itwr_StExt_book_shaman5_name = "Grimoire of Spirit Magic - Grandmaster";

const string itwr_StExt_book_matrialarts1_name = "The Art of War - Apprentice";
const string itwr_StExt_book_matrialarts2_name = "The Art of War - Adept";
const string itwr_StExt_book_matrialarts3_name = "Art of War - Expert";
const string itwr_StExt_book_matrialarts4_name = "The Art of War - Master";
const string itwr_StExt_book_matrialarts5_name = "The Art of War - Grandmaster";

const string itwr_StExt_book_agile1_name = "The Art of Defense - Apprentice";
const string itwr_StExt_book_agile2_name = "The Art of Defense - Adept";
const string itwr_StExt_book_agile3_name = "The Art of Defense - Expert";
const string itwr_StExt_book_agile4_name = "The Art of Defense - Master";
const string itwr_StExt_book_agile5_name = "The Art of Defense - Grandmaster";

const string itwr_StExt_book_archery1_name = "The Art of Archery - Apprentice";
const string itwr_StExt_book_archery2_name = "The Art of Archery - Adept";
const string itwr_StExt_book_archery3_name = "Art of Archery - Expert";
const string itwr_StExt_book_archery4_name = "Art of Archery - Master";
const string itwr_StExt_book_archery5_name = "Art of Archery - Grandmaster";

const string StExt_Str_ImpossibleToReadMasteryBook = "Impossible to read - requirements not met!";

/* *** Food strings *** */
const string StExt_Str_BoozeDesc = "Rare and elite overseas booze...";
const string StExt_Str_BoozeCiderName = "Cider";
const string StExt_Str_BoozeMeadName = "Mead";
const string StExt_Str_BoozeVodkaName = "Vodka";
const string StExt_Str_BoozeWhiskeyName = "Whiskey";
const string StExt_Str_BoozeCognacName = "Cognac";
const string StExt_Str_BoozeBrendyName = "Brandy";
const string StExt_Str_BoozeAbsinthName = "Absinthe";
const string StExt_Str_BoozeTequilaName = "Tequila";
const string StExt_Str_BoozeScotchName = "Scotch";
const string StExt_Str_BoozeGrappaName = "Grappa";
const string StExt_Str_FruitsDesc = "A rare overseas fruit. Good for your health...";
const string StExt_Str_PineAppleName = "Pineapple";
const string StExt_Str_PearName = "Pear";
const string StExt_Str_CocountName = "Coconut";
const string StExt_Str_BananaName = "Banana";

const string StExt_Str_BluntName = "Blunt";
const string StExt_Str_BluntDesc1 = "Filled with the finest marsh grass!";
const string StExt_Str_BluntDesc2 = "Reduces fatigue. Increases thirst and hunger.";
const string StExt_Str_BluntDesc3 = "Makes you experience unusual sensations...";

const string StExt_Str_StonedWax_Name = "Bottle of magic ink";
const string StExt_Str_StonedWax_Desc = "Click to use and create magic scrolls";

const string StExt_Str_Grimmoire_Name = "Nameless Grimoire";
const string StExt_Str_Dagger_Name = "Nameless Dagger";
const string StExt_Str_Grimmoire_Txt = "Priceless magical grimoire...";
const string StExt_Str_Dagger_Txt = "Priceless magical dagger...";
const string StExt_Str_Artifact_Txt = "A unique artifact that evolves with its owner";

const string StExt_StonePlateDia_Mana = "Ancient Tablet of the High Priest";
const string StExt_StonePlateDia_ManaMax = "Ancient Tablet of the High Priest";
const string StExt_StonePlateDia_Hp = "Ancient Tablet of the Elder Healer";
const string StExt_StonePlateDia_HpMax = "Ancient Tablet of the Supreme Healer";
const string StExt_StonePlateDia_Str = "Ancient Stone Plate of the Elder Warrior";
const string StExt_StonePlateDia_StrMax = "Ancient tablet of a mighty warrior";
const string StExt_StonePlateDia_Agi = "Ancient Stone Plate of the Elder Hunter";
const string StExt_StonePlateDia_AgiMax = "Ancient tablet of the mighty hunter";	
const string StExt_StonePlateDia_1h = "Ancient Tablet of the Elder Swordsman";
const string StExt_StonePlateDia_1hMax = "Ancient tablet of the mighty swordsman";
const string StExt_StonePlateDia_2h = "Ancient Tablet of the Elder Spearman";
const string StExt_StonePlateDia_2hMax = "Ancient tablet of the mighty spearman";
const string StExt_StonePlateDia_Bow = "Ancient Stone Plate of the Elder Archer";
const string StExt_StonePlateDia_BowMax = "Ancient Tablet of the Mighty Archer";
const string StExt_StonePlateDia_CrsBow = "Ancient tablet of the senior crossbowman";
const string StExt_StonePlateDia_CrsBowMax = "Ancient tablet of the mighty crossbowman";

const string Stext_Itam_Luckycharm_Name = "Lucky amulet";
const string Stext_Itam_Luckycharm_Txt = "Luck bonus:";
const string Stext_Str_Buyrobe = "Buy a beginner's mage robe (1500 gold)";
const string Itar_Stext_Mage_Novise_Name = "Novice Mage's Robe";
const string Itar_Stext_Mage_Novise_Txt1 = "Slash defense: 15";
const string Itar_Stext_Mage_Novise_Txt2 = "Protection from crushing: 10";
const string Itar_Stext_Mage_Novise_Txt3 = "Protection from piercing: 5";
const string Itar_Stext_Mage_Novise_Txt4 = "Magic protection: 15 | fire protection: 10";

const string Itrw_Stext_Str_Starting_Crossbow = "The simplest worn-out crossbow";
const string Itrw_Stext_Str_Starting_Bow = "The simplest rotten onion";
const string Itmw_Stext_Str_Starting_1h_Sword = "The simplest rusty sword";
const string Itmw_Stext_Str_Starting_2h_Sword = "The simplest rusty two-handed sword";
const string Itmw_StExt_Str_StartingStaff_Name = "The simplest magic staff";

const string StExt_PlantCloverName = "Clover";
const string StExt_PlantCloverDesc1 = "Extremely rare plant!";
const string StExt_PlantCloverDesc2 = "Gives a permanent bonus to luck.";

const string StExt_Enchanted_Name_Value = "Enchanted | Price:";

const string StExt_Str_SummonZombieProtector_Name = "Zombie Protector";
const string StExt_Str_SummonDemonProtector_Name = "Demon Protector";
const string StExt_Str_SummonGolemProtector_Name = "Golem Protector";
const string StExt_Str_SummonDarkGolem_Name = "Rune Shadow Golem";
const string StExt_Str_SummonWolfProtector_Name = "Wolf Protector";
const string StExt_Str_SummonBoneHound_Name = "Bone Hound";
const string StExt_Str_SummonBoneMage_Name = "Skeleton Mage";
const string StExt_Str_SummonShadow_Name = "Shadow";
const string StExt_Str_SummonAirGolem_Name = "Rune Air Golem";
const string StExt_Str_SummonElectricGolem_Name = "Rune Ethereal Golem";
const string StExt_Str_SummonHollyWisp_Name = "Holy Wisp";

/* *** Spell strings *** */
const string StExt_Str_ShamansCantSummon = "Shamans cannot use summoning magic!";
const string StExt_Str_MaxSummonCount = "The maximum number of summoned creatures has been reached...";
const string StExt_Str_Info = "Information";
const string StExt_Str_Info_MaxSummonCount = "Maximum number of summoned creatures...";

const string stext_name_spl_summondemon_khub = "Summon Hubaxis";
const string name_spl_summon_deathhound = "Summon Bone Hound";
const string name_spl_summon_darkgolem = "Summon Shadow Golem";
const string name_spl_stext_magicbolt = "Magic Arrow";
const string name_spl_stext_magicbolt_txt1 = "The simplest basic spell available to anyone";
const string name_spl_stext_sumhollywisp = "Summon Holy Firefly";
const string name_spl_summon_skeleton_mage = "Summon Skeleton Mage";
const string name_spl_summon_airgolem = "Summon Air Golem";

const string StExt_Str_ScrollmakingRune = "Create rune";
const string StExt_Str_TalisanRunen_DkPet = "Create a rune to summon a Servant";
const string StExt_Str_TalisanRunen_Crait = "Create Krait summoning rune";
const string StExt_Str_TalisanRunen_DrSnapper = "Create Tesvalla summoning rune";
const string StExt_Str_TalisanRunen_sumskelmage = "Create a rune to summon a Skeleton Mage";
const string StExt_Str_TalisanRunen_hollywisp = "Create the Holy Wisp Summoning Rune";
const string StExt_Str_TalisanRunen_airgolem = "Create a rune to summon the Air Golem";
const string StExt_Str_TalisanRunen_rapidicebolt = "Create Ice Flash Rune";
const string StExt_Str_TalisanRunen_rapidfirebolt = "Create Rapid Firebolt Rune";
const string StExt_Str_TalisanRunen_elevate = "Create Exaltation rune";

const string StExt_EsText = "Energy Shield";
const string StExt_RankName_Uncommon = "Uncommon";
const string StExt_RankName_Magic = "Magic";
const string StExt_RankName_Rare = "Rare";
const string StExt_RankName_Uniq = "Unique";
const string StExt_RankName_Legend = "Legendary";

/* *** Ui strings *** */
const string StExt_Ui_MoveNotification = "Use the arrow keys on your keyboard to move the current control.";
const string StExt_Ui_ValueEditNotification = "Use the arrow keys on your keyboard to change the current value.";

const string StExt_Str_DisplayModInitialized = "Mod 'EthernalBreeze' Started!";
const string StExt_Str_NewVersionNotify = "New version of mod 'EthernalBreeze' detected";
const string StExt_Str_DisplayModDailyGrowDiffNotify = "Time is running out... Every day Evil grows stronger!";
const string StExt_Str_Print_Luckinfo = "Luck favors you...";
const string StExt_Str_Print_Luckinfobonus = "+0.1% to luck!";
const string StExt_Str_Print_Luckinfobonus5 = "+0.5% to luck!";

const string StExt_Str_CorruptionNotify = "Corrupted! The dark god laughs at you...";
const string StExt_Str_CantBecomeCorruptedNotify = "The curse had no effect!";
const string StExt_Str_CantBecomeCorruptedNotify2 = "The scroll has turned to dust!";
const string StExt_Str_NeedFeather = "Feather needed!";
const string StExt_Str_NotTimeNotify = "It's not time yet...";

/* *** Dialog strings *** */
const string StExt_Str_ModMenu_Configs = "[Mod settings...]";
const string StExt_Str_ModMenu_Education = "[Education...]";
const string StExt_Str_ModMenu_DebugEnabled = "Enable debug information output";
const string StExt_Str_ModMenu_PresetsSection = "Select a settings preset (current settings will be changed!)";
const string StExt_Str_ModMenu_AuraUi = "Settings for displaying auras on the screen";
const string StExt_Str_ModMenu_AlchUi = "Settings for displaying temporary effects on the screen";
const string StExt_Str_ModMenu_ArtifactUi = "Settings for displaying artifact statistics on the screen";
const string StExt_Str_ModMenu_EsUi = "Energy shield display settings on the screen";
const string StExt_Str_ModMenu_MsgTray = "Settings for displaying messages (mod) on the screen";
const string StExt_Str_ModMenu_Aura_DisplayOnScreen = "Display auras on screen";
const string StExt_Str_ModMenu_Alch_DisplayOnScreen = "Display temporary effects on screen";
const string StExt_Str_ModMenu_Artifact_DisplayOnScreen = "Display artifact statistics on screen";
const string StExt_Str_ModMenu_EsBar_DefaultPos = "Show energy shield by default";
const string StExt_Str_ModMenu_Configs_Reset = "Reset current settings";
const string StExt_Str_ModMenu_Learning_GenericPerks = "General Skills";
const string StExt_Str_CorruptionMenu = "Use scroll of corruption...";

const string StExt_Str_ModMenu_CurrentDiffPreset = "Current difficulty preset: ";
const string StExt_Str_ModMenu_CurrentItemsPreset = "Current item generator preset: ";

/* *** Npc dialog strings *** */
const string Stext_Str_Dia_Xardas_SelectDiff = "Select the mod difficulty level...";
const string Stext_Str_Dia_Xardas_SelectPreHistory = "Select prehistory...";

const string StExt_Str_StonedTrader_Name = "SHIVA - Sorcerer-Junkman";
const string StExt_Str_StonedTrader_Trade = "Trade...";
const string StExt_Str_Andriel_Name = "Andriel";
const string StExt_Str_Andriel_Dagger_Name = "Andriel's Blade";
const string StExt_Str_Duriel_Name = "Duriel";
const string StExt_Str_Mephisto_Name = "Mephisto";
const string StExt_Str_Diablo_Name = "Diablo";
const string StExt_Str_Baal_Name = "Baal";

const string StExt_Str_Bosslletter_Desc = "Can only be used in uninhabited places...";
const string StExt_Str_Andrielletter_Name = "Andrielle's Summoning Scroll";
const string StExt_Str_Andrielletter_Desc = "Summons Andrielle, the first demon of Shiva...";
const string StExt_Str_Durielletter_Name = "Duriel's Summoning Scroll";
const string StExt_Str_Durielletter_Desc = "Summons Duriel, the second demon of Shiva...";
const string StExt_Str_Mephistoletter_Name = "Mephisto Summoning Scroll";
const string StExt_Str_Mephistoetter_Desc = "Summons Mephisto, the third demon of Shiva...";
const string StExt_Str_Diabloletter_Name = "Diablo Summoning Scroll";
const string StExt_Str_Diabloletter_Desc = "Summons Diablo, the fourth demon of Shiva...";
const string StExt_Str_Baalletter_Name = "Baal Summoning Scroll";
const string StExt_Str_Baalletter_Desc = "Summons Baal, the fifth demon of Shiva...";

const string StExt_Str_Shivaletter_Name = "Junkman's Note";
const string StExt_Str_Shivaletter_Desc = "This note was given to me by Shiva, the sorcerer-junkman...";
const string StExt_Str_Shivaletter_Info = "Greetings, wanderer. \n My name is Shiva and I am a master of creating artifacts, but that is not the point now. The fact is that not long ago, during experiments with spirits from other worlds of existence, I suffered a failure and lost my voice. Five terrible entities from other worlds cursed me with dumbness, and only by completely destroying them will I regain my voice. \n These entities are incredibly dangerous opponents and I cannot cope with them on my own, so I ask you, wanderer, to assist me in my problem. In exchange for your help, you will receive from me unique artifacts, the likes of which cannot be found in all of Myrtana. \n Ask me when you are ready to go into battle with evil, I will give you the first summoning scroll...";
const string StExt_Topic_Shivaletter = "Silent feat";
const string StExt_Str_Shivaletter_Logentry_0 = "A junk-dealing sorcerer and part-time master artificer asked me in his letter to deal with five demons from other worlds. I need to get the scroll for summoning the first of the demons from him.";
const string StExt_Str_Shivaletter_Logentry_1 = "I received a strange scroll from Shiva. I believe I should go to a deserted area and summon the first demon as soon as I'm ready...";
const string StExt_Str_Shivaletter_Logentry_2 = "I managed to destroy Andriel. I should talk to Shiva about my reward.";
const string StExt_Str_Shivaletter_Logentry_3 = "Shiva gave me the next summoning scroll. The pentagram says 'Duriel'. I guess that's my next target...";
const string StExt_Str_Shivaletter_Logentry_4 = "Duriel is defeated. I think Shiva will be glad to hear this.";
const string StExt_Str_Shivaletter_Logentry_5 = "As expected, Shiva gave me a scroll to summon another demon. This time, Mephisto. This all reminds me of something...";
const string StExt_Str_Shivaletter_Logentry_6 = "I destroyed Mephisto. I think Shiva will be happy about this news.";
const string StExt_Str_Shivaletter_Logentry_7 = "My next target is Diablo.";
const string StExt_Str_Shivaletter_Logentry_8 = "Diablo fell by my hand. Should I go and please the sorcerer?";
const string StExt_Str_Shivaletter_Logentry_9 = "The last demon remains - Baal. I think we shouldn't waste time and finish him off quickly.";
const string StExt_Str_Shivaletter_Logentry_10 = "Finally! Baal is destroyed. I wonder what that sorcerer has in store for me as a reward?";
const string StExt_Str_Shivaletter_Logentry_11 = "Excellent. I freed Shiva from the curse and helped him regain his voice.";

const string StExt_Str_StonedTrader_Hi = "How are you, buddy?";
const string StExt_Str_StonedTrader_AndrielReady = "How can I help you?";
const string StExt_Str_StonedTrader_AndrielDone = "I dealt with Andriel!";
const string StExt_Str_StonedTrader_DurielDone = "Duriel is finished!";
const string StExt_Str_StonedTrader_MephistoDone = "Mephisto is defeated!";
const string StExt_Str_StonedTrader_DiabloDone = "I destroyed Diablo!";
const string StExt_Str_StonedTrader_BaalDone = "Baal...";

const string StExt_Str_TalisanRunen_sumdeathhound = "Create a rune to summon the Bone Hound";
const string StExt_Str_TalisanRunen_sumdarkgol = "Create a rune to summon the Shadow Golem";

const string StExt_Str_XardasRunen_Demon = "Demonologist's Rune";
const string StExt_Str_XardasRunen_Death6 = "6th circle of magic (Death)";
const string StExt_Str_XardasRunen_Death5 = "5th circle of magic (Death)";
const string StExt_Str_XardasRunen_Death4 = "4th circle of magic (Death)";
const string StExt_Str_XardasRunen_Death3 = "3rd circle of magic (Death)";
const string StExt_Str_XardasRunen_Death2 = "2nd circle of magic (Death)";
const string StExt_Str_XardasRunen_Death1 = "1 circle of magic (Death)";
const string StExt_Str_XardasRunen_Necro6 = "6th circle of magic (Necromancy)";
const string StExt_Str_XardasRunen_Necro5 = "5th circle of magic (Necromancy)";
const string StExt_Str_XardasRunen_Necro4 = "4th circle of magic (Necromancy)";
const string StExt_Str_XardasRunen_Necro3 = "3rd circle of magic (Necromancy)";
const string StExt_Str_XardasRunen_Necro2 = "2nd circle of magic (Necromancy)";
const string StExt_Str_XardasRunen_Necro1 = "1 circle of magic (Necromancy)";
const string StExt_Str_XardasRunen_Dark6 = "6th circle of magic (Darkness)";
const string StExt_Str_XardasRunen_Dark5 = "5th circle of magic (Darkness)";
const string StExt_Str_XardasRunen_Dark4 = "4th circle of magic (Darkness)";
const string StExt_Str_XardasRunen_Dark3 = "3rd circle of magic (Darkness)";
const string StExt_Str_XardasRunen_Dark2 = "2nd circle of magic (Darkness)";
const string StExt_Str_XardasRunen_Dark1 = "1 circle of magic (Darkness)";

const string StExt_Str_Scrollmaking_RequirePaper = "The following resources are required: ";
const string StExt_Str_ScrollmakingDone = "Scroll created!";
const string StExt_Str_ScrollmakingFire = "Create Fire magic scrolls";
const string StExt_Str_Scrollmakingice = "Create Ice Magic Scrolls";
const string StExt_Str_ScrollmakingAir = "Create Air magic scrolls";
const string StExt_Str_ScrollmakingElectric = "Create Electricity magic scrolls";
const string StExt_Str_ScrollmakingEarth = "Create Earth magic scrolls";
const string StExt_Str_ScrollmakingLight = "Create Holy Magic Scrolls";
const string StExt_Str_ScrollmakingDeath = "Create scrolls of Death magic";
const string StExt_Str_ScrollmakingLife = "Create scrolls of Life magic";
const string StExt_Str_ScrollmakingDark = "Create scrolls of Dark magic";
const string StExt_Str_ScrollmakingGolems = "Create Golemmaking scrolls";
const string StExt_Str_ScrollmakingDemonology = "Create Demonology scrolls";
const string StExt_Str_ScrollmakingNecro = "Create Necromancy scrolls";
const string StExt_Str_ScrollmakingBlinkTxt = "Jump";

const string StExt_Str_Grimoir_NewLevel = "The grimoire can be improved";
const string StExt_Str_Dagger_NewLevel = "The dagger can be improved";

const string StExt_Craftsman_Str_LearnCraft = "Can you teach me your craft?";
const string StExt_Craftsman_Str_RequiredGoldStart = "To learn the craft, you need";
const string StExt_Craftsman_Str_RequiredGoldEnd = "gold coins!";

const string StExt_Craftsman_Str_BosperCraftLearned = "Bosper agrees to teach you his craft!";
const string StExt_Craftsman_Str_HaradCraftLearned = "Harad agrees to teach you his craft!";
const string StExt_Craftsman_Str_ConstantionoCraftLearned = "Constantino agrees to teach you his craft!";

const string StExt_Craftsman_CanStudy_Constantino_SellElixirs = "I brought magic elixirs";
const string StExt_Craftsman_CanStudy_Constantino_SellPlants = "I brought rare herbs";


// *********************************************************************************
// New strings
// *********************************************************************************

const string StExt_Ui_ValueEditNotification_Step = "Value change step: x";
const string StExt_Str_ValueEdit_Yes = "Back... (Accept new value)";
const string StExt_Str_ValueEdit_No = "Return old value";
const string StExt_Str_ValueEdit_Max = "Set value: [Maximum]";
const string StExt_Str_ValueEdit_Min = "Set value: [Minimum]";
const string StExt_Str_ValueEdit_Zero = "Set value: [Zero]";

const string StExt_Str_NpcFlag_LootProcessed = "Looted";
const string StExt_Str_NpcFlag_IsDead = "Dead";
const string StExt_Str_NpcFlag_Duplicated = "Double";
const string StExt_Str_NpcFlag_Summoned = "Summoned";
const string StExt_Str_NpcFlag_Corrupted = "Corrupted";
const string StExt_Str_NpcFlag_Lucky = "Lucky";
const string StExt_Str_NpcFlag_Rich = "Rich";
const string StExt_Str_NpcFlag_Original = "True";

const string StExt_Str_Config_ShowNpcExtraInfo = "Show NPC characteristics";

const string StExt_Str_NpcStats_Str = "From: ";
const string StExt_Str_NpcStats_Agi = "L: ";
const string StExt_Str_NpcStats_Prot = "Def: ";
const string StExt_Str_NpcStats_Resist = "Resistance: ";
const string StExt_Str_NpcStats_Dodge = "Dodge: ";

const string StExt_Str_NpcStats_ProtEdge = "P - ";
const string StExt_Str_NpcStats_ProtBlunt = "D - ";
const string StExt_Str_NpcStats_ProtFire = "O - ";
const string StExt_Str_NpcStats_ProtFly = "St - ";
const string StExt_Str_NpcStats_ProtMagic = "M - ";
const string StExt_Str_NpcStats_ProtPoint = "K - ";
const string StExt_Str_NpcStats_ProtPois = "Poison - ";
const string StExt_Str_NpcStats_ProtAoe = "AoE - ";

const string StExt_Str_Level = "Level: ";
const string StExt_Str_Exp = "Experience: ";
const string StExt_Str_Lp = "OP: ";
const string StExt_Str_Auras = "Auras: ";
const string StExt_Str_ActiveAuras = "Active auras: ";
const string StExt_Str_Masteries = "Skills: ";
const string StExt_Str_NeedGold = "Gold needed: ";
const string StExt_Str_NeedLp = "Need training points: ";
const string StExt_Str_NeedSkillPoints = "Need skill points: ";
const string StExt_Str_Required = "Required: ";
const string StExt_Str_Pcs = "pcs.";
const string StExt_Str_Done = "Done!";

const string StExt_Str_Required_Hp = "vital forces";
const string StExt_Str_Required_Mp = "magical powers";
const string StExt_Str_Required_Intellect = "intelligence";
const string StExt_Str_Required_Str = "forces";
const string StExt_Str_Required_Agi = "agility";
const string StExt_Str_Required_Stam = "stamina";
const string StExt_Str_Required_Gold = "gold";
const string StExt_Str_Required_Lp = "lp";

const string StExt_Str_NpcFlag_ScrollUser = "Uses scrolls";
const string StExt_Str_NpcFlag_Summoner = "Summoner";
const string StExt_Str_NpcFlag_Priest = "Blessing";
const string StExt_Str_NpcFlag_Curser = "Cursing";

// New strings
const string StExt_Str_PrehistoryDesc[StExt_PreHistoryMode_Max] =
{
	" (Nothing)",
	"(+500 experience)",
	"(+2 strength, +1 agility, +10 health)",
	"(+1 strength, +2 agility, +10 health)",
	"(+2 strength, +3 mana, +10 health)",
	"(+1 intelligence, +1% magical power)",
	"(+2 intelligence, +7 mana)",
	"(+15 mana)",
	"(+1% magical power, +5 mana)",
	"(+15 health, +250 gold coins)",
	"(+10 stamina, +10 health)"
};

// Items constants
const string StExt_Str_ItemRank[StExt_ItemRankMax] =
{
	"Normal",
	"Unusual",
	"Rare",
	"Unique",
	"Epic",
	"Legendary"
};


const string StExt_Str_Item_Type[9] =
{
    "???",
    "Armor",
    "Weapon",
    "Decoration",
    "Consumable",
    "Ammunition",
    "Inventory",
    "Kraft",
    "Other"
};

const string StExt_Str_Item_Class[27] =
{
    "???",
    "Armor",
    "Helmet",
    "Torso",
    "Trousers",
    "Gloves",
    "Boots",
    "Shoulder pads",
    "Shield",
    "Melee weapons",
    "Ranged weapons",
    "Magic",
    "Amulet",
    "Ring",
    "Earrings",
    "Bracelets",
    "Belt",
    "Collar",
    "Trophy",
    "Potion",
    "Scroll",
    "Food",
    "Mascot",
    "Gem",
    "Rune",
    "Soul",
    "Miscellaneous"
};

const string StExt_Str_Item_SubClass[39] =
{
    "???",
    "Cloth",
    "Light Armor",
    "Medium Armor",
    "Heavy Armor",
    "Hood",
    "Diadem",
    "Light helmet",
    "Middle Helmet",
    "Heavy Helmet",
    "Light Shield",
    "Heavy Shield",
    "One-handed sword",
    "One-handed axe",
    "One-handed mace",
    "Dagger",
    "Rapier",
    "Light Sword",
    "The Sorcerer's Blade",
    "Two-handed sword",
    "Two-handed axe",
    "Two-handed mace",
    "Staff",
    "Spear",
    "Halberd",
    "Paired (Left)",
    "Paired (Right)",
    "Knuckle Dusters",
    "Throwing Dagger",
    "Throwing Axe",
    "Throwing Mace",
    "Throwing spear",
    "Light Bow",
    "Heavy Bow",
    "Light crossbow",
    "Heavy Crossbow",
    "Scroll",
    "Rune",
    "The Rod"
};

//*********************************DELETE************************************************
const string StExt_Str_ItemType[28] =
{
    /*ItemType_Helm*/ "Helmet",
    /*ItemType_Armor*/ "Armor",
    /*ItemType_Pants*/ "Pants",
    /*ItemType_Boots*/ "Boots",
    /*ItemType_Gloves*/ "Gloves",
    /*ItemType_Belt*/ "Belt",
    /*ItemType_Amulet*/ "Amulet",
    /*ItemType_Ring*/ "Ring",
    /*ItemType_Shield*/ "Shield",
    /*ItemType_Sword1h*/ "One-handed sword",
    /*ItemType_Sword2h*/ "Two-handed sword",
    /*ItemType_Axe1h*/ "One-handed axe",
    /*ItemType_Axe2h*/ "Two-handed axe",
    /*ItemType_Mace1h*/ "One-handed mace",
    /*ItemType_Mace2h*/ "Two-handed mace",
    /*ItemType_MagicSword*/ "Magic weapon",
    /*ItemType_Staff*/ "Staff",
    /*ItemType_Rapier*/ "Rapier",
    /*ItemType_DexSword*/ "Light Sword",
    /*ItemType_Halleberd*/ "Halberd",
    /*ItemType_Spear*/ "Spear",
    /*ItemType_DualL*/ "Paired, Left",
    /*ItemType_DualR*/ "Paired, Right",
    /*ItemType_Bow*/ "Bow",
    /*ItemType_CrossBow*/ "Crossbow",
    /*ItemType_MagicStaff*/ "Enchanted Staff",
    /*ItemType_Potion*/ "Potion",
    /*ItemType_Scroll*/ "Scroll"
};

const string StExt_Str_ItemFlag[16] =
{
    /*ItemFlag_Undefined*/ "Undefined",
    /*ItemFlag_Socketed*/ "With sockets",
    /*ItemFlag_Corrupted*/ "Corrupted",
    /*ItemFlag_Crafted*/ "Crafted",
    /*ItemFlag_Armor*/ "Armor",
    /*ItemFlag_Weapon*/ "Weapon",
    /*ItemFlag_Jewelry*/ "Jewelry",
    /*ItemFlag_Talisman*/ "Talisman",
    /*ItemFlag_Consumable*/ "Consumable",
    /*ItemFlag_Melee*/ "Melee",
    /*ItemFlag_Range*/ "Ranged Combat",
    /*ItemFlag_Staff*/ "Staff",
    /*ItemFlag_LeftHand*/ "Left hand",
    /*ItemFlag_RightHand*/ "Right Hand",
    /*ItemFlag_BothHands*/ "Both hands",
    /*ItemFlag_MagicWeapon*/ "Magic"
};

const string StExt_Str_ItemFlag_Socketed = "With sockets";
const string StExt_Str_ItemFlag_Corrupted = "Corrupted";
const string StExt_Str_ItemFlag_Crafted = "Crafted";
const string StExt_Str_ItemFlag_Undefined = "Not identified";
//*********************************DELETE************************************************


const string StExt_Str_Item_Cond = "Requirements: ";
const string StExt_Str_Item_Cond_Str = "forces";
const string StExt_Str_Item_Cond_Agi = "dexterity";
const string StExt_Str_Item_Cond_Hp = "lives";
const string StExt_Str_Item_Cond_Mp = "mana";
const string StExt_Str_Item_Cond_St = "stamina";
const string StExt_Str_Item_Cond_Shield = "shield skill";
const string StExt_Str_Item_Cond_Bow = "bow skill";
const string StExt_Str_Item_Cond_CBow = "crossbow skill";
const string StExt_Str_Item_Cond_OneHanded = "one-handed weapon skill";
const string StExt_Str_Item_Cond_TwoHanded = "two-handed weapon skill";
const string StExt_Str_Item_Cond_Int = "intelligence";
const string StExt_Str_Item_Cond_Level = "level";
const string StExt_Str_Item_Cond_BeliarKarma = "karma (Beliar)";
const string StExt_Str_Item_Cond_InnosKarma = "karma (Innos)";
const string StExt_Str_Item_Cond_AdanosKarma = "karma (Adanos)";

const string StExt_Str_Item_Damage = "Damage: ";
const string StExt_Str_Item_DamageType[dam_index_max] =
{
	"true",
	"crushing",
	"cutting",
	"fire",
	"throwback",
	"magic",
	"piercing",
	"poison"
};
const string StExt_Str_Item_Protection = "Protection: ";
const string StExt_Str_Item_Range = "Weapon length: ";
const string StExt_Str_OrcWeapon = "Orc weapon";
const string StExt_Str_OneHandWeapon = "One-handed";
const string StExt_Str_TwoHandWeapon = "Two-handed";

const string StExt_Str_ItemLevel = "Item level: ";
const string StExt_Str_ItemQuality = "Quality: ";
const string StExt_Str_ItemSockets = "Sockets: ";
const string StExt_Str_Undefined = "Unidentified!";

const string itar_StExt_Str_helmet_crone_name = "Crown of Ice";
const string itam_stext_silvernecklace_name = "Silver Amulet";
const string itam_stext_goldnecklace_name = "Golden Amulet";
const string itam_stext_darknecklace_name = "Shadow Amulet";
const string itri_stext_silverring_name = "Silver Ring";
const string itri_stext_goldring_name = "Golden Ring";

const string StExt_Str_ModMenu_ItemsInfoUi = "Settings for displaying additional information about items";

const string StExt_Str_Config_Luck_ChanceForEnchantedDrop = "Chance that the found item will be enchanted";
const string StExt_Str_Config_Luck_RelativeDropChance_Food = "Relative chance of dropping food";
const string StExt_Str_Config_Luck_RelativeDropChance_Alchemy = "Relative chance of dropping alchemy";
const string StExt_Str_Config_Luck_RelativeDropChance_Magic = "Relative chance of magic drop";
const string StExt_Str_Config_Luck_RelativeDropChance_Misk = "Relative chance of dropping different";
const string StExt_Str_Config_Luck_RelativeDropChance_Munition = "Relative chance of dropping arrows";
const string StExt_Str_Config_Luck_RelativeDropChance_Armors = "Relative chance of armor drop";
const string StExt_Str_Config_Luck_RelativeDropChance_Jewelry = "Relative drop chance of jewelry";
const string StExt_Str_Config_Luck_RelativeDropChance_MagicWeapons = "Relative chance of dropping a magic weapon";
const string StExt_Str_Config_Luck_RelativeDropChance_MeeleWeapons = "Relative chance of dropping melee weapons";
const string StExt_Str_Config_Luck_RelativeDropChance_RangeWeapons = "Relative chance of dropping ranged weapons";

const string StExt_Str_Config_FoodBonusResetDay = "Days until food bonuses reset";

const string itse_stext_poitionfish_name = "Damned Perch-Potion Maker";
const string itse_stext_magicfish_name = "Patched Occultist Catfish";
const string itse_stext_miscfish_name = "Sewn-up Crucian Carp-Zlotar";
const string itse_stext_rndfish_desc = "There's something sewn into this fish...";

const string stext_str_halvor_openfish = "(Open all special fish)";
const string stext_str_halvor_openfish_nofish = "There are no fish here!";

const string itmi_stext_lootchest_name = "Steel Jewel Box";
const string itmi_stext_lootchest_dsec = "The name 'Shiva' is carved on one of the walls...";

const string itmi_stext_lootchest_Helm_dsec = "Looks like this contains a helmet";
const string itmi_stext_lootchest_Armor_dsec = "Looks like this contains armor";
const string itmi_stext_lootchest_Pants_dsec = "Looks like this contains pants";
const string itmi_stext_lootchest_Boots_dsec = "Looks like this contains boots";
const string itmi_stext_lootchest_Gloves_dsec = "Looks like this contains gloves";
const string itmi_stext_lootchest_Belt_dsec = "Looks like this contains a belt";
const string itmi_stext_lootchest_Amulet_dsec = "Looks like this contains an amulet";
const string itmi_stext_lootchest_Ring_dsec = "Looks like there's a ring here";
const string itmi_stext_lootchest_Shield_dsec = "Looks like there's a shield here";
const string itmi_stext_lootchest_Sword1h_dsec = "Looks like this contains a one-handed sword";
const string itmi_stext_lootchest_Sword2h_dsec = "Looks like this contains a two-handed sword";
const string itmi_stext_lootchest_Axe1h_dsec = "Looks like this contains a one-handed axe";
const string itmi_stext_lootchest_Axe2h_dsec = "Looks like this contains a two-handed axe";
const string itmi_stext_lootchest_Mace1h_dsec = "Looks like this contains a one-handed mace";
const string itmi_stext_lootchest_Mace2h_dsec = "Looks like this contains a two-handed mace";
const string itmi_stext_lootchest_MagicSword_dsec = "Looks like this contains a magic sword";
const string itmi_stext_lootchest_Staff_dsec = "Looks like this contains a staff";
const string itmi_stext_lootchest_Rapier_dsec = "Looks like this contains a sword";
const string itmi_stext_lootchest_DexSword_dsec = "Looks like this contains a light sword";
const string itmi_stext_lootchest_Halleberd_dsec = "Looks like this contains a halberd";
const string itmi_stext_lootchest_Spear_dsec = "Looks like this contains a spear";
const string itmi_stext_lootchest_Dual_dsec = "Looks like this contains dual weapons";
const string itmi_stext_lootchest_Bow_dsec = "Looks like this contains onions";
const string itmi_stext_lootchest_CrossBow_dsec = "Looks like this contains a crossbow";
const string itmi_stext_lootchest_MagicStaff_dsec = "Looks like this contains a magic staff";
const string itmi_stext_lootchest_Torso_dsec = "Looks like this contains a chestpiece";

const string itpo_stext_potion_01_name = "Infusion";
const string itpo_stext_potion_02_name = "Essence";
const string itpo_stext_potion_03_name = "Extract";
const string itpo_stext_potion_04_name = "Elixir";
const string itpo_stext_potion_desc = "Potion with unusual effects...";

const string StExt_BonusStats_Desc[5] =
{
	"Item Bonuses",
	"Bonuses from the artifact",
	"Potion Bonuses",
	"Bonuses from temporary effects",
	"Aura Bonuses"
};

const string StExt_Str_Menu_Dagger = "[Inspect Dagger]";
const string StExt_Str_Menu_Grimoir = "[Inspect Grimoire]";
const string StExt_Str_AtrifactNotEnoughtLp = "Not enough artifact development points. Required: ";
const string StExt_Str_Config_ArtifactsUpgradeCostMult = "Artifact upgrade costs";
const string StExt_Str_Config_ArtifactExp = "experience";
const string StExt_Str_Config_Artifact_ShowExpMessage = "Display the experience gained by the artifact on the screen";
const string StExt_Str_AtrifactEquip = "Equip artifact";
const string StExt_Str_AtrifactUnEquip = "Remove artifact";
const string itmi_stext_orestuck_desc = "An important component for advanced crafting";

const string itmw_stext_halleberde_bronze_name = "Bronze Halberd";
const string itmw_stext_spear_bronze_name = "Bronze Spear";
const string itmw_stext_bronze_axe_name = "Bronze Axe";
const string itmw_stext_bronze_waraxe_name = "Bronze War Axe";
const string itmw_stext_bronze_warhammer_name = "Bronze Warhammer";
const string itmw_stext_bronze_mace_name = "Bronze Mace";
const string itmw_stext_bronze_shortsword_name = "Bronze Short Sword";
const string itmw_stext_bronze_broadsword_name = "Bronze Broadsword";
const string itmw_stext_bronze_longsword_name = "Bronze Longsword";
const string itmw_stext_axe1_name = "Axe";
const string itmw_stext_axe2_name = "Axe";
const string itmw_stext_1h_bastard_meryl_name = "Sword";
const string itmw_stext_1h_bastard_sword_name = "Sword";
const string itmw_stext_1h_cutlass_name = "Dirk";
const string itmw_stext_1h_bastard_sword1_name = "One-handed bastard sword";
const string itmw_stext_1h_bastard_sword2_name = "One-handed bastard sword";
const string itmw_stext_1h_sword_heavy_name = "Heavy One-Handed Sword";
const string itmw_stext_1h_sword_long_name = "One-handed long sword";
const string itmw_stext_1h_warsickle_name = "War Scythe";
const string itmw_stext_2h_axe_name = "Two-handed axe";
const string itmw_stext_spear_1_name = "Spear";
const string itmw_stext_spear_2_name = "Spear";
const string itmw_stext_2h_scimitar_name = "Two-handed scimitar";
const string itmw_stext_spear_3_name = "Spear";
const string itmw_stext_2h_sword_name = "Two-handed sword";
const string itmw_stext_axe3_name = "Axe";
const string itmw_stext_axe4_name = "Axe";
const string itmw_stext_1h_crawlerschreck_name = "Crawlers' Horror";
const string itmw_stext_1H_Sword_Bastard_Smith_01_name = "Sword";
const string itmw_stext_1H_Sword_Bastard_Smith_02_name = "Sword";
const string itmw_stext_1h_Sword_Broad_Rep_02_name = "Broadsword";
const string itmw_stext_1H_Sword_Broad_Smith_01_name = "Broadsword";
const string itmw_stext_1h_Sword_Broad_Smith_02_name = "Broadsword";
const string itmw_stext_1H_Sword_Long_Mission_name = "Long Sword";
const string itmw_stext_1H_Sword_Long_Smith_01_name = "Sword";
const string itmw_stext_1H_Sword_Long_Smith_02_name = "Sword";
const string itmw_stext_1H_Sword_Rep_01_name = "Sword";
const string itmw_stext_1H_Sword_Rep_02_name = "Sword";
const string itmw_stext_1H_Sword_Smith_01_name = "Sword";
const string itmw_stext_1H_Sword_Smith_02_name = "Sword";
const string itmw_stext_2H_Sword_Heavy_Smith_01_name = "Sword";
const string itmw_stext_2H_Sword_Heavy_Smith_02_name = "Sword";
const string itmw_stext_2H_Sword_Light_Smith_01_name = "Sword";
const string itmw_stext_2H_Sword_Light_Smith_02_name = "Sword";
const string itmw_stext_2H_Sword_Smith_02_name = "Sword";
const string itmw_stext_2H_Sword_Smith_01_name = "Sword";
const string itmw_stext_rapier_name = "Rapier";
const string itmw_stext_2H_Glaubensbringer_name = "Herald of Faith";
const string itar_StExt_greathelm_name = "Great Helm";
const string itar_StExt_ancienthelm_name = "Ancient Helmet";
const string itar_stext_hat_beliar_name = "Beliar's Hood";
const string itar_stext_hat_mage_grey_name = "Mage Hat";
const string itar_stext_kapalin_1_name = "Kapalin";
const string itar_stext_kapalin_2_name = "Kapalin";
const string itar_stext_kapalin_3_name = "Kapalin";
const string itar_stext_kapalin_4_name = "Kapalin";
const string itmw_stext_iron_axe_name = "Iron Axe";
const string itmw_stext_iron_broadsword_name = "Iron Broadsword";
const string itmw_stext_iron_claymore_name = "Iron Claymore";
const string itmw_stext_iron_club_name = "Iron Club";
const string itmw_stext_iron_dagger_name = "Iron Dagger";
const string itmw_stext_iron_heavyclaymore_name = "Iron Heavy Claymore";
const string itmw_stext_iron_longsword_name = "Iron Longsword";
const string itmw_stext_iron_mace_name = "Iron Mace";
const string itmw_stext_iron_mastersword_name = "Master's Iron Sword";
const string itmw_stext_iron_shortsword_name = "Iron Short Sword";
const string itmw_stext_iron_waraxe_name = "Iron War Axe";
const string itmw_stext_iron_warhammer_name = "Iron Warhammer";
const string itmw_stext_2h_SleeperEye_name = "Two-handed sword Sleeper's Eye";
const string itmw_stext_2H_Sword_Blaise_name = "Two-handed sword Blaise";
const string itmw_stext_new_stl_broadsword_name = "Steel Broadsword";
const string itmw_stext_new_stl_claymore_name = "Steel Claymore";
const string itmw_stext_new_stl_dagger_name = "Steel Dagger";
const string itmw_stext_new_stl_greatsword_name = "Steel Greatsword";
const string itmw_stext_new_stl_handaxe_name = "Steel Hand Axe";
const string itmw_stext_new_stl_mastersword_name = "Master's Steel Sword";
const string itmw_stext_new_stl_waraxe_name = "Steel Battle Axe";
const string itmw_stext_new_stl_wingsword_name = "Steel Wingsword";
const string itmw_stext_Novizenhueter_name = "Guardian's Sword";
const string itar_stext_shield_NTARCZA33_name = "Buckler";
const string itmw_stext_palasz_name = "Broadsword";
const string itmw_stext_palasz2_name = "Broadsword";
const string itmw_stext_PALKA2_name = "Stick";
const string itmw_stext_Saber_01_name = "Saber";
const string itmw_stext_Saber_02_name = "Saber";
const string itmw_stext_Saber_03_name = "Saber";
const string itmw_stext_Saber_04_01_name = "Saber";
const string itmw_stext_Saber_04_02_01_name = "Saber";
const string itmw_stext_Saber_04_02_02_name = "Saber";
const string itmw_stext_Saber_05_name = "Saber";
const string itar_stext_collar_name = "Cursed Collar";
const string itar_stext_collar_desc1 = "He just reeks of dark magic...";
const string itar_stext_collar_desc2 = "Maybe we shouldn't touch it?";
const string itmw_stext_steel_axe_name = "Steel Axe";
const string itmw_stext_steel_broadsword_name = "Steel Broadsword";
const string itmw_stext_steel_claymore_name = "Steel Claymore";
const string itmw_stext_steel_club_name = "Steel Club";
const string itmw_stext_holy_hammer_name = "Holy Hammer";
const string itmw_stext_steel_dagger_name = "Steel Dagger";
const string itmw_stext_steel_heavyclaymore_name = "Steel Heavy Claymore";
const string itmw_stext_steel_longsword_name = "Steel Longsword";
const string itmw_stext_steel_mace_name = "Steel Mace";
const string itmw_stext_steel_mastersword_name = "Master's Steel Sword";
const string itmw_stext_steel_shortsword_name = "Steel Short Sword";
const string itmw_stext_steel_waraxe_name = "Steel War Axe";
const string itmw_stext_steel_warhammer_name = "Steel Warhammer";
const string itar_stext_hut_name = "Hat";
const string itar_stext_wreath_name = "Wreath";
const string itar_stext_plaguehood_name = "Plague Mask";
const string itar_stext_hood_name = "Hood";

const string itar_stext_gloves_name = "Braces";
const string itar_stext_boots_name = "Greaves";
const string itar_stext_pants_name = "Pants";
const string itar_stext_torso_name = "Breastplate";

const string StExt_Str_ExtraItemsDisplayMode = "Display mode for additional armor items";
const string StExt_Str_ExtraItemsDisplayModes[4] =
{
	"Hide additional armor elements with original armor",
	"Do not display additional armor elements",
	"Hide original armor and show only additional armor pieces",
	"Always show additional armor pieces"
};

const string StExt_Str_Config_ArtifactReset = "(Redistributing development points.)";
const string StExt_Str_Config_Npc_SummonsCanHaveOwnSummons = "Summoned creatures can have their own summons";
const string StExt_Str_Config_Npc_CantUseSpellAbilities = "Disable NPCs from using attack skills";
const string StExt_Str_Config_Npc_CantUseBuffAbilities = "Disable NPCs from using blessings";
const string StExt_Str_Config_Npc_CantUseSummonAbilities = "Disable NPCs from using summons";

const string StExt_Str_ExtraDamage = "Extra damage";
const string StExt_Str_ExtraDamageFlag_Dot = "Periodic";
const string StExt_Str_ExtraDamageFlag_Reflect = "Reflected";

const string StExt_Str_Config_DisableEnchantedItemsEffects = "Disable visual effects on generated items (requires game restart)";

const string StExt_Str_ExtraDamageType_String = "Damage type";
const string StExt_Str_ExtraDamageType[21] =
{
	"Close Combat",
	"Long Range Combat",
	"The Spell",
	"Ability",
	"Fire",
	"Ice",
	"Electricity",
	"Air",
	"Earth",
	"Light",
	"Darkness",
	"Death",
	"Life",
	"I",
	"True",
	"Blood",
	"Undead",
	"Golem",
	"Demon",
	"Fist",
	"Trap"
};

const string StExt_Str_ExtraDamageFlags_String = "Effect type";
const string StExt_Str_ExtraDamageFlags[28] =
{
    "Aura", // StExt_DamageFlag_Aura
    "Dot", // StExt_DamageFlag_Dot
    "AoE", // StExt_DamageFlag_Aoe
    "Healing", // StExt_DamageFlag_Heal
    "Summon", // StExt_DamageFlag_Summon
    "Support", // StExt_DamageFlag_Support
    "Hack", // StExt_DamageFlag_Unlock
    "Blink", // StExt_DamageFlag_Blink
    "Buff", // StExt_DamageFlag_Buff
    "Debuff", // StExt_DamageFlag_Debuff
    "Timed Effect", // StExt_DamageFlag_Timed
    "Transformation", // StExt_DamageFlag_Transform
    "Golem", // StExt_DamageFlag_Golem
    "Demon", // StExt_DamageFlag_Demon
    "Undead", // StExt_DamageFlag_Undead
    "Reflection", // StExt_DamageFlag_Reflect
    "Human", // StExt_DamageFlag_Human
    "Potion", // StExt_DamageFlag_Potion
    "Orc", // StExt_DamageFlag_Orc
    "Animal", // StExt_DamageFlag_Animal
    "Target", // StExt_DamageFlag_Target
    "Totem", // StExt_DamageFlag_Totem
    "Single Target", // StExt_DamageFlag_Single
    "Freeze", // StExt_DamageFlag_Freeze
    "Stun", // StExt_DamageFlag_Stun
    "Roots", // StExt_DamageFlag_Roots
    "Chain Attack", // StExt_DamageFlag_Chain
	"Stream" // StExt_DamageFlag_Stream
};

const string itrw_stext_stext_bow_l_name = "Simple Bow";
const string itrw_stext_stext_bow_m_name = "Bow";
const string itrw_stext_stext_bow_h_name = "Combat Bow";

const string StExt_Str_DoCastAuras = "Automatic casting of auras";
const string StExt_Str_Corruption_BonusHeader = "Corruption bonuses: ";
const string StExt_Str_Corruption_BonusStat[StExt_CorruptionBonus_Max] =
{
	"Vital Forces (total | at next level): ",
	"Mana (total | at next level): ",
	"Intelligence (total | at next level): ",
	"Strength (total | at next level): ",
	"Dexterity (total | at next level): ",
	"Evasion (total | at next level): "
};

const string StExt_Str_Scrolmaking_No = "Requirements not met!";

const string StExt_Str_SummonGhost_Name = "Summoned Spirit";
const string StExt_Str_SummonBoneGolem_Name = "Summoned Bone Golem";
const string StExt_Str_SummonShadowbeast_Name = "Summoned Shadowbeast";
const string StExt_Str_SummonShadowbeast_Fire_Name = "Summoned Spirit of Fire";
const string StExt_Str_Summon_Troll_Name = "Summoned Troll";
const string StExt_Str_SummonCrawler_Name = "Summoned Crawler";
const string StExt_Str_SummonOster_Name = "Summoned Glorkh";

const string StExt_Str_TalisanRunen_Crait = "Create Krait summoning rune";
const string StExt_Str_TalisanRunen_SummonGhost = "Create a Ghost summon rune";
const string StExt_Str_TalisanRunen_SummonBoneGolem = "Create Rune of Summon Bone Golem";
const string StExt_Str_TalisanRunen_SummonShadowbeast = "Create Rune of Summon Shadowbeast";
const string StExt_Str_TalisanRunen_SummonShadowbeast_Fire = "Create Rune of Summon Fire Spirit";
const string StExt_Str_TalisanRunen_Summon_Troll = "Create Rune of Summon Troll";
const string StExt_Str_TalisanRunen_SummonCrawler = "Create Rune of Summon Crawler";
const string StExt_Str_TalisanRunen_SummonOster = "Create Rune of Summon Glorhk";

const string StExt_Str_TalisanRunen_Summon_Electricgolem = "Create Rune of Summon Ethereal Golem";
const string StExt_Str_TalisanRunen_PoisionCape = "Create Rune of Poison Aegis";
const string StExt_Str_TalisanRunen_EarthCape = "Create Rune of Earth Aegis";
const string StExt_Str_TalisanRunen_AirCape = "Create Rune of Air Aegis";
const string StExt_Str_TalisanRunen_DarkCape = "Create Rune of Darkness Aegis";
const string StExt_Str_TalisanRunen_LightingCape = "Create Rune of Lightning Aegis";
const string StExt_Str_TalisanRunen_IceCape = "Create Rune of Ice Aegis";
const string StExt_Str_TalisanRunen_FireCape = "Create Rune of Fire Aegis";

const string StExt_Str_TalisanRunen_Buff_Protection = "Create Rune of Blessing - Protection";
const string StExt_Str_TalisanRunen_Buff_Hp = "Create Rune of Blessing - Vitality";
const string StExt_Str_TalisanRunen_Buff_Stats = "Create Rune of Blessing - Attributes";
const string StExt_Str_TalisanRunen_Buff_Regen = "Create Rune of Blessing - Regeneration";
const string StExt_Str_TalisanRunen_Buff_Damage = "Create Rune of Blessing - Damage";
const string StExt_Str_TalisanRunen_Buff_Speed = "Create Rune of Blessing - Speed";
const string StExt_Str_TalisanRunen_Buff_Dodge = "Create Rune of Blessing - Evasion";
const string StExt_Str_TalisanRunen_Buff_Es = "Create Rune of Blessing - Energy Shield";
const string StExt_Str_TalisanRunen_Buff_MassRestore = "Create Rune of Mass Healing";

const string StExt_Str_TalisanRunen_Debuff_Protection = "Create Rune of Curse - Vulnerabilities";
const string StExt_Str_TalisanRunen_Debuff_Stats = "Create Rune of Curse - Weakening";
const string StExt_Str_TalisanRunen_Debuff_Siphon = "Create Rune of Curse - Life Siphon";
const string StExt_Str_TalisanRunen_Debuff_Speed = "Create Rune of Curse - Slowdown";
const string StExt_Str_TalisanRunen_Debuff_Lifetap = "Create Rune of Curse - Life Plug";
const string StExt_Str_TalisanRunen_Debuff_ReflectDamage = "Create Rune of Curse - Iron Maiden";
const string StExt_Str_TalisanRunen_Debuff_ExtraDamage = "Create Rune of Curse - More Damage";
const string StExt_Str_TalisanRunen_Debuff_Weaken = "Create Rune of Curse - Damage Weakening";

const string StExt_Str_Dia_SellBanditHead = "Bandit Head.";
const string StExt_Str_StonedTrader_SellEnchanted = "(Sell enchanted items...)";
const string StExt_Str_StonedTrader_SellEnchanted_Weap = "Weapons";
const string StExt_Str_StonedTrader_SellEnchanted_Armor = "Armor";
const string StExt_Str_StonedTrader_SellEnchanted_Jewelry = "Jewelry";
const string StExt_Str_StonedTrader_IdentifyItems = "Identify items.";
const string StExt_Str_StonedTrader_IdentifyItems_ItmPrice = " price per item: ";
const string StExt_Str_StonedTrader_IdentifyItems_ItmPriceTotal = " Total: ";
const string StExt_Str_IdentifiedItems = "Items identified: ";
const string StExt_Str_CorruptedPerkNotEnoughtLp = "Not enough damage points.";
const string StExt_Str_CorruptedPerk_DamagePoints = "Damage Points: ";
const string StExt_Str_CorruptedPerk_DamageExp = "Inflicted Damage: ";
const string StExt_Str_Menu_CorruptedTouch = "[Develop 'Touch of Corruption']";
const string StExt_Str_Config_CorruptionTouchExp = "Multiplier of experience gained by 'Touch of Corruption' perk";
const string StExt_Str_CorruptionTouchExp = "Experience Gained: ";
const string StExt_Str_Wasili_JunkTrade = "(Sell junk)";
const string StExt_Str_Saghita_PotionSell = "(Sell potions)";

const string StExt_Str_SummonsCountGlobalStat = "Summoned Creatures:";

const string StExt_Str_Professions_Header = " -= Professions =- ";

const string StExt_Str_Profession_Name[StExt_ProfessionIndex_Max] = 
{
	"Scroll Creation",
	"Potion Brewing",
	"Enchantment"
};

const string StExt_Str_Profession_Skill_Scrollmaking_Name[StExt_ScrollmakingSkillIndex_Max] = 
{
	"Basic Scrolls",
	"Advanced Scrolls",
	"Master Scrolls",
	"Efficient Scribe",
	"Pyromancy Scrolls",
	"Cryomancy Scrolls",
	"Electromancy Scrolls",
	"Aeromancy Scrolls",
	"Geomancy Scrolls",
	"Light Magic Scrolls",
	"Dark Magic Scrolls",
	"Death Magic Scrolls",
	"Life Magic Scrolls",
	"Golem Crafting Scrolls",
	"Demonology Scrolls",
	"Necromancy Scrolls"
};

const string StExt_Str_Profession_Skill_Alchemy_Name[StExt_AlchemySkillIndex_Max] = 
{
	"-= ??? =-",
	"-= ??? =-",
	"-= ??? =-"
};

const string StExt_Str_Profession_Skill_Enchantment_Name[StExt_EnchantmentSkillIndex_Max] = 
{
	"-= ??? =-",
	"-= ??? =-",
	"-= ??? =-"
};

const string StExt_Str_Menu_CorruptedTouch_Luck = "Develop Luck";
const string StExt_Str_Menu_CorruptedTouch_Aura = "Develop Aura";
const string StExt_Str_Menu_CorruptedTouch_Stats = "Develop Attributes";
const string StExt_Str_Menu_CorruptedTouch_Protection = "Develop Protection";
const string StExt_Str_Menu_CorruptedTouch_Damage = "Develop Damage";
const string StExt_Str_Menu_CorruptedTouch_Masteries = "Develop Masteries";
const string StExt_Str_Menu_CorruptedTouch_Summons = "Develop Summon";

const string StExt_Str_Config_Diff_EnableRot_NightEncounters = "Enable Night Raiders from 'Road of Trials'";
const string StExt_Str_Config_Diff_EnableRot_Avengers = "Enable Bounty Hunters from 'Road of Trials'";
const string StExt_Str_Config_Diff_EnableRot_Bandits = "Enable Bandits from 'Road of Trials'";

const string StExt_Str_Config_ShowNpcFlags = "Display NPC Flags";
const string StExt_Str_Config_ShowNpcRank = "Display NPC Rank";
const string StExt_Str_Config_ShowNpcAbilities = "Display NPC Abilities";


const string StExt_Str_DamageBlocked = "Damage Blocked!";
const string StExt_Str_DamageBlocked_Dodge = "Evasion";
const string StExt_Str_DamageBlocked_Ignored = "Ignored";
const string StExt_Str_DamageBlocked_ArrowDeclined = "Projectile Deflected";
const string StExt_Str_DamageBlocked_SpellAbsorbed = "Spell Absorbed";
const string StExt_Str_DamageBlocked_SpellReflected = "Spell Reflected";

const string StExt_Str_Config_HideHelm = "Hide Helmet Display";

const string StExt_Str_ForgetPerks = "Forget Learned Skills";

const string StExt_Str_Bosper_MisslesSell = "(Sell magic arrows, grenades, and more...)";
const string StExt_Str_Jora_MiskSell = "(Sell household items)";
const string StExt_Str_Harad_CoalSell = "(Sell blacksmith inventory and consumables)";
const string StExt_Str_Kardif_FoodSell = "(Sell meat and other food)";
const string StExt_Str_Kardif_BoozeSell = "(Sell booze)";

const string StExt_Str_AcceptHelp = "<Confirm reading and hide hints>";
const string StExt_Str_HelpStrings[8] = 
{
	"Welcome to the 'EthernalBreeze' mod",
	"[Main Key] of the mod by default [T] (unless otherwise specified in settings)",
	"Pressing [Main Key] will open the mod menu/dialog for customizing the mod.",
	"Pressing [Shift] + [Main Key] will open the additional character statistics menu.",
	"The key to activate/deactivate automatic auras by default [O] (unless otherwise specified in settings)",
	"Pressing [Shift] + [O] will open the graphical mod configuration menu.",
	"",
	"To hide this menu, open the mod menu and confirm reading this message."
};

const string StExt_Str_Config_Npc_InfusionHpMult = "Magical NPCs Vital Forces Modifier";
const string StExt_Str_Config_Npc_InfusionStatMult = "Magical NPCs Attributes Modifier";
const string StExt_Str_Config_Npc_InfusionProtMult = "Magical NPCs Protection Modifier";
const string StExt_Str_Config_Npc_InfusionDamMult = "Magical NPCs Damage Modifier";
const string StExt_Str_Config_Npc_InfusionEsMult = "Magical NPCs Energy Shield Modifier";

const string StExt_Str_NewVersionMigrateNotify = "'EthernalBreeze' Mod Update";
const string StExt_Str_Absent = "Absent ";

const string StExt_Str_ModMenu_ItemGeneratorPresetsSection = "Load Item Generator Settings...";
const string StExt_Str_ModMenu_DefaultItemGeneratorPreset = "Default Item Generator Settings";

const string StExt_Str_UserConfigsFuncNotFound = "Preset function not found!";
const string StExt_Str_ModMenu_ExportCurrentConfigs = "Export Current Settings... (will be available upon re-entering the game)";
const string StExt_Str_ExportCurrentConfigs_Failed = "Failed to export current settings!";

const string StExt_Str_StonedTrader_OpenChests = "(Open all named chests)";
const string StExt_Str_StonedTrader_OpenChests_Open = "Chests Opened: ";
const string StExt_Str_StonedTrader_OpenChests_Nothing = "No Chests!";

const string StExt_Str_Dragomir_CBowSell = "(Sell crossbows for 25% of their value)";
const string StExt_Str_Matteo_JewSell = "(Sell jewelry for 25% of their value)";

const string StExt_Str_GiveRhit_Rhit = "Rhetoric + ";
const string StExt_Str_GiveRhit_Total = " (Total: ";

const string StExt_Str_ChoiceSidWeap_Bow = "(Bow)";
const string StExt_Str_ChoiceSidWeap_Magic = "(Magic)";

const string itar_stext_godarmor_name = "Armor of the Chosen";

const string StExt_Str_AverageWeapDamageInfo_Meele = "Expected Melee Damage: ";
const string StExt_Str_AverageWeapDamageInfo_Range = "Expected Ranged Damage: ";
const string StExt_Str_AverageWeapDamageInfo_Magic = "Expected Rune Damage: ";

const string StExt_Str_Config_DamageReductionExpRate = "Multiplier of Experience Gained by Skills from Reduced Damage";
const string StExt_Str_RodBeatenLogEntry_Fix = "I beat Rod. Now I don't need to prove my strength by lifting his sword.";

const string StExt_Str_Config_Npc_MagicInfusion_HumansExtraChance = "Additional Magic Infusion Chance for Humans";
const string StExt_Str_Config_Npc_MagicInfusion_BossesExtraChance = "Additional Magic Infusion Chance for Bosses";

const string StExt_Str_CorruptionLevelUpMsg = "Corruption progresses...";

const string StExt_Str_Config_MasteryExpMult_Fire = "Experience Gain Multiplier for 'Pyromancy' Mastery";
const string StExt_Str_Config_MasteryExpMult_Ice = "Experience Gain Multiplier for 'Hydromancy' Mastery";
const string StExt_Str_Config_MasteryExpMult_Electric = "Experience Gain Multiplier for 'Electromancy' Mastery";
const string StExt_Str_Config_MasteryExpMult_Air = "Experience Gain Multiplier for 'Aeromancy' Mastery";
const string StExt_Str_Config_MasteryExpMult_Earth = "Experience Gain Multiplier for 'Geomancy' Mastery";
const string StExt_Str_Config_MasteryExpMult_Light = "Experience Gain Multiplier for 'Light Magic' Mastery";
const string StExt_Str_Config_MasteryExpMult_Dark = "Experience Gain Multiplier for 'Dark Magic' Mastery";
const string StExt_Str_Config_MasteryExpMult_Death = "Experience Gain Multiplier for 'Death Magic' Mastery";
const string StExt_Str_Config_MasteryExpMult_Life = "Experience Gain Multiplier for 'Life Magic' Mastery";
const string StExt_Str_Config_MasteryExpMult_Golem = "Experience Gain Multiplier for 'Golem Crafting' Mastery";
const string StExt_Str_Config_MasteryExpMult_Demon = "Experience Gain Multiplier for 'Demonology' Mastery";
const string StExt_Str_Config_MasteryExpMult_Necro = "Experience Gain Multiplier for 'Necromancy' Mastery";
const string StExt_Str_Config_MasteryExpMult_Shaman = "Experience Gain Multiplier for 'Spirit Magic' Mastery";
const string StExt_Str_Config_MasteryExpMult_MartialArts = "Experience Gain Multiplier for 'Art of War' Mastery";
const string StExt_Str_Config_MasteryExpMult_Agile = "Experience Gain Multiplier for 'Art of Defense' Mastery";
const string StExt_Str_Config_MasteryExpMult_Archery = "Experience Gain Multiplier for 'Art of Archery' Mastery";
const string StExt_Str_Config_MasteryExpMult_Blood = "Experience Gain Multiplier for '???' Mastery";
const string StExt_Str_Config_MasteryExpMult_FistFight = "Experience Gain Multiplier for '???' Mastery";
const string StExt_Str_Config_MasteryExpMult_Aura = "Experience Gain Multiplier for '???' Mastery";
const string StExt_Str_Config_MasteryExpMult_Traps = "Experience Gain Multiplier for '???' Mastery";
const string StExt_Str_Config_MasteryExpMult_Poision = "Experience Gain Multiplier for '???' Mastery";

const string StExt_Str_Config_EnableWorldRandomization_ByTimeEvents = "Enable World Randomization from Time Events";


//------------------------------------------------------------------------
//							 Build 7.0.0
//------------------------------------------------------------------------

const string StExt_Str_itpo_damageup_01_Desc = "Increases melee damage by 10%";
const string StExt_Str_itpo_damageup_02_Desc = "Increases melee damage by 20%";
const string StExt_Str_itpo_damageup_03_Desc = "Increases melee damage by 30%";
const string StExt_Str_itpo_damageup_Time_Desc = "Effect Duration: 10 minutes";

const string StExt_Str_ItemSpecialDamage = "Special Damage: ";
const string StExt_Str_ItemSpecialProtection = "Special Protection: ";

const string StExt_Str_Config_MenuPauseOnShow = "Pause when Menu is Open (mod)";
const string StExt_Str_Config_MenuScrollMult = "Menu Scroll Strength Multiplier (mod)";

const string StExt_Str_ExtraStaminaBonus_Toatal = " (Total: ";

const string StExt_Str_ItPo_Concentration_Proto = "Potion of Concentration";
const string StExt_Str_ItPo_Concentration_01 = "Minor Potion of Concentration";
const string StExt_Str_ItPo_Concentration_02 = "Potion of Concentration";
const string StExt_Str_ItPo_Concentration_03 = "Powerful Potion of Concentration";

const string StExt_Str_ItPo_Concentration_Desc = "Temporarily increases perception and reaction speed.";
const string StExt_Str_ItPo_Concentration_Power = "Effect Strength (%):";

const string StExt_Str_ModMenu_ConsumePerm = "[Use all bonus potions/food...]";
const string StExt_Str_Dia_ConsumePerm = "Use '";

const string StExt_Str_On = "On.";
const string StExt_Str_Off = "Off.";

const string StExt_Str_Config_Category_Name[7] =
{
	"Difficulty",
	"NPCs",
	"Luck",
	"Randomization",
	"Experience",	
	"Interface",
	"Miscellaneous"
};
const string StExt_ConfigsMenu_TabName[2] = 
{
	"Settings",
	"Information"
};

const string StExt_Str_Menu_CraftButtonText = "Create";
const string StExt_Str_Menu_CraftType_TabText_All = "All";
const string StExt_Str_Menu_CraftType_TabsText[StExt_ReceiptType_Max] = 
{
	"Miscellaneous",
	"Armor",
	"Melee Weapons",
	"Melee Weapons",
	"Jewelry",
	"Magic"
};

const string StExt_Str_Config_Alch_DisplayOnScreen = "Display Alchemy Bonuses on Screen";
const string StExt_Str_Config_Alch_PosX = "Alchemy Bonuses Position Horizontally";
const string StExt_Str_Config_Alch_PosY = "Alchemy Bonuses Position Vertically";
const string StExt_Str_Config_Artifact_DisplayOnScreen = "Display Artifact Information on Screen";
const string StExt_Str_Config_Artifact_PosX = "Artifact Information Position Horizontally";
const string StExt_Str_Config_Artifact_PosY = "Artifact Information Position Vertically";
const string StExt_Str_Config_Aura_DisplayOnScreen = "Display Active Auras on Screen";
const string StExt_Str_Config_Aura_PosX = "Active Auras Position Horizontally";
const string StExt_Str_Config_Aura_PosY = "Active Auras Position Vertically";
const string StExt_Str_Config_EsBar_DefaultPos = "Display Energy Shield in Default Position";
const string StExt_Str_Config_EsBar_PosX = "Energy Shield Position Horizontally";
const string StExt_Str_Config_EsBar_PosY = "Energy Shield Position Vertically";
const string StExt_Str_Config_ItemMenu_PosX = "Item Information Position Horizontally";
const string StExt_Str_Config_ItemMenu_PosY = "Item Information Position Vertically";
const string StExt_Str_Config_MsgTray_PosX = "Message Log Position Horizontally";
const string StExt_Str_Config_MsgTray_PosY = "Message Log Position Vertically";
const string StExt_Str_Config_EnableFemaleSkin = "Enable Female Skin";
const string StExt_Str_Config_EnableFemaleSkin_AlwaysWig = "Enable Female Skin - Add Wig";
const string StExt_Str_Config_EnableFemaleSkin_DemonLook = "Enable Female Skin - Demonic Appearance";


const string StExt_Str_ItemPreffixName[299] = 
{
	"Thorny",
    "Shining",
    "Blazing",
    "Sturdy",
    "Reinforced",
    "Scandalous",
    "Monumental",
    "Underground",
    "Hunting",
    "Chosen",
    "Unleashed",
    "Destructive",
    "Ribbed",
    "Azure",
    "Plump",
    "Unfit",
    "Loathsome",
    "Unseen",
    "Night",
    "Rotten",
    "Defeated",
    "Brilliant",
    "Wormy",
    "Invisible",
    "Senile",
    "Spoiled",
    "Corpse",
    "Reviving",
    "Heated",
    "Cocked",
    "Alluring",
    "Purifying",
    "Frightening",
    "Charred",
    "Alien",
    "Whispering",
    "Shaking",
    "Sinister",
    "Alchemical",
    "Rich",
    "Stormy",
    "Riotous",
    "Eternal",
    "Guilty",
    "Alarmed",
    "Plaster",
    "Sinful",
    "Far-sighted",
    "Amateur",
    "Dolomite",
    "Intoxicating",
    "Fermented",
    "Thickened",
    "Abundant",
    "Exquisite",
    "Frightened",
    "Test",
    "Desiccating",
    "Boiling",
    "Clinical",
    "Laboratory",
    "Masochistic",
    "Turbid",
    "Abundant",
    "Cautious",
    "Dangerous",
    "Emptying",
    "Experienced",
    "Weakening",
    "Prudent",
    "Cautious",
    "Boiled",
    "Stunned",
    "Stunned",
    "Panicky",
    "Foamy",
    "Nutritious",
    "Prepared",
    "Handy",
    "Ominous",
    "Criminal",
    "Decomposing",
    "Rudimentary",
    "Self-flagellating",
    "Scant",
    "Dim-witted",
    "Stingy",
    "Chilly",
    "Languishing",
    "Chemical",
    "Fizzy",
    "Generous",
    "Experimental",
    "Unbridled",
    "Painted",
    "Dirty",
    "Clean",
    "Washed",
    "Polished",
    "Clogged",
    "Rough",
    "Rusty",
    "Broken",
    "Cunning",
    "Disgusting",
    "Whiny",
    "Shabby",
    "Twisted",
    "Tangled",
    "Malicious",
    "Demonic",
    "Divine",
    "Indecent",
    "Killed",
    "Resurrected",
    "Crucified",
    "Revived",
    "Lost",
    "Bearded",
    "Bald",
    "Boring",
    "Interesting",
    "Intense",
    "Beaten",
    "Slimy",
    "Sticky",
    "Slippery",
    "Numb",
    "Silent",
    "Elastic",
    "Soft",
    "Rigid",
    "Snotty",
    "Repulsive",
    "Heavy",
    "Dead",
    "Misty",
    "Monstrous",
    "Bloody",
    "Tempered",
    "Hot",
    "Poisonous",
    "Singed",
    "Stone",
    "Golden",
    "Silver",
    "Bronze",
    "Iron",
    "Copper",
    "Marble",
    "Weathered",
    "Ritual",
    "Enchanted",
    "Cursed",
    "Ghostly",
    "Magical",
    "Enchanting",
    "Ancient",
    "Mythical",
    "Sacred",
    "Blessed",
    "Malodorous",
    "Deadly",
    "Chilling",
    "Scorching",
    "Destroyed",
    "Devastated",
    "Barren",
    "Fertile",
    "Tormented",
    "Exhausted",
    "Mighty",
    "Invulnerable",
    "Impregnable",
    "Vigilant",
    "Forgotten",
    "Vanishing",
    "Skillful",
    "Disfigured",
    "Irradiated",
    "Glowing",
    "Hostile",
    "Great",
    "Charming",
    "Broken",
    "Scary",
    "Decayed",
    "Unchained",
    "Formidable",
    "Revered",
    "Chosen",
    "Embittered",
    "Fallen",
    "Lost",
    "Lost",
    "Forgotten",
    "Closed",
    "Locked",
    "Imprisoned",
    "Dazzling",
    "Thundering",
    "Stormy",
    "Grounded",
    "Failed",
    "Submerged",
    "Raised",
    "Broken",
    "Gigantic",
    "Supernatural",
    "Mysterious",
    "Entangled",
    "Enigmatic",
    "Secret",
    "Captivating",
    "Otherworldly",
    "Vitalizing",
    "Gloomy",
    "Dusky",
    "Magnetic",
    "Psychic",
    "Telepathic",
    "Paranormal",
    "Hypnotic",
    "Mediumistic",
    "Unknown",
    "Invisible",
    "Elusive",
    "Unidentified",
    "Inscrutable",
    "Formless",
    "Infinite",
    "Boundless",
    "Limitless",
    "Incomprehensible",
    "Unforgettable",
    "Incredible",
    "Fantastic",
    "Grand",
    "Colossal",
    "Gigantic",
    "Titanic",
    "Immeasurable",
    "Large-scale",
    "Epic",
    "Legendary",
    "Heroic",
    "Brave",
    "Valiant",
    "Majestic",
    "Noble",
    "Proud",
    "Wise",
    "Smart",
    "Intellectual",
    "Genius",
    "Clever",
    "Bold",
    "Courageous",
    "Cool-headed",
    "Determined",
    "Unshakable",
    "Fearless",
    "Tireless",
    "Indefatigable",
    "Insatiable",
    "Thirsty",
    "Burning",
    "Unstoppable",
    "Implacable",
    "Restless",
    "Inflexible",
    "Irreconcilable",
    "Invincible",
    "Irresistible",
    "Insurmountable",
    "Unfinished",
    "Unfeasible",
    "Impermeable",
    "Impassable",
    "Unattainable",
    "Untouchable",
    "Unperturbed",
    "Unchanged",
    "Inevitable",
    "Unreliable",
    "Unfaithful",
    "Inconstant",
    "Incorrigible",
    "Faulty",
    "Unenviable",
    "Unforgivable",
    "Irreversible",
    "Unbroken",
    "Unshakable",
    "Unquenchable",
    "Indescribable",
    "Inexplicable",
    "Unexplainable",
    "Inscrutable"
};

const string StExt_Str_ItemAffixName[407] = 
{
    "Beast",
    "Scoundrel",
    "Abyss",
    "Hound",
    "Deadman",
    "Roach",
    "Goliath",
    "Ichthyander",
    "Bastard",
    "Genius",
    "Ghoul",
    "Blindman",
    "Vagabond",
    "Raven",
    "Demon",
    "Golem",
    "Decay",
    "Cadaver",
    "Hangman",
    "Imp",
    "Fox",
    "Beggar",
    "Seeker",
    "Summoner",
    "Scorpion",
    "Seal",
    "Drowned",
    "Flail",
    "Spirit",
    "Wind",
    "Monster",
    "Pus",
    "Skeleton",
    "Wraith",
    "Blacksmith",
    "Freak",
    "Punisher",
    "Villain",
    "Shepherd",
    "Champion",
    "Elf",
    "Mind-eater",
    "Cannibal",
    "Man-eater",
    "Construct",
    "Fruit",
    "Ward",
    "Colossus",
    "Thief",
    "Assassin",
    "Ripper",
    "Hero",
    "Cat",
    "Archangel",
    "Overlord",
    "Bat",
    "Maelstrom",
    "Alchemist",
    "Hunter",
    "Innkeeper",
    "Beetle",
    "Worm",
    "Helminth",
    "Parasite",
    "Mage",
    "Scholar",
    "Eye",
    "Fiend",
    "Executioner",
    "Lamb",
    "Acolyte",
    "Vermin",
    "Dragon",
    "Sovereign",
    "King",
    "Ruler",
    "Scumbag",
    "Rascal",
    "Drunkard",
    "Cultist",
    "Mechanism",
    "Parrot",
    "Slacker",
    "Vow",
    "Dinner",
    "Vampire",
    "Goat",
    "Breakfast",
    "Ailment",
    "Wing",
    "Shroud",
    "Ash",
    "Crawler",
    "Spider",
    "Wolf",
    "Suitcase",
    "Elixir",
    "Poison",
    "Scrap",
    "Chunk",
    "Bast-shoe",
    "Shield",
    "Sword",
    "Bow",
    "Axe",
    "Staff",
    "Stiletto",
    "Ladle",
    "Root-crop",
    "Down",
    "Psycho",
    "Slave",
    "Leaf",
    "Stump",
    "Beverage",
    "Lion",
    "Pigeon",
    "Abscess",
    "Cut",
    "Strain",
    "Incision",
    "Hammer",
    "Pony",
    "Pest",
    "Steed",
    "Stinker",
    "Tooth",
    "Fang",
    "Muritan",
    "Ram",
    "Ram-sheep",
    "Boar",
    "Butler",
    "Master",
    "Apprentice",
    "Pupil",
    "Malicious",
    "Crab",
    "Knife",
    "Cook",
    "Failure",
    "Graveyard",
    "Carpet",
    "Curtain",
    "Merchant",
    "Oldman",
    "Grandpa",
    "Butcher",
    "Guard",
    "Paladin",
    "Guru",
    "Lord",
    "Infantryman",
    "Archer",
    "Ray",
    "Square",
    "Sphere",
    "Fire",
    "Bearer",
    "Loader",
    "Servant",
    "Beast-lover",
    "Heretic",
    "Renegade",
    "Soup",
    "Beaver",
    "Stream",
    "Apothecary",
    "Sweep",
    "Mason",
    "Court",
    "Cap",
    "Blizzard",
    "Calm",
    "Fist",
    "Reaper",
    "Barbarian",
    "Chamberlain",
    "Ratcatcher",
    "Mirror",
    "Glass",
    "Robe",
    "Lantern",
    "Manure",
    "Stone",
    "Oak",
    "Ash-tree",
    "Ice",
    "Discharge",
    "Dagger",
    "Marble",
    "Saber",
    "Sickle",
    "Razor",
    "Scalpel",
    "Light",
    "Darkness",
    "Tornado",
    "Gadfly",
    "Gunpowder",
    "Cloud",
    "Rain",
    "Storm",
    "Thunderstorm",
    "Lightning",
    "Thunder",
    "Fog",
    "Gloom",
    "Flash",
    "Dawn",
    "Sunset",
    "Sunrise",
    "Swamper",
    "Forester",
    "Mushroom",
    "Root",
    "Branch",
    "Fruit-item",
    "Water",
    "River",
    "Pond",
    "Lake",
    "Ocean",
    "Lagoon",
    "Shore",
    "Harbor",
    "High-tide",
    "Low-tide",
    "Wave",
    "Foam",
    "Reef",
    "Coral",
    "Whale",
    "Shark",
    "Fish",
    "Octopus",
    "Squid",
    "Sailor",
    "Captain",
    "Admiral",
    "Pirate",
    "Filibuster",
    "Corsair",
    "Brig",
    "Frigate",
    "Ship",
    "Schooner",
    "Yacht",
    "Raft",
    "Boat",
    "Canoe",
    "Kayak",
    "Cutter",
    "Motor",
    "Oar",
    "Anchor",
    "Sail",
    "Wheel",
    "Mast",
    "Vortex",
    "Galley",
    "Carriage",
    "Crew",
    "Wagon",
    "Cart",
    "Sleigh",
    "Wheel-part",
    "Axle",
    "Pedal",
    "Fuel",
    "Star",
    "Planet",
    "Meteor",
    "Asteroid",
    "Comet",
    "Satellite",
    "Space",
    "Galaxy",
    "Universe",
    "World",
    "Civilization",
    "Epoch",
    "Era",
    "Century",
    "Year",
    "Month",
    "Week",
    "Day",
    "Hour",
    "Minute",
    "Second",
    "Moment",
    "Light-spark",
    "Sparkle",
    "Flame",
    "Coal",
    "Ash-pile",
    "Handful",
    "Splinter",
    "Shard",
    "Drop",
    "Iron",
    "Silver",
    "Gold",
    "Platinum",
    "Tin",
    "Copper",
    "Aluminum",
    "Titanium",
    "Mercury",
    "Flint",
    "Phosphorus",
    "Magnesium",
    "Carbon",
    "Oxygen",
    "Nitrogen",
    "Hydrogen",
    "Helium",
    "Argon",
    "Neon",
    "Xenon",
    "Radon",
    "Polonium",
    "Thorium",
    "Uranium",
    "Plutonium",
    "Viper",
    "Snake",
    "Cobra",
    "Anaconda",
    "Grass-snake",
    "Lizard",
    "Crocodile",
    "Alligator",
    "Turtle",
    "Ant",
    "Bee",
    "Wasp",
    "Bumblebee",
    "Mosquito",
    "Fly",
    "Locust",
    "Butterfly",
    "Grasshopper",
    "Caterpillar",
    "Aphid",
    "Leech",
    "Jellyfish",
    "Shrimp",
    "Lobster",
    "Crayfish",
    "Oyster",
    "Mussel",
    "Scallop",
    "Sea-slug",
    "Dolphin",
    "Killer-whale",
    "Walrus",
    "Elephant",
    "Giraffe",
    "Rhino",
    "Hippo",
    "Zebra",
    "Gazelle",
    "Antelope",
    "Buffalo",
    "Vixen",
    "Bear",
    "Badger",
    "Otter",
    "Mink",
    "Marmot",
    "Raccoon",
    "Deer",
    "Elk",
    "Roe-deer",
    "North",
    "South",
    "West",
    "East",
    "Compass",
    "Magnet",
    "Needle",
    "Thread",
    "Cloth",
    "Flax",
    "Silk",
    "Cotton",
    "Wool",
    "Fur",
    "Leather",
    "Suede",
    "Velvet",
    "Satin",
    "Brocade",
    "Jeans",
    "Serge",
    "Button",
    "Fastener",
    "Cord",
    "Hairpin",
    "Hook",
    "Thimble",
    "Paw",
    "Boot",
    "Shoe",
    "Low-shoe"
};

const string StExt_Str_ItemSuffixName[363] = 
{
    "Salamander",
    "Squall",
    "Gods",
    "Elder",
    "Formation",
    "Dungeon",
    "Redemption",
    "Worm",
    "Lizard",
    "Delight",
    "Overflow",
    "Exile",
    "Seal",
    "Cloud",
    "Scandal",
    "Combatant",
    "Whirlpool",
    "Troll",
    "Deviltry",
    "Abomination",
    "Rot",
    "Doom",
    "Discovery",
    "Wailing",
    "Filth",
    "Suffering",
    "Fatality",
    "Development",
    "Diligence",
    "Fury",
    "Bloodloss",
    "Enchantment",
    "Order",
    "Shelter",
    "Monster",
    "Wounding",
    "Entropy",
    "Cunning",
    "Prophecy",
    "Rebuff",
    "Efficiency",
    "Destruction",
    "Resistance",
    "Battle",
    "Collapse",
    "Mystic",
    "Spirit",
    "Runes",
    "Training",
    "Fanaticism",
    "Warding",
    "Bile",
    "Mercy",
    "Albatross",
    "Beluga",
    "Continuity",
    "Slaughter",
    "Bog Moss",
    "Flea",
    "Armadillo",
    "Petrel",
    "Wizard",
    "Draining",
    "Pigeon",
    "Prosperity",
    "Hedgehog",
    "Rigidity",
    "Barricade",
    "Conjurer",
    "Clogging",
    "Closure",
    "Fading",
    "Healing",
    "Isolation",
    "Carp",
    "Warlock",
    "Crystal",
    "Bloodshed",
    "Bloodletting",
    "Necromancer",
    "Ward",
    "Abundance",
    "Relief",
    "Limitation",
    "Emptying",
    "Liberation",
    "Drainage",
    "Wasp",
    "Diversion",
    "Straining",
    "Displacement",
    "Initiate",
    "Acolyte",
    "Constancy",
    "Obstacle",
    "Prism",
    "Infliction",
    "Counterweight",
    "Burning Runes",
    "Rainbow",
    "Reprisal",
    "Carnage",
    "Composure",
    "Skunk",
    "Servant",
    "Softening",
    "Contact",
    "Tranquility",
    "Stabilization",
    "Severity",
    "Moistening",
    "Tenacity",
    "Stubbornness",
    "Pacification",
    "Satiety",
    "Apprentice",
    "Sorcerer",
    "Generosity",
    "Bumblebee",
    "Hatred",
    "Xardas",
    "Vatras",
    "Pyrokar",
    "Peace",
    "Myrtana",
    "Suffocation",
    "Loss",
    "End",
    "Mud",
    "Andre",
    "Constantino",
    "Harad",
    "Matteo",
    "Bosper",
    "Thorben",
    "Ignaz",
    "Zuris",
    "Madness",
    "Disease",
    "Pain",
    "Vile",
    "Agony",
    "Air",
    "Cabal",
    "Brain",
    "Skull",
    "Bones",
    "Heart",
    "Novelty",
    "Silence",
    "Quiet",
    "Darkness",
    "Void",
    "Gloom",
    "Light",
    "Shadow",
    "Depths",
    "Night",
    "Stars",
    "Moon",
    "Sun",
    "Ash",
    "Dust",
    "Hoarfrost",
    "Frost",
    "Ice",
    "Snow",
    "Cold",
    "Storm",
    "Vortex",
    "Wind",
    "Gust",
    "Thunder",
    "Lightning",
    "Tempest",
    "Golem",
    "Elemental",
    "Titan",
    "Giant",
    "Dragon",
    "Wolf",
    "Tiger",
    "Lion",
    "Leopard",
    "Bear",
    "Werewolf",
    "Phoenix",
    "Gargoyle",
    "Banshee",
    "Vampire",
    "Lich",
    "Skeleton",
    "Ghost",
    "Demon",
    "Angel",
    "Archangel",
    "God",
    "Lord",
    "Emperor",
    "King",
    "Prince",
    "Despot",
    "Overlord",
    "Sovereign",
    "Mage",
    "Paladin",
    "Crusader",
    "Templar",
    "Warrior",
    "Knight",
    "Samurai",
    "Ninja",
    "Assassin",
    "Spy",
    "Master",
    "Teacher",
    "Adept",
    "Novice",
    "Initiated",
    "Gladiator",
    "Fighter",
    "Defender",
    "Shield",
    "Sword",
    "Axe",
    "Spear",
    "Hammer",
    "Crossbow",
    "Bow",
    "Dagger",
    "Blade",
    "Poleaxe",
    "Mace",
    "Staff",
    "Wand",
    "Book",
    "Manuscript",
    "Tome",
    "Scroll",
    "Spell",
    "Potion",
    "Elixir",
    "Brew",
    "Herbs",
    "Mushrooms",
    "Roots",
    "Flowers",
    "Seeds",
    "Grove",
    "Forest",
    "Desert",
    "Oasis",
    "Volcano",
    "River",
    "Lake",
    "Sea",
    "Ocean",
    "Swamp",
    "Marsh",
    "Lagoon",
    "Atlantis",
    "Valhalla",
    "Eden",
    "Paradise",
    "Halls",
    "Castle",
    "Palace",
    "Fortress",
    "Citadel",
    "Bastion",
    "Tower",
    "Rock",
    "Mountain",
    "Peak",
    "Cliff",
    "Abyss",
    "Precipice",
    "Despair",
    "Fall",
    "Doom",
    "Fate",
    "Karma",
    "Retribution",
    "Reckoning",
    "Sorrow",
    "Tears",
    "Melancholy",
    "Pity",
    "Wrath",
    "Rage",
    "Malice",
    "Revenge",
    "Vengeance",
    "Horror",
    "Fear",
    "Awe",
    "Anxiety",
    "Expectation",
    "Hope",
    "Dream",
    "Desire",
    "Will",
    "Power",
    "Might",
    "Greatness",
    "Nobility",
    "Honor",
    "Glory",
    "Valor",
    "Fortitude",
    "Bravery",
    "Courage",
    "Resolve",
    "Endurance",
    "Patience",
    "Steadfastness",
    "Inflexibility",
    "Concentration",
    "Wisdom",
    "Knowledge",
    "Enlightenment",
    "Insight",
    "Intuition",
    "Epiphany",
    "Clarity",
    "Purity",
    "Virginity",
    "Innocence",
    "Mystery",
    "Magic",
    "Wonders",
    "Divinity",
    "Justice",
    "Judgement",
    "Law",
    "Harmony",
    "Balance",
    "Truth",
    "Good",
    "Evil",
    "Darkness",
    "Chaos",
    "Destruction",
    "Creation",
    "Being",
    "Essence",
    "Element",
    "Nature",
    "Universe",
    "Cosmos",
    "Galaxy",
    "Wormhole",
    "Anomaly",
    "Cataclysm",
    "Apocalypse",
    "Armageddon",
    "Doomsday",
    "End of the World",
    "Rebirth",
    "Renaissance",
    "Awakening",
    "Resurrection",
    "Illumination"
};

const string StExt_Str_ItemSpecialName[2] = 
{
	"", ""
};

// 7.0.5
const string StExt_Str_Npc_Ability_Name[StExt_Npc_Ability_Index_Max] =
{
	"???",
	"Holy Arrow",
	"Ice Arrow",
	"Lesser Lightning",
	"Death Arrow",
	"Ghost Arrow",
	"Fire Arrow",
	"Dark Arrow",
	"Fireball",
	"Weak Dark Curse",
	"Moderate Dark Curse",
	"Ice Lance",
	"Energy Ball",
	"Blink",
	"Throws Arrow",
	"Throws Bolt",
	"Throws Explosive Bolt",
	"Throws Crushing Bolt",
	"Throws Sharp Bolt",
	"Throws Armor-Piercing Bolt",
	"Throws Holy Bolt",
	"Throws Magic Bolt",
	"Throws Explosive Arrow",
	"Throws Magic Arrow",
	"Throws Fire Arrow",
	"Throws Holy Arrow",
	"Throws Poison Arrow",
	"Throws Stone",
	"Throws Dagger",
	"Throws Axe",
	"Throws Club",
	"Throws Sharp Stick",
	"Throws Ogre Club",
	"Throws Butcher's Cleaver",
	"Throws Heavy Stick",
	"Throws Stone Stick",
	"Throws Hammer",
	"Fire Flash",
	"Lightning Strike",
	"Ice Block",
	"Ball Lightning",
	"Death Ball",
	"Evil Spear",
	"Water Fist",
	"Root Entanglement",
	"Swarm",
	"Terrible Stench",
	"Drain Arrow",
	"Water Ball",
	"Poison Arrow",
	"Stone Arrow",
	"Ice Flash",
	"Ice Storm",
	"Thunderball",
	"Green Strike",
	"Fire Lance",
	"Death Strike",
	"Dark Ball",
	"Greater Fireball",
	"Firestorm",
	"Dark Lance",
	"Greater Dark Ball",
	"Tornado",
	"Dark Tentacles",
	"Ice Wave",
	"Death Wave",
	"Black Fog",
	"Gaze of Destruction",
	"Storm",
	"Poison Cloud",
	"Geyser",
	"Energy Vortex",
	"Cry of the Dead",
	"Shroud of Fire",
	"Meteor",
	"Concussion",
	"Explosion",
	"Blood Storm",
	"Electric Wave",
	"Freezing Rain",
	"Howl of the Abyss",
	"Magic Vortex",
	"Fire Rain",
	"Advanced Dark Curse",
	"Dark Wave",
	"Fire Wave",
	"Thorn Dash",
	"Fire Dash",
	"Ice Dash",
	"Charged Leap",
	"Death Wings",
	"Shadow Step",
	"Concussive Leap",
	"Poisonous Leap",
	"Mild Ally Heal",
	"Moderate Ally Heal",
	"Strong Ally Heal",
	"Allied Slashing Protection",
	"Allied Crushing Protection",
	"Allied Fire Protection",
	"Allied Knockback Protection",
	"Allied Magic Protection",
	"Allied Piercing Protection",
	"Additional Evasion for Allies",
	"Additional Melee Damage for Allies",
	"Additional Ranged Damage for Allies",
	"Additional Magic Damage for Allies",
	"Additional Energy Shield for Allies",
	"Allied Strength Boost",
	"Allied Dexterity Boost",
	"Allied Vitality Boost",
	"Allied Vitality Regeneration Boost",
	"Allied Energy Shield Regeneration Boost",
	"Light Healing",
	"Moderate Healing",
	"Strong Healing",
	"Slashing Protection",
	"Blending Protection",
	"Fire Protection",
	"Knockback Protection",
	"Magic Protection",
	"Piercing Protection",
	"Additional Evasion",
	"Additional Melee Damage",
	"Additional Ranged Damage",
	"Additional Magic Damage",
	"Additional Energy Shield",
	"Increased Strength",
	"Increased Dexterity",
	"Increased Vitality",
	"Increased Vitality Regeneration",
	"Increased Energy Shield Regeneration",
	"Increased Speed",
	"Allied Speed ​​Boost",
	"Poison Protection for Allies",
	"Poison Protection",
	"Passive Vitality Regeneration",
	"Passive Energy Shield Regeneration",
	"Melee Damage Reflection",
	"Spell Reflection",
	"Berserk",
	"Vitality Drain",
	"Magic Drain",
	"Energy Shield Drain",
	"Additional Crush Damage",
	"Additional Slashing Damage",
	"Additional Piercing Damage",
	"Additional Fire Damage",
	"Additional Poison Damage",
	"Additional Magic Damage",
	"Additional Knockback Damage",
	"Crush Damage",
	"Cleave Damage",
	"Pierce Damage",
	"Burning Damage",
	"Poison Damage",
	"Curse Damage",
	"Choke Damage",
	"Stun",
	"Freeze",
	"Fire Wave on Damage Taken",
	"Ice Wave on Damage Taken,",
	"Poison Wave on Damage Taken",
	"Dark Wave on Damage Taken",
	"Arrow Deflection",
	"Spell Absorption",
	"Damage Ignore",
	"Area Damage Resistance",
	"Reflect Fire Damage (Melee)",
	"Reflect Magic Damage (Melee)",
	"Reflect Poison Damage (Melee)",
	"Reflect Piercing Damage (Melee)",
	"Reflect Crushing Damage (Melee)",
	"Reflect Slashing Damage (Melee)",
	"Reflect Knockback Damage (Melee)",
	"Steal Stamina",
	"Electric Wave on Damage",
	"Root Wave on Damage",
	"Concussion on Damage",
	"Bloody Rain on Damage",
	"Vitality Regeneration",
	"Energy Shield Regeneration",
	"Death Wave on Death",
	"Ice Wave on Death",
	"Fire Wave on Death",
	"Poison Wave on Death",
	"Electric Wave on Death",
	"Summon Darkness on Death",
	"Summon Demon on Death",
	"Summon Crawlers on Death",
	"Summon Wolves on Death",
	"Fire Rain on Death",
	"Icy Rain on Death",
	"Blood Rain on Death",
	"Dark Wave on Death",
	"Hexer",
	"Poisoner",
	"Slashing Damage Resistance",
	"Blending Damage Resistance",
	"Piercing Damage Resistance",
	"Magic Resistance",
	"Fire Resistance",
	"Knockback Resistance",
	"Poison Resistance",
	"Area Damage",
	"Chain Damage",
	"Furious",
	"Strong",
	"Agile",
	"Tough",
	"Tough",
	"Fast",
	"Energy Shield",
	"Dodgy",
	"Steel Skin",
	"Reflect Fire Damage (Ranged)",
	"Reflect Magic Damage (Ranged)",
	"Reflect Poison Damage (Ranged)",
	"Reflect Piercing Damage (Ranged)",
	"Reflect Blunt Damage (Ranged)",
	"Reflect Slashing Damage (Ranged)",
	"Reflect Knockback Damage (Ranged)",
	"Reflect Ranged Damage",
	"Reflect Fire Damage (from Magic)",
	"Reflect Magic Damage (from Magic)",
	"Reflect Poison Damage (from Magic)",
	"Reflect Piercing Damage (from Magic)",
	"Reflect Blunt Damage (from Magic)",
	"Reflect Slashing Damage (from Magic)",
	"Reflect Knockback Damage (from Magic)",
	"Reflect Magic Damage (from Magic)",
	"Bloodletter",
	"Summon Golems on Death",
	"Summon Animals on Death",
	"Summon Goblins on Death",
	"Summon Parasites on Death",
	"Passive Vitality Regeneration for Allies",
	"Passive Energy Shield Regeneration for Allies",
	"Shroud of Fire",
	"Shroud of Ice",
	"Shroud of Lightning",
	"Shroud of Darkness",
	"Shroud of Death",
	"Shroud of Poison",
	"Shroud of Wind",
	"Shroud of Blood",
	"Shroud of Earth",
	"Shroud of Blades",
	"Summon Skeleton Goblin",
	"Summon Fire Golem",
	"Summon Ice Golem",
	"Summon Golem",
	"Summon Skeleton",
	"Summon Wolves",
	"Summon Scavengers",
	"Summon Rats",
	"Summon Boars",
	"Summon Goblins",
	"Summon Animals",
	"Summon Demon",
	"Summon Army of Darkness",
	"Summon Stone Guardian",
	"Summon Zombie",
	"Summon Swamp Golem",
	"Summon Wood Golem",
	"Summon Glorchs",
	"Summon Blood Hornets",
	"Summon Crawlers",
	"Summon Mole Rats",
	"Summon Skeleton Archers",
	"Summon Skeleton Mages",
	"Summon Mantises",
	"Summon Ghouls",
	"Summon Field Raptors",
	"Summon Spiders",
	"Summon Monitor Lizards",
	"Teleports to self"
};

const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_LevelMod = "Random NPC power modifier based on hero level";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_KapitelMod = "Random NPC power modifier based on chapter level";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_DayMod = "Random NPC power modifier per day";

const string StExt_Str_Config_WorldRandomization_EmptyChestsUpdateCount = "Number of empty chests to update";
const string StExt_Str_Config_WorldRandomization_PutInAnyChest = "Update the stock of any chests";
const string StExt_Str_Config_WorldRandomization_LockChest = "Close chests during randomization";

const string StExt_Str_Small_Icegolem = "Small Ice Golem";
const string StExt_Str_Weak_Icegolem = "Weak Ice Golem";
const string StExt_Str_Small_Swampgolem = "Small Swamp Golem";
const string StExt_Str_Small_Firegolem = "Small Fire Golem";
const string StExt_Str_Weak_Firegolem = "Weak Fire Golem";
const string StExt_Str_Small_Stonegolem = "Small Stone Golem";
const string StExt_Str_Weak_Stonegolem = "Weak Stone Golem";

const string StExt_Str_Karma_Innos = "Innos's Karma: ";
const string StExt_Str_Karma_Beliar = "Beliar's Karma: ";
const string StExt_Str_Karma_Adanos = "Adanos's Karma: ";



// ---------------------------------------------------------------------------------
//										WIP
// ---------------------------------------------------------------------------------

const string StExt_Str_ReceiptInfo_Name[2] =
{
"",
""
};

const string StExt_Str_ReceiptInfo_Description[2] =
{
"",
""
};
