#include <LigaHandyMac.h>
#define TITCOLOR [0.1,0.6,0.2,0.4]
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
private ["_pic","_fav"];
PAR(_mode,0,0,0);

_display 			= FDSIP(88888);
_ligaPlayerList 	= DIPCTRL(_display,88901) ;
_ligaTitel		 	= DIPCTRL(_display,88892) ;

if(EQ(_mode,0)) exitWith {

	[0]spawn liga_fnc_oben_list;
	
	[0,_ligaTitel		,TITCOLOR]call liga_fnc_Anim; 
	CTRLAUS(_ligaPlayerList);
	_ligaTitel		ctrlSetText  "";
	NOAPP;
		
};

if(EQ(_mode,2))  exitWith {
	private["_grpMembers","_buchmode"];
	_buchmode	= [_this,1,0,[0]] call BIS_fnc_param;
	lbClear _ligaPlayerList;
	if(EQ(_buchmode,0)) then {	_ligaTitel		ctrlSetText  "             Telefonbuch"; };
	if(EQ(_buchmode,1)) then {	_ligaTitel		ctrlSetText  "             Favoriten"; 	 };
	if(EQ(_buchmode,2)) then {	_ligaTitel		ctrlSetText  "             Dienste"; 	 };
	if(EQ(_buchmode,3)) then {	_ligaTitel		ctrlSetText  "             Gang"; 		 };
	_grpMembers = grpPlayer getVariable ["gang_members",[]];	
	_fav		= GETPROFVAR("LigaTelFav",[]);
	INULL;
	{		
			if(alive _x  && _x != player ) then
			{
				switch(side _x) do
					{
						case west: 			{_pic = PIC("COPICON");};
						case civilian: 		{
							if(getPlayerUID _x in _fav) exitWith {
								_pic = PIC("FAVICON");
							};
							if(getPlayerUID _x in _grpMembers) then {
								_pic = PIC("GANGICON");
							}else{
								_pic = PIC("CIVICON");
							};								
						};						
						case independent:	{_pic = PIC("LRKICON");};						
						case east: 			{_pic = PIC("ALAICON");};
					};
				if(EQ(_buchmode,0)) exitWith {	//Norm
					_ligaPlayerList lbAdd format	["%1",_x getVariable["realname", name _x]];
					_ligaPlayerList lbSetData 		[_i,format["%1",_x]			 ];
					_ligaPlayerList lbSetPicture  	[_i,_pic						 ];
					ISUB;
				};
				if(EQ(_buchmode,1)) exitWith {	//Fav
					if(getPlayerUID _x in _fav)then {
						_ligaPlayerList lbAdd format	["%1",_x getVariable["realname", name _x]];
						_ligaPlayerList lbSetData 		[_i,format["%1",_x]			 ];
						_ligaPlayerList lbSetPicture  	[_i,_pic						 ];
						ISUB;
					};
				};	
				if(EQ(_buchmode,2)) exitWith {	//Dienste
					if!(EQ(side _x,civilian))then {
						_ligaPlayerList lbAdd format	["%1",_x getVariable["realname", name _x]];
						_ligaPlayerList lbSetData 		[_i,format["%1",_x]			 ];
						_ligaPlayerList lbSetPicture  	[_i,_pic						 ];
						ISUB;
					};
				};	
				if(EQ(_buchmode,3)) exitWith {	//Gang
					if(getPlayerUID _x in _grpMembers && EQ(side _x,civilian)) then {
						_ligaPlayerList lbAdd format	["%1",_x getVariable["realname", name _x]];
						_ligaPlayerList lbSetData 		[_i,format["%1",_x]			 ];
						_ligaPlayerList lbSetPicture  	[_i,_pic						 ];
						ISUB;
					};
				};					
			};
	} forEach playableUnits;
	//} forEach allUnits;		
};	
	
	
if(EQ(_mode,1))  exitWith {
	WAITNOAPP;	
	APP(0);
	
	lbClear _ligaPlayerList;
	CTRLAN(_ligaPlayerList);

	_ligaTitel		ctrlSetText  "             Telefonbuch";
	[1,_ligaTitel		,TITCOLOR]spawn liga_fnc_Anim; 

	[1]spawn liga_fnc_oben_list;
	[2]call liga_fnc_telBuch;

};


