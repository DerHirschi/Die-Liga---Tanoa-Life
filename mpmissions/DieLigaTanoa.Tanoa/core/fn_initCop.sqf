#include "..\Liga_script_macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi Liga-Life
	
	Description:
	Cop Initialization file.
*/

player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
/*
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};
*/
if((__GETC__(life_coplevel) isEqualTo 0) && (__GETC__(life_adminlevel) < 5)) exitWith
	{
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};

switch(__GETC__(life_coplevel)) do
 {
	case 1: {life_paycheck = life_paycheck + 1000;};
	case 2: {life_paycheck = life_paycheck + 2000;};
	case 3: {life_paycheck = life_paycheck + 3000;};
	case 4: {life_paycheck = life_paycheck + 4000;};
	case 5: {life_paycheck = life_paycheck + 5000;};
	case 6: {life_paycheck = life_paycheck + 6000;};
	case 7: {life_paycheck = life_paycheck + 7000;};
	case 8: {life_paycheck = life_paycheck + 8000;};
	case 9: {life_paycheck = life_paycheck + 9000;};
	case 10: {life_paycheck = life_paycheck + 10000;};
	case 11: {life_paycheck = life_paycheck + 11000;};
};

player SVAR["rank",(__GETC__(life_coplevel)),true];

[] call life_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
/*
[] spawn {
	private ["_uni"];
	_uni = "";
	while {true} do {
		_uni = uniform player;
		[] call life_fnc_ligaSetClothText;
		sleep 15.3;
		waitUntil {sleep 8.3;uniform player != _uni};		
	};
};

[] spawn {
	private ["_bpp"];
	_bpp = "";
	while {true} do	{
		_bpp = backpack player;
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];
		backpackContainer player SVAR ["texture","",true];
		sleep 15.3;
		};
		waitUntil {sleep 7.3;backpack player != _bpp};		
	};
};
*/

lci_civspawn = true;
	
