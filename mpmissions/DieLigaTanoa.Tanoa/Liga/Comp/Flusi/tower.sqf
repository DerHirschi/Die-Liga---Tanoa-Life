#include "..\..\..\Liga_script_macros.hpp"
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
║ File: 
║ Author: Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/
if(isDedicated) exitWith {};
diag_log "║ -- Liga Tower";

	[player,true,7] remoteExecCall ["TON_fnc_radio",RSERV];
	liga_bos set [6,true];
	liga_flusi = true;
	_pos = position player;
	while {true} do {
		if((player distance2D _pos) > 8) exitWith {		
				[player,false,7] remoteExecCall ["TON_fnc_radio",RSERV];
				liga_bos set [6,false];
				liga_flusi = false;
			};		
		_pos = position player;	
		uiSleep 20;
	};

