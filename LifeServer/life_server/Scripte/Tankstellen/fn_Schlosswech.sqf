#include "\life_server\Liga_Macros.hpp"
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {diag_log ":SERVER:sellHouse: House is null";};

_houseID = _house GVAR["house_id",-1];
if(EQUAL(_houseID,-1)) exitWith {};

[_house]call TON_fnc_updateTankTrunk;

{[_x,civilian,_house,3] call TON_fnc_keyManagement; }forEach (_house GVAR["KEYS",[]]);

_house SVAR["KEYS",[]];