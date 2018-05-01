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
║ File: fn_LeimDBset.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Leim Stand auf DB schreiben
╚══════════════════════════════════════════════════╝
*/
if (liga_leim_trig) exitWith {};
if (!liga_leim_trig) then {
	liga_leim_trig = true;
	[] spawn {		
		
		//_query = format["LeimSave:%1",liga_leim_tank];
		_query = format["LeimSave:%1:%2:%3",liga_leim_tank,liga_staa_tank,liga_civ_tank];
		[_query,1] call DB_fnc_asyncCall;
		uiSleep (5 * 60);
		liga_leim_trig = false;
	};
};