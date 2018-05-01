#include <LigaHandyMac.h>
#define PICCOL [0,[1,1,1,0]]
#define BATCOL [1,1,1,0.85]
#define SETPICCOL(DISP) DISP lbSetPictureColor [0,[1,1,1,_i] ]
#define VARARR [_scroben,_scroben1,_scroben2,_scroben3]
#define CLS { lbClear _x; }forEach VARARR
#define FADEIN { _x lbSetPictureColor PICCOL; CTRLAN(_x); }forEach VARARR
#define FADEOUT { SETPICCOL(_x); }forEach VARARR
#define NOSEL {_x lbSetCurSel -1; }forEach VARARR
#define AUS { CTRLAUS(_x); }forEach VARARR
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

_mode 		= SEL(_this,0);
_display 	= FDSIP(88888);
_scroben	= DIPCTRL(_display,88903);
_scroben1	= DIPCTRL(_display,88904);
_scroben2	= DIPCTRL(_display,88905);
_scroben3	= DIPCTRL(_display,88906);
_batt	 	= DIPCTRL(_display,88881);

if(EQ(_mode,1)) then{
	//handy_ani = true;

	[0,_batt,	BATCOL]spawn liga_fnc_Anim;
	//[1,_scroben,[1,1,1,0.85]]spawn liga_fnc_Anim;
	[3]spawn liga_fnc_handy;
	[5]call liga_fnc_handy;
	CLS;
	if(EQ(handy_actApp,0))then{
		_scroben lbAdd format		[" "			 							];
		_scroben lbSetPicture  		[0,PIC("ICON1")];
		_scroben lbSetData  		[0,(format ["%1",1])];
				
		_scroben1 lbAdd format		[" "			 							];
		_scroben1 lbSetPicture  	[0,PIC("ICON2")];
		_scroben1 lbSetData  		[0,(format ["%1",2])];

		_scroben2 lbAdd format		[" "			 							];
		_scroben2 lbSetPicture  	[0,PIC("ICON3")];
		_scroben2 lbSetData  		[0,(format ["%1",3])];

		_scroben3 lbAdd format		[" "			 							];
		_scroben3 lbSetPicture  	[0,PIC("ICON4")];
		_scroben3 lbSetData  		[0,(format ["%1",4])];
	};
/*
	if(EQ(handy_actApp,3))then{
		_scroben lbAdd format		[" "			 							];
		_scroben lbSetPicture  		[0,PIC("ICON1")];
		_scroben lbSetData  		[0,(format ["%1",1])];				

	};
*/
	FADEIN;	

	VARARR spawn{
		DISABLESER;
		for [{_i=0},{_i<=0.9},{_i=_i+0.038}] do {
			{SETPICCOL(_x);}forEach _this;					
			uiSleep 0.001;
		};
	};	
		
}else{
	//handy_ani = false;
	[1,_batt,	BATCOL]spawn liga_fnc_Anim;
	NOSEL;
		for [{_i=0.9},{_i>=0},{_i=_i-0.038}] do {
			FADEOUT;
			uiSleep 0.001;			
		};
	uiSleep 0.3;
	AUS;	
	[6]spawn liga_fnc_handy;	
};
