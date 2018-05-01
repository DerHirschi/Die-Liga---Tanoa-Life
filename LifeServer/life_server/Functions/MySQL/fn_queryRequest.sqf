#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles the incoming request and sends an asynchronous query
	request to the database.

	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_keyArr","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

//diag_log str _side;
//diag_log str _ownerID;
//diag_log str _uid;

if(isNull _ownerID || EQUAL(_uid,"")) exitWith {diag_log "QUERY REQUEST Kein obj oder UID";};
if!(EQUAL(_uid,getPlayerUID _ownerID)) exitWith {diag_log "QUERY REQUEST UID != _UID"};

_ownerID = owner _ownerID;

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {
	case west: 			{format["playerWestInfo:%1",_uid];};
	//case civilian: 		{format["playerCivInfo:%1",_uid];};
	//case independent: 	{format["playerIndependentInfo:%1",_uid];};
	case east: 			{format["playerEastInfo:%1",_uid];};
	case default 		{format["playerCivInfo:%1",_uid];};
};

_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Client Query Request -------------",
		format["QUERY: %1",_query],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

if(typeName _queryResult == "STRING") exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

if(EQUAL(count _queryResult,0)) exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

_queryResult = SEL(_queryResult,0);

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = SEL(_queryResult,2);
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = SEL(_queryResult,3);
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Convert tinyint to boolean
_old = SEL(_queryResult,6);
for "_i" from 0 to (count _old)-1 do
{
	_data = SEL(_old,_i);
	_old set[_i,[SEL(_data,0), ([SEL(_data,1),1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

	/*
		[
			ID						0
			STEAM ID				1
			CASH					2
			BANK					3
			life_adminlevel		4
			life_donator			5
			licenses				6
			life_is_arrested		7
			life_gear				8			
			life_house				9
			life_gangData			10
			life_blacklisted		11			
			_keyArr				12
			liga_tankhouses		13
			life_coplevel			14
			life_mediclevel		15
			liga_ladenhouses		16
		]
	*/

//Parse data for specific side.
switch (_side) do {

	case east: 			{};
	case west: 			{};
	//case independent: 	{};

	case default {
		/*Arrested*/
		_queryResult set[7,([SEL(_queryResult,7),1] call DB_fnc_bool)];
		/*LRK Level*/
		_queryResult set[15,(SEL(_queryResult,11))];				
		/*Blacklisted*/
		_queryResult set[11,(SEL(_queryResult,9))];
		/*COP Level*/
		_queryResult set[14,(SEL(_queryResult,10))];

		/*Housing*/
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
	
		_queryResult set [9,(GVAR_MNS[format["houses_%1",_uid],[]])];
		/*Gang*/
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult set [10,(GVAR_MNS[format["gang_%1",_uid],[]])];
		/*Tankstellen*/
		_tankData = _uid spawn TON_fnc_fetchPlayerTanks;
		waitUntil{scriptDone _tankData};
		_queryResult set [13,(GVAR_MNS[format["tankst_%1",_uid],[]])];
		/*Läden*/
		_ladenData = [_uid,_side] spawn TON_fnc_fetchPlayerLaden;
		waitUntil {scriptDone _ladenData};
		_queryResult set [16,(GVAR_MNS[format["laden_%1",_uid],[]])];
		
		//{diag_log format ["<<<%1",_x];}foreach _queryResult;
	};	
};
/*KEYs*/
_keyArr = GVAR_MNS [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[12,_keyArr];

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];
