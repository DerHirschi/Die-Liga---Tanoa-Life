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
║ File: fn_ligaWHcalcPreis.sqf
║ Author: Hirschi - Die Liga	
║ 
╚══════════════════════════════════════════════════╝
*/

private ["_whVar","_whArray","_mode","_index","_ret","_preis","_side","_Fac","_max","_min"];

_typ 	= SEL(_this,0);
_mode 	= SEL(_this,1); 	//true = kaufen
_ret 	= -1;
_preis 	= -1;
_whVar	= "";

if(missionNamespace getVariable ["lci_reb",false]) then {
	_side = "REB";
}else{
	_side = switch (playerSide) do {
		case civilian 		: {"CIV"};
		case independent	: {"UHR"};	// Da war sie wieder ... die Uhr :D
		default				  {"CIV"};
	};
};

_preis = M_CONFIG(getArray,"Shops",life_shop_type,_side);



_arr   = SEL(_preis,1);
_preis = SEL(_preis,1);


_index = [_typ,_preis] call TON_fnc_index;

if(EQUAL(_index,-1)) exitWith{};
if (_mode) then {
	_preis = SEL(SEL(_preis,_index),2);	//Kaufpreis
}else{
	_preis = SEL(SEL(_preis,_index),1);	//Verkaufspreis
};
if(EQUAL(_preis,-1)) exitWith {-1;};

_whVar 	= SEL(SEL(_arr,_index),3);

if(EQUAL(_whVar,""))exitWith {_ret = (ceil _preis); _ret;};

_whArray = GVAR_MNS _whVar;

if(EQUAL(_whArray,[[]])) exitWith{ _whArray pushBack [_typ,0];SVAR_MNS [_whVar,_whArray]; publicVariableServer _whVar;_ret = (ceil _preis); _ret;};

_index 	= [_typ,_whArray] call TON_fnc_index;
if(EQUAL(_index,-1)) exitWith{ _whArray pushBack [_typ,0];SVAR_MNS [_whVar,_whArray]; publicVariableServer _whVar;_ret = (ceil _preis); _ret;};

_bestan = SEL(SEL(_whArray,_index),1);

_max 	= M_CONFIG(getArray,"Warehouse",_whVar,_typ);
_min 	= SEL(_max,1);
_max 	= SEL(_max,0);
_Fac 	= ((1 / _max) * (_bestan + 1))  ; 
//_min 	= SEL(M_CONFIG(getArray,"Warehouse",_whVar,_typ),1);
_preis 	= _preis - ((_preis - _min) * _Fac) ;

_ret = (ceil _preis); 
_ret;


