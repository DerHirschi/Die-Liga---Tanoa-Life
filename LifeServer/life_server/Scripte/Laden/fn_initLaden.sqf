#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
	
	Make some Noise ?????? again ?? 
*/
private["_queryResult","_house"];

	
_queryResult = ["LadenInit",2,true] call DB_fnc_asyncCall;

//diag_log format ["<<<LADEN INIT<<<<< _queryResult%1",_queryResult];

if(EQUAL(count _queryResult,0)) exitWith {};
{
	_pos = call compile format["%1",SEL(_x,2)];
	//diag_log format ["<<<<laden<<<< pos %1",_pos];
	//_house = nearestObject [_pos, "House_F"];
	_house = nearestBuilding _pos;
	_house SVAR["house_owner",[SEL(_x,1),SEL(_x,3)],true];
	_house SVAR["laden_id",SEL(_x,0),true];
	_house SVAR["locked",true,true]; //Lock up all the stuff.
	


} foreach _queryResult;

