// Weapon seals - gemstones that imbue the equipped weapon with an offensive
// elemental spell. Used from the inventory (MAPSEALED scheme -> on_state ->
// StExt_ApplySeal), which stores the spell + power on the weapon's item
// extension (DLL). The seal then procs passively every N hits, where
// N = 6 - power/80, clamp 2..6 (StExt_GetSealProcInterval - JEDYNE zrodlo
// prawdy, wolane tez przez tooltip):
//   Lesser (power 60)  -> every 6th hit
//   Normal (power 100) -> every 5th hit
//   Greater (power 160) -> every 4th hit (rosnie z levelem pieczeci)
// Proc cost: ZAWSZE mana (proc castuje spell), % MAX many:
// permille = 15 + power/8 (clamp 15..60), floor 10 pkt - patrz
// StExt_PaySealCost. Flat kosztow tu nie ma (kanon: % max, nigdy flat).
// Visual reuses the base-game moonstone gem prototype.

instance itse_stext_seal_fire_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Fire_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_fire_lesser;
};
func void use_itse_stext_seal_fire_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Fire, 60)) { npc_removeinvitems(hero, itse_stext_seal_fire_lesser, 1); };
};

instance itse_stext_seal_fire(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Fire_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_fire;
};
func void use_itse_stext_seal_fire()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Fire, 100)) { npc_removeinvitems(hero, itse_stext_seal_fire, 1); };
};

instance itse_stext_seal_fire_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Fire_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_fire_greater;
};
func void use_itse_stext_seal_fire_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Fire, 160)) { npc_removeinvitems(hero, itse_stext_seal_fire_greater, 1); };
};

instance itse_stext_seal_ice_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Ice_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_ice_lesser;
};
func void use_itse_stext_seal_ice_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Ice, 60)) { npc_removeinvitems(hero, itse_stext_seal_ice_lesser, 1); };
};

instance itse_stext_seal_ice(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Ice_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_ice;
};
func void use_itse_stext_seal_ice()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Ice, 100)) { npc_removeinvitems(hero, itse_stext_seal_ice, 1); };
};

instance itse_stext_seal_ice_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Ice_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_ice_greater;
};
func void use_itse_stext_seal_ice_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Ice, 160)) { npc_removeinvitems(hero, itse_stext_seal_ice_greater, 1); };
};

instance itse_stext_seal_electric_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Electric_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_electric_lesser;
};
func void use_itse_stext_seal_electric_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Electric, 60)) { npc_removeinvitems(hero, itse_stext_seal_electric_lesser, 1); };
};

instance itse_stext_seal_electric(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Electric_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_electric;
};
func void use_itse_stext_seal_electric()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Electric, 100)) { npc_removeinvitems(hero, itse_stext_seal_electric, 1); };
};

instance itse_stext_seal_electric_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Electric_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_electric_greater;
};
func void use_itse_stext_seal_electric_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Electric, 160)) { npc_removeinvitems(hero, itse_stext_seal_electric_greater, 1); };
};

instance itse_stext_seal_air_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Air_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_air_lesser;
};
func void use_itse_stext_seal_air_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Air, 60)) { npc_removeinvitems(hero, itse_stext_seal_air_lesser, 1); };
};

instance itse_stext_seal_air(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Air_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_air;
};
func void use_itse_stext_seal_air()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Air, 100)) { npc_removeinvitems(hero, itse_stext_seal_air, 1); };
};

instance itse_stext_seal_air_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Air_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_air_greater;
};
func void use_itse_stext_seal_air_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Air, 160)) { npc_removeinvitems(hero, itse_stext_seal_air_greater, 1); };
};

instance itse_stext_seal_earth_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Earth_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_earth_lesser;
};
func void use_itse_stext_seal_earth_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Earth, 60)) { npc_removeinvitems(hero, itse_stext_seal_earth_lesser, 1); };
};

instance itse_stext_seal_earth(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Earth_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_earth;
};
func void use_itse_stext_seal_earth()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Earth, 100)) { npc_removeinvitems(hero, itse_stext_seal_earth, 1); };
};

instance itse_stext_seal_earth_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Earth_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_earth_greater;
};
func void use_itse_stext_seal_earth_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Earth, 160)) { npc_removeinvitems(hero, itse_stext_seal_earth_greater, 1); };
};

instance itse_stext_seal_light_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Light_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_light_lesser;
};
func void use_itse_stext_seal_light_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Light, 60)) { npc_removeinvitems(hero, itse_stext_seal_light_lesser, 1); };
};

instance itse_stext_seal_light(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Light_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_light;
};
func void use_itse_stext_seal_light()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Light, 100)) { npc_removeinvitems(hero, itse_stext_seal_light, 1); };
};

instance itse_stext_seal_light_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Light_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_light_greater;
};
func void use_itse_stext_seal_light_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Light, 160)) { npc_removeinvitems(hero, itse_stext_seal_light_greater, 1); };
};

instance itse_stext_seal_dark_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Dark_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_dark_lesser;
};
func void use_itse_stext_seal_dark_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Dark, 60)) { npc_removeinvitems(hero, itse_stext_seal_dark_lesser, 1); };
};

instance itse_stext_seal_dark(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Dark_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_dark;
};
func void use_itse_stext_seal_dark()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Dark, 100)) { npc_removeinvitems(hero, itse_stext_seal_dark, 1); };
};

instance itse_stext_seal_dark_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Dark_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_dark_greater;
};
func void use_itse_stext_seal_dark_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Dark, 160)) { npc_removeinvitems(hero, itse_stext_seal_dark_greater, 1); };
};

instance itse_stext_seal_death_lesser(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Death_Lesser_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 800;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_death_lesser;
};
func void use_itse_stext_seal_death_lesser()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Death, 60)) { npc_removeinvitems(hero, itse_stext_seal_death_lesser, 1); };
};

instance itse_stext_seal_death(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Death_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 1500;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_death;
};
func void use_itse_stext_seal_death()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Death, 100)) { npc_removeinvitems(hero, itse_stext_seal_death, 1); };
};

instance itse_stext_seal_death_greater(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Death_Greater_Name;
	description = name;
	text[1] = StExt_Str_Seal_Desc;
	value = 3000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_death_greater;
};
func void use_itse_stext_seal_death_greater()
{
	if (StExt_ApplySeal(StExt_MasteryIndex_Death, 160)) { npc_removeinvitems(hero, itse_stext_seal_death_greater, 1); };
};

// --- Physical seals: fit any weapon, no element matching ---

instance itse_stext_seal_bleed(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Bleed_Name;
	description = name;
	text[1] = StExt_Str_Seal_Phys_Desc;
	value = 2000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_bleed;
};
func void use_itse_stext_seal_bleed()
{
	if (StExt_ApplyPhysSeal(StExt_PhysSeal_Bleed, 100)) { npc_removeinvitems(hero, itse_stext_seal_bleed, 1); };
};

instance itse_stext_seal_pierce(c_item)
{
	itmi_moonstone_old();
	name = StExt_Str_Seal_Pierce_Name;
	description = name;
	text[1] = StExt_Str_Seal_Phys_Desc;
	value = 2000;
	scemename = "MAPSEALED";
	inv_animate = 1;
	on_state = use_itse_stext_seal_pierce;
};
func void use_itse_stext_seal_pierce()
{
	if (StExt_ApplyPhysSeal(StExt_PhysSeal_Pierce, 100)) { npc_removeinvitems(hero, itse_stext_seal_pierce, 1); };
};
