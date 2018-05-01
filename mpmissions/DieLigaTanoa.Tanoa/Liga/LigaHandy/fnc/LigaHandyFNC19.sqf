#include <LigaHandyMac.h>
#define CONSTAMODE _mode = call compile format["%1",_mode]
#define MAPOPT {if(EQ(_mode,_x)) exitWith {[1]spawn liga_fnc_Menu_u	 ;};}forEach [100,101,102,103,104,105,106,107,108,109,110]
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
//_mode = [_this,0,[-1,""],[[]]] call BIS_fnc_param;
_mode = [_this,0,"",[""]] call BIS_fnc_param;
//_mode = SEL(_mode,1);
if(EQ(_mode,""))exitWith{};
if (liga_handyAction)exitWith{};
liga_handyAction = true;
CONSTAMODE;
//if(EQ((lbCurSel 88900),-1))exitWith{};
if(EQ(_mode,handy_actApp))exitWith{};
_display 			= FDSIP(88888);
_mainScroll		 	= DIPCTRL(_display,88901);
_ligaTitel		 	= DIPCTRL(_display,88892);
_mapklein		 	= DIPCTRL(_display,88885);

//CTRLAUS(_mainScroll);
//CTRLAUS(_mapklein);
if (handy_menuOpen)then{[0]spawn liga_fnc_Menu_u;};

//hint format ["%1",_mode];
if(!(EQ(handy_actApp,-1)) && _mode < 100) then {
	//[0,1]spawn liga_fnc_HG;
	//handy_ani = false;
	if(EQ(handy_actApp,-4)) exitWith {[0]spawn liga_fnc_hgsettings	;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	
	if(EQ(handy_actApp,-3)) exitWith {[0]spawn liga_fnc_newMsg 		;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	
	if(EQ(handy_actApp,-2)) exitWith {[0]spawn liga_fnc_newMsg		;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	

	if(EQ(handy_actApp,0)) exitWith {[0]spawn liga_fnc_telBuch		;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	
	if(EQ(handy_actApp,1)) exitWith {[0]spawn liga_fnc_MessApp		;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};
	if(EQ(handy_actApp,2)) exitWith {[0]spawn liga_fnc_newMsg 		;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	
	if(EQ(handy_actApp,3)) exitWith {[0]spawn liga_fnc_map			;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};
	if(EQ(handy_actApp,6)) exitWith {[0]spawn Liga_fnc_benzPreise	;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	//uiSleep 0.8;
	if(EQ(handy_actApp,7)) exitWith {[0]spawn liga_fnc_HanSettings	;WAITNOAPP; [1,1]spawn liga_fnc_HG;liga_handyAction = false;};	//uiSleep 0.8;

};

if(EQ(_mode,0)) exitWith {[0]spawn liga_fnc_HomeScr;[1]spawn liga_fnc_telBuch	 ;WAITANYAPP;liga_handyAction = false;};	
if(EQ(_mode,1)) exitWith {[0]spawn liga_fnc_HomeScr;[1]spawn liga_fnc_MessApp	 ;WAITANYAPP;liga_handyAction = false;};	
if(EQ(_mode,2)) exitWith {[0]spawn liga_fnc_HomeScr;[4]spawn liga_fnc_newMsg	 ;WAITANYAPP;liga_handyAction = false;};	
if(EQ(_mode,3)) exitWith {[0]spawn liga_fnc_HomeScr;[1]spawn liga_fnc_map     	 ;WAITANYAPP;liga_handyAction = false;};
if(EQ(_mode,6)) exitWith {[0]call  liga_fnc_HomeScr;[1]spawn Liga_fnc_benzPreise ;WAITANYAPP;liga_handyAction = false;};
if(EQ(_mode,7)) exitWith {[0]call  liga_fnc_HomeScr;[1]spawn liga_fnc_HanSettings;WAITANYAPP;liga_handyAction = false;};
MAPOPT;
liga_handyAction = false;



