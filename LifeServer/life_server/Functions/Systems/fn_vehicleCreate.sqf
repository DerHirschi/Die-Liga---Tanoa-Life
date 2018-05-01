#include "\life_server\Liga_Macros.hpp"

/*
	File: fn_vehicleCreate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Answers the query request to create the vehicle in the database.
*/
private["_uid","_side","_type","_classname","_color","_plate"];
_uid 		= [_this,0,"",[""]] call BIS_fnc_param;
_side 		= [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_vehicle 	= [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_color 		= [_this,3,-1,[0]] call BIS_fnc_param;
_name 		= [_this,4,"",[""]] call BIS_fnc_param;


//Error checks
if(_uid isEqualTo "" || _side isEqualTo sideUnknown || isNull _vehicle ) exitWith {};
if(!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
 
_type = switch(true) do
{
	case (_className in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")): {"BOHR"};
	case (_className in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")): {"CARGO"};
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
	
};

//diag_log str M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh");
//diag_log str _className;
//diag_log str (_className in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh"));

/*
	_side = switch(_side) do {
		case west: {"cop"}; 
		case independent: {"med"}; 
		case east: {"adac"};
		default {"civ"};
	};			
*/	

_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	case east: {"adac"};
	default {"Error"};
};
				  
_plate = round(random(9999999));
[_uid,_side,_type,_classname,_color,_plate,_vehicle] call DB_fnc_insertVehicle;

_vehicle SVAR["dbInfo",[_uid,_plate,_name]];
if( _type isEqualTo "BOHR" ) then {
	
	[_uid,_plate,_vehicle,_name]spawn {
		private ["_n","_query","_queryResult"];
		uiSleep 2;
		_queryResult = [];
		_n = 0;
		while {(EQUAL(_queryResult,[])) && (_n < 10) } do {
			_query = format["vehicleInfoID:%1:%2",(SEL(_this,0)),(SEL(_this,1))];
			_queryResult = [_query,2,true] call DB_fnc_asyncCall;
			
			//diag_log str _query;
			//diag_log str _queryResult;
			_n = _n + 1;
			uiSleep 2;
		};
		_queryResult = SEL(_queryResult,0);	
		[(SEL(_this,2)),"dbInfo",[(SEL(_this,0)),(SEL(_this,1)),(SEL(_this,3)),(SEL(_queryResult,0))],false] remoteExec ["SKY_fnc_setObjVar",HC_id];
	};	
};
_vehicle SVAR["tuv",[0,0],true];
_vehicle SVAR["vehicle_info_owners",[[_uid,_name]],true];
_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"];