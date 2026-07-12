// Weapon seals - gemstones that imbue the equipped weapon with an offensive
// elemental spell. Used from the inventory (MAPSEALED scheme -> on_state ->
// StExt_ApplySeal), which stores the spell + power on the weapon's item
// extension (DLL). The seal then procs passively every N hits:
//   Lesser (power 60)  -> every 3rd hit
//   Normal (power 100) -> every 2nd hit
//   Greater (power 160) -> every hit
// Proc cost (mana for magic weapons, stamina otherwise) = 10 + power/10.
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
	if (StExt_ApplySeal(spl_instantfireball, 60)) { npc_removeinvitems(hero, itse_stext_seal_fire_lesser, 1); };
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
	if (StExt_ApplySeal(spl_instantfireball, 100)) { npc_removeinvitems(hero, itse_stext_seal_fire, 1); };
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
	if (StExt_ApplySeal(spl_instantfireball, 160)) { npc_removeinvitems(hero, itse_stext_seal_fire_greater, 1); };
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
	if (StExt_ApplySeal(spl_icelance, 60)) { npc_removeinvitems(hero, itse_stext_seal_ice_lesser, 1); };
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
	if (StExt_ApplySeal(spl_icelance, 100)) { npc_removeinvitems(hero, itse_stext_seal_ice, 1); };
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
	if (StExt_ApplySeal(spl_icelance, 160)) { npc_removeinvitems(hero, itse_stext_seal_ice_greater, 1); };
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
	if (StExt_ApplySeal(spl_lightningflash, 60)) { npc_removeinvitems(hero, itse_stext_seal_electric_lesser, 1); };
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
	if (StExt_ApplySeal(spl_lightningflash, 100)) { npc_removeinvitems(hero, itse_stext_seal_electric, 1); };
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
	if (StExt_ApplySeal(spl_lightningflash, 160)) { npc_removeinvitems(hero, itse_stext_seal_electric_greater, 1); };
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
	if (StExt_ApplySeal(spl_whirlwind, 60)) { npc_removeinvitems(hero, itse_stext_seal_air_lesser, 1); };
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
	if (StExt_ApplySeal(spl_whirlwind, 100)) { npc_removeinvitems(hero, itse_stext_seal_air, 1); };
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
	if (StExt_ApplySeal(spl_whirlwind, 160)) { npc_removeinvitems(hero, itse_stext_seal_air_greater, 1); };
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
	if (StExt_ApplySeal(spl_stonefirst, 60)) { npc_removeinvitems(hero, itse_stext_seal_earth_lesser, 1); };
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
	if (StExt_ApplySeal(spl_stonefirst, 100)) { npc_removeinvitems(hero, itse_stext_seal_earth, 1); };
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
	if (StExt_ApplySeal(spl_stonefirst, 160)) { npc_removeinvitems(hero, itse_stext_seal_earth_greater, 1); };
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
	if (StExt_ApplySeal(spl_palholybolt, 60)) { npc_removeinvitems(hero, itse_stext_seal_light_lesser, 1); };
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
	if (StExt_ApplySeal(spl_palholybolt, 100)) { npc_removeinvitems(hero, itse_stext_seal_light, 1); };
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
	if (StExt_ApplySeal(spl_palholybolt, 160)) { npc_removeinvitems(hero, itse_stext_seal_light_greater, 1); };
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
	if (StExt_ApplySeal(spl_darkball, 60)) { npc_removeinvitems(hero, itse_stext_seal_dark_lesser, 1); };
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
	if (StExt_ApplySeal(spl_darkball, 100)) { npc_removeinvitems(hero, itse_stext_seal_dark, 1); };
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
	if (StExt_ApplySeal(spl_darkball, 160)) { npc_removeinvitems(hero, itse_stext_seal_dark_greater, 1); };
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
	if (StExt_ApplySeal(spl_deathball, 60)) { npc_removeinvitems(hero, itse_stext_seal_death_lesser, 1); };
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
	if (StExt_ApplySeal(spl_deathball, 100)) { npc_removeinvitems(hero, itse_stext_seal_death, 1); };
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
	if (StExt_ApplySeal(spl_deathball, 160)) { npc_removeinvitems(hero, itse_stext_seal_death_greater, 1); };
};
