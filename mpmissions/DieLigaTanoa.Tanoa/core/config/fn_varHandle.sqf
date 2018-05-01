/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	Edited bye Otii & Hirschi - Die Liga
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var isEqualTo "" OR _mode isEqualTo -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "heroinu": {"lin_heru"};
			case "heroinp": {"lin_herp"};
			
			case "kasse": {"lin_kasse"};
			case "schrank": {"lin_schrank"};
			case "fireWo": {"li_fireWo"};
			
			case "rabbit": {"lin_rabi"};

			case "fishing": {"lin_fisp"};			
			
			case "donuts": {"lin_donu"};

			case "sand": {"lin_sand"};
			case "glass": {"lin_glas"};
			case "tbacon": {"lin_tba"};

			case "goldbar": {"lin_gold"};

			case "defusekit": {"lin_def"};
			
			case "wein": {"lin_wei"};
			case "gyro": {"lin_gyr"};
			case "uzo": {"lin_uzo"};
			case "sala": {"lin_sala"};

			case "zig": {"lin_zig"};

			case "rabbitf": {"lin_rabif"};
			case "rabbitfp": {"lin_rabifp"};
			
			case "henraw": {"lin_hen"};
			case "roosterraw": {"lin_roo"};


			case "doen": {"lin_doen"};	
			
			case "prl": {"li_prl"};			
			case "prlhe": {"li_prlhe"};			

			case "stt": {"li_stt"};					
			
//			case "c7": {"c_7"};
//			case "c8": {"c_8"};

			/*NEU*/
			case "sfb": 		{"li_sfb"};		// 	Schranken FB			
			case "kegel": 		{"li_keg"};		// 	Kegel
			case "strahler": 	{"li_stra"}; 	// 	Strahler
			case "uwsl": 		{"lin_uwl"};	// 	Wasserbombe
			case "zipties": 	{"lin_zip"};	//	Kabelbinder
			case "di":			{"li_di"};		//	Kerosin
			case "ben": 		{"li_ben"};		//	Treibstoff
			case "storagebig": 	{"lin_stob"};	//	Lagerkiste
			case "gpstracker": 	{"lin_gps"};	//	GPS Tracker			
			case "blastingcharge": {"lin_blac"};//	Bombe FED
			case "mauer":		{"li_mau"};		//	Absperrung
			case "spikeStrip": 	{"lin_sps"};	//	Nagelband
			case "water": 		{"lin_wate"};	//	Wasserflasche
			case "fuelE": 		{"lin_fuE"};	//	Kanister leer
			case "fuelF": 		{"lin_fuF"};	// 	Kanister voll
			case "c5": 			{"c_5"};		// 	ALAC Fluglizenz			
			case "a11": 		{"l_a11"};	 	// 	Hefe
			case "a12": 		{"l_a12"};		// 	Maische
			case "14": 			{"l_14"};		// 	Tarnnetz
			case "15": 			{"l_15"};		// 	Destille
			case "16": 			{"l_16"};		// 	Maischefass
			case "17": 			{"l_17"};		// 	Zelt
			case "18": 			{"l_18"};		// 	Methyl
			case "20": 			{"l_20"};		// 	Moonshine	
			case "21": 			{"l_21"};		// 	Flasche Moonshine
			case "a10": 		{"l_a10"};		//	Flaschen
			case "b22": 		{"l_22"};		// 	Campingstuhl
			case "b23": 		{"l_23"};		// 	Campingstuhl	
			/*Schlosser*/
			case "a7": 			{"i_a7"};		// 	Axt
			case "a8": 			{"i_a8"};		// 	Kettensäge
			case "a9": 			{"i_a9"};		// 	Presslufthammer	
			case "pickaxe": 	{"lin_axe"};	//	Spitzhacke
			case "jame": 		{"lin_jme"};	//	Jagdmesser	
			case "mache": 		{"lin_mache"};	//	Machete	
			
			case "lockpick": 	{"lin_lpi"};	// 	Dietrich
			case "boltcutter": 	{"lin_boc"};	//	Bolzenschneider			
			case "c6": 			{"c_6"};		// 	Bohrmaschine
			
			case "peach": 		{"lin_pea"};	// 	Kokusnuesse
			case "apple": 		{"lin_apl"};	// 	Suesskartoffeln	
						
			case "mull": 		{"lin_ml"};		//	Müll
			case "a0": 			{"l_a0"};		//	Kunststoff
			
			case "copperore": 	{"lin_copp"};	// 	Kupfererz
			case "ironore": 	{"lin_iroo"};	// 	Eisenerz
			case "iron_r": 		{"lin_iror"};	// 	Eisenbarren
			case "copper_r": 	{"lin_copr"};	// 	Kupferbarren	
			
			case "salt": 		{"lin_sal"};	// 	Salz
			case "salt_r": 		{"lin_salr"};	// 	Raffiniertes Salz			
			case "c4": 			{"c_4"};		// 	Salpeter	
			
			case "c3": 			{"c_3"};		// 	Schwefel
			case "c1": 			{"c_1"};		// 	Munition
			case "c2": 			{"c_2"};		// 	Waffenteile	

			case "ana": 		{"lin_ana"};	// 	Ananas
			case "bw": 			{"lin_bw"};		// 	Ananaskonserver	
		
			case "cement": 		{"lin_cem"};	// 	Mamor
			case "rock": 		{"lin_rock"};	// 	Mamorplatten	
			
			case "kaka": 		{"lin_kaka"};	// 	Kakao	
			case "kakap": 		{"lin_kakap"};	// 	Kakao geröstet	
			case "schok": 		{"lin_schok"};	// 	Schokolade	

			case "sig": 		{"li_sig"};		// 	Palmfruch
			case "tet": 		{"li_tet"};		// 	Palmöl				
			
			case "reva": 		{"lin_reva"};	// 	Zuckerrohr
			case "bottledbeer": {"lin_bob"};	// 	Ligas Finest Rum	
			
			case "dose": 		{"lin_dose"};	// 	Dosen
			case "redgull": 	{"lin_red"};	// 	RedGull
				/*Holz*/
			case "a1t": 		{"i_a1t"};		// 	Tropenholz
			case "a1":			{"i_a1"};		// 	Baumstämme	
			case "guh":			{"li_guh"};		// 	Fassbretter	
			case "fassinv": 	{"li_fass"};	// 	Fass
				
			case "a2": 			{"i_a2"};		// 	Bretter
			case "a3": 			{"i_a3"};		// 	Leim
			case "a4": 			{"i_a4"};		// 	Holzspäne
			case "a5": 			{"i_a5"};		// 	Spanplatten
			case "a6": 			{"i_a6"};		// 	Möbel				
				/*Öl*/
			case "rip": 		{"li_rip"};		// 	Oel Pumpe	
			case "rib": 		{"li_rib"};		// 	Bohrgestaenge
			case "rio": 		{"li_rio"};		// 	Offshore Öl			
			case "rig": 		{"li_rig"};		// 	Methangas
			case "oilu": 		{"lin_oilu"};	// 	Rohöl
			case "oilp": 		{"lin_oilp"};	// 	Rafiniertes Öl
				/*Goldrausch*/
			case "gsg": 		{"li_gsg"};		//	Schuerfgut
			case "gab": 		{"li_gab"};		//	Abraum
			case "ghy": 		{"li_ghy"};		//	Hydro Riffel
			case "gsn": 		{"li_gsn"};		//	Silbernuggets
			case "ggn": 		{"li_ggn"};		//	Goldnuggets
			case "gl": 			{"lin_gl"};		//	Goldschmuck
			case "gsm": 		{"li_gsm"};		//	Silberschmuck
				/*Edelsteine*/
			case "schgut": 		{"li_schgut"};	//	Schuerfgut Edelsteine	
			case "diamond": 	{"lin_dia"};	//	Rohedelsteine
			case "diamondc": 	{"lin_diar"};	//	Edelsteine
			
			/*UHR*/
			case "cannabis": 	{"lin_cana"};	// 	Kanabis unver
			case "marijuana": 	{"lin_marj"};	// 	Mariuana verarbeitet
		
			case "turtle": 		{"lin_turt"};	//	Schildkroeten
			case "turtlesoup": 	{"lin_turs"};	//	Schildkroeten Fleisch
		
			case "cocaine": 	{"lin_cok"};	// 	Kokain Roh
			case "cocainep": 	{"lin_cokp"};	// 	Kokain processed	
			
			case "lava": 		{"lin_lava"};	// 	Lavagestein
			case "coral": 		{"lin_coral"};	// 	Korallen
			case "corsurv": 	{"lin_corsuv"};	// 	Souvenir
			
			case "perl": 		{"lin_perl"};		// 	Perlen
			case "perlp": 		{"lin_perl_p"};		// 	Perlenkette
			
			case "cofbea": 		{"lin_cofbea"};		// 	Kaffeebohne
			case "cofbeap": 	{"lin_cofbea_p"};	// 	Kaffee geroestet
			case "cofbeas": 	{"lin_cofbea_s"};	// 	Kopi Luwak
			case "coffee": 		{"lin_coff"};		//	Kaffee
			case "kaffmasch": 	{"lin_kafma"};		//	Kaffeemaschine
					
			case "kaut": 		{"lin_kaut"};		//	Kautschuk
			
			case "tee": 		{"lin_tee"};		//	Tee
			case "nattee": 		{"lin_nattee"};		//	Naturheilkräutertee
			case "natkra": 		{"lin_natkr"};		//	Naturheilkräuter
			
			/*Jagen*/
			case "goatraw": 	{"lin_goa"};		//	Ziegenfleisch
			case "goatrawf": 	{"lin_goaf"};		//	Ziegenrohfell
			case "goatrawfp": 	{"lin_goafp"};		//	Ziegenfell	
			
			case "sheepraw": 	{"lin_she"};		//	Schafsfleisch
			case "sheeprawf": 	{"lin_shef"};		//	Wolle		
			
			case "hode": 		{"lin_hode"};		//	Tierhoden		
			
			/*REB*/
			case "lsdu": 		{"lin_lsdu"};	//	LSD Frosch
			case "lsdp": 		{"lin_lsdp"};	//	LSD
			
			case "methu": 		{"lin_metu"};	//	Unverarbeitetes Meth
            case "methp": 		{"lin_metp"};	//	Meth
			
            case "streckm": 	{"lin_streckm"};	//	Streckmittel
            
			case "tutrei": 		{"lin_tutrei"};	//	Schildkroeteneier			
			case "banan": 		{"lin_banan"};	//	Bananen			
			
			/*Fischviecher*/
			case "stofish": 	{"lin_stofish"};// Stockfisch
			case "salema": 		{"lin_salem"};
			case "ornate": 		{"lin_orna"};
			case "mackerel": 	{"lin_makr"};
			case "tuna": 		{"lin_tuna"};
			case "mullet": 		{"lin_mule"};
			case "catshark": 	{"lin_cats"};
			/*Fischviecher Ende*/
		
			case "corsurvlava": 		{"lin_lavafig"};	//	Lavafiguren	
		};	
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "lin_oilu": {"oilu"};
			case "lin_oilp": {"oilp"};
			case "lin_heru": {"heroinu"};
			case "lin_herp": {"heroinp"};
			case "lin_cana": {"cannabis"};
			case "lin_marj": {"marijuana"};
			case "lin_apl": {"apple"};
			case "lin_wate": {"water"};
			case "lin_rabi": {"rabbit"};
			case "lin_salem": {"salema"};
			case "lin_orna": {"ornate"};
			case "lin_makr": {"mackerel"};
			case "lin_tuna": {"tuna"};
			case "lin_mule": {"mullet"};
			case "lin_cats": {"catshark"};
			case "lin_turt": {"turtle"};
			case "lin_fisp": {"fishing"};
			case "lin_coff": {"coffee"};
			case "lin_turs": {"turtlesoup"};
			case "lin_donu": {"donuts"};
			case "lin_fuE": {"fuelE"};
			case "lin_fuF": {"fuelF"};
		//	case "life_cash": {"money"};
			case "lin_axe": {"pickaxe"};
			case "lin_copp": {"copperore"};	//Kupfererz
			case "lin_iroo": {"ironore"};	//Eisenerz
			case "lin_iror": {"iron_r"};	//Eisenbarren
			case "lin_copr": {"copper_r"};	//Kupferbarren
			case "lin_sand": {"sand"};
			case "lin_sal": {"salt"};
			case "lin_glas": {"glass"};
			case "lin_red": {"redgull"};
			case "lin_lpi": {"lockpick"};
			case "lin_tba": 	{"tbacon"};
			case "lin_pea": {"peach"};		//Kokusnuesse
			
			case "lin_dia": 	{"diamond"};	// Rohedelsteine
			case "lin_diar": 	{"diamondc"}; 	// Edelsteine
			case "li_schgut": 	{"schgut"}; 	//	Schuerfgut Edelsteine	
			
			case "lin_salr": {"salt_r"};
			case "lin_cok": {"cocaine"};
			case "lin_cokp": {"cocainep"};
			case "lin_sps": {"spikeStrip"};
			case "lin_cem": {"cement"};		// Mamorplatten
			case "lin_rock": {"rock"};		// Mamor
			case "lin_gold": {"goldbar"};
			case "lin_blac": {"blastingcharge"};	
			case "lin_boc": {"boltcutter"};		// Bolzenschneider
			case "lin_def": {"defusekit"};

			case "lin_stob": {"storagebig"};	//Storage Box
  
			case "lin_gps": {"gpstracker"};		//GPS
			case "lin_bob": {"bottledbeer"};	//Ligas Finest Rum
			case "lin_zip": {"zipties"};	
			case "lin_ana": {"ana"};	// Ananas
			case "lin_bw":{"bw"};		// Ananaskonserver
			case "lin_metu": {"methu"};
            case "lin_metp": {"methp"};
			case "lin_lsdu": {"lsdu"};
			case "lin_lsdp": {"lsdp"};
			case "lin_ml": {"mull"};
			case "lin_wei": {"wein"};
			case "lin_gyr": {"gyro"};
			case "lin_uzo": {"uzo"};
		//	case "lin_sala": {"sala"};
			case "lin_reva": {"reva"};			// Zuckerrohr
			case "lin_zig": {"zig"};
			case "lin_uwl": {"uwsl"};
			case "lin_gl": {"gl"};
			case "lin_rabif": {"rabbitf"};
			case "lin_hen": {"henraw"};
			case "lin_roo": {"roosterraw"};
			case "lin_goa": {"goatraw"};
			case "lin_goaf": {"goatrawf"};
			case "lin_she": {"sheepraw"};
			case "lin_shef": {"sheeprawf"};
			case "lin_doen": {"doen"};	
			case "lin_rabifp": {"rabbitfp"};	
			case "lin_goafp": {"goatrawfp"};
			case "lin_jme": {"jame"};
			case "li_mau": {"mauer"};
			case "li_gsg": {"gsg"};
			case "li_gsn": {"gsn"};
			case "li_ggn": {"ggn"};
			case "li_gsm": {"gsm"};
			case "li_sfb": {"sfb"};
			case "li_gab": {"gab"};
			case "li_ghy": {"ghy"};
			case "li_di": {"di"};
			case "li_ben": {"ben"};
			case "li_sig": {"sig"};		// Palmfrucht
			case "li_tet": {"tet"};		// Palmöl
			case "li_guh": {"guh"};		//Fassbretter
			case "li_prl": {"prl"};
			case "li_prlhe": {"prlhe"};
			case "li_keg": {"kegel"};
			case "li_stra": {"strahler"}; //Strahler
			case "li_rig": {"rig"};		// Methangas
			case "li_rio": {"rio"};		// Offshore Öl
			case "li_fass": 	{"fassinv"};	// Fass
			case "li_rip": {"rip"};		// 	Oel Pumpe	
			case "li_rib": {"rib"};		// Bohrgestaenge
			case "li_stt": {"stt"};
			case "i_a1": {"a1"};		// Baumstämme
			case "i_a1t": {"a1t"};		// Tropenholz
			case "lin_banan": 		{"banan"};	//	Bananen		
			case "lin_lavafig": 		{"corsurvlava"};	//	Lavafigurten		
			case "li_fireWo": 		{"fireWo"};	//	Lavafigurten		
		
			
			case "i_a2": {"a2"};
			case "i_a3": {"a3"};
			case "i_a4": {"a4"};
			case "i_a5": {"a5"};		// Spanplatten
			case "i_a6": {"a6"};
			case "i_a7": {"a7"};
			case "i_a8": {"a8"};
			case "i_a9": {"a9"};
			case "l_a0": {"a0"};
			case "l_a10": {"a10"};
			case "l_a11": {"a11"};
			case "l_a12": {"a12"};
			case "l_14": {"14"};
			case "l_15": {"15"};
			case "l_16": {"16"};
			case "l_17": {"17"};
			case "l_18": {"18"};
			case "l_20": {"20"};
			case "l_21": {"21"};
			case "l_22": {"b22"};
			case "l_23": {"b23"};
			case "c_1": {"c1"};
			case "c_2": {"c2"};
			case "c_3": {"c3"};
			case "c_4": {"c4"};
			case "c_5": {"c5"};
			case "c_6": {"c6"};						//Bohrmaschine
			case "lin_kafma": 	{"kaffmasch"};		//Kaffeemaschine

			case "lin_lava": 		{"lava"};		// 	Lavagestein
			case "lin_coral": 		{"coral"};		// Korallen
			case "lin_corsuv": 		{"corsurv"};	// Souvenir
			case "lin_perl": 		{"perl"};		// 	Perlen
			case "lin_perl_p": 		{"perlp"};		// 	Perlenkette			
		
			case "lin_cofbea": 		{"cofbea"};		// 	Kaffeebohne
			case "lin_cofbea_p": 	{"cofbeap"};	// 	Kaffee geroestet
			case "lin_cofbea_s": 	{"cofbeas"};	// 	Kopi Luwak

			case "lin_tutrei": 		{"tutrei"};		//	Schildkroeteneier			
			case "lin_kaut": 		{"kaut"};		//	Kautschuk	
			case "lin_mache": 		{"mache"};		//	Machete	
			case "lin_hode": 		{"hode"};		//	Tierhoden	
			
			case "lin_dose": 		{"dose"};		//	Dosen	
			case "lin_stofish": 	{"stofish"};	// Stockfisch
			
			case "lin_streckm": 	{"streckm"};	//	Streckmittel
		
			case "lin_tee": 		{"tee"};		//	Tee
			case "lin_nattee": 		{"nattee"};		//	Naturheilkräutertee
			case "lin_natkr": 		{"natkra"};		//	Naturheilkräuter
			case "lin_kaka": 		{"kaka"};	// 	Kakao	
			case "lin_kakap": 		{"kakap"};	// 	Kakao geröstet	
			case "lin_schok": 		{"schok"};	// 	Schokolade	
			
			case "lin_kasse": 		{"kasse"};	// 	Schokolade	
			case "lin_schrank": 	{"schrank"};	// 	Schokolade	
			
			

					
		};
	};
};
