#include <LigaHandyMac.h>
#define TITELCOL [0.1,0.2,0.6,0.4]
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
private["_list","_is","_targ","_targin","_t","_flag","_uid"];
PAR(_mode,0,0,0);
_display 			= FDSIP(88888);
_ligaTitel		 	= DIPCTRL(_display,88892) ;
_list 				= DIPCTRL(_display,88918) ;
_lists 				= DIPCTRL(_display,88919) ;
_back 				= DIPCTRL(_display,88920) ;

if(EQ(_mode,2)) exitWith {
	_targin = [_this,1,[],[[]]] call BIS_fnc_param;
	_is = (lnbSize _list) select 0;
	
	if(isNil "_is")then{_is = 0;};	
	_t = false;	
	_targ = [];	
	if!(EQ(_is,0)) then {
	for [{_i=0},{_i<_is},{_i=_i+1}] do {
		_flag = _list lnbData [_i,0];
		_targ set [_i,_flag];


	};
	}else{_targ = ["0"];};
	if!(str(SEL(_targin,3)) in _targ)then{
				_uid = SEL(_targin,0);
				_list lnbAddRow   				[format["%1",SEL(_targin,3)]];
				
				_list lnbSetPicture   	  		[[_is,0] ,PIC("ICON5")	];				
				
				
				_list lnbSetData 				[[_is,0],str(SEL(_targin,3))];
				_list lnbSetData 				[[_is,1],_uid];
		
				_list lnbAddRow   				[];					
				_list lnbSetData 				[[_is + 1,0],str(SEL(_targin,3))];
				_list lnbSetData 				[[_is + 1,1],_uid];
				_lists lnbAddRow   				[];
				_lists lnbSetData 				[[_is,0],str(SEL(_targin,3))];
				_lists lnbSetData 				[[_is,1],_uid];
				_lists lnbAddRow   				["",format["%1",SEL(_targin,2)]];					
				_lists lnbSetData 				[[_is + 1,0],str(SEL(_targin,3))];
				_lists lnbSetData 				[[_is + 1,1],_uid];
				
	};
	
};	

if(EQ(_mode,1)) then {
	WAITNOAPP;
	APP(1);
	lnbClear _list;
	lnbClear _lists;

	_ligaTitel		ctrlSetText  "             Mailbox";
	[1,_ligaTitel		,TITELCOL]spawn liga_fnc_Anim;
		

	CTRLAN(_list);
	CTRLAN(_lists);
	CTRLAN(_back);
	_back ctrlSetPosition POSARR;
	SETANIM(_back,0.7);
	
	//[getPlayerUID player, player,0]spawn test_fn_getMSG;
	[[getPlayerUID player, player,0],"TON_fnc_msgRequest",false] call life_fnc_MP;

	
}else{
	[0]spawn liga_fnc_oben_list;
	CTRLAUS(_list);
	CTRLAUS(_lists);
	CTRLAUS(_back);
	lnbClear _list;
	lnbClear _lists;
	[0,_ligaTitel		,TITELCOL]call liga_fnc_Anim; 
	_ligaTitel		ctrlSetText  "";


	NOAPP;	

};