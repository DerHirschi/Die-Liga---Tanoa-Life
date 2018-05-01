#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	Vorlage:Tonic´s Altis RPG (fn_initHouses.sqf)

	LIGACL_fnc_InitTank 
	
*/
private["_house"];
if(EQUAL(count liga_tankhouses,0)) exitWith {}; //Nothing to do.

{
	//_position = call compile format["%1",SEL(_x,0)];
	//diag_log str _x;
	//_house = nearestObject [SEL(_x,0),"Land_FuelStation_01_pump_F"];
	_house = nearestObjects [SEL(_x,0), ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 25];
	_house = SEL(_house,0);
	 
	_house SVAR["uid",round(random 9999999),true];
	
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	
	_marker = createMarkerLocal [format["tankst_%1",(_house GVAR "uid")],SEL(_x,0)];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorYellow";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	
} foreach liga_tankhouses;
