#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga

	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"];
params [
	"_uid",
	"_name",
	["_money",0],
	["_bank",65001],
	["_returnToSender",objNull,[objNull]]
];
//Error checks
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {}; //No one to send this to!

_query = format["playerInfo:%1",_uid];


_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Insert Query Request -------------",
		format["QUERY: %1",_query],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

//Double check to make sure the client isn't in the database...
if(typeName _queryResult == "STRING") exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)];}; //There was an entry!
if(count _queryResult != 0) exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)];};

//Clense and prepare some information.
_alias = [[_name]];
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["playerInfoInsert:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14",
	_uid,
	_name,
	_money,
	_bank,
	_alias,
	[],	// Cop Licenses
    [], // Med Licenses
    [], // Civ Licenses
    [], // Civ Gear
    [], // Cop Gear
    [],  // Med Gear
    [],  // ADAC Gear
    [],  // ADAC Licenses
	0
];


[_query,1] call DB_fnc_asyncCall;
[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)];