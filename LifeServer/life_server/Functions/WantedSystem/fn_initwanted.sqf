#include "\life_server\Liga_Macros.hpp"

private ["_query","_queryResult","_gesuchter"];
_query = "SELECT list,id from wanted";
DB_WAIT_ASYNC;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;{
_gesuchter = [SEL(_x,0)] call DB_fnc_mresToArray;
if(typeName _gesuchter== "STRING") then {_gesuchter= call compile format["%1", _gesuchter];};
life_wanted_list = _gesuchter;
} forEach _queryResult;