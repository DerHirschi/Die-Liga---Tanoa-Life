/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
	
	Make some Noise ??????
*/
private["_queryResult","_query","_count","_house","_numOfDoors"];
//waitUntil{!DB_Async_Active};
//_count = (["housingCount",2] call DB_fnc_asyncCall) select 0;

//for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	
//_query = format["housingInit"];
_queryResult = ["housingInit",2,true] call DB_fnc_asyncCall;
//diag_log format ["<<<<<<<< _queryResult%1",_queryResult];
if(count _queryResult isEqualTo 0) exitWith {};
{
	_pos = call compile format["%1",_x select 2];
	//diag_log format ["<<<<<<<< pos %1",_pos];
	//_house = nearestObject [_pos, "House_F"];
	_house = nearestBuilding _pos;
	_house setVariable["house_owner",[_x select 1,_x select 3],true];
	_house setVariable["house_id",_x select 0,true];
	_house setVariable["locked",true,true]; //Lock up all the stuff.
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
} foreach _queryResult;
//};