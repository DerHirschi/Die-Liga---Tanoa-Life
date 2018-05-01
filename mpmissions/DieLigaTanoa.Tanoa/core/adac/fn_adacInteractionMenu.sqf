/*
	File: fn_ADACInteractionMenu.sqf
	Edited: Hirschi - Die Liga 
	
	Description:
	Well, currently it gives a ticket to a player. Wowzer.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {createDialog "pInteraction_Menu";};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]	] call BIS_fnc_param;
_mode	   = [_this,1,-1,[0]			] call BIS_fnc_param;
if(isNull _curTarget ) exitWith {closeDialog 0;}; //Bad target
if(_mode isEqualTo -1) exitWith {closeDialog 0;}; //Bad target


if(!isPlayer _curTarget && side _curTarget isEqualTo east && playerSide isEqualTo east) exitWith {closeDialog 0;}; //Bad side check?
//if!(_curTarget isKindOf "Air" || _curTarget isKindOf "Car" || _curTarget isKindOf "Ship") exitWith {closeDialog 0;}; //Bad side check?
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
life_pInact_curTarget = _curTarget;

if (_mode isEqualTo 0) exitWith {
	_Btn1 ctrlSetText "Rechnung";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call ligafn_alac_ticket;";
	_Btn2 ctrlShow false;
	_Btn3 ctrlShow false;
	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
};	

if (_mode isEqualTo 1) exitWith {
	_Btn1 ctrlSetText "Rechnung";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call ligafn_alac_ticket;";

	_Btn2 ctrlShow false;
	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
};	