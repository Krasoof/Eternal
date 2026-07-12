// Weapon seals - gemstones that imbue the equipped weapon with an offensive
// elemental spell. Used from the inventory (on_state -> StExt_ApplySeal), which
// stores the spell + power on the weapon's item extension (DLL). The seal then
// procs passively every N hits (see StExt_TriggerWeaponSealOnHit).
//
// Visual reuses the base-game moonstone gem prototype (guaranteed to exist);
// the element is shown by the item name and by the spell it casts on proc.
// Base seal power = 100 (single tier for now; lesser/greater tiers come later).

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
