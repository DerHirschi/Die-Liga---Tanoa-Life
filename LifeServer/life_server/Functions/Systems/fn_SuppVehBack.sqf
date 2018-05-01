#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_vehicleDelete.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't actually delete since we don't give our DB user that type of
	access so instead we set it to alive=0 so it never shows again.
*/
private["_vid","_query","_thread","_pid"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
//_targ = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_pid = [_this,3,"",[""]] call BIS_fnc_param;
//diag_log format ["<<<<<<%1    %2",_vid, _targ];
if(_vid isEqualTo -1 OR _pid isEqualTo "") exitWith {};

//_pid = getPlayerUID _targ;
//diag_log format ["<<<<<<%1    %2",_pid,name _targ];
_query = format["vehicleUpdateAliveSupp:%1:%2",_pid,_vid];

_thread = [_query,1] call DB_fnc_asyncCall;
