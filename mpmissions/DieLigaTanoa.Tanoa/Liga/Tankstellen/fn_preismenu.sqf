#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	Description:
	Building interaction menu
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
waitUntil{!dialog};
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target


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

_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;


_Btn1 ctrlSetText "Super";
_Btn1 buttonSetAction " createDialog 'benz_preis';    buttonSetAction [2402, '[life_pInact_curTarget,1] call LIGACL_fnc_preismenuset']; ";
_Btn1 ctrlShow true;

_Btn2 ctrlSetText "Diesel";
_Btn2 buttonSetAction " createDialog 'benz_preis';    buttonSetAction [2402, '[life_pInact_curTarget,2] call LIGACL_fnc_preismenuset']; ";
_Btn2 ctrlShow true;

_Btn3 ctrlSetText "Kerosin";
_Btn3 buttonSetAction " createDialog 'benz_preis';    buttonSetAction [2402, '[life_pInact_curTarget,3] call LIGACL_fnc_preismenuset']; ";
_Btn3 ctrlShow true;
