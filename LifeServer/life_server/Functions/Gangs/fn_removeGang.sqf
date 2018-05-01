#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
//private["_group","_groupID"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
_groupID = [_this,1,-1,[-1]] call BIS_fnc_param;

if(EQUAL(_groupID,-1)) exitWith {};

[format["gangRemove:%1",_groupID],2] call DB_fnc_asyncCall;


if(isNull _group) exitWith {};
//diag_log format ["<<<<<<<<<<%1",_group];
[_group] remoteExecCall ["life_fnc_gangDisbanded",(units _group)];


sleep 5;
deleteGroup _group;