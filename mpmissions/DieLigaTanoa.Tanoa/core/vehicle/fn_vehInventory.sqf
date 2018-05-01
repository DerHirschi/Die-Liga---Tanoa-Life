#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_vehInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used a refresher for the vehicle inventory / trunk menu items.
*/
private["_veh","_tInv","_pInv","_veh_data","_icon"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh OR !alive _veh) exitWith {closeDialog 0;}; //If null / dead exit menu
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
_pInv = (findDisplay 3500) displayCtrl 3503;
lbClear _tInv;
lbClear _pInv;

if(_veh isKindOf "House_F" && !( (typeOf _veh) in ["Land_Tank_rust_F","Land_Research_house_V1_F","Land_FuelStation_02_pump_F","Land_FuelStation_01_pump_F","Land_fs_feed_F"])) then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_veh GVAR["containers",[]]);
	_veh_data = [_mWeight,(_veh GVAR["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_veh] call life_fnc_vehicleWeight;
};

if(SEL(_veh_data,0) isEqualTo -1) exitWith {closeDialog 0};

ctrlSetText[3504,format["Gewicht: %1/%2",SEL(_veh_data,1),SEL(_veh_data,0)]];
_data = _veh GVAR ["Trunk",[]];
if(EQUAL(count _data,0)) then {_veh SVAR["Trunk",[[],0],true]; _data = [];} else {_data = _data select 0;};
//Player Inventory Items
{
		_val = GVAR_MNS _x;
		if(_val > 0) then
		{
			_str 	= [_x] call life_fnc_varToStr;
			_shrt 	= [_x,1] call life_fnc_varHandle;
			_icon 	= [_x] call life_fnc_itemIcon;
			_pInv lbAdd format["[%1] - %2",_val,_str];
			_pInv lbSetData [(lbSize _pInv)-1,_shrt];
			_pInv lbSetPicture [(lbSize _pInv)-1,_icon];
		};
} foreach life_inv_items;

//Trunk Inventory Items
{
		_val = SEL(_x,1);
		if(_val > 0) then
		{
			_var  = [_x select 0,0] call life_fnc_varHandle;
			_name = [_var] call life_fnc_varToStr;
			_icon = [_var] call life_fnc_itemIcon;
			_tInv lbAdd format["[%1] - %2",_val,_name];
			_tInv lbSetData [(lbSize _tInv)-1,_x select 0];
			_tInv lbSetPicture [(lbSize _tInv)-1,_icon];
		};	
} foreach _data;