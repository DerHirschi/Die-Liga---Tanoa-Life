#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private "_target";
_target = param [0,ObjNull,[ObjNull]];

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
playSound "punch";
life_knockout = true;

[player,"AwopPercMstpSgthWrflDnon_End2",true] remoteExecCall ["life_fnc_animSync",RCLIENT];

sleep 0.08;

[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;