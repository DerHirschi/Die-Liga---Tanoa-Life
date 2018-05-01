#include "..\Liga_script_macros.hpp"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
nn_last_vehicles = []; //EMP
nn_empInUse = false; //EMP
life_TankLaster = 1; //able to load anything?

life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_CarPreview = ObjNull;

tawvd_foot 	= GVAR_PRONS["liga_footv",1200];
tawvd_car 	= GVAR_PRONS["liga_carv",1300];
tawvd_air 	= GVAR_PRONS["liga_airv",1500];

life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;

liga_deathUnit = ObjNull;
life_spikestrip = ObjNull;
life_mauer = ObjNull;
life_fass = ObjNull;
life_dest = ObjNull;

life_respawn_timer = 0.5; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_request_timer = false;
cop_m = false;
ad_targ_id = -1;
ad_targ_uni = ObjNull;
supp_atm = false;

liga_flusi = false;

//Channel 7
life_channel_send = true;

//Persistent Saving
__CONST__(life_save_civ,true); //Save weapons for civs?
__CONST__(life_save_yinv,true); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,true); //Set to false if you don't want cops to be able to revive downed players.
//__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,250000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,120000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIGA_SETTINGS(getNumber,"total_maxWeight");
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/

life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren_active2 = false;
life_siren3_active = false;
life_bank_fail = false;

life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;

life_thirst	= GVAR_PRONS ["liga_thi",100];
life_hunger	= GVAR_PRONS ["liga_hun",100];
life_thirst	= 20 max life_thirst;
life_hunger	= 20 max life_hunger;

__CONST__(life_paycheck_period,5); //Five minutes

CASH = 0;
BANK = LIGA_SETTINGS(getNumber,"bank_civ");

life_istazed = false;
life_my_gang = ObjNull;
life_fadeSound = false;
life_vehicles = [];
bank_robber = [];
life_drugged_weed = -1;
life_drugged_weed_duration = 3;
life_drugged_cocaine = -1;
life_drink = 0;
life_drug = 0; 
//life_pressTime = 0;
life_smartphoneTarget = ObjNull;
WH_ind = 0;

switch (playerSide) do
{
	case west: 
	{
		
		life_paycheck = 0; //Paycheck Amount
		
		if ( (east countSide playableUnits)  > 0 ) then
		
		{		
		__CONST__(life_impound_car,1);
		__CONST__(life_impound_boat,1);
		__CONST__(life_impound_air,1);
		}
		else
		{
		__CONST__(life_impound_car,800);
		__CONST__(life_impound_boat,600);
		__CONST__(life_impound_air,1250);	
			
		};
	};
	case default 
	{
		
		life_paycheck = 500; //Paycheck Amount
		if ( (east countSide playableUnits)  > 0 ) then
		
		{		
		__CONST__(life_impound_car,1);
		__CONST__(life_impound_boat,1);
		__CONST__(life_impound_air,1);
		}
		else
		{
		__CONST__(life_impound_car,800);
		__CONST__(life_impound_boat,600);
		__CONST__(life_impound_air,1250);	
			
		};
	};
/*	
	case independent: 
	{
		
		life_paycheck = 450;
		__CONST__(life_impound_car,800);
		__CONST__(life_impound_boat,600);
		__CONST__(life_impound_air,1250);
	};
*/	
	case east:
	{
		
		life_paycheck = 450; //Paycheck Amount
		__CONST__(life_impound_car,18500);
		__CONST__(life_impound_boat,23500);
		__CONST__(life_impound_air,23500);
	};
};

/*
	Master Array of items?
*/

life_inv_items = 
[
	"lin_heru",
	"lin_herp",

	"lin_rabi",

	"lin_fisp",

	"lin_donu",
		
	"lin_sand",

	"lin_glas",
	
	"lin_tba",		// Taktischer Speck				

	"lin_gold",
	
	"lin_def",
	
	"lin_wei",
	"lin_gyr",
	"lin_uzo",
	//"lin_sala",

	"lin_zig",
	"lin_kasse",
	"lin_schrank",
	

	"lin_rabif",
	"lin_hen",
	"lin_roo",

	"lin_rabifp",
		
 
	"lin_doen",
 
	"li_prl",	//Pressluft
	"li_prlhe",	// Pressluft Helium
	
	"li_stt",	
	
	"li_fireWo",//Feuerwerk	

	
	
	/*NEU*/
	"l_a10",	//	Flaschen
	
	"li_stra", 	// 	Strahler
	"l_22",  	// 	Klappstuhl
	"l_23",		// 	Klappstuhl
   
	"lin_fuF",	// 	Kanister voll
	"lin_fuE",	// 	Kanister leer	
	"l_a11",	// 	Hefe
	"l_a12",	// 	Maische
	"l_14",		// 	Tarnnetz
	"l_15",		// 	Destille
	"l_16",		// 	Maischefass
	"l_17",		// 	Zelt
	"l_18",		// 	Methyl
	"l_20",		// 	Moonshine
	"l_21",		// 	Flasche Moonshine
	"lin_stob",	//	Lagerkiste groß 
	"lin_gps",	//	GPS Tracker
	"lin_zip",	//	Kabelbinder
	"lin_sps",	// 	Nagelbänder
	"lin_uwl",	//	Wasserbombe
	"li_mau",	// 	Absperrung
	"li_keg",	//	Kegel
	"li_sfb",	//	Schranken FB
	"lin_blac",	//	Sprengladung FED
	/*Schlosser*/
		
	"i_a7",		//	Axt
	"i_a8",		//	Kettensaege
	"i_a9",		//	Presslufthammer	
	"lin_axe",	//	Spitzhacker
	"lin_jme",	// 	Jagdmesser
	"lin_mache",// 	Machete
	
	"lin_lpi",	//	Dietriche
	"lin_boc",	// 	Bolzenschneider
	"c_6",   	// 	Bohrmaschine	
	"lin_kafma",// 	Kaffeemaschine	
		
	"lin_ml",	//	Müll
	"l_a0",		//	Kunststoff
	
	"lin_copp",	//	Kupfererz
	"lin_iroo",	//	Eisenerz
	"lin_iror",	//	Kupfererz
	"lin_copr",	//	Kupferbarren		
			
	"lin_sal",	//	Salz	
	"lin_salr",	//	Raffiniertes Salz
	"c_4",    	// 	Salpeter
	
	"c_3",   	// 	Schwefel
	"c_1",  	// 	Munitionskiste
	"c_2",		// 	Waffenteile

	"lin_rock",	//	Mamor
	"lin_cem",	//	Mamorplatten	
	
	"lin_kaka",	//	Kakao
	"lin_kakap",//	Kakao geröstet
	"lin_schok",//	Schokolade
	
	"lin_pea",	//	Kokusnuesse
	"lin_ana",	// 	Ananas
	"lin_bw",	// 	Ananaskonserver
	"lin_apl",	//	Süßkartoffeln	
	"li_sig", 	//	Palmfrucht		
	"li_tet",  	//	Palmoel			
	"lin_reva",	// 	Zuckerrohr
	"lin_bob",	// 	Ligas Finest Rum	
	
	"lin_dose",	// 	Dosen
	"lin_red",	// 	RedGull
	
	"i_a1t",	//	Tropenholz
	"i_a1",		// 	Baumstämme	
	"li_guh",	// 	Fassbretter
	"li_fass",	//	Fass
	
	"i_a2",		// 	Bretter
	"i_a3",		// 	Leim
	"i_a4",		//	Holzspaene
	"i_a5",		// 	Spanplatten
	"i_a6",		// 	Moebel
	
	"li_rip",	// 	Oel Pumpe	
	"li_rib",	// 	Bohrgestaenge
	"li_rio",	//	Offshore Öl
	"li_rig",	// 	Methangas
	"lin_oilu",	// 	Rohöl		
	"lin_oilp",	// 	Öl	
	"li_di",   	// 	Kerosin 
	"li_ben", 	// 	Treibstoff
		/*Goldrausch*/
	"li_gsg", 	//	Schuerfgut
	"li_gab",   //	Abraum	
	"li_ghy",  	//	Hydro Riffel
	"li_gsn",   //	Silbernuggets
	"li_ggn",  	//	Goldnuggets
	"lin_gl",	// Goldschmuck
	"li_gsm",	// Silberschmuck  
		/*Edelsteine*/
	"li_schgut",// Schuerfgut Edelsteine	
	"lin_dia",	// Rohedelsteine	
	"lin_diar",	// Edelsteine	  	
	
	/*UHR*/
	"lin_cana",	// Kanabis unver
	"lin_marj",	// Mariuana verarbeitet
	
	"lin_turt",	//	Schildkroeten
	"lin_turs",	//	Schildkroeten Fleisch
	
	"lin_cok",	// Kokain Roh
	"lin_cokp",	// Kokain processed	
	
	"lin_lava",		// Lavagestein
	"lin_coral",	// Korallen
	"lin_corsuv",	// Souvenir
	
	"lin_perl",		// Perlen
	"lin_perl_p",	// Perlenkette
	
	"lin_cofbea",	// Kaffeebohne
	"lin_cofbea_p",	// Kaffee geroestet
	"lin_cofbea_s",	// Kopi Luwak
	"lin_coff",		// Kaffee
	
	"lin_kaut",		// Kautschuk 
	"lin_banan",	// Bananen 
	
	"lin_tee",		// Tee 
	"lin_nattee",	// Naturheilkräutertee 
	"lin_natkr",	// Naturheilkräuter
	"lin_lavafig",	// Lavafigurene
	
	
	/*Jagen*/
	"lin_goa",		// Ziegenfleisch
	"lin_goaf",		// Ziegenrohfell
	"lin_goafp",	// Ziegenfell
	
	"lin_she",		// Schafsfleisch
	"lin_shef",		// Wolle
	
	"lin_hode",		// Tierhoden	
	
	/*REB*/
	"lin_lsdu",		// LSD Frosch
	"lin_lsdp",		// LSD
	
	"lin_metu",		//	Unverarbeitetes Meth
    "lin_metp",		//	Meth
	
    "lin_streckm",	//	Streckmittel
	
    "lin_tutrei",	//	Schildkroeteneier				
	
	//**//

	"c_5",    		// 	ADAC Urunde Flugausbildung
	
	
	/*Fischvolk ENDE*/
	"lin_stofish",	// Stockfisch
	"lin_salem",
	"lin_orna",
	"lin_makr",
	"lin_tuna",
	"lin_mule",
	"lin_cats",
	/*Fischvolk ENDE*/
	"lin_wate"	// Wasser
];

//Setup variable inv vars.
{SVAR_MNS[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["lada_car","alac"],
	["lada_air","alac"],
	/*COP´s*/
	["lco_air","cop"],
	["lco_swat","cop"],
	["lco_cg","cop"],
	["lco_air","civ"],
	["lco_swat","civ"],
	["lco_cg","civ"],	
	/*MED*/
	["lme_air","med"],
	["lme_air","civ"],
	
	
	["lci_driv","civ"],
	["lci_air","civ"],
	["lci_hero","civ"],
	["lci_mari","civ"],
	["lci_gang","civ"],
	["lci_boat","civ"],
	["lci_oil","civ"],
	["lci_dive","civ"],
	["lci_lkw","civ"],
	["lci_gun","civ"],
	["lci_reb","civ"],
	["lci_cok","civ"],
	["lci_dia","civ"],

	["lci_sand","civ"],
	["lci_salt","civ"],
	["lci_cem","civ"],
	
	["lci_home","civ"],

	["lci_meth","civ"],
	["lci_liga","civ"],
	["lci_stlkr","civ"],
	["lci_admin","civ"],
	["lci_lsd","civ"],
	["lci_jag","civ"],
	["lci_gli","civ"],
	["lci_ben","civ"],
	["lci_sig","civ"],
	["lci_adm","civ"],
	["lci_ano","civ"],
	["lci_sil","civ"],

	["lci_bohrt","civ"],
	["lci_civspawn","civ"],
	["lci_uhrspawn","civ"],
	/*NEU*/
	["lci_ana","civ"],	//Ananaskonserven
	["lci_copp","civ"],	//Kupfer
	["lci_iro","civ"],	//Eisen
	["lci_palm","civ"],	//Palmöl
	["l_a1","civ"],		//Holzverabeitung
	["lci_kaka","civ"],	//Kakao	
	["lci_rum","civ"],	//Brennlizenz
	["lci_wert","civ"]	//Wertstoffe

];

//Setup License Variables
{SVAR_MNS[SEL(_x,0),false];} foreach life_licenses;

//[shortVar,reward]

life_illegal_items = [
	["heroinu",1500],
	["heroinp",3000],
	["cocaine",1500],
	["cocainep",3000],
	["marijuana",2000],
	["turtle",10000],
	["blastingcharge",10000],
	["boltcutter",5000],
	["methu",1500],
	["methp",3000],

	["lsdu",2000],
	["lsdp",4000],
	["gl",35000],
	["goldbar",45000],
	["sfb",15000],
	["gsm",17500],
//	["sig",3000],
//	["tet",1500],
	["15",150000],
	["20",10000],
	["21",15000],

	["c1",9000],
	["c2",12000],
	["a1t",12000]	//Tropenholz
	

	];
/*
	Sell / buy arrays
*/
// Nur noch für Cop´s durchsuchen lohn ... .

sell_array = 
[
	["apple",100],			//Süßkartoffeln
	["heroinu",1850],
	["heroinp",2650],
	["salema",145],
	["ornate",140],
	["mackerel",275],
	["tuna",1000],
	["mullet",400],
	["catshark",2300],
	["rabbit",65],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],			//Kokusnuesse
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",55000],

	["gpstracker",1000],
	["bottledbeer",750],
	["zipties",20],
	["ana",60],				// Ananas
	["bw",220],				// Ananaskonserver
	["methu",400],
    ["methp",4000],
	["lsdp",4200],
	["mull",2265],
	["wein",960],
	["gyro",25],
//	["uzo",1000],
//	["sala",22],
//	["reva",30],
	["zig",34],
	["uwsl",5000],
	["gl",45000],
	["rabbitf",200],
	["henraw",98],
	["roosterraw",120],
	["goatraw",4250],
	["goatrawf",500],
	["sheepraw",4600],
	["sheeprawf",5850],
	["rabbitfp",4800],
	["goatrawfp",6600],
	["mauer",700],
	["gsm",700],
	["ggn",9500],
	["gsn",6500],
	["di",5850],
	["ben",5350],
	["li_tet",5000],	//Palmöl
	["kegel",50],
	["strahler",50], 	//Straler
//	["rip",650],
	["rio",50],			//Offshoreöl
	["rig",1190],
	["rib",13200],		//Bohrgestänge
	["stt",11560],		//Stahlträger 32K
//	["a5",3670],	// Spanplatten  8K
	["a6",9670],	
	["a3",275],
	["18",821],
	["21",275],
	["a10",1600],
	["c1",4000],
	["c2",9000],  		//Wafft
	["c3",750],
	["fassinv",1200]	// Fass
	
];
__CONST__(sell_array,sell_array);
/*
buy_array = 
[
	["apple",100],		// Kokusnuesse
	["rabbit",75],
	["salema",155],
	["ornate",150],
	["mackerel",300],
	["tuna",1100],
	["mullet",500],
	["catshark",3500],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["pickaxe",1800],
	["redgull",1500],
	["fuelF",2850],
	["peach",68],		//Süßkartoffeln
	["ana",80],			// Ananas
	["spikeStrip",2500],
	["blastingcharge",35000],
	["defusekit",2500],

	["storagebig",850000],
	["21",85000],
	["marijuana",85000],
	["cocainep",85000],
	["lsdp",85000],
	["methp",85000],

	["gpstracker",50000],
	["bottledbeer",1900],
	["iron_r",3200],
	["copper_r",1500],
	["zipties",1000],
	["wein",1960],
	["gyro",110],
//	["uzo",2200],
//	["sala",60],
//	["reva",90],
	["zig",120],
	["uwsl",10000],
	["doen",55],
	["jame",14500],
	["mauer",750],		//Absperrung
	["sfb",120000],
//	["guh",8000],
	["prl",6000],
	["kegel",150],		//Kegel
	["strahler",150],  // Strahler
	["rib",15900],		
	["a7",2100],
	["a3",50],
	["a10",2250],  
	["di",10900],		//Kerosin
	["ben",10400],		//Treibstoff
	["a11",175],
	["lockpick",75],
	["17",49500],
	["14",38000],
	["a0",7500],      // Kunstoff
	["b22",3500],	
	["b23",4000],		
	["c4",4000],	
	["c5",20],	
	["c3",750],
	["fassinv",1200]	// Fass
];
__CONST__(buy_array,buy_array);
*/

if(EQUAL(playerSide,civilian)) exitWith
{
	profilenamespace SVAR ["GUI_BCG_RGB_R",0];
	profilenamespace SVAR ["GUI_BCG_RGB_G",0.6];
	profilenamespace SVAR ["GUI_BCG_RGB_B",0.2];
}; 
if(EQUAL(playerSide,independent)) exitWith
{
	profilenamespace SVAR ["GUI_BCG_RGB_R",0];
	profilenamespace SVAR ["GUI_BCG_RGB_G",0.6];
	profilenamespace SVAR ["GUI_BCG_RGB_B",0.2];
}; 
/*
if(EQUAL(playerSide,independent)) exitWith
{
	profilenamespace SVAR ["GUI_BCG_RGB_R",1];
	profilenamespace SVAR ["GUI_BCG_RGB_G",0];
	profilenamespace SVAR ["GUI_BCG_RGB_B",0];
};
*/
if(EQUAL(playerSide,east)) exitWith
{
	profilenamespace SVAR ["GUI_BCG_RGB_R",0.5];
	profilenamespace SVAR ["GUI_BCG_RGB_G",0.5];
	profilenamespace SVAR ["GUI_BCG_RGB_B",0];
};
if(EQUAL(playerSide,west)) exitWith
{
	profilenamespace SVAR ["GUI_BCG_RGB_R",0.2];
	profilenamespace SVAR ["GUI_BCG_RGB_G",0.5];
	profilenamespace SVAR ["GUI_BCG_RGB_B",1];
};

	profilenamespace SVAR ["GUI_BCG_RGB_R",0];
	profilenamespace SVAR ["GUI_BCG_RGB_G",0.6];
	profilenamespace SVAR ["GUI_BCG_RGB_B",0.2];