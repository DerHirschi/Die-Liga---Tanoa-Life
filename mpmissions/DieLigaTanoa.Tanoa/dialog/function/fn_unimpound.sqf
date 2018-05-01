#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by H1rschi - D1e L1ga
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price","_exit"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;
_exit = false;
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};


if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = switch(side player) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"storageFee"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"storageFee"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"storageFee"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"storageFee"),3)};
};

//if(playerSide != civilian) then { _price = _price * 0.1;};
if(life_garage_type isEqualTo "Imp") then {_price = _price * 3;};
if(life_garage_type isEqualTo "CHOP") then {_price = _price * 4;};
life_garage_type = "";
if(!(EQUAL(typeName _price,typeName 0)) OR _price < 1) then {_price = 1000};
if(BANK < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
/*
	if(EQUAL(typeName life_garage_sp,typeName [])) then {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1)] remoteExec ["TON_fnc_spawnVehicle",RSERV];
	} else {
*/
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[_vid,_pid,life_garage_sp,_unit,_price,0,playerSide] remoteExec ["TON_fnc_spawnVehicle",RSERV];
	} else {
		
			//Check if there is multiple spawn points and find a suitable spawnpoint.
		if(EQUAL(typeName life_garage_sp,typeName [])) then {
		//Find an available spawn point.
				{
					if(EQUAL(typeName _x,"STRING")) then {
						if(count(nearestObjects[(getMarkerPos _x),["Air","Car","Ship"] + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")) + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")),5]) isEqualTo 0) exitWith {life_garage_sp = _x; _exit = true;};
					
					}else{
						_exit = true;
						life_garage_sp = _x;
					};
					if(_exit)exitWith{};
				} foreach life_garage_sp;
	
			if!(EQUAL(typeName life_garage_sp,typeName []))then{
				[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,playerSide] remoteExec ["TON_fnc_spawnVehicle",RSERV];
				hint localize "STR_Garage_SpawningVeh";
				SUB(BANK,_price);
			}else{
				if!(count(nearestObjects[life_garage_sp,["Air","Car","Ship"],5]) isEqualTo 0) exitWith {
					//life_garage_sp = [];
					hint "Alle Spawnpunkte sind belegt... ";
				};
			[_vid,_pid,life_garage_sp,_unit,_price,0,playerSide] remoteExec ["TON_fnc_spawnVehicle",RSERV];
			SUB(BANK,_price);
			};
		}else{
			if!(count(nearestObjects[(getMarkerPos life_garage_sp),["Air","Car","Ship"] + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")) + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")),5]) isEqualTo 0) exitWith {
				//life_garage_sp = [];
				hint "Alle Spawnpunkte sind belegt... ";
			};
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,playerSide] remoteExec ["TON_fnc_spawnVehicle",RSERV];
			SUB(BANK,_price);	
		};
	};

closeDialog 0;