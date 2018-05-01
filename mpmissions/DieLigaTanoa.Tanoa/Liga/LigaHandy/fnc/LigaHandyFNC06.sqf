#include <LigaHandyMac.h>
#define TITELCOL [0.6,0.2,0.6,0.4]

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
private["_list","_is","_targ","_targin","_t","_flag"];
PAR(_mode,0,0,0);
_display 			= FDSIP(88888);
_ligaTitel		 	= DIPCTRL(_display,88892) ;
_list 				= DIPCTRL(_display,88918) ;
_lists 				= DIPCTRL(_display,88919) ;
_back 				= DIPCTRL(_display,88920) ;

if(EQ(_mode,1)) exitWith {	
	WAITNOAPP;
	APP(7);
	lnbClear _list;
	lnbClear _lists;
	_ligaTitel		ctrlSetText  "             Einstellungen";
	[1,_ligaTitel		,TITELCOL]spawn liga_fnc_Anim; // Einblenden

	CTRLAN(_list);
	CTRLAN(_lists);
	CTRLAN(_back);
	_back ctrlSetPosition POSARR;
	SETANIM(_back,0.7);
	{
		_is = _forEachIndex;

				_list lnbAddRow   				[format["%1",SEL(_x,0)   ]];
				_list lnbSetPicture   	  		[[_is,0] ,SEL(_x,2)	];				
				_list lnbSetData 				[[_is,0],str(_is)];
				_list lnbSetData 				[[_is,1],str(_is)];
	
				_list lnbAddRow   				[];					
				_list lnbSetData 				[[_is + 1,0],str(_is)];
				_list lnbSetData 				[[_is + 1,1],str(_is)];
				_lists lnbAddRow   				[];
				_lists lnbSetData 				[[_is,0],str(_is)];
				_lists lnbSetData 				[[_is,1],str(_is)];
				_lists lnbAddRow   				["",format["%1",SEL(_x,1)  ]];					
				_lists lnbSetData 				[[_is + 1,0],str(_is)];
				_lists lnbSetData 				[[_is + 1,1],str(_is)];
				
	}forEach SETTINGS("SettingHMArr");
	
};


if(EQ(_mode,0)) exitWith {

	[0]spawn liga_fnc_oben_list;
	CTRLAUS(_list);
	CTRLAUS(_lists);
	CTRLAUS(_back);
	lnbClear _list;
	lnbClear _lists;
	[0,_ligaTitel		,TITELCOL]call liga_fnc_Anim; // Einblenden
	_ligaTitel		ctrlSetText  "";

	NOAPP;	
};

