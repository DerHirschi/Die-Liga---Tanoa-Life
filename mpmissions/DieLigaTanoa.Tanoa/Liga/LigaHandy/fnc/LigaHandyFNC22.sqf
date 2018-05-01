#include <LigaHandyMac.h>
#define SETPICCOL(DISP,INDEX) DISP lbSetPictureColor [INDEX,[1,1,1,_i] ]
#define SETLBNCOLOR(DISP,INDEX) DISP lbSetColor [INDEX,[_i * 1.1,_i* 1.1,_i* 1.1,_i* 0.7]]
#define ANINULL _menuFrame ctrlSetPosition POS0F;_menu ctrlSetPosition POS0;SETANIM(_menuFrame,0);SETANIM(_menu,0)
#define SETPOS(POSF,POS) _menuFrame ctrlSetPosition POSF;_menu ctrlSetPosition POS;SETANIM(_menuFrame,0.3);SETANIM(_menu,0.3)

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
private ["_data1"];
_display 	= FDSIP(88888);
_menu		= DIPCTRL(_display,88907);
_menuFrame	= DIPCTRL(_display,88908);

_mode		= SEL(_this,0);	


if(EQ(_mode,1)) exitWith {
	if(handy_menuOpen)exitWith{};
	
	CTRLAUS(_menuFrame);
	_menu  lbSetPictureColor COLARNULL;				
	SETANIM(_menu,0);	
	ANINULL;	
	
	if(EQ(handy_actApp,0)) then {//TelBuch
		if(EQ(lbCurSel 88901,-1))exitWith{};
		lbClear _menu;	
		
				
		_menu lbAdd format		["Nachricht schreiben"];
		_menu lbSetPicture  	[0,PIC("FAVICON")];
		_menu lbSetData  		[0,(format ["%1",0])];

		if([1]call liga_fnc_setFav) then {
			_menu lbAdd format		["aus Favoriten entfernen"];
		}else{	
			_menu lbAdd format		["zu Favoriten hinzufügen"]; 
		};		
		_menu lbSetPicture  	[1,PIC("FAVICON")];
		_menu lbSetData  		[1,(format ["%1",1])];
		
		SETPOS(POS1F,POS1);
		CTRLAN(_menuFrame);
	};
	if(EQ(handy_actApp,1)) then {//WhatsApp
		if(EQ(lbCurSel 88918,-1) && EQ(lbCurSel 88919,-1) )exitWith{};
		lbClear _menu;	
		
		_menu lbAdd format		["Nachricht schreiben"			 							];
		_menu lbSetPicture  	[0,PIC("FAVICON")];
		_menu lbSetData  		[0,(format ["%1",0])];

		_menu lbAdd format		["alle Nachrichten löschen"			 							];
		_menu lbSetPicture  	[1,PIC("FAVICON")];
		_menu lbSetData  		[1,(format ["%1",1])];
		
		SETPOS(POS1F,POS1);
		CTRLAN(_menuFrame);
	};
	
	
	if(EQ(handy_actApp,3)) then {//Navi
		//if(EQ(lbCurSel 88901,-1))exitWith{};
		lbClear _menu;
		_data1 = lbData [88900,(lbCurSel 88900)];			
		//_data  = lbData [88907,(lbCurSel 88907)];
		
		{		
			_menu lbAdd format		[SEL(_x,0)];
			_menu lbSetPicture  	[_forEachIndex,SEL(_x,1)];
			_menu lbSetData  		[_forEachIndex,(format ["%1",SEL(_x,2)])];
		}forEach NAVIPOI(_data1) ;
		[0]call liga_fnc_HomeScr;		
		SETPOS(POS3F,POS3);
	};
	
	CTRLAN(_menu);
	
	for [{_i=0},{_i<=0.9},{_i=_i+0.038}] do {
				
		SETPICCOL(_menu,0);			
		SETPICCOL(_menu,1);	
		SETLBNCOLOR(_menu,0);
		SETLBNCOLOR(_menu,1);
		SETANIM(_menu,0);		
				
		uiSleep 0.001;
	};
	handy_menuOpen = true;	
	ctrlSetFocus _menu;
};

if(EQ(_mode,0)) exitWith {
		SETPOS(POS0F,POS0);
		
		for [{_i=0.9},{_i>=0},{_i=_i-0.038}] do {
			
			SETPICCOL(_menu,0);			
			SETPICCOL(_menu,1);		
			SETLBNCOLOR(_menu,0);
			SETLBNCOLOR(_menu,1);
			//_menu 	ctrlSetBackgroundColor 	[(_i * (0.1)),(_i * (0.1)),(_i * (0.1)),(_i * (0.9))];	
			//_menu 	ctrlCommit 0;
			SETANIM(_menu,0);			
			
			uiSleep 0.01;
		};
		CTRLAUS(_menu);
		CTRLAUS(_menuFrame);
		handy_menuOpen = false;	
};
