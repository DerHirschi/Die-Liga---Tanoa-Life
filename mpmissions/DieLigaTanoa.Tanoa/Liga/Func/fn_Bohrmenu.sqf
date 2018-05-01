#include "..\..\Liga_script_macros.hpp"
/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠══════════════════════════════════════════════════╝
	║ File: fn_Bohrmenu.h
	║ Author: Hirschi - Die Liga
	╚══════════════════════════════════════════════════╝
*/
closeDialog 0;

#define Btn1 37450
#define Btn2 37451
#define Btn3 37453
#define Btn4 37455
#define Btn5 37456
#define Btn6 37454
#define Btn7 37452
#define Btn8 37457
#define Btn9 37458
#define Title 37401

private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5"];

if(life_pInact_curTarget GVAR ["bohr_action",false])exitWith {hint "Es bohrt schon jemand mit diesem Turm ..";};
waitUntil {!dialog};
createDialog "pInteraction_Menu";
disableSerialization;

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

if(isNil "liga_bohrsteu") then {liga_bohrsteu = [false,1];};

life_pInact_curTarget spawn
{
	waitUntil {isNull (findDisplay 37400)};
	_this SVAR["bohr_action",false,true];
};
life_pInact_curTarget SVAR ["bohr_action",true,true];

_Btn1 ctrlSetText 		"Start";
_Btn1 buttonSetAction 	"if!(liga_bohrsteu select 0) then { liga_bohrsteu set [0,true]; [life_pInact_curTarget]spawn ligacl_fnc_turmpreprocess;}; ";

_Btn2 ctrlSetText 		"Stop";
_Btn2 buttonSetAction 	"liga_bohrsteu set [0,false];";

_Btn3 ctrlSetText 		"Foerdern";
_Btn3 buttonSetAction 	"closeDialog 0;liga_bohrsteu set [0,false]; if(isNil 'liga_bohrrate') then { liga_bohrrate = [0,0];};	[life_pInact_curTarget,player,0,true,liga_bohrrate] remoteExec ['LIGA_fnc_TurmProcAkt',HC_id];";
_Btn7 ctrlSetText 		"Foerd stop";
_Btn7 buttonSetAction 	"closeDialog 0;liga_bohrsteu set [0,false]; if(isNil 'liga_bohrrate') then { liga_bohrrate = [0,0];};	[life_pInact_curTarget,player,0,false,liga_bohrrate] remoteExec ['LIGA_fnc_TurmProcAkt',HC_id];";


_Btn4 ctrlSetText 		"Schneller";
_Btn4 buttonSetAction 	"liga_bohrsteu set [1,((liga_bohrsteu select 1) - 0.01)];";

_Btn5 ctrlSetText 		"Langsamer";
_Btn5 buttonSetAction 	"liga_bohrsteu set [1,((liga_bohrsteu select 1) + 0.01)];";

	_Btn6 ctrlShow false;
	
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;