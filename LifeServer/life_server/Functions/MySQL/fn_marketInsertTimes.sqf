/*
	File: fn_marketInsertTimes.sqf
	Author: Jannis "Cr41s3"
    Edited by: Lukas "Alduin86"
	Edited by: Hirschi Liga-Life

	Description:
	Inserts how often the item has been sold
*/

//private["_shortname","_amount","_query"];

_shortname = (_this select 0);
_amount = (_this select 1);

//_query = format["UPDATE resources SET selltimes=selltimes+'%1' WHERE resource='%2'",_amount,_shortname];
_query = format["MarktZaehler:%1:%2",_amount,_shortname];
/*
if (debugRPT_srv) then {	
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║--------------------------------     Marktpreise akt DB LOG    ------------------------------";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ Liga - Marktpreis Query: %1",_query];
diag_log format["║ Liga - Marktpreis Amount: %1",_amount];
diag_log format["║ Liga - Marktpreis Name: %1",_shortname];
diag_log "╚══════════════════════════════════════════════════╝";
};
*/
//waitUntil{sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;