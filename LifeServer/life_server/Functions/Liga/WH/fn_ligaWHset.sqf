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
	║	File: fn_ligaWHset.sqf
	║	Author: Hirschi Liga-Life	
	╚══════════════════════════════════════════════════╝

				!!!!!!!! INAKTIV !!!!!!!!!!!
			  MUSS GEÄNDERT WERDEN WENN AKTIV


	private["_typ","_stk","_query","_old","_a","_i"];
//	if (debugRPT_srv) then {	
		diag_log "╔═══════════════════════════════════╗";
		diag_log "║ -          Liga WareHouse !!  DB Schreib Versuch           ";
//	};
	_i = 0;

	if (!(WH_trig)) then {
		WH_trig = true;		
		{
			if (_i <= 6 ) then {
				_old = ligaWH_best_old select _i;
				_stk = ligaWH_best select _i;
				if (_old != _stk) then 
					{
					//_query = format["UPDATE ligaWH SET stk='%1' WHERE typ='%2'",_stk,_x];
					_query = format["WHset:%1:%2",_stk,_x];
					//waitUntil{sleep (random 0.3); !DB_Async_Active};
					[_query,1] call DB_fnc_asyncCall;
						
//					if (debugRPT_srv) then {	
							diag_log "╔═══════════════════════════════════╗";
							diag_log "║ -          Liga WareHouse !!  DB 1          ";
//						};
					};
			}
			else
			{
				_a = _i - (count ligaWH_best);
				_old = ligaWH_best_1_old select _a;
				_stk = ligaWH_best_1 select _a;
				if (_old != _stk) then 
					{
					//_query = format["UPDATE ligaWH SET stk='%1' WHERE typ='%2'",_stk,_x];
					_query = format["WHset:%1:%2",_stk,_x];
					//waitUntil{sleep (random 0.3); !DB_Async_Active};
					[_query,1] call DB_fnc_asyncCall;
						
//					if (debugRPT_srv) then {	
							diag_log "╔═══════════════════════════════════╗";
							diag_log "║ -          Liga WareHouse !!  DB 2           ";
//						};
					};
			};
			_i = _i + 1;	
		} foreach ligaWH_WA;
		
		ligaWH_best_old = ligaWH_best;
		ligaWH_best_1_old = ligaWH_best_1;
		sleep 180;
		WH_trig = false;
	};	

*/	