#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Fetches all the players houses and sets them up.
	
	TON_fnc_fetchPlayerTanks
*/
private["_query","_houses","_pos","_house","_trunk"];
if(EQUAL(_this,"")) exitWith {};

_query = format["TankFetchPlayerTankst:%1",_this];

_houses = [_query,2,true] call DB_fnc_asyncCall;
//diag_log format [">>>>>>> %1",_houses];

_return = [];
{	
	//_pos = [_x select 1] call DB_fnc_mresString;
	_pos = call compile format["%1",_x select 1];
	//_pos = SEL(_x,1);
	//diag_log format [">>>>>>> pos %1",_pos];
	//_house = nearestObject [_pos,"Land_fs_feed_F"];
	_house = nearestObjects [_pos, ["Land_FuelStation_01_pump_F","Land_fs_feed_F","Land_FuelStation_02_pump_F"], 25];
	_house = SEL(_house,0);
	//_house = nearestBuilding _pos;
	
	VEH_DAMF(_house);
	

	//diag_log format [">>>>>>> _containerData %1",_containerData];

	
	
	_return pushBack [SEL(_x,1)];
} foreach _houses;

missionNamespace SVAR[format["tankst_%1",_this],_return];