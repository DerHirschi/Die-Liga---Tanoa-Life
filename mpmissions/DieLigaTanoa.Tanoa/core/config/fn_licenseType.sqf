/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "lci_driv"}; //Drivers License cost
			case "boat": {_var = "lci_boat"}; //Boating license cost
			case "pilot": {_var = "lci_air"}; //Pilot/air license cost
			case "gun": {_var = "lci_gun"}; //Firearm/gun license cost
			case "dive": {_var = "lci_dive"}; //Diving license cost
			case "oil": {_var = "lci_oil"}; //Oil processing license cost
			case "oilben": {_var = "lci_oil"}; //Oil processing license cost
			case "oildi": {_var = "lci_oil"}; //Oil processing license cost
			case "cair": {_var = "lco_air"}; //Cop Pilot License cost
			case "swat": {_var = "lco_swat"}; //Swat License cost
			case "cg": {_var = "lco_cg"}; //Coast guard license cost
			case "heroin": {_var = "lci_hero"}; //Heroin processing license cost
			case "marijuana": {_var = "lci_mari"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "lci_gang"}; //Gang license cost
			case "rebel": {_var = "lci_reb"}; //Rebel License
			case "truck":{_var = "lci_lkw"}; //Truck License
			case "diamond1": 	{_var = "lci_dia"};
			case "diamond2": 	{_var = "lci_dia"};
			case "salt": 		{_var = "lci_salt"};
			case "saltp": 		{_var = "lci_salt"};
			case "cocaine": {_var = "lci_cok"};
			case "sand": {_var = "lci_sand"};
			case "iron": {_var = "lci_iro"};
			case "copper": {_var = "lci_copp"};
			case "cement": {_var = "lci_cem"};
			case "mair": {_var = "lme_air"};
			case "home": {_var = "lci_home"};
			case "car": {_var = "lada_car"};
			case "air": {_var = "lada_air"};
			case "wert": {_var = "lci_wert"};	// Wertstoffe

			case "meth": {_var = "lci_meth"};
			case "lsd": {_var = "lci_lsd"};		
			case "hfell": {_var = "lci_jag"};	
			case "zfell": {_var = "lci_jag"};	
			case "gsg": {_var = "lci_gli"};		
			case "ggn": {_var = "lci_gli"};	
			case "gsn": {_var = "lci_gli"};	
			case "rio": {_var = "lci_oil"};	

			case "dosen": {_var = "lci_iro"};
			case "dosen": {_var = "lci_copp"};		
			case "mach": {_var = "lci_iro"};
			case "mach": {_var = "lci_copp"};		
			
			case "oilpum": {_var = "lci_iro"};
			case "oilpum": {_var = "lci_copp"};
			case "diet": {_var = "lci_iro"};
			case "diet": {_var = "lci_copp"};
			case "bolz": {_var = "lci_iro"};
			case "bolz": {_var = "lci_copp"};
			case "hydr": {_var = "lci_iro"};
			case "hydr": {_var = "lci_copp"};
			case "bohrg": {_var = "lci_iro"};
			case "bohrg": {_var = "lci_copp"};
			case "stahlt": {_var = "lci_iro"};
			case "stahlt": {_var = "lci_copp"};
			case "ketts": {_var = "lci_iro"};
			case "ketts": {_var = "lci_copp"};			
			case "fassbrett": 	{_var = "l_a1"};
			case "fass": 		{_var = "l_a1"};
			case "brett": 		{_var = "l_a1"};
			case "mob": 		{_var = "l_a1"};
			case "spanp": 		{_var = "l_a1"};	
			case "stobox": 		{_var = "l_a1"};
			case "kass": 		{_var = "l_a1"};
			case "regal": 		{_var = "l_a1"};
			
			case "press": {_var = "lci_iro"};		
			case "press": {_var = "lci_copp"};	
			
			

			case "tet": 		{_var = "lci_palm"};	
			
			case "anakons": 		{_var = "lci_ana"};				
			case "palm": 		{_var = "lci_palm"};				
			case "rum": 		{_var = "lci_rum"};				
			case "kaka": 		{_var = "lci_kaka"};				
			case "schok": 		{_var = "lci_kaka"};				
// Clan Lizenzen 			
			case "liga": {_var = "lci_liga"};
			case "stlkr": {_var = "lci_stlkr"};
			case "admin": {_var = "lci_admin"};
			case "anon": {_var = "lci_ano"};
			case "silva": {_var = "lci_sil"};
			
			case "bohrt": {_var = "lci_bohrt"};
			
			case "civspawn": {_var = "lci_civspawn"};
			case "uhrspawn": {_var = "lci_uhrspawn"};
			

			
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			
			case "lci_wert": 	{_var = "wert"};	// Wertstoffe
			case "lci_driv": 	{_var = "driver"}; //Drivers License cost
			case "lci_lkw":		{_var = "truck"}; //Truck License
			case "lci_boat": 	{_var = "boat"}; //Boating license cost
			case "lci_air": 	{_var = "pilot"}; //Pilot/air license cost
			
			case "lci_gun": 	{_var = "gun"}; //Firearm/gun license cost
			case "lci_dive": 	{_var = "dive"}; //Diving license cost
			case "lco_air": 	{_var = "cair"}; //Cop Pilot License cost
			case "lco_swat": 	{_var = "swat"}; //Swat License cost
			case "lco_cg": 		{_var = "cg"}; //Coast guard license cost
			case "lme_air": 	{_var = "mair"};			
			case "lada_car": 	{_var = "car"};
			case "lada_air": 	{_var = "air"};			
			
			case "lci_hero": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "lci_gang": {_var = "gang"}; //Gang license cost
			case "lci_reb": {_var = "rebel"}; //Rebel License			

			case "lci_salt": 	{_var = "salt"};
			case "lci_salt": 	{_var = "saltp"};
			case "lci_sand": {_var = "sand"};

			
			case "lci_home": 	{_var = "home"};			
			
			case "lci_jag": {_var = "zfell"};
			case "lci_jag": {_var = "hfell"};
			
			case "lci_gli": {_var = "gsg"};
			case "lci_gli": {_var = "ggn"};
			case "lci_gli": {_var = "gsn"};		
// Clan Lizenzen			
			case "lci_liga": {_var = "liga"};
			case "lci_stlkr": {_var = "stlkr"};
			case "lci_admin": {_var = "admin"};			
			case "lci_ano": {_var = "anon"};			
			case "lci_sil": {_var = "silva"};					
	/*NEU*/
	
			case "lci_civspawn": 	{_var = "civspawn"};
			case "lci_uhrspawn": 	{_var = "uhrspawn"};		
	/*Process*/
			case "lci_ana": 		{_var = "anakons"};		// Ananaskonserven
			case "lci_iro": 		{_var = "iron"};		// Eisen
			case "lci_copp": 		{_var = "copper"};		// Kupfer
			case "lci_cem": 		{_var = "cement"};		// Mamor
			case "lci_palm": 		{_var = "palm"};		// Palmöl
			case "l_a1": 			{_var = "fassbrett"};	// Fassbretter
			case "l_a1": 			{_var = "fass"};		// Fass
			case "l_a1": 			{_var = "brett"};		// Bretter
			case "l_a1": 			{_var = "mob"};			// Möbel
			case "l_a1": 			{_var = "spanp"};		// Spanplatten
			case "l_a1": 			{_var = "stobox"};		// Lagerkisten			
			case "lci_rum": 		{_var = "rum"};			// Brennlizenz
			case "lci_kaka": 		{_var = "kaka"};		// Kakao rösten
			case "lci_kaka": 		{_var = "schok"};		// Schokolade herstellen
			case "lci_dia": 		{_var = "diamond1"};	// Edelsteine
			case "lci_dia": 		{_var = "diamond2"};	// Edelsteine
			
			case "lci_bohrt": 		{_var = "bohrt"};	
			case "lci_oil": 		{_var = "rio"};			// 	Offshore
			case "lci_oil": 		{_var = "oil"}; 		//	Oil processing license cost
			/*UHR*/
			case "lci_mari": 		{_var = "marijuana"}; 	//	Marijuana processing license cost
			case "lci_cok": 		{_var = "cocaine"};		// Kokain
			/*REB*/
			case "lci_lsd": 		{_var = "lsd"};			// LSD
			case "lci_meth": 		{_var = "meth"};		// Meth
			/*Metall*/
			case "lci_iro": 		{_var = "bohrg"};
			case "lci_copp": 		{_var = "bohrg"};
			case "lci_palm": 		{_var = "tet"};		
			case "lci_iro": 		{_var = "oilpum"};
			case "lci_copp": 		{_var = "oilpum"};
			case "lci_iro": 		{_var = "diet"};
			case "lci_copp": 		{_var = "diet"};
			case "lci_iro": 		{_var = "bolz"};
			case "lci_copp": 		{_var = "bolz"};
			case "lci_iro": 		{_var = "hydr"};
			case "lci_copp": 		{_var = "hydr"};			
			case "lci_iro": 		{_var = "stahlt"};
			case "lci_copp": 		{_var = "stahlt"};		
			case "lci_iro": 		{_var = "ketts"};
			case "lci_copp": 		{_var = "ketts"};		
			case "lci_copp": 		{_var = "press"};	
			case "lci_iro": 		{_var = "press"};				
			case "lci_iro": 		{_var = "dosen"};				
			case "lci_copp": 		{_var = "dosen"};				
			case "lci_copp": 		{_var = "mach"};				
			case "lci_iro": 		{_var = "mach"};
			
			default 				{_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;