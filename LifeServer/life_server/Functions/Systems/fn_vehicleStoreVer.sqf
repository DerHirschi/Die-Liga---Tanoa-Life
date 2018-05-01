#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi Liga Life
	
	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_repcount","_vInfo","_vInfo","_tuv","_plate","_uid","_query","_sql","_unit","_dam_ar"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.

_vInfo 		= _vehicle GVAR["dbInfo",[]];
_repcount 	=  _vehicle GVAR["tuv",[]];
if(count _vInfo > 0) then
{
	_plate = 	_vInfo select 1;
	_uid = 		_vInfo select 0;
};	
if(count _repcount isEqualTo 0) then {_repcount = 0;_tuv = 0;}else{_tuv = _repcount select 0;_repcount = _repcount select 1;};

if(_impound) then
{
	if(count _vInfo isEqualTo 0) then 
	{
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} 
		else
	{
		//_dam_ar = [_this,3,[],[[]]] call BIS_fnc_param;
		_dam_ar = [_vehicle] call TON_fnc_getHit;
		_query = format["vehicleVerwahrstelle:0:%1:%2:%3:%4:%5:%6",_uid,_plate,_dam_ar,"Imp",_repcount,_tuv];

		//_query = format["UPDATE vehicles SET active='0', type='Imp', damage='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_dam_ar];
		
		_thread = [_query,1] call DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
}
	else
{
	if(count _vInfo isEqualTo 0) exitWith
	{
		[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};
	
	if(_uid != getPlayerUID _unit) exitWith
	{
		[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};
	
	_dam_ar = [_vehicle] call TON_fnc_getHit;
	_query = format["vehicleVerwahrstelle:0:%1:%2:%3:%4:%5:%6",_uid,_plate,_dam_ar,"Imp",_repcount,_tuv];
	
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
	[1,(localize "STR_Garage_Store_Success")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
};