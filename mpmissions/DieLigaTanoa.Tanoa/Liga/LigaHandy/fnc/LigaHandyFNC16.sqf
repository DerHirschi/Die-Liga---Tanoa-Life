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
DISABLESER;
_mode = [_this,0,[-1,""],[[]]] call BIS_fnc_param;
_mode = SEL(_mode,1);


if(EQ(handy_actApp,0)) exitWith {	//TelBuch	
	[0]spawn liga_fnc_Menu_u;
	if(EQ(_mode,0)) exitWith {	// Nachricht schreiben
		
		[0]spawn liga_fnc_telBuch;		
		[1]spawn liga_fnc_newMsg;
	};
	if(EQ(_mode,1)) exitWith { // Fav +/-
		[]spawn liga_fnc_setFav;
	};
};

if(EQ(handy_actApp,1)) exitWith {	//WhatsApp
	[0]spawn liga_fnc_Menu_u;
	if(EQ(_mode,0)) exitWith {	// Nachricht schreiben
		
		[0]spawn liga_fnc_MessApp;		
		[3]spawn liga_fnc_newMsg;
	};
	if(EQ(_mode,1)) exitWith {
		lbClear 88919;
		lbClear 88918;
		[[player],"TON_fnc_cleanupMessages",false] call life_fnc_MP;
	};
};

if(EQ(handy_actApp,3)) exitWith{	//Navi
	[2]spawn liga_fnc_map;
	//if(EQ(_mode,1)) then {	};
	
};
