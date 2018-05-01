/*

	file: fn_cleanupMessages.sqf
	Author: Silex

	Description: Deletes all messages that belongs to the given id.
*/

_player = [_this,0,ObjNull,[objNull]] call BIS_fnc_param;
if(isNull _player) exitWith {};

_query = format["MSGdel:%1",getPlayerUID _player];

[_query,1] call DB_fnc_asyncCall;