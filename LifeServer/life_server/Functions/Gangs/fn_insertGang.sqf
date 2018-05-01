#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"];
params [
	["_ownerID",objNull,[objNull]],
	["_uid","",[""]],
	["_gangName","",[""]]
];
_ownerName = [_this,3,"",[""]] call BIS_fnc_param;
_group = group _ownerID;

if(isNull _ownerID OR EQUAL(_uid,"") OR EQUAL(_gangName,"")) exitWith {}; //Fail

_ownerID = owner _ownerID;
_query = format["gangNameSelectID:%1:%2",_gangName,1];

_queryResult = [_query,2,true] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if(!(EQUAL(count _queryResult,0))) exitWith {
	[1,"Es existiert bereits eine Gang mit diesem Namen..."] remoteExecCall ["life_fnc_broadcast",_ownerID];
	life_action_gangInUse = nil;
	PVAR_ID("life_action_gangInUse",_ownerID);
};

_query = format["gangIDPlayer:%2%1%2",_uid,"%"];

_queryResult = [_query,2,true] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if(!(EQUAL(count _queryResult,0))) exitWith {
	[1,"Du bist bereits in einer Gang..."] remoteExecCall ["life_fnc_broadcast",_ownerID];
	life_action_gangInUse = nil;
	PVAR_ID("life_action_gangInUse",_ownerID);
};

//Check to see if a gang with that name already exists but is inactive.
_query = format["gangNameSelectID:%1:%2",_gangName,0];

_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_gangMembers = [[_uid,_ownerName]];

if(!(EQUAL(count _queryResult,0))) then {
	_query = format["gangUpdate:%1:%2:%3",_uid,_gangMembers,(_queryResult select 0)];
} else {
	_query = format["gangInsert:%1:%2:%3",_uid,_gangName,_gangMembers];
};

_queryResult = [_query,1] call DB_fnc_asyncCall;

_group SVAR["gang_name",_gangName,true];
_group SVAR["gang_owner",_uid,true];
_group SVAR["gang_bank",0,true];
_group SVAR["gang_maxMembers",8,true];
_group SVAR["gang_members",[[_uid,_ownerName]],true];
[_group] remoteExecCall ["life_fnc_gangCreated",_ownerID];

sleep 0.35;
_query = format["gangNameSelectID:%1:%2",_uid,1];

_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_group SVAR ["gang_id",SEL(_queryResult,0),true];
