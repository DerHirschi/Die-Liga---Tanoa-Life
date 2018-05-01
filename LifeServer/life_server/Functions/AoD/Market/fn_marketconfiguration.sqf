_Ver = "1.11.05 extDB2";
_Datum = "08.02.16";
_zuLetztBearbeitet = "Baskid";
/*
	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods
   Edited by: Lukas "Alduin86"
	Edited by: Hirschi Liga-Life 02.08.15
*/

////////////MAIN CONFIG
/*
private["_queryResult","_query","_item","_itemprice","_oilpPrice","_iron_rPrice","_diamondcPrice",
			"_copper_rPrice","_salt_rPrice","_glassPrice","_cementPrice","_turtlePrice","_marijuanaPrice","_cocainepPrice",
			"_heroinpPrice","_glPrice","_iuraniumPrice","_uraniumPrice","_methpPrice","_lsdpPrice","_rabpPrice",
			"_goatfpPrice","_gsmPrice","_ggnPrice","_gsnPrice","_diPrice","_benPrice","_sigPrice","_a6Price","_21Price"];


//_query = format["SELECT resource, price FROM resources"];
_query = format["MarktInit:"];
//waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_rows = call compile format["%1",_queryResult]; //compile data

diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ ------------- Market Query Request -------------";
diag_log format["║ Query: %1",_query];
diag_log format["║ Queryresult: %1",_queryResult];
diag_log format["║ Result: %1",_rows];
diag_log "╠══════════════════════════════════════════════════╣";

//* _rows should look like this now: [["oilp","1000"],["diamond","2000"]];

{
	_item = (_x select 0); //on the first run = "oilp", second run = "diamond")
	_itemprice = (_x select 1); //on the first run = "1000", second run = "2000") //* Note: _price is a STRING now! 
	
	//diag_log format["%1-price %2 generated",_item,_itemprice];	
	if(_item isEqualTo "oilp") then {_oilpPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "iron_r") then {_iron_rPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "diamondc") then {_diamondcPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "copper_r") then {_copper_rPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "salt_r") then {_salt_rPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "glass") then {_glassPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "cement") then {_cementPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "turtle") then {_turtlePrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "marijuana") then {_marijuanaPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "cocainep") then {_cocainepPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "heroinp") then {_heroinpPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "gl") then {_glPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "iuranium") then {_iuraniumPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "uranium") then {_uraniumPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "methp") then {_methpPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "lsdp") then {_lsdpPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "goatrawfp") then {_goatfpPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "rabbitfp") then {_rabpPrice = _itemprice}; // The right price should be assigned
	if(_item isEqualTo "gsm") then {_gsmPrice = _itemprice}; 
	if(_item isEqualTo "ggn") then {_ggnPrice = _itemprice}; 
	if(_item isEqualTo "gsn") then {_gsnPrice = _itemprice}; 
	//if(_item isEqualTo "di") then {_diPrice = _itemprice}; 
	//if(_item isEqualTo "ben") then {_benPrice = _itemprice}; 
	if(_item isEqualTo "sig") then {_sigPrice = _itemprice}; 
	if(_item isEqualTo "a6") then {_a6Price = _itemprice}; 
	if(_item isEqualTo "21") then {_21Price = _itemprice}; 
	
} forEach _rows;


life_market_resources_1 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
	
	["copper_r", _copper_rPrice, 500, 3000, 0.5, 0.5,   
		[ 
//				["iron_r", -0.25],
//				["diamondc", 0.5],
//				["copper_r",0.5],
				["cement", 0.5]

		] 
	],
	
	["cement", _cementPrice, 1480, 6500, 0.5, 0.5,   
		[ 
				["iron_r", 0.5]
//				["diamondc",-0.5],
//				["copper_r",0.5]
//				["cement", -0.5]
		] 
	],
	
	["glass", _glassPrice, 1900, 5500, 1, 1,    
		[ 
				
				["salt_r", 0.5]
//				["oilp", 0.5],
//				["rabbitfp", 1],
//				["goatrawfp",-0.4],
		] 
	]
];

life_market_resources_2 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
		
	["salt_r", _salt_rPrice, 1210, 6000, 1, 1,   
		[ 
				["oilp", 0.5]
//				["glass", 0.0],
//				["rabbitfp", 0.5],
//				["goatrawfp", 1]
		] 
	],
	

	["oilp", _oilpPrice, 1430, 8000, 0.5, 0.5,    
		[ 

//				["oilp",-0.5],			
//				["di", 0.0],
				["glass", 0.5]
//				["sig",0.5]
			
			
		] 
	],
	
	["iron_r", _iron_rPrice, 1475, 4050, 0.5, 0.5,     
		[ 
//				["iron_r", 0.5],
				["diamondc",0.5]
//				["copper_r",0.25]
//				["cement", 0.0]
		
		] 
	]
];

life_market_resources_3 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
	
	["diamondc", _diamondcPrice, 2187, 7120,  0.5, 0.5,  
		[ 
//				["iron_r", 0.5],
//				["diamondc",0.5],
				["copper_r",0.5]
//				["cement", -0.5]


		] 
	],
	
	["rabbitfp", _rabpPrice, 8800, 15054, 1, 1,  
		[ 
				["a6", 1]
//				["glass", 0.25]
//				["rabbitfp", 0.5],
//				["goatrawfp",-0.4],
			

			
		]
	],		
	
	["goatrawfp", _goatfpPrice, 9800, 17000, 1, 1,  
		[ 
//				["salt_r", 0.25],
//				["glass", 1.0]
				["rabbitfp", 0.5]
//				["goatrawfp",-0.5]
				
		]
	]	
];

life_market_resources_4 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
	
	["marijuana", _marijuanaPrice, 4330,  10200, 1, 1,     
		[ 
//				["marijuana",0.5],
				["cocainep",0.5],
				["heroinp",0.5]
//				["methp", 0.5],
//				["lsdp",0.5]
		] 
	],
	
	["cocainep", _cocainepPrice, 4510,  10200, 1.0, 1,    
		[ 
			
			
				["marijuana",0.5],
//				["cocainep",0.0],
//				["heroinp",0.5],
				["methp", 0.5]
//				["lsdp",0.5]
		] 
	],
	
	
	["heroinp", _heroinpPrice, 4480, 10200, 1.0, 1,     
		[ 
				["marijuana",0.5],
//				["cocainep",0.0],
//				["heroinp",0.5],
//				["methp", 0.5],
				["lsdp",0.5]
		] 
	]
];

life_market_resources_5 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],

	["turtle", _turtlePrice, 25000, 48000, 1, 1,    
		[ 
//				["iuranium", 0.25]
				["uranium",0.5],
				["sig",0.5]
//				["turtle", 0.25],
//				["a6",0.5],
		] 
	],
	
		["iuranium", _iuraniumPrice, 20000, 47000, 1, 1,    
		[ 
//				["iuranium", 0.25]
				["uranium",0.5],
				["21",0.5]
//				["turtle", 0.25],
//				["a6",0.5],

		] 
	],
	
		["uranium", _uraniumPrice, 18000, 35000, 0.5, 1,   
		[ 
				["iuranium", 0.5],
//				["uranium",0.5],
//				["21",0.25],
				["turtle", 0.5]
//				["a6",0.5],
		] 
	]
];

life_market_resources_6 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],

			["methp", _methpPrice, 4800, 9900, 1.0, 1,    
		[ 
//				["marijuana",-1],
				["cocainep",0.5],
//				["heroinp",0.5],
//				["methp", 0.5]
				["lsdp",0.5]


			
		]
	],		
		
			["lsdp", _lsdpPrice, 4800, 11000, 1.0, 1,  
		[ 
						
//				["marijuana",-1],
//				["cocainep",0.0],
				["heroinp",0.5],
				["methp", 0.5]
//				["lsdp",0.0],

		] 
	],
	
			["gl", _glPrice, 14500, 29000, 1, 0,  
		[ 
				["ggn", 1.0]
//				["gsn",0.5],
//				["gsm",0.5]
//				["gl",0],
		]
	]
];

life_market_resources_7 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],

				["gsm", _gsmPrice, 12200, 23000, 1.0, 1,        // Silbermuenzen
		[ 
//				["ggn",0.5],
				["gsn",1.0]
//				["gsm",0.5],
//				["gl",0],


			
		]
	],
	
				["ggn", _ggnPrice, 6000, 12700, 1, 0.5,          // Goldnuggets
		[ 

//				["ggn",-0.5],
//				["gsn",0.5],
//				["gsm",0.0],
				["gl",1]
			
		]
	],
	
				["gsn", _gsnPrice, 4000, 12700, 1, 0.5,           // Silbernuggets
		[ 
//				["ggn",-0.5],
//				["gsn",0.5],
				["gsm",1]
//				["gl",0],
			
			
		]
	]	
];

life_market_resources_8 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
	
//				["ben", _benPrice, 3000, 9000, 1, 1,           // Benzin
//		[ 
//				["oilp",0.0],			
//				["di", 0.5],
//				["ben", 0.0],
//				["sig",0.5]
//			
//		]
//	],
	
				["sig", _sigPrice, 3530, 9700, 0.5, 1,           // Schiefergas illegal so wie Oelpreise laut Gladi
		[ 
				["turtle",0.5],			
				["21", 0.5]
//				["ben", 0.25]
//				["sig",0.25]
			
		]
	]
	
//					["di", _diPrice, 3000, 9700, 1, 1,           // Kerosin
//		[ 
//				["oilp",-0.5],			
//				["di", 0.0],
//				["ben", 0.25],
//				["sig",1]
//		]
//	]		
];

life_market_resources_9 = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
	
				["a6", _a6Price, 8000, 22000, 0.5, 0.5,           // Möbel
		[ 
//				["iuranium", 0.5],
//				["uranium",0.0],
//				["21",0.25],
				["goatrawfp", 1.0]
//				["a6",0.5],
			
		]
	],	


				["21", _21Price, 4000, 9000, 1 , 1,           // Moonshine
		[ 

				["iuranium", 0.5],
//				["uranium",0.0],
//				["21",0.0],
				["sig", 0.5]
//				["a6",0.5],
			
		]
	]			
];
*/
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!

/*

diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║------------- Liga - Life Market Resources --- PV ----------";
diag_log "║---------------------------------------------------------------------";
diag_log "║---------------------------------------------------------------------";
diag_log format["║-------- Version: %1",_Ver];
diag_log format["║-------- Datum: %1",_Datum];
diag_log format["║-------- zu letzt bearbeitet von: %1",_zuLetztBearbeitet];
diag_log "║---------------------------------------------------------------------";
diag_log "║---------------------------------------------------------------------";
diag_log format["║ Result PV 1: %1",life_market_resources_1];
diag_log format["║ Result PV 2: %1",life_market_resources_2];
diag_log format["║ Result PV 3: %1",life_market_resources_3];
diag_log format["║ Result PV 4: %1",life_market_resources_4];
diag_log format["║ Result PV 5: %1",life_market_resources_5];
diag_log format["║ Result PV 6: %1",life_market_resources_6];
diag_log format["║ Result PV 7: %1",life_market_resources_7];
diag_log format["║ Result PV 8: %1",life_market_resources_8];
diag_log format["║ Result PV 9: %1",life_market_resources_9];
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!
diag_log "║---------------------------------------------------------------------";
diag_log "║---------------------------------------------------------------------";
diag_log "║------------- Liga - Life Market Resources --- PV ----------";
diag_log "╠══════════════════════════════════════════════════╣";
*/
	life_market_resources_1 = [];
	life_market_resources_2 = [];
	life_market_resources_3 = [];
	life_market_resources_4 = [];
	life_market_resources_5 = [];
	life_market_resources_6 = [];
	life_market_resources_7 = [];
	life_market_resources_8 = [];
	life_market_resources_9 = [];


// Shotnames 

	life_market_shortnames_1 = [];
	life_market_shortnames_2 = [];
	life_market_shortnames_3 = [];
	life_market_shortnames_4 = [];
	life_market_shortnames_5 = [];
	life_market_shortnames_6 = [];
	life_market_shortnames_7 = [];
	life_market_shortnames_8 = [];
	life_market_shortnames_9 = [];
/*	
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!
	
	{	life_market_shortnames_1 set [count life_market_shortnames_1, _x select 0];	} 	foreach life_market_resources_1;
	{	life_market_shortnames_2 set [count life_market_shortnames_2, _x select 0];	} 	foreach life_market_resources_2;
	{	life_market_shortnames_3 set [count life_market_shortnames_3, _x select 0];	} 	foreach life_market_resources_3;
	{	life_market_shortnames_4 set [count life_market_shortnames_4, _x select 0];	} 	foreach life_market_resources_4;
	{	life_market_shortnames_5 set [count life_market_shortnames_5, _x select 0];	} 	foreach life_market_resources_5;
	{	life_market_shortnames_6 set [count life_market_shortnames_6, _x select 0];	} 	foreach life_market_resources_6;
	{	life_market_shortnames_7 set [count life_market_shortnames_7, _x select 0];	} 	foreach life_market_resources_7;
	{	life_market_shortnames_8 set [count life_market_shortnames_8, _x select 0];	} 	foreach life_market_resources_8;
	{	life_market_shortnames_9 set [count life_market_shortnames_9, _x select 0];	} 	foreach life_market_resources_9;
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!
*/

// Shortnames END

// Prices	

life_market_prices_1 = [];
life_market_prices_2 = [];
life_market_prices_3 = [];
life_market_prices_4 = [];
life_market_prices_5 = [];
life_market_prices_6 = [];
life_market_prices_7 = [];
life_market_prices_8 = [];
life_market_prices_9 = [];
/*
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!

{	life_market_prices_1 set [count life_market_prices_1, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_1;	
{	life_market_prices_2 set [count life_market_prices_2, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_2;	
{	life_market_prices_3 set [count life_market_prices_3, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_3;	
{	life_market_prices_4 set [count life_market_prices_4, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_4;	
{	life_market_prices_5 set [count life_market_prices_5, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_5;	
{	life_market_prices_6 set [count life_market_prices_6, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_6;	
{	life_market_prices_7 set [count life_market_prices_7, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_7;	
{	life_market_prices_8 set [count life_market_prices_8, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_8;	
{	life_market_prices_9 set [count life_market_prices_9, [_x select 0, _x select 1, 0, 0] ];	}	foreach life_market_resources_9;	
// !!!!!!!! life_market_resources_10 nicht nutzen !!!!!! Liga Handy Vars !!!!!!
*/

// Prices	End
//systemChat "Liga-Markt Preise aktualisiert !";