#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga	
	
	Description:
	Updates the storage for a house blah blah
*/
private["_house","_keys"];
_house 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_keyUID		= [_this,1,"",		[""]		] call BIS_fnc_param;
if(isNull _house) exitWith {};

_trunkData 	= _house GVAR["Trunk",[[],0]];
_houseID 	= _house GVAR["house_id",-1];
_kasse	 	= _house GVAR["Kasse",-1];
_keys	 	= _house GVAR["KEYS",[]];
_preise	 	= _house GVAR["TankPreis",[100,150,700]];
//diag_log str _keys;
if(EQUAL(_houseID,-1)) exitWith {}; //Dafuq?

//_trunkData = [_trunkData] call DB_fnc_mresArray;
//_trunkData = format ["%1",_trunkData];
//_trunkData = call compile format ["%1",_trunkData];
if!(EQUAL(_keyUID,"")) then {
	if!(_keyUID in _keys)then {
		_keys pushBack _keyUID;
		_house SVAR["KEYS",_keys];	
	};
};	

_query = format["TankUpdateInventory:%1:%2:%3:%4:%5",_trunkData,_kasse,_keys,_preise,_houseID];

[_query,1] call DB_fnc_asyncCall;