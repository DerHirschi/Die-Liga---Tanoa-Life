#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
//if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid


if(isNull _unit) exitWith {}; //Not valid
detach _unit;

[_unit,false] remoteExecCall ["life_fnc_jailMed",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit GVAR ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];