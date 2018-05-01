#include "..\..\Liga_script_macros.hpp"
/*
	File: .sqf
	Vorlage: Bryan "Tonic" Boardwine
	Author: Hirschi - Die Liga

*/

private["_display","_regale","_i","_data","_flag","_item_list","_shop_data","_name","_price","_index","_type","_item"];

life_shop_npc = SEL(_this,0);
if(vehicle player != player) exitWith {hint "Steig aus du fauler Sack !!!";};

closeDialog 0; 
createDialog "shops_menu";
waitUntil {!(isNull (findDisplay 2400))};
disableSerialization;
#define Btn3 2408
//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;

_Btn3 = _display displayCtrl Btn3;
//////////////////////////
_Btn3 buttonSetAction "[] spawn LIGACL_fnc_LadenVirtBuy;";
//////////////////////////
//Purge list
lbClear _item_list;

_house 			= nearestObject [(getPosATL life_shop_npc), "House_F"];
life_shop_type 	= _house;
_kasspr 		= life_shop_npc GVAR ["kasspreis",[]];
_allObj			= _house   GVAR ["kassen",[]];
if( EQUAL(_allObj,[]) || EQUAL(_kasspr,[]) ) exitWith {closeDialog 0; };
_regale 		= [];
{
	if(life_shop_npc in _x)exitWith {_regale = SEL(_x,1);};
}forEach _allObj;

	
_data 		= [];

{
	_flag = _x GVAR ["Trunk",[]];
	if(EQUAL(count _flag,0)) then {_x SVAR["Trunk",[[],0],true]; _flag = [];} else {_flag = SEL(_flag,0);};
	
	
	{
		_i = [(SEL(_x,0)),_data]call TON_fnc_index;
		if(EQUAL(_i,-1))then {
			_data pushBack _x;
		}else{
			_data set [_i,[(SEL(SEL(_data,_i),0)),(SEL(SEL(_data,_i),1) + SEL(_x,1))]];
		};			
		
	}forEach _flag;	
	
}forEach _regale;
//diag_log str _data;


ctrlSetText[2403,format["%1",((_house   GVAR ["ladextra",["",0,0]]) select 0)]];

{	
	_item	= SEL(_x,0);	
	_index = [_item,_kasspr]call TON_fnc_index;
	if!(EQUAL(_index,-1)) then {
		
		_name = [([_item,0] call life_fnc_varHandle)] call life_fnc_vartostr;
		_icon = [([_item,0] call life_fnc_varHandle)] call life_fnc_itemIcon;
	
		_price = SEL(SEL(_kasspr,_index),1);		
		//diag_log str _price;
		//diag_log str _kasspr;
		//diag_log str (SEL(SEL(_kasspr,_index),1));
		//diag_log str _item;
		//diag_log str _x;
		
		_item_list lbAdd format["%1  (%3Stk) ($%2)",_name,[_price] call life_fnc_numberText,SEL(_x,1)];	

		_item_list lbSetData [(lbSize _item_list)-1,(str[_item,SEL(_x,1)])];
		_item_list lbSetValue [(lbSize _item_list)-1,_price];
		_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
	};
} foreach _data;

life_shop_npc = [_regale,life_shop_npc];