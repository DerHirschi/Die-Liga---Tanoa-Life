#include "..\..\Liga_script_macros.hpp"
#define ROT [1, 0, 0, 0.9]
#define GRUN [0, 1, 0, 0.9]
#define WEISS [1, 1, 1, 0.9]
#define ERROR [0, 1, 1, 0.9]

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
	║	Author: Hirschi - Die Liga
	║	File: fn_ligaWeapWH.sqf	
	╚══════════════════════════════════════════════════╝
*/	
private ["_ret","_item","_conf","_mode"];

_item = SEL(_this,0);
_mode = SEL(_this,1);
_ret = [true,ERROR];

if!(EQUAL(side player,civilian)) 	exitWith { [true,WEISS];};
_conf = M_CONFIG(getArray,"WeaponWH","WH_1",_item);
if (EQUAL(count _conf,0)) 			exitWith { [true,WEISS];};

if((GVAR_MNS ([(SEL(_conf,0)),0] call life_fnc_varHandle)) < (SEL(_conf,1))) then {
	if(([(SEL(_conf,0)),(SEL(_conf,1)),_mode,false]call life_fnc_ligaWHbuy)) then {
		_ret = [false,ROT];
	}else{
		_ret = [true,GRUN];
	};		
}else{
	if(_mode)then {
		[false,(SEL(_conf,0)),(SEL(_conf,1))]call life_fnc_handleInv;
	};
	_ret = [true,GRUN];
};	
_ret;