#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Displays wanted list information sent from the server.
*/
private["_ret","_list","_result","_queryResult","_units","_inStatement"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};
_ret = owner _ret;
_inStatement = "";
_list = [];
_units = [];
_tickTime = diag_tickTime;
//{if((side _x) isEqualTo civilian) then {_units pushBack (getPlayerUID _x)};} foreach playableUnits;
{if(true) then {_units pushBack (getPlayerUID _x)};} foreach playableUnits;

_result = "wantedFetchIDAll";
//waitUntil{!DB_Async_Active};
_queryResult = [_result,2,true] call DB_fnc_asyncCall;
//diag_log format ["<<<<<<<<_queryResult   %1",_queryResult];
//diag_log format ["<<<<<<<<_units   %1",_units];

{
	if (SEL(_x, 0) in _units) then
	{
		_list pushBack (_x);
	};	
}
forEach _queryResult;
//diag_log format ["<<<<<<<<_list   %1",_list];
if(count _list isEqualTo 0) exitWith {[_list] remoteExec ["life_fnc_wantedList",_ret];};

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Wanted Query Request -------------",
		format["QUERY: %1",_result],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

[_list] remoteExec ["life_fnc_wantedList",_ret];
