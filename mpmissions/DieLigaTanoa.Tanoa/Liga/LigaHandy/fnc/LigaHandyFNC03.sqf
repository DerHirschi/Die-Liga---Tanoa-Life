#include <LigaHandyMac.h>
#define PLATZ "<br/><t size='1.25' color='#FF9A00' >________________________</t><br/>"
#define BILD "<img image='textures\Handy\Icons\Fav.mittelgross.1.0.paa'/>"
#define MSGSTR "%3 %5<t size='1.25' color='#00FFE6'  >%1 schreibt:</t><br/><br/><t size='1.05' color='#FFFFFF'>%2</t>%4"
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

private["_inAr","_msg","_nam"];

PAR(_mode,0,-1,0);

if(EQ(_mode,0))exitWith{

	
	PAR(_inAr,1,[],[]);
	//diag_log format[">>>>>%1",_inAr];
	ARRNULLex(_inAr);
	_msg = SEL(_inAr,2);
	_nam = SEL(_inAr,3);	                      
	_platz = PLATZ;
	_bild  = BILD;
	liga_msg_strig = format[MSGSTR,_nam,_msg,liga_msg_strig,_platz,_bild];
};

if(EQ(_mode,1))exitWith{ // DB Anfrage	
	PAR(_name,1,"","");	
	//[getPlayerUID player, player,1,_name]spawn test_fn_getMSG;
	[[getPlayerUID player, player,1,_name],"TON_fnc_msgRequest",false] call life_fnc_MP;

};

if(EQ(_mode,2))exitWith{ // Text in 
DISABLESER;
	_display 			= FDSIP(88888);
	_Text		 		= DIPCTRL(_display,88922);

	_Text ctrlSetStructuredText parseText format["%1",liga_msg_strig];
	liga_msg_strig = "";
};