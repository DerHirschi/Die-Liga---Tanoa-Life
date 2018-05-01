#include <LigaHandyMac.h>
#define POS1 [safezoneW * 0.305999 ,safezoneY * -2.2 , 0, 0]
#define DIAPARR [_bank,_cash,_wetter]
#define MSGBANK "<img image='icons\bank.paa'/><t size='1.45' color='#04B431'> %1 $</t>"
#define MSGCASH "<img image='icons\money.paa'/><t size='1.45' color='#04B431'> %1 $</t>"

#define ANINULL {_x ctrlSetPosition POS1;SETANIM(_x,0);	}forEach DIAPARR
#define RUNANI {SETANIM(_x,0.8);}forEach DIAPARR

#define TITCOL [0.2,0.9,0.6,0.7]
#define TITCOL1 [1,1,1,0.7]

#define SETPIC(VAR) _wetter ctrlSetText PIC(VAR)

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
_bank		= DIPCTRL(_display,88923) ;
_cash		= DIPCTRL(_display,88924) ;
_wetter		= DIPCTRL(_display,88925) ;

_mode		= SEL(_this,0);	

if(EQ(_mode,2)) exitWith {	
	if (handy_menuOpen)then{[0]spawn liga_fnc_Menu_u;};
	if (liga_handyAction)exitWith{liga_handyAction = false;};
	liga_handyAction = true;
	if!(EQ(handy_actApp,-1)) then {
		[0,1]spawn liga_fnc_HG;
		if(EQ(handy_actApp,-4)) exitWith {[0]spawn liga_fnc_hgsettings; };	
		if(EQ(handy_actApp,-3)) exitWith {[0]spawn liga_fnc_newMsg ; 	};	
		if(EQ(handy_actApp,-2)) exitWith {[0]spawn liga_fnc_newMsg ; 	};	
		if(EQ(handy_actApp,0))  exitWith {[0]spawn liga_fnc_telBuch; 	};	
		if(EQ(handy_actApp,1))  exitWith {[0]spawn liga_fnc_MessApp; 	};	
		if(EQ(handy_actApp,2))  exitWith {[0]spawn liga_fnc_newMsg ;	};	
		if(EQ(handy_actApp,3))  exitWith {[0]spawn liga_fnc_map	   ; 	};
		if(EQ(handy_actApp,6))  exitWith {[0]spawn Liga_fnc_benzPreise;	};	
		if(EQ(handy_actApp,7))  exitWith {[0]spawn liga_fnc_HanSettings;};	


	};
		WAITNOAPP;
		[1]spawn liga_fnc_HomeScr;
		[6]spawn liga_fnc_handy;
		liga_handyAction = false;
};
if(EQ(_mode,1)) exitWith {
	
	EQexit((ctrlPosition _bank),POSBANK);	
	ANINULL;
	
	_bank ctrlSetStructuredText parseText format[MSGBANK,[life_atmcash] call life_fnc_numberText];
	_cash ctrlSetStructuredText parseText format[MSGCASH,[life_cash	  ] call life_fnc_numberText];
	_flag = SEL(GETPROFHG,3);
	
	_wetterakt = overcast;
	if(_wetterakt <  0.2)then{SETPIC("SONNIG");	};
	if(_wetterakt <  0.6)then{SETPIC("BEWOLK");	}else{SETPIC("WOLK");};
	if(rain 	  > 0.05)then{SETPIC("REGEN");	};	
	
	_bank	ctrlSetPosition POSBANK;
	_cash	ctrlSetPosition POSCASH;
	_wetter	ctrlSetPosition POSWETTER;
	[3,_bank	,TITCOL ]spawn liga_fnc_Anim;	
	[3,_cash	,TITCOL ]spawn liga_fnc_Anim;
	
	if!(_flag)exitWith{RUNANI;};
	
	[1,_wetter	,TITCOL1]spawn liga_fnc_Anim;	
	RUNANI;
	
};


if(EQ(_mode,0)) exitWith {	
			
	[2,_cash	,TITCOL ]spawn liga_fnc_Anim;	
	[0,_wetter	,TITCOL1]spawn liga_fnc_Anim;	
	[1,1]spawn liga_fnc_HG;
	{
		_x 	ctrlSetPosition POS1;		
		SETANIM(_x,0.5);
	}forEach DIAPARR;
	[2,_bank	,TITCOL ]call liga_fnc_Anim;
};

if(EQ(_mode,3)) exitWith {	
			
	[2,_cash	,TITCOL ]spawn liga_fnc_Anim;	
	[0,_wetter	,TITCOL1]spawn liga_fnc_Anim;	
	//[2]spawn liga_fnc_HG;
	{
		_x 	ctrlSetPosition POS1;		
		SETANIM(_x,0.4);
	}forEach DIAPARR;
	[2,_bank	,TITCOL ]call liga_fnc_Anim;
};
