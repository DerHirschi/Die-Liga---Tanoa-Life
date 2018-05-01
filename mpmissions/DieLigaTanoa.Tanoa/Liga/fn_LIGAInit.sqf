#define F false
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
║ File: fn_LIGAInit.sqf
║ Author: Hirschi Liga-Life	
║	
║ Beschreibung: Init Schlampe für Liga Script Gedönz
╚══════════════════════════════════════════════════╝
*/	


	diag_log "╠══════════════════════════════════════════════════╣";
 	diag_log "║ Liga Init gestartet !!! ";
	
	life_id = 9999;				// PVC ID
	//pvc_mp = F;     		// PVC Marktpreis Trigger
	

	//Imp_Fac = 1;				// Verwahrstellen Faktor
	

	
	// Markt Variablen
	//markt_type_1 = "";
	//markt_type = "";
	//markt_amount = 0;
	
	// DB Send Trigger
	
	//markt_trig = F;
	

	life_trusafe = F;
	
	liga_destOb_ar = [];
	liga_dest1 = ObjNull;
	l_dest_1 = ObjNull;
	//Com Baustelle
	
	//liga_baust_tar = ["a5","cement","glass","stt"]; 
	liga_baust_count_ar = [0,0,0,0]; 
	liga_baust_trig = F;
	
	liga_lock = false;
	
	// Liga World
	liga_leim_tank = 0;
		
	// Markt PVC Arrays
	//m_preis_ar = [0,1,2,3,4,5,6,7,8];	
	//m_name_ar = [20,21,22,23,24,25,26,27,28];	
	//m_resources_ar =[40,41,42,43,44,45,46,47,48];
	
	// Bos
	liga_bos = [F,F,F,F,F,F,F,F,true];
	
	[] call life_fnc_AdminStats;	
	[] call life_fnc_clanKey;			
	//[0,""] call life_fnc_ligaWHconfig;
	[] call life_fnc_PVCgetID;  

	
	fuel_diesel = 63;
	fuel_super = 86;
	fuel_Kerosin = 570;
	liga_fuwait_tr = F;
			
	liga_sit = F;
	liga_anim = F;
	// Disp
	liga_tooltip = true;
	
	sleep 0.1;

	CLAY_CarRadio_UserPlaylist = profileNamespace getVariable ["Liga_RadioPLS",[]];


	If (isNil "CLAY_RadioAddMusic") Then {CLAY_RadioAddMusic = []};
	If (isNil "CLAY_RadioAddVehicles") Then {CLAY_RadioAddVehicles = []};
	If (isNil "CLAY_RadioNoVehicles") Then {CLAY_RadioNoVehicles = []};
	If (isNil "CLAY_RadioShowTooltips") Then {CLAY_RadioShowTooltips = false};

	//_trigger1 = createTrigger ["EmptyDetector", [0,0,0]];
	//_trigger1 setTriggerArea [0, 0, 0, false];
	//_trigger1 setTriggerActivation ["NONE", "PRESENT", true];
	//_trigger1 setTriggerStatements ["(('Car' countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)", "CLAY_RadioVeh = vehicle player; CLAY_ID_RADIO = CLAY_RadioVeh addAction ['Car Radio','scripts\CLAY_CarRadio\scripts\radio.sqf'];", "CLAY_RadioEndTimer = true; CLAY_RadioPlaying = false; playMusic ''; CLAY_RadioVeh removeAction CLAY_ID_RADIO; CLAY_RadioVeh = nil;"];


	CLAY_RadioPlaying = false;
	CLAY_RadioEndTimer = true;

	CLAY_RadioGameMusic = 
	[
		["LeadTrack01_F", "This Is War", 162], 
		["LeadTrack01a_F", "This Is War a", 162], 
		["LeadTrack01b_F", "This Is War b", 162], 
		["LeadTrack01_F_Bootcamp", "This is War (VR Remix)", 164], 
		["LeadTrack01_F_Heli", "This is War (Heli Remix)", 164], 
		["LeadTrack01_F_Mark", "This is War (Marksmen Remix)", 158], 
		["LeadTrack04_F_EXP", "This Is War (Apex Remix - Alternative 1)", 140], 
		["LeadTrack01_F_EXP", "This Is War (Apex Remix)", 176], 
		["LeadTrack02_F_Mark", "Into the Sun", 172], 
		["LeadTrack03_F_Mark", "Marksmen", 130], 
		["LeadTrack01c_F", "Main Menu", 128], 
		["LeadTrack02_F", "Proteus", 94], 
		["LeadTrack03_F", "Combined Arms", 96], 
		["LeadTrack04_F", "Action Dark 2", 151], 
		["LeadTrack04a_F", "Action Dark", 111], 
		["LeadTrack05_F", "Taking Kavala", 96], 
		["LeadTrack06_F", "Down at the Girina Bay", 184],
		["AmbientTrack02_F_EXP", "Welcome To Tanoa", 143],
		["AmbientTrack01_F_EXP", "Through The Jungle", 140],
		["LeadTrack03_F_EXP", "No Time For Questions", 140],
		["LeadTrack02_F_EXP", "An Unknown Enemy", 156],
		
		["AmbientTrack01a_F", "The East Wind", 184],
		["AmbientTrack01_F", "The East Wind - Alternative 1", 190],	
		["AmbientTrack01b_F", "The East Wind - Alternative 2", 184],
		
		["AmbientTrack03_F", "Solar Power", 114],
		["AmbientTrack04a_F", "Night percussions", 194],
		["AmbientTrack04_F", "Night ambient", 204],
		["BackgroundTrack03_F", "Car and Heli", 111],
		["BackgroundTrack01_F", "Underwater 2", 98],
		["BackgroundTrack01a_F", "Underwater 1", 96],
		["BackgroundTrack02_F", "On The Road", 88],
		
		["Track01_Proteus", "Unbekannt 1", 94],
		["Track02_SolarPower", "Unbekannt 2", 114],
		["Track03_OnTheRoad", "Unbekannt 3", 88],
		["Track04_Underwater1", "Unbekannt 4", 96],
		["Track05_Underwater2", "Unbekannt 5", 98],
		["Track06_CarnHeli", "Unbekannt 6", 111],
		["Track07_ActionDark", "Unbekannt 7", 111],
		["Track08_Night_ambient", "Unbekannt 8", 204],
		["Track09_Night_percussions", "Unbekannt 9", 194],
		["Track10_StageB_action", "Unbekannt 10", 96],
		
		["Track11_StageB_stealth", "Unbekannt 11", 184],
		["Track12_StageC_action", "Unbekannt 12", 96],
		["Track13_StageC_negative", "Unbekannt 13", 184],
		["Track14_MainMenu", "Unbekannt 14", 128],
		["Track15_MainTheme", "Unbekannt 15", 162],
		["LeadTrack01_F_EPA", "Conquistador", 96],
		["LeadTrack02_F_EPA", "Aegis Blues)", 117],
		["LeadTrack02a_F_EPA", "Aegis Blues - Alternative 1", 53],
		["LeadTrack02b_F_EPA", "Aegis Blues - Alternative 2", 62],
		["LeadTrack03_F_EPA", "Survive the Hard Part", 138],
		
		["LeadTrack01_F_EPB", "Adapt", 135],
		["LeadTrack01a_F_EPB", "Adapt - Alternative", 85],
		["LeadTrack02_F_EPB", "Exit Strategy", 179],
		["LeadTrack02a_F_EPB", "Exit Strategy - Alternative 1", 70],
		["LeadTrack02b_F_EPB", "Exit Strategy - Alternative 2", 117],
		["LeadTrack03_F_EPB", "Beyond Recognition", 123],
		["LeadTrack03a_F_EPB", "Beyond Recognition - Alternative 1", 101],
		["LeadTrack04_F_EPB", "Canton Protocol", 132],
		["AmbientTrack01_F_EPB", "Signal Lost", 69],
		["BackgroundTrack01_F_EPB", "The Hunt", 127],
		["LeadTrack01_F_EPC", "Back on Stratis", 94],
		["LeadTrack02_F_EPC", "LZ hot", 96],
		
		["LeadTrack03_F_EPC", "The Trap", 147],
		["LeadTrack04_F_EPC", "In the Open", 129],
		["LeadTrack05_F_EPC", "Revenge", 87],
		["LeadTrack06_F_EPC", "Win", 132],
		["LeadTrack02_F_EPC", "Farewell Altis", 39],
		
		["EventTrack03_F_EPC", "Unforeseen Perdition", 88],
		["BackgroundTrack01_F_EPC", "Alone", 96],
		["BackgroundTrack02_F_EPC", "Just Another Day", 98],
		["BackgroundTrack03_F_EPC", "Altis Requiem", 148],
		["BackgroundTrack04_F_EPC", "Assembly", 80],
		
		["LeadTrack01_F_Curator", "Zeus Theme", 182],
		["LeadTrack02_F_Bootcamp", "Evolution", 242],
		["LeadTrack03_F_Bootcamp", "Epic Split", 61]

		
		
	];

	CLAY_RadioGameMusicOA = 
	[

	];


	If (count CLAY_CarRadio_UserPlaylist > 0) Then
	{
		CLAY_RadioCustomMusic = CLAY_CarRadio_UserPlaylist;
	}
	Else
	{
		CLAY_RadioCustomMusic = [];
	};

	CLAY_RadioPlayList = CLAY_RadioGameMusic;

	CLAY_RadioTrack = 0;
	CLAY_RadioVol = 0.5;
	CLAY_RadioVolStep = 10;

	CLAY_RadioSrc = 1;
	CLAY_RadioRepeat = false;
	CLAY_RadioRandom = false;
	CLAY_RadioKeyColor = 1;
	CLAY_RadioDisplay = 9;
	CLAY_RadioColor = "Black";
	
	CLAY_PausenTimer = 0;
	
	
	fuelsave = false;
	
	diag_log "║ Liga Init erfolgreich !!! ";
	diag_log "╠══════════════════════════════════════════════════╣";
