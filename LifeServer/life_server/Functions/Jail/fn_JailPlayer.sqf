/*

	Sets jail values for player

*/
private["_player","_time"];

_player = _this select 0;
_playeruid = _this select 1;
_time = _this select 2;

_time = ceil _time; //to be sure

_player = owner _player;


_query = format["JailTimerArest:%1:%2", _time, _playeruid];
//waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
