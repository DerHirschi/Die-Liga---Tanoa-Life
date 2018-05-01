#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_insertVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga

	Description:
	Inserts the vehicle into the database
*/
private["_uid","_side","_type","_className","_color","_plate","_query","_HitClass","_veh"];
_uid 		= [_this,0,"",[""]] call BIS_fnc_param;
_side 		= [_this,1,"",[""]] call BIS_fnc_param;
_type 		= [_this,2,"",[""]] call BIS_fnc_param;
_className 	= [_this,3,"",[""]] call BIS_fnc_param;
_color 		= [_this,4,-1,[0]] call BIS_fnc_param;
_plate 		= [_this,5,-1,[0]] call BIS_fnc_param;
_veh 		= [_this,6,ObjNull,[ObjNull]] call BIS_fnc_param;

//Stop bad data being passed.
if(EQUAL(_uid,"") || EQUAL(_side,"") || EQUAL(_type,"") || EQUAL(_className,"") || EQUAL(_color,-1) || EQUAL(_plate,-1) ) exitWith {};

_HitClass	= SEL(getAllHitPointsDamage _veh,2);
/*
switch(_type) do {
		case "Air" 	: { 	_HitClass = ["Air",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];	  };	  
	  	case "Car"	: { 	_HitClass = ["Car",0,0,0,0,0,0,0,0,0,0,1]; 	 };	  
	  	//case "Ship" : { 	_HitClass = ["Ship",0,0,0,1];	  };	  
		default { _HitClass = [];};
	};	  
*/

_query = format["vehicleInsert:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",
	_side,
	_className,
	_type,
	_uid,
	1,
	1,
	[],
	_color,
	_plate,
	[_HitClass,1]
];


[_query,1] call DB_fnc_asyncCall;