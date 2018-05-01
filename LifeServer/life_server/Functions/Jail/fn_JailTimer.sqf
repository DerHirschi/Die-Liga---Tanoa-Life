private["_player","_query"];

_player = _this select 0;
_playeruid = _this select 1;

_player = owner _player;

_query = format["JailTimerUpdate:%1", _playeruid];
//waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_query = format["JailTimerEnd:%1", _playeruid];
//waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;