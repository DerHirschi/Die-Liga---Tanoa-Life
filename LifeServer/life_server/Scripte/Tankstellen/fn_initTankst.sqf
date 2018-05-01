#include "\life_server\Liga_Macros.hpp"
/*
	
	TON_fnc_initTankst
	
	[
		ID				0
		UID				1
		POS				2
		NAME			3
		PREISE			4
		KASSE			5
		MAHNUNGCOUNT	6
		INVENTAR		7
		KEYS			8
		
	]
	
*/

private["_queryResult","_query","_house"];

_queryResult = ["TankInit",2,true]call DB_fnc_asyncCall;
/*!!!!!!!!! DEBUG !!!!!!!!!!!!!!*/
//RPT("TANKSTELLEN INIT QUERRY RES",_queryResult);
/*!!!!!!!!! DEBUG !!!!!!!!!!!!!!*/
if(EQUAL(count _queryResult,0)) exitWith {};
{
	_pos = call compile format["%1",SEL(_x,2)];
	
	//diag_log format ["<<<<<<<< pos %1",_pos];
	//_house = nearestObject [_pos,"Land_fs_feed_F"];	
	//_house = nearestObject [_pos,"Land_FuelStation_01_pump_F"];	
	_house = nearestObjects [_pos, ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 25];
	_house = SEL(_house,0);
	//_house = nearestBuilding _pos;
	_house SVAR["house_owner",[SEL(_x,1),SEL(_x,3)],true];
	_house SVAR["house_id",SEL(_x,0),true];
	
	_house SVAR ["Trunk",SEL(_x,7),true];			
	_house SVAR ["TankPreis",SEL(_x,4),true];	
	_house SVAR ["Kasse",SEL(_x,5),true];	
	
	_house SVAR["locked",true,true]; //Lock up all the stuff.
	_house SVAR["KEYS",SEL(_x,8)]; //Lock up all the stuff.
	{
		[_x,civilian,_house,1] call TON_fnc_keyManagement;
	}forEach SEL(_x,8);
} foreach _queryResult;