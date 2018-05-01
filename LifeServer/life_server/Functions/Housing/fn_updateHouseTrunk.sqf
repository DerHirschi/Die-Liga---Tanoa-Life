#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the storage for a house blah blah
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};

_trunkData = _house GVAR["Trunk",[[],0]];
_houseID = _house GVAR["house_id",-1];

if(EQUAL(_houseID,-1)) exitWith {}; //Dafuq?

//_trunkData = [_trunkData] call DB_fnc_mresArray;
//_trunkData = format ["%1",_trunkData];
//_trunkData = call compile format ["%1",_trunkData];
_query = format["housingUpdateInventory:%1:%2",_trunkData,_houseID];

[_query,1] call DB_fnc_asyncCall;