#include "..\..\Liga_script_macros.hpp"
/*

	Author: Hirschi - Die Liga

*/

private ["_time","_preise"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;


if(isNull _unit ||EQUAL(_mode,-1)) exitWith {};
//Get minutes
_time = ctrlText 1400;


if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};

_time		= parseNumber _time; //requested number
_time 		= round _time;
_preise	 	= _unit GVAR["TankPreis",[]];
if(EQUAL(_preise,[])) exitWith {};

switch (_mode) do {
	case 1: {_preise set [0,(_time min 700)];};
	case 2: {_preise set [1,(_time min 800)];};
	case 3: {_preise set [2,(_time min 1500)];};
};

closeDialog 0; 

_unit SVAR["TankPreis",_preise,true];
[_unit,getPlayerUID player] remoteExecCall ['TON_fnc_updateTankTrunk',RSERV];