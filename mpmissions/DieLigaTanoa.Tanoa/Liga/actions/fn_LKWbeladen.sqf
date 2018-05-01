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
	║	File: fn_LKWbeladen.sqf	
	║		
	║	Author:  Hirschi - Die Liga		
	║	Vorlage: Tonic		
	╠══════════════════════════════════════════════════╗
	╚══════════════════════════════════════════════════╝
*/
private["_lkw","_weight","_item","_vInv","_items","_itemIndex","_itemWeight","_space"];
_rez	=	M_CONFIG(getArray,"LigaGather","Beladung",(SEL(_this,0)));
_item	=	SEL(_rez,0);
_verVal	=	SEL(_rez,1);
_mark	=	SEL(_this,1);
_pos	=	getMarkerPos _mark;
_lkw 	= 	nearestObjects [_pos,["CAR"],3];
if(EQUAL(count _lkw,0)) exitWith {hint "Es steht kein Fahrzeug unter dem Trichter ...";};
_lkw 	= 	SEL(_lkw,0);
if(isNull _lkw) exitWith {};
if(EQUAL(SEL(_rez,2),0) &&  ((typeOf _lkw) in (M_CONFIG(getArray,"LigaVehSetup","Fahrzeuge","tanker")))) exitWith{hint "Ey Junge !Du kannst nur Öl oder Kerosin in einen Tanklaster füllen!"};
if(EQUAL(SEL(_rez,2),1) && !((typeOf _lkw) in (M_CONFIG(getArray,"LigaVehSetup","Fahrzeuge","tanker")))) exitWith{hint "Du kannst Öl oder Kerosin NUR in einen Tanklaster füllen!"};
if((_lkw distance2D _pos) > 1.8 ) exitWith {hint "Parke deine Karre genau in der Markierung...";};

_lock 	= 	_lkw GVAR "loading";

if!(isNil "_lock") exitWith {};

_lkw SVAR ["loading",true,true];
hint "Das Fahrzeug wird beladen ...";
while {(_lkw distance2D _pos) < 1.9} do {
	if((_lkw distance2D _pos) > 1.9 ) exitWith {hint "Du musst schon stehen bleiben";};
	//waitUntil {!(_lkw GVAR ["trunk_in_use",false])};
	
	_vInv 	= _lkw GVAR ["Trunk",[[],0]];
	_items 	= SEL(_vInv,0);
	_space 	= SEL(_vInv,1);
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_lkw] call life_fnc_vehicleWeight;
	_sum = [_item,_verVal,SEL(_weight,1),SEL(_weight,0)] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {};
	_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;
	if(EQUAL(_itemIndex,-1)) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};	
	_lkw SVAR["Trunk",[_items,_space + _itemWeight],true];	
	titleText[format["%1 Einheiten noch bis Fahrzeug voll..",([_item,9999,SEL(_weight,1),SEL(_weight,0)] call life_fnc_calWeightDiff)],"PLAIN"];
	Sleep 4;
};

_lkw SVAR ["loading",nil,true];
titleText["Fahrzeug ist fertig beladen...","PLAIN"];