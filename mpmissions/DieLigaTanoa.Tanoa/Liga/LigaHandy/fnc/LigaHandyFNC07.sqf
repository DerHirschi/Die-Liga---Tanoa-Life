#include <LigaHandyMac.h>
#define BATARR [1,1,1,0.85]
#define LOOPSLEEP uiSleep 0.01
#define CTRLSHOWAUS(ARRAY) {ctrlShow [_x, false] }forEach ARRAY
#define ALLDISPARR [88889,88890,88881,88891,88900,88892,88885,88886,88880,88879,88907,88908,88913,88914,88915,88918,88919,88920,88921,88922,88923,88924,88925,88700,88701,88702,88703,88704,88705,88901]

#define GETCTRLVAR 	_display 	= FDSIP(88888);				\
					_bild	 	= DIPCTRL(_display,88887);	\
					_bg1	 	= DIPCTRL(_display,88889);	\
					_bg2	 	= DIPCTRL(_display,88890);	\
					_batt	 	= DIPCTRL(_display,88881);	\
					_uhr	 	= DIPCTRL(_display,88891);	\
					_bgscr	 	= DIPCTRL(_display,88900);	\
					_titel	 	= DIPCTRL(_display,88892);	\
					_mapklein	= DIPCTRL(_display,88885);	\
					_HGbild		= DIPCTRL(_display,88886);	\
					_HGbild1	= DIPCTRL(_display,88880);	\
					_HGbild2	= DIPCTRL(_display,88879);	\
					_MenuUnten	= DIPCTRL(_display,88907);	\
					_MenuUntenF	= DIPCTRL(_display,88908);	\
					_TextIn		= DIPCTRL(_display,88913);	\
					_ButULpic	= DIPCTRL(_display,88914);	\
					_ButUL		= DIPCTRL(_display,88915);	\
					_MessiBack	= DIPCTRL(_display,88918);	\
					_MessiBack1	= DIPCTRL(_display,88919);	\
					_MessiBack2	= DIPCTRL(_display,88920);	\
					_mainTextBak= DIPCTRL(_display,88921);	\
					_MessiText	= DIPCTRL(_display,88922);	\
					_bank		= DIPCTRL(_display,88923);	\
					_cash		= DIPCTRL(_display,88924);	\
					_wetter		= DIPCTRL(_display,88925);	\
					_settBack	= DIPCTRL(_display,88700);	\
					_sideMen	= DIPCTRL(_display,88701);	\
					_sideMenT	= DIPCTRL(_display,88702);	\
					_balkenMen	= DIPCTRL(_display,88703);	\
					_balkenMenT	= DIPCTRL(_display,88704);	\
					_Telback	= DIPCTRL(_display,88901);	\
					_check		= DIPCTRL(_display,88705)
			
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
_mode = SEL(_this,0);

if(EQ(_mode,2))  then {	closeDialog 0;createDialog "liga_handy"; CTRLSHOWAUS(ALLDISPARR);  };	
			
GETCTRLVAR;
if(EQ(_mode,2))  exitWith { // groß

	handy_ani	= 	 	 false;	
	//GRAUS;		

	_bg2 ctrlSetTextColor [0,0.1,0.4,0.8];				
	_bild ctrlSetPosition FRAMEPOS0;
	_batt ctrlSetPosition BATPOS1;
	_mainTextBak ctrlSetPosition BACKPOS1;
	_MessiBack2 ctrlSetPosition MESSIBACKPOS1;
	SETANIM(_bild,0);							
	SETANIM(_batt,0);							
	SETANIM(_mainTextBak,0);							
	SETANIM(_MessiBack2,0);							
	2 cutFadeOut 0.3;
	uiSleep 0.2;
	showGPS false;
	uiSleep 0.1;	
	2 cutText ["", "PLAIN"]; 	
	showGPS true;	
	
	_bild ctrlSetPosition FRAMEPOS1;
	SETANIM(_bild,0.2);	
	
	WAITANIM(_bild);	

	[1]call liga_fnc_HG;
	CTRLAN(_bg2);	
	
	handy_ani = true;	
	_bg2 ctrlSetPosition BGPOS1;
	SETANIM(_bg2,0.3);
	[6]spawn liga_fnc_handy;
	WAITANIM(_bg2);
	CTRLAN(_bgscr);	
	[1,_batt,BATARR]spawn liga_fnc_Anim;
	[1]spawn liga_fnc_app_list;
	[1]spawn liga_fnc_HomeScr;
	
	liga_visCheck =	[]spawn{
		while {true} do {
			if!(ctrlVisible 88887)exitWith {[1]spawn liga_fnc_handy;};
			uiSleep 1;
			
		};		
	};

};		

if(EQ(_mode,1))  exitWith { // kleen
	
	handy_ani	= 	 	 false;
	
	if!(EQ(liga_visCheck,0))then {terminate liga_visCheck;};
	
	CTRLAUS(_bgscr);
	CTRLAUS(_TextIn);
	CTRLAUS(_MessiBack);
	CTRLAUS(_mainTextBak);
	CTRLAUS(_MessiText);
	CTRLAUS(_settBack);
	CTRLAUS(_sideMen);
	CTRLAUS(_sideMenT);
	CTRLAUS(_balkenMen);
	CTRLAUS(_balkenMenT);
	CTRLAUS(_check);
	CTRLAUS(_MessiBack1);
	CTRLAUS(_MessiBack2);
	CTRLAUS(_Telback);
	
	CTRLAUS(_titel);
	CTRLAUS(_mapklein);	
	CTRLAUS(_MenuUnten);
	CTRLAUS(_MenuUntenF);
	CTRLAUS(_ButULpic);
	CTRLAUS(_ButUL);	
	[0]spawn liga_fnc_app_list;

	[0,_batt,BATARR]spawn liga_fnc_Anim;
	
	[2]spawn liga_fnc_HG;	
	[3]spawn liga_fnc_handy;
	[3]spawn liga_fnc_HomeScr;
	[5]call liga_fnc_handy;
	
	CTRLAUS(_HGbild);
	CTRLAUS(_HGbild1);
	CTRLAUS(_HGbild2);
	CTRLAUS(_bg1);
	CTRLAUS(_bg2);
	CTRLAUS(_batt);
	CTRLAUS(_uhr);	
	_bild ctrlSetPosition FRAMEPOS0;
			
	SETANIM(_bild,0.3);	

	WAITANIM(_bild);
	if(liga_handy_kl)then{
		if(visibleGPS) then {
			2 cutRsc["Liga_handy_side_gps_m"	,"PLAIN"];
		}else{
			2 cutRsc["Liga_handy_side_m"	,"PLAIN"];
		};		
		[] call life_fnc_hudUpdate;
		uisleep 0.3;
		showGPS true;
	};
	closeDialog 0;	
	APP(-1);
};	

if(EQ(_mode,3))  exitWith { // Logo fade out
	handy_ani = true;
	uiSleep 0.3;	
	
	for [{_i=0},{_i<=0.8 && (ctrlShown _uhr && ctrlShown _bg2) && handy_ani},{_i=_i+0.03}] do {	// Logo Farbeffekt			
		_bg2 ctrlSetTextColor [_i,((0.1 - _i) max 0),((0.4 - _i) max 0),(0.8 - _i )];
		SETANIM(_bg2,0);
		uiSleep 0.03;	
			
	};		
	CTRLAUS(_bg2);	
};	

if(EQ(_mode,5)) exitWith { // TEXT oben ( UHR ) Fade out
	handy_ani = true;
	//uiSleep 0.3;

	for [{_i=0},{_i<=0.8 && (ctrlShown _uhr && ctrlShown _bg2) && handy_ani},{_i=_i+0.09}] do {	// Logo Farbeffekt			
		_uhr ctrlSetTextColor [_i,((0.1 - _i) max 0),((0.6 - _i) max 0),(0.8 - _i )];
		SETANIM(_uhr,0);
		uiSleep 0.03;				
	};		
	CTRLAUS(_uhr);
};	

if(EQ(_mode,6))  exitWith { // TEXT oben ( UHR ) Überblende
	
	private["_v"];

	if((ctrlShown _uhr && ctrlShown _bg2) || !handy_ani)exitWith{};
	handy_ani = true;
	uiSleep 0.7;
	handy_ani = false;
	CTRLAN(_uhr);
	CTRLAN(_bg2);	
	_t = false;	
	while {ctrlShown _uhr && ctrlShown _bg2 && !handy_ani} do {			
		_uhr ctrlSetText format["%1",([]call liga_fnc_daytime)];

			///////////////// ! UHR SICHTBAR
			
		[_uhr]spawn {
			DISABLESER;
			_uhr = SEL(_this,0);			
									
			for [{_i=0.8},{_i>=0 && (ctrlShown _uhr) && !handy_ani},{_i=_i-0.003}] do {		// Uhr Out		
				_uhr ctrlSetTextColor [_i,((0.7 - _i) max 0),((0.4 - _i) max 0),(0.8 - _i )];				
				SETANIM(_uhr,0);
				LOOPSLEEP;				
			};			
		};	
		
		if(_t) then{ _v = 0.7;}else{_v = 0.1;};	
		
		for [{_i=0},{_i<=0.8 && (ctrlShown _uhr && ctrlShown _bg2) && !handy_ani},{_i=_i+0.003}] do {	// Logo In			
			_bg2 ctrlSetTextColor [_i,((_v - _i) max 0),((0.4 - _i) max 0),(0.8 - _i )];			
			SETANIM(_bg2,0);			
			LOOPSLEEP;			
		};	
		uiSleep 3;		
	[_bg2]spawn {		
			DISABLESER;
			_bg2 = SEL(_this,0);
			
			for [{_i=0.8},{_i>=0 && ctrlShown _bg2 && !handy_ani},{_i=_i-0.003}] do {	// Logo out			
				_bg2 ctrlSetTextColor [_i,((0.7 - _i) max 0),((0.4 - _i) max 0),(0.8 - _i )];
				SETANIM(_bg2,0);
				LOOPSLEEP;						
			};			
		};				
		for [{_i=0},{_i<=0.8 && (ctrlShown _uhr && ctrlShown _bg2) && !handy_ani},{_i=_i+0.003}] do {	// Uhr In			
			_uhr ctrlSetTextColor [_i,((0.7 - _i) max 0),((0.6 - _i) max 0),(0.8 - _i )];
			SETANIM(_uhr,0);
			LOOPSLEEP;					
		};			
		_t = true;
	};		
};	
