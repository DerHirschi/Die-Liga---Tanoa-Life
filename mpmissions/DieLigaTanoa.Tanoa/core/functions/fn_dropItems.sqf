#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Dir Liga
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value"];
_unit = SEL(_this,0);

{
	_item = _x;
	_value = GVAR_MNS _item;
	
	switch(_item) do
	{
		case "lin_wate":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS[_x,0];
			};
		};
		
		case "lin_tba":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS[_x,0];
			};
		};
		
		case "lin_red":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS [_x,0];
			};
		};
		
		case "lin_fuE":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS[_x,0];
			};
		};
		
		case "lin_fuF":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS [_x,0];
			};
		};
		
		case "lin_coff":
		{
			if (_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS [_x,0];
			};
		};
		
		case "life_cash":
		{
			if(life_cash > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj SVAR["item",["money",life_cash],true];
				_obj setPos _pos;
				_log = [player, player, life_cash, 2, life_atmcash, life_cash];
				LOG_to_HC(0,_log);

				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				SVAR_MNS[_x,0];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [SEL(_pos,0), SEL(_pos,1), 0];
				_obj = "Land_Suitcase_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj SVAR["item",[_var,_value],true];
				SVAR_MNS[_x,0];
			};
		};
	};
} foreach (life_inv_items + ["life_cash"]);