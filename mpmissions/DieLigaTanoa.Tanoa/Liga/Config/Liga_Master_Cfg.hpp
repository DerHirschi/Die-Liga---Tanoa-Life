#define true 1
#define false 0
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
	║	File: Liga_Master_Cfg.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.4	
	╚══════════════════════════════════════════════════╝
*/
class Liga_Settings {
    /* Persistent Settings */
    save_civ_weapons = true; //Allow civilians to save weapons on them?
    save_virtualItems = true; //Save Virtual items (all sides)?

	clothing_box = true; //true = preview inside a black box.  false = preview on map.
    clothing_masks[] = { "H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "U_O_GhillieSuit", "U_I_GhillieSuit", "U_B_GhillieSuit", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F" };

    /* Revive system settings */
    revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 5500; //Revive fee that players have to pay and medics / EMS are rewarded

    /* House related settings */
    house_limit = 5; //Maximum amount of houses a player can own.

    /* Gang related settings */
    gang_price = 75000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
    gang_upgradeMultiplier = 2.5; //Not sure if in use?

    /* Player-related systems */
    enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
    paycheck_period = 5; //Scaled in minutes

    /* Impound Variables */
    impound_car = 350; //Price for impounding cars
    impound_boat = 250; //Price for impounding boats
    impound_air = 850; //Price for impounding helicopters / planes

    /* Initial Bank Amount */
    bank_cop = 32000; //Amount of cash on bank for new cops
    bank_civ = 32000; //Amount of cash on bank for new civillians
    bank_med = 32000; //Amount of cash on bank for new medics

    /* Paycheck Amount */
    paycheck_cop = 500; //Payment for cops
    paycheck_civ = 350; //Payment for civillians
    paycheck_med = 450; //Payment for medics

    /* Federal Reserve settings */
    noatm_timer = 10; //Time in minutes that players won't be able to deposit his money after selling stolen gold

    /* Spyglass settings */
    spyglass_init = false; //Enable or disable spyglass

    /* Skins settings */
    civ_skins = false; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)
	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { 
									"Land_Pod_Heli_Transport_04_medevac_F",
									"Land_Pod_Heli_Transport_04_repair_F",
									"Land_Pod_Heli_Transport_04_ammo_F",
									"Land_Pod_Heli_Transport_04_box_F",
									"Land_Pod_Heli_Transport_04_fuel_F",
									"Land_Pod_Heli_Transport_04_covered_F",
									"Land_Pod_Heli_Transport_04_bench_F",
									"B_MRAP_01_hmg_F",
									"B_G_Offroad_01_armed_F",
									"Land_CargoBox_V1_F",
									"Land_WaterTank_F",
									"O_LSV_02_armed_arid_F",
									"O_Boat_Armed_01_hmg_F",
									"O_supplyCrate_F"
								};

    /* Job-related stuff */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

};

class LigaLicense{
	class LicShop {
		CIVstart[]	= {
			
			"uhrspawn",
			"civspawn"
		};
		CIVlegal[]	= {
			"driver",
			"truck",
			"pilot",
			"boat",
			"gun",
			"home",
			"diamond",
			"salt",
			"sand",
			"oil",
			"bohrt",
			"cement",
			"gsg",
			"iron",
			"copper",
			"anakons",
			"palm",
			"rum",
			"brett",
			"kaka"
		};
		REBilleg[]	= {
			
			"heroin",
			"gang",
			"marijuana",
			"cocaine",
			"lsd",
			"meth"
		};		
	};
};

#include "Liga_Cfg_Karren.hpp"
#include "Liga_Cfg_Weapons.hpp"
#include "Liga_Cfg_Clothing.hpp"
#include "Liga_Cfg_World.hpp"
#include "Liga_Cfg_vItems.hpp"
#include "LigaHandy_Config.hpp"

