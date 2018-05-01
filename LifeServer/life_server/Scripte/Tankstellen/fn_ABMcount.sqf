#include "\life_server\Liga_Macros.hpp"
private["_query","_queryRes","_house"];

_house 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_player		= [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _house ||isNull _player) exitWith {};

_houseID 	= _house GVAR["house_id",-1];

if(EQUAL(_houseID,-1)) exitWith {}; //Dafuq?

_query = format["TankAbmCount:%1",_houseID];

_queryRes = [_query,2,true] call DB_fnc_asyncCall;

[1,(format["Du hast bereits %1 Abmahnung(en) erhalten",(SEL(SEL(_queryRes,0),0))])] remoteExecCall ["life_fnc_broadcast",_player];