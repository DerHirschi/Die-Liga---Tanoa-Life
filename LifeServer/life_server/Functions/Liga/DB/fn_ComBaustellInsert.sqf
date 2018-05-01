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
║ File: fn_ComBaustellInsert.sqf
║ Author: Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/
private["_query","_i"];

_array = (_this select 0);
_uid = _this select 1;
_type_ar = ["a5","cement","glass","stt"];
_i = 0;
{
//_query = format["UPDATE baustelle SET ist=ist+'%1' WHERE typ='%2'",_array select _i ,_x];
_query = format["BaustSET:%1:%2",(_array select _i) ,_x];
/*
if (debugRPT_srv) then {
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║--------------------------------    Baustelle  akt DB LOG    ------------------------------";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ Liga - Baustellen  Query: %1",_query];
diag_log format["║ Liga - Baustellen _array: %1",_array];
diag_log "╚══════════════════════════════════════════════════╝";
};
*/
//waitUntil{sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
_i = _i + 1;

} foreach _type_ar;

[_uid,_array] spawn TON_fnc_ComBaustellGet;