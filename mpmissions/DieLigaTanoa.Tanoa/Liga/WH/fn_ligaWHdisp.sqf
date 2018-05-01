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
║ File: fn_ligaWHdisp.sqf
║ Author: Hirschi Liga-Life	
║ Vorlage: Bryan "Tonic" Boardwine
╚══════════════════════════════════════════════════╝
*/
private["_item_list","_max","_side","_best_list","_list_data","_name","_best","_best_ar","_epreis","_vpreis"];

disableSerialization;

//Setup control vars.
_display = findDisplay 4000;
_item_list = _display displayCtrl 4001;
_best_list = _display displayCtrl 4002;


//Purge list
lbClear _item_list;
lbClear _best_list;

//_list_data = ligaWH_WA + ligaWH_WA_1;
//_best_ar = ligaWH_best + ligaWH_best_1;

if(GVAR_MNS ["lci_reb",false]) then {
	_side = "REB";
}else{
	_side = switch (playerSide) do {
		case civilian 		: {"CIV"};
		case independent	: {"UHR"};	// Da war sie wieder ... die Uhr :D
		default				  {"CIV"};
	};
};

_list_data_shops = M_CONFIG(getArray,"Warehouse","WH_Displ","dispShops");

_list_data	=	M_CONFIG(getArray,"Shops",(SEL(_list_data_shops,WH_ind)),_side);
life_shop_type = SEL(_list_data_shops,WH_ind);
ctrlSetText[4041,format["%1",(SEL(_list_data,0))]];
{
	if!(EQUAL(SEL(_x,3),"")) then {
		_name = [([SEL(_x,0),0] call life_fnc_varHandle)] call life_fnc_vartostr;	
		_icon = [([SEL(_x,0),0] call life_fnc_varHandle)] call life_fnc_itemIcon;
		
		_best = [0,SEL(_x,0),true,true]call life_fnc_ligaWHcalc;
		
		_item_list lbAdd format["%1 ",_name];
		_item_list lbSetPicture [(lbSize _item_list)-1,_icon];

		_epreis = [SEL(_x,0),true]call life_fnc_ligaWHcalcPreis;
		_vpreis = [SEL(_x,0),false]call life_fnc_ligaWHcalcPreis;
		if(EQUAL(_vpreis,-1)) then {_vpreis = "--";};
		if(EQUAL(_epreis,-1)) then {_epreis = "--";};
		
		_best_list lbAdd format["%1 Stk Verk:%2$ Eink:%3$",[_best] call life_fnc_numberText,_vpreis,_epreis];	
							
		if (_best <=  0) then {	
			_item_list lbSetColor  [_forEachIndex,[1, 0, 0, 0.7]];
			_best_list lbSetColor  [_forEachIndex,[1, 0, 0, 0.7]]; 
		} else { 

			_max 	= M_CONFIG(getArray,"Warehouse",SEL(_x,3),SEL(_x,0));
			_max	= SEL(_max,0);
			if(_best > (_max * 0.95)) then {
				_best_list lbSetColor  [_forEachIndex,[1, 0.72 , 0.06, 0.7]]; 
				_item_list lbSetColor  [_forEachIndex,[1, 0.72 , 0.06, 0.7]];  
			}else{			
				_best_list lbSetColor  [_forEachIndex,[0, 1 , 0, 0.7]]; 
				_item_list lbSetColor  [_forEachIndex,[0, 1 , 0, 0.7]];  
			};
		};				
	};	
} foreach (SEL(_list_data,1));