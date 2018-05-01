#include <LigaHandyMac.h>
#define TITCOL1 [0.6,0.6 ,0.6,0.3]
#define TITCOL2 [1,1,1,1]
#define TITCOLMAINTEX [0.0,0.28,0.0,0.2]



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
private["_targ1","_targ"];
DISABLESER;
PAR(_mode,0,0,0);

_display 			= FDSIP(88888);
_mainText		 	= DIPCTRL(_display,88913);
_mainTextBak	 	= DIPCTRL(_display,88921);
_mainTextBakShow 	= DIPCTRL(_display,88920);
_mainTextShow	 	= DIPCTRL(_display,88922);
_ligaTitel		 	= DIPCTRL(_display,88892);
_ButULpic			= DIPCTRL(_display,88914);
_ButUL				= DIPCTRL(_display,88915);

if(EQ(_mode,0)) exitWith {
	CTRSETPOS1(_mainText);	
	SETANIM(_mainText,0.3);
	CTRSETPOS1(_mainTextShow);
	SETANIM(_mainTextShow,0.3);
	
	[0,_ligaTitel		,TITCOL1			]spawn liga_fnc_Anim; // Einblenden
	[0,_ButULpic		,TITCOL1			]spawn liga_fnc_Anim; // Einblenden
	[0,_mainTextShow	,TITCOLMAINTEX		]spawn liga_fnc_Anim; // Einblenden	
	[0,_mainText		,TITCOL1			]call liga_fnc_Anim; // Einblenden	
	_mainText ctrlSetText "";
	_ButUL buttonSetAction "";
	CTRLAUS(_ButUL);
	CTRLAUS(_mainTextBak);
	CTRLAUS(_mainTextBakShow);
	
	NOAPP;

	[1]spawn liga_fnc_app_list;		
};

if(EQ(_mode,2)) exitWith {
	
	CTRSETPOS1(_mainText);
	SETANIM(_mainText,0.3);		
	CTRSETPOS1(_mainTextShow);
	SETANIM(_mainTextShow,0.3);
	[0,_mainText		,TITCOL1			]spawn liga_fnc_Anim; // Einblenden	
	[0,_mainTextShow	,TITCOLMAINTEX		]spawn liga_fnc_Anim;// Einblenden	

	_ButUL buttonSetAction "";
	CTRLAUS(_ButUL);
	CTRLAUS(_mainTextBakShow);
							
	_ButULpic ctrlSetPosition SMSPICPOS2;

	SETANIM(_ButULpic,0.4);	
	
	WAITANIM(_ButULpic);
	
	[2]spawn liga_fnc_HomeScr;
	uiSleep 0.1;
	NOAPP;
	[1]spawn liga_fnc_app_list;
	uiSleep 0.4;
	CTRLAUS(_mainTextBak);
	[0,_ButULpic		,TITCOL1			]call liga_fnc_Anim; // Einblenden
	
	_mainText ctrlSetText "";
	

	
	[0]spawn liga_fnc_oben_list;
	
	
};

if(EQ(_mode,1)) exitWith {//Std. Nachrticht

	_targ = lbData [88901,(lbCurSel 88901)];
	_targ = call compile format["%1",_targ];
	WAITNOAPP;
	if(isNil "_targ")exitWith{[1]spawn liga_fnc_telBuch};	 
	if(isNull _targ	)exitWith{[1]spawn liga_fnc_telBuch};
	WAITNOAPP;
	CTRLAUS(_mainTextBakShow);	
	APP(-2);	
	
	_ButULpic ctrlSetPosition SMSBUTPOS2;
	SETANIM(_ButULpic,0);
	
	
	[1,_ButULpic		,TITCOL1]spawn liga_fnc_Anim; 


	_ButULpic ctrlSetPosition SMSBUTPOS1;

	SETANIM(_ButULpic,0.3);

	_ligaTitel		ctrlSetText  format["Nachricht an:  %1",name _targ]; // !!!!ÄNDERN
	life_smartphoneTarget = ["","",_targ];
	[0]spawn liga_fnc_app_list;	
	
	_mainText ctrlSetText "";

	[1,_ligaTitel		,TITCOL1	]spawn liga_fnc_Anim; // Einblenden	
	[1,_mainText		,TITCOL1	]spawn liga_fnc_Anim; // Einblenden		
	[1,_mainTextBak		,TITCOL2	]spawn liga_fnc_Anim; // Einblenden	
	

	_mainTextBak ctrlSetPosition SMSPOS1;
	SETANIM(_mainTextBak,0.5);
	CTRSETPOS2(_mainText);	
	SETANIM(_mainText,0.5);	
	
	CTRLAN(_ButUL);
	_ButUL buttonSetAction "[1,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";
};	

if(EQ(_mode,3)) exitWith { // CHAT //////////////
	
	WAITNOAPP;
	private["_on"];
	_targ = life_smartphoneTarget;
	if(isNil "_targ")exitWith{};
	CTRLAUS(_mainTextBakShow);		
	APP(-3);
	//diag_log format[">><>_targ<<:  %1",_targ];
	_targ = _targ call liga_fn_getNamObjPlayer;
		
	if(EQ(count _targ,3))then{_on = true; /*hint "Off";*/}else{_on = false};	 // Player Online = Obj || Offline = String
	//diag_log format[">><>_targ<<:  %1",_targ];
	
	life_smartphoneTarget = _targ;
		
	_ButULpic ctrlSetPosition SMSBUTPOS2;
	SETANIM(_ButULpic,0);
	[1,_ButULpic		,TITCOL1]spawn liga_fnc_Anim; // Einblenden
	_ButULpic ctrlSetPosition SMSBUTPOS1;

	SETANIM(_ButULpic,0.5);
	[0]spawn liga_fnc_app_list;	
	
	_mainText ctrlSetText "";	
	[1,_mainText		,TITCOL1		]spawn liga_fnc_Anim; // Einblenden		
	[1,_mainTextBak		,TITCOL2		]spawn liga_fnc_Anim; // Einblenden		
	[1,_mainTextShow	,TITCOLMAINTEX	]spawn liga_fnc_Anim;// Einblenden	
	[1,_mainTextBakShow	,TITCOL2		]spawn liga_fnc_Anim;// Einblenden	

	CTRLAN(_ButUL);

	_mainTextBak 	 ctrlSetPosition CHATBUTPOS1;
	SETANIM(_mainTextBak,0.5);

	CTRSETPOS2(_mainTextShow);	
	SETANIM(_mainTextShow,0.5);	

	_mainTextBakShow ctrlSetPosition CHATBUTPOS2;
	SETANIM(_mainTextBakShow,0.5);
	
	CTRSETPOS2(_mainText);	
	SETANIM(_mainText,0.5);
	
	if(_on)then{

		_ligaTitel		ctrlSetText  format["Chat :  %1",SEL(_targ,0)]; // !!!!ÄNDERN
		[1,_ligaTitel		,[0.5,0.9,0.6,0.3]]spawn liga_fnc_Anim; // Einblenden	
		_ButUL buttonSetAction "[1,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";		
	}else{
		_ligaTitel		ctrlSetText  format["Chat :  %1",SEL(_targ,0)]; // !!!!ÄNDERN
		[1,_ligaTitel		,[0.9,0.5,0.6,0.3]]spawn liga_fnc_Anim; // Einblenden	
		_ButUL buttonSetAction "[9,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";

	};
	[1,(SEL(_targ,0))]spawn liga_fn_getChatStr;
};	

if(EQ(_mode,4)) exitWith {
	WAITNOAPP;
	CTRLAUS(_mainTextBakShow);
	APP(2);	
			
	[0]call liga_fnc_app_list;
	
	[1]spawn liga_fnc_app_list;	
	lbClear 88900; 
	lbSetCurSel [88900, -1];
	waitUntil {!(EQ((lbCurSel 88900),-1)) || !(EQ(handy_actApp,2))};
	if!(EQ(handy_actApp,2))exitWith{};
	
	_emsmode = lbData [88900,(lbCurSel 88900)];
	STR2CONST(_emsmode);
	//[0]spawn liga_fnc_app_list;
	if(EQ(_emsmode,-1)) then { _ligaTitel		ctrlSetText  "Notruf an die Polizei";	_ButUL buttonSetAction "[2,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";};
	if(EQ(_emsmode,-2)) then { _ligaTitel		ctrlSetText  "Notruf an das LRK";		_ButUL buttonSetAction "[4,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";};
	if(EQ(_emsmode,-3)) then { _ligaTitel		ctrlSetText  "Notruf an den ALAC";		_ButUL buttonSetAction "[8,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";};
	if(EQ(_emsmode,-4)) then { _ligaTitel		ctrlSetText  "Notruf an die Admins";	_ButUL buttonSetAction "[3,-1,(ctrlText 88913)] call life_fnc_newMsg; [2]spawn liga_fnc_newMsg; ";};
	// TO DO ///// TO DO ///// TO DO ///// TO DO ///// TO DO ///// TO DO ///// TO DO ///
	if(EQ(_emsmode,-5)) exitWith { [[player,true],"TON_fnc_notwarte",false,false] call life_fnc_MP; hint "Bitte warten... Sie werden gleich verbunden !!!"; []spawn liga_fnc_BackBut;}; // TO DO ///
	// TO DO ///// TO DO ///// TO DO ///// TO DO ///// TO DO ///// TO DO ///// TO DO ///
	
	[0]spawn liga_fnc_app_list;
	
	_mainText ctrlSetText "";
	
	_ButULpic ctrlSetPosition SMSBUTPOS2;
	SETANIM(_ButULpic,0);
	[1,_ButULpic		,TITCOL1]spawn liga_fnc_Anim; // Einblenden	_ButULpic ctrlSetPosition SMSBUTPOS1;
	_ButULpic ctrlSetPosition SMSBUTPOS1;
	SETANIM(_ButULpic,0.3);

	[1,_ligaTitel		,TITCOL1	]spawn liga_fnc_Anim; // Einblenden	
	[1,_mainText		,TITCOL1	]spawn liga_fnc_Anim; // Einblenden		
	[1,_mainTextBak		,TITCOL2	]spawn liga_fnc_Anim; // Einblenden	
	
	_mainTextBak ctrlSetPosition SMSPOS1;
	SETANIM(_mainTextBak,0.5);

	CTRLAN(_ButUL);	
	CTRSETPOS2(_mainText);	
	SETANIM(_mainText,0.5);	
};