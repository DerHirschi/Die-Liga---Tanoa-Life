#include "..\..\Liga_script_macros.hpp"
//LOG_to_HC(1,LOGVAR('CLAN Lizenz',_mode,''));
if(isNil life_adminlevel)exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 5 && !SKY_HC_aktiv_1) exitWith {closeDialog 0;}; 
private ["_mode"];
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401


createDialog "admin_u1_menu";
disableSerialization;

_display = findDisplay 37400;
_Titel = _display displayCtrl Title;

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

		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;		
		_mode =_this select 0;
		
switch (_mode) do {
	
	case 0: { // Clan Lizensen	
	
		if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};
		_Titel ctrlSetText "Die Liga - Clan Lizenzen";
		
		_Btn1 ctrlShow true;
		_Btn1 ctrlSetText "Loeschen";
		_Btn1 ctrlSetBackgroundColor [0.7, 0, 0, 1];
		_Btn1 buttonSetAction format ["closeDialog 0;if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};[0,'CLAN Lizenz','Loeschen','']call life_fnc_toSt; [[0],'life_fnc_SuppClLiz',%1,false] call life_fnc_MP; hint format ['%1 hat seine Lizenz entzogen bekommen.. Das war gossartig von Dir.',name ad_targ_uni];",ad_targ_id];

		
		_Btn3 ctrlShow true;
		_Btn3 ctrlSetText "A.o.D.";
		_Btn3 ctrlSetBackgroundColor [0.1, 0.5, 0.7, 1];
		_Btn3 buttonSetAction format ["closeDialog 0;if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};[0,'CLAN Lizenz','AoD','']call life_fnc_toSt; [[7],'life_fnc_SuppClLiz',%1,false] call life_fnc_MP; hint format ['%1 hat seine Lizenz erhalten.. Das hast du sehr gut gemacht.',name ad_targ_uni];",ad_targ_id];

		_Btn8 ctrlShow true;
		_Btn8 ctrlSetText "Base 1";
		_Btn8 ctrlSetBackgroundColor [0.5, 0.7, 0.6, 1];
		_Btn8 buttonSetAction format ["closeDialog 0;if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};[0,'CLAN Lizenz','Base 1','']call life_fnc_toSt; [[8],'life_fnc_SuppClLiz',%1,false] call life_fnc_MP; hint format ['%1 hat seine Lizenz erhalten.. Das hast du sehr gut gemacht.',name ad_targ_uni];",ad_targ_id];

		_Btn4 ctrlShow true;
		_Btn4 ctrlSetText "SKULL";
		_Btn4 ctrlSetBackgroundColor [0.9, 0, 0.5, 1];
		_Btn4 buttonSetAction format ["closeDialog 0;if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};[0,'CLAN Lizenz','Skull','']call life_fnc_toSt; [[9],'life_fnc_SuppClLiz',%1,false] call life_fnc_MP; hint format ['%1 hat seine Lizenz erhalten.. Das hast du sehr gut gemacht.',name ad_targ_uni];",ad_targ_id];

		_Btn9 ctrlShow true;
		_Btn9 ctrlSetText "Anonymus";
		_Btn9 ctrlSetBackgroundColor [0.9, 0.7, 0.1, 1];
		_Btn9 buttonSetAction format ["closeDialog 0;if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};[0,'CLAN Lizenz','Anonymus','']call life_fnc_toSt; [[3],'life_fnc_SuppClLiz',%1,false] call life_fnc_MP; hint format ['%1 hat seine Lizenz erhalten.. Das hast du sehr gut gemacht.',name ad_targ_uni];",ad_targ_id];
		
		
		while {dialog} do { _Titel ctrlSetTextColor [1, 0, 0, 1]; sleep 1.5; _Titel ctrlSetTextColor [0, 1, 0, 1];sleep 1.5; _Titel ctrlSetTextColor [0, 0, 1, 1];sleep 1.5;};

	};	
	
		case 1: { // Event	
	
		if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0;};
		_Titel ctrlSetText "Die Liga - Event Menue";
		
		_Btn1 ctrlShow true;
		_Btn1 ctrlSetText "Liga News";
		_Btn1 ctrlSetBackgroundColor [0.7, 0, 0, 1];

		
		_Btn3 ctrlShow true;
		_Btn3 ctrlSetText "Airdrop";
		_Btn3 ctrlSetBackgroundColor [0.1, 0.5, 0.7, 1];

		_Btn8 ctrlShow true;
		_Btn8 ctrlSetText "Bombe";
		_Btn8 ctrlSetBackgroundColor [0.5, 0.7, 0.6, 1];

		_Btn4 ctrlShow true;
		_Btn4 ctrlSetText "Commarker";
		_Btn4 ctrlSetBackgroundColor [0, 0.8, 0, 1];

		_Btn9 ctrlShow true;
		_Btn9 ctrlSetText "Commarker";
		_Btn9 ctrlSetBackgroundColor [0.8, 0, 0, 1];
		
		
		while {dialog} do { _Titel ctrlSetTextColor [1, 0, 0, 1]; sleep 1.5; _Titel ctrlSetTextColor [0, 1, 0, 1];sleep 1.5; _Titel ctrlSetTextColor [0, 0, 1, 1];sleep 1.5;};

	};	
	
			case 2: { // Wetter	
	
		if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0;};
		_Titel ctrlSetText "Die Liga - Wetter Menue";
		
		_Btn1 ctrlShow true;
		_Btn1 ctrlSetText "Windstille";
		_Btn1 ctrlSetBackgroundColor [0, 0.7, 0, 1];

		
		_Btn3 ctrlShow true;
		_Btn3 ctrlSetText "Wind 1";
		_Btn3 ctrlSetBackgroundColor [0.3, 0.7, 0, 1];

		_Btn8 ctrlShow true;
		_Btn8 ctrlSetText "Wind 2";
		_Btn8 ctrlSetBackgroundColor [0.5, 0.5, 0, 1];

		_Btn4 ctrlShow true;
		_Btn4 ctrlSetText "Wind 3";
		_Btn4 ctrlSetBackgroundColor [0.7, 0.4, 0, 1];

		_Btn9 ctrlShow true;
		_Btn9 ctrlSetText "Wind 4";
		_Btn9 ctrlSetBackgroundColor [0.8, 0, 0, 1];
	
		_Btn10 ctrlShow true;
		_Btn10 ctrlSetText "Schnee";
		_Btn10 ctrlSetBackgroundColor [0.6, 0.6, 0.6, 1];
	
		_Btn5 ctrlShow true;
		_Btn5 ctrlSetText "Nebel weg";
		_Btn5 ctrlSetBackgroundColor [0.6, 0.3, 0.3, 1];

		
		while {dialog} do { _Titel ctrlSetTextColor [1, 0, 0, 1]; sleep 1.5; _Titel ctrlSetTextColor [0, 1, 0, 1];sleep 1.5; _Titel ctrlSetTextColor [0, 0, 1, 1];sleep 1.5;};

	};		
	
	
		case 3: { // LVU	
	
		if(__GETC__(life_adminlevel) < 5) exitWith {closeDialog 0;};
		_Titel ctrlSetText "Die Liga - LvU";
		
		_Btn1 ctrlShow true;
		_Btn1 ctrlSetText "L U";
		_Btn1 ctrlSetBackgroundColor [0.7, 0, 0, 1];

		/*
		_Btn3 ctrlShow true;
		_Btn3 ctrlSetText "Airdrop";
		_Btn3 ctrlSetBackgroundColor [0.1, 0.5, 0.7, 1];

		_Btn8 ctrlShow true;
		_Btn8 ctrlSetText "Bombe";
		_Btn8 ctrlSetBackgroundColor [0.5, 0.7, 0.6, 1];

		_Btn4 ctrlShow true;
		_Btn4 ctrlSetText "Commarker";
		_Btn4 ctrlSetBackgroundColor [0, 0.8, 0, 1];

		_Btn9 ctrlShow true;
		_Btn9 ctrlSetText "Commarker";
		_Btn9 ctrlSetBackgroundColor [0.8, 0, 0, 1];
		*/
		
		while {dialog} do { _Titel ctrlSetTextColor [1, 0, 0, 1]; sleep 1.5; _Titel ctrlSetTextColor [0, 1, 0, 1];sleep 1.5; _Titel ctrlSetTextColor [0, 0, 1, 1];sleep 1.5;};

	};	
	
};				
		
		
		
		
		
	//hint format ["%1",_this];	
	
	//while {true} do { _Btn3 ctrlSetBackgroundColor [1, 0, 0, 1]; sleep 1; _Btn3 ctrlSetBackgroundColor [0, 1, 0, 1];sleep 1;};
	
	
