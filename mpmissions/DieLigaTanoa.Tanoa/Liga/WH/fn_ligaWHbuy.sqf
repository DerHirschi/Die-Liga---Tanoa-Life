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
║	File: fn_ligaWHbuy.sqf
║		
║	Author: Hirschi Liga-Life.de
║		
║	[
║		["di",5400],
║		["ben",5400],
║		["bla",5400]
║	]
║		
╚══════════════════════════════════════════════════╝
*/
private ["_type","_index","_side","_amount","_whVar","_data","_whArray","_bestan"];

_type 	= SEL(_this,0);
_amount = SEL(_this,1);
_mode 	= SEL(_this,2);
_bestan	= 0;
//_lock  	= [_this,3,false,[true]] call BIS_fnc_param;
_mode1 	= [_this,4,true	,[true]] call BIS_fnc_param;
//_exit 	= false;

//life_shop_type = "";// WH Select

if(GVAR_MNS ["lci_reb",false]) then {
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

/*
[
	["di",5400],
	["ben",5400],
	["bla",5400]
]
*/
if!(EQUAL(_whVar,"")) then {
	_whArray = GVAR_MNS [_whVar,[]];
	if!(EQUAL(_whArray,[])) then {
		_index 	= [_type,_whArray] call TON_fnc_index;
		if!(EQUAL(_index,-1))then {
			_bestan = SEL(SEL(_whArray,_index),1);
		}else{
			_bestan	= 0;
		};
	}else{
		_bestan	= 0;
		_index	= -1;
	};


	_bestan = _bestan - _amount;

	if (_bestan < 0) exitWith { if(_mode && _mode1)then{	hint "Lieferengpass !!! Der Gegenstand den du kaufen moechtest muss zuerst gefarmt und verkauft werden !!!";}; true; };

	if(_mode) then {
		if!(EQUAL(_index,-1))then {
			_whArray set[_index,[_type,_bestan]];
		}else{
			_whArray pushBack [_type,_bestan];
		};
		SVAR_MNS [_whVar,_whArray];
		PVAR_SERV(_whVar);
	};	
false;
};
