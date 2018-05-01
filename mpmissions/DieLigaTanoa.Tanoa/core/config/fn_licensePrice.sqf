/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {2500}; //Drivers License cost
	case "boat": {15000}; //Boating license cost
	case "pilot": {80000}; //Pilot/air license cost
	case "gun": {150000}; //Firearm/gun license cost
	case "dive": {8000}; //Diving license cost
	case "oil": {50000}; //Oil processing license cost
	case "cair": {50000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {25000}; //Coast guard license cost
	case "heroin": {120000}; //Heroin processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {60000}; //Gang license cost
	case "rebel": {1250000}; //Rebel license cost
	case "truck": {60000}; //Truck license cost
	case "diamond": {50000};
	case "salt": {50000};
	case "sand": {25000};

	case "cement": {25000};
	case "mair": {15000};   //Medic Air
	case "home": {600000};   
	case "car": {500};  //ADAC
	case "air": {5000};  //ADAC
		
	case "hfell": {65000};	
	case "gsg": {100000};
	
//	case "tet": {120000};
	
	
	case "bohrt": 		{180000};
	/*NEU*/
	case "anakons": 	{18000};		//ANanaskonserver
	case "iron": 		{15000};		//Eisen
	case "copper": 		{15000};		//Kupfer
	case "palm": 		{15000};		//Palmöl
	case "brett": 		{80000};		//Holzverarbeitungsliz
	case "rum": 		{15000};		//Brennlizenz
	case "kaka": 		{15000};		//Kakao Zeug
	case "schok": 		{15000};		//Kakao Zeug
	/*UHR*/
	case "marijuana": 	{120000}; 		//Marijuana processing license cost
	case "cocaine": 	{120000};		//Kokain
	/*REB*/
	case "lsd": 		{120000};		//LSD
	case "meth": 		{120000};		//Meth
	case "rio": 		{75000};		//Öl
	case "oilp": 		{75000};		//Öl
	case "uhrspawn": 		{0};		//Öl
	case "civspawn": 		{0};		//Öl
	case "diamond1": 	{90000};		//Edelsteine
	case "diamond2": 	{90000};		//Edelsteine
	case "wert":	 	{200000};		//Wer
	default {500000};
		
// Clan Lizenzen
	

};