#include <LigaHandyMac.h>
#define POS1 [safezoneW * 0.305999 ,safezoneY * -2.2 , 0, 0]
#define TITCOL [0.5,0.4,0.9,0.7]
#define TITCOLOR [0.5,0.6,0.2,0.4]
#define MSG "<img image='icons\items\ben.paa'/><t size='1.45' color='#FFBF00'> Benzin: %1 $</t><br/><br/><img image='icons\items\di.paa'/><t size='1.45' color='#FFBF00'> Diesel: %2 $</t><br/><br/><img image='icons\items\oil_unprocessed.paa'/><t size='1.45' color='#FFBF00'> Kerosin: %3 $</t>"

#define ANINULL _appdisp ctrlSetPosition POS1;SETANIM(_appdisp,0)
#define SETTEXT _appdisp ctrlSetStructuredText parseText format[MSG,[fuel_super] call life_fnc_numberText,[fuel_diesel] call life_fnc_numberText,[fuel_Kerosin] call life_fnc_numberText]
#define TITTEXT _ligaTitel	ctrlSetText  "             Benzinpreise"
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
║ Author: Hirschi - Die Liga
╚══════════════════════════════════════════════════╝
*/
DISABLESER;
_display 	= FDSIP(88888);
_appdisp	= DIPCTRL(_display,88923) ;
_ligaTitel	= DIPCTRL(_display,88892);
_mode		= SEL(_this,0);	

if(EQ(_mode,1)) exitWith {	
	//[[61,62]] call life_fnc_getPVC;
	EQexit((ctrlPosition _appdisp),POSBANK1);	
	APP(6);
	ANINULL;		
	_appdisp	ctrlSetPosition POSBANK1;
	SETTEXT;
	TITTEXT;
	[1,_ligaTitel		,TITCOLOR]spawn liga_fnc_Anim; // Einblenden	
	SETANIM(_appdisp,0.8);	
	[3,_appdisp	,TITCOL ]spawn liga_fnc_Anim;	
};	

if(EQ(_mode,0)) exitWith {		

	_appdisp	ctrlSetPosition POS1;
	SETANIM(_appdisp,0.6);
	uiSleep 0.2;
	[2,_appdisp			,TITCOL  ]spawn liga_fnc_Anim;
	[0,_ligaTitel		,TITCOLOR]call  liga_fnc_Anim; // Einblenden	
	_ligaTitel	ctrlSetText  "";
	NOAPP;
	
};