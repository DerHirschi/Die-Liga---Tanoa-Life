#include <LigaHandyMac.h>
#define NULLCOLOR [0,0,0,0]
#define SETTEXTCOL(DISP) DISP ctrlSetTextColor [_i,_i,_i,_i]
#define SETBGCOL(DISP) DISP ctrlSetBackgroundColor [(_i * (_farb select 0)),(_i * (_farb select 1)),(_i * (_farb select 2)),(_i * (_farb select 3))];	

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
private["_farb"];
//handy_ani = false;
_mode = SEL(_this,0);		// 0 = ausbelnden ; 1 = Einblenden
_disp = SEL(_this,1);
_farb = SEL(_this,2);



if(EQ(_mode,0)) exitWith {
	
	//liga_handy_color pushBack [_disp,_farb];
	CTRLISTAUSEXIT(_disp);
	//handy_ani = true;
	for [{_i=1},{_i>=0},{_i=_i-0.03}] do {			
		SETTEXTCOL(_disp);	
		SETBGCOL(_disp);	
		SETANIM(_disp,0);
		//if!(handy_ani)exitWith{_i = -1;};
		uiSleep 0.01;			
	};		
	CTRLAUS(_disp);
	//handy_ani = false;
	//_disp ctrlShow 	false;	
	true;
};

if(EQ(_mode,1)) exitWith {

	CTRLISTANEXIT(_disp);
	_disp ctrlSetTextColor 	  NULLCOLOR;	
	_disp ctrlSetBackgroundColor NULLCOLOR;
	SETANIM(_disp,0);	
	CTRLAN(_disp);

	for [{_i=0},{_i<=1},{_i=_i+0.03}] do {			
		SETTEXTCOL(_disp);	
		SETBGCOL(_disp);
		SETANIM(_disp,0);
		//if!(handy_ani)exitWith{_i = 2;};
		uiSleep 0.01;			
	};	
	//handy_ani = false;
	true;
};

if(EQ(_mode,2)) exitWith {	

	CTRLISTAUSEXIT(_disp);

	for [{_i=1},{_i>=0},{_i=_i-0.03}] do {			
		SETTEXTCOL(_disp);	
		//SETBGCOL(_disp);	
		SETANIM(_disp,0);

		uiSleep 0.01;			
	};		
	CTRLAUS(_disp);

	true;
};

if(EQ(_mode,3)) exitWith {

	CTRLISTANEXIT(_disp);
	_disp ctrlSetTextColor 	  NULLCOLOR;	
	//_disp ctrlSetBackgroundColor NULLCOLOR;
	SETANIM(_disp,0);	
	CTRLAN(_disp);

	for [{_i=0},{_i<=1},{_i=_i+0.03}] do {			
		SETTEXTCOL(_disp);	
		//SETBGCOL(_disp);
		SETANIM(_disp,0);

		uiSleep 0.01;			
	};	

	true;
};



