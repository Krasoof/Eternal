func void StExt_RestoreArmorVisual()
{
	var c_item armor;
	armor = Npc_GetEquippedArmor(hero);
	if (hlp_isitem(armor, StExt_ArmorBackUpRef))
	{		
		armor.visual_change = StExt_ArmorVisualBackup;
	}
	else
	{
		Npc_GetInvItem(hero, StExt_ArmorBackUpRef);
		if(Hlp_IsValidItem(Item))
		{
			Item.visual_change = StExt_ArmorVisualBackup;
		};
	};
	//StExt_ArmorNeedRefresh = false;
};

func void StExt_SetSkeletonSkin()
{
	var c_item armor;
	armor = Npc_GetEquippedArmor(hero);	
	
	if (!Hlp_IsValidItem(armor) || (hlp_getinstanceid(armor) == no_armor))
	{
		mdl_setvisualbody(hero, "Ske_Body", default, default, "Ske_Head", default, default, no_armor);
	}
	else
	{
		if(!hlp_isitem(armor, StExt_ArmorBackUpRef))
		{
			Npc_GetInvItem(hero, StExt_ArmorBackUpRef);
			if (hlp_isvaliditem(item)) { item.visual_change = StExt_ArmorVisualBackup; };
		};
		StExt_ArmorVisualBackup = armor.visual_change;
		StExt_ArmorBackUpRef = hlp_getinstanceid(armor);
		
		if(hlp_isitem(armor, itar_pal_l)) 
		{ armor.visual_change = "Armor_Pal_D.asc"; }
		else if((hlp_isitem(armor, itar_pal_m)) || (hlp_isitem(armor, itar_pal_m_v1)) || (hlp_isitem(armor, itar_pal_m_v12)) || (hlp_isitem(armor, itar_pal_m_v13)) || (hlp_isitem(armor, itar_pal_m_v14)) || (hlp_isitem(armor, itar_pal_m_v15)) || (hlp_isitem(armor, itar_pal_m_v2))) 
		{ armor.visual_change = "Armor_Pal_D.asc"; }
		else if((hlp_isitem(armor, itar_pal_h)) || (hlp_isitem(armor, itar_pal_h_v1)) || (hlp_isitem(armor, itar_pal_h_v12)) || (hlp_isitem(armor, itar_pal_h_v13)) || (hlp_isitem(armor, itar_pal_h_v14)) || (hlp_isitem(armor, itar_pal_h_v15)) || (hlp_isitem(armor, itar_pal_h_v2))) 
		{ armor.visual_change = "Armor_Pal_U.asc"; }		

		else if((hlp_isitem(armor, itar_smith_nov)) || (hlp_isitem(armor, itar_smith_nov_01))|| (hlp_isitem(armor, itar_smith_nov_02)) || (hlp_isitem(armor, itar_smith_nov_03)) || (hlp_isitem(armor, itar_smith_nov_04)) || (hlp_isitem(armor, itar_smith_nov_05))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if(hlp_isitem(armor, itar_alchemy_nov))
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_bau_l)) || (hlp_isitem(armor, itar_bau_m)) || (hlp_isitem(armor, itar_bau_l_trans))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if(hlp_isitem(armor, itar_vlk_l)) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_vlk_m)) || (hlp_isitem(armor, itar_vlk_matteo))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if(hlp_isitem(armor, itar_vlk_h)) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }	
		else if(hlp_isitem(armor, itar_adventure_hero)) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_djg_crawler)) || (hlp_isitem(armor, itar_djg_crawler_forged))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_leather_l)) || (hlp_isitem(armor, itar_leather_npc))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_leather_m)) || (hlp_isitem(armor, itar_leather_unick))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_bdt_m)) || (hlp_isitem(armor, itar_bdt_f)) || (hlp_isitem(armor, itar_bdt_h))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }
		else if((hlp_isitem(armor, itar_bdt_fs)) || (hlp_isitem(armor, itar_bdt_w)) || (hlp_isitem(armor, itar_bdt_v))) 
		{ armor.visual_change = "DB_Pri_Armor_M.asc"; }	
	
		else if(magearmorwithcapisup)
		{ armor.visual_change = "armor_pdead.asc"; }		
		else if(kdfheavyarmor_equipped)
		{ armor.visual_change = "Ske_priest_v03.asc"; }
		else if(novarmor_equipped)
		{ armor.visual_change = "Ske_priest_v02.asc"; }
		else if(magerobeisup)
		{ armor.visual_change = "armor_kdf_l_ske.asc"; }
		
		else if(armor.weight > 6)
		{ armor.visual_change = "darkness_knight_armor_h.asc"; }
		else if(armor.weight >= 4)
		{ armor.visual_change = "Armor_Dramthar.asc"; }
		else if(armor.weight >= 3)
		{ armor.visual_change = "Armor_Ilarah.asc"; }
		else if(armor.weight >= 2)
		{ armor.visual_change = "Armor_Skel_Wark.asc"; }
		else if(armor.weight >= 1)
		{ armor.visual_change = "ItAr_Skel_War.asc"; }
		else
		{ armor.visual_change = "Ske_Body.asc"; };
		
		mdl_setvisualbody(hero, "Ske_Body", default, default, "Ske_Head", default, default, armor);
	};

	if (hero.level >= 50) { hero.effect = "SPELLFX_REDEYES"; }
	else if (hero.level >= 30) { hero.effect = "SPELLFX_GREENEYES"; }
	else if (hero.level >= 15) { hero.effect = "SPELLFX_WHITEEYES"; }
	else { hero.effect = StExt_EmptyString; };
};

instance itar_stext_wig(c_item) 
{
    name = StExt_EmptyString;
    mainflag = item_kat_armor;
    flags = item_mission;
    value = 1;
    wear = wear_head;
    visual = "ItMi_StExt_FemaleWig.3DS";
    visual_skin = 0;
    material = mat_leather;
    description = name;
    inv_zbias = invcam_entf_helm;
    inv_animate = 1;
	setitemvartrue(itar_stext_wig, bit_item_nowisp);
};

func string StExt_GetFemaleVisual(var c_item armor)
{
	if(hlp_getinstanceid(armor) == StExt_Null) { return "FEM_NAKED.ASC"; }	
	else if(hlp_getinstanceid(armor) == no_armor) { return "FEM_NAKED.ASC"; }
	else if (!hlp_isvaliditem(armor)) { return "HUM_BODY_LUCIA.ASC"; }
	
	else if(hlp_isitem(armor, itar_poor)) { return "FEM_HERO.ASC"; }
	else if(hlp_isitem(armor, itar_her_m)) { return "FEM_PRIS.ASC"; }
	else if(hlp_isitem(armor, itar_her_n)) { return "FEM_Digger_M.ASC"; }	
	else if(hlp_isitem(armor, itar_nadja_addon)) { return "FEM_HERO.ASC"; }	
	
	else if(hlp_isitem(armor, itar_sttp_light)) { return "FEM_STTL.ASC"; }
	else if(hlp_isitem(armor, itar_sttp_light_forged)) { return "FEM_STT_L.ASC"; }
	else if(hlp_isitem(armor, itar_sttp_01)) { return "FEM_STTM.ASC"; }
	else if(hlp_isitem(armor, itar_sttp_01_forged)) { return "FEM_STTM.ASC"; }
	else if(hlp_isitem(armor, itar_dht_end_2)) { return "FEM_STT_H.ASC"; }
	else if((hlp_isitem(armor, itar_sttp_01)) || (hlp_isitem(armor, itar_sttp_01_forged)) || (hlp_isitem(armor, itar_dht_end_2))) { return "FEM_STT_H.ASC"; }
	
	else if((hlp_isitem(armor, itar_smith_nov)) || (hlp_isitem(armor, itar_smith_nov_01))|| (hlp_isitem(armor, itar_smith_nov_02)) || (hlp_isitem(armor, itar_smith_nov_03)) || (hlp_isitem(armor, itar_smith_nov_04)) || (hlp_isitem(armor, itar_smith_nov_05))) { return "Armor_BauBabe_M.ASC"; }
	else if(hlp_isitem(armor, itar_alchemy_nov)) { return "Armor_VlkBabe_H.ASC"; }	
	else if(hlp_isitem(armor, itar_prisonel)) { return "FEM_Digger_L.ASC"; }
	else if(hlp_isitem(armor, itar_prisoner)) { return "FEM_Digger_L2.ASC"; }
	else if(hlp_isitem(armor, itar_ranger_addon)) { return "FEM_RANGER_L.ASC"; }
	else if((hlp_isitem(armor, itar_ranger_addon_v1)) || (hlp_isitem(armor, itar_ranger_addon_v2))|| (hlp_isitem(armor, itar_ranger_addon_v3)) || (hlp_isitem(armor, itar_ranger_addon_v4)) || (hlp_isitem(armor, itar_ranger_addon_v5))) { return "FEM_RANGER_H.ASC"; }	
	else if((hlp_isitem(armor, itar_bau_l)) || (hlp_isitem(armor, itar_bau_m)) || (hlp_isitem(armor, itar_bau_l_trans))) { return "Armor_BauBabe_M.ASC"; }	
	else if(hlp_isitem(armor, itar_vlk_l)) { return "Armor_VlkBabe_L.ASC"; }
	else if((hlp_isitem(armor, itar_vlk_m)) || (hlp_isitem(armor, itar_vlk_matteo))) { return "FEM_VLK_L.ASC"; }
	else if(hlp_isitem(armor, itar_vlk_h)) { return "Armor_VlkBabe_M.ASC"; }
	else if(hlp_isitem(armor, itar_adventure_hero)) { return "HUM_BODY_LUCIA.ASC"; }
	else if((hlp_isitem(armor, itar_djg_crawler)) || (hlp_isitem(armor, itar_djg_crawler_forged))) { return "DJG_CRW_VEL.ASC"; }
	else if((hlp_isitem(armor, itar_leather_l)) || (hlp_isitem(armor, itar_leather_npc))) { return "FEM_LEATHER_L.ASC"; }
	else if((hlp_isitem(armor, itar_leather_m)) || (hlp_isitem(armor, itar_leather_unick))) { return "FEM_LEATHER.ASC"; }
	else if((hlp_isitem(armor, itar_bdt_m)) || (hlp_isitem(armor, itar_bdt_f)) || (hlp_isitem(armor, itar_bdt_h))) { return "FEM_BDT_L.ASC"; }
	else if((hlp_isitem(armor, itar_bdt_fs)) || (hlp_isitem(armor, itar_bdt_w)) || (hlp_isitem(armor, itar_bdt_v))) { return "FEM_BDT_H.ASC"; }	
	else if((hlp_isitem(armor, itar_grd_l)) || (hlp_isitem(armor, itar_grd_l_v1))) { return "FEM_GRD_L.ASC"; }
	else if((hlp_isitem(armor, itar_bloodwyn_addon)) || (hlp_isitem(armor, itar_bloodwyn_addon_v1))) { return "FEM_GRD_M.ASC"; }
	else if((hlp_isitem(armor, itar_thorus_addon)) || (hlp_isitem(armor, itar_bloodwyn_armor)) || (hlp_isitem(armor, itar_thorus_addon_v1))) { return "FEM_GRD_H.ASC"; }
	else if(hlp_isitem(armor, itar_pir_l_addon)) { return "FEM_PIR.ASC"; }
	else if(hlp_isitem(armor, itar_pir_m_addon)) { return "FEM_PIR_L.ASC"; }	
	else if((hlp_isitem(armor, itar_pir_h_addon)) || (hlp_isitem(armor, itar_pir_n_addon))) { return "FEM_PIR_M.ASC"; }	
	else if((hlp_isitem(armor, itar_huntarmor_01)) || (hlp_isitem(armor, itar_huntarmor_02))|| (hlp_isitem(armor, itar_huntarmor_03)) || (hlp_isitem(armor, itar_huntarmor_04))) { return "FEM_HUN_L.ASC"; }
	else if(hlp_isitem(armor, itar_hun_h)) { return "FEM_HUN_L.ASC"; }
	
	else if((hlp_isitem(armor, itar_djg_l)) || (hlp_isitem(armor, itar_djg_l_v1)) || (hlp_isitem(armor, itar_djg_l_v2)) || (hlp_isitem(armor, itar_djg_l_v3)) || (hlp_isitem(armor, itar_djg_l_v4)) || (hlp_isitem(armor, itar_djg_l_v5))) { return "FEM_DJG_L.ASC"; }
	else if((hlp_isitem(armor, itar_djg_m)) || (hlp_isitem(armor, itar_djg_m_v1)) || (hlp_isitem(armor, itar_djg_m_v2)) || (hlp_isitem(armor, itar_djg_m_v3)) || (hlp_isitem(armor, itar_djg_m_v4)) || (hlp_isitem(armor, itar_djg_m_v5))) { return "Armor_DJG_W_L.ASC"; }
	else if((hlp_isitem(armor, itar_dargonscale)) || (hlp_isitem(armor, itar_djg_h)) || (hlp_isitem(armor, itar_djg_h_v1)) || (hlp_isitem(armor, itar_djg_h_v2)) || (hlp_isitem(armor, itar_djg_h_v3)) || (hlp_isitem(armor, itar_djg_h_v4)) || (hlp_isitem(armor, itar_djg_h_v5)) || (hlp_isitem(armor, itar_dragonkiller))) { return "Armor_DJG_W_H.ASC"; }

	else if(hlp_isitem(armor, itar_orearmor)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_ilarah)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_raven_addon)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_raven_addon_tar)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_egezart)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_assasins_01)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_assasins_02)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_assasins_03)) { return "FEM_BARON.ASC"; }
	else if(hlp_isitem(armor, itar_assasins_04)) { return "FEM_BARON.ASC"; }
	
	else if((hlp_isitem(armor, itar_sld_l)) || (hlp_isitem(armor, itar_sld_l_v1)) || (hlp_isitem(armor, itar_sld_l_v2)) || (hlp_isitem(armor, itar_sld_l_v3)) || (hlp_isitem(armor, itar_sld_l_v4)) || (hlp_isitem(armor, itar_sld_l_v5))) { return "FEM_SLD_L.ASC"; }
	else if((hlp_isitem(armor, itar_sld_m)) || (hlp_isitem(armor, itar_sld_m_v1)) || (hlp_isitem(armor, itar_sld_m_v2)) || (hlp_isitem(armor, itar_sld_m_v3)) || (hlp_isitem(armor, itar_sld_m_v4)) || (hlp_isitem(armor, itar_sld_m_v5))) { return "FEM_SLD_M.ASC"; }
	else if((hlp_isitem(armor, itar_sld_h)) || (hlp_isitem(armor, itar_sld_h_v1)) || (hlp_isitem(armor, itar_sld_h_v2)) || (hlp_isitem(armor, itar_sld_h_v3)) || (hlp_isitem(armor, itar_sld_h_v4)) || (hlp_isitem(armor, itar_sld_h_v5))) { return "FEM_SLD_H.ASC"; }
	
	else if((hlp_isitem(armor, itar_mil_l)) || (hlp_isitem(armor, itar_mil_l_v1)) || (hlp_isitem(armor, itar_mil_l_v12)) || (hlp_isitem(armor, itar_mil_l_v13)) || (hlp_isitem(armor, itar_mil_l_v14)) || (hlp_isitem(armor, itar_mil_l_v15))) { return "FEM_MIL_L.ASC"; }
	else if((hlp_isitem(armor, itar_mil_m)) || (hlp_isitem(armor, itar_mil_m_v1)) || (hlp_isitem(armor, itar_mil_m_v12)) || (hlp_isitem(armor, itar_mil_m_v13)) || (hlp_isitem(armor, itar_mil_m_v14)) || (hlp_isitem(armor, itar_mil_m_v15))) { return "FEM_MIL_M.ASC"; }
	else if(hlp_isitem(armor, itar_pal_l)) { return "FEM_MIL_R.ASC"; }
	else if((hlp_isitem(armor, itar_pal_m)) || (hlp_isitem(armor, itar_pal_m_v1)) || (hlp_isitem(armor, itar_pal_m_v12)) || (hlp_isitem(armor, itar_pal_m_v13)) || (hlp_isitem(armor, itar_pal_m_v14)) || (hlp_isitem(armor, itar_pal_m_v15)) || (hlp_isitem(armor, itar_pal_m_v2))) { return "ITAR_PAL_M_FEMALE.ASC"; }
	else if((hlp_isitem(armor, itar_pal_h)) || (hlp_isitem(armor, itar_pal_h_v1)) || (hlp_isitem(armor, itar_pal_h_v12)) || (hlp_isitem(armor, itar_pal_h_v13)) || (hlp_isitem(armor, itar_pal_h_v14)) || (hlp_isitem(armor, itar_pal_h_v15)) || (hlp_isitem(armor, itar_pal_h_v2))) { return "FEM_PAL_H.ASC"; }
	
	else if(hlp_isitem(armor, itar_stext_mage_novise)) { return "FEM_KDW_N.ASC"; }	
	else if(hlp_isitem(armor, itar_ndw_l)) { return "FEM_KDW_N.ASC"; }
	else if(hlp_isitem(armor, itar_nov_l)) { return "FEM_KDF_N.ASC"; }
	else if(hlp_isitem(armor, itar_ndm_l)) { return "FEM_KDM_N.ASC"; }	
	else if((hlp_isitem(armor, itar_kdf_l)) || (hlp_isitem(armor, itar_kdf_m)) || (hlp_isitem(armor, itar_kdf_m_new))) { return "FEM_KDF_L.ASC"; }
	else if(hlp_isitem(armor, itar_kdw_l_addon)) { return "FEM_KDW_L.ASC"; }
	else if(hlp_isitem(armor, itar_dmt_l) || hlp_isitem(armor, itar_summoner_1)) { return "FEM_KDM_L.ASC"; }
	
	else if((hlp_isitem(armor, itar_kdf_h)) || (hlp_isitem(armor, itar_kdf_h_blessed))) { return "FEM_KDF_H.ASC"; }
	else if(hlp_isitem(armor, itar_kdf_sh)) { return "FEM_KDF_SH.ASC"; }
	else if((hlp_isitem(armor, itar_kdw_h)) || (hlp_isitem(armor, itar_kdw_adanos))) { return "FEM_KDW_H.ASC"; }
	else if(hlp_isitem(armor, itar_kdw_sh)) { return "FEM_KDW_SH.ASC"; }	
	else if(hlp_isitem(armor, itar_dmt_h) || hlp_isitem(armor, itar_dmt_h_beliar_1) || hlp_isitem(armor, itar_summoner_2) || hlp_isitem(armor, itar_dmt_h_beliar_3)) { return "FEM_KDM_H.ASC"; }
	else if(hlp_isitem(armor, itar_kdm_sh)) { return "FEM_KDM_SH.ASC"; }	
	else if(hlp_isitem(armor, itar_dmt_h_dem) || hlp_isitem(armor, itar_dmt_h_dem_beliar3) || hlp_isitem(armor, itar_summoner_3)) { return "FEM_KDM_H.ASC"; }
	else if(hlp_isitem(armor, itar_kdm_sh_dm) || hlp_isitem(armor, itar_arahar)) { return "FEM_KDM_SH.ASC"; }
	
	else if(hlp_isitem(armor, itar_sekbed)) { return "FEM_SEK_L.ASC"; }
	else if(hlp_isitem(armor, itar_sekbed_v1)) { return "FEM_SECT_NOV_L.ASC"; }	
	else if(hlp_isitem(armor, itar_slp_ul)) { return "FEM_SECT_NOV_L.ASC"; }
	else if(hlp_isitem(armor, itar_slp_l)) { return "FEM_SEK_M.ASC"; }
	else if(hlp_isitem(armor, itar_gur_l)) { return "FEM_GUR_L.ASC"; }
	else if(hlp_isitem(armor, itar_maya_priest)) { return "FEM_MAYAPRIEST.ASC"; }
	else if(hlp_isitem(armor, itar_gur_h)) { return "FEM_GUR_M.ASC"; }
	else if(hlp_isitem(armor, itar_gur_top)) { return "FEM_SECT_GUR_S.ASC"; }
	else if(hlp_isitem(armor, itar_gur_oran)) { return "FEM_SECT_GUR_M.ASC"; }
	else if(hlp_isitem(armor, itar_assasins_demonmage)) { return "FEM_GUR_H.ASC"; }
	
	else if(hlp_isitem(armor, itar_tpl_lst)) { return "FEM_TPL_L.ASC"; }
	else if(hlp_isitem(armor, itar_tpl_master)) { return "FEM_TPL_H.ASC"; }
	else if((hlp_isitem(armor, itar_tpl_l)) || (hlp_isitem(armor, itar_tpl_l_v1)) || (hlp_isitem(armor, itar_tpl_l_v2)) || (hlp_isitem(armor, itar_tpl_l_v3)) || (hlp_isitem(armor, itar_tpl_l_v4)) || (hlp_isitem(armor, itar_tpl_l_v5))) { return "FEM_TPL_L.ASC"; }
	else if((hlp_isitem(armor, itar_tpl_m)) || (hlp_isitem(armor, itar_tpl_m_v1)) || (hlp_isitem(armor, itar_tpl_m_v2)) || (hlp_isitem(armor, itar_tpl_m_v3)) || (hlp_isitem(armor, itar_tpl_m_v4)) || (hlp_isitem(armor, itar_tpl_m_v5))) { return "FEM_TPL_M.ASC"; }
	else if((hlp_isitem(armor, itar_tpl_s)) || (hlp_isitem(armor, itar_tpl_s_v1)) || (hlp_isitem(armor, itar_tpl_s_v2)) || (hlp_isitem(armor, itar_tpl_s_v3)) || (hlp_isitem(armor, itar_tpl_s_v4)) || (hlp_isitem(armor, itar_tpl_s_v5))) { return "FEM_TPL_S.ASC"; }
	
	else if(armor.weight >= 5) { return "FEM_BARON.ASC.ASC"; }
	else if(armor.weight >= 3) { return "DJG_CRW_VEL.ASC"; }
	else if(armor.weight >= 1) { return "HUM_BODY_LUCIA.ASC"; }
	else if(armor.weight == 0) { return "Armor_VlkBabe_L.ASC"; }
	else { return "FEM_HERO.ASC"; };
};

func void StExt_OnArmorEquip()
{
	if(!hlp_isvaliditem(StExt_Item)) { return; };
	
	if (StExt_Item.wear == wear_head) { }
	else if (StExt_Item.wear == wear_torso)
	{
		if(StExt_Config_ExtraItemsDisplayMode == StExt_ExtraItemsDisplayMode_OverlayArmor)
		{
			StExt_ArmorVisualBackup = StExt_Item.visual_change;
			StExt_ArmorBackUpRef = hlp_getinstanceid(StExt_Item);
			
			if (StExt_Config_EnableFemaleSkin) { StExt_Item.visual_change = "FEM_HERO.ASC"; }
			else if (StExt_Config_EnableSkeletonSkin)
			{
				if (StExt_Config_EnableSkeletonSkin_OnlyAtNight && StExt_IsDayTime()) { StExt_Item.visual_change = "SKE_BODY.ASC"; }
				else { StExt_Item.visual_change = "MATROSENKLEIDUNG.ASC"; };
			}
			else { StExt_Item.visual_change = "MATROSENKLEIDUNG.ASC"; };
		};
	};
};

func void StExt_SetFemaleSkin_Extra()
{
	var c_item helm;
	var string helmVisual;
	if (StExt_Config_EnableFemaleSkin_AlwaysWig)
	{
		helm = hlp_getslotitem(hero, "ZS_HELMET");
		if(hlp_isvaliditem(helm)) 
		{
			helmVisual = helm.visual_change;
			if (hlp_strcmp(helmVisual, "ItMi_IceCrown.3ds") || hlp_strcmp(helmVisual, "ITAR_SLEEPER_MASK_01.3ds") || hlp_strcmp(helmVisual, "ItAr_Hem_Yarkendar.3ds") || hlp_strcmp(helmVisual, StExt_EmptyString)) 
			{ 
				activatezsslot(hero, "BIP01 HEAD");
				ext_removefromslot(hero, "BIP01 HEAD");
				ext_putinslot(hero, "BIP01 HEAD", itar_stext_wig);
				npc_removeinvitems(hero, itar_stext_wig, npc_hasitems(hero, itar_stext_wig));
			}
			else if (StExt_Config_HideHelm)
			{
				activatezsslot(hero, "BIP01 HEAD");
				ext_removefromslot(hero, "BIP01 HEAD");
				ext_putinslot(hero, "BIP01 HEAD", itar_stext_wig);
				npc_removeinvitems(hero, itar_stext_wig, npc_hasitems(hero, itar_stext_wig));
			}
			else
			{
				activatezsslot(hero, "BIP01 HEAD");
				ext_removefromslot(hero, "BIP01 HEAD");
			};
		}
		else if (armorwithcapisup || magearmorwithcapisup)
		{
			activatezsslot(hero, "BIP01 HEAD");
			ext_removefromslot(hero, "BIP01 HEAD");
		}
		else
		{
			activatezsslot(hero, "BIP01 HEAD");
			ext_removefromslot(hero, "BIP01 HEAD");
			ext_putinslot(hero, "BIP01 HEAD", itar_stext_wig);
			npc_removeinvitems(hero, itar_stext_wig, npc_hasitems(hero, itar_stext_wig));
		};		
	};
	if (StExt_Config_EnableFemaleSkin_DemonLook)
	{
		activatezsslot(hero, "BIP01 SPINE2");
		ext_removefromslot(hero, "BIP01 SPINE2");
		ext_putinslot(hero, "BIP01 SPINE2", itar_avabul_wings);
		npc_removeinvitems(hero, itar_avabul_wings, npc_hasitems(hero, itar_avabul_wings));
	};
	
	if (npc_hasitems(hero, itar_stext_wig) > 0) { npc_removeinvitems(hero, itar_stext_wig, npc_hasitems(hero, itar_stext_wig)); };
	if (npc_hasitems(hero, itar_avabul_wings) > 0) { npc_removeinvitems(hero, itar_avabul_wings, npc_hasitems(hero, itar_avabul_wings)); };
};

func void StExt_SetFemaleSkin()
{
	var c_item armor;	
	armor = Npc_GetEquippedArmor(hero);	

	if ((hlp_getinstanceid(armor) == no_armor) || !Hlp_IsValidItem(armor))
	{ mdl_setvisualbody(hero, "FEM_NAKED", bodytexbabe_n, 0, "Hum_Head_Babe0", facebabe_n_greycloth, 0, no_armor); }
	else
	{
		if(!hlp_isitem(armor, StExt_ArmorBackUpRef))
		{
			Npc_GetInvItem(hero, StExt_ArmorBackUpRef);
			if (hlp_isvaliditem(item)) { item.visual_change = StExt_ArmorVisualBackup; };
		};
		StExt_ArmorVisualBackup = armor.visual_change;
		StExt_ArmorBackUpRef = hlp_getinstanceid(armor);
		armor.visual_change = StExt_GetFemaleVisual(armor);
		mdl_setvisualbody(hero, "FEM_NAKED", bodytexbabe_n, 0, "Hum_Head_Babe0", facebabe_n_greycloth, 0, armor);		
	};
	mdl_setmodelscale(hero, 0.98, 0.98, 0.98);
	mdl_setmodelfatness(hero, 0.5);
	rx_callback(0.01, StExt_SetFemaleSkin_Extra);
};

func void rx_applyherohead() 
{
	var c_item helm;	
	if (StExt_Config_EnableFemaleSkin)
	{
		StExt_SetFemaleSkin();
		return;
	}
	else if (StExt_Config_EnableSkeletonSkin)
	{	
		if (StExt_Config_EnableSkeletonSkin_OnlyAtNight && StExt_IsDayTime()) { }
		else
		{
			StExt_SetSkeletonSkin();		
			return;	
		};
	};
	
	if(!StExt_Config_EnableFemaleSkin)
	{
		if (StExt_Config_EnableFemaleSkin_AlwaysWig)
		{
			StExt_Config_EnableFemaleSkin_AlwaysWig = false;
			activatezsslot(hero, "BIP01 HEAD");
			ext_removefromslot(hero, "BIP01 HEAD");
		};
		if (StExt_Config_EnableFemaleSkin_DemonLook)
		{
			StExt_Config_EnableFemaleSkin_DemonLook = false;
			activatezsslot(hero, "BIP01 SPINE2");
			ext_removefromslot(hero, "BIP01 SPINE2");
		};
	};
	
	rx_applyherohead_old();
	
	if (StExt_Config_HideHelm)
	{
		helm = hlp_getslotitem(hero, "ZS_HELMET");
		if(hlp_isvaliditem(helm)) 
		{
			helm.visual = StExt_EmptyString;
			helm.visual_change = StExt_EmptyString;
		};
	};
};

func void StExt_SkinController()
{
	if (npc_isinstate(hero, zs_talk) || (!infomanager_hasfinished())) { return; };
	
	if (StExt_UpdateSkin)
	{
		rx_applyherohead();	
		StExt_UpdateSkin = false;
	};	
};