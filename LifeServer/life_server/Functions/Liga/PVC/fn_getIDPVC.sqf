/*
	File: fn_MarketGetVar.sqf
	Author: Tonic
	Edit: Hirschi Liga-Life
	 
*/	

private["_id","_ret"];
_id = _this select 0;
_ret = _this select 1;
 _id = owner _id;
_ret = owner _ret;

[_id] remoteExec ["life_fnc_PVCsetIDtoVar",_ret];

//if (debugRPT_srv) then {
//diag_log "╠══════════════════════════════════════════════════╣";
//diag_log format["║ Player %1",_this select 0];	
//diag_log format["║ PVC ID: %1",_id];
//diag_log "╠══════════════════════════════════════════════════╣";
//};