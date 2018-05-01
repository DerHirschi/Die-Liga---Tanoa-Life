#include "..\Liga_script_macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi Liga-Life
	
	Description:
	Initializes the medic..
*/


if(!lci_uhrspawn && (__GETC__(life_adminlevel) < 5)) exitWith
	{
		["NotUhr",false,true] call BIS_fnc_endMission;
		sleep 35;
	};

civ_spawn_1 = nearestObjects[getMarkerPos  "uhr_spawn_1", ["Land_Temple_Native_01_F"],200];
civ_spawn_2 = nearestObjects[getMarkerPos  "uhr_spawn_2", ["Land_Shop_City_01_F","Land_Shop_City_02_F","Land_Shop_Town_03_F","Land_Shop_City_07_F"],500];
cutText["","BLACK FADED"];
waitUntil {!(isNull (findDisplay 46))};
cutText["","BLACK FADED"];


	if(life_is_arrested) then
	{
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
		
		[] call life_fnc_hudSetup;
	}
	else
	{
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
		
		if(__GETC__(life_adminlevel) < 4)then{playSound "start";};
		
		
		[] call life_fnc_hudSetup;
	};


player addRating 999999999;

if!(lci_driv) then {lci_driv = true;};
if!(lci_boat) then {lci_boat = true;};
if!(lci_air)  then {lci_air = true;};
if!(lci_gun)  then {lci_gun = true;};
if!(lci_dive) then {lci_dive = true;};
if!(lci_lkw)  then {lci_lkw = true;};

/*
if((__GETC__(life_medicLevel) isEqualTo 0) && (__GETC__(life_adminlevel) < 5))  exitWith 
	{
		["Notwhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};

switch(__GETC__(life_mediclevel)) do
	{
		case 1: {life_paycheck = 1500;};
		case 2: {life_paycheck = 3000;};
		case 3: {life_paycheck = 6000;};  
		case 4: {life_paycheck = 9000;};
		case 5: {life_paycheck = 12000;};
		case 6: {life_paycheck = 24000;};
		case 7: {life_paycheck = 34000;};
		case 8: {life_paycheck = 37000;};
	};

[] call life_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
*/
