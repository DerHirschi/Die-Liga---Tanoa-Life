#include "..\..\Liga_script_macros.hpp"
/*
File: fn_restrainAction.sqf
Author: Bryan "Tonic" Boardwine
Edited by Hirschi Die Liga

Description:
Retrains the target.
*/

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit GVAR "restrained")) exitWith {};
if(cursorTarget distance player > 3.5)exitWith{} ;
if(EQUAL(player,_unit)) exitWith {};
if(!isPlayer _unit) exitWith {};
if(side player in [civilian,east] && (!liga_cop_on && !liga_lrk_on)) then {
	if(lin_zip < 1) exitWith { hint "Du hast keine Kabelbinder."; };
	lin_zip = lin_zip - 1;
	hint "Du hast die Person festgenommen!";
};
playSound "hand";
//Broadcast!
_unit SVAR["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit GVAR["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
