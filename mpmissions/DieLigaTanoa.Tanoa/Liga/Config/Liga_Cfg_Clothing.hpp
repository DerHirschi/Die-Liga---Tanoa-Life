class Clothing {
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
	║	File: Liga_Cfg_Clothing.hpp	
	║		
	║	Author:  Oliver  - Die Liga	
	║	Edited:  Hirschi - Die Liga	
	║			 Zoran - Die Liga	
	║	
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.4	
	╠═════════════════════════════════════════════════════════════════╗
	║
	║    ARRAY FORMAT:
	║        0: STRING (Classname)
	║        1: SCALAR (Rental Price)
	║        2: ARRAY (license required)
	║            Ex: { "driver", "trucking", "rebel" }
	║        3: ARRAY (This is for limiting items to certain things)
	║            0: Variable to read from
	║            1: Variable Value Type (SCALAR / BOOL /EQUAL)
	║            2: What to compare to (-1 = Check Disabled)
	║ 
	║
	╚═════════════════════════════════════════════════════════════════╝
*/

			//WIllkommen in der Bastabteilung, Palmenwedel für jede Hüfte!

	class UhrCloth {
		title 		= "Janinas Stammeskleidung";
		license		= "uhrspawn";
		side 		= "civ";
		uniforms[] 	= {
			{"U_I_C_Soldier_Bandit_5_F",	"Muskelshirt Deluxe",			225,	{"","",-1} 	},
			{"U_I_C_Soldier_Bandit_1_F",	"Poloshirt Gruen",				750,	{"","",-1} 	},
			{"U_I_C_Soldier_Bandit_4_F",	"Hemd (kariert)",				1075,	{"","",-1} 	},
			{"U_I_C_Soldier_Bandit_2_F",	"Totenkopfshirt",				1275,	{"","",-1} 	},
			{"U_I_C_Soldier_Bandit_3_F",	"Braunes Shirt & Jeans",		1850,	{"","",-1} 	}
			
		};
		headgear[] 	= {
			{"H_Bandanna_camo",			"Camo Bandanna",				520,	{"","",-1} 	},
			{"H_Bandanna_surfer",		"Surfer Bandanna",				530,	{"","",-1} 	},
			{"H_Bandanna_gry",			"Graues Bandanna",				550,	{"","",-1} 	},
			{"H_Bandanna_cbr",			"Braunes Bandana",				565,	{"","",-1} 	},
			{"H_Bandanna_khk",			"Khaki Bandanna",				545,	{"","",-1} 	},
			{"H_Bandanna_sgg",			"Olive Bandanna",				560,	{"","",-1} 	},
			{"H_StrawHat",				"Hirschis Strohhut",			625,	{"","",-1} 	},
			{"H_StrawHat_dark",			"Zorans Strohhut (dunkel)",		625,	{"","",-1} 	},
			{"H_Hat_blue",				"Hut Blau (kariert)",			625,	{"","",-1} 	},
			{"H_BandMask_blk",			"Cap & Bandanna",				600,	{"","",-1} 	},
			{"H_Booniehat_tan",			"Boonie Hat Sand",				625,	{"","",-1} 	},
			{"H_Booniehat_mcamo",		"Boonie Hat MTP",				625,	{"","",-1} 	},			
			{"H_Hat_brown",				"Hut Braun",					676,	{"","",-1} 	},
			{"H_Cap_blu",				"Cap Blau",						550,	{"","",-1} 	},
			{"H_Cap_grn",				"Cap Gruen",					550,	{"","",-1} 	},
			{"H_Cap_grn_BI",			"Cap Gruen BI",					550,	{"","",-1} 	},
			{"H_Cap_oli",				"Cap Olive",					550,	{"","",-1} 	},
			{"H_Cap_red",				"Cap Rot",						550,	{"","",-1} 	},
			{"H_Cap_tan",				"Cap Sand",						550,	{"","",-1} 	}
			
		};
		goggles[] = {
			{"G_Shades_Black",			"",								225,	{"","",-1} 	},
			{"G_Shades_Blue",			"",								220,	{"","",-1} 	},
			{"G_Sport_Blackred",		"",								220,	{"","",-1}	},
			{"G_Sport_Checkered",		"",								220,	{"","",-1}  },
			{"G_Sport_Blackyellow",		"",								220,	{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",								220,	{"","",-1} 	},
			{"G_Squares",				"",								210,	{"","",-1} 	},
			{"G_Aviator",				"",								400,	{"","",-1} 	},
			{"G_Lady_Mirror",			"",								250,	{"","",-1} 	},
			{"G_Lady_Dark",				"",								250,	{"","",-1} 	},
			{"G_Lady_Blue",				"",								250,	{"","",-1} 	},
			{"G_Lowprofile",			"",								230,	{"","",-1} 	},
			{"G_Combat",				"",								255,	{"","",-1} 	}
		};
		vest[] = {
			{"V_Rangemaster_belt",		"",						 		7500,	{"","",-1} 	},
			{"V_BandollierB_ghex_F",	"",							 	25500,	{"","",-1} 	}
			
			
		};
		backpack[] = {
			{"B_ViperLightHarness_khk_F",	"",								4500,	{"","",-1} 	},
			{"B_ViperLightHarness_oli_F",	"",								4500,	{"","",-1} 	},
			{"B_ViperHarness_oli_F",		"",								7500,	{"","",-1} 	},
			{"B_ViperHarness_khk_F",		"",								7500,	{"","",-1} 	},
			{"B_Bergen_hex_F",				"",								18500,	{"","",-1} 	},
			{"B_Bergen_tna_F",				"",								18500,	{"","",-1} 	}
			
		};
	};

	class UhrCloth1 {
		title 		= "Rituelle Jagdkleidung";
		license		= "uhrspawn";
		side 		= "civ";
		uniforms[] 	= {
			{"U_I_C_Soldier_Para_4_F",	"Tarnhose + Muskelshirt",			2500,	{"","",-1} 	},
			{"U_IG_Guerrilla_6_1",		"Jagdanzug gruen",					9500,	{"","",-1} 	}
			
			
		};
		headgear[] 	= {
			{"H_Booniehat_tan",			"Boonie Hat Sand",				625,	{"","",-1} 	},
			{"H_Booniehat_mcamo",		"Boonie Hat MTP",				625,	{"","",-1} 	},
			{"H_Booniehat_dirty",		"Boonie Hat Dreckig",			625,	{"","",-1} 	},
			{"H_Booniehat_oli",			"Boonie Hat Olive",				625,	{"","",-1} 	},
			{"H_Booniehat_tna_F",		"Boonie Hat Tropen",			625,	{"","",-1} 	},
			{"H_Booniehat_dgtl",		"Boonie Hat Digi Gruen",		625,	{"","",-1} 	}
			
		};
		goggles[] = {
			{"G_Shades_Black",			"",								225,	{"","",-1} 	},
			{"G_Shades_Blue",			"",								220,	{"","",-1} 	},
			{"G_Sport_Blackred",		"",								220,	{"","",-1}	},
			{"G_Sport_Checkered",		"",								220,	{"","",-1}  },
			{"G_Sport_Blackyellow",		"",								220,	{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",								220,	{"","",-1} 	},
			{"G_Squares",				"",								210,	{"","",-1} 	},
			{"G_Aviator",				"",								400,	{"","",-1} 	},
			{"G_Lady_Mirror",			"",								250,	{"","",-1} 	},
			{"G_Lady_Dark",				"",								250,	{"","",-1} 	},
			{"G_Lady_Blue",				"",								250,	{"","",-1} 	},
			{"G_Lowprofile",			"",								230,	{"","",-1} 	},
			{"G_Combat",				"",								255,	{"","",-1} 	}
		};
		vest[] = {
			{"V_Rangemaster_belt",		"",						 		7500,	{"","",-1} 	},
			{"V_BandollierB_ghex_F",	"",							 	25500,	{"","",-1} 	}
			
			
			
		};
		backpack[] = {
			{"B_ViperLightHarness_khk_F",	"",								4500,	{"","",-1} 	},
			{"B_ViperLightHarness_oli_F",	"",								4500,	{"","",-1} 	},
			{"B_ViperHarness_oli_F",		"",								7500,	{"","",-1} 	},
			{"B_ViperHarness_khk_F",		"",								7500,	{"","",-1} 	},
			{"B_Bergen_hex_F",				"",								18500,	{"","",-1} 	},
			{"B_Bergen_tna_F",				"",								18500,	{"","",-1} 	}
			
		};
	};
	class uhr_div {
		title 		= "Tanoanischer Tauchladen";
		license		= "uhrspawn";
		side 		= "civ";
		uniforms[] 	= {
			{"U_I_Wetsuit",				"Taucheranzug",						12000,	{"","",-1} 	}
			
		};
		headgear[] 	= {};
		goggles[] = {
			{"G_I_Diving",				"",								225,	{"","",-1} 	}
		};
		vest[] = {
			{"V_RebreatherB",	"",							 			5000,	{"","",-1} 	}
			
		};
		backpack[] = {
			{"B_ViperLightHarness_khk_F",	"",								4500,	{"","",-1} 	},
			{"B_ViperLightHarness_oli_F",	"",								4500,	{"","",-1} 	},
			{"B_ViperHarness_oli_F",		"",								7500,	{"","",-1} 	},
			{"B_ViperHarness_khk_F",		"",								7500,	{"","",-1} 	},
			{"B_Bergen_hex_F",				"",								18500,	{"","",-1} 	},
			{"B_Bergen_tna_F",				"",								18500,	{"","",-1} 	}			
		};
	};
	
	
			//H&Z - Die neue Hirschi & Zoran Collection. Wenn das mal nicht High Fashion ist, dann weiß ichs auch nich!
	
	class bruce {
		title 		= "H&Z Collection";
		license		= "civspawn";
		side 		= "civ";
		uniforms[] 	= {
			{"U_C_man_sport_1_F",		"Shirt + Bermuda",					550,	{"","",-1} 	},
			{"U_C_man_sport_2_F",		"Shirt + Shorts orange/schwarz",	575,	{"","",-1} 	},
			{"U_C_man_sport_3_F",		"Shirt + Shorts blau",				550,	{"","",-1} 	},
			{"U_C_Man_casual_1_F",		"Polo + Hose blau/beige",			1575,	{"","",-1} 	},
			{"U_C_Man_casual_2_F",		"Polo + Hose blau/weiß",			1525,	{"","",-1} 	},
			{"U_C_Man_casual_3_F",		"Polo + Hose gruen/braun",			1850,	{"","",-1} 	},
			{"U_C_Man_casual_4_F",		"Shirt + Shorts hellblau/grau",		750,	{"","",-1} 	},
			{"U_C_Man_casual_5_F",		"Shirt + Shorts gelb/blau",			750,	{"","",-1} 	},
			{"U_C_Man_casual_6_F",		"Shirt + Shorts orange/olive",		750,	{"","",-1} 	},
			{"U_IG_Guerilla2_1",		"Hemd + Hose blau/beige",			1150,	{"","",-1} 	},
			{"U_IG_Guerilla2_2",		"Hemd + Hose kariert/grau",			1150,	{"","",-1} 	},
			{"U_IG_Guerilla3_1",		"Jacke + Jeans ",					1335,	{"","",-1} 	},
			{"U_IG_Guerilla2_3",		"Hemd + Hose blau/gruen",			2200,	{"","",-1} 	},
			{"U_C_HunterBody_grn",		"Jagdkleidung",						2200,	{"","",-1} 	},
			{"U_C_WorkerCoveralls",		"Mechanikeroverall schmutzig",		4000,	{"","",-1} 	},
			{"U_NikosAgedBody",			"Big Boss",							5000,	{"","",-1} 	}
		};
		headgear[] 	= {
			{"H_Bandanna_camo",			"Camo Bandanna",				520,	{"","",-1} 	},
			{"H_Bandanna_surfer",		"Surfer Bandanna",				530,	{"","",-1} 	},
			{"H_Bandanna_gry",			"Grey Bandanna",				550,	{"","",-1} 	},
			{"H_Bandanna_cbr",			"",								565,	{"","",-1} 	},
			{"H_Bandanna_surfer",		"",								535,	{"","",-1} 	},
			{"H_Bandanna_khk",			"Khaki Bandanna",				545,	{"","",-1} 	},
			{"H_Bandanna_sgg",			"Sage Bandanna",				560,	{"","",-1} 	},
			{"H_StrawHat",				"Strohhut hell",				625,	{"","",-1} 	},
			{"H_BandMask_blk",			"Hat & Bandanna",				600,	{"","",-1} 	},
			{"H_Hat_blue",				"",								610,	{"","",-1} 	},
			{"H_Hat_brown",				"",								676,	{"","",-1} 	},
			{"H_Hat_checker",			"",								540,	{"","",-1} 	},
			{"H_Hat_grey",				"",								580,	{"","",-1} 	},
			{"H_Hat_tan",				"",								565,	{"","",-1} 	},
			{"H_Cap_blu",				"",								550,	{"","",-1} 	},
			{"H_Cap_grn",				"",								550,	{"","",-1} 	},
			{"H_Cap_grn_BI",			"",								550,	{"","",-1} 	},
			{"H_Cap_oli",				"",								550,	{"","",-1} 	},
			{"H_Cap_red",				"",								550,	{"","",-1} 	},
			{"H_Cap_tan",				"",								550,	{"","",-1} 	},
			{"H_Helmet_Skate",			"Arbeitsschutzhelm",			7500,	{"","",-1} 	}
		};
		goggles[] = {
			{"G_Shades_Black",			"",								225,	{"","",-1} 	},
			{"G_Shades_Blue",			"",								220,	{"","",-1} 	},
			{"G_Sport_Blackred",		"",								220,	{"","",-1}	},
			{"G_Sport_Checkered",		"",								220,	{"","",-1}  },
			{"G_Sport_Blackyellow",		"",								220,	{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",								220,	{"","",-1} 	},
			{"G_Squares",				"",								210,	{"","",-1} 	},
			{"G_Aviator",				"",								400,	{"","",-1} 	},
			{"G_Lady_Mirror",			"",								250,	{"","",-1} 	},
			{"G_Lady_Dark",				"",								250,	{"","",-1} 	},
			{"G_Lady_Blue",				"",								250,	{"","",-1} 	},
			{"G_Lowprofile",			"",								230,	{"","",-1} 	},
			{"G_Combat",				"",								255,	{"","",-1} 	}
		};
		vest[] = {
			{"V_Rangemaster_belt",		"",						 		7500,	{"","",-1} 	},
			{"V_HarnessO_brn",			"",								155000,	{"","",-1} 	},
			{"V_HarnessO_gry",			"",								155000,	{"","",-1} 	}
			
		};
		backpack[] = {
			{"B_Kitbag_mcamo",			"",								5500,	{"","",-1} 	},
			{"B_TacticalPack_oli",		"",								4000,	{"","",-1} 	},
			{"B_FieldPack_ocamo",		"",								4500,	{"","",-1} 	},
			{"B_FieldPack_ghex_F",		"",								4500,	{"","",-1} 	},
			{"B_Bergen_sgg",			"",								5500,	{"","",-1} 	},
			{"B_Kitbag_cbr",			"",								5500,	{"","",-1} 	},
			{"B_ViperLightHarness_blk_F",			"",					6500,	{"","",-1} 	},
			{"B_Carryall_oli",			"",								7500,	{"","",-1} 	},
			{"B_Carryall_khk",			"",								7500,	{"","",-1} 	}
		};
	};

			//Auf die Fresse, Lügenpresse! Und das alles von meinen GEZ-Gebühren! Schlimm, schlimm, jetzt sogar hier auf Altis....früher hätte es sowas nich gegeben!!!!!einseins11
	
	class pres {
		title 		= "Presse Ausrüstung";
		license		= "";
		side 		= "civ";
		uniforms[] 	= {
			{" U_C_Journalist",		"Journalistenkleidung",					550,	{"","",-1} 	}
			
		};
		headgear[] 	= {
			{"H_Helmet_Skate",			"Schutzhelm Krisengebiet",				7500,	{"","",-1} 	},
			{"H_Cap_press",				"Cap Presse",							250,	{"","",-1} 	}
			
		};
		goggles[] = {
			{"G_Shades_Black",			"",								225,	{"","",-1} 	},
			{"G_Shades_Blue",			"",								220,	{"","",-1} 	},
			{"G_Sport_Blackred",		"",								220,	{"","",-1}	},
			{"G_Sport_Checkered",		"",								220,	{"","",-1}  },
			{"G_Sport_Blackyellow",		"",								220,	{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",								220,	{"","",-1} 	},
			{"G_Squares",				"",								210,	{"","",-1} 	},
			{"G_Aviator",				"",								400,	{"","",-1} 	},
			{"G_Lady_Mirror",			"",								250,	{"","",-1} 	},
			{"G_Lady_Dark",				"",								250,	{"","",-1} 	},
			{"G_Lady_Blue",				"",								250,	{"","",-1} 	},
			{"G_Lowprofile",			"",								230,	{"","",-1} 	},
			{"G_Combat",				"",								255,	{"","",-1} 	}
		};
		vest[] = {
			{"V_Press_F",					"",							25000,	{"","",-1} 	}
			
		};
		backpack[] = {
			{"B_AssaultPack_cbr",		"",								3500,	{"","",-1} 	}			
		};
	};
	
			//Woop woop, thats the sound of the police!
	
	class cop {
		title 		= "Polizeikleidung";
		license 	= "";
		side 		= "cop";
		uniforms[] 	= {
			{"U_Rangemaster",				"Dienstkleidung",				1000,		{"life_coplevel","SCALAR",1} 	},
			{"U_Competitor",				"Dienstkleidung",				1000,		{"life_coplevel","SCALAR",4} 	},
			{"U_B_CombatUniform_mcam",		"Dienstkleidung",				1000,		{"life_coplevel","SCALAR",7} 	},
			{"U_B_CombatUniform_mcam_worn",	"Dienstkleidung",				1000,		{"life_coplevel","SCALAR",10} 	},
			{"U_B_Wetsuit",					"Taucheranzug",					1000,		{"life_coplevel","SCALAR",1} 	}
		};
		headgear[] = {
			{"H_Cap_police",				"Policecap",					150,		{"life_coplevel","SCALAR",1} 	},
			{"H_HelmetB_plain_blk",			"Einsatzhelm",					1500,		{"life_coplevel","SCALAR",1} 	},
			{"H_CrewHelmetHeli_B",			"Pilotenhelm",					3000,		{"life_coplevel","SCALAR",3} 	},
			{"H_Beret_blk",					"Barret Police",				150,		{"life_coplevel","SCALAR",5} 	},
			{"H_Beret_Colonel",				"Barret Chief of Police",		150,		{"life_coplevel","SCALAR",8} 	},
			{"H_Booniehat_tan",				"Buschhut",						5000,		{"life_coplevel","SCALAR",7} 	}
		};
		goggles[] = {
			{"G_B_Diving",				"",									225,		{"","",-1} 	},
			{"G_Shades_Black",			"",									225,		{"","",-1} 	},
			{"G_Shades_Blue",			"",									220,		{"","",-1} 	},
			{"G_Sport_Blackred",		"",									220,		{"","",-1} 	},
			{"G_Sport_Checkered",		"",									220,		{"","",-1} 	},
			{"G_Sport_Blackyellow",		"",									220,		{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",									220,		{"","",-1} 	},
			{"G_Squares",				"",									210,		{"","",-1} 	},
			{"G_Aviator",				"",									400,		{"","",-1} 	},
			{"G_Lady_Mirror",			"",									250,		{"","",-1} 	},
			{"G_Lady_Dark",				"",									250,		{"","",-1} 	},
			{"G_Lady_Blue",				"",									250,		{"","",-1} 	},
			{"G_Lowprofile",			"",									230,		{"","",-1} 	},
			{"G_Combat",				"",									255,		{"","",-1} 	}
		};
		vest[] = {
			{"V_TacVest_blk_POLICE",	"Polizeiweste Standard",			30000,		{"life_coplevel","SCALAR",1} 	},
			{"V_RebreatherB",			"Tauchgerät",						5000,		{"life_coplevel","SCALAR",1} 	}
		};
		backpack[] = {
			{"B_TacticalPack_blk",		"Polizeirucksack Standard",			1500,		{"life_coplevel","SCALAR",1} 	},
			{"B_Carryall_oli",			"Großer Rucksack",					5000,		{"life_coplevel","SCALAR",5} 	}
		};
	};
	
			//Bei "Rumble in the Jungle" umgehend "neun drölf drölf"  wählen! 
	
	class UhrCop {
		title 		= "Polizei Ranger";
		license 	= "";
		side 		= "cop";
		uniforms[] 	= {
			{"U_B_GEN_Soldier_F",			"Dienstkleidung",				1500,		{"life_coplevel","SCALAR",1} 	},
			{"U_B_GEN_Commander_F",			"Dienstkleidung",				2000,		{"life_coplevel","SCALAR",5} 	},
			{"U_B_Wetsuit",					"Taucheranzug",					2000,		{"life_coplevel","SCALAR",1} 	}
			
		};
		headgear[] = {
			{"H_MilCap_gen_F",				"Polizeicap",					150,		{"life_coplevel","SCALAR",1} 	},
			{"H_Beret_gen_F",				"Barret Offizier",				150,		{"life_coplevel","SCALAR",5} 	}
			
		};
		goggles[] = {
			{"G_B_Diving",				"",									225,		{"","",-1} 	},
			{"G_Shades_Black",			"",									225,		{"","",-1} 	},
			{"G_Shades_Blue",			"",									220,		{"","",-1} 	},
			{"G_Sport_Blackred",		"",									220,		{"","",-1} 	},
			{"G_Sport_Checkered",		"",									220,		{"","",-1} 	},
			{"G_Sport_Blackyellow",		"",									220,		{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",									220,		{"","",-1} 	},
			{"G_Squares",				"",									210,		{"","",-1} 	},
			{"G_Aviator",				"",									400,		{"","",-1} 	},
			{"G_Lady_Mirror",			"",									250,		{"","",-1} 	},
			{"G_Lady_Dark",				"",									250,		{"","",-1} 	},
			{"G_Lady_Blue",				"",									250,		{"","",-1} 	},
			{"G_Lowprofile",			"",									230,		{"","",-1} 	},
			{"G_Combat",				"",									255,		{"","",-1} 	}
		};
		vest[] = {
			{"V_TacVest_gen_F",			"Einsatzweste Gendamerie",			30000,		{"life_coplevel","SCALAR",1} 	},
			{"V_RebreatherB",			"Tauchgerät",						5000,		{"life_coplevel","SCALAR",1} 	}
		};
		backpack[] = {
			{"B_TacticalPack_blk",		"Polizeirucksack Standard",			1500,		{"life_coplevel","SCALAR",1} 	},
			{"B_Carryall_oli",			"Großer Rucksack",					5000,		{"life_coplevel","SCALAR",5} 	}
		};
	};

			//Ey ALAC, isch mach disch Messa!
	
	class alac {
		title		= "ALAC Kleidung";
		license 	= "";
		side 		= "alac";
		uniforms[] 	= {
			{"U_C_WorkerCoveralls",		"ALAC Uniform",					25,		{"","",-1} 	}
		};
		headgear[] = {
			{"H_Cap_brn_SPECOPS",		"",								60,		{"","",-1} 	},
			{"H_HelmetCrew_O",			"",								100,	{"","",-1} 	},
			{"H_PilotHelmetHeli_O",		"",								150,	{"","",-1} 	}
		};
		goggles[] = {
			{"G_Shades_Black",			"",								25,		{"","",-1} 	},
			{"G_Shades_Blue",			"",								20,		{"","",-1} 	},
			{"G_Sport_Blackred",		"",								20,		{"","",-1} 	},
			{"G_Sport_Checkered",		"",								20,		{"","",-1} 	},
			{"G_Sport_Blackyellow",		"",								20,		{"","",-1} 	},
			{"G_Sport_BlackWhite",		"",								20,		{"","",-1} 	},
			{"G_Aviator",				"",								75,		{"","",-1} 	},
			{"G_Squares",				"",								10,		{"","",-1} 	},
			{"G_Lowprofile",			"",								30,		{"","",-1} 	},
			{"G_Combat",				"",								55,		{"","",-1} 	}
		};
		vest[] = {
			{"V_Rangemaster_belt",		"",								300,	{"","",-1} 	}
		};
		backpack[] = {
			{"B_Bergen_mcamo",			"ALAC Rucksack",				400,	{"","",-1} 	}
		};
	};

	class dive {
		title 		= "Baskids Tauchladen";
		license 	= "dive";
		side 		= "civ";
		uniforms[] 	= {
			{"U_B_Wetsuit",				"",								12000,	{"","",-1} 	}
		};
		headgear[] = {	};
		goggles[] = {
			{"G_Diving",				"",								500,	{"","",-1} 	}
		};
		vest[] = {
			{"V_RebreatherB",			"",								5000,	{"","",-1} 	}
		};
		backpack[] = {  };
	};

	class kart {
		title 		= "Baskids Rennkleidung";
		license 	= "";
		side 		= "civ";
		uniforms[] 	= {
			{"U_C_Driver_1_black",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_1_blue",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_1_red",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_1_orange",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_1_green",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_1_white",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_1_yellow",			"",								1500,	{"","",-1} 	},
			{"U_C_Driver_2",				"",								3500,	{"","",-1} 	},
			{"U_C_Driver_1",				"",								3600,	{"","",-1} 	},
			{"U_C_Driver_3",				"",								3700,	{"","",-1} 	},
			{"U_C_Driver_4",				"",								3700,	{"","",-1} 	}
		};
		headgear[] = {
			{"H_RacingHelmet_1_black_F",	"",								1000,	{"","",-1} 	},
			{"H_RacingHelmet_1_red_F",		"",								1000,	{"","",-1} 	},
			{"H_RacingHelmet_1_white_F",	"",								1000,	{"","",-1} 	},
			{"H_RacingHelmet_1_blue_F",		"",								1000,	{"","",-1} 	},
			{"H_RacingHelmet_1_yellow_F",	"",								1000,	{"","",-1} 	},
			{"H_RacingHelmet_1_green_F",	"",								1000,	{"","",-1} 	},
			{"H_RacingHelmet_1_F",			"",								2500,	{"","",-1} 	},
			{"H_RacingHelmet_2_F",			"",								2500,	{"","",-1} 	},
			{"H_RacingHelmet_3_F",			"",								2500,	{"","",-1} 	},
			{"H_RacingHelmet_4_F",			"",								2500,	{"","",-1} 	}
		};
		goggles[] = {	};
		vest[] = {	};
		backpack[] = {	};
	};

	class med {
		title 		= "LRK Kleidung";
		license 	= "";
		side 		= "med";
		uniforms[] 	= {
			{"U_Rangemaster",				"Sanitäteruniform",				25,		{"life_mediclevel","SCALAR",1} 	},
			{"U_I_HeliPilotCoveralls",		"Notarztuniform",				250,	{"life_mediclevel","SCALAR",4} 	}
		};
		headgear[] = {
			{"H_Cap_brn_SPECOPS",			"",								60,		{"life_mediclevel","SCALAR",1} 	},
			{"H_HelmetCrew_O",				"",								100,	{"life_mediclevel","SCALAR",2} 	},
			{"H_PilotHelmetHeli_O",			"",								150,	{"life_mediclevel","SCALAR",4} 	}
		};
		goggles[] = {
			{"G_Shades_Black",				"",								25,		{"","",-1} 	},
			{"G_Shades_Blue",				"",								20,		{"","",-1} 	},
			{"G_Sport_Blackred",			"",								20,		{"","",-1} 	},
			{"G_Sport_Checkered",			"",								20,		{"","",-1} 	},
			{"G_Sport_Blackyellow",			"",								20,		{"","",-1} 	},
			{"G_Sport_BlackWhite",			"",								20,		{"","",-1} 	},
			{"G_Aviator",					"",								75,		{"","",-1} 	},
			{"G_Squares",					"",								10,		{"","",-1} 	},
			{"G_Lowprofile",				"",								30,		{"","",-1} 	},
			{"G_Combat",					"",								55,		{"","",-1} 	}
		};
		vest[] = {	};
		backpack[] = {
			{"B_TacticalPack_blk",			"Sanitäter Rucksack",			700,	{"life_mediclevel","SCALAR",1} 	},
			{"B_Bergen_mcamo",				"Notarzt Rucksack",				1200,	{"life_mediclevel","SCALAR",4} 	}
		};
	};

	class reb {
		title 		= "Gladis Selection";
		license 	= "rebel";
		side 		= "civ";
		uniforms[] 	= {
			{"U_B_T_Soldier_F",				"",								25000,		{"","",-1} 	},
			{"U_B_T_Soldier_AR_F",			"",								25000,		{"","",-1} 	},
			{"U_B_T_Soldier_SL_F",			"",								25000,		{"","",-1} 	},
			{"U_B_CTRG_Soldier_F",			"",								25000,		{"","",-1} 	},
			{"U_B_CTRG_Soldier_2_F",		"",								25000,		{"","",-1} 	},
			{"U_B_CTRG_Soldier_3_F",		"",								25000,		{"","",-1} 	},
			{"U_O_T_Soldier_F",				"",								25000,		{"","",-1} 	},
			{"U_O_T_Officer_F",				"",								25000,		{"","",-1} 	},
			{"U_I_C_Soldier_Para_1_F",		"",								25000,		{"","",-1} 	},
			{"U_I_C_Soldier_Para_2_F",		"",								25000,		{"","",-1} 	},
			{"U_I_C_Soldier_Para_3_F",		"",								25000,		{"","",-1} 	},
			{"U_I_C_Soldier_Para_5_F",		"",								25000,		{"","",-1} 	},
			{"U_B_CTRG_Soldier_urb_1_F",	"",								25000,		{"","",-1} 	},
			{"U_B_CTRG_Soldier_urb_2_F",	"",								25000,		{"","",-1} 	},
			{"U_B_CTRG_Soldier_urb_3_F",	"",								25000,		{"","",-1} 	},
			{"U_B_T_Sniper_F",				"",								75000,		{"","",-1} 	},
			{"U_O_T_Sniper_F",				"",								75000,		{"","",-1} 	},
			{"U_B_T_FullGhillie_tna_F",		"",								150000,		{"","",-1} 	},
			{"U_O_T_FullGhillie_tna_F",		"",								150000,		{"","",-1} 	},
			{"U_IG_Guerilla1_1",			"",								22000,		{"","",-1} 	},
			{"U_I_G_resistanceLeader_F",	"",								25000,		{"","",-1} 	},
			{"U_IG_leader",					"",								25500,		{"","",-1} 	},
			{"U_B_CombatUniform_mcam",		"",								25500,		{"","",-1} 	},
			{"U_B_HeliPilotCoveralls",		"",								25500,		{"","",-1} 	},
			{"U_O_PilotCoveralls",			"",								25500,		{"","",-1}	},
			{"U_B_PilotCoveralls",			"",								25500,		{"","",-1} 	},
			{"U_I_pilotCoveralls",			"",								25500,		{"","",-1} 	},
			{"U_I_HeliPilotCoveralls",		"",								25500,		{"","",-1} 	},
			{"U_O_SpecopsUniform_ocamo",	"",								25500,		{"","",-1} 	},
			{"U_O_SpecopsUniform_blk",		"",								25500,		{"","",-1} 	},
			{"U_O_OfficerUniform_ocamo",	"",								25500,		{"","",-1} 	},
			{"U_I_CombatUniform",			"",								25500,		{"","",-1} 	},
			{"U_I_CombatUniform_tshirt",	"",								25500,		{"","",-1} 	},
			{"U_I_OfficerUniform",			"",								25500,		{"","",-1} 	},
			{"U_IG_Guerilla1_1",			"",								25500,		{"","",-1} 	},
			{"U_OG_leader",					"",								25500,		{"","",-1} 	},
			{"U_BG_Guerilla2_1",			"",								25500,		{"","",-1} 	},
			{"U_OG_Guerilla2_3",			"",								25500,		{"","",-1} 	},
			{"U_O_PilotCoveralls",			"",								25500,		{"","",-1} 	},
			{"U_O_SpecopsUniform_ocamo",	"",								25500,		{"","",-1} 	},
			{"U_B_GhillieSuit",				"",								75000,		{"","",-1} 	},
			{"U_I_GhillieSuit",				"",								75000,		{"","",-1} 	},
			{"U_O_GhillieSuit",				"",								75000,		{"","",-1} 	},
			{"U_B_FullGhillie_ard",			"",								150000,		{"","",-1} 	},
			{"U_B_FullGhillie_sard",		"",								150000,		{"","",-1} 	},
			{"U_B_FullGhillie_lsh",			"",								150000,		{"","",-1} 	},
			{"U_O_FullGhillie_ard",			"",								150000,		{"","",-1} 	},
			{"U_O_FullGhillie_sard",		"",								150000,		{"","",-1} 	},
			{"U_O_FullGhillie_lsh",			"",								150000,		{"","",-1} 	},
			{"U_I_FullGhillie_ard",			"",								150000,		{"","",-1} 	},
			{"U_I_FullGhillie_sard",		"",								150000,		{"","",-1} 	},
			{"U_I_FullGhillie_lsh",			"",								150000,		{"","",-1} 	}
		};
		headgear[] = {
			{"H_Helmet_Skate",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_TI_tna_F",			"",								7500,		{"","",-1} 	},
			{"H_HelmetB_tna_F",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_Enh_tna_F",			"",								7500,		{"","",-1} 	},
			{"H_HelmetB_Light_tna_F",		"",								7500,		{"","",-1} 	},
			{"H_HelmetSpecO_ghex_F",		"",								7500,		{"","",-1} 	},
			{"H_HelmetLeaderO_ghex_F",		"",								7500,		{"","",-1} 	},
			{"H_HelmetO_ghex_F",			"",								7500,		{"","",-1} 	},
			{"H_HelmetCrew_O_ghex_F",		"",								7500,		{"","",-1} 	},
			{"H_MilCap_tna_F",				"",								7500,		{"","",-1} 	},
			{"H_MilCap_ghex_F",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB",					"",								7500,		{"","",-1} 	},
			{"H_HelmetB_camo",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_paint",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_light",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_plain_mcamo",		"",								7500,		{"","",-1} 	},
			{"H_HelmetB_plain_blk",			"",								7500,		{"","",-1} 	},
			{"H_HelmetSpecB",				"",								7500,		{"","",-1} 	},
			{"H_HelmetSpecB_paint1",		"",								7500,		{"","",-1} 	},
			{"H_HelmetSpecB_paint2",		"",								7500,		{"","",-1} 	},
			{"H_HelmetSpecB_blk",			"",								7500,		{"","",-1} 	},
			{"H_HelmetIA_camo",				"",								7500,		{"","",-1} 	},
			{"H_Helmet_Kerry",				"",								7500,		{"","",-1}	},
			{"H_HelmetB_grass",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_snakeskin",			"",								7500,		{"","",-1} 	},
			{"H_HelmetB_desert",			"",								7500,		{"","",-1} 	},
			{"H_HelmetB_black",				"",								7500,		{"","",-1} 	},
			{"H_HelmetB_sand",				"",								7500,		{"","",-1} 	},
			{"H_Cap_headphones",			"",								1800,		{"","",-1} 	},
			{"H_Cap_brn_SPECOPS",			"",								1800,		{"","",-1} 	},
			{"H_Cap_tan_specops_US",		"",								1800,		{"","",-1} 	},
			{"H_HelmetCrew_B",				"",								6000,		{"","",-1} 	},
			{"H_HelmetCrew_O",				"",								6000,		{"","",-1} 	},
			{"H_HelmetCrew_I",				"",								6000,		{"","",-1} 	},
			{"H_PilotHelmetFighter_B",		"",								6000,		{"","",-1} 	},
			{"H_PilotHelmetFighter_O",		"",								6000,		{"","",-1} 	},
			{"H_PilotHelmetFighter_I",		"",								6000,		{"","",-1} 	},
			{"H_PilotHelmetHeli_B",			"",								6000,		{"","",-1} 	},
			{"H_PilotHelmetHeli_O",			"",								6000,		{"","",-1} 	},
			{"H_PilotHelmetHeli_I",			"",								6000,		{"","",-1} 	},
			{"H_CrewHelmetHeli_B",			"",								6000,		{"","",-1} 	},
			{"H_CrewHelmetHeli_O",			"",								6000,		{"","",-1} 	},
			{"H_CrewHelmetHeli_I",			"",								6000,		{"","",-1} 	},
			{"H_HelmetO_ocamo",				"",								1800,		{"","",-1} 	},
			{"H_HelmetLeaderO_ocamo",		"",								1800,		{"","",-1} 	},
			{"H_MilCap_ocamo",				"",								1800,		{"","",-1} 	},
			{"H_MilCap_blue",				"",								1800,		{"","",-1} 	},
			{"H_HelmetB_light_grass",		"",								7500,		{"","",-1}	},
			{"H_BandMask_reaper",			"",								7500,		{"","",-1}	},
			{"H_HelmetSpecO_blk",			"",								7500,		{"","",-1}	},
			{"H_HelmetB_light_black",		"",								7500,		{"","",-1} 	},
			{"H_Bandanna_khk",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_cbr",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_sgg",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_gry",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_camo",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_mcamo",			"",								1800,		{"","",-1} 	},
			{"H_Shemag_khk",				"",								2000,		{"","",-1} 	},
			{"H_Shemag_tan",				"",								2000,		{"","",-1} 	},
			{"H_Shemag_olive",				"",								2000,		{"","",-1} 	},
			{"H_Shemag_olive_hs",			"",								2000,		{"","",-1} 	},
			{"H_ShemagOpen_khk",			"",								2000,		{"","",-1}	},
			{"H_ShemagOpen_tan",			"",								2000,		{"","",-1} 	},
			{"H_Beret_brn_SF",				"",								1900,		{"","",-1} 	},
			{"H_Beret_Colonel",				"",								1900,		{"","",-1} 	},
			{"H_Watchcap_blk",				"",								1800,		{"","",-1} 	},
			{"H_Watchcap_khk",				"",								1800,		{"","",-1} 	},
			{"H_Watchcap_camo",				"",								1800,		{"","",-1} 	},
			{"H_Watchcap_sgg",				"",								1800,		{"","",-1} 	},
			{"H_TurbanO_blk",				"",								1800,		{"","",-1} 	},
			{"H_Hat_brown",					"",								1800,		{"","",-1} 	},
			{"H_Hat_camo",					"",								1800,		{"","",-1} 	},
			{"H_Watchcap_sgg",				"",								1800,		{"","",-1} 	}
		};
		goggles[] = {
			{"G_Shades_Black",				"",								1600,		{"","",-1} 	},
			{"G_Shades_Blue",				"",								1600,		{"","",-1} 	},
			{"G_Sport_Blackred",			"",								1600,		{"","",-1} 	},
			{"G_Sport_Checkered",			"",								1600,		{"","",-1} 	},
			{"G_Sport_Blackyellow",			"",								1600,		{"","",-1} 	},
			{"G_Sport_BlackWhite",			"",								1600,		{"","",-1} 	},
			{"G_Squares",					"",								1500,		{"","",-1} 	},
			{"G_Lowprofile",				"",								1500,		{"","",-1} 	},
			{"G_Balaclava_blk",				"",								1500,		{"","",-1} 	},
			{"G_Balaclava_lowprofile",		"",								1500,		{"","",-1} 	},
			{"G_Balaclava_combat",			"",								1500,		{"","",-1} 	},
			{"G_Balaclava_oli",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_aviator",			"",								1500,		{"","",-1} 	},
			{"G_Bandanna_beast",			"",								1500,		{"","",-1} 	},
			{"G_Bandanna_tan",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_sport",			"",								1500,		{"","",-1} 	},
			{"G_Bandanna_blk",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_oli",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_shades",			"",								1500,		{"","",-1} 	},
			{"G_Combat",					"",								1600,		{"","",-1} 	}
		};
		vest[] = {
			{"V_Rangemaster_belt",			"",								10000,		{"","",-1} 	},
			{"V_BandollierB_khk",			"",								20000,		{"","",-1} 	},
			{"V_BandollierB_cbr",			"",								20000,		{"","",-1} 	},
			{"V_BandollierB_rgr",			"",								20000,		{"","",-1} 	},
			{"V_BandollierB_blk",			"",								20000,		{"","",-1} 	},
			{"V_BandollierB_oli",			"",								20000,		{"","",-1} 	},
			{"V_PlateCarrier1_rgr",			"",								30000,		{"","",-1}	},
			{"V_PlateCarrier1_tna_F",		"",								30000,		{"","",-1}	},
			{"V_PlateCarrier2_rgr",			"",								30000,		{"","",-1} 	},
			{"V_PlateCarrier2_tna_F",		"",								30000,		{"","",-1} 	},
			{"V_PlateCarrier3_rgr",			"",								30000,		{"","",-1} 	},
			{"V_PlateCarrier1_rgr_noflag_F",			"",					30000,		{"","",-1} 	},
			{"V_PlateCarrier2_rgr_noflag_F",			"",					30000,		{"","",-1} 	},
			{"V_PlateCarrier1_blk",			"",								30000,		{"","",-1} 	},
			{"V_Chestrig_khk",				"",								45000,		{"","",-1} 	},
			{"V_Chestrig_rgr",				"",								45000,		{"","",-1} 	},
			{"V_TacVest_khk",				"",								45000,		{"","",-1} 	},
			{"V_TacVest_brn",				"",								45000,		{"","",-1} 	},
			{"V_TacVest_oli",				"",								45000,		{"","",-1} 	},
			{"V_TacVest_blk",				"",								45000,		{"","",-1} 	},
			{"V_TacVest_camo",				"",								45000,		{"","",-1} 	},
			{"V_TacVestIR_blk",				"",								45000,		{"","",-1} 	},
			{"V_TacVestCamo_khk",			"",								45000,		{"","",-1} 	},
			{"V_HarnessO_ghex_F",			"",								45000,		{"","",-1} 	},
			{"V_HarnessOGL_ghex_F",			"",								45000,		{"","",-1} 	},
			{"V_HarnessOGL_gry",			"",								45000,		{"","",-1} 	},
			{"V_HarnessOSpec_brn",			"",								55000,		{"","",-1} 	},
			{"V_HarnessOSpec_gry",			"",								55000,		{"","",-1} 	},
			{"V_Chestrig_blk",				"",								60000,		{"","",-1} 	},
			{"V_Chestrig_oli",				"",								60000,		{"","",-1} 	},
			{"V_PlateCarrierIA1_dgtl",		"",								75000,		{"","",-1} 	},
			{"V_PlateCarrierSpec_rgr",		"",								75000,		{"","",-1} 	},
			{"V_PlateCarrierSpec_tna_F",	"",								75000,		{"","",-1} 	},
			{"V_PlateCarrierIA2_dgtl",		"",								75000,		{"","",-1} 	},
			{"V_PlateCarrierGL_rgr",		"",								100000,		{"","",-1} 	},
			{"V_PlateCarrierGL_tna_F",		"",								100000,		{"","",-1} 	},
			{"V_PlateCarrier_Kerry",		"",								150000,		{"","",-1} 	},
			{"V_PlateCarrierIAGL_dgtl",		"",								170000,		{"","",-1} 	}
		};
		backpack[] = {
			{"B_AssaultPack_tna_F",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_cbr",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_khk",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_dgtl",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_rgr",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_sgg",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_blk",			"",								5500,		{"","",-1} 	},
			{"B_AssaultPack_mcamo",			"",								5500,		{"","",-1} 	},			
			{"B_ViperLightHarness_blk_F",			"",						6500,		{"","",-1} 	},
			{"B_ViperLightHarness_hex_F",			"",						6500,		{"","",-1} 	},
			{"B_ViperLightHarness_ghex_F",			"",						6500,		{"","",-1} 	},
			{"B_Kitbag_mcamo",				"",								7500,		{"","",-1} 	},
			{"B_Kitbag_sgg",				"",								7500,		{"","",-1} 	},
			{"B_Kitbag_cbr",				"",								7500,		{"","",-1} 	},
			{"B_TacticalPack_oli",			"",								6500,		{"","",-1} 	},
			{"B_FieldPack_ocamo",			"",								5000,		{"","",-1} 	},
			{"B_FieldPack_ghex_F",			"",								5000,		{"","",-1} 	},
			{"B_Bergen_sgg",				"",								6500,		{"","",-1} 	},
			{"B_Bergen_mcamo",				"",								6500,		{"","",-1} 	},
			{"B_Bergen_rgr",				"",								6500,		{"","",-1} 	},
			{"B_Bergen_blk",				"",								6500,		{"","",-1}	},
			{"B_Kitbag_cbr",				"",								6500,		{"","",-1} 	},
			{"B_Carryall_ghex_F",				"",							8000,		{"","",-1}	},
			{"B_Carryall_oli",				"",								8000,		{"","",-1}	},
			{"B_Carryall_ocamo",			"",								8000,		{"","",-1} 	},
			{"B_Carryall_oucamo",			"",								8000,		{"","",-1} 	},
			{"B_Carryall_mcamo",			"",								8000,		{"","",-1} 	},
			{"B_Carryall_cbr",				"",								8000,		{"","",-1} 	},
			{"B_Carryall_khk",				"",								8000,		{"","",-1} 	}
		};
	};
	
	class rebdive {
		title 		= "Guerilla Tauchladen";
		license 	= "dive";
		side 		= "civ";
		uniforms[] 	= {
			{"U_O_Wetsuit",				"",								15000,	{"","",-1} 	}
		};
		headgear[] = {	};
		goggles[] = {
			{"G_O_Diving",				"",								1500,	{"","",-1} 	}
		};
		vest[] = {
			{"V_RebreatherIR",			"",								5000,	{"","",-1} 	}
		};
		backpack[] = {  };
	};

	class flusi {
		title 		= "Klamotten Flusi";
		license 	= "";
		side		= "civ";
		uniforms[] 	= {
			{"U_IG_Guerilla1_1",			"",								22000,		{"","",-1} 	},
			{"U_I_G_Story_Protagonist_F",	"",								20000,		{"","",-1} 	},
			{"U_I_G_resistanceLeader_F",	"",								25000,		{"","",-1} 	},
			{"U_B_HeliPilotCoveralls",		"",								25500,		{"","",-1} 	},
			{"U_I_HeliPilotCoveralls",		"",								25500,		{"","",-1} 	},
			{"U_BG_Guerilla2_1",			"",								25500,		{"","",-1}	},
			{"U_OG_Guerilla2_3",			"",								25500,		{"","",-1} 	},
			{"U_NikosAgedBody",				"Casual Wears",					5000,		{"","",-1} 	}
		};
		headgear[] = {
			{"H_Cap_marshal",				"",								1800,		{"","",-1} 	},
			{"H_Cap_headphones",			"",								1800,		{"","",-1} 	},
			{"H_Cap_brn_SPECOPS",			"",								1800,		{"","",-1} 	},
			{"H_Cap_tan_specops_US",		"",								1800,		{"","",-1} 	},
			{"H_MilCap_ocamo",				"",								1800,		{"","",-1}	},
			{"H_MilCap_blue",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_khk",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_cbr",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_sgg",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_gry",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_camo",				"",								1800,		{"","",-1} 	},
			{"H_Bandanna_mcamo",			"",								1800,		{"","",-1} 	},
			{"H_Watchcap_blk",				"",								1800,		{"","",-1} 	},
			{"H_Watchcap_khk",				"",								1800,		{"","",-1} 	},
			{"H_Watchcap_camo",				"",								1800,		{"","",-1} 	},
			{"H_Watchcap_sgg",				"",								1800,		{"","",-1} 	},
			{"H_Hat_brown",					"",								1800,		{"","",-1} 	},
			{"H_Hat_camo",					"",								1800,		{"","",-1} 	},
			{"H_Cap_blu",					"",								550,		{"","",-1} 	},
			{"H_Cap_grn",					"",								550,		{"","",-1} 	},
			{"H_Cap_grn_BI",				"",								550,		{"","",-1} 	},
			{"H_Cap_oli",					"",								550,		{"","",-1} 	},
			{"H_Cap_red",					"",								550,		{"","",-1} 	},
			{"H_Cap_tan",					"",								550,		{"","",-1} 	},
			{"H_StrawHat",					"Straw Fedora",					625,		{"","",-1} 	}
		};
		goggles[] = {
			{"G_Shades_Black",				"",								1600,		{"","",-1} 	},
			{"G_Shades_Blue",				"",								1600,		{"","",-1} 	},
			{"G_Sport_Blackred",			"",								1600,		{"","",-1} 	},
			{"G_Sport_Checkered",			"",								1600,		{"","",-1} 	},
			{"G_Sport_Blackyellow",			"",								1600,		{"","",-1} 	},
			{"G_Sport_BlackWhite",			"",								1600,		{"","",-1} 	},
			{"G_Squares",					"",								1500,		{"","",-1} 	},
			{"G_Lowprofile",				"",								1500,		{"","",-1} 	},
			{"G_Balaclava_blk",				"",								1500,		{"","",-1} 	},
			{"G_Balaclava_lowprofile",		"",								1500,		{"","",-1} 	},
			{"G_Balaclava_combat",			"",								1500,		{"","",-1} 	},
			{"G_Balaclava_oli",				"",								1500,		{"","",-1}	},
			{"G_Bandanna_aviator",			"",								1500,		{"","",-1} 	},
			{"G_Bandanna_beast",			"",								1500,		{"","",-1} 	},
			{"G_Bandanna_tan",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_sport",			"",								1500,		{"","",-1} 	},
			{"G_Bandanna_blk",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_oli",				"",								1500,		{"","",-1} 	},
			{"G_Bandanna_shades",			"",								1500,		{"","",-1} 	},
			{"G_Combat",					"",								1600,		{"","",-1} 	}
		};
		vest[] = {
			{"V_Rangemaster_belt",			"",								10000,		{"","",-1} 	}
		};
		backpack[] = {
			{"B_Carryall_oli",				"",								8000,		{"","",-1} 	},
			{"B_Carryall_cbr",				"",								8000,		{"","",-1} 	},
			{"B_Carryall_khk",				"",								8000,		{"","",-1} 	}
		};
	};
};	

class CfgKlamotten {
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
	║	File: Liga_Cfg_Clothing.hpp	
	║		
	║	Author:  Oliver  - Die Liga	
	║	Edited:  Hirschi - Die Liga	
	║			 Zoran - Die Liga	
	║	
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.4		
	╠════════════════════════════════════════════════════════════════════════════════════╗
	╚════════════════════════════════════════════════════════════════════════════════════╝
*/
	class Default {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		0;
	};		
	
	/*	Uniformen	*/

	class U_Rangemaster {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"textures\Polizei\Kleidung\PMA_shirt.jpg";
		ligatextureLRK 		= 		"textures\medic_uniform.paa";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		0;
	};

	class U_Competitor {
		ligatextureCIV 		= 		"";
		ligatextureLPD		= 		"textures\Polizei\Kleidung\PM_PHM_shirt.jpg";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		0;
	};

	class U_B_CombatUniform_mcam {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"textures\Polizei\Kleidung\BP_uniform.jpg";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		0;
	};

	class U_B_CombatUniform_mcam_worn {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"textures\Polizei\Kleidung\PAB_uniform.jpg";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		0;
	};

	class U_C_WorkerCoveralls {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"textures\ADAC\adac_uniform.jpg";
		LigaInv 			= 		0;
	};

	class U_I_HeliPilotCoveralls {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"textures\DRK\notarzt_kleidung.paa";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		0;
	};

	/*	Rucksäcke	*/

	class B_Bergen_mcamo {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"textures\DRK\notarzt_rucksack.paa";
		ligatextureALAC 	= 		"textures\ADAC\adac_backpack.paa";
		LigaInv 			= 		70;
	};	

	class B_TacticalPack_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"textures\DRK\bp_medic.jpg";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		70;
	};	
	
	class B_Bergen_hex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		90;
	};										// Ureinwohner ganz groß
	
	class B_Bergen_tna_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		90;
	};										// Ureinwohner ganz groß
	
	class B_ViperLightHarness_oli_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		36;		// Ureinwohner Viper klein
	};		
	
	class B_ViperLightHarness_khk_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		36;
	};										// Ureinwohner Viper klein	
	
	class B_ViperHarness_oli_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		56;		
	};										// Ureinwohner Viper groß
	
	class B_ViperHarness_khk_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		56;
	};										// Ureinwohner Viper groß
	
	class B_ViperLightHarness_blk_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		20;		// Ziv + Guerilla Viper klein
	};
	
	class B_ViperLightHarness_hex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		20;
	};										// Guerilla Viper klein
	
	class B_ViperLightHarness_ghex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		20;
	};										// Guerilla Viper klein
	
	class B_ViperHarness_hex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		40;
	};										// Guerilla Viper groß
	
	class B_ViperHarness_ghex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		40;
	};										// Guerilla Viper groß
	
	
	

	

	
	
	/*	Westen	*/
	
	class V_Rangemaster_belt {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		3;
	};

	class V_BandollierB_ghex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		15;
	};
	
	class V_BandollierB_khk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		7;
	};

	class V_BandollierB_cbr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		7;
	};

	class V_BandollierB_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		7;
	};

	class V_BandollierB_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		7;
	};

	class V_BandollierB_oli {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		7;
	};

	class V_Press_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		10;
	};

	class V_HarnessO_brn {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		24;
	};

	class V_PlateCarrier1_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};
	
	class V_PlateCarrier1_tna_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};

	class V_PlateCarrier2_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};
	
	class V_PlateCarrier2_tna_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};

	class V_PlateCarrier3_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};
	
	class V_PlateCarrier1_rgr_noflag_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};
	
	class V_PlateCarrier2_rgr_noflag_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};

	class V_PlateCarrier1_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		13;
	};

	class V_HarnessO_gry {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv				= 		24;
	};

	class V_Chestrig_khk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_Chestrig_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		=		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVest_khk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVest_brn {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVest_oli {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVest_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVest_camo {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVestIR_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_TacVestCamo_khk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_HarnessO_ghex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};
	
	class V_HarnessOGL_ghex_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};
	
	class V_HarnessOGL_gry {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		17;
	};

	class V_HarnessOSpec_brn {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_HarnessOSpec_gry {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_Chestrig_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv				= 		19;
	};

	class V_Chestrig_oli {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_PlateCarrierIA1_dgtl {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_PlateCarrierSpec_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};
	
	class V_PlateCarrierSpec_tna_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_PlateCarrierIA2_dgtl {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_PlateCarrierGL_rgr {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};
	
	class V_PlateCarrierGL_tna_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_PlateCarrier_Kerry {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_PlateCarrierIAGL_dgtl {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};

	class V_TacVest_blk_POLICE {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		15;
	};
	
	class V_TacVest_gen_F {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		15;
	};

	class V_PlateCarrierSpec_blk {
		ligatextureCIV 		= 		"";
		ligatextureLPD 		= 		"";
		ligatextureLRK 		= 		"";
		ligatextureALAC 	= 		"";
		LigaInv 			= 		19;
	};
};

		/* 	Was raschelt dort am Schreibtisch und wühlt in der Kommentartüte? 
			Oh, ein wilder Zoran stiert verwirrt auf die Config und hinterlässt frech seine Spuren. 
			
			(╯° ͜ʖ°）╯︵ ┻━┻ ( ͡° ͜ʖ ͡°)
			
			Wo soll das nur Enden? Villeicht mit einem seiner äußerst geistreichen Sprüche? 
			Gerne: "Und du hast sächsischen Dialekt? Zoran nicht, er hat 6 Ischen, die er leckt" 
			
			Und die diebischen Fans: ihr wisst Bescheid!
			
			Peace out*/
			

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