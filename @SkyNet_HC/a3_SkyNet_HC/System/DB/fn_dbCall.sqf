//#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
#define KEY_SWITCH(DB) switch (DB) do {\
									case 0:{_key = "extDB1" callExtension format["%1:%2:%3",_mode,(call HC_SQL_ID1),_queryStmt]; _extDB = "extDB1";};\
									case 1:{_key = "extDB2" callExtension format["%1:%2:%3",_mode,(call HC_SQL_ID2),_queryStmt]; _extDB = "extDB2";};\
									case 2:{_key = "extDB3" callExtension format["%1:%2:%3",_mode,(call HC_SQL_ID3),_queryStmt]; _extDB = "extDB3";};\
										}

/*
	File: fn_asyncCall.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Commits an asynchronous call to ExtDB
	Parameters:
		0: STRING (Query to be ran).
		1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
		3: BOOL (True to return a single array, false to return multiple entries mainly for garage).
*/

private["_queryStmt","_queryResult","_key","_mode","_return","_loop","_extDB"];

_tickTime = diag_tickTime;

_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;
_multiarr = [_this,2,false,[false]] call BIS_fnc_param;
_db = [_this,3,-1,[0]] call BIS_fnc_param;
if(_db isEqualTo -1) exitWith {};
_extDB = "";
//RPT("_db",_db);
//RPT("_queryStmt",_queryStmt);
//RPT("HC_SQL_ID1",HC_SQL_ID1);
//RPT("HC_SQL_ID1",(call HC_SQL_ID1));

KEY_SWITCH(_db);

if(_mode isEqualTo 1) exitWith {true};

_key = call compile format["%1",_key];
_key = _key select 1;

_queryResult = "";
_loop = true;

while{_loop} do
{
    _queryResult = _extDB callExtension format["4:%1", _key];

    if (_queryResult isEqualTo "[5]") then {
	
		_queryResult = "";
		while{true} do {
			_pipe = _extDB callExtension format["5:%1", _key];
			if(_pipe isEqualTo "") exitWith {_loop = false};
        	_queryResult = _queryResult + _pipe;
        };
    } else {
		if (_queryResult isEqualTo "[3]") then {
		
			uisleep 0.1;
		} else {
			_loop = false;
		};
	};
};

_queryResult = call compile _queryResult;

if(count (_queryResult select 1) isEqualTo 0) exitWith {[]};

_return = (_queryResult select 1);

if(!_multiarr) then {
        _return = _return select 0;
};

_return;
