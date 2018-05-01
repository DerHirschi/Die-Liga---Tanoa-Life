#include "..\..\Liga_script_macros.hpp"
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0;};
if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price","_marketprice","_type","_F"];
#define Btn1 2406
#define Btn2 2407
#define Btn3 2408

disableSerialization;

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn3 buttonSetAction "[1,'Support Shop',([([(lbData[2401,(lbCurSel 2401)]),0] call life_fnc_varHandle)] call life_fnc_varToStr),parseNumber(ctrlText 2404)]call life_fnc_toSt;[true,(lbData[2401,(lbCurSel 2401)]),(parseNumber(ctrlText 2404))] call life_fnc_handleInv; ";


//[1,'Support Shop',([([(lbData[2401,(lbCurSel 2401)]),0] call life_fnc_varHandle)] call life_fnc_varToStr),parseNumber(ctrlText 2404)]call life_fnc_toSt;[true,(lbData[2401,(lbCurSel 2401)]),(parseNumber(ctrlText 2404))] call life_fnc_handleInv;

_Btn1 ctrlShow false;
_Btn2 ctrlShow false;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shop_data = ["Support Shop",life_inv_items];
ctrlSetText[2403,format["%1", _shop_data select 0]];
_i = 0;
{


		_name = [_x] call life_fnc_vartostr;
		_icon = [_x] call life_fnc_itemIcon;
		_price = 0;
		////Marktsystem Anfang////

		////Marktsystem Ende////
		
	_item_list lbAdd format["%1  ($%2)",_name,[_price] call life_fnc_numberText];
	_item_list lbSetColor  [_i,[0.1, 0.4 , 1, 0.7]]; 

	_item_list lbSetData [(lbSize _item_list)-1,([_x,1] call life_fnc_varHandle)];
	_item_list lbSetValue [(lbSize _item_list)-1,_price];
	_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
	
	_i = _i + 1;
} foreach (_shop_data select 1);

{
	_var = _x;
	_val = missionNameSpace getVariable _var;
	//_name = [_var] call life_fnc_vartostr;
	// _icon = [_var] call life_fnc_itemIcon;
	
	if(_val > 0) then
	{

		_name = [_var] call life_fnc_vartostr;
		_icon = [_var] call life_fnc_itemIcon;
		_gear_list lbAdd format["%1x %2 ($%3)",_val,_name,0];
		_gear_list lbSetData [(lbSize _gear_list)-1,([_x,1] call life_fnc_varHandle)];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
	};
} foreach (_shop_data select 1);
//Call short view here
//[_shop_data select 1] spawn life_fnc_marketShortView;
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0;};
