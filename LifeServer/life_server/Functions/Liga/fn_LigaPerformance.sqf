#include "\life_server\Liga_Macros.hpp"
_ver = "02";
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
║	File: fn_LigaPerformance.sqf 
║   Ver: 02
║	Author: Hirschi Liga-Life.de
╚══════════════════════════════════════════════════╝	
*/	
Liga_t = [];
_PERSUCH = [ 
		"Land_LampHarbour_F", 
		"Land_LampHalogen_F", 
		"Land_LampAirport_F", 
		"Land_LampDecor_F", 
		"Campfire_burning_f", 
		"Land_Campfire_F", 
		"MetalBarrel_burning_F", 
		"Land_LampShabby_F", 
		"Land_LampSolar_F", 
		"Land_LampStreet_F", 
		"Land_LampStreet_small_F", 
		"Land_PowerPoleWooden_L_F", 
		"B_Slingload_01_Fuel_F", 
		"Man", 
		"Car",
		"Ship",
		"Air" 
		];
		
	_suche = [
		"Campfire_burning_f",
		"Land_Campfire_F",
		"MetalBarrel_burning_F"
	];		
private ["_trig"];
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║ Liga Performance Init gestartet !!";
	diag_log format["║ Version: %1",_ver];
	_timeStamp = diag_tickTime;
			
	_list = [7500,7500,0]nearObjects ["All", 15000];		
	_count = count _list;
		
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log format ["║ Gezählte Objekte %1", _count];
	diag_log format ["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];
	diag_log "╠══════════════════════════════════════════════════╣";
	_such = _PERSUCH;
	_c = count _such;
	_n = 1;
	_n1 = 0;
	_n2 = 0;
		
	{
		_i = 0 ;
		_trig = true;
		while {true} do {
			if (_x isKindOf (SEL(_such,_i))) exitWith { _trig = false;};			
				ADD(_i,1);	
				if(_i >= _c) exitWith {};	
			};		
			if(_trig) then 
			{				
				VEH_SIMGLOBF(_x);
				ADD(_n,1);
			}			
			else
			{
				if (!(_x isKindOf "Man" || _x isKindOf "Air" || _x in [Liga_Taxi,Liga_Taxi_1,Liga_Taxi_2,Liga_Taxi_3,Liga_Taxi_4,Liga_Taxi_5])) then 
				{
					VEH_SIMF(_x);
					ADD(_n1,1);	
					if!((typeOf _x) in _suche) then {
						Liga_t pushBack _x;
						ADD(_n2,1);	
					};
				};
			};
			
	} foreach _list;	
		
	diag_log format["║ Erfasste Objekte		: %1",_n];
	diag_log format["║ Ausgenommene Objekte	: %1",(_n1 +1)];
	diag_log format["║ Client Perf Objekte		: %1",(_n2 +1)];
	diag_log "║";
	diag_log format["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];
	diag_log "║ Liga Performance Init beendet !!";
	diag_log "╠══════════════════════════════════════════════════╣";
	PVAR_ALL("Liga_t");
