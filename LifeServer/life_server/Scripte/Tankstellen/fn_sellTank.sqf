#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a 
	stored procedure on restart.
*/
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {diag_log ":SERVER:sellHouse: House is null";};

_houseID = _house GVAR["house_id",-1];
if(_houseID == -1) then {
	_housePos = getPosATL _house;
	_ownerID = (_house GVAR "house_owner") select 0;
	_query = format["TankSellTank:%1:%2:%3:%4",[],_ownerID,_housePos,[]];
	//systemChat format[":SERVER:sellHouse: house_id does not exist, query: %1",_query];
} else {
	//systemChat format[":SERVER:sellHouse: house_id is %1",_houseID];
	_query = format["TankSellTank2:%1",_houseID];
};

_house SVAR["house_id",nil,true];
_house SVAR["house_owner",nil,true];
_house SVAR["KEYS",nil];

[_query,1] call DB_fnc_asyncCall;
_house SVAR["house_sold",nil,true];