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
║ File: fn_LeimDBget.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Leim stand von DB abrufen
╚══════════════════════════════════════════════════╝
*/
private ["_query","_queryResult","_row","_row1","_row2"];

	_query = format["LeimLoad"];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	_row = call compile format["%1",_queryResult]; 	
	_row = _row select 0;
	liga_leim_tank = _row select 0;
	liga_staa_tank = _row select 1;
	liga_civ_tank  = _row select 2;


diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ Leimstand aus DB abgefragt !!!";
diag_log format["║ _queryResult: %1",_queryResult];
diag_log format["║ Leim: %1",_row];
diag_log "╠══════════════════════════════════════════════════╣";
