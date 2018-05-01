#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi Liga-Life
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_statbar"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if((_vehicle GVAR ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};

life_trunk_vehicle = _vehicle;

_statbar = life_trunk_vehicle GVAR["liga_maischPro",0];	
if(_statbar != 0) exitWith { [_statbar] call life_fnc_statMaisch;};
if(isNull _vehicle OR !(KIND_TRUNK_INV(_vehicle))) exitWith {}; //Either a null or invalid vehicle type.

if((_vehicle GVAR ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
_vehicle SVAR["trunk_in_use",true,true];
disableSerialization;

if(typeOf _vehicle in ["Land_Tank_rust_F","Land_Research_house_V1_F"]) exitWith {
	
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;	
	
	ctrlSetText[3501,format["Bohrturm" + " - %1",getText(configFile >> CONFIG_VEHICLES >> (typeOf _vehicle) >> "displayName")]];
	if(_veh_data select 0 isEqualTo -1 ) exitWith {
		closeDialog 0; 
		_vehicle SVAR["trunk_in_use",false,true]; 
		hint localize "STR_MISC_NoStorageVeh";
	};

	ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",SEL(_veh_data,1),SEL(_veh_data,0)]];
	[_vehicle] call life_fnc_vehInventory;	
	_vehicle spawn
	{
		waitUntil {isNull (findDisplay 3500)};
		_this SVAR["trunk_in_use",false,true];
		[_this] remoteExecCall ["LIGA_fnc_updateTurm",HC_id];
	};	
};

if(typeOf _vehicle in ["Land_ShelvesMetal_F"]) exitWith {
	
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;	
	
	ctrlSetText[3501,format["Laden" + " - %1",getText(configFile >> CONFIG_VEHICLES >> (typeOf _vehicle) >> "displayName")]];
	if(_veh_data select 0 isEqualTo -1 ) exitWith {
		closeDialog 0; 
		_vehicle SVAR["trunk_in_use",false,true]; 
		hint localize "STR_MISC_NoStorageVeh";
	};

	ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",SEL(_veh_data,1),SEL(_veh_data,0)]];
	[_vehicle] call life_fnc_vehInventory;	
	[_vehicle,(nearestObject [(getPosATL player), "House_F"])] spawn
	{
		waitUntil {isNull (findDisplay 3500)};
		(_this select 0) SVAR["trunk_in_use",false,true];
		[(_this select 1)] remoteExecCall ["TON_fnc_updateZusa",RSERV];
	};	
};

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> CONFIG_VEHICLES >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> CONFIG_VEHICLES >> (typeOf _vehicle) >> "displayName")]];
};
if!((typeOf _vehicle) in ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"]) then {
	if(_vehicle isKindOf "House_F") then {
		private["_mWeight"];
		_mWeight = 0;
		{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle GVAR["containers",[]]);
		_veh_data = [_mWeight,(_vehicle GVAR["Trunk",[[],0]]) select 1];
	} else {
		_veh_data = [_vehicle] call life_fnc_vehicleWeight;
	};
}else{
	_veh_data = [([(typeOf _vehicle)] call life_fnc_vehicleWeightCfg),(_vehicle GVAR["Trunk",[[],0]]) select 1];
	
};
/*
if (ad_debugRPT) then {	
	diag_log "╔═══════════════════════════════════╗";
	diag_log "║ -          Liga openInventory !!            ";
	diag_log format["║ _veh_data: %1",_veh_data];
	diag_log format["║ _vehicle: %1",_vehicle];
	diag_log "╚═══════════════════════════════════╝";
};
*/
if(_vehicle isKindOf "House_F" && {count (_vehicle GVAR ["containers",[]]) isEqualTo 0} && !(((typeOf _vehicle) in ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"]))) exitWith {
	hint localize "STR_MISC_NoStorageWarn"; 
	closeDialog 0; 
	_vehicle SVAR["trunk_in_use",false,true];
};
if(_veh_data select 0 isEqualTo -1 && {!(_vehicle isKindOf "House_F")}) exitWith {
	closeDialog 0; 
	_vehicle SVAR["trunk_in_use",false,true]; 
	hint localize "STR_MISC_NoStorageVeh";
};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",SEL(_veh_data,1),SEL(_veh_data,0)]];
[_vehicle] call life_fnc_vehInventory;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this SVAR["trunk_in_use",false,true];
	if((typeOf _this) in ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"]) exitWith {
		[_this] remoteExecCall ["TON_fnc_updateTankTrunk",RSERV];
	};
	if(_this isKindOf "House_F") then {
		
		[_this] remoteExecCall ["TON_fnc_updateHouseTrunk",RSERV];

	};
};