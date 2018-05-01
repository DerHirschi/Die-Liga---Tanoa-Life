/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller
	Edited by Otti & Hirschi - Die Liga

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var isEqualTo "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "li_sig": {("icons\itemst\Icons_Tanoa13.paa")};			// Edelsteine
	case "li_sig": {("icons\itemst\Icons_Tanoa13.paa")};			// Edelsteine
	case "lin_diar": {("icons\itemst\Icons_Tanoa8.paa")};			// Edelsteine
	case "lin_pea": {("icons\itemst\Icons_Tanoa4.paa")};			// Kokusnuss
	case "lin_apl": {("icons\itemst\Icons_Tanoa1.paa")};			// Suesskartoffeln
	case "lin_dose": {("icons\itemst\Icons_Tanoa5.paa")};			// dosen
	case "lin_stofish": {("icons\itemst\Icons_Tanoa11.paa")};		// stockfisch
	case "lin_dose": {("icons\itemst\Icons_Tanoa5.paa")};			// dosen
	case "lin_wate": {("icons\items\water.paa")};					// Wasser
	case "lin_tba": {("icons\items\tba.paa")};						// Tac Schinken
	case "lin_red": {("icons\items\redgull.paa")};					// Redgull
	case "lin_zig": {("icons\items\zig.paa")};						// Zigaretten
	case "lin_bob": {("icons\items\bier.paa")};						// Bier
	case "lin_wei": {("icons\items\wei.paa")};						// Wein
	case "lin_uzo": {("icons\items\ou.paa")};						// Ouzo
	case "lin_ana": {("icons\items\ana.paa")};						// Ananas
	case "lin_gyr": {("icons\items\gy.paa")};						// Gyros
	case "lin_doen": {("icons\items\doe.paa")};						// Doener
	case "lin_schok": {("icons\itemst\Icons_Tanoa10.paa")};			// schoko
	case "lin_schok": {("icons\itemst\Icons_Tanoa10.paa")};			// schoko
//	case "lin_sala": {("icons\items\sala.paa")};					// Salat
	
	// Cops ADAC Medics	
	case "lin_lavafig": {("icons\itemst\Lavasteinfigur.paa")};		// Kaffee
	case "lin_lava": {("icons\itemst\Lavagestein.paa")};			// Kaffee
	case "lin_kaut": {("icons\itemst\Kautsch.paa")};				// Kaffee
	case "lin_cofbea": {("icons\itemst\Kafferoh.paa")};				// Kaffee
	case "lin_cofbea_s": {("icons\itemst\Kafferoh.paa")};				// Luwak
	case "lin_cofbea_p": {("icons\itemst\Kaffefertig.paa")};		// Kaffee
	case "lin_coff": {("icons\items\coffee.paa")};					// Kaffee
//	case "lin_reva": {("icons\items\reva.paa")};					// Kuchen
	case "lin_donu": {("icons\items\donut.paa")};					// Donuts
	case "li_keg": {("icons\items\pylon.paa")};						// Kegel
	case "li_stra": {("icons\items\stra.paa")};						// Strahler
	case "li_mau": {("icons\items\barrikade.paa")};					// Absperung
	case "lin_sps": {("icons\items\spikestrip.paa")};				// Nagelband
//	case "li_det": {("icons\items\detektor.paa")};		// Detektor
	case "lin_def": {("icons\items\defusekit.paa")};				// Entschaerfungsset
	case "c_5": {("")};												// ALAC Urkunde für Fluglizenz
	
	// Fischmarkt	
	case "lin_salem": {("icons\items\fish.paa")};					// Selem
	case "lin_orna": {("icons\items\fish.paa")};					// Orna
	case "lin_makr": {("icons\items\fish.paa")};					// Mekrele
	case "lin_tuna": {("icons\items\fish.paa")};					// Tunfisch
	case "lin_mule": {("icons\items\fish.paa")};					// Mullet
	case "lin_cats": {("icons\items\fish.paa")};					// Katzenhai
	case "lin_fisp": {("icons\items\fishingpoles.paa")};			// Angel
	case "li_prl": {("icons\items\prl.paa")};						// Pressluftflaschen
	case "li_prlhe": {("icons\items\prl.paa")};						// Pressluftflaschen
	
	// Schildkröten
	case "lin_turt": {("icons\items\turtle.paa")};					// Schildkröte
	case "lin_turs": {("icons\items\turtle_soup.paa")};				// Schildkrötensuppe
	
	// Benzinkanister
	case "lin_fuE": {("icons\items\fuel_can.paa")};					// Kanister Leer
	case "lin_fuF": {("icons\items\fuel_can.paa")};					// Kanister Voll
	
	// Legal Jobs
	case "lin_kakap": {("icons\itemst\Icons_Tanoa3.paa")};			// kakao
	case "lin_kaka": {("icons\itemst\Icons_Tanoa3.paa")};			// kakao
	
	case "lin_ml": {("icons\items\ml.paa")};						// Müll
	case "lin_axe": {("icons\items\pickaxe.paa")};					// Spitzhacke
	case "i_a7": {("icons\items\axt.paa")};							// Axt
	case "i_a8": {("icons\items\kets.paa")};						// Kettensäge
	case "i_a9": {("icons\items\pressluft.paa")};					// Presslufthammer
	case "li_guh": {("icons\itemst\Icons_Tanoa2_0_4.paa")};			// Fassbrett
	case "li_rip": {("icons\items\pumpe.paa")};						// Ölpumpe
	case "li_rib": {("icons\items\bgs.paa")};						// Bohrgestänge
	case "lin_jme": {("icons\items\jagdmesser.paa")};				// Jagdmesser
	case "lin_goa": {("icons\items\meat.paa")};						// Ziegenfleich
	case "lin_she": {("icons\items\rawmeat.paa")};					// Schafsfleisch
	case "lin_hen": {("icons\items\rawmeat.paa")};					// Hühnerfleich
	case "lin_roo": {("icons\items\rawmeat.paa")};					// Hänchenfleisch
	case "lin_rabi": {("icons\items\meat.paa")};					// Hasenfleisch
	case "lin_rabif": {("icons\items\rabif.paa")};					// Hasenfell
	case "lin_rabifp": {("icons\items\rabifp.paa")};				// Hasenpelz
	case "lin_goaf": {("icons\items\goaf.paa")};					// Ziegenrohfell
	case "lin_goafp": {("icons\items\goafp.paa")};					// Ziegenfell
	case "lin_shef": {("icons\items\shef.paa")};					// Wolle
	case "i_a1": {("icons\items\holz.paa")};						// Baumstämme
	case "i_a2": {("icons\items\holzv.paa")};						// Bretter
	case "i_a3": {("icons\items\leim.paa")};						// Leim
	case "i_a4": {("icons\items\hpa.paa")};							// Holzspaene
	case "i_a5": {("icons\items\spa.paa")};							// Spanplatten
	case "i_a6": {("icons\items\mb.paa")};							// Möbel
	case "lin_bw": {("icons\itemst\Icons_Tanoa2_0_0.paa")};			// Baumwolle
	case "lin_sand": {("icons\items\sand.paa")};					// Sand
	case "lin_sal": {("icons\items\salt_unprocessed.paa")};			// Rohsalz
	case "lin_salr": {("icons\items\salt.paa")};					// Salz
	case "lin_glas": {("icons\items\glass.paa")};					// Glas 
	case "li_stt": {("icons\items\stt.paa")};						// Stahlträger
	// Gold u Silber
	case "li_ghy": {("icons\items\ghy.paa")};						// Hydro Riffel
	case "li_gsg": {("icons\items\gsg.paa")};						// Schürfgut
	case "li_gab": {("icons\items\gab.paa")};						// Abraum
	case "li_gsn": {("icons\items\gsn.paa")};						// Silbernuggets
	case "li_ggn": {("icons\items\ggn.paa")};						// Goldnuggets
	// Oil Feld
	case "lin_oilu": {("icons\items\oil_unprocessed.paa")};			// Rohöl
	case "lin_oilp": {("icons\items\oil_processed.paa")};			// Öl
	//Oil Rig
	case "li_rio": {("icons\items\oil_unprocessed.paa")};			// Offshore Oel
	case "li_rig": {("icons\items\rig.paa")};						// Methangas
	case "li_di": {("icons\items\di.paa")};							// Kerosin
	case "li_ben": {("icons\items\ben.paa")};						// Benzin
	case "li_fass": {("icons\itemst\Icons_Tanoa2_0_1.paa")};		// Fass
	case "lin_mache": {("icons\itemst\Icons_Tanoa2_0_2.paa")};		// machete
	case "lin_bob": {("icons\itemst\Icons_Tanoa2_0_3.paa")};		// rum
	case "lin_bob": {("icons\itemst\Icons_Tanoa2_0_3.paa")};		// rum
	
	
	// Uranverarbeitung
	/*
	case "lin_ur1": {("icons\items\atomm.paa")};					// Atommüll
	case "lin_ur2": {("icons\items\atoma.paa")};					// Aufbereitetes Uran
	case "lin_ur3": {("icons\items\gu.paa")};						// Gereinigtes Uran
	case "lin_ur4": {("icons\items\vu.paa")};						// Veredeltes Uran
	case "lin_ur": {("icons\items\bs1.paa")};						// Brennstäbe
	case "lin_iu4": {("icons\items\au1.paa")};						// Angereichertes Uran
	case "lin_iu": {("icons\items\wu.paa")};						// Waffenfähiges Uran
	case "lin_ipur": {("icons\items\hf.paa")};						// Hexafluorid
	case "lin_pur": {("icons\items\ukt.paa")};	
*/	// Urankatalysator
	
	//Metalle u. Edelsteine
	case "lin_copp": {("icons\items\copper_ore.paa")};				// Kupfererz
	case "lin_copr": {("icons\items\copper.paa")};					// Kupferbarren
	case "lin_iroo": {("icons\items\iron_ore.paa")};				// Eisenerz
	case "lin_iror": {("icons\items\iron.paa")};					// Eisenbarren
	case "lin_dia": {("icons\items\diamond_unprocessed.paa")};		// Rohdiamanten
	case "lin_diar": {("icons\items\diamond.paa")};					// Diamanten
	case "lin_rock": {("icons\itemst\Marmor_1.paa")};					// Steine
	case "lin_cem": {("icons\itemst\Marmor_2.paa")};					// zement
	case "lin_perl": {("icons\itemst\Perlen.paa")};					// zement
	case "lin_perl_p": {("icons\itemst\Perlenkette.paa")};					// zement
	case "lin_corsuv": {("icons\itemst\souvenir.paa")};					// Souvenir
	case "lin_corsuv": {("icons\itemst\souvenir.paa")};					// Souvenir
	case "lin_coral": {("icons\itemst\Koralle.paa")};					// Korallen
	case "lin_banan": {("icons\itemst\Bannnana.paa")};					// Bananen
	case "lin_tee": {("icons\itemst\tee.paa")};					// tee
	case "lin_nattee": {("icons\itemst\tee.paa")};					// Naturheilkräutertee
	case "lin_natkr": {("icons\itemst\Kraut.paa")};					// Naturheilkräuter
		
	// Schwarzbrenner
	case "l_a10": {("icons\items\flasche.paa")}; 			 		// Flasche
	case "l_a11": {("icons\items\hefe.paa")}; 						// Hefe
	case "l_a12": {("icons\items\maische.paa")};					// Maische
	case "l_a0": {("icons\items\kunstoff.paa")};					// Kunststoff
	case "l_14": {("icons\items\tarnnetz.paa")};					// Tarnnetz
	case "l_15": {("icons\items\des.paa")};							// Destille
	case "l_16": {("icons\items\mfs.paa")};							// Maischefass
	case "l_17": {("icons\items\zelt.paa")};						// Zelt
	case "l_18": {("icons\items\Methyl.paa")};						// Methyl
	case "l_20": {("icons\items\Moons.paa")};						// Moonshine
	case "l_21": {("icons\items\Moonf.paa")};						// Flasche Moonshine
	case "l_22": {("icons\items\l_22.paa")};						// Klappstuhl
	case "l_23": {("icons\items\l_23.paa")};						// Klappstuhl
	
	// Lagerboxen
	//case "lin_stos": {("icons\items\storagesmall.paa")};			// Kleine Lagerkiste
	case "lin_stob": {("icons\items\storagebig.paa")};				// Grosse Lagerkiste
	
	// Ilegale Items
	case "lin_gl"	: {("icons\itemst\Schmuck.paa")};						// Goldmünze
	case "li_gsm"	: {("icons\itemst\Schmuck.paa")};					// Silbermünze
	case "lin_boc"	: {("icons\items\boltcutter.paa")};				// Bolzenschneider
	case "lin_lpi"	: {("icons\items\lockpick.paa")};				// Dietrich
	case "lin_blac"	: {("icons\items\blastingcharge.paa")};			// Sprengladung
	case "lin_gold"	: {("icons\items\goldbar.paa")};				// Goldbarren
	case "lin_gps"	: {("icons\items\gpstracker.paa")};				// GPS Tracker
	case "lin_zip"	: {("icons\items\kabelbinder.paa")};			// Kabelbinder
	case "lin_uwl"	: {("icons\items\wbe.paa")};					// Wasserbombe
	case "li_sfb"	: {("icons\items\sfb.paa")};					// Schrankenfernbedinung
//	case "c_6"		: {("icons\items\sfb.paa")};			// Bohrmaschine
		
	//Ilegale Jobs
	case "lin_hode": {("icons\itemst\Icons_Tanoa2.paa")};			// Tiehoden
	case "lin_heru": {("icons\items\heroin_unprocessed.paa")};		// Heroin U
	case "lin_herp": {("icons\items\heroin_processed.paa")};		// Heroin
	case "lin_cana": {("icons\items\cannabis.paa")};				// Cannabis
	case "lin_marj": {("icons\items\marijuana.paa")};				// Marijuana
	case "lin_cok": {("icons\items\cocain_unprocessed.paa")};		// Kokain U
	case "lin_cokp": {("icons\items\cocain_processed.paa")};		// Kokain	
	case "lin_metu": {("icons\items\cmu.paa")};						//Crystal Meth U
	case "lin_metp": {("icons\items\cm.paa")};						//Crystal Meth
	case "lin_lsdu": {("icons\items\lsdf.paa")};					// LSD Frosch
	case "lin_lsdp": {("icons\items\lsd.paa")};						// LSD
	case "li_tet": {("icons\itemst\Icons_Tanoa7.paa")};						// Tetramethylammoniumchlorid
	//case "li_sig": {("icons\items\sig.paa")};						// Schiefergas
	
	// Projekt Waffenteile usw
	case "c_1": {("icons\items\c_1.paa")};							// Munitionskisten
	case "c_2": {("icons\items\c_2.paa")};							// Waffenteile
	case "c_3": {("icons\items\c_3.paa")};							// Schwefel - legal
	case "c_4": {("icons\items\c_4.paa")};							// Salpeter - legal
	
	case default {("")};										
};