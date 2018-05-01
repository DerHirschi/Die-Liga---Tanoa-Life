#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
	
	Edit: Animationfix by Otti Liga Life
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_tuv1"];
_veh = cursorTarget;
life_interrupted = false;

if(isNull _veh) exitwith {};

if(KIND_TRUNK_KH(_veh)) then
{
	
	if("ToolKit" in (items player)) then
	{
		_tuv = _veh GVAR["tuv",[0,0]];
		life_action_inUse = true;
		_displayName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _veh),"displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		playSound "Repair";
		
		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel" ) then {
					player action ["SwitchWeapon", player, player, 100];   
					player playMove "Acts_carFixingWheel"; 
					[player,"Acts_carFixingWheel",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
					player playActionNow "stop";
					[player,"stop",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
					player playMove "Acts_carFixingWheel"; 
					[player,"Acts_carFixingWheel",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
					player playActionNow "stop";
					[player,"stop",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
  					player playMove "Acts_carFixingWheel"; 
					[player,"Acts_carFixingWheel",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
			};
			sleep 0.18;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		[player,"stop",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		player removeItem "ToolKit";
		if(playerSide isEqualTo east) then 
			{
				player addItem "ToolKit";
				ADD(BANK,8000);
				hint "Du erhaelst 8.000 $ fuer deine gute Arbeit .. Danke Jungs !!!";
				_veh setDamage 0;
			};
		_tuv1 = SEL(_tuv,0);
		if(_veh isKindOf "Air") then {_tuv1 = 7 - _tuv1;} else {_tuv1 = 14 - _tuv1;};
		/*
		if(_tuv1 < 0) then {
			_veh setDamage 0.32;
		}else{
			_veh setDamage 0.15;
		};
		*/
		_veh setDamage 0;
		if(_veh GVAR ["Mani",false]) then {	_veh SVAR ["Mani",false,true];};

		
		_veh SVAR ["tuv",[_tuv select 0,(_tuv select 1) + 1],true];
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		
	};
};

