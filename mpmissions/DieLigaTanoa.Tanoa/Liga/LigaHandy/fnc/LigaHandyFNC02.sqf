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
_display 			= FDSIP(88888);
_mapklein		 	= DIPCTRL(_display,88885);

PAR(_mode,0,0,0);

if(EQ(_mode,0)) exitWith {
	[0]spawn liga_fnc_oben_list;
	_mapklein ctrlSetPosition MAPPOS0;
	SETANIM(_mapklein,0.5);
	if(EQ(handy_actApp,3)) then {[0]call liga_fnc_app_list;};
	NOAPP;	
	
	WAITANIM(_mapklein);
	CTRLAUS(_mapklein);
	[1]spawn liga_fnc_app_list;
};


if(EQ(_mode,1)) exitWith {	
	APP(3);
	
	
	_mapklein ctrlSetPosition MAPPOS0;
	SETANIM(_mapklein,0);
	CTRLAN(_mapklein);
	_mapklein ctrlSetPosition MAPPOS1;
	SETANIM(_mapklein,0.5);
	[0]call liga_fnc_app_list;
	WAITANIM(_mapklein);
	[1]spawn liga_fnc_app_list;
	
	_mapklein ctrlMapAnimAdd[1,0.1,position player];
	ctrlMapAnimCommit _mapklein;
};

if(EQ(_mode,2)) exitWith {
	
	private["_data"];
	if(EQ(lbCurSel 88907,-1))exitWith{};	
	_data = lbData [88907,(lbCurSel 88907)];	
	//RPT("DATA",_data);
	STR2CONST(_data);

	_mapklein ctrlMapAnimAdd[2,0.25,_data];
	ctrlMapAnimCommit _mapklein;
	[0]spawn liga_fnc_Menu_u;
};