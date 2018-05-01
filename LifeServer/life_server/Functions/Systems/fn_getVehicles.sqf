#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_side","_type","_unit","_queryResult","_query"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(EQUAL(_pid,"") || EQUAL(_side,"") || EQUAL(_type,"") || isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[]] remoteExec ["life_fnc_impoundMenu",(owner _unit)];
	};
};

_unit = owner _unit;
/*
_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	case east: {"adac"};
	default {"Error"};
};
*/

if(_side isEqualTo "Error") exitWith {
		[[]] remoteExec ["life_fnc_impoundMenu",(owner _unit)];
};

switch (_type) do {
	
	case "CHOP": 	{_query = format["vehiclesInfoCHOP:%1:%2:%3",_pid,_side,_type];};
	
	default 		{_query = format["vehiclesInfo:%1:%2:%3",_pid,_side,_type];};
};
/*
if(_type isEqualTo "CHOP")then{
	_query = format["vehiclesInfoCHOP:%1:%2:%3",_pid,_side,_type];
	}else{
	_query = format["vehiclesInfo:%1:%2:%3",_pid,_side,_type];
};
*/
//_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
/*
if (debugRPT_srv) then {	
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║-----------------------  Garage - Farhzeug ausgeparkt DB LOG  ----------------------- ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║                          ------------- Client Query Request -------------                                 ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║QUERY: %1",_query];
diag_log format["║Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["║Result: %1",_queryResult];
diag_log "╚══════════════════════════════════════════════════╝";
 };
*/ 
if(typeName _queryResult == "STRING") exitWith {
	[[]] remoteExec ["life_fnc_impoundMenu",(owner _unit)];
};
[_queryResult] remoteExec ["life_fnc_impoundMenu",_unit];
