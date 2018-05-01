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
║	File: fn_ligaDestObj.sqf
║	Author: Hirschi Liga-Life	
║
║ Fun with Objects .... yyeeeaahhhhh 
╚══════════════════════════════════════════════════╝
*/

private ["_stat","_obj","_obj1","_obj2","_obj3","_obj4","_obj5","_obj6","_pos","_destOb_ar"];

_stat = _this select 0;
_pos = _this select 1;
_destOb_ar = [];

// 0 Suchen und Löschen
// 1 Löschen 
// 2 erzeugen Höllenmaschine
// 3 erzeugen Höllenmaschine mit Variablen für Trunk

switch (_stat) do {
	
	case 0: {
		_dat_obj = nearestObjects[ _pos,["Land_HeatPump_F"],5] select 0;
		_destOb_ar = _dat_obj getVariable ["lig_dest_ar",[]];		
			
		_count = 0;
		_count = count _destOb_ar;
		if (_count != 7) exitWith { };
			{	deleteVehicle _x;	} foreach _destOb_ar;					
	};
	
	case 1: {		
		_dat_obj = nearestObjects[ _pos,["Land_HeatPump_F"],5] select 0;
		_destOb_ar = _dat_obj getVariable ["lig_dest_ar",[]];		
		
		_count = 0;
		_count = count _destOb_ar;
		if (_count != 7) exitWith {};
			{	deleteVehicle _x;	} foreach _destOb_ar;				
	};
	
	case 2: {

					_obj = "Land_HeatPump_F" createVehicle [0.1,0,-0.1];
					_obj allowDamage true;

					_obj1 = "Land_Campfire_F" createVehicle position _obj;
					_obj1 allowDamage true;

					_obj attachTo [_obj1,[0,1.35,1.2]]; 
					_obj2 = "Land_Campfire_F" createVehicle position _obj;
					_obj2 allowDamage true;

					_obj2 attachTo [_obj,[-0.5,-0.5,-1.2]]; 
					_obj3 = "Land_Pallets_stack_F" createVehicle position _obj;
					_obj3 allowDamage true;

					_obj3 attachTo [_obj,[0.9,0,-1.2]]; 
					_obj4 = "Land_Bucket_painted_F" createVehicle position _obj;
					_obj4 allowDamage true;

					_obj4 attachTo [_obj,[0.6,0,-0.6]]; 
					_obj5 = "Land_Bucket_painted_F" createVehicle position _obj;
					_obj5 allowDamage true;

					_obj5 attachTo [_obj,[0.6,0.287,-0.6]]; 
					_obj6 = "Land_BarrelEmpty_F" createVehicle position _obj;
					_obj6 allowDamage true;

					_obj6 attachTo [_obj,[0.5,1.2,-0.98]]; 
					_destOb_ar set [0,_obj1]; 
					_destOb_ar set [1,_obj];
					_destOb_ar set [2,_obj2];
					_destOb_ar set [3,_obj3];
					_destOb_ar set [4,_obj4];
					_destOb_ar set [5,_obj5];
					_destOb_ar set [6,_obj6];

					_obj setVariable["lig_dest_ar",_destOb_ar,true] ;		
					_obj setVariable["destpro",false,true] ;		
		if(debugRPT_srv)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log "║ DESTILEEEEE OBJEKT ARRAY ";
				diag_log format["║Maische Prozess    _destOb_ar: %1",_destOb_ar];
				diag_log "║ DESTILEEEEE OBJEKT ARRAY ";
				diag_log "╠══════════════════════════════════════════════════╣";
			};	

					_obj1;					
				};			
				
					case 3: {					

					_obj = "Land_HeatPump_F" createVehicle [0.1,0,-0.1];
					_obj setVariable["Trunk",[[],0],true];
					_obj setVariable["item","destDeployed",true];
					_obj allowDamage true;

					_obj1 = "Campfire_burning_F" createVehicle position _obj;

					_obj1 allowDamage true;
					_obj attachTo [_obj1,[0,1.35,1.2]]; 
					_obj2 = "Campfire_burning_F" createVehicle position _obj;

					_obj2 allowDamage true;
					_obj2 attachTo [_obj,[-0.5,-0.5,-1.2]]; 
					_obj3 = "Land_Pallets_stack_F" createVehicle position _obj;
					_obj3 allowDamage true;

					_obj3 attachTo [_obj,[0.9,0,-1.2]]; 
					_obj4 = "Land_Bucket_painted_F" createVehicle position _obj;
					_obj4 allowDamage true;

					_obj4 attachTo [_obj,[0.6,0,-0.6]]; 
					_obj5 = "Land_Bucket_painted_F" createVehicle position _obj;
					_obj5 setVariable["Trunk",[[],0],true];
					_obj5 setVariable["item","destDeployed",true];
					_obj5 allowDamage true;

					_obj5 attachTo [_obj,[0.6,0.287,-0.6]]; 
					_obj6 = "Land_BarrelWater_F" createVehicle position _obj;
					_obj6 setVariable["Trunk",[[],0],true];	
					_obj6 setVariable["item","destDeployed",true];					
					_obj6 allowDamage true;

					_obj6 attachTo [_obj,[0.5,1.2,-0.98]]; 			

		
								
					_destOb_ar set [0,_obj1]; 
					_destOb_ar set [1,_obj];
					_destOb_ar set [2,_obj2];
					_destOb_ar set [3,_obj3];
					_destOb_ar set [4,_obj4];
					_destOb_ar set [5,_obj5];
					_destOb_ar set [6,_obj6];
					
			if(debugRPT_srv)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log "║ DESTILEEEEE OBJEKT ARRAY ";
				diag_log format["║Maische Prozess    _destOb_ar: %1",_destOb_ar];
				diag_log "║ DESTILEEEEE OBJEKT ARRAY ";
				diag_log "╠══════════════════════════════════════════════════╣";
			};	

					_obj setVariable["lig_dest_ar",_destOb_ar,true] ;	
					_obj setVariable["destpro",false,true] ;							

					_obj1;					
				};	
};
