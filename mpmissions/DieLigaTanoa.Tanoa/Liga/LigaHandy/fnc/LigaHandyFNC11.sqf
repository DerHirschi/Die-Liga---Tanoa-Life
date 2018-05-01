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

PAR(_mode,0,0,0);
PAR(_data,1,"","");

if(EQ(_mode,2)) exitWith {//Tranzparenz
	DISABLESER;
	_display 	= FDSIP(88888);
	_HGbild		= DIPCTRL(_display,88886);
	_flag = GETPROFHG;
	_flag set[2,((sliderPosition 88703) / 10)];
	SETPROFHG(_flag);
	
	_HGbild ctrlSetTextColor [1,1,1,((sliderPosition 88703) / 10)];
	ctrlShow [88889, false];
	[1]spawn liga_fnc_HG;
};

if(EQ(_mode,0)) exitWith { //On Off Sett
	private["_onOff","_flag"];
	
	_onOff = SEL(SETTINGS(SEL(SETTONOFFENT,0)),1);//WetterWidget
	if(EQ(_data,_onOff)) exitWith {
		_flag = GETPROFHG;
		if(SEL(_flag,3)) then {			
			_flag set[3,false];
		}else{
			_flag set[3,true];
		};
		SETPROFHG(_flag);
		[2]spawn liga_fnc_hgsettings;
	};
	
};

if(EQ(_mode,1)) exitWith { //HG Bild Sett
	
	private["_flag"];
	_PicSel = HGARR find _data;
	_flag = GETPROFHG;
	_flag set[1,_PicSel];	
	SETPROFHG(_flag);	
	[2]call liga_fnc_hgsettings;	
	[1]spawn liga_fnc_HG;

};

