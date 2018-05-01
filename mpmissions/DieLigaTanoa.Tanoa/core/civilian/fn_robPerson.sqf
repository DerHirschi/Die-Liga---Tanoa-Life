#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_cash > 0) then
{	
	[life_cash] remoteExecCall ["life_fnc_robReceive",_robber];
	
	[getPlayerUID _robber,_robber GVAR["realname",name _robber],"211"] remoteExecCall ["life_fnc_wantedAdd",RSERV];	

	[1,"STR_NOTF_Robbed",true,[_robber GVAR["realname",name _robber],profileName,[life_cash] call life_fnc_numberText]]remoteExec ["life_fnc_broadcast",RCLIENT];
	_log = [player, _robber, life_cash, 4, life_atmcash, 0];
	LOG_to_HC(0,_log);
	life_cash = 0;
}
	else
{	
	[2,"STR_NOTF_RobFail",true,[profileName]]remoteExec ["life_fnc_broadcast",_robber];
};