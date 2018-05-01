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
║ File: fn_notsteu.sqf
║ Author: Hirschi - Die Liga
║ 
║ Description:
║ Notruf Voice System .... Warteschleifen Steuerung.
╚══════════════════════════════════════════════════╝	
*/

private["_mode"];
/*
Mode
0 = ERROR
1 = Nächster
2 = Auflegen
*/


_mode = [_this,0,0,[0]] call BIS_fnc_param;

switch (_mode) do {
	case 0: {};
	case 1: {
		if!((isNull Not_CivUnit)) then {[2]call TON_fnc_notsteu;};
		if((count Not_warteschl) == 0) exitWith {};
		sleep 0.5;
		_next = Not_warteschl select 0;
		[_next,true,8]spawn TON_fnc_radio;
		Not_CivUnit = _next;
		_i = Not_warteschl find _next; 
		if (_i != -1) then {Not_warteschl deleteAt _i;};		
		};
	
	case 2:	{[Not_CivUnit,false]call TON_fnc_notwarte;};
	
	default {};
};
