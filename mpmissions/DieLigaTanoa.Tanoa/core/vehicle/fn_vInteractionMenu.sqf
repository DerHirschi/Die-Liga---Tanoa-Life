#include "..\..\Liga_script_macros.hpp"
/*
File: fn_vInteractionMenu.sqf
Vorlage: Bryan "Tonic" Boardwine
Author: Hirschi - Die Liga 

Description:
Replaces the mass addactions for various vehicle actions
*/


#define Btn1 37453
#define Btn2 37455
#define Btn3 37454
#define Btn4 37452
#define Btn5 37451
#define Btn6 37450
#define Btn7 37456
#define Btn8 37457
#define Btn9 37459
#define Btn10 37460
#define Title 37401

private["_fn_liga_trunk","_fn_ligacar_lock","_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];

if(!dialog) then {	
	if((playerSide in [civilian,west,independent] || liga_cop_on) && !liga_lrk_on ) then {
		createDialog "Liga_vInteraction_CIV";
	};
	if(playerSide isEqualTo east 		 ) then {
		createDialog "Liga_vInteraction_ALAC";
	};
	if(liga_lrk_on) then {
		createDialog "Liga_vInteraction_LRK";
	};
};





	disableSerialization;
	_curTarget = cursorTarget;
	
	if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

	_isVehicle = if(KIND_TRUNK_KH(_curTarget)) then {true} else {false};

	if(!_isVehicle) exitWith {closeDialog 0;};
	
	life_vInact_curTarget = _curTarget;
	if!(_curTarget isKindOf "Air" || _curTarget isKindOf "Car" || _curTarget isKindOf "Ship") exitWith {closeDialog 0;}; //Bad side check?
	

	_display = findDisplay 37400;
	_Btn1 = _display displayCtrl Btn1;
	_Btn2 = _display displayCtrl Btn2;
	_Btn3 = _display displayCtrl Btn3;
	_Btn4 = _display displayCtrl Btn4;
	_Btn5 = _display displayCtrl Btn5;
	_Btn6 = _display displayCtrl Btn6;
	_Btn7 = _display displayCtrl Btn7;
	_Btn8 = _display displayCtrl Btn8;
	_Btn9 = _display displayCtrl Btn9;
	_Btn10 = _display displayCtrl Btn10;

if(liga_tooltip) then {	_Btn10 ctrlSetTooltip "Schließen";};	
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";
if("ToolKit" in (items player)) then {_Btn1 ctrlEnable true; if(liga_tooltip) then {	_Btn1 ctrlSetTooltip "Repariert das Fahrzeug";};} else {_Btn1 ctrlEnable false;};

if(_curTarget isKindOf "Ship") then {
	if(liga_tooltip) then {	_Btn2 ctrlSetTooltip "Flip das Boot";};
	_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	if(_curTarget isKindOf "Ship" && (local _curTarget) && (count crew _curTarget isEqualTo 0)) then { 	_Btn2 ctrlEnable true;	} else {_Btn2 ctrlEnable false};
	} else {
		if(liga_tooltip) then {	_Btn2 ctrlSetTooltip "Flip das Fahrzeug";};
		_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		if(count crew _curTarget isEqualTo 0 && (canMove _curTarget)) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
	};

if!(count crew _curTarget isEqualTo 0) then {
	if(liga_tooltip) then {	_Btn3 ctrlSetTooltip "Zieht die Person aus dem Fahrzeug";};	
	_Btn3 buttonSetAction "closeDialog 0;[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
}else {_Btn3 ctrlEnable false;};
_Btn6 ctrlEnable true; 	
_Btn6 buttonSetAction "[] spawn liga_fnc_vehlock;";
if(liga_tooltip) then {	_Btn6 ctrlSetTooltip "Fahrzeug öffnen/schließen";};
	
if((side player) isEqualTo civilian && !liga_lrk_on ) then {
	
	_Btn4 buttonSetAction "closeDialog 0;[] spawn ligafn_alac_vehinfo;";
	if(liga_tooltip) then {	_Btn4 ctrlSetTooltip "Zeigt die TÜV Plakette des Fahrzeugs";};
	
	if(typeOf _curTarget in ["O_Truck_03_device_F","O_T_Truck_03_device_ghex_F"]) then {
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		_Btn5 ctrlEnable true; 
		if(liga_tooltip) then {	_Btn5 ctrlSetTooltip "mit Gerät farmen";};
	}else{
		_Btn5 ctrlEnable false;
	};	
	_Btn9 ctrlEnable true;
	_Btn9 buttonSetAction "[life_vInact_curTarget] spawn liga_fnc_trunk;";
	if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "Kofferraum öffnen";};	
	_Btn7 ctrlEnable false;	
};
	
if!(life_blacklisted isEqualTo 0) then {		
		_Btn4 buttonSetAction "closeDialog 0;[life_vInact_curTarget] spawn ligafn_alac_vehinfo;";
		if(liga_tooltip) then {	_Btn4 ctrlSetTooltip "Zeigt Fahrzeuginformationen";};
		
		if!(isNil "flusi_tuv_marker")then{
			if(player distance (getMarkerPos "Helicopter_Prufstelle") < 100) then {	
				_Btn5 ctrlEnable true;
				if(liga_tooltip) then {	_Btn5 ctrlSetTooltip "B-Check";};
				_Btn5 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn ligafn_alac_vehinfo; createDialog 'tuv_time';";
				
				if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "General Reparatur";};			
				_Btn9 buttonSetAction "closeDialog 0; [1] spawn ligafn_bcheck;";			
				_Btn7 ctrlEnable true;
				if(liga_tooltip) then {	_Btn7 ctrlSetTooltip "Triebwerkstest";};
				_Btn7 buttonSetAction "closeDialog 0;('SmokeShell' createVehicle [0,0,0]) attachTo [life_vInact_curTarget,[0, 0, -0.8]];";
			}else{_Btn7 ctrlEnable false;};	
		}else{_Btn7 ctrlEnable false;};		
	}else{_Btn7 ctrlEnable false;};	

if(playerSide isEqualTo west || cop_m || liga_cop_on ) exitWith {
	cop_m = false;
	
	if(liga_tooltip) then {	_Btn4 ctrlSetTooltip "Zeigt Fahrzeuginformationen";};	
	_Btn4 buttonSetAction "closeDialog 0;[life_vInact_curTarget] spawn ligafn_alac_vehinfo;";	

	if(liga_tooltip) then {	_Btn5 ctrlSetTooltip "Verwahrstelle";};
	_Btn5 buttonSetAction  "[life_vInact_curTarget] spawn life_fnc_impoundActionVer;";
	_Btn7 ctrlEnable true;
	if(liga_tooltip) then {	_Btn7 ctrlSetTooltip "Beschlagnahmen";};
	_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	_Btn9 ctrlEnable true;
	if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "Durchsuchen";};
	_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
}; 

	
if(playerSide isEqualTo east) exitWith {
	if(liga_tooltip) then {	_Btn4 ctrlSetTooltip "Zeigt Fahrzeuginformationen";};
	_Btn4 buttonSetAction "closeDialog 0;[life_vInact_curTarget] spawn ligafn_alac_vehinfo;";

	if!(isNil "tuv_marker")then{
		if(player distance (getMarkerPos "TUV_Prufstelle") < 40) then {			
			_Btn9 ctrlEnable true;
			if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "General Reparatur";};
			_Btn9 buttonSetAction "closeDialog 0; [1] spawn ligafn_bcheck;";		
			_Btn5 ctrlEnable true;
			if(liga_tooltip) then {	_Btn5 ctrlSetTooltip "TÜV Gutachten erstellen";};
			_Btn5 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn ligafn_alac_vehinfo; createDialog 'tuv_time';";
			_Btn7 ctrlEnable true;
			if(liga_tooltip) then {	_Btn7 ctrlSetTooltip "ASU";};
			_Btn7 buttonSetAction "closeDialog 0;('SmokeShell' createVehicle [0,0,0]) attachTo [life_vInact_curTarget,[0, 0, -0.8]];";
		}else{				
	
			_Btn5 ctrlEnable true;
			if(liga_tooltip) then {	_Btn5 ctrlSetTooltip "Verwahrstelle";};
			_Btn5 buttonSetAction  "[life_vInact_curTarget] spawn life_fnc_impoundActionVer;";
			_Btn7 ctrlEnable true;
			if(liga_tooltip) then {	_Btn7 ctrlSetTooltip "Beschlagnahmen";};
			_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";			
			_Btn9 ctrlEnable true;
			_Btn9 buttonSetAction "[life_vInact_curTarget] spawn liga_fnc_trunk;";
			if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "Kofferraum öffnen";};		
		
		};
		
	}else{				
		
			_Btn5 ctrlEnable true;
			if(liga_tooltip) then {	_Btn5 ctrlSetTooltip "Verwahrstelle";};
			_Btn5 buttonSetAction  "[life_vInact_curTarget] spawn life_fnc_impoundActionVer;";
			_Btn7 ctrlEnable true;
			if(liga_tooltip) then {	_Btn7 ctrlSetTooltip "Beschlagnahmen";};
			_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";			
			_Btn9 ctrlEnable true;
			_Btn9 buttonSetAction "[life_vInact_curTarget] spawn liga_fnc_trunk;";
			if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "Kofferraum öffnen";};			
		};
	};

if(liga_lrk_on ) exitWith {
	if(liga_tooltip) then {	_Btn4 ctrlSetTooltip "Zeigt Fahrzeuginformationen";};	
	_Btn4 buttonSetAction "closeDialog 0;[] spawn life_fnc_tuvcheck;";
	_Btn9 buttonSetAction "[life_vInact_curTarget] spawn liga_fnc_trunk;";
	if(liga_tooltip) then {	_Btn9 ctrlSetTooltip "Kofferraum öffnen";};	
	_Btn5 ctrlEnable false;	
	_Btn7 ctrlEnable false;	
};
