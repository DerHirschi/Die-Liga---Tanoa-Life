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
DISABLESER;	
private["_fav"];
	_targ = lbData [88901,(lbCurSel 88901)];
	_targ = call compile format["%1",_targ];
	PAR(_mode,0,0,0);
	if(isNil "_targ")exitWith{};	 
	if(isNull _targ	)exitWith{};
	//RPT("Target",_targ);	
	_fav 	= profileNamespace getVariable ["LigaTelFav",[]]; 
	_targid = getPlayerUID _targ;
	if!(_targid in _fav) then {		
		if(EQ(_mode,0))then{
			_fav set [(count _fav),_targid];
			profileNamespace setVariable ["LigaTelFav",_fav]; 
		};
		false;
	}else{		
		if(EQ(_mode,0))then{			
			_fav deleteAt (_fav find _targid);
			profileNamespace setVariable ["LigaTelFav",_fav]; 
		};		
		true;
	};

