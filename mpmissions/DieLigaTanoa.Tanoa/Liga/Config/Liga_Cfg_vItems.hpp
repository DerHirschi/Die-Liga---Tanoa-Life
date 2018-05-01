class LigaGather {
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
	║	File: Liga_Cfg_vItems.hpp	
	║		
	║	Author:  Hirschi - Die Liga		
	╠═════════════════════════════════════════════════════════════════╗
	║	Das wäre was für Graf Zahl hier .....
	╚═════════════════════════════════════════════════════════════════╝
*/
	class Zones {
		gather[]  	= {
			"kokus_1",
			"kokus_2",
			"susska_1",
			"susska_2",
			"susska_3",
			"ana_1",
			"cocaine_1",
			"weed_1",
			"meth_1",
			"lsd_1",
			"schild_1",
			"korall_1",
			"perle_1",
			"kaffe_1",
			"heroin_1",
			"Tee_1",
			"natur_1",
			"salz_1"
		};
		machete[]		= {"Palmenplantage_1","Zuckerrohr_1","Kakaoplantage_1","kautschuk_1","bana_1"};
		axt[]			= {"wald_1","trope_1"};
		pickaxe[]		= {"lead_1","iron_1","diamond_1","rock_1","gol_1","schwef_1","lava_1"};
		muellZone[]		= {"korall_1","perle_1","schild_1","salz_1"};	
		schwefelZone[]	= {"lead_1","iron_1","diamond_1","rock_1","gol_1"};	
		/*Random Zones*/
		RandomZone[] 	= {"wert_1","wert_2"};
		RandomLoot[] 	= {
			"c1",
			"c2",
			"mull",
			"a1t",
			"a1",
			"a2",
			"copper_r",
			"peach",
			"iron_r",
			"a10",
			"21",
			"ggn",
			"mache",			
			"14",
			"jame",
			"dose",
			"bw",
			"pickaxe",
			"a7",
			"a10",
			"gsn",
			"a0",
			"cement",
			"fassinv",
			"lockpick"
		};
		RandomILoot[]= {
			"acc_flashlight",
			"acc_pointer_IR",
			"bipod_01_F_khk",
			"Chemlight_red",			
			"SmokeShell",
			"SmokeShellYellow",
			"bipod_01_F_blk",
			"bipod_01_F_mtp",
			"optic_ACO_grn",			
			"optic_Yorris",
			"optic_ACO_grn_smg",
			"ItemGPS",				
			"Binocular",
			"HandGrenade_Stone",
			"FirstAidKit",
			"ToolKit",						
			"optic_Hamr",
			"optic_Hamr_khk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"Chemlight_yellow",
			"optic_ERCO_blk_F",
			"optic_Holosight_blk_F",	
			"SmokeShellPurple",			
			"SmokeShellRed",			
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_SOS",
			"Chemlight_green",
			"optic_LRPS_tna_F",
			"optic_LRPS_ghex_F",
			"Rangefinder",
			"muzzle_snds_65_TI_hex_F",
			"Chemlight_blue",
			"muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_H_MG_khk_F",
			"ItemWatch",
			"muzzle_snds_B_khk_F",
			"ItemMap",	
			"muzzle_snds_B_snd_F",
			"muzzle_snds_58_wdm_F",
			"SmokeShellGreen",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_acp",
			"NVGoggles",
			"ItemCompass",
			"muzzle_snds_H",
			"20Rnd_556x45_UW_mag",
			"arifle_SDAR_F"
		};
	};
	/*Sammeln*/
	class CIVgath{
		kokus_1[]	=	{"peach"	,5	};	//Fertig //Peach = Kokosnüsse
		kokus_2[]	=	{"peach"	,5	};	//Fertig
		
		susska_1[]	=	{"apple"	,5	};	//Fertig
		susska_2[]	=	{"apple"	,5	};	//Fertig
		susska_3[]	=	{"apple"	,5	};	//Fertig
		
		ana_1[]		=	{"ana"		,4	};	//Fertig
		Tee_1[]		=	{"tee"		,4	};	//Fertig
		natur_1[]	=	{"natkra"	,1	};	//Fertig

		wald_1[]	=	{"a1"		,4	}; 	//Fertig
		trope_1[]	=	{"a1t"		,3	};	//Fertig		
		
		heroin_1[]	=	{"heroinu"	,4	};	//Fertig
		cocaine_1[]	=	{"cocaine"	,4	};	//Fertig
		weed_1[]	=	{"cannabis"	,4	};	//Fertig
		meth_1[]	=	{"methu"	,4	};	//Fertig
		lsd_1[]		=	{"lsdu"		,4	};	//Fertig		
		schild_1[]	=	{"tutrei"	,4	};	//Fertig		
		
		korall_1[]	=	{"coral"	,4	};	//Fertig
		perle_1[]	=	{"perl"		,4	};	//Fertig
		kaffe_1[]	=	{"cofbea"	,4	};	//Fertig
		
		salz_1[]	=	{"salt"		,4	};	//Fertig
		
		//rec_2[]		=	{"mull"		,2	};
		//rec_3[]		=	{"mull"		,2	};
		/*Machete*/
		Palmenplantage_1[]	=	{"sig"	,3	};	//	Palmfrucht
		Zuckerrohr_1[]		=	{"reva"	,4	};	//	Zuckerrohr
		Kakaoplantage_1[]	=	{"kaka"	,4	};	//	Kakao		
		kautschuk_1[]		=	{"kaut"	,4	};	//	Kautschuk		
		bana_1[]			=	{"banan",4	};	//	Bananen		
	};
	
	class UHRgath{
		kokus_1[]	=	{"peach"	,10	};	//Fertig
		kokus_2[]	=	{"peach"	,10	};	//Fertig
		
		susska_1[]	=	{"apple"	,10	};	//Fertig
		susska_2[]	=	{"apple"	,10	};	//Fertig
		susska_3[]	=	{"apple"	,10	};	//Fertig
		
		ana_1[]		=	{"ana"		,8	};	//Fertig
		Tee_1[]		=	{"tee"		,8	};	//Fertig
		natur_1[]	=	{"natkra"	,8	};	//Fertig

		wald_1[]	=	{"a1"		,8	}; 	//Fertig
		trope_1[]	=	{"a1t"		,7	};	//Fertig		
		
		heroin_1[]	=	{"heroinu"	,8	};	//Fertig
		cocaine_1[]	=	{"cocaine"	,8	};	//Fertig
		weed_1[]	=	{"cannabis"	,8	};	//Fertig
		meth_1[]	=	{"methu"	,8	};	//Fertig
		lsd_1[]		=	{"lsdu"		,8	};	//Fertig		
		schild_1[]	=	{"tutrei"	,8	};	//Fertig		
		
		korall_1[]	=	{"coral"	,9	};	//Fertig
		perle_1[]	=	{"perl"		,9	};	//Fertig
		kaffe_1[]	=	{"cofbea"	,8	};	//Fertig
		
		salz_1[]	=	{"salt"		,9	};	//Fertig
		
		//rec_2[]		=	{"mull"		,2	};
		//rec_3[]		=	{"mull"		,2	};
		/*Machete*/
		Palmenplantage_1[]	=	{"sig"	,7	};	//	Palmfrucht
		Zuckerrohr_1[]		=	{"reva"	,8	};	//	Zuckerrohr
		Kakaoplantage_1[]	=	{"kaka"	,9	};	//	Kakao		
		kautschuk_1[]		=	{"kaut"	,8	};	//	Kautschuk	
		bana_1[]			=	{"banan",9	};	//	Bananen			
	};	
	/*Spitzhacke*/
	class CIVpick{
		lead_1[]	=	{"copperore"	,4	};	// Kupfer Fertig
		iron_1[]	=	{"ironore"		,4	};	// Eisen Fertig
	
		diamond_1[]	=	{"schgut"		,4	};	// Edelsteine Fertig
		rock_1[]	=	{"rock"			,3	};	// Mamor Fertig
		gol_1[]		=	{"gsg"			,4	};	// Gold / Silber Fertig
		schwef_1[]	=	{"c3"			,4	};	// Schwefel Fertig
		/*UHR*/
		lava_1[]	=	{"lava"			,4	};	//Fertig		
	};
	
	class UHRpick{
		lead_1[]	=	{"copperore"	,8	};	// Kupfer Fertig
		iron_1[]	=	{"ironore"		,9	};	// Eisen Fertig
	
		diamond_1[]	=	{"schgut"		,9	};	// Edelsteine Fertig
		rock_1[]	=	{"rock"			,8	};	// Mamor Fertig
		gol_1[]		=	{"gsg"			,8	};	// Gold / Silber Fertig
		schwef_1[]	=	{"c3"			,9	};	// Schwefel Fertig
		/*UHR*/
		lava_1[]	=	{"lava"			,9	};	//Fertig	
	};		
	/*Gerät*/
	class MineDevice{
		susska_1	=	"apple";	
		susska_2	=	"apple";
		
		schwef_1	=	"c3";
		
		kokus_1		=	"peach";	
		kokus_2		=	"peach";
		
		lava_1		=	"lava";
		Tee_1		=	"tee";
		
		heroin_1	=	"heroinu";		
		cocaine_1	=	"cocaine";	
		weed_1		=	"cannabis";	
		lead_1		=	"copperore";	
		iron_1		=	"ironore";		
		diamond_1	=	"schgut";	
		rock_1		=	"rock";	
		ana_1		=	"ana";	
		lsd_1		=	"lsdu";	
		gol_1		=	"gsg";	
		wald_1		=	"a1";	
		trope_1		=	"a1t";	
		
		salz_1		=	"salt";	
		
		Palmenplantage_1=	"sig";	//	Palmfrucht
		Zuckerrohr_1	=	"reva";	//	Zuckerrohr
		Kakaoplantage_1	=	"kaka";	//	Kakao		
		kautschuk_1		=	"kaut";	//	Kautschuk	
	};
	/*LWK Beladung*/
	class Beladung{
		/*				ITEM		,VAL/2Sek	,flüssig		*/	
		lade_sand[]	= {"sand"		,6			,false			};
		lade_leim[]	= {"a3"			,11			,true			};
	};	
};

class LigaProcess {
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
	║	File: Liga_Cfg_vItems.hpp	
	║		
	║	Author:  Hirschi - Die Liga		
	╠═════════════════════════════════════════════════════════════════╗
	║"REZEP":{[["Baumatereial Array],[Baumaterial Stk Arry],[Gebaut Arry],[Gebaut Stk Array],I Inventar true/false, Herstell Kosten ohne Lizens, "Text", Einzeln Verarbeiten true/false, +/- Sek Wartezeit, ZusatzItem, Lizens Check true / false]
	╚═════════════════════════════════════════════════════════════════╝
*/
		 
	class CIVpro {
	/*Crafting Men*/	
		CraftMen[]	=	{
			"anakons",
			"palm",
			"kaka",
			"schok",
			"rum",
			"redg",
			"stock_1",
			"stock_2",
			"stock_3",
			"stock_4",
			"stock_5",
			"stock_6",
			"tropbrett",
			"brett",
			"mob",
			"spanp",
			"fassbrett",
			"fass",
			"stobox",
			"kass",
			"regal",
			"cement",
			"gsg",
			"ggn",
			"gsn",
			"diamond1",
			"diamond2",
			"rio",
			"oil",
			"oilben",
			"oildi",
			"iron",
			"copper",
			"dosen",
			"munk",
			"waft",
			"bomb",
			"firwo",
			"oilpum",
			"hydr",
			"bohrg",
			"mach",
			"diet",
			"bolz",
			"bohr",
			"ketts",
			"press",
			"axttt",
			"stahlt",
			"marijuana",
			"turtle",
			"cocaine",
			"souv",
			"souvlava",
			"perlk",
			"heiltee",
			"kafroe",
			"kafsch",
			"kafmasch",
			"lsd",			
			"cocastreck",
			"maristreck",
			"meth",
			"heroin",
			"salt",
			"saltp",
			"mull",
			"sand",
			"hfell",
			"zfell",
			"flas",
			"moon",
			"maifa",
			"dest",
			"methy"
		};
		
	/* Nahrungsmittel */	
		anakons[] 	= 	{{"ana"},					{2},	{"bw"},				{1},	false,	110,	"Ananaskonserven werden hergestellt",	false,	0, 		"",		true}; 	// Ananaskonserven
		palm[] 		= 	{{"sig"},					{4},	{"tet"},			{1},	false,	950,	"Palmoel wird hergestellt",				false,	0,		"",		true};	// Palmöl
		
		kaka[] 		= 	{{"kaka"},					{1},	{"kakap"},			{1},	false,	950,	"Kakao wird geröstet",					false,	0,		"",		true};	// 
		schok[] 	= 	{{"kakap"},					{3},	{"schok"},			{1},	false,	950,	"Schokolade wird hergestellt",			false,	0,		"",		true};	// 
		
		rum[] 		= 	{{"reva","fassinv"},		{2,1},	{"bottledbeer"},	{1},	false,	950,	"Ligas Finest wird hergestellt",		false,	0,		"",		true};	// Ligas Finest
		redg[] 		= 	{{"ana","kakap","cofbeap","hode","dose"},{1,1,1,1,25},	{"redgull"},	{25},	false,	950,"RedGull wird hergestellt",false,	0,		"",		false};	// RedGull

		stock_1[] 	= 	{{"salema"},				{3},	{"stofish"},		{1},	false,	950,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_2[] 	= 	{{"ornate"},				{3},	{"stofish"},		{1},	false,	950,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_3[] 	= 	{{"mackerel"},				{2},	{"stofish"},		{1},	false,	950,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_4[] 	= 	{{"tuna"},					{3},	{"stofish"},		{1},	false,	950,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_5[] 	= 	{{"mullet"},				{3},	{"stofish"},		{1},	false,	950,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_6[] 	= 	{{"catshark"},				{3},	{"stofish"},		{1},	false,	950,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch

	/*Holzindustrie*/
		tropbrett[]	= 	{{"a1t"},					{1},	{"a2","a4"},		{5,1},	false,	120,	"Bretter werden gesaegt",				false,	0.04,	"",		true};	// Tropenholz ohne Lizenz		
		brett[] 	= 	{{"a1"},					{1},	{"a2","a4"},		{3,2},	false,	320,	"Bretter werden gesaegt",				false,	0,		"",		true};	//	Normales Holz	
		mob[] 		= 	{{"a2"},					{5},	{"a6","a4"},		{1,2},	false,	650,	"Möbel werden gebaut",					false,	0.05,	"a5",	true};
		spanp[] 	= 	{{"a4","a3"},				{5,2},	{"a5"},				{1},	false,	940,	"Spanplatten werden gepresst",			false,	0.09,	"a1",	true};
		
		fassbrett[] = 	{{"a1"},					{1},	{"guh"},			{5},	false,	950,	"Fassbretter werden hergestellt",		false,	0,		"",		true};	// Fassbretter
		fass[] 		= 	{{"guh","iron_r"},			{5,1},	{"fassinv"},		{1},	false,	950,	"Fass wird hergestellt",				false,	0,		"",		true};	// Fass
		/*Lagerkisten*/
		stobox[] 	= 	{{"a6"},					{20},	{"storagebig"},		{1},	false,	950,	"Lagerkiste wird hergestellt",			false,	0,		"",		true};	// Fass
		
		kass[] 		= 	{{"a2","iron_r","copper_r"},{5,3,1},{"kasse"},			{1},	false,	950,	"Kassentisch wird hergestellt",			false,	0,		"",		true};	// Fass
		regal[] 	= 	{{"a2","iron_r"},			{2,6},	{"schrank"},		{1},	false,	950,	"Regal wird hergestellt",				false,	0,		"",		true};	// Fass

	/*Bergbau*/
		cement[] 	= 	{{"rock"},					{2},	{"cement"},			{1},	false,	950,	"Mamorplatten werden poliert",			false,	0,		"",		true};	// Mamorplatten
	
		gsg[] 		= 	{{"gsg"},					{1},	{"ggn","gsn","gab"},{1,2,2},false,	340,	"Schuerfgut wird gewaschen",			false,	0.05, "ghy",	true};
		ggn[] 		= 	{{"ggn"},					{2},	{"gl"},				{1},	false,	900,	"Goldschmuck werden hergestellt",		false,	0.25,	"",		true};
		gsn[] 		= 	{{"gsn"},					{2},	{"gsm"},			{1},	false,	700,	"Silberschmuck werden hergestellt",		false,	0.25,	"",		true};
		
		diamond1[] 	= 	{{"schgut"},				{1},	{"diamond"},		{1},	false,	230,	"Schuerfgut wird gewaschen",			false,	0,		"",		true};
		diamond2[] 	= 	{{"diamond"},				{1},	{"diamondc"},		{2},	false,	230,	"Edelsteine werden geschliffen",		false,	0,		"",		true};
	/*Öl*/
		rio[] 		= 	{{"rio"},					{3},	{"ben","di"},		{3,1},	false,	380,	"Offshore Öl wird raffiniert",			false,	0,		"",		true};
		oil[] 		= 	{{"oilu"},					{1},	{"oilp"},			{1},	false,	320,	"Roh Öl wird raffiniert",				false,	0,		"",		true};
		oilben[] 	= 	{{"oilu"},					{3},	{"ben"},			{5},	false,	380,	"Treibstoff wird hergestellt",			false,	0.3,	"",		true};
		oildi[] 	= 	{{"oilu"},					{3},	{"di"},				{4},	false,	380,	"Kerosin wird hergestellt",				false,	0.3,	"",		true};
	/*Metallindustrie*/
		iron[] 		= 	{{"ironore"},				{1},	{"iron_r"},			{1},	false,	380,	"Eisenbarren werden gegossen",			false,	0,		"",		true};	// Eisenbarren
		copper[] 	= 	{{"copperore"},				{1},	{"copper_r"},		{1},	false,	380,	"Kupferbarren werden gegossen",			false,	0,		"",		true};	// Kupferbarren
		
		dosen[] 	= 	{{"iron_r","copper_r"},		{2,1},	{"dose"},			{9},	false,	500,	"Dosen werden hergestellt",				false,	0,		"",		true};	// Dosen

		munk[]		= {{"iron_r","copper_r","c3","c4"},{3,2,1,1},{"c1"},		{1},	false,	650,	"Munition wird hergestellt",			false,	0.06,	"",		false};
		waft[] 		= {{"iron_r","copper_r","a0"},	{2,1,1},	{"c2"},			{2},	false,	650,	"Waffenteile werden hergestellt",		false,	0.06,	"",		false};
		bomb[] 		= {{"iron_r","c4","c3","a0"	},	{1,2,3,1},	{"blastingcharge"},{1},	false,	650,	"Sprengladung herstellen",				false,	0.06,	"",		false};
		
		firwo[] 	= {{"c3","salt","a4"	},		{3,1,1},	{"fireWo"},{1},	false,	650,			"Feuerwerk herstellen",				false,	0.06,	"",		false};

	/*Schlosser*/
		oilpum[] 	= {{"copper_r","iron_r"},		{2,3},		{"rip"},		{1},	false,	300,	"Ölpumpe wird hergestellt",				true,	0,		"",		true};
		hydr[] 		= {{"copper_r","iron_r"},		{2,3},		{"ghy"},		{1},	false,	250,	"Hydro Riffel wird hergestellt",		true,	0,		"",		true};
		bohrg[] 	= {{"copper_r","iron_r"},		{3,3},		{"rib"},		{3},	false,	250,	"Bohrgestänge wird hergestellt",		false,	0.05,	"",		true};
		mach[] 		= {{"copper_r","iron_r"},		{1,1},		{"mache"},		{1},	false,	100,	"Machete wird hergestellt",				false,	0,		"",		true};
		diet[] 		= {{"copper_r","iron_r"},		{1,1},		{"lockpick"},	{1},	false,	100,	"Dietrich wird hergestellt",			false,	0,		"",		true};
		bolz[] 		= {{"copper_r","iron_r"},		{1,2},		{"boltcutter"},	{1},	false,	200,	"Bolzenschneider wird hergestellt",		true,	0,		"",		true};			
		bohr[] 		= {{"iron_r","copper_r","a0"},	{1,2,2},	{"c6"},			{1},	false,	650,	"Bohrmaschine herstellen",				false,	0.1,	"",		false};
		ketts[] 	= {{"copper_r","iron_r"},		{1,3},		{"a8"},			{1},	false,	700,	"Kettensäge wird gebaut",				true,	0.15,	"",		true};
		press[] 	= {{"iron_r","copper_r"},		{3,2},		{"a9"},			{1},	false,	650,	"Presslufthammer wird hergestellt",		true,	0.16,	"",		false};
		axttt[] 	= {{"iron_r","copper_r"},		{2,1},		{"a7"},			{1},	false,	650,	"Axt wird hergestellt",					true,	0.16,	"",		false};
		/*Eingeplegt in NPC ???? */
		stahlt[]	= {{"copper_r","iron_r"},		{1,2},		{"stt"},		{1},	false,	300,	"Stahlträger werden hergestellt",		false,	0,		"",		true};

	/*UHR*/
		marijuana[] =	{{"cannabis"},				{1},	{"marijuana"},		{1},	false,	535,	"Marihuana wird verarbeitet",			false,	0,		"",		true};
		turtle[] 	=	{{"turtle"},				{1},	{"turtlesoup"},		{1},	false,	135,	"Schildkroeten werden verarbeitet",		false,	0,		"",		false};
		cocaine[] 	= 	{{"cocaine"},				{1},	{"cocainep"},		{1},	false,	350,	"Kokain wird verarbeitet",				false,	0,		"",		true};
		souv[] 		= 	{{"coral"},					{1},	{"corsurv"},		{1},	false,	350,	"Souvenir wird hergestellt",			false,	0,		"",		false};
		souvlava[] 	= 	{{"lava"},					{1},	{"corsurvlava"},		{1},	false,	550,	"Lavafiguren werden hergestellt",			false,	0,		"",		false};
		perlk[] 	= 	{{"perl"},					{4},	{"perlp"},			{1},	false,	150,	"Perlenkette wird hergestellt",			false,	0,		"",		false};
		heiltee[] 	= 	{{"tee","cocainep","marijuana","natkra"},{3,1,1,1},{"nattee"},		{3},	false,	150,	"Naturheilkräutertee wird hergestellt",	false,	0,		"",		false};
		
		kafroe[] 	= 	{{"cofbea"},				{2},	{"cofbeap"},		{1},	false,	350,	"Kaffee wird geroestet",				false,	0,		"",		false};
		kafsch[] 	= 	{{"cofbea"},				{4},	{"cofbeas"},		{1},	false,	150,	"Kopi Luwak gereinigt",				false,	0,		"",		false};
		kafmasch[] 	= 	{{"cofbeap","water"},		{1,2},	{"coffee"},			{12},	false,	150,	"Kaffee wird gekocht",					false,	0,		"",		false};
		
	/*REB*/
		lsd[] 		=  	{{"lsdu"},					{1},	{"lsdp"},			{1},	false,	190,	"LSD wird hergestellt",					false,	0,  	"",		true};
		lsdreb[] 	=  	{{"lsdu"},					{2},	{"lsdp"},			{1},	false,	190,	"LSD wird hergestellt",					false,	0,  	"",		false};	
	
		cocastreck[]= 	{{"cocainep","streckm"},	{1,1},	{"cocainep"},		{3},	false,	150,	"Kokain wird gestreckt",				false,	0,		"",		false};
		maristreck[]=	{{"marijuana","streckm"},	{1,1},	{"marijuana"},		{3},	false,	135,	"Marihuana wird gestreckt",				false,	0,		"",		false};

		meth[] 		= 	{{"methu"},					{1},	{"methp"},			{1},	false,	210,	"Koche Meth",							false,	0,		"",		false};
		heroin[] 	= 	{{"heroinu"},				{1},	{"heroinp"},		{1},	false,	170,	"Heroin wird verarbeitet",				false,	0,		"",		false};

	/* NEU ENDE */
		
		/*Noch keine Standort */
		salt[] 		= 	{{"salt"},					{1},	{"salt_r"},			{1},	false,	100,	"Salz wird verarbeitet",				false,	0,		"",		true};
		saltp[]		= 	{{"salt_r"},				{3},	{"c4"},				{1},	false,	100,	"Salpeter wird hergestellt",			false,	0,		"",		true};
		
		mull[]		= 	{{"mull"},					{2},	{"a0"},				{1},	false,	100,	"Kunststoff wird hergestellt",			false,	0,		"",		false};
		
		
		
		sand[] 		= 	{{"sand"},					{1},	{"glass"},			{1},	false,	110,	"Sand wird verarbeitet",				false,	0,		"",		true};

		hfell[] 	= 	{{"rabbitf"},				{1},	{"rabbitfp"},		{1},	false,	600,	"Hasenfelle werden verarbeitet",		false,	0,		"",		true};
		zfell[] 	= 	{{"goatrawf"},				{1},	{"goatrawfp"},		{1},	false,	600,	"Ziegenfelle werden verarbeitet",		false,	0,		"",		true};

		flas[] 		= {{"sand"},					{1},		{"a10"},		{2},	false,	960,	"Flaschen werden hergestellt",			false,	-0.1,	"",		false};
		moon[] 		= {{"20","a10"},				{1,5},		{"21"},			{5},	false,	650,	"Moonshine wird abgefüllt",				false,	-0.12,	"",		false};
		maifa[] 	= {{"iron_r","a0"},				{2,14},		{"16"},			{1},	false,	650,	"Maischefass wird hergestellt",			true,	0.12,	"",		false};
		dest[] 		= {{"iron_r","copper_r","a0"},	{2,10,1},	{"15"},			{1},	false,	650,	"Destille wird gebaut",					true,	0.18,	"",		false};
		methy[] 	= {{"18","fuelE"},				{3,1},		{"fuelF"},		{1},	false,	650,	"Kanister wird aufgefuellt",			false,	-0.18,	"",		false};
	//	 "wabo{} = {{"iron_r","c4","c3","a0"},{1,2,1,1},{"blastingcharge"},{1},false,6500,"Sprengladung herstellen",false,0.06,"",false}

		test[] 		= {{"water","apple"},			{2,3},		{"HandGrenade_Stone","LMG_Zafir_F"},{2,3}, true, 100, "stelle her", false, 0.3,"",false};
	};
	
	class UHRpro {
		
		CraftMen[]	=	{
			"anakons",
			"palm",
			"kaka",
			"schok",
			"rum",
			"redg",
			"stock_1",
			"stock_2",
			"stock_3",
			"stock_4",
			"stock_5",
			"stock_6",
			"tropbrett",
			"brett",
			"mob",
			"spanp",
			"fassbrett",
			"fass",
			"stobox",
			"kass",
			"regal",
			"cement",
			"gsg",
			"ggn",
			"gsn",
			"diamond1",
			"diamond2",
			"rio",
			"oil",
			"oilben",
			"oildi",
			"iron",
			"copper",
			"dosen",
			"munk",
			"waft",
			"bomb",
			"firwo",
			"oilpum",
			"hydr",
			"bohrg",
			"mach",
			"diet",
			"bolz",
			"bohr",
			"ketts",
			"press",
			"axttt",
			"stahlt",
			"marijuana",
			"turtle",
			"cocaine",
			"souv",
			"souvlava",
			"perlk",
			"heiltee",
			"kafroe",
			"kafsch",
			"kafmasch",
			"lsd",			
			"cocastreck",
			"maristreck",
			"meth",
			"heroin",
			"salt",
			"saltp",
			"mull",
			"sand",
			"hfell",
			"zfell",
			"flas",
			"moon",
			"maifa",
			"dest",
			"methy"
		};		
	/* Nahrungsmittel */	
		anakons[] 	= 	{{"ana"},					{3},	{"bw"},				{1},	false,	110,	"Ananaskonserven werden hergestellt",	false,	0, 		"",		true}; 	// Ananaskonserven
		palm[] 		= 	{{"sig"},					{4},	{"tet"},			{1},	false,	950,	"Palmoel wird hergestellt",				false,	0,		"",		true};	// Palmöl
		
		kaka[] 		= 	{{"kaka"},					{2},	{"kakap"},			{1},	false,	900,	"Kakao wird geröstet",					false,	0,		"",		true};	// 
		schok[] 	= 	{{"kakap"},					{3},	{"schok"},			{1},	false,	500,	"Schokolade wird hergestellt",			false,	0,		"",		true};	// 
		
		rum[] 		= 	{{"reva","fassinv"},		{2,1},	{"bottledbeer"},	{1},	false,	500,	"Ligas Finest wird hergestellt",		false,	0,		"",		true};	// Ligas Finest
		redg[] 		= 	{{"ana","kakap","cofbeap","hode","dose"},{1,1,1,1,20},	{"redgull"},	{18},	false,	500,"RedGull wird hergestellt",false,	0,		"",		false};	// RedGull

		stock_1[] 	= 	{{"salema"},				{2},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_2[] 	= 	{{"ornate"},				{2},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_3[] 	= 	{{"mackerel"},				{1},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_4[] 	= 	{{"tuna"},					{2},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_5[] 	= 	{{"mullet"},				{2},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_6[] 	= 	{{"catshark"},				{2},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch

	/*Holzindustrie*/
		tropbrett[]	= 	{{"a1t"},					{1},	{"a2","a4"},		{5,1},	false,	100,	"Bretter werden gesaegt",				false,	0.04,	"",		true};	// Tropenholz ohne Lizenz		
		brett[] 	= 	{{"a1"},					{1},	{"a2","a4"},		{2,2},	false,	100,	"Bretter werden gesaegt",				false,	0,		"",		true};	//	Normales Holz	
		mob[] 		= 	{{"a2"},					{5},	{"a6","a4"},		{1,2},	false,	130,	"Möbel werden gebaut",					false,	0.05,	"a5",	true};
		spanp[] 	= 	{{"a4","a3"},				{5,2},	{"a5"},				{1},	false,	450,	"Spanplatten werden gepresst",			false,	0.09,	"a1",	true};
		
		fassbrett[] = 	{{"a1"},					{1},	{"guh"},			{4},	false,	500,	"Fassbretter werden hergestellt",		false,	0,		"",		true};	// Fassbretter
		fass[] 		= 	{{"guh","iron_r"},			{5,1},	{"fassinv"},		{1},	false,	500,	"Fass wird hergestellt",				false,	0,		"",		true};	// Fass
		/*Lagerkisten*/
		stobox[] 	= 	{{"a6"},					{18},	{"storagebig"},		{1},	false,	500,	"Lagerkiste wird hergestellt",			false,	0,		"",		true};	// Fass

		kass[] 		= 	{{"a2","iron_r","copper_r"},{5,3,1},{"kasse"},			{1},	false,	950,	"Kassentisch wird hergestellt",			false,	0,		"",		true};	// Fass
		regal[] 	= 	{{"a2","iron_r"},			{2,6},	{"schrank"},		{1},	false,	950,	"Regal wird hergestellt",				false,	0,		"",		true};	// Fass

	/*Bergbau*/
		cement[] 	= 	{{"rock"},					{2},	{"cement"},			{1},	false,	500,	"Mamorplatten werden poliert",			false,	0,		"",		true};	// Mamorplatten
	
		gsg[] 		= 	{{"gsg"},					{1},	{"ggn","gsn","gab"},{1,2,1},false,	200,	"Schuerfgut wird gewaschen",			false,	0.05, "ghy",	true};
		ggn[] 		= 	{{"ggn"},					{2},	{"gl"},				{1},	false,	900,	"Goldschmuck werden hergestellt",		false,	0.25,	"",		true};
		gsn[] 		= 	{{"gsn"},					{2},	{"gsm"},			{1},	false,	700,	"Silberschmuck werden hergestellt",		false,	0.25,	"",		true};
		
		diamond1[] 	= 	{{"schgut"},				{1},	{"diamond"},		{1},	false,	100,	"Schuerfgut wird gewaschen",			false,	0,		"",		true};
		diamond2[] 	= 	{{"diamond"},				{1},	{"diamondc"},		{2},	false,	100,	"Edelsteine werden geschliffen",		false,	0,		"",		true};
	/*Öl*/
		rio[] 		= 	{{"rio"},					{3},	{"ben","di"},		{2,1},	false,	100,	"Offshore Öl wird raffiniert",			false,	0,		"",		true};
		oil[] 		= 	{{"oilu"},					{1},	{"oilp"},			{1},	false,	100,	"Roh Öl wird raffiniert",				false,	0,		"",		true};
		oilben[] 	= 	{{"oilu"},					{3},	{"ben"},			{4},	false,	100,	"Treibstoff wird hergestellt",			false,	0.3,	"",		true};
		oildi[] 	= 	{{"oilu"},					{3},	{"di"},				{3},	false,	100,	"Kerosin wird hergestellt",				false,	0.3,	"",		true};
	/*Metallindustrie*/
		iron[] 		= 	{{"ironore"},				{1},	{"iron_r"},			{1},	false,	110,	"Eisenbarren werden gegossen",			false,	0,		"",		true};	// Eisenbarren
		copper[] 	= 	{{"copperore"},				{1},	{"copper_r"},		{1},	false,	700,	"Kupferbarren werden gegossen",			false,	0,		"",		true};	// Kupferbarren
		
		dosen[] 	= 	{{"iron_r","copper_r"},		{2,1},	{"dose"},			{8},	false,	500,	"Dosen werden hergestellt",				false,	0,		"",		true};	// Dosen

		munk[]		= {{"iron_r","copper_r","c3","c4"},{3,2,1,1},{"c1"},		{1},	false,	650,	"Munition wird hergestellt",			false,	0.06,	"",		false};
		waft[] 		= {{"iron_r","copper_r","a0"},	{2,1,1},	{"c2"},			{1},	false,	650,	"Waffenteile werden hergestellt",		false,	0.06,	"",		false};
		bomb[] 		= {{"iron_r","c4","c3","a0"	},	{1,2,3,1},	{"blastingcharge"},{1},	false,	650,	"Sprengladung herstellen",				false,	0.06,	"",		false};
		
		firwo[] 	= {{"c3","salt","a4"	},		{3,1,1},	{"fireWo"},{1},	false,	650,			"Feuerwerk herstellen",				false,	0.06,	"",		false};
		
	/*Schlosser*/
		oilpum[] 	= {{"copper_r","iron_r"},		{3,3},		{"rip"},		{1},	false,	300,	"Ölpumpe wird hergestellt",				true,	0,		"",		true};
		hydr[] 		= {{"copper_r","iron_r"},		{3,3},		{"ghy"},		{1},	false,	250,	"Hydro Riffel wird hergestellt",		true,	0,		"",		true};
		bohrg[] 	= {{"copper_r","iron_r"},		{4,3},		{"rib"},		{2},	false,	250,	"Bohrgestänge wird hergestellt",		false,	0.05,	"",		true};
		mach[] 		= {{"copper_r","iron_r"},		{1,1},		{"mache"},		{1},	false,	100,	"Machete wird hergestellt",				false,	0,		"",		true};
		diet[] 		= {{"copper_r","iron_r"},		{1,1},		{"lockpick"},	{1},	false,	100,	"Dietrich wird hergestellt",			false,	0,		"",		true};
		bolz[] 		= {{"copper_r","iron_r"},		{1,2},		{"boltcutter"},	{1},	false,	200,	"Bolzenschneider wird hergestellt",		true,	0,		"",		true};			
		bohr[] 		= {{"iron_r","copper_r","a0"},	{1,2,2},	{"c6"},			{1},	false,	650,	"Bohrmaschine herstellen",				false,	0.1,	"",		false};
		ketts[] 	= {{"copper_r","iron_r"},		{3,3},		{"a8"},			{1},	false,	700,	"Kettensäge wird gebaut",				true,	0.15,	"",		true};
		press[] 	= {{"iron_r","copper_r"},		{4,2},		{"a9"},			{1},	false,	650,	"Presslufthammer wird hergestellt",		true,	0.16,	"",		false};
		axttt[] 	= {{"iron_r","copper_r"},		{2,1},		{"a7"},			{1},	false,	650,	"Axt wird hergestellt",					true,	0.16,	"",		false};

		/*Eingeplegt in NPC ???? */
		stahlt[]	= {{"copper_r","iron_r"},		{1,3},		{"stt"},		{1},	false,	300,	"Stahlträger werden hergestellt",		false,	0,		"",		true};

	/*UHR*/
		marijuana[] =	{{"cannabis"},				{1},	{"marijuana"},		{1},	false,	130,	"Marihuana wird verarbeitet",			false,	0,		"",		true};
		turtle[] 	=	{{"turtle"},				{1},	{"turtlesoup"},		{2},	false,	130,	"Schildkroeten werden verarbeitet",		false,	0,		"",		false};
		cocaine[] 	= 	{{"cocaine"},				{1},	{"cocainep"},		{1},	false,	150,	"Kokain wird verarbeitet",				false,	0,		"",		true};
		souv[] 		= 	{{"coral"},					{1},	{"corsurv"},		{1},	false,	150,	"Souvenir wird hergestellt",			false,	0,		"",		false};
		souvlava[] 	= 	{{"lava"},					{1},	{"corsurvlava"},	{1},	false,	150,	"Lavafiguren werden hergestellt",			false,	0,		"",		false};
		perlk[] 	= 	{{"perl"},					{3},	{"perlp"},			{1},	false,	150,	"Perlenkette wird hergestellt",			false,	0,		"",		false};
		heiltee[] 	= 	{{"tee","cocainep","marijuana","natkra"},{3,1,1,1},{"nattee"},		{4},	false,	150,	"Naturheilkräutertee wird hergestellt",	false,	0,		"",		false};
		
		kafroe[] 	= 	{{"cofbea"},				{2},	{"cofbeap"},		{2},	false,	150,	"Kaffee wird geroestet",				false,	0,		"",		false};
		kafsch[] 	= 	{{"cofbea"},				{3},	{"cofbeas"},		{1},	false,	150,	"Kopi Luwak gereinigt",				false,	0,		"",		false};
		kafmasch[] 	= 	{{"cofbeap","water"},		{1,1},	{"coffee"},			{5},	false,	150,	"Kaffee wird gekocht",					false,	0,		"",		false};
		
	/*REB*/
		lsd[] 		=  	{{"lsdu"},					{1},	{"lsdp"},			{1},	false,	190,	"LSD wird hergestellt",					false,	0,  	"",		true};
		lsdreb[] 	=  	{{"lsdu"},					{2},	{"lsdp"},			{1},	false,	190,	"LSD wird hergestellt",					false,	0,  	"",		false};	
	
		cocastreck[]= 	{{"cocainep","streckm"},	{1,1},	{"cocainep"},		{3},	false,	150,	"Kokain wird gestreckt",				false,	0,		"",		false};
		maristreck[]=	{{"marijuana","streckm"},	{1,1},	{"marijuana"},		{3},	false,	130,	"Marihuana wird gestreckt",				false,	0,		"",		false};

		meth[] 		= 	{{"methu"},					{1},	{"methp"},			{1},	false,	210,	"Koche Meth",							false,	0,		"",		false};
		heroin[] 	= 	{{"heroinu"},				{1},	{"heroinp"},		{1},	false,	170,	"Heroin wird verarbeitet",				false,	0,		"",		false};

	/* NEU ENDE */
		
		/*Noch keine Standort */
		salt[] 		= 	{{"salt"},					{1},	{"salt_r"},			{1},	false,	100,	"Salz wird verarbeitet",				false,	0,		"",		true};
		saltp[]		= 	{{"salt_r"},				{3},	{"c4"},				{1},	false,	100,	"Salpeter wird hergestellt",			false,	0,		"",		true};
		
		mull[]		= 	{{"mull"},					{2},	{"a0"},				{1},	false,	105,	"Kunststoff wird hergestellt",			false,	0,		"",		false};
		
		
		
		sand[] 		= 	{{"sand"},					{1},	{"glass"},			{1},	false,	110,	"Sand wird verarbeitet",				false,	0,		"",		true};

		hfell[] 	= 	{{"rabbitf"},				{1},	{"rabbitfp"},		{1},	false,	200,	"Hasenfelle werden verarbeitet",		false,	0,		"",		true};
		zfell[] 	= 	{{"goatrawf"},				{1},	{"goatrawfp"},		{1},	false,	200,	"Ziegenfelle werden verarbeitet",		false,	0,		"",		true};

		flas[] 		= {{"sand"},					{1},		{"a10"},		{2},	false,	960,	"Flaschen werden hergestellt",			false,	-0.1,	"",		false};
		moon[] 		= {{"20","a10"},				{1,5},		{"21"},			{5},	false,	600,	"Moonshine wird abgefüllt",				false,	-0.12,	"",		false};
		maifa[] 	= {{"iron_r","a0"},				{2,14},		{"16"},			{1},	false,	650,	"Maischefass wird hergestellt",			true,	0.12,	"",		false};
		dest[] 		= {{"iron_r","copper_r","a0"},	{2,10,1},	{"15"},			{1},	false,	650,	"Destille wird gebaut",					true,	0.18,	"",		false};
		methy[] 	= {{"18","fuelE"},				{3,1},		{"fuelF"},		{1},	false,	650,	"Kanister wird aufgefuellt",			false,	-0.18,	"",		false};
	//	 "wabo{} = {{"iron_r","c4","c3","a0"},{1,2,1,1},{"blastingcharge"},{1},false,6500,"Sprengladung herstellen",false,0.06,"",false}

		test[] 		= {{"water","apple"},			{2,3},		{"HandGrenade_Stone","LMG_Zafir_F"},{2,3}, true, 100, "stelle her", false, 0.3,"",false};
	};	
	/*	Rebellen */
	class REBpro {
		CraftMen[]	=	{
			"anakons",
			"palm",
			"kaka",
			"schok",
			"rum",
			"redg",
			"stock_1",
			"stock_2",
			"stock_3",
			"stock_4",
			"stock_5",
			"stock_6",
			"tropbrett",
			"brett",
			"mob",
			"spanp",
			"fassbrett",
			"fass",
			"stobox",
			"kass",
			"regal",
			"cement",
			"gsg",
			"ggn",
			"gsn",
			"diamond1",
			"diamond2",
			"rio",
			"oil",
			"oilben",
			"oildi",
			"iron",
			"copper",
			"dosen",
			"munk",
			"waft",
			"bomb",
			"firwo",
			"oilpum",
			"hydr",
			"bohrg",
			"mach",
			"diet",
			"bolz",
			"bohr",
			"ketts",
			"press",
			"axttt",
			"stahlt",
			"marijuana",
			"turtle",
			"cocaine",
			"souv",
			"souvlava",
			"perlk",
			"heiltee",
			"kafroe",
			"kafsch",
			"kafmasch",			
			"lsdreb",
			"cocastreck",
			"maristreck",
			"meth",
			"heroin",
			"salt",
			"saltp",
			"mull",
			"sand",
			"hfell",
			"zfell",
			"flas",
			"moon",
			"maifa",
			"dest",
			"methy"
		};		
	/* Nahrungsmittel */	
		anakons[] 	= 	{{"ana"},					{3},	{"bw"},				{1},	false,	110,	"Ananaskonserven werden hergestellt",	false,	0, 		"",		true}; 	// Ananaskonserven
		palm[] 		= 	{{"sig"},					{5},	{"tet"},			{1},	false,	950,	"Palmoel wird hergestellt",				false,	0,		"",		true};	// Palmöl
		
		kaka[] 		= 	{{"kaka"},					{2},	{"kakap"},			{1},	false,	950,	"Kakao wird geröstet",					false,	0,		"",		true};	// 
		schok[] 	= 	{{"kakap"},					{4},	{"schok"},			{1},	false,	100,	"Schokolade wird hergestellt",			false,	0,		"",		true};	// 
		
		rum[] 		= 	{{"reva","fassinv"},		{2,1},	{"bottledbeer"},	{1},	false,	500,	"Ligas Finest wird hergestellt",		false,	0,		"",		true};	// Ligas Finest
		redg[] 		= 	{{"ana","kakap","cofbeap","hode","dose"},{1,1,1,1,20},	{"redgull"},	{20},	false,	500,"RedGull wird hergestellt",false,	0,		"",		false};	// RedGull

		stock_1[] 	= 	{{"salema"},				{3},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_2[] 	= 	{{"ornate"},				{3},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_3[] 	= 	{{"mackerel"},				{2},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_4[] 	= 	{{"tuna"},					{3},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_5[] 	= 	{{"mullet"},				{3},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch
		stock_6[] 	= 	{{"catshark"},				{3},	{"stofish"},		{1},	false,	500,	"Stockfisch wird hergestellt",			false,	0,		"",		false};	// Stockfisch

	/*Holzindustrie*/
		tropbrett[]	= 	{{"a1t"},					{1},	{"a2"},				{6},	false,	100,	"Bretter werden gesaegt",				false,	0.04,	"",		true};	// Tropenholz ohne Lizenz		
		brett[] 	= 	{{"a1"},					{1},	{"a2","a4"},		{3,2},	false,	100,	"Bretter werden gesaegt",				false,	0,		"",		true};	//	Normales Holz	
		mob[] 		= 	{{"a2"},					{5},	{"a6","a4"},		{1,2},	false,	150,	"Möbel werden gebaut",					false,	0.05,	"a5",	true};
		spanp[] 	= 	{{"a4","a3"},				{5,2},	{"a5"},				{1},	false,	950,	"Spanplatten werden gepresst",			false,	0.09,	"a1",	true};
		
		fassbrett[] = 	{{"a1"},					{1},	{"guh"},			{5},	false,	900,	"Fassbretter werden hergestellt",		false,	0,		"",		true};	// Fassbretter
		fass[] 		= 	{{"guh","iron_r"},			{5,1},	{"fassinv"},		{1},	false,	900,	"Fass wird hergestellt",				false,	0,		"",		true};	// Fass
		/*Lagerkisten*/
		stobox[] 	= 	{{"a6"},					{22},	{"storagebig"},		{1},	false,	900,	"Lagerkiste wird hergestellt",			false,	0,		"",		true};	// Fass

		kass[] 		= 	{{"a2","iron_r","copper_r"},{5,3,1},{"kasse"},			{1},	false,	950,	"Kassentisch wird hergestellt",			false,	0,		"",		true};	// Fass
		regal[] 	= 	{{"a2","iron_r"},			{2,6},	{"schrank"},		{1},	false,	950,	"Regal wird hergestellt",				false,	0,		"",		true};	// Fass
		
	/*Bergbau*/
		cement[] 	= 	{{"rock"},					{3},	{"cement"},			{1},	false,	900,	"Mamorplatten werden poliert",			false,	0,		"",		true};	// Mamorplatten
	
		gsg[] 		= 	{{"gsg"},					{2},	{"ggn","gsn","gab"},{1,2,2},false,	200,	"Schuerfgut wird gewaschen",			false,	0.05, "ghy",	true};
		ggn[] 		= 	{{"ggn"},					{3},	{"gl"},				{1},	false,	900,	"Goldschmuck werden hergestellt",		false,	0.25,	"",		true};
		gsn[] 		= 	{{"gsn"},					{3},	{"gsm"},			{1},	false,	700,	"Silberschmuck werden hergestellt",		false,	0.25,	"",		true};
		
		diamond1[] 	= 	{{"schgut"},				{1},	{"diamond"},		{1},	false,	130,	"Schuerfgut wird gewaschen",			false,	0,		"",		true};
		diamond2[] 	= 	{{"diamond"},				{1},	{"diamondc"},		{2},	false,	130,	"Edelsteine werden geschliffen",		false,	0,		"",		true};
	/*Öl*/
		rio[] 		= 	{{"rio"},					{3},	{"ben","di"},		{2,1},	false,	180,	"Offshore Öl wird raffiniert",			false,	0,		"",		true};
		oil[] 		= 	{{"oilu"},					{1},	{"oilp"},			{1},	false,	120,	"Roh Öl wird raffiniert",				false,	0,		"",		true};
		oilben[] 	= 	{{"oilu"},					{4},	{"ben"},			{5},	false,	100,	"Treibstoff wird hergestellt",			false,	0.3,	"",		true};
		oildi[] 	= 	{{"oilu"},					{4},	{"di"},				{4},	false,	100,	"Kerosin wird hergestellt",				false,	0.3,	"",		true};
	/*Metallindustrie*/
		iron[] 		= 	{{"ironore"},				{2},	{"iron_r"},			{1},	false,	110,	"Eisenbarren werden gegossen",			false,	0,		"",		true};	// Eisenbarren
		copper[] 	= 	{{"copperore"},				{2},	{"copper_r"},		{1},	false,	750,	"Kupferbarren werden gegossen",			false,	0,		"",		true};	// Kupferbarren
		
		dosen[] 	= 	{{"iron_r","copper_r"},		{3,1},	{"dose"},			{9},	false,	500,	"Dosen werden hergestellt",				false,	0,		"",		true};	// Dosen

		munk[]		= {{"iron_r","copper_r","c3","c4"},{3,2,1,1},{"c1"},		{1},	false,	650,	"Munition wird hergestellt",			false,	0.06,	"",		false};
		waft[] 		= {{"iron_r","copper_r","a0"},	{2,1,1},	{"c2"},			{2},	false,	600,	"Waffenteile werden hergestellt",		false,	0.06,	"",		false};
		bomb[] 		= {{"iron_r","c4","c3","a0"	},	{1,2,3,1},	{"blastingcharge"},{1},	false,	600,	"Sprengladung herstellen",				false,	0.06,	"",		false};
		firwo[] 	= {{"c3","salt","a4"	},		{3,1,1},	{"fireWo"},{2},	false,	650,			"Feuerwerk herstellen",				false,	0.06,	"",		false};

	/*Schlosser*/
		oilpum[] 	= {{"copper_r","iron_r"},		{2,3},		{"rip"},		{1},	false,	300,	"Ölpumpe wird hergestellt",				true,	0,		"",		true};
		hydr[] 		= {{"copper_r","iron_r"},		{2,3},		{"ghy"},		{1},	false,	200,	"Hydro Riffel wird hergestellt",		true,	0,		"",		true};
		bohrg[] 	= {{"copper_r","iron_r"},		{3,3},		{"rib"},		{3},	false,	200,	"Bohrgestänge wird hergestellt",		false,	0.05,	"",		true};
		mach[] 		= {{"copper_r","iron_r"},		{1,1},		{"mache"},		{1},	false,	100,	"Machete wird hergestellt",				false,	0,		"",		true};
		diet[] 		= {{"copper_r","iron_r"},		{1,1},		{"lockpick"},	{1},	false,	100,	"Dietrich wird hergestellt",			false,	0,		"",		true};
		bolz[] 		= {{"copper_r","iron_r"},		{1,2},		{"boltcutter"},	{1},	false,	200,	"Bolzenschneider wird hergestellt",		true,	0,		"",		true};			
		bohr[] 		= {{"iron_r","copper_r","a0"},	{1,2,2},	{"c6"},			{1},	false,	600,	"Bohrmaschine herstellen",				false,	0.1,	"",		false};
		ketts[] 	= {{"copper_r","iron_r"},		{1,3},		{"a8"},			{1},	false,	700,	"Kettensäge wird gebaut",				true,	0.15,	"",		true};
		press[] 	= {{"iron_r","copper_r"},		{3,2},		{"a9"},			{1},	false,	600,	"Presslufthammer wird hergestellt",		true,	0.16,	"",		false};
		axttt[] 	= {{"iron_r","copper_r"},		{2,1},		{"a7"},			{1},	false,	600,	"Axt wird hergestellt",					true,	0.16,	"",		false};

		/*Eingeplegt in NPC ???? */
		stahlt[]	= {{"copper_r","iron_r"},		{1,2},		{"stt"},		{1},	false,	300,	"Stahlträger werden hergestellt",		false,	0,		"",		true};

	/*UHR*/
		marijuana[] =	{{"cannabis"},				{1},	{"marijuana"},		{1},	false,	100,	"Marihuana wird verarbeitet",			false,	0,		"",		true};
		turtle[] 	=	{{"turtle"},				{1},	{"turtlesoup"},		{3},	false,	100,	"Schildkroeten werden verarbeitet",		false,	0,		"",		false};
		cocaine[] 	= 	{{"cocaine"},				{1},	{"cocainep"},		{1},	false,	100,	"Kokain wird verarbeitet",				false,	0,		"",		true};
		souv[] 		= 	{{"coral"},					{1},	{"corsurv"},		{1},	false,	100,	"Souvenir wird hergestellt",			false,	0,		"",		false};
		souvlava[] 	= 	{{"lava"},					{1},	{"corsurvlava"},		{1},	false,	150,	"Lavafiguren werden hergestellt",			false,	0,		"",		false};
		perlk[] 	= 	{{"perl"},					{3},	{"perlp"},			{1},	false,	150,	"Perlenkette wird hergestellt",			false,	0,		"",		false};
		heiltee[] 	= 	{{"tee","cocainep","marijuana","natkra"},{3,1,1,1},{"nattee"},		{2},	false,	150,	"Naturheilkräutertee wird hergestellt",	false,	0,		"",		false};
		
		kafroe[] 	= 	{{"cofbea"},				{2},	{"cofbeap"},		{1},	false,	150,	"Kaffee wird geroestet",				false,	0,		"",		false};
		kafsch[] 	= 	{{"cofbea"},				{3},	{"cofbeas"},		{1},	false,	150,	"Kopi Luwak gereinigt",				false,	0,		"",		false};
		kafmasch[] 	= 	{{"cofbeap","water"},		{1,1},	{"coffee"},			{5},	false,	150,	"Kaffee wird gekocht",					false,	0,		"",		false};
		
	/*REB*/
		lsd[] 		=  	{{"lsdu"},					{1},	{"lsdp"},			{1},	false,	190,	"LSD wird hergestellt",					false,	0,  	"",		true};
		lsdreb[] 	=  	{{"lsdu"},					{2},	{"lsdp"},			{1},	false,	190,	"LSD wird hergestellt",					false,	0,  	"",		false};	
	
		cocastreck[]= 	{{"cocainep","streckm"},	{1,1},	{"cocainep"},		{3},	false,	150,	"Kokain wird gestreckt",				false,	0,		"",		false};
		maristreck[]=	{{"marijuana","streckm"},	{1,1},	{"marijuana"},		{3},	false,	130,	"Marihuana wird gestreckt",				false,	0,		"",		false};

		meth[] 		= 	{{"methu"},					{1},	{"methp"},			{1},	false,	210,	"Koche Meth",							false,	0,		"",		false};
		heroin[] 	= 	{{"heroinu"},				{1},	{"heroinp"},		{1},	false,	170,	"Heroin wird verarbeitet",				false,	0,		"",		false};

	/* NEU ENDE */
		
		/*Noch keine Standort */
		salt[] 		= 	{{"salt"},					{2},	{"salt_r"},			{1},	false,	100,	"Salz wird verarbeitet",				false,	0,		"",		true};
		saltp[]		= 	{{"salt_r"},				{3},	{"c4"},				{1},	false,	100,	"Salpeter wird hergestellt",			false,	0,		"",		true};
		
		mull[]		= 	{{"mull"},					{2},	{"a0"},				{1},	false,	100,	"Kunststoff wird hergestellt",			false,	0,		"",		false};
		
		
		
		sand[] 		= 	{{"sand"},					{1},	{"glass"},			{1},	false,	110,	"Sand wird verarbeitet",				false,	0,		"",		true};

		hfell[] 	= 	{{"rabbitf"},				{1},	{"rabbitfp"},		{1},	false,	200,	"Hasenfelle werden verarbeitet",		false,	0,		"",		true};
		zfell[] 	= 	{{"goatrawf"},				{1},	{"goatrawfp"},		{1},	false,	200,	"Ziegenfelle werden verarbeitet",		false,	0,		"",		true};

		flas[] 		= {{"sand"},					{1},		{"a10"},		{2},	false,	96,	"Flaschen werden hergestellt",			false,	-0.1,	"",		false};
		moon[] 		= {{"20","a10"},				{1,5},		{"21"},			{5},	false,	650,	"Moonshine wird abgefüllt",				false,	-0.12,	"",		false};
		maifa[] 	= {{"iron_r","a0"},				{2,14},		{"16"},			{1},	false,	650,	"Maischefass wird hergestellt",			true,	0.12,	"",		false};
		dest[] 		= {{"iron_r","copper_r","a0"},	{2,10,1},	{"15"},			{1},	false,	650,	"Destille wird gebaut",					true,	0.18,	"",		false};
		methy[] 	= {{"18","fuelE"},				{3,1},		{"fuelF"},		{1},	false,	650,	"Kanister wird aufgefuellt",			false,	-0.18,	"",		false};
	//	 "wabo{} = {{"iron_r","c4","c3","a0"},{1,2,1,1},{"blastingcharge"},{1},false,6500,"Sprengladung herstellen",false,0.06,"",false}

		test[] 		= {{"water","apple"},			{2,3},		{"HandGrenade_Stone","LMG_Zafir_F"},{2,3}, true, 100, "stelle her", false, 0.3,"",false};
	};		
};


class Shops {
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
	║	File: Liga_Cfg_vItems.hpp	
	║		
	║	Author:  Hirschi - Die Liga		
	╠═════════════════════════════════════════════════════════════════╗
	║	ITEM,		Verkaufspreis,	 Kaufpreis,		Warehouse
	║	"",			-1	= gesperrt,-1	= gesperrt,	""	= Festpreis
	║	
	║	Warehouse Kennungen
	║	
	║	""					Festpreis
	║	"liga_wh_3"		künstlich erzeugter Verbauch / Session
	║	"liga_wh_1"		Lager CIV		Dump
	║	"liga_wh_2"		Lager UHR 	Dump
	║	"liga_wh_4"		Lager UHR 	Fest
	╚═════════════════════════════════════════════════════════════════╝
*/
	
	/*Tanklager Benzin & Kerosin*/
	class tank {
		CIV[]	= {
			"Oelhaendler",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"oilp",			3800,	4500,	"liga_wh_1"	},
				{"ben",				4250,	5400,	"liga_wh_4"	},
				{"di",				3950,	5900,	"liga_wh_4"	}
			}		
		};
		UHR[]	= {
			"Oelhaendler",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"oilp",			3800,	4500,	"liga_wh_1"	},
				{"ben",				4750,	6400,	"liga_wh_4"	},
				{"di",				4850,	6900,	"liga_wh_4"	}
			}		
		};	
		REB[]	= {
			"Oelhaendler",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"oilp",			3800,	4500,	"liga_wh_1"	},
				{"ben",				4750,	6400,	"liga_wh_4"	},
				{"di",				4850,	6900,	"liga_wh_4"	}
			}		
		};	
	};	
	
	class oilrig {
		CIV[]	= {
			"Bohrturm Ausruestung",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
	//			{"rib",				9500,	11000,	"liga_wh_4"	},   // Bohrgestänge
				{"rip",				6250,	6900,	"liga_wh_4"	}    //öhlpumpe
			}		
		};
		UHR[]	= {
			"Bohrturm Ausruestung",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
	//			{"rib",				9500,	11000,	"liga_wh_4"	},
				{"rip",				6250,	6900,	"liga_wh_4"	}
			}		
		};	
		REB[]	= {
			"Bohrturm Ausruestung",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
	//			{"rib",				9500,	11000,	"liga_wh_4"	},
				{"rip",				6250,	6900,	"liga_wh_4"	}
			}		
		};	
	};		

	/*Tanklager LEIM*/
	class spantank {
		CIV[]	= {
			"Leimtank",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"a3",				220	,	-1	,	""	}
			}		
		};
		UHR[]	= {
			"Leimtank",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"a3",				190	,	-1	,	""	}
			}		
		};	
		REB[]	= {
			"Leimtank",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"a3",				180	,	-1	,	""	}
			}		
		};	
	};	
	/* Brennerei Fasslager */
	class fasslager {
		CIV[]	= {
			"Fasslager",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"fassinv",	 3800	,	5200	,	"liga_wh_4"	}
			}		
		};
		UHR[]	= {
			"Fasslager",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"fassinv",				3800	,	5200	,	"liga_wh_4"	}
			}		
		};	
		REB[]	= {
			"Fasslager",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"fassinv",				3800	,	5200	,	"liga_wh_4"	}
			}		
		};	
	};	
	
	// .... usw ... 

	class partyile {
		CIV[]	= {
			"Partymeile",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"21",				-1	,	12500,	""	},
				{"marijuana",		-1	,	7000	,	""	},
				{"cocainep",		-1	,	7500	,	""	},
				{"lsdp",			-1 ,	9999,	""	},
				{"heroinp",			-1	,	3500,	""	},
				{"nattee",			-1	,	25000,	""	},
				{"methp",			-1	,	3500,	""	}
			}		
		};
		UHR[]	= {
			"Partymeile",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"21",				-1	,	12500	,	""	},
				{"marijuana",		-1	,	7000	,	""	},
				{"cocainep",		-1	,	7500	,	""	},
				{"lsdp",			-1	,	8900,	""	},
				{"heroinp",			-1	,	3500,	""	},
				{"nattee",			-1	,	22000,	""	},
				{"methp",			-1	,	3500	,	""	}
			}		
		};	
		REB[]	= {
			"Partymeile",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"21",				13900,	13500	,	""	},
				{"marijuana",		2200	,	7000	,	""	},
				{"cocainep",		4000	,	7500	,	""	},
				{"lsdp",			4400,	7800,	""	},
				{"heroinp",			2200,	3500,	""	},
				{"nattee",			11000,	22000,	""	},
				{"methp",			3200,	3500	,	""	}
			}		
		};	
	};	
	
	class partyleg {
		CIV[]	= {
			"Partymeile",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"redgull",		14500,	16500	,	"liga_wh_1"		},	//	Edelsteine
				{"bottledbeer",		16600,	19700,	"liga_wh_1"	},
				{"coffee",			300	,	330	,	"liga_wh_1"	},
				{"doen",			-1	,	350	,	""	},
				{"wein",			-1	,	320	,	""	},
				{"zig",				-1	,	500	,	""	},
				{"uzo",				-1	,	800	,	""	},
				{"donuts",			-1	,	500	,	""	}
			}		
		};
		UHR[]	= {
			"Partymeile",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"redgull",		14500,	16500	,	"liga_wh_1"		},	//	Edelsteine
				{"bottledbeer",		16600,	19700,	"liga_wh_1"	},
				{"coffee",			300	,	330	,	"liga_wh_1"	},
				{"doen",			-1	,	350	,	""	},
				{"wein",			-1	,	320	,	""	},
				{"zig",				-1	,	500	,	""	},
				{"uzo",				-1	,	800	,	""	},
				{"donuts",			-1	,	500	,	""	}
			}		
		};	
		REB[]	= {
			"Partymeile",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"redgull",		14500,	16500	,	"liga_wh_1"		},	//	Edelsteine
				{"bottledbeer",		16600,	19700,	"liga_wh_1"	},
				{"coffee",			300	,	330	,	"liga_wh_1"	},
				{"doen",			-1	,	350	,	""	},
				{"wein",			-1	,	320	,	""	},
				{"zig",				-1	,	500	,	""	},
				{"uzo",				-1	,	800	,	""	},
				{"donuts",			-1	,	500	,	""	}
			}		
		};	
	};		

	class fishmarket {
		CIV[]	= {
			"Tanoa Fisch Markt",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"salema",			145	,	200	,	"liga_wh_1"	},
				{"ornate",			140	,	195	,	"liga_wh_1"	},
				{"mackerel",		275	,	300	,	"liga_wh_1"	},
				{"mullet",			400	,	500	,	"liga_wh_1"	},
				{"tuna",			1000,	1200,	"liga_wh_1"	},
				{"catshark",		2300,	2600,	"liga_wh_1"	}
			}		
		};
		UHR[]	= {
			"Tanoa Fisch Markt",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"salema",			145	,	200	,	"liga_wh_1"	},
				{"ornate",			140	,	195	,	"liga_wh_1"	},
				{"mackerel",		275	,	300	,	"liga_wh_1"	},
				{"mullet",			400	,	500	,	"liga_wh_1"	},
				{"tuna",			1000,	1200,	"liga_wh_1"	},
				{"catshark",		2300,	2600,	"liga_wh_1"	}
			}		
		};	
		REB[]	= {
			"Tanoa Fisch Markt",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"salema",			145	,	200	,	"liga_wh_1"	},
				{"ornate",			140	,	195	,	"liga_wh_1"	},
				{"mackerel",		275	,	300	,	"liga_wh_1"	},
				{"mullet",			400	,	500	,	"liga_wh_1"	},
				{"tuna",			1000,	1200,	"liga_wh_1"	},
				{"catshark",		2300,	2600,	"liga_wh_1"	}
			}		
		};	
	};	

	class outdoor {
		CIV[]	= {
			"Outdoor Shop",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"17",			-1	,	49500	,	""			},	// Zelt
				{"14",			-1	,	38000	,	""			},	// Tarnnetz
			//	{"jame",		700	,	800	,	""			},	// Jagdmesser
			//	{"ghy",			1200,	2400,	"liga_wh_1"	},	// Hydroriffel
				{"pickaxe",		-1	,	800	,	""			},	// Spitzhacke
			//	{"a9",			12000,	16000,	"liga_wh_1"	},	// Presslufthammer
				{"a7",			6500,	9800,	"liga_wh_1"	},	// Axt
			//	{"c6",			8900,	13000,	"liga_wh_1"	},	//Bohrmaschine
			//	{"a8",			9600,	14500,	"liga_wh_1"	},	// Kettensäge
				{"mache",		4800,	6900,	"liga_wh_1"	},	// Machete
			//	{"boltcutter",	7200,	-1	,	"liga_wh_1"	},	// Bolzenschneider
			//	{"lockpick",	4800,	-1	,	"liga_wh_1"	},	// Dietrich
				{"a11",			-1	,	550	,	""			},	//Hefe
			//	{"rabbit",		-1	,	800	,	""			},
			//	{"tuna",		-1	,	800	,	""			},
				{"water",		-1	,	80	,	""			},
				{"prl",		1600	,	2100	,	""		},
				{"gpstracker",	-1	,	50000,	""			},
				{"fuelF",		-1	,	5550	,	""			},
				{"b22",			-1	,	3500	,	""			},
				{"b23",			-1	,	4000	,	""			}
			}		
		};
		UHR[]	= {
			"Outdoor Shop",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"17",			-1	,	49500	,	""			},	// Zelt
				{"14",			-1	,	38000	,	""			},	// Tarnnetz
			//	{"jame",		700	,	800	,	""			},	// Jagdmesser
			//	{"ghy",			1200,	2400,	"liga_wh_1"	},	// Hydroriffel
				{"pickaxe",		-1	,	800	,	""			},	// Spitzhacke
			//	{"a9",			12000,	16000,	"liga_wh_1"	},	// Presslufthammer
				{"a7",			6500,	9800,	"liga_wh_1"	},	// Axt
			//	{"c6",			8900,	13000,	"liga_wh_1"	},	//Bohrmaschine
			//	{"a8",			9600,	14500,	"liga_wh_1"	},	// Kettensäge
				{"mache",		4800,	6900,	"liga_wh_1"	},	// Machete
			//	{"boltcutter",	7200,	-1	,	"liga_wh_1"	},	// Bolzenschneider
			//	{"lockpick",	4800,	-1	,	"liga_wh_1"	},	// Dietrich
			//	{"rabbit",		-1	,	800	,	""			},
			//	{"tuna",		-1	,	800	,	""			},
				{"a11",			-1	,	550	,	""			},	//Hefe
				{"prl",		1200	,	1900	,	""		},
				{"water",		-1	,	80	,	""			},
				{"gpstracker",	-1	,	50000,	""			},
				{"fuelF",		-1	,	5550	,	""			},
				{"b22",			-1	,	3500	,	""			},
				{"b23",			-1	,	4000	,	""			}
			}		
		};	
		REB[]	= {
			"Outdoor Shop",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"17",			-1	,	49500	,	""			},	// Zelt
				{"14",			-1	,	38000	,	""			},	// Tarnnetz
			//	{"jame",		700	,	800	,	""			},	// Jagdmesser
			//	{"ghy",			1200,	2400,	"liga_wh_1"	},	// Hydroriffel
				{"pickaxe",		-1	,	800	,	""			},	// Spitzhacke
			//	{"a9",			12000,	16000,	"liga_wh_1"	},	// Presslufthammer
				{"a7",			6500,	9800,	"liga_wh_1"	},	// Axt
			//	{"c6",			8900,	13000,	"liga_wh_1"	},	//Bohrmaschine
			//	{"a8",			9600,	14500,	"liga_wh_1"	},	// Kettensäge
				{"mache",		4800,	6900,	"liga_wh_1"	},	// Machete
			//	{"boltcutter",	7200,	18000,	"liga_wh_1"	},	// Bolzenschneider
			//	{"lockpick",	4800,	12000,	"liga_wh_1"	},	// Dietrich
				{"a11",			-1	,	550	,	""			},	//Hefe
			//	{"rabbit",		-1	,	800	,	""			},
			//	{"tuna",		-1	,	800	,	""			},
				{"water",		-1	,	80	,	""			},
				{"gpstracker",	-1	,	50000,	""			},
				{"prl",		1600	,	2100	,	""		},
				
				{"fuelF",		-1	,	5550	,	""			},
				{"b22",			-1	,	3500	,	""			},
				{"b23",			-1	,	4000	,	""			}
			}		
		};	
	};	
	
	class tauch {
		CIV[]	= {
			"Tauchzubehoer",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"prl",		1600	,	2100	,	""		}
		//		{"prlhe",	1500	,	2100	,	""		}
	//			{"jame",		700	,	800	,	""		}
			}		
		};
		UHR[]	= {
			"Tauchzubehoer",
			{
				{"prl",		1200	,	1900	,	""		},
			//	{"prlhe",	1500	,	2100	,	""		},
				{"jame",		-1	,	19000,	""		}
			}		
		};	
		REB[]	= {
			"Tauchzubehoer",
			{
				{"prl",		1600	,	2500	,	""		}
			//	{"prlhe",	1500	,	2100	,	""		}
	//			{"jame",		700	,	800	,	""		}
			}		
		};	
	};	

	/*JOBS*/
	class glass {
		CIV[]	= {
			"Glashändler",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"glass",		1400,	2400,	"liga_wh_1"		},
				{"a10",			450	,	600	,	"liga_wh_1"		}
			}		
		};
		UHR[]	= {
			"Glashändler",
			{
				{"glass",		1400,	2400,	"liga_wh_1"		},
				{"a10",			450	,	600	,	"liga_wh_1"		}
			}		
		};	
		REB[]	= {
			"Glashändler",
			{
				{"glass",		1400,	2400,	"liga_wh_1"		},
				{"a10",			450	,	600	,	"liga_wh_1"		}
			}		
		};	
	};	

	class iron {
		CIV[]	= {
			"Metallhändler",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"iron_r",		3350	,	5700	,	"liga_wh_1"		},
				{"copper_r",	3050	,	5400	,	"liga_wh_1"		},
				{"stt",			12200	,	-1	,	"liga_wh_1"		}
			}		
		};
		UHR[]	= {
			"Metallhändler",
			{
				{"iron_r",		3350	,	5700	,	"liga_wh_1"		},
				{"copper_r",	3050	,	5400	,	"liga_wh_1"		},
				{"stt",			12200	,	-1	,	"liga_wh_1"		}
			}		
		};	
		REB[]	= {
			"Metallhändler",
			{
				{"iron_r",		3350	,	6200	,	"liga_wh_1"		},
				{"copper_r",	3050	,	5900	,	"liga_wh_1"		},
				{"stt",			12200	,	-1	,	"liga_wh_1"		}
			}		
		};	
	};		
	
	class recy {
		CIV[]	= {
			"Recyclinghof",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"mull",		700	,	-1	,	"liga_wh_1"		},
				{"a0",			700	,	800	,	"liga_wh_1"		}	//Kunststoff
			}		
		};
		UHR[]	= {
			"Recyclinghof",
			{
				{"mull",		700	,	-1	,	"liga_wh_1"		},
				{"a0",			700	,	800	,	"liga_wh_1"		}	//Kunststoff
			}		
		};	
		REB[]	= {
			"Recyclinghof",
			{
				{"mull",		700	,	-1	,	"liga_wh_1"		},
				{"a0",			700	,	800	,	"liga_wh_1"		}	//Kunststoff
			}		
		};	
	};	
	
	class salthan {
		CIV[]	= {
			"Salzkontor",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"salt_r",		2000,	2250,	"liga_wh_1"		}
			}		
		};
		UHR[]	= {
			"Salzkontor",
			{
				{"salt_r",		1950,	2250,	"liga_wh_1"		}
			}		
		};	
		REB[]	= {
			"Salzkontor",
			{
				{"salt_r",		1950,	2250,	"liga_wh_1"		}
			}		
		};	
	};		
	
	class likea {
		CIV[]	= {
			"LiKEA",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
		//		{"storagebig",	120000	,	850000	,	"liga_wh_1"		},
				{"a6",			4450	,	4750	,	"liga_wh_1"		},
				{"b22",			700	,	800	,	"liga_wh_1"		},
				{"b23",			700	,	800	,	"liga_wh_1"		},
				{"kaffmasch",	700	,	800	,	""				}	// Kaffeemaschine
			}		
		};
		UHR[]	= {
			"LiKEA",
			{
		//		{"storagebig",	120000	,	850000	,	"liga_wh_1"		},
				{"a6",			4450	,	4750	,	"liga_wh_1"		},
				{"b22",			700	,	800	,	"liga_wh_1"		},
				{"b23",			700	,	800	,	"liga_wh_1"		},
				{"kaffmasch",	700	,	800	,	""				}	// Kaffeemaschine
			}		
		};	
		REB[]	= {
			"LiKEA",
			{
		//		{"storagebig",	120000	,	850000	,	"liga_wh_1"		},
				{"a6",			4450	,	4750	,	"liga_wh_1"		},
				{"b22",			700	,	800	,	"liga_wh_1"		},
				{"b23",			700	,	800	,	"liga_wh_1"		},
				{"kaffmasch",	700	,	800	,	""				}	// Kaffeemaschine
			}		
		};	
	};			
	
	class expo {
		CIV[]	= {
			"Exportlager",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"banan",		530	,	650	,	"liga_wh_1"		},	// Bananen
				{"bw",			2050	,	2200	,	"liga_wh_1"		},	// Ananaskonserver
				{"cement",		6600,	7600,	"liga_wh_1"		},	//	Mamorplatten
				{"tet",			3500,	4500,	"liga_wh_1"		},	// Palmoel
				{"bottledbeer",	16600,	19700,	"liga_wh_1"		},	// Liga Finest Rum
			//	{"fassinv",		6600,	7700,	"liga_wh_1"		},	// Fässer
				{"a5",			5450,	6800,	"liga_wh_1"		},	// Spanplatten
				{"schok",		2400,	3000,	"liga_wh_1"		},	//	Schokolade
				{"kakap",		1000,	1500	,	"liga_wh_1"		},	//	Kakao geröstet
			//	{"a6",			700	,	800	,	"liga_wh_1"		},	//	Möbel
				{"ggn",			2200,	4500,	"liga_wh_1"		},	//	Goldnuggets
				{"gsn",			1800,	4200,	"liga_wh_1"		},	//	Silbernuggets
				{"gl",			14000,	-1,	"liga_wh_1"		},	//	Goldschmuck
				{"gsm",			13700,	-1,	"liga_wh_1"		},	//	Silberschmuck
				{"diamondc",	4400,	6000	,	"liga_wh_1"		},	//	Edelsteine
				{"redgull",		14500,	16500	,	"liga_wh_1"		}	//	Edelsteine
			}		
		};
		UHR[]	= {
			"Exportlager",
			{
				{"banan",		530	,	650	,	"liga_wh_1"		},	// Bananen
				{"bw",			2000	,	2200	,	"liga_wh_1"		},	// Ananaskonserver
				{"cement",		6600,	7600,	"liga_wh_1"		},	//	Mamorplatten
				{"tet",			3500,	4500,	"liga_wh_1"		},	// Palmoel
				{"bottledbeer",	16600,	19700,	"liga_wh_1"		},	// Liga Finest Rum
			//	{"fassinv",		6600,	7700,	"liga_wh_1"		},	// Fässer
				{"a5",			5450,	6800,	"liga_wh_1"		},	// Spanplatten
				{"schok",		2400,	3000,	"liga_wh_1"		},	//	Schokolade
				{"kakap",		1000,	1500	,	"liga_wh_1"		},	//	Kakao geröstet
			//	{"a6",			700	,	800	,	"liga_wh_1"		},	//	Möbel
				{"ggn",			2200,	4500,	"liga_wh_1"		},	//	Goldnuggets
				{"gsn",			1800,	4200,	"liga_wh_1"		},	//	Silbernuggets
				{"gl",			14000,	-1,	"liga_wh_1"		},	//	Goldschmuck
				{"gsm",			13700,	-1,	"liga_wh_1"		},	//	Silberschmuck
				{"diamondc",	4400,	6000	,	"liga_wh_1"		},	//	Edelsteine
				{"redgull",		14500,	16500	,	"liga_wh_1"		}	//	Edelsteine

			}		
		};	
		REB[]	= {
			"Exportlager",
			{
				{"banan",		530	,	650	,	"liga_wh_1"		},	// Bananen
				{"bw",			2000	,	2200	,	"liga_wh_1"		},	// Ananaskonserver
				{"cement",		6400,	7600,	"liga_wh_1"		},	//	Mamorplatten
				{"tet",			3500,	4500,	"liga_wh_1"		},	// Palmoel
				{"bottledbeer",	16600,	19700,	"liga_wh_1"		},	// Liga Finest Rum
			//	{"fassinv",		6600,	7700,	"liga_wh_1"		},	// Fässer
				{"a5",			5450,	6800,	"liga_wh_1"		},	// Spanplatten
				{"schok",		2400,	3000,	"liga_wh_1"		},	//	Schokolade
				{"kakap",		1000,	1550,	"liga_wh_1"		},	//	Kakao geröstet
			//	{"a6",			700	,	800	,	"liga_wh_1"		},	//	Möbel
				{"ggn",			2200,	4500,	"liga_wh_1"		},	//	Goldnuggets
				{"gsn",			1800,	4200,	"liga_wh_1"		},	//	Silbernuggets
				{"gl",			14000,	-1,	"liga_wh_1"		},	//	Goldschmuck
				{"gsm",			13700,	-1,	"liga_wh_1"		},	//	Silberschmuck
				{"diamondc",	4400,	6000	,	"liga_wh_1"		},	//	Edelsteine
				{"redgull",		14500,	16500	,	"liga_wh_1"		}	//	Edelsteine

			}		
		};	
	};		
			
	/*Rebellen*/
	class restaur {
		CIV[]	= {
			"Gourmetrestaurant",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"tet",			3600,	4700,	"liga_wh_3"		},		// Palmoel
				{"salt_r",		1650,	-1	,	"liga_wh_3"		},		// Ziegenfleisch
				{"banan",		90	,	-1	,	"liga_wh_3"		},		// Bananen
				{"ana",			120	,	-1	,	"liga_wh_3"		},		// Ananas
				{"apple",		280	,	-1	,	"liga_wh_3"		},		// Süßkartoffeln
				{"peach",		240	,	-1	,	"liga_wh_3"		},		// Kokusnuesse
				{"goatraw",		3200,	-1	,	"liga_wh_3"		},		// Ziegenfleisch
				{"sheepraw",	2700,	-1	,	"liga_wh_3"		},		// Schafsfleisch
				{"tutrei",		1700,	-1	,	"liga_wh_3"		},		// Schildi Eier
				{"turtlesoup",	9200,	-1	,	"liga_wh_3"		},		// Schildi Fleisch
				{"cofbeas",		3800,	-1	,	"liga_wh_3"		},		// Kopi Luwak
				{"bottledbeer",		16600,	19700,	"liga_wh_3"	},	// Ligas Finest Rum
				{"schok",		2400,	3000,	"liga_wh_3"		},		// Schokolade
				{"hode",		2400,	-1	,	"liga_wh_3"		},		// Tierklöten
				{"stofish",		1700,	-1	,	"liga_wh_3"		}		// Stockfisch
			}		
		};
		UHR[]	= {
			"Gourmetrestaurant",
			{
				{"tet",			3600,	4700,	"liga_wh_3"		},		// Palmoel
				{"salt_r",		1650,	-1	,	"liga_wh_3"		},		// Ziegenfleisch
				{"banan",		90	,	-1	,	"liga_wh_3"		},		// Bananen
				{"ana",			120	,	-1	,	"liga_wh_3"		},		// Ananas
				{"apple",		240	,	-1	,	"liga_wh_3"		},		// Süßkartoffeln
				{"peach",		280	,	-1	,	"liga_wh_3"		},		// Kokusnuesse
				{"goatraw",		3200,	-1	,	"liga_wh_3"		},		// Ziegenfleisch
				{"sheepraw",	2700,	-1	,	"liga_wh_3"		},		// Schafsfleisch
				{"tutrei",		1700,	-1	,	"liga_wh_3"		},		// Schildi Eier
				{"turtlesoup",	9200,	-1	,	"liga_wh_3"		},		// Schildi Fleisch
				{"cofbeas",		3800,	-1	,	"liga_wh_3"		},		// Kopi Luwak
				{"bottledbeer",		16600,	19700,	"liga_wh_3"	},	// Ligas Finest Rum
				{"schok",		2400,	3000,	"liga_wh_3"		},		// Schokolade
				{"hode",		2400,	-1	,	"liga_wh_3"		},		// Tierklöten
				{"stofish",		1700,	-1	,	"liga_wh_3"		}		// Stockfisch

			}		
		};	
		REB[]	= {
			"Gourmetrestaurant",
			{
				{"tet",			3600,	4700,	"liga_wh_3"		},		// Palmoel
				{"salt_r",		1650,	-1	,	"liga_wh_3"		},		// Ziegenfleisch
				{"banan",		90	,	-1	,	"liga_wh_3"		},		// Bananen
				{"ana",			120	,	-1	,	"liga_wh_3"		},		// Ananas
				{"apple",		220	,	-1	,	"liga_wh_3"		},		// Süßkartoffeln
				{"peach",		280	,	-1	,	"liga_wh_3"		},		// Kokusnuesse
				{"goatraw",		3200,	-1	,	"liga_wh_3"		},		// Ziegenfleisch
				{"sheepraw",	2700,	-1	,	"liga_wh_3"		},		// Schafsfleisch
				{"tutrei",		1700,	-1	,	"liga_wh_3"		},		// Schildi Eier
				{"turtlesoup",	9200,	-1	,	"liga_wh_3"		},		// Schildi Fleisch
				{"cofbeas",		2400,	-1	,	"liga_wh_3"		},		// Kopi Luwak
				{"bottledbeer",		16600,	19700,	"liga_wh_3"	},	// Ligas Finest Rum
				{"schok",		2400,	3000,	"liga_wh_3"		},		// Schokolade
				{"hode",		2400,	-1	,	"liga_wh_3"		},		// Tierklöten
				{"stofish",		1700,	-1	,	"liga_wh_3"		}		// Stockfisch

			}		
		};	
	};	
	
	class apoth {
		CIV[]	= {
			"Apotheke",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/

			}		
		};
		UHR[]	= {
			"Apotheke",
			{

			}		
		};	
		REB[]	= {
			"Apotheke",
			{
				{"methu",		-1	,	800	,	""				},	// Meth unver
				{"streckm",		-1	,	800	,	""				}	// Streckmittel
			}		
		};	
	};	
	
	class schmugg {//
		CIV[]	= {
			"Schmuggler",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};
		UHR[]	= {
			"Schmuggler",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};	
		REB[]	= {
			"Schmuggler",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"a1t",				1200,	-1,	"liga_wh_1"	},		// Tropenholz
				{"tutrei",			800	,	-1	,	"liga_wh_1"	},		// Schild Eier
				{"turtlesoup",		9600,	-1	,	"liga_wh_1"	},		// Schild Fleisch
				{"21",				10900,	12000,	"liga_wh_1"	},		// Flasche Moonshine
				{"marijuana",		3000,	-1	,	"liga_wh_1"	},		// Marihuana
				{"cocainep",		4800,	-1	,	"liga_wh_1"	},		// Kokain
				{"heroinp",			2600,	-1	,	"liga_wh_1"	},		// Heroin
				{"lsdp",			4900,	-1,	"liga_wh_1"	},		// LSD
				{"methp",			3400,	-1	,	"liga_wh_1"	},		// Meth
				{"nattee",			13200,	-1	,	"liga_wh_1"	}		// Naturheilkräutertee
			}		
		};	
	};
	
	class wafschmug {
		CIV[]	= {
			"Waffenschmuggler",
			{/*	"ITEEM,	Verkauf,	Kauf,	WH	*/
				{"c4",			2200,	3000	,	"liga_wh_1"		},
				{"c3",			700	,	800	,	"liga_wh_1"		},	
				{"c2",			11600,	13600,	"liga_wh_1"		},	// Waffenteile
				{"c1",			16000,	21000,	"liga_wh_1"		}	// Munition
			}		
		};
		UHR[]	= {
			"Waffenschmuggler",
			{
				{"c4",			2200	,	3000	,	"liga_wh_1"		},
				{"c3",			700	,	800	,	"liga_wh_1"		},
				{"c2",			11600,	13600,	"liga_wh_1"		},	// Waffenteile
				{"c1",			16000,	21000,	"liga_wh_1"		}	// Munition
			}		
		};	
		REB[]	= {
			"Waffenschmuggler",
			{
				{"c4",			2200	,	3000	,	"liga_wh_1"		},
				{"c3",			700	,	800	,	"liga_wh_1"		},
				{"c2",			11600,	13600,	"liga_wh_1"		},	// Waffenteile
				{"c1",			16000,	21000,	"liga_wh_1"		}	// Munition
			}		
		};	
	};		
	

/* U(h)reinwohner */
	
	/* Dorfältester */
	class medimann_1 {//Dorfältester
		CIV[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};
		UHR[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"21",				10100,	-1	,	""	},
				{"marijuana",		2100,	-1	,	""	},
				{"cocainep",		4000,	-1	,	""	},
				{"lsdp",			4200,	-1	,	""	},
				{"methp",			3200,	-1	,	""	},
				{"nattee",			10000,	-1	,	""	}		// Naturheilkräutertee
			}		
		};	
		REB[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};	
	};	
	class medimann_2 {//Dorfältester
		CIV[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};
		UHR[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"21",				10500,	-1	,	""	},
				{"marijuana",		2000,	-1	,	""	},
				{"cocainep",		4000,	-1	,	""	},
				{"lsdp",			4100,	-1	,	""	},
				{"methp",			3200,	-1	,	""	}
			}		
		};	
		REB[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};	
	};	

	class medimann_legal { //Dorfältester
		CIV[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};
		UHR[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"peach",			240	,	360	,	"liga_wh_2"	},	// Kokosnüsse
				{"banan",			230	,	360	,	"liga_wh_2"	},	// Bannanen
				{"stofish",			2800,	6000	,	"liga_wh_2"	},	// Stockfisch				
				{"water",			-1	,	200	,	""			}
			}		
		};	
		REB[]	= {
			"Dorfälteste",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/

			}		
		};	
	};	
	
	class handelspos {
		CIV[]	= {
			"Handelsposten Hinterzimmer",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"nattee",			11000,	40000	,	"liga_wh_2"	}
			}		
		};
		UHR[]	= {
			"Handelsposten Hinterzimmer",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"a1t",				800	,	900	,		"liga_wh_2"	},
				{"21",				10700,	12000,		"liga_wh_2"	},
				{"marijuana",		2200,	-1,			"liga_wh_2"	},
				{"cocainep",		4400,	-1,			"liga_wh_2"	},
				{"lsdp",			4200,	9500,		"liga_wh_2"	},
				{"methp",			3400,	5600	,	"liga_wh_2"	},
				{"nattee",			12000,	36000	,	"liga_wh_2"	}
			}		
		};	
		REB[]	= {
			"Handelsposten Hinterzimmer",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"a1t",				800	,	900	,	"liga_wh_2"	},
				{"21",				-1	,	12500,	"liga_wh_2"	},
				{"marijuana",		-1,		4000,	"liga_wh_2"	},
				{"cocainep",		-1,		2300,	"liga_wh_2"	},
				{"lsdp",			3200,	5200,	"liga_wh_2"	},
				{"methp",			3400,	5600,	"liga_wh_2"	},
				{"nattee",			-1	,	90000,	"liga_wh_2"	}
			}		
		};	
	};		

	class handelsposleg {
		CIV[]	= {
			"Handelsposten",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"banan",			230	,	500	,	"liga_wh_2"	},	// Kaffee
				{"coffee",			300	,	350	,	"liga_wh_2"	},	// Kaffee
				{"cofbeap",			2200,	2900,	"liga_wh_2"	},	// Kaffeebohnen geröstet
				{"cofbeas",			3800,	-1	,	"liga_wh_2"	},	// Kopi Luwak
				{"peach",			240	,	900	,	"liga_wh_2"	},	// Kokusnuesse
				{"stofish",			2800,	5000,	"liga_wh_2"	},	// Stockfisch
				{"kaut",			850	,	1400	,	"liga_wh_2"	},	// Kautschuk
				{"corsurv",			3900,	-1	,	"liga_wh_2"	},	// Souvenir
				{"corsurvlava",		2850,	-1	,	"liga_wh_2"	},	// Lavafigur
				{"goatrawfp",		4800,	-1	,	"liga_wh_2"	},	// Ziegenfelle
				{"turtlesoup",		-1	,	14000,	"liga_wh_2"	},	// Schildkroeten Fleisch
				{"perlp",			7300,	11000,	"liga_wh_2"	},	// Perlenkette
				{"hode",			2400,	3500,	"liga_wh_2"	}		// Tierklöten


			}		
		};
		UHR[]	= {
			"Handelsposten",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"banan",			140	,	500	,	"liga_wh_2"	},	// Kaffee
				{"coffee",			300	,	350	,	"liga_wh_2"	},	// Kaffee
				{"cofbeap",			2600,	2900,	"liga_wh_2"	},	// Kaffeebohnen geröstet
				{"cofbeas",			3800,	-1	,	"liga_wh_2"	},	// Kopi Luwak
				{"peach",			240	,	900	,	"liga_wh_2"	},	// Kokusnuesse
				{"stofish",			2800,	5000,	"liga_wh_2"	},	// Stockfisch
				{"kaut",			1050	,	1400	,	"liga_wh_2"	},	// Kautschuk
				{"corsurv",			3900,	-1	,	"liga_wh_2"	},	// Souvenir
				{"corsurvlava",		2850,	-1	,	"liga_wh_2"	},	// Lavafigur
				{"goatrawfp",		4800,	-1	,	"liga_wh_2"	},	// Ziegenfelle
				{"turtlesoup",		8600,	14000,	"liga_wh_2"	},	// Schildkroeten Fleisch
				{"perlp",			9500,	11000	,	"liga_wh_2"	},	// Perlenkette
				{"hode",			2400,	3500,	"liga_wh_2"		}		// Tierklöten

			}		
		};	
		REB[]	= {
			"Handelsposten",
			{/*	"ITEEM,		Verkauf,	Kauf,	WH	*/
				{"banan",			140	,	500	,	"liga_wh_2"	},	// Kaffee
				{"coffee",			300	,	350	,	"liga_wh_2"	},	// Kaffee
				{"cofbeap",			-1	,	2900,	"liga_wh_2"	},	// Kaffeebohnen geröstet
				{"cofbeas",			3800,	-1	,	"liga_wh_2"	},	// Kopi Luwak
				{"peach",			240	,	900	,	"liga_wh_2"	},	// Kokusnuesse
				{"stofish",			2800,	5000	,	"liga_wh_2"	},	// Stockfisch
				{"kaut",			850	,	1200	,	"liga_wh_2"	},	// Kautschuk
			//	{"corsurv",			800	,	900	,	"liga_wh_2"	},	// Souvenir
			//	{"corsurvlava",			1200,	-1	,	"liga_wh_2"	},	// Lavafigur
				{"turtlesoup",		-1	,	14000,	"liga_wh_2"	},	// Schildkroeten Fleisch
				{"goatrawfp",		4800,	-1	,	"liga_wh_2"	},	// Ziegenfelle
				{"perlp",			5800	,	11000	,	"liga_wh_2"	},	// Perlenkette
				{"hode",			2400,	3500,	"liga_wh_2"		}		// Tierklöten


			}		
		};	
	};		
/* Dienste */	
	class flusi {
		CIV[]	= {
			"Flusi Shop",
			{/*	"ITEEM,Verkauf,	Kauf,	WH	*/
				{"water",	-1	,	10,			""		},
				{"banan",	-1	,	140,			"liga_wh_1"		},
				{"coffee",	-1	,	350,			"liga_wh_1"		},
				{"donuts",	-1	,	120,			""		},
			//	{"rabbit",	-1	,	80,			""		},
				{"apple",	-1	,	180,			"liga_wh_1"		},
				{"peach",	-1	,	280,			"liga_wh_1"		},
				{"fuelF",	-1	,	5500,			""		}, //Benzinkanister
				{"kegel",	-1	,	150,			""		},
				{"strahler",-1	,	150,			""		},
				{"14",		-1	,	38000,			""		},  //Tarnnetz
				{"b22",		-1	,	3500,			""		},  //Campingstuhl
				{"b23",		-1	,	4000,			""		}  //Campingstuhl
			}
		};
		UHR[]	= {
			"Flusi Shop",
			{
				{"water",	-1	,	10,			""		},
				{"banan",	-1	,	80,			"liga_wh_1"		},
				{"coffee",	-1	,	350,			"liga_wh_1"		},
				{"donuts",	-1	,	120,			""		},
			//	{"rabbit",	-1	,	80,			""		},
				{"apple",	-1	,	180,			"liga_wh_1"		},
				{"peach",	-1	,	80,			"liga_wh_1"		},
				{"fuelF",	-1	,	5550,			""		},  //Benzinkanister
				{"kegel",	-1	,	150,			""		},
				{"strahler",-1	,	150,			""		},
				{"14",		-1	,	38000,			""		},  //Tarnnetz
				{"b22",		-1	,	3500,			""		},  //Campingstuhl
				{"b23",		-1	,	4000,			""		}  //Campingstuhl
			}
		};
		REB[]	= {
			"Flusi Shop",
			{

			}
		};				
	};
	
	class cop {
		CIV[]	= {
			"Cop Zubehör",
			{/*	"ITEEM,Verkauf,	Kauf,	WH	*/
				{"donuts",		-1	,	120,			""		},
				{"banan",		-1	,	80,			"liga_wh_1"		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},
				{"spikeStrip",	-1	,	2500,			""		},  //Nagelbänder
				{"mauer",		-1	,	750,			""		},  //Absperrung
				{"kegel",		-1	,	150,			""		},
				{"water",		-1	,	10,			""		},
			//	{"rabbit",		-1	,	80,			""		},
				{"apple",		-1	,	80,			"liga_wh_1"		},
				{"doen",		-1	,	55,			""		},
				{"redgull",		-1	,	16500,		"liga_wh_1"		},
				{"fuelF",		-1	,	2850,			""		},
				{"defusekit",	-1	,	2500,			""		},
				{"strahler",	-1	,	150,			""		}
			}
		};
		UHR[]	= {
			"Cop Zubehör",
			{
				{"donuts",		-1	,	120,			""		},
				{"banan",		-1	,	80,			"liga_wh_1"		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},
				{"spikeStrip",	-1	,	2500,			""		},  //Nagelbänder
				{"mauer",		-1	,	750,			""		},  //Absperrung
				{"kegel",		-1	,	150,			""		},
				{"water",		-1	,	10,			""		},
			//	{"rabbit",		-1	,	80,			""		},
				{"apple",		-1	,	80,			"liga_wh_1"		},
				{"doen",		-1	,	55,			""		},
				{"redgull",		-1	,	16500,			"liga_wh_1"		},	// Kokusnuesse
				{"fuelF",		-1	,	2850,			""		},
				{"defusekit",	-1	,	2500,			""		},
				{"strahler",	-1	,	150,			""		}
			}
		};
		REB[]	= {
			"Cop Zubehör",
			{

			}
		};				
	};	
	
	class ada {
		CIV[]	= {
			"Ausrüstung",
			{/*	"ITEEM,Verkauf,	Kauf,	WH	*/
				{"fuelF",		-1	,	2850,			""		},
				{"lockpick",	-1	,	1200,			"liga_wh_1"		},
				{"gpstracker",	-1	,	5000,		""		},
				{"kegel",		-1	,	150,			""		},
				{"mauer",		-1	,	750,			""		},  //Absperrung
				{"strahler",	-1	,	150,			""		},
				{"b22",			-1	,	3500,			""		},  //Campingstuhl
				{"b23",			-1	,	4000,			""		}  //Campingstuhl
			}
		};
		UHR[]	= {
			"Ausrüstung",
			{
				{"fuelF",		-1	,	2850,			""		},
				{"lockpick",	-1	,	1200,			"liga_wh_1"		},
				{"gpstracker",	-1	,	5000,		""		},
				{"kegel",		-1	,	150,			""		},
				{"mauer",		-1	,	750,			""		},  //Absperrung
				{"strahler",	-1	,	150,			""		},
				{"b22",			-1	,	3500,			""		},  //Campingstuhl
				{"b23",			-1	,	4000,			""		}  //Campingstuhl
			}
		};
		REB[]	= {
			"Ausrüstung",
			{

			}
		};				
	};	
	
	class kan {
		CIV[]	= {
			"Kantine",
			{/*	"ITEEM,	Verkauf,	Kauf,		WH	*/
				{"water",		-1	,	10,			""		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},
				{"banan",		-1	,	80,			"liga_wh_1"		},
				{"donuts",		-1	,	120,			""		},
			//	{"rabbit",		-1	,	80,			""		},
				{"apple",		-1	,	80,			"liga_wh_1"		},
				{"peach",		-1	,	80,			"liga_wh_1"		}
			}
		};
		UHR[]	= {
			"Kantine",
			{
				{"water",		-1	,	10,			""		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},
				{"banan",		-1	,	80,			"liga_wh_1"		},
				{"donuts",		-1	,	120,			""		},
			//	{"rabbit",		-1	,	80,			""		},
				{"apple",		-1	,	80,			"liga_wh_1"		},
				{"peach",		-1	,	80,			"liga_wh_1"		}
			}
		};
		REB[]	= {
			"Kantine",
			{

			}
		};				
	};		

	/*DUMMYS    komplett unkonfiguriert */	
	class market {
		CIV[]	= {
			"Liga Markt",
			{/*	"ITEEM,	Verkauf,	Kauf,		WH	*/
				{"water",		-1	,	110,			""		},			// Wasser
				{"coffee",		300	,	350,			"liga_wh_1"		},	// Kaffee
				{"apple",		220	,	300,			"liga_wh_1"		},	// Süßkartoffeln
				{"banan",		230	,	500,			"liga_wh_1"		},	// Bananen
				{"tbacon",		-1	,	80,			""				},	// Kokusnuesse
				{"fuelF",		800	,	5550,			""		},	// Kokusnuesse
				{"peach",		200	,	520,			"liga_wh_1"		},	// Kokusnuesse
				{"redgull",		14500	,	16500,			"liga_wh_1"		},	// Kokusnuesse
				{"stofish",		2800	,	5000,			"liga_wh_1"		}	// Stockfisch
			}
		};
		UHR[]	= {
			"Liga Markt",
			{
				{"water",		-1	,	110,			""		},			// Wasser
				{"coffee",		300	,	350,			"liga_wh_1"		},	// Kaffee
				{"apple",		180	,	300,			"liga_wh_1"		},	// Kokusnuesse
				{"banan",		230	,	500,			"liga_wh_1"		},	// Bananen
				{"tbacon",		-1	,	80,			""				},	// Kokusnuesse
				{"fuelF",		800	,	5550,			""		},	// Kokusnuesse
				{"peach",		220	,	520,			"liga_wh_1"		},	// Kokusnuesse
				{"redgull",		14500	,	16500,			"liga_wh_1"		},	// Kokusnuesse
				{"stofish",		2800	,	5000,			"liga_wh_1"		}	// Stockfisch

			}
		};
		REB[]	= {
			"Liga Markt",
			{
				{"water",		-1	,	110,			""		},			// Wasser
				{"coffee",		300	,	350,			"liga_wh_1"		},	// Kaffee
				{"apple",		180	,	300,			"liga_wh_1"		},	// Kokusnuesse
				{"banan",		230	,	500,			"liga_wh_1"		},	// Bananen
				{"tbacon",		-1	,	80,			""				},	// Kokusnuesse
				{"fuelF",		800	,	5550,			""		},	// Kokusnuesse
				{"peach",		120	,	520,			"liga_wh_1"		},	// Kokusnuesse
				{"redgull",		14500	,	19500,			"liga_wh_1"		},	// Kokusnuesse
				{"stofish",		2800	,	5000,			"liga_wh_1"		}	// Stockfisch

			}
		};				
	};		

	class rebel {
		CIV[]	= {
			"Rebellen Markt",
			{/*	"ITEEM,	Verkauf,	Kauf,		WH	*/

				
			}
		};
		UHR[]	= {
			"Rebellen Markt",
			{

			}
		};
		REB[]	= {
			"Rebellen Markt",
			{
				{"redgull",		14500,	16500,			"liga_wh_1"		},
				{"water",		100	,	120,			""				},
				{"banan",		-1	,	520,			"liga_wh_1"		},	// Bananen
				{"c6",			8900,	13000,		"liga_wh_1"		},	//Bohrmaschine
				{"boltcutter",	7200,	19000	,	"liga_wh_1"		},	// Bolzenschneider
				{"lockpick",	4800,	98600	,	"liga_wh_1"		},	// Dietrich
				{"coffee",		300	,	350,		"liga_wh_1"		},	// Kaffee
				{"apple",		-1	,	500,			"liga_wh_1"		},	// Süßkartoffeln
				{"tbacon",		70	,	620,			""				},	// Kokusnuesse
				{"fuelF",		1000	,	5550,		""		},	// Kokusnuesse
				{"peach",		-1	,	480,			"liga_wh_1"		},	// Kokusnuesse
				{"stofish",		2800	,	5000,			"liga_wh_1"		},	// Stockfisch
				{"uwsl",		-1	,	10000,		""				},	// Wasserbombe				
				{"zipties",		-1	,	9000,		""				}	// Kabelbinder				
			}
		};				
	};	
	
	class kio {
		CIV[]	= {
			"Gladis Kiosk",
			{/*	"ITEEM,	Verkauf,	Kauf,		WH	*/
				{"water",		-1	,	80,			""		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},	// Kaffee
				{"apple",		-1	,	320,			"liga_wh_1"		},	// Süßkartoffeln
				{"banan",		-1	,	500,			"liga_wh_1"		},	// Bananen
				{"tbacon",		-1	,	80,			""				},	// Taktischer speck
				{"fuelF",		-1	,	5550,			""		},	// Benzinkanister
				{"peach",		-1	,	520,			"liga_wh_1"		},	// Kokusnuesse
				{"redgull",		-1	,	16500,			"liga_wh_1"		},	// Redgull
				{"stofish",		-1	,	5000,			"liga_wh_1"		}	// Stockfisch
			}
		};
		UHR[]	= {
			"Gladis Kiosk",
			{
				{"water",		-1	,	80,			""		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},	// Kaffee
				{"apple",		-1	,	320,			"liga_wh_1"		},	// Süßkartoffeln
				{"banan",		-1	,	500,			"liga_wh_1"		},	// Bananen
				{"tbacon",		-1	,	80,			""				},	// Kokusnuesse
				{"fuelF",		-1	,	5550,			""		},	// Kokusnuesse
				{"peach",		-1	,	520,			"liga_wh_1"		},	// Kokusnuesse
				{"redgull",		-1	,	16500,			"liga_wh_1"		},	// Kokusnuesse
				{"stofish",		-1	,	5000,			"liga_wh_1"		}	// Stockfisch
			}
		};
		REB[]	= {
			"Gladis Kiosk",
			{
				{"water",		-1	,	80,			""		},
				{"coffee",		-1	,	350,			"liga_wh_1"		},	// Kaffee
				{"apple",		-1	,	320,			"liga_wh_1"		},	// Süßkartoffeln
				{"banan",		-1	,	500,			"liga_wh_1"		},	// Bananen
				{"tbacon",		-1	,	80,			""				},	// Kokusnuesse
				{"fuelF",		-1	,	5550,			""		},	// Kokusnuesse
				{"peach",		-1	,	520,			"liga_wh_1"		},	// Kokusnuesse
				{"redgull",		-1	,	16500,			"liga_wh_1"		},	// Kokusnuesse
				{"stofish",		-1	,	5000,			"liga_wh_1"		}	// Stockfisch
			}
		};				
	};	
	
/*
	Fehlt noch aus der alten Config
	
	
	diamond	Diamanten Händler
	cement		Zement Händler
	gold		Gold Händler
	doenerman	Dönerhersteller
	fellman	Pelzhändler
	nuhan		Goldschmied

	baust		Baustelle
	chemleim	Leim & Methyl   Kauf


*/		
		
	
};	
	
	
class Warehouse	{
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
	║	File: Liga_Cfg_vItems.hpp	
	║		
	║	Author:  Hirschi - Die Liga
	║	Edited:  Zoran 	 - Die Liga		
	╠═════════════════════════════════════════════════════════════════╗
	║	item[]		= {maxBestand	,minPreis	};
	║	
	║	Warehouse Kennungen
	║	
	║	""					Festpreis
	║	"liga_wh_3"		künstlich erzeugter Verbauch / Session
	║	"liga_wh_1"		Lager CIV
	║	"liga_wh_2"		Lager UHR  
	╚═════════════════════════════════════════════════════════════════╝
*/


	
	class liga_wh_1 {
		/*CIV ?? Waffenteile ... , Benzin ...*/
						// Bestand	// Minwert	
		banan[]			= {5000		,70		};	// Bananen
		apple[]			= {5000		,70		};	// Süßkartoffeln
		coffee[]		= {1500		,120		};	// Kaffee
		cofbeap[]		= {2000		,700	};	// Kaffee geröstet
		cofbeas[]		= {1600		,1000	};	// Kaffee Kopi Luwak
		rabbit[]		= {5000		,20		};
		redgull[]		= {5000		,2800		};	// Redgull
		bottledbeer[]	= {1700		,2000		};	// Whisky ?
		
		peach[]			= {5000		,70		};	// Kokusnuesse
		ana[]			= {5000		,20		};	// Ananas
		bw[]			= {1000		,450	};	// Ananaskonserven
		cement[]		= {2500		,3200	};	// Mamorplatten
		gl[]			= {6000		,2200	};	// Goldschmuck
		gsm[]			= {6000		,2000	};	// Silberschmuck
		diamondc[]		= {5000		,900		};	// Edelschweine
		ggn[]			= {5000		,1000	};	// Goldnuggets
		gsn[]			= {5000		,800	};	// Silbernuggets
			
		oilp[]			= {5000		,10		};	//	Öl processed
		ben[]			= {10000	,1200	};	//	Treibstoff
		di[]			= {10000	,1300	};	// Kerosin
		
		goatrawfp[]		= {2300		,1300	};	// Ziegenfelle
		
		tet[]			= {1700		,1000	};	// Palmoel
		goatraw[]		= {5000		,10		};	// Ziegenfleisch
		sheepraw[]		= {5000		,10		};	// Schafsfleisch
		tutrei[]		= {5000		,100		};	// Schildi Eier
		turtlesoup[]	= {1200		,4500	};	// Schildi Fleisch
		schok[]			= {1200		,800	};	// Schokolade
		kakap[]			= {1500		,800	};	// Kakao geröstet
		hode[]			= {5000		,10		};	// Klöten
		stofish[]		= {5000		,100	};	// Stockfisch
		salema[]		= {1800		,100	};	// Fisch
		ornate[]		= {1800		,100	};	// Fisch
		mackerel[]		= {1800		,100	};	// Fisch
		tuna[]			= {1800		,400	};	// Fisch
		mullet[]		= {1800		,10		};	// Fisch
		catshark[]		= {1800		,900	};	// Fisch
		
		glass[]			= {3500		,800		};	// Glas
		a10[]			= {5000		,10		};	// Flasche
		iron_r[]		= {10000	,400		};                          // <- Geändert 
		copper_r[]		= {10000	,400		};                           // <- Geändert 
		stt[]			= {5000		,4000	};	// Stahlträger//
		fassinv[]		= {2500		,1200	};	// Stahlträger//
		
		c6[]			= {5000		,20		};	// Bohrmaschine
		ghy[]			= {200		,1000	};	// Hydro
		a9[]			= {200		,4000	};	// Pressluft
		a7[]			= {200		,2000	};	// Axt
		a8[]			= {200		,2000	};	// Kettensäge
		mache[]			= {200		,1000	};	// Machete
		boltcutter[]	= {100		,1000	};	// Bolzenschneider
		lockpick[]		= {100		,1000	};	// Dietrich
		
		c4[]			= {1400		,500		};	// Salpeter
		c3[]			= {5000		,20		};	// Schwefel
		c2[]			= {5800		,1000	};	// Waffenteile
		c1[]			= {3600		,3000	};	// Munitionskisten
		salt_r[]		= {1200		,900		};

		rib[]			= {5000		,5000		};	// Bohrgestaenge	
		21[]			= {13000	,500	};	// Flasche Moonshine
		marijuana[]		= {2000		,700	};	
		cocainep[] 		= {2300		,700	};
		lsdp[]  		= {2300		,900		};	// LSD
		methp[]  		= {2300		,1000		};	//	Meth
		heroinp[]  		= {2300		,1200		};	//	Heroin
		nattee[]  		= {5000		,3000	};	//	Naturheilkräutertee
	/*LIKEA*/
		storagebig[]  	= {500		,20		};	//	Lagerkiste
		a6[]  			= {1200		,400	};	//	Möbel
		a5[]  			= {2300		,2000	};	//	Spanplatten
		b22[]  			= {5000		,20		};	//	Klappstuhl
		b23[]  			= {5000		,20		};	//	Klappstuhl
		
		mull[]			= {5000		,20		};	// Müll
		a0[]  			= {5000		,20		};	//	Kunststoff
	/**/	
		kaut[]  		= {5000		,20		};	//	Kautschuk
		corsurv[]  		= {5000		,800		};	//	Souvenir
		corsurvlava[]  	= {5000		,800		};	//	LAvafiguren
		perlp[]  		= {5000		,1200		};	//	Perlenkette
		a1t[]  			= {5000		,20		};	//	Tropenholz
	
	};	
	
	class liga_wh_2 {
		/*Ureinwohner ?? Dorfi ... */
		banan[]			= {5000		,70		};	// Bananen
		apple[]			= {5000		,70		};	// Süßkartoffeln
		coffee[]		= {500		,120		};	// Kaffee
		cofbeap[]		= {2000		,700	};	// Kaffee geröstet
		cofbeas[]		= {1600		,1000	};	// Kaffee Kopi Luwak
		rabbit[]		= {5000		,20		};
		redgull[]		= {5000		,2800		};	// Redgull
		bottledbeer[]	= {700		,2000		};	// Whisky ?
		
		peach[]			= {5000		,70		};	// Kokusnuesse
		ana[]			= {5000		,20		};	// Ananas
		bw[]			= {1000		,450	};	// Ananaskonserven
		cement[]		= {2500		,3200	};	// Mamorplatten
		gl[]			= {6000		,2200	};	// Goldschmuck
		gsm[]			= {6000		,2000	};	// Silberschmuck
		diamondc[]		= {5000		,900		};	// Edelschweine
		ggn[]			= {5000		,1000	};	// Goldnuggets
		gsn[]			= {5000		,800	};	// Silbernuggets
			
		oilp[]			= {5000		,10		};	//	Öl processed
		ben[]			= {10000	,1200	};	//	Treibstoff
		di[]			= {10000	,1300	};	// Kerosin
		
		goatrawfp[]		= {2300		,1300	};	// Ziegenfelle
		
		tet[]			= {700		,1000	};	// Palmoel
		goatraw[]		= {5000		,10		};	// Ziegenfleisch
		sheepraw[]		= {5000		,10		};	// Schafsfleisch
		tutrei[]		= {5000		,10		};	// Schildi Eier
		turtlesoup[]	= {1200		,4500	};	// Schildi Fleisch
		schok[]			= {1200		,800	};	// Schokolade
		kakap[]			= {1500		,800	};	// Kakao geröstet
		hode[]			= {5000		,10		};	// Klöten
		stofish[]		= {5000		,100	};	// Stockfisch
		salema[]		= {800		,100	};	// Fisch
		ornate[]		= {800		,100	};	// Fisch
		mackerel[]		= {800		,100	};	// Fisch
		tuna[]			= {800		,400	};	// Fisch
		mullet[]		= {800		,10		};	// Fisch
		catshark[]		= {800		,900	};	// Fisch
		
		glass[]			= {3500		,800		};	// Glas
		a10[]			= {5000		,10		};	// Flasche
		iron_r[]		= {15000	,200		};
		copper_r[]		= {15000	,200		};
		stt[]			= {5000		,4000	};	// Stahlträger//
		
		c6[]			= {5000		,20		};	// Bohrmaschine
		ghy[]			= {200		,1000	};	// Hydro
		a9[]			= {200		,4000	};	// Pressluft
		a7[]			= {200		,2000	};	// Axt
		a8[]			= {200		,2000	};	// Kettensäge
		mache[]			= {200		,1000	};	// Machete
		boltcutter[]	= {100		,1000	};	// Bolzenschneider
		lockpick[]		= {100		,1000	};	// Dietrich
		
		c4[]			= {400		,500		};	// Salpeter
		c3[]			= {5000		,20		};	// Schwefel
		c2[]			= {800		,1000	};	// Waffenteile
		c1[]			= {1200		,3000	};	// Munitionskisten
		salt_r[]		= {1200		,900		};

		rib[]			= {5000		,5000		};	// Bohrgestaenge	
		21[]			= {13000	,500	};	// Flasche Moonshine
		marijuana[]		= {2000		,700	};	
		cocainep[] 		= {2300		,700	};
		lsdp[]  		= {2300		,900		};	// LSD
		methp[]  		= {2300		,1000		};	//	Meth
		heroinp[]  		= {2300		,1200		};	//	Heroin
		nattee[]  		= {5000		,3000	};	//	Naturheilkräutertee
	/*LIKEA*/
		storagebig[]  	= {50		,20		};	//	Lagerkiste
		a6[]  			= {800		,400	};	//	Möbel
		a5[]  			= {2300		,2000	};	//	Spanplatten
		b22[]  			= {5000		,20		};	//	Klappstuhl
		b23[]  			= {5000		,20		};	//	Klappstuhl
		
		mull[]			= {5000		,20		};	// Müll
		a0[]  			= {5000		,20		};	//	Kunststoff
	/**/	
		kaut[]  		= {5000		,20		};	//	Kautschuk
		corsurv[]  		= {5000		,800		};	//	Souvenir
		corsurvlava[]  	= {5000		,800		};	//	LAvafiguren
		perlp[]  		= {5000		,1200		};	//	Perlenkette
		a1t[]  			= {5000		,20		};	//	Tropenholz
		
	};
	
	class liga_wh_3 {	// künstlich erzeugter Verbauch / Session	

		banan[]			= {2000		,70		};	// Bananen
		apple[]			= {3000		,70		};	// Süßkartoffeln
		coffee[]		= {1500		,120		};	// Kaffee
		cofbeap[]		= {2000		,700	};	// Kaffee geröstet
		cofbeas[]		= {1600		,1000	};	// Kaffee Kopi Luwak
		rabbit[]		= {5000		,20		};
		redgull[]		= {5000		,2000		};	// Redgull
		bottledbeer[]	= {1900		,2000		};	// Whisky ?
		
		peach[]			= {2000		,70		};	// Kokusnuesse
		ana[]			= {2000		,20		};	// Ananas
		bw[]			= {2000		,450	};	// Ananaskonserven
	//	cement[]		= {2500		,1200	};	// Mamorplatten
	//	gl[]			= {6000		,2200	};	// Goldschmuck
	//	gsm[]			= {6000		,2000	};	// Silberschmuck
	//	diamondc[]		= {5000		,900		};	// Edelschweine
	//	ggn[]			= {5000		,1000	};	// Goldnuggets
	//	gsn[]			= {5000		,800	};	// Silbernuggets
			
	//	oilp[]			= {5000		,10		};	//	Öl processed
	//	ben[]			= {10000	,1200	};	//	Treibstoff
	//	di[]			= {10000	,1300	};	// Kerosin
		
		goatrawfp[]		= {1530		,1300	};	// Ziegenfelle
		
		tet[]			= {1700		,1000	};	// Palmoel
		goatraw[]		= {1500		,10		};	// Ziegenfleisch
		sheepraw[]		= {1500		,10		};	// Schafsfleisch
		tutrei[]		= {1500		,10		};	// Schildi Eier
		turtlesoup[]	= {1120		,4500	};	// Schildi Fleisch
		schok[]			= {1420		,800	};	// Schokolade
		kakap[]			= {1450		,800	};	// Kakao geröstet
		hode[]			= {1500		,10		};	// Klöten
		stofish[]		= {1500		,100	};	// Stockfisch
		salema[]		= {1800		,100	};	// Fisch
		ornate[]		= {1800		,100	};	// Fisch
		mackerel[]		= {1800		,100	};	// Fisch
		tuna[]			= {1800		,400	};	// Fisch
		mullet[]		= {1800		,10		};	// Fisch
		catshark[]		= {1800		,900	};	// Fisch
		
		fassinv[]		= {2500		,1200	};	// Stahlträger//
		
	//	glass[]			= {3500		,800		};	// Glas
	//	a10[]			= {5000		,20		};	// Flasche
	//	iron_r[]		= {5000		,20		};
	//	copper_r[]		= {5000		,20		};
	//	stt[]			= {5000		,4000	};	// Stahlträger//
		
	//	c6[]			= {5000		,20		};	// Bohrmaschine
	//	ghy[]			= {200		,1000	};	// Hydro
	//	a9[]			= {200		,4000	};	// Pressluft
	//	a7[]			= {200		,2000	};	// Axt
	//	a8[]			= {200		,2000	};	// Kettensäge
	//	mache[]			= {200		,1000	};	// Machete
	//	boltcutter[]	= {100		,1000	};	// Bolzenschneider
	//	lockpick[]		= {100		,1000	};	// Dietrich
		
	//	c4[]			= {400		,500		};	// Salpeter
	//	c3[]			= {5000		,20		};	// Schwefel
	//	c2[]			= {800		,1000	};	// Waffenteile
	//	c1[]			= {1200		,3000	};	// Munitionskisten
		salt_r[]		= {1520		,900		};

	//	rib[]			= {5000		,20		};	// Bohrgestaenge	
		21[]			= {3950		,500	};	// Flasche Moonshine
	//	marijuana[]		= {2000		,700	};	
	//	cocainep[] 		= {2300		,700	};
	//	lsdp[]  		= {2300		,900		};	// LSD
	//	methp[]  		= {2300		,1000		};	//	Meth
	//	heroinp[]  		= {2300		,1200		};	//	Heroin
		nattee[]  		= {1500		,3000	};	//	Naturheilkräutertee
	/*LIKEA*/
	//	storagebig[]  	= {50		,20		};	//	Lagerkiste
	//	a6[]  			= {800		,400	};	//	Möbel
	//	a5[]  			= {2300		,2300	};	//	Spanplatten
	//	b22[]  			= {5000		,20		};	//	Klappstuhl
	//	b23[]  			= {5000		,20		};	//	Klappstuhl
		
	//	mull[]			= {5000		,20		};	// Müll
	//	a0[]  			= {5000		,20		};	//	Kunststoff
	/**/	
	//	kaut[]  		= {5000		,20		};	//	Kautschuk
	//	corsurv[]  		= {5000		,800		};	//	Souvenir
	//	corsurvlava[]  	= {5000		,800		};	//	LAvafiguren
	//	perlp[]  		= {5000		,1200		};	//	Perlenkette
	//	a1t[]  			= {5000		,20		};	//	Tropenholz
	

	};	
	
	class liga_wh_4 { // Fest 
	
		fassinv[]		= {2500		,1200	};	// Fass//
		rip[]			= {2500		,2400	};	// Pumpe//
		rib[]			= {2500		,5000	};	// Gestänge//
		ben[]			= {10000	,1200	};	//	Treibstoff
		di[]			= {10000	,1300	};	// Kerosin
	
	};
	
	/* WH Display */
	class WH_Displ {
		dispShops[]	= {
			"market",
			"fishmarket",
			"rebel",
			"tank",
			"oilrig",
		//	"partyile",	//Festpreise mit beschränkten Lager
			"partyleg",
			"recy",
			"salthan",
			"glass",
			"fasslager",
			
			"iron",
			"likea",
			"expo",
			"medimann_legal",
			"handelsposleg",
			"handelspos",
			"restaur",
			"schmugg",
			"wafschmug"
		};
	};
	
	class WHdump {
		maxSUBval = 50;		// 50 % weg von 100 % Bestand

		minBestan = 25;		// 25 % Mindestbetand
		minSUBval = 80;		// 20 % weg von 25 % mindestBestand 
		
	};
};
/*	

	
Wie der olle Xavier sagen würde: "Du musst nur geduldig sein, dann dauert es nicht mehr lang..." <- wat ein Schmalz
	
	

	
	
		/* 	-> Hier Platz für Zorans Outro lassen <-
			
			Oder auch "Die Wandlung vom Penetrator zum Kommentator */
			
		/*	Outro ??? Du hast wohl zu viel Langeweile ...  !!!!! */	
			

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
	