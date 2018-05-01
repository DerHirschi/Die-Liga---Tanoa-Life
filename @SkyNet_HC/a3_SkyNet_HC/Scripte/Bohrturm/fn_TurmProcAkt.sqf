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
	║ File: fn_TurmProcAkt.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝

				   Procc,Gas		,Gasrate		,Ölrate
	SteuerArray [false,false	,0				,0		]	
*/
private["_steuData"];
_obj 	 	= [_this,0,Objnull,	[Objnull]	] call BIS_fnc_param;
_player	 	= [_this,1,Objnull,	[Objnull]	] call BIS_fnc_param;
_mode	 	= [_this,2,-1,		[-1]		] call BIS_fnc_param;
_modebool 	= [_this,3,false,	[false]		] call BIS_fnc_param;
_foerdmenge	= [_this,4,[0,0],	[[]]		] call BIS_fnc_param;

if(isNull _obj || isNull _player || EQUAL(_mode,-1)) exitWith {diag_log "ERROR : fn_TurmProcAkt.sqf .. NO _obj || _player"; };
_slot 		= _obj GVAR ["turm_slot",""];
if(EQUAL(_slot,"")) exitWith {diag_log "ERROR : fn_TurmProcAkt.sqf .. Keine SLOT VAR";};




if(EQUAL(_mode,0))then { // Proccess
	_steuData  = profileNamespace GVAR [(_slot + "_steu"),""];
	if(EQUAL(_steuData,"")) then {
		_steuData = [false,false,0,0];	//Default
		profileNamespace SVAR [(_slot + "_steu"),_steuData];
	};	
	if(_modebool) then {
		_steuData set [0,true];
		_steuData set [2,(SEL(_foerdmenge,0))];
		_steuData set [3,(SEL(_foerdmenge,1))];
		_obj SVAR ['mining',true,true];
		_obj remoteExec ['life_fnc_soundDevice',RCLIENT];
		
	}else{
		_steuData set [0,false];
		_obj SVAR ['mining',nil,true];
	};
	profileNamespace SVAR [(_slot + "_steu"),_steuData];
};
	
if(EQUAL(_mode,1))then { // Feuer		
		[_obj,_modebool]call LIGA_fnc_burnTurm;
}; 

//profileNamespace SVAR [(_slot + "_steu"),_steuData];
		
