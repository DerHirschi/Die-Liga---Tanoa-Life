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
║	File: fn_BosMenu.sqf
║	Author: Hirschi Liga-Life	
║	Vorlage: Bryan "Tonic" Boardwine
║	
║	Beschreibung: 
╚══════════════════════════════════════════════════╝
*/	
#define ON ctrlSetTextColor [0,1,0,1]
#define OFF ctrlSetTextColor [1,0,0,1]

#define Btn1 49911
#define Btn2 49912
#define Btn3 49913
#define Btn4 49914
#define Btn5 49915
#define Btn6 49916
#define Btn7 49917
#define Btn8 49918
#define Btn9 49919


private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

closeDialog 0;
sleep 0.07;
if (side player == civilian && call life_adminlevel <= 2) exitWith {};


	disableSerialization;
	if ((liga_bos select 7)) then {
		if(!dialog) then { 
			createDialog "notw_disp"; 
		};
		_display = findDisplay 49920;
	}else{
		if(!dialog) then { 
			createDialog "bos_disp"; 
		};	
		_display = findDisplay 49910;
	};
	_Btn1 = _display displayCtrl Btn1;
	_Btn2 = _display displayCtrl Btn2;
	_Btn3 = _display displayCtrl Btn3;
	_Btn4 = _display displayCtrl Btn4;
	_Btn5 = _display displayCtrl Btn5;
	_Btn6 = _display displayCtrl Btn6;
	_Btn7 = _display displayCtrl Btn7;
	_Btn8 = _display displayCtrl Btn8;
	_Btn9 = _display displayCtrl Btn9;
	if(!(vehicle player isKindOf "Air")) then { _Btn7 ctrlShow false; } else {_Btn7 ctrlShow true; };

	if!(life_blacklisted isEqualTo 0)then{
		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		//_Btn5 ctrlShow false;
		//_Btn6 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		//_Btn7 ctrlShow false;
		};
	
	
		

	if((liga_bos select 0)) then{
		_Btn1 ON ;
		_Btn1 buttonSetAction "[[player,false,1],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [0,false]; []spawn life_fnc_bosmenu; ";		
	}else{
		_Btn1 OFF ;
		_Btn1 buttonSetAction "[[player,true,1],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [0,true] ;[]spawn life_fnc_bosmenu;";	
	};	

	if((liga_bos select 1)) then{
		_Btn2 ON ;
		_Btn2 buttonSetAction "[[player,false,2],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [1,false];[]spawn life_fnc_bosmenu;";		
	}else{
		_Btn2 OFF ;
		_Btn2 buttonSetAction "[[player,true,2],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [1,true];[]spawn life_fnc_bosmenu;";	
	};	

	if((liga_bos select 2)) then{
		_Btn3 ON ;
		_Btn3 buttonSetAction "[[player,false,3],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [2,false]; []spawn life_fnc_bosmenu;";		
	}else{
		_Btn3 OFF ;
		_Btn3 buttonSetAction "[[player,true,3],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [2,true];[]spawn life_fnc_bosmenu;";	
	};	

	if((liga_bos select 3)) then{
		_Btn4 ON ;
		_Btn4 buttonSetAction "[[player,false,4],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [3,false]; []spawn life_fnc_bosmenu;";		
	}else{
		_Btn4 OFF ;
		_Btn4 buttonSetAction "[[player,true,4],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [3,true];[]spawn life_fnc_bosmenu;";	
	};		
	
	if((liga_bos select 4)) then{
		_Btn5 ON ;
		_Btn5 buttonSetAction "[[player,false,5],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [4,false]; []spawn life_fnc_bosmenu;";		
	}else{
		_Btn5 OFF ;
		_Btn5 buttonSetAction "[[player,true,5],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [4,true];[]spawn life_fnc_bosmenu;";	
	};	
	
	if((liga_bos select 5)) then{
		_Btn6 ON ;
		_Btn6 buttonSetAction "[[player,false,6],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [5,false];[]spawn life_fnc_bosmenu;";		
	}else{
		_Btn6 OFF ;
		_Btn6 buttonSetAction "[[player,true,6],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [5,true];[]spawn life_fnc_bosmenu;";	
	};	
	
	if((liga_bos select 6)) then{
		_Btn7 ON ;
		_Btn7 buttonSetAction "[[player,false,7],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [6,false];[]spawn life_fnc_bosmenu;";		
	}else{
		_Btn7 OFF ;
		_Btn7 buttonSetAction "[[player,true,7],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [6,true];[]spawn life_fnc_bosmenu;";	
	};	
	
	if((liga_bos select 7)) then{
		_Btn8 ON ;
		_Btn8 buttonSetAction "[[player,false,8],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [7,false];[]spawn life_fnc_bosmenu;";		
	}else{
		_Btn8 OFF ;
		_Btn8 buttonSetAction "[[player,true,8],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [7,true];[]spawn life_fnc_bosmenu;";	
	};	
	
	if((liga_bos select 8)) then{
		_Btn9 ON ;
		_Btn9 buttonSetAction "[[player,false,9],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [8,false];[]spawn life_fnc_bosmenu;";		
	}else{
		_Btn9 OFF ;
		_Btn9 buttonSetAction "[[player,true,9],""TON_fnc_radio"",false,false] call life_fnc_MP; liga_bos set [8,true];[]spawn life_fnc_bosmenu;";	
	};	