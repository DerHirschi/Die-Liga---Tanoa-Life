#include "\life_server\Liga_Macros.hpp"
/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠══════════════════════════════════════════════════╝
	║ File: fn_ligaWHinit.sqf
	║ Author: Hirschi Liga-Life
	║
	║ Description:
	║ Ware House Bestand Array aus DB auslesen ( INIT )
	╚══════════════════════════════════════════════════╝
*/
private ["_query","_queryResult","_row"];

{

	_query 			= format["WHinit:%1",_x];	
	_queryResult 	= [_query,2,true] call DB_fnc_asyncCall;
	_queryResult	= SEL(_queryResult,0);
	_queryResult	= SEL(_queryResult,0);
	SVAR_MNS [_x,_queryResult];	
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║ - Liga WareHouse !!  DB Request Init Array ";
	diag_log format["║ QUERY: %1",_query];
	diag_log format["║ _queryResult: %1",_queryResult];
	diag_log format["║ WH_id: %1",_x];	
	diag_log "╠══════════════════════════════════════════════════╣";

}forEach ["liga_wh_1","liga_wh_2","liga_wh_3","liga_wh_4"];
