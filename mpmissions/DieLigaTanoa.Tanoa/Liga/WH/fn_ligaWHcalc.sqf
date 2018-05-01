#include "..\..\Liga_script_macros.hpp"
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
║	File: fn_ligaWHcalc.sqf
║	Author: Hirschi Liga-Life	
╚══════════════════════════════════════════════════╝
*/

private ["_val","_type","_data","_mode","_whVar","_side","_bestan","_index"];

_val 	= SEL(_this,0);
_type 	= SEL(_this,1);
_mode 	= SEL(_this,2);// true = SUB ... false = ADD
_read  	= [_this,3,false,[false]] call BIS_fnc_param;


if(missionNamespace getVariable ["lci_reb",false]) then {
	_side = "REB";
}else{
	_side = switch (playerSide) do {
		case civilian 		: {"CIV"};
		case independent	: {"UHR"};	// Da war sie wieder ... die Uhr :D
		default				  {"CIV"};
	};
};

_data 	= M_CONFIG(getArray,"Shops",life_shop_type,_side);
_data 	= SEL(_data,1);
_index 	= [_type,_data] call TON_fnc_index;
_whVar 	= SEL(SEL(_data,_index),3);

_whArray = GVAR_MNS [_whVar,[[]]];
if!(EQUAL(_whArray,[[]])) then{
	_index 	= [_type,_whArray] call TON_fnc_index;
	if!(EQUAL(_index,-1)) then {
		_bestan = SEL(SEL(_whArray,_index),1);
	}else{
		_bestan = 0;
	};	
}else{
	_bestan = 0;
	_index	= 0;
};
if(_read) exitWith {_bestan;};
if (_mode) then {
	_bestan = _bestan + _val;
}else{
	_bestan = _bestan - _val;	// eigentlich unnötig ... 
};
if(_bestan < (SEL(M_CONFIG(getArray,"Warehouse",_whVar,_type),0))) then {	
	if!(EQUAL(_index,-2)) then {
		_whArray set[_index,[_type,_bestan]];
	}else{
		_whArray pushBack [_type,_bestan];
	};	
	SVAR_MNS [_whVar,_whArray];
	PVAR_SERV(_whVar);	
}else{
	hint "Das Warenhaus ist voll !! Die restlichen Waren werden exportiert ..";
	closeDialog 0;
	if!(EQUAL(_bestan,(SEL(M_CONFIG(getArray,"Warehouse",_whVar,_type),0)))) then {
		_whArray set[_index,[_type,(SEL(M_CONFIG(getArray,"Warehouse",_whVar,_type),0))]];
		SVAR_MNS [_whVar,_whArray];
		PVAR_SERV(_whVar);	
	};
	[] remoteExec ["TON_fnc_ligaWHdump",RSERV]; //	Schiff Ahoi ... 
};
