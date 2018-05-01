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
║	File: fn_processDest.sqf
║	Author: Hirschi Liga-Life	
║
║ Dann erwecken wir die Höllenmaschine mal zum Leben ........
╚══════════════════════════════════════════════════╝
*/

private ["_InMode","_id","_start","_exit","_ver_holz","_ver_mai","_zu_meth","_zu_moon","_PS","_OBJ","_it_meth","_it_holz","_it_maisch","_weight","_it_moon","_index","_destOb_ar",
			"_data_dest","_data_metheim","_data_sfass","_smoke_ar","_holz","_maisch","_schnap","_methy","_rauch","_gew_dest","_gew_metheim","_gew_sfass","_tuse_d","_tuse_e","_tuse_f"];
// _InMode
// 0 = Holz alle Actions ändern auf anheizen Feuer aus
// 1 = 
// 2 = 
// 3 = Start

_InMode = _this select 0;

// _start  - Hozverbrauch
// 0 = Anheizen
// 1 = Normal Betrieb 
_start = 0;
// _rauch
// 0 = Dunkel Anheizen
// 1 = weiss Normal
// 2 = Schwarz Fehler
_rauch = 0;

_destOb_ar = _this select 1 getVariable "lig_dest_ar";
_id = _this select 2;

_exit = false;
_tuse_d = false;
_tuse_e = false;
_tuse_f = false;
//Rezept
_ver_holz = 0;
_ver_mai = 0;
_zu_meth = 0;
_zu_moon = 0;
_it_meth = "18";
_it_holz = "a1";
_it_maisch = "a12";
_it_moon = "20";

_data_dest = [[["",0]],0];
_data_metheim = [[["",0]],0];
_data_sfass = [[["",0]],0];
 
_OBJ = _destOb_ar select 1;		
_smoke_ar = [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]];

_gew_dest = 95;
_gew_metheim = 18;
_gew_sfass = 70;

	
while {true} do {
	switch (_InMode) do {		
		case 0: {
			_exit = true;
			_destOb_ar select 0 enableSimulationGlobal false;	
			_destOb_ar select 2 enableSimulationGlobal false; 
			deleteVehicle _PS;

			if (_tuse_d) then { _destOb_ar select 1 setVariable["trunk_in_use",false,true];};
			if (_tuse_e) then { _destOb_ar select 5 setVariable["trunk_in_use",false,true];};
			if (_tuse_f) then { _destOb_ar select 6 setVariable["trunk_in_use",false,true];};		
			_destOb_ar select 1 setVariable["destpro",false,true] ;					
		};
		case 3: {
			switch (_start) do {	// Betrieb
				
				case 0: { // Startphase						
					_ver_holz = 2;
					_ver_mai = 0;
					_zu_meth = 0;
					_zu_moon = 0;
					
					_InMode = 3;
					_start = 1;
					_rauch = 0;
					
					if((_destOb_ar select 1 getVariable ["trunk_in_use",false])) then {
						
						[[1],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;  // hint "Die Destille kann nicht arbeiten waehrend du reinschaust !!";
						
						waitUntil {!(_destOb_ar select 1 getVariable ["trunk_in_use",false])};
					};					
					_destOb_ar select 1 setVariable["trunk_in_use",true,true]; 	
					_tuse_d = true;
					_data_dest = _destOb_ar select 1 getVariable "Trunk";						

					_index = [_it_holz,(_data_dest select 0)] call TON_fnc_index;
					_weight = 0;
					_weight = (([_it_holz] call TON_fnc_itemWeight) * _ver_holz);
					if (_index == -1) exitWith { 
						_exit = true; 
						_InMode = 0; 
						[[2],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; //hint "Du brauchst 2 Baumstaemme um das Teil anzuheizen und 1 um es weiter im Betrieb zu halte...";
						_destOb_ar select 1 setVariable["trunk_in_use",false,true]; 
						_tuse_d = false;
						_destOb_ar select 1 setVariable["destpro",false,true] ;			
					};
					_holz = ((_data_dest select 0) select _index) select 1;
					if (_holz < _ver_holz) exitWith { 
						_exit = true;
						_InMode = 0;
						[[3],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; 
						_destOb_ar select 1 setVariable["trunk_in_use",false,true];
						_tuse_d = false;
						_destOb_ar select 1 setVariable["destpro",false,true] ;			
					};

					_data_dest set [1,((_data_dest select 1) - _weight)];
					(_data_dest select 0) select _index set [1,(_holz - _ver_holz)];			
					_destOb_ar select 1 setVariable["Trunk",_data_dest,true];	
					_destOb_ar select 1 setVariable["trunk_in_use",false,true]; 	
					_tuse_d = false;						
					
					// _destOb_ar select 1 removeAction 0;
					//_i = 0;
					// for "_i" from 0 to 20 do {_destOb_ar select 1 removeAction _i;};
					// removeAllActions _destOb_ar select 1;
					_destOb_ar select 0 enableSimulationGlobal true; 
					_destOb_ar select 2 enableSimulationGlobal true;
					_PS = "#particlesource" createVehicle getPos _OBJ;	
			
				};
				
				case 1: { // Normal Betrieb
					
					_start = 1;
					_rauch = 1;
					
					_ver_holz = 1;
					_ver_mai = 7;
					_zu_meth = round (random 4);
					_zu_moon = 5;

					if((_destOb_ar select 1 getVariable ["trunk_in_use",false])) then {
						[[1],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;  // hint "Die Destille kann nicht arbeiten waehrend du reinschaust !!";
						waitUntil {!(_destOb_ar select 1 getVariable ["trunk_in_use",false]) };
					};					
					_destOb_ar select 1 setVariable["trunk_in_use",true,true]; 	
					_tuse_d = true;
					_data_dest = _destOb_ar select 1 getVariable "Trunk";					

										// Brennholz 19
					_index = [_it_holz,(_data_dest select 0)] call TON_fnc_index;
					_weight = 0;
					_weight = (([_it_holz] call TON_fnc_itemWeight) * _ver_holz);

					if (_index == -1) then { 
						_InMode = 0; 
						_rauch = 2; 
						[[3],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; //hint "Deine Destille hat kein Brennholz !!!";
					}
					else
					{	
						_holz = ((_data_dest select 0) select _index) select 1;
						if (_holz < _ver_holz) then {
							_InMode = 0;
							_rauch = 2; 
							[[3],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; //hint "Deine Destille hat kein Brennholz mehr...";
						}
						else
						{							
							_rauch = 1;
							_data_dest set [1,((_data_dest select 1) - _weight)];
							(_data_dest select 0) select _index set [1,(_holz - _ver_holz)];			
							_destOb_ar select 1 setVariable["Trunk",_data_dest,true];	
						};
					};
					
					if (_InMode != 0) then {
									// Maische a11
						_index = [_it_maisch,(_data_dest select 0)] call TON_fnc_index;
						_weight = 0;
						_weight = (([_it_maisch] call TON_fnc_itemWeight) * _ver_mai);
						if (_index == -1) then 
						{ 
							_zu_meth = 0;
							_zu_moon = 0;
							_rauch = 2; 
							[[4],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; //hint "Deine Destille hat keine Maische mehr und verbraucht Sinnlos Brennholz..";
						}
						else
						{
							_maisch = ((_data_dest select 0) select _index) select 1;
							if (_maisch < _ver_mai) then 
							{ 
								
								_rauch = 2; 
								[[4],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; //hint "Deine Destille hat keine Maische mehr und verbraucht Sinnlos Brennholz..";
								_ver_mai = _maisch;
								_zu_meth = 0;
								_zu_moon = 0;
							}
							else
							{
								if(debugRPT_srv)then{	 
									diag_log "╠══════════════════════════════════════════════════╣";
									diag_log "║     Destille vorher  ";
									diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];
									diag_log format["║ DESTILLE   _index   : %1",_index];
									diag_log format["║ DESTILLE    _weight   : %1",_weight];
									diag_log format["║ DESTILLE  _maisch   : %1",_maisch];
									diag_log format["║ DESTILLE  _ver_mai   : %1",_ver_mai];
									diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 1];
									diag_log "╠══════════════════════════════════════════════════╣";
								};									
								_data_dest set [1,((_data_dest select 1) - _weight)];
								(_data_dest select 0) select _index set [1,(_maisch - _ver_mai)];		
								_destOb_ar select 1 setVariable["Trunk",_data_dest,true];	
								_rauch = 1; 
								if(debugRPT_srv)then{	 
									diag_log "╠══════════════════════════════════════════════════╣";
									diag_log "║     Destille nachher  ";
									diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];
									diag_log format["║ DESTILLE   _index   : %1",_index];
									diag_log format["║ DESTILLE    _weight   : %1",_weight];
									diag_log format["║ DESTILLE  _maisch   : %1",_maisch];
									diag_log format["║ DESTILLE  _ver_mai   : %1",_ver_mai];
									diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 1];
									diag_log "╠══════════════════════════════════════════════════╣";
								};											
							};
						};	
					};	
					_destOb_ar select 1 setVariable["trunk_in_use",false,true]; 	
					_tuse_d = false;
				};
			};	
			// Actionsssssssss
			switch (_rauch) do {				
						case 0: {_smoke_ar = [[0.1, 0.1, 0.1, 1.3], [0.3, 0.3, 0.3, 0.5], [0.6, 0.6, 0.6, 0.03]];}; // 0 = Dunkel Anheizen
						case 1: {_smoke_ar = [[0.35, 0.35, 0.35, 2.8], [0.6, 0.6, 0.6, 1.55], [0.7, 0.7, 0.7, 0.4]];}; // 1 = weiss Normal
						case 2: {_smoke_ar = [[0.05, 0.05, 0.05, 0.7], [0.2, 0.2, 0.2, 0.4], [0.5, 0.5, 0.4, 0]];}; // 2 = Schwarz Fehler
			};			
			
			switch (_InMode) do {
				
				case 0: {			
								if (_tuse_d) then { _destOb_ar select 1 setVariable["trunk_in_use",false,true];};
								if (_tuse_e) then { _destOb_ar select 5 setVariable["trunk_in_use",false,true];};
								if (_tuse_f) then { _destOb_ar select 6 setVariable["trunk_in_use",false,true];};		
							};
				case 3: {
					deleteVehicle _PS;
					_PS = "#particlesource" createVehicle getPos _OBJ;	
					[[_PS,_OBJ,_smoke_ar],"life_fnc_DestSmoke",true] spawn life_fnc_MP; // Noch neue Funktion schreiben!!!!!!!!!!
					
					sleep 80;
															
					// Methyl Mode Check 18
					if((_destOb_ar select 5 getVariable ["trunk_in_use",false])) then 
					{
						[[1],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;  // hint "Die Destille kann nicht arbeiten waehrend du reinschaust !!";
						waitUntil {!(_destOb_ar select 5 getVariable ["trunk_in_use",false]) };
					};					
					_destOb_ar select 5 setVariable["trunk_in_use",true,true]; 	
					_tuse_e = true;			
					
					_data_metheim = _destOb_ar select 5 getVariable "Trunk";					
					_index = [_it_meth,(_data_metheim select 0)] call TON_fnc_index;
					_weight = 0;
					_weight = (([_it_meth] call TON_fnc_itemWeight) * _zu_meth);
					if(debugRPT_srv)then{	 
						diag_log "╠══════════════════════════════════════════════════╣";
						diag_log "║     Destille  Methyl Eimer vorher  ";
						diag_log format["║ DESTILLE   _data_metheim   : %1",_data_metheim];
						diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];						
						diag_log format["║ DESTILLE   _index   : %1",_index];
						diag_log format["║ DESTILLE    _weight   : %1",_weight];
						diag_log format["║ DESTILLE  _it_meth   : %1",_it_meth];
						diag_log format["║ DESTILLE  _zu_meth   : %1",_zu_meth];
						diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 5];
						diag_log "╠══════════════════════════════════════════════════╣";
					};		
					if (_index != -1) then 
					{ 
						_methy = ((_data_metheim select 0) select _index) select 1;
						if ((_weight + (_data_metheim select 1)) > _gew_metheim ) then 
						{
							
							//_rauch = 2;
							[[5],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;		//hint "Der Methyl Eimer ist voll !!!";
						}
						else
						{
							_data_metheim set [1,(_weight + (_data_metheim select 1))];
							((_data_metheim select 0) select _index) set [1, (_methy +_zu_meth)];
							_destOb_ar select 5 setVariable["Trunk",_data_metheim,true];		
							
							
							if(debugRPT_srv)then{	 
								diag_log "╠══════════════════════════════════════════════════╣";
								diag_log "║     Destille  Methyl Eimer teilVoll  ";
								diag_log format["║ DESTILLE   _data_metheim   : %1",_data_metheim];
								diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];			
								diag_log format["║ DESTILLE   _index   : %1",_index];
								diag_log format["║ DESTILLE   _methy   : %1",_methy];
								diag_log format["║ DESTILLE    _weight   : %1",_weight];
								diag_log format["║ DESTILLE  _it_meth   : %1",_it_meth];
								diag_log format["║ DESTILLE  _zu_meth   : %1",_zu_meth];
								diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 5];
								diag_log "╠══════════════════════════════════════════════════╣";
							};											
						};
					} 
					else
					{
						_data_metheim set [1,_weight];
						_data_metheim set [0, [[_it_meth,_zu_meth]]];
						_destOb_ar select 5 setVariable["Trunk",_data_metheim,true];	
						
					
						if(debugRPT_srv)then{	 
							diag_log "╠══════════════════════════════════════════════════╣";
							diag_log "║     Destille  Methyl Eimer leer  ";
							diag_log format["║ DESTILLE   _data_metheim   : %1",_data_metheim];
							diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];		
							diag_log format["║ DESTILLE   _index   : %1",_index];
							diag_log format["║ DESTILLE    _weight   : %1",_weight];
							diag_log format["║ DESTILLE  _it_meth   : %1",_it_meth];
							diag_log format["║ DESTILLE  _zu_meth   : %1",_zu_meth];
							diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 5];
							diag_log "╠══════════════════════════════════════════════════╣";
						};								
					};	
					_destOb_ar select 5 setVariable["trunk_in_use",false,true]; 	
					_tuse_e = false;	
					
					if((_destOb_ar select 6 getVariable ["trunk_in_use",false])) then 
					{
						[[1],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;  // hint "Die Destille kann nicht arbeiten waehrend du reinschaust !!";
						waitUntil {!(_destOb_ar select 6 getVariable ["trunk_in_use",false]) };
					};
					_destOb_ar select 6 setVariable["trunk_in_use",true,true]; 	
					_tuse_f = true;					
																					// Schnapss Fass
					_data_sfass = _destOb_ar select 6 getVariable "Trunk";		
					_index = [_it_moon,(_data_sfass select 0)] call TON_fnc_index;																
					_weight = 0;
					_weight = (([_it_moon] call TON_fnc_itemWeight) * _zu_moon);			
					if(debugRPT_srv)then{	 
						diag_log "╠══════════════════════════════════════════════════╣";
						diag_log "║     Destille  Fass vorher  ";
						diag_log format["║ DESTILLE   _data_sfass   : %1",_data_sfass];
						diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];		
						diag_log format["║ DESTILLE   _index   : %1",_index];
						diag_log format["║ DESTILLE    _weight   : %1",_weight];
						diag_log format["║ DESTILLE  _it_moon   : %1",_it_moon];
						diag_log format["║ DESTILLE  _zu_moon   : %1",_zu_moon];
						diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 6];
						diag_log "╠══════════════════════════════════════════════════╣";
					};						
					if (_index != -1) then 
					{ 																
						_schnap = ((_data_sfass select 0) select _index) select 1;
						if ((_weight + (_data_sfass select 1)) > _gew_sfass ) then 	
						{
							_dat = (_weight / _zu_moon) + (_data_sfass select 1);
							if (_dat < _gew_sfass) then
							{
								_weight = _weight / _zu_moon;
								_weight_dif = _gew_sfass - (_data_sfass select 1);
								_zu_moon = _weight_dif / _weight;
								
								_zu_moon = round (_zu_moon - 0.5);
								_weight = _weight * _zu_moon;
															
								_data_sfass set [1,(_weight + (_data_sfass select 1))];
								((_data_sfass select 0) select _index) set [1, (_schnap +_zu_moon)];
								_destOb_ar select 6 setVariable["Trunk",_data_sfass,true];	
								if(debugRPT_srv)then{	 
									diag_log "╠══════════════════════════════════════════════════╣";
									diag_log "║     Destille  Fass voll mit Platz rest errechnent";
									diag_log format["║ DESTILLE   _data_sfass   : %1",_data_sfass];
									diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];		
									diag_log format["║ DESTILLE   _index   : %1",_index];
									diag_log format["║ DESTILLE    _weight   : %1",_weight];
									diag_log format["║ DESTILLE  _it_moon   : %1",_it_moon];
									diag_log format["║ DESTILLE  _zu_moon   : %1",_zu_moon];
									diag_log format["║ DESTILLE  _schnap   : %1",_schnap];
									diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 6];
									diag_log "╠══════════════════════════════════════════════════╣";
								};									
							}
							else
							{
								_rauch = 2;
								[[6],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; //	hint "Das Schnapps-Fass ist voll !!!";	
							};							
						}
						else
						{
								_data_sfass set [1,(_weight + (_data_sfass select 1))];
								((_data_sfass select 0) select _index) set [1, (_schnap +_zu_moon)];
								_destOb_ar select 6 setVariable["Trunk",_data_sfass,true];	
								
								if(debugRPT_srv)then{	 
									diag_log "╠══════════════════════════════════════════════════╣";
									diag_log "║     Destille  Fass voll mit Platz ";
									diag_log format["║ DESTILLE   _data_sfass   : %1",_data_sfass];
									diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];		
									diag_log format["║ DESTILLE   _index   : %1",_index];
									diag_log format["║ DESTILLE    _weight   : %1",_weight];
									diag_log format["║ DESTILLE  _it_moon   : %1",_it_moon];
									diag_log format["║ DESTILLE  _zu_moon   : %1",_zu_moon];
									diag_log format["║ DESTILLE  _schnap   : %1",_schnap];
									diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 6];
									diag_log "╠══════════════════════════════════════════════════╣";
								};	
						};
					}
					else
					{
							_data_sfass set [1,_weight];
							_data_sfass set [0, [[_it_moon,_zu_moon]]];
					
							_destOb_ar select 6 setVariable["Trunk",_data_sfass,true];		
							if(debugRPT_srv)then{	 
								diag_log "╠══════════════════════════════════════════════════╣";
								diag_log "║     Destille  Fass leer";
								diag_log format["║ DESTILLE   _data_sfass   : %1",_data_sfass];
								diag_log format["║ DESTILLE   _data_dest   : %1",_data_dest];		
								diag_log format["║ DESTILLE   _index   : %1",_index];
								diag_log format["║ DESTILLE    _weight   : %1",_weight];
								diag_log format["║ DESTILLE  _it_moon   : %1",_it_moon];
								diag_log format["║ DESTILLE  _zu_moon   : %1",_zu_moon];
								diag_log format["║ DESTILLE   OBJ   : %1",_destOb_ar select 6];
								diag_log "╠══════════════════════════════════════════════════╣";
							};	
					};
					_destOb_ar select 6 setVariable["trunk_in_use",false,true]; 	
					_tuse_f = false;	
					
					switch (_rauch) do 
					{						
						case 0: {_smoke_ar = [[0.1, 0.1, 0.1, 1.3], [0.3, 0.3, 0.3, 0.5], [0.6, 0.6, 0.6, 0.03]];}; // 0 = Dunkel Anheizen
						case 1: {_smoke_ar = [[0.35, 0.35, 0.35, 2.8], [0.6, 0.6, 0.6, 1.55], [0.7, 0.7, 0.7, 0.4]];}; // 1 = weiss Normal
						case 2: {_smoke_ar = [[0.05, 0.05, 0.05, 0.7], [0.2, 0.2, 0.2, 0.4], [0.5, 0.5, 0.4, 0]];}; // 2 = Schwarz Fehler
					};	
					deleteVehicle _PS;
					_PS = "#particlesource" createVehicle getPos _OBJ;	
					[[_PS,_OBJ,_smoke_ar],"life_fnc_DestSmoke",true] spawn life_fnc_MP; 
					sleep 20;
				};				
			};		
		};	
	};
	if (_exit) exitWith {};
};		
/*
╔════════════════════════════════════════════════════════════╗
║ Falsch angefangen .. komplizierter geworden als es sein muss  ...... Hirschi Die Liga - Liga-Life
╚════════════════════════════════════════════════════════════╝
*/