/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
private["_unit","_vehicle","_price","_dam_ar","_repcount","_tuv"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,2,500,[0]] call BIS_fnc_param;


//Error checks
if(isNull _vehicle OR isNull _unit) exitWith 
{
	[0,_vehicle] remoteExec ["life_fnc_chopRecv",_unit];
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_unit = owner _unit;
_repcount 	=  _vehicle getVariable["tuv",[]];
if(count _repcount isEqualTo 0) then {_repcount = 0;_tuv = 0;}else{_tuv = _repcount select 0;_repcount = _repcount select 1;};

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo > 0) then {
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;

	//_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	//_query = format["vehicleDead:2:%1:%2",_uid,_plate];	
	//_sql = [_query,1] call DB_fnc_asyncCall;
	
	if(_vehicle isKindOf "Car") then {
		_dam_ar = ["Car",0,0,1,1,1,1,1,1,0,0,0.3];
	}else{_dam_ar = [_vehicle] call TON_fnc_getHit;};	

	_query = format["vehicleUpdateActivePlateCHOP:2:%1:%2:%3:%4:%5:%6",_uid,_plate,_dam_ar,"CHOP",_repcount,_tuv];
	
	_sql = [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;

[_price,_vehicle] remoteExec ["life_fnc_chopRecv",_unit];
