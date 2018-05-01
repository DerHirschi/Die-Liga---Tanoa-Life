#include "..\Liga_script_macros.hpp"
/*
	File: init_fuel_action.sqf
	Author: Paradox , NiiRoZz
	Edit: Hirschi - Die Liga
	Description: AddActions an alle 28 Tanken hinzufügen
*/
private ["_pump"];						
{
	//_pump = (nearestObject [_x, "Land_FuelStation_01_pump_F"]);
	_pump = nearestObjects [_x, ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 25];
	_pump = SEL(_pump,0);
	_pump setFuelCargo 0;
    _pump addaction ["Auftanken","[_this select 0]call life_fnc_vehicleCheck"];
    _pump addaction ["BenzinPreis","[_this select 0]call life_fnc_fuelPrices"];
	
} forEach M_CONFIG(getArray,"Ligaworld","Liga_Tankstellen","TankPos");
