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
║ File: fn_processMaisch.sqf
║ Author: Hirschi Liga-Life
║ Vorlagen: Bryan "Tonic" Boardwine
║
║ Description: keine Zeit .... .
╚══════════════════════════════════════════════════╝
*/
private["_fass","_all","_exit","_data","_prod_ran","_prod_new","_prod_old","_value_ar_weg","_value_ran_ar_weg","_val","_val_1","_type","_OBJ","_PS","_stat","_id"];
// Vars
_fass = _this select 0;
_id = _this select 1;
_all = _fass getVariable "Trunk";
_exit = false;
_value_ar_weg = [];
_value_ran_ar_weg = [];
_cou = 0;

//Rezept
_prod_old = ["a11","water"];
_prod_ran = ["apple","peach","ana","banan"];
_prod_new = ["a12"];

// Exits
if(isNull _fass OR !(("Land_WaterBarrel_F" == typeOf _fass))) exitWith {}; 
if((_fass getVariable ["trunk_in_use",false])) exitWith {};

// lock
_fass setVariable["trunk_in_use",true,true]; 	

// Zeug da Check und noch mehr Vars YEAH
_data = (_fass getVariable "Trunk") select 0;
_i = 0;
{
	_index = [_x,((_fass getVariable "Trunk") select 0)] call TON_fnc_index;
	if (_index == -1) exitWith {_exit = true; [[7],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;  _fass setVariable["trunk_in_use",false,true];	_fass setVariable["destpro",false,true] ;					};
	_val = _data select _index select 1;
	_value_ar_weg set [_i,_val];
	_i = _i + 1;
} foreach _prod_old;

if (_exit) exitWith {_fass setVariable["trunk_in_use",false,true];		};

// "Random" Zeug da Check  	
_i = 0;
{
	_index = [_x,((_fass getVariable "Trunk") select 0)] call TON_fnc_index;
	if (_index != -1) then {	
		_val = _data select _index select 1;
		_value_ran_ar_weg set [_i,[_x,_val]];
		_i = _i + 1;
	};
} foreach _prod_ran;

_cou = count _value_ran_ar_weg;

if (_cou < 1) exitWith { [[7],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; _fass setVariable["trunk_in_use",false,true];	_fass setVariable["destpro",false,true] ;					};

// Random Item Val ermitteln
_val = 0;
_val_1 = 0;
_type = "";
{
	_val_1 = _x select 1;
	if ( _val < _val_1 ) then {
	_val = _x select 1;
	_type = _x select 0;
	};
} foreach _value_ran_ar_weg;
_cou = 0;
_cou = count _value_ar_weg;
if (_cou < 1 || _val < 1 ) exitWith { 
	[[7],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP; 
	_fass setVariable["destpro",false,true] ;				
	_fass setVariable["trunk_in_use",false,true];		
			if(debugRPT_srv)then{	 
				diag_log "╠═══════════════════════════════════════════════════════╣";
				diag_log "║ Maische Prozess Debug ... Array Grösse oder Val passt nicht ... fn_processMaisch.sqf";
				diag_log "╠═══════════════════════════════════════════════════════╣";
			};	
};
_value_ar_weg set [_cou,_val];
_prod_old set [_cou,_type];

			if(debugRPT_srv)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║Maische Prozess    _value_ar_weg: %1",_value_ar_weg];
				diag_log format["║Maische Prozess    _prod_old: %1",_prod_old];
				diag_log "╠══════════════════════════════════════════════════╣";
			};	

_i = 0;
_val = 999;
{
	_u = _prod_old select _i;
	if ( _u != "a11") then {
	if(_x < _val) then {_val = _x;};
	};
	_i = _i + 1;
} foreach _value_ar_weg;

			if(debugRPT_srv)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║Maische Prozess    _val: %1",_val];
				diag_log format["║Maische Prozess    _data: %1",_data];
				diag_log "╠══════════════════════════════════════════════════╣";
			};	
if (_val == 0) exitWith { [[7],"life_fnc_ligaDesAdAc",_id,false] spawn life_fnc_MP;  _fass setVariable["trunk_in_use",false,true];		_fass setVariable["destpro",false,true] ;				};
// Zeug raus ausn Fass
private ["_weight","_weight_1"];
_weight = 0;
{
	_index = [_x,((_fass getVariable "Trunk") select 0)] call TON_fnc_index;
	_val_1 = 0;
	_val_1 = _data select _index select 1;
	if ( _x == "a11") then {
	_weight = _weight + ([_x] call TON_fnc_itemWeight);	
	_val_1 = _val_1 - 1;
	}else{
	_weight = _weight + (([_x] call TON_fnc_itemWeight) * _val);
	_val_1 = _val_1 - _val;
	};
	_data set [_index,[_x,_val_1]];	
} foreach _prod_old;

			if(debugRPT_srv)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║Maische Prozess    _data: %1",_data];
				diag_log "╠══════════════════════════════════════════════════╣";
			};	
			
// Und die Maische rein ...
_val_1 = 0;
_weight_1 = 0;
{
	_index = [_x,((_fass getVariable "Trunk") select 0)] call TON_fnc_index;
	if (_index == -1) then {
		_data set [count _data,[_x,_val] ];
		_weight_1 = _weight_1 + (([_x] call TON_fnc_itemWeight) * _val);
	}else{
		_val_1 = _data select _index select 1;
		_val_1 = _val_1 + _val;
		_data set [_index,[_x,_val_1]];
		_weight_1 = _weight_1 + (([_x] call TON_fnc_itemWeight) * _val);
	};
} foreach _prod_new;

_weight = _weight_1 - _weight;		
_fass setVariable["Trunk",[_data,(_all select 1) + _weight],true];

		_stat = 0;		
		_OBJ = _fass;
		_PS = "#particlesource" createVehicle getpos _OBJ;	
		_smoke_ar = [[0.8, 0.8, 0.8, 0.15], [0.25, 0.25, 0.25, 0.4], [0.04, 0.04, 0.04, 0.7]];		
		[[_PS,_OBJ,_smoke_ar],"life_fnc_DestSmoke1",true] spawn life_fnc_MP; 
		
while {true} do {	
		if ( _stat >= 1) exitWith {_fass setVariable["trunk_in_use",false,true];	deleteVehicle _PS; _fass setVariable["liga_maischPro",0,true]; _fass setVariable["destpro",false,true] ;					};
		_stat = _stat + 0.11;	
		_fass setVariable["liga_maischPro",_stat,true];
		sleep 75;
		_stat = _stat + 0.23;	
	};


			if(debugRPT_srv)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║Maische Prozess    _data: %1",_data];
				diag_log format["║Maische Prozess    _all: %1",_all];
				diag_log format["║Maische Prozess    _weight: %1",_weight];
				diag_log "╠══════════════════════════════════════════════════╣";
			};				
/*
╔══════════════════════════════════════════════════╗
║ Prost !!!! ...... Hirschi Die Liga - Liga-Life
╚══════════════════════════════════════════════════╝
*/