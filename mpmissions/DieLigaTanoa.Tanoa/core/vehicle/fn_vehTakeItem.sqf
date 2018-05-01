#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint localize "STR_MISC_VehDoesntExist"};
if(!alive player) exitwith {closeDialog 0;};

if(EQUAL((lbCurSel 3502),-1)) exitWith {hint localize "STR_Global_NoSelection";};
_ctrl 	= ctrlSelData(3502);
_num 	= ctrlText 3505;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num 	= parseNumber(_num);
if(EQUAL(_num,0)) exitWith {hint localize "STR_MISC_Under1";};
/*
if(ad_debugRPT)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║ Veh Inv   _num   : %1",_num];
				diag_log "╠══════════════════════════════════════════════════╣";
			};	
*/			
_index 	= [_ctrl,((life_trunk_vehicle GVAR "Trunk") select 0)] call TON_fnc_index;
_data 	= (life_trunk_vehicle GVAR "Trunk") select 0;
_old 	=  life_trunk_vehicle GVAR "Trunk";
if(EQUAL(_index,-1)) exitWith {};
_value 	= _data select _index select 1;
if(_num > _value) exitWith {hint localize "STR_MISC_NotEnough"};
_num 	= [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_num,0)) exitWith {hint localize "STR_NOTF_InvFull"};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
/*
		if(ad_debugRPT)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║ Veh Inv   _data   : %1",_data];
				diag_log format["║ Veh Inv   _old   : %1",_old];
				diag_log format["║ Veh Inv   _weight   : %1",_weight];
				diag_log format["║ Veh Inv   _ctrl   : %1",_ctrl];
				diag_log format["║ Veh Inv   _num   : %1",_num];
				diag_log format["║ Veh Inv   _value   : %1",_value];
				diag_log format["║ Veh Inv   _index   : %1",_index];
				diag_log format["║ Veh Inv   life_trunk_vehicle   : %1",life_trunk_vehicle];
				diag_log "╠══════════════════════════════════════════════════╣";
			};	
*/
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(EQUAL(_num,_value)) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle SVAR["Trunk",[_data,(SEL(_old,1)) - _weight],true];		
		[life_trunk_vehicle] call life_fnc_vehInventory;
		/*
							if(ad_debugRPT)then{	 
				diag_log "╠══════════════════════════════════════════════════╣";
				diag_log format["║ Veh Inv   _data   : %1",_data];
				diag_log format["║ Veh Inv   _old   : %1",_old];
				diag_log format["║ Veh Inv   _weight   : %1",_weight];
				diag_log format["║ Veh Inv   _ctrl   : %1",_ctrl];
				diag_log format["║ Veh Inv   _num   : %1",_num];
				diag_log format["║ Veh Inv   _value   : %1",_value];
				diag_log format["║ Veh Inv   _index   : %1",_index];
				diag_log format["║ Veh Inv   life_trunk_vehicle   : %1",life_trunk_vehicle];
				diag_log "╠══════════════════════════════════════════════════╣";
			};	
			*/
	}
		else
	{
		hint localize "STR_NOTF_InvFull";
	};
