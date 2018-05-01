#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_isUIDActive.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Luga
	
	Description:
	Sees if the UID passed to it is in the server.
	
	Returns:
	True if there was a match, false if not in server.
*/
private["_uid","_ret"];
_uid 	= [_this,0,"",[""]] call BIS_fnc_param;
_mode 	= [_this,1,0 ,[-1]] call BIS_fnc_param;

switch(_mode) do {
	case 0: {
		if(EQUAL(_uid,"")) exitWith {_ret = false;}; //Bad UID
		_ret = false;
		{
			if(EQUAL((getPlayerUID _x),_uid) ) exitWith {_ret = true;};
		} foreach playableUnits;		
	};
	case 1: {
		if(EQUAL(_uid,"")) exitWith {_ret = objNull;}; //Bad UID
		_ret = objNull;
		{
			if(EQUAL((getPlayerUID _x),_uid) ) exitWith {_ret = _x;};
		} foreach playableUnits;		
	};	
};


_ret;