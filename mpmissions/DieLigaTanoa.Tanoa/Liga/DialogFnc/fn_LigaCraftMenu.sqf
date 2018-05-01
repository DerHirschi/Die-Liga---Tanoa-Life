//#include "Liga_script_macros.hpp"
#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
*/
private ["_on","_FrakSel","_itemAr"];
_on = false;
disableSerialization;
if(isNull (findDisplay 3500)) then {
	closeDialog 0;
	createDialog "Liga_craft";
	waitUntil{!isNull (findDisplay 3500)};
	_on = true;
};



_dialog 		= findDisplay 3500;
_frak			= _dialog displayCtrl 3503;
_ItemList		= _dialog displayCtrl 3502;

lbClear _ItemList;

if(_on) then {
	lbClear _frak;
	{
		_frak lbAdd SEL(_x,0);
		_frak lbSetData [(lbSize _frak)-1,str _x];
	}forEach [["Uhreinwohner","UHRpro"],["Zivilist","CIVpro"],["Guerilla","REBpro"]];	
};


if(EQUAL((lbCurSel 3503),-1) ) then { 
	_FrakSel = ["Zivilist","CIVpro"];
}else{
	_FrakSel = lbData [3503,lbCurSel 3503];
	_FrakSel = call compile format["%1",_FrakSel];
};

ctrlSetText[3510,format["Crafting Rezepte : %1 ",  SEL(_FrakSel,0) ]];

_RezItems 	= M_CONFIG(getArray,"LigaProcess",SEL(_FrakSel,1),"CraftMen");

{
	_itemAr = M_CONFIG(getArray,"LigaProcess",SEL(_FrakSel,1),_x);
	_item	= SEL(SEL(_itemAr,2),0);
	_shrt 	= [_item,0] call life_fnc_varHandle;
	_str 	= [_shrt] call life_fnc_varToStr;	
	_icon 	= [_shrt] call life_fnc_itemIcon;
	
	
	_ItemList lbAdd format["%1",_str];
	_ItemList lbSetData [(lbSize _ItemList)-1,_x];
	_ItemList lbSetPicture [(lbSize _ItemList)-1,_icon];
	
} forEach _RezItems;

