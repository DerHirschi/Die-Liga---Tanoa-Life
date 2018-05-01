#include "\life_server\Liga_Macros.hpp"
//#include "..\..\..\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
*/
private["_query"];
_player 	= [_this,0,objNull,[objNull]] call BIS_fnc_param;
_zahhleArr  = [_this,1,[],[[]]] call BIS_fnc_param;

if((isNull _player) || !(EQUAL(count _zahhleArr,5))) exitWith {diag_log "LOTTOADDSCHEIN: OBJ NULL || ZAHLEN 0";};
_uid		= getPlayerUID _player;


// DB Gedöhns 

_query = format["LottoAddSchein:%1:%2:%3",_zahhleArr,_uid,5];	

[_query,2] call DB_fnc_asyncCall;
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║ LOTTOSCHEIN wurde gekauft !! DB LOG ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ Query		: %1",_query];
//diag_log format["║ _queryResult	: %1",_queryResult];
diag_log "╚══════════════════════════════════════════════════╝";


[_zahhleArr] remoteExec ['LIGACL_fnc_LottoAddLosNR',_player];

