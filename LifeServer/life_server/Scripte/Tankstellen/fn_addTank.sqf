#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Blah
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_sup = [_this,3,80,[0]] call BIS_fnc_param;
_die = [_this,4,100,[0]] call BIS_fnc_param;
_ker = [_this,5,700,[0]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;


_query = format["TankAddTank:%1:%2:%3:%4:%5:%6:%7:%8",
				_uid,
				_housePos,
				[[],0],				//INV
				[_sup,_die,_ker],	//Preise
				0,					//Kasse
				1,					//Owned Bit
				0,					//Mahnungcount
				[]					//Key´s
			   ];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format["House ID assigned: %1",_queryResult select 0];
_house SVAR["house_id",(SEL(_queryResult,0)),true];

diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║-------------------------------  Tankstelle wurde gekauft !! DB LOG----------------------------  ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ Query: %1",_query];
diag_log "╚══════════════════════════════════════════════════╝";
