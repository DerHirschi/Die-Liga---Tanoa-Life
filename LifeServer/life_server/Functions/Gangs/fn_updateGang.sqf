#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the gang information?
*/
private["_mode","_group","_groupID","_bank","_maxMembers","_members","_query","_owner"];

params [
	["_mode",0,[0]],
	["_group",grpNull,[grpNull]]
];

if(isNull _group) exitWith {hint "Fail"}; //FAIL

_groupID = _group GVAR["gang_id",-1];
if(EQUAL(_groupID,-1)) exitWith {};

switch (_mode) do {
	case 0: {
		_bank = [(_group GVAR ["gang_bank",0])] call DB_fnc_numberSafe;
		_maxMembers = _group GVAR ["gang_maxMembers",8];
		_members = _group GVAR "gang_members";
		_owner = _group GVAR ["gang_owner",""];
		if(EQUAL(_owner,"")) exitWith {};

		_query = format["gangInfoUpdate:%1:%2:%3:%4",_bank,_maxMembers,_owner,_groupID];
	};

	case 1: {
		_query = format["gangBankInfoUpdate:%1:%2",([(_group GVAR ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
	};

	case 2: {
		_query = format["gangMaxMembersUpdate:%1:%2",(_group GVAR ["gang_maxMembers",8]),_groupID];
	};

	case 3: {
		_owner = _group GVAR["gang_owner",""];
		if(EQUAL(_owner,"")) exitWith {};
		_query = format["gangOwnerUpdate:%1:%2",_owner,_groupID];
	};

	case 4: {
		_members = _group GVAR "gang_members";
		_query = format["gangMembersUpdate:%1:%2",_members,_groupID];
	};
};

if(!isNil "_query") then {
	
	[_query,1] call DB_fnc_asyncCall;
};
