/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: Otti & Hirschi - Die Liga
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var isEqualTo "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	/*NEU*/
	case "lin_pea": 	{"Kokosnuss"};
	case "lin_apl": 	{"Suesskartoffeln"};	
	case "li_fireWo": 	{"Feuerwerk"};	
	
	case "lin_kasse": 	{"Kassentisch"};	
	case "lin_schrank": {"Regal"};	
	
	case "lin_ml": 		{"Müll"};
	case "l_a0": 		{"Kunststoff"};
		/*Metallverarbeitung*/
	case "lin_iroo": 	{"Eisenerz"};
	case "lin_iror": 	{"Eisenbarren"};	
	case "lin_copp": 	{"Kupfererz"};
	case "lin_copr": 	{"Kupferbarren"};		
	
	case "lin_sal": 	{"Salz"};
	case "lin_salr": 	{"Raffiniertes Salz"};		
	case "c_4": 		{"Salpeter"};
	
	case "c_3": 		{"Schwefel"};	
	case "c_1": 		{"Munition"};	
	case "c_2": 		{"Waffenteile"};	
	
	case "lin_banan": 	{"Bananen"};	
	case "lin_ana": 	{"Ananas"};	
	case "lin_bw": 		{"Ananaskonserven"};	
	
	case "lin_rock": 	{"Mamor"};	
	case "lin_cem": 	{"Mamorplatten"};
	
	case "lin_kaka": 	{"Kakao"};
	case "lin_kakap": 	{"Kakao geröstet"};
	case "lin_schok": 	{"Schokolade"};	
	
	case "li_sig": 		{"Palmfrucht"};	
	case "li_tet": 		{"Palmoel"};	
	
	case "lin_reva": 	{"Zuckerrohr"};
	case "lin_bob": 	{"Ligas Finest Rum"}; // Promille ändern	
	
	
	case "lin_dose": 	{"Dosen"};
	case "lin_red": 	{"RedGull"};
	
	case "i_a1t": 		{"Tropenholz"};
	case "i_a1": 		{"Baumstaemme"};	
	case "li_guh": 		{"Fassbretter"};	
	case "li_fass": 	{"Fass"};	
	
	case "i_a2": 		{"Bretter"};	
	case "i_a3": 		{"Leim"};		
	case "i_a4": 		{"Holzspaene"};
	case "i_a5": 		{"Spanplatten"};		
	case "i_a6": 		{"Moebel"};		
		/*Öl*/
	case "li_rio": 		{"Offshore Oel"};
	case "lin_oilu": 	{"Rohoel"};
	case "lin_oilp": 	{"Oel"};
	case "li_di": 		{"Kerosin"};
	case "li_ben": 		{"Treibstoff"};		
	case "li_rig": 		{"Methangas"};			
	case "li_rip": 		{"Oel Pumpe"};
	case "li_rib": 		{"Bohrgestaenge"}; 	
		/*Goldrausch*/
	case "li_gsg": 		{"Schuerfgut"}; // Random Gold & Silber nuggets
	case "li_gab": 		{"Abraum"};
	case "li_ghy": 		{"Hydro Riffel"};
	case "li_gsn": 		{"Silbernuggets"};
	case "li_ggn": 		{"Goldnuggets"};	
	case "lin_gl": 		{"Goldschmuck"};
	case "li_gsm": 		{"Silberschmuck"};
		/*Diamanten*/
	case "li_schgut":	{"Schuerfgut Edelsteine"};	
	case "lin_dia": 	{"Rohedelsteine"};	
	case "lin_diar": 	{"Edelsteine"};
	
	/*UHR JOB´s*/
	case "lin_cana": 	{"Kannabis"};
	case "lin_marj": 	{"Marihuana"};
	
	case "lin_turt": 	{"Schildkroeten"};
	case "lin_turs": 	{"Schildkroeten Fleisch"};	
	
	case "lin_cok": 	{"Unverarbeitetes Kokain"};
	case "lin_cokp": 	{"Verarbeitetes Kokain"};	
	
	case "lin_lava": 	{"Lavagestein"};
	case "lin_coral": 	{"Korallen"};		
	case "lin_corsuv": 	{"Souvenir"};	
	
	case "lin_perl": 	{"Perlen"};		
	case "lin_perl_p": 	{"Perlenkette"};			
	
	case "lin_cofbea": 	{"Kaffeebohne"};	
	case "lin_cofbea_p":{"Kaffee geroestet"};	
	case "lin_cofbea_s":{"Kopi Luwak"};	
	case "lin_coff": 	{"Kaffee"};
	case "lin_lavafig":	{"Lavafiguren"};
	
	case "lin_kaut": 	{"Kautschuk"};
	
	case "lin_tee": 	{"Tee"};
	case "lin_nattee": 	{"Naturheilkräutertee"};
	case "lin_natkr": 	{"Naturheilkräuter"};
	case "lin_kafma": 	{"Kaffeemaschine"};
	
	/*REB*/
	case "lin_lsdu": 	{"LSD Frosch"};
	case "lin_lsdp": 	{"LSD"};	
	
	case "lin_metu": 	{"Unverarbeitetes Meth"};
    case "lin_metp": 	{"Crystal Meth"};
    
	case "lin_streckm":	{"Streckmittel"};
	
    case "lin_tutrei": 	{"Schildkroeteneier"};	
	/*DIV*/	
	case "lin_blac": 	{"Sprengladung"};		
	case "lin_fuE": 	{"Benzinkanister leer"};
	case "lin_fuF": 	{"Benzinkanister"};
	case "lin_stob":	{"grosse Lagerkiste"};	
	case "lin_gps": 	{"GPS Tracker"};
	case "lin_zip": 	{"Kabelbinder"};	
	case "lin_uwl": 	{"Wasserbombe"};
	
	case "lin_sps": 	{"Nagelband"};	
	case "li_mau": 		{"Absperrung"};	
	case "li_sfb": 		{"Schranken FB"};	
	case "li_keg": 		{"Kegel"};
	case "li_stra": 	{"Strahler"};	// Strahler ... ach nee Otti :D
	/*Schlosser*/
	case "i_a7": 		{"Axt"};
	case "i_a8": 		{"Kettensaege"};
	case "i_a9": 		{"Presslufthammer"};
	case "lin_axe": 	{"Spitzhacke"};
	case "lin_jme": 	{"Jagdmesser"};	
	case "lin_mache": 	{"Machete"};	
	
	case "lin_lpi": 	{"Dietrich"};	
	case "lin_boc": 	{"Bolzenschneider"};
	case "c_6": 		{"Bohrmaschine"};
	/*Jagen*/
	case "lin_goa": 	{"Ziegenfleisch"};
	case "lin_goaf": 	{"Ziegenrohfell"};
	case "lin_goafp": 	{"Ziegenfell"};
	
	case "lin_she": 	{"Schafsfleisch"};
	case "lin_shef": 	{"Wolle"};
	
	case "lin_hode": 	{"Tierhoden"};			
	
	case "l_a11": 		{"Hefe"};
	case "l_a12": 		{"Maische"};
	case "l_14": 		{"Tarnnetz"};
	case "l_15": 		{"Destille"};
	case "l_16": 		{"Maischefass"};
	case "l_17": 		{"Zelt"};	
	case "l_18": 		{"Methyl"}; // 
	case "l_20": 		{"Moonshine"};
	case "l_21": 		{"Flasche Moonshine"};
	case "l_22": 		{"Campingstuhl"};
	case "l_23": 		{"Campingstuhl"};
		
	case "c_5":			{"Fluglizenz ALAC"};
	
	
	case "lin_stofish":	{"Stockfisch"};
	case "lin_salem": 	{"Salema Fleisch"};
	case "lin_orna": 	{"Ornate Fleisch"};
	case "lin_makr": 	{"Makrelen Fleisch"};
	case "lin_tuna": 	{"Thunfisch"};
	case "lin_mule": 	{"Mullet Fleisch"};
	case "lin_cats": 	{"Katzenhai Fleisch"};
	
	case "lin_wate":	{"Wasserflasche"};
	
	case "l_a10": 		{"Flaschen"};
	
	
	/*NEU ENDE*/
	case "lin_doen": 	{"Doener"};	

	case "lin_heru": {"Unverarbeitetes Heroin"};
	case "lin_herp": {"Verarbeitetes Heroin"};

	case "lin_rabi": {"Hasen Fleisch"};

	case "lin_fisp": {"Angel"};
		
	case "lin_donu": {"Donuts"};
	
	case "lin_sand": {"Sand"};
	case "lin_glas": {"Glas"};
	

	
	case "lin_tba": {"Taktischer Speck"};
		
	case "lin_gold": {"Goldbarren"};	

	case "lin_def": {"Entschaerfungsset"};	
	
	case "lin_wei": {"Liga Libre"};		// Promille ändern
	
	case "lin_gyr": {"Tanoa Pommes"};
	/*Raus*/
	case "lin_uzo": {"Ouzo"};	
//	case "lin_sala": {"Salat"};		
	
	
	case "lin_zig": {"Zigaretten"};

	/*Ändern*/

	
	case "lin_rabif": {"Hasenfell"}; 
	
	/*Kommt noch */
	case "lin_hen": {"Huenerfleisch"};
	case "lin_roo": {"Haenchenfleisch"};
	

	case "lin_rabifp": {"Hasenpelz"};	
	
	case "li_prl": {"Pressluftflaschen"};
	//case "li_prlhe": {"Heliumgemisch"};
	
	case "li_stt": {"Stahltraeger"};		
		
	

	//License Block
	case "lci_driv": {"Führerschein"};
	case "lci_air": {"Pilotenschein"};
	case "lci_hero": {"Heroinausbildung"};
	case "lci_oil": {"Oellizenz"};
	case "lci_dive": {"Tauchlizenz"};
	case "lci_boat": {"Bootsfuehrerschein"};
	case "lci_gun": {"Waffenschein"};
	case "lco_air": {"Pilotenschein"};
	case "lco_swat": {"SWAT Training"};
	case "lco_cg": {"Küstenwache"};
	case "lci_kaka": {"Kakaolizenz"};
	case "lci_reb": {"Guerilla Tattoo"};
	case "lci_lkw": {"LKW Fuehrerschein"};
	case "lci_dia": {"Edelsteinschuerfrecht"};
	case "lci_wert": {"Erlaubnis der Stammeshäuptlinge"};
	case "lci_copp": {"Kupferlizenz"};
	case "lci_iro": {"Eisenlizenz"};
	case "lci_sand": {"Sandlizenz"};
	case "lci_salt": {"Salzlizenz"};
	case "lci_cok": {"Kokainausbildung"};
	case "lci_mari": {"Marihuanaausbildung"};
	case "lci_cem": {"Zementlizenz"};
	case "lme_air": {"Pilotenschein"};
	case "lci_home": {"Eigentumsurkunde"};
	case "lada_car": {"ALAC Führerschein"};
	case "lada_air": {"ALAC Pilotenschein"};

	case "lci_meth": {"Meth-training"};
	case "lci_lsd": {"LSD-training"};
	case "lci_jag": {"Jagdschein"};
	case "lci_gli": {"Schuerfrecht"};
	case "lci_ben": {"Oelraffinierung Lizenz"};
	case "lci_sig": {"Chemie Lizenz"};
	case "l_a1": {"Holzverabeitung"};
	case "lci_bohrt": {"Bohrlizenz"};
	// ??
	case "lci_gang": {"Gang-Lizenz"};
	case "lci_civspawn": {"Zivilist"};
	case "lci_uhrspawn": {"Ureinwohner"};
	//??
	/*NEU*/
	
	case "lci_ana": 	{"Konservenlizenz"};
	case "lci_palm": 	{"Palmenlizenz"};
	case "lci_rum": 	{"Brennlizenz"};
// Clan Lizenzen	
	default {""};

};
