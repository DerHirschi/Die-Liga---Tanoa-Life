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
║ File: fn_ComBaustellGet.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Liga Baustelle Werte aus DB auslesen usw ... 
╚══════════════════════════════════════════════════╝
*/
//private ["_query","_queryResult","_row","_uid","_array","_type_ar"];

	_uid = _this select 0;
	_array = _this select 1;
	_type_ar = _this select 2;	
	
	//_query = format["SELECT typ, ist FROM baustelle"];
	_query = format["BaustGET"];
	//waitUntil{sleep (random 0.3); !DB_Async_Active};
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	_row = call compile format["%1",_queryResult]; 	
	
	[_array,_uid,_row] spawn TON_fnc_ComBaustellLOG;
	Liga_Baust_bes = _row;
	publicVariable "Liga_Baust_bes";
		
if (!liga_baus_trig) then {
	liga_baus_trig = true;
	
	[] spawn {
		sleep (11 * 60);
		[] call TON_fnc_BaustellNoti;				
		liga_baus_trig = false;
	};	
};
