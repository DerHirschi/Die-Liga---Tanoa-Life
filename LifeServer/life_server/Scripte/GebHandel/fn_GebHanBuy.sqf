#include "\life_server\Liga_Macros.hpp"
/*
	Author: Hirschi

*/
_player		= [_this,0,ObjNull	,[ObjNull]] call BIS_fnc_param;
_id			= [_this,1,-1		,[-1	 ]] call BIS_fnc_param;

diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ Gebrauchtwagen Handler !! BUY RPT ";


if(isNull _player || EQUAL(_id,-1) ) exitWith {
	
	diag_log "║ Gebrauchtwagen Handler !! ERROR player NULL !! ";
	diag_log "╠══════════════════════════════════════════════════╣";
};

_query 		= format["GebWagenGetUID:%1",_id	];
_res		= [_query,2] call DB_fnc_asyncCall;
diag_log 	format["║ _res GebWagenGetUID	: %1",_res];
_halterUID	= SEL(_res,0);
_preis		= SEL(_res,1);
_class		= SEL(_res,2);

_halterObj	= [_halterUID,1] call life_fnc_isUIDActive;
_kauferUID 	= getPlayerUID _player;
//if( EQUAL(_kauferUID,_halterUID)		) exitWith {};
if( isNull _halterObj || ( _preis < 1 ) ) exitWith {
	
	diag_log "║ Gebrauchtwagen Handler !! ERROR Owner NULL !! ";
	diag_log "╠══════════════════════════════════════════════════╣";
	
	[1,"Der Fahrzeughalter ist leider nicht erreichbar.. Bitte versuche es spaeter noch einmal"] remoteExec ["life_fnc_broadcast",_player];
};

_query = format["GebWagenBUY:%2:%1",_id,_kauferUID];
[_query,2] call DB_fnc_asyncCall;



[_preis,1,_class] remoteExec ['LIGACL_fnc_LottoGetWin',_halterObj];
[_preis,2,_class] remoteExec ['LIGACL_fnc_LottoGetWin',_player];



diag_log "╠══════════════════════════════════════════════════╣";