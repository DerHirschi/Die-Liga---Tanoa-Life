class LigaKarrenLaden {
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
	║	File: Liga_Cfg_Karren.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Edited:  Zoran 	 - Die Liga
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.3	
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

	/*Anfänger Shop*/
    class start_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 		1000  , { "" },			{ "", "", -1 } }
        };
    };
	/*Kart Shop*/
    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_F", 		42500, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Blu_F", 	42500, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Fuel_F", 	42500, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Red_F", 	42500, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Vrana_F",  42500, { "driver" }, { "", "", -1 } }
        };
    };	
	/* >>>>>>>>> L1GA - CIV <<<<<<<<<< */
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 			5000  , { "" },			{ "", "", -1 } },
            { "C_Hatchback_01_F", 			20000 , { "driver" }, 	{ "", "", -1 } },
            { "C_Hatchback_01_sport_F", 	778000, { "driver" }, 	{ "", "", -1 } },
            { "C_Offroad_01_F", 			30750 , { "driver" }, 	{ "", "", -1 } },
			{ "C_Offroad_02_unarmed_F",		30750 , { "driver" }, 	{ "", "", -1 } },			
            { "C_SUV_01_F", 				52500 , { "driver" }, 	{ "", "", -1 } },
            { "C_Van_01_transport_F", 		160000, { "driver" }, 	{ "", "", -1 } },
            { "C_Van_01_fuel_F", 			225285, { "driver" }, 	{ "", "", -1 } },
            { "O_LSV_02_unarmed_black_F", 	7825285, { "driver" }, 	{ "", "", -1 } },
            { "B_T_LSV_01_unarmed_black_F", 7825285, { "driver" }, 	{ "", "", -1 } }
        };
    };	
	
    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_box_F", 				247500 , { "truck" }, { "", "", -1 } },		//Truck Boxer
            { "I_Truck_02_transport_F", 		430500 , { "truck" }, { "", "", -1 } },		//Zamak Pritsche
			//{ "O_Truck_03_transport_F", 		1318947, { "truck" }, { "", "", -1 } },		//Tempest Pritsche
			{ "O_T_Truck_03_transport_ghex_F", 	1318947, { "truck" }, { "", "", -1 } },		//Tempest Pritsche
			{ "B_Truck_01_transport_F", 		3912615, { "truck" }, { "", "", -1 } },		//Hemtt Pritsche
            { "I_Truck_02_covered_F", 			631800 , { "truck" }, { "", "", -1 } },		//Zamak abgedeckt            
            { "O_T_Truck_03_covered_ghex_F", 	2223750, { "truck" }, { "", "", -1 } },		//Tempest abgedeckt
            //{ "O_Truck_03_covered_F", 			2223750, { "truck" }, { "", "", -1 } },		//Tempest abgedeckt
            { "B_Truck_01_covered_F", 			4898571, { "truck" }, { "", "", -1 } },		//Hemtt abgedeckt
            { "B_Truck_01_ammo_F", 				4783000, { "truck" }, { "", "", -1 } },		//Hemtt Munition
            { "O_T_Truck_03_ammo_ghex_F", 		8542857, { "truck" }, { "", "", -1 } },		//Tempest Munition
            //{ "O_Truck_03_ammo_F", 				8542857, { "truck" }, { "", "", -1 } },		//Tempest Munition
			{ "B_Truck_01_box_F", 				7749778, { "truck" }, { "", "", -1 } },		//Hemtt Container
            { "O_T_Truck_03_device_ghex_F", 	16600000,{ "truck" }, { "", "", -1 } },		//Tempest Gerät
            //{ "O_Truck_03_device_F",		 	22600000,{ "truck" }, { "", "", -1 } },		//Tempest Gerät
            { "O_Truck_02_fuel_F", 				978776 , { "truck" }, { "", "", -1 } },		//Zamak Tanken
            { "O_T_Truck_03_fuel_ghex_F", 		2238077, { "truck" }, { "", "", -1 } },		//Tempest Tanken
            { "O_Truck_03_fuel_F", 				2238077, { "truck" }, { "", "", -1 } },		//Tempest Tanken
            { "B_Truck_01_fuel_F", 				3372571, { "truck" }, { "", "", -1 } }		//Hemtt Tanken
		};
    };	
	
    class civ_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", 				625000  , { "pilot" }, { "", "", -1 } },
            { "C_Heli_Light_01_civil_F", 		873000  , { "pilot" }, { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", 		2000000 , { "pilot" }, { "", "", -1 } },
            { "I_Heli_Transport_02_F", 			5170000 , { "pilot" }, { "", "", -1 } },
            { "O_Heli_Transport_04_covered_F",  6850000 , { "pilot" }, { "", "", -1 } },
            { "B_Heli_Transport_03_unarmed_F",  7232000 , { "pilot" }, { "", "", -1 } },
            { "O_Heli_Transport_04_F", 			7283000 , { "pilot" }, { "", "", -1 } },
            { "O_Heli_Transport_04_fuel_F", 	8989000 , { "pilot" }, { "", "", -1 } },
            { "O_Heli_Transport_04_box_F", 		10098000, { "pilot" }, { "", "", -1 } },
            { "B_T_VTOL_01_vehicle_blue_F", 	19698000, { "pilot" }, { "", "", -1 } },
            { "B_T_VTOL_01_vehicle_olive_F", 	19698000, { "pilot" }, { "", "", -1 } }
		};
    };	

	class civ_fly {
        side = "civ";
        vehicles[] = {
            { "C_Plane_Civil_01_F", 				625000  , { "pilot" }, { "", "", -1 } },
            { "C_Plane_Civil_01_racing_F", 			925000  , { "pilot" }, { "", "", -1 } }
        };
    };	
	
    class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Scooter_Transport_01_F", 	25000  , { "boat" }, { "", "", -1 } }, 		//Jet Ski (neu)
            { "C_Rubberboat", 				55000  , { "boat" }, { "", "", -1 } }, 		//Schlauchboot
            { "C_Boat_Civil_01_F", 			75000  , { "boat" }, { "", "", -1 } }, 		//Motorboot
            { "C_Boat_Transport_02_F", 		200000  , { "boat" }, { "", "", -1 } } 	//RIB (neu)
            
		};
    };			
	/* >>>>>>>>> L1GA - UHR <<<<<<<<<< */
    class uhr_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 				5000  , { "" },			{ "", "", -1 } },
            { "C_Hatchback_01_F", 				20000 , { "driver" }, 	{ "", "", -1 } },
            { "C_Hatchback_01_sport_F",			778000, { "driver" }, 	{ "", "", -1 } },
            { "C_Offroad_01_F", 				30750 , { "driver" }, 	{ "", "", -1 } },
            { "I_C_Offroad_02_unarmed_F",		30750 , { "driver" }, 	{ "", "", -1 } },		//4WD Uhr	
            { "I_C_Offroad_02_unarmed_olive_F",	30750 , { "driver" }, 	{ "", "", -1 } },		//4WD Uhr	
            { "I_C_Offroad_02_unarmed_brown_F",	30750, 	{ "rebel" }, 	{ "", "", -1 } },		//4WD Uhr	
            { "C_SUV_01_F", 					52500 , { "driver" }, 	{ "", "", -1 } },
            { "O_T_LSV_02_unarmed_ghex_F", 		7825285, { "driver" }, 	{ "", "", -1 } },
            { "B_T_LSV_01_unarmed_sand_F", 		7825285, { "driver" }, 	{ "", "", -1 } }
        };
    };	
	
    class uhr_truck {
        side = "civ";
        vehicles[] = {
			{ "I_C_Van_01_transport_brown_F",	140000, { "driver" }, 	{ "", "", -1 } },
            { "I_C_Van_01_transport_olive_F",	140000, { "driver" }, 	{ "", "", -1 } },
            { "I_G_Van_01_transport_F",	 		200000, { "driver" }, 	{ "", "", -1 } },
            { "I_G_Van_01_fuel_F", 				225285, { "driver" }, 	{ "", "", -1 } },
            { "I_Truck_02_transport_F", 		430500 , { "truck" }, { "", "", -1 } },
            { "I_Truck_02_covered_F", 			631800 , { "truck" }, { "", "", -1 } },
        //    { "O_Truck_03_transport_F", 		1318947, { "truck" }, { "", "", -1 } },
        //    { "O_Truck_03_covered_F", 		2223750, { "truck" }, { "", "", -1 } },
        //   { "B_Truck_01_transport_F", 		3912615, { "truck" }, { "", "", -1 } },
        //    { "B_Truck_01_ammo_F", 			4783000, { "truck" }, { "", "", -1 } },
        //    { "O_Truck_03_ammo_F", 			8542857, { "truck" }, { "", "", -1 } },
        //    { "O_Truck_03_device_F", 			22600000, { "truck" }, { "", "", -1 } },
        //    { "B_Truck_01_box_F", 			7749778, { "truck" }, { "", "", -1 } },
        //    { "B_Truck_01_covered_F", 		4898571, { "truck" }, { "", "", -1 } },
            { "O_Truck_02_fuel_F", 				978776 , { "truck" }, { "", "", -1 } },
        //    { "O_Truck_03_fuel_F", 			2238077, { "truck" }, { "", "", -1 } },
        //    { "B_Truck_01_fuel_F", 			3372571, { "truck" }, { "", "", -1 } }
		};
    };	
	
    class uhr_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", 				625000  , { "pilot" }, { "", "", -1 } }
        //    { "C_Heli_Light_01_civil_F", 		873000  , { "pilot" }, { "", "", -1 } },
        //    { "O_Heli_Light_02_unarmed_F", 		2000000 , { "pilot" }, { "", "", -1 } },
        //    { "I_Heli_Transport_02_F", 			5170000 , { "pilot" }, { "", "", -1 } },
        //    { "O_Heli_Transport_04_covered_F",  6850000 , { "pilot" }, { "", "", -1 } },
        //    { "B_Heli_Transport_03_unarmed_F",  7232000 , { "pilot" }, { "", "", -1 } },
        //    { "O_Heli_Transport_04_F", 			7283000 , { "pilot" }, { "", "", -1 } },
        //    { "O_Heli_Transport_04_fuel_F", 	8989000 , { "pilot" }, { "", "", -1 } },
        //    { "O_Heli_Transport_04_box_F", 		10098000, { "pilot" }, { "", "", -1 } }
        //    { "B_T_VTOL_01_vehicle_blue_F", 	30098000, { "pilot" }, { "", "", -1 } }
		//	  { "B_T_VTOL_01_vehicle_olive_F", 	30098000, { "pilot" }, { "", "", -1 } }
		};
    };	
	
	class uhr_fly {
        side = "civ";
        vehicles[] = {
            { "I_C_Plane_Civil_01_F", 				625000  , { "pilot" }, { "", "", -1 } },
            { "C_Plane_Civil_01_racing_F", 			925000  , { "pilot" }, { "", "", -1 } }
        };
    };	

    class uhr_ship {
        side = "civ";
        vehicles[] = {
            { "C_Scooter_Transport_01_F", 	15000  , { "boat" }, { "", "", -1 } }, 		//Jet Ski (neu)
            { "I_Boat_Transport_01_F", 		35000  , { "boat" }, { "", "", -1 } }, 		//Schlauchboot
            { "I_G_Boat_Transport_01_F", 	35000  , { "boat" }, { "", "", -1 } }, 		//Kampf(schlauch)boot Uhr
            { "C_Boat_Civil_01_F", 			375000  , { "boat" }, { "", "", -1 } }, 	//Motorboot
            { "I_C_Boat_Transport_02_F", 	875000  , { "boat" }, { "", "", -1 } }, 	//RIB (neu) Uhr
            //{ "B_T_Boat_Armed_01_minigun_F",1555000  , { "boat" }, { "", "", -1 } }, 	//HMG BOOT
            { "I_SDV_01_F", 				1755000, { "boat" }, { "", "", -1 } } 		//Uboot Uhr
		};
    };			
/* >>>>>>>>> L1GA - Rebellen <<<<<<<<<< */
    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 				8000, 		{ "" }, 		{ "", "", -1 } },
            { "B_G_Offroad_01_F", 				42500, 		{ "rebel" }, 	{ "", "", -1 } },
            { "C_Offroad_02_unarmed_F", 		42500, 		{ "rebel" }, 	{ "", "", -1 } }, 		//4WD Reb
            { "C_Offroad_02_unarmed_green_F", 	42500, 		{ "rebel" }, 	{ "", "", -1 } }, 		//4WD Reb
            { "C_Offroad_02_unarmed_black_F", 	42500, 		{ "rebel" }, 	{ "", "", -1 } }, 		//4WD Reb
            { "O_MRAP_02_F", 					8000000,  	{ "rebel" }, 	{ "", "", -1 } },
            { "I_MRAP_03_F", 					10000000,  	{ "rebel" }, 	{ "", "", -1 } },
            { "O_T_LSV_02_unarmed_arid_F", 		7825285,  	{ "rebel" }, 	{ "", "", -1 } },
            { "B_T_LSV_01_unarmed_olive_F", 	7825285,  	{ "rebel" }, 	{ "", "", -1 } },
            { "B_G_Offroad_01_armed_F", 		3000000, 	{ "rebel" }, 	{ "", "", -1 } },
            { "O_LSV_02_armed_arid_F", 			3525000, 	{ "rebel" }, 	{ "", "", -1 } }
        };
    };	

    class reb_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", 				618000 , { "rebel" }, { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", 		2000000, { "rebel" }, { "", "", -1 } },
            { "I_Heli_Transport_02_F", 			4660000, { "rebel" }, { "", "", -1 } },
            { "O_Heli_Transport_04_bench_F", 	9500000, { "rebel" }, { "", "", -1 } }
		};
    };	

class reb_ship {
        side = "civ";
        vehicles[] = {
            { "C_Scooter_Transport_01_F", 	15000  , { "boat" }, { "", "", -1 } }, 		//Jet Ski (neu)
            { "O_Boat_Transport_01_F", 		35000  , { "boat" }, { "", "", -1 } }, 		//Schlauchboot
            { "O_G_Boat_Transport_01_F", 	35000  , { "boat" }, { "", "", -1 } }, 		//Kampf(schlauch)boot Uhr
            { "O_T_Lifeboat", 				100000  , { "boat" }, { "", "", -1 } }, 	//Motorboot
            { "O_G_Boat_Transport_02_F", 	175000  , { "boat" }, { "", "", -1 } }, 	//RIB (neu) Uhr
            { "O_Boat_Armed_01_hmg_F", 		2925000  , { "boat" }, { "", "", -1 } }, 	//bewaffnetes Schnellboot
            { "O_SDV_01_F", 				1200000, { "boat" }, { "", "", -1 } } 		//Uboot
		};
    };	
	
// >>>>>>>>> L1GA - Cargo <<<<<<<<<<<<	
    class civ_cargo {
        side = "civ";
        vehicles[] = {
            { "O_supplyCrate_F", 						450000,  { "" }, { "", "", -1 } },
            { "Land_WaterTank_F", 						590000,  { "" }, { "", "", -1 } },
            { "Land_CargoBox_V1_F", 					594000,  { "" }, { "", "", -1 } },
            { "Land_Pod_Heli_Transport_04_bench_F", 	500000,  { "" }, { "", "", -1 } },
            { "Land_Pod_Heli_Transport_04_covered_F", 	478800,  { "" }, { "", "", -1 } },
            { "Land_Pod_Heli_Transport_04_box_F", 		940500,  { "" }, { "", "", -1 } },
            { "Land_Pod_Heli_Transport_04_ammo_F", 		1575000, { "" }, { "", "", -1 } },
            { "Land_Pod_Heli_Transport_04_fuel_F", 		1111500, { "" }, { "", "", -1 } }
        };
		allVeh[] = {
			"O_supplyCrate_F",
			"Land_WaterTank_F",
			"Land_CargoBox_V1_F",
			"Land_Pod_Heli_Transport_04_bench_F",
			"Land_Pod_Heli_Transport_04_covered_F",
			"Land_Pod_Heli_Transport_04_box_F",
			"Land_Pod_Heli_Transport_04_ammo_F",
			"Land_Pod_Heli_Transport_04_fuel_F"
		};		
    };		
// >>>>>>>>> L1GA - Bohrturm <<<<<<<<<<<<	
    class civ_bohrt {
        side = "civ";
        vehicles[] = {
            { "O_Truck_02_transport_F", 				450000,   { "" }, { "", "", -1 } },
            { "Land_Device_assembled_F", 				6990000,  { "" }, { "", "", -1 } }
//           { "Land_dp_transformer_F", 					594000,  { "" }, { "", "", -1 } }
        };
		allVeh[] = {
			"O_Truck_02_transport_F",
			"Land_Device_assembled_F"
//			"Land_dp_transformer_F"
		};
    };			

// <<<<<<<<<<<<<<<<<<<<<<<< L1GA - Dienste >>>>>>>>>>>>>>>>>>>>>>>>>>	

// <<<<<<<<<<<< L1GA - Polizei >>>>>>>>>>>>>
    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Hatchback_01_F", 		25000,  { "" }, { "life_coplevel", "SCALAR", 1 } },
            { "C_Offroad_01_F", 		30000,  { "" }, { "life_coplevel", "SCALAR", 1 } },
            { "C_Hatchback_01_sport_F", 53000,  { "" }, { "life_coplevel", "SCALAR", 2 } },
            { "C_SUV_01_F", 			40000,  { "" }, { "life_coplevel", "SCALAR", 2 } },
            { "B_MRAP_01_F",			350000, { "" }, { "life_coplevel", "SCALAR", 5 } },
            { "I_MRAP_03_F", 			100000, { "" }, { "life_coplevel", "SCALAR", 8 } },
            { "B_Truck_01_mover_F", 	150000, { "" }, { "life_coplevel", "SCALAR", 10 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", 			75000, { "cAir" }, { "life_coplevel", "SCALAR", 1 } },
            { "O_Heli_Light_02_unarmed_F", 100000, { "cAir" }, { "life_coplevel", "SCALAR", 2 } }
        };
    };

    class cop_airhq {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", 				75000,  { "cAir" }, { "life_coplevel", "SCALAR", 1 } },
            { "O_Heli_Light_02_unarmed_F", 		100000, { "cAir" }, { "life_coplevel", "SCALAR", 2 } },
            { "I_Heli_light_03_unarmed_F", 		180000, { "cAir" }, { "life_coplevel", "SCALAR", 5 } },
            { "I_Heli_Transport_02_F", 			320000, { "cAir" }, { "life_coplevel", "SCALAR", 8 } },
            { "B_Heli_Transport_03_unarmed_F", 	500000, { "cAir" }, { "life_coplevel", "SCALAR", 8 } }
        };
    };	

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", 			30000 ,  { "boat" }, { "life_coplevel", "SCALAR", 2 } },
            { "B_G_Boat_Transport_02_F", 		75000 ,  { "boat" }, { "life_coplevel", "SCALAR", 2 } },
            { "C_Boat_Civil_01_police_F", 		45000 , { "boat" }, { "life_coplevel", "SCALAR", 2 } },
            { "B_Boat_Armed_01_minigun_F", 		2175000 , { "boat" }, { "life_coplevel", "SCALAR", 2 } },
            { "B_SDV_01_F", 					100000, { "boat" }, { "life_coplevel", "SCALAR", 2 } }
		};
    };		
	
// <<<<<<<<<<<< L1GA - LRK >>>>>>>>>>>>>	
    class med_shop {
        side = "med";
        vehicles[] = {
            { "C_Offroad_01_F", 		20000,  { "" }, { "life_medicLevel", "SCALAR", 1 } },
            { "C_Hatchback_01_F", 		30000,  { "" }, { "life_medicLevel", "SCALAR", 1 } },
            { "C_Hatchback_01_sport_F",	60000,  { "" }, { "life_medicLevel", "SCALAR", 3 } },
			{ "C_Van_01_box_F", 		32000,  { "" }, { "life_medicLevel", "SCALAR", 2 } },
			{ "O_Truck_02_covered_F", 	80000,  { "" }, { "life_medicLevel", "SCALAR", 3 } },
			{ "C_SUV_01_F", 			25500,  { "" }, { "life_medicLevel", "SCALAR", 4 } },
            { "I_Truck_02_ammo_F", 		100000, { "" }, { "life_medicLevel", "SCALAR", 4 } },	
			{ "I_Truck_02_medical_F", 	45000,  { "" }, { "life_medicLevel", "SCALAR", 5 } },
            { "B_Truck_01_medical_F", 	80000,  { "" }, { "life_medicLevel", "SCALAR", 6 } }
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", 						70000 , { "mair" }, { "life_medicLevel", "SCALAR", 3 } },
            { "O_Heli_Light_02_unarmed_F", 				95000 , { "mair" }, { "life_medicLevel", "SCALAR", 4 } },
            { "I_Heli_light_03_unarmed_F", 				150000, { "mair" }, { "life_medicLevel", "SCALAR", 5 } },
			{ "I_Heli_Transport_02_F", 					200000, { "mair" }, { "life_medicLevel", "SCALAR", 6 } },
			{ "O_Heli_Transport_04_medevac_F",  		400000, { "mair" }, { "life_medicLevel", "SCALAR", 7 } },
            { "O_Heli_Transport_04_F", 					380000, { "mair" }, { "life_medicLevel", "SCALAR", 7 } },
			{ "Land_Pod_Heli_Transport_04_medevac_F", 	8000, 	{ "" 	 }, { "life_medicLevel", "SCALAR", 7 } }
		};
    };	
// <<<<<<<<<<<< L1GA - A1AC >>>>>>>>>>>>>

    class adac_air {
        side = "adac";
        vehicles[] = {
            { "B_Heli_Light_01_F", 				10000, 	{ "air" }, { "life_adaclevel", "SCALAR", 2 } },
            { "I_Heli_Transport_02_F", 			115000, { "air" }, { "life_adaclevel", "SCALAR", 3 } },
            { "B_Heli_Transport_03_unarmed_F",  225000, { "air" }, { "life_adaclevel", "SCALAR", 4 } },
            { "O_Heli_Transport_04_F", 			250000, { "air" }, { "life_adaclevel", "SCALAR", 5 } },
            { "O_Heli_Transport_04_repair_F",  	1500000,{ "air" }, { "life_adaclevel", "SCALAR", 5 } },
            { "O_Heli_Transport_04_fuel_F", 	1500000,{ "air" }, { "life_adaclevel", "SCALAR", 5 } }
        };
    };	
	
    class adac_car {
        side = "adac";
        vehicles[] = {
            { "B_Truck_01_mover_F", 			50000, { "car" }, { "life_adaclevel", "SCALAR", 3 } },
            { "B_Truck_01_fuel_F", 				30000, { "car" }, { "life_adaclevel", "SCALAR", 3 } },
            { "O_Truck_02_fuel_F", 				25000, { "car" }, { "life_adaclevel", "SCALAR", 2 } },
        //  { "I_Truck_02_fuel_F", 				15000, { "car" }, { "life_adaclevel", "SCALAR", 0 } },
        //  { "I_Truck_02_box_f", 				18000, { "car" }, { "life_adaclevel", "SCALAR", 0 } },
            { "I_Truck_02_transport_F", 		16000, { "car" }, { "life_adaclevel", "SCALAR", 2 } },
            { "B_Truck_01_Repair_F", 			24000, { "car" }, { "life_adaclevel", "SCALAR", 5 } },
            { "O_Truck_02_box_F", 				18000, { "car" }, { "life_adaclevel", "SCALAR", 2 } },
            { "C_Offroad_01_F", 				3200,  { "car" }, { "life_adaclevel", "SCALAR", 1 } },
        //  { "C_Offroad_01_F_repair_F", 		3500,  { "car" }, { "life_adaclevel", "SCALAR", 0 } },
            { "C_SUV_01_F", 					9000,  { "car" }, { "life_adaclevel", "SCALAR", 4 } },
            { "I_Truck_02_ammo_F", 				80000, { "car" }, { "life_adaclevel", "SCALAR", 2 } }
        };
    };	

// <<<<<<<<<<<< L1GA - FLUS1 >>>>>>>>>>>>>	
	
    class flusi_car {
        side = "civ";
        vehicles[] = {
            { "B_G_Offroad_01_repair_F", 	3500, { "car" }, 	{ "life_blacklisted", "SCALAR", 1 } },
            { "C_Van_01_fuel_F", 			800 , { "car" }, 	{ "life_blacklisted", "SCALAR", 1 } },
            { "B_Truck_01_mover_F", 		5000, { "truck" }, 	{ "life_blacklisted", "SCALAR", 1 } }
        };
    };		
// <<<<<<<<<<<< L1GA - Cargo für Dienste >>>>>>>>>>>>>

    class pod_cargo {
        side = "adac";
        vehicles[] = {
            { "Land_Pod_Heli_Transport_04_repair_F", 	8000, { "" }, { "life_adaclevel",   "SCALAR", 1 } },
            { "Land_Pod_Heli_Transport_04_fuel_F", 		8000, { "" }, { "life_adaclevel",	"SCALAR", 1 } }
		};
		allVeh[] = {
			"Land_Pod_Heli_Transport_04_repair_F",
			"Land_Pod_Heli_Transport_04_fuel_F"
//			"Land_dp_transformer_F"
		};		
    };	
};

class LigaCfgKarren {
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
	║	File: Liga_Cfg_Karren.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Edited:  Zoran 	 - Die Liga
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.3	
	╠════════════════════════════════════════════════════════════════════════════════════╗
	║
	║    Vehicle Configs (Contains textures and other stuff)
	║
	║    storageFee (Getting vehicles out of garage) format:
	║        INDEX 0: Civilian Price
	║        INDEX 1: Cop Price
	║        INDEX 2: EMS Price
	║        INDEX 3: OPFOR Price 
	║
	║    garageSell (Selling vehicles from garage) format:
	║        INDEX 0: Civilian Price
	║        INDEX 1: Cop Price
	║        INDEX 2: EMS Price
	║        INDEX 3: OPFOR Price 
	║
	║    Textures config follows { Texture Name, side, {texture(s)path}}
	║
	╚════════════════════════════════════════════════════════════════════════════════════╝
*/

    class Default {
        vItemSpace = -1;
		LigaTank = 10;
		LigaVerbr = 0.00006;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
        ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
    class C_Kart_01_Blu_F {
        vItemSpace = 5;
		LigaTank = 10;
		LigaVerbr = 0.00003;
        storageFee[] = { 3500, 1000, 1000, 1000 };
        garageSell[] = { 7000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};

    };	

    class C_Kart_01_Fuel_F {
        vItemSpace = 5;
		LigaTank = 10;
		LigaVerbr = 0.00003;
        storageFee[] = { 3500, 1000, 1000, 1000 };
        garageSell[] = { 7000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
        ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};		
    };

    class C_Kart_01_Red_F {
        vItemSpace = 5;
		LigaTank = 10;
		LigaVerbr = 0.00003;
        storageFee[] = { 3500, 1000, 1000, 1000 };
        garageSell[] = { 7000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
        ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};		
    };

    class C_Kart_01_Vrana_F {
        vItemSpace = 5;
		LigaTank = 10;
		LigaVerbr = 0.00003;
        storageFee[] = { 3500, 1000, 1000, 1000 };
        garageSell[] = { 7000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
        ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};		
    };

    class C_Kart_01_F {
        vItemSpace = 5;
		LigaTank = 10;
		LigaVerbr = 0.00003;
        storageFee[] = { 3500, 1000, 1000, 1000 };
        garageSell[] = { 7000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
        ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};		
    };	

	class B_Quadbike_01_F {
        vItemSpace = 25;
		LigaTank = 25;
		LigaVerbr = 0.0005;		
        storageFee[] = { 550, 50, 50, 50 };
        garageSell[] = { 950, 50, 50, 50 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "Braun", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            } },
            { "Schwarz", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            } },
            { "Blau", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            } },
            { "Rot", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            } },
            { "Weiß", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            } },
            { "Digi Grün", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            } },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } }			
		};
        ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};		
    };
	
	class C_Hatchback_01_F {
        vItemSpace = 40;
		LigaTank = 50;
		LigaVerbr = 0.00002;		
        storageFee[] = { 1200, 120, 120, 120 };
        garageSell[] = { 4500, 450, 450, 450 };
        insurance = 2500;
        chopShop = 4500;
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },			
			{ "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },			
			{ "Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },			
			{ "Dunkelblau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },			
			{ "Gelb", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },			
			{ "Weiß", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },			
			{ "Grau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },			
			{ "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },			
			{ "COP", "cop", {
                "textures\Limo\hatchback_Polizei.paa"
            } },
			{ "B W", "civ", {
                "textures\Limo\hatchback_0.jpg"
            } },	
			{ "Orange", "civ", {
                "textures\Limo\SUV_purple_Orange.jpg"
            } },
			{ "LRK", "med", {
                "textures\DRK\LRK-Limo.paa"
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class C_Hatchback_01_sport_F {
        vItemSpace = 45;
		LigaTank = 58;
		LigaVerbr = 0.00003;		
        storageFee[] = { 20000, 200, 200, 200 };
        garageSell[] = { 65000, 650, 650, 650 };
        insurance = 2500;
        chopShop = 65000;
        textures[] = {
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
            { "Dunkelblau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
            { "Schwarz / Weiß", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
            { "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
            { "Polizei", "cop", {
                "textures\Limo\hatchback_Polizei.paa"
            } },
            { "B W", "civ", {
                "textures\Limo\hatchback_B&W.jpg"
            } },
            { "Moon", "civ", {
                "textures\CIV\King\hatchback101.jpg"
            } },
            { "Schwarz", "civ", {
                "textures\Limo\Badass_schwarz.jpg"
            } },
            { "Umbrella schwarz", "civ", {
                "textures\Limo\HB_Umbrella_Black.jpg"
            } },
            { "Umbrella weiss", "civ", {
                "textures\Limo\Hb_Umbrella_White.jpg"
            } },
            { "Fallout", "civ", {
                "textures\Limo\HB_Vaul-tec.jpg"
            } },
			{ "LRK", "med", {
                "textures\DRK\LRK-Limo.paa"
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class C_SUV_01_F {
        vItemSpace = 50;
		LigaTank = 65;
		LigaVerbr = 0.00015;		
        storageFee[] = { 5250, 525, 525, 525 };
        garageSell[] = { 23000, 525, 525, 525 };
        insurance = 2500;
        chopShop = 19900;
        textures[] = {
            { "Dunkelrot", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
            { "Schwarz", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
            { "Silber", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Bass", "civ", {
                "textures\civ\SUV\SUV_0.jpg"
            } },
            { "NOS Red", "civ", {
                "textures\Limo\SUV Red.jpg"
            } },
            { "SUKI", "civ", {
                "textures\Limo\SUV SUKI_00000.jpg"
            } },
            { "Grün", "civ", {
                "textures\Limo\SUV_0.jpg"
            } },
            { "Orange", "civ", {
                "textures\Limo\suv_01_ext_04_co_00000.jpg"
            } },
            { "ALAC", "adac", {
                "textures\Limo\adac_suv.paa"
            } },
            { "YOKOHAMA", "civ", {
                "textures\Limo\civ_suv_yokohama.jpg"
            } },
            { "Polizei", "cop", {
                "textures\Polizei\Fahrzeug\cop_suv.paa"
            } },
            { "Notarzt", "med", {
                "textures\DRK\suv_medik.jpg"
            } },
            { "Moon Gelb", "civ", {
                "textures\CIV\King\suv10.jpg"
            } },
            { "Moon Blau", "civ", {
                "textures\CIV\King\suv20.jpg"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
    class C_Offroad_01_F {		
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00015;		
        storageFee[] = { 2500, 250, 250, 250 };
        garageSell[] = { 18000, 900, 900, 900 };
        insurance = 2500;
        chopShop = 8000;
        textures[] = {
            { "Rot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Gelb", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "Weiß", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Blau", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Dunkelrot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
            { "Blau / Weiß", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
            { "Taxi", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
            { "ALAC", "adac", {
                "textures\adac\adac_offroad.jpg"
            } },
            { "Sin City", "civ", {
                "textures\offroad\Offroad_00000sin.jpg"
            } },
            { "LPD", "cop", {
                "textures\offroad\police_offroad.paa"
            } },
            { "LRK", "med", {
                "textures\offroad\medic_offroad.paa"
            } },
            { "Hulk", "civ", {
                "textures\offroad\Offroad_H000.jpg"
            } },
            { "ALAC2", "adac", {
                "textures\offroad\offroad_adac3.paa"
            } },	
			{ "Eisenkarl", "civ", {
                "textures\offroad\Of_Iron.jpg"
            } },
			{ "Joker", "civ", {
                "textures\offroad\Of_Joker.jpg"
            } },
			{ "Umbrella schwarz", "civ", {
                "textures\offroad\Of_Umbrella_Black.jpg"
            } },
			{ "Umbrella weiss", "civ", {
                "textures\offroad\Of_Umbrella_White.jpg"
            } },
			{ "Fallout", "civ", {
                "textures\offroad\OF_Vaul-tec.jpg"
            } },
			{ "Royal", "civ", {
                "textures\offroad\Royal.jpg"
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class B_G_Offroad_01_F {
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00023;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_LSV_02_armed_arid_F { 		//Qilin Buggy armed Reb
        vItemSpace = 150;
		LigaTank = 85;
		LigaVerbr = 0.00023;		
        storageFee[] = { 135000, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_G_Offroad_01_repair_F { // Repair Offroader Flusi
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00015;		
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "FLUSI", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
				//Zoran muss weg, Zoran später KFZ noch piepen lassen müssen!!!
	
	class C_Offroad_02_unarmed_F { 			//4WD Reb + Ziv
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class C_Offroad_02_unarmed_green_F { 		//4WD Reb
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class C_Offroad_02_unarmed_black_F { 		//4WD Reb
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_C_Offroad_02_unarmed_F { 		//4WD Uhr 
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_C_Offroad_02_unarmed_olive_F { 		//4WD Uhr 2
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_C_Offroad_02_unarmed_brown_F { 		//4WD Uhr 3
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00019;		
        storageFee[] = { 3500, 350, 350, 350 };
        garageSell[] = { 30000, 300, 300, 300 };
        insurance = 2500;
        chopShop = 11000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class C_Van_01_transport_F {
        vItemSpace = 100;
		LigaTank = 85;
		LigaVerbr = 0.00025;		
        storageFee[] = { 7890, 789, 789, 789 };
        garageSell[] = { 20000, 200, 200, 200 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {
            { "Weiß", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_G_Van_01_transport_F { 		//Truck Pritsche Uhr (Special)
        vItemSpace = 135;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 8000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_C_Van_01_transport_brown_F { 		//Truck Pritsche Uhr
        vItemSpace = 115;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 8000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_C_Van_01_transport_olive_F { 		//Truck Pritsche Uhr
        vItemSpace = 115;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 8000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class O_LSV_02_unarmed_black_F { 		//Qilin Buggy Ziv
        vItemSpace = 200;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 135000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class B_T_LSV_01_unarmed_black_F { 		//Prowler Buggy Ziv
        vItemSpace = 200;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 135000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class O_T_LSV_02_unarmed_ghex_F { 		//Qilin Buggy Uhr
        vItemSpace = 200;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 135000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class B_T_LSV_01_unarmed_sand_F { 		//Prowler Buggy Uhr
        vItemSpace = 200;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 135000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class O_T_LSV_02_unarmed_arid_F { 		//Qilin Buggy Reb
        vItemSpace = 200;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 135000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class B_T_LSV_01_unarmed_olive_F { 		//Prowler Buggy Reb
        vItemSpace = 200;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 135000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class C_Van_01_box_F {
        vItemSpace = 125;
		LigaTank = 135;
		LigaVerbr = 0.00025;		
        storageFee[] = { 8000, 170, 170, 170 };
        garageSell[] = { 40000, 400, 400, 400 };
        insurance = 2500;
        chopShop = 59000;
        textures[] = {
            { "Weiß", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
            { "Notarzt1", "med", {
                "textures\DRK\rtwfront.paa",
				"textures\DRK\rtwback.paa"
            } },
            { "Notarzt2", "med", {
                "textures\DRK\van_rtw1.jpg",
				"textures\DRK\van_rtw2.jpg"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_Truck_02_transport_F { // Zamak Transport
        vItemSpace = 175;
		LigaTank = 400;
		LigaVerbr = 0.000035;		
        storageFee[] = { 27000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 170000;
        textures[] = {
            { "Orange", "civ", {
				"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"				
            } },
            { "ALAC", "adac", {
                "textures\adac\zamakkabine.jpg"				
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_Truck_02_fuel_F { // Zamak Tank ALAC
        vItemSpace = 200;
		LigaTank = 400;
		LigaVerbr = 0.000035;		
        storageFee[] = { 27000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 17000;
        textures[] = { 
            { "ALAC", "adac", {
                "textures\adac\zamakkabine.jpg"				
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class I_Truck_02_covered_F { // Zamak Transport (Covered)
        vItemSpace = 225;
		LigaTank = 400;
		LigaVerbr = 0.000035;		
        storageFee[] = { 37000, 900, 900, 900 };
        garageSell[] = { 90000, 9000, 9000, 9000 };
        insurance = 2500;
        chopShop = 190000;
        textures[] = {
            { "Orange", "civ", {
				"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"				
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_Truck_01_box_F { //HEMTT Box
        vItemSpace = 700;
		LigaTank = 600;
		LigaVerbr = 0.000045;		
        storageFee[] = { 95000, 2150, 2150, 2150 };
        garageSell[] = { 350000, 3500, 3500, 3500 };
        insurance = 2500;
        chopShop = 780000;
        textures[] = {
            { "Grau", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa"				
            } },
            { "Hellrot", "civ", {
                "textures\CIV\Hemtt\Hemett_rot_light1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot_light2paa.paa"				
            } },
            { "Blau", "civ", {
                "textures\CIV\Hemtt\Hemett_rot1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot2paa.paa"				
            } },
            { "Schwarz", "civ", {
                "textures\CIV\Hemtt\Hemett_schwarz1paa.paa",
				"textures\CIV\Hemtt\Hemett_schwarz2paa.paa"				
            } },
            { "Rot", "civ", {
                "textures\CIV\Hemtt\Hemettblau1paa.paa",
				"textures\CIV\Hemtt\Hemettblau2paa.paa"				
            } },
            { "Grün", "civ", {
                "textures\CIV\Hemtt\Hemettgrn1paa.paa",
				"textures\CIV\Hemtt\Hemettgrn2paa.paa"				
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_Truck_01_transport_F { //HEMTT Transport
        vItemSpace = 400;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 98500, 1865, 1865, 1865 };
        garageSell[] = { 256000, 2560, 2560, 2560 };
        insurance = 2500;
        chopShop = 694000;
        textures[] = {
            { "Grau", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa"				
            } },
            { "Hellrot", "civ", {
                "textures\CIV\Hemtt\Hemett_rot_light1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot_light2paa.paa"				
            } },
            { "Blau", "civ", {
                "textures\CIV\Hemtt\Hemett_rot1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot2paa.paa"				
            } },
            { "Schwarz", "civ", {
                "textures\CIV\Hemtt\Hemett_schwarz1paa.paa",
				"textures\CIV\Hemtt\Hemett_schwarz2paa.paa"				
            } },
            { "Rot", "civ", {
                "textures\CIV\Hemtt\Hemettblau1paa.paa",
				"textures\CIV\Hemtt\Hemettblau2paa.paa"				
            } },
            { "Grün", "civ", {
                "textures\CIV\Hemtt\Hemettgrn1paa.paa",
				"textures\CIV\Hemtt\Hemettgrn2paa.paa"				
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		

	class O_Truck_03_medical_F { // Tempest Medic
        vItemSpace = 350;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 50000, 1400, 1500, 1500 };
        garageSell[] = { 230000, 2300, 2300, 2300 };
        insurance = 2500;
        chopShop = 370000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Truck_03_transport_F { // Tempest Transport ohne Plane!.
        vItemSpace = 300;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 92000, 1400, 1500, 1500 };
        garageSell[] = { 230000, 2300, 2300, 2300 };
        insurance = 2500;
        chopShop = 370000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class O_T_Truck_03_transport_ghex_F { // Tempest Transport ohne Plane!.
        vItemSpace = 300;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 95000, 1400, 1500, 1500 };
        garageSell[] = { 230000, 2300, 2300, 2300 };
        insurance = 2500;
        chopShop = 370000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class O_Truck_03_covered_F {  // Tempest Transporter
        vItemSpace = 375;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 98000, 1550, 1550, 1550 };
        garageSell[] = { 250000, 2500, 2500, 2500 };
        insurance = 2500;
        chopShop = 520000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_T_Truck_03_covered_ghex_F {  // Tempest Transporter
        vItemSpace = 375;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 155000, 1550, 1550, 1550 };
        garageSell[] = { 250000, 2500, 2500, 2500 };
        insurance = 2500;
        chopShop = 520000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class O_Truck_03_device_F { // Temoest Gerät
        vItemSpace = 1000;
		LigaTank = 500;
		LigaVerbr = 0.00005;		
        storageFee[] = { 97000, 1500, 1500, 1500 };
        garageSell[] = { 285000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 300000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_T_Truck_03_device_ghex_F { // Temoest Gerät
        vItemSpace = 1000;
		LigaTank = 500;
		LigaVerbr = 0.00005;		
        storageFee[] = { 98000, 1500, 1500, 1500 };
        garageSell[] = { 285000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 300000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		

	class C_Van_01_fuel_F {
        vItemSpace = 250;
		LigaTank = 95;
		LigaVerbr = 0.000025;		
        storageFee[] = { 7200, 720, 720, 720 };
        garageSell[] = { 95000, 950, 950, 950 };
        insurance = 2500;
        chopShop = 21000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class I_G_Van_01_fuel_F { 		//Truck Tanken Uhr 
        vItemSpace = 250;
		LigaTank = 95;
		LigaVerbr = 0.000025;		
        storageFee[] = { 7200, 720, 720, 720 };
        garageSell[] = { 95000, 950, 950, 950 };
        insurance = 2500;
        chopShop = 21000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class O_Truck_02_fuel_F { //Zamak Fuel
        vItemSpace = 400;
		LigaTank = 390;
		LigaVerbr = 0.000032;		
        storageFee[] = { 68000, 800, 800, 800 };
        garageSell[] = { 95000, 9500, 9500, 9500 };
        insurance = 2500;
        chopShop = 240000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\adac\zamakkabine.jpg",
				"textures\adac\zamak_1.jpg"
            } },
            { "Tankservice", "civ", {
                "textures\CIV\fuel_z_kabine.jpg",
				"textures\CIV\fuel_z_tank.jpg"
            } },
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0,0,0,0.1)",
				"#(argb,8,8,3)color(0,0,0,0.1)"
            } },
            { "Grau", "civ", {
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } },
            { "Dunkel Grün", "civ", {
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } },
            { "Dunkel Blau", "civ", {
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class O_Truck_02_covered_F { // Zamak Transport (Covered)  OPFER
        vItemSpace = 225;
		LigaTank = 400;
		LigaVerbr = 0.000035;		
        storageFee[] = { 2000, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "LRK", "med", {
                "textures\DRK\f1.jpg",
				"textures\DRK\f2.jpg"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class O_Truck_02_box_F { //Zamak Rep
        vItemSpace = 145;
		LigaTank = 400;
		LigaVerbr = 0.000035;		
        storageFee[] = { 40000, 1500, 1500, 1500 };
        garageSell[] = { 500000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\adac\zamakkabine.jpg",
				"textures\adac\Zamakrepair.jpg"
            } },
            { "Tankservice", "civ", {
                "textures\CIV\fuel_z_kabine.jpg",
				"textures\CIV\fuel_z_tank.jpg"
            } },
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } },
            { "Grau", "civ", {
                "#(argb,8,8,3)color(0.5,0.5,0.5,0.6)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } },
            { "Dunkel Grün", "civ", {
                "#(argb,8,8,3)color(0.3,0.8,0.5,0.1)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } },
            { "Dunkel Blau", "civ", {
                "#(argb,8,8,3)color(0.1,0.1,0.7,0.1)",
				"#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		

	class O_Truck_03_fuel_F { // Tempest Tanken
        vItemSpace = 550;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 95000, 1150, 1150, 1150 };
        garageSell[] = { 200000, 2000, 2000, 2000 };
        insurance = 2500;
        chopShop = 300000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_T_Truck_03_fuel_ghex_F { // Tempest Tanken
        vItemSpace = 550;
		LigaTank = 500;
		LigaVerbr = 0.000055;		
        storageFee[] = { 95000, 1150, 1150, 1150 };
        garageSell[] = { 200000, 2000, 2000, 2000 };
        insurance = 2500;
        chopShop = 300000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class B_Truck_01_fuel_F { //Hemmt Fuel
        vItemSpace = 650;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 95000, 1550, 1550, 1550 };
        garageSell[] = { 540000, 5400, 5400, 5400 };
        insurance = 2500;
        chopShop = 620000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\adac\hemtt_0.jpg",
				"textures\adac\hemtt_1.jpg",
				"textures\adac\hemtt_2.jpg"
            } },
            { "Tankservice", "civ", {
                "textures\CIV\Tank0_1.jpg",
				"textures\CIV\Tank1_1.jpg",
				"textures\CIV\Tank2_1.jpg"
            } },
            { "Grau", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa"
            } },
            { "Hellrot", "civ", {
                "textures\CIV\Hemtt\Hemett_rot_light1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot_light2paa.paa"
            } },
            { "Blau", "civ", {
                "textures\CIV\Hemtt\Hemett_rot1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot2paa.paa"
            } },
            { "Schwarz", "civ", {
                "textures\CIV\Hemtt\Hemett_schwarz1paa.paa",
				"textures\CIV\Hemtt\Hemett_schwarz2paa.paa"
            } },
            { "Rot", "civ", {
                "textures\CIV\Hemtt\Hemettblau1paa.paa",
				"textures\CIV\Hemtt\Hemettblau2paa.paa"
            } },
            { "Grün", "civ", {
                "textures\CIV\Hemtt\Hemettgrn1paa.paa",
				"textures\CIV\Hemtt\Hemettgrn2paa.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_Heli_Transport_03_unarmed_F { //Huron
        vItemSpace = 325;
		LigaTank = 85;
		LigaVerbr = 0.00006;
        storageFee[] = { 120000, 12000, 12000, 12000 };
        garageSell[] = { 2100000, 1200, 1200, 1200 };
        insurance = 2500;
        chopShop = 1100000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\adac\ADAC_vorne.jpg",
                "textures\adac\ADAC_hinten.jpg"
            } },
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)",
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } },
            { "Polizei", "cop", {
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)",
                "#(argb,8,8,3)color(0.3,0.3,0.3,0.1)"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Heli_Transport_04_F { // Taru
        vItemSpace = 60;
		LigaTank = 105;
		LigaVerbr = 0.00006;		
        storageFee[] = { 160000, 2300, 2300, 2300 };
        garageSell[] = { 950000, 9500, 9500, 9500 };
        insurance = 2500;
        chopShop = 820000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Camo", "civ", {
                "textures\CIV\Taru camouflage_10000.jpg",
                "textures\CIV\Taru camouflage_00000.jpg"                
            } },
            { "Camo Schwarz", "civ", {
                "textures\CIV\1D.Taru camouflage Black_00000.jpg",
                "textures\CIV\2D.Taru camouflage Black_00000_00000_00000.jpg"               
            } },			
            { "ALAC", "adac", {
                "textures\ADAC\Taru Adac T1_00000.jpg",
                "textures\ADAC\Taru ADAC T2_00000.jpg"               
            } },
            { "Blau", "civ", {
                "textures\CIV\1D.Taru civ blue _00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000.jpg"               
            } },
            { "Rot", "civ", {
                "textures\CIV\1D.Taru civ red.jpg",
                "textures\CIV\2D. Taru civ red.jpg"               
            } },
            { "Grün", "civ", {
                "textures\CIV\1D.Taru civ green.jpg",
                "textures\CIV\2D. Taru civ green.jpg"               
            } },
            { "Dunkel Blau", "civ", {
                "textures\CIV\1D.Taru civ blue_00000_00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000_00000.jpg"           
            } },
            { "Camo Braun", "civ", {
                "textures\CIV\D1_Taru_camouflage_brown_00000.jpg",
                "textures\CIV\D2_Taru_camouflage_brown.jpg"           
            } },
            { "Dunkel Lila", "civ", {
                "textures\CIV\D1_Taru_Black_Purpel_00000.jpg",
                "textures\CIV\D2_Taru_Black_Purpel_00000.jpg"           
            } },
            { "Dunkel Rot", "civ", {
				"textures\CIV\D1_Taru_civ_red_Black.jpg",
                "textures\CIV\D2_Taru_civ_red_Black.jpg"          
            } },
            { "Camo Standard", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa"         
            } },			
            { "Olive", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa"          
            } },
            { "LRK", "med", {
				"textures\DRK\Taru Medic Box T1.jpg",
                "textures\DRK\Taru Medic Box T2.jpg"         
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		

	class O_Heli_Transport_04_bench_F {
        vItemSpace = 180;
		LigaTank = 105;
		LigaVerbr = 0.00006;		
        storageFee[] = { 1750000, 2900, 2900, 2900 };
        garageSell[] = { 1005000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 1090000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_T_VTOL_01_vehicle_blue_F { 		//Balckfish Blau
        vItemSpace = 950;
		LigaTank = 150;
		LigaVerbr = 0.00007;		
        storageFee[] = { 190000, 2900, 2900, 2900 };
        garageSell[] = { 1005000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 1090000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_T_VTOL_01_vehicle_olive_F {	 	//Blackfish Olive
        vItemSpace = 950;
		LigaTank = 150;
		LigaVerbr = 0.00007;		
        storageFee[] = { 190000, 2900, 2900, 2900 };
        garageSell[] = { 1005000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 1090000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Heli_Transport_04_box_F {	//Taru Fracht
        vItemSpace = 430;
		LigaTank = 105;
		LigaVerbr = 0.00006;		
        storageFee[] = { 175000, 2100, 2100, 2100 };
        garageSell[] = { 812000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 700000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Camo", "civ", {
                "textures\CIV\Taru camouflage_10000.jpg",
                "textures\CIV\Taru camouflage_00000.jpg",
				"textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Camo Schwarz", "civ", {
                "textures\CIV\1D.Taru camouflage Black_00000.jpg",
                "textures\CIV\2D.Taru camouflage Black_00000_00000_00000.jpg",
				"textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Blau", "civ", {
                "textures\CIV\1D.Taru civ blue _00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000.jpg",
				"textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Rot", "civ", {
                "textures\CIV\1D.Taru civ red.jpg",
                "textures\CIV\2D. Taru civ red.jpg",
				"textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Grün", "civ", {
                "textures\CIV\1D.Taru civ green.jpg",
                "textures\CIV\2D. Taru civ green.jpg",
				"textures\TB\TCB_GR1.paa",
				"textures\TB\TCB_GR2.paa"
            } },
            { "Dunkel Blau", "civ", {
                "textures\CIV\1D.Taru civ blue_00000_00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000_00000.jpg",
				"textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Camo Braun", "civ", {
                "textures\CIV\D1_Taru_camouflage_brown_00000.jpg",
                "textures\CIV\D2_Taru_camouflage_brown.jpg"
            } },
            { "Dunkel Lila", "civ", {
                "textures\CIV\D1_Taru_Black_Purpel_00000.jpg",
                "textures\CIV\D2_Taru_Black_Purpel_00000.jpg",
				"textures\TB\TCB_P_B1.paa",
				"textures\TB\TCB_P_B2.paa"
            } },
            { "Dunkel Rot", "civ", {
				"textures\CIV\D1_Taru_civ_red_Black.jpg",
                "textures\CIV\D2_Taru_civ_red_Black.jpg",
				"textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Camo Standard", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa",        
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",        
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"         
            } },			
            { "Olive", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",          
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"          
            } }		
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class O_Heli_Transport_04_covered_F { //Taru Transport
        vItemSpace = 280;
		LigaTank = 105;
		LigaVerbr = 0.00006;			
        storageFee[] = { 160000, 1500, 1500, 1500 };
        garageSell[] = { 610000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 550000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Camo", "civ", {
                "textures\CIV\Taru camouflage_10000.jpg",
                "textures\CIV\Taru camouflage_00000.jpg",
				"textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Camo Schwarz", "civ", {
                "textures\CIV\1D.Taru camouflage Black_00000.jpg",
                "textures\CIV\2D.Taru camouflage Black_00000_00000_00000.jpg",
				"textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Blau", "civ", {
                "textures\CIV\1D.Taru civ blue _00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000.jpg",
				"textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Rot", "civ", {
                "textures\CIV\1D.Taru civ red.jpg",
                "textures\CIV\2D. Taru civ red.jpg",
				"textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Grün", "civ", {
                "textures\CIV\1D.Taru civ green.jpg",
                "textures\CIV\2D. Taru civ green.jpg",
				"textures\TB\TCB_GR1.paa",
				"textures\TB\TCB_GR2.paa"
            } },
            { "Dunkel Blau", "civ", {
                "textures\CIV\1D.Taru civ blue_00000_00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000_00000.jpg",
				"textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Camo Braun", "civ", {
                "textures\CIV\D1_Taru_camouflage_brown_00000.jpg",
                "textures\CIV\D2_Taru_camouflage_brown.jpg"
            } },
            { "Dunkel Lila", "civ", {
                "textures\CIV\D1_Taru_Black_Purpel_00000.jpg",
                "textures\CIV\D2_Taru_Black_Purpel_00000.jpg",
				"textures\TB\TCB_P_B1.paa",
				"textures\TB\TCB_P_B2.paa"
            } },
            { "Dunkel Rot", "civ", {
				"textures\CIV\D1_Taru_civ_red_Black.jpg",
                "textures\CIV\D2_Taru_civ_red_Black.jpg",
				"textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Camo Standard", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa",        
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",        
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"         
            } },			
            { "Olive", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",          
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"          
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Heli_Transport_04_fuel_F { // Taru Tank
        vItemSpace = 400;
		LigaTank = 105;
		LigaVerbr = 0.00006;			
        storageFee[] = { 175000, 1500, 1500, 1500 };
        garageSell[] = { 610000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 550000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Camo", "civ", {
                "textures\CIV\Taru camouflage_10000.jpg",
                "textures\CIV\Taru camouflage_00000.jpg"
            } },
            { "Camo Schwarz", "civ", {
                "textures\CIV\1D.Taru camouflage Black_00000.jpg",
                "textures\CIV\2D.Taru camouflage Black_00000_00000_00000.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Blau", "civ", {
                "textures\CIV\1D.Taru civ blue _00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Rot", "civ", {
                "textures\CIV\1D.Taru civ red.jpg",
                "textures\CIV\2D. Taru civ red.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Grün", "civ", {
                "textures\CIV\1D.Taru civ green.jpg",
                "textures\CIV\2D. Taru civ green.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Dunkel Blau", "civ", {
                "textures\CIV\1D.Taru civ blue_00000_00000_00000.jpg",
                "textures\CIV\2D.Taru civ blue_00000_00000.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Camo Braun", "civ", {
                "textures\CIV\D1_Taru_camouflage_brown_00000.jpg",
                "textures\CIV\D2_Taru_camouflage_brown.jpg"
            } },
            { "Dunkel Lila", "civ", {
                "textures\CIV\D1_Taru_Black_Purpel_00000.jpg",
                "textures\CIV\D2_Taru_Black_Purpel_00000.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"
            } },
            { "Dunkel Rot", "civ", {
				"textures\CIV\D1_Taru_civ_red_Black.jpg",
                "textures\CIV\D2_Taru_civ_red_Black.jpg",
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"          
			} },
            { "Camo Standard", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa"       
            } },			
            { "Olive", "civ", {
				"\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"          
            } },
            { "ALAC", "adac", {
				"textures\ADAC\Taru Adac T1_00000.jpg",
                "textures\ADAC\Taru ADAC T2_00000.jpg",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa"          
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Heli_Transport_04_medevac_F { //Taru Medic
        vItemSpace = 320;
		LigaTank = 105;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1500, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
			{ "LRK", "med", {
				"textures\DRK\Taru Medic Box T1.jpg",
				"textures\DRK\Taru Medic Box T2.jpg",
				"textures\TB\TMB1.paa",
				"textures\TB\TMB2.paa"
			} }
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_Heli_Transport_04_repair_F { //Taru Rep
        vItemSpace = 320;
		LigaTank = 105;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1500, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
			{ "ALAC", "adac", {
				"textures\ADAC\Taru Adac T1_00000.jpg",				
				"textures\ADAC\Taru ADAC T2_00000.jpg",
				"textures\ADAC\Taru Adac T3_00000.jpg",
				"textures\TB\TAB_B1.paa"
			} }
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_Truck_01_mover_F { // HEMMT Move
        vItemSpace = 150;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 15000, 1000, 1000, 1000 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\ADAC\adac_hemtt_mover.jpg"
            } },
            { "Polizei", "cop", {
                "textures\Polizei\Fahrzeug\PolizeiHemtt.jpg"
            } },
            { "FLUSI", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_Truck_01_repair_F { // HEMMT Repair
        vItemSpace = 150;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 50000, 1500, 1500, 1500 };
        garageSell[] = { 200000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\ADAC\adac_hemtt_mover.jpg"
            } }		
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_Truck_01_medical_F { // HEMMT Repair
        vItemSpace = 150;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 15000, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\ADAC\adac_hemtt_mover.jpg"
            } }		
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
		
	class C_Heli_Light_01_civil_F {
        vItemSpace = 60;
		LigaTank = 62;
		LigaVerbr = 0.00005;			
        storageFee[] = { 22000, 920, 920, 920 };
        garageSell[] = { 142000, 500, 500, 500 };
        insurance = 2500;
        chopShop = 147000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};		
    };	
	
	class C_Offroad_01_F_repair_F {
        vItemSpace = 65;
		LigaTank = 85;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1500, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class Land_Wreck_Traw_F {
        vItemSpace = 100000;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_Wreck_Traw2_F {
        vItemSpace = 100000;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_Truck_01_covered_F { //HEMTT Transport (Covered)
        vItemSpace = 500;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 98000, 1500, 1500, 1500 };
        garageSell[] = { 450000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 990000;
        textures[] = {
            { "Grau", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa"
            } },
            { "Hellrot", "civ", {
                "textures\CIV\Hemtt\Hemett_rot_light1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot_light2paa.paa"
            } },
            { "Grau", "civ", {
                "textures\CIV\Hemtt\Hemett_rot1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot2paa.paa"
            } },
            { "Blau", "civ", {
                "textures\CIV\Hemtt\Hemett_schwarz1paa.paa",
				"textures\CIV\Hemtt\Hemett_schwarz2paa.paa"
            } },
            { "Schwarz", "civ", {
                "textures\CIV\Hemtt\Hemettblau1paa.paa",
				"textures\CIV\Hemtt\Hemettblau2paa.paa"
            } },
            { "Rot", "civ", {
                "textures\CIV\Hemtt\Hemettgrn1paa.paa",
				"textures\CIV\Hemtt\Hemettgrn2paa.paa"
            } },
            { "Grün", "civ", {
                "textures\CIV\Hemtt\Hemettgrn1paa.paa",
				"textures\CIV\Hemtt\Hemettgrn2paa.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class B_Truck_01_ammo_F { //HEMTT Ammo
        vItemSpace = 450;
		LigaTank = 450;
		LigaVerbr = 0.000045;		
        storageFee[] = { 98000, 1500, 1500, 1500 };
        garageSell[] = { 290000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 490000;
        textures[] = {
            { "Grau", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa"
            } },
            { "Hellrot", "civ", {
                "textures\CIV\Hemtt\Hemett_rot_light1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot_light2paa.paa"
            } },
            { "Blau", "civ", {
                "textures\CIV\Hemtt\Hemett_rot1paa.paa",
				"textures\CIV\Hemtt\Hemett_rot2paa.paa"
            } },
            { "Schwarz", "civ", {
                "textures\CIV\Hemtt\Hemett_schwarz1paa.paa",
				"textures\CIV\Hemtt\Hemett_schwarz2paa.paa"
            } },
            { "Rot", "civ", {
                "textures\CIV\Hemtt\Hemettblau1paa.paa",
				"textures\CIV\Hemtt\Hemettblau2paa.paa"
            } },
            { "Grün", "civ", {
                "textures\CIV\Hemtt\Hemettgrn1paa.paa",
				"textures\CIV\Hemtt\Hemettgrn2paa.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Truck_03_ammo_F {	//Temoest Munition
        vItemSpace = 1000;
		LigaTank = 600;
		LigaVerbr = 0.000025;			
        storageFee[] = { 105000, 2250, 2250, 2250 };
        garageSell[] = { 315000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 860000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	class O_T_Truck_03_ammo_ghex_F {	//Temoest Munition neue Lackierung
        vItemSpace = 1000;
		LigaTank = 600;
		LigaVerbr = 0.000025;			
        storageFee[] = { 105000, 2250, 2250, 2250 };
        garageSell[] = { 315000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 860000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class I_Truck_02_medical_F {
        vItemSpace = 650;
		LigaTank = 400;
		LigaVerbr = 0.000026;			
        storageFee[] = { 1500, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class I_Truck_02_ammo_F { // Zamak Ammo
        vItemSpace = 750;
		LigaTank = 400;
		LigaVerbr = 0.000026;			
        storageFee[] = { 15000, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "LRK", "med", {
                "textures\DRK\kab1.paa",
				"textures\DRK\truck.paa"
            } },
            { "ALAC", "adac", {
                "textures\ADAC\K1600_front.JPG",
				"textures\ADAC\K1600_gkw.JPG"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Land_CargoBox_V1_F {
        vItemSpace = 275;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_WaterTank_F {
        vItemSpace = 390;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_supplyCrate_F {
        vItemSpace = 90;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_SDV_01_F {
        vItemSpace = 225;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 25000, 6500, 6500, 6500 };
        garageSell[] = { 400000, 4500, 4500, 4500 };
        insurance = 2500;
        chopShop = 190000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_SDV_01_F {
        vItemSpace = 155;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 25000, 2500, 2500, 2500 };
        garageSell[] = { 45000, 4500, 4500, 4500 };
        insurance = 2500;
        chopShop = 70000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class Land_TentA_F {
        vItemSpace = 120;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	
	class Land_WaterBarrel_F {
        vItemSpace = 155;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_HeatPump_F {
        vItemSpace = 95;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class Land_Bucket_painted_F {
        vItemSpace = 18;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Land_BarrelWater_F {
        vItemSpace = 70;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class Land_Pod_Heli_Transport_04_bench_F {
        vItemSpace = 70;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Land_Pod_Heli_Transport_04_covered_F { //Mit Bank drinnen
        vItemSpace = 280;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Camo Schwarz", "civ", {
                "textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Blau", "civ", {
                "textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Grün", "civ", {
                "textures\TB\TCB_GR1.paa",
				"textures\TB\TCB_GR2.paa"
            } },
            { "Lila", "civ", {
                "textures\TB\TCB_P_B1.paa",
				"textures\TB\TCB_P_B2.paa"
            } },
            { "Rot", "civ", {
                "textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Camo Standard", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"
            } },
            { "Olive", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Land_Pod_Heli_Transport_04_fuel_F {
        vItemSpace = 650;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "Camo Standard", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"
            } },
            { "Olive", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_Pod_Heli_Transport_04_box_F {
        vItemSpace = 550;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
			{ "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Camo Schwarz", "civ", {
                "textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Blau", "civ", {
                "textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Grün", "civ", {
                "textures\TB\TCB_GR1.paa",
				"textures\TB\TCB_GR2.paa"
            } },
            { "Lila", "civ", {
                "textures\TB\TCB_P_B1.paa",
				"textures\TB\TCB_P_B2.paa"
            } },
            { "Rot", "civ", {
                "textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Camo Standard", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"
            } },
            { "Olive", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_Pod_Heli_Transport_04_ammo_F { //Munition Pod Uran
        vItemSpace = 350;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
           { "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Camo Schwarz", "civ", {
                "textures\TB\TCB_CBL_B1.paa",
				"textures\TB\TCB_CBL_B2.paa"
            } },
            { "Blau", "civ", {
                "textures\TB\TCB_B1.paa",
				"textures\TB\TCB_B2.paa"
            } },
            { "Grün", "civ", {
                "textures\TB\TCB_GR1.paa",
				"textures\TB\TCB_GR2.paa"
            } },
            { "Lila", "civ", {
                "textures\TB\TCB_P_B1.paa",
				"textures\TB\TCB_P_B2.paa"
            } },
            { "Rot", "civ", {
                "textures\TB\TCP_RBL1.paa",
				"textures\TB\TCB_RBL_B2.paa"
            } },
            { "Camo Standard", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"
            } },
            { "Olive", "civ", {
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",
                "\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Land_Pod_Heli_Transport_04_repair_F { //Repair Pod
        vItemSpace = 150;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "ALAC", "adac", {
                "textures\ADAC\Taru Adac T3_00000.jpg",
				"textures\TB\TAB_B1.paa"
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class Land_Pod_Heli_Transport_04_medevac_F { // LRK Pod
        vItemSpace = 150;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "LRK", "med", {
                "textures\TB\TMB1.paa",
				"textures\TB\TMB2.paa"
            } }				
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Box_IND_Grenades_F {
        vItemSpace = 350;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class B_supplyCrate_F {
        vItemSpace = 700;
        storageFee[] = { 0, 0, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class I_Heli_light_03_unarmed_F { //Hellcat
        vItemSpace = 210;
		LigaTank = 65;
		LigaVerbr = 0.00006;			
        storageFee[] = { 15000, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
            { "LRK", "med", {
                "textures\DRK\lrk_hellcat1.paa"
            } },
			{ "Notarzt", "med", {
                "textures\DRK\notarzt_hellcat.paa"
            } },
			{ "Polizei", "cop", {
                "textures\Polizei\Fahrzeug\cop_Hellcat.paa"
            } }
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class C_Boat_Civil_01_F {
        vItemSpace = 275;
		LigaTank = 10;
		LigaVerbr = 0.000055;			
        storageFee[] = { 4500, 1450, 450, 450 };
        garageSell[] = { 6800, 680, 680, 680 };
        insurance = 2500;
        chopShop = 13000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 3500, 1350, 1500, 350 };
        garageSell[] = { 4950, 495, 495, 495 };
        insurance = 2500;
		chopShop = 12500;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 85;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1500, 1500, 1500, 1500 };
        garageSell[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_MRAP_01_F { //Hunter
        vItemSpace = 30;
		LigaTank = 160;
		LigaVerbr = 0.000020;		
        storageFee[] = { 75000, 7500, 7500, 7500 };
        garageSell[] = { 50000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 1300000;
        textures[] = {
            { "Tarn", "cop", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa"
            } },
            { "Schwarz", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Polizei", "cop", {
                "textures\Polizei\Fahrzeug\cop_hunter1.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_MRAP_02_F { //Ifrit
        vItemSpace = 30;
		LigaTank = 160;
		LigaVerbr = 0.00003;		
        storageFee[] = { 650000, 65000, 65000, 65000 };
        garageSell[] = { 1500000, 6500, 5000, 5000 };
        insurance = 2500;
        chopShop = 1200000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_MRAP_03_F { //Strider
        vItemSpace = 30;
		LigaTank = 160;
		LigaVerbr = 0.00002;		
        storageFee[] = { 750000, 75000, 750000, 750000 };
        garageSell[] = { 1850000, 18500, 18500, 18500 };
        insurance = 2500;
        chopShop = 1200000;
        textures[] = {
            { "Camo", "reb", {
                "textures\Strider\mrap_03_ext_un2_co.jpg"
            } },
            { "Polizei", "cop", {
                "textures\Strider\strider_sek.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class B_Heli_Light_01_F { //Humingbird MH-9
        vItemSpace = 40;
		LigaTank = 50;
		LigaVerbr = 0.00006;			
        storageFee[] = { 75000, 750, 750, 750 };
        garageSell[] = { 97000, 1700, 1700, 1700 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
            { "Ion", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
            { "Blau", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
            { "Digi Grün", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },			
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "LRK weiß", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
            { "ALAC", "adac", {
                "textures\Humm\adac_hummingbird.paa"
            } },
            { "LRK", "med", {
                "textures\Humm\Notarzt_Hummingbird.paa"
            } },
            { "Polizei", "cop", {
                "textures\Humm\police_hummingbird.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class C_Plane_Civil_01_F { //Cessna Ziv
        vItemSpace = 85;
		LigaTank = 75;
		LigaVerbr = 0.00006;			
        storageFee[] = { 35000, 750, 750, 750 };
        garageSell[] = { 97000, 1700, 1700, 1700 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class I_C_Plane_Civil_01_F { //Cessna Uhr
        vItemSpace = 85;
		LigaTank = 75;
		LigaVerbr = 0.00006;			
        storageFee[] = { 35000, 750, 750, 750 };
        garageSell[] = { 97000, 1700, 1700, 1700 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class C_Plane_Civil_01_racing_F { //Cessna Rennen (Ziv + Uhr)
        vItemSpace = 100;
		LigaTank = 75;
		LigaVerbr = 0.00006;			
        storageFee[] = { 38000, 750, 750, 750 };
        garageSell[] = { 97000, 1700, 1700, 1700 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_Heli_Light_02_unarmed_F { //Orca
        vItemSpace = 150;
		LigaTank = 65;
		LigaVerbr = 0.00003;			
        storageFee[] = { 103000, 1250, 1250, 1250 };
        garageSell[] = { 400000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 300000;
        textures[] = {
            { "Schwarz", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
            { "Weiß / Blau", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
            { "Digi Grün", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "LRK weiß", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
            { "LRK", "med", {
                "textures\Orca\orca_notarzt.paa"
            } },
            { "Polizei", "cop", {
                "textures\Polizei\Fahrzeug\orca_polizei.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    }; 

	class I_Heli_Transport_02_F {		//Mohawk
        vItemSpace = 200;
		LigaTank = 65;
		LigaVerbr = 0.00005;			
        storageFee[] = { 120000, 2200, 2200, 2200 };
        garageSell[] = { 1250000, 7500, 7500, 7500 };
        insurance = 2500;
        chopShop = 730000;
        textures[] = {
            { "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            } },
            { "Rot-Weiß", "civ", {
				"textures\mohawk\rot1.paa",
				"textures\mohawk\rot2.paa",
				"textures\mohawk\rot3.paa"
            } },
            { "Blau-Weiß", "civ", {
				"textures\mohawk\blau1.paa",
				"textures\mohawk\blau2.paa",
				"textures\mohawk\blau3.paa"
            } },
            { "ALAC 2", "adac", {
				"textures\mohawk\adac_mohawk1.jpg",
				"textures\mohawk\adac_mohawk2.jpg",
				"textures\mohawk\adac_mohawk3.jpg"
            } },
            { "Digi", "reb", {
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_indp_co.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_indp_co.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_indp_co.paa"
            } },
            { "Hellblau", "civ", {
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_nohq.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_nohq.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_nohq.paa"
            } },
            { "Pink", "civ", {
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_smdi.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_smdi.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_smdi.paa"
            } },
            { "Schwarz", "civ", {
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_ti_ca.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_ti_ca.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_ti_ca.paa"
            } },
            { "Weiß", "med", {
				"#(argb,8,8,3)color(1,1,1,0.8)",
				"#(argb,8,8,3)color(1,1,1,0.8)",
				"#(argb,8,8,3)color(1,1,1,0.8)"
            } },
            { "Dunkel Blau", "civ", {
				"#(argb,8,8,3)color(0,0,0.7,0.1)",
				"#(argb,8,8,3)color(0,0,0.7,0.1)",
				"#(argb,8,8,3)color(0,0,0.7,0.1)"
            } },
            { "DRF", "med", {
				"textures\mohawk\EMDMH_co.paa",
				"textures\mohawk\EMDMH2_co.paa",
				"textures\mohawk\EMDMH3_co.paa"
            } },
            { "Camo Blau", "reb", {
				"textures\mohawk\D1_mohawk_Camo_blue.jpg",
				"textures\mohawk\D2_mohawk_Camo_blue.jpg",
				"textures\mohawk\D3_mohawk_Camo_blue.jpg"
            } },
            { "Camo Dunkel", "reb", {
				"textures\mohawk\1D.camo_mohawk.jpg",
				"textures\mohawk\2D.camo_mohawk.jpg",
				"textures\mohawk\3D.camo_mohawk.jpg"
            } },
            { "Camo Braun", "reb", {
				"textures\mohawk\1D.camo_mohawk_brown.jpg",
				"textures\mohawk\2D.camo_mohawk_brown.jpg",
				"textures\mohawk\3D.camo_mohawk_brown.jpg"
            } },
            { "Camo Schwarz", "reb", {
				"textures\mohawk\1D.camo_mohawk1.jpg",
				"textures\mohawk\2D.camo_mohawk1.jpg",
				"textures\mohawk\3D.camo_mohawk1.jpg"
            } },
            { "Dunkel Rot", "civ", {
				"#(argb,8,8,3)color(0.7,0,0,0.1)",
				"#(argb,8,8,3)color(0.7,0,0,0.1)",
				"#(argb,8,8,3)color(0.7,0,0,0.1)"
            } },
            { "Dunkel Grün", "civ", {
				"#(argb,8,8,3)color(0,0.7,0,0.1)",
				"#(argb,8,8,3)color(0,0.7,0,0.1)",
				"#(argb,8,8,3)color(0,0.7,0,0.1)"
            } },
            { "Polizei", "cop", {
				"textures\mohawk\cop\mohowk_cop1.paa",
				"textures\mohawk\cop\mohowk_cop2.paa",
				"textures\mohawk\cop\mohowk_cop3.paa"
            } },
            { "Matrix", "reb", {
				"textures\mohawk\Rbellen\Matrix_mohawk_1.paa",
				"textures\mohawk\Rbellen\Matrix_mohawk_2.paa",
				"textures\mohawk\Rbellen\Matrix_mohawk_3.paa"
            } },
            { "Camo Grün", "reb", {
				"textures\mohawk\Rbellen\camo_grun_braun_1.paa",
				"textures\mohawk\Rbellen\camo_grun_braun_2.paa",
				"textures\mohawk\Rbellen\camo_grun_braun_3.paa"
            } },
            { "Leo", "civ", {
				"textures\mohawk\civ\leo_1.paa",
				"textures\mohawk\civ\leo_2.paa",
				"textures\mohawk\civ\leo_3.paa"
            } }			
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	/*BOOTE*/
	class C_Scooter_Transport_01_F {
        vItemSpace = 64;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1400, 540, 40, 40 };
        garageSell[] = { 950, 95, 95, 95 };
        insurance = 2500;
        chopShop = 800;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class C_Rubberboat {
        vItemSpace = 100;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1400, 1440, 40, 40 };
        garageSell[] = { 950, 95, 95, 95 };
        insurance = 2500;
        chopShop = 800;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class C_Boat_Transport_02_F {
        vItemSpace = 135;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1400, 1440, 40, 40 };
        garageSell[] = { 950, 95, 95, 95 };
        insurance = 2500;
        chopShop = 800;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_C_Boat_Transport_02_F {
        vItemSpace = 355;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1400, 1440, 40, 40 };
        garageSell[] = { 950, 95, 95, 95 };
        insurance = 2500;
        chopShop = 800;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_G_Boat_Transport_02_F {
        vItemSpace = 135;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1400, 1440, 40, 40 };
        garageSell[] = { 950, 95, 95, 95 };
        insurance = 2500;
        chopShop = 800;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_SDV_01_F {
        vItemSpace = 575;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 1400, 1440, 40, 40 };
        garageSell[] = { 950, 95, 95, 95 };
        insurance = 2500;
        chopShop = 800;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 200;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 845000, 845000, 845000, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 600000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };
	
	class B_T_Boat_Armed_01_minigun_F {
        vItemSpace = 510;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 10450, 10600, 10500, 0 };
        garageSell[] = { 980000, 980000, 980000, 980000 };
        insurance = 2500;
        chopShop = 680000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_Boat_Armed_01_minigun_F {
        vItemSpace = 200;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 16500, 1650, 1500, 1650 };
        garageSell[] = { 2100, 2100, 2100, 2100 };
        insurance = 2500;
        chopShop = 54000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };

	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 200;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 24210, 24201, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_G_Boat_Transport_01_F {
        vItemSpace = 45;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2450, 1410, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_G_Boat_Transport_01_F {
        vItemSpace = 105;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2541, 1750, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class I_Boat_Transport_01_F {
        vItemSpace = 105;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2541, 1420, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_G_Boat_Transport_01_F {
        vItemSpace = 45;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2545, 1402, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_T_Lifeboat {
        vItemSpace = 45;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2541, 1702, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class O_Boat_Transport_01_F {
        vItemSpace = 45;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2541, 1450, 1500, 0 };
        garageSell[] = { 0, 0, 5000, 0 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class B_Boat_Transport_01_F {
        vItemSpace = 45;
		LigaTank = 10;
		LigaVerbr = 0.00006;			
        storageFee[] = { 2450, 1405, 45, 45 };
        garageSell[] = { 850, 85, 85, 85 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	/////////////////////////////////////////////////////////////////	
	/////////////////////// Bohrturm ////////////////////////////////	
	/////////////////////////////////////////////////////////////////	
	class O_Truck_02_transport_F { // Zamak Transport Bohrturm Zamak
        vItemSpace = 136;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 35000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 170000;
        textures[] = {
            { "Orange", "civ", {
				"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"				
            } }		
		};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_Device_assembled_F { // 
        vItemSpace = -1;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 15000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 170000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	class Land_Tank_rust_F { // 
        vItemSpace = 2250;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 170000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	class Land_Research_house_V1_F { // 
        vItemSpace = 375;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 170000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
////// Erw
	class Land_dp_transformer_F { // 
        vItemSpace = -1;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 170000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	/////////////////////////////////////////////////////////////////	
	/////////////////////////////////////////////////////////////////	
	/////////////////////////////////////////////////////////////////	


	////////////////////////// Airdrop //////////////////////////////	
	class CargoNet_01_box_F {  
        vItemSpace = 1800;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	
	
	/////////////////////////////////////////////////////////////////	
	/////////////////////// Tankstellen /////////////////////////////
	/////////////////////////////////////////////////////////////////	
	class Land_fs_feed_F {  
        vItemSpace = 850;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };	

	class Land_FuelStation_01_pump_F {  
        vItemSpace = 1250;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		

	class Land_FuelStation_02_pump_F {  
        vItemSpace = 950;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
	/////////////////////////////////////////////////////////////////	
	////////////////////////// Läden ////////////////////////////////
	/////////////////////////////////////////////////////////////////		
	class Land_ShelvesMetal_F {  
        vItemSpace = 110;
		LigaTank = 400;
		LigaVerbr = 0.00004;		
        storageFee[] = { 45000, 450, 450, 450 };
        garageSell[] = { 75000, 750, 750, 750 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
		ligatexture1[] = {};
        ligatexture2[] = {};
        ligatexture3[] = {};
        ligatexture4[] = {};
        ligatexture5[] = {};
    };		
};
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
	║	File: Liga_Cfg_Karren.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Edited:  Zoran 	 - Die Liga
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.3	
	╠════════════════════════════════════════════════════════════════════════════════════╗
	║
	╚════════════════════════════════════════════════════════════════════════════════════╝
*/
class LigaVehSetup {	

	class Fahrzeuge {
		/*Rückfahrwarnton*/
		warnpiep[] = {
			"C_Van_01_box_F", 
			"O_T_Truck_03_ammo_ghex_F",
			"O_T_Truck_03_transport_ghex_F",
			"O_T_Truck_03_fuel_ghex_F",
			"O_T_Truck_03_device_ghex_F",
			"O_T_Truck_03_covered_ghex_F",
			"I_Truck_02_transport_F",
			"I_Truck_02_covered_F",
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F",
			"B_Truck_01_transport_F", 
			"B_Truck_01_ammo_F",
			"O_Truck_03_ammo_F",
			"O_Truck_03_device_F",
			"B_Truck_01_box_F",
			"B_Truck_01_covered_F",
			"O_Truck_02_fuel_F",
			"O_Truck_03_fuel_F",
			"B_Truck_01_fuel_F",
			"C_Van_01_transport_F",
			"C_Van_01_fuel_F",
			"B_Truck_01_mover_F",
			"B_Truck_01_Repair_F",
			"O_Truck_02_box_F", 
			//"C_Offroad_01_F",
			"I_Truck_02_ammo_F",
			//"B_G_Offroad_01_F",
			"O_MRAP_02_F",
			"I_MRAP_03_F", 
			"B_MRAP_01_F",
			//"I_C_Offroad_02_unarmed_F",
			//"I_C_Offroad_02_unarmed_olive_F",
			//"I_C_Offroad_02_unarmed_brown_F",
			"I_C_Van_01_transport_brown_F",
			"I_C_Van_01_transport_olive_F",
			"I_G_Van_01_transport_F",
			//"O_T_LSV_02_unarmed_ghex_F",
			//"B_T_LSV_01_unarmed_sand_F",
			"I_Truck_02_medical_F",
			"B_Truck_01_medical_F",
			"O_Truck_02_transport_F",		
			//"O_LSV_02_unarmed_black_F",
			//"B_T_LSV_01_unarmed_black_F",
			//"C_Offroad_02_unarmed_green_F",
			//"C_Offroad_02_unarmed_black_F",
			//"O_T_LSV_02_unarmed_arid_F",
			//"B_T_LSV_01_unarmed_olive_F"
		};	
		tanker[] = {
			"Land_FuelStation_01_pump_F",
			"Land_FuelStation_02_pump_F",
			"Land_Tank_rust_F",
			"C_Van_01_fuel_F",
			"O_Truck_03_fuel_F",
			
			
			"B_Truck_01_fuel_F",
			"Land_Pod_Heli_Transport_04_fuel_F",
			"O_T_Truck_03_fuel_ghex_F",
			"O_Truck_02_fuel_F",
			"I_G_Van_01_fuel_F",
			"O_Heli_Transport_04_fuel_F"
		};
	};	
};

		/*	Zoran machen LKW piep, Auto nur brumm tun! Den ollen Lateinern fiel dazu nur "Id quod actum est" ein. Wie wahr, wie wahr.
		
			Doch da da nur die Wurst 3 Ecken hat und wir an eben welcher angekommen sind, 
			bleibt nur noch an unsere diebsichen Fans zu sagen: "Neminem laedere"!  */

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