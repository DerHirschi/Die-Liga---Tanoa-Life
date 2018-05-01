/*

Author: MooN-Gaming 

Thanks to Black lagoon developing

*/

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_plate = [_this,1,-1,[0]] call BIS_fnc_param;
_color = [_this,2,0,[0]] call BIS_fnc_param;
//Stop bad data being passed.
if(_uid isEqualTo "" OR _color isEqualTo -1 OR _plate isEqualTo -1) exitWith {};
	//_query = format["UPDATE vehicles SET color='%1' WHERE plate='%2' AND pid='%3'",_color, _plate, _uid];
	
	_query = format["vehicleRepaint:%1:%2:%3",_color,_plate,_uid];
	/*
	if (debugRPT_srv) then {	
	diag_log "╔═══════════════════════════════════╗";
	diag_log "║ -          Umlackieren abgebrochen !!  DB LOG            --  ";
	diag_log "╚═══════════════════════════════════╝";
	diag_log "╔═══════════════════════════════════╗";
	diag_log "║ -          Fahrzeug umlackiert               DB LOG            --  ";
	diag_log "╠═══════════════════════════════════╣";
	diag_log format["║ QUERY: %1",_query];
	diag_log "╚═══════════════════════════════════╝";
	};
	*/
	
	_queryResult = [_query,1] call DB_fnc_asyncCall;
