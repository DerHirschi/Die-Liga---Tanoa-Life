/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item isEqualTo "") exitWith {};
 
switch (_item) do
{
	case "heroinu": {6};
	case "heroinp": {4};

//	case "rabbit": {1};

	case "fishing": {2};
	case "fireWo": {6};
	
//	case "donuts": {1};

	case "sand": {3};

//	case "glass": {1};

	case "goldbar": {12};

	case "defusekit": {2};
	
	case "kasse": {25};
	case "schrank": {28};

	case "wein": {3};

	case "rabbitf": {2};
//	case "henraw": {1};
//	case "roosterraw": {1};
	
//	case "doen": {1};
//	case "rabbitfp": {1};
	
	case "prl": {2};
	case "prlhe": {2};

	case "stt": {9};


//	case "c7": {2};
//	case "c8": {9};


/*NEU*/
//	case "a10": 		{1};		// Flasche
//	case "water": 	{1};		// Wasser

//	case "c5": 		{1};		// ALAC Fluglizenz
//	case "a11": 		{1};		// Hefe
	case "a12": 		{3};		// Maische
	case "14": 			{4};		// Tarnnetz
	case "15": 			{42};		// Destille
	case "16": 			{38};		// Maischefass
	case "17": 			{14};		// Zelt
	case "18": 			{3};		// Methyl
	case "20": 			{5};		// Moonshine	
	case "21": 			{2};		// Flasche Moonshine
	case "b22": 		{12};		// Campingstuhl
	case "b23": 		{10};		// Campingstuhl

	case "storagebig": 	{5};		// Lagerkiste
//	case "fuelE": 	{1};		// Benzinkanister leer
	case "fuelF": 		{4};		// Benzinkanister voll
	
	case "sfb": 		{2};		// Schrankenfernbedienung
	
	case "gpstracker": 	{2};		// GPS Tracker
	case "zipties": 	{2};		// Kabelbinder
	case "uwsl": 		{5};		// Wasserbombe
	case "blastingcharge": {15};	// Sprengladung
	case "spikeStrip": 	{10};		// Nagelbänder
	
	case "mauer": 		{2};		// Absperrung
//	case "kegel": 	{1};		// Kegel
	case "strahler": 	{2};		// Strahler
/*Schlosser*/	
//	case "a7": 		{1};		// Axt
	case "a8": 			{2};		// Kettensäge
	case "a9": 			{2};		// Presslufthammer	
	case "pickaxe": 	{2};		// Spitzhacke
	case "jame": 		{2};		// Jagdmesser
	case "mache": 		{2};		// Machete
	
//	case "lockpick": {1};		// Dietrich	
	case "boltcutter": 	{5};		// Bolzenschneider	
	case "c6": 			{3};		// Bohrmaschine	

	case "di": 			{2};		// Kerosin
//	case "ben": 		{1};		// Treibstoff

//	case "apple": 	{1};		// Süßkartoffeln
//	case "peach": 	{1};		// Kokusnuesse
	case "ana": 		{2};		// Ananas
//	case "bw": 		{1};    	// Ananaskonserver

	case "mull": 		{2};		// 	Müll
//	case "a0": 		{1};		// 	Kunststoff

	case "copperore": 	{5};		//	Kupfererz
	case "ironore": 	{5};		//	Eisenerz
	case "copper_r": 	{3};		//	Kupferbarren
	case "iron_r": 		{3};		//	Eisenbarren
	
	case "salt": 		{3};		// Salz
//	case "salt_r": 	{1};		// Raffiniertes Salz
//	case "c4": 		{1};		// Salpeter
		
	case "c3": 			{3};		// Schwefel
//	case "c1": 		{1};		// Munitionskisten
	case "c2": 			{4};		// Waffenteile	
	
	case "rock": 		{6};		//	Mamor
	case "cement": 		{5};		//	Mamorplatten

	case "kaka": 		{4};		//	Kakao	
	case "kakap": 		{2};		//	Kakao geröstet
	case "schok": 		{3};		//	Schokolade	

	case "sig": 		{4};		//	Palmfrucht		
	case "tet": 		{2};		//	Palmoel	
	
	case "reva": 		{3};		// Zuckerrohr
	case "bottledbeer":	{6};		// Ligas Finest Rum		
	
	case "dose":		{1};		// Dosen
	case "redgull":		{1};		// RedGull
		
	case "a1t": 		{6};		// Tropenholz
	case "a1": 			{5};		// Baumstämme
//	case "guh": 		{1};		// Fassbretter
	case "fassinv": 	{5};		// Fass
	
//	case "a2": 		{1};		// Bretter
	case "a3": 			{2};		// Leim
//	case "a4": 		{1};		// Holzspäne
	case "a5": 			{5};		// Spanplatten
	case "a6": 			{3};		// Möbel
		/*Öl*/
	case "rio": 		{5};		// 	Offshore Öl
//	case "rig": 		{1};		// 	Methangas
	case "rip": 		{4};		// 	Oel Pumpe	
	case "rib": 		{4};		// 	Bohrgestaenge
	case "oilu": 		{3};		//	RohÖl
	case "oilp": 		{3};		// 	ÖL
		/*Goldrausch*/
	case "gsg": 		{16};		//	Schuerfgut
//	case "gab": 		{1};		//	Abraum
//	case "ghy": 		{1};		//	Hydro Riffel	
	case "gsn": 		{4};		//	Silbernuggets
	case "ggn": 		{6};		//	Goldnuggets
	case "gl": 			{8};		//	Goldschmuck
	case "gsm": 		{7};		//	Silberschmuck
		/*Edelsteine*/
	case "schgut": 		{8};		//	Schuerfgut Edelsteine
	case "diamond": 	{4};		//	Rohedelsteine
	case "diamondc": 	{2}; 		//	Edelsteine
	/*UHR*/
	case "cannabis": 	{4};		// 	Kanabis unver
	case "marijuana": 	{3};		// 	Mariuana verarbeitet
	
	case "turtle":		{6};		//	Schildkroeten
	case "turtlesoup": 	{2};		//	Schildkroeten Fleisch

	case "cocaine": 	{6};		//	Kokain Roh
	case "cocainep": 	{4};		//	Kokain processed	
	
	case "lava": 		{3};		//	Lavagestein	
	case "coral": 		{3};		//	Korallen	
//	case "corsurv": 	{1};		//	Souvenir
//	case "corsurvlava": 	{1};		//	Lavafiguren 
	
	case "perl": 		{2};		//	Perlen
	case "perlp": 		{6};		//	Perlenkette
	
	case "cofbea": 		{4};		//	Kaffeebohne
	case "cofbeap": 	{3};		//	Kaffee geroestet
	case "cofbeas": 	{3};		//	Kopi Luwak
//	case "coffee": 	{1};		//	Kaffee
//	case "kaffmasch":{1};		//	Kaffeemaschine

	case "kaut": 		{3};		//	Kautschuk
	
	case "tee": 		{2};		//	Tee
	case "nattee": 		{4};		//	Naturheilkräutertee
	case "natkra": 		{2};		//	Naturheilkräuter
	
	/*Jagen*/
	case "goatraw": 	{2};		//	Ziegenfleisch
	case "goatrawf": 	{3};		//	Ziegenrohfell
	case "goatrawfp": 	{2};		//	Ziegenfell
	
	case "sheepraw": 	{2};		//	Schafsfleisch
	case "sheeprawf": 	{3};		//	Wolle
	
	case "hode": 		{1};		//	Tierhoden

	/*REB*/
	case "lsdu": 		{5};		// LSD Frosch
	case "lsdp": 		{4};		// LSD
	
	case "methu": 		{6};		//	Meth unpro
    case "methp": 		{4};		//	Meth pro
    
	case "streckm": 	{1};		//	Streckmittel
	
    case "tutrei": 		{4};		//	Schildkroeteneier
    case "banan": 		{2};		//	Schildkroeteneier
					/*Fischzeug*/
	case "stofish": 	{4};		// Stockfisch
	case "salema": 		{2};
	case "ornate": 		{2};
	case "mackerel": 	{4};
	case "tuna": 		{6};
	case "mullet": 		{4};
	case "catshark": 	{6};
					/*Fischzeug Ende*/
	
	
	default {1};
};
