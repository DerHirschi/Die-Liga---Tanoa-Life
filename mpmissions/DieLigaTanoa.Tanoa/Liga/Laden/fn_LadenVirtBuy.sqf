#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_virt_menu.sqf
	Vorlage: Bryan "Tonic" Boardwine
	Author: Hirschi - Die Liga

*/

private["_type","_price","_amount","_diff","_name","_fnc_handleLadenInv","_kassObj"];
if((lbCurSel 2401) isEqualTo -1) exitWith {closeDialog 0; hint localize "STR_Shop_Virt_Nothing"};

_fnc_handleLadenInv = {
	private["_trunk","_index","_e","_invAmm"];
	_item 		= SEL(_this,0);
	_ammount	= SEL(_this,1);
	_e			= false;
	{
		
		_trunk  = _x GVAR ["Trunk",[[],0]];
		_index  = [_item,SEL(_trunk,0)]call TON_fnc_index;
		if!(EQUAL(_index,-1)) then {
			if(_ammount <= (SEL(SEL(SEL(_trunk,0),_index),1))) then {
				_e = true;
				(SEL(_trunk,0)) set [_index,[_item,(SEL(SEL(SEL(_trunk,0),_index),1) - _ammount)]];
				_weight = ([_item] call life_fnc_itemWeight) * _ammount;
				_trunk set [1,(SEL(_trunk,1) - _weight)];				
			}else{
				_invAmm = SEL(SEL(SEL(_trunk,0),_index),1);
				SEL(_trunk,0) deleteAt _index;
				_weight = ([_item] call life_fnc_itemWeight) * _ammount;
				_trunk set [1,(SEL(_trunk,1) - _weight)];
			};
			_x SVAR ["Trunk",_trunk,true];
		};
		if(_e)exitWith {};
	}forEach life_shop_npc;	
	
};


_type			= lbData [2401,(lbCurSel 2401)];
_price			= lbValue[2401,(lbCurSel 2401)];
_amount 		= ctrlText 2404;
_kassObj		= SEL(life_shop_npc,1);
life_shop_npc	= SEL(life_shop_npc,0);
_type			= call compile format["%1",_type];
_name 			= [([(SEL(_type,0)),0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber(_amount);

_diff = [(SEL(_type,0)),_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
if(_amount > (SEL(_type,1))) exitWith {hint "Die Menge, die du kaufen willst, ist leider nicht verfügbar.";};

if(([true,(SEL(_type,0)),_amount] call life_fnc_handleInv)) then{
	if((_price * _amount) > life_cash) exitWith {[false,(SEL(_type,0)),_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
	__SUB__(life_cash,_price * _amount);
	_kasseninh = _kassObj GVAR "kassinh";
	if(!isNil "_kasseninh") then {
		_kasseninh = (_kasseninh + _price * _amount);
		_kassObj SVAR["kassinh",_kasseninh,true];
	};	
	
	[(SEL(_type,0)),_amount] call _fnc_handleLadenInv;
	
	hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[_price * _amount] call life_fnc_numberText];
	
	
	[life_shop_type] remoteExec ["TON_fnc_updateKass",RSERV];	
	[life_shop_type] remoteExec ["TON_fnc_updateZusa",RSERV];
};
closeDialog 0; 
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
waitUntil {(isNull (findDisplay 2400))};
[_kassObj] spawn LIGACL_fnc_LadenSellMenu;