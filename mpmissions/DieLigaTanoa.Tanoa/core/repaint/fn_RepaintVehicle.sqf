#include "..\..\Liga_script_macros.hpp"
/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming
Edited by H1rschi - Di3 Lig4

Description: Does the active repaint man....read the title!
*/

private["_index","_veh","_color","_color_index","_flag"];
if(!isNull (findDisplay 2300)) then {
disableSerialization;	
_index = lbCurSel 2302;

_flag = lbData[2302,_index];
_flag = call compile format["%1",_flag];
_flag = SEL(_flag,1);

_color = lbcursel 2304;
_color_index = lbValue[2304,_color];

closeDialog 0;
waitUntil{isNull life_CarPreview};
_veh = paint_objects;
paint_objects = nil;
_veh = SEL(_veh,_flag);


//hint format ["%1      %2          %3     %4",_color_index,_veh,position player,_flag];
_baseprice = 70000;  //Price for repaint
_vehicleData = _veh GVAR["vehicle_info_owners",[]];
_vehOwner = (_vehicleData select 0) select 0;
if(CASH < _basePrice) exitWith {closeDialog 0;hint "Du hast keine 80.000 um den Lackierer zu bezahlen."};
if(isNil {_vehicleData}) exitWith {closeDialog 0;hint "Es gibt keine Infos zu diesem Fahrzeug, es ist entweder gemietet oder gecheated."};
if ((getPlayerUID player) != _vehOwner) exitWith {closeDialog 0;hint "Du bist nicht der Besitzer des Fahrzeugs das lackiert werden soll."};

		//life_action_inUse = true;
		//_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		//_upp = format["Lackiere %1",_displayName];
		//Setup our progress bar.
		//disableSerialization;
		//5 cutRsc ["life_progress","PLAIN"];
		//_ui = uiNameSpace getVariable "life_progress";
		//_progress = _ui displayCtrl 38201;
		//_pgText = _ui displayCtrl 38202;
		//_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		//_progress progressSetPosition 0.01;
		//_cP = 0.01;
		/*
		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};						
			sleep 0.29;
			//[player,"spraycan"] call life_fnc_globalSound; //Just if you have global sounds!

			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];			
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		*/
		//life_action_inUse = false;
		//5 cutText ["","PLAIN"];
		//player playActionNow "stop";
		//if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen!","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {closeDialog 0;titleText["Du musst aus dem Fahrzeug aussteigen, um es lackieren zu können!","PLAIN"];};
	
		SUB(CASH,_basePrice);
		//Send toDB
	
		[_veh,_color_index] remoteExec ["TON_fnc_vehicleRepaint",RSERV];		
		//Color vehicle locally
		[_veh,_color_index] call life_fnc_colorVehicle;		
		[] call SOCK_fnc_updateRequest; //Sync silently because it's obviously silently..
	
		//hint format["Fahrzeug: %1 || Neue Farbe: %2 || Besitzer: %3",_veh,_color_index,_vehicledata];
};