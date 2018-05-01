#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","I_MRAP_03_F","C_Van_01_box_F","B_Truck_01_mover_F","B_Truck_01_medical_F","B_Truck_01_Repair_F","I_Truck_02_ammo_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle GVAR ["lights",false];
diag_log str _trueorfalse;
if(_trueorfalse) then {
	_vehicle SVAR ["lights",false,true];
} else {
	_vehicle SVAR ["lights",true,true];	
	[_vehicle,0.22] remoteExec ["life_fnc_medicLights",RCLIENT];
};