#include "\life_server\Liga_Macros.hpp"

private["_vehicle","_vInfo","_plate","_uid","_query","_newUid"];

_vehicle 	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_newUid 	= [_this,1,"",[""]] call BIS_fnc_param;
_ownerUid 	= [_this,2,"",[""]] call BIS_fnc_param;
diag_log str _vehicle;
diag_log str _newUid;
if(isNull _vehicle || EQUAL(_newUid,"")) exitWith {}; //Bad data passed.

_vInfo 		=  _vehicle GVAR["dbInfo",[]];
diag_log str _vInfo;
if!(EQUAL(count _vInfo,0)) then
{
	_plate 	= SEL(_vInfo,1);
	_uid 	= SEL(_vInfo,0);
	if!(EQUAL(_uid,_ownerUid)) exitWith {};
	_vInfo set [0,_newUid];

	_vehicle SVAR["dbInfo",_vInfo];
	 diag_log str _vInfo;
	_query = format["vehicleUpdateOwner:%1:%2:%3",_uid,_plate,_newUid];

	_thread = [_query,1] call DB_fnc_asyncCall;

};