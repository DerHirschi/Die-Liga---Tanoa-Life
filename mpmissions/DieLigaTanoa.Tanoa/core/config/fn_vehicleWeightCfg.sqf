#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className","_weight"];
_className = [_this,0,"",[""]] call BIS_fnc_param;



if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _className)) then {
	_className = "Default"; //Use Default class if it doesn't exist

};
_weight = M_CONFIG(getNumber,CONFIG_LIGA_VEHICLES,_className,"vItemSpace");


if(isNil "_weight") then {_weight = -1;};
_weight;