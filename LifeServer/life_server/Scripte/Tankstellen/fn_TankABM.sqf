#include "\life_server\Liga_Macros.hpp"

private["_query","_house"];
_house 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _house) exitWith {};

_houseID 	= _house GVAR["house_id",-1];

if(EQUAL(_houseID,-1)) exitWith {}; //Dafuq?

_query = format["TankAbmahnung:%1",_houseID];

[_query,1] call DB_fnc_asyncCall;