#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga

	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_icon"];
disableSerialization;

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};
_side = "civ";
if(playerSide in [civilian,independent]) then {		
	if(liga_cop_on) then {_side = "cop";};	
	if(liga_lrk_on) then {_side = "med";};	
}else{	
	_side = switch(playerSide) do {
				case west: {"cop"}; 
				//case independent: {"med"}; 
				case east: {"alac"};
				//default {"civ"};
	};			
};
/*
_side = switch(playerSide) do {
	case west:{"cop"}; 
	case civilian:{"civ"}; 
	case independent:{"med"};
	case east:{"adac"};
};
*/
_dialog = findDisplay 2001;
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_near = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
_mstatus = _dialog displayCtrl 2015;
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='icons\bank.paa'/> <t size='0.9px'>$%1</t><br/><img size='1.2' image='icons\money.paa'/> <t size='0.9'>$%2</t>",[life_atmcash] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
ctrlSetText[2009,format["Kapazität: %1 / %2", life_carryWeight, life_maxWeight]];
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_icon = [_x] call life_fnc_itemIcon;
	_val = GVAR_MNS _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%2 [x%1]",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
		_inv lbSetPicture [(lbSize _inv)-1,_icon];
	};
} foreach life_inv_items;
{
	if((SEL(_x,1)) isEqualTo _side) then
	{
		if!((SEL(_x,0)) in ["lci_civspawn","lci_uhrspawn","lci_liga","lci_stlkr","lci_admin","lci_ano","lci_sil"] ) then {
			_str = [SEL(_x,0)] call life_fnc_varToStr;
			_val = GVAR_MNS (SEL(_x,0));
			if(_val) then
			{
				_struct = _struct + format["%1<br/>",_str];
			};
		};
	};
} foreach life_licenses;

if(EQUAL(_struct,"")) then
{
	_struct = "Alter du hast keine Lizenzen";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.85px'>
%1
</t>
",_struct];