#include "\life_server\Liga_Macros.hpp"
/*
	Author: Hirschi

*/
_client 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _client) exitWith {};
_queryResult 	= ["GebWagenInfo",2,true] call DB_fnc_asyncCall;
_res 			= [];

diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ Gebracuhtwagen Händler !! Debug RPT ";
diag_log "╠══════════════════════════════════════════════════╣";

{
	diag_log 		format["║ _x		: %1",_x];
	if([SEL(_x,2),0] call life_fnc_isUIDActive) then {
		_res pushBack [SEL(_x,0),SEL(_x,1),SEL(_x,3)];
		diag_log 	format["║ _x active	: %1",_x];
	};	
	
}forEach _queryResult;


/*
[_res] remoteExec [""]
*/
[1,_res] remoteExec ["LIGACL_fnc_GebHanShowList",_client];

diag_log "╠══════════════════════════════════════════════════╣";
