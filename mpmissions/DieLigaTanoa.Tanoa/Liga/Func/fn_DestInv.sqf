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
║ File: fn_DestInv.sqf
║ Author: Hirschi Liga-Life
║
║ Description: Destillen Inventar openner ... 
╚══════════════════════════════════════════════════╝
*/	
private ["_inv","_mode"];

_mode = _this select 0;

switch (_mode) do {
	
	case 0:{ _inv = nearestObjects[getPos player,["Land_HeatPump_F"],2.9] select 0; [_inv] spawn life_fnc_openInventory;};
	case 1:{ _inv = nearestObjects[getPos player,["Land_Bucket_painted_F"],2.5] select 0; [_inv] spawn life_fnc_openInventory;};
	case 2:{ _inv = nearestObjects[getPos player,["Land_BarrelWater_F"],1.3] select 0; [_inv] spawn life_fnc_openInventory;};
	
};