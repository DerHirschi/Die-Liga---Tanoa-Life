#include "\life_server\Liga_Macros.hpp"
/*

	file: fn_msgRequest.sqf
	Author: Silex
	
	Fills the Messagelist
*/
private["_query","_queryResult","_targ"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,2,0,[0]] call BIS_fnc_param;

if(_mode isEqualTo 3)exitWith {
	_query = format["MSGcount:%1",_uid];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;

	
};

if(_mode isEqualTo 0)exitWith {
	_query = format["MSGread:%1",_uid];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult isEqualTo 0) exitWith {};
	{
		[2,_x] remoteExecCall ["liga_fnc_MessApp",_player]; 
		
	}forEach _queryResult;
};

if(_mode isEqualTo 1)exitWith {
	_targ = [_this,3,"",[""]] call BIS_fnc_param;
	_query = format["MSGreadChat:%1:%2:%3:%4",_uid,_uid,_targ,_targ];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	//diag_log format ["<<<<<<<<<<< %1",_queryResult];
	
	if(count _queryResult isEqualTo 0) exitWith {};
	{
		[0,_x] remoteExecCall ["liga_fn_getChatStr",_player];
		
		uiSleep 0.1;
	}forEach _queryResult;	
	uiSleep 0.1;
	[2] remoteExec ["liga_fn_getChatStr",_player];
	
};