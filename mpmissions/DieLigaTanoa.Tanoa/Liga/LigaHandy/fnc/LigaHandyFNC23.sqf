#include <LigaHandyMac.h>
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

if (handy_menuOpen)exitWith{[0]spawn liga_fnc_Menu_u;};
if (liga_handyAction)exitWith{};
liga_handyAction = true;
if!(EQ(handy_actApp,-1)) then {
	
	//handy_ani = false;
	if(EQ(handy_actApp,-4)) exitWith {[0]spawn liga_fnc_hgsettings; WAITNOAPP; [1]spawn liga_fnc_HanSettings;WAITANYAPP;liga_handyAction = false;						};	
	if(EQ(handy_actApp,-3)) exitWith {[0]spawn liga_fnc_newMsg ;	WAITNOAPP; [1]spawn liga_fnc_MessApp;WAITANYAPP;liga_handyAction = false;							};	
	if(EQ(handy_actApp,-2)) exitWith {[0]spawn liga_fnc_newMsg ;	WAITNOAPP; [1]spawn liga_fnc_telBuch;WAITANYAPP;liga_handyAction = false;							};	
	if(EQ(handy_actApp,0))  exitWith {[0]spawn liga_fnc_telBuch;	WAITNOAPP; [1]spawn liga_fnc_HomeScr;[0,1]spawn liga_fnc_HG;liga_handyAction = false;	};	
	if(EQ(handy_actApp,1))  exitWith {[0]spawn liga_fnc_MessApp;	WAITNOAPP; [1]spawn liga_fnc_HomeScr;[0,1]spawn liga_fnc_HG;liga_handyAction = false;	};	
	if(EQ(handy_actApp,2))  exitWith {[0]spawn liga_fnc_newMsg ;	WAITNOAPP; [1]spawn liga_fnc_HomeScr;[0,1]spawn liga_fnc_HG;liga_handyAction = false;	};	
	if(EQ(handy_actApp,3))  exitWith {[0]spawn liga_fnc_map	   ;	WAITNOAPP; [1]spawn liga_fnc_HomeScr;[0,1]spawn liga_fnc_HG;liga_handyAction = false;	};
	if(EQ(handy_actApp,6))  exitWith {[0]spawn Liga_fnc_benzPreise;	WAITNOAPP; [1]spawn liga_fnc_HomeScr;[0,1]spawn liga_fnc_HG;liga_handyAction = false;  	};	
	if(EQ(handy_actApp,7))  exitWith {[0]spawn liga_fnc_HanSettings;WAITNOAPP; [1]spawn liga_fnc_HomeScr;[0,1]spawn liga_fnc_HG;liga_handyAction = false;  	};	
	

}else{[1]spawn liga_fnc_handy;};
liga_handyAction = false;




