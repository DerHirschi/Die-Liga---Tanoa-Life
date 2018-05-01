#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga	
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


if(isNull _curTarget || EQUAL(_mode,-1)) exitWith {closeDialog 0;}; //Bad side check?
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

//Turm aufgebaut
if (EQUAL(_mode,0)) exitWith {
	_Btn1 ctrlSetText 		"Gas abfackeln";
	_Btn1 buttonSetAction 	"closeDialog 0;[life_pInact_curTarget,player,1,true] remoteExec ['LIGA_fnc_TurmProcAkt',HC_id];";
	_Btn2 ctrlSetText 		"Gas aus";
	_Btn2 buttonSetAction 	"closeDialog 0;[life_pInact_curTarget,player,1,false] remoteExec ['LIGA_fnc_TurmProcAkt',HC_id];";
	
	
	_Btn6 ctrlSetText 		"Turm abbauen";
	_Btn6 buttonSetAction 	"
								[]spawn{
									closeDialog 0;							
									waitUntil{!dialog};

									_action = [									
										'Willst du den Bohrturm wirklich abbauen ?? ',
										'Bohrturm abbauen',
										'JA',
										'NEIN'
									] call BIS_fnc_guiMessage;

									if(_action) then {
										[life_pInact_curTarget,player] remoteExec ['LIGA_fnc_turmDOWN',HC_id];
										playSound3D ['A3\Sounds_F\sfx\alarm_independent.wss', life_pInact_curTarget];									
									};

								};
							
							";
	
	_Btn8 ctrlSetText 		"Bohrcomputer";
	_Btn8 buttonSetAction 	"[]spawn LIGACL_fnc_Bohrmenu;";
	
	
	//_Btn8 buttonSetAction 	"
	//							closeDialog 0;
	//							[life_pInact_curTarget,player,0,true] remoteExec ['LIGA_fnc_TurmProcAkt',HC_id];
	//						";
	
	//_Btn9 ctrlSetText 		"abbauen ende";
	//_Btn9 buttonSetAction 	"closeDialog 0;[life_pInact_curTarget,player,0,false] remoteExec ['LIGA_fnc_TurmProcAkt',HC_id];"; 

	_Btn3 ctrlShow false;
	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	//_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	//_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
};	

if (EQUAL(_mode,1)) exitWith {
	_Btn1 ctrlSetText "Turm aufbbauen";
	_Btn1 buttonSetAction "
			closeDialog 0;
			if(life_pInact_curTarget distance (getMarkerPos 'oil_1') < 120) exitWith {	 			
				if((count nearestObjects[getPos life_pInact_curTarget,['Land_Research_house_V1_F'],120]) > 2) then {
						hint 'Es sind zu viele Tuerme auf diesem Oelfeld ...';
					}else{
						[life_pInact_curTarget,true,player] remoteExec ['LIGA_fnc_turmUP',HC_id];
						playSound3D ['A3\Sounds_F\sfx\alarm_independent.wss', life_pInact_curTarget]; 
						hint 'Der Turm wird jetzt aufgebaut. Bitte entferne dich und deine Fahrzeuge aus dem Baubereich.';
				};
			};
			if(life_pInact_curTarget distance (getMarkerPos 'oil_2') < 140) then {				
				if((count nearestObjects[getPos life_pInact_curTarget,['Land_Research_house_V1_F'],140]) > 2) then {
						hint 'Es sind zu viele Tuerme auf diesem Oelfeld ...';
					}else{
						[life_pInact_curTarget,true,player] remoteExec ['LIGA_fnc_turmUP',HC_id];
						playSound3D ['A3\Sounds_F\sfx\alarm_independent.wss', life_pInact_curTarget]; 
						hint 'Der Turm wird jetzt aufgebaut. Bitte entferne dich und deine Fahrzeuge aus dem Baubereich.';
				};
			}else{ hint 'Du bist nicht auf dem Oelfeld oder es stehen zu viele Tuerme auf diesem Oelfeld';};			
		";

	_Btn2 ctrlShow false;
	_Btn3 ctrlShow false;
	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;

};	