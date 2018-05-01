#include <LigaHandyMac.h>
#define LOOPSLEEP1 uiSleep 0.001
#define PICCOL _ligaAppList lbSetPictureColor	[_forEachIndex,[1,1,1,_i]	 ]
#define NAVENT "Navi"
#define MAINENT "MainApps"
#define EMSENT "EMS"
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
private["_ent"];

_mode = SEL(_this,0);
	_ent = MAINENT;
	if(EQ(handy_actApp,-1))then{_ent = MAINENT;	};	
	if(EQ(handy_actApp,2)) then{_ent = EMSENT;	};	
	if(EQ(handy_actApp,3)) then{_ent = NAVENT;	};	
_display 		= FDSIP(88888);
_ligaAppList 	= DIPCTRL(_display,88900);

if(EQ(_mode,1))  exitWith {

	
	lbClear _ligaAppList;	
	
	{
		_ligaAppList lbAdd format		[" "			 							];
		_ligaAppList lbSetPicture  		[_forEachIndex,SEL(_x,0)					];
		_ligaAppList lbSetData  		[_forEachIndex,(format ["%1",SEL(_x,1)])	];			
	}forEach APPSARR(_ent); 
	
	CTRLAN(_ligaAppList);

	for [{_i=0},{_i<=0.9},{_i=_i+0.05}] do {
		{	PICCOL;	}forEach  APPSARR(_ent);
		LOOPSLEEP1;
	};
};
//Ausblenden
if(EQ(_mode,0)) exitWith {
	for [{_i=0.9},{_i>=0},{_i=_i-0.05}] do {
		{	PICCOL;	}forEach  APPSARR(_ent);
		LOOPSLEEP1;
	};	
	CTRLAUS(_ligaAppList);
	
};	
	