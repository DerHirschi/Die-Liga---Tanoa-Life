#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_side","_item_list","_gear_list","_shop_data","_name","_price","_index","_whArray","_type","_item"];
disableSerialization;
#define Btn3 2408
//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;
_Btn3 = _display displayCtrl Btn3;
_Btn3 buttonSetAction "[] call life_fnc_virt_buy;";

//Purge list
lbClear _item_list;
lbClear _gear_list;

if(missionNamespace getVariable ["lci_reb",false]) then {
	_side = "REB";
}else{
	_side = switch (playerSide) do {
		case civilian 		: {"CIV"};
		case independent	: {"UHR"};	// Da war sie wieder ... die Uhr :D
		default				  {"CIV"};
	};
};

_shop_data = M_CONFIG(getArray,"Shops",life_shop_type,_side);

ctrlSetText[2403,format["%1",SEL(_shop_data,0)]];
{	
	_item	= SEL(_x,0);	
	
	//_index 	= [_item,__GETC__(buy_array)] call TON_fnc_index;
	if!(/*EQUAL(_index,-1) &&*/EQUAL(SEL(_x,2),-1)) then
	{
		_name = [([_item,0] call life_fnc_varHandle)] call life_fnc_vartostr;
		_icon = [([_item,0] call life_fnc_varHandle)] call life_fnc_itemIcon;
		//_price = (__GETC__(buy_array) select _index) select 1;
		_price = SEL(_x,2);
		
		////Marktsystem Anfang////
	/*
		_marketprice = [_item] call life_fnc_marketGetBuyPrice;
		if(_marketprice != -1) then
		{
			_price = _marketprice;
		};
	*/
		////Marktsystem Ende////
		

		if!(EQUAL(SEL(_x,3),"")) then {
			_price = [_item,true]call life_fnc_ligaWHcalcPreis;
			_item_list lbAdd format["%1  ($%2)",_name,[_price] call life_fnc_numberText];
			_whArray = GVAR_MNS SEL(_x,3);
			if!(EQUAL(_whArray,[[]])) then {
				_index 	= [_item,_whArray] call TON_fnc_index;
				if ((SEL(SEL(_whArray,_index),1)) <=  0) then {	
					_item_list lbSetColor  [_forEachIndex,[1, 0, 0, 0.7]]; 
				} else { 
					_item_list lbSetColor  [_forEachIndex,[0, 1 , 0, 0.7]];  
				};
			}else{
				_item_list lbSetColor  [_forEachIndex,[1, 0, 0, 0.7]]; 
				
			};
			
		}else{
			_item_list lbAdd format["%1  ($%2)",_name,[_price] call life_fnc_numberText];
		};

	_item_list lbSetData [(lbSize _item_list)-1,_item];
	_item_list lbSetValue [(lbSize _item_list)-1,_price];
	_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
	};
} foreach (SEL(_shop_data,1));

{
	_item = SEL(_x,0);
	_var = [_item,0] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _var;
	
	if(_val > 0 && !(EQUAL(SEL(_x,1),-1)) ) then
	{
		_name = [_var] call life_fnc_vartostr;
		_icon = [_var] call life_fnc_itemIcon;
		_gear_list lbAdd format["%1x %2 ($%3)",_val,_name,[_item,false]call life_fnc_ligaWHcalcPreis];
		_gear_list lbSetData [(lbSize _gear_list)-1,_item];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
	};
} foreach (SEL(_shop_data,1));
//Call short view here
//[_shop_data select 1] spawn life_fnc_marketShortView;