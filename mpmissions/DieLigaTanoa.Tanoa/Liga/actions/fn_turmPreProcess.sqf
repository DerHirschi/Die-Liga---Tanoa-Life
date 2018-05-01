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
	║ File: fn_turmPreProcess.sqf
	║ Author: Hirschi - Die Liga
	╚══════════════════════════════════════════════════╝
*/

private["_speedF","_vInv","_Sttiefe","_itemIndex","_val","_itemval","_tiefe","_Gas","_Oel","_i","_GasTief","_OelTief","_space","_itemWeight","_items"];

_lagerRaum	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _lagerRaum) exitWith {};
_item 		= "rib";
_vInv 		= _lagerRaum GVAR ["Trunk",[[],0]];
_itemIndex 	= [_item,SEL(_vInv,0)] call TON_fnc_index;

if(EQUAL(_vInv,[]) || EQUAL(_itemIndex,-1) ) exitWith {hint "Du kannst nicht Bohren, es sind keine Bohrgestaenge vorhanden ..."}; // NIX DA MSG !!!!

_recctief 	= _lagerRaum GVAR ["bohr_recor",true];	
if(EQUAL(typeName _recctief,"BOOL")) then {

	_lagerRaum SVAR ["bohr_recor",[(floor random [150,1200,3800]),(floor random [300,2800,4800]),0],true];
};
if(EQUAL(typeName _recctief,"ARRAY")) then {
	_GasTief = SEL(_recctief,0);
	_OelTief = SEL(_recctief,1);	
	_Sttiefe = SEL(_recctief,2);	
};
if(isNil "_Sttiefe") then {_Sttiefe = 0;};
if(isNil "_OelTief") then {_OelTief	= floor random [300,2800,4800];};
if(isNil "_GasTief") then {_GasTief	= floor random [150,1200,3800];};
_maxGas		= floor random [19,21,25];	// Max Gasgewinn
_maxOel		= floor random [11,13,15];	// Max Ölgewinn

if(isNil "liga_bohrrate") then {	liga_bohrrate 	= [0,0];	};
if(isNil "liga_bohrsteu") then {	liga_bohrsteu 	= [false,1];};
[_lagerRaum,player,0,false,liga_bohrrate] remoteExecCall ['LIGA_fnc_TurmProcAkt',HC_id];

/* Bohrgestänge nachlegen */
for [{_i=0},{_i<=5000 && (SEL(liga_bohrsteu,0))},{_i=_i+100}] do {// 50 * 100 Meter ( 50 Bohrgest MAX )

	waitUntil {!(_lagerRaum GVAR ["trunk_in_use",false])};
	_lagerRaum SVAR ["trunk_in_use",true,true];
	_speedF 	= SEL(liga_bohrsteu,1);
	_speedF		= _speedF max 0.1;
	
	_vInv 		= _lagerRaum GVAR ["Trunk",[[],0]];
	_itemIndex 	= [_item,SEL(_vInv,0)] call TON_fnc_index;
	if(EQUAL(_vInv,[]) || EQUAL(_itemIndex,-1) ) exitWith {hint "Das Bohrgestaenge ist verbraucht. Besorg dir neues wenn du tiefer bohren willst ..."}; // NIX mehr DA MSG !!!!	

	_items 		= SEL(_vInv,0);
	_space 		= SEL(_vInv,1);
	_val 		= _items select _itemIndex select 1;
	_itemval 	= 1;
	_itemval	= _itemval / _speedF;
	_itemval	= _itemval / 2;
	_itemval	= round _itemval;
	_itemval	= _itemval max 1; 
	_itemval	= _itemval min 5; 
	if(_val < _itemval) exitWith {hint "Das Bohrgestaenge ist verbraucht. Besorg dir neues wenn du tiefer bohren willst ..."}; // NACHRICHT zu wenige Gestänge
	_weight 	= [_lagerRaum] call life_fnc_vehicleWeight;
	_itemWeight = ([_item] call life_fnc_itemWeight) * _itemval;			
	_items set[_itemIndex,[_item,_val - _itemval]];	
			
	_lagerRaum SVAR["Trunk",[_items,_space - _itemWeight],true];	
	_lagerRaum SVAR ["trunk_in_use",false,true];
	
	/* 100 Meter Bohren */
	
	for [{_b=1},{_b<=100 && (SEL(liga_bohrsteu,0))},{_b=_b+1}] do {

		/*Eingabe*/
		_speedF 	= SEL(liga_bohrsteu,1);
		_speedF		= _speedF max 0.1;
		_itemval 	= 1;
		_itemval	= _itemval / _speedF;
		_itemval	= _itemval / 2;
		_itemval	= round _itemval;
		_itemval	= _itemval max 1; 
		_itemval	= _itemval min 5; 		
		_tiefe 		= _b + _i + _Sttiefe;
		/*GAS*/
		if(_tiefe <= _GasTief) then {
			_Gas 	= (_maxGas / _GasTief) * _tiefe;
		}else{
			_Gas 	= _maxGas - ((_maxGas / _GasTief) * (_tiefe - _GasTief ));
		};
		/*Öl*/
		if(_tiefe <= _OelTief) then {
			_Oel 	= (_maxOel / _OelTief) * _tiefe;
		}else{
			_Oel 	= _maxOel - ((_maxOel / _OelTief) * (_tiefe - _OelTief ));
		};		
		_Gas = _Gas max 0;
		_Oel = _Oel max 0;
		_Gas = round _Gas;
		_Oel = round _Oel;
		liga_bohrrate set [0,_Gas];
		liga_bohrrate set [1,_Oel];
		
		/*Ausgabe*/
		
		hint parseText format["
						  <t align='center'><t color='#FF0000'><t size='3'>Bohrcomputer</t></t></t><br/> 
						  <br/> 
						  <t size='1.3'><t align='left'> 
						  Bohrtiefe: %1 Meter <br/> 
						  <br/> 
						  Geschwindigkeit: %2 m/s <br/> 
						  <br/>
						  Bohrgestaenge: %5 Stk/100 m <br/> 
						  <br/>
						  </t></t> 
						  <t align='center'><t color='#006400'><t size='1.7'>Fördermengen</t></t></t><br/><br/> 
						  <t size='1.3'><t align='left'> 
						  Gas: %3 Einheiten/h <br/> 
						  <br/> 
						  Öl:  %4 Einheiten/h <br/></t></t>  
						",_tiefe,((1 / _speedF) * 2),(_Gas * 40),(_Oel * 40),_itemval];
		
		uiSleep (_speedF / 2);
	};	
	uiSleep (_speedF / 2);
};

_lagerRaum SVAR ["trunk_in_use",false,true];
_lagerRaum SVAR ["bohr_recor",[_GasTief,_OelTief,_tiefe],true];
liga_bohrsteu 	= [false,1];
[_lagerRaum] remoteExecCall ["LIGA_fnc_updateTurm",HC_id];