#include "..\Liga_script_macros.hpp"
/*
File: fn_initasadac.sqf
Author: Bryan "Tonic" Boardwine
Edited by Hirschi Liga-Life

Description:
Initializes the ADAC..
*/

player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_adaclevel) isEqualTo 0) && (__GETC__(life_adminlevel) < 5)) exitWith 
	{
		["Notwhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	

	switch(__GETC__(life_adaclevel)) do
{
	case 1: {life_paycheck = 3000;};
	case 2: {life_paycheck = 12000;};
	case 3: {life_paycheck = 18000;};
	case 4: {life_paycheck = 24000;};
	case 5: {life_paycheck = 30000;};
	case 6: {life_paycheck = 33000;};
	case 7: {life_paycheck = 35000;};
	case 8: {life_paycheck = 35000;};

};

[] call life_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

lci_civspawn = true;
