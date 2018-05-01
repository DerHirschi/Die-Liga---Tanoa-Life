#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	╔═════════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░░░║
	║░░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░▀▀▀█▀▀▀░░░║
	║░░░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░█░░░░░░║
	║░░░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░▀░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠═════════════════════════════════════════════════════╝
	║ File: fn_burnTurm.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
*/
	
_obj 	 	= [_this,0,Objnull,	[Objnull]	] call BIS_fnc_param;
_mode 	 	= [_this,1,true,	[true]		] call BIS_fnc_param;

if(isNull _obj) exitWith {diag_log "ERROR : fn_burnTurm.sqf .. NO _obj"; };
_slot 		= _obj GVAR ["turm_slot",""];
if(EQUAL(_slot,"")) exitWith {diag_log "ERROR : fn_turmDOWN.sqf .. Keine SLOT VAR";};

_objArr		= _obj GVAR ["turm_ObArr",[]];
if((EQUAL(_objArr,[]))) exitWith {diag_log "ERROR : fn_burnTurm.sqf .. Keine Obj Array";};


_fnc_Feuer_an = {	
	_ret 	= "test_EmptyObjectForFireBig" createVehicle [0,0,0];
	_ret attachTo [SEL(_this,13), [0,0,2.8]];
	_ret;
};

_fnc_Feuer_Var = {	
	_slot 		= _this;
	_steuData  	= profileNamespace GVAR [(_slot + "_steu"),""];
	if(EQUAL(_steuData,"")) then {
		_steuData = [false,true,0];	//Default
		profileNamespace SVAR [(_slot + "_steu"),_steuData];
	}else{
		_steuData set [1,true];
	};
	profileNamespace SVAR [(_slot + "_steu"),_steuData];
};

_fnc_Feuer_aus = {	

	_this addMPEventHandler ["MPKilled", {
		_this = SEL(_this,0);
		{
			deleteVehicle _x;
		} forEach (_this GVAR ["effects", []]);
		if (isServer) then {
			deleteVehicle _this;
		};
	}];
	_this setDamage 1; 
	nil;
};

_fnc_Feuer_Var_aus = {	
	_slot 		= _this;
	_steuData  	= profileNamespace GVAR [(_slot + "_steu"),""];
	if(EQUAL(_steuData,"")) then {
		_steuData = [false,false,0];	//Default
		profileNamespace SVAR [(_slot + "_steu"),_steuData];
	}else{
		_steuData set [1,false];
	};
	profileNamespace SVAR [(_slot + "_steu"),_steuData];
};


switch (_mode) do {
	case true: {
		switch (_slot) do {
			case "LigaBohrturm_1": {if(isNil "Bohr_Feuer_1") then {Bohr_Feuer_1 = _objArr call _fnc_Feuer_an;	_slot call _fnc_Feuer_Var;};	};
			case "LigaBohrturm_2": {if(isNil "Bohr_Feuer_2") then {Bohr_Feuer_2 = _objArr call _fnc_Feuer_an;	_slot call _fnc_Feuer_Var;};	};
			case "LigaBohrturm_3": {if(isNil "Bohr_Feuer_3") then {Bohr_Feuer_3 = _objArr call _fnc_Feuer_an;	_slot call _fnc_Feuer_Var;};	};
			case "LigaBohrturm_4": {if(isNil "Bohr_Feuer_4") then {Bohr_Feuer_4 = _objArr call _fnc_Feuer_an;	_slot call _fnc_Feuer_Var;};	};                  
			case "LigaBohrturm_5": {if(isNil "Bohr_Feuer_5") then {Bohr_Feuer_5 = _objArr call _fnc_Feuer_an;	_slot call _fnc_Feuer_Var;};	};
		};
	};

	case false: {
		switch (_slot) do {
			case "LigaBohrturm_1": {if!(isNil "Bohr_Feuer_1") then {Bohr_Feuer_1 = Bohr_Feuer_1 call _fnc_Feuer_aus;	_slot call _fnc_Feuer_Var_aus;};	};
			case "LigaBohrturm_2": {if!(isNil "Bohr_Feuer_2") then {Bohr_Feuer_2 = Bohr_Feuer_2 call _fnc_Feuer_aus;	_slot call _fnc_Feuer_Var_aus;};	};
			case "LigaBohrturm_3": {if!(isNil "Bohr_Feuer_3") then {Bohr_Feuer_3 = Bohr_Feuer_3 call _fnc_Feuer_aus;	_slot call _fnc_Feuer_Var_aus;};	};
			case "LigaBohrturm_4": {if!(isNil "Bohr_Feuer_4") then {Bohr_Feuer_4 = Bohr_Feuer_4 call _fnc_Feuer_aus;	_slot call _fnc_Feuer_Var_aus;};	};
			case "LigaBohrturm_5": {if!(isNil "Bohr_Feuer_5") then {Bohr_Feuer_5 = Bohr_Feuer_5 call _fnc_Feuer_aus;	_slot call _fnc_Feuer_Var_aus;};	};
		};
	};		
};
