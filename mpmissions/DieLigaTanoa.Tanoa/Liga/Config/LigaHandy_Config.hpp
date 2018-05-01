//#define COMPF Liga\LigaHandy\fnc 
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
	║ Author: Zoran & Hirschi - Die Liga
	║
	║ Die Liga - Ein ARMA sie zu knechten....
	╚══════════════════════════════════════════════════╝
*/

		//Wir brauchen dringend die Icons!!!!

class HandySettings {	

	class MainApps 
	{
		IconArr[] = 
		{														
			{"textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa",0}, 		
			{"textures\Handy\Icons\Messanger.mittelgross.1.0.paa",1},  			
			{"textures\Handy\Icons\Nottrufmessanger.mittelgross.1.0.paa",2},	
			{"textures\Handy\Icons\GPS.mittelgross.1.0.paa",3},					
			//{"textures\Handy\Icons\Wetter.mittelgross.1.0.paa",4},				
			//{"textures\Handy\Icons\Markt.mittelgross.1.0.paa",5},				
			{"textures\Handy\Icons\fuel.mittelgross.1.0.paa",6},				
			{"textures\Handy\Icons\Eisntellungen.mittelgross.1.0.paa",7}//<--- Wattn das fürn Wort Herr Grafiker ??? "Eisntellungen" ???
		};	
		
	};
		
	class PIC 
	{
		//Wetter
		SONNIG 		= "textures\Handy\Wetter\Sonnig1.0.paa";
		BEWOLK 		= "textures\Handy\Wetter\Sonnigbevoelkt1.0.paa";
		WOLK   		= "textures\Handy\Wetter\Wolkig1.0.paa";
		REGEN  		= "textures\Handy\Wetter\Rain1.0.paa";
		//TelBuch
		COPICON 	= "textures\Handy\Icons\div\polizei1.paa";
		CIVICON 	= "textures\Handy\Icons\div\person1.paa";
		GANGICON 	= "textures\Handy\Icons\div\gruppe1.paa";
		LRKICON		= "textures\Handy\Icons\div\medic.paa";
		ALAICON 	= "textures\Handy\Icons\div\alac1.paa";
		FAVICON 	= "textures\Handy\Icons\Fav.mittelgross.1.0.paa";
		//Scroll oben 
		ICON1 		= "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
		ICON2 		= "textures\Handy\Icons\Fav.mittelgross.1.0.paa";
		ICON3 		= "textures\Handy\Icons\LRKleuchte.mittelgross.1.0.paa";
		ICON4 		= "textures\Handy\Icons\div\gruppe1.paa";	
		//Diverse
		ICON5 		= "textures\Handy\Icons\Messanger.mittelgross.1.0.paa";
		//Setting ON / OFF
		ICON6 		= "textures\Handy\Icons\On.mittelgross.1.0.paa";	
		ICON7 		= "textures\Handy\Icons\Off.mittelgross.256.1.0.paa";	
		//Diverse
	
	};
		
	class HG
	{
		HG0[] = {"","Ohne"};
		HG1[] = {"textures\Handy\HG\H\T1.H.t.paa","Frau"};
		HG2[] = {"textures\Handy\HG\H\T2.H.t.paa","Graffiti"};
		HG3[] = {"textures\Handy\HG\H\T3.H.t.paa","Joker"};
		HG4[] = {"textures\Handy\HG\H\T4.H.t.paa","Deadpool"};
		HG5[] = {"textures\Handy\HG\H\T5.H.t.paa","Tiger"};
		HG6[] = {"textures\Handy\HG\H\T6.H.t.paa","3D grün"};
		HG7[] = {"textures\Handy\HG\H\T7.H.t.paa","3D blau"};
		HG8[] = {"textures\Handy\HG\H\T8.H.t.paa","Eisenkarl"};
		HG9[] = {"textures\Handy\HG\H\T9.H.t.paa","Mustang"};
		
	};
	
	
	class Navi
	{
		IconArr[] = 
		{														
			{"icons\items\pickaxe.paa",								100}, 		
			{"icons\items\pickaxe.paa",								101}, 		
			{"textures\Handy\Icons\div\Rebellen1.paa",				102},			
			{"textures\Handy\Icons\div\Rebellen1.paa",				103},			
			{"\A3\ui_f\data\map\markers\nato\c_unknown.paa",		104},  			
			{"\A3\ui_f\data\map\markers\nato\c_unknown.paa",		105},  			
			{"\A3\ui_f\data\map\markers\nato\c_car.paa",			106},  			
			{"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		107},  			
			{"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			108},  			
			{"\A3\ui_f\data\map\markers\nato\o_air.paa",			109},  			
			{"\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa",		110},			
			{"textures\Handy\Icons\div\polizei1.paa",				111}, 			
			{"\A3\ui_f\data\map\mapcontrol\ruin_ca.paa",			112} 			
			
		};
		
		100[] = 
		{
			{"Farming Zivilisten",				"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},
			
			{"Ananasfeld",						"icons\items\ana.paa",									{4333.26,8487.53,0.00142932}	},			
			{"Konservenfabrik",					"icons\itemst\Icons_Tanoa4.paa",						{7363.17,7891.2,0.00139117}		},			
			{"Exportlager",						"icons\itemst\Icons_Tanoa4.paa",						{13509.3,12040.1,0.00143886}	},			
			{"",								"",														{0,0,0}	},
			
			//Müll		
			{"Recyclinghof",					"icons\items\ml.paa",									{8467.75,10184.7,0.00138855}	},
				
			{"Sandverladung",					"icons\items\sand.paa",									{13519.2,11766.5,0.00141525}	},			
			{"Glashuette",						"icons\items\glass.paa",								{6833.85,13355.9,0.00135517}	},
			{"Metall- und Glashändler",			"icons\items\glass.paa",								{7913.64,7684.68,0.00143862}	},
			{"",								"",														{0,0,0}	},
			
			{"Süßkartoffeln Flughafen",			"icons\itemst\Icons_Tanoa12.paa",						{6397.87,7230.02,0.00213099}	},			
			{"Süßkartoffeln Georgetown",		"icons\itemst\Icons_Tanoa12.paa",						{6458.93,10708.3,0.00183105}	},			
			{"Süßkartoffeln Harcourt",			"icons\itemst\Icons_Tanoa12.paa",						{11588.5,5238.73,0.00152397}	},
			{"",								"",														{0,0,0}	},
			
			//Metall
			{"Eisenmine",						"icons\items\iron_ore.paa",								{13958.9,10015.2,0.00144196}	},	
			{"Eisenschmiede",					"icons\items\iron.paa",									{10072.5,13526.3,0.00143886}	},			
			{"Kupfermine",						"icons\items\copper_ore.paa",							{13481.5,9583.87,0.00143433}	},	
			{"Kupferschmiede",					"icons\items\copper.paa",								{9917.9,13538.9,0.00139761}		},			
			{"Metall- und Glashändler",			"icons\items\iron.paa",									{7913.64,7682.88,0.00143862}	},				
			{"Schlosserei",						"icons\items\iron.paa",    								{11760.7,4109.92,0.00143433}	},						
			{"",								"",														{0,0,0}	},
				
			//Öl
			{"Ölfeld",							"icons\items\oil_unprocessed.paa",						{12503.9,2449.06,0.00219917}	},	
			{"Ölfeld",							"icons\items\oil_unprocessed.paa",						{12194.3,2962.43,0.00172186}	},	
			{"Ölraffenerie",					"icons\items\oil_processed.paa",						{7428.75,8558.67,0.00143909}	},	
			{"Ölhändler",						"icons\items\oil_processed.paa",						{14082.1,12207.6,0.00143886}	},		
			//{"Benzinlager / Treibstofflager",	"icons\items\oil_unprocessed.paa",						{15273.5,17568.8,0}	},			
			//{"Kerosinlager",					"icons\items\oil_unprocessed.paa",						{14953.3,17225.4,0}	},					
			{"",								"",														{0,0,0}	},
	
			//Gold/Silber
			{"Gold/Silber Tagebau",				"icons\items\gsg.paa",									{12300.6,10372.4,0.00143433}	},	
			{"Schürfanlage",					"icons\items\ggn.paa",									{4623.3,7964.33,0.00143909}		},			
			{"Juwelier",						"icons\items\ggn.paa",									{12826.3,4795,0.00137091}		},			
			{"Exportlager",						"icons\items\ggn.paa",									{13509.3,12040.1,0.00143886}	},
			//{"Münzpräger",						"icons\items\gm.paa",									{10479.5,17300.8,0}	},			
			//{"Münzhändler",						"icons\items\gm.paa",									{13795.6,6392.69,0}	},				
			{"",								"",														{0,0,0}	},
			
			//HOLZ
			{"Wald",							"icons\items\holz.paa",									{12445.7,3756,0.0196304}		},			
			{"Sägewerk",						"icons\items\holzv.paa",								{8912.1,11898.6,0.00131226}		},
			{"Leimabteilung",					"icons\items\leim.paa",									{9936.94,13526,0.00128484}		},
			{"Spanplattenfabrik",				"icons\items\spa.paa",									{9071.77,11251,0.00137329}		},
			{"Tischler",						"icons\items\holzv.paa",								{5525.74,11965.3,0.0164471}		},			
			{"LIKEA",							"icons\items\l_23.paa",									{9383.15,4017.68,0.00143862} 	},			
			{"",								"",														{0,0,0}	},			
			
			{"Palmenplantage",					"icons\itemst\Icons_Tanoa13.paa",						{11048,7952.21,0.0171051}		},			
			{"Palmölmühle",						"icons\itemst\Icons_Tanoa7.paa",						{13925,8307.92,0.00143909}		},	
			{"Exportlager",						"icons\itemst\Icons_Tanoa7.paa",						{13509.3,12040.1,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.8,7379.82,0.001297}		},	
			{"",								"",														{0,0,0}	},
			
			{"Kakaoplantage",					"icons\itemst\Icons_Tanoa3.paa",						{8236.82,12042.6,0.000274658}	},			
			{"Kakaorösterei",					"icons\itemst\Icons_Tanoa3.paa",						{5904.69,10880.3,-0.0017724}	},	
			{"Schokoladenmanufaktur",			"icons\itemst\Icons_Tanoa10.paa",						{8124.45,13394.6,0.00135708}	},	
			{"Exportlager",						"icons\itemst\Icons_Tanoa10.paa",						{13509.3,12040.1,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.8,7379.82,0.001297}		},	
			{"",								"",														{0,0,0}	},
			
			{"Salzabbau",						"icons\items\salt_unprocessed.paa",						{7578.95,6768.97,-0.583134}		},			
			{"Salzverarbeiter",					"icons\items\salt_unprocessed.paa",						{8678.86,13819.8,0.00143909}	},	
			{"Salzkontor",						"icons\items\salt_unprocessed.paa",						{13741.2,11773.5,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.8,7379.82,0.001297}		},	
			{"",								"",														{0,0,0}	},
	
			{"Steinbruch",						"icons\itemst\Marmor_1.paa",							{10805,8740.05,0.0142517}		},
			{"Steinmetz",						"icons\itemst\Marmor_2.paa",							{8158.08,12012.2,0.00151062}	},				
			{"Exportlager",						"icons\itemst\Marmor_2.paa",							{13509.3,12040.1,0.00143886}	},	
			{"",								"",														{0,0,0}	},

			{"Edelstein Tagebau",				"icons\items\gsg.paa",									{12114.6,10637.4,-0.000823975}	},
			{"Schürfanlage",					"icons\itemst\Icons_Tanoa8.paa",						{4623.3,7964.33,0.00143909}		},
			{"Juwelier",						"icons\itemst\Icons_Tanoa8.paa",						{12826.3,4795,0.00137091}		},			
			{"Exportlager",						"icons\itemst\Icons_Tanoa8.paa",						{13509.3,12040.1,0.00143886}	},				
			{"",								"",														{0,0,0}	},
			
			{"Zuckerrohr",						"icons\itemst\Icons_Tanoa14.paa",						{11097.2,9405.96,-0.00341034} 	},	
			{"Staatliche Brennerei",			"icons\itemst\Icons_Tanoa9.paa",						{8349.54,10337,0.00140381}		},					
			{"Exportlager",						"icons\itemst\Icons_Tanoa9.paa",						{13509.3,12040.1,0.00143886} 	},
			{"",								"",														{0,0,0}	},
			
			{"Bananenplantage",					"icons\itemst\Bannnana.paa",							{12635.7,7858.31,0.0103798} 	},
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.8,7379.82,0.001297}		},
			
			{"Schwefelmine",					"icons\items\c_3.paa",									{9957.6,12104.1,-0.0198669} 	},
			{"Waffenherstellung",				"icons\items\c_2.paa",									{7295.42,12833.6,0.00144958}	}
		};
		
					//Gefühlt werde ich mit der Scheiße hier nie fertig! Kommt immer was anderes zwischen oder es tun sich neue Baustellen auf! -.-
					
		101[] = 
		{
		
			{"Farming Ureinwohner",				"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},
			
			{"Kokosnüsse",						"icons\itemst\Icons_Tanoa4.paa",						{2599.87,9310.61,0.0215836}		},
			{"Kokosnüsse",						"icons\itemst\Icons_Tanoa4.paa",						{5476.95,3629.6,0.0112076}		},
			{"Dorfältester",					"icons\itemst\Icons_Tanoa4.paa",						{2653.27,9253.36,0.00264788}	},
			{"Dorfältester",					"icons\itemst\Icons_Tanoa4.paa",						{5703.39,4176.55,0.00143909}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Nationalpark",					"icons\items\spa.paa",									{2292.81,2750.19,-0.0111694} 	},				
			{"Kürschner",						"icons\items\goafp.paa",								{1369.62,8076.86,0.00143909}	},			
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.4,7380.02,0.00130081}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},		
			{"",								"",														{0,0,0}	},
			
			{"Recyclinghof",					"icons\items\ml.paa",									{8467.75,10184.7,0.00138855}	},
			{"",								"",														{0,0,0}	},
			
			{"Schildkrötenjagdgebiet",			"icons\items\turtle.paa",								{3282.22,4269.5,-24.4726}		},			
			{"Schildkrötenschlachter",			"icons\items\turtle.paa",								{1713.68,6066.68,0.00143886}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.4,7380.02,0.00130081}	},
			{"",								"",														{0,0,0}	},
			
			{"Stockfisch",						"icons\items\fish.paa",									{2686.44,9356.82,0.00143862}	},			
			{"Stockfisch",						"icons\items\fish.paa",									{5711.7,4089.17,0.00143957}		},			
			{"Dorfältester",					"icons\items\fish.paa",									{2653.27,9253.36,0.00264788}	},
			{"Dorfältester",					"icons\items\fish.paa",									{5703.39,4176.55,0.00143909}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.4,7380.02,0.00130081}	},
			{"",								"",														{0,0,0}	},
			
			{"Mariuhanna",						"icons\items\cannabis.paa",								{3844.87,9627.65,0.00924397}	},			
			{"Medizinmann",						"icons\items\cannabis.paa",								{992.271,11180,0.00143862}		},
			{"Dorfältester",					"icons\items\cannabis.paa",								{2653.27,9253.36,0.00264788}	},
			{"Dorfältester",					"icons\items\cannabis.paa",								{5703.39,4176.55,0.00143909}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Kokapflanzen",					"icons\items\cocain_processed.paa",						{2509.84,7887.64,0.00126362}	},			
			{"Medizinmann",						"icons\items\cocain_processed.paa",						{992.734,11180.5,0.00143814}	},
			{"Dorfältester",					"icons\items\cocain_processed.paa",						{2653.27,9253.36,0.00264788}	},
			{"Dorfältester",					"icons\items\cocain_processed.paa",						{5703.39,4176.55,0.00143909}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Kautschuk",						"icons\itemst\Kautsch.paa",								{8265.7,1482.98,0.000927448}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Lavagestein",						"icons\itemst\Lavagestein.paa",							{3649.29,3013.9,0.00322723}		},
			{"Lavafiguren",						"icons\itemst\Lavasteinfigur.paa",						{9325.98,6029.68,0.00143898}	},
			{"Handelsposten",					"icons\itemst\Lavasteinfigur.paa",						{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Kaffee",							"icons\itemst\Kafferoh.paa",							{4022.09,9071.47,-0.00217938}	},
			{"Kaffeerösterei",					"icons\itemst\Kaffefertig.paa",							{671.604,11244.6,0.00143909}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Wertstoffe",						"icons\items\ml.paa",									{3745.66,9358.34,-0.00158596}	},
			{"Wertstoffe",						"icons\items\ml.paa",									{2581.21,8911.18,0.00380707}	},
			{"Dorfältester",					"icons\itemst\Icons_Tanoa2_0_2.paa",					{2653.27,9253.36,0.00264788}	},
			{"Dorfältester",					"icons\itemst\Icons_Tanoa2_0_2.paa",					{5703.39,4176.55,0.00143909}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"Metall- und Glashändler",			"icons\items\iron.paa",									{7913.64,7682.88,0.00143862}	},
			{"Exportlager",						"icons\itemst\Icons_Tanoa10.paa",						{13509.3,12040.1,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.8,7379.82,0.001297}		},	
			{"Salzkontor",						"icons\items\salt_unprocessed.paa",						{13741.2,11773.5,0.00143886}	},	
			{"",								"",														{0,0,0}	},
			
			{"Mariuhanna",						"icons\items\cannabis.paa",								{3844.87,9627.65,0.00924397}	},			
			{"Kokapflanzen",					"icons\items\cocain_processed.paa",						{2509.84,7887.64,0.00126362}	},			
			{"Tee",								"icons\itemst\tee.paa",									{9147.75,8734.45,0.00883484}	},
			{"Naturheilkräuter",				"icons\itemst\Kraut.paa",								{2940.32,9016.93,-0.00969315}	},
			{"Medizinmann",						"icons\itemst\tee.paa",									{992.734,11180.5,0.00143814}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Korallenriff",					"icons\itemst\Koralle.paa",								{6353.9,14702.1,-1.42082}		},
			{"Souvenirhersteller",				"icons\itemst\souvenir.paa",							{6565.11,6185.99,0.00143886}	},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Perlenriff",						"icons\itemst\Perlen.paa",								{9890.9,14606,-1.5541}			},
			{"Perlenketten",					"icons\itemst\Perlenkette.paa",							{1794.62,1047.83,0.002599}		},
			{"Handelsposten",					"icons\items\storagebig.paa",							{6038.57,7354.22,0.00143886}	},
			{"",								"",														{0,0,0}	}

			
					//Zoran hier weiter gemacht
		};

		102[] = 
		{
			
			//Drogen
			{"Farming Guerilla",				"",														{0,0,0}							},
			{"",								"",														{0,0,0}							},
			{"",								"",														{0,0,0}							},
			
			
			
			{"Frösche",							"icons\items\lsdf.paa",									{836.099,7470.63,-0.112024}		},
			{"Drogenküche",						"icons\items\lsdf.paa",									{5329.2,14532.2,-0.0032196}		},			
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},			
			{"",								"",														{0,0,0}	},
			
			{"Kokain strecken",					"icons\items\cocain_processed.paa",						{0,0,0}},	
			{"Handelsposten",					"icons\items\cocain_processed.paa",						{24714.7,22313.3,0}				},	
			{"Apotheke",						"textures\Handy\Icons\div\apotheke1.paa",				{10332.3,2682.93,0.00147986}	},			
			{"Drogenküche",						"icons\items\cocain_processed.paa",						{5329.2,14532.2,-0.0032196}		},			
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Heroinfeld",						"icons\items\heroin_processed.paa",						{14520.8,9989.66,0.0029335}		},			
			{"Apotheke",						"textures\Handy\Icons\div\apotheke1.paa",				{10332.3,2682.93,0.00147986}	},			
			{"Drogenküche",						"icons\items\heroin_processed.paa",						{5329.2,14532.2,-0.0032196}		},			
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},
			{"",								"",														{0,0,0}	},
			
			{"Apotheke",						"textures\Handy\Icons\div\apotheke1.paa",				{10332.3,2682.93,0.00147986}	},			
			{"Drogenküche",						"icons\items\cmu.paa",									{5329.2,14532.2,-0.0032196}		},					
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},	
			{"",								"",														{0,0,0}	},
			
			{"Tropenholz",						"icons\items\holz.paa",									{[8494.47,1238.76,0.0264015]}	},		
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},
			{"",								"",														{0,0,0}							},
			
			{"Tropenholz",						"icons\items\holz.paa",									{[8494.47,1238.76,0.0264015]}	},		
			{"Sägewerk",						"icons\items\holzv.paa",								{8912.1,11898.6,0.00131226}		},
			{"Leimabteilung",					"icons\items\leim.paa",									{9936.94,13526,0.00128484}		},
			{"Spanplattenfabrik",				"icons\items\spa.paa",									{9071.77,11251,0.00137329}		},
			{"Tischler",						"icons\items\holzv.paa",								{5525.74,11965.3,0.0164471}		},			
			{"LIKEA",							"icons\items\l_23.paa",									{9383.15,4017.68,0.00143862} 	},
			{"",								"",														{0,0,0}							},
			
			{"Schildkröteneier",				"icons\items\turtle.paa",								{2750.24,3812.38,0.000594854}	},
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},	
			{"Gourmetrestaurant",				"icons\itemst\Icons_Tanoa11.paa",						{12850.4,7380.02,0.00130081}	},		
			
			{"Mariuhanna strecken",				"icons\items\cannabis.paa",								{0,0,0}							},	
			{"Handelsposten",					"icons\items\cannabis.paa",								{24714.7,22313.3,0}				},	
			{"Apotheke",						"textures\Handy\Icons\div\apotheke1.paa",				{10332.3,2682.93,0.00147986}	},			
			{"Drogenküche",						"icons\items\cannabis.paa",								{5329.2,14532.2,-0.0032196}		},			
			{"Schmuggler",						"textures\Handy\Icons\div\Rebellen1.paa",				{13578.6,12014.2,0.00143886}	},
			{"",								"",														{0,0,0}							},

			{"Eisenmine",						"icons\items\iron_ore.paa",								{13958.9,10015.2,0.00144196}	},	
			{"Eisenschmiede",					"icons\items\iron.paa",									{10072.5,13526.3,0.00143886}	},			
			{"Kupfermine",						"icons\items\copper_ore.paa",							{13481.5,9583.87,0.00143433}	},	
			{"Kupferschmiede",					"icons\items\copper.paa",								{9917.9,13538.9,0.00139761}		},
			{"Waffenteile",						"icons\items\c_2.paa",									{7295.42,12833.6,0.00144958}	},	
			{"Waffenschmuggler",				"textures\Handy\Icons\div\Rebellen1.paa",				{3764.19,14035.5,-0.000382423}	},			
			{"",								"",														{0,0,0}							},
			
			{"Eisenmine",						"icons\items\iron_ore.paa",								{13958.9,10015.2,0.00144196}	},	
			{"Eisenschmiede",					"icons\items\iron.paa",									{10072.5,13526.3,0.00143886}	},			
			{"Kupfermine",						"icons\items\copper_ore.paa",							{13481.5,9583.87,0.00143433}	},	
			{"Kupferschmiede",					"icons\items\copper.paa",								{9917.9,13538.9,0.00139761}		},
			{"Salpeter",						"icons\items\c_4.paa",									{13741.2,11773.5,0.00143886}	},
			{"Schwefel",						"icons\items\c_3.paa",									{9957.6,12104.1,-0.0198669}		},
			{"Munitionskisten",					"icons\itemst\Icons_Tanoa6.paa",						{7295.42,12833.6,0.00144958}	},
			{"Waffenschmuggler",				"textures\Handy\Icons\div\Rebellen1.paa",				{3764.19,14035.5,-0.000382423}	},			
			{"",								"",														{0,0,0}							}
			
		};
		
		103[] =
		{
			
		
			{"Guerilla Infrastruktur",			"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},
			
			{"Guerilla HQ",						"textures\Handy\Icons\div\Rebellen1.paa",				{2347.33,13132.7,0.00143909}	},			
			{"Guerilla AIR Shop",				"textures\Handy\Icons\div\Rebellen1.paa",				{2397.94,13357.3,0.00319195}	},			
			{"Guerilla AIR Garage",				"textures\Handy\Icons\div\Rebellen1.paa",				{2397.94,13357.3,0.00319195}	},		
			{"Guerilla Car Shop",				"textures\Handy\Icons\div\Rebellen1.paa",				{2333.87,13283.8,0.00209427}	},			
			{"Guerilla Bootshändler",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{3127.78,11021.1,0.00206387}	},			
			{"",								"",														{0,0,0}	},
			
			{"Lizenzhändler",					"textures\Handy\Icons\div\Rebellen1.paa",				{3066.94,11190.4,0.0013752}		},			
			{"",								"",														{0,0,0}	},
			
			{"Guerilla Tooltime",				"textures\Handy\Icons\div\Shop1.paa",					{3046.85,11142.2,0.00143814}	},			
			{"Guerilla Kiosk",					"textures\Handy\Icons\div\Shop1.paa",					{3055.64,11122.7,0.00150776}	},			
			{"Outdoor Shop",					"icons\items\l_23.paa",									{3067.63,11190.6,0.00150299}	},			
			{"Guerilla Tauchladen",				"textures\Handy\Icons\div\taucher1.paa",				{3048.82,11149.8,0.00143814}	},			
			{"",								"",														{0,0,0}	}		

			
		};
		
				//Notiz an mich: Bei Fehlern die Beschwerden bitte an Hirschi richten!!!
		
		104[] = 
		{
			{"CIV Shops",						"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},
			
			{"Bootshändler Georgetown",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{5607.96,10401.8,0}	},
			{"Bootshändler Lijnhaven",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{11606.4,2506.04,0}	},				
			{"",								"",														{0,0,0}	},		
			
			{"Bootsgarage Harcourt",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{11267.9,5366.02,0} },		
			{"Bootsgarage Ouméré",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{12946.5,7317.08,0} },		
			{"Bootsgarage La Rochelle",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{9518.01,13702.1,0} },
			{"Bootsgarage Lijnhaven",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{11606.4,2506.04,0}	},

			{"Tauchladen Georgetown",			"textures\Handy\Icons\div\taucher1.paa",				{5655.56,10338.5,0}	},	
			{"Tauchladen Neochori",				"textures\Handy\Icons\div\taucher1.paa",				{11850.2,13615.5,0}	},	
			{"",								"",														{0,0,0}	},		
			
			{"Kiosk Airfield",					"textures\Handy\Icons\div\Shop1.paa",					{6884.55,7328.18,0.00143886}	},	
			{"Kiosk Georgetown",				"textures\Handy\Icons\div\Shop1.paa",					{5977.89,10302.7,0.00144196}	},	
			{"Kiosk Harcourt",					"textures\Handy\Icons\div\Shop1.paa",					{11216.1,5247.72,0.00143886}	},	
			{"Kiosk Lijnhaven",					"textures\Handy\Icons\div\Shop1.paa",					{11765.9,2620.89,0.00143981}	},	
			{"",								"",														{0,0,0}	},		

			{"Kleidung Airfield",				"textures\Handy\Icons\div\Shop1.paa",					{6798.6,7417.47,0}				},
			{"Kleidung Georgetown",				"textures\Handy\Icons\div\Shop1.paa",					{5717.04,9963.23,0.00143862}	},
			{"Kleidung Harcourt",				"textures\Handy\Icons\div\Shop1.paa",					{11283.3,5233.69,0.00144792}	},
			{"Kleidung La Rochelle",			"textures\Handy\Icons\div\Shop1.paa",					{9423.66,13595.1,0.00143886}	},
			{"Kleidung Lijnhaven",				"textures\Handy\Icons\div\Shop1.paa",					{11747.9,2624.39,0.00143719}	},
			{"Kleidung Ouméré",					"textures\Handy\Icons\div\Shop1.paa",					{12939.2,7372.59,0.00143838}	},
			{"",								"",														{0,0,0}	},		

			{"Lizenzamt Georgetown",			"textures\Handy\Icons\LRKleuchte.mittelgross.1.0.paa",	{5696.55,10413.2,0.00143814}	},
			{"",								"",														{0,0,0}	},		
			
			{"Supermarkt Georgetown",			"textures\Handy\Icons\div\Shop1.paa",					{5772.68,10342.2,0.00143862}	},
			{"Supermarkt Harcourt",				"textures\Handy\Icons\div\Shop1.paa",					{11212.4,5283.66,0.00143933}	},
			{"Supermarkt La Rochelle",			"textures\Handy\Icons\div\Shop1.paa",					{9785.25,13515.2,0.00143933}	},	
			{"",								"",														{0,0,0}	},		
	
			{"Outdoor Shop Georgetown",			"icons\items\l_23.paa",									{5738.85,10251.3,0.00143814}	},		
			{"Outdoor Shop Kotomo",				"icons\items\l_23.paa",									{10901.7,6352.44,0.00144005}	},
			{"Outdoor Shop La Rochelle",		"icons\items\l_23.paa",									{9698.42,13542.9,0.00130963}	},
			{"Outdoor Shop Lijnhaven",			"icons\items\l_23.paa",									{11547.5,2574.62,0.0014503}		},
			{"Outdoor Shop Ouméré",				"icons\items\l_23.paa",									{12826.8,7307.93,0.00145674}	},
			{"Outdoor Shop Tanouka",			"icons\items\l_23.paa",									{8896.46,10208.2,0.00143814}	},		
			{"",								"",														{0,0,0}	},		
	
			{"Waffenladen Regina",				"textures\Handy\Icons\div\waffenshop1.paa",				{5055.9,8660.17,0}				},	
			{"",								"",														{0,0,0}	}
			
		};
		
				//Ab hier wieder fehlerfrei xD
		
		105[] = 
		{
			{"Ureinwohner Shops",				"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},
			
			{"Bootshändler Katkoula",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{5669.34,3932.77,0.00143981}	},
			{"Bootshändler Sosovu",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{2666.41,9415,0.00143933}		},
			{"",								"",														{0,0,0}	},		
			
			{"Tauchladen Neochori",				"textures\Handy\Icons\div\taucher1.paa",				{5519.92,3971.11,0.00149345}	},
			{"Tauchladen Sosovu",				"textures\Handy\Icons\div\taucher1.paa",				{2651.73,9332,0.00143957}		},	
			{"",								"",														{0,0,0}	},		
			
			{"Dorfältester Katkoula",			"textures\Handy\Icons\div\Shop1.paa",					{5703.56,4177.07,0.00143862}	},
			{"Dorfältester Sosovu",				"textures\Handy\Icons\div\Shop1.paa",					{2653.27,9253.31,0.00247145}	},	
			{"",								"",														{0,0,0}	},		
			
			{"Kleidung Katkoula",				"textures\Handy\Icons\div\Shop1.paa",					{5433.31,3980.55,0.00139856}	},
			{"Kleidung Sosovu",					"textures\Handy\Icons\div\Shop1.paa",					{2660.68,9294.24,0.00143957}	},
			{"",								"",														{0,0,0}	},		

			{"Dorfältester Katkoula",			"textures\Handy\Icons\LRKleuchte.mittelgross.1.0.paa",	{5703.56,4177.07,0.00143862}	},
			{"Dorfältester Sosovu",				"textures\Handy\Icons\LRKleuchte.mittelgross.1.0.paa",	{2653.27,9253.31,0.00247145}	},
			{"",								"",														{0,0,0}	},		
			
			{"Stammesbedarf Katkoula",			"textures\Handy\Icons\div\Shop1.paa",					{5582.71,4165.55,0.00147629}	},
			{"Stammesbedarf Sosovu",			"textures\Handy\Icons\div\Shop1.paa",					{2672.7,9262.03,0.00140476}		},
			{"",								"",														{0,0,0}	},		
			
			{"Rituelle Jagdkleidung",			"icons\items\l_23.paa",									{5445.12,4093.13,0.0014205}		},
			{"Rituelle Jagdkleidung",			"icons\items\l_23.paa",									{2630.32,9336.78,0.00143814}	},		
			{"",								"",														{0,0,0}	},		
	
			{"Waffenladen Rautake",				"textures\Handy\Icons\div\waffenshop1.paa",				{3344.28,6593.33,0.00143814}	},	
			{"",								"",														{0,0,0}	}			
	
			
		};

		106[] = 
		{
			{"Fahrzeuge",						"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},		

			{"Autohändler Airfield",			"\A3\ui_f\data\map\markers\nato\c_car.paa",				{6848.66,7489.27,0.00143909}	},	
			{"Autohändler Georgetown",			"\A3\ui_f\data\map\markers\nato\c_car.paa",				{5711.45,10540.1,0.00147104}	},	
			{"Autohändler Katkoula",			"\A3\ui_f\data\map\markers\nato\c_car.paa",				{5638.8,4049.65,0.00146389}		},	
			{"",								"",														{0,0,0}	},

			{"Air Garage Airfield",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{6920.48,7373.38,0.00143886}	},
			{"Air Garage La Rochelle",			"\A3\ui_f\data\map\markers\nato\o_air.paa",				{11809.3,13059.9,0.00143862}	},
			{"Air Garage Saint George",			"\A3\ui_f\data\map\markers\nato\o_air.paa",				{11726,3020.17,0.00143909}		},
			{"Air Garage Bala",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{2153.77,3419.49,0.00143909}	},
			{"Air Garage Tuvanaka",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{2397.67,13358.1,0.000884056}	},
			{"",								"",														{0,0,0}	},
			
			{"Boot Spawn Georgetown",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{5598.21,10382.2,-3.94603}		},		
			{"Boot Spawn La Rochelle",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{9521.9,13710.4,-7.12286}		},	
			{"Boot Spawn Oumere",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{12963.1,7324.36,-1.29584}		},	
			{"Boot Spawn Harcourt",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{11258.2,5354.73,-5.16125}		},	
			{"Boot Spawn Lijnhaven",			"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{12963.1,7324.36,-1.29584}		},	
			{"Boot Spawn Katkoula",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{5668.28,3925.78,-8.95128}		},	
			{"Boot Spawn Sosovu",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{2653.38,9410.26,-1.13819}		},	
			{"Boot Spawn Belfort",				"\A3\ui_f\data\map\markers\nato\c_ship.paa",			{3145.02,10993.8,-5.03293}		},	
			{"",								"",														{0,0,0}	},
			
			{"Cargo Shop Airfield",				"\A3\ui_f\data\map\markers\nato\respawn_unknown_ca.paa", {6804.28,7368.2,0.0022788}		},	
			{"Cargo Shop Blue Pearl",			"\A3\ui_f\data\map\markers\nato\respawn_unknown_ca.paa", {13335.5,12389.4,0.001438}		},
			{"",								"",														{0,0,0}	},
			
			{"Chop Shop Rereki",				"\A3\ui_f\data\map\markers\nato\o_armor.paa",			{13005.3,2125.62,0.00519609}	},	
			{"",								"",														{0,0,0}	},
			
			{"Garage Georgetown",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{5825.04,10856.2,0.00143909}	},
			{"Garage Tanouka",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{8953.58,10194.4,0.00149155}	},
			{"Garage La Rochelle",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{9518.49,13577.2,0.00101399}	},
			{"Garage Ouméré",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{12958.7,7357.22,0.00143909}	},
			{"Garage Harcourt",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{11301,5304.01,0.00143886}		},
			{"Garage Lijnhaven",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{11549.3,2633.55,0.00874591}	},
			{"Garage Katkoula",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{5507.32,4129.19,-0.00287843}	},
			{"Garage Belfort",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{2334.02,13284.6,-0.000348091}	},
			{"",								"",														{0,0,0}	},
			
			{"Go-Kart Händler",					"\A3\ui_f\data\map\mapcontrol\power_ca.paa",			{5709.95,10540.1,0.001472}		},	
			{"",								"",														{0,0,0}	},
			
			{"Heli & Flugzeug Shop",			"\A3\ui_f\data\map\markers\nato\o_air.paa",				{6903.86,7450.56,0.00143886}	},
			{"Ureinwohner AIR Shop",			"\A3\ui_f\data\map\markers\nato\o_air.paa",				{2154.57,3419.33,0.00143909}	},
			{"",								"",														{0,0,0}	},
			
			{"Lackierer Georgetown",			"\A3\ui_f\data\map\markers\nato\o_unknown.paa",			{5714.89,11265,0.00168514}		},	
			{"Lackierer La Rochelle",			"\A3\ui_f\data\map\markers\nato\o_unknown.paa",			{9947.81,13455,0.00140071}		},				
			{"Lackierer Harcourt",				"\A3\ui_f\data\map\markers\nato\o_unknown.paa",			{11176.4,5148.73,0.00141954}	},			
			{"",								"",														{0,0,0}	},
			
			{"LKW Händler Tanouka",				"\A3\ui_f\data\map\markers\nato\c_car.paa",				{9178.91,10155.4,0.00179482}	},	
			{"LKW Händler Katkoula",			"\A3\ui_f\data\map\markers\nato\c_car.paa",				{5638.8,4049.65,0.00146389}		},			
			{"",								"",														{0,0,0}	},
			
			{"Verwahrstelle Airfield",			"\A3\ui_f\data\map\Markers\Military\arrow2_ca.paa",		{5098.69,8735.6,0.00245452}		},			
			{"",								"",														{0,0,0}	}
			
		};	
		107[] = 
		{
			{"Tankstellen",						"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},		
			
			{"Tankstelle Airfield",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{6886.92,7490.57,0.00143886}	},			
			{"",								"",														{0,0,0}	},	
			
			{"Tankstelle Balavu",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{2462.46,7430.23,0.0919838}		},			
			{"Tankstelle Belfort",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{3029.68,11315.3,-0.000562668}	},
			{"Tankstelle Blue Pearl",			"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{14263,11511.2,0.00249481}		},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Galili",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{9956.41,13475.5,0.00143862}	},
			{"Tankstelle Georgetown Süd",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5406.47,9909.61,0.00143862}	},			
			{"Tankstelle Georgetown Zentral",	"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5681.99,10173.8,0.00143886}	},			
			{"Tankstelle Georgetown Nord",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5801.09,10822.1,0.00143862}	},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Harcourt",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{11150.8,5152.11,0.00163889}	},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Katkoula West",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5384.37,4088.49,0.00325036}	},			
			{"Tankstelle Katkoula Ost",			"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5776.96,4231.75,0.00143862}	},	
			{"Tankstelle Kotomo",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{10825.9,6490.17,0.0789611}		},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Lami",					"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{7977.17,7422.54,0.00594091}	},			
			{"Tankstelle La Rochelle Airfield",	"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{11627.9,13053.3,0.00140095}	},
			{"Tankstelle La Rochelle West",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{8954.32,13678.7,0.00143909}	},			
			{"Tankstelle La Rochelle Ost",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{9956.41,13475.5,0.00143862}	},	
			{"Tankstelle Lifou",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{7364.23,8000.54,0.000872374}	},	
			{"Tankstelle Lijnhaven",			"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{11636.5,2993.87,0.00171995}	},			
			{"Tankstelle Lijnhaven Süd",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{11691.8,2266.6,0.00143862}		},	
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Nandai",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{14366,8743.51,-0.000294685}	},
			{"Tankstelle Nicolet",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{6595.9,13080.9,0.00143814}		},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Ouméré",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{12616,7585.74,0.00115013}		},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Qua-Oué",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5594.45,12509.1,0.0963612}		},	
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Regina",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{5173.98,8807.12,0.00707483}	},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Tanouka",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{8969.49,10333.1,0.00143814}	},			
			{"Tankstelle Tanouka Süd",			"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{8319.4,9710.78,0.0422821}		},	
			{"Tankstelle Tuvanaka",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{1869.24,12122,0.0019927}		},
			{"",								"",														{0,0,0}	},
			
			{"Tankstelle Vagalala",				"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",		{10937.8,9855.9,0.00348663}		},			
			{"",								"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},		

			
			{"Tankstellen Shop Balavu",			"textures\Handy\Icons\div\tankstellenshop1.paa",		{2453.33,7449.03,0.00143909}	},
			{"Tankstellen Shop Galili",			"textures\Handy\Icons\div\tankstellenshop1.paa",		{8508.15,12432.5,0.00144958}	},
			{"Tankstellen Shop Kotomo",			"textures\Handy\Icons\div\tankstellenshop1.paa",		{10814.1,6478.39,0.00143862}	},
			{"Tankstellen Shop Lifou",			"textures\Handy\Icons\div\tankstellenshop1.paa",		{7380.39,7997.13,0.00137401}	},			
			{"Tankstellen Shop Lijnhaven",		"textures\Handy\Icons\div\tankstellenshop1.paa",		{11626.7,2980.47,0.00143862}	},
			{"Tankstellen Shop Tanouka",		"textures\Handy\Icons\div\tankstellenshop1.paa",		{8951.48,10337.4,0.00143814}	},
			{"Tankstellen Shop Tuvanaka",		"textures\Handy\Icons\div\tankstellenshop1.paa",		{1857.72,12097.8,-0.00221395}	},			
			{"Tankstellen Shop Vagalala",		"textures\Handy\Icons\div\tankstellenshop1.paa",		{10942.3,9872.47,0.00144196}	},
			{"",								"",														{0,0,0}	},
			{"",								"",														{0,0,0}	},		

			{"Heli Tankstelle Airfield",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",  	{7038.9,7447.79,0.00143814}		},			
			{"Heli Tankstelle La Rochelle",		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",  	{11576.4,13159.8,0.00143909}	},			
			{"Heli Tankstelle Saint George",	"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",  	{11674.3,3064.04,0.00143862}	},			
			{"Heli Tankstelle Bala",			"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa",  	{2118.25,3444.22,0.00143909}	},			
			{"Heli Tankstelle Tuvanaka",		"textures\Handy\Icons\div\Rebellen1.paa",				{2186.46,13333.6,0.00143909}	}			
			
		};
		108[] = 
		{
			{"ATM´s",							"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},		
			
			{"ATM Airfield Hauptgebäude",		"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{6896.25,7380.85,0.00143814}	},	
			{"ATM Belfort",						"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{3078.43,11107.8,-0.00124931}	},				
			{"ATM Georgetown Süd",				"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{5703.89,9933.63,0.00143862}	},			
			{"ATM Harcourt",					"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{11264,5231.59,0.00148964}		},				
			{"ATM La Rochelle Ost",				"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{9967.52,13459.3,0.00143886}	},
			{"ATM Lijnhaven",					"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{11657.8,2720.93,0.0015378}		},			
			{"ATM Ouméré",						"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{12891.4,7360.76,0.00170898}	},			
			{"ATM Regina",						"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{5073.21,8639.21,0.0645974}		},			
			{"ATM Tanouka",						"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{8903.07,10158.1,0.00613976}	},			
			{"ATM Tuvanaka",					"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{2289.02,13233.1,0.00134277}	},	
			{"",								"",														{0,0,0}	},
			
			{"Bank Georgetown Central",			"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{5820.9,10513.7,0.00141764}		},			
			{"Bank Katkoula",					"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{5456.54,4050.91,0.0010736}		},
			{"Bank La Rochelle",				"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa",			{9683.54,13500.8,0.00181103}	},
			{"",								"",														{0,0,0}	}
		
		
		};
		109[] = 
		{
			{"Heli-Taxen",						"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},		
			{"Heli-Taxi Airfield",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{6977.46,7400.28,0.00143886}	},
			{"Heli-Taxi Bala",					"\A3\ui_f\data\map\markers\nato\o_air.paa",				{2056.17,3434.79,0.00167847}	},
			{"Heli-Taxi La Rochelle",			"\A3\ui_f\data\map\markers\nato\o_air.paa",				{11694.1,13122.5,0.00143862}	},
			{"Heli-Taxi Saint George",			"\A3\ui_f\data\map\markers\nato\o_air.paa",				{11721.9,3112.22,0.00143862}	},			
			{"Heli-Taxi Tuvanaka",				"\A3\ui_f\data\map\markers\nato\o_air.paa",				{2151.33,13347.5,0.00143909}	}			
			
			
			
			
			
		};
		110[] = 
		{
			{"Liga News",						"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},		
			
			{"Liga News Georgetown",			"\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa",		{6008.95,10420.1,0.00143814}	}		
			
		};
		111[] = 
		{
			{"Dienste",							"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},		
			
			{"Polizei HQ",						"textures\Handy\Icons\div\polizei1.paa",				{5644.92,11023.7,0.00143886}	},			
			{"",								"",														{0,0,0}	},		

			{"LRK HQ",							"textures\Handy\Icons\div\medic.paa",					{5888.22,10276.6,0.00143909}	},			
			{"",								"",														{0,0,0}	},
			
			{"ALAC HQ",							"textures\Handy\Icons\div\alac1.paa",					{6006.27,10172.2,0.00143909}	},			
			{"",								"",														{0,0,0}	},		

			{"Ligatraz Staatsgefängnis",		"textures\Handy\Icons\div\polizei1.paa",				{12099.7,2476.43,0.00148511}	}			
			
		};
		112[] = 
		{
			{"Sehenswürdigkeiten ",				"",														{0,0,0}	},			
			{"",								"",														{0,0,0}	},	

			
			{"Tempelruinen",					"\A3\ui_f\data\map\mapcontrol\ruin_ca.paa",				{11063.2,8474.55,0.205307}		},			
			{"",								"",														{0,0,0}	},
			
			{"Quarantänezone",					"\A3\ui_f\data\map\mapcontrol\ruin_ca.paa",				{12691,14071.3,0.0127296}		},
			{"",								"",														{0,0,0}	}		
			
		};
		
	};
	class EMS 
	{
		IconArr[] = 
		{														
			{"textures\Handy\Icons\Polizei.leuchte.mittelgross.1.0.paa",-1}, 	//Pol	
			{"textures\Handy\Icons\LRKleuchte.mittelgross.1.0.paa",-2},  		//LRK	
			{"textures\Handy\Icons\ALAC.leuchte.mittelgross.1.0.paa",-3},		//ALAC
			{"",999},		
			{"textures\Handy\Icons\div\Admin1.paa",-4},							//ADMIN				
			{"textures\Handy\Icons\Nottrufmessanger.mittelgross.1.0.paa",-5}	//Voice			
		};			
	};	
	
	class Settings 
	{
		SettingONOFF1[] = {"Wetter Widget","WETTWIDG"};
		
		SettingHMArr[] = 
		{
			{"Anzeige","Anzeigeneinstellungen","textures\Handy\Icons\Eisntellungen.mittelgross.1.0.paa"},
			{"","<<<<< HandyInfo >>>>>",""},
			//{"<<<<< HandyInfo >>>>>","",""},
			{"Firmware","L.I.G.A - OS # VER: 0.03 Alpha",""},
			{"TS3","ts3.Liga-Life.de",""},
			{"Homepage","Liga-Life.de",""},
			{"Forum","Liga-Life.de/Forum/",""},
			{"Developed by","Die Liga Team",""},
			{"Grafiken & Designs","Baskid - Die Liga",""},
			{"Scripting & Technische Umsetzung","Zoran & Hirschi - Die Liga",""}			
		};		
	};
	
	class LigaHandyFNCs
	{
		1  = "Liga\LigaHandy\fnc\LigaHandyFNC01.sqf";
		2  = "Liga\LigaHandy\fnc\LigaHandyFNC02.sqf";
		3  = "Liga\LigaHandy\fnc\LigaHandyFNC03.sqf";
		4  = "Liga\LigaHandy\fnc\LigaHandyFNC04.sqf";
		5  = "Liga\LigaHandy\fnc\LigaHandyFNC05.sqf";
		6  = "Liga\LigaHandy\fnc\LigaHandyFNC06.sqf";
		7  = "Liga\LigaHandy\fnc\LigaHandyFNC07.sqf";
		8  = "Liga\LigaHandy\fnc\LigaHandyFNC08.sqf";
		9  = "Liga\LigaHandy\fnc\LigaHandyFNC09.sqf";
		10 = "Liga\LigaHandy\fnc\LigaHandyFNC10.sqf";
		11 = "Liga\LigaHandy\fnc\LigaHandyFNC11.sqf";
		12 = "Liga\LigaHandy\fnc\LigaHandyFNC12.sqf";
		13 = "Liga\LigaHandy\fnc\LigaHandyFNC13.sqf";
		14 = "Liga\LigaHandy\fnc\LigaHandyFNC14.sqf";
		15 = "Liga\LigaHandy\fnc\LigaHandyFNC15.sqf";
		16 = "Liga\LigaHandy\fnc\LigaHandyFNC16.sqf";
		17 = "Liga\LigaHandy\fnc\LigaHandyFNC17.sqf";
		18 = "Liga\LigaHandy\fnc\LigaHandyFNC18.sqf";
		19 = "Liga\LigaHandy\fnc\LigaHandyFNC19.sqf";
		20 = "Liga\LigaHandy\fnc\LigaHandyFNC20.sqf";
		21 = "Liga\LigaHandy\fnc\LigaHandyFNC21.sqf";
		22 = "Liga\LigaHandy\fnc\LigaHandyFNC22.sqf";
		23 = "Liga\LigaHandy\fnc\LigaHandyFNC23.sqf";
		24 = "Liga\LigaHandy\fnc\LigaHandyFNC24.sqf";
		25 = "Liga\LigaHandy\fnc\LigaHandyFNC25.sqf";
		26 = "Liga\LigaHandy\fnc\LigaHandyFNC26.sqf";
		27 = "Liga\LigaHandy\fnc\LigaHandyFNC27.sqf";
		28 = "Liga\LigaHandy\fnc\LigaHandyFNC28.sqf";
		29 = "Liga\LigaHandy\fnc\LigaHandyFNC29.sqf";
		30 = "Liga\LigaHandy\fnc\LigaHandyFNC30.sqf";		
		
	};
};

		/*	Zoran blickt über die Tanoanische Landschaft, öffnet das Handy und lächelt. Es ist vollbracht, die Koordinaten sind an ihrem Ort.  
			16 h Arbeitszeit wurden dafür benötigt, die sich aus der Anpassung unserer Altis Handy-Config und dem Ermitteln der Koordinaten zusammensetzt.
			
			Nicht immer ist alles leicht gemacht, wenn es simpel erscheint. 
			Also bleibt mir nur ein Gruß an alle diebischen Fans zu richten....würdigt gefälligst die Arbeit anderer Leute...
			
			
			Ich krame doch noch ein paar Zitate aus meinem so überaus nützlichen Repertoire.

			Bitte schön:
			
			"Ich nehm mir immer wieder vor, ich fass das Koks nicht mehr an
			 und nur so zu handeln wie's die Religion will und dann
		  	 zieh ichs zwar 'ne Zeit lang durch ohne Drogen und Schlampen,
			 doch lass es dann schleifen wie 'nen Rohdiamant [...]" 
			 
			Einen ähnlich guten Abschnitt findet man in diesem poetischen Meisterwerk, des Volkslyrikers Kollegah, noch in folgendem:
			 
			"[...] Und du fragst dich, wie man all das finanziert, mit Rappen?
			 Denn du siehst mich im schwarzen Lexus,
			 ich hatte mit 16 das Strafgesetzbuch von A bis Z durch.
			 Die traurige Wahrheit, die Welt ist grau und nicht schwarzweiß,
			 heut verprass ich Geld in Clubs, oben auf wie ein Sparschwein
			 und Frauen mit Armreifen, Ohrringen und Ketten,
			 die brilliantbesetzt sind wie dieser Clown in The Dark Knight.
			 Yeah, doch irgendwann hat alles Gute ein Ende,
			 das Leben ist eine Bitch und das ist Zuhälterrap" 
			 
			 Kollegah - Zuhälterrap*/
			
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