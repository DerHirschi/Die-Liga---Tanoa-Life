#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15,[15]] call BIS_fnc_param;

if(isNull _unit) exitWith {hint"Bitte Admin informieren";}; //Not valid
//if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {hint"Bitte Admin informieren";}; //Not a unit
//if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit GVAR "restrained")) exitWith {hint"Bitte Admin informieren";}; //He's not restrained.
if(side _unit != civilian) exitWith {hint"Bitte Admin informieren";}; //Not a civ
if(_time < 1) exitwith {hint"Bitte Admin informieren";}; //Not Valid

[(getPlayerUID _unit),_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",RSERV];

detach _unit;
[_unit,false,_time] remoteExecCall ["life_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit GVAR ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];