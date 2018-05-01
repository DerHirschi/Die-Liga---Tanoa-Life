#include "\life_server\Liga_Macros.hpp"
/*
	BLAH BLAH
	I LOVE NOTEPAD++ GET OVER IT
	BLAH!
*/
private["_house","_houseID","_containers","_query"];
_house 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
diag_log str _house;
if(isNull _house) 		exitWith {diag_log "LADEN HAUS NULL";};
_houseID 	= _house GVAR["laden_id",-1];
diag_log str _houseID;
if(EQUAL(_houseID,-1)) 	exitWith {diag_log "LADEN ID -1 ";};

_containers = _house GVAR ["kassen",[]];
_extra	 	= _house GVAR ["ladextra",["",0,0]];
diag_log str _containers;
_kassin 	= [];
_kasspreis 	= [];
{
	_kassin 	pushBack (SEL(_x,0) GVAR ["kassinh",-1]);
	_kasspreis 	pushBack (SEL(_x,0) GVAR ["kasspreis",[-1,-1,-1]]);	
	
} foreach _containers;


//_arr = [_arr] call DB_fnc_mresArray;
//_arr = call compile format ["%1",_arr];

_query = format["LadenUpdateKassen:%1:%2:%3:%4",_kassin,_kasspreis,_extra,_houseID];

[_query,1] call DB_fnc_asyncCall;
