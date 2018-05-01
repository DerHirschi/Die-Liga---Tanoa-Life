/*
	Author: Hirschi - Die Liga
	blaaaaaaa .....
*/
if(isDedicated) exitWith {};
_mode = [_this,0,-1,[0]] call BIS_fnc_param;

if (playerSide isEqualTo east)exitWith {

	switch (_mode) do {
		case 1: {
			if!(isNil "tuv_marker") then {deleteMarker "TUV_Prufstelle";};
			tuv_marker = createMarker ["TUV_Prufstelle", position player];
			"TUV_Prufstelle" setMarkerText "TÜV Prüfstelle";
			tuv_marker setMarkerColor "ColorYellow";
			tuv_marker setMarkerType "o_maint";	
			tuv_marker setMarkerSize [1.4,1.4];	
			tuv_da = true; 
			publicVariableServer "tuv_da";
			hint "Die Pruefstelle ist jetzt geoeffnet...."
		};
		
		case 2: {
			deleteMarker "TUV_Prufstelle";
			tuv_da = true;  
			publicVariableServer "tuv_da";
			hint "Die Pruefstelle ist jetzt geschlossen !!!"	
		};
	};
};

if!(life_blacklisted isEqualTo 0)exitWith {

	switch (_mode) do {
		case 1: {
			if!(isNil "flusi_tuv_marker") then {deleteMarker "Helicopter_Prufstelle";};
			flusi_tuv_marker = createMarker ["Helicopter_Prufstelle", position player];
			flusi_tuv_marker setMarkerColor "ColorOrange";
			"Helicopter_Prufstelle" setMarkerText "Helicopter Prüfstelle";
			flusi_tuv_marker setMarkerType "o_maint";	
			flusi_tuv_marker setMarkerSize [1.4,1.4];	
			flusi_tuv_da = true; 
			publicVariableServer "flusi_tuv_da";
			hint "Die Pruefstelle ist jetzt geoeffnet...."
		};
		
		case 2: {
			deleteMarker "Helicopter_Prufstelle";
			flusi_tuv_da = false; 
			publicVariableServer "flusi_tuv_da";
			hint "Die Pruefstelle ist jetzt geschlossen !!!"			
		};
	};
};
