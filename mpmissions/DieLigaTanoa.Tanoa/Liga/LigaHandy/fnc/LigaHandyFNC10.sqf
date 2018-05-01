#include <LigaHandyMac.h>
#define VARARR [_settBack,_sideMenT,_balkenMen,_balkenMenT,_check,_sideMen]
#define TITELCOL [0.6,0.0,0.9,0.4]
#define TITELCOL1 [0.9,0.7,0.0,0.4]
#define TITELCOL2 [1,1,1,0.8]
#define SETPICCOL(DISP) DISP lbSetPictureColor [0,[1,1,1,_i] ]

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
private["_pic"];
PAR(_mode,0,0,0);
_display 	= FDSIP(88888);

_settBack	= DIPCTRL(_display,88700);
_sideMen	= DIPCTRL(_display,88701);
_sideMenT	= DIPCTRL(_display,88702);
_balkenMen	= DIPCTRL(_display,88703);
_balkenMenT	= DIPCTRL(_display,88704);
_check		= DIPCTRL(_display,88705);
	
if(EQ(_mode,2)) exitWith {//Sett Contrl .. Laden

	// Transparenz
	_hgcon = GETPROFHG;
	_trans = SEL(_hgcon,2);
	_balkenMen sliderSetPosition (_trans * 10);
	_aktHG = SEL(_hgcon,1);
	_wettWig = SEL(_hgcon,3);
	
	//HG Bild	
	lbClear _sideMen;
	{				
		_sideMen lbAdd format		[SEL(HG(_x),1)];
		_sideMen lbSetPicture  		[_forEachIndex,SEL(HG(_x),0)];
		if(EQ(_forEachIndex,_aktHG)) then {
			_sideMen lbSetPictureColor [_forEachIndex,[1,1,1,1]];
		};
		_sideMen lbSetData  		[_forEachIndex,(format ["%1",_x])];
	}forEach HGARR;
	//ON/OFF Settings
	lbClear _check;
	{
		if(EQ(_wettWig,true)&& EQ(_forEachIndex,0)) then {_pic = PIC("ICON6");	}else{_pic = PIC("ICON7");}; //WETTER
		
		SETTINGS(_x);
		_check lbAdd format		[SEL(SETTINGS(_x),0)];
		_check lbSetPictureColor[_forEachIndex,[1,1,1,1]];
		_check lbSetPicture  	[_forEachIndex,_pic];
		_check lbSetData  		[_forEachIndex,(format ["%1",SEL(SETTINGS(_x),1)])];
	}forEach SETTONOFFENT;
};
	
if(EQ(_mode,1)) exitWith {	
	
	WAITNOAPP;
	APP(-4);
	{_x ctrlSetPosition SETMENPOS0;SETANIM(_x,0);}forEach VARARR;
		
	lbClear _sideMen;	
	lbClear _check;
	
	_settBack 	ctrlSetPosition SETMENPOS;
	_sideMen 	ctrlSetPosition SETMENPOS1;
	_sideMenT 	ctrlSetPosition SETMENPOS2;
	_balkenMen 	ctrlSetPosition SETMENPOS3;
	_balkenMenT ctrlSetPosition SETMENPOS4;
	_check		ctrlSetPosition SETMENPOS5;
	_balkenMenT	ctrlSetText  "Tranzparenz";
	_sideMenT	ctrlSetText  "Hintergrundbild";

	[1,_sideMenT,TITELCOL]spawn liga_fnc_Anim; // Einblenden
	[1,_check,TITELCOL2]spawn liga_fnc_Anim; // Einblenden
	[1,_balkenMenT,TITELCOL1]call liga_fnc_Anim; // Einblenden
		
	{SETANIM(_x,0.5);CTRLAN(_x);}forEach VARARR;	
	[2]spawn liga_fnc_hgsettings;

};


if(EQ(_mode,0)) exitWith {
	
	[0,_sideMenT,TITELCOL]spawn liga_fnc_Anim; // Einblenden
	[0,_balkenMenT,TITELCOL1]call liga_fnc_Anim; // Einblenden
	{_x ctrlSetPosition SETMENPOS0;SETANIM(_x,0.5);}forEach VARARR;
	uiSleep 0.6;
	{CTRLAUS(_x);}forEach VARARR;
	lbClear _sideMen;	
	lbClear _check;
	_balkenMenT	ctrlSetText  "";
	_sideMenT	ctrlSetText  "";
	NOAPP;
};