#include "..\Liga_script_macros.hpp"
_SUPERVEH = ["B_SDV_01_F","B_Boat_Armed_01_minigun_F","B_G_Boat_Transport_02_F","B_Boat_Transport_01_F","O_Boat_Transport_01_F","O_G_Boat_Transport_01_F","O_T_Lifeboat","O_G_Boat_Transport_02_F","O_Boat_Armed_01_hmg_F","O_SDV_01_F","O_T_LSV_02_unarmed_arid_F","B_T_LSV_01_unarmed_olive_F","O_LSV_02_armed_arid_F","I_SDV_01_F","I_C_Boat_Transport_02_F","I_G_Boat_Transport_01_F","I_Boat_Transport_01_F","C_Boat_Civil_01_F","C_Rubberboat","C_Scooter_Transport_01_F","B_T_LSV_01_unarmed_sand_F","O_T_LSV_02_unarmed_ghex_F","I_C_Offroad_02_unarmed_brown_F","I_C_Offroad_02_unarmed_olive_F","I_C_Offroad_02_unarmed_F","C_Boat_Transport_02_F","C_Offroad_02_unarmed_F","O_Boat_Armed_01_hmg_F","C_Kart_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_SUV_01_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","C_Van_01_fuel_F","C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_repair_F"];
_DIESELVE = ["I_G_Van_01_transport_F","","I_G_Van_01_fuel_F","I_C_Van_01_transport_olive_F","I_C_Van_01_transport_brown_F","O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_device_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_covered_ghex_F","O_T_Truck_03_transport_ghex_F","O_Truck_02_transport_F","C_Van_01_box_F","I_Truck_02_medical_F","O_Truck_03_medical_F","B_Truck_01_medical_F","O_Truck_02_covered_F","I_Truck_02_ammo_F","I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","B_Truck_01_transport_F","B_Truck_01_ammo_F","O_Truck_03_ammo_F","O_Truck_03_device_F","B_Truck_01_box_F","B_Truck_01_covered_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F","B_Truck_01_mover_F","I_MRAP_03_F","O_MRAP_02_F","B_MRAP_01_F"];
_KEROSVEH = ["I_C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F","C_Plane_Civil_01_F","B_T_VTOL_01_vehicle_olive_F","B_T_VTOL_01_vehicle_blue_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","C_Heli_Light_01_civil_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_repair_F"];
/*
	File:  vehicle_check.sqf
	Author: Paradox
	Edited by Hirschi - Die Liga
	
	Description: Checkt die Fahrzeuge und deren Krafstoffe
*/
private ["_vehicle","_vehicle1","_trig","_preise"];
_tanke  	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle 	= [];
_vehicle 	= nearestObjects[getPos player, ["Landvehicle","Ship"],7];
_vehicle1 	= [];
_vehicle1 	= nearestObjects[getPos player, ["Air"],20];
life_pInact_curTarget = _tanke;

if(count _vehicle isEqualTo 0 && count _vehicle1 isEqualTo 0 ) exitwith { hint "Kein Fahrzeug gefunden"};
if(count _vehicle > 1 || count _vehicle1 > 1 ) exitwith { hint "Es wurde mehr als ein Fahrzeug gefunden! Bitte entferne das zweite...";};
if(isNull _tanke) then{_preise = [];}else{_preise 	= _tanke GVAR ["TankPreis",[]]; };
if(EQUAL(count _preise,0)) then { 
	liga_fuwait_tr 	= false;
	[0] call life_fnc_fuelConfig;
	
	waitUntil {liga_fuwait_tr;};
	liga_fuwait_tr 	= false;
	_trig			= false;	
}else{
	fuel_super 		= SEL(_preise,0);
	fuel_diesel 	= SEL(_preise,1);
	fuel_Kerosin 	= SEL(_preise,2);
	_trig			= true;	
};

if!(count _vehicle isEqualTo 0) exitWith { 
	_vehicle  = _vehicle  select 0;
	{if(_vehicle isKindOf _x) exitWith {[_trig]spawn life_fnc_super;	   	};}foreach _SUPERVEH;
	{if(_vehicle isKindOf _x) exitWith {[_trig]spawn life_fnc_diesel;		};}foreach _DIESELVE;
};	
if!(count _vehicle1 isEqualTo 0) then { 
	_vehicle1 = _vehicle1 select 0;
	{if(_vehicle1 isKindOf _x) exitWith {[_trig]spawn life_fnc_Kerosin; 	};}foreach _KEROSVEH;
};	

