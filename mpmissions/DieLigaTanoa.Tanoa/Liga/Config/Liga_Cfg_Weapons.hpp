/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠══════════════════════════════════════════════════╝
	║	File: 		Liga_Cfg_Weapons.hpp	
	║		
	║	Author:  	Zoran 	- Die Liga	
	║	Edited:  	Hirschi - Die Liga
	║
	║	Vorlage:  	Tonic´s Altis Life RPG 4.4		
	║			
	╠═════════════════════════════════════════════════════════════════╗
	║    Format:
	║        level: ARRAY (This is for limiting items to certain things)
	║            0: Variable to read from
	║            1: Variable Value Type (SCALAR / BOOL / EQUAL)
	║            2: What to compare to (-1 = Check Disabled)
	║            3: Custom exit message (Optional)
	║
	║    items: { Classname, Itemname, BuyPrice, SellPrice }
	║
	║    Itemname only needs to be filled if you want to rename the original object name.
	║
	║    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	║    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
	║ 
	╚═════════════════════════════════════════════════════════════════╝
*/

	class WeaponShops {
		//Armory Shops
		
		//Uhreinwohner Waffenladen, 20 Prozent auf alles - bis auf Uhren
		class UhrWaff {
			name = "Tanoanische Waffenkammer";
			side = "civ";
			license = "lci_uhrspawn";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "hgun_Rook40_F", 									"", 		46500, 500 },
				{ "hgun_Pistol_heavy_02_F", 						"", 		47850, -1 },
				{ "arifle_AKM_F", 									"", 		425000, -1 },
				{ "arifle_AKS_F", 									"",			135000, -1 },
				{ "arifle_SDAR_F", 									"",			100000, -1 },
				{ "srifle_DMR_01_F", 								"", 		625000, 250 },
				{ "optic_ACO_grn_smg", 								"", 		3000, 250 },
				{ "optic_Yorris", 									"", 		2500, 250 },
				{ "optic_Hamr", 									"", 		10000, 250 },
				{ "optic_ERCO_khk_F", 								"", 		10000, 250 },
				{ "acc_flashlight", 								"", 		2500, 250 }
			};
			mags[] = {
				{ "16Rnd_9x21_Mag", 								"", 		450 },
				{ "6Rnd_45ACP_Cylinder", 							"", 		450 },
				{ "30Rnd_762x39_Mag_F", 							"", 		2500 },
				{ "30Rnd_762x39_Mag_Green_F", 						"", 		2500 },
				{ "30Rnd_762x39_Mag_Tracer_F", 						"", 		2500 },
				{ "30Rnd_762x39_Mag_Tracer_Green_F", 				"", 		2500 },
				
				{ "20Rnd_650x39_Cased_Mag_F", 						"", 		2500 },
				
				{ "200Rnd_556x45_Box_F", 							"", 		10000 },
				{ "200Rnd_556x45_Box_Red_F", 						"", 		10000 },
				{ "200Rnd_556x45_Box_Tracer_F", 					"", 		10000 },
				{ "200Rnd_556x45_Box_Tracer_Red_F", 				"", 		10000 },
				
				{ "150Rnd_556x45_Drum_Mag_F", 						"", 		7500 },
				{ "150Rnd_556x45_Drum_Mag_Tracer_F", 				"", 		7500 },
				
				{ "30Rnd_580x42_Mag_F", 							"", 		2500 },
				{ "30Rnd_580x42_Mag_Tracer_F", 						"", 		2500 },
				
				{ "100Rnd_580x42_Mag_F", 							"", 		5000 },
				{ "100Rnd_580x42_Mag_Tracer_F", 					"", 		5000 },
				{ "30Rnd_545x39_Mag_F", 							"", 		2500 },
				{ "30Rnd_545x39_Mag_Green_F", 						"", 		2500 },
				{ "30Rnd_545x39_Mag_Tracer_F", 						"", 		2500 },
				{ "30Rnd_545x39_Mag_Tracer_Green_F", 				"", 		2500 },
				{ "20Rnd_556x45_UW_mag", 							"", 		2500 },
				{ "10Rnd_762x54_Mag", 								"", 		2500 }
			};
		};
		
		//Zubehör Uhreinwohner
		class Uhrgenstore {
			name = "Tanoanischer Stammesbedarf";
			side = "civ";
			license = "lci_uhrspawn";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles_tna_F", 								"", 		3500, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 },
				{ "SmokeShell", 									"", 		7000, 100 },
				{ "SmokeShellGreen", 								"", 		7000, 100 },
				{ "SmokeShellPurple", 								"", 		7000, 100 },
				{ "SmokeShellBlue", 								"", 		7000, 100 },
				{ "SmokeShellOrange", 								"", 		7000, 100 },
				{ "SmokeShellRed", 									"", 		7000, 100 }
			};
			mags[] = {};
		};
		
		//Zivilisten Waffen (legal)
		class civgun {
			name = "Zorans Waffenladen - Legale Waffen";
			side = "civ";
			license = "lci_gun";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "hgun_Rook40_F", 									"", 		47500, 500 },
				{ "hgun_Pistol_heavy_02_F", 						"", 		47850, -1 },
				{ "hgun_ACPC2_F", 									"", 		47500, -1 },
				{ "hgun_PDW2000_F", 								"", 		135000, -1 },
				{ "optic_ACO_grn_smg", 								"", 		2500, 250 },
				{ "optic_Yorris", 									"", 		2500, 250 },
				{ "acc_flashlight", 								"", 		2500, 250 },
				{ "V_Rangemaster_belt", 							"", 		7500, 250 },
				{ "V_BandollierB_cbr", 								"", 		20000, 250 }
			};
			mags[] = {
				{ "16Rnd_9x21_Mag", 								"", 		450 },
				{ "6Rnd_45ACP_Cylinder", 							"", 		450 },
				{ "9Rnd_45ACP_Mag", 								"", 		450 },
				{ "30Rnd_9x21_Mag", 								"", 		750 }
				
			};
		};

		class rebel {
			name = "Guerilla Weapon Selection";
			side = "civ";
			license = "lci_reb";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "SMG_01_F", 										"",		 	75000, 2500 },
				{ "SMG_02_F", 										"",		 	85000, 2500 },
				{ "arifle_TRG21_F", 								"",		 	125000, 2500 },
				{ "arifle_TRG21_GL_F", 								"",		 	150000, 2500 },
				{ "arifle_Katiba_F", 								"", 		300000, 5000 },
				{ "arifle_Katiba_GL_F", 							"", 		325000, 5000 },
				{ "arifle_SDAR_F", 									"", 		150000, 7500 },
				{ "arifle_MX_khk_F", 								"", 		350000, 7500 },
				{ "arifle_MXC_khk_F", 								"", 		325000, 7500 },
				{ "arifle_MXM_khk_F", 								"", 		350000, 7500 },
				{ "arifle_MX_SW_khk_F", 							"", 		475000, 7500 },
				{ "arifle_MX_SW_F", 								"", 		475000, 7500 },
				{ "arifle_MX_GL_khk_F", 							"", 		375000, 7500 },
				{ "arifle_AK12_F", 									"", 		750000, 7500 },
				{ "arifle_AK12_GL_F",	 							"", 		775000, 7500 },
				{ "arifle_AKM_F", 									"", 		625000, 7500 },
				{ "arifle_AKS_F", 									"", 		155000, 7500 },
				{ "arifle_ARX_ghex_F", 								"", 		525000, 7500 },
				{ "arifle_ARX_hex_F", 								"", 		525000, 7500 },
				{ "arifle_CTAR_hex_F", 								"", 		550000, 7500 },
				{ "arifle_CTAR_GL_hex_F", 							"", 		575000, 7500 },
				{ "arifle_CTARS_hex_F", 							"", 		575000, 7500 },
				{ "arifle_CTAR_ghex_F", 							"", 		550000, 7500 },
				{ "arifle_CTAR_GL_ghex_F", 							"", 		575000, 7500 },
				{ "arifle_CTARS_ghex_F", 							"", 		575000, 7500 },
				{ "arifle_SPAR_01_khk_F", 							"", 		525000, 7500 },
				{ "arifle_SPAR_01_snd_F", 							"", 		525000, 7500 },
				{ "arifle_SPAR_01_GL_khk_F",						"", 		550000, 7500 },
				{ "arifle_SPAR_02_khk_F", 							"", 		595000, 7500 },
				{ "arifle_SPAR_02_snd_F", 							"", 		595000, 7500 },
				{ "arifle_SPAR_03_khk_F", 							"", 		600000, 7500 },
				{ "arifle_SPAR_03_snd_F", 							"", 		600000, 7500 },
				{ "LMG_03_F", 										"", 		1150000, 7500 },
				{ "LMG_Zafir_F", 									"", 		1200000, 7500 },
				{ "srifle_DMR_07_ghex_F", 							"", 		750000, 7500 },
				{ "srifle_DMR_07_hex_F", 							"", 		750000, 7500 },
				{ "srifle_DMR_06_camo_F", 							"", 		875000, 7500 },
				{ "srifle_DMR_06_olive_F", 							"", 		875000, 7500 },
				{ "srifle_EBR_F", 									"", 		950000, 7500 },
				{ "srifle_GM6_ghex_F", 								"", 		4190000, 7500 },
				{ "srifle_LRR_tna_F", 								"", 		4190000, 7500 },
				{ "optic_ACO_grn", 									"", 		6500, 350 },
				{ "optic_Holosight", 								"", 		9800, 275 },
				{ "optic_Holosight_khk_F", 							"", 		9800, 275 },
				{ "optic_Holosight_smg_blk_F", 						"", 		9800, 275 },
				{ "optic_Hamr", 									"", 		22000, -1 },
				{ "optic_Hamr_khk_F", 								"", 		22000, -1 },
				{ "optic_MRCO", 									"", 		15000, 100 },
				{ "optic_ERCO_snd_F", 								"", 		15000, 100 },
				{ "optic_Arco", 									"", 		12000, 100 },
				{ "optic_Arco_ghex_F", 								"", 		12000, 100 },
				{ "optic_SOS", 										"", 		110000, 100 },
				{ "optic_LRPS_tna_F", 								"", 		250000, 100 },
				{ "optic_LRPS_ghex_F", 								"", 		250000, 100 },
				{ "optic_AMS", 										"", 		150000, 100 },
				{ "optic_KHS_tan", 									"", 		150000, 100 },
				{ "optic_DMS", 										"", 		150000, 100 },
				{ "acc_pointer_IR", 								"", 		5000, 100 },
				{ "acc_flashlight", 								"", 		4500, 100 },
				{ "muzzle_snds_H", 									"", 		50000, 100 },
				{ "muzzle_snds_acp", 								"", 		50000, 100 },
				{ "muzzle_snds_65_TI_blk_F",		 				"", 		50000, 100 },
				{ "muzzle_snds_58_wdm_F", 							"", 		50000, 100 },
				{ "muzzle_snds_B_snd_F", 							"", 		50000, 100 },
				{ "muzzle_snds_B_khk_F", 							"", 		50000, 100 },
				{ "muzzle_snds_H_MG_khk_F", 						"", 		50000, 100 },
				{ "muzzle_snds_65_TI_ghex_F", 						"", 		50000, 100 },
				{ "muzzle_snds_65_TI_hex_F", 						"", 		50000, 100 },
				{ "muzzle_snds_L", 									"", 		50000, 100 },
				{ "muzzle_snds_M", 									"", 		50000, 100 },
				{ "muzzle_snds_H", 									"", 		50000, 100 },
				{ "muzzle_snds_B", 									"", 		50000, 100 },
				{ "bipod_01_F_mtp", 								"", 		35000, 100 },
				{ "bipod_02_F_hex", 								"", 		35000, 100 },
				{ "bipod_01_F_blk", 								"", 		35000, 100 },
				{ "bipod_02_F_tan", 								"", 		35000, 100 },
				{ "bipod_03_F_oli", 								"", 		35000, 100 },
				{ "bipod_01_F_khk", 								"", 		35000, 100 }
				
				
			};
			mags[] = {
				{ "30Rnd_9x21_Mag", 								"", 		2500 },
				{ "30Rnd_45ACP_Mag_SMG_01_tracer_green", 			"", 		2500 },
				{ "30Rnd_45ACP_Mag_SMG_01", 						"", 		2500 },
				{ "30Rnd_556x45_Stanag", 							"", 		2500 },
				{ "30Rnd_762x39_Mag_F", 							"", 		2500 },
				{ "30Rnd_762x39_Mag_Green_F", 						"", 		2500 },
				{ "30Rnd_762x39_Mag_Tracer_F", 						"", 		2500 },
				{ "30Rnd_762x39_Mag_Tracer_Green_F", 				"", 		2500 },
				
				
				{ "20Rnd_650x39_Cased_Mag_F", 						"", 		2500 },
				
				{ "200Rnd_556x45_Box_F", 							"", 		10000 },
				{ "200Rnd_556x45_Box_Red_F", 						"", 		10000 },
				{ "200Rnd_556x45_Box_Tracer_F", 					"", 		10000 },
				{ "200Rnd_556x45_Box_Tracer_Red_F", 				"", 		10000 },
				
				{ "150Rnd_556x45_Drum_Mag_F", 						"", 		7500 },
				{ "150Rnd_556x45_Drum_Mag_Tracer_F", 				"", 		7500 },
				
				{ "30Rnd_580x42_Mag_F", 							"", 		2500 },
				{ "30Rnd_580x42_Mag_Tracer_F", 						"", 		2500 },
				
				{ "100Rnd_580x42_Mag_F", 							"", 		5000 },
				{ "100Rnd_580x42_Mag_Tracer_F", 					"", 		5000 },
				
				
				{ "10Rnd_762x54_Mag", 								"", 		2500 },
				{ "30Rnd_545x39_Mag_F", 							"", 		2500 },
				{ "30Rnd_545x39_Mag_Green_F", 						"", 		2500 },
				{ "30Rnd_545x39_Mag_Tracer_Green_F", 				"", 		2500 },
				{ "30Rnd_65x39_caseless_green", 					"", 		2500 },
				{ "30Rnd_65x39_caseless_mag_Tracer",		 		"", 		2500 },
				{ "30Rnd_65x39_caseless_mag", 						"", 		2500 },
				{ "100Rnd_65x39_caseless_mag_Tracer",		 		"", 		2500 },
				{ "100Rnd_65x39_caseless_mag", 						"", 		2500 },
				{ "20Rnd_762x51_Mag", 								"", 		2500 },
				{ "150Rnd_762x54_Box", 								"", 		2500 },
				{ "150Rnd_762x54_Box_Tracer", 						"", 		2500 },
				{ "5Rnd_127x108_Mag", 								"", 		150000 },
				{ "5Rnd_127x108_APDS_Mag", 							"", 		200000 },
				{ "7Rnd_408_Mag", 									"", 		150000 },
				{ "1Rnd_Smoke_Grenade_shell", 						"", 		5000 },
				{ "1Rnd_SmokeGreen_Grenade_shell", 					"", 		5000 },
				{ "1Rnd_SmokePurple_Grenade_shell", 				"", 		5000 },
				{ "1Rnd_SmokeBlue_Grenade_shell", 					"", 		5000 },
				{ "1Rnd_SmokeOrange_Grenade_shell", 				"", 		5000 },
				{ "20Rnd_556x45_UW_mag", 							"", 		2500 }
			};
		};
		
		class rebequip {
			name = "Guerilla Krämerladen";
			side = "civ";
			license = "lci_reb";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit",		 							"", 		1500, 100 },
				{ "NVGoggles", 										"", 		3500, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 },
				{ "SmokeShell", 									"", 		7000, 100 },
				{ "SmokeShellGreen", 								"", 		7000, 100 },
				{ "SmokeShellPurple", 								"", 		7000, 100 },
				{ "SmokeShellBlue", 								"", 		7000, 100 },
				{ "SmokeShellOrange", 								"", 		7000, 100 },
				{ "SmokeShellRed", 									"", 		7000, 100 }
			};
		};

		/* class gang {
			name = "Hideout Armament";
			side = "civ";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "hgun_Rook40_F", "", 1500, 500 },
				{ "hgun_Pistol_heavy_02_F", "", 2500, -1 },
				{ "hgun_ACPC2_F", "", 4500, -1 },
				{ "hgun_PDW2000_F", "", 9500, -1 },
				{ "optic_ACO_grn_smg", "", 950, 250 }
			};
			mags[] = {
				{ "16Rnd_9x21_Mag", "", 25 },
				{ "6Rnd_45ACP_Cylinder", "", 50 },
				{ "9Rnd_45ACP_Mag", "", 45 },
				{ "30Rnd_9x21_Mag", "", 75 }
			};
		};  */  					

		//Basic Shops
		class genstore {
			name = "Zoran Logistics - Zubehör";
			side = "civ";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles", 										"", 		3500, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 },
				{ "SmokeShell", 									"", 		7000, 100 },
				{ "SmokeShellGreen", 								"", 		7000, 100 },
				{ "SmokeShellPurple", 								"", 		7000, 100 },
				{ "SmokeShellBlue", 								"", 		7000, 100 },
				{ "SmokeShellOrange", 								"", 		7000, 100 },
				{ "SmokeShellRed", 									"", 		7000, 100 }
			};
			mags[] = {};
		};
		//Partymeile
		class partystore {
			name = "Zoran Party - Zubehör";
			side = "civ";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 },
				{ "SmokeShell", 									"", 		7000, 100 },
				{ "SmokeShellGreen", 								"", 		7000, 100 },
				{ "SmokeShellPurple", 								"", 		7000, 100 },
				{ "SmokeShellBlue", 								"", 		7000, 100 },
				{ "SmokeShellOrange", 								"", 		7000, 100 },
				{ "SmokeShellRed", 									"", 		7000, 100 }
			};
			mags[] = {};
		};
		
		class tankstore {
			name = "Tanoa Petrol - Tankstellen Markt";
			side = "";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles", 										"", 		3500, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 }
			};
			mags[] = {};
		};
		
					// Zoran wieder müde, Zoran gehen ins Bett. Gute Nacht!

		//Cop Shops
		class cop_basic {
			name = "Tanoa Polizei - Grundausrüstung";
			side = "cop";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "SMG_05_F", 										"", 		80000, 7500 },
				{ "hgun_P07_snds_F", 							"Taser", 		6500, 650 },
				{ "optic_ACO_grn", 									"", 		6500, 350 },
				{ "optic_Holosight_blk_F", 							"", 		9800, 275 },
				{ "optic_ERCO_blk_F", 								"", 		15000, 100 },
				{ "acc_pointer_IR", 								"", 		5000, 100 },
				{ "acc_flashlight", 								"", 		4500, 100 },
				{ "HandGrenade_Stone", 					"Blendgranate", 		1700, -1 },
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles_OPFOR", 				"Nachtsicht schwarz",  		3000, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 },
				{ "SmokeShell", 									"", 		7000, 100 },
				{ "SmokeShellGreen", 								"", 		7000, 100 },
				{ "SmokeShellPurple", 								"", 		7000, 100 },
				{ "SmokeShellBlue", 								"", 		7000, 100 },
				{ "SmokeShellOrange", 								"", 		7000, 100 },
				{ "SmokeShellRed", 									"", 		7000, 100 }
			};
			mags[] = {
				{ "16Rnd_9x21_Mag", 								"", 		1500 },
				{ "30Rnd_9x21_Mag", 								"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02", 							"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Red", 				"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", 			"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Green", 			"", 		1500 }
				};
		};
		
		class cop_swat {
			name = "Tanoa Polizei - Spezialeinheit";
			side = "cop";
			license = "lci_swat";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "SMG_05_F", 										"", 		80000, 7500 },
				{ "hgun_P07_snds_F", 							"Taser", 		6500, 650 },
				{ "arifle_ARX_blk_F", 								"", 		525000, 7500 },
				{ "arifle_CTAR_blk_F", 								"", 		550000, 7500 },
				{ "arifle_CTAR_GL_blk_F", 							"", 		575000, 7500 },
				{ "arifle_CTARS_blk_F", 							"", 		575000, 7500 },
				{ "arifle_SPAR_01_blk_F", 							"", 		525000, 7500 },
				{ "arifle_SPAR_01_GL_blk_F",						"", 		550000, 7500 },
				{ "arifle_SPAR_02_blk_F", 							"", 		575000, 7500 },
				{ "arifle_SPAR_03_blk_F", 							"", 		600000, 7500 },
				{ "arifle_MXC_Black_F", 							"", 		325000, 7500 },
				{ "arifle_MX_Black_F", 								"", 		350000, 7500 },
				{ "arifle_MX_GL_Black_F", 							"", 		375000, 7500 },
				{ "arifle_MX_SW_Black_F", 							"", 		475000, 7500 },
				{ "arifle_MXM_Black_F", 							"", 		350000, 7500 },
				{ "srifle_DMR_07_blk_F", 							"", 		750000, 7500 },
				{ "srifle_GM6_F", 									"", 		6000000, 7500 },
				{ "srifle_LRR_F", 									"", 		60000000, 7500 },
				{ "bipod_01_F_blk", 								"", 		35000, 7500 },
				{ "optic_Holosight_blk_F", 							"", 		9800, 275 },
				{ "optic_ERCO_blk_F", 								"", 		15000, 100 },
				{ "optic_Arco_blk_F", 								"", 		12000, 100 },
				{ "optic_SOS", 										"", 		110000, 100 },
				{ "optic_LRPS", 									"", 		250000, 100 },
				{ "optic_KHS_blk", 									"", 		150000, 100 },
				{ "muzzle_snds_H", 									"", 		50000, 100 },
				{ "muzzle_snds_acp", 								"", 		50000, 100 },
				{ "muzzle_snds_65_TI_blk_F",		 				"", 		50000, 100 },
				{ "muzzle_snds_58_wdm_F", 							"", 		50000, 100 },
				{ "muzzle_snds_B_snd_F", 							"", 		50000, 100 },
				{ "muzzle_snds_B_khk_F", 							"", 		50000, 100 },
				{ "muzzle_snds_H_MG_khk_F", 						"", 		50000, 100 },
				{ "muzzle_snds_65_TI_ghex_F", 						"", 		50000, 100 },
				{ "muzzle_snds_65_TI_hex_F", 						"", 		50000, 100 },
				{ "muzzle_snds_L", 									"", 		50000, 100 },
				{ "muzzle_snds_M", 									"", 		50000, 100 },
				{ "muzzle_snds_H", 									"", 		50000, 100 },
				{ "muzzle_snds_B", 									"", 		50000, 100 },
				{ "acc_pointer_IR", 								"", 		5000, 100 },
				{ "acc_flashlight", 								"", 		4500, 100 },
				{ "HandGrenade_Stone", 					"Blendgranate", 		1700, -1 },
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles_OPFOR", 				"Nachtsicht schwarz",  		3000, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 },
				{ "SmokeShellBlue", 								"", 		7000, 100 }
				
			};
			mags[] = {
				{ "16Rnd_9x21_Mag", 								"", 		1500 },
				{ "30Rnd_9x21_Mag", 								"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02", 							"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Red", 				"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", 			"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Green", 			"", 		1500 },
				{ "30Rnd_65x39_caseless_green", 					"", 		2500 },
				{ "30Rnd_65x39_caseless_mag_Tracer",		 		"", 		2500 },
				{ "30Rnd_65x39_caseless_mag", 						"", 		2500 },
				{ "100Rnd_65x39_caseless_mag_Tracer",		 		"", 		2500 },
				{ "100Rnd_65x39_caseless_mag", 						"", 		2500 },
				{ "20Rnd_762x51_Mag", 								"", 		2500 },
				{ "150Rnd_762x54_Box", 								"", 		2500 },
				{ "150Rnd_762x54_Box_Tracer", 						"", 		2500 },
				{ "5Rnd_127x108_Mag", 								"", 		150000 },
				{ "5Rnd_127x108_APDS_Mag", 							"", 		200000 },
				{ "7Rnd_408_Mag", 									"", 		150000 },
				{ "1Rnd_SmokeBlue_Grenade_shell", 					"", 		5000 }
				
				};
		};

		/* class cop_patrol {
			name = "Tanoa Police Officer Ausrüstung";
			side = "cop";
			license = "";
			level[] = { "life_coplevel", "SCALAR", 2, "Du benötigst den Police Officer Rang!" };
			items[] = {
				{ "SMG_05_F", 										"", 		80000, 7500 },
				{ "hgun_P07_snds_F", 							"Taser", 		6500, 650 },
				{ "HandGrenade_Stone", 					"Blendgranate", 		1700, -1 },
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles_OPFOR", 				"Nachtsicht schwarz",  		3000, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "Chemlight_green", 								"", 		350, 100 },
				{ "Chemlight_blue", 								"", 		350, 100 }
				
			};
			mags[] = {
				{ "16Rnd_9x21_Mag", 								"", 		1500 },
				{ "30Rnd_9x21_Mag", 								"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02", 							"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Red", 				"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", 			"", 		1500 },
				{ "30Rnd_9x21_Mag_SMG_02_Tracer_Green", 			"", 		1500 }
				
			};
		}; */

		/* class cop_sergeant {
			name = "Tanoa Sergeant Officer Shop";
			side = "cop";
			license = "";
			level[] = { "life_coplevel", "SCALAR", 3, "Du benötigst den Sergeant Rang!" };
			items[] = {
				{ "hgun_ACPC2_F", "", 17500, -1 },
				{ "SMG_02_ACO_F", "", 15000, -1 },
				{ "arifle_MXC_F", "", 30000, 5000 },
				{ "HandGrenade_Stone", "Flashbang", 1700, -1 },
				{ "optic_Arco", "", 2500, -1 },
				{ "muzzle_snds_H", "", 2750, -1 }
			};
			mags[] = {
				{ "9Rnd_45ACP_Mag", "", 200 },
				{ "30Rnd_9x21_Mag", "", 60 },
				{ "30Rnd_65x39_caseless_mag", "", 100, -1 }
			};
		}; */

		//LRK Shops
		class med_basic {
			name = "Medizinisches Zubehör";
			side = "med";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		5500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "Medikit", 										"", 		2500, 100 },
				{ "NVGoggles", 										"", 		3500, 100 },
				{ "Binocular", 										"", 		3000, 100 },
				{ "ItemGPS", 										"", 		3500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_red", 									"", 		350, 100 },
				{ "SmokeShellRed", 									"", 		7000, 100 }
				
			};
			mags[] = {};
		};
		
		//ALAC Shops
		class adac_basic {
			name = "ALAC Zubehör";
			side = "alac";
			license = "";
			level[] = { "", "", -1, "" };
			items[] = {
				{ "ToolKit", 										"", 		1500, 100 },
				{ "FirstAidKit", 									"", 		1500, 100 },
				{ "NVGoggles", 										"", 		1500, 100 },
				{ "Binocular", 										"", 		1500, 100 },
				{ "ItemGPS", 										"", 		1500, 100 },
				{ "ItemMap", 										"", 		200, 100 },
				{ "ItemCompass", 									"", 		200, 100 },
				{ "ItemRadio", 										"", 		200, 100 },
				{ "ItemWatch", 										"", 		200, 100 },
				{ "Chemlight_yellow", 								"", 		350, 100 },
				{ "SmokeShellYellow", 								"", 		3000, 100 }
			};
			mags[] = {};
		};
	};	
/*
|<-
*/	
class WeaponWH {
	class WH_1 {	/* Platz für mehrere Configs (WH_1,WH_2 usw.) */
		/*	Waffen	*/
				SMG_02_F[]					=	{"c2"	,	6	};
				SMG_01_F[]					=	{"c2"	,	6	};
				arifle_TRG21_GL_F[]			=	{"c2"	,	6	};
				arifle_TRG21_F[]			=	{"c2"	,	6	};
				arifle_AKS_F[]				=	{"c2"	,	6	};
				arifle_Mk20_F[]				=	{"c2"	,	6	};
				arifle_Mk20C_F[]			=	{"c2"	,	6	};
				arifle_SDAR_F[]				=	{"c2"	,	8	};
				arifle_MXC_F[]				=	{"c2"	,	10	};
				arifle_MXC_khk_F[]			=	{"c2"	,	10	};
				arifle_MX_F[]				=	{"c2"	,	14	};
				arifle_MX_khk_F[]			=	{"c2"	,	14	};
				arifle_Katiba_C_F[]			=	{"c2"	,	15	};
				arifle_Katiba_F[]			=	{"c2"	,	15	};
				arifle_Katiba_GL_F[]		=	{"c2"	,	15	};
				arifle_MXM_F[]				=	{"c2"	,	15	};
				arifle_MXM_khk_F[]			=	{"c2"	,	15	};
				arifle_MX_SW_F[]			=	{"c2"	,	18	};
				arifle_MX_SW_khk_F[]		=	{"c2"	,	18	};
				arifle_MX_GL_khk_F[]		=	{"c2"	,	18	};
				arifle_AKM_F[]				=	{"c2"	,	21	};
				srifle_EBR_F[]				=	{"c2"	,	21	};
				arifle_AK12_F[]				=	{"c2"	,	25	};
				arifle_AK12_GL_F[]			=	{"c2"	,	25	};
				LMG_Zafir_F[]				=	{"c2"	,	53	};
				srifle_DMR_01_F[]			=	{"c2"	,	30	};
				srifle_DMR_06_olive_F[]		=	{"c2"	,	30	};
				srifle_DMR_06_camo_F[]		=	{"c2"	,	30	};
				srifle_DMR_07_hex_F[]		=	{"c2"	,	30	};
				srifle_DMR_07_ghex_F[]		=	{"c2"	,	30	};
				LMG_03_F[]					=	{"c2"	,	30	};
				arifle_ARX_ghex_F[]			=	{"c2"	,	30	};
				arifle_ARX_hex_F[]			=	{"c2"	,	30	};
				arifle_CTAR_hex_F[]			=	{"c2"	,	30	};
				arifle_CTAR_GL_hex_F[]		=	{"c2"	,	30	};
				arifle_CTARS_hex_F[]		=	{"c2"	,	30	};
				arifle_CTAR_ghex_F[]		=	{"c2"	,	30	};
				arifle_CTAR_GL_ghex_F[]		=	{"c2"	,	30	};
				arifle_CTARS_ghex_F[]		=	{"c2"	,	30	};
				srifle_DMR_03_F[]			=	{"c2"	,	34	};
				arifle_SPAR_01_khk_F[]		=	{"c2"	,	34	};
				arifle_SPAR_01_snd_F[]		=	{"c2"	,	34	};
				arifle_SPAR_01_GL_khk_F[]	=	{"c2"	,	34	};
				arifle_SPAR_02_khk_F[]		=	{"c2"	,	37	};
				arifle_SPAR_02_snd_F[]		=	{"c2"	,	37	};
				arifle_SPAR_03_khk_F[]		=	{"c2"	,	39	};
				arifle_SPAR_03_snd_F[]		=	{"c2"	,	39	};
				srifle_DMR_02_F[]			=	{"c2"	,	42	};
				MMG_02_black_F[]			=	{"c2"	,	57	};
				srifle_DMR_05_blk_F[]		=	{"c2"	,	48	};
				MMG_01_hex_F[]				=	{"c2"	,	60	};
				srifle_DMR_04_F[]			=	{"c2"	,	54	};
				srifle_GM6_F[]				=	{"c2"	,	65	};
				srifle_LRR_F[]				=	{"c2"	,	65	};
				srifle_LRR_tna_F[]				=	{"c2"	,	65	};
				srifle_GM6_ghex_F[]				=	{"c2"	,	65	};
			/*	Alte Config ENDE */
			
			
			/* Munition */
				
				
				200Rnd_556x45_Box_F[]					=	{"c1"	,	5	};
				200Rnd_556x45_Box_Red_F[]				=	{"c1"	,	6	};
				200Rnd_556x45_Box_Tracer_F[]			=	{"c1"	,	6	};
				200Rnd_556x45_Box_Tracer_Red_F[]		=	{"c1"	,	6	};
				
				20Rnd_650x39_Cased_Mag_F[]				=	{"c1"	,	1	};
				
				30Rnd_580x42_Mag_F[]					=	{"c1"	,	1	};
				30Rnd_580x42_Mag_Tracer_F[]				=	{"c1"	,	1	};
				
				30Rnd_45ACP_Mag_SMG_01_tracer_green[]	=	{"c1"	,	1	};
				30Rnd_45ACP_Mag_SMG_01[]				=	{"c1"	,	1	};
				30Rnd_556x45_Stanag_Tracer_Red[]		=	{"c1"	,	2	};
				30Rnd_556x45_Stanag_Tracer_Green[]		=	{"c1"	,	2	};
				30Rnd_556x45_Stanag_Tracer_Yellow[]		=	{"c1"	,	2	};
				30Rnd_556x45_Stanag[]					=	{"c1"	,	2	};
				20Rnd_556x45_UW_mag[]					=	{"c1"	,	2	};
				30Rnd_65x39_caseless_green[]			=	{"c1"	,	3	};
				30Rnd_65x39_caseless_mag_Tracer[]		=	{"c1"	,	3	};
				30Rnd_65x39_caseless_mag[]				=	{"c1"	,	3	};
				100Rnd_65x39_caseless_mag_Tracer[]		=	{"c1"	,	3	};
				100Rnd_65x39_caseless_mag[]				=	{"c1"	,	3	};
				
				150Rnd_556x45_Drum_Mag_F[]					=	{"c1"	,	4	};
				150Rnd_556x45_Drum_Mag_Tracer_F[]			=	{"c1"	,	3	};
				
				10Rnd_762x54_Mag[]						=	{"c1"	,	3	};
				20Rnd_762x51_Mag[]						=	{"c1"	,	3	};
				30Rnd_762x39_Mag_F[]					=	{"c1"	,	3	};
				30Rnd_762x39_Mag_Green_F[]				=	{"c1"	,	3	};
				30Rnd_762x39_Mag_Tracer_F[]				=	{"c1"	,	3	};
				30Rnd_762x39_Mag_Tracer_Green_F[]		=	{"c1"	,	3	};
				150Rnd_762x54_Box[]						=	{"c1"	,	5	};
				150Rnd_762x54_Box_Tracer[]				=	{"c1"	,	3	};
				
			
				
				10Rnd_338_Mag[]							=	{"c1"	,	8	};
				130Rnd_338_Mag[]						=	{"c1"	,	10	};
				150Rnd_93x64_Mag[]						=	{"c1"	,	12	};
				10Rnd_93x64_DMR_05_Mag[]				=	{"c1"	,	10	};
				10Rnd_127x54_Mag[]						=	{"c1"	,	12	};
				5Rnd_127x108_Mag[]						=	{"c1"	,	12	};
				5Rnd_127x108_APDS_Mag[]					=	{"c1"	,	13	};
				7Rnd_408_Mag[]							=	{"c1"	,	10	};
			/*	Alte Config ENDE */		
		
	};
};


		/* 	Zoran haben viel Spaß gehabt, Waffen machen "peng", Opfer machen "spritz", feini fein, so solls sein. 
			Oder wie mein geistiger (natürlich nur pro forma) Bruder "Kollegah" sagen würde:
			"Impulse meiner total kühlen Koka-Psyche gelangen über hochaktive Synapsen und Neuronen an meine Großhirndrüse,
			führen über Muskelstränge zur Krümmung von zwei an chromverzierten Pistolenabzügen befindlichen Zeigefingern, 
			die dich mit Schrot durchsieben" 
			
			Und auch hier noch der Hinweis an unsere diebischen Fans: Wir lieben Euch! */

/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╚══════════════════════════════════════════════════╝
*/	