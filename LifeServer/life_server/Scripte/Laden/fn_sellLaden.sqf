#include "\life_server\Liga_Macros.hpp"

private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};

_houseID = _house GVAR["laden_id",-1];
if(_houseID == -1) then {
	_housePos = getPosATL _house;
	_ownerID = (_house GVAR "house_owner") select 0;
	_query = format["LadenSellHouse:%1:%2:%3",[],_ownerID,_housePos];
} else {
	_query = format["LadenSellHouse2:%1",_houseID];
};

_house SVAR["laden_id",nil,true];
_house SVAR["house_owner",nil,true];

if(!isNil {(_house GVAR "kassen")}) then {	
	{
		if(!isNull (SEL(_x,0))) then {				
			deleteVehicle (SEL(_x,0));
		};
		{
			if(!isNull _x) then {
				deleteVehicle _x;
			};
		}foreach (SEL(_x,1));
	} foreach (_house GVAR "kassen");
	_house SVAR["kassen",nil,true];
}else{
	_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
	_containers = nearestObjects[(getPosATL _house),["Land_CashDesk_F","Land_ShelvesMetal_F"],_radius];
	{deleteVehicle _x} foreach _containers; //Fuck the way you do things Tonic, go fix it
};
Liga_Laden = Liga_Laden - [ObjNull];

[_query,1] call DB_fnc_asyncCall;
_house SVAR["house_sold",nil,true];
