#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi Liga-Life
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff","_FuelStuffboth"];
disableSerialization;

_ctrl 	= ctrlSelData(3503);
_num 	= ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(EQUAL(_num,0))exitWith {hint localize "STR_MISC_Under1";};

if(life_trunk_vehicle isKindOf "House_F" && !( (typeOf life_trunk_vehicle) in ["Land_FuelStation_02_pump_F","Land_FuelStation_01_pump_F","Land_Tank_rust_F","Land_Research_house_V1_F"])) then {	
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle GVAR["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];
	
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
	
};
_itemWeight 	= ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data 		= life_trunk_vehicle GVAR ["Trunk",[[],0]];
_inv 			= SEL(_veh_data,0);
_Truck 			= TypeOf life_trunk_vehicle;
_nichtHeli		= ["Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_bench_F"];
//_UranZeug		= ["uranium1","uranium2","uranium3","uranium4","uranium","iuranium4","iuranium"]; 
_FuelStuff 		= ["oilu","oilp","ben","di",/*"tet","sig",*/"rio","rig","a3"]; //Wich Items can be stored in?
_FuelStuffboth 	= ["rib","rip","apple","water","tbacon","coffee","donuts"]; //Beides erlaubt
//_FuelTrucks 	= ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_Tank_rust_F","C_Van_01_fuel_F","B_Truck_01_fuel_F","Land_Pod_Heli_Transport_04_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Heli_Transport_04_fuel_F"]; //Fuel Trucks, who are allowed to carry fuel
_FuelTrucks 	= M_CONFIG(getArray,"LigaVehSetup","Fahrzeuge","tanker");
if(EQUAL(_ctrl,"goldbar") &&  {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F") OR (_Truck in _nichtHeli )}) exitWith {hint "Du kannst das nicht mit dem Heli transportieren"};
//if(_ctrl in _UranZeug && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F") OR (_Truck in _nichtHeli )}) exitWith {hint "Junge .. Du kannst kein radioaktives Zeug im Heli transportieren !!!";};


switch (true) do
	{
		case ((	_ctrl in _FuelStuffboth))								   : {life_TankLaster = 1}; 	//beides 
		case ((	_ctrl in _FuelStuff) 		&& (	_Truck in _FuelTrucks)): {life_TankLaster = 1}; 	//Fuel in FuelTruck -> Allowed
		case (!(_ctrl in _FuelStuff) 		&& !(	_Truck in _FuelTrucks)): {life_TankLaster = 2}; 	//NonFuel in NonFuelTruck -> Allowed
		case (!(_ctrl in _FuelStuff) 		&& (	_Truck in _FuelTrucks)): {life_TankLaster = 3}; 	//NonFuel in FuelTruck -> Nope
		case ((	_ctrl in _FuelStuff) 		&& !(	_Truck in _FuelTrucks)): {life_TankLaster = 4}; 	//Fuel in NonFuelTruck -> Nope!	
	};
if(_Truck isKindOf "Land_ShelvesMetal_F") then {life_TankLaster = 1};
if(EQUAL(life_TankLaster,3)) exitWith {hint "Ey Junge !Du kannst nur Öl oder Kerosin in einen Tanklaster füllen!"};
if(EQUAL(life_TankLaster,4) && !(life_trunk_vehicle isKindOf "House_F")) exitWith {hint "Du kannst Öl oder Kerosin NUR in einen Tanklaster füllen!";};

if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist entweder voll oder kann nicht so viel tragen."};

if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Items konnten nicht vom Inventar entfernt werden um sie im Auto zu lagern.";};
_index = [_ctrl,_inv] call TON_fnc_index;
if(EQUAL(_index,-1)) then
{
	_inv pushBack [_ctrl,_num];
}
	else
{
	_val = _inv select _index select 1;
	_inv set [_index,[_ctrl,_val + _num]];
};
life_trunk_vehicle SVAR["Trunk",[_inv,(SEL(_veh_data,1)) + _itemWeight],true];
[life_trunk_vehicle] call life_fnc_vehInventory;
