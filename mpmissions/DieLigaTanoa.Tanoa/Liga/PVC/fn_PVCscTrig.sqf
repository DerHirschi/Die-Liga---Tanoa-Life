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
║ File: fn_PVCscTrig.sqf
║ Author: Hirschi - Die Liga	
║ 
╚══════════════════════════════════════════════════╝
*/	

_mode = [_this,0,-1,[0]] call BIS_fnc_param;

	if(_mode isEqualTo -1)exitWith 	{	[400] call life_fnc_getPVC;												}; // Error to Server

	if(_mode isEqualTo 2)exitWith 	{	closeDialog 0; createDialog "shops_menu"; [] call life_fnc_virt_update;	};  // Shop Display WH getriggert
	if(_mode isEqualTo 3)exitWith 	{ 	[1] call life_fnc_fuelConfig;									};  // BEnzin Bestand trig 
	if(_mode isEqualTo 1)exitWith 	{ 	[ ] call life_fnc_ligaWHdiShow;											};  // WH Displ 
