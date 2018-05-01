/*
	File: fn_sendPVC.sqf
	Author: Hirschi Liga-Life	 
*/	

private["_id","_var","_varsnd","_va","_error"];

_id = [_this,0,-1,[0]] call BIS_fnc_param;
_var = [_this,1,[],[[]]] call BIS_fnc_param;
_error = false;

if(_id isEqualTo -1) exitWith {
	diag_log "╔══════════════════════════════════════════════════════════════╗";
	diag_log "║ PVC ID ERROR!!!";
	diag_log format["║ ID: %1",_id];
	diag_log "║ ";
	diag_log format["║ Angefragte Variable Code: %1",_var];
	diag_log "║ PVC ID ERROR!!! - Die Liga PVC System -";
	diag_log "╚══════════════════════════════════════════════════════════════╝";
};

if((count _var) isEqualTo 0) exitWith {
	diag_log "╔══════════════════════════════════════════════════════════════╗";
	diag_log "║ PVC VAR ERROR!!! leere Anfrage";
	diag_log format["║ ID: %1",_id];
	diag_log "║ ";
	diag_log format["║ Angefragte Variable Code: %1",_var];
	diag_log "║ PVC VAR ERROR!!! - Die Liga PVC System -";
	diag_log "╚══════════════════════════════════════════════════════════════╝";
};

_varsnd = [];

{
	switch (_x) do
	{
	/*	
		case 0:{_va = "life_market_prices_1"};
		case 1:{_va = "life_market_prices_2"};
		case 2:{_va = "life_market_prices_3"};
		case 3:{_va = "life_market_prices_4"};
		case 4:{_va = "life_market_prices_5"};
		case 5:{_va = "life_market_prices_6"};
		case 6:{_va = "life_market_prices_7"};
		case 7:{_va = "life_market_prices_8"};
		case 8:{_va = "life_market_prices_9"};
		
		case 20:{_va = "life_market_shortnames_1"};
		case 21:{_va = "life_market_shortnames_2"};
		case 22:{_va = "life_market_shortnames_3"};
		case 23:{_va = "life_market_shortnames_4"};
		case 24:{_va = "life_market_shortnames_5"};
		case 25:{_va = "life_market_shortnames_6"};
		case 26:{_va = "life_market_shortnames_7"};
		case 27:{_va = "life_market_shortnames_8"};
		case 28:{_va = "life_market_shortnames_9"};
		
		case 40:{_va = "life_market_resources_1"};
		case 41:{_va = "life_market_resources_2"};
		case 42:{_va = "life_market_resources_3"};
		case 43:{_va = "life_market_resources_4"};
		case 44:{_va = "life_market_resources_5"};
		case 45:{_va = "life_market_resources_6"};
		case 46:{_va = "life_market_resources_7"};
		case 47:{_va = "life_market_resources_8"};
		case 48:{_va = "life_market_resources_9"};
	*/	
		case 60:{_va = "liga_leim_tank"			};
		case 61:{_va = "liga_wh_1"				};
		case 62:{_va = "liga_wh_2"				};
		case 63:{_va = "liga_wh_3"				}; 
		case 65:{_va = "liga_wh_4"				};
		
	//	case 65:{ligaWH_best 	= ligaWH_best_a1;	_va = "ligaWH_best"		};
	//	case 66:{ligaWH_best_1 	= ligaWH_best_a2; 	_va = "ligaWH_best_1"	};
		
	//	case 67:{ligaWH_best 	= ligaWH_best_b1;	_va = "ligaWH_best"		};
	//	case 68:{ligaWH_best_1 	= ligaWH_best_b2; 	_va = "ligaWH_best_1"	};
		
		default {_va = "" };
	};
	if!(_va isEqualTo "") then {
		_varsnd set[_forEachIndex,_va];		
	};	
} foreach _var;

/////////// Variablen ///////////

{_id publicVariableClient (_x); sleep 0.1;} foreach _varsnd;

/////////// Variablen ENDE ///////////

/////////// Funktion Trigger /////////////
sleep 0.1;

{
	switch (_x) do
	{
		case 64: { 	[1] remoteExec ["life_fnc_PVCscTrig",_id];}; // WH Display
		
		case 200:{ 	[2] remoteExec ["life_fnc_PVCscTrig",_id];}; // Shop Display nach WH Bestand Anfrage
		case 201:{ 	[3] remoteExec ["life_fnc_PVCscTrig",_id];}; // Benzin Bestand Config Anfrage

		case 400:{ _error = true; _log ="PVC Script Trigger System: fn_PVCscTrig"}; // Errors vom Client
		
		default {};
	};
	sleep 0.1;
} foreach _var;

/////////// Funktion Trigger ENDE /////////////

////////// Sammel Error Log 2 Server //////////
if (_error) then {	
	diag_log "╔═══════════════════════════════════╗";
	diag_log "║ PVC System ERROR !!!";
	diag_log "║ ERROR vom Client erhalten !!";
	diag_log "║ ";
	diag_log format["║ Fehler %1",_log];
	diag_log "║ ";
	diag_log format["║ ID: %1",_id];
	diag_log format["║ Angefragte Variable Code: %1",_var];
	diag_log format["║ Angefragte Variable: %1",_varsnd];
	diag_log "╚═══════════════════════════════════╝";
};
