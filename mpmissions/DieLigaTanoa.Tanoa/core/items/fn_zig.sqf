#include "..\..\Liga_script_macros.hpp"
/*
File: fn_weed.sqf
Author: Kuchiha
2´nd Author: not sure ...... ->  Mario
Edit: Hirschi@Liga-Life

Description:
Smoke effects.
*/

private["_OBJ","_PS"];



_OBJ = player;
_PS = "#particlesource" createVehicle getpos _OBJ;

[_PS,_OBJ] remoteExecCall ["life_fnc_weedSmoke",RCLIENT];


sleep 90;

deleteVehicle _PS;


